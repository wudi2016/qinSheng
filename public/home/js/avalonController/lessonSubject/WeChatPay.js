/**
 * Created by Mr.H on 2016/7/23.
 */
define([], function() {

    var wxPay = avalon.define({
        $id: 'wxPayController',
        getData: function(url, model, data, method, callback) {
            $.ajax({
                type: method || 'GET',
                url: url,
                data: data,
                dataType: "json",
                success: function(response) {
                    if (model == 'orderStatus') {
                        if (response.status) {
                            window.location.href = '/lessonSubject/buySuccess/'+wxPay.orderID;
                        } else {
                            setTimeout(function() {
                                wxPay.getData('/lessonSubject/orderStatus/'+wxPay.orderID, 'orderStatus');
                            }, 3000);
                        }
                    }
                },
                error: function(error) {}
            });
        }
    });
    return wxPay;
});