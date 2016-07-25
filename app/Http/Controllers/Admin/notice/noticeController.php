<?php

namespace App\Http\Controllers\Admin\notice;

use DB;
use Auth;
use Carbon\Carbon;
use App\Http\Requests;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class noticeController extends Controller
{
    // 通知列表
    public function noticeList(Request $request)
    {
        $query = DB::table('usermessage as m');
        if($request['type'] == 1){
            $query = $query->where('m.id','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('m.tempId',0);
        }
        if($request['type'] == 3){
            $query = $query->where('m.tempId','<>',0);
        }
        if($request['type'] == 4){
            $query = $query->where('m.username','like','%'.trim($request['search']).'%');
        }
        $data = $query->leftJoin('usermessagetem as t','m.tempId','=','t.id')->select('m.*','t.tempName')->orderBy('m.id', 'desc')->paginate(15);
        return view('admin.notice.noticeList', ['data' => $data]);
    }

    // 添加通知模板
    public function addNotice()
    {
        $studentTem = DB::table('usermessagetem')->select('id','tempName')->where('type','0')->get();
        $teacherTem = DB::table('usermessagetem')->select('id','tempName')->where('type','1')->get();
        $student = DB::table('users')->select('id','username')->where('type','0')->get();
        $teacher = DB::table('users')->select('id','username')->where('type','1')->get();
        $famous = DB::table('users')->select('id','username')->where('type','2')->get();
        return view('admin.notice.addNotice',['student' => $student, 'teacher' => $teacher, 'famous' => $famous,'studentTem' => $studentTem, 'teacherTem' => $teacherTem]);
    }

    // 执行添加
    public function doAddNotice(Request $request)
    {
        $this->validate($request, [
            'pointAt' => 'required',
            'username' => 'required',
            'tempId' => 'required',
            'content' => 'required'
        ], [
            'type.required' => '请选择针对对象',
            'username.required' => '请选择接收消息的用户',
            'tempId.required' => '请选择模板名称',
            'content.required' => '请输入通知内容'
        ]);
        $username = $request->username;
        $data = $request->except('_token','pointAt','username');
        $data['fromUsername'] = Auth::user()->username;
        $data['created_at'] = Carbon::now();
        $data['client_ip'] = $_SERVER['REMOTE_ADDR'];
        $data['type'] = '0';
        if(count($username) == '1'){
            $data['username'] = $username['0'];
            $result = DB::table('usermessage')->insert($data);
        }else{
            foreach($username as $value){
                $data['username'] = $value;
                $result = DB::table('usermessage')->insert($data);
            }
        }
        if ($result) {
            return redirect('admin/message')->with(['status' => '用户通知发送成功', 'redirect' => 'notice/noticeList']);
        } else {
            return redirect('admin/message')->with(['status' => '用户通知发送失败', 'redirect' => 'notice/noticeList']);
        }
    }

    // 执行删除
    public function delNotice($id)
    {
        if (DB::table('usermessage')->delete($id)) {
            return redirect('admin/message')->with(['status' => '通知消息删除成功', 'redirect' => 'notice/noticeList']);
        } else {
            return redirect('admin/message')->with(['status' => '通知消息删除失败', 'redirect' => 'notice/noticeList']);
        }
    }

    // 通知修改页
    public function editNotice($id)
    {
        $data = DB::table('usermessage as u')->leftJoin('usermessagetem as t','u.tempId','=','t.id')->select('u.*','t.tempName')->where('u.id', $id)->first();
        return view('admin/notice/editNotice', ['data' => $data]);
    }

    // 执行修改
    public function doEditNotice(Request $request)
    {
        $this->validate($request, [
            'content' => 'required'
        ], [
            'content.required' => '请输入通知内容'
        ]);
        $data = $request->except('_token');
        if (DB::table('usermessage')->where('id', $request['id'])->update($data)) {
            return redirect('admin/message')->with(['status' => '通知消息编辑成功', 'redirect' => 'notice/noticeList']);
        } else {
            return redirect('admin/message')->with(['status' => '通知消息编辑失败', 'redirect' => 'notice/noticeList']);
        }
    }

    // 通知模板列表
    public function noticeTemList()
    {
        $data = DB::table('usermessagetem')->orderBy('id', 'desc')->paginate(15);
        return view('admin.notice.noticeTemList', ['data' => $data]);
    }

    // 添加通知模板
    public function addNoticeTem()
    {
        return view('admin.notice.addNoticeTem');
    }

    // 执行添加
    public function doAddNoticeTem(Request $request)
    {
        $this->validate($request, [
            'type' => 'required',
            'tempName' => 'required'
        ], [
            'type.required' => '请选择针对对象',
            'tempName.required' => '请输入模板名称'
        ]);
        $data = $request->except('_token');
        if (DB::table('usermessagetem')->insert($data)) {
            return redirect('admin/message')->with(['status' => '模板名称添加成功', 'redirect' => 'notice/noticeTemList']);
        } else {
            return redirect('admin/message')->with(['status' => '模板名称添加失败', 'redirect' => 'notice/noticeTemList']);
        }
    }

    // 执行删除
    public function delNoticeTem($id)
    {
        if (DB::table('usermessagetem')->delete($id)) {
            return redirect('admin/message')->with(['status' => '模板名称删除成功', 'redirect' => 'notice/noticeTemList']);
        } else {
            return redirect('admin/message')->with(['status' => '模板名称删除失败', 'redirect' => 'notice/noticeTemList']);
        }
    }

    // 模板修改页
    public function editNoticeTem($id)
    {
        $data = DB::table('usermessagetem')->where('id', $id)->first();
        return view('admin/notice/editNoticeTem', ['data' => $data]);
    }

    // 执行修改
    public function doEditNoticeTem(Request $request)
    {
        $this->validate($request, [
            'type' => 'required',
            'tempName' => 'required'
        ], [
            'type.required' => '请选择针对对象',
            'tempName.required' => '请输入模板名称'
        ]);
        $data = $request->except('_token');
        if (DB::table('usermessagetem')->where('id', $request['id'])->update($data)) {
            return redirect('admin/message')->with(['status' => '模板名称编辑成功', 'redirect' => 'notice/noticeTemList']);
        } else {
            return redirect('admin/message')->with(['status' => '模板名称编辑失败', 'redirect' => 'notice/noticeTemList']);
        }
    }
}