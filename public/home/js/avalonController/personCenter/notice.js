/**
 * Created by Mr.H on 2016/7/10.
 */
define([], function () {
    var notice = avalon.define({
        $id: 'noticeController',
        noticeInfo: [],
        getNoticeInfo: function (username) {
            $('#page_notice').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getNoticeInfo',
                        type: 'POST',
                        dataType: 'json',
                        data : {username:username},
                        success: function (response) {
                            if (response.status) {
                                done(response.data);
                            }
                        },
                    });
                },
                pageSize: 10,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        notice.noticeInfo = data;
                    }

                }
            })
        }
    })
    return {
        notice: notice
    }
})