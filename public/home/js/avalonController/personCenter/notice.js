/**
 * Created by Mr.H on 2016/7/10.
 */
define([], function () {
    var notice = avalon.define({
        $id: 'noticeController',
        noticeInfo: [],
        noticeMsg: false,
        isRead: true,
        getNoticeInfo: function (username) {
            $('#page_notice').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getNoticeInfo/' + this.pageNumber + '/' + this.pageSize,
                        type: 'POST',
                        dataType: 'json',
                        data: {username: username},
                        success: function (response) {
                            if (response.status) {
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.count;
                                done(format);
                            } else {
                                notice.noticeMsg = true;
                                notice.noticeInfo = [];
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        data: {username: username},
                        url: '/member/getNoticeInfo/' + pageNumber + '/' + pageSize,
                        success: function (response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 10,
                pageNumber: 1,
                totalNumber: 1,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        notice.noticeInfo = data;
                    }

                }
            })
        },
        changeNoticeStatus: function () {
            $.ajax({
                url: '/member/changeNoticeStatus/0',
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    if (response) {
                        notice.isRead = false;
                    }
                }
            })
        }
    })
    return {
        notice: notice
    }
})