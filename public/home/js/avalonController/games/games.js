define([], function () {

    var games = avalon.define({
        $id: 'games',
        datas: [],
        Msg: false,
        Con: false,
        getdata:function(para){
            games.Msg = false;
            games.Con = false;
            $('#page').pagination({
                dataSource: function(done) {
                    $.ajax({
                        type: 'GET',
                        url: '/index/getgames/'+para,
                        success: function(response) {
                            if(response.status){
                                done(response.data);
                                games.Con = true;
                            }else{
                                games.Msg = true;
                            }
                        }
                    });
                },
                pageSize: 7,
                className:"paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function(data) {
                    if(data){
                        games.datas = data;
                    }

                }
            })
        }
    });

    games.getdata(1);

});


