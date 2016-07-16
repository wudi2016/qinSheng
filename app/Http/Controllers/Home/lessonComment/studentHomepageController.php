<?php

namespace App\Http\Controllers\Home\lessonComment;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use DB;

class studentHomepageController extends Controller
{
    use Gadget;

    /**
     * 学员主页
     *
     * @return \Illuminate\Http\Response
     */
    public function index($studentID)
    {
        $studentInfo = DB::table('users') -> select('id') -> where(['id' => $studentID]) ->where('type','<>',2) -> first();
        $studentInfo || abort(404);
        $mineID = \Auth::check() ? \Auth::user() -> id : 0;
        return view('home.lessonComment.studentHomePage.index') -> with('userID', $studentID) -> with('mineID', $mineID);
    }


    /**
     * 获取学员信息
     *
     * @return \Illuminate\Http\Response
     */
    public function getStuInfo($studentID)
    {
        $studentInfo = DB::table('users') -> join('city', 'users.cityId', '=', 'city.code')
                     -> select('users.username', 'users.sex', 'city.name as city', 'users.created_at', 'users.type', 'users.pic') 
                     -> where(['users.id' => $studentID]) -> where('users.type', '!=', 2) -> first();
        $studentInfo && $studentInfo -> created_at = floor((time() - strtotime($studentInfo -> created_at)) / 86400);
        return $this -> returnResult($studentInfo);
    }


    /**
     * 获取总数
     *
     * @return \Illuminate\Http\Response
     */
    public function getCount(Request $request)
    {
        $result = DB::table($request['table']) -> where($request['data']) -> count();
        return $this -> returnResult($result);
    }


    /**
     * 查看是否关注
     *
     * @return \Illuminate\Http\Response
     */
    public function getFirst(Request $request)
    {
        switch ($request['action']) {
            case '1':
                $result = DB::table($request['table']) -> select('id') -> where($request['data']) -> first();
                $result = $result && (bool) $result -> id;
                break;
            case '2':
                foreach ($request['data'] as $key => $value) $data[$key] = $value;
                $data['created_at'] = Carbon::now();
                $result = DB::table($request['table']) -> insertGetId($data);
                break;
            case '3':
                $result = DB::table($request['table']) -> where($request['data']) -> delete();
                if ($result) return Response() -> json(["type" => true, "data" => false]);
                break;
            case '4':
                foreach ($request['data'] as $key => $value) $data[$key] = $value;
                $data['updated_at'] = Carbon::now();
                $result = DB::table($request['table']) -> where($request['condition']) -> update($data);
                break;
        }
        return $this -> returnResult($result);
    }



    /**
     * 获取课程视频
     *
     * @return \Illuminate\Http\Response
     */
    public function getVideo(Request $request)
    {
        sleep(1);
        $tableName = $request['type'] ? 'commentcourse' : 'course';
        $extra = $request['type'] ? 'teachername' : 'courseChapter';
        $order = $request['order'] ? 'coursePlayView' : 'created_at';
        $result = \DB::table('orders') -> join($tableName, 'orders.courseId', '=', $tableName.'.id')
                -> select('orders.orderType', $tableName.'.id', 'orders.payPrice', $tableName.'.courseTitle', $tableName.'.coursePic', $tableName.'.coursePlayView', $tableName.'.'.$extra.' as extra')
                -> where(['orders.userId' => $request['userid'], 'orders.orderType' => $request['type'], $tableName.'.courseIsDel' => 0, $tableName.'.courseStatus' => 0]) 
                -> orderBy("{$tableName}.{$order}", "desc") -> skip($this -> getSkip($request['page'], $this -> number)) -> take($this -> number)-> get();
        return $this -> returnResult($result); 
    }


    /**
     * 获取课程视频总数
     *
     * @return \Illuminate\Http\Response
     */
    public function getVideoCount(Request $request)
    {
        $tableName = $request['type'] ? 'commentcourse' : 'course';
        $order = $request['order'] ? 'coursePlayView' : 'id';
        $result = \DB::table('orders') -> join($tableName, 'orders.courseId', '=', $tableName.'.id')
                -> where(['orders.userId' => $request['userid'], 'orders.orderType' => $request['type']]) -> orderBy("{$tableName}.{$order}", "desc") -> count();
        return $this -> returnResult($result);
    }

}
