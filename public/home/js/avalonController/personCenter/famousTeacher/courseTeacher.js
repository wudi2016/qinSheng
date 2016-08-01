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
                        url: '/member/getCourse/' + type + '/' + flag + '/' + this.pageNumber + '/' + this.pageSize,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            courseTeacher.total = response.total;
                            if (response.status) {
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                courseTeacher.subjectMsg = true;
                            }
                        },
                    });
                },
                getData: function (pageNumber, pageSize) {
                    var self = this;
                    $.ajax({
                        type: 'GET',
                        url: '/member/getCourse/' + type + '/' + flag + '/' + pageNumber + '/' + pageSize,
                        success: function (response) {
                            self.callback(response.data);
                        }
                    });
                },
                pageSize: 6,
                pageNumber: 1,
                totalNumber: 1,
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