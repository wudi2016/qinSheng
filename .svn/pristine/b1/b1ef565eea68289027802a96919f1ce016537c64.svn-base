define([], function () {
    var hotId = location.href.split('/').pop();
    var model = avalon.define({
        $id: 'hotvideo',

        hotvideos :'',
        getData:function(hotId){
            $.ajax({
                url : '/community/getvideodetail/'+ hotId,
                type : 'get',
                dataType : 'json',
                success: function(response){
                    if(response.statuss){
                        model.hotvideos = response.data;
                    }
                },
            })
        },

    });
    model.getData(hotId);
    return model;
});