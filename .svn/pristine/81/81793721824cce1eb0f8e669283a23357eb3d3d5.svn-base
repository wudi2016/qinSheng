define([], function() {
	
	avalon.directive('page', {
		update: function(page) {
			var element = this.element, el = this.vmodels[0].el, count = this.vmodels[1].tabStatus ? this.vmodels[1]['commentCount'] : this.vmodels[1]['specialCount'];
			var display = function(display) {
				display ? avalon(element).css('display', 'inline-block') : avalon(element).css('display', 'none');
			}
			if (count >= 9) {
				if (el == page) {
					display(true);
				} else if (page > 4 && el >= (page - 3) && el < page) {
					display(true);
				} else if (page > 4 && el < (page + 3) && el > page) {
					display(true);
				}else if (page == 1 && el <= 7 || page <= 4 && el <= 6) {
					display(true);
				} else if (page > (count - 4) && el > (count - 4)) {
					display(true);
				} else {
					display(false);
				}
			} else {
				display(true);
			}
		}
	});

	avalon.directive('buttonhover', {
		update: function(value) {
			var element = this.element, className = '#' + avalon(element).attr('id');
			avalon(element).attr('class', 'teacherHomepage_introduce_bottom_button');
			value || avalon(element).addClass('active');
			value ? $(className).html('已关注') : $(className).html('关 注');
			$(className).unbind();
			$(className).hover(function () {
				value ? avalon(element).addClass('isFollow') : avalon(element).addClass('noFollow');
			}, function () {
				value ? avalon(element).removeClass('isFollow') : avalon(element).removeClass('noFollow');
			});
		}
	});

	avalon.directive('tabstatus', {
		update: function(value) {
			var element = this.element, status = avalon(element).attr('value');
			avalon(element).attr('class', '');
			$('div[id=tabs][value='+ avalon(element).attr('value') +']').unbind();
			if (value == status) {
				avalon(element).attr('class', 'tab_active');
			} else {
				$('div[id=tabs][value='+ avalon(element).attr('value') +']').hover(function() {
					avalon(element).addClass('tab_hover');
				}, function() {
					avalon(element).removeClass('tab_hover');
				});
			}
		}
	});

	avalon.directive('applycomment', {
		update: function(value) {
			var element = this.element, className = '.' + avalon(element).attr('class');
			value && avalon(element).addClass('active');
			$(className).unbind();
			$(className).hover(function () {
				value ? avalon(element).addClass('noFollow') : avalon(element).addClass('isFollow');
				value || $('.teacherHomepage_detail_content_applyTips').css('display', 'block');
			}, function () {
				value ? avalon(element).removeClass('noFollow') : avalon(element).removeClass('isFollow');
				value || $('.teacherHomepage_detail_content_applyTips').css('display', 'none');
			});
		}
	});

	avalon.directive('popup', {
		update: function(value) {
			var element = this.element, popUpType = avalon(element).attr('value');
	        if (!value) {
	            avalon(element).css('display', 'none');
	            return;
	        };
	        if (value == popUpType || popUpType == 'close') {
	            avalon(element).css('display', 'block');
	        } else {
	        	avalon(element).css('display', 'none');
	        };
		}
	});
	
	avalon.directive('slectfile', {
		update: function(value) {
			var vmodel = this.vmodels[0];
			$(this.element).unbind();
			$(this.element).click(function() {
				if (vmodel.uploadStatus == 2) return false;
				document.getElementById('fileDiv').innerHTML = '<input type="file" value="" class="fileButton" id="fileObject">';
				$('#fileObject').bind('change', function() {
					vmodel.file = document.getElementById('fileObject').files[0];
					document.getElementById('fileDiv').innerHTML = '';
					vmodel.uploadResource($(this).val());
					return;
				});
				$('#fileObject').click();
			});
		}
	});
});