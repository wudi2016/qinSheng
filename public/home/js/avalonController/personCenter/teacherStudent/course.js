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
        subjectMsg : false,
        getCourseInfo: function (type, flag) {
            $('#page_course').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCourse/' + type + '/' + flag,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            course.total = response.total;
                            if (response.status) {
                                done(response.data);
                            }else{
                                course.subjectMsg = true;
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