<?php

namespace App\Http\Controllers\Admin\users;

use Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class recommendFamousController extends Controller
{
    /**
     * 推荐列表
     */
    public function recommendFamousList(){
        $data = DB::table('hotteacher')->orderBy('sort','asc')->paginate(15);
        return view('admin.users.recommend.recommendFamousList',['data'=>$data]);
    }

    /**
     *添加名师推荐
     */
    public function addRecommendFamous(){
        $data = DB::table('users')->select('id','realname')->where('type',2)->get();
        return view('admin.users.recommend.addRecommendFamous',['data'=>$data]);
    }
    public function doAddRecommendFamous(Request $request){
        $data = $request->except('_token');
        if(DB::table('hotteacher')->where('teacherId',$request['teacherId'])->first()){
            return redirect()->back()->withInput()->withErrors('名师不可重复推荐');
        }

        $teachername = DB::table('users')->where('id',$request['teacherId'])->select('realname')->first();
        $data['teacher'] = $teachername->realname;
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();
        if(DB::table('hotteacher')->insert($data)){
            return redirect('admin/message')->with(['status'=>'名师推荐成功','redirect'=>'users/recommendFamousList']);
        }else{
            return redirect('admin/message')->with(['status'=>'名师推荐失败','redirect'=>'users/recommendFamousList']);
        }
    }

    /**
     *编辑名师推荐
     */
    public function editRecommendFamous($id){
        $data = DB::table('hotteacher')->where('id',$id)->first();
        return view('admin.users.recommend.editRecommendFamous',['data'=>$data]);
    }
    public function doEditRecommendFamous(Request $request){
        $data = $request->except('_token');
        $data['updated_at'] = Carbon::now();
        if(DB::table('hotteacher')->where('id',$request['id'])->update($data)){
            return redirect('admin/message')->with(['status'=>'修改成功','redirect'=>'users/recommendFamousList']);
        }else{
            return redirect('admin/message')->with(['status'=>'修改失败','redirect'=>'users/recommendFamousList']);
        }
    }

    /**
     * 删除名师推荐
     */
    public function delRecommendFamous($id){
        if(DB::table('hotteacher')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'users/recommendFamousList']);
        }else{
            return redirect('admin/message')->with(['status'=>'删除失败','redirect'=>'users/recommendFamousList']);
        }
    }
}
