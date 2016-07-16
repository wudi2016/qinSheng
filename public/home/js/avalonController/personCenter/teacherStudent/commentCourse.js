/**
 * Created by Mr.H on 2016/7/11.
 */
define([], function () {
    var commentCourse = avalon.define({
        $id: 'commentCourseController',
        commentCourseInfo: [],
        total: '',
        commentMsg : false,
        getCommentCourse: function (username,type) {
            $('#page_course_comment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCommentCourse/' + type,
                        type: 'POST',
                        dataType: 'json',
                        data : {username:username},
                        success: function (response) {
                            commentCourse.total = response.total;
                            if (response.status) {
                                done(response.data);
                            }else{
                                commentCourse.commentMsg = true;
                            }
                        },
                    });
                },
                pageSize: 6,
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