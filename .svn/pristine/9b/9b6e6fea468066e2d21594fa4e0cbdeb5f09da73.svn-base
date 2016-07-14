/**
 * Created by Mr.H on 2016/7/7.
 */
// 讲师信息
    define([],function(){
        var teacherInfo = avalon.define({
            $id: 'teacherInfoController',
            teacherInfo: [],
            getTeacherInfo: function (id) {
                $.ajax({
                    type: "get",
                    dataType: 'json',
                    url: "/lessonSubject/getTeacherInfo/" + id,
                    success: function (response) {
                        response.status ? teacherInfo.teacherInfo = response.data : teacherInfo.teacherInfo = '';
                    },
                    error: function () {}
                })
            }
        })
        return teacherInfo;
    })
