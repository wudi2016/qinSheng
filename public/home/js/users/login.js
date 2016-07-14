$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});

var postcheck = function(){

    var username = $('.uname').val();
    var password = $('.psd').val();

    if(!username){
        $('.errorMsg').html('* 请输入用户名或手机号！');
        return false;
    }else if(!password){
        $('.errorMsg').html('* 请输入密码！');
        return false;
    }else{
        $.ajax({
            type: "post",
            url: "/index/getCheckRes",
            data:{username:username,password:password},
            async:false,
            success: function(data){  //1 账号不存在，2正确登陆，3密码错误
                if(data == 1){
                    $('.errorMsg').html('* 您输入的账号不存在！');
                    window.event.returnValue = false;
                    return false;
                }else if(data == 3){
                    $('.errorMsg').html('* 您输入的密码错误！');
                    window.event.returnValue = false;
                    return false;
                }else if(data == 2){
                    return true;
                }
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){
                $('.errorMsg').html('* 未知错误，请重新尝试！');
                window.event.returnValue = false;
                return false;
            }
        });
    }
    //return false;                //tmp
}


$('.txt').focus(function () {
    $('.errorMsg').html('');
});


