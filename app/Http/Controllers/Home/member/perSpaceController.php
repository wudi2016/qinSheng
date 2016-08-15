<?php

namespace App\Http\Controllers\Home\member;

use Carbon\Carbon;
use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use Symfony\Component\HttpFoundation\Response;
use App\Http\Controllers\Home\lessonComment\Gadget;
use Illuminate\Support\Facades\Auth;
use Hash;
use DB;

class perSpaceController extends Controller
{
    use Gadget;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index($typeID)
    {
        //0学生学员   &&   １教师学员
        if (Auth::check() && Auth::user()->type != 3) {
            $mineUsername = Auth::user()->username;
            $mineUserId = Auth::user()->id;
            $data = DB::table('users')
                ->select('username', 'realname', 'sex', 'phone', 'birthYear', 'birthMonth', 'birthDay', 'pianoGrade', 'learnYear', 'learnMonth', 'provinceId', 'cityId', 'company', 'school', 'education', 'professional', 'yaoqingma')
                ->where('id', $mineUserId)
                ->first();
            if ($data->provinceId) {
                $data->provinceName = DB::table('province')->select('name')->where('code', $data->provinceId)->first()->name;
            }
            if ($data->cityId) {
                $data->cityName = DB::table('city')->select('name')->where('code', $data->cityId)->first()->name;
            }
            return view('home.member.student.teacherStudent', compact('typeID', 'data','mineUsername','mineUserId'));
        } else {
            return redirect('/');
        }
    }

    public function famousTeacher()
    {
        //名师个人中心主页
        if (Auth::check() && Auth::user()->type != 3) {
            $id = Auth::user()->id;
            $mineUsername = Auth::user()->username;
            $mineUserId = Auth::user()->id;
            $data = DB::table('users')
                ->select('username', 'realname', 'sex', 'phone','provinceId', 'cityId', 'company','education', 'professional')
                ->where('id', $id)
                ->first();

            if($tea = DB::table('teacher')->select('intro')->where('parentId', $id)->first()){
                $data->intro = $tea -> intro;
            }else{
                $data->intro = '';
            }

            if ($data->provinceId) {
                $data->provinceName = DB::table('province')->select('name')->where('code', $data->provinceId)->first()->name;
            }
            if ($data->cityId) {
                $data->cityName = DB::table('city')->select('name')->where('code', $data->cityId)->first()->name;
            }
            return view('home.member.famousTeacher.famousTeacher',compact('mineUsername','data','mineUserId'));
        } else {
            return redirect('/');
        }
    }

    //编辑个人信息
    public function editInfo()
    {
        $data = array_filter($_POST);
        unset($data['_token']);
        $id = Auth::user()->id;
        if (FALSE !== DB::table('users')->where('id', $id)->update($data)) {
            return back()->with('right', ' 修改成功!');
        } else {
            return back()->with('wrong', ' 修改失败!');
        }
    }
    public function editInfotea()
    {
        $intro = $_POST['intro'];
        unset($_POST['intro']);
        $data = array_filter($_POST);
        unset($data['_token']);
        $id = Auth::user()->id;

        if(mb_strlen($intro,'utf-8') > 200){
            return back()->with('wrong', ' 个人简介字数过多!');
        }

        if (FALSE !== DB::table('users')->where('id', $id)->update($data) && FALSE !== DB::table('teacher')->where('parentId', $id)->update(['intro'=>$intro])) {
            return back()->with('right', ' 修改成功!');
        } else {
            return back()->with('wrong', ' 修改失败!');
        }
    }


    //修改密码
    public function editPassword()
    {
        $id = Auth::user()->id;
        $password = bcrypt($_POST['password']);
        if ($aa = DB::table('users')->where('id', $id)->update(['password' => $password])) {
            return back()->with('right', ' 密码修改成功!');
        } else {
            return back()->with('wrong', ' 密码修改失败!');
        }
    }

    //检查密码接口
    public function checkPassword()
    {
        $id = Auth::user()->id;
        $password = $_POST['password'];
        $psd = DB::table('users')->select('password')->where('id', $id)->first()->password;
        if (Hash::check($password, $psd)) {
            echo 1;  //密码正确
        } else {
            echo 2;  //密码错误
        }
    }

