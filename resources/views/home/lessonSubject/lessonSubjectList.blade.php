@extends('layouts.layoutHome')

@section('title', '专题课程列表')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonSubject/list.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/pagination.css')}}">
@endsection

@section('content')
    <div class="contain_lesson" ms-controller="lessonSubjectList">
        <div style="height: 26px;width: 100%"></div>
        <div class="contain_lesson_top">
            <div class="contain_lesson_top_bk"></div>
        </div>
        <div class="hr_4"></div>
        <div class="contain_lesson_center">
            <div class="contain_lesson_center_tip">
                <div class="contain_lesson_center_tip_left">
                    <span class="change_active" name="special" ms-onLight ms-click="changeSwitch('subject');">专题课程</span>
                    <span class="second" name="comment" ms-onLight ms-click="changeSwitch('comment');">点评课程</span>
                </div>
                <div class="contain_lesson_center_tip_right">
                    <span class="default" ms-click="sort(1,changeOption);">默认</span><span> - </span><span ms-click="sort(2,changeOption);">最新</span><span> - </span><span ms-click="sort(3,changeOption);">热门</span>
                </div>
            </div>

            <!-- 专题课程 -->
            <div class="contain_lesson_center_data" ms-visible="changeOption == 'subject'">
                <a ms-attr-href="detail + el.id" ms-repeat="subjectInfo">
                    <div class="contain_lesson_center_data_info">
                        <div class="contain_lesson_center_data_info_top">
                            <img ms-attr-src="el.coursePic" ms-imgBig width="280" height="180" class="img_big"/>
                        </div>
                        <div class="contain_lesson_center_data_info_bot">
                            <span class="top" ms-html="el.courseTitle"></span>
                            <div class="center"><span class="left classes" ms-html="el.classHour + '课时'"></span><span class="right study" ms-html="el.coursePlayView + '人学过'"></span>
                            </div>
                            <span class="bot" ms-html="'￥' + el.coursePrice"></span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="clear hr_10" ms-visible="changeOption == 'subject'"></div>
            <div class="pagecon_parent" ms-visible="changeOption == 'subject'">
                <div class="pagecon">
                    <div id="page_subject"></div>
                </div>
            </div>
            <!-- 点评课程 -->
            <div class="contain_lesson_center_data_comment hide" ms-visible="changeOption == 'comment'">
                <div class="contain_lesson_center_data_info" ms-repeat="commentInfo">
                    <a ms-attr-href="commentDetail + el.id">
                        <div class="contain_lesson_center_data_info_top">
                            <img ms-attr-src="el.coursePic" ms-imgBig width="280" height="180" class="img_big"/>
                        </div>
                        <div class="contain_lesson_center_data_info_bot">
                            <span class="top" ms-html="el.courseTitle"></span>
                            <div class="center"><span class="left" ms-html="'讲师：' + el.teachername"></span><span class="right study" ms-html="el.coursePlayView + '人学过'"></span></div>
                            <span class="bot" ms-html="'￥' + el.coursePrice"></span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="clear hr_10" ms-visible="changeOption == 'comment'"></div>
            <div class="pagecon_parent" ms-visible="changeOption == 'comment'">
                <div class="pagecon">
                    <div id="page_comment"></div>
                </div>
            </div>
            <div class="clear hr_10"></div>
        </div>
    </div>
@endsection

@section('js')
    <script type="text/javascript" src="{{asset('home/js/games/pagination.js')}}"></script>
    <script>
        require(['/lessonSubject/list'], function (list) {
            list.getSubjectInfo(1);
            list.getCommentInfo(1);
            avalon.scan();
        });
    </script>
@endsection