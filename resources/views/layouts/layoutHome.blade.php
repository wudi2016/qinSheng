<!DOCTYPE html>
<html>
<head>
	<title>@yield('title')</title>
	<meta charset="utf-8">
	{{--<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">--}}
	{{--<meta name="apple-mobile-web-app-capable" content="yes" />--}}
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<link rel="stylesheet" type="text/css" href="{{asset('home/css/layout/layout.css')}}">
	@yield('css')
</head>
<body>
    <!-- 头部开始 -->
    <div class="head">
    	<div class="head_con">
    		<div class="head_con_logo"><a href="{{url('/')}}"><img src="{{asset('home/image/layout/logo.png')}}"></a></div>
    		<div>
				<a href="{{url('/')}}"><div class="head_con_li"><div class="head_con_li_con index" >首页</div></div></a>
				<a href="{{url('/lessonSubject/list/1')}}"><div class="head_con_li" ><div class="head_con_li_con lessonSubject" >课程</div></div></a>
				<a href="{{url('/community')}}"><div class="head_con_li" ><div class="head_con_li_con community">社区</div></div></a>
				<a href="{{url('/aboutUs/firmintro/1')}}"><div class="head_con_li" ><div class="head_con_li_con aboutUs">关于</div></div></a>
    		</div>
    		<div class="head_con_login">
    		    <!-- 登陆前 -->
				@if (!Auth::check() || \Auth::user()->type == 3)
				<div class="head_con_login_con "><a href="{{url('/index/login')}}"><span>登录</span></a>&nbsp;|&nbsp;<a href="{{url('/index/register')}}"><span>注册</span></a></div>
    		    <!-- 登陆后 -->
				@else
				<img  class="touxiang " src="{{asset(\Auth::user()->pic)}}" onerror="javascript:this.src='/home/image/layout/default.png';">
				@if ($Msg)<div class="haveMsg">·</div>@else<div class="haveMsg"></div> @endif

				<div class="clear"></div>
                <div  class="persapce hide">
                	<div class="persapce_li">
						<div class="persapce_li_con_per">
							@if(\Auth::user()->type == 0)
								<a href="{{url('/member/student/0/#myOrders')}}">个人中心</a>
							@elseif(\Auth::user()->type == 1)
								<a href="{{url('/member/student/1/#myOrders')}}">个人中心</a>
							@elseif(\Auth::user()->type == 2)
								<a href="{{url('/member/famousTeacher/#waitComment')}}">个人中心</a>
							@endif
						</div>
					</div>
					@if( \Auth::user()->type != 2 )
						<div class="persapce_li">
							<a href="{{asset('/member/student/'.\Auth::user()->type.'/#wholeNotice')}}">
								@if ($Msg)
								<div class="persapce_li_con_msg" style="background: url('/home/image/layout/haveMsg.png') no-repeat 15px 5px;">消息通知</div>
								@else
								<div class="persapce_li_con_msg">消息通知</div>
								@endif
							</a>
						</div>
					@else
						<div class="persapce_li">
							<a href="{{asset('/member/famousTeacher/#wholeNotice')}}">
								@if ($Msg)
									<div class="persapce_li_con_msg" style="background: url('/home/image/layout/haveMsg.png') no-repeat 15px 5px;">消息通知</div>
								@else
									<div class="persapce_li_con_msg">消息通知</div>
								@endif
							</a>
						</div>
					@endif
                	<div class="persapce_li" style="border-bottom:1px solid #F5F5F5"><a href="{{url('/index/switchs')}}"><div class="persapce_li_con_cha">切换账号</div></a></div>
                	<div class="persapce_li"><a href="{{url('/auth/logout')}}"><div class="persapce_li_con_lout">退出登录</div></a></div>
                </div>
				@endif
			</div>
			{{--搜索--}}
    		<div class="head_con_search">
				<div class="head_con_search_con">
					<form method="post" action="{{url('/index/search')}}">
						<input type="hidden" name="_token" value="<?php echo csrf_token(); ?>">
						<input type="hidden" name="type" value="all">
						<input type="text" name="search" placeholder="请输入您要查找的课程名称" class="sear">
						<input type="image" src="{{asset('home/image/layout/search.png')}}" class="sbtn">
					</form>
				</div>
			</div>
    	</div>
    </div>
    <div class="head_head"></div>
    <!-- 联系客服 -->
	<div class="online">
		<a target=blank href=http://wpa.qq.com/msgrd?V=3&uin=3429065020&Site=QQ客服&Menu=yes>
		<div class="qq">
			<div class="mmsg hide">
				<div class="mmsg_tie">QQ客服</div>
				<div class="mmsg_con">
				    <div style="height:30px;"></div>
					<div class="mmsg_con_con">
						<div class="mmsg_con_con_l"></div>
						<div class="mmsg_con_con_r">琴晟客服(遇到问题请与我联系)</div>
					</div>
				</div>
			</div>
		</div>
		</a>
		<div class="wx">
			<div class="mmsg hide">
				<div class="mmsg_tie">微信公众号</div>
				<div class="mmsg_con">
				    <div style="height:15px;"></div>
					<img  width="80px" height="80px" src="{{asset('home/image/layout/wxgzh.jpg')}}" style="margin-left:80px;">
				</div>
			</div>
		</div>
		<div class="tel">
			<div class="mmsg hide">
				<div class="mmsg_tie">电话客服</div>
				<div class="mmsg_con">
				    <div style="height:17px;"></div>
				    <div class="mmsg_con_li">
				    	<div class="mmsg_con_li_left">服务时间 : </div>
				    	<div class="mmsg_con_li_right">9 : 00 - 18 : 00</div>
				    </div>
				    <div class="mmsg_con_li">
				    	<div class="mmsg_con_li_left">联系电话 : </div>
				    	<div class="mmsg_con_li_right">010-82159455</div>
				    </div>
				</div>
			</div>
		</div>
		<div class="eml">
			<div class="mmsg hide">
				<div class="mmsg_tie">电子邮箱</div>
				<div class="mmsg_con">
				    <div style="height:30px;"></div>
					<div class="mmsg_con_con">
						<div class="mmmsg_con_con_l"></div>
						<div class="mmmsg_con_con_r">service@musicdp.com</div>
					</div>
				</div>
			</div>
		</div>
	</div>
    <!-- 头部结束 -->

    <!-- body体 -->
    <div class="body">
		@yield('content')

		{{--<div style="width:1200px;height:1000px;margin:0 auto;background:#dddddd;"></div>--}}
    </div>
    <!-- body体结束 -->

	<div class="foot">
		<div class="foot_con">
			<div class="foot_con_l">
				<div style="height:40px;"></div>
				<div class="foot_con_l_a"><img src="{{asset('home/image/layout/logo.png')}}"></div>
				<div class="foot_con_l_b">琴晟艺术点评网</div>
				<div class="foot_con_l_c">Copyright © 2016-2025 pianodianping</div>
				<div class="foot_con_l_d">京ICP备123456789号</div>
			</div>
			<div class="foot_con_m">
				<div style="height:40px;"></div>
				<div class="foot_con_m_a">关于我们</div>
				<div style="height:20px;"></div>
				<div class="foot_con_m_b"><a href="/aboutUs/firmintro/1">公司介绍</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="{{url($weibo)}}" title="官方微博">新浪微博</a></div>
				<div class="foot_con_m_b"><a href="/aboutUs/firmintro/2">联系我们</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="/aboutUs/firmintro/4">用户协议</a></div>
				<div class="foot_con_m_b"><a href="/aboutUs/firmintro/3">常见问题</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="/aboutUs/firmintro/5">友情链接</a></div>
			</div>
			<div class="foot_con_r">
				<div class="foot_con_r_l">
					<div style="height:40px;"></div>
					<div class="foot_con_r_l_a">官方微信</div>
					<div style="height:30px;"></div>
					<div class="weima">{!! $weixin !!}</div>
				</div>
				<div class="foot_con_r_r">
					<div style="height:40px;"></div>
					<div class="foot_con_r_l_a">APP下载</div>
					<div style="height:30px;"></div>
					<img class="weima" src="{{asset('home/image/layout/wxgzh.jpg')}}" alt="">
				</div>
				{{--<div style="height:40px;"></div>--}}
				{{--<div class="foot_con_m_a">关注我们</div>--}}
				{{--<div style="height:35px;"></div>--}}
				{{--<div class="foot_con_r_con">--}}
				{{--<a href="{{url($weibo)}}" title="官方微博"><img class="lxlogoa" src="{{asset('home/image/layout/weibo.png')}}"></a>&nbsp;&nbsp;--}}
				{{--<img class="lxlogob" src="{{asset('home/image/layout/weixin.png')}}">--}}
				{{--</div>--}}
				{{--<div class="lxfsb hide"><img src="{{asset('home/image/layout/gzh.png')}}" alt=""></div>--}}
				{{--<div class="lxfsb hide">{!! $weixin !!}</div>--}}
			</div>
		</div>
	</div>
	<!-- 底部结束 -->

</body>
<script type="text/javascript" src="{{asset('home/js/layout/jquery.min.js') }}"></script>
<script type="text/javascript" src="{{asset('home/js/layout/layout.js')}}"></script>
@yield('selectjs')
<script type="text/javascript" src="{{asset('avalon/avalon.js')}}"></script>
<script type="text/javascript" src="{{asset('home/js/layout/avalonConfig.js')}}"></script>

{{--<script>--}}
	{{--$("body").height( $(window).height() );--}}

{{--</script>--}}
@yield('js')
</html>