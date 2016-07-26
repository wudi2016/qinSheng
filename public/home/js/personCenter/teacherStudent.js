$(function(){

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    //个人中心选项卡切换
    $(".account_common").click(function(){
        $(this).addClass('blue_common');
        $(this).siblings().removeClass('blue_common');
    })



    //url定位选项卡
    var href = location.href.split('/');
    var url = '';
    //学员
    if(href[4] == 'student') {
        if(href[6]) {
            url = href[6];
        }else {
            url = 'basicInfo';
        }

    }else if(href[4] == 'famousTeacher') {
        if( href[5] ) {
            url = href[5];
        }else {
            url = 'basicInfo';
        }
    }

    //console.log(url);
    $("div[name='"+url+"']").addClass('blue_common');
    $("div[name='"+url+"']").siblings().removeClass('blue_common');



    //hover
    $(".account_common").hover(
        function () {
            $(this).addClass("active_hover").prev('span').addClass('span_active');
        },
        function () {
            $(this).removeClass("active_hover").prev('span').removeClass('span_active');

        });
    //学员我的订单-- select-block

    if ($('.bot select').css('display') == 'none') {
        setTimeout(function () {
            $('.bot_span_last').css('display','block');
            $('.bot_span_last').html('请选择退款原因');
        }, 2500);
        setTimeout(function () {
            $('.bot select').css('display','block');
        }, 2500);
    };

    $(".bot select").change(function(){
        $(this).prev().prev().html($(this).find("option:selected").text());
        if($(this).find("option:selected").text() == '其他'){
            $('.last').removeClass('hide');
        }else{
            $('.last').addClass('hide');
        }

   });

    //上下三角切换
    $('.bot select').click(function(){
        //console.log($(this).prev().prev().html());
        //if($(this).find("option:selected")){
        //    $(this).prev().prev().removeClass('bot_span_triangle2');
        //    $(this).prev().prev().addClass('bot_span_triangle1');
        //}
        if($(this).prev().prev().hasClass('bot_span_triangle2')){
            $(this).prev().prev().removeClass('bot_span_triangle2').addClass('bot_span_triangle1');
        }else{
            $(this).prev().prev().removeClass('bot_span_triangle1').addClass('bot_span_triangle2');
        }
    })

    //修改切换
    $(".center_right_phone_button").click(function(){
        $(this).parent().css('display','none');
    })

    //修改手机号 下一步操作
    // $("button[name='clickBtn']").click(function(){
    //    $(".right_checkPhone_third div:first-child").next().addClass('bottom_line_blue').siblings().removeClass('bottom_line_blue');
    // })
    // $("button[name='clickBtn1']").click(function(){
    //     $(".right_checkPhone_third div:last-child").addClass('bottom_line_blue').siblings().removeClass('bottom_line_blue');
    // })


    //最新--热门
    $(".right_count_right span").click(function(){
        $(this).addClass('count_right_mostNew').removeClass('count_right_hot').siblings().addClass('count_right_hot').removeClass('count_right_mostNew');
    })

    //删除收藏--完成
    $('.right_count_right div .count_right_store').click(function(){
        $(this).css('display','none').siblings().css('display','inline-block');
        if($(this).html() !== '完成'){
            $(".comment_repeat_img span").css('display','block');
        }else{
            $(".comment_repeat_img span").css('display','none');

        }
    })


    //学员问好提示框
    $(".invite_img_doubt img").hover(
        function () {
            $(".invite_img_prompt").css('display','block');
        },
        function () {
            $(".invite_img_prompt").css('display','none');

        })


    //头像编辑框 显示
    $('.right_head_img_upload').click(function(){
        $('.headImg').removeClass('hide');
    });

    $('.headImg_tit_r').click(function(){
        $('.headImg').addClass('hide');
    })

    //头像上传
    var uploadify_onSelectError = function(file, errorCode, errorMsg) {
        var msgText = "上传失败\n";
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.QUEUE_LIMIT_EXCEEDED:
                //this.queueData.errorMsg = "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                msgText += "每次最多上传 " + this.settings.queueSizeLimit + "个文件";
                break;
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                msgText += "文件大小超过限制( " + this.settings.file_size_limit + " )";
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                msgText += "文件大小为0";
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                msgText += "文件格式不正确，仅限 " + this.settings.file_types;
                break;
            default:
                msgText += "错误代码：" + errorCode + "\n" + errorMsg;
        }
        alert(msgText);
    };


    //上传头像
    var img = '';
    var imgb = '';
    var imgc = '';

    var x = 0;
    var y = 0;
    var w = 0;
    var h = 0;

    var imgsrc = '';

    $('#file_upload').uploadify({
        'swf'      : '/home/css/personCenter/uploadify.swf',
        'uploader' : '/member/addImg',
        'buttonText' : '选择图片',
        'post_params' : {
            '_token' : $('meta[name="csrf-token"]').attr('content')
        },
        'file_size_limit' : '5MB',
        'file_types' : " *.jpg;*.png;*.jpeg;*.bmp;*.pdf;*.ico;*.gif ",
        'overrideEvents'  : ['onSelectError'],
        'onSelectError' : uploadify_onSelectError,
        'onUploadSuccess' : function(file, data, response) {
            var data = eval("("+data+")");
            imgsrc = data.src;
            img = "<img id=\"imghead\" src='"+data.src+"'>";
            imgb ="<img id=\"preview\" src='"+data.src+"'>";
            imgc ="<img id=\"preview2\" src='"+data.src+"'>";
            $('#imgs').html(img);
            $('#imgsb').html(imgb);
            $('#imgsc').html(imgc);

            w = 0;
            cutImg(data.width,data.height);
        }
    });
    
    function cutImg(boundx,boundy){

        jQuery('#imghead').Jcrop({
            aspectRatio: 1,
            onSelect: showPreview, //选中区域时执行对应的回调函数
            onChange: showPreview, //选择区域变化时执行对应的回调函数
        });

        function showPreview(coords)
        {
            var rx = 60 / coords.w;
            var ry = 60 / coords.h;
            var rx2 = 100 / coords.w;
            var ry2 = 100 / coords.h;
            
            $('#preview').css({
                width: Math.round(rx * boundx) + 'px',
                height: Math.round(ry * boundy) + 'px',
                marginLeft: '-' + Math.round(rx * coords.x) + 'px',
                marginTop: '-' + Math.round(ry * coords.y) + 'px'
            });

            $('#preview2').css({
                width: Math.round(rx2 * boundx) + 'px',
                height: Math.round(ry2 * boundy) + 'px',
                marginLeft: '-' + Math.round(rx2 * coords.x) + 'px',
                marginTop: '-' + Math.round(ry2 * coords.y) + 'px'
            });
            
            //jQuery('#x').val(coords.x); //选中区域左上角横
            //jQuery('#y').val(coords.y); //选中区域左上角纵坐标
            //jQuery("#x2").val(coords.x2); //选中区域右下角横坐标
            //jQuery("#y2").val(coords.y2); //选中区域右下角纵坐标
            //jQuery('#w').val(coords.w); //选中区域的宽度
            //jQuery('#h').val(coords.h); //选中区域的高度

            x = coords.x;
            y = coords.y;
            w = coords.w;
            h = coords.h;

        }


    }

    function checkCoords()
    {
        if (w>0) return true;
        alert('请选择需要裁切的图片区域.');
        return false;
    }

    $('.saveImg').click(function(){
        if(checkCoords()){
            $.ajax({
                type: "post",
                url: "/member/cutImg",
                data:{imgsrc:imgsrc,x:x,y:y,w:w,h:h},
                async:false,
                success: function(data){
                    if(data == 1){
                        //history.go(0);
                        location.reload();
                    }else{
                        alert('修改失败');
                    }
                }
            });
        }
    })

})