    //修改手机号接口
    public function changePhone(){
        $id = Auth::user()->id;
        $phone = $_POST['phone'];
        if($aa = DB::table('users')->where('id', $id)->update(['phone'=>$phone])){
            echo 1; //修改成功
        }else{
            echo 2; //修改失败
        }
    }
    
    //我的关注
    public function myFocus($pageNumber, $pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $myFocus = \DB::table('friends as f')
            ->join('users as u', 'f.toUserId', '=', 'u.id')
            ->select('u.id', 'u.username', 'u.pic', 'u.type')
            ->where('f.fromUserId', \Auth::check() ? \Auth::user()->id : 0)
            ->where('u.checks',0)
            ->orderBy('u.type', 'desc')
            ->skip($skip)
            ->take($pageSize)
            ->get();
        $count = \DB::table('friends as f')
            ->join('users as u', 'f.toUserId', '=', 'u.id')
            ->select('u.id', 'u.username', 'u.pic', 'u.type')
            ->where('f.fromUserId', \Auth::check() ? \Auth::user()->id : 0)
            ->where('u.checks',0)
            ->count();
        if ($myFocus) {
            return response()->json(['data' => $myFocus, 'total' => $count, 'type' => true]);
        } else {
            return response()->json(['total' => $count, 'type' => false]);
        }
    }

    //我的粉丝$myFans  && 我的好友$myFriends
    public function myFriends($pageNumber, $pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $myFriends = \DB::table('friends as f')
            ->join('users as u', 'f.fromUserId', '=', 'u.id')
            ->select('u.id', 'u.username', 'u.pic', 'u.type')
            ->where('f.toUserId', \Auth::check() ? \Auth::user()->id : 0)
            ->where('u.checks',0)
            ->orderBy('u.type', 'desc')
            ->skip($skip)
            ->take($pageSize)
            ->get();

        $count = \DB::table('friends as f')
            ->join('users as u', 'f.fromUserId', '=', 'u.id')
            ->select('u.id', 'u.username', 'u.pic', 'u.type')
            ->where('f.toUserId', \Auth::check() ? \Auth::user()->id : 0)
            ->where('u.checks',0)
            ->count();
        if ($myFriends) {
            return response()->json(['data' => $myFriends, 'total' => $count, 'type' => true]);
        } else {
            return response()->json(['total' => $count, 'type' => false]);
        }
    }


    // 个人中心我的专题课程
    public function getCourse($type, $flag, $pageNumber, $pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $id = Auth::user()->id;
        if ($type == '1') { // 学员
            $flag == '1' ? $order = 'o.created_at' : $order = 'c.courseStudyNum';
//            $info = DB::table('course as c')->leftJoin('orders as o', 'c.id', '=', 'o.courseId')
//                ->select('c.id', 'c.courseTitle', 'c.coursePic', 'coursePrice', 'c.coursePlayView', 'c.courseDiscount','c.created_at','c.courseStudyNum','c.completecount')
//                ->where(['o.userId' => Auth::user()->id, 'o.orderType' => 0, 'c.courseStatus' => 0,'o.isDelete' => 0,'o.status' => 2])
//                ->orderBy($order, 'desc')->skip($skip)->take($pageSize)->get();
            $info = DB::select("SELECT c.id,c.courseTitle,c.coursePic,c.courseDiscount,c.coursePrice,c.courseStudyNum + c.completecount AS coursePlayView FROM course AS c LEFT JOIN orders AS o ON c.id = o.courseId WHERE c.courseStatus = 0 AND c.courseIsDel = 0 AND  o.userId = $id AND o.orderType = 0 AND o.isDelete = 0 AND o.status = 2 ORDER BY $order DESC limit $skip,$pageSize");
            $count = DB::table('course as c')->leftJoin('orders as o', 'c.id', '=', 'o.courseId')->select('c.id')
                ->where(['o.userId' => Auth::user()->id, 'o.orderType' => 0, 'c.courseStatus' => 0,'o.isDelete' => 0,'o.status' => 2])->count();
        } else { // 名师
            $flag == '1' ? $order = 'created_at' : $order = 'courseStudyNum';
            $info = DB::select("SELECT id,courseTitle,coursePic,courseDiscount,coursePrice,courseStudyNum + completecount AS coursePlayView FROM course WHERE teacherId = $id AND courseStatus = 0 AND courseIsDel = 0 ORDER BY $order DESC limit $skip,$pageSize");
//            $info = DB::table('course')->select('id', 'courseTitle', 'coursePic', 'coursePrice', 'coursePlayView','courseDiscount','created_at','courseStudyNum','completecount')
//                ->where(['teacherId' => Auth::user()->id, 'courseStatus' => '0'])->orderBy($order, 'desc')->skip($skip)->take($pageSize)->get();
            $count = DB::table('course')->select('id')->where(['teacherId' => Auth::user()->id, 'courseStatus' => '0'])->count();
        }
        if($info){
            foreach ($info as $key => $value) {
                if($info[$key]->courseDiscount){
                    $info[$key]->coursePrice = ceil(($value->courseDiscount/10000)*$value->coursePrice/100);
                }else{
                    $info[$key]->coursePrice = ceil($value->coursePrice/100);
                }
                $info[$key]->classHour = DB::table('coursechapter')->where(['courseId' => $value->id, 'status' => 0])->where('parentId', '<>', '0')->count();
//                $info[$key]->coursePlayView = $value->courseStudyNum + $value->completecount;
            }
            return response()->json(['status' => true, 'data' => $info, 'total' => $count]);
        }else{
            return response()->json(['status' => false,'total' => $count]);
        }
    }

