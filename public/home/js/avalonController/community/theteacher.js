avalon.directive('theteacheryincang', {
    update: function (value) {
        // 超出部分隐藏
        $('.content_introduce div').each(function(){
            var maxwidth=130;
            if($(this).html().length>maxwidth){
                $($(this)).html($($(this)).html().substring(0,maxwidth));
                $($(this)).html($($(this)).html()+'…');
            }
        });

    }
});



define([],function(){

    var model = avalon.define({
        $id : 'theteacher',
        //名师主页路由
        teacherhomepage : '/lessonComment/teacher/',
        Yes: false,
        No:false,
        //名师
        theteacherlist: [],
        gettheteacher:function(type){
             model.Yes = false;
             model.No = false;
             $('#page').pagination({
                 dataSource: function(done) {
                     $.ajax({
                         type: 'GET',
                         url : '/community/gettheteacher/'+type+'/'+this.pageNumber+'/'+this.pageSize,
                         //dataType : 'json',
                         success: function(response) {
                             if(response.statuss){
                                 var format = [];
                                 format['data'] = response.data;
                                 format['totalNumber'] = response.count;
                                 done(format);
                                 //done(response.data);
                                 model.Yes = true;
                             }else{
                                 //console.log(response);
                                 model.No = true;
                             }
                         }
                     });
                 },

                 getData: function(pageNumber,pageSize) {
                     var self = this;
                     $.ajax({
                         type: 'GET',
                         url: '/community/gettheteacher/'+type+'/'+pageNumber+'/'+pageSize,
                         success: function(response) {
                             self.callback(response.data);
                         }
                     });
                 },

                 pageSize: 8,
                 pageNumber :1,
                 totalNumber :1,
                 className:"paginationjs-theme-blue",
                 showGoInput: true,
                 showGoButton: true,
                 callback: function(data) {
                     if(data){
                         model.theteacherlist = data;
                     }

                 }
             })
     


        },

        tabs:function(type){
            if (type == 'tabss') {
                model.gettheteacher(0);
            }else if (type == 'A') {
                $('.A').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'B') {
                $('.B').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'C') {
                $('.C').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'D') {
                $('.D').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'E') {
                $('.E').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'F') {
                $('.F').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'G') {
                $('.G').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'H') {
                $('.H').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'I') {
                $('.I').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'J') {
                $('.J').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'K') {
                $('.K').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'L') {
                $('.L').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'M') {
                $('.M').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'N') {
                $('.N').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'O') {
                $('.O').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'P') {
                $('.P').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'Q') {
                $('.Q').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'R') {
                $('.R').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'S') {
                $('.S').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'T') {
                $('.T').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'U') {
                $('.U').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'V') {
                $('.V').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'W') {
                $('.W').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'X') {
                $('.X').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'Y') {
                $('.Y').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'Z') {
                $('.Z').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == 'tabss') {
                $('.tabss').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }
        }

    });
    return model.gettheteacher(0);
    return model;
});