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
            $('#page_focus').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/myFocus',
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            if (response.type) {
                                done(response.data);
                                myFocusTeacher.total = response.total;
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
                        myFocusTeacher.myFocusList = data;
                    }
                }
            })
        },
    })
    return {
        myFocusTeacher: myFocusTeacher
    }
})