    // 个人中心我的点评课程
    public function getCommentCourse(Request $request,$pageNumber,$pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $id = $request->userId;
        $info = DB::table('orders')->select('orderSn', 'orderType','status','courseId as OCourseId','userName as OUserName','teacherName as OTeacherName','isDelete','created_at')
            ->where('userId',$id)->whereIn('status',[1,2])->whereIn('orderType',[1,2])->where('isDelete',0)->orderBy('created_at','desc')
            ->skip($skip)->take($pageSize)->get();
        $count = DB::table('orders')->where('userId',$id)->whereIn('status',[1,2])->whereIn('orderType',[1,2])->where('isDelete',0)->count();
        if($info){
            foreach($info as $key => $value){
                if($value->orderType == 1){
                    if($value->status == 1){
                        $data1 = DB::table('applycourse')->select('id','courseTitle','courseStatus','courseIsDel','state','created_at')->where('orderSn',$value->orderSn)->first();
                        $info[$key] -> AId = $data1->id;
                        $info[$key] -> ATitle = $data1->courseTitle;
                        $info[$key] -> courseStatus = $data1->courseStatus;
                        $info[$key] -> courseIsDel = $data1->courseIsDel;
                        $info[$key] -> AState = $data1->state;
                        $info[$key] -> ACreated = $data1->created_at;
                        $result = DB::table('usermessage')->where(['actionId' => $data1->id,'username' => Auth::user()->username, 'type' => 0])->first();
                        $info[$key]->messageID = $result ? $result->id : '';
                    }else{
                        $data2 = DB::table('commentcourse')->select('courseTitle','coursePic','state','courseStatus','courseIsDel','coursePlayView','coursePrice')->where('id',$value->OCourseId)->first();
                        $info[$key] -> CTitle = $data2->courseTitle;
                        $info[$key] -> CPic = $data2->coursePic;
                        $info[$key] -> CState = $data2->state;
                        $info[$key] -> courseStatus = $data2->courseStatus;
                        $info[$key] -> courseIsDel = $data2->courseIsDel;
                        $info[$key] -> CPlayView = $data2->coursePlayView;
                        $info[$key] -> CPrice = ceil($data2->coursePrice/100);
                    }
                }else{
                    $data = DB::table('commentcourse')->select('courseTitle','coursePic','state','courseStatus','courseIsDel','coursePlayView','coursePrice')->where('id',$value->OCourseId)->first();
                    $info[$key] -> CTitle = $data->courseTitle;
                    $info[$key] -> CPic = $data->coursePic;
                    $info[$key] -> CState = $data->state;
                    $info[$key] -> courseStatus = $data->courseStatus;
                    $info[$key] -> courseIsDel = $data->courseIsDel;
                    $info[$key] -> CPlayView = $data->coursePlayView;
                    $info[$key] -> CPrice = ceil($data->coursePrice/100);
                }
            }
            return response()->json(['status' => true, 'data' => $info, 'total' => $count]);
        }else{
            return response()->json(['status' => false, 'total' => $count]);
        }
    }

