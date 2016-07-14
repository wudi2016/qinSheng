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
                    <a href="{{url('/admin/users/userList')}}">用户管理</a>
                </li>
                <li class="active">管理员信息</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    用户管理
                    <small>
                        <i class="icon-double-angle-right"></i>
                        管理员信息
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">

                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->
                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->

                            <form class="form-horizontal" role="form">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户名：</label>

                                    <div class="col-sm-9">
                                        <input type="text" readonly class="col-xs-10 col-sm-5"
                                               value="{{\Auth::user()->username}}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">姓名：</label>

                                    <div class="col-sm-9">
                                        <input type="text" readonly class="col-xs-10 col-sm-5"
                                               value="{{\Auth::user()->realname}}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所在部门：</label>

                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-1" readonly  class="col-xs-10 col-sm-5"
                                               value="{{\Auth::user()->company}}"/>
                                    </div>
                                </div>

                                {{--<div class="form-group">--}}
                                    {{--<label class="col-sm-3 control-label no-padding-right" for="form-field-1">岗位：</label>--}}

                                    {{--<div class="col-sm-9">--}}
                                        {{--<input type="text" id="form-field-3" readonly class="col-xs-10 col-sm-5" value="{{\Auth::user()->email}}"/>--}}
                                    {{--</div>--}}
                                {{--</div>--}}

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-4">电话：</label>

                                    <div class="col-sm-9">
                                        <input class="col-xs-10 col-sm-5" type="text" name="phone" id="form-field-4"
                                               placeholder="Phone" value="{{\Auth::user()->phone}}"/><span
                                                style="display: block;height:30px;line-height: 30px;color:brown;">* 可修改</span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">邮箱：</label>

                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-3" class="col-xs-10 col-sm-5" value="{{\Auth::user()->email}}"/><span
                                                style="display: block;height:30px;line-height: 30px;color:brown;">* 可修改</span>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 审核状态： </label>

                                    <div class="col-sm-9">
                                        <input class="col-xs-10 col-sm-5" readonly  type="text" value="@if(\Auth::user()->checks==0)激活@elseif(\Auth::user()->checks==1)禁用@endif "/>
                                        <div class="space-2"></div>
                                    </div>

                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">创建时间：</label>

                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-1" readonly  placeholder="created_at" class="col-xs-10 col-sm-5"
                                               value="{{\Auth::user()->created_at}}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">最近登录时间：</label>

                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-1" readonly  placeholder="updated_at" class="col-xs-10 col-sm-5"
                                               value="{{\Auth::user()->updated_at}}"/>
                                    </div>
                                </div>

                                <div class="clearfix form-actions">
                                    <div class="col-md-offset-3 col-md-9">
                                        <a href="{{url('admin/users/userList')}}" class="btn btn-success" style="margin-left:100px;">
                                            <i class="icon-ok bigger-110"></i>
                                            修改
                                        </a>
                                        <a href="{{url('admin/users/userList')}}" class="btn btn-info" style="margin-left:50px;">
                                            <i class="icon-ok bigger-110"></i>
                                            返回首页
                                        </a>
                                    </div>
                                </div>

                            </form>

                        </div><!-- /.col -->
                    </div><!-- /row -->

                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->
@endsection
