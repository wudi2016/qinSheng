define([], function() {

	var comment = avalon.define({
		$id: 'commentController',
		studentInfo: [],
		teacherInfo: [],
		bought: false,
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
				comment.getData('/lessonComment/getFirst', 'isFollow', {table: 'collection', action: 2, data: {courseId: comment.commentID, userId: comment.mineID, type: 1}}, 'POST', function(response) {
					comment.getData('/lessonComment/videoIncrement', 'videoIncrement', {table: 'commentcourse', condition: {id: comment.commentID}, field: 'courseFav', action: 1}, 'POST');
				});
			}
		},
		popUp: false,
		popUpSwitch: function(value, action) {
			comment.popUp = value;
			switch (action) {
				case 'unfollow':
					comment.getData('/lessonComment/getFirst', 'isFollow', {table: 'collection', action: 3, data: {courseId: comment.commentID, userId: comment.mineID, type: 1}}, 'POST', function(response) {
						comment.getData('/lessonComment/videoIncrement', 'videoIncrement', {table: 'commentcourse', condition: {id: comment.commentID}, field: 'courseFav', action: 0}, 'POST');
					});
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
					if (model == 'likes' || model == 'feedBack') {
						callback(response.type);
						return;
					}
					if (model == 'submitComment') {
						callback && callback(response.data);
						return;
					}
					if (response.type) {
						comment[model] = response.data;
						model == 'orderInfo' && callback(response);
						(model == 'isFollow' && callback) && callback(response.data);
					}
					if (model == 'teacherInfo') {
						comment.getData('/lessonComment/getDetailInfo/'+ response.data.orderSn +'/0', 'studentInfo');
					}
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
            (!comment.videoType && !comment.bought) && comment.thePlayer.onTime(function(){
	            if (comment.thePlayer.getPosition() >= 60) {
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
			comment.replayInfo = {name: '@'+ el.username +'： ', parentId: el.id, toUserId: el.fromUserId, toUserName: el.username, toUserType: el.type, commentContent: el.commentContent};
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
				data.commentContent = data.commentContent.split(/@*： /);
				data.commentContent.shift();
				data.commentContent = data.commentContent.join('');
			}
			comment.getData('/lessonComment/getFirst', 'submitComment', {table: 'applycoursecomment', action: 2, data: data}, 'POST', function(response) {
				comment.commentlist.unshift({
					commentContent: data.commentContent,
					created_at: '一秒前',
					id: response,
					isLike: false,
					likeNum: 0,
					likeUser: [],
					parentId: data.parentId || null,
					toUserId: data.toUserId || null,
					fromUserId: comment.mineID,
					pic: comment.minePic,
					type: comment.mineType,
					username: comment.mineUsername,
					toUserName: comment.replayInfo.toUserName,
					toUserType: comment.replayInfo.toUserType
				});
				if (comment.replayInfo.toUserName || comment.studentInfo.username != comment.mineUsername) {
					data = {
						type: comment.replayInfo.toUserName ? 5 : 6,
						username: comment.replayInfo.toUserName || comment.studentInfo.username,
						actionId: comment.commentID,
						fromUsername: comment.mineUsername,
						toUsername: comment.replayInfo.toUserName || comment.studentInfo.username,
						content: comment.replayInfo.commentContent || comment.studentInfo.extra,
						courseType: 1
					};
					comment.getData('/lessonComment/getFirst', 'submitComment', {table: 'usermessage', action: 2, data: data}, 'POST');
				}
				delete data;
				comment.replayInfo = {};
				comment.replayInfo.name = '';
				comment.replayInfo.lengths = 0;
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
			if (comment.feedBack.content.length > 80) {
				comment.feedBackWarning.content = true;
				return false;
			};
			comment.getData('/lessonComment/getFirst', 'feedBack', {table: 'coursefeedback', action: 2, data: {courseId: comment.commentID, courseType: 1, backType: comment.feedBack.type, backContent: comment.feedBack.content, tel: comment.feedBack.tel, username: comment.mineUsername}}, 'POST', function(response) {
				response ? comment.popUpSwitch('feedbackSuccess') : popUpSwitch(false, 'feedback');
			});
		},
		payType: '',
		payWarning: false,
		pay: function() {
			if (comment.payType === '') {
				comment.payWarning = true;
				return false;
			}
			var data = {
				payType: comment.payType, 
				userName: comment.mineUsername, 
				userId: comment.mineID,
				teacherId: comment.teacherInfo.teacherId,
				teacherName: comment.teacherInfo.username,
				orderType: 2,
				orderPrice: comment.teacherInfo.extra,
				orderTitle: '学员'+ comment.mineUsername +'购买'+ comment.studentInfo.extra +'点评课程。',
				courseId: comment.commentID
			};
			comment.getData('/lessonComment/generateOrder', 'orderInfo', data, 'POST', function(response) {
				if (comment.payType) {
					location.href = '/lessonComment/scan/'+ response.data;
				} else {
					location.href = '/lessonComment/alipay/'+ response.data +'/lessonComment&detail&'+ comment.commentID;
				};
			});
		}
	});

	return comment;

});