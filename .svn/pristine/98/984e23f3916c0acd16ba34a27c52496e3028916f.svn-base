/**
 * Created by Mr.H on 2016/7/7.
 */
// 目录信息
    define([],function(){
        var catalogInfo = avalon.define({
            $id: 'catalogInfoController',
            catalogInfo: [],
            getCatalogInfo: function (id) {
                $.ajax({
                    url: '/lessonSubject/getCatalogInfo/' + id,
                    type: 'get',
                    datatype: 'json',
                    success: function (response) {
                        if (response.status) {
                            catalogInfo.catalogInfo = response.data;
                        }
                    }
                })
            }
        })
        return catalogInfo;
    })
