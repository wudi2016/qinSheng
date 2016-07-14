define([], function() {
    var detail = avalon.define({
        $id: "specialcommentdetail",
        info: [],
        popup:false,
        commentdetailpop:function(id){
            detail.popup = true;
            $.ajax({
                type: "get",
                url: "/admin/specialCourse/detailSpecialCourse/" + id,

                dataType: 'json',
                success: function (result) {
                    if(result.code){
                        detail.info = result.data;
                    }
                }
            });
        },
        deldetail:function(){
            detail.popup = false;
        },

        //课程类型为打折时出现折扣
        watchSelect:false,
        discountPrice:'',//折扣后价钱
        typeSelect:function(id,coursePrice){
            detail.discountPrice = coursePrice * 0.9;
            if(id == 1){
                detail.watchSelect = true;
            }else{
                detail.watchSelect = false;
            }
        },

        //选择折扣
        discountSelect:function(discountid,coursePrice){
            detail.discountPrice = coursePrice * (discountid/10);
        }
    })

    return detail;

})