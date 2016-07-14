<?php

namespace App\Http\Controllers\Admin\recycle;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class RecycleCourseController extends Controller
{
    /**
     *专题课程列表
     */
    public function recycleCourseList(Request $request){
        $query = DB::table('course as c');
        if($request['type'] == 1){
            $query = $query->where('c.id','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('c.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('u.username','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){ //上传的起止时间
            $query = $query->where('c.created_at','>=',$request['beginTime'])->where('c.created_at','<=',$request['endTime']);
        }
        $data = $query
            ->leftJoin('users as u','u.id','=','c.teacherId')
            ->where('courseIsDel',1)
            ->select('c.*','u.username')
            ->orderBy('id','desc')
            ->paginate(15);
        foreach($data as &$val){
            $val->coursePrice = $val->coursePrice / 1000;
            $val->courseDiscount = $val->courseDiscount / 1000;
            if($val->courseType){
                $coursetype = DB::table('coursetype')->where('id',$val->courseType)->first();
                $val->typeName = $coursetype->typeName;
            }else{
                $val->typeName = '无促销';
            }
        }
        $data->type = $request['type'];
        return view('admin.recycle.specialCourseList',['data'=>$data]);
    }

    /**
     *还原专题课程
     */
    public function editRecycleCourse($id){
        $data = DB::table('course')->where('id',$id)->update(['courseIsDel'=>0]);
        if($data){
            return redirect('admin/message')->with(['status'=>'专题课程还原成功','redirect'=>'recycle/recycleCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'专题课程还原失败','redirect'=>'recycle/recycleCourseList']);
        }
    }

    /**
     *彻底删除专题课程
     */
    public function delRecycleCourse($id){
        if(DB::table('course')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'专题课程删除成功','redirect'=>'recycle/recycleCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'专题课程删除失败','redirect'=>'recycle/recycleCourseList']);
        }
    }






    /**
     *演奏视频列表
     */
    public function recycleCommentCourseList(Request $request){
        $query = DB::table('applycourse as a');
        if($request['type'] == 1){
            $query = $query->where('a.id','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('a.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('u.username','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){
            $query = $query->where('ut.realname','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 5){ //上传的起止时间
            $query = $query->where('a.created_at','>=',$request['beginTime'])->where('a.created_at','<=',$request['endTime']);
        }
        $data = $query
            ->leftJoin('users as u','a.userId','=','u.id')
            ->leftJoin('users as ut','a.teacherId','=','ut.id')
            ->where('a.courseIsDel',1)
            ->select('a.*','u.username','ut.realname as teachername')
            ->orderBy('a.id','desc')
            ->paginate(15);
        $data->type = $request['type'];
//        dd($data);
        return view('admin.recycle.commentCourseList',['data'=>$data]);
    }

    /**
     *还原演奏视频
     */
    public function editRecycleCommentCourse($id){
        $data = DB::table('applycourse')->where('id',$id)->update(['courseIsDel'=>0]);
        if($data){
            return redirect('admin/message')->with(['status'=>'演奏视频还原成功','redirect'=>'recycle/recycleCommentCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'演奏视频还原失败','redirect'=>'recycle/recycleCommentCourseList']);
        }
    }

    /**
     *彻底删除演奏视频
     */
    public function delRecycleCommentCourse($id){
        if(DB::table('applycourse')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'专题课程删除成功','redirect'=>'recycle/recycleCommentCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'专题课程删除失败','redirect'=>'recycle/recycleCommentCourseList']);
        }
    }






    /**
     *名师点评列表
     */
    public function recycleTeacherCourseList(Request $request){
        $query = DB::table('commentcourse');
        if($request['type'] == 1){
            $query = $query->where('id','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('username','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){
            $query = $query->where('teachername','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 5){ //上传的起止时间
            $query = $query->where('created_at','>=',$request['beginTime'])->where('created_at','<=',$request['endTime']);
        }
        $data = $query
            ->where('courseIsDel',1)
            ->orderBy('id','desc')
            ->paginate(15);
        $data->type = $request['type'];
//        dd($data);
        return view('admin.recycle.teacherCourseList',['data'=>$data]);
    }

    /**
     *还原点评课程
     */
    public function editRecycleTeacherCourse($id){
        $data = DB::table('commentcourse')->where('id',$id)->update(['courseIsDel'=>0]);
        if($data){
            return redirect('admin/message')->with(['status'=>'点评课程还原成功','redirect'=>'recycle/recycleTeacherCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'点评课程还原失败','redirect'=>'recycle/recycleTeacherCourseList']);
        }
    }

    /**
     *彻底删除点评课程
     */
    public function delRecycleTeacherCourse($id){
        if(DB::table('commentcourse')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'点评课程删除成功','redirect'=>'recycle/recycleTeacherCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'点评课程删除失败','redirect'=>'recycle/recycleTeacherCourseList']);
        }
    }




    /**
     *订单列表
     */
    public function recycleOrderList(Request $request){
        $query = DB::table('orders');
        if($request['type'] == 1){
            $query = $query->where('orderSn','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('orderTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('userId','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){
            $query = $query->where('userName','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 5){ //上传的起止时间
            $query = $query->where('payTime','>=',$request['beginTime'])->where('payTime','<=',$request['endTime']);
        }
        $data = $query
            ->where('isDelete',1)
            ->orderBy('id','desc')
            ->paginate(15);
        foreach($data as &$val){
            $val->orderPrice = $val->orderPrice / 1000;
            $val->payPrice = $val->payPrice / 1000;
            $val->refundableAmount = $val->refundableAmount / 1000;
            $val->refundAmount = $val->refundAmount / 1000;
        }
        //导出数据
        $excel = $query
            ->select('id','orderSn as 订单号','tradeSn as 交易编号','orderTitle as 订单名称','orderPrice as 订单价格','payPrice as 实付金额','payType as 支付方式(0:支付宝1:微信)','userId as 购买用户ID','userName as 购买用户','teacherId as 邀请人ID','teacherName as 邀请人','orderType as 订单类型(0:购买专题订单1:点评申请订单2:购买点评订单)','courseId as 专题课程ID(订单类型为0或1时为点评课程ID)','refundableAmount as 应退金额','refundAmount as 已退金额','payTime as 付款时间','status as 订单状态(0:已付款1:待点评2:已完成3:退款中4:已退款)')
            ->where('isDelete',0)
            ->orderBy('id','desc')
            ->get();
        foreach($excel as &$value){
            $value->订单价格 = $value->订单价格 / 1000;
            $value->实付金额 = $value->实付金额 / 1000;
            $value->应退金额 = $value->应退金额 / 1000;
            $value->已退金额 = $value->已退金额 / 1000;
        }
        $excel = json_encode($excel);
        $data->type = $request['type'];
//        dd($data);
        return view('admin.recycle.orderList',['data'=>$data,'excel'=>$excel]);
    }

    /**
     *还原订单
     */
    public function editRecycleOrder($id){
        $data = DB::table('orders')->where('id',$id)->update(['isDelete'=>0]);
        if($data){
            return redirect('admin/message')->with(['status'=>'订单还原成功','redirect'=>'recycle/recycleOrderList']);
        }else{
            return redirect('admin/message')->with(['status'=>'订单还原失败','redirect'=>'recycle/recycleOrderList']);
        }
    }

    /**
     *彻底删除订单
     */
    public function delRecycleOrder($id){
        if(DB::table('orders')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'订单删除成功','redirect'=>'recycle/recycleOrderList']);
        }else{
            return redirect('admin/message')->with(['status'=>'订单删除失败','redirect'=>'recycle/recycleOrderList']);
        }
    }


}
