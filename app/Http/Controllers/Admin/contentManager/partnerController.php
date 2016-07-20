<?php

namespace App\Http\Controllers\Admin\contentManager;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Illuminate\Support\Facades\Input;
use Carbon\Carbon;


class partnerController extends Controller{

    public function partnerList(Request $request){

        $query = DB::table('partner');
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

        return view('admin.contentManager.partner.partnerList')->with('partner',$data);
    }



    /**
     * 添加
     */
    public function addpartner(){
        return view('admin.contentManager.partner.addpartner');
    }


    /**
     * 添加方法
     */
    public function addspartner(Request $request){
        $input = Input::except('_token');
        $input['created_at'] = Carbon::now();
        if($request->hasFile('path')){ //判断文件是否存在
            if($request->file('path')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('path')->getClientOriginalName();//获取图片名
                $entension = $request->file('path')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('path'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('path')->move('./admin/image/\contentManager/partner',$newname)){
                    $input['path'] = '/admin/image/contentManager/partner/'.$newname;
                }else{
                    return redirect()->back()->withInput()->withErrors('文件保存失败');
                }

            }else{
                return redirect()->back()->withInput()->withErrors('文件在上传过程中出错');
            }
        }
        $res = DB::table('partner')->insert($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'添加成功','redirect'=>'contentManager/partnerList']);
        }else{
            return redirect()->back()->withInput()->withErrors('添加失败！');
        }
    }



    /**
     * 编辑
     */
    public function editpartner($id){
        $data = DB::table('partner')->where('id',$id)->first();
        return view('admin.contentManager.partner.editpartner')->with('data',$data);
    }


    /**
     * 编辑方法
     */
    public function editspartner(Request $request){
        $input = Input::except('_token');
        $input['created_at'] = Carbon::now();
        if($request->hasFile('path')){ //判断文件是否存在
            if($request->file('path')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('path')->getClientOriginalName();//获取图片名
                $entension = $request->file('path')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('path'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('path')->move('./admin/image/\contentManager/partner',$newname)){
                    $input['path'] = '/admin/image/contentManager/partner/'.$newname;
                }else{
                    return redirect()->back()->withInput()->withErrors('文件保存失败');
                }

            }else{
                return redirect()->back()->withInput()->withErrors('文件在上传过程中出错');
            }
        }
        $res = DB::table('partner')->where('id',$input['id'])->update($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'编辑成功','redirect'=>'contentManager/partnerList']);
        }else{
            return redirect()->back()->withInput()->withErrors('编辑失败！');
        }
    }



    /**
     * 删除
     */
    public function delpartner($id){
        $res = DB::table('partner')->where('id',$id)->delete();
        if($res){
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'contentManager/partnerList']);
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }
    }




    /**
     * 审核状态
     */
    public function partnerStatus(Request $request){
        $data['status'] = $request['status'];
        $data = DB::table('partner')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }




}