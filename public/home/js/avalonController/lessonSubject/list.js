/**
 * Created by Mr.H on 2016/6/27.
 */
avalon.directive('imgbig', {
    update: function (value) {
        var element = this.element;
        var w1 = element.width;
        var h1 = element.height;
        var w2 = w1 + 40;
        var h2 = h1 + 40;
        $('.img_big').hover(function () {
            $(this).stop().animate({height: h2, width: w2, left: "-20px", top: "-20px"}, 'fast');
        }, function () {
            $(this).stop().animate({height: h1, width: w1, left: "0px", top: "0px"}, 'fast');
        })
    }
});
avalon.directive('onlight', {
    update: function () {
        if (location.href.split('/').pop() == '2') {
            $("span[name='comment']").addClass('change_active');
            $("span[name='special']").removeClass('change_active')
        }
        $(".contain_lesson_center_tip_left span").click(function () {
            $(this).addClass('change_active').siblings().removeClass('change_active');
        })
    }
});

define([], function () {
    var list = avalon.define({

        $id: 'lessonSubjectList',
        detail: '/lessonSubject/detail/',
        commentDetail: '/lessonComment/detail/',
        // 专题课程
        subjectInfo: [],
        // 点评课程
        commentInfo: [],
        subjectDisplay: true,
        commentDisplay: true,
        getSubjectInfo: function (type) {
            $('#page_subject').pagination({
                dataSource: function (done) {
                    $.ajax({
                        type: 'GET',
                        url: '/lessonSubject/getList/' + type + '/' + this.pageNumber + '/' + this.pageSize,
                        dataType: "json",
                        success: function (response) {
                            if (response.status) {
                                if(response.count < 16){
                                    list.subjectDisplay = false;
                                }
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.count;
                                done(format);
                            }
                        }
                    });
                },
                getData: function(pageNumber,pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'GET',
                        url: '/lessonSubject/getList/' + type + '/' + pageNumber + '/' + pageSize,
                        success: function(response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 16,
                pageNumber :1,
                totalNumber :1,
                className:"paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function(data) {
                    if (data) {
                        list.subjectInfo = data;
                    }
                }
            })
        },
        getCommentInfo: function (type) {
            $('#page_comment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        type: 'GET',
                        url: '/lessonSubject/getCommentList/' + type + '/' + this.pageNumber + '/' + this.pageSize,
                        dataType: "json",
                        success: function (response) {
                            if (response.status) {
                                if(response.count < 16){
                                    list.commentDisplay = false;
                                }
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.count;
                                done(format);
                            }
                        }
                    });
                },
                getData: function(pageNumber,pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'GET',
                        url: '/lessonSubject/getCommentList/' + type + '/' + pageNumber + '/' + pageSize,
                        success: function(response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 16,
                pageNumber :1,
                totalNumber :1,
                className:"paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function(data) {
                    if(data){
                        list.commentInfo = data;
                    }
                }
            })
        },
        imgBig: '',
        onLight: '',
        changeOption: (location.href.split('/').pop() == '1') ? 'subject' : 'comment',
        changeSwitch: function (value) {
            if(value == 'comment'){
                location.href = '/lessonSubject/list/2';
            }else{
                location.href = '/lessonSubject/list/1';
            }
        },
        sort: function (type, changeOption) {
            if(changeOption == 'subject'){
                list.getSubjectInfo(type);
                if (type == '1') { // 默认排序
                    $('.contain_lesson_center_tip_right span:nth-child(1)').addClass('default').siblings().removeClass('default');
                } else if (type == '2') { // 最新排序
                    $('.contain_lesson_center_tip_right span:nth-child(3)').addClass('default').siblings().removeClass('default');
                } else if (type == '3') { // 热门排序
                    $('.contain_lesson_center_tip_right span:nth-child(5)').addClass('default').siblings().removeClass('default');
                }
            }else{
                list.getCommentInfo(type);
                if (type == '1') { // 默认排序
                    $('.contain_lesson_center_tip_right_comment span:nth-child(1)').addClass('default').siblings().removeClass('default');
                } else if (type == '2') { // 最新排序
                    $('.contain_lesson_center_tip_right_comment span:nth-child(3)').addClass('default').siblings().removeClass('default');
                } else if (type == '3') { // 热门排序
                    $('.contain_lesson_center_tip_right_comment span:nth-child(5)').addClass('default').siblings().removeClass('default');
                }
            }

        }
    });
    return list;
});