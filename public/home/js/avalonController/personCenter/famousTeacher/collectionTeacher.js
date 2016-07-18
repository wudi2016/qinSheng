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
        getCollectionInfo : function(){
            $('#page_collection').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCollectionInfo',
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            collectionTeacher.total = response.total;
                            if (response.status) {
                                done(response.data);
                            }else{
                                collectionTeacher.collectionMsg = true;
                            }
                        },
                    });
                },
                pageSize: 6,
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
                        collectionTeacher.collectionInfo.removeAt(index);
                        collectionTeacher.total == 0 ? 0 : collectionTeacher.total--;
                        if(collectionTeacher.total == 0){
                            collectionTeacher.collectionMsg = true;
                            $('#page_collection').css('display','none');
                        }
                    }else{
                        alert('删除失败');
                    }
                },
                error : function(error){

                }
            });
        }
    })
    return {
        collectionTeacher: collectionTeacher
    }
})