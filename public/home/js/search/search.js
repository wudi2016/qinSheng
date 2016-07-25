// 课程样式
// $w = $('.img_big').width(); //280
// $h = $('.img_big').height();//180
// $w2 = $w + 40;
// $h2 = $h + 40;
// $('.img_big').hover(function () {
//     $(this).stop().animate({height: $h2, width: $w2, left: "-20px", top: "-20px"}, 1);
// }, function () {
//     $(this).stop().animate({height: $h, width: $w, left: "0px", top: "0px"}, 1);
// });

$('.img_big').live('mouseover',function(){
    $(this).stop().animate({height: 220, width: 320, left: "-20px", top: "-20px"}, 'fast');
})
$('.img_big').live('mouseout',function(){
    $(this).stop().animate({height: 180, width: 280, left: "0px", top: "0px"}, 'fast');
})
$('.morqian').click(function(){
    $(this).addClass('hide').next().removeClass('hide');
})
$('.selOrd').click(function(){
    $(this).addClass('gl');
    $(this).siblings().removeClass('gl');
})

function getdata(para,ord){
    $('#demo').pagination({
        dataSource: function(done) {
            $.ajax({
                type: 'GET',
                url: '/index/getCourseaa/'+para+'/'+ord,
                success: function(response) {
                    if(response.status){
                        done(response.data);
                    }else{
                        $('.nofindaa').removeClass('hide');
                    }
                }
            });
        },
        pageSize: 8,
        className:"paginationjs-theme-blue",
        showGoInput: true,
        showGoButton: true,
        callback: function(data) {
            if(data){
                var str = '';
                $.each(data,function(id,info){
                    str += "<a href='/lessonSubject/detail/"+info.id+"'><div class=\"recommend_con_con_li\" > " + "<div class=\"contain_lesson_center_data_info_top\">" + " <img src=\""+info.img+"\" width=\"280\" height=\"180\" class=\"img_big\"/> " + "</div> " + "<div class=\"contain_lesson_center_data_info_bot\">" + "<span class=\"top\">"+info.title+"</span> " + "<div class=\"center\"> " + "<span class=\"left classes\">"+info.counttime+"课时</span>" + "<span class=\"right study\">"+info.countpeople+"人学过</span> " + "</div> " + "<span class=\"bot\">￥"+info.price+"</span> " + "</div>" + "</div></a>";
                })
                $('.con_con_con_a').html(str);
            }

        }
    })
}

function getdatab(para,ord){
    $('#demob').pagination({
        dataSource: function(done) {
            $.ajax({
                type: 'GET',
                url: '/index/getCoursebb/'+para,
                success: function(response) {
                    if(response.status){
                        done(response.data);
                    }else{
                        $('.nofindbb').removeClass('hide');
                    }
                }
            });
        },
        pageSize: 8,
        className:"paginationjs-theme-blue",
        showGoInput: true,
        showGoButton: true,
        callback: function(data) {
            if(data){
                var str = '';
                $.each(data,function(id,info){
                    str += "<a href='/lessonComment/detail/"+info.id+"'><div class=\"recommend_con_con_li\" > " + "<div class=\"contain_lesson_center_data_info_top\">" + " <img src=\""+info.img+"\" width=\"280\" height=\"180\" class=\"img_big\"/> " + "</div> " + "<div class=\"contain_lesson_center_data_info_bot\">" + "<span class=\"top\">"+info.title+"</span> " + "<div class=\"center\"> " + "<span class=\"leftt\">讲师 : "+info.teacher+"</span>" + "<span class=\"right study\">"+info.countpeople+"人学过</span> " + "</div> " + "<span class=\"bot\">￥"+info.price+"</span> " + "</div>" + "</div></a>";
                })
                $('.con_con_con_b').html(str);
            }

        }
    })
}

var morecourse = function(para){
    if(para == 1){
        $('.bb').addClass('hide');
        $('.pageaa').removeClass('hide');
    }else{
        $('.aa').addClass('hide');
        $('.pagebb').removeClass('hide');
    }

}

var ord = 0;

if(searchVal){
    getdata(searchVal,ord);
    getdatab(searchVal,ord);
}else{
    $('.nofindaa').removeClass('hide');
    $('.nofindbb').removeClass('hide');
}

var sel = function(type,ord){
    if(type == 1){
        getdata(searchVal,ord);
    }else{
        getdatab(searchVal,ord);
    }
}

