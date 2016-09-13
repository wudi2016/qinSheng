@extends('layouts.layoutHome')

@section('title', '专题课程详情')

@section('css')
    <style>
        .contain_lessonDetail{
            width: 100%;
            margin: 0 auto;
            height: auto;
        }
        .no_course{
            width: 1200px;
            min-height: 648px;
            margin: 0 auto;
            background-color: #f5f5f5;
        }
        .no_course div{
            width: 210px;
            height: 20px;
            font-size:18px;
            margin: 0 auto;
            line-height: 600px;
        }
        .no_course div a{
            color: #209eea;
        }
    </style>
@endsection

@section('content')
    <div class="contain_lessonDetail">
        <div class="no_course" ms-if="!haveCourse">
            <div>该课程已下架，
                <a href="javascript:history.go(-1)">点击返回</a>
            </div>
        </div>
    </div>
@endsection

@section('js')

@endsection