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
                    <a href="{{url('/admin/contentManager/hotvideoList')}}">热门视频列表</a>
                </li>
                <li class="active">编辑</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    内容管理
                    <small>
                        <i class="icon-double-angle-right"></i>
                        编辑
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

                    <form action="{{url('admin/contentManager/editshotvideo')}}" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                        <div class="space-4"></div>

                        <input type="hidden" name="id"  value="{{$data->id}}"  >



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 上传资源 </label>

                            <div class="col-sm-9">
                                <input type="hidden" name="organurl" value="{{$data->coursePath}}">
                                <img src="{{asset('admin/image/sczy.png')}}" alt="" id="form-field-1" style="position:absolute;">
                                <input type="file" name="coursePath" id="file_upload" multiple="true" value="" />
                                <div class="uploadarea_bar_r_msg"></div>
                                <div id="uploadurl"></div>
                            </div>
                        </div>

                        <div class="space-4"></div>
                        {{--<div style="height:30px"></div>--}}



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 视频标题 </label>

                            <div class="col-sm-9">
                                <input  type="text" name="title" id="form-field-1" placeholder="视频标题" class="col-xs-10 col-sm-5" value="{{$data->title}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 视频内容介绍 </label>

                            <div class="col-sm-9">
                                <input  type="text" name="videoIntro" id="form-field-1" placeholder="视频内容介绍" class="col-xs-10 col-sm-5" value="{{$data->videoIntro}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 排序位置 </label>

                            <div class="col-sm-9">
                                <input  type="text" name="sort" id="form-field-1" placeholder="排序位置" class="col-xs-10 col-sm-5" value="{{$data->sort}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>


                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 封面图 </label>

                            <div class="col-sm-9">
                                <img src="{{asset($data->cover)}}" id="uploadPreview" class="col-xs-10 col-sm-5" onerror="this.src='/admin/image/back.png'"/>
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>

                        <div class="space-4"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">  </label>

                            <div class="col-sm-9">
                                <input type="file" id="uploadImage" name="cover" onchange="loadImageFile();" style="width:170px;height:40px;position: absolute;top: 0px;opacity: 0;"/>
                                <div class="second_file"><img src="/admin/image//1.png"/></div>
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>

                        <div class="space-4"></div>






                        <div class="clearfix form-actions">
                            <div class="col-md-offset-3 col-md-9">
                                <button class="btn btn-info" type="submit">
                                    <i class="icon-ok bigger-110"></i>
                                    确定
                                </button>

                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset">
                                    <i class="icon-undo bigger-110"></i>
                                    重置
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
    <script language="javascript" type="text/javascript" src="{{asset('DatePicker/WdatePicker.js') }}"></script>
    <script language="javascript" type="text/javascript" src="{{asset('admin/js/searchtype.js') }}"></script>
    <script type="text/javascript" src="{{ URL::asset('/admin/js/addSubject.js') }}"></script>
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
            'uploader' : '/admin/contentManager/dohotvideo',
            'buttonText' : '',
            'width':'160',
            'height':'40',
            'post_params' : {
                '_token' : '{{csrf_token()}}'
            },
            'onUploadSuccess' : function(file, data, response) {
                evaluatPic = '<input type="hidden" name="coursePath" value="'+data+'">';
                $('#uploadurl').html(evaluatPic);
                if(data){
                    setTimeout('addMsg()',3000);
                }
            }
        });
    </script>

@endsection