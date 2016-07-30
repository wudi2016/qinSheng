<?php

namespace App\Http\Controllers\Admin\commentCourse;

use Carbon\Carbon;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class recommendController extends Controller
{
    /**
     *点评视频推荐列表
     */
    public function recommendCourseList(){
        $query = DB::table('hotreviewcourse as h');
        $data = $query->orderBy('id','desc')->paginate(15);
        return view('admin/teacherCourse/recommendList',['data'=>$data]);
    }

    /**
     *添加推荐
     */
    public function addRecommendCourse(){
        $data = DB::table('commentcourse')->select('id','courseTitle')->get();
        return view('admin/teacherCourse/addRecommend',['data'=>$data]);
    }

    /**
     *执行添加
     */
    public function doAddRecommendCourse(Request $request){
        $data = $request->except('_token');
        if(DB::table('hotreviewcourse')->where('courseId',$request['courseId'])->first()){
            return redirect()->back()->withInput()->withErrors('点评视频不可重复推荐');
        }
        //判断推荐位是否存在
        $isexit = DB::table('hotreviewcourse')->where('sort',$request['sort'])->first();
        if($isexit){
            DB::table('hotreviewcourse')->where('id',$isexit->id)->update(['sort'=>0]);
        }
        $courseTitle = DB::table('commentcourse')->where('id',$request['courseId'])->select('id','courseTitle')->first();
        $data['courseName'] = $courseTitle->courseTitle;
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();
        if($id = DB::table('hotreviewcourse')->insertGetId($data)){
            $this -> OperationLog('添加了id为'.$id.'的点评视频推荐');
            return redirect('admin/message')->with(['status'=>'点评视频推荐成功','redirect'=>'commentCourse/recommendCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'点评视频推荐失败','redirect'=>'commentCourse/recommendCourseList']);
        }
    }

    /**
     *编辑点评推荐
     */
    public function editRecommendCourse($id){
        $data = DB::table('hotreviewcourse')->where('id',$id)->first();
        return view('admin/teacherCourse/editRecommend',['data'=>$data]);
    }

    /**
     *执行编辑
     */
    public function doEditRecommendCourse(Request $request){
        $data = $request->except('_token');
        //判断推荐位是否存在
        $isexit = DB::table('hotreviewcourse')->where('sort',$request['sort'])->first();
        if($isexit){
            DB::table('hotreviewcourse')->where('id',$isexit->id)->update(['sort'=>0]);
        }
        $data['updated_at'] = Carbon::now();
        if(DB::table('hotreviewcourse')->where('id',$request['id'])->update($data)){
            $this -> OperationLog('修改了id为'.$request['id'].'的点评视频推荐');
            return redirect('admin/message')->with(['status'=>'点评视频推荐修改成功','redirect'=>'commentCourse/recommendCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'点评视频推荐修改失败','redirect'=>'commentCourse/recommendCourseList']);
        }
    }

    /**
     *删除点评推荐
     */
    public function delRecommendCourse($id){
        if(DB::table('hotreviewcourse')->where('id',$id)->delete()){
            $this -> OperationLog('删除了id为'.$id.'的点评视频推荐');
            return redirect('admin/message')->with(['status'=>'删除成功','redirect'=>'commentCourse/recommendCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'删除失败','redirect'=>'commentCourse/recommendCourseList']);
        }
    }
}
