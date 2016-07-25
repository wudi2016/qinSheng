@extends('layouts.layoutHome')

@section('title', '名师个人中心')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/select2.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/teacherStudent.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/Jcrop.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/uploadify.css')}}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/personCenter/pagination.css')}}">
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
                    <img src="{{asset(\Auth::user()->pic)}}" alt="" width="85" height="85">
                </div>
                <div class="left_top_name">
                    <div class="top_name">{{$data->username}}</div>
                    <div class="height10"></div>
                    <div class="height5"></div>

                    <div class="top_img_role"><span>{{$data->company}}</span></div>

                </div>
            </div>
            <!--主体左边中间部分-->
            <div class="center_left_famous">
                <div class="height10"></div>
                <div class="height5"></div>
                <div class="account_manger">课程管理</div>
                <div class="height5"></div>
                <span class="span_hover"></span>
                <div class="account_common" name='waitComment'  ms-click="changeTab('waitComment')">待评点评</div>
                <span class="span_hover"></span>
                <div class="account_common" name='sureComment'  ms-click="changeTab('sureComment')">已评点评</div>
                <span class="span_hover"></span>
                <div class="account_common" name='lessonSubject'  ms-click="changeTab('lessonSubject','teacher')">专题课程</div>

                <!--我的通知-->
                <div class="height5"></div>
                <div class="account_manger">我的通知</div>
                <div class="height5"></div>
                <span class="span_hover"></span>
                <div class="account_common" name="wholeNotice" ms-click="changeTab('wholeNotice')">全部通知</div>

                <!--课程管理-->
                <div class="height5"></div>
                <div class="account_manger">财产管理</div>
                <div class="height5"></div>
                <span class="span_hover"></span>
                <div class="account_common" name='lessonStore'  ms-click="changeTab('lessonStore','teacher')">我的收藏</div>
                <span class="span_hover"></span>
                <div class="account_common" name='myFans'  ms-click="changeTab('myFans')">我的粉丝</div>
                <span class="span_hover"></span>
                <div class="account_common" name='myFocus'  ms-click="changeTab('myFocus')">我的关注</div>


                <!--个人设置-->
                <div class="height5"></div>
                <div class="account_manger">个人设置</div>
                <div class="height5"></div>
                <span class="span_hover"></span>
                <div class="account_common blue_common" name="basicInfo" ms-click="changeTab('basicInfo')">基本信息</div>
                <span class="span_hover"></span>
                <div class="account_common" ms-click="changeTab('changePass')">密码修改</div>
                <span class="span_hover"></span>
                <div class="account_common" ms-click="changeTab('changePhone')"><span>修改手机号</span></div>

            </div>
            <div class="height10" style="background: #F5F5F5"></div>
            <!--主体左边底部部分-->
            <div class="center_left_footer">
                <!--退出按钮-->
                <a href="{{url('/auth/logout')}}"><button type="button" class="left_footer_quit">退出</button></a>
            </div>
        </div>

        <!--主体右边-->

        <!--======================================================待评点评课程=======================================================-->

        <div class="center_right hide" value="waitComment" ms-visible="tabStatus === 'waitComment'" ms-controller="waitCommentController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">待评作品</div>
                <div class="center_right_count">
                    <div class="right_count_left">共<span ms-text="' ' +total +' ' "></span>个视频</div>
                </div>
            </div>

            {{--//待评点评--}}

            <div class="center_right_comment">
                {{--//点评课程循环开始--}}
                <div class="right_comment_repeat" ms-repeat="waitCommentList">
                    <!--审核未通过-->
                    <div ms-if="el.commentState == 0">
                        <div class="comment_repeat_img">
                            <a ms-attr-href="'/lessonComment/reUploadComment/'+ el.commentId">
                                <div class="repeat_img_unchecked">
                                    <div class="comment_video_unchecked" ms-text="'视频审核未通过'"></div>
                                    <div class="comment_video_time" ms-text=" '发布时间：'+ el.time"></div>
                                </div>
                            </a>

                        </div>

                        <div class="comment_repeat_title" ms-text="el.applyTitle"></div>
                            <div class="comment_repeat_unchecked"><span ms-text="'点评讲师&nbsp;'+':&nbsp;'+ el.teacherName"></span>
                                <span ms-text="'发布者&nbsp;'+':&nbsp;'+ el.realname"></span>
                            </div>
                    </div>

                    <!--视频转码中-->
                    <div ms-if="el.commentState == 1 && el.low == null && el.medium == null && el.high == null">
                        <div class="comment_repeat_img">
                            <div class="repeat_img_unchecked">
                                <div class="comment_video_unchecked" ms-text="'视频转码中'"></div>
                                <div class="comment_video_time" ms-text=" '发布时间：'+ el.time"></div>
                            </div>

                        </div>
                        <div class="comment_repeat_title" ms-text="el.applyTitle"></div>
                        <div class="comment_repeat_unchecked"><span ms-text="'点评讲师&nbsp;'+':&nbsp;'+ el.teacherName"></span>
                            <span ms-text="'发布者&nbsp;'+':&nbsp;'+ el.realname"></span>
                        </div>
                    </div>

                    <!--审核中-->
                    <div ms-if="el.commentState == 1 && el.low != null && el.medium != null && el.high != null">
                        <div class="comment_repeat_img">
                            <div class="repeat_img_unchecked">
                                <div class="comment_video_unchecked" ms-text="'视频审核中'"></div>
                                <div class="comment_video_time" ms-text=" '发布时间：'+ el.time"></div>
                            </div>

                        </div>
                        <div class="comment_repeat_title" ms-text="el.applyTitle"></div>
                        <div class="comment_repeat_unchecked"><span ms-text="'点评讲师&nbsp;'+':&nbsp;'+ el.teacherName"></span>
                            <span ms-text="'发布者&nbsp;'+':&nbsp;'+ el.realname"></span>
                        </div>
                    </div>

                    {{--<!--等待点评-->--}}
                    <div ms-if="el.commentState != 0 && el.commentState != 1 && el.commentState != 2">
                        <div class="comment_repeat_img">
                            <a ms-attr-href="'/lessonComment/wait/'+ el.applyId">
                                <div class="repeat_img_unchecked">
                                    <div class="comment_video_unchecked" ms-text="'等待点评'"></div>
                                    <div class="comment_video_time" ms-text=" '发布时间：'+ el.applyTime"></div>
                                </div>
                            </a>
                        </div>
                        <div class="comment_repeat_title" ms-text="el.applyTitle"></div>
                        <div class="comment_repeat_unchecked"><span ms-text="'点评讲师&nbsp;'+':&nbsp;'+ el.teacherName"></span>
                            <span ms-text="'发布者&nbsp;'+':&nbsp;'+ el.realname"></span>
                        </div>
                    </div>
                </div>
                {{--//点评课程循环结束--}}
                <div ms-visible="waitComment" class="warning_msg">暂无待评作品...</div>

            </div>
            <!--分页-->
            <div class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_waitComment"></div>
                </div>
            </div>
        </div>
        <!--======================================================已评点评课程=======================================================-->

        <div class="center_right hide" value="sureComment" ms-visible="tabStatus === 'sureComment'" ms-controller="completeCommentController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">已评课程</div>
                <div class="center_right_count">
                    <div class="right_count_left">共<span ms-html="' ' + total + ' '"></span>个视频</div>
                    <div class="right_count_right"><span ms-click="getCompleteCommentInfo('new');">最新</span>&nbsp;-&nbsp;<span ms-click="getCompleteCommentInfo('hot');" class="count_right_hot">热门</span>
                    </div>
                </div>
            </div>

            {{--//点评课程--}}

            <div class="center_right_comment">
                {{--//点评课程循环开始--}}
                <div class="right_comment_repeat" ms-repeat="completeCommentList">
                    <div class="comment_repeat_img">
                        <a ms-attr-href="'/lessonComment/detail/'+ el.commentId">
                            <div class="repeat_img_unchecked">
                                <div class="comment_video_unchecked" ms-html="'点评完成'"></div>
                                <div class="comment_video_time" ms-html=" '发布时间：' + el.time"></div>
                                <div class="comment_video_commentTime" ms-class="commentTime_blue : ($index+1)%2 == 1"  ms-html=" '点评时间：' + el.commentTime"></div>
                            </div>
                        </a>
                    </div>
                    <div class="comment_repeat_title" ms-html="el.commentTitle"></div>
                    <div class="comment_repeat_unchecked unchecked_diff">
                        <span ms-text="'点评讲师&nbsp;'+':&nbsp;'+ el.teachername"></span>
                        <span class="unchecked_span" ms-text="'发布者&nbsp;'+':&nbsp;'+ el.realname"></span>
                    </div>
                    <div class="comment_repeat_leader">
                        <span ms-html="el.view + ' 人'"></span>
                        <span class="repeat_leader_lastSpan" ms-html="el.fav + ' 人'"></span>
                    </div>
                </div>
                {{--//点评课程循环结束--}}
                <div ms-visible="sureComment" class="warning_msg">暂无已评课程...</div>
            </div>
            <!--分页-->
            <div class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_sureComment"></div>
                </div>
            </div>
        </div>

        <!--======================================================专题课程=======================================================-->

        <div class="center_right hide" value="lessonSubject" ms-visible="tabStatus === 'lessonSubject'"
             ms-controller="courseTeacherController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">专题课程</div>
                <div class="center_right_count">
                    <div class="right_count_left">共<span ms-text="'&nbsp;' + total + '&nbsp;'"></span>个视频</div>
                    <div class="right_count_right">
                        <span class="count_right_mostNew" ms-click="getCourseInfo(2,1);">最新</span>&nbsp;-&nbsp;
                        <span class="count_right_hot" ms-click="getCourseInfo(2,2);">热门</span>
                    </div>
                </div>
            </div>

            {{--//专题课程--}}

            <div class="center_right_comment">
                {{--//专题课程循环开始--}}
                <div class="right_comment_repeat" ms-repeat="courseInfo">
                    <div class="comment_repeat_img">
                        <a ms-attr-href="href + el.id"><img ms-imgBig class="img_big" ms-attr-src="el.coursePic" alt=""
                                                            width="280" height="180"/></a>
                    </div>
                    <div class="comment_repeat_title" ms-text="el.courseTitle"></div>
                    <div class="comment_repeat_period"><span ms-text="el.classHour + '课时'"></span> <span
                                ms-text="el.coursePlayView + '人学过'"></span></div>
                    <div class="comment_repeat_price" ms-text="'￥ ' + el.coursePrice"></div>
                </div>
                {{--//专题课程循环结束--}}
            </div>
            <div ms-visible="subjectMsg" class="warning_msg">暂无相关课程...</div>
            <div class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_course"></div>
                </div>
            </div>
        </div>


        <!--======================================================全部通知=======================================================-->

        <div class="center_right hide" value="wholeNotice" ms-visible="tabStatus === 'wholeNotice'" ms-controller="noticeController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">全部通知</div>
            </div>

            {{--//我的通知--}}

            <div class="center_right_notice">
                {{--//通知循环开始--}}
                <div class="right_notice_repeat" ms-repeat="noticeInfo">
                    <div class="notice_repeat_comment">
                        <!-- 后台发送消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '0'">
                            <span>您上传的点评视频没有通过审核，原因是：</span><span class="span_light" ms-text="el.content"></span>
                        </div>
                        <!-- 注册加入消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '1'">
                            <span ms-text="el.content"></span>
                        </div>
                        <!-- 本人被点评消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '2'">
                            <span>李民&nbsp;&nbsp;</span>老师点评了<span>张三丰</span>&nbsp;&nbsp;的作品，<span><a href="">快去看看吧>></a></span>
                        </div>
                        <!-- 本人被关注消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '3'">
                            <span ms-text="el.fromUsername" class="span_light"></span>&nbsp;&nbsp;<span ms-text="el.content"></span>
                        </div>
                        <!-- 关注用户被点评消息 -->
                        <div class="repeat_comment_text" ms-if="el.type == '4'">
                            <span ms-text="el.fromUsername"></span><span ms-text="el.content"></span><span ms-text="username"></span><span ms-text="toUsername"></span>
                        </div>
                        <div class="repeat_comment_time">
                            <div class="comment_time" ms-text="el.created_at"></div>
                            <div class="comment_delete" ms-click="popUpSwitch('deleteNotice',$index)"><a href="#">删除</a></div>
                        </div>
                    </div>
                </div>
                <div ms-visible="noticeMsg" class="warning_msg">暂无通知消息...</div>
                <!-- 遮罩层 -->
                <div class="shadow hide" ms-popup="popUp" value="close"></div>
                <!-- 删除评论弹出层 -->
                {{--//通知循环结束--}}
                <div class="delete_comment hide" ms-popup="popUp" value="deleteNotice">
                    <div class="top">
                        <span>确认删除该通知？</span>
                    </div>
                    <div class="bot">
                        <span class="quit" ms-click="popUpSwitch(false)">取消</span>
                        <span class="sure" ms-click="deleteNotice(false)">确定</span>
                    </div>
                </div>
            </div>
            <div class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_notice"></div>
                </div>
            </div>
        </div>
        <!--======================================================我的收藏=======================================================-->

        <div class="center_right hide" value="lessonStore" ms-visible="tabStatus === 'lessonStore'"
             ms-controller="collectionTeacherController">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">收藏课程</div>
                <div class="center_right_count">
                    <div class="right_count_left">共<span ms-html="'&nbsp;' + total + '&nbsp;'"></span>个视频</div>
                    <div class="right_count_right">
                        {{--<span ms-click="getCollectionInfo(1);">最新</span>&nbsp;-&nbsp;<span class="count_right_hot" ms-click="getCollectionInfo(2);">热门</span>--}}
                        <div>
                            <div class="count_right_store">删除收藏</div>
                            <div class="count_right_store" style="display: none">完成</div>
                        </div>
                    </div>
                </div>
            </div>
            {{--//收藏课程--}}
            <div class="center_right_comment">
                {{--//收藏课程循环开始--}}
                <div class="right_comment_repeat" ms-repeat="collectionInfo">
                    <div class="comment_repeat_img">
                        <a ms-attr-href="el.href">
                            <img ms-attr-src="el.coursePic" alt="" width="280" height="180" class="img_big" ms-imgBig>
                        </a>
                        <span ms-click="deleteCollection(el.collectId,el.isCourse,el.id,$index)"><img ms-attr-src="pageInfo.deletePic" alt=""/></span>
                    </div>
                    <a ms-attr-href="el.href">
                        <div class="comment_repeat_title" ms-text="el.courseTitle"></div>
                    </a>
                    <div class="comment_repeat_period" ms-if="el.isCourse == '0'">
                        <span ms-text="el.classHour + '课时'"></span>
                        <span ms-html="el.coursePlayView + '学过'"></span>
                    </div>
                    <div class="comment_repeat_name" ms-if="el.isCourse == '1'">
                        <span ms-text="'讲师：' + el.teachername"></span>
                        <span ms-html="el.coursePlayView + '学过'"></span>
                    </div>
                    <div class="comment_repeat_price" ms-text="'￥ ' + el.coursePrice"></div>
                </div>
                {{--//收藏课程循环结束--}}
                <div ms-visible="collectionMsg" class="warning_msg">暂无收藏课程...</div>
            </div>
            <div class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_collection"></div>
                </div>
            </div>
        </div>
        <!--======================================================我的粉丝=======================================================-->

        <div class="center_right hide" value="myFans" ms-visible="tabStatus === 'myFans'"
             ms-controller="myFansTeacher">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">我的粉丝</div>
                <div class="center_right_count">共<span ms-text="'&nbsp;'+total+'&nbsp;'"></span>个粉丝</div>
            </div>
            <div class="height20"></div>

            {{--//我的关注--}}
            <div class="center_right_focus">
                {{--===============================我的好友粉丝开始====================================--}}
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
                {{--===============================我的粉丝循环结束====================================--}}
                <div ms-visible="myFans" class="warning_info">暂无粉丝...</div>
            </div>
            <div class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_friend"></div>
                </div>
            </div>
        </div>

        <!--======================================================我的关注=======================================================-->

        <div class="center_right hide" value="myFocus" ms-visible="tabStatus === 'myFocus'"
             ms-controller="myFocusTeacher">
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">我的关注</div>
                <div class="center_right_count">共<span ms-text="'&nbsp;'+total+'&nbsp;'"></span>个关注</div>
            </div>
            <div class="height20"></div>

            {{--//我的关注--}}
            <div class="center_right_focus">
                {{--===============================我的关注循环开始====================================--}}
                <div class="right_focus_repeat" ms-repeat="myFocusList">
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
                {{--===============================我的关注循环结束====================================--}}
                <div ms-visible="myFocus" class="warning_info">暂无关注...</div>
            </div>
            <div class="pagecon_parent">
                <div class="pagecon">
                    <div id="page_focus"></div>
                </div>
            </div>
        </div>


        <!--======================================================基本信息=======================================================-->
        <div class="center_right hide" name="selectName" ms-visible="tabStatus === 'basicInfo'">
            @if (session('right'))
                <div class="editResInfo dui">* {{session('right')}}</div>
            @elseif(session('wrong'))
                <div class="editResInfo cuo">* {{session('wrong')}}</div>
            @endif
            <form method="post" action="{{url('/member/editInfotea')}}">
            {{ csrf_field() }}
            <div class="center_right_top">
                <div class="height50"></div>
                <div class="center_right_information">基本信息</div>
            </div>

            <div class="center_right_head">
                <div class="right_head_text">头像</div>
                <div class="right_head_img">
                    <img src="{{asset(\Auth::user()->pic)}}" alt="">
                    <div class="right_head_img_upload">上传头像</div>
                </div>
            </div>

            <div class="clear"></div>
            <div class="height10"></div>
            <div class="center_right_username">
                <label><span>用户名</span><input class="input" type="text" placeholder="请填写用户名" readonly value="{{$data->username}}"></label>
            </div>

            <div class="height40"></div>
            <div class="height5"></div>
            <div class="center_right_username">
                <label><span>真实姓名</span><input style="color:black;" class="input" type="text" placeholder="请填写真实姓名" name="realname" value="{{$data->realname}}"></label>
            </div>


            <div class="height30"></div>
            <div class="center_right_sex">
                <label><span>性别</span>
                    <input type="radio" {{ $data->sex == 1 ? "checked" : ''}} value="1" name="sex">男
                    <input type="radio" {{ $data->sex == 2 ? "checked" : ''}} name="sex" class="right_sex_input" value="2">女
                </label>
            </div>

            <div class="height40"></div>
            <div class="height5"></div>
            <div class="center_right_username">
                <label><span>所在单位</span><input class="input" type="text" placeholder="请填写所在单位" name="company" value="{{$data->company}}"></label>
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
                        <option value="专科" {{ $data->education == '专科' ? "selected" : ''}}>专科</option>
                        <option value="本科" {{ $data->education == '本科' ? "selected" : ''}}>本科</option>
                        <option value="研究生" {{ $data->education == '研究生' ? "selected" : ''}}>研究生</option>
                        <option value="博士" {{ $data->education == '博士' ? "selected" : ''}}>博士</option>
                    </select>
                </span>
            </div>

            <div class="height40"></div>
            <div class="height5"></div>
            <div class="center_right_username center_right_zhicheng">
                <label><span>职称</span><input class="input" type="text" placeholder="请填写职称" name="professional" value="{{$data->professional}}"></label>
            </div>


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

                        <span style="width:12px;height:0;display:inline-block"></span>

                        <select class="js-example-basic-single select_single_diff city" name="cityId">
                            @if(!$data->cityId)
                                <option selected="selected">市</option>
                            @else
                                <option value="{{$data->cityId}}" selected="selected">{{$data->cityName}}</option>
                            @endif
                        </select>
                    </span>
            </div>

            <div class="height40"></div>
            <div class="height5"></div>
            <div class="center_right_textarea">
                <span style="width:147px;float: left">个人简介</span>
                <div class="center_right_textarea_con">
                    <div class="center_right_textarea_con_top">
                        <textarea name="intro" id="center_right_textarea_con_top_text">{{$data->intro}}</textarea>
                    </div>
                    <div class="center_right_textarea_con_foot">
                        <span class="countfont">0</span>/200字&nbsp;
                    </div>
                </div>
            </div>
            <div class="clear"></div>
            <div class="height60"></div>
            <div class="height10"></div>
            <div class="height5"></div>
            <button type="submit" class="center_right_bottom_button">保存</button>
            </form>
        </div>

        <!--======================================================修改密码开始=======================================================-->

        <div class="center_right hide" name="selectName" ms-visible="tabStatus === 'changePass'">
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

        <div class="center_right hide" name="selectName" ms-visible="tabStatus === 'changePhone'">
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
                <div class="checkPhone_old_phone hide" ms-visible="next === 'checkAuth'">
                    <label class="old_phone_label_first">
                        <input type="text" placeholder="请输入原绑定手机号" ms-duplex="phone">
                    </label>
                    <div class="shoujiMsg Msgaa"></div>
                    <label class="old_phone_label_second">
                        <input type="text" placeholder="请输入验证码" ms-duplex="code">
                        <span class="getyzm" ms-click="getCodo()">获取验证码</span>
                    </label>
                    <div class="shoujiMsg Msgbb"></div>
                    <button type="button" name="clickBtn" ms-click="changeNext('next1')">下一步</button>

                </div>
                {{--绑定手机号--}}
                <div class="checkPhone_old_phone hide" ms-visible="next === 'next1'">
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

                <div class="checkPhone_old_phone hide" ms-visible="next === 'success_next'">
                    <span class="success_info">恭喜你,手机号修改成功！</span>
                </div>
            </div>
        </div>


    </div>
    <!--======================================================修改手机号over=======================================================-->
    {{--头像切换弹出层--}}
    <div class="headImg hide">
        <div class="headImg_tit">
            <div class="headImg_tit_l">更换头像</div>
            <div class="headImg_tit_r"><img src="{{asset('home/image/personCenter/close.png')}}" alt=""></div>
        </div>
        <div class="headImg_con">
            <div class="headImg_con_l">
                <div style="height:20px;"></div>
                <div id="imgs">
                    <div style="height:50px;"></div>
                    <img id="imghead" style="" src="{{asset('home/image/personCenter/unload.png')}}">
                </div>
            </div>
            <div class="headImg_con_r">
                <div style="height:20px;"></div>
                <div class="headImg_con_r_yl">预览：</div>
                <div style="height:30px;"></div>
                <div class="headImg_con_r_preview_s">
                    <div id="imgsb" style="width:60px;height:60px;overflow: hidden;">
                        {{--<img style="width: 100%;height:100%" src="{{asset(\Auth::user()->pic)}}" alt="">--}}
                        <img style="width: 100%;height:100%" src="{{asset('home/image/personCenter/unload.png')}}"
                             alt="">
                    </div>
                </div>
                <div class="headImg_con_r_preview_s_info">60*60</div>
                <div style="height:20px;"></div>
                <div class="headImg_con_r_preview_s2">
                    <div id="imgsc" style="width:100px;height:100px;overflow: hidden;">
                        {{--<img style="width: 100%;height:100%" src="{{asset(\Auth::user()->pic)}}" alt="">--}}
                        <img style="width: 100%;height:100%" src="{{asset('home/image/personCenter/unload.png')}}"
                             alt="">
                    </div>
                </div>
                <div class="headImg_con_r_preview_s_info">100*100</div>
            </div>
        </div>
        <div class="headImg_foot">
            <div class="headImg_foot_selImg">
                <div class="sel_btn">选择图片</div>
                <input id="file_upload" name="file_upload" type="file" multiple="false" value=""/>
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
                    //minimumResultsForSearch: Infinity
                }
        );
    </script>

@endsection
@section('js')
    <script type="text/javascript">
        require(['/personCenter/index.js'], function (sideBar) {
            sideBar.mineUsername = '{{$mineUsername}}' || null;
            sideBar.tab = '{{$tab}}' || 'basicInfo';
            {{--sideBar.type = '{{$typeID}}' || null;--}}
            if(sideBar.tab){
                sideBar.tabStatus = sideBar.tab;
                sideBar.changeTab(sideBar.tab);
            }
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

            avalon.scan();
        });
    </script>
    <script type="text/javascript" src="{{asset('home/js/personCenter/Jcrop.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/personCenter/jquery.uploadify.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/personCenter/teacherStudent.js')}}"></script>
    <script type="text/javascript" src="{{asset('home/js/games/pagination.js')}}"></script>
@endsection




