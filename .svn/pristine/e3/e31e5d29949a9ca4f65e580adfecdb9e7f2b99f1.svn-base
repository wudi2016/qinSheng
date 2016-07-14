<?php

namespace App\Http\Controllers\Home\lessonComment;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use DB;

class commentDetailController extends Controller
{
    use Gadget;

    /**
     * 已完成点评详情
     *
     * @return \Illuminate\Http\Response
     */
    public function index($commentID)
    {
        DB::table('commentcourse') -> select('id') -> where(['state' => 2, 'courseStatus' => 0, 'courseIsDel' => 0, 'id' => $commentID]) -> first() || abort(404);
        if (\Auth::check()) {
            $mine = ['id' => \Auth::user() -> id, 'username' => \Auth::user() -> username, 'type' => \Auth::user() -> type, 'pic' => \Auth::user() -> pic];
            $userType = \Auth::user() -> type != 2 ? 'userId' : 'teacherId';
            $bought = DB::table('orders') -> join('commentcourse', 'orders.courseId', '=', 'commentcourse.id') -> select('orders.id', 'orders.orderType') 
                    -> where(['orders.orderType' => 1, 'commentcourse.id' => $commentID, 'orders.'.$userType => \Auth::user() -> id, 'orders.status' => 2, 'orders.isDelete' => 0]) 
                    -> orWhere(['orders.orderType' => 2, 'orders.userId' => \Auth::user() -> id, 'orders.status' => 2, 'orders.isDelete' => 0]) -> first();
            $bought = $bought ? 1 : 0;
        } else {
            $mine = ['id' => 0, 'username' => 0, 'type' => 0, 'pic' => 0];
            $bought = 0;
        }
        return view('home.lessonComment.commentDetail.index') -> with('commentID', $commentID) -> with('mine', $mine) -> with('bought', $bought);
    }


    /**
     * 获取已完成点评信息
     *
     * @return \Illuminate\Http\Response
     */
    public function getDetailInfo($commentID, $type)
    {
        $tableName = $type ? 'commentcourse' : 'applycourse';
        $joinField = $type ? 'teacherId' : 'userId';
        $extra = $type ? 'coursePrice' : 'courseTitle';
        $condition = $type ? 'id' : 'orderSn';
        $result = \DB::table($tableName) -> join('users', $tableName.'.'.$joinField, '=', 'users.id')
                -> select('users.pic', 'users.username', $tableName.'.courseLowPath', $tableName.'.courseMediumPath', $tableName.'.courseHighPath', $tableName.'.message', 
                    $tableName.'.created_at', $tableName.'.'.$extra.' as extra', $tableName.'.'.$joinField, $tableName.'.orderSn', $tableName.'.coursePic')
                -> where([$tableName.'.'.$condition => $commentID, $tableName.'.state' => 2, $tableName.'.courseStatus' => 0, $tableName.'.courseIsDel' => 0]) -> first();
        $result && $result -> created_at = explode(' ', $result -> created_at)[0];
        return $this -> returnResult($result);
    }


    /**
     * 最新点评推荐
     *
     * @return \Illuminate\Http\Response
     */
    public function getNewComment()
    {
        $result = DB::table('commentcourse') -> select('courseTitle', 'id', 'teachername', 'coursePlayView', 'coursePrice') 
                -> where(['state' => 2, 'courseStatus' => 0, 'courseIsDel' => 0]) -> orderBy('id', 'desc') -> skip(0) -> take(5) -> get();
        return $this -> returnResult($result);
    }


    /**
     * 获取点评视频评论
     *
     * @return \Illuminate\Http\Response
     */
    public function getApplyComment($commentID)
    {
        $result = DB::table('applycoursecomment')
                 -> join('users', 'applycoursecomment.fromUserId', '=', 'users.id')
                 -> select('applycoursecomment.commentContent', 'applycoursecomment.created_at', 'applycoursecomment.fromUserId', 'applycoursecomment.likeNum', 'users.username', 'users.pic', 'users.type', 'applycoursecomment.id', 'applycoursecomment.parentId', 'applycoursecomment.toUserId') 
                 -> where(['applycoursecomment.courseId' => $commentID, 'applycoursecomment.checks' => 0])-> orderBy('applycoursecomment.id', 'desc') -> get();
        foreach ($result as $key => $value) {
            $result[$key] -> likeUser = $result[$key] -> likeNum ? array_filter(array_unique(explode(',', $result[$key] -> likeNum))) : [];
            $result[$key] -> isLike = \Auth::check() ? in_array(\Auth::user() -> id, $result[$key] -> likeUser) : true;
            $result[$key] -> likeNum = count($result[$key] -> likeUser);
            if ($result[$key] -> parentId) {
                $toUser = DB::table('users') -> select('username', 'type') -> where('id', $result[$key] -> toUserId) -> first();
                $result[$key] -> toUserName = $toUser -> username;
                $result[$key] -> toUserType = $toUser -> type;
            }
            $result[$key] -> created_at = Carbon::createFromFormat('Y-n-j G:i:s', $result[$key] -> created_at) -> diffForHumans();
        }
        return $this -> returnResult($result);
    }


    /**
     * 评论点赞
     *
     * @return \Illuminate\Http\Response
     */
    public function likesComment(Request $request)
    {
        $likeUser = $request['likeUser'] ? $request['likeUser'] : [];
        \Auth::check() && array_push($likeUser, \Auth::user() -> id);
        $result = DB::table('applycoursecomment') -> where("id", $request['id']) -> update(["likeNum" => implode(',', $likeUser)]);
        return $this -> returnResult($result);
    }


    /**
     * 待点评详情
     *
     * @return \Illuminate\Http\Response
     */
    public function wait($commentID)
    {
        $userType = \Auth::user() -> type != 2 ? 'userId' : 'teacherId';
        $result = DB::table('applycourse') -> select('orderSn', 'created_at') 
                -> where(['state' => 2, 'courseStatus' => 0, 'courseIsDel' => 0, $userType => \Auth::user() -> id, 'id' => $commentID]) -> first();
        $result || abort(404);
        return view('home.lessonComment.commentDetail.wait', ['created_at' => floor((time() - strtotime($result -> created_at))/86400), 'commentID' => $commentID, 'orderSn' => $result -> orderSn]);
    }


    /**
     * 上传点评视频
     *
     * @return \Illuminate\Http\Response
     */
    public function uploadComment($commentID)
    {
        return view('home.lessonComment.commentDetail.uploadComment') -> with('commentID', $commentID);
    }
}
