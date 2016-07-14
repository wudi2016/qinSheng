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
            $.ajax({
                url: '/member/completeComment',
                type: 'POST',
                data:{type:type},
                dataType: 'json',
                success: function (response) {
                    if (response.type) {
                        completeCommentController.realInfo = true;
                        completeCommentController.completeCommentList = response.data;
                        completeCommentController.total = response.total;
                    } else {
                        completeCommentController.realInfo = false;
                        completeCommentController.total = response.total;
                    }
                },
                error: function (error) {

                }
            });
        },
    })
    return {
        completeCommentController: completeCommentController
    }
})