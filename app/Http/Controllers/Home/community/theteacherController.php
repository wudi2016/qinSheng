<?php

namespace App\Http\Controllers\Home\community;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class theteacherController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home.community.theteacher');
    }


    //26字母接口
    public function getfirstletter(){
        $firstletter = DB::table('teacher')->select('firstletter')->distinct()->orderBy('firstletter','asc')->get();
        if($firstletter){
            return response()->json(['statuss'=>true,'firstletter' => $firstletter]);
        }else{
            return response()->json(['statuss'=>false]);
        }
    }



    //名师列表数据接口
    public function gettheteacher($type,$pageNumber,$pageSize){

        $skip = ($pageNumber-1) * $pageSize;
        if($type == '0'){
            $count = DB::table('teacher')->select('id')->count();
        }else{
            $count = DB::table('teacher')->select('id')->where('firstletter','=',$type)->count();
        }



        if($type == '0') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u', 'u.id', '=', 't.parentId')
                ->select('t.id', 'u.company', 'u.realname', 't.intro', 't.firstletter', 't.cover', 't.parentId')
                ->where('u.type', 2)
                ->skip($skip)->take($pageSize)
                ->orderBy('t.firstletter', 'asc')
                ->get();
        }else{
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u', 'u.id', '=', 't.parentId')
                ->select('t.id', 'u.company', 'u.realname', 't.intro', 't.firstletter', 't.cover', 't.parentId')
                ->where('u.type', 2)
                ->where('t.firstletter',$type)
                ->skip($skip)->take($pageSize)
                ->orderBy('t.firstletter', 'asc')
                ->get();
            $count = DB::table('teacher')->select('id')->where('firstletter','=',$type)->count();
        }



        if($gettheteacher){

            foreach($gettheteacher as $k => $v){
                $data['data'][] = [
                    'id' => $v->id,
                    'name' => $v->realname,
                    'cover' => $v->cover,
                    'firstletter' => $v->firstletter,
                    'school' => $v->company,
                    'intro' => $v->intro,
                    'userId' => $v->parentId
                ];
            }
            return response()->json(['statuss'=>true,'data'=>$data['data'],'count'=>$count]);
        }else{
            return response()->json(['statuss'=>false]);
        }


    }

}








