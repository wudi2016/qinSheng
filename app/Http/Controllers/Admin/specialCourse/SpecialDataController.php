<?php

namespace App\Http\Controllers\Admin\specialCourse;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;

class SpecialDataController extends Controller
{
    /**
     *资料列表
     */
    public function dataList(Request $request,$id){
        $query = DB::table('coursedata');
        if($request['type'] == 1){
            $query = $query->where('id','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('dataName','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){ //上传的起止时间
            $query = $query->where('created_at','>=',$request['beginTime'])->where('created_at','<=',$request['endTime']);
        }
        $data = $query
            ->where('courseid',$id)
            ->orderBy('id','desc')
            ->paginate(15);
        $data->type = $request['type'];
        $data->courseId = $id;
        return view('admin/specialCourse/specialDataList',['data'=>$data]);
    }

    /**
     *课程资料状态
     */
    public function courseDataState(Request $request){
        $data['status'] = $request['status'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('coursedata')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *添加资料
     */
    public function addData($id){
        return view('admin/specialCourse/addData',['courseid'=>$id]);
    }

    /**
     *执行添加资料
     */
    public function doAddData(Request $request){
        $this->validate($request,[
            'dataName'=>'required|max:20'
        ],[
            'dataName.required'=>'请输入资料名称',
            'dataName.max'=>'资料名称长度不超过20'
        ]);
        if(!$request['dataPath']){
            return redirect()->back()->withInput()->withErrors('请上传课程资料');
        }
        $data = $request->except('_token');
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();
        if(DB::table('coursedata')->insert($data)){
            return redirect('admin/message')->with(['status'=>'课程资料添加成功','redirect'=>'specialCourse/dataList/'.$request['courseid']]);
        }else{
            return redirect()->back()->withInput()->withErrors('课程资料添加失败');
        }
    }

    /**
     * @param Request $request
     */
    public function doUploadfile(Request $request)
    {
        if($request->hasFile('Filedata')){ //判断文件是否存在
            if($request->file('Filedata')->isValid()){ //判断文件在上传过程中是否出错
                $name = $request->file('Filedata')->getClientOriginalName();//获取图片名
                $entension = $request->file('Filedata')->getClientOriginalExtension();//上传文件的后缀
                $newname = md5(date('ymdhis'.$name)).'.'.$entension;//拼接新的图片名
                if($request->file('Filedata')->move('./uploads/heads/',$newname)){
                    echo '/uploads/heads/'.$newname;
                }else{
                    echo '文件保存失败';
                }
            }else{
                echo '文件上传出错';
            }
        }
    }

    /**
     *编辑课程资料
     */
    public function editData($id){
        $data = DB::table('coursedata')->where('id',$id)->first();
        return view('admin/specialCourse/editData',['data'=>$data]);
    }

    /**
     *执行编辑
     */
    public function doEditData(Request $request){
        $this->validate($request,[
            'dataName'=>'required|max:20'
        ],[
            'dataName.required'=>'请输入资料名称',
            'dataName.max'=>'资料名称长度不超过20'
        ]);
        $data = $request->except('_token','organurl');
        $data['updated_at'] = Carbon::now();
        if($request['dataPath']){
            $data['dataPath'] = $request['dataPath'];
        }else{
            $data['dataPath'] = $request['organurl'];
        }
        if(DB::table('coursedata')->where('id',$request['id'])->update($data)){
            return redirect('admin/message')->with(['status'=>'课程资料修改成功','redirect'=>'specialCourse/dataList/'.$request['courseid']]);
        }else{
            return redirect()->back()->withInput()->withErrors('课程资料修改失败');
        }
    }

    /**
     *删除课程资料
     */
    public function delData($courseid,$id){
        if(DB::table('coursedata')->where('id',$id)->delete()){
            return redirect('admin/message')->with(['status'=>'课程章节删除成功','redirect'=>'specialCourse/dataList/'.$courseid]);
        }else{
            return redirect('admin/message')->with(['status'=>'课程章节删除失败','redirect'=>'specialCourse/dataList/'.$courseid]);
        }
    }
}
