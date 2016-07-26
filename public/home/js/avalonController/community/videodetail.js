define([], function () {
    var hotId = location.href.split('/').pop();
    var model = avalon.define({
        $id: 'hotvideo',

        hotvideos :[],
        getData:function(hotId){
            $.ajax({
                url : '/community/getvideodetail/'+ hotId,
                type : 'get',
                dataType : 'json',
                success: function(response){
                    if(response.statuss){
                        model.hotvideos = response.data;
                    }
                    var data = response.data;
                    model.setVideo(data);
                },
            })

        },


        setVideo:function(data){
            jwplayer("mediaplayer").setup({
                flashplayer: 'jwplayer/jwplayer.flash.swf',
                file:data[0].coursePath,
                height:515,
                width:800,
                aspectratio: '16:9',
                type: "mp4",
                image:data[0].cover,
            });
            //console.log(data);

        },
    });

    model.getData(hotId);
    //model.setVideo();
    return model;
});