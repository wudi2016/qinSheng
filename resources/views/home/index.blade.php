@extends('layouts.layoutHome')

@section('title', '首页')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/index/index.css')}}">
@endsection

@section('content')
    <div ms-controller="index">
    <!-- 滚动栏 -->
    <div class="bar">
        <div class="banner">
            <ul>
                @foreach ($banners as $banner)
                <li><a href="{{url('http://'.$banner->url)}}" target="_blank"><img style="width: 100%;min-height: 410px;" src="{{asset($banner->path)}}" /></a></li>
                @endforeach

                {{--<li><a href=""><img style="width: 100%;" src="{{asset('home/image/index/banner.png')}}" /></a></li>--}}
                {{--<li><a href=""><img style="width: 100%;" src="{{asset('home/image/index/banner2.png')}}" /></a></li>--}}
            </ul>
            <a href="javascript:void(0);" class="unslider-arrow04 prev"></a>
            <a href="javascript:void(0);" class="unslider-arrow04 next"></a>
        </div>
    </div>
    <!-- 课程，赛事活动 -->
    <div class="activity">
        <div class="activity_con">
        <div style="height:66px;"></div>
        <div class="activity_con">
            <a href="lessonSubject/list/1">
                <div class="activity_con_l">
                    <div class="activity_con_l_l"></div>
                    <div class="activity_con_l_r">
                        <div style="height:85px;"></div>
                        <div class="activity_con_l_r_t">专题课程</div>
                        <div class="activity_con_l_r_c">通过权威专家的细致讲解，针对钢琴演奏过程中的重点进行教学演示，有效帮助学员提高钢琴演奏水平。</div>
                    </div>
                </div>
            </a>
            <div class="activity_con_r">
                <a href="{{asset('/index/games')}}">
                <div class="activity_con_r_l"></div>
                <div class="activity_con_l_r">
                    <div style="height:85px;"></div>
                    <div class="activity_con_l_r_t">活动赛事</div>
                    <div class="activity_con_l_r_c">点评网将承办各类艺术教育赛事与活动，让艺术大师走进您的身边，为广大教师与学员提供知识分享与经验交流的舞台。</div>
                </div>
                </a>
            </div>
        </div>
        </div>
    </div>
    <!-- 名师介绍 -->
    <div class="teacher" ms-controller="teachers">
        <div class="teacher_con">
            <div class="teacher_con_top">
                <div class="teacher_con_top_l" ><div style="height:60px;"></div><hr></div>
                <div class="teacher_con_top_t">名师介绍</div>
                <div class="teacher_con_top_r" ><div style="height:60px;"></div><hr></div>
            </div>
            <div class="teacher_con_con">
                <div class="teacher_con_con_li" ms-foo ms-repeat="datas">
                    <a ms-attr-href="{{url('lessonComment/teacher/[--el.id--]')}}">
                    {{--教师头像--}}
                    <img ms-attr-src="{{asset('[--el.img--]')}}" alt="">
                    {{--姓名 学校--}}
                    <div class="teacher_con_con_li_foot stp" >
                        <div class="teacher_con_con_li_foot_l" ms-text="el.name"></div>
                        <div class="teacher_con_con_li_foot_r" ms-text="el.org"></div>
                    </div>
                    {{--简介--}}
                    <div class="teacher_con_con_li_info stp hide">
                        <div style="height:20px;"></div>
                        <div class="teacher_con_con_li_foots" >
                            <div class="teacher_con_con_li_foot_l" ms-text="el.name"></div>
                            <div class="teacher_con_con_li_foot_r" ms-text="el.org"></div>
                        </div>
                        <div style="height:10px;"></div>
                        <div class="teacher_con_con_li_info_desc" ms-text="el.info">
                        </div>
                    </div>
                    </a>
                </div>

                {{--<div class="teacher_con_con_li">--}}
                    {{--教师头像--}}
                    {{--<img src="{{asset('home/image/index/js.jpg')}}" alt="">--}}
                    {{--姓名 学校--}}
                    {{--<div class="teacher_con_con_li_foot" >--}}
                        {{--<div class="teacher_con_con_li_foot_l">吴迎</div>--}}
                        {{--<div class="teacher_con_con_li_foot_r">中央音乐学院</div>--}}
                    {{--</div>--}}
                    {{--简介--}}
                    {{--<div class="teacher_con_con_li_info hide">--}}
                        {{--<div style="height:20px;"></div>--}}
                        {{--<div class="teacher_con_con_li_foots" >--}}
                            {{--<div class="teacher_con_con_li_foot_l">吴迎</div>--}}
                            {{--<div class="teacher_con_con_li_foot_r">中央音乐学院</div>--}}
                        {{--</div>--}}
                        {{--<div style="height:10px;"></div>--}}
                        {{--<div class="teacher_con_con_li_info_desc">--}}
                            {{--吴迎，男，1957年3月1日出生于上海，5岁随母亲学习钢琴1976年毕业于中央音乐学院。1979年获中国北方地区钢琴比赛第一名；1980年获全国钢琴选拔赛第一名。1982年毕业于朱工一教授的研究班，获硕士学位。--}}
                        {{--</div>--}}
                    {{--</div>--}}
                {{--</div>--}}

            </div>
            <div class="clear"></div>
            <div class="teacher_con_more">
                <a href="{{url('community/theteacher')}}"><div class="teacher_con_more_btn">查看更多名师信息</div></a>
            </div>
        </div>
    </div>
    <!-- 课程推荐 -->
    <div class="recommend" ms-controller="ztlessons">
        <div class="recommend_con">
            <div class="teacher_con_top">
                <div class="teacher_con_top_l" ><div style="height:60px;"></div><hr></div>
                <div class="teacher_con_top_t">专题课程推荐</div>
                <div class="teacher_con_top_r" ><div style="height:60px;"></div><hr></div>
            </div>
            <div class="recommend_con_con">
                <div class="recommend_con_con_li" ms-repeat="datas">
                    <a ms-attr-href="{{url('lessonSubject/detail/[--el.id--]')}}">
                    <div class="contain_lesson_center_data_info_top">
                        <img ms-attr-src="{{asset('[--el.img--]')}}" ms-lessonfoo width="280" height="180" class="img_big"/>
                    </div>

                    <div class="contain_lesson_center_data_info_bot">
                        <span class="top" ms-text="el.title"></span>
                        <div class="center">
                            <span class="left classes" ms-text="el.counttime+'课时'"></span>
                            <span class="right study" ms-text="el.countpeople+'人学过'"></span>
                        </div>
                        <span class="bot" ms-text="'￥'+el.price"></span>
                    </div>
                    <img class="logo_hot hide" ms-class="show:el.courseType == 1" ms-if="el.courseType == 1" ms-attr-src="{{asset('/home/image/index/course/[--el.courseDiscount--].png')}}" alt="">
                    <img class="logo_hot hide" ms-class="show:el.courseType == 2" src="{{asset('/home/image/index/course/hot.png')}}" alt="">
                    <img class="logo_hot hide" ms-class="show:el.courseType == 3" src="{{asset('/home/image/index/course/new.png')}}" alt="">
                    </a>
                </div>
                {{--<div class="recommend_con_con_li">--}}
                    {{--<div class="contain_lesson_center_data_info_top">--}}
                        {{--<img src="{{asset('home/image/index/3.jpg')}}" width="280" height="180" class="img_big"/>--}}
                    {{--</div>--}}
                    {{--<div class="contain_lesson_center_data_info_bot">--}}
                        {{--<span class="top">钢琴演奏基础教程</span>--}}
                        {{--<div class="center">--}}
                            {{--<span class="left classes">10课时</span><span class="right study">300人学过</span>--}}
                        {{--</div>--}}
                        {{--<span class="bot">￥500.00</span>--}}
                    {{--</div>--}}
                {{--</div>--}}

            </div>
            <div class="clear"></div>
            <div class="recommend_con_more">
                <a href="lessonSubject/list/1"><div class="teacher_con_more_btn">查看更多专题课程</div></a>
            </div>
        </div>
    </div>
    <!-- 点评课程 -->
    <div class="commenton" ms-controller="dplessons">
        <div class="recommend_con">
            <div class="teacher_con_top">
                <div class="teacher_con_top_l" ><div style="height:60px;"></div><hr></div>
                <div class="teacher_con_top_t">点评课程推荐</div>
                <div class="teacher_con_top_r" ><div style="height:60px;"></div><hr></div>
            </div>
            <div class="recommend_con_con">
                <div class="recommend_con_con_li" ms-repeat="datas">
                    <a ms-attr-href="{{url('lessonComment/detail/[--el.id--]')}}">

                    <div class="contain_lesson_center_data_info_top">
                        <img ms-attr-src="{{asset('[--el.img--]')}}" ms-lessonfoo width="280" height="180" class="img_big"/>
                    </div>
                    <div class="contain_lesson_center_data_info_bot">
                        <span class="top" ms-text="el.title"></span>
                        <div class="center">
                            <span class="leftt" ms-text="'讲师：'+el.teacher"></span>
                            <span class="right study" ms-text="el.countpeople+'人学过'"></span>
                        </div>
                        <span class="bot" ms-text="'￥'+el.price"></span>
                    </div>
                    <img class="logo_hot hide" ms-class="show:el.courseType == 1" ms-if="el.courseType == 1" ms-attr-src="{{asset('/home/image/index/course/[--el.courseDiscount--].png')}}" alt="">
                    <img class="logo_hot hide" ms-class="show:el.courseType == 2" src="{{asset('/home/image/index/course/hot.png')}}" alt="">
                    <img class="logo_hot hide" ms-class="show:el.courseType == 3" src="{{asset('/home/image/index/course/new.png')}}" alt="">
                    </a>
                </div>

                {{--<div class="recommend_con_con_li">--}}
                    {{--<div class="contain_lesson_center_data_info_top">--}}
                        {{--<img src="{{asset('home/image/index/2.jpg')}}" width="280" height="180" class="img_big"/>--}}
                    {{--</div>--}}
                    {{--<div class="contain_lesson_center_data_info_bot">--}}
                        {{--<span class="top">肖邦第三章</span>--}}
                        {{--<div class="center">--}}
                            {{--<span class="leftt" >讲师：吴大海</span>--}}
                            {{--<span class="right study">300人学过</span>--}}
                        {{--</div>--}}
                        {{--<span class="bot">￥29.00</span>--}}
                    {{--</div>--}}
                {{--</div>--}}
            </div>
            <div class="clear"></div>
            <div class="recommend_con_more">
                <a href="lessonSubject/list/2"><div class="teacher_con_more_btn">查看更多点评课程</div></a>
            </div>
        </div>
    </div>
    <!-- 合作伙伴 -->
    <div style="height:50px;background: #ffffff"></div>
    <div class="flinks">
        <div class="flinks_con" style="display: inline">
            @foreach ($frids as $frid)
                <a href="{{url('http://'.$frid->url)}}" target="_blank"><img src="{{asset($frid->path)}}" alt="{{$frid->title}}"></a>
            @endforeach
        </div>
    </div>
    </div>
@endsection

@section('js')
    <script type="text/javascript" src="{{asset('home/js/index/index.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/index/onslider.js')}}"></script>
    <script>
        require(['/index/index'], function () {
            avalon.scan(document.body);
        });
    </script>
@endsection