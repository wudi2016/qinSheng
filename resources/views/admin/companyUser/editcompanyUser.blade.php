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
                    <a href="{{url('/admin/companyUser/companyUserList')}}">后台用户管理</a>
                </li>
                <li class="active">编辑</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    后台用户管理
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

                    <form action="{{url('admin/companyUser/editscompanyUser')}}" method="post" class="form-horizontal" role="form" enctype="multipart/form-data">
                        <div class="space-4"></div>

                        <input type="hidden" name="id"  value="{{$data->id}}"  >


                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 用户名 </label>

                            <div class="col-sm-9">
                                <input  disabled="true"  type="text" name="username" id="form-field-1" placeholder="用户名" class="col-xs-10 col-sm-5" value="{{$data->username}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>




                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 真实姓名 </label>

                            <div class="col-sm-9">
                                <input  type="text" name="realname" id="form-field-1" placeholder="真实姓名" class="col-xs-10 col-sm-5" value="{{$data->realname}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>




                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 电话 </label>

                            <div class="col-sm-9">
                                <input  type="text" id="phone"  name="phone" id="form-field-1" placeholder="电话" class="col-xs-10 col-sm-5" value="{{$data->phone}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                        <span class="phone_error" style="position:relative;top:5px;font-size:10px;color:red"></span>
                                    </label>
                                </span>
                            </div>
                        </div>

                        <div class="space-4"></div>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 邮箱 </label>

                            <div class="col-sm-9">
                                <input  type="text"  id="email" name="email" id="form-field-1" placeholder="邮箱" class="col-xs-10 col-sm-5" value="{{$data->email}}" />
                                    <span class="help-inline col-xs-12 col-sm-7">
                                    <label class="middle">
                                        <span class="lbl"></span>
                                        <span class="email_error" style="position:relative;top:5px;font-size:10px;color:red" ></span>
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


    <script>
        $('#phone').blur(function(){
            var tel = $("input[name='phone']").val();
            var isMobile=/^(?:13\d|15\d)\d{5}(\d{3}|\*{3})$/;
//            var isPhone=/^((0\d{2,3})-)?(\d{7,8})(-(\d{3,}))?$/;
            if(!isMobile.test(tel)){
                $('#phone').val('');
                $('.phone_error').html("请正确填写电话号码");
                return false;
            }else{
                $('.phone_error').html("可以使用");
            }
        })


        $('#email').blur(function(){
            var ema = $("input[name='email']").val();
            var isEmail = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
            if(!isEmail.test(ema)){
                $('#email').val();
                $('.email_error').html("请正确填写邮箱格式");
                return false;
            }else{
                $('.email_error').html("可以使用");
            }

        })



    </script>


@endsection