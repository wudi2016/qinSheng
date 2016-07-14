<?php

namespace App\Http\Controllers\Admin\contentmanager;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Illuminate\Support\Facades\Input;
use Carbon\Carbon;

class hotvideoController extends Controller{

    public function hotvideoList(Request $request){
        $query = DB::table('hotvideo');

        if($request->type == 1){
            $query = $query->where('id','like','%'.trim($request['search']).'%');
        }
        if($request->type == 2){
            $query = $query->where('title','like','%'.trim($request['search']).'%');
        }
        if($request->type == 3){
            $query = $query->where('created_at','>=',$request['beginTime'])->where('created_at','<=',$request['endTime']);
        }

        $data = $query->paginate(10);
        return view('admin.contentManager.hotvideo.hotvideoList')->with('hotvideo',$data);
    }


    /**
     * 添加
     */
    public function addhotvideo(){
        return view('admin.contentManager.hotvideo.addhotvideo');
    }


    /**
     * 添加方法
     */
    public function addshotvideo(Request $request){
        $input = Input::except('_token');
        $input['created_at'] = Carbon::now();
//        dd($input);
        if($request->hasFile('cover')){ //判断文件是否存在
            if($request->file('cover')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('cover')->getClientOriginalName();//获取图片名
                $entension = $request->file('cover')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('cover'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('cover')->move('./admin/image/contentManager/hotvideo',$newname)){
                    $input['cover'] = 'admin/image/contentManager/hotvideo/'.$newname;
                }else{
                    return redirect()->back()->withInput()->withErrors('文件保存失败');
                }

            }else{
                return redirect()->back()->withInput()->withErrors('文件在上传过程中出错');
            }
        }
        $res = DB::table('hotvideo')->insert($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'添加成功','redirect'=>'contentManager/hotvideoList']);
        }else{
            return redirect()->back()->withInput()->withErrors('添加失败！');
        }
    }



    /**
     * 编辑
     */
    public function edithotvideo($id){
        $data = DB::table('hotvideo')->where('id',$id)->first();
        return view('admin.contentManager.hotvideo.edithotvideo')->with('data',$data);
    }


    /**
     * 编辑方法
     */
    public function editshotvideo(Request $request){
        $input = Input::except('_token');
        $input['created_at'] = Carbon::now();
        if($request->hasFile('cover')){ //判断文件是否存在
            if($request->file('cover')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('cover')->getClientOriginalName();//获取图片名
                $entension = $request->file('cover')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('cover'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('cover')->move('./admin/image/contentManager/hotvideo',$newname)){
                    $input['cover'] = 'admin/image/contentManager/hotvideo/'.$newname;
                }else{
                    return redirect()->back()->withInput()->withErrors('文件保存失败');
                }

            }else{
                return redirect()->back()->withInput()->withErrors('文件在上传过程中出错');
            }
        }
        $res = DB::table('hotvideo')->where('id',$input['id'])->update($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'编辑成功','redirect'=>'contentManager/hotvideoList']);
        }else{
            return redirect()->back()->withInput()->withErrors('编辑失败！');
        }
    }







    /**
     * 删除
     */
    public function delhotvideo($id){
        $res = DB::table('hotvideo')->where('id',$id)->delete();
        if($res){
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'contentManager/hotvideoList']);
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }
    }



    /**
     * 审核状态
     */
    public function hotvideoStatus(Request $request){
        $data['status'] = $request['status'];
        $data = DB::table('hotvideo')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }


    /**
     * 上传资源
     */
    public function dohotvideo(Request $request)
    {
        if($request->hasFile('Filedata')){ //判断文件是否存在
            if($request->file('Filedata')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('Filedata')->getClientOriginalName();//获取图片名
                $entension = $request->file('Filedata')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('ymdhis'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('Filedata')->move('./admin/hotvideo/',$newname)){
                    echo '/admin/hotvideo/'.$newname;
                }else{
                    echo '文件保存失败';
                }
            }else{
                echo '文件上传出错';
            }
        }
    }




}
