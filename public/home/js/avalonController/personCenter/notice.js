/**
 * Created by Mr.H on 2016/7/10.
 */
define([], function () {
    var notice = avalon.define({
        $id: 'noticeController',
        noticeInfo: [],
        getNoticeInfo: function (username) {
            $.ajax({
                url: '/member/getNoticeInfo',
                type: 'POST',
                dataType: 'json',
                data: {username: username},
                success: function (response) {
                    if (response.status) {
                        notice.noticeInfo = response.data;
                    } else {
                        notice.noticeInfo = [];
                    }
                },
                error: function (error) {

                }
            })
        },
        //deleteNotice: function () {
        //    $.ajax({
        //        url : '/member/deleteNotice',
        //        type : 'POST',
        //        dataType : 'json',
        //        data : {id : notice.noticeInfo[notice.noticeIndex].id},
        //        success: function(response){
        //            if(response.status){
        //                notice.noticeInfo.removeAt(notice.noticeIndex);
        //                //sideBar.popUp = false;
        //            }
        //        }
        //    })
        //}
    })
    return {
        notice: notice
    }
})