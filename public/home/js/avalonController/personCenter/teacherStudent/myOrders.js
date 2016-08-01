/**
 * Created by LT on 2016/7/11.
 */
define([], function () {
    var myOrdersStudent = avalon.define({
        $id: 'myOrdersStudent',
        realInfo : false,
        total : '',
        isDelete: 0,
        myOrders: false,
        myOrdersList: [],
        getMyOrdersInfo: function () {
            $('#page_orders').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/myOrders/' + this.pageNumber + '/' + this.pageSize,
                        type: 'POST',
                        data:{},
                        dataType: 'json',
                        success: function (response) {
                            if (response.type) {
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                myOrdersStudent.myOrders = true;
                                myOrdersStudent.myOrdersList = [];
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'POST',
                        url: '/member/myOrders/' + pageNumber + '/' + pageSize,
                        success: function (response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 10,
                pageNumber: 1,
                totalNumber: 1,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        myOrdersStudent.myOrdersList = data;
                    }
                }
            })
        },
    })
    return {
        myOrdersStudent: myOrdersStudent
    }
})