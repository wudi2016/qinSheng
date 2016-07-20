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
    public function index($typeID,$tab = null)
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
            return view('home.member.student.teacherStudent', compact('typeID', 'data','mineUsername','mineUserId','tab'));
        } else {
            return redirect('/');
        }
    }

    public function famousTeacher($tab = null)
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
            return view('home.member.famousTeacher.famousTeacher',compact('mineUsername','data','mineUserId','tab'));
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
        if ($aa = DB::table('users')->where('id', $id)->update($data)) {
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

        if ($aa = DB::table('users')->where('id', $id)->update($data) || $bb = DB::table('teacher')->where('parentId', $id)->update(['intro'=>$intro])) {
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
    public function myFocus()
    {
        $myFocus = \DB::table('friends as f')
            ->join('users as u', 'f.toUserId', '=', 'u.id')
            ->select('u.id', 'u.username', 'u.pic', 'u.type')
            ->where('f.fromUserId', \Auth::check() ? \Auth::user()->id : 0)
            ->orderBy('u.type', 'desc')
            ->get();
        if ($myFocus) {
            return response()->json(['data' => $myFocus, 'total' => count($myFocus), 'type' => true]);
        } else {
            return response()->json(['total' => count($myFocus), 'type' => false]);
        }
    }

    //我的粉丝$myFans  && 我的好友$myFriends
    public function myFriends()
    {
        $myFriends = \DB::table('friends as f')
            ->join('users as u', 'f.fromUserId', '=', 'u.id')
            ->select('u.id', 'u.username', 'u.pic', 'u.type')
            ->where('f.toUserId', \Auth::check() ? \Auth::user()->id : 0)
            ->orderBy('u.type', 'desc')
            ->get();
        if ($myFriends) {
            return response()->json(['data' => $myFriends, 'total' => count($myFriends), 'type' => true]);
        } else {
            return response()->json(['total' => count($myFriends), 'type' => false]);
        }
    }


    // 个人中心我的专题课程
    public function getCourse($type, $flag)
    {
        $flag == '1' ? $order = 'id' : $order = 'coursePlayView';
        if ($type == '1') { // 学员
            $info = DB::table('course as c')->leftJoin('orders as o', 'c.id', '=', 'o.courseId')
                ->select('c.id', 'c.courseTitle', 'c.coursePic', 'coursePrice', 'c.coursePlayView', 'c.courseDiscount')
                ->where(['o.userId' => Auth::user()->id, 'o.orderType' => '0', 'c.courseStatus' => '0'])
                ->orderBy($order, 'desc')->get();
        } else { // 名师
            $info = DB::table('course')->select('id', 'courseTitle', 'coursePic', 'coursePrice', 'coursePlayView','courseDiscount')->where(['teacherId' => Auth::user()->id, 'courseStatus' => '0'])->orderBy($order, 'desc')->get();
        }
        foreach ($info as $key => $value) {
            if($info[$key]->courseDiscount){
                $info[$key]->coursePrice = ceil(($info[$key]->courseDiscount/10000)*$info[$key]->coursePrice/1000);
            }else{
                $info[$key]->coursePrice = ceil($info[$key]->coursePrice/1000);
            }
            $info[$key]->classHour = DB::table('coursechapter')->where(['courseId' => $value->id, 'status' => 0])->where('parentId', '<>', '0')->count();
            $info[$key]->coursePlayView = count(DB::table('courseview')->select('courseId','userId','courseType')->where(['courseId' => $value->id, 'courseType' => 0])->distinct()->get());
        }
        if ($info) {
            return response()->json(['status' => true, 'data' => $info, 'total' => count($info)]);
        } else {
            return response()->json(['status' => false,'total' => count($info)]);
        }
    }

    // 个人中心我的点评课程
    public function getCommentCourse(Request $request,$type)
    {
        $type == '1' ? $order = 'a.id' : $order = 'a.coursePlayView';
        $info = DB::table('applycourse as a')
            ->leftJoin('orders as o', 'a.orderSn', '=', 'o.orderSn')
            ->leftJoin('commentcourse as c','c.orderSn', '=', 'a.orderSn')
            ->where(['a.userId' => $request->userId, 'a.courseStatus' => 0])->where('o.orderType', '<>', '0')
            ->select('a.id','a.courseTitle','a.coursePic','o.username','o.teacherName','a.coursePlayView','c.coursePrice','a.courseLowPath',
                'a.courseMediumPath','a.courseHighPath','a.state as applyState','o.status','c.state as commentState','a.created_at')
            ->orderBy($order,'desc')
            ->get();
        foreach ($info as $key => $value) {
            $info[$key]->coursePrice = ceil($info[$key]->coursePrice/1000);
            $info[$key]->coursePlayView = count(DB::table('courseview')->select('courseId','userId','courseType')->where(['courseId' => $value->id, 'courseType' => 1])->distinct()->get());
        }
        if ($info) {
            return response()->json(['status' => true, 'data' => $info, 'total' => count($info)]);
        } else {
            return response()->json(['status' => false, 'total' => count($info)]);
        }
    }

    // 个人中心我的收藏
    public function getCollectionInfo()
    {
        $course = [];
        $info = DB::table('collection')->select('id','courseId', 'type')->where('userId', Auth::user()->id)->orderBy('created_at', 'desc')->get();
        if ($info) {
            foreach ($info as $key => $value) {
                if ($value->type == '0') { // 收藏课程为专题课程
                    $course[$key] = DB::table('course')->select('id', 'courseTitle', 'coursePic', 'coursePlayView', 'coursePrice', 'courseDiscount')->where('id', $value->courseId)->first();
                    if($course[$key]->courseDiscount){
                        $course[$key]->coursePrice = ceil(($course[$key]->courseDiscount/10000)*$course[$key]->coursePrice/1000);
                    }else{
                        $course[$key]->coursePrice = ceil($course[$key]->coursePrice/1000);
                    }
                    $course[$key]->classHour = DB::table('coursechapter')->where(['courseId' => $course[$key]->id, 'status' => 0])->where('parentId', '<>', '0')->count();
                    $course[$key]->isCourse = 0;
                    $course[$key]->href = '/lessonSubject/detail/' . $course[$key]->id;
                    $course[$key]->collectId = $value->id;
                    $course[$key]->coursePlayView = count(DB::table('courseview')->select('courseId','userId','courseType')->where(['courseId' => $value->id, 'courseType' => 0])->distinct()->get());

                } else if($value->type == '1'){ // 收藏课程为点评课程
                    $course[$key] = DB::table('commentcourse')->select('id', 'courseTitle', 'coursePic', 'coursePlayView', 'coursePrice', 'teachername')->where('id', $value->courseId)->first();
                    $course[$key]->coursePrice = ceil($course[$key]->coursePrice / 1000);
                    $course[$key]->isCourse = 1;
                    $course[$key]->href = '/lessonComment/detail/' . $course[$key]->id;
                    $course[$key]->collectId = $value->id;
                    $course[$key]->coursePlayView = count(DB::table('courseview')->select('courseId','userId','courseType')->where(['courseId' => $value->id, 'courseType' => 1])->distinct()->get());
                }
            }
            return response()->json(['data' => $course, 'total' => count($info), 'status' => true]);
        } else {
            return response()->json(['total' => count($info), 'status' => false]);
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
    public function getNoticeInfo(Request $request)
    {
        $info = DB::table('usermessage')->where('username',$request->username)->where('type','<>',5)->get();
        if($info){
            return response()->json(['data' => $info, 'status' => true]);
        }else{
            return response()->json(['status' => false]);
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
    // 获取评论回复
    public function getCommentInfo(Request $request)
    {
        $info = DB::table('usermessage')->Where(['toUsername' => $request->username,'type' => 5])->get();
        foreach($info as $key => $value){
            $info[$key] -> content = '"'.$value->content.'"';
        }
        if($info){
            return response()->json(['data' => $info, 'status' => true]);
        }else{
            return response()->json(['status' => false]);
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
    public function myOrders()
    {
        if(\Auth::check())
            $id = \Auth::user()->id;
        else
            return false;
        $data = DB::table('orders as o')
            ->join('users as u','u.id','=','o.teacherId')
            ->select('o.id','o.userId','o.orderSn','o.userName','o.orderTitle','o.orderPrice','o.payPrice','o.orderType','o.courseId','o.status','o.created_at as payTime','u.realname','u.username')
            ->where(['o.userId'=>$id,'o.isDelete'=>0])
            ->orderBy('o.id','desc')
            ->get();

        $seven = Carbon::today()->subDays(7);
        if($data){
            foreach($data as $key=>$value){
                $data[$key]->orderPrice = ceil($value->orderPrice/1000);
                $data[$key]->payPrice = ceil($value->payPrice/1000);
                $data[$key]->realname || $data[$key]->realname = $data[$key]->username;
                //0是超过七天，1是不超过7天
                $data[$key]->seven = ($seven <= $data[$key]->payTime) ? 1 : 0;
            }

//              dd($data);

            return response()->json(['seven'=>$seven,'data'=>$data,'type'=>true]);

            }else{

                return response()->json(['seven'=>$seven,'type'=>false]);
            }
    }



    /*
     * 名师 -- 待评点评
     */
    public function waitComment()
    {
        if(\Auth::check())
            $id = \Auth::user()->id;
        else
            return false;

        $data = \DB::table('orders as o')
            ->leftJoin('applycourse as app','app.orderSn','=','o.orderSn')
            ->leftJoin('commentcourse as cs','cs.orderSn','=','o.orderSn')
            ->join('users as u','u.id','=','o.userId')
            ->select('o.teacherName','o.status','cs.courseTitle as commentTitle','cs.id as commentId','cs.courseLowPath as low','cs.courseMediumPath as medium','cs.courseHighPath as high','u.realname','cs.state as commentState','app.id as applyId','app.courseTitle as applyTitle','app.created_at as time','app.state as applyState')
            ->where(['o.teacherId'=>$id,'o.isDelete'=>0,'o.orderType'=>1,'cs.courseStatus'=>0,'cs.courseIsDel'=>0,'app.courseStatus'=>0,'app.courseIsDel'=>0])
            ->where('cs.state','<>',2)  //点评已完成不在此显示
            ->orderBy('cs.created_at','desc')
            ->get();
//        dd($data);
        if($data){
            return response()->json(['total'=>count($data),'data'=>$data,'type'=>true]);
        }else{
            return response()->json(['total'=>0,'type'=>false]);
        }

    }


    /*
     * 名师 -- 点评完成
     */
    public function completeComment(Request $request)
    {
        if(\Auth::check())
            $id = \Auth::user()->id;
        else
            return false;

        if($request->get('type') == 'hot'){
            $condition = 'cs.coursePlayView';
        }else{
            $condition = 'cs.created_at';
        }

        $data = \DB::table('commentcourse as cs')
            ->join('orders as o','o.orderSn','=','cs.orderSn')
            ->join('applycourse as app','app.orderSn','=','o.orderSn')
            ->join('users as u','u.id','=','cs.userId')
            ->select('cs.teachername','cs.courseTitle as commentTitle','cs.id as commentId','cs.coursePlayView as view','cs.courseFav as fav','cs.created_at as commentTime','u.realname','cs.state','o.status','app.id as applyId','app.courseTitle as applayTitle','app.created_at as time')
            ->where(['cs.teacherId'=>$id,'cs.courseStatus'=>0,'o.orderType'=>1,'cs.state'=>2,'cs.courseIsDel'=>0,'o.isDelete'=>0])
            ->orderBy($condition,'desc')
            ->get();
//        dd($data);
        if($data){
            return response()->json(['total'=>count($data),'data'=>$data,'type'=>true]);
        }else{
            return response()->json(['total'=>0,'type'=>false]);
        }

    }



    //我的订单 -- 申请退款页面数据接口

    public function applyRefund(Request $request)
    {
        $total   = \DB::table('coursechapter')->where(['courseId'=>$request['courseId']])->where('parentId','<>',0)->count() ?: 1;
        $chapter = \DB::table('courseview')->where(['userId'=>$request['userId'],'courseId'=>$request['courseId'],'courseType'=>0])->count() ?: 1;
        $price = floor($request['payPrice'] / $total * ($total-$chapter));
        if($total - $chapter >= 0)
            return response()->json(['data'=>$price,'type'=>true]);
        else
            return response()->json(['data'=>'','type'=>false]);
    }



    //我的订单 -- 提交退款申请

    public function submitApply(Request $request)
    {
        $input = $request->except('refundableAmount','id');
        $input['created_at'] = $input['updated_at']  = Carbon::now();
        $id = \DB::table('refund')->insertGetId($input);
        if($id){
            \DB::table('orders')->where('id',$request['id'])->update(['refundableAmount'=>$request['refundableAmount'],'status'=>3]);
            return response()->json(['type'=>true,'msg'=>'请等待申请结果！']);
        }else {
            return response()->json(['type'=>false,'msg'=>'申请退款失败']);
        }
    }



}
