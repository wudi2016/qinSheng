

//订单状态
function selectCheck(id,courseStatus,orderSn){
    $.ajax({
        type: "get",
        data:{'id':id,'status':courseStatus,'orderSn':orderSn},
        url: "/admin/order/orderState",

        dataType: 'json',
        success: function (res) {
            if(res == 1){
                location.reload();//刷新页面
            }
        }
    })
}

//退款状态
function refundCheck(id,courseStatus){
    $.ajax({
        type: "get",
        data:{'id':id,'status':courseStatus},
        url: "/admin/order/refundState",

        dataType: 'json',
        success: function (res) {
            if(res == 1){
                location.reload();//刷新页面
            }
        }
    })
}