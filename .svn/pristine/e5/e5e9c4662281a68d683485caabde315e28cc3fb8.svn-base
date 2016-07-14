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
        getCollectionInfo : function(){
            $.ajax({
                url : '/member/getCollectionInfo',
                type : 'GET',
                dataType : 'json',
                success : function(response){
                    if(response.status){
                        collectionTeacher.realInfo = true;
                        collectionTeacher.collectionInfo = response.data;
                        collectionTeacher.total = response.total;
                    }else{
                        collectionTeacher.realInfo = false;
                        collectionTeacher.total = response.total;
                    }
                },
                error : function(error){

                }
            });
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