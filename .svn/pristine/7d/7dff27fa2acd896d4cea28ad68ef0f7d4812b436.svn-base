

//课程状态
function courseCheck(id,courseStatus){
    $.ajax({
        type: "get",
        data:{'id':id,'courseStatus':courseStatus},
        url: "/admin/specialCourse/specialCourseState",

        dataType: 'json',
        success: function (res) {
            if(res == 1){
                location.reload();//刷新页面
            }
        }
    })
}