    // 个人中心我的收藏
    public function getCollectionInfo($pageNumber, $pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $course = [];
        $info = DB::table('collection')->select('id','courseId', 'type')->where('userId', Auth::user()->id)->orderBy('created_at', 'desc')
            ->skip($skip)->take($pageSize)->get();
        $count = DB::table('collection')->select('id','courseId', 'type')->where('userId', Auth::user()->id)->count();
        if ($info) {
            foreach ($info as $key => $value) {
                if ($value->type == 0) { // 收藏课程为专题课程
                    $course[$key] = DB::table('course')->select('id', 'courseTitle', 'coursePic', 'coursePlayView', 'coursePrice', 'courseDiscount','courseStudyNum')->where('id', $value->courseId)->first();

                    if($course[$key]->courseDiscount){
                        $course[$key]->coursePrice = ceil(($course[$key]->courseDiscount/10000)*$course[$key]->coursePrice/100);
                    }else{
                        $course[$key]->coursePrice = ceil($course[$key]->coursePrice/100);
                    }
                    $course[$key]->classHour = DB::table('coursechapter')->where(['courseId' => $course[$key]->id, 'status' => 0])->where('parentId', '<>', '0')->count();
                    $course[$key]->isCourse = 0;
                    $course[$key]->href = '/lessonSubject/detail/' . $course[$key]->id;
                    $course[$key]->collectId = $value->id;
                    $course[$key]->coursePlayView = $course[$key]->courseStudyNum;
                } else if($value->type == '1'){ // 收藏课程为点评课程
                    $course[$key] = DB::table('commentcourse')->select('id', 'courseTitle', 'coursePic', 'coursePlayView', 'coursePrice', 'teachername')->where('id', $value->courseId)->first();
                    $course[$key]->coursePrice = ceil($course[$key]->coursePrice / 100);
                    $course[$key]->isCourse = 1;
                    $course[$key]->href = '/lessonComment/detail/' . $course[$key]->id;
                    $course[$key]->collectId = $value->id;
                }
            }
            return response()->json(['data' => $course, 'total' => $count, 'status' => true]);
        } else {
            return response()->json(['total' => $count, 'status' => false]);
        }
    }

    // 删除我的收藏课程
    public function deleteCollection(Request $request)
    {
        $input = $request->all();
        if (DB::table('collection')->where('id',$input['id'])->delete()) {
            if ($input['type'] == '0') {
                if (DB::table('course')->where('id', $input['courseId'])->decrement('courseFav', '1')) {
                    return response()->json(['status' => true]);
                } else {
                    return response()->json(['status' => false]);
                }
            } else {
                if (DB::table('commentcourse')->where('id', $input['courseId'])->decrement('courseFav', '1')) {
                    return response()->json(['status' => true]);
                } else {
                    return response()->json(['status' => false]);
                }
            }
        }
    }

    // 获取全部通知
    public function getNoticeInfo(Request $request, $pageNumber, $pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $info = DB::table('usermessage as u')->leftJoin('usermessagetem as t','u.tempId','=','t.id')->select('u.*','t.tempName')->where('u.username',$request->username)
            ->whereNotIn('u.type',[5,6])->orderBy('created_at','desc')->skip($skip)->take($pageSize)->get();
        $count = DB::table('usermessage as u')->leftJoin('usermessagetem as t','u.tempId','=','t.id')->select('u.*','t.tempName')->where('u.username',$request->username)
            ->whereNotIn('u.type',[5,6])->count();
        if($info) {
            foreach ($info as $key => $value) {
                $info[$key]->created_at ? $info[$key]->created_at = explode(' ',$info[$key]->created_at)[0] : '';
                if ($value->type == '3') {
                    $result = DB::table('users')->where('id', $value->actionId)->select('type')->first();
                    $info[$key]->userType = $result ? $result->type : false;
                }
            }
            return response()->json(['data' => $info, 'status' => true,'count' => $count]);
        }else{
            return response()->json(['status' => false,'count' => $count]);
        }
    }
    // 删除通知消息
    public function deleteNotice(Request $request)
    {
        $result = DB::table('usermessage')->delete($request->id);
        if($result){
            return response()->json(['status' => true]);
        }else{
            return response()->json(['status' => false]);
        }
    }
    // 通知消息更改状态
    public function changeNoticeStatus($type)
    {
        $isRead['isRead'] = 1;
        if(!Auth::check()) return response()->json(['status' => false]);
        if($type == 0){
            $result = DB::table('usermessage')->where(['username' => Auth::user()->username])->whereNotIn('type',[5,6])->update($isRead);
        }else{
            $result = DB::table('usermessage')->where(['username' => Auth::user()->username])->whereIn('type',[5,6])->update($isRead);
        }
        if($result){
            return response()->json(['status' => true]);
        }else{
            return response()->json(['status' => false]);
        }
    }

