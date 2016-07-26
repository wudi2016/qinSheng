@extends('layouts.layoutAdmin')
@section('css')
    <link rel="stylesheet" href="{{asset('admin/css/popUp.css')}}" />
@endsection
@section('content')
    <div class="main-content" ms-controller="specialcommentdetail">
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
                    <a href="{{url('/admin/specialCourse/specialCourseList')}}">课程管理</a>
                </li>
                <li class="active">专题课程列表</li>
            </ul><!-- .breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form action="{{url('/admin/specialCourse/specialCourseList')}}" method="get" class="form-search">
                    <select name="type" id="form-field-1" class="searchtype">
                        <option value="1" @if($data->type == 1) selected @endif>ID</option>
                        <option value="2" @if($data->type == 2) selected @endif>课程名称</option>
                        <option value="3" @if($data->type == 3) selected @endif>授课讲师</option>
                        <option value="4" @if($data->type == 4) selected @endif>时间筛选</option>
                        <option value="">全部</option>
                    </select>
                    <span class="input-icon">
                        <span style="@if($data->type != 4) display: block;  @else display: none; @endif" class="input-icon" id="search1">
                            <input type="text" name="search" placeholder="Search ..." class="nav-search-input" value="" id="nav-search-input" autocomplete="off" />
                            <i class="icon-search nav-search-icon"></i>
                            <input style="background: #6FB3E0;width:60px;height:28px ;border:0;color:#fff;" type="submit" value="筛选" />
                        </span>
                        <span style="@if($data->type == 4) display: block;  @else display: none; @endif" class="input-icon" id="search2">
                            <input type="text" name="beginTime" id="form-field-1" placeholder="上传开始时间" class="col-xs-10 col-sm-5" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
                            <input type="text" name="endTime" id="form-field-1" placeholder="上传结束时间" class="col-xs-10 col-sm-5" value="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:170px;" />
                            <input style="background: #6FB3E0;width:60px;height:28px ;border:0;color:#fff;" type="submit" value="筛选" />
                        </span>
                    </span>
                </form>
            </div><!-- #nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    专题课程列表
                    <small>
                        <i class="icon-double-angle-right"></i>
                        专题课程列表
                    </small>
                </h1>
            </div><!-- /.page-header -->

            @if (session('status'))
                <div class="alert alert-success">
                    {{ session('status') }}
                </div>
            @endif

            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <a href="{{url('admin/specialCourse/addSpecialCourse')}}" class="btn btn-xs btn-info">
                <i class="icon-ok bigger-110">添加</i>
            </a>

            <div class="row">

                <div class="col-xs-12">
                    <!-- PAGE CONTENT BEGINS -->

                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        {{--<th class="center">--}}
                                        {{--<label>--}}
                                        {{--<input type="checkbox" class="ace" />--}}
                                        {{--<span class="lbl"></span>--}}
                                        {{--</label>--}}
                                        {{--</th>--}}
                                        <th>ID</th>
                                        <th>课程标题</th>
                                        {{--<th>课程描述</th>--}}
                                        <th>课程类型</th>
                                        {{--<th>视频格式</th>--}}
                                        <th>授课讲师</th>
                                        {{--<th>课程</th>--}}
                                        <th>封面图</th>
                                        <th>折扣</th>
                                        <th>价格</th>
                                        <th>浏览数</th>
                                        <th>观看数</th>
                                        <th>收藏数</th>
                                        {{--<th>课程公告</th>--}}
                                        <th>课程状态</th>

                                        <th>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($data as $special)
                                        <tr>
                                            {{--<td class="center">--}}
                                            {{--<label>--}}
                                            {{--<input type="checkbox" class="ace" />--}}
                                            {{--<span class="lbl"></span>--}}
                                            {{--</label>--}}
                                            {{--</td>--}}

                                            <td>
                                                <a href="#">{{$special->id}}</a>
                                            </td>
                                            <td>{{$special->courseTitle}}</td>
                                            {{--<td>{{$special->courseIntro}}</td>--}}
                                            <td>{{$special->typeName}}</td>
                                            {{--<td>{{$special->courseFormat}}</td>--}}
                                            <td>{{$special->realname}}</td>
                                            {{--<td>--}}
                                                {{--<a href="{{url('/lessonSubject/detail/'.$special->id)}}">查看</a>--}}
                                            {{--</td>--}}
                                            <td>
                                                {{--<a id="example2-2" href="{{asset($comcourse->coursePic)}}">查看--}}
                                                <img src="{{asset($special->coursePic)}}" alt="" width="50px" height="50px">
                                                {{--</a>--}}
                                            </td>
                                            <td>
                                                @if($special->courseDiscount != 0)
                                                    {{$special->courseDiscount}} 折
                                                @else
                                                    无
                                                @endif

                                            </td>
                                            <td>{{$special->coursePrice}}</td>
                                            <td>{{$special->courseView}}</td>
                                            <td>{{$special->coursePlayView}}</td>
                                            <td>{{$special->courseFav}}</td>
                                            {{--<td>{{$special->courseNotice}}</td>--}}
                                            <td>{{$special->courseStatus ? '锁定' : '激活'}}</td>

                                            <td>
                                                <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                    {{--<button class="btn btn-xs btn-success">--}}
                                                    {{--<i class="icon-ok bigger-120"></i>--}}
                                                    {{--</button>--}}


                                                <span class="btn btn-xs btn-inverse" style="position: relative;display: inline-block;">
                                                    <strong>课程状态</strong>
                                                    <span class="icon-caret-down icon-on-right"></span>
                                                    <select id="" class="col-xs-10 col-sm-2" onchange="courseCheck({{$special->id}},this.value);" style="filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity:0;opacity: 0;position:absolute;top:-2px;left:0;z-index: 2;cursor: pointer;height:23px;width:73px;">
                                                        <option value="44" selected></option>
                                                        <option value="0" >激活</option>
                                                        <option value="1" >锁定</option>
                                                    </select>
                                                </span>


                                                    <a href="{{url('/admin/specialCourse/specialChapterList/'.$special->id)}}" class="btn btn-xs btn-success">
                                                        <i class="icon-list bigger-120"></i>章节
                                                    </a>

                                                    <a href="{{url('/admin/specialCourse/dataList/'.$special->id)}}" class="btn btn-xs btn-success">
                                                        <i class="icon-download bigger-120"></i>资料
                                                    </a>

                                                    <a href="{{url('/admin/specialCourse/editSpecialCourse/'.$special->id)}}" class="btn btn-xs btn-info">
                                                        <i class="icon-edit bigger-120"></i>
                                                    </a>

                                                    <div href="" class="btn btn-xs btn-warning" ms-click="commentdetailpop({{$special->id}})">
                                                        <i class="icon-flag bigger-120"></i>
                                                    </div>

                                                    <a href="{{url('/admin/specialCourse/delSpecialCourse/'.$special->id)}}" class="btn btn-xs btn-danger" onclick="return confirm('确定要删除吗?');">
                                                        <i class="icon-trash bigger-120"></i>
                                                    </a>

                                                </div>

                                                <div class="visible-xs visible-sm hidden-md hidden-lg">
                                                    <div class="inline position-relative">
                                                        <button class="btn btn-minier btn-primary dropdown-toggle" data-toggle="dropdown">
                                                            <i class="icon-cog icon-only bigger-110"></i>
                                                        </button>

                                                        <ul class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
                                                            <li>
                                                                <a href="#" class="tooltip-info" data-rel="tooltip" title="View">
																				<span class="blue">
																					<i class="icon-zoom-in bigger-120"></i>
																				</span>
                                                                </a>
                                                            </li>

                                                            <li>
                                                                <a href="#" class="tooltip-success" data-rel="tooltip" title="Edit">
																				<span class="green">
																					<i class="icon-edit bigger-120"></i>
																				</span>
                                                                </a>
                                                            </li>

                                                            <li>
                                                                <a href="#" class="tooltip-error" data-rel="tooltip" title="Delete">
																				<span class="red">
																					<i class="icon-trash bigger-120"></i>
																				</span>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                                {!! $data->appends(app('request')->all())->render() !!}

                            </div><!-- /.table-responsive -->
                        </div><!-- /span -->
                    </div><!-- /row -->

                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->


        <!--弹窗显示详情-->
        <div id="detailpupUpback" class="detailpupUpback" ms-visible="popup">
            <div class="popup1">
                <div class="detailtopbaner">
                    <div class="detailtitle">详情</div>
                    <div class="deldetail" ms-click="deldetail"></div>
                </div>
                <div class="content1">

                    <div class="form-group">
                        <lable class="labtitle">标题:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseTitle" />
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">描述:</lable>
                        <textarea name="" id="" readonly cols="30" rows="5" ms-duplex="info.courseIntro"></textarea>
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">课程类型:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.typeName">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">视频格式:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseFormat">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">讲师:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.username">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">课程折扣:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseDiscount">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">价格:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.coursePrice">
                    </div>


                    <div class="form-group">
                        <lable class="labtitle">课程公告:</lable>
                        <textarea name="" id="" readonly cols="30" rows="5" ms-duplex="info.courseNotice"></textarea>
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">浏览数:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseView">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">观看数:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.coursePlayView">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">收藏数:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseFav">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">创建时间:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.created_at">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">更新时间:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.updated_at">
                    </div>


                </div>
            </div>
        </div>

    </div><!-- /.main-content -->

@endsection
@section('js')
    <script language="javascript" type="text/javascript" src="{{asset('DatePicker/WdatePicker.js') }}"></script>
    <script language="javascript" type="text/javascript" src="{{asset('admin/js/searchtype.js') }}"></script>
    <script language="javascript" type="text/javascript" src="{{asset('admin/js/specialCourse/specialCourse.js') }}"></script>
    <script>
        require(['/specialCourse/specialCourse_avalon'], function (detail) {
            avalon.scan();
        });
    </script>
@endsection