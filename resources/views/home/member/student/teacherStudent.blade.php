@extends('layouts.layoutHome')

@section('title', '学员个人中心')


@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/select2.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/teacherStudent.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/Jcrop.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/uploadify.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/pagination.css')}}">
    <style>
        .buy_course_center .bot .bot_select2_plugin .select2-container .select2-selection--single {
            width: 306px;
            height: 30px;
            line-height: 25px;
        }

        .buy_course_center .bot .bot_select2_plugin .select2-container .select2-selection--single .select2-selection__rendered {
            display: inline;
            padding-left: 8px;
        }

        .buy_course_center .bot .bot_select2_plugin .select2-container--default .select2-selection--single .select2-selection__rendered {
            color: rgb(102, 102, 102);
        }
        .select2-results{
            color:rgb(102,102,102);
        }
    </style>
@endsection

@section('content')

    <div class="height30"></div>
    <div class="height5"></div>

    <div class="container" ms-controller="sideBar">
        <!--主体左边-->
        <div class="center_left">
            <!--主体左边的上边部分-->
            <div class="center_left_top">
                <div class="left_top_img">
                    <a href="/lessonComment/student/{{$mineUserId}}"><img src="{{asset(\Auth::user()->pic)}}"  alt="" width="85" height="85"></a>
                </div>
                <div class="left_top_name">
                    <a href="/lessonComment/student/{{$mineUserId}}"><div class="top_name">{{$data->username}}</div></a>
                    <div class="height10"></div>
                    <div class="height5"></div>
                    @if(\Auth::user()->type == 1)
                        <div class="top_img"><img src="{{asset('home/image/personCenter/teacherStu.png')}}"
                                                  alt=""><span>教师学员</span></div>
                    @elseif(\Auth::user()->type == 0)
                        <div class="top_img"><img src="{{asset('home/image/personCenter/commonStu.png')}}" alt=""><span>普通学员</span>
                        </div>
                    @endif
                </div>
            </div>
            <!--主体左边中间部分-->
            <div class="center_left_middle">
                <div class="height10"></div>
                <div class="height5"></div>
                <div class="account_manger">账户管理</div>
                <div class="height5"></div>
                <span class="span_hover"></span><div name='myOrders' class="account_common" ms-click="changeTab('myOrders')">我的订单</div>
                <span class="span_hover"></span><div name='myFocus'  class="account_common" ms-click="changeTab('myFocus')">我的关注</div>
                <span class="span_hover"></span><div name='myFriends'  class="account_common" ms-click="changeTab('myFriends')">我的好友</div>

                <!--我的通知-->
                <div class="height5"></div>
                <div class="account_manger">我的通知</div>
                <div class="height5"></div>
                <span class="span_hover"></span><div name='wholeNotice' class="account_common" ms-click="changeTab('wholeNotice')"><b ms-visible="noReadNotice" class="isRead hide"></b>全部通知</div>
                <span class="span_hover"></span><div name='commentAnswer' class="account_common" ms-click="changeTab('commentAnswer')"><b ms-visible="noReadComment" class="isRead hide"></b>评论回复</div>


                <!--课程管理-->
                <div class="height5"></div>
                <div class="account_manger">课程管理</div>
                <div class="height5"></div>
                <span class="span_hover"></span><div name='lessonComment'  class="account_common" ms-click="changeTab('lessonComment')">点评课程</div>
                <span class="span_hover"></span><div name='lessonSubject'  class="account_common" ms-click="changeTab('lessonSubject','student')">专题课程</div>
                <span class="span_hover"></span><div name='lessonStore'  class="account_common" ms-click="changeTab('lessonStore','student')">收藏课程</div>


                <!--个人设置-->
                <div class="height5"></div>
                <div class="account_manger">个人设置</div>
                <div class="height5"></div>
                <span class="span_hover"></span><div name="basicInfo"  class="account_common " ms-click="changeTab('basicInfo')">基本信息</div>
                <span class="span_hover"></span><div name="changePass" class="account_common" ms-click="changeTab('changePass')">密码修改</div>
                <span class="span_hover"></span><div name="changePhone" class="account_common" ms-click="changeTab('changePhone')"><span>修改手机号</span></div>

            </div>
            <div class="height10" style="background: #F5F5F5"></div>
            <!--主体左边底部部分-->
            <div class="center_left_footer">
                <!--邀请码部分-->
                <div class="left_footer_invite">
                    <div class="height10"></div>
                    <div class="footer_invite_text">邀请码
                        <span class="invite_img_doubt"><img src="{{asset('/home/image/personCenter/doubt.png')}}"></span>
                        <span class="invite_img_prompt hide">
                            <img src="{{asset('/home/image/personCenter/prompt.png')}}" alt="">
                        </span>
                    </div>
                    <div class="footer_invite_invite"><span>{{$data->yaoqingma}}</span></div>
                </div>
                <div class="height10" style="background: #F5F5F5"></div>

                <!--退出按钮-->
                <a href="{{url('/auth/logout')}}"><button type="button" class="left_footer_quit">退出</button></a>
            </div>
        </div>

        <!--主体右边-->

        <!--======================================================我的订单=======================================================-->
        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'myOrders'" ms-controller="myOrdersStudent">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">我的订单</div>
            </div>

            <!--//订单部分开始-->
            <div class="center_right_order">

                <div class="right_order_th">
                    <div class="right_order_th_line">
                        <div class="right_order_name">名称</div>
                        <div class="right_order_time">成交时间</div>
                        <div class="right_order_price">价格</div>
                        <div class="right_order_status">状态</div>
                        <div class="right_order_control">操作</div>
                    </div>

                </div>

                <div class="clear"></div>

                <!--===================================//我的订单循环===================================-->

                <div class="right_order_td" ms-repeat="myOrdersList">
                    <!--专题订单-->
                    <div class="right_order_th_repeat" ms-if="el.orderType == 0">
                        <div class="height30"></div>
                        <div class="right_order_repeat_name">
                            <div class="repeat_name_content" ms-html="el.orderTitle" ms-attr-title="el.orderTitle"></div>
                            <div class="repeat_content_orderno" ms-attr-title="el.orderSn">订单号：[--el.orderSn--]</div>
                        </div>

                        <div class="right_order_repeat_time">
                            <div class="repeat_time_whole" ms-text="el.payTime"></div>
                        </div>

                        {{--<div class="right_order_repeat_price" ms-if="el.status == 5" ms-text="el.orderPrice + ' 元 '"></div>--}}
                        {{--<div class="right_order_repeat_price" ms-if="el.status != 5" ms-text="el.payPrice + ' 元 '"></div>--}}
                        <div class="right_order_repeat_price" ms-text="el.payPrice + ' 元 '"></div>

                        {{--<div class="right_order_repeat_status" ms-if="el.status == 5">未付款</div>--}}
                        <div class="right_order_repeat_status" ms-if="el.status == 0">已付款</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 2">已完成</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 3">退款中</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 4">已退款</div>

                        <div class="right_order_repeat_control" ms-if="el.status == 2 && el.seven == 1 && el.price != 0 && el.isRefund == 0" ms-click="popUpSwitch('applyRefund',el)">
                                    申请退款</div>
                        {{--<div class="right_order_repeat_control" ms-if="el.status == 5"><a--}}
                                    {{--ms-attr-href="'/lessonSubject/WeChatPay/'+ el.id">去付款</a></div>--}}

                    </div>

                    <!--申请订单-->
                    <div class="right_order_th_repeat" ms-if="el.orderType == 1">
                        <div class="height30"></div>
                        <div class="right_order_repeat_name">
                            <div class="repeat_name_content" ms-text="'申请点评-'+el.realname" ms-attr-title="el.orderTitle"></div>
                            <div class="repeat_content_orderno" ms-attr-title="el.orderSn">订单号：[--el.orderSn--]</div>
                        </div>

                        <div class="right_order_repeat_time">
                            <div class="repeat_time_whole" ms-text="el.payTime"></div>
                        </div>

                        {{--<div class="right_order_repeat_price" ms-if="el.status == 5" ms-text="el.orderPrice + ' 元 '"></div>--}}
                        {{--<div class="right_order_repeat_price" ms-if="el.status != 5" ms-text="el.payPrice + ' 元 '"></div>--}}
                        <div class="right_order_repeat_price" ms-text="el.payPrice + ' 元 '"></div>

                        {{--<div class="right_order_repeat_status" ms-if="el.status == 5">未付款</div>--}}
                        <div class="right_order_repeat_status" ms-if="el.status == 0">已付款</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 1">待点评</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 2">已完成</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 3">退款中</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 4">已退款</div>

                        <div class="right_order_repeat_control" ms-if="el.status == 0"><a
                                    ms-attr-href="'/lessonComment/buy/upload/'+el.id">去上传</a></div>
                        {{--<div class="right_order_repeat_control" ms-if="el.status == 5"><a--}}
                                    {{--ms-attr-href="'/lessonComment/scan/'+ el.id">去付款</a></div>--}}

                    </div>


                    <!--点评订单-->
                    <div class="right_order_th_repeat" ms-if="el.orderType == 2">
                        <div class="height30"></div>
                        <div class="right_order_repeat_name">
                            <div class="repeat_name_content" ms-text="el.orderTitle" ms-attr-title="el.orderTitle"></div>
                            <div class="repeat_content_orderno" ms-attr-title="el.orderSn">订单号：[--el.orderSn--]</div>
                        </div>

                        <div class="right_order_repeat_time">
                            <div class="repeat_time_whole" ms-text="el.payTime"></div>
                        </div>

                        {{--<div class="right_order_repeat_price" ms-if="el.status == 5" ms-text="el.orderPrice + ' 元 '"></div>--}}
                        {{--<div class="right_order_repeat_price" ms-if="el.status != 5" ms-text="el.payPrice + ' 元 '"></div>--}}
                        <div class="right_order_repeat_price" ms-text="el.payPrice + ' 元 '"></div>

                        {{--<div class="right_order_repeat_status" ms-if="el.status == 5">未付款</div>--}}
                        <div class="right_order_repeat_status" ms-if="el.status == 0">已付款</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 2">已完成</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 3">退款中</div>
                        <div class="right_order_repeat_status" ms-if="el.status == 4">已退款</div>

                        <div class="right_order_repeat_control"  ms-if="el.status == 2 && el.seven == 1 && el.price != 0 && el.isRefund == 0" ms-click="popUpSwitch('applyRefund',el)">
                                    申请退款</div>
                        {{--<div class="right_order_repeat_control" ms-if="el.status == 5">--}}
                            {{--<a ms-attr-href="'/lessonComment/scan/'+ el.id">去付款</a>--}}
                        {{--</div>--}}
                    </div>
                </div>
                <!--===================================//我的订单循环结束===================================-->
                <div ms-visible="myOrders" class="warning_msg">暂无订单...</div>
            </div>
            <div ms-if="display" class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_orders"></div>
                </div>
            </div>
        </div>

        <!--======================================================我的关注=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'myFocus'" ms-controller="myFocusTeacher">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">我的关注</div>
                <div class="center_right_count">共&nbsp;<span ms-text=" total "></span>&nbsp;个关注</div>
            </div>
            <div class="height20"></div>

            {{--//我的关注--}}
            <div class="center_right_focus">
                {{--===============================我的关注循环开始====================================--}}
                <div class="right_focus_repeat" ms-repeat="myFocusList">
                    {{--名师--}}
                    <a ms-if="el.type == 2" ms-attr-href="'/lessonComment/teacher/'+el.id">
                        <img ms-attr-src="el.pic" alt="" width="84" height="84" onerror="this.src='/home/image/layout/default.png'">
                        <div class="focus_repeat_name" ms-text="el.username"></div>
                    </a>
                    {{--学员--}}
                    <a ms-if="el.type != 2" ms-attr-href="'/lessonComment/student/'+el.id">
                        <img ms-attr-src="el.pic" alt="" width="84" height="84" onerror="this.src='/home/image/layout/default.png'">
                        <div class="focus_repeat_name" ms-text="el.username"></div>
                    </a>
                </div>
                {{--===============================我的关注循环结束====================================--}}
                <div ms-visible="myFocus" class="warning_info">暂无关注...</div>
            </div>
            <div ms-if="display" class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_focus"></div>
                </div>
            </div>
        </div>

        <!--======================================================我的好友=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'myFriends'" ms-controller="myFansTeacher">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">我的好友</div>
                <div class="center_right_count">共&nbsp;<span ms-text=" total "></span>&nbsp;个好友</div>
            </div>
            <div class="height20"></div>

            {{--//我的关注--}}
            <div class="center_right_focus">
                {{--===============================我的好友循环开始====================================--}}
                <div class="right_focus_repeat" ms-repeat="myFansList">
                    {{--名师--}}
                    <a ms-if="el.type == 2" ms-attr-href="'/lessonComment/teacher/'+el.id">
                        <img ms-attr-src="el.pic" alt="" width="84" height="84">
                        <div class="focus_repeat_name" ms-text="el.username"></div>
                    </a>
                    {{--学员--}}
                    <a ms-if="el.type != 2" ms-attr-href="'/lessonComment/student/'+el.id">
                        <img ms-attr-src="el.pic" alt="" width="84" height="84">
                        <div class="focus_repeat_name" ms-text="el.username"></div>
                    </a>
                </div>
                {{--===============================我的好友循环结束====================================--}}
                <div ms-visible="myFans" class="warning_info">暂无好友...</div>
            </div>
            <div ms-if="display" class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_friend"></div>
                </div>
            </div>
        </div>

        <!--======================================================我的通知=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'wholeNotice'" ms-controller="noticeController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">全部通知</div>
            </div>
            {{--//我的通知--}}
            <div class="center_right_notice">
                {{--//通知循环开始--}}
                <div class="right_notice_repeat" ms-repeat="noticeInfo">
                    <div style="width:100%;height:12px;"></div>
                    <div class="notice_repeat_comment">
                        <!-- 后台发送消息 -->
                        <div class="notice"></div>
                        <div class="repeat_comment_text" ms-if="el.type == 0 && el.actionId">
                            <!-- 审核未通过 -->
                            <a ms-attr-href="'/lessonComment/reUpload/' + el.actionId + '/' + el.id">
                                <span style="display: block;float:left;" ms-text="'上传视频审核未通过，原因：' + el.content" ms-attr-title=""></span>
                            </a>
                        </div>
                        <div class="repeat_comment_text" ms-if="el.type == 0 && el.tempId != 0">
                            <!-- 审核未通过 -->
                            {{--<span class="notice"></span>--}}
                            <span class="span_light" ms-text="el.tempName + '&nbsp;'" ms-if="el.tempName" style="float: left;display: block;" ms-attr-title="el.tempName"></span>
                            <span ms-text="el.content" ms-attr-title="el.content"></span>
                        </div>
                        <!-- 注册加入消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '1'">
                            {{--<span class="notice"></span>--}}
                            <span ms-text="el.content"></span>
                        </div>
                        <!-- 本人被点评消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '2'">
                            {{--<span class="notice"></span>--}}
                            <span ms-text="el.fromUsername + '&nbsp;&nbsp;'" class="span_light"></span><span>老师点评了您上传的作品，</span><span><a class="span_light" ms-attr-href="'/lessonComment/detail/' + el.actionId">快去看看吧 >></a></span>
                        </div>
                        <!-- 本人被关注消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '3' && el.userType != '2'">
                            {{--<span class="notice"></span>--}}
                            <span ms-text="el.fromUsername" class="span_light"></span><a ms-attr-href="'/lessonComment/student/' + el.actionId"><span ms-text="el.content" style="margin-left: 10px;"></span></a>
                        </div>
                        <div class="repeat_comment_text" ms-if="el.type == '3' && el.userType == '2'">
                            {{--<span class="notice"></span>--}}
                            <span ms-text="el.fromUsername" class="span_light"></span><a ms-attr-href="'/lessonComment/teacher/' + el.actionId"><span ms-text="el.content" style="margin-left: 10px;"></span></a>
                        </div>
                        <!-- 关注用户被点评消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '4'">
                            {{--<span class="notice"></span>--}}
                            <span ms-text="el.fromUsername + '&nbsp;&nbsp;'" class="span_light"></span><span>老师点评了</span><span ms-text="'&nbsp;'+el.toUsername + '&nbsp;'" class="span_light"></span>的作品，<a class="span_light" ms-attr-href="'/lessonComment/detail/' + el.actionId">快去看看吧 >></a>
                        </div>
                        <div class="clear"></div>
                        <div class="repeat_comment_time">
                            <div class="comment_time" ms-text="el.created_at"></div>
                            <div class="comment_delete" ms-click="popUpSwitch('deleteNotice',el.id)">删除</div>
                        </div>
                    </div>
                </div>
                {{--//通知循环结束--}}
                <div ms-visible="noticeMsg" class="warning_msg">暂无通知消息...</div>
            </div>
            <div class="clear"></div>
            <div ms-if="display" class="pagecon_parent" style="margin-top:40px;">
                <div class="pagecon">
                    <div id="page_notice"></div>
                </div>
            </div>
        </div>

        <!--======================================================我的评论回复=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'commentAnswer'" ms-controller="commentController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">评论回复</div>
            </div>
            {{--//我的评论回复--}}
            <div class="center_right_notice">
                {{--//回复循环开始--}}
                <div class="right_notice_repeat" ms-repeat="commentInfo">
                    <div style="width:100%;height:12px;"></div>
                    <div class="notice_repeat_comment">
                        <div class="notice"></div>
                        <div class="repeat_comment_text" ms-if="el.type == '5'">
                            <div style="float: left">
                                <span class="span_light" ms-text="el.fromUsername"></span>
                                <span>&nbsp;回复了您的评论&nbsp;</span>
                            </div>
                            <a ms-attr-href="'/lessonSubject/detail/' + el.actionId" ms-if="el.courseType == 0">
                                <span class="comment_content span_light" ms-attr-title="el.content" ms-text="el.content"></span>
                            </a>
                            <a ms-attr-href="'/lessonComment/detail/' + el.actionId" ms-if="el.courseType == 1">
                                <span class="comment_content span_light" ms-attr-title="el.content" ms-text="el.content"></span>
                            </a>
                        </div>
                        <div class="repeat_comment_text" ms-if="el.type == '6'">
                            <div style="float: left">
                                <span class="span_light" ms-text="el.fromUsername"></span>
                                <span>&nbsp;评论了你的点评作品&nbsp;</span>
                            </div>
                            <a ms-attr-href="'/lessonComment/detail/' + el.actionId">
                                <span class="comment_content span_light" ms-attr-title="el.content" ms-text="el.content"></span>
                            </a>
                        </div>
                        <div class="clear"></div>
                        <div class="repeat_comment_time">
                            <div class="comment_time" ms-text="el.created_at"></div>
                            <div class="comment_delete" ms-click="popUpSwitch('deleteComment',el.id)">删除</div>
                        </div>
                    </div>
                </div>
                {{--//回复循环结束--}}
                <div ms-visible="answerMsg" class="warning_msg">暂无评论回复...</div>
            </div>
            <div ms-if="display" class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_comment"></div>
                </div>
            </div>
        </div>

        <!--======================================================点评课程=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'lessonComment'" ms-controller="commentCourseController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">点评课程</div>
                <div class="center_right_count">
                    <div class="right_count_left">共&nbsp;<span ms-text=" total "></span>&nbsp;个视频</div>
                    <div class="right_count_right">
                        {{--<span ms-click="getCommentCourse('{{$mineUserId}}',1);">最新</span>&nbsp;-&nbsp;<span class="count_right_hot" ms-click="getCommentCourse('{{$mineUserId}}',2);">热门</span>--}}
                    </div>
                </div>
            </div>

            {{--//点评课程--}}
            <div class="center_right_comment">
                <div class="right_comment_repeat" ms-repeat="commentCourseInfo">
                    <div class="comment_repeat_img">
                        <!-- 视频审核未通过 -->
                        <a ms-attr-href="'/lessonComment/reUpload/' + el.AId + '/' + el.messageID" ms-if="el.orderType == '1' && el.AState == 0">
                            <div class="repeat_img_unchecked">
                                <div class="comment_video_unchecked">视频审核未通过</div>
                                <div class="comment_video_time" ms-text="'发布时间：' + el.ACreated"></div>
                            </div>
                        </a>
                        <!-- 视频审核中 -->
                        <div class="repeat_img_unchecked" ms-if="el.orderType == '1' && el.AState == '1'">
                            <div class="comment_video_unchecked">视频审核中</div>
                            <div class="comment_video_time" ms-text="'发布时间：' + el.ACreated"></div>
                        </div>
                        <!-- 视频审核通过 -->
                        <a ms-attr-href="'/lessonComment/detail/' + el.OCourseId" ms-if="el.orderType == '1' && el.status == '2' && el.CState == '2'" >
                            <img ms-attr-src="el.CPic" alt="" width="280" height="180" class="img_big" ms-imgBig />
                        </a>
                        <!-- 视频审核通过 -->
                        <a ms-attr-href="'/lessonComment/detail/' + el.OCourseId" ms-if="el.orderType == '2'">
                            <img ms-attr-src="el.CPic"  alt="" width="280" height="180" class="img_big" ms-imgBig />
                        </a>
                        <!-- 视频等待点评中 -->
                        <a ms-attr-href="'/lessonComment/wait/' + el.AId" ms-if="el.orderType == '1' && el.AState == '2' && el.CState != 2">
                            <div class="repeat_img_unchecked">
                                <div class="comment_video_unchecked">等待点评</div>
                                <div class="comment_video_time" ms-text="'发布时间：' + el.ACreated"></div>
                            </div>
                        </a>
                    </div>
                    <div class="comment_repeat_title" ms-text="el.CTitle" ms-if="el.orderType == 2 || (el.orderType == 1 && el.status == 2 && el.CState == '2')"></div>
                    <div class="comment_repeat_title" ms-text="el.ATitle" ms-if="el.orderType == '1' && el.CState != 2"></div>

                    <div class="comment_repeat_name" ms-if="el.orderType == '1' && el.status == 2 && el.CState == '2'"><span ms-text="'讲师：' + el.OTeacherName"></span> <span class="repeat_name_last" ms-text="el.CPlayView + '人学过'"></span></div>
                    <div class="comment_repeat_name" ms-if="el.orderType == '2'"><span ms-text="'讲师：' + el.OTeacherName"></span> <span class="repeat_name_last" ms-text="el.CPlayView + '人学过'"></span></div>
                    <div class="comment_repeat_unchecked"  ms-if="el.orderType == '1' && el.CState != 2"><span class="unchecked_comment_first" ms-text="'点评讲师：' + el.OTeacherName"></span><span class="unchecked_comment_last last_diff" ms-text="'发布者：' + el.OUserName"></span></div>
                    <div class="comment_repeat_price" ms-if="el.orderType == '1' && el.status == 2 && el.CState == '2' && el.CPrice" ms-text="'￥ ' + el.CPrice"></div>
                    <div class="comment_repeat_price" ms-if="el.orderType == '1' && el.status == 2 && el.CState == '2' && !el.CPrice" ms-text="'免费课程'"></div>
                    <div class="comment_repeat_price" ms-if="el.orderType == '2' && el.CPrice" ms-text="'￥ ' + el.CPrice"></div>
                    <div class="comment_repeat_price" ms-if="el.orderType == '2' && !el.CPrice" ms-text="'免费课程'"></div>
                </div>
                <div ms-visible="commentMsg" class="warning_msg">暂无相关课程...</div>
            </div>
            <div ms-if="display" class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_course_comment"></div>
                </div>
            </div>
        </div>
        <!--======================================================专题课程=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'lessonSubject'" ms-controller="courseController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">专题课程</div>
                <div class="center_right_count">
                    <div class="right_count_left">共&nbsp;<span ms-text="total"></span>&nbsp;个视频</div>
                    <div class="right_count_right"><span ms-click="getCourseInfo(1,1);">最新</span>&nbsp;-&nbsp;<span class="count_right_hot" ms-click="getCourseInfo(1,2);">热门</span>
                    </div>
                </div>
            </div>

            {{--//专题课程--}}

            <div class="center_right_comment">
                {{--//专题课程循环开始--}}
                <div class="right_comment_repeat" ms-repeat="courseInfo">
                    <div class="comment_repeat_img">
                        <a ms-attr-href="'/lessonSubject/detail/' + el.id"><img ms-attr-src="el.coursePic" alt="" width="280" height="180" class="img_big" ms-imgBig/></a>
                    </div>
                    <div class="comment_repeat_title" ms-text="el.courseTitle"></div>
                    <div class="comment_repeat_period"><span ms-text="el.classHour + '课时'"></span> <span class="period_course_span" ms-text="el.coursePlayView + '人学过'"></span></div>
                    <div class="comment_repeat_price" ms-text="'￥ ' + el.coursePrice" ms-if="el.coursePrice"></div>
                    <div class="comment_repeat_price" ms-text="'免费课程'" ms-if="!el.coursePrice"></div>
                </div>
                {{--//专题课程循环结束--}}
                <div ms-visible="subjectMsg" class="warning_msg">暂无相关课程...</div>
            </div>
            <div ms-if="display" class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_course"></div>
                </div>
            </div>

        </div>

        <!--======================================================收藏课程=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'lessonStore'" ms-controller="collectionController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">收藏课程</div>
                <div class="center_right_count">
                    <div class="right_count_left">共&nbsp;<span ms-text="total"></span>&nbsp;个视频</div>
                    {{--ms-if="collectionInfo.size() > 0"--}}
                    <div class="right_count_right">
                        {{--<span ms-click="getCollectionInfo(1);">最新</span>&nbsp;-&nbsp;<span class="count_right_hot" ms-click="getCollectionInfo(2);">热门</span>--}}
                        <div ms-if="collectionInfo.size() > 0">
                            <div class="count_right_store"><button class="right_store_store" ms-click="changeStatus(true);">删除收藏</button></div>
                            <div class="count_right_store" style="display: none"><button class="right_store_store" ms-click="changeStatus(false);
                            ">完成</button></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="center_right_comment">
                {{--//收藏课程循环开始--}}
                <div class="right_comment_repeat" ms-repeat="collectionInfo">
                    <div class="comment_repeat_img">
                        <a ms-attr-href="el.href">
                            <img ms-attr-src="el.coursePic" alt="" width="280" height="180" class="img_big" ms-imgBig/>
                        </a>
                        <span><img ms-if="isShow" src="{{asset('home/image/personCenter/delete.png')}}" alt="" ms-click="deleteCollection(el
                        .collectId,el
                        .isCourse,el.id,$index);"></span>
                    </div>
                    <div class="comment_repeat_title" ms-text="el.courseTitle"></div>
                    <div class="comment_repeat_period" ms-if="el.isCourse == '0'">
                        <span ms-text="el.classHour + '课时'"></span>
                        <span class="period_course_span" ms-html="el.coursePlayView + '人学过'"></span>
                    </div>
                    <div class="comment_repeat_name" ms-if="el.isCourse == '1'">
                        <span ms-text="'讲师：' + el.teachername"></span>
                        <span class="repeat_name_last" ms-html="el.coursePlayView + '人学过'"></span>
                    </div>
                    <div class="comment_repeat_price" ms-text="'￥ ' + el.coursePrice" ms-if="el.coursePrice"></div>
                    <div class="comment_repeat_price" ms-text="'免费课程'" ms-if="!el.coursePrice"></div>
                </div>
                {{--//收藏课程循环结束--}}
                <div ms-visible="collectionMsg" class="warning_msg">暂无收藏课程...</div>
            </div>
            <div ms-if="display" class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_collection"></div>
                </div>
            </div>
        </div>

        <!--======================================================基本信息=======================================================-->
        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'basicInfo'">
            @if (session('right'))
                <div class="editResInfo dui">* {{session('right')}}</div>
            @elseif(session('wrong'))
                <div class="editResInfo cuo">* {{session('wrong')}}</div>
            @endif
            <form method="post" action="{{url('/member/editInfo')}}">
            {{ csrf_field() }}
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">基本信息</div>
            </div>

            <div class="center_right_head">
                <div class="right_head_text">头像</div>
                <div class="right_head_img">
                    <img src="{{asset(\Auth::user()->pic)}}"  alt="">
                    <div class="right_head_img_upload">上传头像</div>
                </div>
            </div>

            <div class="clear"></div>
            <div class="height10"></div>
            <div class="center_right_username">
                <label><span>用户名</span><span class="span_diff">{{$data->username}}</span></label>
            </div>
            @if(\Auth::user()->type == 1)
                <div class="height40"></div>
                <div class="height5"></div>
                <div class="center_right_username">
                    <label><span>真实姓名</span><input type="text" class="input" placeholder="请填写真实姓名" value="{{$data->realname}}" name="realname"></label>
                </div>
            @endif

            <div class="height30"></div>
            <div class="center_right_sex">
                <label><span>性别</span>
                    <input type="radio" {{ $data->sex == 1 ? "checked" : ''}} value="1" name="sex">男
                    <input type="radio" {{ $data->sex == 2 ? "checked" : ''}} name="sex" class="right_sex_input" value="2">女
                </label>
            </div>

            @if(\Auth::user()->type ==0)
                <div class="height40"></div>
                <div class="height5"></div>
                <div class="center_right_username">
                    <span>生日</span>
                    <span class="single_center_right">
                    <select class="js-example-basic-single sel_year" name="birthYear">
                        @if(!$data->birthYear)
                            <option selected="selected">年</option>
                        @else
                            <option selected="selected">{{$data->birthYear}}年</option>
                        @endif
                    </select>
                    <span style="width:28px;height:0;display:inline-block"></span>
                     <select class="js-example-basic-single sel_month" name="birthMonth">
                         @if(!$data->birthMonth)
                             <option selected="selected">月</option>
                         @else
                             <option selected="selected">{{$data->birthMonth}}月</option>
                         @endif
                     </select>

                     <span style="width:28px;height:0;display:inline-block"></span>
                     <select class="js-example-basic-single sel_day" name="birthDay">
                         @if(!$data->birthDay)
                             <option selected="selected">日</option>
                         @else
                             <option selected="selected">{{$data->birthDay}}日</option>
                         @endif
                     </select>
                </span>
                </div>
            @endif

            @if(\Auth::user()->type == 1)
                <div class="height40"></div>
                <div class="height5"></div>
                <div class="center_right_username">
                    <label><span>所在单位</span><input type="text" class="input" placeholder="请填写所在单位" value="{{$data->company}}" name="company"></label>
                </div>

                <div class="height40"></div>
                <div class="height5"></div>
                <div class="center_right_username">
                    <label><span>毕业院校</span><input type="text" class="input" placeholder="请填写毕业院校" value="{{$data->school}}" name="school"></label>
                </div>

                <div class="height40"></div>
                <div class="height10"></div>
                <div class="center_right_username">
                    <span>学历</span>
                    <span class="single_center_right">
                        <select class="js-example-basic-single" name="education">
                            @if(!$data->education)
                            <option selected="selected">学历</option>
                            @endif
                            <option value="中专" {{$data->education == '中专' ? 'selected' : ''}}>中专</option>
                            <option value="大专" {{$data->education == '大专' ? 'selected' : ''}}>大专</option>
                            <option value="本科" {{$data->education == '本科' ? 'selected' : ''}}>本科</option>
                            <option value="硕士" {{$data->education == '硕士' ? 'selected' : ''}}>硕士</option>
                            <option value="博士" {{$data->education == '博士' ? 'selected' : ''}}>博士</option>
                            <option value="博士后" {{$data->education == '博士后' ? 'selected' : ''}}>博士后</option>
                        </select>
                    </span>
                </div>

                <div class="height40"></div>
                <div class="height5"></div>
                <div class="center_right_username center_right_zhicheng">
                    <label><span>职称</span><input class="input" type="text" placeholder="请填写职称" value="{{$data->professional}}" name="professional"></label>
                </div>
            @elseif(\Auth::user()->type == 0)
                <div class="height40"></div>
                <div class="height5"></div>
                <div class="center_right_username">
                    <span>当前等级</span>
                <span class="single_center_right">
                    <select class="js-example-basic-single" name="pianoGrade">
                        @if(!$data->pianoGrade)
                        <option selected="selected">等级</option>
                        @endif
                        <option value="钢琴一级" {{ $data->pianoGrade == '钢琴一级' ? "selected" : ''}}>钢琴一级</option>
                        <option value="钢琴二级" {{ $data->pianoGrade == '钢琴二级' ? "selected" : ''}}>钢琴二级</option>
                        <option value="钢琴三级" {{ $data->pianoGrade == '钢琴三级' ? "selected" : ''}}>钢琴三级</option>
                        <option value="钢琴四级" {{ $data->pianoGrade == '钢琴四级' ? "selected" : ''}}>钢琴四级</option>
                        <option value="钢琴五级" {{ $data->pianoGrade == '钢琴五级' ? "selected" : ''}}>钢琴五级</option>
                        <option value="钢琴六级" {{ $data->pianoGrade == '钢琴六级' ? "selected" : ''}}>钢琴六级</option>
                        <option value="钢琴七级" {{ $data->pianoGrade == '钢琴七级' ? "selected" : ''}}>钢琴七级</option>
                        <option value="钢琴八级" {{ $data->pianoGrade == '钢琴八级' ? "selected" : ''}}>钢琴八级</option>
                        <option value="钢琴九级" {{ $data->pianoGrade == '钢琴九级' ? "selected" : ''}}>钢琴九级</option>
                        <option value="钢琴十级" {{ $data->pianoGrade == '钢琴十级' ? "selected" : ''}}>钢琴十级</option>
                    </select>
                </span>
                </div>

                <div class="height40"></div>
                <div class="height5"></div>
                <div class="center_right_username">
                    <span>开始学琴时间</span>
                    <span class="single_center_right">
                    <select class="js-example-basic-single sel_year" name="learnYear">
                        @if(!$data->learnYear)
                            <option selected="selected">年</option>
                        @else
                            <option value="{{$data->learnYear}}" selected="selected" >{{$data->learnYear}}年</option>
                        @endif
                    </select>
                    <span style="width:28px;height:0;display:inline-block"></span>
                     <select class="js-example-basic-single sel_month" name="learnMonth">
                         @if(!$data->learnMonth)
                             <option selected="selected">月</option>
                         @else
                             <option value="{{$data->learnMonth}}" selected="selected" >{{$data->learnMonth}}月</option>
                         @endif
                     </select>
                    </span>

                </div>
            @endif

            <div class="height40"></div>
            <div class="height5"></div>
            <div class="center_right_username">
                <span>居住地</span>
                    <span class="single_center_right">
                        <select class="js-example-basic-single province" onChange="getCity(this.value)" name="provinceId">
                            @if(!$data->provinceId)
                                <option selected="selected">省</option>
                            @else
                                <option value="{{$data->provinceId}}" selected="selected">{{$data->provinceName}}</option>
                            @endif
                        </select>
                        @if(\Auth::user()->type == 1)
                            <span style="width:12px;height:0;display:inline-block"></span>
                        @elseif(\Auth::user()->type == 0)
                            <span style="width:28px;height:0;display:inline-block"></span>
                        @endif
                        <select class="js-example-basic-single select_single_diff city" name="cityId">
                            @if(!$data->cityId)
                                <option selected="selected">市</option>
                            @else
                                <option value="{{$data->cityId}}" selected="selected">{{$data->cityName}}</option>
                            @endif
                        </select>
                    </span>
            </div>

            <div class="height60"></div>
            <div class="height60"></div>
            <div class="height10"></div>
            <button class="center_right_bottom_button" type="submit">保存</button>
            </form>
        </div>

        <!--======================================================修改密码开始=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'changePass'">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">密码修改</div>
            </div>
            <div class="height40"></div>
            <div class="height5"></div>

            {{--//修改密码主体部分--}}
            <form method="post" action="{{url('/member/editPassword')}}" onsubmit="return postcheck()">
                {{ csrf_field() }}

                <div class="center_right_changePassword">
                <div class="right_changePassword_currentPassword">
                    <label><span>当前密码</span><input type="password" class="unowPsd txtt input" placeholder="" value=""><span class="msg msga"></span></label>
                </div>

                <div class="height60"></div>
                <div class="height20"></div>
                <div class="right_changePassword_currentPassword">
                    <label><span>新密码</span><input type="password" name="password" class="unewPsd txtt input" placeholder="" value=""><span class="msg msgb"></span></label>
                </div>


                <div class="height60"></div>
                <div class="height20"></div>
                <div class="right_changePassword_currentPassword">
                    <label><span>确认密码</span><input type="password" class="urePsd txtt input" placeholder="" value=""><span class="msg msgc"></span></label>
                </div>
                </div>

                <div class="height60"></div>
                <div style="width:100%;height:12px;"></div>
                <button type="submit" class="center_right_password_button">修改</button>
            </form>

        </div>
        <!--======================================================修改密码over=======================================================-->

        <!--======================================================修改手机号开始=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus == 'changePhone'">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">修改手机号</div>
            </div>

            {{--//修改手机号主体部分--}}
            <div class="center_right_changePhone">

                <div class="right_changePhone_currentPhone">
                    <label><span>手机号</span><span class="changePhone_label_span">{{\Auth::user()->phone}}</span></label>
                </div>

                <div class="height60"></div>
                <div style="width:100%;height:17px;"></div>
                <button type="button" class="center_right_phone_button" ms-click="changePhone('checkAuth')">修改</button>

            </div>

            <div class="center_right_checkPhone hide" ms-visible="phoneIndex == 'checkAuth'">
                <div class="right_checkPhone_third">
                    <div class="checkPhone_checkAuth bottom_line_blue">
                        <span>1</span>
                        <span>验证身份</span>
                    </div>

                    <div class="checkPhone_checkAuth">
                        <span>2</span>
                        <span>绑定手机号</span>
                    </div>
                    <div class="checkPhone_checkAuth">
                        <span>3</span>
                        <span>修改成功</span>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="height20"></div>
                <div class="height5"></div>
                {{--验证身份--}}
                <div class="checkPhone_old_phone hide" ms-visible="next == 'checkAuth'">
                    <label class="old_phone_label_first">
                        <input type="text" placeholder="请输入原绑定手机号" ms-duplex="phone">
                    </label>
                    <div class="shoujiMsg Msgaa"></div>
                    <label class="old_phone_label_second">
                        <input class="input" type="text" placeholder="请输入验证码" ms-duplex="code">
                        <span class="getyzm" ms-click="getCodo()">获取验证码</span>
                    </label>
                    <div class="shoujiMsg Msgbb"></div>
                    <button type="button" name="clickBtn" ms-click="changeNext('next1')">下一步</button>

                </div>
                {{--绑定手机号--}}
                <div class="checkPhone_old_phone hide" ms-visible="next == 'next1'">
                    <label class="old_phone_label_first">
                        <input type="text" placeholder="请输入需要绑定手机号" ms-duplex="newphone">
                    </label>
                    <div class="shoujiMsg Msgcc"></div>
                    <label class="old_phone_label_second">
                        <input class="input" type="text" name="captcha" placeholder="请输入验证码" ms-duplex="newcode">
                        <span class="getyzmb" ms-click="getCodob()">获取验证码</span>
                    </label>
                    <div class="shoujiMsg Msgdd"></div>
                    <button type="button" name="clickBtn1" ms-click="changeNext('success_next')">下一步</button>

                </div>

                <div class="checkPhone_old_phone hide" ms-visible="next == 'success_next'">
                    <span class="success_info">恭喜你,手机号修改成功！</span>
                </div>
            </div>
        </div>

        <!-- 遮罩层 -->
        <div class="shadow hide" ms-popup="popUp" value="close"></div>
        <!-- 删除通知弹出层 -->
        <div class="delete_comment hide" ms-popup="popUp" value="deleteNotice">
            <div class="top">
                <span>确认删除该通知？</span>
            </div>
            <div class="bot">
                <span class="quit" ms-click="popUpSwitch(false)">取消</span>
                <span class="sure" ms-click="popUpSwitch('sureNotice')">确定</span>
            </div>
        </div>
        <!-- 删除评论弹出层 -->
        <div class="delete_comment hide" ms-popup="popUp" value="deleteComment">
            <div class="top">
                <span>确认删除该通知？</span>
            </div>
            <div class="bot">
                <span class="quit" ms-click="popUpSwitch(false)">取消</span>
                <span class="sure" ms-click="popUpSwitch('sureComment')">确定</span>
            </div>
        </div>
        <!-- 购买课程弹出层 -->
        <div class="buy_course hide" ms-popup="popUp" value="applyRefund">
            <div class="buy_course_top">
                <span class="left">申请退款</span>
                <span class="right" ms-click="popUpSwitch(false,1)"></span>
            </div>
            <div class="buy_course_center">
                <div class="top">
                    <span>订单名称&nbsp;:&nbsp;</span>
                    <span class="orderName" ms-text="applyRefund.orderTitle" ms-attr-title="applyRefund.orderTitle"></span>
                </div>
                <div class="center">
                    <span>可退金额：</span>
                    <span class="canMoney" ms-text="applyRefund.price + ' 元'"></span>
                    <div class="center_refundPrice">
                        (购买时价格&nbsp;:&nbsp;[--applyRefund.payPrice--]元,扣除已观看课程费用)
                    </div>
                </div>
                <div class="clear"></div>
                <div class="bot">
                    <span class="bot_span_select2">退款原因&nbsp;:&nbsp;</span>
                    <span class="bot_span_last bot_span_triangle2 hide"></span>
                    <span class="select_require_msg hide" ms-visible="refundType == ''"></span>
                    <select name="" id="" class="hide" ms-duplex="refundType" data-duplex-changed="selectChange">
                        <option value="0">课程购买错误</option>
                        <option value="1">课程内容与描述不符</option>
                        <option value="2">其他</option>
                    </select>
                </div>
                <div class="clear"></div>
                <div class="last hide">
                    <span>其他原因&nbsp;:&nbsp;</span>
                    <textarea name="otherReason" id="otherReason" placeholder="请描述退款原因" ms-duplex="refundContent"></textarea>
                </div>
            </div>
            <div class="clear"></div>
            <div class="pay_btn" ms-click="popUpSwitch('submitApply')">提交申请</div>
        </div>
    </div>

    <!--======================================================修改手机号over=======================================================-->
    {{--头像切换弹出层--}}
    <div class="headImg hide">
        <div class="headImg_tit">
            <div class="headImg_tit_l">更换头像</div>
            {{--<div class="headImg_tit_r"><img src="{{asset('home/image/personCenter/close.png')}}" alt=""></div>--}}
            <div class="headImg_tit_r">×</div>
        </div>
        <div class="headImg_con">
            <div class="headImg_con_l">
                <div style="height:20px;"></div>
                <div id="imgs">
                    <div style="height:50px;"></div>
                    <img id="imghead" style="" src="{{asset('home/image/personCenter/default.png')}}">
                </div>
            </div>
            <div class="headImg_con_r">
                <div style="height:20px;"></div>
                <div class="headImg_con_r_yl">预览：</div>
                <div style="height:30px;"></div>
                <div class="headImg_con_r_preview_s">
                    <div id="imgsb" style="width:60px;height:60px;overflow: hidden;">
                        {{--<img style="width: 100%;height:100%" src="{{asset(\Auth::user()->pic)}}" alt="">--}}
                        <img style="width: 100%;height:100%" src="{{asset('home/image/personCenter/default.png')}}" alt="">
                    </div>
                </div>
                <div class="headImg_con_r_preview_s_info">60*60</div>
                <div style="height:20px;"></div>
                <div class="headImg_con_r_preview_s2">
                    <div id="imgsc" style="width:100px;height:100px;overflow: hidden;">
                        {{--<img style="width: 100%;height:100%" src="{{asset(\Auth::user()->pic)}}" alt="">--}}
                        <img style="width: 100%;height:100%" src="{{asset('home/image/personCenter/default.png')}}" alt="">
                    </div>
                </div>
                <div class="headImg_con_r_preview_s_info">100*100</div>
            </div>
        </div>
        <div class="headImg_foot">
            <div class="headImg_foot_selImg">
                <div class="sel_btn">选择图片</div>
                <input id="file_upload"  name="file_upload" type="file" multiple="false" value="" />
            </div>
            <div class="headImg_foot_cutImg">
                <div class="sel_btn saveImg">保存头像</div>
            </div>
        </div>
    </div>
    <div class="clear"></div>

    <div class="height60"></div>

    <div class="height60"></div>
@endsection
@section('selectjs')
    <script type="text/javascript" src="{{asset('home/js/personCenter/select2.full.min.js')}}"></script>

    <script type="text/javascript">
        $('.js-example-basic-single').select2(
                {
//                    placeholder:'请选择',
//                    minimumResultsForSearch: Infinity
                }
        );

        $('.bot_select2_plugin .js-example-basic-single').select2(
                {
//                    placeholder:'请选择退款原因',
                    minimumResultsForSearch: Infinity
                }
        );
    </script>

@endsection
@section('js')
    <script type="text/javascript" src="{{asset('home/js/games/pagination.js')}}"></script>

    <script type="text/javascript">
        require(['/personCenter/index'], function (sideBar) {
            sideBar.mineUsername = '{{$mineUsername}}' || null;
            sideBar.mineUserId = '{{$mineUserId}}' || null;
            {{--sideBar.tab = '{{$tab}}' || null;--}}
            if(window.location.hash){
                sideBar.tab = window.location.hash.split('#')[1];
            }else{
//                console.log(window.location.href);
                sideBar.tab = 'basicInfo';
            }

            if (sideBar.tab) {
                sideBar.tabStatus = sideBar.tab;

                if(sideBar.tabStatus == 'lessonStore' || sideBar.tabStatus == 'lessonSubject'){
                    sideBar.changeTab(sideBar.tab,'student');
                }else{
                    sideBar.changeTab(sideBar.tab);
                }

            }

            {{--sideBar.tabStatus = '{{$tab}}' || 'basicInfo';--}}
            avalon.directive('popup', {
                update: function (value) {
                    var element = this.element;
                    var popUpType = avalon(element).attr('value');
                    if (!value) {
                        avalon(element).css('display', 'none');
                        return;
                    }

                    if (value == popUpType || popUpType == 'close') {
                        avalon(element).css('display', 'block');
                    }

                }
            });
            sideBar.findHaveNotice();
            avalon.scan();
        });
    </script>
    <script type="text/javascript" src="{{asset('home/js/personCenter/Jcrop.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/personCenter/jquery.uploadify.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/personCenter/teacherStudent.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/users/jquery.bday-picker.js') }}"></script>
    <script>
        $(function () {
            $.ms_DatePicker({
                YearSelector: ".sel_year",
                MonthSelector: ".sel_month",
                DaySelector: ".sel_day"
            });

        });
    </script>
@endsection




