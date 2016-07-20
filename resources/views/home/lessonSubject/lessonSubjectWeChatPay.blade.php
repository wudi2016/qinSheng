@extends('layouts.layoutHome')

@section('title', '微信扫码支付')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonSubject/WeChatPay.css') }}">
@endsection

@section('content')
    <div class="contain_we_chat">
        <div style="height: 60px;width: 100%"></div>
        <div class="we_chat_pay">
            <div style="height: 80px;width: 100%"></div>

            <div class="we_chat_pay_top">
                <span>实付金额：</span><span class="price">{{$orderInfo -> orderPrice}}元</span>
            </div>
            <div style="height: 60px;width: 100%"></div>
            <div class="we_chat_pay_cen">
                {!! \QrCode::encoding('UTF-8') -> size(200) -> generate($url) !!}
            </div>
            <div style="height: 30px;width: 100%"></div>
            <div class="we_chat_pay_bot">
                <span>使用微信扫一扫支付</span>
            </div>
        </div>
    </div>
@endsection

@section('js')
    <script>
        require(['lessonComment/buyComment/index'], function (comment) {
            comment.orderID = '{{$orderID}}' || null;
            comment.getData('/lessonComment/orderStatus/' + comment.orderID, 'orderStatus');
            setTimeout(function () {
                comment.getData('/lessonComment/getFirst', 'deleteOrder', {
                    data: {id: comment.orderID},
                    action: 3,
                    table: 'orders'
                }, 'POST');
            }, 300000);
            avalon.scan();
        });
    </script>
@endsection