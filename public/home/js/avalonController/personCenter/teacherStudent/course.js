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
        display: true,
        getCourseInfo: function (type, flag) {
            $('#page_course').pagination({
                dataSource: function (done) {
                    $.ajax({
                        url: '/member/getCourse/' + type + '/' + flag + '/' + this.pageNumber + '/' + this.pageSize,
                        type: 'GET',
                        dataType: 'json',
                        success: function (response) {
                            course.total = response.total;
                            if (response.status) {
                                if(response.total <= 6){
                                    course.display = false;
                                }
                                var format = [];
                                format['data'] = response.data;
                                format['totalNumber'] = response.total;
                                done(format);
                            }else{
                                course.subjectMsg = true;
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