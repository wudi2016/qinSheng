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
//        if($request->type == 1){
//            $query = $query->where('col.type',0);
//        }
//        if($request->type == 2){
//            $query = $query->where('col.type',1);
//        }
        if($request->type == 3){
            $query = $query->where('c.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request->type == 4){
            $query = $query->where('com.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request->type == 5){
            $query = $query->where('u.username','like','%'.trim($request['search']).'%');
        }
        if($request->type == 6){
            $query = $query->where('col.created_at','>=',$request['beginTime'])->where('col.created_at','<=',$request['endTime']);
        }
        $data = $query->paginate(10);

       return view('admin.collection.collectionList')->with('collection',$data);
    }


    //删除
    public function delcollection($id){
        $res = DB::table('collection')->where('id',$id)->delete();
        if($res){
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'collection/collectionList']);
        }else{
            return redirect()->back()->withInput()->withErrors('删除失败！');
        }
    }



}

