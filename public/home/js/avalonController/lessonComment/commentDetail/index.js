define([], function() {

	var comment = avalon.define({
		$id: 'commentController',
		studentInfo: [],
		teacherInfo: [],
		descriptionOpen: false,
		descriptionSwitch: function(model, value) {
			comment[model] = value;
		},
		recommendlist: [],
		commentlist: [],
		isFollow: false,
		followCourse: function() {
			if (comment.isFollow) {
				comment.popUp = 'unfollow'
			} else {
				comment.getData('/lessonComment/getFirst', 'isFollow', {table: 'collection', action: 2, data: {courseId: comment.commentID, userId: comment.mineID, type: 1}}, 'POST');
			}
		},
		popUp: false,
		popUpSwitch: function(value, action) {
			comment.popUp = value;
			switch (action) {
				case 'unfollow':
					comment.getData('/lessonComment/getFirst', 'isFollow', {table: 'collection', action: 3, data: {courseId: comment.commentID, userId: comment.mineID, type: 1}}, 'POST');
					break;
				case 'delComment':
					comment.getData('/lessonComment/getFirst', 'likes', {table: 'applycoursecomment', action: 3, data: {id: comment.commentlist[comment.deleteIndex].id, fromUserId: comment.mineID}}, 'POST', function(response) {
						response && comment.commentlist.removeAt(comment.deleteIndex);
						comment.deleteIndex = null;
					});
					break;
				case 'feedback':
					comment.feedBack = {type: '', content: '', tel: ''};
					comment.feedBackWarning = {type: false, content: false, tel: false};
					break;
				case 'feedbackSuccess':
					comment.feedBack = {type: '', content: '', tel: ''};
					comment.feedBackWarning = {type: false, content: false, tel: false};
					comment.popUpSwitch('feedback');
					break;
			}
		},
		getData: function(url, model, data, method, callback) {
			$.ajax({
				type: method || 'GET',
				url: url,
				data: data || {},
				dataType: "json",
				success: function(response) {
					if (model == 'likes') {
						callback(response.type)
						return;
					};
					if (model == 'submitComment') {
						callback(response.data)
						return;
					};
					if (model == 'feedBack') {
						callback(response.type)
						return;
					};
					if (response.type) comment[model] = response.data;
					model == 'teacherInfo' && comment.getData('/lessonComment/getDetailInfo/'+response.data.orderSn+'/0', 'studentInfo');
					model == 'studentInfo' && comment.setVideo(function () {});
				},
				error: function(error) {
					alert('数据加载失败，请重试');
				}
			});
		},
		overtime: false,
		thePlayer: {},
		videoType: true,
		videoTime: {videoOne: 0, videoTow: 0},
		setVideo: function(callback) {
			var model = comment.videoType ? 'studentInfo' : 'teacherInfo';
			comment.thePlayer = jwplayer('mediaplayer').setup({
                flashplayer: 'jwplayer/jwplayer.flash.swf',
                playlist: [{
                    image: comment[model].coursePic,
                    sources: [{
                        label: "超清",
                        file: comment[model].courseHighPath || comment[model].courseMediumPath || comment[model].courseLowPath,
                        height: 720,
                        width: 1280,
                		type: "mp4"
                    },{
						default: true,
                        label: "高清",
                        file: comment[model].courseMediumPath || comment[model].courseLowPath,
                        height: 360,
                        width: 640,
               	 		type: "mp4"
                    },{
                        label: "标清",
                        file: comment[model].courseLowPath,
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
            typeof callback === 'function' && callback();
            comment.bought || comment.thePlayer.onTime(function(){
	            if (comment.thePlayer.getPosition() >= 12) {
	                comment.thePlayer.play(false);
	                comment.thePlayer.remove();
	                comment.overtime = true;
	            }
	        });
		},
		changeVideo: function() {
			comment.overtime = false;
			comment.thePlayer.play(false);
			comment.videoType ? comment.videoTime.videoOne = comment.thePlayer.getPosition() : comment.videoTime.videoTow = comment.thePlayer.getPosition();
			comment.videoType = !comment.videoType;
			comment.setVideo(function () {
				comment.videoType ? comment.thePlayer.seek(comment.videoTime.videoOne) : comment.thePlayer.seek(comment.videoTime.videoTow);
            	comment.thePlayer.play(true);
			});
		},
		clickLike: function(el) {
			el.isLike || comment.getData('/lessonComment/likesComment', 'likes', {id: el.id, likeUser: el.likeUser}, 'POST', function(response) {
				el.isLike = response;
				el.isLike && ++el.likeNum;
			});
		},
		deleteIndex: null,
		deleteComment: function(index) {
			comment.deleteIndex = index;
			comment.popUp = 'deleteComment'
		},
		replayInfo: {name: '', lengths: 0},
		replyWarning: false,
		replyComment: function(el) {
			comment.replayInfo = {name: '@'+ el.username +':', parentId: el.id, toUserId: el.fromUserId};
			comment.replayInfo.lengths = comment.replayInfo.name.length;
		},
		submitComment: function() {
			if (comment.replayInfo.name.length <= comment.replayInfo.lengths) {
				comment.replyWarning = true;
				return false;
			}
			var data = {courseId: comment.commentID, fromUserId: comment.mineID, commentContent: comment.replayInfo.name};
			if (comment.replayInfo.parentId && comment.replayInfo.toUserId) {
				data.parentId = comment.replayInfo.parentId;
				data.toUserId = comment.replayInfo.toUserId;
				data.commentContent = data.commentContent.split(/@*:/);
				data.commentContent.shift();
				data.commentContent = data.commentContent.join('');
			};
			comment.getData('/lessonComment/getFirst', 'submitComment', {table: 'applycoursecomment', action: 2, data: data}, 'POST', function(response) {
				comment.commentlist.unshift({
					commentContent: data.commentContent,
					created_at: '一秒前',
					fromUserId: comment.mineID,
					id: response,
					isLike: false,
					likeNum: 0,
					likeUser: [],
					parentId: data.parentId || null,
					pic: comment.minePic,
					toUserId: data.toUserId || null,
					type: comment.mineType,
					username: comment.mineUsername
				});
				comment.replayInfo = {}
			});
		},
		feedBack: {type: '', content: '', tel: ''},
		feedBackWarning: {type: false, content: false, tel: false},
		submitFeedback: function() {
			for (var i in comment.feedBack) {
				if (comment.feedBack[i].length <= 0) {
					comment.feedBackWarning[i] = true;
					return false;
				};
			}
			if (comment.feedBack.content.length > 200) {
				comment.feedBackWarning.content = true;
				return false;
			};
			comment.getData('/lessonComment/getFirst', 'feedBack', {table: 'coursefeedback', action: 2, data: {courseId: comment.commentID, courseType: 1, backType: comment.feedBack.type, backContent: comment.feedBack.content, tel: comment.feedBack.tel, username: comment.mineUsername}}, 'POST', function(response) {
				response ? comment.popUpSwitch('feedbackSuccess') : popUpSwitch(false, 'feedback');
			});
		},
		payType: null,
		payWarning: false
	});

	return comment;

});