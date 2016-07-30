/**
 * Created by Mr.H on 2016/7/10.
 */
define([], function () {
    var comment = avalon.define({
        $id: 'commentController',
        commentInfo: [],
        answerMsg : false,
        isRead : true,
        getCommentInfo: function (username) {
            $('#page_comment').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCommentInfo',
                        type: 'POST',
                        dataType: 'json',
                        data : {username:username},
                        success: function (response) {
                            if (response.status) {
                                done(response.data);
                            }else{
                                comment.commentInfo = [];
                                comment.answerMsg = true;
                            }
                        },
                    });
                },
                pageSize: 10,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        comment.commentInfo = data;
                    }

                }
            })
        },
        changeNoticeStatus: function(){
            $.ajax({
                url: '/member/changeNoticeStatus/1',
                type : 'GET',
                dataType : 'json',
                success : function(response){
                    if(response){
                        comment.isRead = false;
                    }
                }
            })
        }
    })
    return {
        comment: comment
    }
})