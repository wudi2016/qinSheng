<?php

namespace App\Http\Controllers\Admin\departmentPost;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;
use Illuminate\Support\Facades\Input;

class postController extends Controller{

    /**
     * 列表
     */
    public function postList(Request $request){
        $query = DB::table('post as p')
                ->leftjoin('department as dep','dep.id','=','p.parentId')
                ->select('p.id','dep.departName','p.postName','p.status','p.created_at');

        if($request->type == 1){
            $query = $query->where('p.postName','like','%'.trim($request['search']).'%');
        }

        $data = $query->paginate(10);

        return view('admin.departmentPost.post.postList')->with('post',$data);
    }



    /**
     * 添加
     */
    public function addpost(){
        $depart = DB::table('department')->get();
        return view('admin.departmentPost.post.addpost')->with('depart',$depart);
    }



    /**
     * 添加方法
     */
    public function addspost(){
        $input = Input::except('_token');
        $input['parentId'] = $input['depart'];
        unset($input['depart']);
        $input['created_at'] = Carbon::now();
        $res = DB::table('post')->insert($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'添加成功','redirect'=>'departmentPost/postList']);
        }else{
            return redirect()->back()->withInput()->withErrors('添加失败！');
        }
    }



    /**
     * 编辑
     */
    public function editpost($id){
        $data = DB::table('post')->where('id',$id)->first();
        $depart = DB::table('department')->get();
        return view('admin.departmentPost.post.editpost')->with('data',$data)->with('depart',$depart);
    }



    /**
     * 编辑方法
     */
    public function editspost(){
        $input = Input::except('_token');
        $input['parentId'] = $input['depart'];
        unset($input['depart']);
//        $input['updated_at'] = Carbon::now();
        $res = DB::table('post')->where('id',$input['id'])->update($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'更新成功','redirect'=>'departmentPost/postList']);
        }else{
            return redirect()->back()->withInput()->withErrors('更新失败！');
        }
    }



    /**
     * 删除
     */
    public function delpost($id){
        $res = DB::table('post')->where('id',$id)->delete();
        if($res){
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'departmentPost/postList']);
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }
    }


    /**
     * 状态
     */
    public function postStatus(Request $request){
        $data['status'] = $request['status'];
        $data = DB::table('post')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }



}