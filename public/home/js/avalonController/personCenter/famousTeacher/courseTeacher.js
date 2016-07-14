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
            $('#page_course').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCourse/' + type + '/' + flag,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            if (response.status) {
                                done(response.data);
                                courseTeacher.total = response.total;
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
                        courseTeacher.courseInfo = data;
                    }

                }
            })
        }
    })
//courseTeacher.getCourseInfo(2);
    return {
        courseTeacher: courseTeacher
    }
})