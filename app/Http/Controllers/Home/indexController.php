<?php

namespace App\Http\Controllers\Home;

use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Http\Requests;
use Messages;
use Hash;
use DB;

class indexController extends Controller
{
    /**
     * 首页
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('home.index');
    }

    /**
     * 名师介绍接口
     *
     * @return json
     */
    public function getteachers()
    {

        $teachers = DB::table('hotteacher')
            ->leftJoin('users', 'users.id', '=', 'hotteacher.teacherId')
            ->leftJoin('teacher', 'teacher.parentId', '=', 'users.id')
            ->select('users.id as id', 'users.realname as name', 'users.company as org','teacher.cover as img','teacher.intro as info')
            ->where('users.checks',0)
            ->orderBy('hotteacher.sort', 'desc')
            ->skip(0)->take(6)
            ->get();
        
//        $teachers = [
//            [
//                'id'    =>'1',
//                'img'   => 'home/image/index/js.jpg',
//                'name'   => '吴迎',
//                'org'   => '中央音乐学院',
//                'info'   => '吴迎，男，1957年3月1日出生于上海，5岁随母亲学习钢琴1976年毕业于中央音乐学院。1979年获中国北方地区钢琴比赛第一名；1980年获全国钢琴选拔赛第一名。1982年毕业于朱工一教授的研究班，获硕士学位。',
//            ]
//        ];
        
        if($teachers){
            return response()->json(['status'=>true,'data'=>$teachers]);
        }else{
            return response()->json(['status'=>false]);
        }
    }

    /**
     * 专题课程接口
     *
     * @return json
     */
    public function getSpecialLessons()
    {
        $courses = DB::table('hotcourse')
            ->leftJoin('course', 'course.id', '=', 'hotcourse.courseId')
            ->select('course.id as id', 'course.coursePic as img', 'course.courseTitle as title','course.coursePlayView as countpeople','course.coursePrice as price')
            ->where('course.courseStatus',0)
            ->orderBy('hotcourse.sort', 'desc')
            ->skip(0)->take(8)
            ->get();

        if($courses){
            foreach ($courses as &$course){
                $course -> counttime = DB::table('coursechapter')->where('courseId',$course->id)->where('parentId','<>',0)->where('status',0)->count();
                $course -> price = ceil($course->price/1000);
            }
        }

//        $data = [
//            [
//                'id'    =>'1',
//                'img'   => 'home/image/index/3.jpg',
//                'title'   => '钢琴演奏基础教程',
//                'counttime' => '10',
//                'countpeople' => '300',
//                'price'   => '600.00',
//            ],
//        ];
        if($courses){
            return response()->json(['status'=>true,'data'=>$courses]);
        }else{
            return response()->json(['status'=>false]);
        }
    }

    /**
     * 点评课程接口
     *
     * @return json
     */
    public function getCommentlLessons()
    {
        $courses = DB::table('hotreviewcourse')
            ->leftJoin('commentcourse', 'commentcourse.id', '=', 'hotreviewcourse.courseId')
            ->select('commentcourse.id as id', 'commentcourse.coursePic as img', 'commentcourse.courseTitle as title','commentcourse.teachername as teacher','commentcourse.coursePlayView as countpeople','commentcourse.coursePrice as price')
            ->where('commentcourse.state',2)
            ->where('commentcourse.courseStatus',0)
            ->orderBy('hotreviewcourse.sort', 'desc')
            ->skip(0)->take(8)
            ->get();

        if($courses){
            foreach ($courses as &$course){
                $course -> price = ceil($course->price/1000);
            }
        }
//        $data = [
//            [
//                'id'    =>'1',
//                'img'   => 'home/image/index/2.jpg',
//                'title'   => '肖邦第三章',
//                'teacher' => '吴大海',
//                'countpeople' => '300',
//                'price'   => '600.00',
//            ]
//        ];

        if($courses){
            return response()->json(['status'=>true,'data'=>$courses]);
        }else{
            return response()->json(['status'=>false]);
        }
    }

    /**
     * 登陆
     *
     * @return \Illuminate\Http\Response
     */
    public function login()
    {
        $ignorearr = [
            'http://qinsheng2.com/index/login',
            'http://qinsheng2.com/index/register'
        ];
        if(!in_array($_SERVER['HTTP_REFERER'],$ignorearr)){
            session(['lastUrl' => $_SERVER['HTTP_REFERER']]);
        }
        return view('home.users.login');
    }

    /**
     * 登陆验证接口
     *
     * @return result
     */
    public function getCheckRes()
    {
        $uname = $_POST['username'];
        $password = $_POST['password'];

        //判断账号是否存在
        if($username = DB::table('users')->select('username')->where('username',$uname)->first()){
            $psd = DB::table('users')->select('password')->where('username',$uname)->first()->password;
            if(Hash::check($password,$psd)){
                echo 2;  //密码正确
            }else{
                echo 3;  //密码错误
            }
        }elseif($phone = DB::table('users')->select('phone')->where('phone',$uname)->first()){
            $psd = DB::table('users')->select('password')->where('phone',$uname)->first()->password;
            if(Hash::check($password,$psd)){
                echo 2;  //密码正确
            }else{
                echo 3;  //密码错误
            }
        }else{
            echo 1; //账号不存在;
        }

    }

