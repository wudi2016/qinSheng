@extends('layouts.layoutAdmin')
@section('css')
    <link rel="stylesheet" href="{{asset('admin/css/popUp.css')}}" />
@endsection
@section('content')
    <div class="main-content" ms-controller="teachercommentdetail">
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
                    <a href="{{url('/admin/commentCourse/commentCourseList')}}">点评管理</a>
                </li>
                <li class="active">点评视频列表</li>
            </ul><!-- .breadcrumb -->

            <div class="nav-search" id="nav-search">
                <form action="{{url('/admin/commentCourse/teacherCourseList')}}" method="get" class="form-search">
                    <span style=""  class="searchtype" iid="form-field-1">
                        <input type="text" name="beginTime" id="form-field-1" placeholder="开始时间" class="col-xs-10 col-sm-5" value="{{$data->beginTime}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:170px;background:url('{{asset("admin/image/2.png")}}') no-repeat;background-position:right;"/>&nbsp;&nbsp;
                        <input type="text" name="endTime" id="form-field-1" placeholder="结束时间" class="col-xs-10 col-sm-5" value="{{$data->endTime}}" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" style="width:170px;margin-left:10px;background:url('{{asset("admin/image/2.png")}}') no-repeat;background-position:right;"/>
                    </span>

                    <select name="type" id="form-field-1" class="searchtype">
                        <option value="">--请选择--</option>
                        <option value="1" @if($data->type == 1) selected @endif>ID</option>
                        <option value="2" @if($data->type == 2) selected @endif>订单号</option>
                        <option value="3" @if($data->type == 3) selected @endif>作品名称</option>
                        <option value="4" @if($data->type == 4) selected @endif>演奏学员</option>
                        <option value="5" @if($data->type == 5) selected @endif>邀评名师</option>
                        <option value="">全部</option>
                    </select>
                    <span class="input-icon">
                        <span style="" class="input-icon" id="search1">
                            <input type="text" name="search" placeholder="Search ..." class="nav-search-input" value="" id="nav-search-input" autocomplete="off" />
                            <input style="background: #6FB3E0;width:50px;height:28px ;border:0;color:#fff;padding-left: 5px;" type="submit" value="搜索" />
                        </span>
                    </span>
                </form>
            </div><!-- #nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    点评视频列表
                    <small>
                        <i class="icon-double-angle-right"></i>
                        点评视频列表
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
                                        <th>订单号</th>
                                        <th>点评视频标题</th>
                                        <th>课程类型</th>
                                        <th>演奏者</th>
                                        <th>课程</th>
                                        <th>封面图</th>
                                        {{--<th>高清</th>--}}
                                        {{--<th>超清</th>--}}
                                        <th>点评名师</th>
                                        <th>浏览数</th>
                                        <th>学习数(true)</th>
                                        <th>学习数</th>
                                        <th>收藏数</th>
                                        <th>课程状态</th>
                                        <th>最近审核时间</th>
                                        <th>审核状态</th>
                                        <th>价格</th>
                                        <th>折扣</th>
                                        <th>折扣后价钱</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                    @foreach($data as $teaccourse)
                                        <tr>
                                        {{--<td class="center">--}}
                                            {{--<label>--}}
                                                {{--<input type="checkbox" class="ace" />--}}
                                                {{--<span class="lbl"></span>--}}
                                            {{--</label>--}}
                                        {{--</td>--}}

                                        <td>
                                            <a href="#">{{$teaccourse->id}}</a>
                                        </td>
                                        <td>{{$teaccourse->orderSn}}</td>
                                        <td>{{$teaccourse->courseTitle}}</td>
                                        <td>{{$teaccourse->typeName}}</td>
                                        <td>{{$teaccourse->userName}}</td>
                                        <td style="color: #0b6cbc">
                                            @if(!$teaccourse->courseLowPath && !$teaccourse->courseMediumPath && !$teaccourse->courseHighPath)
                                                @if($teaccourse->msg['code'] == '200')
                                                    正在转码...
                                                @else
                                                    {{$teaccourse->msg['message']}}
                                                @endif
                                            @else
                                                <span class="lookVideo" onclick="lookVideo('{{$teaccourse->courseLowPathurl}}')" style="color: #00a0e9;cursor:pointer;">查看</span>
                                            @endif
                                        </td>
                                        <td>
                                            {{--<a id="example2-2" href="{{asset($comcourse->coursePic)}}">查看--}}
                                                <img src="{{asset($teaccourse->coursePic)}}" alt="" width="50px" height="50px" onerror="this.src='/admin/image/back.png'">
                                            {{--</a>--}}
                                        </td>
                                        {{--<td>--}}
                                            {{--<a href="{{$comcourse->courceHighPath}}">查看</a>--}}
                                        {{--</td>--}}
                                        <td>{{$teaccourse->teacherName}}</td>
                                        <td>{{$teaccourse->courseView}}</td>
                                        <td>{{$teaccourse->courseStudyNum}}</td>
                                        <td>{{$teaccourse->coursePlayView}}</td>
                                        <td>{{$teaccourse->courseFav}}</td>
                                        <td>{{$teaccourse->courseStatus ? '锁定' : '激活'}}</td>
                                        <td>{{$teaccourse->lastCheckTime}}</td>
                                        <td>
                                            @if($teaccourse->state == 0) 审核未通过 @elseif($teaccourse->state == 1) 审核中 @else 审核通过 @endif
                                        </td>
                                        <td>{{$teaccourse->coursePrice}}</td>
                                        <td>
                                            @if($teaccourse->courseDiscount != 0)
                                                {{$teaccourse->courseDiscount}} 折
                                            @else
                                                无
                                            @endif

                                        </td>
                                        <td>{{$teaccourse->discountPrice}}</td>
                                        <td>
                                            <div class="visible-md visible-lg hidden-sm hidden-xs btn-group">
                                                {{--<button class="btn btn-xs btn-success">--}}
                                                    {{--<i class="icon-ok bigger-120"></i>--}}
                                                {{--</button>--}}

                                                @permission('edit.commentcourse')
                                                <span class="btn btn-xs btn-primary" style="position: relative;display: inline-block;">
                                                    <strong>审核状态</strong>
                                                    <span class="icon-caret-down icon-on-right"></span>
                                                    <select id="selectCheck" class="col-xs-10 col-sm-2" onchange="selectCheck({{$teaccourse->id}},this.value,'{{$teaccourse->userId}}','{{$teaccourse->username}}','{{$teaccourse->teacherusername}}','{{$teaccourse->studentPhone}}','{{$teaccourse->orderSn}}');" style="filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity:0;opacity: 0;position:absolute;top:-2px;left:0;z-index: 2;cursor: pointer;height:23px;width:73px;">
                                                        <option value="44" selected></option>
                                                        <option value="0" >审核未通过</option>
                                                        <option value="1" >审核中</option>
                                                        <option value="2" >审核通过</option>
                                                    </select>
                                                </span>
                                                @endpermission

                                                @permission('edit.commentcourse')
                                                <span class="btn btn-xs btn-inverse" style="position: relative;display: inline-block;">
                                                    <strong>课程状态</strong>
                                                    <span class="icon-caret-down icon-on-right"></span>
                                                    <select id="" class="col-xs-10 col-sm-2" onchange="courseCheck({{$teaccourse->id}},this.value);" style="filter:alpha(opacity=0); -moz-opacity:0; -khtml-opacity:0;opacity: 0;position:absolute;top:-2px;left:0;z-index: 2;cursor: pointer;height:23px;width:73px;">
                                                        <option value="44" selected></option>
                                                        <option value="0" >激活</option>
                                                        <option value="1" >锁定</option>
                                                    </select>
                                                </span>
                                                @endpermission

                                                @permission('edit.commentcourse')
                                                <a href="{{url('/admin/commentCourse/editTeacherCourse/'.$teaccourse->id)}}" class="btn btn-xs btn-info">
                                                    <i class="icon-edit bigger-120"></i>
                                                </a>
                                                @endpermission

                                                @permission('del.commentcourse')
                                                <a href="{{url('/admin/commentCourse/delTeacherCourse/'.$teaccourse->id)}}" class="btn btn-xs btn-danger" onclick="return confirm('确定要删除吗?');">
                                                    <i class="icon-trash bigger-120"></i>
                                                </a>
                                                @endpermission

                                                @permission('check.commentcourse')
                                                <div href="" class="btn btn-xs btn-warning" ms-click="commentdetailpop({{$teaccourse->id}})">
                                                    <i class="icon-flag bigger-120"></i>
                                                </div>
                                                @endpermission

                                                <a href="{{url('/admin/commentCourse/addRecommendCourse/'.$teaccourse->id)}}" class="btn btn-xs btn-info">
                                                    <i class=" bigger-110"></i>推荐
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

        <!--审核通过弹窗-->
        <div id="pupUpback1" class="pupUpback">
            <div class="popup">
                <div class="topbaner">审核结果</div>
                <div class="content">审核通过!</div>
                <div class="bottom">
                    <input type="hidden" name="actionId" class="redactionId" value="">
                    <input type="hidden" name="fromUsername" class="redfromUsername" value="">
                    <input type="hidden" name="userId" class="reduserId" value="">
                    <input type="hidden" name="username" class="redusername" value="">
                    <input type="hidden" name="redtoUsername" class="redtoUsername" value="{{\Auth::user()->username}}">

                    <input type="hidden" name="studentPhone" class="redstudentPhone" value="">
                    <input type="hidden" name="orderSn" class="redorderSn" value="">
                    <div class="suer_btn" id="suer_btn0">确认</div>
                </div>
            </div>
        </div>
        <!--审核未通过弹窗-->
        <div id="pupUpback2" class="pupUpback">
            <div class="popup">
                <div class="topbaner">审核结果</div>
                <form action="{{url('/admin/commentCourse/noPassMsg')}}" method="post">
                    <div class="contenterror">
                        <div class="errortitle">审核未通过</div>
                        <div class="errormsg">
                            <lable>原因:</lable>
                            <textarea name="content" maxlength="20"  placeholder="请输入审核未通过的原因(不超过20个汉字)..." id="errortext" cols="30" rows="10" required></textarea>
                        </div>

                    </div>
                    <input type="hidden" name="actionId" class="actionId"  value="">
                    <input type="hidden" name="username" class="username" value="">
                    <input type="hidden" name="toUsername" class="toUsername" value="">
                    <input type="hidden" name="fromUsername" value="{{\Auth::user()->username}}">
                    <input type="hidden" name="_token" class="token" value="{{ csrf_token() }}">
                    <div class="bottom" id="surebtn">
                        <button class="suer_btn">确认</button>
                    </div>
                    {{--<div class="bottom" id="hiddenbtn">--}}
                    {{--<div class="suer_btn">确认</div>--}}
                    {{--</div>--}}
                </form>

            </div>
        </div>

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
                        <lable class="labtitle">演奏学员:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.username">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">学员手机号:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.phone">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">学员试用等级:</lable>
                        <input type="text" name="" id="" readonly ms-duplex="info.suitlevel">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">名师:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.teachername">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">名师手机号:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.teacherphone">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">浏览数:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseView">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">学习数(true):</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseStudyNum">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">学习数:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.coursePlayView">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">收藏数:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.courseFav">
                    </div>

                    {{--<div class="form-group">--}}
                        {{--<lable class="labtitle">上传日期:</lable>--}}
                        {{--<input type="text" readonly placeholder="" ms-duplex="info.addTime">--}}
                    {{--</div>--}}

                    <div class="form-group">
                        <lable class="labtitle">最近审核时间:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.lastCheckTime">
                    </div>

                    <div class="form-group">
                        <lable class="labtitle">价格:</lable>
                        <input type="text" readonly placeholder="" ms-duplex="info.coursePrice">
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


        <!--视频弹窗显示详情-->
        <div id="videodetailpupUpback" class="videodetailpupUpback">
            <div class="videopopup1" style="width: 700px;height: 400px;margin-top: -150px;margin-left: -350px;">
                <div class="videodetailtopbaner">
                    <div class="detailtitle" style="width: 650px;padding-left: 40px">视频</div>
                    <div class="deldetail" style="float: right"></div>
                </div>
                <div class="content1">
                    <div id="myplayer" ></div>
                </div>
            </div>
        </div>

    </div><!-- /.main-content -->

@endsection
@section('js')
    <script language="javascript" type="text/javascript" src="{{asset('DatePicker/WdatePicker.js') }}"></script>
    <script language="javascript" type="text/javascript" src="{{asset('admin/js/searchtype.js') }}"></script>
    <script language="javascript" type="text/javascript" src="{{asset('admin/js/teacherCourse/teacherCourse.js') }}"></script>
    <script>
         require(['/teacherCourse/teacCourse_avalon'], function (detail) {
             avalon.scan();
        });
    </script>

    <script type="text/javascript" src="{{asset('home/jplayer/jwplayer.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/layout/jquery.min.js') }}"></script>
    <script type="text/javascript" src="{{asset('admin/js/videoPop.js') }}"></script>
@endsection