    // 通知消息更改状态
    public function findHaveNotice(Request $request)
    {
        $result1 = DB::table('usermessage')->where(['username' => $request->username, 'isRead' => 0])->whereNotIn('type',[5,6])->get(); // 通知消息
        $result2 = DB::table('usermessage')->where(['username' => $request->username, 'isRead' => 0])->whereIn('type',[5,6])->get(); // 评论回复消息
        if($result1 && $result2) return response()->json(['status' => 1]);// 通知消息 评论回复消息
        if($result1 && !$result2) return response()->json(['status' => 2]);// 通知消息
        if(!$result1 && $result2) return response()->json(['status' => 3]);// 评论回复消息
        if(!$result1 && !$result2) return response()->json(['status' => 4]);// 评论回复消息
    }
    // 获取评论回复
    public function getCommentInfo(Request $request, $pageNumber, $pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $info = DB::table('usermessage')->Where(['toUsername' => $request->username])->whereIn('type',[5,6])->orderBy('created_at','desc')->skip($skip)->take($pageSize)->get();
        $count = DB::table('usermessage')->Where(['toUsername' => $request->username])->whereIn('type',[5,6])->orderBy('created_at','desc')->count();
        if($info){
            foreach($info as $key => $value){
                $info[$key]->created_at ? $info[$key]->created_at = explode(' ',$info[$key]->created_at)[0] : '';
                $info[$key] -> content = '"'.$value->content.'"';
            }
            return response()->json(['data' => $info, 'status' => true, 'count' => $count]);
        }else{
            return response()->json(['status' => false, 'count' => $count]);
        }
    }
    // 删除评论消息
    public function deleteComment(Request $request)
    {
        $result = DB::table('usermessage')->delete($request->id);
        if($result){
            return response()->json(['status' => true]);
        }else{
            return response()->json(['status' => false]);
        }
    }

    // 上传头像接口
    public function addImg(Request $request)
    {
        //获取文件后缀名
        $ext = strrchr($_FILES['Filedata']['name'], '.');

        if ($request->hasFile('Filedata')) {
            if ($request->file('Filedata')->isValid()) {
                $newname = time() . $ext;
                if ($request->file('Filedata')->move('./uploads/temporary/', $newname)) {

                    $a = $this->suofang('/uploads/temporary/' . $newname, 480, 330);
                    $arr = [
                        "src" => $a,
                        "width" => getimagesize(realpath(base_path('public')) . $a)[0],
                        "height" => getimagesize(realpath(base_path('public')) . $a)[1],
                    ];

                    if (file_exists(realpath(base_path('public')) . '/uploads/temporary/' . $newname)) {
                        unlink(realpath(base_path('public')) . '/uploads/temporary/' . $newname);
                    }

                    return response()->json($arr);

                }
            }
        } else {
            echo 0;  //没有文件上传
        }
    }

    //保存裁剪 接口
    public function cutImg()
    {
        $headImgSrc = $this->cut($_POST['imgsrc'], $_POST['x'], $_POST['y'], $_POST['w'], $_POST['h']);
        if (file_exists(realpath(base_path('public')) . $_POST['imgsrc'])) {
            unlink(realpath(base_path('public')) . $_POST['imgsrc']);
        }

        if (Auth::check()) {
            $id = Auth::user()->id;
            $pic = Auth::user()->pic;

            if (DB::table('users')->where('id', $id)->update(['pic' => $headImgSrc])) {
                if ($pic != '/home/image/layout/default.png') {
                    if (file_exists(realpath(base_path('public')) . $pic)) {
                        unlink(realpath(base_path('public')) . $pic);
                    }
                }
                echo 1; //修改成功
            } else {
                echo 2; //修改失败
            }
        }

    }

