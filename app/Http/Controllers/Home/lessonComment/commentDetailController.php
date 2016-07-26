<?php

namespace App\Http\Controllers\Home\lessonComment;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use DB;
use PaasResource;
use PaasUser;

class commentDetailController extends Controller
{
    use Gadget;


    public function __construct()
    {
        PaasUser::apply();
    }


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
            $result = DB::table('orders') -> join('commentcourse', 'orders.courseId', '=', 'commentcourse.id') -> select('orders.id', 'orders.orderType') 
                    -> where(['orders.orderType' => 1, 'commentcourse.id' => $commentID, 'orders.userId' => \Auth::user() -> id, 'orders.status' => 2, 'orders.isDelete' => 0]) 
                    -> orWhere(['orders.orderType' => 2, 'commentcourse.id' => $commentID, 'orders.userId' => \Auth::user() -> id, 'orders.status' => 2, 'orders.isDelete' => 0]) -> first();
            if ($result) {
                $bought = 1;
            } else {
                $invited = DB::table('users') -> join('commentcourse', 'users.id', '=', 'commentcourse.userId') -> select('users.id', 'users.fromyaoqingma') 
                         -> where(['commentcourse.id' => $commentID, 'users.fromyaoqingma' => \Auth::user() -> yaoqingma]) -> first();
                $bought = $invited ? 1 : 0;
            }
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
        PaasUser::apply();
        $tableName = $type ? 'commentcourse' : 'applycourse';
        $joinField = $type ? 'teacherId' : 'userId';
        $extra = $type ? 'coursePrice' : 'courseTitle';
        $levelOrMessage = $type ? 'suitlevel' : 'message';
        $condition = $type ? 'id' : 'orderSn';
        $result = \DB::table($tableName) -> join('users', $tableName.'.'.$joinField, '=', 'users.id')
                -> select('users.pic', 'users.username', $tableName.'.courseLowPath', $tableName.'.courseMediumPath', $tableName.'.courseHighPath', $tableName.'.'.$levelOrMessage, 
                    $tableName.'.created_at', $tableName.'.'.$extra.' as extra', $tableName.'.'.$joinField, $tableName.'.orderSn', $tableName.'.coursePic')
                -> where([$tableName.'.'.$condition => $commentID, $tableName.'.state' => 2, $tableName.'.courseStatus' => 0, $tableName.'.courseIsDel' => 0]) -> first();
        if ($result) {
            $result -> time = floor((time() - strtotime($result -> created_at)) / 86400) + 1;
            $result -> created_at = explode(' ', $result -> created_at)[0];
            $result -> courseLowPath = $this -> getPlayUrl($result -> courseLowPath);
            $result -> courseMediumPath = $this -> getPlayUrl($result -> courseMediumPath);
            $result -> courseHighPath = $this -> getPlayUrl($result -> courseHighPath);
            $result -> coursePic = $this -> getPlayUrl($result -> coursePic);
        }
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
    public function wait($applyID)
    {
        $userType = \Auth::user() -> type != 2 ? 'userId' : 'teacherId';
        $result = DB::table('applycourse') -> select('orderSn', 'created_at') 
                -> where(['state' => 2, 'courseStatus' => 0, 'courseIsDel' => 0, $userType => \Auth::user() -> id, 'id' => $applyID]) -> first();
        $result || abort(404);
        return view('home.lessonComment.commentDetail.wait', ['created_at' => floor((time() - strtotime($result -> created_at))/86400), 'commentID' => $applyID, 'orderSn' => $result -> orderSn]);
    }


    /**
     * 上传点评视频
     *
     * @return \Illuminate\Http\Response
     */
    public function uploadComment($orderSn)
    {
        $result = DB::table('orders') -> join('applycourse', 'orders.orderSn', '=', 'applycourse.orderSn') 
                -> select('orders.id', 'orders.userName', 'orders.userId', 'orders.teacherId', 'orders.teacherName', 'applycourse.courseTitle')
                -> where(['orders.orderSn' => $orderSn, 'orders.status' => 1, 'orders.isDelete' => 0, 'orders.teacherId' => \Auth::user() -> id]) -> first();
        $result || abort(404);
        return view('home.lessonComment.commentDetail.uploadComment') -> with('orderSn', $orderSn) -> with('info', $result);
    }


    /**
     * 审核未通过重新上传视频
     *
     * @return \Illuminate\Http\Response
     */
    public function reUploadComment($commentID)
    {
        $result = DB::table('commentcourse') -> select('id', 'suitlevel') 
                -> where(['state' => 0, 'courseStatus' => 0, 'courseIsDel' => 0, 'id' => $commentID, 'teacherId' => \Auth::user() -> id]) -> first();
        $result || abort(404);
        return view('home.lessonComment.commentDetail.reUploadComment') -> with('info', $result);
    }


    /**
     * 完成点评视频上传
     *
     * @return \Illuminate\Http\Response
     */
    public function finishComment(Request $request)
    {
        $request['created_at'] = Carbon::now();
        $request['updated_at'] = Carbon::now();
        $result = DB::table('commentcourse') -> insertGetId($request -> all());
        if (!$result) return $this -> returnResult(false);
        DB::table('orders') -> where('orderSn', $request['orderSn']) -> update(['courseId' => $result]) || $result = !(DB::table('commentcourse') -> where('id', $result) -> delete());
        return $this -> returnResult($result);
    }


    /**
     * 递增视频观看数
     *
     * @return \Illuminate\Http\Response
     */
    public function videoIncrement(Request $request)
    {
        if ($request['action']) {
            $result = DB::table($request['table']) -> where($request['condition']) -> increment($request['field']);
        } else {
            $result = DB::table($request['table']) -> where($request['condition']) -> decrement($request['field']);
        }
        return $this -> returnResult($result);
    }
}
