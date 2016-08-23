@extends('layouts.layoutHome')

@section('title', '社区首页')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/community/community.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/community/pagination.css')}}">


    <style>
        

         .paginationjs-prev{
            position: relative;
            top:-110px;
            left:-20px;
            opacity: 0; 
            filter:alpha(opacity=0);
        }

        
        .paginationjs-next{
            float: left;
            position: relative;
            top:-105px;
            left:1095px;
            opacity: 0;
            filter:alpha(opacity=0);
            z-index:2;
        }
       

    </style>


@endsection

@section('content')



    <div class="background" ms-controller="community">

        <div style="height:21px"></div>

        <div class="main_img">
            <img src="{{url('home/image/community/banner.jpg')}}" alt=""/>
        </div>
        <div style="height:90px"></div>

        <!-- 名师 新闻 模块   -->
        <div class="teacher_new">

            <!-- 名师主页 -->
            <div class="teacher">
                <!-- title more -->
                <div class="title_more">
                    <div class="teacher_title">
                        <span>名师主页</span>
                    </div>
                    <div class="teacher_more">
                        <a href="{{asset('community/theteacher/' )}}"><span>更多></span></a>
                    </div>
                </div>

                <!-- 名师主题内容列表 -->
                <div class="teacher_content">


                    <!-- 循环内容 -->
                    <div class="teacher_content_detail" ms-repeat="theteacherlist">
                        <!-- 图片 -->
                        <div class="teacher_content_img">
                            <a  ms-attr-href="teacherhomepage + el.userId" ><img ms-attr-src="el.cover" alt="" width="300px" height="200px"/></a>
                        </div>
                        <!-- 文字信息 -->
                        <div class="teacher_content_font">
                            <!-- 姓名 -->
                            <div class="content_name">
                                <a ms-attr-href="teacherhomepage + el.userId">
                                    <div ms-html="el.name"><b></b></div>
                                </a>
                            </div>
                            <!-- 学校 -->
                            <div class="content_school">
                                <a ms-attr-href="teacherhomepage + el.userId">
                                    <div ms-html="el.school"></div>
                                </a>
                            </div>
                            <!-- 介绍 -->
                            <div class="content_introduce">
                                <a ms-attr-href="teacherhomepage + el.userId">
                                    <div ms-html="el.intro | truncate(70, '...')" ms-theteacheryincang></div>
                                </a>
                            </div>
                        </div>
                    </div>



                </div>

            </div>


            <!-- 右部分 -->
            <div class="new">
                <!-- title more -->
                <div class="title_more2">
                    <div class="teacher_title">
                        <span>新闻资讯</span>
                    </div>
                    <div class="teacher_more">
                        <a href="{{asset('community/newlist')}}"><span>更多></span></a>
                    </div>
                </div>

                <!-- 循环 -->
                <div class="new_content" ms-repeat="newlist">
                    <!-- 图片 -->
                    <div class="new_content_img"  >
                        <div ms-html=" $index+1 "> </div>
                    </div>
                    <!-- 文字 -->
                    <div class="new_content_font">
                        <a ms-attr-href=" theteacherlisturl + el.id ">
                            <div ms-html="el.description" ms-newyincang></div>
                        </a>
                    </div>
                </div>


            </div>

        </div>


        <!-- 最新学员 -->
        <div class="newstudent" >
            <!-- 标题 -->
            <div class="newstudent_title">
                <div>
                    <span>最新学员</span>
                </div>
            </div>
            <!-- 内容列表 -->
            <div class="newstudent_detail">
                {{--上一页--}}
                <div class="newstudent_left"    ms-showhideleft >
                    <div class="newstudent_left_img  hide"  >
                        <img src="{{url('home/image/community/36.png')}}"  alt="">
                    </div>
                </div>
                <div class="newstudent_detail_content">
                    <!-- 循环 -->
                    <!-- 图片和名字 -->
                    <div class="newstudent_img_name" ms-repeat="studentlist">
                        <!-- 图片 -->
                        <div class="newstudent_img">
                            <a ms-attr-href="studenthomepage + el.id"><img ms-attr-src="el.pic" alt="" width="84" height="84"/></a>
                        </div>
                        <!-- 名字 -->
                        <div class="newstudent_name"  ms-attr-title="el.name" >
                            <a ms-attr-href="studenthomepage + el.id"><div ms-html="el.name"></div></a>
                        </div>
                    </div>
                </div>
                {{--下一页--}}
                <div class="newstudent_right"  ms-showhideleft >
                    <div class="newstudent_right_img hide ">
                        <img src="{{url('home/image/community/37.png')}}"  alt="">
                    </div>
                </div>
            </div>
            <div id="demo" ms-fenye ></div>

        </div>


        <!-- 最热视频 -->
        <div class="hotvideo" ms-if-loop="Yes">
            <!-- 标题 -->
            <div class="newstudent_title">
                <div>
                    <span>最热视频</span>
                </div>
            </div>
            <div style="height:30px"></div>

            <!-- 图片 -->
            <div class="first_child">
                <!-- 循环 -->
                    <div class="newstudent_video" ms-repeat="hotvideo">
                        <div style="overflow: hidden;position: relative;width: 390px;height: 260px;">
                            <a ms-attr-href="hotvideourl + el.id"><img class="big_img" ms-bigImg ms-attr-src="el.cover" alt="" width="390" height="260"/></a>
                        </div>
                        <!-- 遮罩层 -->
                        <div class="zhezhao">
                            <span ms-html="el.title"></span>
                        </div>
                    </div>
            </div>

        </div>


        <div style="height:175px" id="kongbai" >

        </div>


    </div>







@endsection

@section('js')

    <script type="text/javascript" src="{{asset('home/js/community/community.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/community/pagination.js')}}"></script>

    <script>
        require(['/community/community.js'], function (model) {


            avalon.scan();
        });




    </script>




    {{--<script>--}}
        {{--function getdata(){--}}

            {{--$('#demo').pagination({--}}
                {{--dataSource: function(done) {--}}
                    {{--$.ajax({--}}
                        {{--type: 'GET',--}}
                        {{--url: '/community/getstudent/',--}}
                        {{--dataType : 'json',--}}
                        {{--success: function(response) {--}}
                             {{--// console.log(response);--}}
                            {{--if(response.statuss){--}}
                                {{--done(response.data);--}}
                            {{--}--}}
                        {{--}--}}
                    {{--});--}}
                {{--},--}}
                {{--pageSize: 6,--}}
                {{--className:"paginationjs-theme-blue",--}}
                {{--showPageNumbers: false,--}}
                {{--showNavigator: false,--}}
                {{--callback: function(data) {--}}
{{--//                    console.log(data);--}}
                    {{--if(data){--}}
                        {{--var str = '';--}}
                        {{--$.each(data,function(id,info){--}}
                            {{--str += "<div class=\"newstudent_img_name\"><div class=\"newstudent_img\"><a href=\""+'/lessonComment/student/'+info.id+"\"><img widht='84px' height='84px' src="+info.pic+"></a></div><div class=\"newstudent_name\"><a href=\""+'/lessonComment/student/'+info.id+"\"><span>"+info.name+"</span></a></div></div>";--}}
                        {{--})--}}
                        {{--$('.newstudent_detail_content').html(str);--}}
                    {{--}--}}

                    {{--// console.log(data);--}}
                {{--}--}}
            {{--})--}}
        {{--}--}}

        {{--getdata();--}}
        {{----}}

    {{--</script>--}}
    




@endsection
