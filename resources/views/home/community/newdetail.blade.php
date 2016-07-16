@extends('layouts.layoutHome')

@section('title', '新闻资讯列表')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/community/newdetail.css') }}">
@endsection

@section('content')


    <div class="background" ms-controller="newdetail">

        <div style="height:18px"></div>

        <!-- 主体 -->
        <div class="main">
            <!-- 面包屑导航 -->
            <div class="crumbs">
                <a href="{{asset('/community')}}">社区</a><span>></span><a href="{{asset('/community/newlist')}}">新闻资讯</a><span>></span><a href="#">新闻详情</a>
            </div>
            <div style="height:10px"></div>
            <!-- 内容 -->
            <div class="main_content" ms-repeat="newdetails" >
                <!-- 标题 -->
                <div class="main_title" ms-html="el.title">
                    {{--乐和音乐工作室--}}
                </div>
                <!-- 详细内容 -->
                <div class="main_detail" ms-html="el.content" >
                    {{--在1995年以Personal Home Page Tools (PHP Tools) 开始对外发表第一个版本，Lerdorf写了一些介绍此程序的文档。并且发布了PHP1.0！在这的版本中，提供了访客留言本、访客计数器等简单的功能。以后越来越多的网站使用了PHP，并且强烈要求增加一些特性。比如循环语句和数组变量等等；在新的成员加入开发行列之后，Rasmus Lerdorf 在1995年6月8日将 PHP/FI 公开发布，希望可以透过社群来加速程序开发与寻找错误。这个发布的版本命名为 PHP 2，已经有 PHP 的一些雏型，像是类似 Perl的变量命名方式、表单处理功能、以及嵌入到 HTML 中执行的能力。程序语法上也类似 Perl，有较多的限制，不过更简单、更有弹性。PHP/FI加入了对MySQL的支持，从此建立了PHP在动态网页开发上的地位。到了1996年底，有15000个网站使用 PHP/FI。--}}
                </div>
                <!-- 日期 -->
                <div class="main_time" ms-html="el.time">
                    {{--2016-05-23--}}
                </div>
            </div>
        </div>


        {{--<div style="height:175px"></div>--}}




    </div>





@endsection

@section('js')
    <script>
        require(['/community/newdetail.js'], function () {

            avalon.scan();
        });
    </script>
@endsection