    public function trimImg()
    {
        $headImgSrc = $this->cut($_POST['imgsrc'], $_POST['x'], $_POST['y'], $_POST['w'], $_POST['h']);
        if (file_exists(realpath(base_path('public')) . $_POST['imgsrc'])) {
            unlink(realpath(base_path('public')) . $_POST['imgsrc']);
        }
        return Response()->json($headImgSrc);
    }


    /*
     * @param $path 图片url
     * @param $width 目标图宽
     * @param $height 目标图高
     */
    function suofang($path, $width, $height)
    {
        $name = '/uploads/temporary/suofang' . time() . ".png";
        $src = $this->getimagetype($path);

        if ($src['width'] < $width && $src['height'] < $height) {
            copy(realpath(base_path('public')) . $path, realpath(base_path('public')) . $name);
            return $name;
        }


        if ($src['width'] > $src['height']) {
            $height = $src['height'] * ($width / $src['width']);
        } else {
            $width = $src['width'] * ($height / $src['height']);
        }

        $des = imagecreatetruecolor($width, $height);

        imagecopyresampled($des, $src['res'], 0, 0, 0, 0, $width, $height, $src['width'], $src['height']);

        imagepng($des, realpath(base_path('public')) . $name);


        imagedestroy($src['res']);
        imagedestroy($des);

        return $name;

    }

    /*
     * @param $path 图片url
     * @param $x 原图x坐标
     * @param $y 原图y坐标
     * @param $w 原图宽
     * @param $h 原图高
     */
    function cut($path, $x, $y, $w, $h)
    {
        $name = '/uploads/heads/cut' . time() . ".png";
        $src = $this->getimagetype($path);

        $des = imagecreatetruecolor(100, 100);

        imagecopyresampled($des, $src['res'], 0, 0, $x, $y, 100, 100, $w, $h);

        imagepng($des, realpath(base_path('public')) . $name);


        imagedestroy($src['res']);
        imagedestroy($des);

        return $name;

    }

    function getimagetype($path)
    {
        $path = realpath(base_path('public')) . $path;
        $imgarr = getimagesize($path);
        switch ($imgarr['mime']) {
            case 'image/jpeg':
            case 'image/jpg':
            case 'image/pjpeg':
                $img = imagecreatefromjpeg($path);
                break;
            case 'image/png':
                $img = imagecreatefrompng($path);
                break;
            case 'image/gif':
                $img = imagecreatefromgif($path);
                break;
        }
        $info['res'] = $img;
        $info['width'] = $imgarr[0];
        $info['height'] = $imgarr[1];
        return $info;
    }


