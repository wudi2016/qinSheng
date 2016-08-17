<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;

class IndexController extends Controller
{
    public function index()
    {
        $data['applyCount'] = DB::table('applycourse')->where(['courseIsDel'=>0,'state'=>1])->count(); //审核中的演奏视频数量
        $data['teachCount'] = DB::table('commentcourse')->where(['courseIsDel'=>0,'state'=>1])->count();//审核中的点评视频
        $data['ordersCount'] = DB::table('orders')->where(['isDelete'=>0,'status'=>3])->count();//退款中的订单
        $data['feedbackCount'] = DB::table('coursefeedback')->where('status',0)->count();//未处理的意见反馈
//        dd($data);
        return view('admin.index',['data'=>$data]);
    }
}
