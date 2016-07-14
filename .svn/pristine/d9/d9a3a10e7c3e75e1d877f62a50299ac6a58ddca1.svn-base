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
//        dd($request->all());
        $validator = $this -> validator($request->all());
        if ($validator -> fails()){
            return Redirect()->back()->withInput()->withErrors($validator);
        }
       $data = $request->except('_token');
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();
        dd($data);
    }

    /**
     *删除章节
     */
    public function delSpecialChapter($id){
        if(DB::table('coursechapter')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'课程章节删除成功','redirect'=>'specialCourse/specialChapterList']);
        }else{
            return redirect('admin/message')->with(['status'=>'课程章节删除失败','redirect'=>'specialCourse/specialChapterList']);
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
