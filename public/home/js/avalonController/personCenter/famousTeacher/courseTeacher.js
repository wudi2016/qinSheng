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
        subjectMsg : false,
        getCourseInfo: function (type,flag) {
            $('#page_course').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCourse/' + type + '/' + flag,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            courseTeacher.total = response.total;
                            if (response.status) {
                                done(response.data);
                            }else{
                                courseTeacher.subjectMsg = true;
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