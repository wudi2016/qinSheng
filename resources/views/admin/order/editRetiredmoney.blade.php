@extends('layouts.layoutAdmin')
@section('content')
    <div class="main-content">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="icon-home home-icon"></i>
                    <a href="{{url('/admin/index')}}">首页</a>
                </li>

                <li>
                    <a href="{{url('/admin/order/orderList')}}">订单管理</a>
                </li>
                <li class="active">已退金额</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    已退金额
                    <small>
                        <i class="icon-double-angle-right"></i>
                        已退金额
                    </small>
                </h1>
            </div><!-- /.page-header -->

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="row">
                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->

                    <form action="{{url('admin/order/doRetiredmoney')}}" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                        <input type="hidden" name="id" value="{{$data->id}}">
                        <input type="hidden" name="status" value="{{$data->status}}">
                        <div class="space-4"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 订单号 </label>

                            <div class="col-sm-9">
                                <input type="text" disabled name="orderSn" id="form-field-1" placeholder="订单号" class="col-xs-10 col-sm-5" value="{{$data->orderSn}}" />
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>

                        <div class="space-4"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 已退金额 </label>

                            <div class="col-sm-9">
                                <input type="text" name="refundAmount" id="form-field-1" placeholder="已退金额" class="col-xs-10 col-sm-5" value="{{$data->refundAmount}}" />
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>


                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="submit">
                                    <i class="icon-ok bigger-110"></i>
                                    Submit
                                </button>

                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset">
                                    <i class="icon-undo bigger-110"></i>
                                    Reset
                                </button>
                            </div>
                        </div>
                        <input type="hidden" name="_token" value="{{ csrf_token() }}">

                    </form>

                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
        <!-- 配置文件 -->
        <script type="text/javascript" src="{{asset('ueditor/ueditor.config.js')}}"></script>
        <!-- 编辑器源码文件 -->
        <script type="text/javascript" src="{{asset('ueditor/ueditor.all.js')}}"></script>

        <!-- 实例化编辑器 -->
        <script type="text/javascript">
            var ue = UE.getEditor('container');
        </script>
    </div><!-- /.main-content -->
@endsection