<?php

namespace App\Http\Controllers\Admin\commentCourse;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use DB;
use App\Http\Controllers\Home\lessonComment\Gadget;
use PaasResource;
use PaasUser;
use Cache;
use Messages;

class commentCourseController extends Controller
{
    use Gadget;
    public function __construct()
    {
        PaasUser::apply();
    }
    /**
     *演奏视频列表
     */
    public function commentCourseList(Request $request){
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
            ->where('a.courseIsDel',0)
            ->select('a.*','u.username','ut.realname as teachername','ut.phone as teacherPhone')
            ->orderBy('a.id','desc')
            ->paginate(15);
        foreach($data as &$val){
            if($val->courseLowPath){
                if(!Cache::get($val->courseLowPath)){
                    $val->courseLowPathurl = $this->getPlayUrl($val->courseLowPath);
                    Cache::put($val->courseLowPath,$val->courseLowPathurl,1800);
                }else{
                    $val->courseLowPathurl = Cache::get($val->courseLowPath);
                }
            }
        }
        $data->type = $request['type'];
//        dd($data);
        return view('admin.commentCourse.commentCourseList',['data'=>$data]);
    }

    /**
     *审核状态
     */
    public function commentState(Request $request){
        $data['state'] = $request['state'];
        $data['lastCheckTime'] = Carbon::now();
        $data = DB::table('applycourse')->where('id',$request['id'])->update($data);
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
    public function comcourseState(Request $request){
        $data['courseStatus'] = $request['courseStatus'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('applycourse')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     * 编辑演奏视频
     */
    public function editCommentCourse($id){
        $data = DB::table('applycourse as a')
            ->leftJoin('users as u','a.userId','=','u.id')
            ->leftJoin('users as ut','a.teacherId','=','ut.id')
            ->where('a.courseIsDel',0)
            ->where('a.id',$id)
            ->select('a.*','u.username','ut.realname as teachername')
            ->orderBy('a.id','desc')
            ->first();
//        dd($data);
        return view('admin.commentCourse.editCommentCourse',['data'=>$data]);
    }

    /**
     *执行编辑
     */
    public function doEditCommentCourse(Request $request){
        $validator = $this -> validator($request->all());
        if ($validator -> fails()){
            return Redirect()->back()->withInput()->withErrors($validator);
        }
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
        if(DB::table('applycourse')->where('id',$request['id'])->update($data)){
            return redirect('admin/message')->with(['status'=>'演奏视频修改成功','redirect'=>'commentCourse/commentCourseList']);
        }else{
            return redirect()->back()->withInput()->withErrors('演奏视频修改失败');
        }
    }

    /**
     * 删除演奏视频
     */
    public function delCommentCourse($id){
        $data = DB::table('applycourse')->where('id',$id)->update(['courseIsDel'=>1]);
        if($data){
            return redirect('admin/message')->with(['status'=>'演奏视频删除成功','redirect'=>'commentCourse/commentCourseList']);
        }else{
            return redirect('admin/message')->with(['status'=>'演奏视频删除失败','redirect'=>'commentCourse/commentCourseList']);
        }
    }

    /**
     *审核未通过时向学员发送信息
     */
    public function noPassMsg(Request $request){
        $data['username'] = $request['username'];
        $data['actionId'] = $request['actionId'];
        $data['fromUsername'] = $request['fromUsername'];
        $data['toUsername'] = $request['toUsername'];
        $data['content'] = $request['content'];
        $data['type'] = 0;
        $data['client_ip'] = $_SERVER['REMOTE_ADDR'];
        $data['created_at'] = Carbon::now();
        $data = DB::table('usermessage')->insert($data);
        return back();
    }

    /**
     *视频详情
     */
    public function detailCommentCourse($id){
        $data = [];
        $info = DB::table('applycourse as a')
            ->leftJoin('users as u','a.userId','=','u.id')
            ->leftJoin('users as ut','a.teacherId','=','ut.id')
            ->where('a.courseIsDel',0)
            ->where('a.id',$id)
            ->select('a.*','u.username','u.phone','ut.realname as teachername','ut.phone as teacherphone')
            ->orderBy('a.id','desc')
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
     * 表单验证
     */
    protected function validator(array $data){
        $rules = [
            'courseView' => 'integer',
            'coursePlayView' => 'integer',
            'courseFav' => 'integer',

        ];

        $messages = [
            'courseView.integer' => '浏览数必须是整型',
            'coursePlayView.integer' => '观看数必须是整型',
            'courseFav.integer' => '收藏数必须是整型',
        ];

        return \Validator::make($data, $rules, $messages);
    }

    /**
     * 给名师发送短信提示
     */
    public function sendMessage(Messages $message, $telephone)
    {
        $code = '';
        $content = '老师您好,您现有一个新的点评辅导申请,请及时查看【琴晟教育】';
        $message::setInfo($telephone,$content);
        $result = $message::sendMsg();
        return $message::response($result,$code);
    }
}
