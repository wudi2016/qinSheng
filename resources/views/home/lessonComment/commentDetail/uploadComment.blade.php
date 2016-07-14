@extends('layouts.layoutHome')

@section('title', '上传视频')

@section('css')
    <link rel="stylesheet" type="text/css" href="{{asset('home/css/lessonComment/commentDetail/uploadComment.css')}}">
@endsection

@section('content')
	<div class="uploadComment" ms-controller="uploadCommentController">
		<div class="crumbs">
			<a href="">首页</a> >
			<a href="">名师点评</a> >
			<a href="">名师主页</a> >
			<a href="">上传视频</a>
		</div>

		<div class="uploadComment_content">
			<div style="clear: both; height: 75px;"></div>

			<div class="add_video">
				<div class="add_video_top">
					<div>添加视频</div>
					<div>本地上传</div>
					<div>请上传不超过1GB大小的视频文件</div>
				</div>
				<div class="add_video_tip" style="display: none;" ms-visible="uploadStatus == 1">(支持mp4、fiv、avi、rmvb、wmv、mkv格式上传)</div>
				<div class="add_video_loading" style="display: none;" ms-visible="uploadStatus == 2">
					<div class="progress_bar">
						<div ms-css-width="[--progressBar--]%"></div>
					</div>
					<div class="progress_tip">视频上传中，请勿关闭页面...</div>
					<div class="progress_close">取消上传</div>
				</div>
				<div class="add_video_success" style="display: none;" ms-visible="uploadStatus == 3">视频上传完成！</div>
			</div>

			<div class="suit_level">
				<div class="suit_level_title">适用等级</div>
				<div class="suit_level_content">
					<div ms-repeat="suitlevel" ms-click="selectLevel()" ms-attr-value="el.id">[--el.title--]</div>
				</div>
				<div class="suit_level_tip" ms-css-color="levelWarning ? 'red' : 'rgb(134, 134, 134)'">( 最多选择三项 )</div>
			</div>

			<div class="content_bottom">
				<div class="content_bottom_provision">
					<input type="checkbox">我已阅读并同意<a>作品上传服务条款</a>
				</div>
				<div class="content_bottom_button" ms-css-background="submitDisable ? 'silver' : '#1A9FEB'">完成并发布</div>
			</div>
		</div>

		<div style="clear: both; height: 100px;"></div>
	</div>
@endsection

@section('js')
	<script type="text/javascript">
		require(['lessonComment/commentDetail/uploadComment'], function (uploadComment) {
			uploadComment.commentID = {{$commentID}} || null;
            avalon.scan();
		});
	</script>
@endsection