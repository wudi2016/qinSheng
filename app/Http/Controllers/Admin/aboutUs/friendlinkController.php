<?php

namespace App\Http\Controllers\Admin\aboutUs;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Input;


class friendlinkController extends Controller
{

    /**
     * 列表
     */
    public function friendlinkList(Request $request){

        $query = DB::table('link');
        if($request->type == 1){
            $query = $query->where('id','like','%'.trim($request['search']).'%');
        }
        if($request->type == 2){
            $query = $query->where('t','like','%'.trim($request['search']).'%');
        }
        if($request->type == 3){
            $query = $query->where('created_at','>=',$request['beginTime'])->where('created_at','<=',$request['endTime']);
        }
        $data = $query->get();
        return view('admin.aboutus.friendlink.friendlinkList')->with('links',$data);
    }


    /**
     * 添加
     */
    public function addfriendlink(){

        return view('admin.aboutus.friendlink.addfriendlink');
    }


    /**
     * 添加方法
     */
    public function addsfriendlink(Request $request){
        $input = Input::except('_token');
        $input['created_at'] = Carbon::now();
        if($request->hasFile('path')){ //判断文件是否存在
            if($request->file('path')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('path')->getClientOriginalName();//获取图片名
                $entension = $request->file('path')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('path'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('path')->move('/admin/image/aboutus/friendlink',$newname)){
                    $input['path'] = 'admin/image/aboutus/friendlink/'.$newname;
                }else{
                    return redirect()->back()->withInput()->withErrors('文件保存失败');
                }

            }else{
                return redirect()->back()->withInput()->withErrors('文件在上传过程中出错');
            }
        }
        $res = DB::table('link')->insert($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'添加成功','redirect'=>'aboutUs/friendlinkList']);
        }else{
            return redirect()->back()->withInput()->withErrors('添加失败！');
        }
    }



    /**
     * 编辑
     */
    public function editfriendlink($id){
        $data = DB::table('link')->where('id',$id)->first();
        return view('admin.aboutus.friendlink.editfriendlink')->with('data',$data);
    }



    /**
     * 编辑方法
     */
    public function editsfriendlink(Request $request){
        $input = Input::except('_token');
        $input['created_at'] = Carbon::now();
        if($request->hasFile('path')){ //判断文件是否存在
            if($request->file('path')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('path')->getClientOriginalName();//获取图片名
                $entension = $request->file('path')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('path'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('path')->move('/admin/image/aboutus/friendlink',$newname)){
                    $input['path'] = 'admin/image/aboutus/friendlink/'.$newname;
                }else{
                    return redirect()->back()->withInput()->withErrors('文件保存失败');
                }

            }else{
                return redirect()->back()->withInput()->withErrors('文件在上传过程中出错');
            }
        }
        $res = DB::table('link')->where('id',$input['id'])->update($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'编辑成功','redirect'=>'aboutUs/friendlinkList']);
        }else{
            return redirect()->back()->withInput()->withErrors('编辑失败！');
        }
    }


    /**
     * 删除
     */
    public function delfriendlink($id){
        $res = DB::table('link')->where('id',$id)->delete();
        if($res){
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'aboutUs/friendlinkList']);
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }
    }


    /**
     * 状态
     */
    public function frinendStatus(Request $request){
        $data['status'] = $request['status'];
        $data['created_at'] = Carbon::now();
        $data = DB::table('link')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }


}
