/**
 * Created by Mr.H on 2016/7/6.
 */
// 专题课程（名师）
define([], function () {
    var courseTeacher = avalon.define({
        $id: 'courseTeacherController',
        href: '/lessonSubject/detail/',
        total: '',
        courseInfo: [],
        getCourseInfo: function (type,flag) {
            $.ajax({
                url: '/member/getCourse/' + type + '/' + flag,
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    if (response.status) {
                        courseTeacher.total = response.total;
                        courseTeacher.courseInfo = response.data;
                    } else {
                        courseTeacher.total = response.total;
                        courseTeacher.courseInfo = [];
                    }
                },
                error: function (error) {

                }
            })
        }
    })
//courseTeacher.getCourseInfo(2);
    return {
        courseTeacher: courseTeacher
    }
})