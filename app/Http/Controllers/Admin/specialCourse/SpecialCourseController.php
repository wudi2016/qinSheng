<?php

namespace App\Http\Controllers\Admin\specialCourse;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;

class SpecialCourseController extends Controller
{
    /**
     *专题课程列表
     */
    public function specialCourseList(Request $request){
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
            ->where('courseIsDel',0)
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
//        dd($data);
        return view('admin.specialCourse.specialCourseList',['data'=>$data]);
    }

    /**
     *添加专题课程
     */
    public function addSpecialCourse(){
        $data = [];
        $data['typeNames'] = DB::table('users')->where('type',2)->select('id','realname')->get();
        $data['coursetypes'] = DB::table('coursetype')->get();
        return view('admin.specialCourse.addSpecialCourse',['data'=>$data]);
    }

    /**
     *执行添加
     */
    public function doAddSpecialCourse(Request $request){
        $data = $request->except('_token');
        $data['coursePrice'] = $request['coursePrice'] * 1000;
        $data['courseDiscount'] = $request['courseDiscount'] * 1000;
        $data['created_at'] = Carbon::now();
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
        if(DB::table('course')->insert($data)){
            return redirect('admin/message')->with(['status'=>'专题课程添加成功','redirect'=>'specialCourse/specialCourseList']);
        }else{
            return redirect()->back()->withInput()->withErrors('专题课程添加失败');
        }
    }

    /**
     *编辑专题课程
     */
    public function editSpecialCourse($id){
        $data = DB::table('course as c')
            ->leftJoin('users as u','c.teacherId','=','u.id')
            ->where('c.id',$id)
            ->select('c.*','u.username')
            ->first();
        if($data->courseType){
            $coursetype = DB::table('coursetype')->where('id',$data->courseType)->first();
            $data->typeName = $coursetype->typeName;
        }else{
            $data->typeName = '无促销';
        }
        $data->coursePrice = $data->coursePrice / 1000;
        $data->courseDiscount = $data->courseDiscount / 1000;

        $data->typeNames = DB::table('coursetype')->get();
        return view('admin.specialCourse.editSpecialCourse',['data'=>$data]);
    }

    /**
     *执行编辑
     */
    public function doEditSpecialCourse(Request $request){
        $data = $request->except('_token');
        $data['coursePrice'] = $request['coursePrice'] * 1000;
        $data['courseDiscount'] = $request['courseDiscount'] * 1000;
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
        if(DB::table('course')->where('id',$request['id'])->update($data)){
            return redirect('admin/message')->with(['status'=>'专题课程修改成功','redirect'=>'specialCourse/specialCourseList']);
        }else{
            return redirect()->back()->withInput()->withErrors('专题课程修改失败');
        }
    }

    /**
     *专题课程状态
     */
    public function specialCourseState(Request $request){
        $data['courseStatus'] = $request['courseStatus'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('course')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *专题视频详情
     */
    public function detailSpecialCourse($id){
        $data = [];
        $info = DB::table('course as c')
            ->leftJoin('users as u','c.teacherId','=','u.id')
            ->where('c.id',$id)
            ->select('c.*','u.username')
            ->first();
        $info->coursePrice = $info->coursePrice / 1000;
        $info->courseDiscount = $info->courseDiscount / 1000;
        if($info->courseType){
            $coursetype = DB::table('coursetype')->where('id',$info->courseType)->first();
            $info->typeName = $coursetype->typeName;
        }else{
            $info->typeName = '无促销';
        }
        $data['data'] = $info;
        if($info){
            $data['code'] = true;
        }else{
            $data['code'] = false;
        }
        return response()->json($data);
    }

    /**
     *删除专题课程
     */
    public function delSpecialCourse($id){
        $data = DB::table('course')->where('id',$id)->update(['courseIsDel'=>1]);
        if($data){
            return redirect('admin/message')->with(['status'=>'专题课程删除成功','redirect'=>'specialCourse/specialCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'专题课程删除失败','redirect'=>'specialCourse/specialCourseList']);
        }
    }
}
