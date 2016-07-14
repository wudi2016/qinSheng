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
            $.ajax({
                url: '/member/myFriends',
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    if (response.type) {
                        myFansTeacher.realInfo = true;
                        myFansTeacher.myFansList = response.data;
                        myFansTeacher.total = response.total;
                    } else {
                        myFansTeacher.realInfo = false;
                        myFansTeacher.total = response.total;
                    }
                },
                error: function (error) {

                }
            });
        },
    })
    return {
        myFansTeacher: myFansTeacher
    }
})