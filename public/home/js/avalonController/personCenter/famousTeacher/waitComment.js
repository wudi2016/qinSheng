/**
 * Created by LT on 2016/7/12.
 */
define([], function () {
    var waitCommentController = avalon.define({
        $id: 'waitCommentController',
        realInfo: false,
        total: '',
        waitComment:false,
        display:true,
        waitCommentList: [],
        getCommentInfo: function () {
            $('#page_waitComment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/waitComment/'+ this.pageNumber + '/' + this.pageSize,
                        type: 'POST',
                        dataType: 'json',
                        success: function (response) {
                            waitCommentController.total = response.total;
                            if (response.type) {
                                if(response.total <= 6 ){
                                    waitCommentController.display = false;
                                }
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                waitCommentController.waitComment = true;
                                waitCommentController.waitCommentList = [];
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'GET',
                        url: '/member/waitComment/' + pageNumber + '/' + pageSize,
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