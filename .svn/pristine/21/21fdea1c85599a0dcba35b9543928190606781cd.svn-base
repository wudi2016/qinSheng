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
            $.ajax({
                url: '/member/myOrders',
                type: 'POST',
                data:{},
                dataType: 'json',
                success: function (response) {
                    if (response.type) {
                        myOrdersStudent.realInfo = true;
                        myOrdersStudent.myOrdersList = response.data;
                        //myOrdersStudent.total = response.total;
                    } else {
                        myOrdersStudent.realInfo = false;
                        //myOrdersStudent.total = response.total;
                    }
                },
                error: function (error) {

                }
            });
        },
    })
    return {
        myOrdersStudent: myOrdersStudent
    }
})