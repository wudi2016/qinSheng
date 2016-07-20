<?php

namespace App\Http\Controllers\Home\aboutUs;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class firmintroController extends Controller{

    /**
     *列表
     */
    public function index($type){
        return view('home.aboutUs.aboutus')->with('type',$type);
    }

    //公司介绍
    public function getListone(){
        $firmintro = DB::table('about')->where('type',0)->get();
            if($firmintro){
                foreach($firmintro as $k => $v){
                    $data['data'][] = [
                        'id' => $v->id,
                        'title' => $v->title,
                        'content' => $v->content,
                    ];
                }
                $data['statuss'] = true;
            }else{
                $data['statuss'] = false;
            }
            echo json_encode($data);
    }

    //联系我们
    public function getListtwo(){
        $firmintro = DB::table('about')->where('type',1)->get();
            if($firmintro){
                foreach($firmintro as $k => $v){
                    $data['data'][] = [
                        'id' => $v->id,
                        'title' => $v->title,
                        'content' => $v->content,
                    ];
                }
                $data['statuss'] = true;
            }else{
                $data['statuss'] = false;
            }
            echo json_encode($data);
    }

    //常见问题
    public function getListthree(){
        $firmintro = DB::table('about')->where('type',2)->get();
        if($firmintro){
            foreach($firmintro as $k => $v){
                $data['data'][] = [
                    'id' => $v->id,
                    'title' => $v->title,
                    'content' => $v->content,
                ];
            }
            $data['statuss'] = true;
        }else{
            $data['statuss'] = false;
        }
        echo json_encode($data);
    }


    //用户协议
    public function getListfour(){
        $firmintro = DB::table('about')->where('type',3)->get();
        if($firmintro){
            foreach($firmintro as $k => $v){
                $data['data'][] = [
                    'id' => $v->id,
                    'title' => $v->title,
                    'content' => $v->content,
                ];
            }
            $data['statuss'] = true;
        }else{
            $data['statuss'] = false;
        }
        echo json_encode($data);
    }

    //友情链接
    public function getListfive(){
        $link = DB::table('link')->get();
        if($link){
            foreach($link as $k => $v){
                $data['data'][] = [
                    'id' => $v->id,
                    'title' => $v->title,
                    'url' => $v->url,
                    'path' => $v->path
                ];
            }
            $data['statuss'] = true;
        }else{
            $data['statuss'] = false;
        }
//        dd($data);
        echo json_encode($data);
    }


    //意见反馈
    public function getListsix(){
        $firmintro = DB::table('about')->where('type',4)->get();
        if($firmintro){
            foreach($firmintro as $k => $v){
                $data['data'][] = [
                    'id' => $v->id,
                    'title' => $v->title,
                    'content' => $v->content,
                ];
            }
            $data['statuss'] = true;
        }else{
            $data['statuss'] = false;
        }
        echo json_encode($data);
    }





    
}
