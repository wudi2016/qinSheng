@extends('layouts.layoutHome')

@section('title', '名师列表')

@section('css')
	<link rel="stylesheet" type="text/css" href="{{asset('home/css/community/theteacher.css') }}">
	<link rel="stylesheet" type="text/css" href="{{asset('home/css/games/pagination.css')}}">

@endsection

@section('content')

	<div class="background">



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
				<div ms-click="tabs('tabss')" class="tabss">全部</div>
				<div ms-click="tabs('A')" class="A">A</div>
				<div ms-click="tabs('B')" class="B">B</div>
				<div ms-click="tabs('C')" class="C">C</div>
				<div ms-click="tabs('D')" class="D">D</div>
				<div ms-click="tabs('E')" class="E">E</div>
				<div ms-click="tabs('F')" class="F">F</div>
				<div ms-click="tabs('G')" class="G">G</div>
				<div ms-click="tabs('H')" class="H">H</div>
				<div ms-click="tabs('I')" class="I">I</div>
				<div ms-click="tabs('J')" class="J">J</div>
				<div ms-click="tabs('K')" class="J">K</div>
				<div ms-click="tabs('L')" class="L">L</div>
				<div ms-click="tabs('M')" class="M">M</div>
				<div ms-click="tabs('N')" class="N">N</div>
				<div ms-click="tabs('O')" class="O">O</div>
				<div ms-click="tabs('P')" class="P">P</div>
				<div ms-click="tabs('Q')" class="Q">Q</div>
				<div ms-click="tabs('R')" class="R">R</div>
				<div ms-click="tabs('S')" class="S">S</div>
				<div ms-click="tabs('T')" class="T">T</div>
				<div ms-click="tabs('U')" class="U">U</div>
				<div ms-click="tabs('V')" class="V">V</div>
				<div ms-click="tabs('W')" class="W">W</div>
				<div ms-click="tabs('X')" class="X">X</div>
				<div ms-click="tabs('Y')" class="Y">Y</div>
				<div ms-click="tabs('Z')" class="Z">Z</div>
			</div>
			
			<div style="height:20px"></div>

			
			<!-- table循环 -->
			<div class="table_loop"  >

				<!-- 内容 -->
				<div class="content" ms-repeat="theteacherlist" ms-if-loop="Yes" >

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

				<div class="noteacher" ms-if="No">暂无名师...</div>


			</div>


		</div>

		<div style="height:25px"></div>
		<div class="pagecon" style=" width:1200px; height:35px; margin: 0 auto;" >
			<div id="page"></div>
		</div>


		<div style="height:35px">


		</div>

	</div>
@endsection

@section('js')
	{{--<script type="text/javascript" src="{{asset('home/js/community/theteacher.js')}}"></script>--}}
	    <script type="text/javascript" src="{{asset('home/js/games/pagination.js')}}"></script>


	<script>
		require(['/community/theteacher.js'], function ($) {

			avalon.scan();
		});
	</script>
@endsection

