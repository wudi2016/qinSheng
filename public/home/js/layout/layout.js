$.ajaxSetup({
	headers: {
		'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
	}
});
// 导航栏
    //鼠标悬停
	$('.head_con_li_con').hover(
		function(){
			$(this).parent().addClass('hov')
		},
		function(){
			$('.head_con_li').removeClass('hov')
		}
	)
	//鼠标点击
	// $('.head_con_li_con').click(function(){
	// 	$(this).addClass('sel');
	// })

// 头像个人信息
$('.touxiang').click(function(){
	$(".persapce").stop().slideToggle("slow");
})

// 咨询
$('.qq').hover(function(){
	$(this).children(".mmsg").removeClass('hide');
},function(){
	$('.mmsg').addClass('hide');
})
$('.wx').hover(function(){
	$(this).children(".mmsg").removeClass('hide');
},function(){
	$('.mmsg').addClass('hide');
})
$('.tel').hover(function(){
	$(this).children(".mmsg").removeClass('hide');
},function(){
	$('.mmsg').addClass('hide');
})
$('.eml').hover(function(){
	$(this).children(".mmsg").removeClass('hide');
},function(){
	$('.mmsg').addClass('hide');
})


$('.mmsg').mouseover(function(){
	$(this).removeClass('hide');
})
$('.mmsg').mouseout(function(){
	$(this).addClass('hide');
})

// 底部联系方式
$('.lxlogoa').hover(function(){
	$('.lxfsa').removeClass('hide');
},function(){
	$('.lxfsa').addClass('hide');
})
$('.lxlogob').hover(function(){
	$('.lxfsb').removeClass('hide');
},function(){
	$('.lxfsb').addClass('hide');
})

var url = window.location.href.split('/');
switch (url[3]) {
	case '':
		url = 'index';
		break;
	case 'index':
		url = 'index';
		break;
	case 'lessonSubject':
		url = 'lessonSubject';
		break;
	case 'community':
		url = 'community';
		break;
	case 'aboutUs':
		url = 'aboutUs';
		break;
}
$('.'+url).addClass('sels');


