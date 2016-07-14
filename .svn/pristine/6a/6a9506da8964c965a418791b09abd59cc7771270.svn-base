define([], function (){
	var model = avalon.define({

		$id: 'aboutus',

		isshowbox: true,
		currentIndex: 1,
		tabs: function(index){
			model.currentIndex = index;
			if(index == 1){
				$('.us1').addClass('intro').siblings().removeClass('intro');
			}else if(index == 2){
				$('.us2').addClass('intro').siblings().removeClass('intro');
			}else if(index == 3){
				$('.us3').addClass('intro').siblings().removeClass('intro');
			}else if(index == 4){
				$('.us4').addClass('intro').siblings().removeClass('intro');
			}else if(index == 5){
				$('.us5').addClass('intro').siblings().removeClass('intro');
			}else if(index == 6){
				$('.us6').addClass('intro').siblings().removeClass('intro');
			}
		},

		//公司介绍
		aboutus1 : '',
        getData1:function(){

				 $.ajax({
					 url : '/aboutUs/getListone/' ,
					 type : 'get',
					 dataType : 'json',
					 success: function(response){
						 if(response){
							 model.aboutus1 = response.data;
						 }
					 },
				 })
        },

		//联系我们
		aboutus2 : '',
		getData2:function(){

			$.ajax({
				url : '/aboutUs/getListtwo/' ,
				type : 'get',
				dataType : 'json',
				success: function(response){
					if(response){
						model.aboutus2 = response.data;
					}
				},
			})
		},

		//常见问题
		aboutus3 : '',
		getData3:function(){

			$.ajax({
				url : '/aboutUs/getListthree/' ,
				type : 'get',
				dataType : 'json',
				success: function(response){
					if(response){
						model.aboutus3 = response.data;
					}
				},
			})
		},


		//用户协议
		aboutus4 : '',
		getData4:function(){

			$.ajax({
				url : '/aboutUs/getListfour/' ,
				type : 'get',
				dataType : 'json',
				success: function(response){
					if(response){
						model.aboutus4 = response.data;
					}
				},
			})
		},


		//友情链接
		aboutus5 : '',
		linkurl : 'http://',
		getData5:function(){

			$.ajax({
				url : '/aboutUs/getListfive/' ,
				type : 'get',
				dataType : 'json',
				success: function(response){
					if(response){
						model.aboutus5 = response.data;
					}
				},
			})
		},


		//意见反馈
		aboutus6 : '',
		getData6:function(){

			$.ajax({
				url : '/aboutUs/getListsix/' ,
				type : 'get',
				dataType : 'json',
				success: function(response){
					if(response){
						model.aboutus6 = response.data;
					}
				},
			})
		},


	});
	model.getData1();
	model.getData2();
	model.getData3();
	model.getData4();
	model.getData5();
	model.getData6();
	return model;
});