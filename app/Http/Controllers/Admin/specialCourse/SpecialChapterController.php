<?php

namespace App\Http\Controllers\Admin\specialCourse;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;

class SpecialChapterController extends Controller
{
    /**
     *课程章节列表
     */
    public function specialChapterList(Request $request,$id){
        $query = DB::table('coursechapter as ch');
        if($request['type'] == 1){
            $query = $query->where('ch.id','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('c.courseTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('ch.title','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){ //上传的起止时间
            $query = $query->where('ch.created_at','>=',$request['beginTime'])->where('ch.created_at','<=',$request['endTime']);
        }
        $data = $query
            ->leftJoin('course as c','ch.courseId','=','c.id')
            ->select('ch.*','c.courseTitle')
            ->where('ch.courseId',$id)
            ->orderBy('ch.id','desc')
            ->paginate(15);
        $data->type = $request['type'];
        $data->courseId = $id;
        return view('admin/specialCourse/specialChapterList',['data'=>$data]);
    }

    /**
     *课程章节状态
     */
    public function specialChapterState(Request $request){
        $data['status'] = $request['status'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('coursechapter')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *添加课程章节
     */
    public function addSpecialChapter($id){
        $data = [];
        $data['data'] = DB::table('coursechapter')->where('courseId',$id)->where('parentId',0)->get();
        if(!$data){
            $data['state'] = 0;
        }else{
            $data['state'] = 1;
        }
//        dd($data);
        return view('admin/specialCourse/addSpecialChapter',['courseid'=>$id,'data'=>$data]);
    }

    /**
     *执行添加课程章节
     */
    public function doAddSpecialChapter(Request $request){
//        dd($request->all());exit();
        if($request['selectid'] == 1){ //表示章
            $data['courseid'] = $request['courseid'];
            $data['title'] = $request['title'];
            $data['parentId'] = 0;

        }
        if($request['selectid'] == 2){ //节
            $data['courseid'] = $request['courseid'];
            $data['title'] = $request['title'];
            $data['fileID'] = $request['fileID'];
            $data['parentId'] = $request['parentId'];
            if($request['courseLowPath']){
                $data['courseLowPath'] = $request['courseLowPath'];
            }
            if($request['courseMediumPath']){
                $data['courseMediumPath'] = $request['courseMediumPath'];
            }
            if($request['courseHighPath']){
                $data['courseHighPath'] = $request['courseHighPath'];
            }
            //当三种转码格式都没有时状态值改为锁定
            if(!$request['courseLowPath'] && !$request['courseMediumPath'] && !$request['courseHighPath']){
                $data['status'] = 1;
            }
        }
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();

        if(DB::table('coursechapter')->insert($data)){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *删除章节
     */
    public function delSpecialChapter($courseid,$id){
        if(DB::table('coursechapter')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'课程章节删除成功','redirect'=>'specialCourse/specialChapterList/'.$courseid]);
        }else{
            return redirect('admin/message')->with(['status'=>'课程章节删除失败','redirect'=>'specialCourse/specialChapterList/'.$courseid]);
        }
    }

    /**
     * 表单验证
     */
    protected function validator(array $data)
    {
        $rules = [
            'parentId' => 'required',
            'title' => 'required',
            'password' => 'sometimes|required|min:6|max:16',
        ];

        $messages = [
            'parentId.required' => '请选择所属章(如没有请先添加)',
            'title.required' => '请输入标题',
        ];

        return \Validator::make($data, $rules, $messages);
    }
}
