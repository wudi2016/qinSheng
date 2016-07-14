<?php

namespace App\Http\Controllers\Admin\order;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Carbon\Carbon;

class orderController extends Controller
{
    /**
     *订单列表
     */
    public function orderList(Request $request){
        $query = DB::table('orders');
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
        if($request['type'] == 5){ //上传的起止时间
            $query = $query->where('payTime','>=',$request['beginTime'])->where('payTime','<=',$request['endTime']);
        }
        $data = $query
            ->where('isDelete',0)
            ->orderBy('id','desc')
            ->paginate(15);
        foreach($data as &$val){
            $val->orderPrice = $val->orderPrice / 1000;
            $val->payPrice = $val->payPrice / 1000;
            $val->refundableAmount = $val->refundableAmount / 1000;
            $val->refundAmount = $val->refundAmount / 1000;
        }
        //导出数据
        $excel = $query
            ->select('id','orderSn as 订单号','tradeSn as 交易编号','orderTitle as 订单名称','orderPrice as 订单价格','payPrice as 实付金额','payType as 支付方式(0:支付宝1:微信)','userId as 购买用户ID','userName as 购买用户','teacherId as 邀请人ID','teacherName as 邀请人','orderType as 订单类型(0:购买专题订单1:点评申请订单2:购买点评订单)','courseId as 专题课程ID(订单类型为0或1时为点评课程ID)','refundableAmount as 应退金额','refundAmount as 已退金额','payTime as 付款时间','status as 订单状态(0:已付款1:待点评2:已完成3:退款中4:已退款)')
            ->where('isDelete',0)
            ->orderBy('id','desc')
            ->get();
        foreach($excel as &$value){
            $value->订单价格 = $value->订单价格 / 1000;
            $value->实付金额 = $value->实付金额 / 1000;
            $value->应退金额 = $value->应退金额 / 1000;
            $value->已退金额 = $value->已退金额 / 1000;
        }
        $excel = json_encode($excel);
        $data->type = $request['type'];
//        dd($data);
        return view('admin.order.orderList',['data'=>$data,'excel'=>$excel]);
    }

    /**
     *订单状态
     */
    public function orderState(Request $request){
        $data['status'] = $request['status'];
        $data['updated_at'] = Carbon::now();
        $data = DB::table('orders')->where('id',$request['id'])->update($data);
        if($data){
            echo 1;
        }else{
            echo 0;
        }
    }

    /**
     *删除订单
     */
    public function delOrder($id){
        $data = DB::table('orders')->where('id',$id)->update(['isDelete'=>1]);
        if($data){
            return redirect('admin/message')->with(['status'=>'订单删除成功','redirect'=>'order/orderList']);
        }else{
            return redirect('admin/message')->with(['status'=>'订单删除失败','redirect'=>'order/orderList']);
        }
    }

    /**
     *订单备注
     */
    public function remark(Request $request){
        $data = $request->all();
        $data['created_at'] = Carbon::now();
        if(DB::table('remarks')->insert($data)){
            $state['state'] = 1;
        }else{
            $state['state'] = 0;
        }
        echo json_encode($state);
    }

    /**
     *修改应退金额
     */
    public function editRefundmoney($id){
        $data = DB::table('orders')->where('id',$id)->select('id','orderSn','refundableAmount')->first();
        $data->refundableAmount = $data->refundableAmount /1000;
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
        $data['refundableAmount'] = $request['refundableAmount'] * 1000;
        $data['updated_at'] = Carbon::now();
        if(DB::table('orders')->where('id',$request['id'])->update($data)){
            return redirect('admin/message')->with(['status'=>'成功','redirect'=>'order/orderList']);
        }else{
            return redirect('admin/message')->with(['status'=>'失败','redirect'=>'order/orderList']);
        }
    }

    /**
     *修改已退金额
     */
    public function editRetiredmoney($id){
        $data = DB::table('orders')->where('id',$id)->select('id','orderSn','refundAmount')->first();
        $data->refundAmount = $data->refundAmount /1000;
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
        $data['refundAmount'] = $request['refundAmount'] * 1000;
        $data['updated_at'] = Carbon::now();
        if(DB::table('orders')->where('id',$request['id'])->update($data)){
            return redirect('admin/message')->with(['status'=>'成功','redirect'=>'order/orderList']);
        }else{
            return redirect('admin/message')->with(['status'=>'失败','redirect'=>'order/orderList']);
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
    public function refundList(Request $request){
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
            ->paginate(15);
        foreach($data as &$val){
            $val->refundAmount = $val->refundAmount / 1000;
        }
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
    public function delRefund($id){
        $data = DB::table('refund')->where('id',$id)->delete();
        if($data){
            return redirect('admin/message')->with(['status'=>'退款删除成功','redirect'=>'order/refundList']);
        }else{
            return redirect('admin/message')->with(['status'=>'退款删除失败','redirect'=>'order/refundList']);
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

}






