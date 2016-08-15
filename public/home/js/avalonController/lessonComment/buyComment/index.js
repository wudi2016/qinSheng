define([], function() {

	var comment = avalon.define({
		$id: 'buyController',
		teacherInfo: [],
		commentType: '钢琴演奏',
		getData: function(url, model, data, method, callback) {
			$.ajax({
				type: method || 'GET',
				url: url,
				data: data,
				dataType: "json",
				success: function(response) {
					if (model == 'orderStatus') {
						if (response.type) {
							switch (parseInt(response.data.orderType)) {
								case 1:
									window.location.href = '/lessonComment/buySuccess/' + comment.orderID;
									break;
								case 2:
									window.location.href = '/lessonComment/detail/' + response.data.courseId;
									break;
							}
						} else {
							setTimeout(function() {
								comment.getData('/lessonComment/orderStatus/'+comment.orderID, 'orderStatus');
							}, 3000);
						}
					}
					if (model == 'orderInfo') {
						response.type && callback(response);
						return;
					}
					if (response.type) {
						comment[model] = response.data;
					}
				},
				error: function(error) {}
			});
		},
		payType: null,
		payWarning: false,
		selectPayType: function(method) {
			comment.payType = method;
			this.previousSibling.checked = true;
			comment.payWarning = false;
		},
		submit: function() {
			if (comment.payType === null) {
				comment.payWarning = true;
				return false;
			}
			var data = {
				payType: comment.payType, 
				userName: comment.mineName, 
				userId: comment.mineID,
				teacherId: comment.teacherInfo.id,
				teacherName: comment.teacherInfo.username,
				orderType: 1,
				orderPrice: comment.teacherInfo.price,
				orderTitle: '学员'+ comment.mineName +'申请'+ comment.teacherInfo.username +'老师点评。'
			};
			comment.getData('/lessonComment/generateOrder', 'orderInfo', data, 'POST', function(response) {
				if (comment.payType) {
					location.href = '/lessonComment/scan/'+ response.data;
				} else {
					location.href = '/lessonComment/alipay/'+ response.data +'/lessonComment&buySuccess&'+ response.data;
				};
			});
		},
		//  blade模板使用的变量
		teacherID: null,
		mineName: null,
		mineID: null,
		orderID: null
	});

	return comment;

});