avalon.directive('theteacheryincang', {
    update: function (value) {
        // 超出部分隐藏
        $('.content_introduce div').each(function(){
            var maxwidth=80;
            if($(this).text().length>maxwidth){
                $($(this)).text($($(this)).text().substring(0,maxwidth));
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

        //名师
        theteacherlist: '',
        gettheteacher:function(type){
            $.ajax({
                url : '/community/gettheteacher/'+type,
                type : 'get',
                dataType : 'json',
                success: function(response){
                    if(response.statuss){
                        model.theteacherlist = response.data;
                    }else{
                        model.theteacherlist = [];
                    }
                },
            })
        },

        tabs:function(type){
            if (type == '0') {
                model.gettheteacher(type);
            }else if (type == '1') {
                $('.a').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '2') {
                $('.b').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '3') {
                $('.c').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '4') {
                $('.d').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '5') {
                $('.e').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '6') {
                $('.f').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '7') {
                $('.g').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '8') {
                $('.h').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '9') {
                $('.i').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '10') {
                $('.j').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '11') {
                $('.k').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '12') {
                $('.l').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '13') {
                $('.m').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '14') {
                $('.n').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '15') {
                $('.o').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '16') {
                $('.p').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '17') {
                $('.q').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '18') {
                $('.r').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '19') {
                $('.s').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '20') {
                $('.t').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '21') {
                $('.u').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '22') {
                $('.v').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '23') {
                $('.w').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '24') {
                $('.x').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '25') {
                $('.y').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }else if (type == '26') {
                $('.z').addClass('bluebackground').siblings().removeClass('bluebackground');
                model.gettheteacher(type);
            }

        }

    });
    return model.gettheteacher(0);
    return model;
});