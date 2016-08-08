@extends('layouts.layoutAdmin')
@section('css')
    <link rel="stylesheet" type="text/css" href="{{ URL::asset('/admin/jscolor/jquery.bigcolorpicker.css') }}" />
@endsection
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
                    <a href="{{url('/admin/contentManager/bannerList')}}">banner列表</a>
                </li>
                <li class="active">banner添加</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    banner列表
                    <small>
                        <i class="icon-double-angle-right"></i>
                        banner添加
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

                    <form action="{{url('admin/contentManager/addsbanner')}}" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                        <div class="space-4"></div>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 标题名称 </label>

                            <div class="col-sm-9">
                                <input  type="text" name="title" id="form-field-1" placeholder="友链名称" class="col-xs-10 col-sm-5" value="{{old('title')}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 链接地址 </label>

                            <div class="col-sm-9">
                                <input  type="text" name="url" id="form-field-1" placeholder="(填写格式例如: www.baidu.com)" class="col-xs-10 col-sm-5" value="{{old('url')}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 背景颜色 </label>

                            <div class="col-sm-9">
                                <input  id="bgColor" type="text" name="bgColor" id="form-field-1" placeholder="背景颜色" class="col-xs-10 col-sm-5" value="" />
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
                                <img src="" id="uploadPreview" class="col-xs-10 col-sm-5" onerror="this.src='/admin/image/back.png'"/>
                            <span class="help-inline col-xs-12 col-sm-7">
                                <label class="middle">
                                    <span class="lbl"></span>
                                </label>
                            </span>
                            </div>
                        </div>
                        <span style="position:relative;left:313px;font-size:10px;color:red">上传图片推荐大小为(1920 * 656)</span>

                        <div class="space-4"></div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1">  </label>

                            <div class="col-sm-9">
                                <input type="file" id="uploadImage" name="path" onchange="loadImageFile();" style="width:170px;height:40px;position: absolute;top: 0px;opacity: 0;"/>
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
    <script type="text/javascript" src="{{ URL::asset('/admin/jscolor/jquery.bigcolorpicker.min.js') }}"></script>

    <script>
        $(function() {
            $("#bgColor").bigColorpicker("bgColor");
        });
    </script>

@endsection