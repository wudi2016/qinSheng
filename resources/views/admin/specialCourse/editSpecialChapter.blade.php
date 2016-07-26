@extends('layouts.layoutAdmin')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonComment/commentDetail/uploadComment.css')}}">
@endsection
@section('content')
    <div class="main-content" ms-controller="uploadController">
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
                <li class="active">添加课程章节</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    添加课程章节
                    <small>
                        <i class="icon-double-angle-right"></i>
                        添加课程章节
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

                    <div class="form-horizontal" role="form" >
                        <div class="space-4"></div>

                        @if($data->parentId != 0)
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 请选择章 </label>

                            <div class="col-sm-9">
                                {{--<input type="hidden" name="parentId" id="form-field-1" placeholder="章节名称" class="col-xs-10 col-sm-5" value="0" />--}}
                                <select name="parentId" id="belong" class="col-xs-10 col-sm-5" ms-change="parentId(this.value)">
                                    <option value="">--请选择所属章名--</option>
                                    @foreach($chapters as $val)
                                        <option value="{{$val->id}}" @if($data->parentId == $val->id) selected @endif>{{$val->title}}</option>
                                    @endforeach
                                </select>
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle" ms-html="errormessagebelong">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>

                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 是否试学 </label>

                                <div class="col-sm-9">
                                    {{--<input type="hidden" name="parentId" id="form-field-1" placeholder="章节名称" class="col-xs-10 col-sm-5" value="0" />--}}
                                    <select name="isTrylearn" id="istrylearn" class="col-xs-10 col-sm-5">
                                        <option value="0" @if($data->isTrylearn == 0) selected @endif>否</option>
                                        <option value="1" @if($data->isTrylearn == 1) selected @endif>是</option>
                                    </select>
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle" ms-html="errormessagebelong">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                                </div>
                            </div>
                        @endif

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 </label>

                            <div class="col-sm-9">
                                <input type="text" name="title" id="form-field-1" placeholder="名称" class="col-xs-10 col-sm-5" ms-duplex="uploadInfo.title" />
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle" ms-html="errormessagetitle">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>

                        <div class="space-4"></div>

                        @if($data->parentId != 0)
                        <div class="form-group">

                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 添加视频 </label>

                            {{--<div class="col-sm-9">--}}
                                {{--<input type="hidden" name="organurl" value="{{$data->url}}">--}}
                                {{--<img src="{{asset('admin/image/up.png')}}" alt="" id="form-field-1" style="position:absolute;">--}}
                                {{--<input type="file" name="url" id="file_upload" multiple="true" value="" />--}}
                                {{--<div class="uploadarea_bar_r_msg"></div>--}}
                                {{--<div id="uploadurl"></div>--}}
                            {{--</div>--}}

                            {{--<div style="clear: both; height: 50px;"></div>--}}

                            <div id="fileDiv" class="fileButton"></div>
                            <input type="text" value="" class="fileButton" id="md5container">

                            <div class="add_video">
                                <div class="add_video_top">
                                    <div></div>
                                    <div ms-slectfile='file'>本地上传</div>
                                    <div>请上传不超过1GB大小的视频文件</div>
                                </div>
                                <div class="add_video_tip" style="display: none;" ms-visible="uploadStatus == 1">(支持mp4、fiv、avi、rmvb、wmv、mkv格式上传)</div>
                                <div class="add_video_loading" style="display: none;" ms-visible="uploadStatus == 2">
                                    <div class="progress_bar">
                                        <div ms-css-width="[--progressBar--]%"></div>
                                    </div>
                                    <div class="progress_tip">视频上传中，请勿关闭页面...</div>
                                    <div class="progress_close" ms-click="endUpload()">取消上传</div>
                                </div>
                                <div class="add_video_success" style="display: none;" ms-visible="uploadStatus == 3" ms-html='uploadTip'></div>
                            </div>
                            <div style="clear: both; height: 20px;"></div>

                        </div>

                        <div class="space-4"></div>

                        <div class="form-group">

                        </div>
                        @endif

                        @if($data->parentId == 0)
                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="submit" ms-click="submit({{$data->id}},{{$data->courseId}},1)">
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
                        @endif

                        @if($data->parentId != 0)
                            <div class="clearfix form-actions">
                                <div class="col-md-offset-3 col-md-9">
                                    <button class="btn btn-info" type="submit" ms-click="submit({{$data->id}},{{$data->courseId}},2)">
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
                        @endif

                        <input type="hidden" name="_token" value="{{ csrf_token() }}">

                    </div>

                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div><!-- /.main-content -->
@endsection
@section('js')
    <script language="javascript" type="text/javascript" src="{{asset('admin/js/searchtype.js') }}"></script>

    <script>
        require(['/specialCourse/editChapter'], function (upload) {
            avalon.directive('slectfile', {
                update: function(value) {
                    var vmodel = this.vmodels[0];
                    $(this.element).unbind();
                    $(this.element).click(function() {
                        if (vmodel.uploadStatus == 2) return false;
                        document.getElementById('fileDiv').innerHTML = '<input type="file" value="" class="fileButton" id="fileObject">';
                        $('#fileObject').bind('change', function() {
                            vmodel.file = document.getElementById('fileObject').files[0];
                            document.getElementById('fileDiv').innerHTML = '';
                            vmodel.uploadResource($(this).val());
                            return;
                        });
                        $('#fileObject').click();
                    });
                }
            });

            upload.csrf = '{{ csrf_token() }}' || null;
//            console.log(upload.csrf);
            upload.uploadInfo.title = '{{$data->title}}' || null,
            upload.uploadInfo.fileID = '{{$data->fileID}}' || null,
            upload.uploadInfo.courseLowPath = '{{$data->courseLowPath}}' || null,
            upload.uploadInfo.courseMediumPath = '{{$data->courseMediumPath}}' || null,
            upload.uploadInfo.courseHighPath = '{{$data->courseHighPath}}' || null,
            upload.uploadInfo.isTrylearn = '{{$data->isTrylearn}}' || null,

            avalon.scan();
        });

    </script>

@endsection