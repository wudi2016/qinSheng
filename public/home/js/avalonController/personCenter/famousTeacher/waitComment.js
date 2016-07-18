/**
 * Created by LT on 2016/7/12.
 */
define([], function () {
    var waitCommentController = avalon.define({
        $id: 'waitCommentController',
        realInfo: false,
        total: '',
        waitComment:false,
        waitCommentList: [],
        getCommentInfo: function () {
            $('#page_waitComment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/waitComment',
                        type: 'POST',
                        dataType: 'json',
                        success: function (response) {
                            waitCommentController.total = response.total;
                            if (response.type) {
                                waitCommentController.realInfo = true;
                                done(response.data);
                            }else{
                                waitCommentController.waitComment = true;
                                waitCommentController.waitCommentList = [];
                            }
                        },
                    });
                },
                pageSize: 2,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        waitCommentController.waitCommentList = data;
                    }

                }
            })
        },
    })
    return {
        waitCommentController: waitCommentController
    }
})