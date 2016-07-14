<?php

namespace App\Http\Controllers\Admin\specialCourse;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;

class SpecialFeedbackController extends Controller
{
    /**
     * 意见反馈列表
     */
    public function specialFeedbackList(Request $request){
        $query = DB::table('coursefeedback as f');
        if($request['type'] == 1){
            $query = $query->where('f.id','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('c.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('f.backType','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){ //上传的起止时间
            $query = $query->where('f.created_at','>=',$request['beginTime'])->where('f.created_at','<=',$request['endTime']);
        }
        $data = $query
            ->leftJoin('course as c','f.courseId','=','c.id')
            ->select('f.*','c.courseTitle')
            ->orderBy('f.id','desc')
            ->paginate(15);
        $data->type = $request['type'];
        return view('admin.specialCourse.specialFeedbackList',['data'=>$data]);

    }

    /**
     *意见反馈状态
     */
    public function specialFeedbackState(Request $request){
        $data['status'] = $request['status'];
        $data = DB::table('coursefeedback')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *删除
     */
    public function delSpecialFeedback($id){
        $data = DB::table('coursefeedback')->where('id',$id)->delete();
        if($data){
            return redirect('admin/message')->with(['status'=>'意见反馈删除成功','redirect'=>'specialCourse/specialFeedbackList']);
        }else{
            return redirect('admin/message')->with(['status'=>'意见反馈删除失败','redirect'=>'specialCourse/specialFeedbackList']);
        }
    }
}
