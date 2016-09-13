@extends('layouts.layoutHome')

@section('title', '在线支付')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonComment/buyComment/index.css')}}">
@endsection

@section('content')
	<div class="puy_success">
		<div class="crumbs">
			<a href="/index">首页</a> >
			<a href="/lessonSubject/list/1">课程</a> >
			<a href="">在线支付</a>
		</div>
	
		<div class="pay_content">
			<div style="clear: both; height: 50px;"></div>
			<div class="pay_content_title">
				<img src="{{asset('/home/image/lessonComment/commentDetail/success.png')}}">支付成功
			</div>
			<div class="pay_content_des">订单已处理完成，感谢你的支持。</div>
			<div class="pay_content_des">如有疑问，请联系客服获取帮助。</div>
			<a href='/lessonSubject/detail/{{$courseId}}' class="pay_button" style="margin: 250px 0px 0px 70px;">前往学习</a>
		</div>
		
		<div style="clear: both; height: 60px;"></div>
	</div>
@endsection

@section('js')
@endsection