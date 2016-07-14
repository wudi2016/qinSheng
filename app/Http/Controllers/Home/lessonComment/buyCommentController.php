<?php

namespace App\Http\Controllers\Home\lessonComment;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use DB;
use PaasResource;
use PaasUser;

class buyCommentController extends Controller
{
    use Gadget;

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
    public function scan($commentID)
    {
        return view('home.lessonComment.buyComment.scan') -> with('commentID', $commentID);
    }


    /**
     * 支付成功
     *
     * @return \Illuminate\Http\Response
     */
    public function buySuccess($orderID)
    {
        return view('home.lessonComment.buyComment.buySuccess') -> with('orderID', $orderID);
    }


    /**
     * 上传视频
     *
     * @return \Illuminate\Http\Response
     */
    public function upload($orderID)
    {
        return view('home.lessonComment.buyComment.upload') -> with('orderID', $orderID);
    }


    /**
     * 生成订单
     *
     * @return \Illuminate\Http\Response
     */
    public function generateOrder(Request $request)
    {
        $request['orderSn'] = date('YmdHis', time());
        $request['tradeSn'] = time();
        $request['payTime'] = Carbon::now();
        $request['created_at'] = Carbon::now();
        $request['updated_at'] = Carbon::now();
        $result = DB::table('orders') -> insertGetId($request -> all());
        return $this -> returnResult($result);
    }


    /**
     * pass平台上传资源
     *
     * @return \Illuminate\Http\Response
     */
    public function uploadResource(Request $request)
    {
        if (!PaasUser::apply()) return Response() -> json(["type" => false, 'status' => '407']);
        $recourse = PaasResource::getuploadstatus("/?md5=". $request['md5'] ."&filename=". $request['filename'] ."&directory=". $request['directory']);
        return $this -> returnResult($recourse);
    }
}
