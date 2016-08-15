<?php

namespace App\Http\Controllers\Home\community;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class communityController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home.community.community');
    }


    /**
     * 社区首页新闻数据接口
     */
    public function getlist(){
        $getlist = DB::table('news')->select('id','title','description','created_at')->orderBy('sort','asc')->where('status',0)->where('sort','!=',0)->limit(10)->get();
        if($getlist){
            foreach ($getlist as $k => $v) {
                //只保留 年月日
                $created_ats = explode(" ", $v->created_at);
                $data['data'][] = [
                    'id' => $v->id,
                    'title' => $v->title,
                    'description' => $v->description,
                    'time'  => $created_ats[0]
                ];
            }
            $data['statuss'] = true;
        }else {
            $data['statuss'] = false;
        }
        echo json_encode($data);
    }

    /**
     * 最热视频数据接口
     */
    public function gethotvideo(){
        $data = DB::table('hotvideo')->select('id','title','coursePath','cover')->where('sort','>',0)->where('status',0)->orderBy('sort','asc')
            ->limit(6)->get();
        if($data){
            return response()->json(['statuss'=>true,'data'=>$data]);
        }else{
            return response()->json(['statuss'=>false]);
        }
    }


    /**
     * 名师列表数据接口
     */
    public function getteacher(){
        $data = DB::table('teacher as t')
                    ->leftjoin('users as u','u.id','=','t.parentId')
                    ->leftjoin('recteacher as rec','u.id','=','rec.userId')
                    ->select('rec.id','u.realname as name','u.company as school','t.intro','t.cover','t.parentId as userId')
                    ->where('u.type',2)
                    ->where('sort','!=',0)
                    ->orderBy('rec.sort','asc')
                    ->limit(5)
                    ->get();
        if($data){
            return response()->json(['statuss'=>true,'data'=>$data]);
        }else{
            return response()->json(['statuss'=>false]);
        }
    }


    /**
     * 最新学员数据接口
     */
    public function getstudent(){
        $data = DB::table('users')->select('id','username as name','pic')->where('type','!=',2)->where('type','!=',3)->where('checks',0)
            ->orderBy('created_at','desc')
            ->get();
        if($data){
            return response()->json(['statuss'=>true,'data'=>$data]);
        }else{
            return response()->json(['statuss'=>false]);
        }
    }






}
