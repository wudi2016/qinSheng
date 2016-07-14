<?php

namespace App\Http\Controllers\Admin\commentCourse;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;

class teacherCourseController extends Controller
{
    /**
     *名师点评列表
     */
    public function teacherCourseList(Request $request){
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
            ->where('courseIsDel',0)
            ->orderBy('id','desc')
            ->paginate(15);
        $data->type = $request['type'];
//        dd($data);
        return view('admin.teacherCourse.teacherCourseList',['data'=>$data]);
    }

    /**
     *审核状态
     */
    public function teacherState(Request $request){
        $data['state'] = $request['state'];
        $data['lastCheckTime'] = Carbon::now();
        $data = DB::table('commentcourse')->where('id',$request['id'])->update($data);
        if($request['state'] == 0){
            $arr = array('state'=>'0','msg'=>'审核未通过');
        }elseif($request['state'] == 1){
            $arr = array('state'=>'1','msg'=>'审核中');
        }elseif($request['state'] == 2){
            $arr = array('state'=>'2','msg'=>'审核通过');
        }else{
            $arr = array('state'=>'3','msg'=>'修改失败');
        }
        echo json_encode($arr);
    }

    /**
     *课程状态
     */
    public function teaccourseState(Request $request){
        $data['courseStatus'] = $request['courseStatus'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('commentcourse')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *名师点评详情
     */
    public function detailTeacherCommentCourse($id){
        $data = [];
        $info = DB::table('commentcourse as c')
            ->leftJoin('users as u','c.userId','=','u.id')
            ->leftJoin('users as ut','c.teacherId','=','ut.id')
            ->where('c.courseIsDel',0)
            ->where('c.id',$id)
            ->select('c.*','u.username','u.phone','ut.realname as teachername','ut.phone as teacherphone')
            ->orderBy('c.id','desc')
            ->first();
        $data['data'] = $info;
        if($info){
            $data['code'] = true;
        }else{
            $data['code'] = false;
        }
        return response()->json($data);
    }

    /**
     *编辑点评视频
     */
    public function editTeacherCourse($id){
        $data = DB::table('commentcourse')
            ->where('courseIsDel',0)
            ->where('id',$id)
            ->orderBy('id','desc')
            ->first();
        return view('admin.teacherCourse.editTeacherCourse',['data'=>$data]);
    }

    /**
     *执行编辑
     */
    public function doEditTeacherCourse(Request $request){
        $data = $request->except('_token');
        $data['updated_at'] = Carbon::now();
        if($request->hasFile('coursePic')){ //判断文件是否存在
            if($request->file('coursePic')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('coursePic')->getClientOriginalName();//获取图片名
                $entension = $request->file('coursePic')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('ymdhis'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('coursePic')->move('./home/image/lessonSubject',$newname)){
                    $data['coursePic'] = '/home/image/lessonSubject/'.$newname;
                }else{
                    return redirect()->back()->withInput()->withErrors('文件保存失败');
                }

            }else{
                return redirect()->back()->withInput()->withErrors('文件在上传过程中出错');
            }
        }
        if(DB::table('commentcourse')->where('id',$request['id'])->update($data)){
            return redirect('admin/message')->with(['status'=>'点评视频修改成功','redirect'=>'commentCourse/teacherCourseList']);
        }else{
            return redirect()->back()->withInput()->withErrors('点评视频修改失败');
        }
    }

    /**
     *删除名师点评
     */
    public function delTeacherCourse($id){
        $data = DB::table('commentcourse')->where('id',$id)->update(['courseIsDel'=>1]);
        if($data){
            return redirect('admin/message')->with(['status'=>'点评视频删除成功','redirect'=>'commentCourse/teacherCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'点评视频删除失败','redirect'=>'commentCourse/teacherCourseList']);
        }
    }
}
