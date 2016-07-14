$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

//初始化验证变量
var checkUname  = false;
var checkUphone = false;
var checkUcode  = false;
var checkUpassword  = false;
var checkUrepassword  = false;
var checkUinvitecode  = true;

//用户名验证
$('.uname').blur(function(){
    var username = $('.uname').val();
    var self = $(this);
    if(!username){//为空
        $(this).parent().parent().next().html('* 请输入用户名');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUname  = false;
        return false;
    }else if (!username.match(/^[\u4E00-\u9FA5A-Za-z0-9_]{4,16}$/)) {//格式错误
        $(this).parent().parent().next().html('* 4—16位字母(不区分大小写)汉字/数字/下划线');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUname  = false;
        return false;
    }else{
        $.ajax({
            type: "post",
            url: "/index/getCheckUname",
            data:{username:username},
            async:false,
            success: function(data){
                if(data == 1){  //1用户名已被占用 ，2用户名可用
                    self.parent().parent().next().html('* 该用户名已被占用');
                    self.parent().siblings('.cuo').removeClass('hide');
                    checkUname  = false;
                    return false;
                }else{
                    checkUname = true;
                    self.parent().siblings('.dui').removeClass('hide');
                }
            }
        });
        
    }
})

// 手机号验证
$('.uphone').keyup(function(){

    $(this).parent().parent().next().html('');
    $(this).parent().siblings('.cklogo').addClass('hide');

    var phone = $('.uphone').val();
    var self = $(this);

    if(!phone){//为空
        $(this).parent().parent().next().html('* 请输入手机号');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUphone = false;
        return false;
    }else if(!phone.match(/^1(3|5|8|7){1}[0-9]{9}$/)){//格式错误
        $(this).parent().parent().next().html('* 手机号格式错误');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUphone = false;
        return false;
    }else{
        $.ajax({
            type: "post",
            url: "/index/getCheckUphone",
            data:{phone:phone},
            // async:false,
            success: function(data){
                if(data == 1){  //1手机号已被占用 ，2手机号可用
                    self.parent().parent().next().html('* 该手机号已被注册');
                    self.parent().siblings('.cuo').removeClass('hide');
                    checkUphone = false;
                    return false;
                }else{
                    checkUphone = true;
                    self.parent().siblings('.dui').removeClass('hide');
                }
            }
        });
    }
})


//获取验证码
var getMsg = function(){
    if(!checkUphone){//手机号验证没通过
        $('.uphone').trigger('keyup');
    }else{//手机号验证通过

        //获取验证码
        var phone = $('.uphone').val();
        $.ajax({
            type: "get",
            url: "/index/getMessage/"+phone,
            // async:false,
            success: function(data){
                if(data.type== true){
                    code = data.info;
                }else{
                    code = data.info;
                }
            }
        });

        //计数60s
        var countdown = 60;
        $(".getyzm").attr({ disabled: "disabled"});//重新发送按钮 不能点击
        var myTime = setInterval(function() {
            countdown--;
            $('.getyzm').html(countdown); // 通知视图模型的变化
            if(countdown == 0){
                $('.getyzm').html('重发').removeAttr("disabled");//重新发送按钮 可以点击
                clearInterval(myTime);
            }
        }, 1000);

    }
}

//验证码验证
$('.txtt').blur(function(){
    var ucode = $('.txtt').val();
    if(!ucode) {//为空
        $(this).parent().parent().next().html('* 请输入验证码');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUcode  = false;
    }else{
        if (ucode == code) {//验证码正确
            $(this).parent().siblings('.dui').removeClass('hide');
            checkUcode  = true;
        } else {//验证码错误
            $(this).parent().siblings('.cuo').removeClass('hide');
            $(this).parent().parent().next().html('* 验证码错误');
            checkUcode  = false;
        }
    }
})

//密码验证
$('.upsd').blur(function(){
    var upassword = $('.upsd').val();

    if(!upassword){//为空
        $(this).parent().parent().next().html('* 请输入密码');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUpassword  = false;
        return false;
    }else if (!upassword.match(/^[A-Za-z0-9]{6,12}$/)) {//格式错误
        $(this).parent().parent().next().html('* 6—12位数字/字母(不区分大小写)');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUpassword  = false;
        return false;
    }else{//密码格式正确
        $(this).parent().siblings('.dui').removeClass('hide');
        checkUpassword  = true;
    }
})

//确认密码 验证
$('.repsd').blur(function(){
    var repassword = $('.repsd').val();

    if(!checkUpassword){//密码验证没通过
        $('.upsd').trigger('blur');
        $(this).parent().siblings('.cuo').removeClass('hide');
        checkUrepassword  = false;
    }else{
        if(!repassword){//为空
            $(this).parent().parent().next().html('* 请输入确认密码');
            $(this).parent().siblings('.cuo').removeClass('hide');
            checkUrepassword  = false;
        }else{
            var upassword = $('.upsd').val();
            if(repassword == upassword){//确认密码一致
                $(this).parent().siblings('.dui').removeClass('hide');
                checkUrepassword  = true;
            }else{//确认密码不一致
                $(this).parent().parent().next().html('* 两次密码输入不一致，请重新输入');
                $(this).parent().siblings('.cuo').removeClass('hide');
                checkUrepassword  = false;
            }
        }
    }

})

//邀请码验证  1存在，2不存在
$('.incode').blur(function(){
    var incode = $('.incode').val();
    var self = $(this);
    if(incode){//有输入邀请码
        $.ajax({
            type: "get",
            url: "/index/getInviteCode/"+incode,
            // async:false,
            success: function(data){
                if(data == 1){
                    self.parent().siblings('.dui').removeClass('hide');
                    checkUinvitecode  = true;
                }else{
                    self.parent().parent().next().html('* 邀请码不存在');
                    self.parent().siblings('.cuo').removeClass('hide');
                    checkUinvitecode  = false;
                }
            }
        });
    }else{//没有有输入邀请码
        checkUinvitecode  = true;
    }
})


//使用协议验证
$('.deal').click(function(){
    if($('.deal').is(':checked')){
        $('.tij').removeAttr("disabled");
        $('.tij').removeClass("unclick");
    }else{
        $('.tij').attr({ disabled: "disabled"});
        $('.tij').addClass("unclick");
    }
});



//执行提交注册信息
var postcheck = function(){
    if(checkUname && checkUphone && checkUcode && checkUpassword && checkUrepassword && checkUinvitecode){
        return true;
    }else{
        review();
        return false;
    }
    //return false;                //tmp
}


//输入框获得焦点清除提示信息
$('.txt').focus(function () {
    $(this).parent().parent().next().html('');
    $(this).parent().siblings('.cklogo').addClass('hide');
});
$('.txtt').focus(function () {
    $(this).parent().parent().next().html('');
    $(this).parent().siblings('.cklogo').addClass('hide');
});

//再次检查注册信息
function review(){
    $('.uname').trigger('blur');
    $('.uphone').trigger('keyup');
    $('.txtt').trigger('blur');
    $('.upsd').trigger('blur');
    $('.repsd').trigger('blur');
    $('.incode').trigger('blur');
}