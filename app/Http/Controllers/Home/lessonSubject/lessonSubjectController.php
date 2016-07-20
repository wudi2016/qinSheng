<?php

namespace App\Http\Controllers\Home\lessonSubject;

use DB;
use Carbon\Carbon;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Home\lessonComment\Gadget;
use PaasResource;
use PaasUser;
use QrCode;
use Primecloud\Weixin\Kernel\WxPayConfig;
use Primecloud\Weixin\Kernel\WxPayApi;
use Primecloud\Weixin\Kernel\WxPayDataBase;
use Primecloud\Weixin\Kernel\WxPayUnifiedOrder;
use Primecloud\Weixin\Kernel\WxPayBizPayUrl;


class lessonSubjectController extends Controller
{
    use Gadget;

    public function __construct()
    {
//        PaasUser::apply();
    }
    // 专题课程列表页 =============== page =======================
    public function lessonSubjectList($type)
    {
        return view('home.lessonSubject.lessonSubjectList');
    }

    // 专题课程详细页
    public function lessonSubjectDetail($id)
    {
        $mineUsername = Auth::check() ? Auth::user()->username : '';
        $mineUserId = Auth::check() ? Auth::user()->id : '';
        $mineType = Auth::check() ? Auth::user()->type : '';
        $minePic = Auth::check() ? Auth::user()->pic : '';
        DB::table('course')->where('id',$id)->increment('courseView',1);
        return view('home.lessonSubject.lessonSubjectDetail')->with('mineUsername', $mineUsername)->with('mineUserId',$mineUserId)->with('mineType',$mineType)->with('minePic',$minePic)->with('detailId', $id);
    }

    // 专题课程列表页 规则排序 数据接口=============== data ================
    public function getList($type)
    {
        switch ($type) {
            case 1:
                $orderBy = 'id';
                $asc = 'asc';
                break;
            case 2:
                $orderBy = 'created_at';
                $asc = 'desc';
                break;
            case 3:
                $orderBy = 'coursePlayView';
                $asc = 'desc';
                break;
        }
        $List = DB::table('course')->where(['courseStatus' => 0, 'courseIsDel' => 0])->orderBy($orderBy, $asc)->get();
        foreach ($List as $key => $value) {
            if($List[$key]->courseDiscount){
                $List[$key]->coursePrice = ceil(($List[$key]->courseDiscount/10000)*$List[$key]->coursePrice/1000);
            }else{
                $List[$key]->coursePrice = ceil($List[$key]->coursePrice/1000);
            }
            $List[$key]->coursePlayView = count(DB::table('courseview')->select('courseId','userId','courseType')->where(['courseId' => $value->id, 'courseType' => 0])->distinct()->get());
            $List[$key]->classHour = DB::table('coursechapter')->where(['courseId' => $value->id, 'status' => 0])->where('parentId', '<>', '0')->count();
        }
        return $this->returnResult($List);
    }

    // 点评课程列表页 规则排序 数据接口
    public function getCommentList($type)
    {
        switch ($type) {
            case 1:
                $orderBy = 'id';
                break;
            case 2:
                $orderBy = 'created_at';
                break;
            case 3:
                $orderBy = 'coursePlayView';
                break;
        }
        $List = DB::table('commentcourse')->where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->orderBy($orderBy, 'desc')->get();
        foreach ($List as $key => $value) {
            $List[$key]->coursePrice = ceil($value->coursePrice / 1000);
            $List[$key]->coursePlayView = count(DB::table('courseview')->select('courseId','userId','courseType')->where(['courseId' => $value->id, 'courseType' => 0])->distinct()->get());
        }
        return $this->returnResult($List);
    }