    //学员 --我的订单
    public function myOrders($pageNumber, $pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $id = \Auth::user()->id;
        $data = \DB::table('orders as o')
            ->leftJoin('users as u','u.id','=','o.teacherId')
            ->select('o.id','o.userId','o.orderSn','o.userName','o.orderTitle','o.orderPrice','o.payPrice','o.orderType','o.courseId','o.status','o.payTime','u.realname','u.username')
            ->where(['o.userId'=>$id,'o.isDelete'=>0])
            ->where('o.status','<>',5)
            ->orderBy('o.id','desc')
            ->skip($skip)
            ->take($pageSize)
            ->get();
        $count = \DB::table('orders as o')
            ->leftJoin('users as u','u.id','=','o.teacherId')
            ->select('o.id','o.userId','o.orderSn','o.userName','o.orderTitle','o.orderPrice','o.payPrice','o.orderType','o.courseId','o.status','o.payTime','u.realname','u.username')
            ->where(['o.userId'=>$id,'o.isDelete'=>0])
            ->where('o.status','<>',5)
            ->count();

        $seven = Carbon::now()->subDays(7);
        if($data){
            foreach($data as $key=>$value){
                $data[$key]->orderPrice = $value->orderPrice/100;
                $data[$key]->payPrice = $value->payPrice/100;
                $data[$key]->realname || $data[$key]->realname = $data[$key]->username;
                //0是超过七天，1是不超过7天
                $data[$key]->seven = $seven <= $data[$key]->payTime ? 1 : 0;

                if(\DB::table('refund')->where('orderSn', $data[$key]->orderSn)->first()){
                    $data[$key]->isRefund = 1;
                }else{
                    $data[$key]->isRefund = 0;
                }

                //订单对应可退金额
                if($data[$key]->orderType == 0 && $data[$key]->status == 2){
                    //首先查到该课程所有付费章节总数
                    $total = \DB::table('coursechapter')->where(['courseId' =>$data[$key]->courseId ?: 0,'status'=>0, 'isTrylearn' => 0])->where('parentId', '<>', 0)->count() ?: 1;
                    $chapter = \DB::table('courseview as view')
                        ->join('coursechapter as chapter','chapter.id','=','view.chapterId')
                        ->where(['view.userId' => $data[$key]->userId, 'view.courseId' => $data[$key]->courseId ?: 0, 'view.courseType' => 0])
                        ->where('chapter.isTrylearn','=',0)
                        ->count();
                    $chapter || $chapter = 0;
                    //退款金额= 未学章节数/总的付费章节数*学员支付价格
                    $data[$key]->price = (is_integer(($total - $chapter) / $total * $data[$key]->payPrice)
                        ? ($total - $chapter) / $total * $data[$key]->payPrice : round(($total - $chapter) / $total * $data[$key]->payPrice,2)) ?: 0;
                }else if($data[$key]->orderType == 2 && $data[$key]->status == 2){//购买别人点评课程
                    $chapter = \DB::table('courseview as view')->join('coursechapter as chapter','chapter.id','=','view.chapterId')->where(['view.userId' =>  $data[$key]->userId, 'view.courseId' =>  $data[$key]->courseId ?: 0, 'view.courseType' => 1])->count();
                    $data[$key]->price = $chapter ? 0 : $data[$key]->payPrice;
                }

            }

//              dd($data);

            return response()->json(['data'=>$data,'total'=>$count,'type'=>true]);

        }else{
            return response()->json(['type'=>false,'total'=>$count]);
        }
    }



    //我的订单 -- 申请退款页面数据接口
//
//    public function applyRefund(Request $request)
//    {
//        //首先查到该课程所有付费章节总数
//        $total = \DB::table('coursechapter')->where(['courseId' =>$request['courseId'],'status'=>0, 'isTrylearn' => 0])->where('parentId', '<>', 0)->count() ?: 1;
//        //该用户看过的章节数
//        $chapter = \DB::table('courseview as view')
//            ->join('coursechapter as chapter','chapter.id','=','view.chapterId')
//            ->where(['view.userId' => $request['userId'], 'view.courseId' => $request['courseId'], 'view.courseType' => 0])
//            ->where('chapter.isTrylearn','=',0)
//            ->count();
//        $chapter || $chapter = 0;
//
//        //退款金额= 未学章节数/总的付费章节数*学员支付价格
//        $price =is_integer(($total - $chapter) / $total * ($request['payPrice']/100)) ? ($total - $chapter) / $total * ($request['payPrice']/100) : round(($total - $chapter) / $total * ($request['payPrice']/100),2);
//
//        if($total - $chapter >= 0)
//            return response()->json(['data'=>$price,'type'=>true]);
//        else
//            return response()->json(['data'=>'','type'=>false]);
//    }



    //我的订单 -- 提交退款申请

    public function submitApply(Request $request)
    {
        $input = $request->except('id');
        $input['created_at'] = $input['updated_at']  = Carbon::now();
        $input['refundAmount'] *= 100;
        $input['status'] = 0;
//        dd($request->all());
        //如果已申请过退款，通知用户。
        if(\DB::table('refund')->where('orderSn',$request['orderSn'])->first()){
            return response()->json(['type'=>false,'msg'=>'您已申请过退款，请等待结果！']);
        }
        //向退款表中插入数据。
        $id = \DB::table('refund')->insertGetId($input);
        if($id){
            \DB::table('orders')->where('id',$request['id'])->update(['refundableAmount'=>$input['refundAmount'],'status'=>3]);
            return response()->json(['type'=>true,'msg'=>'请等待申请结果！']);
        }else {
            return response()->json(['type'=>false,'msg'=>'申请退款失败']);

        }
    }




