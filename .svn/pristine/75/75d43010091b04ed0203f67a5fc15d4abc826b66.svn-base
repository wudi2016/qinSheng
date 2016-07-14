define([], function () {

	var user = avalon.define({
		$id: 'userHomepage',
		userInfo: {
			pic: '/home/image/layout/default.png',
			username: '...',
			type: null,
			city: '...',
			sex: 1,
			created_at: '...'
		},
		isFollow: false,
		fansNum: 0,
		videoNum: 0,
		tabStatus: 0,
		changeTabStatus: function() {
			if (user.loading) return false;
			user.tabStatus != avalon(this).attr('value') ? user.tabStatus = avalon(this).attr('value') : false;
			user.jump = null;
		},
		specialLesson: [],
		commentLesson: [],
		order: {special: 0, comment: 0},
		changeOrder: function(key, value) {
			if (user.loading) return false;
			if (user.order[key] != value) {
				user.order[key] = value;
				user.getData(user.videoUrl, key+'Lesson', {userid: user.userID, order: value, type: user.tabStatus, page: user.page[key]}, 'POST');
			};
		},
		getData: function(url, model, data, method) {
			if (model == 'specialLesson' || model == 'commentLesson') user.loading = true;
			$.ajax({
				type: method || 'GET',
				url: url,
				data: data || {},
				dataType: "json",
				success: function(response) {
					if (response.type) {
						user[model] = response.data;
					}
					if (model == 'specialCount' || model == 'commentCount') {
						user.videoNum += response.data || 0;
						user[model] = Math.ceil(user[model]/6);
						for (var i = 1; i <= user[model]; i++) {
							user[model+'Number'].push(i);
						}
					}
					if (model == 'specialLesson' || model == 'commentLesson') user.loading = false;
				},
				error: function(error) {
					if (model == 'specialLesson' || model == 'commentLesson') user.loading = false;
				}
			});
		},
		loading: false,
		page: {special: 1, comment: 1},
		specialCount: 0,
		specialCountNumber: [],
		commentCount: 0,
		commentCountNumber: [],
		jump: null,
		jumping: function(model) {
			if (user.jump != user.page[model] && user.jump <= user[model+'Count'] && user.jump != null && typeof user.jump === 'number' && user.jump != 0) {
				user.page[model] = user.jump;
				user.getData(user.videoUrl, model+'Lesson', {userid: user.userID, order: user.order[model], type: user.tabStatus, page: user.page[model]}, 'POST');
			};
			user.jump = null;
		},
		skip: function(model, direction) {
			if (typeof direction === 'boolean') {
				direction ? ++user.page[model] : --user.page[model];
			}
			if (typeof direction === 'number') {
				if (user.page[model] == direction) return false;
				user.page[model] = direction;
			}
			user.getData(user.videoUrl, model+'Lesson', {userid: user.userID, order: user.order[model], type: user.tabStatus, page: user.page[model]}, 'POST');
		},
		followUser: function() {
			if (user.isFollow) {
				user.popUp = 'unfollow';
			} else {
				user.getData('/lessonComment/getFirst', 'isFollow', {table: 'friends', action: 2, data: {fromUserId: user.mineID, toUserId: user.userID}}, 'POST');
			}
		},
		popUp: false,
		popUpSwitch: function(value, unfollow) {
			user.popUp = value;
			unfollow && user.getData('/lessonComment/getFirst', 'isFollow', {table: 'friends', action: 3, data: {fromUserId: user.mineID, toUserId: user.userID}}, 'POST');
		}
	});

	return user;

});