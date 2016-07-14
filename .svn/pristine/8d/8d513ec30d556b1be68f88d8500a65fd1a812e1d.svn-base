@extends('layouts.layoutHome')

@section('title', '扫码支付')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonComment/buyComment/index.css')}}">
@endsection

@section('content')
	<div class="puy_success">
		<div style="clear: both; height: 60px;"></div>

		<div class="weixin_scan">
			<div style="clear: both; height: 100px;"></div>
			<div class="scan_price">实付金额：<span>450.00元</span></div>
			<div class="scan_code">
				<img src="{{asset('/home/image/lessonComment/commentDetail/code.png')}}" width="100%" height="100%">
			</div>
			<div class="scan_tip">
				<img src="{{asset('/home/image/lessonComment/commentDetail/scan.png')}}">使用微信扫一扫支付
			</div>
		</div>
		
		<div style="claer: both; height: 60px;"></div>
	</div>
@endsection

@section('js')
	<script type="text/javascript">
		require(['lessonComment/buyComment/index'], function (comment) {
			comment.commentID = {{$commentID}} || null;
            avalon.scan();
		});
	</script>
@endsection