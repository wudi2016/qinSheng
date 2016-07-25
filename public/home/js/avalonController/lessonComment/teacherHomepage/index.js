define([], function () {

	var teacher = avalon.define({
		$id: 'teacherHomepage',
		teacherInfo: [],
		isFollow: false,
		fansNum: null,
		videoNum: null,
		tabStatus: 1,
		changeTabStatus: function() {
			teacher.tabStatus != avalon(this).attr('value') ? teacher.tabStatus = avalon(this).attr('value') : false;
		},
		specialLesson: [],
		commentLesson: [],
		order: {special: 1, comment: 1},
		changeOrder: function(key, value) {
			teacher.order[key] = value;
		},
		getData: function(url, model, data, method) {
			if (model == 'specialLesson' || model == 'commentLesson') student.loading = true;
			$.ajax({
				type: method || 'GET',
				url: url,
				data: data,
				dataType: "json",
				success: function(response) {
					if (response.type) {
						student[model] = response.data;
						console.log(student[model]);
					}
					if (model == 'specialCount' || model == 'commentCount') {
						student.videoNum += response.data;
						student[model] = Math.ceil(student[model]/6);
						for (var i = 1; i <= student[model]; i++) {
							student[model+'Number'].push(i);
						}
					}
					if (model == 'specialLesson' || model == 'commentLesson') student.loading = false;
				},
				error: function(error) {
					if (model == 'specialLesson' || model == 'commentLesson') student.loading = false;
				}
			});
		},
		loading: true,
		page: {special: 1, comment: 1},
		specialCount: 0,
		specialCountNumber: [],
		commentCount: 0,
		commentCountNumber: [],
		jump: null,
		jumping: function(model) {
			if (student.jump != student.page[model] && student.jump <= student[model+'Count'] && student.jump != null && typeof student.jump === 'number' && student.jump != 0) {
				student.page[model] = student.jump;
				student.getData('/lessonComment/getVideo', model+'Lesson', {userid: student.studentID, order: student.order[model], type: student.tabStatus, page: student.page[model]}, 'POST');
			};
			student.jump = null;
		},
		skip: function(model, direction) {
			if (typeof direction === 'boolean') {
				direction ? ++student.page[model] : --student.page[model];
			}
			if (typeof direction === 'number') {
				student.page[model] = direction;
			}
			student.getData('/lessonComment/getVideo', model+'Lesson', {userid: student.studentID, order: student.order[model], type: student.tabStatus, page: student.page[model]}, 'POST');
		},
		followUser: function() {
			student.isFollow || student.getData('/lessonComment/getFirst', 'isFollow', {table: 'friends', action: 2, data: {fromUserId: student.mineID, toUserId: student.studentID}}, 'POST');
		}
	});

	return teacher;

});