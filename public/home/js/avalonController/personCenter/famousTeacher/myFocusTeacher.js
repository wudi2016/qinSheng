/**
 * Created by LT on 2016/7/8.
 */
define([], function () {
    var myFocusTeacher = avalon.define({
        $id: 'myFocusTeacher',
        realInfo: false,
        total: '',
        myFocus : false,
        myFocusList: [],
        getMyFocusInfo: function () {
            $('#page_focus').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/myFocus/'+ this.pageNumber + '/' + this.pageSize,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            myFocusTeacher.total = response.total;
                            if (response.type) {
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                myFocusTeacher.total =0;
                                myFocusTeacher.myFocus = true;
                                myFocusTeacher.myFocusList = [];
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'GET',
                        url: '/member/myFocus/' + pageNumber + '/' + pageSize,
                        success: function (response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 24,
                pageNumber: 1,
                totalNumber: 1,
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