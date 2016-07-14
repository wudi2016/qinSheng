<?php

namespace App\Http\Controllers\Home\lessonSubject;

use DB;
use Carbon\Carbon;
use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Home\lessonComment\Gadget;


class lessonSubjectController extends Controller
{
    use Gadget;
    // 专题课程列表页 =============== page =======================
    public function lessonSubjectList($type)
    {
        return view('home.lessonSubject.lessonSubjectList');
    }

    // 专题课程详细页
    public function lessonSubjectDetail($id)
    {
        $mineUsername = Auth::check() ? Auth::user()->username : '';
        $mineUserId = Auth::check() ? Auth::user()->id : '';
        $mineType = Auth::check() ? Auth::user()->type : '';
        $minePic = Auth::check() ? Auth::user()->pic : '';
        return view('home.lessonSubject.lessonSubjectDetail')
            ->with('mineUsername', $mineUsername)
            ->with('mineUserId',$mineUserId)
            ->with('mineType',$mineType)
            ->with('minePic',$minePic)
            ->with('detailId', $id);
    }

    // 微信扫码支付页
    public function lessonSubjectWeChatPay()
    {
        return view('home.lessonSubject.lessonSubjectWeChatPay');
    }


    // 专题课程列表页 规则排序 数据接口=============== data ================
    public function getList(Request $request,$type)
    {
        switch ($type) {
            case 1:
                $orderBy = 'id';
                $asc = 'asc';
                break;
            case 2:
                $orderBy = 'created_at';
                $asc = 'desc';
                break;
            case 3:
                $orderBy = 'coursePlayView';
                $asc = 'desc';
                break;
        }
        $this->number = 8;
        $List = DB::table('course')->where('courseStatus', '0')->orderBy($orderBy, $asc)-> skip($this -> getSkip($request['page'], $this -> number)) -> take($this -> number)->get();
        foreach ($List as $key => $value) {
            if($List[$key]->courseDiscount){
                $List[$key]->coursePrice = ceil(($List[$key]->courseDiscount/10000)*$List[$key]->coursePrice/1000);
            }else{
                $List[$key]->coursePrice = ceil($List[$key]->coursePrice/1000);
            }
            $List[$key]->classHour = DB::table('coursechapter')->where(['courseId' => $value->id, 'status' => 0])->where('parentId', '<>', '0')->count();
        }
        return $this->returnResult($List);
    }

    public function getCount(Request $request)
    {
        $tableName = $request['type'] ? 'commentcourse' : 'course';
        $result = \DB::table($tableName)-> where('courseStatus', '0') -> orderBy("id", "desc") -> count();
        return $this -> returnResult($result);
    }

    // 点评课程列表页 规则排序 数据接口
    public function getCommentList($type,Request $request)
    {
        $this->number = 8;
        switch ($type) {
            case 1:
                $orderBy = 'id';
                break;
            case 2:
                $orderBy = 'created_at';
                break;
            case 3:
                $orderBy = 'coursePlayView';
                break;
        }
        $List = DB::table('commentcourse')->where(['courseStatus' => '0', 'state' => '2'])->orderBy($orderBy, 'desc')-> skip($this -> getSkip($request['page'], $this -> number)) -> take($this -> number)->get();
        foreach ($List as $key => $value) {
            $List[$key]->coursePrice = ceil($value->coursePrice / 1000);
        }
        return $this->returnResult($List);
    }

