define([], function () {
    //首页最外层模块
    avalon.define({
        $id: 'index',
    });

    //名师介绍模块
    var teachers  = avalon.define({
        $id: 'teachers',
        datas: '',
        getData:function(){
            $.ajax({
                type: "get",
                url: "/index/getteachers",
                success: function(data){
                    if(data.status){
                        teachers.datas = data.data;
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){

                }
            });
        }
    });
    teachers.getData();

    //专题课程模块
    var ztlessons  = avalon.define({
        $id: 'ztlessons',
        datas: '',
        getData:function(){
            $.ajax({
                type: "get",
                url: "/index/getSpecialLessons",
                success: function(data){
                    if(data.status){
                        ztlessons.datas = data.data;
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){

                }
            });
        }
    });
    ztlessons.getData();

    //点评课程模块
    var dplessons  = avalon.define({
        $id: 'dplessons',
        datas: '',
        getData:function(){
            $.ajax({
                type: "get",
                url: "/index/getCommentlLessons",
                success: function(data){
                    if(data.status){
                        dplessons.datas = data.data;
                    }
                },
                error:function(XMLHttpRequest, textStatus, errorThrown){

                }
            });
        }
    });
    dplessons.getData();
});