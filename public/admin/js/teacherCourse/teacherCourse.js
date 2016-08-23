//审核状态
function selectCheck(id,checkid,userId,username,teachername,studentPhone,orderSn){
    var id = id;
    var stateid = checkid;
    $.ajax({
        type: "get",
        data:{'id':id,'state':stateid,'orderSn':orderSn,'username':username,'userId':userId,'teachername':teachername},
        url: "/admin/commentCourse/teacherState",

        dataType: 'json',
        success: function (res) {
            if(res.state == 0){
                $('#pupUpback2').css({'display':'block'});
                $('.actionId').val(id);
                $('.username').val(teachername);
                $('.toUsername').val(username);
            }
            if(res.state == 1){
                location.reload();//刷新页面
            }
            if(res.state == 2){
                $('#pupUpback1').css({'display':'block'});
                $('.redactionId').val(id);
                $('.redfromUsername').val(teachername);
                $('.redusername').val(username);
                $('.reduserId').val(userId);

                $('.redstudentPhone').val(studentPhone);
                $('.redorderSn').val(orderSn);
            }
        }
    });
}

$('#suer_btn0').click(function(){
    var actionId = $('.redactionId').val();
    var fromUsername = $('.redfromUsername').val();
    var userId = $('.reduserId').val();
    var username = $('.redusername').val();
    var toUsername = $('.redtoUsername').val();
    var token = $('.token').val();

    var phone = $('.redstudentPhone').val();
    var orderSn = $('.redorderSn').val();
    $.ajax({
        type: "post",
        data:{actionId:actionId,fromUsername:fromUsername,userId:userId,username:username,toUsername:toUsername,phone:phone,orderSn:orderSn,_token:token},
        url: "/admin/commentCourse/sendStudentMessage",
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
        url: "/admin/commentCourse/teaccourseState",

        dataType: 'json',
        success: function (res) {
            if(res == 1){
                location.reload();//刷新页面
            }
        }
    })
}
