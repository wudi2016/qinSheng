@extends('layouts.layoutHome')

@section('title', '专题课程详情')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonSubject/detail.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonComment/commentDetail/index.css')}}">
@endsection

@section('content')
    <div class="contain_lessonDetail" ms-controller="lessonSubjectDetail">
        <div style="width: 100%;height: 15px;"></div>
        <div class="contain_lessonDetail_top">
            <div class="contain_lessonDetail_top_breadcrumb">
                <a ms-attr-href="pageInfo.index">首页</a> >
                <a ms-attr-href="pageInfo.course">课程</a> >
                <a ms-attr-href="pageInfo.lessonSubject">专题课程</a> > 课程详情
            </div>
            <div class="contain_lessonDetail_top_video">
                <div class="contain_lessonDetail_top_video_left">
                    {{--<img ms-attr-src="pageInfo.video"/>--}}
                    <div class="video_block" style="height: 515px;">
                        <div class="videobox" id="mediaplayer" ms-visible="!overtime"></div>
                        <div class="overtime hide" ms-visible="overtime" style="height: 515px;">
                            <div style="clear: both; height: 170px;"></div>
                            <div class="overtime_detail">
                                <img class="palyinfo_detail_img" style="margin-top: 7px;" src="/home/image/lessonComment/commentDetail/download_warning.png">
                                <div class="palyinfo_detail_text">尊敬的用户：</div>
                                <div class="palyinfo_detail_text">试看已结束，请购买观看完整课程。</div>
                            </div>
                            @if (Auth::check())
                                <a class="comment_button" style="margin: 30px auto 0; float: none; background: #1588E5; color: white; cursor: pointer; display: block;" ms-click="popUpSwitch('buyCourse')">立即购买</a>
                            @else
                                <a href="/index/login" class="overtime_tologin"><img src="{{asset('/home/image/lessonComment/commentDetail/gologin.png')}}" width="100%" height="100%"></a>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="contain_lessonDetail_top_video_right">
                    <div class="contain_lessonDetail_top_video_right_name" ms-html="detailInfo.courseTitle">钢琴演奏基础课程</div>
                    <div class="contain_lessonDetail_top_video_right_price">价格：<span ms-html="'￥' + detailInfo.coursePrice + '元'"></span></div>
                    <div class="contain_lessonDetail_top_video_right_detail">
                        <span class="classes" ms-html="detailInfo.classHour + '课时'"></span>
                        <span class="study" ms-html="detailInfo.coursePlayView + '人学习'"></span>
                    </div>
                    <div class="contain_lessonDetail_top_video_right_btn">
                        <span class="first" ms-click="popUpSwitch('buyCourse')" ms-visible="!detailInfo.isBuy">立即购买</span>
                        <span class="second" ms-visible="!detailInfo.isBuy">立即试学</span>
                        <span class="third" ms-visible="detailInfo.isBuy">立即学习</span>
                    </div>
                    <div class="contain_lessonDetail_top_video_right_collect">
                        <div ms-if="!detailInfo.isCollection" class="collect" ms-click="addCollect(detailInfo.id,detailInfo.isCollection);">收藏</div>
                        <div ms-if="detailInfo.isCollection" class="collect_light" ms-click="addCollect(detailInfo.id,detailInfo.isCollection);">已收藏</div>
                        <div class="response" ms-click="popUpSwitch('feedback')">反馈</div>
                        <!-- 锚点定位(评论回复) -->
                        <div id="input_content" style="width: 1px;height: 1px;position: absolute;z-index: 2;top: 580px;"></div>
                        <!-- 锚点定位(评论回复) -->
                    </div>
                </div>
            </div>
        </div>

        <div class="contain_lessonDetail_bot">
            <div class="contain_lessonDetail_bot_left">
                <!-- 选项卡切换 -->
                <div class="contain_lessonDetail_bot_left_tip">
                    <div class="left active">
                        <span class="light" name="course" ms-changeoption="changeOption" ms-click="changeSwitch('course');">课程介绍</span>
                    </div>
                    <div class="center">
                        <span name="comment" ms-changeoption="changeOption" ms-click="changeSwitch('comment');">学员评论</span>
                    </div>
                    <div class="right">
                        <span name="dataDownload" ms-changeoption="changeOption" ms-click="changeSwitch('dataDownload');">资料下载</span>
                    </div>
                </div>
                <!-- 简介 -->
                <div name="course" ms-visible="changeOption == 'course'">
                    <div class="contain_lessonDetail_bot_left_desc">
                        <span class="top">简介</span>
                        <span class="content" ms-html="detailInfo.courseIntro"></span>
                    </div>
                    <!-- 目录 -->
                    <div class="contain_lessonDetail_bot_left_list" ms-controller="catalogInfoController">
                        <span class="top">目录</span>
                        <div class="contain_lessonDetail_bot_left_info" ms-repeat="catalogInfo">
                            <div class="title" ms-html="el.title"></div>
                            <div style="width: 100%;height: 5px"></div>
                            <div class="contain_lessonDetail_bot_left_info_div">
                                <div class="data" ms-repeat="el.section">
                                    <span class="spot"></span>
                                    <span class="data_content" ms-html="el.title" ms-click="changeVideo(el.courseLowPath);"></span>
                                    <span class="try">试学</span>
                                    <span class="have">已学</span>
                                    <span class="play" ms-click="changeVideo(el.courseLowPath);"></span>
                                </div>
                            </div>
                        </div>
                        <div ms-visible="catalogMsg" class="catalog_msg">暂无相关目录信息...</div>
                    </div>
                </div>
                <div name="comment" class="hide" ms-visible="changeOption == 'comment'">
                    @if(Auth::check())
                        <div ms-if="detailInfo.isBuy || detailInfo.isAuthor" class="contain_lessonDetail_bot_left_comment">
                            <textarea ms-duplex="commentContent"></textarea>
                            <span ms-on-mouseout="descriptionSwitch('replyWarning', false)" ms-click="publishComment(detailInfo.id,commentContent);">发布</span>
                            <div class="teacherHomepage_detail_content_applyTip" ms-visible="replyWarning">请输入评论内容</div>
                        </div>
                    @endif
                    <div class="clear" style="width: 100%;height: 20px;"></div>
                    <div class="first_not">
                        <div class="contain_lessonDetail_bot_left_comment_content" ms-repeat="commentInfo">
                            <div class="photo">
                                <img ms-attr-src="el.pic" width="85" height="85" alt=""/>
                            </div>
                            <div class="right">
                                <div class="top">
                                    <span ms-html="el.username"></span><span class="time" ms-html="el.timeAgo"></span>
                                </div>
                                <div class="center">
                                    <span class="touser" ms-html="'@' + el.tousername" ms-if="el.tousername"></span>
                                    <span ms-html="el.commentContent"></span></div>
                                <div class="bot">
                                    @if(Auth::check())
                                        <a href="#input_content" ms-if="(!el.isSelf && detailInfo.isBuy) || (!el.isSelf && detailInfo.isAuthor)" ms-click="replyComment(el.username,el.id);">
                                            <span class="first">回复</span>
                                        </a>
                                    @endif
                                    <span class="third" ms-if="el.isSelf" ms-click="deleteComment($index)">删除</span>
                                    <span class="second" ms-click="addLike(el);" ms-if="!el.isLike">点赞（[-- el.likeTotal || 0--] )</span>
                                    <span class="no_hover" ms-if="el.isLike" ms-click="addLike(el);">点赞（[-- el.likeTotal || 0--] )</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div ms-visible="commentMsg" class="comment_msg">暂无相关评论...</div>
                </div>
                <div name="dataDownload" class="hide" ms-visible="changeOption == 'dataDownload'">
                    <div class="contain_lessonDetail_bot_left_download">
                        <span class="top">资料</span>
                        <div class="contain_lessonDetail_bot_left_info">
                            <div style="width: 100%;height: 5px"></div>
                            <div class="contain_lessonDetail_bot_left_info_div">
                                <div class="data" ms-repeat="dataDownload">
                                    <span class="spot"></span><span class="data_download_content" ms-html="el.dataName" ms-click="popUpSwitch('dataDownload',detailInfo.isBuy,el.dataPath,el.dataName);"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div ms-visible="downloadMsg" class="download_msg">暂无相关资料...</div>
                </div>
            </div>
            <div class="contain_lessonDetail_bot_right">
                <!-- 名师介绍 -->
                <div class="contain_lessonDetail_bot_right_teacher" ms-controller="teacherInfoController">
                    <span class="teacher">讲师介绍</span>
                    <div class="photo">
                        <a ms-attr-href="'/' + teacherInfo.id"><img ms-attr-src="teacherInfo.pic" width="90" height="90" alt=""/></a>
                    </div>
                    <div class="desc">
                        <span class="name" ms-html="teacherInfo.realname"></span>
                        <span class="school" ms-html="teacherInfo.school"></span>
                    </div>
                    <div class="clear"></div>
                    <span class="content" ms-html="teacherInfo.intro"></span>
                </div>
                <!-- 课程公告 -->
                <div class="contain_lessonDetail_bot_right_notice">
                    <span class="notice_tip">课程公告</span>
                    <span class="notice" ms-html="detailInfo.courseNotice"></span>
                    <div ms-if="!detailInfo.courseNotice" class="notice_msg">暂无课程公告...</div>
                </div>
            </div>
        </div>
        <div class="clear" style="width: 100%;height: 80px;"></div>


        <!-- 遮罩层 -->
        <div class="shadow hide" ms-visible="popUp"></div>
        <!-- 购买课程弹出层 -->
        <div class="buy_course hide" ms-visible="'buyCourse' == popUp">
            <div class="buy_course_top">
                <span class="left">购买课程</span>
                <span class="right" ms-click="popUpSwitch(false)"></span>
            </div>
            <div class="buy_course_center">
                <div class="top" ms-html="'课程名称：' + detailInfo.courseTitle"></div>
                <div class="center">课程价格：<span ms-html="'￥ ' + detailInfo.coursePrice + ' 元'"></span></div>
                <div class="bot">
                    <div>支付方式：</div>
                    <div class="aliPay"><input type="radio" ms-duplex-string="payMethod" value="1" name="payMethod"/><span></span></div>
                    <div class="weChat"><input type="radio" ms-duplex-string="payMethod" value="2" name="payMethod"/><span></span></div>
                </div>
                <span class="warnPayMethod" ms-html="warnPayMethod"></span>
                <div class="clear"></div>
                <div class="pay_btn" ms-click="payRightNow()">立即支付</div>
            </div>
        </div>
        <!-- 支付成功弹出层 -->
        <div class="pay_success hide" ms-visible="'paySuccess' == popUp">
            <div class="pay_success_top">
                <span class="left">支付成功</span>
                <span class="right" ms-click="popUpSwitch(false)"></span>
            </div>
            <div class="pay_success_center">
                <div class="top"></div>
                <div class="center">支付成功 !</div>
                <div class="bot">您可以在个人中心查看订单详情</div>
                <div class="study_btn" ms-click="popUpSwitch('startStudy')">开始学习</div>
            </div>
        </div>
        <!-- 资料下载弹出层 -->
        <div class="data_download hide" ms-visible="'dataDownload' == popUp">
            <div class="data_download_top">
                <span class="left">资料下载</span>
                <span class="right" ms-click="popUpSwitch(false)"></span>
            </div>
            <div class="data_download_center">
                <div class="top">本资料暂无预览，如感兴趣可购买课程后下载。</div>
                <div class="buy_btn" ms-click="popUpSwitch('buyCourse')">立即购买</div>
            </div>
        </div>
        <!-- 反馈意见弹出层 -->
        <div class="feedback hide" ms-visible="'feedback' == popUp">
            <div class="feedback_top">
                <span class="left">意见反馈</span>
                <span class="right" ms-click="popUpSwitch(false)"></span>
            </div>
            <div class="feedback_center">
                <div class="top">
                    <div class="question"><span>1</span><span class="last">选择问题类型：</span><span style="color: red" ms-html="warnBackType"></span>
                    </div>
                    <div class="choose">
                        <input type="radio" ms-duplex-string="backType" value="内容无关"/><span>内容无关</span>
                        <input type="radio" ms-duplex-string="backType" value="播放不了"/><span>播放不了</span>
                        <input type="radio" ms-duplex-string="backType" value="其他问题"/><span>其他问题</span>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="center">
                    <div class="question"><span>2</span><span class="last">填写问题描述：</span><span style="color: red" ms-html="warnBackContent"></span>
                    </div>
                    <div class="content">
                        <textarea name="" ms-duplex="backContent" placeholder="详细描述一些你遇到的问题或建议"></textarea>
                    </div>
                </div>
                <div class="feedback_center_last">
                    <div class="question"><span>3</span><span class="last">留下联系方式：</span><span style="color: red" ms-html="warnTel"></span>
                    </div>
                    <div class="contact_way">
                        <input type="text" class="method" ms-duplex="tel" placeholder="QQ/Email/手机号"/>
                    </div>
                </div>
                <div class="clear"></div>
                <div class="feedback_btn" ms-click="publishFeedBack(detailInfo.id,'feedbackSuccess')">提交反馈</div>
            </div>
        </div>
        <!-- 反馈成功弹出层 -->
        <div class="feedback_success hide" ms-visible="'feedbackSuccess' == popUp">
            <div class="feedback_success_top">
                <span class="left">反馈成功</span>
                <span class="right" ms-click="popUpSwitch(false)"></span>
            </div>
            <div class="feedback_success_center">
                <div class="top"></div>
                <div class="center">感谢您的反馈 !</div>
                <div class="bot">我们会尽快为您解决问题</div>
                <div class="keep_feedback" ms-click="popUpSwitch('feedback')">继续反馈</div>
                <div class="close_feedback" ms-click="popUpSwitch(false)">关闭</div>
            </div>
        </div>
        <!-- 删除评论弹出层 -->
        <div class="delete_comment hide" ms-visible="'deleteComment' == popUp">
            <div class="top">
                <span>确认删除该评论？</span>
            </div>
            <div class="bot">
                <span class="quit" ms-click="popUpSwitch(false)">取消</span>
                <span class="sure" ms-click="popUpSwitch(false, 'delComment');">确定</span>
            </div>
        </div>
        <!-- 资料下载弹出层 -->
        <div class="delete_comment hide" ms-visible="'downloadData' == popUp">
            <div class="top">
                <span>确认下载该资源？</span>
            </div>
            <div class="bot">
                <span class="quit" ms-click="popUpSwitch(false)">取消</span>
                <span class="sure" ms-click="popUpSwitch('downloadData');">确定</span>
            </div>
        </div>
    </div>
@endsection

@section('js')
    <script type="text/javascript" src="{{asset('home/jplayer/jwplayer.js')}}"></script>
    <script>
        require(['/lessonSubject/detail', '/lessonSubject/teacherInfo', '/lessonSubject/catalogInfo'], function (detail, teacherInfo, catalogInfo) {
            detail.mineUsername = '{{$mineUsername}}' || null;
            detail.mineUserId = '{{$mineUserId}}' || null;
            detail.mineType = '{{$mineType}}' || null;
            detail.minePic = '{{$minePic}}' || null;
            detail.detailId = '{{$detailId}}' || null;
            // 获取详细信息
            detail.getDetail({{$detailId}});
            // 获取讲师信息
            teacherInfo.getTeacherInfo({{$detailId}});
            // 获取章节信息
            catalogInfo.getCatalogInfo({{$detailId}});

            detail.$watch('commentContent', function (value) {
                if (value.length < detail.commentContentLength) {
                    detail.commentContentLength = '';
                    detail.commentContent = '';
                    detail.tousername = '';
                    detail.parentId = '';
                }
            });
            avalon.scan();
        });
    </script>
@endsection