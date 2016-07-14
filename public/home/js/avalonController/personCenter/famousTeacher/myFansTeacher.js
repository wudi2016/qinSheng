/**
 * Created by LT on 2016/7/8.
 */
define([], function () {
    var myFansTeacher = avalon.define({
        $id: 'myFansTeacher',
        realInfo: false,
        total: '',
        myFansList: [],
        getMyFansInfo: function () {
            $('#page_friend').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/myFriends',
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            if (response.type) {
                                done(response.data);
                                myFansTeacher.total = response.total;
                            }
                        },
                    });
                },
                pageSize: 24,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        myFansTeacher.myFansList = data;
                    }
                }
            })
        },
    })
    return {
        myFansTeacher: myFansTeacher
    }
})