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
        DB::table('orders') -> where(['id' => $orderID, 'userId' => \Auth::user() -> id, 'status' => 0]) -> first() || abort(404);
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
        DB::table('orders') -> select('id') -> where(['id' => $orderID, 'userId' => \Auth::user() -> id, 'status' => 0]) -> first() || abort(404);
        return view('home.lessonComment.buyComment.upload') -> with('orderID', $orderID) -> with('mineID', \Auth::user() -> id);
    }


    /**
     * 审核未通过重新上传视频
     *
     * @return \Illuminate\Http\Response
     */
    public function reUpload($applyID)
    {
        PaasUser::apply();
        $result = DB::table('applycourse') -> select('id', 'courseTitle', 'message') -> where(['id' => $applyID, 'userId' => \Auth::user() -> id, 'state' => 0]) -> first();
        $result || abort(404);
        return view('home.lessonComment.buyComment.upload') -> with('orderID', $orderID) -> with('mineID', \Auth::user() -> id);
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
        if (!$result) return $this -> returnResult(false);
        DB::table('teacher') -> where('parentId', $request['teacherId']) -> decrement('stock') || $result = !(DB::table('orders') -> where('id', $result) -> delete());
        return $this -> returnResult($result);
    }


    /**
     * pass平台上传资源
     *
     * @return \Illuminate\Http\Response
     */
    public function uploadResource(Request $request)
    {
        if (!PaasUser::apply()) return Response() -> json(["type" => false, 'status' => '401']);
        $recourse = PaasResource::getuploadstatus("/?md5=". $request['md5'] ."&filename=". $request['filename'] ."&directory=". $request['directory']);
        return $this -> returnResult($recourse);
    }


    /**
     * pass平台资源转换
     *
     * @return \Illuminate\Http\Response
     */
    public function transformation(Request $request)
    {
        if (!PaasUser::apply()) return Response() -> json(["type" => false, 'status' => '401']);
        $recourse = PaasResource::transformation("?fileid=". $request['fileID']);
        return $this -> returnResult($recourse);
    }


     /**
     * 完成上传
     *
     * @return \Illuminate\Http\Response
     */
    public function finishUpload(Request $request)
    {
        foreach ($request['data'] as $key => $value) $request['data'][$key] && $data[$key] = $request['data'][$key];
        $result = DB::table('orders') -> select('orderSn', 'teacherId') -> where('id', $request['orderID']) -> first();
        if(!$result) return $this -> returnResult(false);
        $data['orderSn'] = $result -> orderSn;
        $data['teacherId'] = $result -> teacherId;
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
