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
                <li class="active">个人详情</li>
            </ul><!-- .breadcrumb -->
        </div>

        <div class="page-content">
            <div class="page-header">
                <h1>
                    用户管理
                    <small>
                        <i class="icon-double-angle-right"></i>
                        个人详情
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
                                               value="{{$data->username}}"/>
                                    </div>
                                </div>

                                @if($data->type == 1)
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">真实姓名：</label>

                                        <div class="col-sm-9">
                                            <input type="text" id="form-field-1" readonly placeholder="realname" class="col-xs-10 col-sm-5"
                                                   value="{{$data->realname}}"/>
                                        </div>
                                    </div>
                                @endif
                                {{--<div class="form-group">--}}
                                    {{--<label class="col-sm-3 control-label no-padding-right" for="form-field-1">邮箱：</label>--}}

                                    {{--<div class="col-sm-9">--}}
                                        {{--<input type="text" id="form-field-3" readonly class="col-xs-10 col-sm-5" value="{{\Auth::user()->email}}"/>--}}
                                    {{--</div>--}}
                                {{--</div>--}}

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 性别： </label>

                                    <div class="col-sm-9">
                                        <input class="col-xs-10 col-sm-5" type="text" readonly value="@if($data->sex==1) 男 @elseif($data->sex==2) 女 @endif"/>
                                        <div class="space-2"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-4">手机号：</label>

                                    <div class="col-sm-9">
                                        <input class="col-xs-10 col-sm-5" readonly  type="text" name="phone" id="form-field-4"
                                               placeholder="Phone" value="{{$data->phone}}"/>
                                        <div class="space-2"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-2"> 审核状态： </label>

                                    <div class="col-sm-9">
                                        <input class="col-xs-10 col-sm-5" readonly  type="text" value="@if($data->checks==0) 激活 @elseif($data->checks==1) 禁用 @endif "/>
                                        <div class="space-2"></div>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">居住地</label>

                                    <div class="col-sm-9">
                                        <input class="col-xs-10 col-sm-3" readonly placeholder="省份" type="text" value="{{$data->province ? $data->province->name : ''}}"/>
                                        <input class="col-xs-10 col-sm-2" readonly placeholder="市区"  type="text" value="{{$data->city ? $data->city->cityName : ''}}"/>
                                        <div class="space-2"></div>
                                    </div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">用户身份：</label>

                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-5" value="@if($data->type == 0) 学生学员 @elseif($data->type == 1) 教师学员 @else 名师 @endif "/>
                                    </div>
                                </div>

                                {{--教师--}}
                                @if($data->type == 2)
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">学历：</label>

                                        <div class="col-sm-9">
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-5" value="{{$data->education}}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">职称：</label>

                                        <div class="col-sm-9">
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-5" value="{{$data->professional}}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所在单位：</label>

                                        <div class="col-sm-9">
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-5" value="{{$data->company}}"/>
                                        </div>
                                    </div>

                                    {{--<div class="form-group">--}}
                                        {{--<label class="col-sm-3 control-label no-padding-right" for="form-field-1">毕业院校：</label>--}}

                                        {{--<div class="col-sm-9">--}}
                                            {{--<input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-5" value="{{$data->school}}"/>--}}
                                        {{--</div>--}}
                                    {{--</div>--}}

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">名师介绍：</label>

                                        <div class="col-sm-9">
                                            {{--<input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-5" value="{{$data->school}}"/>--}}
                                            <textarea name="intro" readonly id="form-field-3" class="col-xs-10 col-sm-5" cols="30" rows="10" style="resize: none">{{$data->intro}}</textarea>
                                        </div>
                                    </div>
                                {{--学生--}}
                                @else
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">生日：</label>

                                        <div class="col-sm-9">
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-2" value="{{($data->birthYear?:' -- ').'年'}}"/>
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-1" value="{{($data->birthMonth?:' -- ').'月'}}"/>
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-1" value="{{($data->birthDay?:' -- ').'日'}}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">当前等级：</label>

                                        <div class="col-sm-9">
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-5" value="{{$data->pianoGrade}}"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">开始学琴时间：</label>

                                        <div class="col-sm-9">
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-3" value="{{($data->learnYear?:' -- ') .'年'}}"/>
                                            <input type="text" id="form-field-3" readonly  class="col-xs-10 col-sm-2" value="{{($data->learnMonth?:' -- ').'月'}}"/>
                                        </div>
                                    </div>



                                @endif




                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">创建时间：</label>

                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-1" readonly  placeholder="created_at" class="col-xs-10 col-sm-5"
                                               value="{{$data->created_at}}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">最近登录时间：</label>

                                    <div class="col-sm-9">
                                        <input type="text" id="form-field-1" readonly  placeholder="updated_at" class="col-xs-10 col-sm-5"
                                               value="{{$data->updated_at}}"/>
                                    </div>
                                </div>

                                <div class="clearfix form-actions">
                                    <div class="col-md-offset-3 col-md-4">
                                        <a href="{{url('admin/users/userList')}}" class="btn btn-info btn-block" style="margin-left: -15px;">
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
