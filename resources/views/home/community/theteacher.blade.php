@extends('layouts.layoutHome')

@section('title', '名师列表')

@section('css')
	<link rel="stylesheet" type="text/css" href="{{asset('home/css/community/theteacher.css') }}">
@endsection

@section('content')



		<div style="height:20px"></div>
		

		<!-- 主体div -->
		<div class="main"  ms-controller="theteacher" >
			<!-- 面包屑导航 -->
			<div class="crumbs">
				<a href="{{asset('/community')}}">互动社区</a><span>></span><a href="#">名师主页</a>
			</div>

			<!-- 排序说明 -->
			<div class="order">
					<div>以下名师按姓氏排序，排序不分先后</div>
			</div>

			<!-- 排序字母 -->
			<div class="orderletter">
				<div ms-click="tabs(1)" class="a" >A</div>
				<div ms-click="tabs(2)" class="b">B</div>
				<div ms-click="tabs(3)" class="c">C</div>
				<div ms-click="tabs(4)" class="d">D</div>
				<div ms-click="tabs(5)" class="e">E</div>
				<div ms-click="tabs(6)" class="f">F</div>
				<div ms-click="tabs(7)" class="g">G</div>
				<div ms-click="tabs(8)" class="h">H</div>
				<div ms-click="tabs(9)" class="i">I</div>
				<div ms-click="tabs(10)" class="j">J</div>
				<div ms-click="tabs(11)" class="k">K</div>
				<div ms-click="tabs(12)" class="l">L</div>
				<div ms-click="tabs(13)" class="m">M</div>
				<div ms-click="tabs(14)" class="n">N</div>
				<div ms-click="tabs(15)" class="o">O</div>
				<div ms-click="tabs(16)" class="p">P</div>
				<div ms-click="tabs(17)" class="q">Q</div>
				<div ms-click="tabs(18)" class="r">R</div>
				<div ms-click="tabs(19)" class="s">S</div>
				<div ms-click="tabs(20)" class="t">T</div>
				<div ms-click="tabs(21)" class="u">U</div>
				<div ms-click="tabs(22)" class="v">V</div>
				<div ms-click="tabs(23)" class="w">W</div>
				<div ms-click="tabs(24)" class="x">X</div>
				<div ms-click="tabs(25)" class="y">Y</div>
				<div ms-click="tabs(26)" class="z">Z</div>
			</div>
			
			<div style="height:20px"></div>

			
			<!-- table循环 -->
			<div class="table_loop"  >

				<!-- 内容 -->
				<div class="content" ms-repeat="theteacherlist" >

					<!--字母标题  -->
					<div class="lettertitle">
						<div ms-html="el.firstletter"></div>
					</div>
					<div style="height:10px"></div>
					<!-- 详细内容 -->
					<div class="detailcontent">
						<!-- 左侧图片 -->
						<div class="content_left">
							<a ms-attr-href="teacherhomepage + el.userId"><img ms-attr-src="el.cover"  alt="" /></a>
						</div>
						<!-- 右侧内容 -->
						<div class="content_right">
							<!-- 姓名 -->
							<div class="content_name">
								<a ms-attr-href="teacherhomepage + el.userId"><div ms-html="el.name" ></div></a>
							</div>
							<!-- 学校 -->
							<div class="content_school">
								<a ms-attr-href="teacherhomepage + el.userId"><div ms-html="el.school"></div></a>
							</div>
							<!-- 介绍 -->
							<div class="content_introduce">
								<a ms-attr-href="teacherhomepage + el.userId"><div ms-html="el.intro" ms-theteacheryincang></div></a>
							</div>
						</div>
					</div>				
				</div>






			</div>


		</div>

		<div style="height:75px"></div>





@endsection

@section('js')
	{{--<script type="text/javascript" src="{{asset('home/js/community/theteacher.js')}}"></script>--}}

	<script>
		require(['/community/theteacher.js'], function ($) {

			avalon.scan();
		});
	</script>
@endsection

