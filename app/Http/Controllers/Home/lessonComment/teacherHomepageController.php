<?php

namespace App\Http\Controllers\Home\lessonComment;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use DB;

class teacherHomepageController extends Controller
{
    use Gadget;

    /**
     * 名师主页
     *
     * @return \Illuminate\Http\Response
     */
    public function index($teacherID)
    {
        $teacherInfo = DB::table('users') -> select('id') -> where(['id' => $teacherID, 'type' => 2]) -> first();
        $teacherInfo || abort(404);
        $mineID = \Auth::check() ? \Auth::user() -> id : 0;
        return view('home.lessonComment.teacherHomepage.index') -> with('userID', $teacherID) -> with('mineID', $mineID);
    }


    /**
     * 获取名师信息
     *
     * @return \Illuminate\Http\Response
     */
    public function getTeacherInfo($teacherID)
    {
        $teacherInfo = DB::table('users') 
                    -> join('teacher', 'users.id', '=', 'teacher.parentId')
                    -> join('city', 'users.cityId', '=', 'city.code')
                    -> select('users.id', 'users.username', 'users.sex', 'city.name as city', 'users.created_at', 'users.type', 'users.pic', 'users.company', 
                        'teacher.intro', 'teacher.stock', 'teacher.price', 'teacher.cover') 
                    -> where(['users.id' => $teacherID, 'users.type' => 2]) -> first();
        $teacherInfo && $teacherInfo -> created_at = floor((time() - strtotime($teacherInfo -> created_at)) / 86400);
        return $this -> returnResult($teacherInfo);
    }


    /**
     * 获取名师视频
     *
     * @return \Illuminate\Http\Response
     */
    public function getTeacherVideo(Request $request)
    {
        sleep(1);
        $tableName = $request['type'] ? 'commentcourse' : 'course';
        $extra = $request['type'] ? 'teachername' : 'courseChapter';
        $order = $request['order'] ? 'coursePlayView' : 'id';
        $result = \DB::table($tableName) -> select('id', 'coursePrice', 'courseTitle', 'coursePic', 'coursePlayView', $extra . ' as extra')
                -> where(['teacherId' => $request['userid/**/'], $tableName . '.courseIsDel' => 0, $tableName . '.courseStatus' => 0])
                -> orderBy($order, "desc") -> skip($this -> getSkip($request['page'], $this->number)) -> take($this -> number) -> get();
        return $this -> returnResult($result);
    }



    /**
     * 获取名师视频总数
     *
     * @return \Illuminate\Http\Response
     */
    public function getTeacherVideoCount(Request $request)
    {
        $tableName = $request['type'] ? 'commentcourse' : 'course';
        $order = $request['order'] ? 'coursePlayView' : 'id';
        $result = \DB::table($tableName)
                -> where(['teacherId' => $request['userid']]) -> orderBy($order, "desc") -> count();
        return $this -> returnResult($result);
    }

    
}
