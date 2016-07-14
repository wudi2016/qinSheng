define([], function () {

	var teacher = avalon.define({
		$id: 'teacherHomepage',
		teacherInfo: {
			header: '/home/image/layout/default.png',
			bigImage: '/home/image/lessonComment/teacherHomepage/lingbo.jpg',
			name: '李明',
			company: '中央音乐学院',
			fansNum: 39,
			videoNum: 12,
			isFollow: false,
			location: '北京',
			sex: 1,
			create_time: '129',
			commentPrice: 199.00,
			isApply: false,
			introduction: '冯键，男，天津音乐学院钢琴系主任，教授、硕士研究生导师。曾赴德国维尔兹堡音乐大学进修学习。多次应邀担任国内外重大钢琴比赛评委工作，多次赴俄罗斯圣彼得堡担任俄罗斯“大师之路”国际钢琴比赛评委，应邀担任CCTV钢琴小提琴比赛评委，并多次在国内多所艺术院校讲学。在北京大学世纪讲堂与著名小提琴演奏家李传韵同台演出“20世纪华夏经典作品音乐会”，并在中央电视台音乐频道多次播放， 被评为央视2006经典音乐会之一；多次参加天津市“庆七一”、“庆十一”及新年音乐会的演出活动，与著名钢琴家刘诗昆、指挥家谭利华、王钧时、杨力、董俊杰、丁乙留（德国）等及北京交响乐团、天津歌舞剧院民族管弦乐团、天津交响乐团、天津泰达青年交响乐团等合作演出；受北京市委宣传部和北京交响乐团的邀请，赴北京中山音乐堂参加“首都文艺界庆祝十六大召开”及“纪念延安文艺座谈会讲话六十周年”音乐会，受到首都文艺界及观众的好评。'
		},
		isFollow: false,
		fansNum: null,
		videoNum: null,
		tabStatus: 1,
		changeTabStatus: function() {
			teacher.tabStatus != avalon(this).attr('value') ? teacher.tabStatus = avalon(this).attr('value') : false;
		},
		specialLesson: [
			{title: '钢琴演奏基础教程__1', time: 10, learned: 300, price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/lingbo.jpg'},
			{title: '钢琴演奏基础教程__2', time: 10, learned: 300, price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/lingbo.jpg'},
			{title: '钢琴演奏基础教程__3', time: 10, learned: 300, price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/lingbo.jpg'},
			{title: '钢琴演奏基础教程__4', time: 10, learned: 300, price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/lingbo.jpg'},
			{title: '钢琴演奏基础教程__5', time: 10, learned: 300, price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/lingbo.jpg'},
			{title: '钢琴演奏基础教程__6', time: 10, learned: 300, price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/lingbo.jpg'}
		],
		commentLesson: [
			{title: '钢琴演奏基础教程__1', learned: 10, tacher: '吴大海', price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/eva.jpg'},
			{title: '钢琴演奏基础教程__2', learned: 10, tacher: '吴大海', price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/eva.jpg'},
			{title: '钢琴演奏基础教程__3', learned: 10, tacher: '吴大海', price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/eva.jpg'},
			{title: '钢琴演奏基础教程__4', learned: 10, tacher: '吴大海', price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/eva.jpg'},
			{title: '钢琴演奏基础教程__5', learned: 10, tacher: '吴大海', price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/eva.jpg'},
			{title: '钢琴演奏基础教程__6', learned: 10, tacher: '吴大海', price: '500.00', pic: '/home/image/lessonComment/teacherHomepage/eva.jpg'}
		],
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