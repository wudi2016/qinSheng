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
                <li class="active">用户管理列表</li>
            </ul><!-- .breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form action="" method="get" class="form-search">
                    <select name="type" id="form-field-1" class="searchtype input-select">
                        <option value="0" {{$search['type'] == 0 ? 'selected':''}}>用户名</option>
                        <option value="1" {{$search['type'] == 1 ? 'selected':''}}>姓名</option>
                        <option value="2" {{$search['type'] == 2 ? 'selected':''}}>手机号</option>
                        <option value="3" style="color:red" {{$search['type'] == 3 ? 'selected':''}}>学生学员</option>
                        <option value="4" style="color:red" {{$search['type'] == 4 ? 'selected':''}}>教师学员</option>
                        {{--<option value="5" style="color:red" {{$search['type'] == 5 ? 'selected':''}}>名师</option>--}}
                        <option value="6" {{$search['type'] == 6 ? 'selected':''}}>时间筛选</option>
                        <option value="7" {{$search['type'] == 7 ? 'selected':''}}>全部</option>
                    </select>
                    <span class="input-icon">
                        <span style="display: block;" class="input-icon" id="search1">
                            <input type="text" placeholder="Search ..." name="search" class="nav-search-input" id="nav-search-input" autocomplete="off" />
                            <i class="icon-search nav-search-icon"></i>
                            <input style="background: #6FB3E0;width:60px;height:28px ;border:0;color:#fff;padding-left: 8px;" type="submit" value="筛选" />
                        </span>
                        <span style="display: none;" class="input-icon" id="search2">
                            <input type="text" style="padding-left:5px; padding-right: 5px;" name="beginTime" id="form-field-1" placeholder="开始时间" class="col-xs-10 col-sm-5" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
                            <input type="text" style="padding-left:5px;padding-right: 5px;" name="endTime" id="form-field-1" placeholder="线束时间" class="col-xs-10 col-sm-5" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:170px;" />
                            <input style="background: #6FB3E0;width:60px;height:28px ;border:0;color:#fff;padding-left: 0;padding-right: 0;" type="submit" value="筛选" />
                        </span>
                    </span>
                </form>
            </div><!-- #nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    用户管理
                    <small>
                        <i class="icon-double-angle-right"></i>
                        用户管理列表
                    </small>
                    <a href="{{url('admin/users/addUser')}}" class="btn btn-xs btn-info"
                       style="margin-left:8px;">
                        <strong class="icon-expand-alt bigger-30">&nbsp;添加用户</strong>
                    </a>
                </h1>
            </div><!-- /.page-header -->

            @if (session('status'))
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            @endif

            @if(count($errors))
                <div class="alert alert-danger">
                    <ul>
                        @if(is_object($errors))
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        @else
                            <li>{{$errors}}</li>
                        @endif
                    </ul>
                </div>
            @endif


            <div class="row">

                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <form action="{{url('admin/excel/userInfoImport')}}" method="post" enctype="multipart/form-data" style="float:right;">
                                    <input type="submit" class="btn btn-xs btn-info" id="infoExport" value="导入用户信息" style="width:86px; cursor: pointer;margin-left:40px;" />
                                    <input type="file" name="excel" style="float:right;width:50%; cursor: pointer;margin-right:0;"/>
                                    <input type="hidden" name="_token" value="{{ csrf_token() }}"/>

                                </form>
                                <a href="{{url('admin/excel/userInfoTemplate')}}" class="btn btn-xs btn-info" style="float: right;margin-right:-30px;">
                                    下载导入模板
                                </a>



                                <table id="sample-table-1" class="table table-striped table-bordered table-hover center">
                                    <thead>
                                    <tr>
                                        <th class="center">用户ID</th>
                                        <th class="center">用户名</th>
                                        <th class="center">用户状态</th>
                                        <th class="center">手机号</th>
                                        <th class="center">用户角色</th>
                                        <th class="center">用户头像</th>
                                        <th class="center">邀请人ID</th>
                                        <th class="center">邀请人</th>
                                        <th class="center">创建时间</th>
                                        <th class="center">最近登录时间</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($data as $value)
                                        <tr>
                                            <td class="center">{{$value->id}}</td>
                                            <td><a href="{{url('admin/users/show/'.$value->id)}}">{{$value->username}}</a></td>
                                            <td id="checks{{$value->id}}">@if($value->checks == 0)激活@elseif($value->checks == 1)<span style=" color:red">禁用</span>@endif</td>
                                            <td>{{$value->phone}}</td>
                                            <td>@if($value->type == 0)学生@elseif($value->type == 1)教师@else<span style="color:red">名师</span>@endif</td>
                                            <td><img src="{{asset($value->pic)}}" alt="" width="40" height="40"></td>
                                            <td>{{$value->userId}}</td>
                                            <td>{{$value->name}}</td>
                                            <td>{{$value->created_at}}</td>
                                            <td>{{$value->updated_at}}</td>
                                            <td>
                                                <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                    <a href="{{url('admin/users/editUser/'.$value->id)}}"
                                                       class="btn btn-xs btn-info">
                                                        <strong>编辑</strong>
                                                    </a>

                                                    <a href="{{url('admin/users/delUser/'.$value->id)}}"
                                                       class="btn btn-xs btn-danger">
                                                        <strong>删除</strong>
                                                    </a>

                                                    <a href="{{url('admin/users/resetPass/'.$value->id)}}"
                                                       class="btn btn-xs btn-inverse" name="reset-pass">
                                                        <strong>重置密码</strong>
                                                    </a>

                                                    <a href="{{url('admin/users/show/'.$value->id)}}"
                                                       class="btn btn-xs btn-success" name="person-detail">
                                                        <strong>查看详情</strong>
                                                    </a>


                                                    <span class="btn btn-xs btn-default" name="btn-status" onchange="changeStatus({{$value->id}});" style="position: relative;display: inline-block;">
                                                            <strong>审核状态</strong>
                                                            <select id="form-field-status{{$value->id}}" class="col-xs-10 col-sm-2" name="form-field-status" style="filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity:0;opacity: 0;position:absolute;top:-2px;left:0;z-index: 2;cursor: pointer;height:23px;width:59px;">
                                                                <option value="0" {{$value->checks==0 ? 'selected':''}}>激活</option>
                                                                <option value="1" {{$value->checks==1 ? 'selected':''}}>禁用</option>
                                                            </select>
                                                    </span>

                                                    <a href="{{url('admin/users/focusList/'.$value->id)}}"
                                                       class="btn btn-xs btn-inverse">
                                                        <strong>关注</strong>
                                                    </a>

                                                    <a href="{{url('admin/users/friendsList/'.$value->id)}}"
                                                       class="btn btn-xs btn-inverse">
                                                        <strong>好友</strong>
                                                    </a>
                                               </div>
                                            </td>
                                        </tr>
                                    @endforeach

                                    </tbody>
                                </table>
                                {!! $data -> appends( app('request') -> all() ) -> render() !!}
                                @if(count($excels))
                                    <form action="{{url('admin/excel/userInfoExport')}}" method="post" style="float: right;margin-top:65px;margin-right:-130px;">
                                        <input type="submit" class="btn btn-xs btn-info"  value="导出用户信息" style="width:86px; cursor: pointer; margin-top:-87px;margin-right:130px;" />
                                        {{csrf_field()}}
                                        <input type="hidden" name="excels" value="{{$excels}}"/>
                                    </form>
                                @endif
                            </div><!-- /.table-responsive -->
                        </div><!-- /span -->
                    </div><!-- /row -->

                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->
@endsection
@section('js')
    <script language="javascript" type="text/javascript" src="{{asset('DatePicker/WdatePicker.js') }}"></script>
    <script language="javascript" type="text/javascript" src="{{asset('admin/js/searchtype.js') }}"></script>
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {'X-CSRF-TOKEN': '{{ csrf_token() }}'}
        });
        function changeStatus(userId){
            var checks = $("#form-field-status"+userId).val();
            $.ajax({
                type: "post",
                url: "{{url('admin/users/changeStatus')}}",
                data: {'id':userId,'checks':checks},
                dataType: 'json',


                success: function (result) {
                    if (result.status === true) {
                        $("#checks"+userId).html(result.msg);
//                       window.location.href = "userList";
                    }
                }
            });
        }
    </script>
@endsection