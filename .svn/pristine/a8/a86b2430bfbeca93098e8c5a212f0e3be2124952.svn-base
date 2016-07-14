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
                    <a href="{{url('/admin/specialCourse/specialCourseList')}}">课程管理</a>
                </li>
                <li class="active">添加课程资料</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    添加课程资料
                    <small>
                        <i class="icon-double-angle-right"></i>
                        添加课程资料
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

                    <form action="{{url('admin/specialCourse/doAddData')}}" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                        <div class="space-4"></div>
                        <input type="hidden" name="courseid"  value="{{$courseid}}" />

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 资料名称 </label>

                            <div class="col-sm-9">
                                <input type="text" name="dataName" id="form-field-1" placeholder="资料名称" class="col-xs-10 col-sm-5" value="" />
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>

                        <div class="space-4"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 资料 </label>

                            <div class="col-sm-9">
                                {{--<input type="hidden" name="organurl" value="{{$data->url}}">--}}
                                <img src="{{asset('admin/image/up.png')}}" alt="" id="form-field-1" style="position:absolute;">
                                <input type="file" name="url" id="file_upload" multiple="true" value="" />
                                <div class="uploadarea_bar_r_msg"></div>
                                <div id="uploadurl"></div>
                            </div>
                        </div>

                        <div class="space-4"></div>

                        <div class="form-group">

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
    </div><!-- /.main-content -->
@endsection
@section('js')
    <script type="text/javascript" src="{{ URL::asset('admin/js/jquery.uploadify.js') }}"></script>
    <link rel="stylesheet" type="text/css" href="{{ URL::asset('admin/css/upload.css') }}">
    <script>
        //上传文件
        var evaluatPic = '';

        var addMsg = function(){
            $('.uploadarea_bar_r_msg').html('资源上传成功!');
        }

        $('#file_upload').uploadify({
            'swf'      : '/admin/image/uploadify.swf',
            'uploader' : '/admin/specialCourse/doUploadfile',
            'buttonText' : '',
            'width':'160',
            'height':'40',
            'post_params' : {
                '_token' : '{{csrf_token()}}'
            },
            'onUploadSuccess' : function(file, data, response) {
                evaluatPic = '<input type="hidden" name="dataPath" value="'+data+'">';
                $('#uploadurl').html(evaluatPic);
                if(data){
                    setTimeout('addMsg()',4000);
                }
            }
        });
    </script>
@endsection