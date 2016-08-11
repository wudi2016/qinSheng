<?php

namespace App\Http\Controllers\Home\community;

use Illuminate\Http\Request;
use QrCode;
use PaasUser;
use PaasResource;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use App\Http\Controllers\Home\lessonComment\Gadget;


class videodetailController extends Controller
{


    use Gadget;

    public static $errMessage;

    public function __construct()
    {
        PaasUser::apply();
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home.community.videodetail');
    }


    /**
     * 热门视频详情数据接口
     */
    public function getvideodetail($id){

        $getvideodetail = DB::table('hotvideo')->where('id',$id)->where('status',0)->get();
        if($getvideodetail){
            foreach ($getvideodetail as $k => $v) {
                $v->coursePath = $this->getPlayUrl($v->coursePath);
                $data['data'][] = [
                    'id' => $v->id,
                    'title' => $v->title,
                    'coursePath' => $v->coursePath,
                    'videoIntro' => $v->videoIntro,
                    'cover' => $v->cover,
                ];
            }
            $data['statuss'] = true;
        }else {
            $data['statuss'] = false;
        }
//        dd($data);
        echo json_encode($data);

    }



}
