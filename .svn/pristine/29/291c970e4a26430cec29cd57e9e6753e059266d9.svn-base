/**
 * Created by Mr.H on 2016/7/11.
 */
define([], function () {
    var commentCourse = avalon.define({
        $id: 'commentCourseController',
        commentCourseInfo: [],
        total: '',
        getCommentCourse: function (username,type) {
            $.ajax({
                url: '/member/getCommentCourse/' + type,
                type: 'POST',
                dataType: 'json',
                data : {username:username},
                success: function (response) {
                    if (response.status) {
                        commentCourse.commentCourseInfo = response.data;
                        commentCourse.total = response.total;
                    } else {
                        commentCourse.commentCourseInfo = [];
                        commentCourse.total = total;
                    }
                },
                error: function (error) {

                }
            })
        }
    })
    return {
        commentCourse: commentCourse
    }
})