/**
 * Created by Mr.H on 2016/7/11.
 */
define([], function () {
    var commentCourse = avalon.define({
        $id: 'commentCourseController',
        commentCourseInfo: [],
        total: '',
        commentMsg : false,
        getCommentCourse: function (userId,type) {
            $('#page_course_comment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCommentCourse/' + this.pageNumber + '/' + this.pageSize,
                        type: 'POST',
                        dataType: 'json',
                        data : {userId:userId},
                        success: function (response) {
                            commentCourse.total = response.total;
                            if (response.status) {
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                commentCourse.commentMsg = true;
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'POST',
                        dataType: 'json',
                        data : {userId:userId},
                        url: '/member/getCommentCourse/' + pageNumber + '/' + pageSize,
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
                        commentCourse.commentCourseInfo = data;
                    }

                }
            })
        }
    })
    return {
        commentCourse: commentCourse
    }
})