@extends('layouts.layoutAdmin')
@section('content')
    <div class="main-content">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <ul class="breadcrumb">
                <li>
                    <i class="icon-home home-icon"></i>
                    <a href="{{url('/admin/index')}}">首页</a>
                </li>

                <li>
                    @if($data->status == 'u1')
                        <a href="{{url('/admin/users/userList')}}">用户管理</a>
                    @else
                        <a href="{{url('/admin/users/famousTeacherList')}}">名师管理</a>
                    @endif
                </li>
                <li class="active">用户管理列表</li>
            </ul><!-- .breadcrumb -->
        </div>
        @if (session('status'))
            <div class="alert alert-success">
                {{ session('status') }}
            </div>
        @endif


        <div class="page-content">
            <div class="page-header">
                <h1>
                    我的关注管理
                    <small>
                        <i class="icon-double-angle-right"></i>
                        我的关注列表
                    </small>
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">
                    <div class="table-responsive">
                        <table id="sample-table-1" class="table table-striped table-bordered table-hover center">
                            <thead>
                            <tr>
                                <th class="center">用户ID</th>
                                <th class="center">用户名</th>
                                <th class="center">用户状态</th>
                                <th class="center">手机号</th>
                                <th class="center">用户角色</th>
                                <th class="center">用户头像</th>
                                <th class="center">创建时间</th>
                                <th class="center">最近登录时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            @foreach($data as $value)
                                <tr>
                                    <td class="center">{{$value->deleteId}}</td>
                                    <td><a href="{{url('admin/users/show/'.$value->deleteId)}}">{{$value->username}}</a></td>
                                    <td id="checks{{$value->id}}">@if($value->checks == 0)激活@elseif($value->checks == 1)<span style=" color:red">禁用</span>@endif</td>
                                    <td>{{$value->phone}}</td>
                                    <td>@if($value->type == 0)学生@elseif($value->type == 1)教师@else<span style="color:red">名师</span>@endif</td>
                                    <td><img src="{{asset($value->pic)}}" alt="" width="40" height="40"></td>
                                    <td>{{$value->created_at}}</td>
                                    <td>{{$value->updated_at}}</td>
                                    <td>
                                        <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">

                                            <a href="{{url('admin/users/delFocus/'.$value->id.'/'.$value->friendId)}}"
                                               class="btn btn-xs btn-danger">
                                                <strong>删除</strong>
                                            </a>

                                            @if($data->status == 'u1')
                                                <a href="{{url('admin/users/show/'.$value->deleteId.'/u1')}}"
                                                   class="btn btn-xs btn-success" name="person-detail">
                                                    <strong>查看详情</strong>
                                                </a>
                                            @else
                                                <a href="{{url('admin/users/show/'.$value->deleteId)}}"
                                                   class="btn btn-xs btn-success" name="person-detail">
                                                    <strong>查看详情</strong>
                                                </a>
                                            @endif
                                        </div>
                                    </td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                        {!! $data -> appends( app('request') -> all() ) -> render() !!}
                    </div><!-- /.table-responsive -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->
@endsection
