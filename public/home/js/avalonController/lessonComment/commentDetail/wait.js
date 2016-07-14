define([], function() {

	var comment = avalon.define({
		$id: 'waitCommentController',
		studentInfo: {
			header: '/home/image/lessonComment/teacherHomepage/lingbo.jpg',
			name: '李雪',
			create_time: '2015-03-23',
			title: '彩云追月',
			description: '我看着你的脸轻刷着和弦，情人节卡片手写的永远，还记得广场公园一起表演，校园旁糖果店记忆里，在微甜。我看着你的脸轻刷着和弦，初恋是整遍手写的从前，还记得那年秋天说了再见，当恋情已走远，我将你深埋在心里面。'
		},
		getData: function(url, model, data, method, callback) {
			$.ajax({
				type: method || 'GET',
				url: url,
				data: data || {},
				dataType: "json",
				success: function(response) {
					if (response.type) comment[model] = response.data;
					response.type && console.log(response.data);
					model == 'studentInfo' && comment.setVideo(function () {});
				},
				error: function(error) {
					alert('数据加载失败，请重试');
				}
			});
		},
		thePlayer: {},
		setVideo: function(callback) {
			comment.thePlayer = jwplayer('mediaplayer').setup({
                flashplayer: 'jwplayer/jwplayer.flash.swf',
                playlist: [{
                    image: comment.studentInfo.coursePic,
                    sources: [{
                        label: "超清",
                        file: comment.studentInfo.courseHighPath,
                        height: 720,
                        width: 1280,
                		type: "mp4"
                    },{
						default: true,
                        label: "高清",
                        file: comment.studentInfo.courseMediumPath,
                        height: 360,
                        width: 640,
               	 		type: "mp4"
                    },{
                        label: "标清",
                        file: comment.studentInfo.courseLowPath,
                        height: 180,
                        width: 320,
                		type: "mp4"
                    }]
                }],
                id: 'playerID',
                width: '800',
                height: '450',
                aspectratio: '16:9',
                type: "mp4"
            });
            // typeof callback === 'function' && callback();
		}
	});

	return comment;

});