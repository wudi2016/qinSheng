//审核状态
function selectCheck(id,checkid,username,teachername,teacherPhone,orderSn){
    var id = id;
    var stateid = checkid;
    var username = username;
    var teacherPhone = teacherPhone;
    var orderSn = orderSn;
    $.ajax({
        type: "get",
        data:{'id':id,'state':stateid,'orderSn':orderSn,'username':username,'teachername':teachername},
        url: "/admin/commentCourse/commentState",

        dataType: 'json',
        success: function (res) {
            if(res.state == 0){
                $('#pupUpback2').css({'display':'block'});
                $('.actionId').val(id);
                $('.username').val(username);
                $('.toUsername').val(teachername);
            }
            if(res.state == 1){
                location.reload();//刷新页面
            }
            if(res.state == 2){
                $('#pupUpback1').css({'display':'block'});
                $('.redactionId').val(id);
                $('.redfromUsername').val(username);
                $('.redusername').val(teachername);

                $('.teacherPhone').val(teacherPhone);
                $('.orderSn').val(orderSn);
            }
        }
    });
}

$('#suer_btn0').click(function(){
    var actionId = $('.redactionId').val();
    var fromUsername = $('.redfromUsername').val();
    var username = $('.redusername').val();
    var toUsername = $('.redtoUsername').val();
    var token = $('.token').val();

    var phone = $('.teacherPhone').val();
    var orderSn = $('.orderSn').val();
    $.ajax({
        type: "post",
        data:{actionId:actionId,fromUsername:fromUsername,username:username,toUsername:toUsername,phone:phone,orderSn:orderSn,_token:token},
        url: "/admin/commentCourse/sendMessage",
        dataType: 'json',
        success: function (res) {
            location.reload();
        }
    });
    //$('#pupUpback1').css({'display':'none'});
});

//判断错误原因是否填写
//$("#errortext").keyup(function(){
//    if($('#errortext').val().length <= 10){
//        $("#errortext").css({'border':'1px solid #D6D6FF'});
//        $('#surebtn').css({'display':'block'});
//        $('#hiddenbtn').css({'display':'none'});
//    }
//});
//
//$('#hiddenbtn').click(function(){
//    if($('#errortext').val()){
//        if($('#errortext').val().length <= 10){
//            $('#surebtn').css({'display':'block'});
//            $('#hiddenbtn').css({'display':'none'});
//        }else{
//            $('#surebtn').css({'display':'none'});
//            $('#hiddenbtn').css({'display':'block'});
//        }
//    }else{
//        $('#surebtn').css({'display':'none'});
//        $('#hiddenbtn').css({'display':'block'});
//        $('#errortext').css({'border':'1px solid red'});
//    }
//
//});



//课程状态
function courseCheck(id,courseStatus){
    $.ajax({
        type: "get",
        data:{'id':id,'courseStatus':courseStatus},
        url: "/admin/commentCourse/comcourseState",

        dataType: 'json',
        success: function (res) {
            if(res == 1){
                location.reload();//刷新页面
            }
        }
    })
}
