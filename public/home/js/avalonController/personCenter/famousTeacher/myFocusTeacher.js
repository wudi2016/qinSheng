/**
 * Created by LT on 2016/7/8.
 */
define([], function () {
    var myFocusTeacher = avalon.define({
        $id: 'myFocusTeacher',
        realInfo: false,
        total: '',
        myFocusList: [],
        getMyFocusInfo: function () {
            $.ajax({
                url: '/member/myFocus',
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    if (response.type) {
                        myFocusTeacher.realInfo = true;
                        myFocusTeacher.myFocusList = response.data;
                        myFocusTeacher.total = response.total;
                    } else {
                        myFocusTeacher.realInfo = false;
                        myFocusTeacher.total = response.total;
                    }
                },
                error: function (error) {

                }
            });
        },
    })
    return {
        myFocusTeacher: myFocusTeacher
    }
})