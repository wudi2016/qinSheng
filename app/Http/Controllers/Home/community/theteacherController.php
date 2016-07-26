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


    //名师列表数据接口
    public function gettheteacher($type){

        if($type == '0'){
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->orderBy('t.firstletter','asc')
//                ->limit(7)
                ->get();
        }elseif($type == '1') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','A')
                
                ->get();
        }elseif($type == '2') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','B')
                
                ->get();
        }elseif($type == '3') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','C')
                
                ->get();
        }elseif($type == '4') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','D')
                
                ->get();
        }elseif($type == '5') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','E')
                
                ->get();
        }elseif($type == '6') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','F')
                
                ->get();
        }elseif($type == '7') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','G')
                
                ->get();
        }elseif($type == '8') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','H')
                
                ->get();
        }elseif($type == '9') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','I')
                
                ->get();
        }elseif($type == '10') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','J')
                
                ->get();
        }elseif($type == '11') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','K')
                
                ->get();
        }elseif($type == '12') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','L')
                
                ->get();
        }elseif($type == '13') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','M')
                
                ->get();
        }elseif($type == '14') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','N')
                
                ->get();
        }elseif($type == '15') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','O')
                
                ->get();
        }elseif($type == '16') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','P')
                
                ->get();
        }elseif($type == '17') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','Q')
                
                ->get();
        }elseif($type == '18') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','R')
                
                ->get();
        }elseif($type == '19') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','S')
                
                ->get();
        }elseif($type == '20') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','T')
                
                ->get();
        }elseif($type == '21') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','U')
                
                ->get();
        }elseif($type == '22') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','V')
                
                ->get();
        }elseif($type == '23') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','W')
                
                ->get();
        }elseif($type == '24') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','X')
                
                ->get();
        }elseif($type == '25') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','Y')
                
                ->get();
        }elseif($type == '26') {
            $gettheteacher = DB::table('teacher as t')
                ->join('users as u','u.id','=','t.parentId')
                ->select('t.id','u.company','u.realname','t.intro','t.firstletter','t.cover','t.parentId')
                ->where('u.type',2)
                ->where('t.firstletter','=','Z')
                
                ->get();
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
            $data['statuss'] = true;
        }else{
            $data['statuss'] = false;
        }
        echo json_encode($data);

    }



}