//地址选择
$(".province").select2({
    ajax: {
        url: "/index/getProvince",
        type:'get',
        dataType:'json',
        processResults: function (data) {
            return {
                results: data
            };
        },
//            cache: true
    },

});

var getCity = function(code){
    $(".city").select2({
        ajax: {
            url: "/index/getCity/"+code,
            type:'get',
            dataType:'json',
            processResults: function (data) {
                return {
                    results: data
                };
            },
        },

    });
}


/*---- 修改密码----*/
var checkPsd    = false;
var checkNewPsd = false;
var checkRePsd  = false;


// 检查密码
function checkPassword(){
    var upassword = $('.unowPsd').val();
    if(!upassword){
        $('.msga').html('*请输入密码');
        checkPsd = false;
    }else{
        $.ajax({
            type: "post",
            url: "/member/checkPassword",
            data:{password:upassword},
            async:false,
            success: function(data){ //1 密码正确 2密码错误
                if(data == 2){
                    $('.msga').html('*密码错误');
                    checkPsd = false;
                }else{
                    checkPsd = true;
                }
            }
        });
    }
}


//检查新密码
function checkNewPassword(){
    var upassword = $('.unewPsd').val();
    if(!upassword){
        $('.msgb').html('*请输入新密码');
        checkNewPsd = false;
    }else if(!upassword.match(/^[A-Za-z0-9]{6,12}$/)){
        $('.msgb').html('*6—12位数字/字母(不区分大小写');
        checkNewPsd = false;
    }else{
        checkNewPsd = true;
    }
}
//检查确认密码
function checkConfirmPsd(){
    var upassword = $('.unewPsd').val();
    var uRepassword = $('.urePsd').val();
    if(!uRepassword){
        $('.msgc').html('*请输入确认密码');
        checkRePsd = false;
    }else if(upassword != uRepassword){
        $('.msgc').html('*两次密码输入不一致');
        checkRePsd = false;
    }else{
        checkRePsd = true;
    }
}

var postcheck = function(){
    checkPassword();
    checkNewPassword();
    checkConfirmPsd();
    if(checkPsd && checkNewPsd && checkRePsd){
        return true;
    }else{
        return false;
    }
}

$('.txtt').focus(function () {
    $(this).next().html('');
});
//编辑结果显信息提示示框
window.onload = function(){$(".editResInfo").slideUp(2500)};

