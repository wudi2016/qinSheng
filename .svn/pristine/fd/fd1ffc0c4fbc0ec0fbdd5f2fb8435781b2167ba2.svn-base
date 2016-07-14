/**
 * Created by Mr.H on 2016/7/6.
 */
// 专题课程（学员）
define([], function () {
    var course = avalon.define({
        $id: 'courseController',
        href: '/lessonSubject/detail/',
        total: '',
        courseInfo: [],
        getCourseInfo: function (type, flag) {
            $('#page').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCourse/' + type + '/' + flag,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            if (response.status) {
                                done(response.data);
                                course.total = response.total;
                            }
                        },
                    });
                },
                pageSize: 1,
                className: "paginationjs-theme-blue",
                showGoInput: true,
                showGoButton: true,
                callback: function (data) {
                    if (data) {
                        course.courseInfo = data;
                    }

                }
            })
        }
    })
    return {
        course: course
    }
})