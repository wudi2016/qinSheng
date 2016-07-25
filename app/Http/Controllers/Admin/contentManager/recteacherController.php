<?php

namespace App\Http\Controllers\Admin\contentManager;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Illuminate\Support\Facades\Input;
use Carbon\Carbon;


class recteacherController extends Controller{

    /**
     * 列表
     */
    public function recteacherList(){
        $data = DB::table('recteacher as rec')->orderBy('sort','asc')->get();
        return view('admin.contentManager.recteacher.recteacherList')->with('recteacher',$data);
    }

    /**
     * 添加
     */
    public function addrecteacher(){
        $teacher = DB::table('teacher as t')
                ->leftjoin('users as u','u.id','=','parentId')
                ->select('u.id','u.realname')
                ->get();
        return view('admin.contentManager.recteacher.addrecteacher')->with('recteacher',$teacher);
    }



    /**
     * 添加方法
     */
    public function addsrecteacher(Request $request){
        $input = Input::except('_token');
        if(DB::table('recteacher')->where('userId',$request['userId'])->first()){
            return redirect()->back()->withInput()->withErrors('名师不可重复推荐');
        }
        $input['created_at'] = Carbon::now();
        $teachername = DB::table('users')->where('id',$request['userId'])->select('realname')->first();
        $input['name'] = $teachername->realname;
        $res = DB::table('recteacher')->insert($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'添加成功','redirect'=>'contentManager/recteacherList']);
        }else{
            return redirect()->back()->withInput()->withErrors('添加失败！');
        }
    }



    /**
     *编辑
     */
    public function editrecteacher($id){
        $data = DB::table('recteacher')->where('id',$id)->first();
        return view('admin.contentManager.recteacher.editrecteacher')->with('data',$data);
    }


    /**
     * 编辑方法
     */
    public function editsrecteacher(Request $request){
        $input = Input::except('_token');
        $input['updated_at'] = Carbon::now();
        $res = DB::table('recteacher')->where('id',$input['id'])->update($input);
        if($res){
            return redirect('admin/message')->with(['status'=>'编辑成功','redirect'=>'contentManager/recteacherList']);
        }else{
            return redirect()->back()->withInput()->withErrors('编辑失败！');
        }
    }



    /**
     * 删除
     */
    public function deleterecteacher($id){
        if(DB::table('recteacher')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'contentManager/recteacherList']);
        }else{
            return redirect('admin/message')->with(['status'=>'删除失败','redirect'=>'contentManager/recteacherList']);
        }
    }



}