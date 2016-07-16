/**
 * Created by LT on 2016/7/13.
 */
define([], function () {
    var completeCommentController = avalon.define({
        $id: 'completeCommentController',
        realInfo: false,
        total: '',
        type:'',
        completeCommentList: [],
        getCompleteCommentInfo: function (type) {
            $('#page_sureComment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/completeComment',
                        type: 'POST',
                        data:{type:type},
                        dataType: 'json',
                        success: function (response) {
                            completeCommentController.total = response.total;
                            if (response.type) {
                                done(response.data);
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
                        completeCommentController.completeCommentList = data;
                    }

                }
            })
        },
    })
    return {
        completeCommentController: completeCommentController
    }
})