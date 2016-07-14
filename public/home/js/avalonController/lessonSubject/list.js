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
            $(this).stop().animate({height: h2, width: w2, left: "-20px", top: "-20px"}, 1);
        }, function () {
            $(this).stop().animate({height: h1, width: w1, left: "0px", top: "0px"}, 1);
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
        videoNum: 0,
        getData: function (url, model, data, method) {
            if (model == 'subjectInfo' || model == 'commentInfo') list.loading = true;
            $.ajax({
                type: method || 'GET',
                url: url,
                data: data || {},
                dataType: "json",
                success: function (response) {
                    if (response.status) {
                        list[model] = response.data;
                    }
                    if (model == 'subjectCount' || model == 'commentCount') {
                        list.videoNum += response.data || 0;
                        list[model] = Math.ceil(list[model] / 8);
                        for (var i = 1; i <= list[model]; i++) {
                            list[model + 'Number'].push(i);
                        }
                    }
                    if (model == 'subjectInfo' || model == 'commentInfo') list.loading = false;
                },
                error: function (error) {
                    if (model == 'subjectInfo' || model == 'commentInfo') list.loading = false;
                }
            });
        },
        imgBig: '',
        onLight: '',
        changeOption: (location.href.split('/').pop() == '1') ? 'subject' : 'comment',
        changeSwitch: function (value) {
            list.changeOption = value;
        },
        param: '1',
        sort: function (type, changeOption) {
            var route = '';
            list.param = type;
            if (type == '1') { // 默认排序
                changeOption == 'subject' ? route = '/lessonSubject/getList/' : route = '/lessonSubject/getCommentList/';
                list.getData(route + type, changeOption + 'Info', {page: list.page[changeOption]}, 'POST');
                $('.contain_lesson_center_tip_right span:nth-child(1)').addClass('default').siblings().removeClass('default');
            } else if (type == '2') { // 最新排序
                changeOption == 'subject' ? route = '/lessonSubject/getList/' : route = '/lessonSubject/getCommentList/';
                list.getData(route + type, changeOption + 'Info', {page: list.page[changeOption]}, 'POST');
                $('.contain_lesson_center_tip_right span:nth-child(3)').addClass('default').siblings().removeClass('default');
            } else if (type == '3') { // 热门排序
                changeOption == 'subject' ? route = '/lessonSubject/getList/' : route = '/lessonSubject/getCommentList/';
                list.getData(route + type, changeOption + 'Info', {page: list.page[changeOption]}, 'POST');
                $('.contain_lesson_center_tip_right span:nth-child(5)').addClass('default').siblings().removeClass('default');
            }
        },
        loading: false,
        // 分页
        page: {subject: 1, comment: 1},
        subjectCount: 0,
        subjectCountNumber: [],
        commentCount: 0,
        commentCountNumber: [],
        jump: null,
        jumping: function (model) {
            if (list.jump != list.page[model] && list.jump <= list[model + 'Count'] && list.jump != null && typeof list.jump === 'number' && list.jump != 0) {
                list.page[model] = list.jump;
                list.getData('/lessonSubject/getList/' + list.param, model + 'Info', {page: list.page[model]}, 'POST');
            }
            ;
            list.jump = null;
        },
        skip: function (model, direction) {
            if (typeof direction === 'boolean') {
                direction ? ++list.page[model] : --list.page[model];
            }
            if (typeof direction === 'number') {
                if (list.page[model] == direction) return false;
                list.page[model] = direction;
            }
            list.getData('/lessonSubject/getList/' + list.param, model + 'Info', {page: list.page[model]}, 'POST');
        },
    });

    return list;
});