    /**
     * 注册
     *
     * @return \Illuminate\Http\Response
     */
    public function register()
    {
        return view('home.users.register');
    }

    /**
     * 注册用户名验证接口
     *
     * @return result
     */
    public function getCheckUname()
    {
        $uname = $_POST['username'];
        if ($username = DB::table('users')->select('username')->where('username',$uname)->first()){
            echo 1;  //改用户名已被注册
        }else{
            echo 2;  //用户名可用
        }
    }

    /**
     * 注册-手机号验证接口
     *
     * @return result
     */
    public function getCheckUphone()
    {
        $uphone = $_POST['phone'];
        if ($username = DB::table('users')->select('phone')->where('phone',$uphone)->first()){
            echo 1;  //改手机号已被注册
        }else{
            echo 2;  //手机号可用
        }
    }

    /**
     * 获取手机验证码接口
     *
     * @return json
     */
    public function getMessage(Messages $message, $telephone)
    {
        $code    = $message::createCode();
        $content = '您好，感谢注册该软件，请输入手机验证码'.$code.'完成剩余操作。【琴晟教育】';
        $message::setInfo($telephone,$content);
        $result = $message::sendMsg();
        return $message::response($result,$code);
    }

    /**
     * 注册-邀请码验证接口
     *
     * @return result
     */
    public function getInviteCode($code)
    {
        if ($username = DB::table('users')->select('yaoqingma')->where('yaoqingma',$code)->first()){
            echo 1;  //改邀请码存在
        }else{
            echo 2;  //改邀请码不存在
        }
    }

    /**
     * 判断用户类型
     *
     * @return \Illuminate\Http\Response
     */
    public function judge()
    {
        if(Auth::user()->type == 0){
            return redirect('index/registsucessstu');
        }else{
            return redirect('index/registsucesstea');
        }
    }

    /**
     * 注册成功（老师）
     *
     * @return \Illuminate\Http\Response
     */
    public function registsucesstea()
    {
        return view('home.users.registsucesstea');
    }

    /**
     * 注册成功（学生）
     *
     * @return \Illuminate\Http\Response
     */
    public function registsucessstu()
    {
        return view('home.users.registsucessstu');
    }

    /**
     * 完善信息（老师）
     *
     * @return \Illuminate\Http\Response
     */
    public function infotea()
    {
        if(Auth::check()){
            //完善信息
            $id = Auth::user()->id;
            unset($_POST['_token']);
            DB::table('users')->where('id', $id)->update($_POST);
            //添加用户通知
            $cIP = getenv('REMOTE_ADDR');
            $cIP1 = getenv('HTTP_X_FORWARDED_FOR');
            $cIP2 = getenv('HTTP_CLIENT_IP');
            $cIP1 ? $cIP = $cIP1 : null;
            $cIP2 ? $cIP = $cIP2 : null;

            DB::table('usermessage')->insert(
                ['username' => Auth::user()->username, 'type' => 1,'content'=>"恭喜您成功加入点评网，您的邀请码是：".Auth::user()->yaoqingma,'client_ip'=>$cIP, 'created_at' => Carbon::now()]
            );
        }

        return redirect('/');
    }

    /**
     * 完善信息（学生）
     *
     * @return \Illuminate\Http\Response
     */
    public function infostu()
    {
        //完善信息
        if(Auth::check()){
            $id = Auth::user()->id;
            unset($_POST['_token']);
            DB::table('users')->where('id', $id)->update($_POST);
        }

        //添加用户通知
        $cIP = getenv('REMOTE_ADDR');
        $cIP1 = getenv('HTTP_X_FORWARDED_FOR');
        $cIP2 = getenv('HTTP_CLIENT_IP');
        $cIP1 ? $cIP = $cIP1 : null;
        $cIP2 ? $cIP = $cIP2 : null;

        DB::table('usermessage')->insert(
            ['username' => Auth::user()->username, 'type' => 1,'content'=>"恭喜您成功加入点评网，您的邀请码是:".Auth::user()->yaoqingma,'client_ip'=>$cIP]
        );

        return redirect('/');
    }

    /**
     * 获取省接口
     *
     * @return result
     */
    public function getProvince()
    {
        $provinces = DB::table('province')->select('code as id','name as text')->get();
        return response()->json($provinces);
    }

    /**
     * 获取市接口
     *
     * @return result
     */
    public function getCity($code)
    {
        $citys = DB::table('city')->select('code as id','name as text')->where('provincecode',$code)->get();
        return response()->json($citys);
    }

    /**
     * 找回密码
     *
     * @return \Illuminate\Http\Response
     */
    public function retrievepsd()
    {
        return view('home.users.retrievepsd');
    }

