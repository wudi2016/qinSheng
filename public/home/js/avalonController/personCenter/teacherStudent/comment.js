/**
 * Created by Mr.H on 2016/7/10.
 */
define([], function () {
    var comment = avalon.define({
        $id: 'commentController',
        commentInfo: [],
        getCommentInfo: function (username) {
            $.ajax({
                url: '/member/getCommentInfo',
                type: 'POST',
                dataType: 'json',
                data : {username:username},
                success: function (response) {
                    if (response.status) {
                        comment.commentInfo = response.data;
                    } else {
                        comment.commentInfo = [];
                    }
                },
                error: function (error) {

                }
            })
        }
    })
    return {
        comment: comment
    }
})