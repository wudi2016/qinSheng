define([], function() {
    var detail = avalon.define({
        $id: "specialcommentdetail",

        //添加课程时课程类型为打折时出现折扣
        watchSelect:false,
        discountPrice:'',//折扣后价钱
        typeSelect:function(id,coursePrice){
            detail.discountPrice = Math.round(coursePrice * 0.9);
            if(id == 1){
                detail.watchSelect = true;
            }else{
                detail.watchSelect = false;
            }
        },

        //选择折扣
        discountSelect:function(discountid,coursePrice){
            detail.discountPrice = Math.round(coursePrice * (discountid/10));
        },


    })

    $("input[name='coursePrice']").change(function(){
        var aa = $('#zhekou').val();
        var price = $(this).val();
        detail.discountPrice = price * (aa / 10);
    })

    //进入编辑页默认是打折课程类型时显示折扣和折扣后价钱
    var coursetype = $('#coursetype').val();
    if(coursetype == 1){
        detail.watchSelect = true;
        var aa = $('#zhekou').val();
        var price = $("input[name='coursePrice']").val();
        console.log(aa);
        console.log(price);
        detail.discountPrice = price * (aa / 10);
    }

    return detail;

})