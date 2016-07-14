@extends('layouts.layoutHome')

@section('title', '专题课程列表')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonSubject/list.css') }}">
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
                <!-- loading -->
                {{--<div class="spinner " ms-visible="loading">--}}
                    {{--<div class="rect1"></div>--}}
                    {{--<div class="rect2"></div>--}}
                    {{--<div class="rect3"></div>--}}
                    {{--<div class="rect4"></div>--}}
                    {{--<div class="rect5"></div>--}}
                {{--</div>--}}
                <!-- loading -->
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
                {{--<div class="spinner " ms-visible="loading">--}}
                    {{--<div class="rect1"></div>--}}
                    {{--<div class="rect2"></div>--}}
                    {{--<div class="rect3"></div>--}}
                    {{--<div class="rect4"></div>--}}
                    {{--<div class="rect5"></div>--}}
                {{--</div>--}}
            </div>
            <div class="clear"></div>
            <!-- loading -->

            <!-- loading -->
            <!-- page -->
            <div style="width: 100%;height: 60px;"></div>
            <div class="teacherHomepage_page" ms-visible="changeOption == 'subject'">
                <div class="prev" ms-visible="page.subject != 1" ms-click="skip('subject', false)"><</div>
                <div class="next" ms-repeat="subjectCountNumber" ms-html="el" ms-page="page.subject" ms-class="active: el == page.subject" ms-click="skip('subject', el)"></div>
                <div class="next" ms-visible="page.subject <= (subjectCount - 4) && subjectCount >= 9">...</div>
                <div class="next" ms-html="subjectCount" ms-visible="subjectCount >= 9 && page.subject < (subjectCount - 3)"></div>
                <div class="next" ms-visible="page.subject != subjectCount && subjectCount != 1" ms-click="skip('subject', true)">></div>
                <input type="text" ms-visible="subjectCount > 1" ms-duplex-number='jump'>
                <button ms-visible="subjectCount > 1" ms-click="jumping('subject')">跳转</button>
            </div>
            <div class="teacherHomepage_page" ms-visible="changeOption == 'comment'">
                <div class="prev" ms-visible="page.comment != 1" ms-click="skip('comment', false)"><</div>
                <div class="next" ms-repeat="commentCountNumber" ms-html="el" ms-page="page.comment" ms-class="active: el == page.comment" ms-click="skip('comment', el)"></div>
                <div class="next" ms-visible="page.comment <= (commentCount - 4) && commentCount >= 9">...</div>
                <div class="next" ms-html="commentCount" ms-visible="commentCount >= 9 && page.comment < (commentCount - 3)"></div>
                <div class="next" ms-visible="page.comment != commentCount && commentCount != 1" ms-click="skip('comment', true)">></div>
                <input type="text" ms-visible="commentCount > 1" ms-duplex-number='jump'>
                <button ms-visible="commentCount > 1" ms-click="jumping('comment')">跳转</button>
            </div>
            <!-- page -->

            <div class="clear hr_4"></div>
        </div>
    </div>
@endsection

@section('js')
    <script>
        require(['/lessonSubject/list','lessonComment/directive'], function (list,directive) {
            list.getData('/lessonSubject/getList/1','subjectInfo',{page: list.page.subject},'POST');
            list.getData('/lessonSubject/getCommentList/1','commentInfo',{page: list.page.comment},'POST');
            list.getData('/lessonSubject/getCount', 'subjectCount', {type:0}, 'POST');
            list.getData('/lessonSubject/getCount', 'commentCount', {type:1}, 'POST');
            avalon.scan();
        });
    </script>
@endsection