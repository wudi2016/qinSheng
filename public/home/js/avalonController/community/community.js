avalon.directive('theteacheryincang', {
    update: function (value) {
        // 超出部分隐藏(名师主页)
        $('.content_introduce div').each(function(){
             //var bbb = $(this).html().length;
             //alert(bbb);
            var maxwidth=40;
            if($(this).html().length>maxwidth){
                $($(this)).html($($(this)).html().substring(0,maxwidth));
                $($(this)).html($($(this)).html()+'…');
            }
        });
    }
});


avalon.directive('newyincang', {
    update: function (value) {
        // 超出部分隐藏(新闻资讯)
        $('.new_content_font div').each(function(){
            var maxwidth=30;
            if($(this).html().length>maxwidth){
                $($(this)).html($($(this)).html().substring(0,maxwidth));
                $($(this)).html($($(this)).html()+'…');
            }
        });
    }
});


avalon.directive('xueyuan', {
    update: function (value) {
        // 超出部分隐藏(新闻资讯)
        $('.newstudent_name div').each(function(){
            var maxwidth=5;
            if($(this).html().length>maxwidth){
                $($(this)).html($($(this)).html().substring(0,maxwidth));
                $($(this)).html($($(this)).html()+'…');
            }
        });

    }
});






//图片放大(热门视频)
avalon.directive('bigimg', {
    update: function (value) {
        var element = this.element;
        var w1 = element.width;
        var h1 = element.height;
        var w2 = w1 + 40;
        var h2 = h1 + 40;
        $('.big_img').hover(function(){
            $(this).stop().animate({height: h2, width: w2, left: "-20px", top: "-20px"}, 'fast');
        },function () {
            $(this).stop().animate({height: h1, width: w1, left: "0px", top: "0px"}, 'fast');
        })
    }
});



//avalon.directive('fenye',{
//    update: function (value) {
//        $('.paginationjs-pages').mouseover(function(){
//            console.log(true);
//        })
//    }
//});




//鼠标悬浮显示(最新学员)
// avalon.directive('showhideleft',{
//     update: function (value){
//         $('.newstudent_left').mouseover(function(){
//             $('.newstudent_left_img').removeClass('hide');
//         })
//         $('.newstudent_left').mouseout(function(){
//             $('.newstudent_left_img').addClass('hide');
//         })
//     }
// });
//
// avalon.directive('showhideright',{
//     update: function (value){
//         $('.newstudent_right').mouseover(function(){
//             $('.newstudent_right_img').removeClass('hide');
//         })
//         $('.newstudent_right').mouseout(function(){
//             $('.newstudent_right_img').addClass('hide');
//         })
//     }
// });



define([],function(){

    var model = avalon.define({
        $id: 'community',
        theteacherlisturl : '/community/newdetail/',
        hotvideourl: '/community/videodetail/',
        //名师主页路由
        teacherhomepage : '/lessonComment/teacher/',
        //学员主页路由
        studenthomepage : '/lessonComment/student/',


        //名师
        theteacherlist: [],
        getteacher:function(){
            $.ajax({
                url : '/community/getteacher/',
                type : 'get',
                dataType : 'json',
                success: function(response){
                    if(response.statuss){
                        model.theteacherlist = response.data;
                    }
                },
            })
        },


        //新闻资讯
        newlist :[],
        getnewData:function(){
            $.ajax({
                url : '/community/getlist/',
                type : 'get',
                dataType : 'json',
                success: function(response){
                    if(response.statuss){
                        model.newlist = response.data;
                    }
                },
            })
        },


        //最新学员
        studentlist: [],
        getstudent:function(){

            $('#demo').pagination({
                dataSource: function(done) {
                    $.ajax({
                        type: 'GET',
                        url : '/community/getstudent/',
                        dataType : 'json',
                        success: function(response) {
                            if(response.statuss){
                                //console.log(response);
                                done(response.data);
                            }else{

                            }
                        }
                    });
                },
                pageSize: 6,
                className:"paginationjs-theme-blue",
                showPageNumbers: false,
                showNavigator: false,
                callback: function(data) {
                    if(data){
                        model.studentlist = data;
                    }

                }
            })


            //$.ajax({
            //    url : '/community/getstudent/',
            //    type : 'get',
            //    dataType : 'json',
            //    success: function(response){
            //        if(response.statuss){
            //            model.studentlist = response.data;
            //        }
            //    },
            //})
        },



        //最热视频
        hotvideo :[],
        gethotData:function(){
            $.ajax({
                url : '/community/gethotvideo/',
                type : 'get',
                dataType : 'json',
                success: function(response){
                    if(response.statuss){
                        model.hotvideo = response.data;
                    }
                },
            })
        },

    });


    model.getnewData();
    model.gethotData();
    model.getteacher();
    model.getstudent();
    return model;
});