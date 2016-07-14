/**
 * Created by LT on 2016/7/11.
 */
define([], function () {
    var myOrdersStudent = avalon.define({
        $id: 'myOrdersStudent',
        realInfo : false,
        total : '',
        isDelete: 0,
        myOrdersList: [],
        getMyOrdersInfo: function () {
            $('#page_orders').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/myOrders',
                        type: 'POST',
                        data:{},
                        dataType: 'json',
                        success: function (response) {
                            if (response.type) {
                                done(response.data);
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