/**
 * Created by Mr.H on 2016/6/28.
 */
// 选项卡切换底部线条和点亮效果
avalon.directive('changeoption', {
    update: function (value) {
        var element = this.element; var parent = element.parentElement; var status = avalon(element).attr('name');
        if (status == value) {avalon(element).addClass('light');avalon(parent).addClass('active');}
        if (status != value) {avalon(element).removeClass('light');avalon(parent).removeClass('active');}
    }
});

define([], function () {
    var detail = avalon.define({
        $id: 'lessonSubjectDetail',
        // 页面静态数据
        pageInfo: {'index': '/', 'course': '/lessonSubject/list/1', 'lessonSubject': '/lessonSubject/list/1', 'video': '/home/image/lessonSubject/detail/video.jpg'},
        //选项卡处理
        changeOption: 'course',
        changeSwitch: function (value) {
            detail.changeOption = value;
            if (value == 'comment') { detail.commentInfo.length == 0 ? detail.getCommentInfo(detail.detailId) : detail.commentInfo;}
            else if (value == 'dataDownload') {detail.dataDownload.length == 0 ? detail.getDataDownload(detail.detailId) : detail.dataDownload;}
        },
        getData: function (url, type, data, model, callback) {
            $.ajax({ url: url, type: type || 'GET', data: data || {}, dataType: 'json',
                success: function (response) {
                    if (model == 'result') {
                        callback(response.status)
                        return;
                    }
                    if (model == 'submitComment') {
                        callback(response.data)
                        return;
                    }
                    if (response.status) {detail[model] = response.data;} else {detail[model] = [];}
                    model == 'detailInfo' && detail.setVideo(function () {});
                }, error: function (error) {}
            })
        },
        // 获取详细数据
        detailInfo: [],
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
        tousername: '', parentId: '', commentContentLength: '',
        // 回复评论
        replyComment: function (tousername, id) {
            detail.tousername = tousername; detail.parentId = id; detail.commentContent = '@' + tousername + ':'; detail.commentContentLength = detail.commentContent.length;
        },
        // 发布评论
        commentContent: '',
        replyWarning: false,
        publishComment: function (id, content) {
            var data = {courseId: id, username: detail.mineUsername, commentContent: content};
            if (content == '' || content.match(/\s*/) == null || content.length <= detail.commentContentLength) { detail.replyWarning = true; return false; }
            if (detail.tousername && detail.parentId) {
                data.tousername = detail.tousername; data.parentId = detail.parentId; data.commentContent = data.commentContent.split(/@*:/); data.commentContent.shift(); data.commentContent = data.commentContent.join('');
            };
            detail.getData('/lessonSubject/publishComment', 'POST', data, 'submitComment', function (response) {
                detail.commentInfo.unshift({
                    commentContent: data.commentContent, timeAgo: '1秒前', username: detail.mineUsername, id: response, isLike: false, isSelf: true, likeTotal: 0, parentId: data.parentId || null, pic: detail.minePic, tousername: data.tousername || null, type: detail.mineType,
                });
                detail.commentContent = ''; detail.tousername = '';
            })
        },
        // 点赞
        addLike: function (el) {
            if (detail.mineUsername) {el.isLike || detail.getData('/lessonSubject/addLike', 'POST', {id: el.id}, 'result', function (response) {el.isLike = response;el.isLike && ++el.likeTotal;});} else {location.href = '/index/login';}
        },
        // 删除评论的Index
        deleteIndex: null,
        deleteComment: function (index) {detail.deleteIndex = index;detail.popUp = 'deleteComment'},
        // 发布评论开关
        descriptionSwitch: function (model, value) {detail[model] = value;},
        // 弹窗处理
        popUp: false,
        popUpSwitch: function (value, id, path, name) {
            if (id == 'delComment') {detail.getData('/lessonSubject/deleteComment', 'POST', {id: detail.commentInfo[detail.deleteIndex].id, fromUserId: detail.mineUsername}, 'result', function (response) {response && detail.commentInfo.removeAt(detail.deleteIndex);detail.deleteIndex = null;});}
            if (value == 'dataDownload') {if (id) {detail.popUp = 'downloadData';detail.path = path;} else {detail.popUp = false;}}
            if (value == 'downloadData') {detail.popUp = false;window.open(detail.path);}
            if (value == 'startStudy') {detail.popUp = false;return;}
            if (value == 'feedback') {if (detail.mineUsername) {detail.popUp = value;} else {location.href = '/index/login';return;}}
            detail.popUp = value;
        },
        // 发表反馈建议
        backType: '', backContent: '', tel: '', warnBackType: '', warnBackContent: '', warnTel: '',
        publishFeedBack: function (id, value) {
            if (detail.backType.length == '0') {detail.warnBackType = '请选择问题类型';return;} else {detail.warnBackType = '';}
            if (detail.backContent.match(/\s*/) == null || detail.backContent == '') {detail.warnBackContent = '请填写问题描述';return;} else {detail.warnBackContent = '';}
            if (detail.tel.match(/\s*/) == null || detail.tel == '') {detail.warnTel = '请留下联系方式';return;} else if (detail.tel.match(/^[1][358][0-9]{9}$/) == null && detail.tel.match(/[1-9][0-9]{5,10}/) == null && detail.tel.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/) == null) {detail.warnTel = '请正确联系方式';return;} else {detail.warnTel = '';}
            detail.getData('/lessonSubject/publishFeedBack', 'POST', {courseId: id, backType: detail.backType, username: detail.mineUsername,backContent: detail.backContent, tel: detail.tel}, 'result', function (response) {if (response) {detail.popUp = value;detail.backType = '';detail.backContent = '';detail.tel = '';} else {detail.popUp = 'feedback';}
            })
        },
        // 添加收藏
        addCollect: function (id, isCollection) {
            if (detail.mineUsername) {detail.getData('/lessonSubject/addCollect', 'POST', {courseId: id, userId: detail.mineUserId, isCollection: isCollection}, 'result', function (response) {detail.detailInfo.isCollection = response;})} else {location.href = '/index/login';}
        },
        // 立即支付 paySuccess
        payMethod:'',warnPayMethod: '',
        payRightNow: function(){
            if (detail.payMethod.length == '0') {detail.warnPayMethod = '请选择问题类型';return;} else {detail.warnPayMethod = '';}
            if(detail.payMethod == '1'){
                detail.popUp = 'paySuccess';
            }else{
                location.href = '/lessonSubject/WeChatPay';
            }

        },

        overtime: false,
        thePlayer: {},
        videoType: true,
        videoTime: {videoOne: 0, videoTow: 0},
        setVideo: function(callback) {
            var model = 'detailInfo';
            detail.thePlayer = jwplayer('mediaplayer').setup({
                flashplayer: 'jwplayer/jwplayer.flash.swf',
                playlist: [{
                    image: detail[model].coursePic,
                    sources: [{
                        label: "超清",
                        file: detail[model].courseHighPath,
                        height: 720,
                        width: 1280,
                        type: "mp4"
                    },{
                        default: true,
                        label: "高清",
                        file: detail[model].courseMediumPath,
                        height: 360,
                        width: 640,
                        type: "mp4"
                    },{
                        label: "标清",
                        file: detail[model].courseLowPath,
                        height: 180,
                        width: 320,
                        type: "mp4"
                    }]
                }],
                id: 'playerID',
                width: '800',
                height: '515',
                aspectratio: '16:9',
                type: "mp4"
            });
            typeof callback === 'function' && callback();
            detail.thePlayer.onTime(function(){
                if (detail.thePlayer.getPosition() >= 5) {
                    detail.thePlayer.play(false);
                    detail.thePlayer.remove();
                    detail.overtime = true;
                }
            });
        }
    });
    return detail;
});