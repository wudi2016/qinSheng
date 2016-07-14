define([], function() {
    var detail = avalon.define({
        $id: "addChapter",
        chapter:false,
        section:false,
        or:false,
        select:function(id){
            if(id == 1){
                detail.chapter = true;
                detail.section = false;
                detail.or = true;
            }else if(id == 2){
                detail.section = true;
                detail.chapter = false;
                detail.or = true;
            }else{
                detail.section = false;
                detail.chapter = false;
                detail.or = false;
            }
        },

    })

    return detail;

})