    /*
     * 名师 -- 待评点评
     */
    public function waitComment($pageNumber,$pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $id = \Auth::user()->id;
        $data = \DB::table('orders as o')
            ->leftJoin('commentcourse as cs','cs.orderSn','=','o.orderSn')
            ->leftJoin('applycourse as app','app.orderSn','=','o.orderSn')
            ->select('o.teacherName','o.status','app.courseTitle as applyTitle','app.id as applyId','cs.id as commentId','cs.created_at as time','cs.courseLowPath as low','cs.courseMediumPath as medium','cs.courseHighPath as high','cs.state as commentState','o.username','app.state as applyState','app.created_at as applyTime')
//            ->where(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2])
            ->where(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2,'cs.state'=>0])
            ->orWhere(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2,'cs.state'=>1])
            ->orWhere(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2,'cs.state'=>null])
//            ->where('cs.state','!=','2')
            ->orderBy('app.created_at','desc')
            ->skip($skip)
            ->take($pageSize)
            ->get();
//        dd($data);
        $count = \DB::table('orders as o')
            ->leftJoin('commentcourse as cs','cs.orderSn','=','o.orderSn')
            ->leftJoin('applycourse as app','app.orderSn','=','o.orderSn')
//            ->where(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2])
//            ->where('cs.state','<>',2)
            ->where(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2,'cs.state'=>0])
            ->orWhere(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2,'cs.state'=>1])
            ->orWhere(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'o.status'=>1,'app.courseStatus'=>0,'app.courseIsDel'=>0,'app.state'=>2,'cs.state'=>null])
            ->count();
//        dd($data);
        foreach($data as $key => $value){
            $result = DB::table('usermessage')->where(['actionId' => $value->commentId,'username' => Auth::user()->username])->first();
            $data[$key]->messageId = $result ? $result->id : '';
        }
        if($data){
            return response()->json(['total'=>$count,'data'=>$data,'type'=>true]);
        }else{
            return response()->json(['total'=>$count,'type'=>false]);
        }

    }


    /*
     * 名师 -- 点评完成
     */
    public function completeComment(Request $request,$pageNumber,$pageSize)
    {
        $skip = ($pageNumber - 1) * $pageSize;
        $id = \Auth::user()->id;
        $request->get('type') == 'hot' ? $condition = 'cs.coursePlayView' : $condition = 'cs.created_at';
        $data = \DB::table('commentcourse as cs')
            ->join('orders as o','o.orderSn','=','cs.orderSn')
            ->join('applycourse as app','app.orderSn','=','o.orderSn')
            ->join('users as u','u.id','=','cs.userId')
            ->select('cs.teachername','cs.courseTitle as commentTitle','cs.id as commentId','cs.coursePlayView as view','cs.courseFav as fav','cs.created_at as commentTime','u.realname','u.username','cs.state','o.status','app.id as applyId','app.courseTitle as applayTitle','app.created_at as time')
            ->where(['cs.teacherId'=>$id,'cs.courseIsDel'=>0,'cs.courseStatus'=>0,'o.status'=>2,'o.orderType'=>1,'cs.state'=>2,'o.isDelete'=>0,'app.state'=>2])
            ->orderBy($condition,'desc')
            ->skip($skip)
            ->take($pageSize)
            ->get();
        $count = \DB::table('commentcourse as cs')
            ->join('orders as o','o.orderSn','=','cs.orderSn')
            ->join('applycourse as app','app.orderSn','=','o.orderSn')
            ->join('users as u','u.id','=','cs.userId')
            ->where(['cs.teacherId'=>$id,'cs.courseIsDel'=>0,'cs.courseStatus'=>0,'o.status'=>2,'o.orderType'=>1,'cs.state'=>2,'o.isDelete'=>0,'app.state'=>2])
            ->count();
//        dd($data);
        if($data){
            return response()->json(['total'=>$count,'data'=>$data,'type'=>true]);
        }else{
            return response()->json(['total'=>$count,'type'=>false]);
        }

    }





}
