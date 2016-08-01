/**
 * Created by LT on 2016/7/13.
 */
define([], function () {
    var completeCommentController = avalon.define({
        $id: 'completeCommentController',
        realInfo: false,
        total: '',
        sureComment:false,
        type:'',
        completeCommentList: [],
        getCompleteCommentInfo: function (type) {
            $('#page_sureComment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/completeComment/'+ this.pageNumber + '/' + this.pageSize,
                        type: 'POST',
                        data:{type:type},
                        dataType: 'json',
                        success: function (response) {
                            completeCommentController.total = response.total;
                            if (response.type) {
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                completeCommentController.sureComment = true;
                                completeCommentController.completeCommentList = [];
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'POST',
                        url: '/member/completeComment/' + pageNumber + '/' + pageSize,
                        success: function (response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 6,
                pageNumber: 1,
                totalNumber: 1,
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