    // 专题课程详细页 数据接口
    public function getDetail($id)
    {
//        PaasUser::apply();
        $info = DB::table('course')->select()->where('id', $id)->first();
        $result = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0])->where('parentId','0')->first();


        $chapterId = $result ? $result->id : '';
        $mineUserId = Auth::check() ? Auth::user()->id : '';
        $view = DB::table('courseview')->where(['courseId' => $id, 'userId' => $mineUserId, 'chapterId' => $chapterId])->first();
        if(!$view && $mineUserId){
            DB::table('courseview')->insertGetId(['userId' => $mineUserId, 'courseId' => $id, 'chapterId' => $chapterId,'courseType' => 0]);
        }
        if($info->courseDiscount){
            $info->coursePrice = ceil(($info->courseDiscount/10000)*$info->coursePrice/1000);
        }else{
            $info->coursePrice = ceil($info->coursePrice/1000);
        }
        $info->classHour = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0])->where('parentId', '<>', '0')->count();
//        $info->courseLowPath = $result ? $this -> getPlayUrl($result->courseLowPath) : '';
//        $info->courseMediumPath = $result ? $this -> getPlayUrl($result->courseMediumPath) : '';
//        $info->courseHighPath = $result ? $this -> getPlayUrl($result->courseHighPath) : '';
        $info->courseLowPath = $result ? $result->courseLowPath : '';
        $info->courseMediumPath = $result ? $result->courseMediumPath : '';
        $info->courseHighPath = $result ? $result->courseHighPath : '';
        $info->coursePlayView = count(DB::table('courseview')->select('courseId','userId','courseType')->where(['courseId' => $id, 'courseType' => 0])->distinct()->get());
        if (Auth::check()) {
            $info->isCollection = (DB::table('collection')->select('id')->where(['courseId' => $info->id, 'userId' => Auth::user()->id])->first() ? true : false);
            $info->isBuy = (DB::table('orders')->select('id')->where(['userId' => Auth::user()->id, 'orderType' => '0', 'courseId' => $id])->first() ? true : false);
            $info->isAuthor = $info->teacherId == Auth::user()->id ? true : false;
        } else {
            $info->isCollection = false;
            $info->isBuy = false;
            $info->isAuthor = false;
        }
        return $this->returnResult($info);
    }

    // 获取讲师信息
    public function getTeacherInfo($id)
    {
        $info = DB::table('course as c')
            ->join('users as u', 'c.teacherId', '=', 'u.id')
            ->join('teacher as t', 't.parentId', '=', 'c.teacherId')
            ->where('c.id', $id)->select('u.realname', 'u.pic', 'u.school', 't.intro')->first();
        return $this->returnResult($info);
    }

    // 获取目录信息
    public function getCatalogInfo($id)
    {
//        PaasUser::apply();
        $mineUserId = Auth::check() ? Auth::user()->id : '';
        $info = DB::table('coursechapter')->select('id', 'title')->where(['status' => 0, 'parentId' => '0', 'courseId' => $id])->get();
        foreach ($info as $key => $value) {
            $info[$key]->section = (DB::table('coursechapter')->select('id', 'title', 'courseLowPath', 'courseMediumPath', 'courseHighPath')->where(['status' => 0, 'parentId' => $value->id, 'courseId' => $id])->get());
            foreach($info[$key]->section as $k => $v){
//                $v->courseLowPath = $this -> getPlayUrl($v->courseLowPath);
//                $v->courseMediumPath = $this -> getPlayUrl($v->courseMediumPath);
//                $v->courseHighPath = $this -> getPlayUrl($v->courseHighPath);
                $v->isLearn = DB::table('courseview')->where(['courseId' => $id,'userId' => $mineUserId, 'chapterId' => $v->id])->first() ? true : false;
            }
        }
        return $this->returnResult($info);
    }


    // 获取评论信息
    public function getCommentInfo($id)
    {
        $info = DB::table('coursecomment as c')
            ->join('users as u', 'c.username', '=', 'u.username')
            ->select('u.pic', 'c.id', 'c.username', 'c.tousername', 'c.commentContent', 'c.likeNum', 'c.created_at')
            ->where(['c.courseId' => $id, 'status' => 0])->orderBy('c.created_at', 'desc')->get();
        foreach ($info as $key => $value) {
            $info[$key]->likeUser = $info[$key]->likeNum ? array_filter(explode(',', $info[$key]->likeNum)) : [];
            $info[$key]->isLike = Auth::check() ? in_array(Auth::user()->id, $info[$key]->likeUser) : true;
            $info[$key]->isSelf = Auth::check() && Auth::user()->username == $info[$key]->username ? true : false;
            $info[$key]->likeTotal = count($info[$key]->likeUser);
            $info[$key]->timeAgo = Carbon::createFromFormat('Y-n-j G:i:s', $value->created_at)->diffForHumans();
        }
        return $this->returnResult($info);
    }


    // 发布评论
    public function publishComment(Request $request)
    {
        $input = $request->all();
        if (isset($input['tousername']) && !empty($input['tousername'])) { // 回复评论
            $input['checks'] = '0';
            $input['created_at'] = Carbon::now();
            $input['updated_at'] = Carbon::now();
            $input['status'] = '0';
            $insertId = DB::table('coursecomment')->insertGetId($input);
            if($insertId){
                $info['toUsername'] = $input['tousername'];
                $info['fromUsername'] = $input['username'];
                $info['username'] = $input['username'];
                $info['type'] = 5;
                $info['content'] = $input['commentContent'];
                $info['client_ip'] = $_SERVER["REMOTE_ADDR"];
                $info['actionId'] = $input['courseId'];
                $info['created_at'] = Carbon::now();
                DB::table('usermessage')->insertGetId($info);
            }
            return $this->returnResult($insertId);
        } else { // 发布评论
            $input['checks'] = '0';
            $input['created_at'] = Carbon::now();
            $input['updated_at'] = Carbon::now();
            $input['status'] = '0';
            $insertId = DB::table('coursecomment')->insertGetId($input);
            return $this->returnResult($insertId);
        }
    }

    // 删除评论
    public function deleteComment(Request $request)
    {
        $result = DB::table('coursecomment')->delete($request->get('id'));
        return $this->returnResult($result);
    }

    // 点赞
    public function addLike(Request $request)
    {
        $input = $request->all();
        $data['likeNum'] = Auth::user()->id;
        $data['updated_at'] = Carbon::now();
        $likeNum = DB::table('coursecomment')->select('likeNum')->where('id', $input['id'])->first();
        if ($likeNum->likeNum) {
            $list = explode(',', $likeNum->likeNum);
            if (in_array($data['likeNum'], $list)) {
                return response()->json(['status' => false]);
            } else {
                $new = ['0' => $likeNum->likeNum, '1' => $data['likeNum']];
                $info['likeNum'] = implode(',', $new);
                $info['updated_at'] = Carbon::now();
                $result = DB::table('coursecomment')->where('id', $input['id'])->update($info);
                return $this->returnResult($result);
            }
        } else {
            $result = DB::table('coursecomment')->where('id', $input['id'])->update($data);
            return $this->returnResult($result);
        }
    }

    // 发表反馈意见
    public function publishFeedBack(Request $request)
    {
        $input = $request->all();
        $input['courseType'] = '0';
        $input['status'] = '0';
        $input['created_at'] = Carbon::now();
        $insertId = DB::table('coursefeedback')->insertGetId($input);
        return $this->returnResult($insertId);
    }

    // 添加收藏
    public function addCollect(Request $request)
    {
        $input = $request->all();
        $flag = $input['isCollection'];
        $input = $request->except('isCollection');
        if ($flag == 'true' || DB::table('collection')->where(['courseId' => $input['courseId'], 'userId' => $input['userId']])->first()) { // 已收藏
            if (DB::table('collection')->where(['courseId' => $input['courseId'], 'userId' => $input['userId']])->delete()) {
                DB::table('course')->where('id', $input['courseId'])->decrement('courseFav', 1);
                return response()->json(['status' => false]);// 未收藏
            } else {
                return response()->json(['status' => true]);// 已收藏
            }
        } else { // 未收藏
            $input['type'] = '0'; // 专题课程
            $input['created_at'] = Carbon::now();
            $insertID = DB::table('collection')->insertGetId($input);
            if ($insertID) {
                DB::table('course')->where('id', $input['courseId'])->increment('courseFav', 1);
                return response()->json(['status' => true]);// 已收藏
            } else {
                return response()->json(['status' => false]);// 未收藏
            }
        }
    }

    // 资料下载数据接口
    public function getDataDownload($id)
    {
        $info = DB::table('coursedata')->where(['courseId' => $id, 'status' => 0])->select('dataName','dataPath')->get();
        return $this->returnResult($info);
    }

    // 增加课程观看数
    public function addCourseView(Request $request){
        $input = $request->all();
        $input['courseType'] = 0;
        $view = DB::table('courseview')->where(['courseId' => $request->courseId, 'userId' => $request->userId, 'chapterId' => $request->chapterId])->first();
        if(!$view && !empty($request->userId)){
           $result = DB::table('courseview')->insertGetId($input);
        }else{
            $result = '';
        }
        return $this->returnResult($result);
    }

    /**
     * 生成订单
     *
     * @return \Illuminate\Http\Response
     */
    public function addOrder(Request $request)
    {

        $request['orderSn'] = date('YmdHis', time()) .'_'. uniqid();
        $request['created_at'] = Carbon::now();
        $request['updated_at'] = Carbon::now();
        $result = DB::table('orders') -> insertGetId($request -> all());
        if (!$result) return $this -> returnResult(false);
        return $this -> returnResult($result);
    }


    // 微信扫码支付页
    public function lessonSubjectWeChatPay(WxPayApi $wxPay, WxPayDataBase $wxBase, WxPayUnifiedOrder $inputObj, $orderID)
    {
        $result = DB::table('orders') -> select('orderPrice', 'orderTitle', 'orderSn', 'id') -> where(['id' => $orderID, 'userId' => \Auth::user() -> id, 'isDelete' => 0]) -> first();
        $result || abort(404);
        $code_url = $this -> makeUnifiedOrder($wxPay, $inputObj, $wxBase, $result, 'http://qinsheng.zuren8.com/lessonComment/wxPayCallback');
        empty($code_url['code_url']) && abort(404);
        return view('home.lessonSubject.lessonSubjectWeChatPay') -> with('orderID', $orderID) -> with('orderInfo', $result) -> with('url', $code_url['code_url']);
    }

    /**
     * 微信支付回调地址
     *
     * @return \Illuminate\Http\Response
     */
    public function wxPayCallback(Request $request)
    {
        $message = [];
        $postStr = $GLOBALS["HTTP_RAW_POST_DATA"];
        $message = (array) simplexml_load_string($postStr, 'SimpleXMLElement', LIBXML_NOCDATA);
        if ($message['result_code'] == 'SUCCESS' && $message['return_code'] == 'SUCCESS') {
            $orderSn = $message['out_trade_no'];
            $result['payPrice'] = $message['total_fee'];
            $result['tradeSn'] = $message['transaction_id'];
            $result['payTime'] = Carbon::now();
            $result['status'] = 0;
            $order = DB::table('orders') -> where('orderSn', $orderSn) -> update($result);
            if ($order) {
                echo "SUCCESS";
            }
        } else {
            file_put_contents(public_path().'/order.txt', date('Y-M-D H:i:s', time())." -----  {$message['transaction_id']}  ---------- fail ----------- \r\n", FILE_APPEND);
        }
    }

    function returnResult($result)
    {
        if ($result) {
            return Response()->json(["status" => true, "data" => $result]);
        } else {
            return Response()->json(["status" => false]);
        }
    }

}
