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
					if (model == 'orderInfo') {
						callback(response);
						return;
					};
					if (response.type) comment[model] = response.data;
				},
				error: function(error) {
					alert('数据请求失败');
				}
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
				//	模拟
				orderPrice: comment.teacherInfo.price, 
				status: 0,
				payPrice: comment.teacherInfo.price, 
				orderTitle: '测试订单_' + new Date().getTime()
			};
			comment.getData('/lessonComment/generateOrder', 'orderInfo', data, 'POST', function(response) {
				location.href = '/lessonComment/buySuccess/' + response.data;
			});
		}
	});

	return comment;

});