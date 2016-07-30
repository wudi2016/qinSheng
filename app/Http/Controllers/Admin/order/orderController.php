<?php

namespace App\Http\Controllers\Admin\order;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;
use QrCode;
use Primecloud\Pay\Weixin\Kernel\WxPayConfig;
use Primecloud\Pay\Weixin\Kernel\WxPayApi;
use Primecloud\Pay\Weixin\Kernel\WxPayDataBase;
use Primecloud\Pay\Weixin\Kernel\WxPayRefund;


class orderController extends Controller
{
    /**
     *订单列表
     */
    public function orderList(Request $request,$status){
//        dd($status);
        $query = DB::table('orders');
        if($request['beginTime']){ //上传的起止时间
            $query = $query->where('created_at','>=',$request['beginTime']);
        }
        if($request['endTime']){ //上传的起止时间
            $query = $query->where('created_at','<=',$request['endTime']);
        }
        if($request['type'] == 1){
            $query = $query->where('orderSn','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('orderTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('userId','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){
            $query = $query->where('userName','like','%'.trim($request['search']).'%');
        }

        $data = $query
            ->where('isDelete',0)
            ->where('status',$status)
            ->orderBy('id','desc')
            ->paginate(10);
        //导出数据
        $excel = $query
            ->select('id','orderSn as 订单号','tradeSn as 交易编号','orderTitle as 订单名称','orderPrice as 订单价格','payPrice as 实付金额','payType as 支付方式(0:支付宝1:微信)','userId as 购买用户ID','userName as 购买用户','teacherId as 邀请人ID','teacherName as 邀请人','orderType as 订单类型(0:购买专题订单1:点评申请订单2:购买点评订单)','courseId as 专题课程ID(订单类型为0或1时为点评课程ID)','refundableAmount as 应退金额','refundAmount as 已退金额','payTime as 付款时间','status as 订单状态(0:已付款1:待点评2:已完成3:退款中4:已退款)')
            ->where('isDelete',0)
            ->orderBy('id','desc')
            ->get();
        $excel = json_encode($excel);

        foreach($data as &$val){
            $val->orderPrice = $val->orderPrice / 100;
            $val->payPrice = $val->payPrice / 100;
            $val->refundableAmount = $val->refundableAmount / 100;
            $val->refundAmount = $val->refundAmount / 100;
        }

        $data->type = $request['type'];
        $data->beginTime = $request['beginTime'];
        $data->endTime = $request['endTime'];
        $data->status = $status;
        return view('admin.order.orderList',['data'=>$data,'excel'=>$excel]);
    }

    /**
     *订单状态
     */
    public function orderState(Request $request){
        $data['status'] = $request['status'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('orders')->where('id',$request['id'])->update($data);
        $this -> OperationLog('修改了id为'.$request['id'].'的订单状态');
        switch($request['status']){
            case 0: //已付款
                DB::table('applycourse')->where('orderSn',$request['orderSn'])->update(['state'=>1]);
                DB::table('commentcourse')->where('orderSn',$request['orderSn'])->update(['state'=>1]);
                break;
            case 1: //待点评
                DB::table('applycourse')->where('orderSn',$request['orderSn'])->update(['state'=>2]);
                DB::table('commentcourse')->where('orderSn',$request['orderSn'])->update(['state'=>1]);
                break;
            case 2: //已完成
                DB::table('applycourse')->where('orderSn',$request['orderSn'])->update(['state'=>2]);
                DB::table('commentcourse')->where('orderSn',$request['orderSn'])->update(['state'=>2]);
                break;
        }
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *删除订单
     */
    public function delOrder($id,$status){
        $orderSn = DB::table('orders')->where('id',$id)->pluck('orderSn');
        $status = DB::table('orders')->where('id',$id)->pluck('status');
        if($status != 4){ //只有订单是已退款的才可以删除订单
            return redirect()->back()->withInput()->withErrors('只有已退款的订单才可以删除');
        }
        $data = DB::table('orders')->where('id',$id)->update(['isDelete'=>1]);
        DB::table('applycourse')->where('orderSn',$orderSn)->update(['courseIsDel'=>1]); //已退款时关联删除演奏视频表
        DB::table('commentcourse')->where('orderSn',$orderSn)->update(['courseIsDel'=>1]); //已退款时关联删除名师点评表
        if($data){
            $this -> OperationLog('删除了id为'.$id.'的订单');
            return redirect('admin/message')->with(['status'=>'订单删除成功','redirect'=>'order/orderList/'.$status]);
        }else{
            return redirect('admin/message')->with(['status'=>'订单删除失败','redirect'=>'order/orderList/'.$status]);
        }
    }

    /**
     *清除垃圾订单
     */
    public function deleteOrders(){
        $data = DB::table('orders')->where(['status'=>5,'isDelete'=>0])->get();
        foreach($data as &$val){
            if($val->created_at < Carbon::now()->subDay(1)){ //如果未付款订单超过一天则删除 subDay(1) 一天前
                DB::table('orders')->where('id',$val->id)->delete();
                $this -> OperationLog('清除了垃圾订单');
            }
        }
        return redirect()->back()->withInput()->with(['status'=>'垃圾订单已清除']);
    }




    /**
     *订单备注
     */
    public function remark(Request $request){
        $data = $request->all();
        $data['created_at'] = Carbon::now();
        if($id = DB::table('remarks')->insertGetId($data)){
            $this -> OperationLog('添加了id为'.$id.'的订单备注');
            $state['state'] = 1;
        }else{
            $state['state'] = 0;
        }
        echo json_encode($state);
    }

    /**
     *修改应退金额
     */
    public function editRefundmoney($id,$status){
        $data = DB::table('orders')->where('id',$id)->select('id','orderSn','refundableAmount')->first();
        $data->status = $status;
        return view('admin.order.editRefundmoney',['data'=>$data]);
    }

    /**
     *执行修改应退金额
     */
    public function doRefundmoney(Request $request){
        $validator = $this -> validator($request->all());
        if ($validator -> fails()){
            return Redirect()->back()->withInput()->withErrors($validator);
        }
        $data = $request->except('_token');
        $data['updated_at'] = Carbon::now();
        if(DB::table('orders')->where('id',$request['id'])->update($data)){
            $this -> OperationLog('修改了id为'.$request['id'].'的订单应退金额');
            return redirect('admin/message')->with(['status'=>'成功','redirect'=>'order/orderList/'.$request['status']]);
        }else{
            return redirect('admin/message')->with(['status'=>'失败','redirect'=>'order/orderList/'.$request['status']]);
        }
    }

    /**
     *修改已退金额
     */
    public function editRetiredmoney($id,$status){
        $data = DB::table('orders')->where('id',$id)->select('id','orderSn','refundAmount')->first();
        $data->status = $status;
        return view('admin.order.editRetiredmoney',['data'=>$data]);
    }

    /**
     *执行修改已退金额
     */
    public function doRetiredmoney(Request $request){
       $this->validate($request,[
           'refundAmount'=>'integer'
       ],[
           'refundAmount.integer'=>'已退金额必须为整型'
       ]);
        $data = $request->except('_token');
        $data['updated_at'] = Carbon::now();
        if(DB::table('orders')->where('id',$request['id'])->update($data)){
            $this -> OperationLog('修改了id为'.$request['id'].'的订单已退金额');
            return redirect('admin/message')->with(['status'=>'成功','redirect'=>'order/orderList/'.$request['status']]);
        }else{
            return redirect('admin/message')->with(['status'=>'失败','redirect'=>'order/orderList/'.$request['status']]);
        }
    }

    /**
     *备注列表
     */
    public function remarkList($id){
        $data = DB::table('remarks as r')
            ->leftJoin('orders as o','r.orderid','=','o.id')
            ->select('r.*','o.id as orderid','o.orderSn')
            ->where('orderid',$id)
            ->paginate(15);
        return view('admin.order.remarkList',['data'=>$data]);
    }

    /**
     *删除备注
     */
    public function delRemark($orderid,$id){
        if(DB::table('remarks')->where('id',$id)->delete()){
            $this -> OperationLog('删除了id为'.$id.'的订单备注');
            return redirect('admin/message')->with(['status'=>'备注删除成功','redirect'=>'order/remarkList/'.$orderid]);
        }else{
            return redirect('admin/message')->with(['status'=>'备注删除失败','redirect'=>'order/remarkList/'.$orderid]);
        }
    }










    //==================================================
    //================退款列表==================================
    //==================================================
    /**
     * 退款列表
     */
    public function refundList(Request $request,$orderSn){
        $query = DB::table('refund');
        if($request['type'] == 1){
            $query = $query->where('orderSn','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 2){
            $query = $query->where('orderTitle','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 3){
            $query = $query->where('username','like','%'.trim($request['search']).'%');
        }
        if($request['type'] == 4){ //上传的起止时间
            $query = $query->where('created_at','>=',$request['beginTime'])->where('created_at','<=',$request['endTime']);
        }
        $data = $query
            ->where('orderSn',$orderSn)
            ->paginate(15);
        $data->type = $request['type'];
        return view('admin.order.refundList',['data'=>$data]);
    }

    /**
     *退款状态
     */
    public function refundState(Request $request){
        $data['status'] = $request['status'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('refund')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *删除退款
     */
    public function delRefund($orderSn,$id){
        $data = DB::table('refund')->where('id',$id)->delete();
        if($data){
            $this -> OperationLog('删除了id为'.$id.'的订单退款信息');
            return redirect('admin/message')->with(['status'=>'退款删除成功','redirect'=>'order/refundList/'.$orderSn]);
        }else{
            return redirect('admin/message')->with(['status'=>'退款删除失败','redirect'=>'order/refundList/'.$orderSn]);
        }
    }


    /**
     * 表单验证
     */
    protected function validator(array $data){
        $rules = [
            'refundableAmount' => 'required|integer',

        ];

        $messages = [
            'refundableAmount.required' => '请输入应退金额',
            'refundableAmount.integer' => '应退金额必须为整型'
        ];

        return \Validator::make($data, $rules, $messages);
    }


    /**
     *点击确认退款
     */
    public function weiXinRefund(WxPayApi $wxPay,WxPayDataBase $wxPayDataBase,WxPayRefund $wxPayRefund,$orderid){
        $data = DB::table('orders')->where(['id'=>$orderid,'isDelete'=>0])->first();
        $totalPrice = $data->orderPrice * 100;
        $refundAmount = $data->refundAmount * 100;
        $orderid = $data->orderSn;//取出订单号
        $tradeSn = $data->tradeSn;//取出微信订单号

        //设置微信订单号
        $wxPayRefund->SetTransaction_id($tradeSn);
        //设置退款单号
        $wxPayRefund->SetOut_refund_no($orderid);
        //设置订单总金额
        $wxPayRefund->SetTotal_fee($totalPrice);
        //设置退款总金额
        $wxPayRefund->SetRefund_fee($refundAmount);
        //设置商户号
        $wxPayRefund->SetOp_user_id(WxPayConfig::MCHID);

        $result = $wxPay->refund($wxPayRefund);

        if($result['return_code'] == 'SUCCESS'){
            DB::table('orders')->where('id',$orderid)->update(['status'=>4]);//如果退款成功将订单状态改为4已退款
            $this -> OperationLog('id为'.$orderid.'的订单确认了退款');
            return redirect('admin/message')->with(['status'=>'退款成功','redirect'=>'order/orderList/4']);
        }else{
            return redirect('admin/message')->with(['status'=>'退款失败','redirect'=>'order/orderList/3']);
        }
//        dd($result);
    }

    /**
     *支付宝确认退款
     */
    public function alipayRefund(){
        $alipay = app('alipay.web');
    }

}






