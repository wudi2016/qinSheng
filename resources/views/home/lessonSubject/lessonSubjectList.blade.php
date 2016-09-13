@extends('layouts.layoutHome')

@section('title', '专题课程列表')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonSubject/list.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/pagination.css')}}">
@endsection

@section('content')
    <div class="contain_lesson" ms-controller="lessonSubjectList">
        <div style="height: 26px;width: 100%;background-color: white;"></div>
        <div class="contain_lesson_top">
            <div class="contain_lesson_top_bk"></div>
        </div>
        <div class="hr_4" style="background-color: white;"></div>
        <div class="contain_lesson_center">
            <div class="contain_lesson_center_tip">
                <div class="contain_lesson_center_tip_left">
                    <span class="change_active" name="special" ms-onLight ms-click="changeSwitch('subject');">专题课程</span>
                    <span class="second" name="comment" ms-onLight ms-click="changeSwitch('comment');">点评课程</span>
                </div>
                <div class="contain_lesson_center_tip_right" ms-visible="changeOption == 'subject'">
                    <span class="default" ms-click="sort(1,changeOption);">默认</span><span> - </span><span ms-click="sort(2,changeOption);">最新</span><span> - </span><span ms-click="sort(3,changeOption);">热门</span>
                </div>
                <div class="contain_lesson_center_tip_right_comment hide" ms-visible="changeOption == 'comment'">
                    <span class="default" ms-click="sort(1,changeOption);">默认</span><span> - </span><span ms-click="sort(2,changeOption);">最新</span><span> - </span><span ms-click="sort(3,changeOption);">热门</span>
                </div>
            </div>

            <!-- 专题课程 -->
            <div class="contain_lesson_center_data" ms-visible="changeOption == 'subject'">
                <a ms-attr-href="detail + el.id" ms-repeat="subjectInfo" target="_blank">
                    <div class="contain_lesson_center_data_info">
                        <img class="logo_hot" ms-if="el.courseType == 1" ms-attr-src="{{asset('/home/image/index/course/[-- el.courseDiscount --].png')}}" alt="">
                        <img class="logo_hot hide" ms-visible="el.courseType == 2" src="{{asset('/home/image/index/course/hot.png')}}" alt="">
                        <img class="logo_hot hide" ms-visible="el.courseType == 3" src="{{asset('/home/image/index/course/new.png')}}" alt="">
                        <div class="contain_lesson_center_data_info_top" ms-if="el.coursePic">
                            <img ms-attr-src="el.coursePic" ms-imgBig width="280" height="180" class="img_big" onerror="this.src='/home/image/layout/default.png'"/>
                        </div>
                        <div class="contain_lesson_center_data_info_top_no" ms-if="!el.coursePic">
                        </div>
                        <div class="contain_lesson_center_data_info_bot">
                            <span class="top" ms-html="el.courseTitle" ms-attr-title="el.courseTitle"></span>
                            <div class="center"><span class="left classes" ms-html="el.classHour + '课时'"></span><span class="right study" ms-html="el.coursePlayView + '人学过'"></span>
                            </div>
                            <span class="bot" ms-html="'￥' + el.coursePrice" ms-if="el.coursePrice"></span>
                            <span class="bot" ms-html="'免费课程'" ms-if="!el.coursePrice"></span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="clear hr_10" ms-visible="changeOption == 'subject'"></div>
            <div ms-if="subjectDisplay" class="pagecon_parent" ms-visible="changeOption == 'subject'">
                <div class="pagecon">
                    <div id="page_subject"></div>
                </div>
            </div>
            <!-- 点评课程 -->
            <div class="contain_lesson_center_data_comment hide" ms-visible="changeOption == 'comment'">
                <div class="contain_lesson_center_data_info" ms-repeat="commentInfo">
                    <a ms-attr-href="commentDetail + el.id" target="_blank">
                        <img class="logo_hot" ms-if="el.courseType == 1" ms-attr-src="{{asset('/home/image/index/course/[-- el.courseDiscount --].png')}}" alt="">
                        <img class="logo_hot hide" ms-visible="el.courseType == 2" src="{{asset('/home/image/index/course/hot.png')}}" alt="">
                        <img class="logo_hot hide" ms-visible="el.courseType == 3" src="{{asset('/home/image/index/course/new.png')}}" alt="">
                        <div class="contain_lesson_center_data_info_top" ms-if="el.coursePic">
                            <img ms-attr-src="el.coursePic" ms-imgBig width="280" height="180" class="img_big"/>
                        </div>
                        <div class="contain_lesson_center_data_info_top_no" ms-if="!el.coursePic">
                        </div>
                        <div class="contain_lesson_center_data_info_bot">
                            <span class="top" ms-html="el.courseTitle" ms-attr-title="el.courseTitle"></span>
                            <div class="center"><span class="left" ms-html="'讲师：' + el.teachername"></span><span class="right study" ms-html="el.coursePlayView + '人学过'"></span></div>
                            <span class="bot" ms-html="'￥' + el.coursePrice" ms-if="el.coursePrice"></span>
                            <span class="bot" ms-html="'免费课程'" ms-if="!el.coursePrice"></span>
                        </div>
                    </a>
                </div>
            </div>
            <div class="clear hr_10" ms-visible="changeOption == 'comment'"></div>
            <div ms-if="commentDisplay" class="pagecon_parent" ms-visible="changeOption == 'comment'">
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
            if(location.href.split('/').pop() == '1'){
                list.getSubjectInfo(1);
            }else{
                list.getCommentInfo(1);
            }
            avalon.scan();
        });
    </script>
@endsection