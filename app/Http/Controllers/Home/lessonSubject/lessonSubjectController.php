<?php

namespace App\Http\Controllers\Home\lessonSubject;

use DB;

use Illuminate\Support\Facades\Response;
use QrCode;
use PaasUser;
use PaasResource;
use Carbon\Carbon;
use App\Http\Requests;
use App\CommentCourse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Primecloud\Pay\Weixin\Kernel\WxPayApi;
use Primecloud\Pay\Weixin\Kernel\WxPayConfig;
use Primecloud\Pay\Weixin\Kernel\WxPayResults;
use Primecloud\Pay\Weixin\Kernel\WxPayDataBase;
use Primecloud\Pay\Weixin\Kernel\WxPayUnifiedOrder;
use App\Http\Controllers\Home\lessonComment\Gadget;

class lessonSubjectController extends Controller
{
    use Gadget;

    public static $errMessage;

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
        DB::table('course')->where('id', $id)->increment('courseView', 1);
        return view('home.lessonSubject.lessonSubjectDetail')->with('mineUsername', $mineUsername)->with('mineUserId', $mineUserId)->with('mineType', $mineType)->with('minePic', $minePic)->with('detailId', $id);
    }

    // 专题课程列表页 规则排序 数据接口=============== data ================
    public function getList($type, $pageNumber, $pageSize)
    {
        switch ($type) {
            case 1:
                $orderBy = 'id';
                $asc = 'desc';
                break;
            case 2:
                $orderBy = 'created_at';
                $asc = 'desc';
                break;
            case 3:
                $orderBy = 'courseStudyNum';
                $asc = 'desc';
                break;
        }
        $skip = ($pageNumber - 1) * $pageSize;
        $count = DB::table('course')->where(['courseStatus' => 0, 'courseIsDel' => 0])->count();
        $List = DB::table('course')->where(['courseStatus' => 0, 'courseIsDel' => 0])->orderBy($orderBy, $asc)->skip($skip)->take($pageSize)->get();
        foreach ($List as $key => $value) {
            if ($List[$key]->courseDiscount) {
                $List[$key]->coursePrice = ceil(($List[$key]->courseDiscount / 10000) * $List[$key]->coursePrice / 100);
            } else {
                $List[$key]->coursePrice = ceil($List[$key]->coursePrice / 100);
            }
            $List[$key]->coursePlayView = $List[$key]->courseStudyNum;
            $List[$key]->classHour = DB::table('coursechapter')->where(['courseId' => $value->id, 'status' => 0])->where('parentId', '<>', '0')->count();
        }
        if ($List) {
            return response()->json(['status' => true, 'data' => $List, 'count' => $count]);
        } else {
            return response()->json(['status' => true, 'count' => $count]);
        }
    }

    // 点评课程列表页 规则排序 数据接口
    public function getCommentList($type, $pageNumber, $pageSize)
    {
//        PaasUser::apply();
        $skip = ($pageNumber - 1) * $pageSize;
        $count = CommentCourse::where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->count();
        if ($type == 1 && Auth::check()) {
            $pianoGrade = Auth::user()->pianoGrade ? Auth::user()->pianoGrade : '';
            switch ($pianoGrade) {
                case '钢琴一级':
                    $pianoGrade = 1;
                    break;
                case '钢琴二级':
                    $pianoGrade = 2;
                    break;
                case '钢琴三级':
                    $pianoGrade = 3;
                    break;
                case '钢琴四级':
                    $pianoGrade = 4;
                    break;
                case '钢琴五级':
                    $pianoGrade = 5;
                    break;
                case '钢琴六级':
                    $pianoGrade = 6;
                    break;
                case '钢琴七级':
                    $pianoGrade = 7;
                    break;
                case '钢琴八级':
                    $pianoGrade = 8;
                    break;
                case '钢琴九级':
                    $pianoGrade = 9;
                    break;
                case '钢琴十级':
                    $pianoGrade = 10;
                    break;
            }
            $List = CommentCourse::where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->skip($skip)->take($pageSize)->get()->toArray();
        }
        if ($type == 1) {
            if (Auth::check()) {
                if (Auth::user()->pianoGrade) {
                    $List = CommentCourse::where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->skip($skip)->take($pageSize)->get()->toArray();
                } else {
                    $List = CommentCourse::where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->orderBy('id', 'desc')->skip($skip)->take($pageSize)->get()->toArray();
                }
            } else {
                $List = CommentCourse::where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->orderBy('id', 'desc')->skip($skip)->take($pageSize)->get()->toArray();
            }
        } else if ($type == 2) {
            $List = CommentCourse::where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->orderBy('created_at', 'desc')->skip($skip)->take($pageSize)->get()->toArray();
        } else if ($type == 3) {
            $List = CommentCourse::where(['courseStatus' => '0', 'state' => '2', 'courseIsDel' => 0])->orderBy('coursePlayView', 'desc')->skip($skip)->take($pageSize)->get()->toArray();
        }
        $new = [];
        foreach ($List as $key => $value) {
            $List[$key]['coursePrice'] = ceil($value['coursePrice'] / 100);
//            $List[$key]['coursePic'] = $this->getPlayUrl('coursePic');
            if ($type == 1 && Auth::check()) {
                $arr[$key] = explode(',', $List[$key]['suitlevel']);
                foreach ($arr[$key] as $k => $v) {
                    $new[$key][] = abs($v - $pianoGrade);
                }
                $List[$key]['suitlevel'] = min($new[$key]);
            }
        }
        if ($type == 1) {
            if (Auth::check()) {
                if (Auth::user()->pianoGrade) {
                    if($List){
                        return response()->json(['status' => true, 'data' => $this->splitArray($this->mySort($List, 'suitlevel', $sort_order = SORT_ASC)), 'count' => $count]);
                    }else{
                        return response()->json(['status' => true, 'count' => $count]);
                    }
                } else {
                    if ($List) {
                        return response()->json(['status' => true, 'data' => $List, 'count' => $count]);
                    } else {
                        return response()->json(['status' => true, 'count' => $count]);
                    }
                }
            } else {
                if ($List) {
                    return response()->json(['status' => true, 'data' => $List, 'count' => $count]);
                } else {
                    return response()->json(['status' => true, 'count' => $count]);
                }
            }
        } else{
            if ($List) {
                return response()->json(['status' => true, 'data' => $List, 'count' => $count]);
            } else {
                return response()->json(['status' => true, 'count' => $count]);
            }
        }
    }

    // 专题课程详细页 数据接口
    public function getDetail($id)
    {
//        PaasUser::apply();
        // 课程详细信息
        $info = DB::table('course')->select()->where(['id' => $id, 'courseStatus' => 0, 'courseIsDel' => 0])->first();
        if (!$info) return response()->json(['status' => false]);
        if (Auth::check()) {
            // 是否购买
            $isBuy = DB::table('orders')->select('id')->where(['userId' => Auth::user()->id, 'orderType' => '0', 'courseId' => $id])->whereIn('status', [0, 2])->first();
            // 是否收藏
            $isCollection = DB::table('collection')->select('id')->where(['courseId' => $info->id, 'userId' => Auth::user()->id])->first();
            $isTeacher = Auth::user()->type == '2';
            // 展示视频为试学视频还是正常视频
        } else {
            $isBuy = false;
            $isCollection = false;
            $isTeacher = false;
        }
        if (!$isTeacher && !$isBuy) {
            $result = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0, 'isTryLearn' => 1])->where('parentId', '<>', '0')->first();
        } else {
            $result = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0])->where('parentId', '<>', '0')->first();
        }
        $isTryLearn = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0, 'isTryLearn' => 1])->where('parentId', '<>', '0')->first();
