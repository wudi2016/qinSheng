<?php

namespace App\Http\Controllers\Home\lessonComment;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use DB;
use PaasResource;
use PaasUser;
use Cache;
use QrCode;
use Primecloud\Weixin\Kernel\WxPayConfig;
use Primecloud\Weixin\Kernel\WxPayApi;
use Primecloud\Weixin\Kernel\WxPayDataBase;
use Primecloud\Weixin\Kernel\WxPayUnifiedOrder;
use Primecloud\Weixin\Kernel\WxPayBizPayUrl;

class buyCommentController extends Controller
{
    use Gadget;


    public function __construct()
    {
        PaasUser::apply();
    }


    /**
     * 支付页面
     *
     * @return \Illuminate\Http\Response
     */
    public function index($teacherID)
    {
        $result = DB::table('teacher') -> select('stock') -> where(['parentId' => $teacherID]) -> where('stock', '>', 0) -> first();
        $result || abort(404);
        return view('home.lessonComment.buyComment.index') -> with('teacherID', $teacherID) -> with('stock', $result -> stock);
    }


    /**
     * 微信扫码
     *
     * @return \Illuminate\Http\Response
     */
    public function scan(WxPayApi $wxPay, WxPayDataBase $wxBase, WxPayUnifiedOrder $inputObj, $orderID)
    {
        $result = DB::table('orders') -> select('orderPrice', 'orderTitle', 'orderSn', 'id') -> where(['id' => $orderID, 'userId' => \Auth::user() -> id, 'isDelete' => 0]) -> first();
        $result || abort(404);
        $code_url = $this -> makeUnifiedOrder($wxPay, $inputObj, $wxBase, $result, 'http://qinsheng.zuren8.com/lessonComment/wxPayCallback');
        empty($code_url['code_url']) && abort(404);
        return view('home.lessonComment.buyComment.scan') -> with('orderID', $orderID) -> with('orderInfo', $result) -> with('url', $code_url['code_url']);
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
            DB::table('teacher') -> join('orders', 'teacher.parentId', '=', 'orders.teacherId') -> where('orders.orderSn', $orderSn) -> decrement('teacher.stock');
            $order = DB::table('orders') -> where('orderSn', $orderSn) -> update($result);
            if ($order) {
                echo "SUCCESS";
            }
        } else {
            file_put_contents(public_path().'/order.txt', date('Y-M-D H:i:s', time())." -----  {$message['transaction_id']}  ---------- fail ----------- \r\n", FILE_APPEND);
        }
    }


    /**
     * 微信扫码获取订单状态
     *
     * @return \Illuminate\Http\Response
     */
    public function orderStatus($orderID)
    {
        $result = DB::table('orders') -> select('id') -> where(['id' => $orderID, 'userId' => \Auth::user() -> id, 'isDelete' => 0, 'status' => 0]) -> first();
        return $this -> returnResult($result);
    }


    /**
     * 支付成功
     *
     * @return \Illuminate\Http\Response
     */
    public function buySuccess($orderID)
    {
        DB::table('orders') -> where(['id' => $orderID, 'userId' => \Auth::user() -> id, 'status' => 0, 'isDelete' => 0]) -> first() || abort(404);
        return view('home.lessonComment.buyComment.buySuccess') -> with('orderID', $orderID);
    }


    /**
     * 上传视频
     *
     * @return \Illuminate\Http\Response
     */
    public function upload($orderID)
    {
        PaasUser::apply();
        $result = DB::table('orders') -> select('id', 'orderSn', 'teacherId') -> where(['id' => $orderID, 'userId' => \Auth::user() -> id, 'status' => 0]) -> first();
        $result || abort(404);
        return view('home.lessonComment.buyComment.upload') -> with('info', $result) -> with('mineID', \Auth::user() -> id);
    }


    /**
     * 审核未通过重新上传视频
     *
     * @return \Illuminate\Http\Response
     */
    public function reUpload($applyID)
    {
        PaasUser::apply();
        $result = DB::table('applycourse') -> select('id', 'courseTitle', 'message') 
                -> where(['id' => $applyID, 'userId' => \Auth::user() -> id, 'state' => 0, 'courseStatus' => 0, 'courseIsDel' => 0]) -> first();
        $result || abort(404);
        return view('home.lessonComment.buyComment.reUpload') -> with('applyID', $result -> id) 
               -> with('courseTitle', $result -> courseTitle) -> with('message', $result -> message) -> with('mineID', \Auth::user() -> id);
    }


    /**
     * 生成订单
     *
     * @return \Illuminate\Http\Response
     */
    public function generateOrder(Request $request)
    {
        $request['orderSn'] = date('Ymd', time()).uniqid();
        $request['created_at'] = Carbon::now();
        $request['updated_at'] = Carbon::now();
        $result = DB::table('orders') -> insertGetId($request -> all());
        return $this -> returnResult($result);
    }


     /**
     * 完成上传
     *
     * @return \Illuminate\Http\Response
     */
    public function finishUpload(Request $request)
    {
        foreach ($request['data'] as $key => $value) $request['data'][$key] && $data[$key] = $request['data'][$key];
        $data['created_at'] = Carbon::now();
        $data['updated_at'] = Carbon::now();
        $data['state'] = 1;
        $data['courseTitle'] = str_replace(' ', '', $data['courseTitle']);
        $data['message'] = str_replace(' ', '', $data['message']);
        $result = DB::table('applycourse') -> insertGetId($data);
        if (!$result) return $this -> returnResult(false);
        DB::table('orders') -> where('id', $request['orderID']) -> update(['status' => 1]) || $result = !(DB::table('applycourse') -> where('id', $result) -> delete());
        return $this -> returnResult($result);
    }
}