    // 专题课程详细页 数据接口
    public function getDetail($id)
    {
        $result = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0])->where('parentId','0')->first();
        $info = DB::table('course as c')->select()->where('id', $id)->first();
        if($info->courseDiscount){
            $info->coursePrice = ceil(($info->courseDiscount/10000)*$info->coursePrice/1000);
        }else{
            $info->coursePrice = ceil($info->coursePrice/1000);
        }
        $info->courseNotice = $info->courseNotice ? $info->courseNotice : '暂无课程公告';
        $info->classHour = DB::table('coursechapter')->where(['courseId' => $id, 'status' => 0])->where('parentId', '<>', '0')->count();
        $info->courseLowPath = $result ? $result->courseLowPath : '';
        $info->courseMediumPath = $result ? $result->courseMediumPath : '';
        $info->courseHighPath = $result ? $result->courseHighPath : '';
        if (Auth::check()) {
            $info->isCollection = (DB::table('collection')->select('id')->where(['courseId' => $info->id, 'userId' => Auth::user()->id])->first() ? true : false);
            $info->isBuy = (DB::table('orders')->select('id')->where(['userId' => Auth::user()->id, 'orderType' => '0', 'courseId' => $id])->first() ? true : false);
            $info->isAuthor = $info->teacherId == Auth::user()->id ? true : false;
        } else {
            $info->isCollection = false;
            $info->isBuy = false;
            $info->isAuthor = false;
        }
        return $this->returnResult($info);
    }

    // 微信扫码支付页 数据接口
    public function getWeChatPay()
    {

    }

    // 获取讲师信息
    public function getTeacherInfo($id)
    {
        $info = DB::table('course as c')
            ->join('users as u', 'c.teacherId', '=', 'u.id')
            ->join('teacher as t', 't.parentId', '=', 'c.teacherId')
            ->where('c.id', $id)->select('u.realname', 'u.pic', 'u.school', 't.intro')->first();
        return $this->returnResult($info);
    }

    // 获取目录信息
    public function getCatalogInfo($id)
    {
        $info = DB::table('coursechapter')->select('id', 'title', 'coursePath')->where(['status' => 0, 'parentId' => '0', 'courseId' => $id])->get();
        foreach ($info as $key => $value) {
            $info[$key]->section = (DB::table('coursechapter')->select('id', 'title', 'coursePath')->where(['status' => 0, 'parentId' => $value->id, 'courseId' => $id])->get());
        }
        return $this->returnResult($info);
    }


    // 获取评论信息
    public function getCommentInfo($id)
    {
        $info = DB::table('coursecomment as c')
            ->join('users as u', 'c.username', '=', 'u.username')
            ->select('u.pic', 'c.id', 'c.username', 'c.tousername', 'c.commentContent', 'c.likeNum', 'c.created_at')
            ->where(['c.courseId' => $id, 'status' => 0])->orderBy('c.created_at', 'desc')->get();
        foreach ($info as $key => $value) {
            $info[$key]->likeUser = $info[$key]->likeNum ? array_filter(explode(',', $info[$key]->likeNum)) : [];
            $info[$key]->isLike = Auth::check() ? in_array(Auth::user()->id, $info[$key]->likeUser) : true;
            $info[$key]->isSelf = Auth::check() && Auth::user()->username == $info[$key]->username ? true : false;
            $info[$key]->likeTotal = count($info[$key]->likeUser);
            $info[$key]->timeAgo = Carbon::createFromFormat('Y-n-j G:i:s', $value->created_at)->diffForHumans();
        }
        return $this->returnResult($info);
    }


    // 发布评论
    public function publishComment(Request $request)
    {
        $input = $request->all();
        if (isset($input['tousername']) && !empty($input['tousername'])) { // 回复评论
            $input['checks'] = '0';
            $input['created_at'] = Carbon::now();
            $input['updated_at'] = Carbon::now();
            $input['status'] = '0';
            $insertId = DB::table('coursecomment')->insertGetId($input);
            if($insertId){
                $info['toUsername'] = $input['tousername'];
                $info['fromUsername'] = $input['username'];
                $info['username'] = $input['username'];
                $info['type'] = 5;
                $info['content'] = $input['commentContent'];
                $info['client_ip'] = $_SERVER["REMOTE_ADDR"];
                $info['actionId'] = $input['courseId'];
                $info['created_at'] = Carbon::now();
                DB::table('usermessage')->insertGetId($info);
            }
            return $this->returnResult($insertId);
        } else { // 发布评论
            $input['checks'] = '0';
            $input['created_at'] = Carbon::now();
            $input['updated_at'] = Carbon::now();
            $input['status'] = '0';
            $insertId = DB::table('coursecomment')->insertGetId($input);
            return $this->returnResult($insertId);
        }
    }

    // 删除评论
    public function deleteComment(Request $request)
    {
        $result = DB::table('coursecomment')->delete($request->get('id'));
        return $this->returnResult($result);
    }

    // 点赞
    public function addLike(Request $request)
    {
        $input = $request->all();
        $data['likeNum'] = Auth::user()->id;
        $data['updated_at'] = Carbon::now();
        $likeNum = DB::table('coursecomment')->select('likeNum')->where('id', $input['id'])->first();
        if ($likeNum->likeNum) {
            $list = explode(',', $likeNum->likeNum);
            if (in_array($data['likeNum'], $list)) {
                return response()->json(['status' => false]);
            } else {
                $new = ['0' => $likeNum->likeNum, '1' => $data['likeNum']];
                $info['likeNum'] = implode(',', $new);
                $info['updated_at'] = Carbon::now();
                $result = DB::table('coursecomment')->where('id', $input['id'])->update($info);
                return $this->returnResult($result);
            }
        } else {
            $result = DB::table('coursecomment')->where('id', $input['id'])->update($data);
            return $this->returnResult($result);
        }
    }

// 发表反馈意见
    public function publishFeedBack(Request $request)
    {
        $input = $request->all();
        $input['courseType'] = '0';
        $input['status'] = '0';
        $input['created_at'] = Carbon::now();
        $input['updated_at'] = Carbon::now();
        $insertId = DB::table('coursefeedback')->insertGetId($input);
        return $this->returnResult($insertId);
    }

    // 添加收藏
    public function addCollect(Request $request)
    {
        $input = $request->all();
        $flag = $input['isCollection'];
        $input = $request->except('isCollection');
        if ($flag == 'true' || DB::table('collection')->where(['courseId' => $input['courseId'], 'userId' => $input['userId']])->first()) { // 已收藏
            if (DB::table('collection')->where(['courseId' => $input['courseId'], 'userId' => $input['userId']])->delete()) {
                DB::table('course')->where('id', $input['courseId'])->decrement('courseFav', 1);
                return response()->json(['status' => false]);// 未收藏
            } else {
                return response()->json(['status' => true]);// 已收藏
            }
        } else { // 未收藏
            $input['type'] = '0'; // 专题课程
            $input['created_at'] = Carbon::now();
            $insertID = DB::table('collection')->insertGetId($input);
            if ($insertID) {
                DB::table('course')->where('id', $input['courseId'])->increment('courseFav', 1);
                return response()->json(['status' => true]);// 已收藏
            } else {
                return response()->json(['status' => false]);// 未收藏
            }
        }
    }

    // 资料下载数据接口
    public function getDataDownload($id)
    {
        $info = DB::table('coursedata')->where(['courseId' => $id, 'status' => 0])->select('dataName','dataPath')->get();
        return $this->returnResult($info);
    }

    function returnResult($result)
    {
        if ($result) {
            return Response()->json(["status" => true, "data" => $result]);
        } else {
            return Response()->json(["status" => false]);
        }
    }
}
