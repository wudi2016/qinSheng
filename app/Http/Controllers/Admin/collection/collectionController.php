<?php

namespace App\Http\Controllers\Admin\collection;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class collectionController extends Controller{

    public function collectionList(Request $request){

        $query = DB::table('collection as col')
                ->leftjoin('course as c','col.courseId','=','c.id')
                ->leftjoin('commentcourse as com','col.courseId','=','com.id')
                ->leftjoin('users as u','u.id','=','col.userId')
                ->select('col.id','col.type','c.courseTitle','u.username','com.courseTitle as Title','col.created_at');


        if($request->type == 1){
            $query = $query->where('c.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request->type == 2){
            $query = $query->where('com.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request->type == 3){
            $query = $query->where('u.username','like','%'.trim($request['search']).'%');
        }
        if($request['beginTime']){ //上传的起止时间
            $query = $query->where('col.created_at','>=',$request['beginTime']);
        }
        if($request['endTime']){ //上传的起止时间
            $query = $query->where('col.created_at','<=',$request['endTime']);
        }

        $data = $query->orderBy('id','desc')->paginate(10);
        $data->type = $request['type'];
        $data->beginTime = $request['beginTime'];
        $data->endTime = $request['endTime'];
       return view('admin.collection.collectionList')->with('collection',$data);
    }


    //删除
    public function delcollection($id){
        $res = DB::table('collection')->where('id',$id)->delete();
        if($res){
            $this -> OperationLog("删除了用户收藏ID为{$id}的信息", 1);
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'collection/collectionList']);
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }
    }



}

