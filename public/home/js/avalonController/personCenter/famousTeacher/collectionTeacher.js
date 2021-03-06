/**
 * Created by Mr.H on 2016/7/5.
 */
define([], function () {
    // 我的收藏
    var collectionTeacher = avalon.define({
        $id: 'collectionTeacherController',
        pageInfo : {
            deletePic : '/home/image/personCenter/delete.png'
        },
        realInfo : false,
        total: '',
        collectionInfo : [],
        collectionMsg : false,
        display: true,
        isShow: false,
        getCollectionInfo : function(){
            $('#page_collection').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCollectionInfo/' + this.pageNumber + '/' + this.pageSize,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            collectionTeacher.total = response.total;
                            if (response.status) {
                                if(response.total <= 6){
                                    collectionTeacher.display = false;
                                }
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                collectionTeacher.collectionInfo = [];
                                collectionTeacher.collectionMsg = true;
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'GET',
                        url: '/member/getCollectionInfo/' + pageNumber + '/' + pageSize,
                        success: function (response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 6,
                pageNumber: 1,
                totalNumber: 1,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        collectionTeacher.collectionInfo = data;
                    }

                }
            })
        },
        deleteCollection : function(collectId,type,courseId,index){
            $.ajax({
                url : '/member/deleteCollection',
                type : 'POST',
                data :  { id : collectId, type : type, courseId : courseId},
                dataType : 'json',
                success : function(response){
                    if(response.status){
                        collectionTeacher.getCollectionInfo();
                    }else{
                        alert('删除失败');
                    }
                },
                error : function(error){

                }
            });
        },
        changeStatus: function(value){
            collectionTeacher.isShow = value;
        }
    })
    return {
        collectionTeacher: collectionTeacher
    }
})