    /**
     * 重新设置密码
     *
     * @return \Illuminate\Http\Response
     */
    public function resetpsd($phone)
    {
        return view('home.users.resetpsd');
    }

    /**
     * 重新设置接口
     *
     * @return result
     */
    public function resetPassword()
    {
        $uphone = $_POST['phone'];
        $upassword = bcrypt($_POST['password']);
        if(DB::table('users')->where('phone',$uphone)->update(['password'=>$upassword])){
            echo 1;  //修改成功
        }else{
            echo 2;  //修改失败
        }

    }

    /**
     * 活动赛事
     *
     * @return \Illuminate\Http\Response
     */
    public function games()
    {
        return view('home.games.games');
    }

    /**
     * 活动赛事接口
     *
     * @return json
     */
    public function getgames($type)
    {
        $data = DB::table('activity')->select('id','path as img','title','beginTime as starttime','endTime as endtime','activityRrom as org')
            ->where('status',$type)
            ->get();
//        $data1 = [
//            [
//                'id'    =>'1',
//                'img'   => 'home/image/index/ss.png',
//                'title' => '2016年亚洲国际青少年杯邀请赛1',
//                'starttime'  => '2016-02-29 15:22:00',
//                'endtime'  => '2016-02-29 16:22:00',
//                'org'   => '中央音乐学院'
//            ]
//        ];

//        return response()->json($data);

        if($data){
            return response()->json(['status'=>true,'data'=>$data]);
        }else{
            return response()->json(['status'=>false,]);
        }
    }

    /**
     * 搜索
     *
     * @return \Illuminate\Http\Response
     */
    public function search()
    {
        $search = $_POST['search'];
        $type   = $_POST['type'];
        if($type == 'all'){
            return view('home.search.search',compact('search'));
        }elseif($type == 'course'){
            return view('home.search.searcha',compact('search'));
        }else{
            return view('home.search.searchb',compact('search'));
        }
    }


    /**
     * 搜索专题课程接口
     *
     * @return json
     */
    public function getCourseaa($search,$order = 0)
    {
        if($order == 0){
            $data = DB::table('course')
                ->select('id as id', 'coursePic as img', 'courseTitle as title','coursePlayView as countpeople','coursePrice as price')
                ->where('courseTitle','like','%'.$search.'%')
                ->where('courseStatus',0)
                ->get();
        }elseif($order == 1){
            $data = DB::table('course')
                ->select('id as id', 'coursePic as img', 'courseTitle as title','coursePlayView as countpeople','coursePrice as price')
                ->where('courseTitle','like','%'.$search.'%')
                ->where('courseStatus',0)
                ->orderBy('created_at', 'desc')
                ->get();
        }else{
            $data = DB::table('course')
                ->select('id as id', 'coursePic as img', 'courseTitle as title','coursePlayView as countpeople','coursePrice as price')
                ->where('courseTitle','like','%'.$search.'%')
                ->where('courseStatus',0)
                ->orderBy('coursePlayView', 'desc')
                ->get();
        }

        if($data){
            foreach ($data as &$course){
                $course -> counttime = DB::table('coursechapter')->where('courseId',$course->id)->where('parentId','<>',0)->where('status',0)->count();
                $course -> price = ceil($course->price/1000);

            }
        }

        if($data){
            return response()->json(['status'=>true,'data'=>$data]);
        }else{
            return response()->json(['status'=>false,]);
        }
    }

    /**
     * 搜索点评课程接口
     *
     * @return json
     */
    public function getCoursebb($search,$order = 0)
    {
        if($order == 0){
            $data = DB::table('commentcourse')
                ->select('id', 'coursePic as img', 'courseTitle as title','teachername as teacher','coursePlayView as countpeople','coursePrice as price')
                ->where('courseTitle','like','%'.$search.'%')
                ->where('state',2)
                ->where('courseStatus',0)
                ->get();
        }elseif($order == 1){
            $data = DB::table('commentcourse')
                ->select('id', 'coursePic as img', 'courseTitle as title','teachername as teacher','coursePlayView as countpeople','coursePrice as price')
                ->where('courseTitle','like','%'.$search.'%')
                ->where('state',2)
                ->where('courseStatus',0)
                ->orderBy('created_at', 'desc')
                ->get();
        }else{
            $data = DB::table('commentcourse')
                ->select('id', 'coursePic as img', 'courseTitle as title','teachername as teacher','coursePlayView as countpeople','coursePrice as price')
                ->where('courseTitle','like','%'.$search.'%')
                ->where('state',2)
                ->where('courseStatus',0)
                ->orderBy('coursePlayView', 'desc')
                ->get();
        }

        if($data){
            foreach ($data as &$course){
                $course -> price = ceil($course->price/1000);
            }
        }

        if($data){
            return response()->json(['status'=>true,'data'=>$data]);
        }else{
            return response()->json(['status'=>false,]);
        }
    }
    
}