//        $info->courseLowPath = $result ? $this->getPlayUrl($result->courseLowPath) : '';
//        $info->courseMediumPath = $result ? $this->getPlayUrl($result->courseMediumPath) : '';
//        $info->courseHighPath = $result ? $this->getPlayUrl($result->courseHighPath) : '';
        $info->isTryLearn = $isTryLearn ? true : false;
        // 章节ID
        $chapterId = $result ? $result->id : '';
        // 用户ID
        $mineUserId = Auth::check() ? Auth::user()->id : '';
        // 是否观看该课程
//        $view = DB::table('courseview')->where(['courseId' => $id, 'userId' => $mineUserId, 'chapterId' => $chapterId])->first();
//        if (!$view && $mineUserId) { // 未观看  增加观看数
//            DB::table('courseview')->insertGetId(['userId' => $mineUserId, 'courseId' => $id, 'chapterId' => $chapterId, 'courseType' => 0]);
//        }
        // 是否是折扣课程
        if ($info->courseDiscount) {
            $info->coursePrice = ceil(($info->courseDiscount / 10000) * $info->coursePrice / 100);
        } else {
            $info->coursePrice = ceil($info->coursePrice / 100);
        }
        // 课程总课时
        $info->classHour = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0])->where('parentId', '<>', '0')->count();
        // 课程观看数
        $info->coursePlayView = $info->courseStudyNum;
        if (Auth::check()) {
            $info->isCollection = $isCollection ? true : false;
            $info->isBuy = $isBuy ? true : false;
            $info->isAuthor = $info->teacherId == Auth::user()->id ? true : false;
            $info->isTeacher = $isTeacher ? true : false;
        } else {
            $info->isCollection = false;
            $info->isBuy = false;
            $info->isAuthor = false;
            $info->isTeacher = false;
        }
        return $this->returnResult($info);
    }

    // 获取讲师信息
    public function getTeacherInfo($id)
    {
        $info = DB::table('course as c')
            ->join('users as u', 'c.teacherId', '=', 'u.id')
            ->join('teacher as t', 't.parentId', '=', 'c.teacherId')
            ->where('c.id', $id)->select('u.id', 'u.realname', 'u.pic', 'u.company', 't.intro')->first();
        return $this->returnResult($info);
    }

    // 获取目录信息
    public function getCatalogInfo($id)
    {
//        PaasUser::apply();
        $mineUserId = Auth::check() ? Auth::user()->id : '';
        $info = DB::table('coursechapter')->select('id', 'title')->where(['status' => 0, 'parentId' => '0', 'courseId' => $id])->get();
        foreach ($info as $key => $value) {
            $info[$key]->section = (DB::table('coursechapter')->select('id', 'title', 'courseLowPath', 'courseMediumPath', 'courseHighPath', 'isTryLearn', 'coursePic')->where(['status' => 0, 'parentId' => $value->id, 'courseId' => $id])->get());
            foreach ($info[$key]->section as $k => $v) {
//                $v->courseLowPath = $this->getPlayUrl($v->courseLowPath);
//                $v->courseMediumPath = $this->getPlayUrl($v->courseMediumPath);
//                $v->courseHighPath = $this->getPlayUrl($v->courseHighPath);
//                $v->coursePic = $v->coursePic ? $this->getPlayUrl($v->coursePic) : '';
                $v->isLearn = DB::table('courseview')->where(['courseId' => $id, 'userId' => $mineUserId, 'chapterId' => $v->id])->first() ? true : false;
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
            $info[$key]->timeAgo = Carbon::parse($value->created_at)->diffForHumans();
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
            $result = DB::table('coursecomment')->where('id', $input['parentId'])->select('commentContent')->first();
            if ($insertId) {
                $info['toUsername'] = $input['tousername'];
                $info['fromUsername'] = $input['username'];
                $info['username'] = $input['username'];
                $info['type'] = 5;
                $info['content'] = $result ? $result->commentContent : '';
                $info['client_ip'] = $_SERVER["REMOTE_ADDR"];
                $info['actionId'] = $input['courseId'];
                $info['created_at'] = Carbon::now();
                $info['courseType'] = 0;
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
        $info = DB::table('coursedata')->where(['courseId' => $id, 'status' => 0])->select('dataName', 'dataPath')->get();
        return $this->returnResult($info);
    }

    // 增加课程观看数
    public function addCourseView(Request $request)
    {
        $input = $request->all();
        $input['courseType'] = 0;
        $view = DB::table('courseview')->where(['courseId' => $request->courseId, 'userId' => $request->userId, 'chapterId' => $request->chapterId])->first();
        if (!$view && !empty($request->userId)) {
            $result = DB::table('courseview')->insertGetId($input);
        } else {
            $result = '';
        }
        return $this->returnResult($result);
    }

    // 增加课程观看完成数
    public function addCompleteCount(Request $request)
    {
        $result = DB::table('course')->where('id', $request->id)->increment('coursePlayView');
        return $this->returnResult($result);
    }

    /**
     * 生成订单
     *
     * @return \Illuminate\Http\Response
     */
    public function addOrder(Request $request)
    {
        $request['orderSn'] = date('YmdHis', time()) . '_' . uniqid();
        $request['created_at'] = Carbon::now();
        $request['updated_at'] = Carbon::now();
        $request['orderPrice'] = $request->orderPrice * 100;
        $result = DB::table('orders')->insertGetId($request->all());
        return $this->returnResult($result);
    }


    // 微信扫码支付页
    public function lessonSubjectWeChatPay(WxPayApi $wxPay, WxPayDataBase $wxBase, WxPayUnifiedOrder $inputObj, $orderID)
    {
        $result = DB::table('orders')->select('orderPrice', 'orderTitle', 'orderSn', 'id', 'orderType')->where(['id' => $orderID, 'userId' => \Auth::user()->id, 'isDelete' => 0, 'status' => 5])->first();
        $result || abort(404);
        $code_url = $this->makeUnifiedOrder($wxPay, $inputObj, $wxBase, $result, 'http://qinsheng.zuren8.com/lessonSubject/wxPayCallback');
        empty($code_url['code_url']) && abort(404);
        return view('home.lessonSubject.lessonSubjectWeChatPay')->with('orderID', $orderID)->with('orderInfo', $result)->with('url', $code_url['code_url']);
    }

    /**
     * 微信支付回调地址
     *
     * @return \Illuminate\Http\Response
     */
    public function wxPayCallback(WxPayDataBase $wxBase)
    {
        try {
            $xml = $GLOBALS['HTTP_RAW_POST_DATA'];
            $xml = WxPayResults::Init($xml);
            if ($xml) {
                if ($xml['result_code'] == 'SUCCESS' && $xml['return_code'] == 'SUCCESS') {
                    $orderSn = $xml['out_trade_no'];
                    $result['payPrice'] = $xml['total_fee'];
                    $result['tradeSn'] = $xml['transaction_id'];
                    $result['payTime'] = Carbon::now();
                    switch ($order->orderType) {
                        case 1:
                            $result['status'] = 0;
                            break;
                        case 2:
                            $result['status'] = 2;
                            DB::table('course')->join('orders', 'course.id', '=', 'orders.courseId')->where('orders.orderSn', $orderSn)->increment('course.completecount');
                            DB::table('course')->join('orders', 'course.id', '=', 'orders.courseId')->where('orders.orderSn', $orderSn)->increment('course.courseStudyNum');
                            break;
                    }
                    $order = DB::table('orders')->where('orderSn', $orderSn)->update($result);
                    if ($order) {
                        echo "SUCCESS";
                    }
                } else {
                    Log::info(json_encode($xml) . " --- 订单支付未成功");
                }
            } else {
                Log::info(json_encode($xml) . " --- 订单校验失败");
            }
        } catch (\Exception $e) {
            Log::info($e->getMessage() . " --- try catch 抛出异常");
            Log::info(json_encode($xml) . " --- 异常数据");
        }
    }

    /**
     * 微信扫码获取订单状态
     *
     * @return \Illuminate\Http\Response
     */
    public function orderStatus($orderID)
    {
        $result = DB::table('orders')->select('id', 'orderType', 'courseId')->where('status', '!=', 5)->where(['id' => $orderID, 'userId' => \Auth::user()->id, 'isDelete' => 0])->first();
        return $this->returnResult($result);
    }

    /**
     * 支付成功
     *
     * @return \Illuminate\Http\Response
     */
    public function buySuccess($orderID)
    {
        $result = DB::table('orders')->where(['id' => $orderID, 'userId' => \Auth::user()->id, 'status' => 0, 'isDelete' => 0])->select('courseId')->first();
        $result || abort(404);
        return view('home.lessonSubject.buySuccess')->with('courseId', $result->courseId);
    }

    /**
     * 支付宝异步回调页面
     *
     * @return \Illuminate\Http\Response
     */
    public function alipayAsyncCallback()
    {
        if (!app('alipay.web')->verify()) {
            Log::info('支付宝异步校验失败', [
                'data' => json_encode(Input::all())
            ]);
            return 'fail';
        }
        if (Input::get('trade_status') == 'TRADE_SUCCESS' || Input::get('trade_status') == 'TRADE_FINISHED') {
            return 'success';
        }
    }

    /**
     * 支付宝同步回调页面
     *
     * @return \Illuminate\Http\Response
     */
    public function alipaySyncCallback()
    {
        if (!app('alipay.web')->verify()) {
            Log::info('支付宝同步校验失败', [
                'data' => Request::getQueryString()
            ]);
            abort(404);
        }
        if (Input::get('trade_status') == 'TRADE_SUCCESS' || Input::get('trade_status') == 'TRADE_FINISHED') {
            $orderSn = Input::get('out_trade_no');
            $result['payPrice'] = Input::get('total_fee') * 100;
            $result['tradeSn'] = Input::get('trade_no');
            $result['payTime'] = Carbon::now();
            if (preg_match('/^\/lessonComment\/buySuccess\/[0-9]{1,}/', Input::get('body'))) {
                $result['status'] = 0;
            } else if (preg_match('/^\/lessonComment\/detail\/[0-9]{1,}/', Input::get('body'))) {
                $result['status'] = 2;
                DB::table('course')->join('orders', 'course.id', '=', 'orders.courseId')->where('orders.orderSn', $orderSn)->increment('course.completecount');
                DB::table('course')->join('orders', 'course.id', '=', 'orders.courseId')->where('orders.orderSn', $orderSn)->increment('course.courseStudyNum');
            }
            $order = DB::table('orders')->where('orderSn', $orderSn)->update($result);
            if ($order) {
                return redirect()->to(Input::get('body'));
            } else {
                abort(404);
            }
        }
    }

    /**
     * 支付宝支付
     *
     * @return \Illuminate\Http\Response
     */
    public function alipay($orderID, $callback)
    {
        $result = DB::table('orders')->select('orderPrice', 'orderTitle', 'orderSn', 'id')->where(['id' => $orderID, 'userId' => \Auth::user()->id, 'isDelete' => 0, 'status' => 5])->first();
        $result || abort(404);
        $callback = '/' . str_replace('&', '/', $callback);
        $alipay = app('alipay.web');
        $alipay->setOutTradeNo($result->orderSn);
        $alipay->setTotalFee($result->orderPrice / 100);
        $alipay->setSubject($result->orderTitle);
        $alipay->setBody($callback);
        $alipay->setQrPayMode('4');
        return redirect()->to($alipay->getPayLink());
    }

    // 二维数组按照value排序
    function mySort($arrays, $sort_key, $sort_order = SORT_DESC, $sort_type = SORT_NUMERIC)
    {
        if (is_array($arrays)) {
            foreach ($arrays as $array) {
                $key_arrays[] = $array[$sort_key];
            }
        } else {
            return false;
        }
        array_multisort($key_arrays, $sort_order, $sort_type, $arrays);
        return $arrays;
    }

    // 二维数组，数组中存对象按value排序
    function myListSort($arrays, $sort_key, $sort_order = SORT_DESC, $sort_type = SORT_NUMERIC)
    {
        if (is_array($arrays)) {
            foreach ($arrays as $array) {
                $key_arrays[] = $array->$sort_key;
            }
        } else {
            return false;
        }
        array_multisort($key_arrays, $sort_order, $sort_type, $arrays);
        return $arrays;
    }

    // 拆分数组
    function splitArray($array)
    {
        $new = [];
        $newArr = [];
        if (is_array($array) && (count($array) != 1)) {
            foreach ($array as $key => $value) {
                $new[$value['suitlevel']][] = $value;
            }
            foreach ($new as $value) {
                $value = $this->mySort($value, 'created_at');
            }
            foreach ($new as $key => $value) {
                foreach ($value as $arr) {
                    array_push($newArr, $arr);
                }
            }
            return $newArr;
        } else {
            return $array;
        }
    }

    // json返回
    function returnResult($result)
    {
        if ($result) {
            return Response()->json(["status" => true, "data" => $result]);
        } else {
            return Response()->json(["status" => false]);
        }
    }

}
