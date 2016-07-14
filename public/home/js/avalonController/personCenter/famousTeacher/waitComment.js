/**
 * Created by LT on 2016/7/12.
 */
define([], function () {
    var waitCommentController = avalon.define({
        $id: 'waitCommentController',
        realInfo: false,
        total: '',
        waitCommentList: [],
        getCommentInfo: function () {
            $.ajax({
                url: '/member/waitComment',
                type: 'POST',
                dataType: 'json',
                success: function (response) {
                    if (response.type) {
                        waitCommentController.realInfo = true;
                        waitCommentController.waitCommentList = response.data;
                        waitCommentController.total = response.total;
                    } else {
                        waitCommentController.realInfo = false;
                        waitCommentController.total = response.total;
                    }
                },
                error: function (error) {

                }
            });
        },
    })
    return {
        waitCommentController: waitCommentController
    }
})