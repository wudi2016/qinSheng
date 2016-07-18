<?php

namespace App\Http\Controllers\Admin\departmentPost;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Input;

class departmentController extends Controller{

    /**
     * 列表
     */
    public function departmentList(Request $request){

        $query = DB::table('department');

        if($request->type == 1){
            $query = $query->where('departName','like','%'.trim($request['search']).'%');
        }

        $data = $query->paginate(10);

        return view('admin.departmentPost.department.departmentList')->with('department',$data);
    }


    /**
     * 添加
     */
    public function adddepartment(){
        return view('admin.departmentPost.department.adddepartment');
    }



    /**
     * 添加方法
     */
    public function addsdepartment(){
        $input = Input::except('_token');
        $input['created_at'] = Carbon::now();
        $res = DB::table('department')->insert($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'添加成功','redirect'=>'departmentPost/departmentList']);
        }else{
            return redirect()->back()->withInput()->withErrors('添加失败！');
        }
    }



    /**
     * 编辑
     */
    public function editdepartment($id){
        $data = DB::table('department')->where('id',$id)->first();
        return view('admin.departmentPost.department.editdepartment')->with('data',$data);
    }



    /**
     * 编辑方法
     */
    public function editsdepartment(){
        $input = Input::except('_token');
//        $input['updated_at'] = Carbon::now();
        $res = DB::table('department')->where('id',$input['id'])->update($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'更新成功','redirect'=>'departmentPost/departmentList']);
        }else{
            return redirect()->back()->withInput()->withErrors('更新失败！');
        }
    }



    /**
     * 删除
     */
    public function deldepartment($id){
        $res = DB::table('department')->where('id',$id)->delete();
        if($res){
            //同时删除对应部门下的岗位
            DB::table('post')->where('parentId',$id)->delete();
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'departmentPost/departmentList']);
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }
    }



    /**
     * 状态
     */
    public function departmentStatus(Request $request){
        $data['status'] = $request['status'];
        $data = DB::table('department')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }


}