/**
 * Created by Mr.H on 2016/6/28.
 */
// 选项卡切换底部线条和点亮效果
avalon.directive('changeoption', {
    update: function (value) {
        var element = this.element;
        var parent = element.parentElement;
        var status = avalon(element).attr('name');
        if (status == value) {
            avalon(element).addClass('light');
            avalon(parent).addClass('active');
        }
        if (status != value) {
            avalon(element).removeClass('light');
            avalon(parent).removeClass('active');
        }
    }
});

define([], function () {
    var detail = avalon.define({
        $id: 'lessonSubjectDetail',
        // 页面静态数据
        pageInfo: {
            'index': '/',
            'course': '/lessonSubject/list/1',
            'lessonSubject': '/lessonSubject/list/1'
        },
        mineUsername: '',mineUserId: '',mineType: '',minePic: '',detailId: '',
        //选项卡处理
        changeOption: 'course',
        changeSwitch: function (value) {
            detail.changeOption = value;
            if (value == 'comment') {
                detail.commentInfo.length === 0 ? detail.getCommentInfo(detail.detailId) : detail.commentInfo;
            }
            else if (value == 'dataDownload') {
                detail.dataDownload.length === 0 ? detail.getDataDownload(detail.detailId) : detail.dataDownload;
            }
        },
        haveCourse : true,
        catalogInfo: [],
        downloadMsg: false, commentMsg: false, catalogMsg : false,
        getData: function (url, type, data, model, callback) {
            $.ajax({
                url: url, type: type || 'GET', data: data || {}, dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        detail[model] = response.data;
                        if(model == 'playList'){
                            detail.playListLength = response.total;
                        }
                    } else {
                        if (model == 'commentInfo') detail.commentMsg = true;
                        if (model == 'dataDownload') detail.downloadMsg = true;
                        if (model == 'catalogInfo') detail.catalogMsg = true;
                        if (model == 'detailInfo') detail.haveCourse = true;
                    }
                    if (model == 'result') {
                        callback(response.status);
                        return;
                    }
                    if (model == 'submitComment') {
                        callback(response.data);
                        return;
                    }
                    if (model == 'orderInfo') {
                        response.status && callback(response);
                        return;
                    }
                    if(model == 'addCompleteCount'){
                        return;
                    }
                    model == 'detailInfo' && detail.setVideo(function () {});
                }, error: function (error) {
                }
            })
        },
        // 获取详细数据
        detailInfo: {
            courseTitle : '',
            coursePrice : '',
            classHour : '',
            coursePlayView : '',
            isFree: false,
            isTeacher : false,
            isBuy: false,
            isTryLearn: true,
            isCollection: false
        },
        getDetail: function (id) {
            detail.getData('/lessonSubject/getDetail/' + id, '', {}, 'detailInfo');
        },
        // 获取下载信息
        dataDownload: [],
        getDataDownload: function (id) {
            detail.getData('/lessonSubject/getDataDownload/' + id, '', {}, 'dataDownload');
        },
        // 获取评论信息、评论操作
        commentInfo: [],
        getCommentInfo: function (id) {
            detail.getData('/lessonSubject/getCommentInfo/' + id, '', {}, 'commentInfo');
        },
        tousername: '', parentId: '', commentContentLength: '', commentContent: '',
        // 回复评论
        replyComment: function (tousername, id) {
            if (tousername) {
                detail.tousername = '';
                detail.parentId = '';
                detail.commentContent = '';
                detail.commentContentLength = '';
            }
            detail.tousername = tousername;
            detail.parentId = id;
            detail.commentContent = '@' + tousername + ':';
            detail.commentContentLength = detail.commentContent.length;
        },
        // 发布评论
        replyWarning: false,
        publishComment: function (id, content) {
            var data = {courseId: id, username: detail.mineUsername, commentContent: content};
            if (content == '' || content.match(/\s*/) == null || content.length <= detail.commentContentLength) {
                detail.replyWarning = true;
                return false;
            }
            if (detail.tousername && detail.parentId) {
                data.tousername = detail.tousername;
                data.parentId = detail.parentId;
                data.commentContent = data.commentContent.split(/@*:/);
                data.commentContent.shift();
                data.commentContent = data.commentContent.join('');
            }
            detail.getData('/lessonSubject/publishComment', 'POST', data, 'submitComment', function (response) {
                detail.commentInfo.unshift({
                    commentContent: data.commentContent,
                    timeAgo: '1秒前',
                    username: detail.mineUsername,
                    id: response,
                    isLike: false,
                    isSelf: true,
                    likeTotal: 0,
                    parentId: data.parentId || null,
                    pic: detail.minePic,
                    tousername: data.tousername || null,
                    type: detail.mineType,
                });
                detail.commentInfo.length == 0 ? detail.commentMsg = true : detail.commentMsg = false;
                detail.commentContent = '';
                detail.tousername = '';
            })
        },
        // 点赞
        addLike: function (el) {
            if (detail.mineUsername && detail.mineType != 3) {
                el.isLike || detail.getData('/lessonSubject/addLike', 'POST', {id: el.id}, 'result', function (response) {
                    el.isLike = response;
                    el.isLike && ++el.likeTotal;
                });
            } else {
                location.href = '/index/login';
            }
        },
        // 删除评论的Index
        deleteIndex: null,
        deleteComment: function (index) {
            detail.deleteIndex = index;
            detail.popUp = 'deleteComment';
        },
        // 发布评论开关
        descriptionSwitch: function (model, value) {
            detail[model] = value;
        },
        // 弹窗处理
        popUp: false,path : '', dataName : '',
        popUpSwitch: function (value, id, path, name, isTeacher) {
            if (id == 'delComment') {
                detail.getData('/lessonSubject/deleteComment', 'POST', {
                    id: detail.commentInfo[detail.deleteIndex].id,
                    fromUserId: detail.mineUsername
                }, 'result', function (response) {
                    response && detail.commentInfo.removeAt(detail.deleteIndex);
                    detail.deleteIndex = null;
                    detail.commentInfo.length == 0 ? detail.commentMsg = true : detail.commentMsg = false;
                });
            }
            if (value == 'dataDownload') {
                if (id || isTeacher) {
                    detail.popUp = 'downloadData';
                    detail.path = path;
                    detail.dataName = name;
                    return;
                } else {
                    detail.popUp = false;
                }
            }
            if (value == 'startStudy') {
                detail.popUp = false;
                return;
            }
            if (value == 'buyCourse') {
                if (detail.mineUsername && detail.mineType != 3) {
                    detail.popUp = value;
                } else {
                    location.href = '/index/login';
                    return;
                }
            }
            if(id == 'quitCollect'){
                if (detail.mineUsername && detail.mineType != 3) {
                    detail.getData('/lessonSubject/addCollect', 'POST', {
                        courseId: path,
                        userId: detail.mineUserId,
                        isCollection: name
                    }, 'result', function (response) {
                        detail.detailInfo.isCollection = response;
                    })
                } else {
                    location.href = '/index/login';
                }
            }
            detail.popUp = value;
        },
        // 发表反馈建议
        backType: '', backContent: '', tel: '', warnBackType: '', warnBackContent: '', warnTel: '',backContentLength : '0',
        publishFeedBack: function (id, value) {
            if (detail.backType.length == '0') {
                detail.warnBackType = '请选择问题类型';
                return;
            } else {
                detail.warnBackType = '';
            }
            if (detail.backContent.match(/\s*/) == null || detail.backContent == '') {
                detail.warnBackContent = '请填写问题描述';
                return;
            } else {
                detail.warnBackContent = '';
            }
            if (detail.tel.match(/\s*/) == null || detail.tel == '') {
                detail.warnTel = '请留下联系方式';
                return;
            } else if ((detail.tel.match(/^1(3|5|8|7){1}[0-9]{9}$/) == null) && (detail.tel.match(/^[1-9]{1}[0-9]{5,10}$/) == null) && (detail.tel.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/) == null)) {
                detail.warnTel = '请填写正确联系方式';
                return;
            } else {
                detail.warnTel = '';
            }
            detail.getData('/lessonSubject/publishFeedBack', 'POST', {
                courseId: id,
                backType: detail.backType,
                username: detail.mineUsername,
                backContent: detail.backContent,
                tel: detail.tel
            }, 'result', function (response) {
                if (response) {
                    detail.popUp = value;
                    detail.backType = '';
                    detail.backContent = '';
                    detail.tel = '';
                } else {
                    detail.popUp = 'feedback';
                }
            })
        },
        // 添加收藏
        addCollect: function (id, isCollection) {
            if (detail.mineUsername && detail.mineType != 3) {
                detail.getData('/lessonSubject/addCollect', 'POST', {
                    courseId: id,
                    userId: detail.mineUserId,
                    isCollection: isCollection
                }, 'result', function (response) {
                    detail.detailInfo.isCollection = response;
                })
            } else {
                location.href = '/index/login';
            }
        },
        // 立即支付 paySuccess
        payMethod: '', warnPayMethod: '',
        payRightNow: function () {
            if (detail.payMethod.length == '0') {
                detail.warnPayMethod = '请选择支付方式';
                return;
            } else {
                detail.warnPayMethod = '';
            }
            var data = {
                payType: detail.payMethod,
                userName: detail.mineUsername,
                userId: detail.mineUserId,
                orderType: 0,
                orderPrice: detail.detailInfo.coursePrice*100,
                orderTitle: detail.detailInfo.courseTitle,
                courseId: detail.detailId
            };
            detail.getData('/lessonSubject/addOrder', 'POST', data, 'orderInfo', function (response) {
                if (detail.payMethod) {
                    location.href = '/lessonSubject/WeChatPay/' + response.data;
                } else {
                    location.href = '/lessonSubject/alipay/'+ response.data +'/lessonSubject&buySuccess&'+ response.data;
                }
            });

        },
        overtime: false,
        noresourse : false,
        tryLearnOver: false,
        thePlayer: {},
        videoType: true,
        playFlag:1,
        setVideo: function (callback) {
            var model = detail.videoType ? 'detailInfo' : 'videoPath';
            var list = [];
            detail[model].courseHighPath && list.push({
                label: "超清",
                file: detail[model].courseHighPath,
                height: 720,
                width: 1280,
                type: "mp4"
            });
            detail[model].courseMediumPath && list.push({
                //default: true,
                label: "高清",
                file: detail[model].courseMediumPath,
                height: 360,
                width: 640,
                type: "mp4"
            });
            detail[model].courseLowPath && list.push({
                label: "标清",
                file: detail[model].courseLowPath,
                height: 180,
                width: 320,
                type: "mp4"
            });
            detail.thePlayer = jwplayer('mediaplayer').setup({
                //flashplayer: 'jwplayer/jwplayer.flash.swf',
                playlist: [{
                    image: detail[model].coursePic,
                    sources: list
                }],
                id: 'playerID',
                width: '800',
                height: '450',
                aspectratio: '16:9',
                type: "mp4"
            });
            typeof callback === 'function' && callback();
            if(detail.detailInfo.isTryLearn || detail.detailInfo.isTeacher || detail.detailInfo.isBuy || detail.detailInfo.isFree){ // 是名师或者已购买
                if(!detail[model].courseHighPath && !detail[model].courseMediumPath && !detail[model].courseLowPath){ // 视频都不可观看
                    detail.thePlayer.remove();
                    detail.noresourse = true;
                }
            }else{
                detail.thePlayer.remove();
                detail.overtime = true;
            }
            detail.thePlayer.onPlaylistComplete(function(){

                detail.getData('/lessonSubject/addCompleteCount', 'POST', {id: detail.detailId}, 'addCompleteCount');
                if(detail.playFlag < detail.playListLength){
                    detail.videoType = false;
                    detail.videoPath = {
                        courseHighPath: detail.playList[detail.playFlag].courseHighPath,
                        courseMediumPath: detail.playList[detail.playFlag].courseMediumPath,
                        courseLowPath: detail.playList[detail.playFlag].courseLowPath
                    };
                    detail.setVideo(function () {
                        detail.noresourse = false;
                        detail.thePlayer.play(true);
                    });
                    detail.getData('/lessonSubject/addCourseView', 'POST', {
                        chapterId: detail.playList[detail.playFlag].id,
                        userId: detail.mineUserId,
                        courseId: detail.detailId
                    }, 'addCourseView');
                    detail.playFlag = detail.playFlag + 1;
                }
                if(detail.detailInfo.isTryLearn && !detail.detailInfo.isBuy && !detail.detailInfo.isFree && !detail.detailInfo.isTeacher){
                    detail.thePlayer.remove();
                    detail.tryLearnOver = true;
                }
            });
        },
        videoPath: [],
        changeVideo: function (el,isFree,isBuy,isTeacher) {
            if(isTeacher || isBuy || isFree){
                detail.videoType = false;
                detail.overtime = false;
                detail.videoPath = {
                    coursePic : el.coursePic,
                    courseHighPath: el.courseHighPath,
                    courseMediumPath: el.courseMediumPath,
                    courseLowPath: el.courseLowPath
                };
                detail.setVideo(function () {
                    detail.noresourse = false;
                    detail.thePlayer.play(true);

                });
                if (detail.mineUserId != null && detail.mineType != 3) {
                    detail.getData('/lessonSubject/addCourseView', 'POST', {
                        chapterId: el.id,
                        userId: detail.mineUserId,
                        courseId: detail.detailId
                    }, 'addCourseView');
                }
            }else{
                if(el.isTryLearn == 1){
                    detail.videoType = false;
                    detail.overtime = false;
                    detail.tryLearnOver = false;
                    detail.videoPath = {
                        coursePic : el.coursePic,
                        courseHighPath: el.courseHighPath,
                        courseMediumPath: el.courseMediumPath,
                        courseLowPath: el.courseLowPath
                    };
                    detail.setVideo(function () {
                        detail.noresourse = false;
                        detail.thePlayer.play(true);
                    });

                    if (detail.mineUserId != null && detail.mineType != 3) {
                        detail.getData('/lessonSubject/addCourseView', 'POST', {
                            chapterId: el.id,
                            userId: detail.mineUserId,
                            courseId: detail.detailId
                        }, 'addCourseView');
                    }
                }else{
                    if(detail.mineUserId && detail.mineType != 3){
                        detail.popUp = 'buyCourse';
                    }else{
                        location.href = '/index/login';
                    }
                }
            }
        },
        tryLearn : function(chapterId){
            detail.thePlayer.play(true);
            if (detail.mineUserId != null && detail.mineType != 3) {
                detail.getData('/lessonSubject/addCourseView', 'POST', {
                    chapterId: chapterId,
                    userId: detail.mineUserId,
                    courseId: detail.detailId
                }, 'addCourseView');
            }
        },
        playList: [],
        playListLength : '',
        getPlayList : function(){
            detail.getData('/lessonSubject/getPlayList', 'POST', {courseId : detail.detailId}, 'playList');
        }
    });
    return detail;
});