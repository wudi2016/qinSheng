/**
 * Created by Mr.H on 2016/7/5.
 */
define([], function () {
    // 我的收藏
    var collection = avalon.define({
        $id: 'collectionController',
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
                        collection.realInfo = true;
                        collection.collectionInfo = response.data;
                        collection.total = response.total;
                    }else{
                        collection.realInfo = false;
                        collection.total = response.total;
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
                data : { id : collectId, type : type, courseId : courseId},
                dataType : 'json',
                success : function(response){
                    if(response.status){
                        collection.collectionInfo.removeAt(index);
                        collection.total == 0 ? 0 : collection.total--;
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
        collection: collection
    }
})