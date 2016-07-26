<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
//认证路由
use App\Http\Controllers\Home\indexController;

Route::get('/', 'Home\indexController@index');
Route::post('/auth/login', 'Auth\AuthController@postLogin');
Route::get('/auth/logout', 'Auth\AuthController@getLogout');
// 注册路由...
Route::get('auth/register', 'Auth\AuthController@getRegister');
Route::post('auth/register', 'Auth\AuthController@postRegister');


/*
||--------------------------------------------------------------------------------------
||     -------------------------- 前台路由组 ----------------------------
||     -------------------------- 各位根据模块或者控制器再另建路由组 ----------------------------
||--------------------------------------------------------------------------------------
 */

Route::group(['prefix' => '/', 'namespace' => 'Home'], function () {

    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 首页模块 ----------------------------
    ||--------------------------------------------------------------------------------------
     */
    Route::group(['prefix' => '/index'], function () {
        //登陆
        Route::get('/login', ['middleware' => 'users','uses'=>'indexController@login']);
        //切换账号
        Route::get('/switchs', 'indexController@switchs');
        //注册
        Route::get('/register',['middleware' => 'users','uses'=>'indexController@register']);
        //判断用户类型
        Route::get('/judge', 'indexController@judge');
        //注册成功（老师）
        Route::get('/registsucesstea', 'indexController@registsucesstea');
        //注册成功（学生）
        Route::get('/registsucessstu', 'indexController@registsucessstu');
        //完善信息 (老师)
        Route::post('/infotea', 'indexController@infotea');
        //完善信息 (学生)
        Route::post('/infostu', 'indexController@infostu');
        //找回密码
        Route::get('/retrievepsd', 'indexController@retrievepsd');
        //设置密码
        Route::get('/resetpsd/{phone}', 'indexController@resetpsd');
        //活动赛事
        Route::get('/games', 'indexController@games');
        //搜索
        Route::post('/search', 'indexController@search');


        //获取赛事接口
        Route::get('/getgames/{type}', 'indexController@getgames');
        //名师介绍接口
        Route::get('/getteachers', 'indexController@getteachers');
        //专题课程接口
        Route::get('/getSpecialLessons', 'indexController@getSpecialLessons');
        //点评课程接口
        Route::get('/getCommentlLessons', 'indexController@getCommentlLessons');
        //登陆验证接口
        Route::post('/getCheckRes', 'indexController@getCheckRes');
        //注册用户名验证接口
        Route::post('/getCheckUname', 'indexController@getCheckUname');
        //注册手机号验证接口
        Route::post('/getCheckUphone', 'indexController@getCheckUphone');
        //获取手机验证码接口
        Route::get('/getMessage/{phone}', 'indexController@getMessage');
        //邀请码验证接口
        Route::get('/getInviteCode/{code}', 'indexController@getInviteCode');
        //获取省接口
        Route::get('/getProvince', 'indexController@getProvince');
        //获取市接口
        Route::get('/getCity/{code}', 'indexController@getCity');
        //修改密码接口
        Route::post('/resetPassword', 'indexController@resetPassword');
        //搜索专题课程接口
        Route::get('/getCourseaa/{search}/{ordder?}', 'indexController@getCourseaa');
        //搜索点评课程接口
        Route::get('/getCoursebb/{search}/{ordder?}', 'indexController@getCoursebb');

    });

    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 用户模块 ----------------------------
    ||--------------------------------------------------------------------------------------
     */
    Route::group([ 'prefix' => '/member', 'namespace' => 'member' ], function ()
    {
        /*
                ||--------------------------------------------------------------------------------------
                ||     -------------------------- 个人中心路由组 ----------------------------
                ||--------------------------------------------------------------------------------------
                 */
        //学员个人中心主页    0 学生学员&&    1  教师学员  tab为选项卡可选参数
        Route::get('/student/{personID}/{tab?}',['middleware' => 'check','uses'=>'perSpaceController@index']);
        //	名师个人中心主页  type 为 2
        Route::get('/famousTeacher/{tab?}', ['middleware' => 'check','uses'=>'perSpaceController@famousTeacher']);


        //个人中心我的关注
        Route::get('/myFocus',['middleware' => 'check','uses'=>'perSpaceController@myFocus']);

        //个人中心我的粉丝&&我的好友（暂定 谁关注我就是我的好友）
        Route::get('/myFriends',['middleware' => 'check','uses'=>'perSpaceController@myFriends']);

        //学员--我的订单
        Route::post('/myOrders',['middleware' => 'check','uses'=>'perSpaceController@myOrders']);

        //名师--待评点评
        Route::post('/waitComment',['middleware' => 'check','uses'=>'perSpaceController@waitComment']);

        //名师--点评完成
        Route::post('/completeComment',['middleware' => 'check','uses'=>'perSpaceController@completeComment']);

        //我的订单 -- 申请退款页面数据接口
        Route::post('/applyRefund',['middleware' => 'check','uses'=>'perSpaceController@applyRefund']);

        //我的订单 -- 提交退款申请
        Route::post('/submitApply',['middleware' => 'check','uses'=>'perSpaceController@submitApply']);








        // 个人中心 专题课程 type => 1 => 学员 type => 2 => 名师 flag => 1 => 最新 flag => 2 => 热门
        Route::get('/getCourse/{type}/{flag}','perSpaceController@getCourse');
        // 个人中心 点评课程 type => 1 => 最新 flag => 2 => 热门
        Route::post('/getCommentCourse/{type}','perSpaceController@getCommentCourse');
        // 个人中心
        Route::get('/getCollectionInfo', 'perSpaceController@getCollectionInfo');
        // 个人中心 删除收藏
        Route::post('/deleteCollection', 'perSpaceController@deleteCollection');
        // 个人中心 全部通知
        Route::post('/getNoticeInfo','perSpaceController@getNoticeInfo');
        // 个人中心 删除通知
        Route::post('/deleteNotice','perSpaceController@deleteNotice');
        // 个人中心 评论回复
        Route::post('/getCommentInfo', 'perSpaceController@getCommentInfo');
        // 个人中心 评论删除
        Route::post('/deleteComment', 'perSpaceController@deleteComment');



        //编辑个人信息
        Route::post('/editInfo', 'perSpaceController@editInfo');
        Route::post('/editInfotea', 'perSpaceController@editInfotea');
        //修改密码
        Route::post('/editPassword', 'perSpaceController@editPassword');

        //头像上传接口
        Route::post('/addImg', 'perSpaceController@addImg');
        //裁剪参数接口
        Route::post('/cutImg', 'perSpaceController@cutImg');
        //后台添加用户裁剪参数接口
        Route::post('/trimImg', 'perSpaceController@trimImg');
        //检查密码接口
        Route::post('/checkPassword', 'perSpaceController@checkPassword');
        //修改手机号接口
        Route::post('/changePhone', 'perSpaceController@changePhone');
    });




    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 社区模块 ----------------------------
    ||--------------------------------------------------------------------------------------
     */
    Route::group(['prefix' => '/community', 'namespace' => 'community'], function () {
        //社区首页
        Route::get('/', 'communityController@index');
        //首页新闻数据接口
        Route::get('/getlist','communityController@getlist');
        //首页最热视频推荐数据接口
        Route::get('/gethotvideo','communityController@gethotvideo');
        //首页名师列表数据接口
        Route::get('/getteacher','communityController@getteacher');
        //首页最新学员列表数据接口
        Route::get('/getstudent','communityController@getstudent');



        //名师列表
        Route::get('/theteacher/', 'theteacherController@index');
        //名师列表获取数据接口
        Route::get('/gettheteacher/{type}', 'theteacherController@gettheteacher');


        //新闻资讯列表
        Route::get('/newlist', 'newlistController@index');
        //新闻列表接口
        Route::get('/getnewlist','newlistController@getnewlist');
        //新闻资讯详情
        Route::get('/newdetail/{id}', 'newlistController@newdetail');
        //新闻资讯详情数据接口
        Route::get('/getnewdetail/{id}','newlistController@getnewdetail');



        //社区-热门视频详情页
        Route::get('videodetail/{id}', 'videodetailController@index');
        //社区-热门视频详情数据接口
        Route::get('/getvideodetail/{id}','videodetailController@getvideodetail');

    });


    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 课程专题模块 ----------------------------
    ||--------------------------------------------------------------------------------------
     */
    Route::group(['prefix' => '/lessonSubject', 'namespace' => 'lessonSubject'], function () {
        // =============== return page ================
        // 专题课程列表页 type 为1是专题课程列表 为2是点评课程列表
        Route::get('/list/{type}', 'lessonSubjectController@lessonSubjectList');
        // 专题课程详细页
        Route::get('/detail/{id}', 'lessonSubjectController@lessonSubjectDetail');
        // 微信扫码支付页
        Route::get('/WeChatPay/{id}', 'lessonSubjectController@lessonSubjectWeChatPay');
        //  支付成功
        Route::get('/buySuccess/{orderID}', 'lessonSubjectController@buySuccess');


        // ============  return result  ===============
        // 点赞
        Route::post('/addLike', 'lessonSubjectController@addLike');
        // 收藏
        Route::post('/addCollect', 'lessonSubjectController@addCollect');

        // =============== return data ================
        // 专题课程列表页 规则排序 数据接口
        Route::get('/getList/{type}', 'lessonSubjectController@getList');
        // 点评课程列表页 规则排序 数据接口
        Route::get('/getCommentList/{type}', 'lessonSubjectController@getCommentList');
        // 专题课程详细页 数据接口
        Route::get('/getDetail/{id}', 'lessonSubjectController@getDetail');
        // 讲师信息 数据接口
        Route::get('/getTeacherInfo/{id}', 'lessonSubjectController@getTeacherInfo');
        // 资料下载数据接口
        Route::get('/getDataDownload/{id}', 'lessonSubjectController@getDataDownload');
        // 获取目录信息
        Route::get('/getCatalogInfo/{id}', 'lessonSubjectController@getCatalogInfo');
        // 评论信息 数据接口
        Route::get('/getCommentInfo/{id}', 'lessonSubjectController@getCommentInfo');
        // 发布评论
        Route::post('/publishComment','lessonSubjectController@publishComment');
        // 删除评论
        Route::post('/deleteComment', 'lessonSubjectController@deleteComment');
        // 发表意见反馈
        Route::post('/publishFeedBack', 'lessonSubjectController@publishFeedBack');
        // 增加课程观看数
        Route::post('/addCourseView', 'lessonSubjectController@addCourseView');

        // 添加订单接口
        Route::post('/addOrder', 'lessonSubjectController@addOrder');
        //  微信支付回调地址
        Route::any('/wxPayCallback', 'lessonSubjectController@wxPayCallback');
        //  微信扫码获取订单状态
        Route::get('/orderStatus/{orderID}', 'lessonSubjectController@orderStatus');

        //  支付宝异步回调页面
        Route::any('/alipayAsyncCallback', 'lessonSubjectController@alipayAsyncCallback');
        //  支付宝同步回调页面
        Route::any('/alipaySyncCallback', 'lessonSubjectController@alipaySyncCallback');
        //  支付宝支付
        Route::any('/alipay/{orderID}/{callback}', 'lessonSubjectController@alipay');
    });


    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 课程点评模块 ----------------------------
    ||--------------------------------------------------------------------------------------
     */
    Route::group(['prefix' => '/lessonComment', 'namespace' => 'lessonComment'], function () {
        /*
        ||--------------------------------------------------------------------------------------
        ||     -------------------------- 名师主页 ----------------------------
        ||--------------------------------------------------------------------------------------
         */
        //  名师主页
        Route::get('/teacher/{teacherID}', 'teacherHomepageController@index');
        //	获取名师信息
        Route::get('/getTeacherInfo/{teacherID}', 'teacherHomepageController@getTeacherInfo');
        //  获取名师视频
        Route::post('/getTeacherVideo', 'teacherHomepageController@getTeacherVideo');
        //  获取名师视频总数
        Route::post('/getTeacherVideoCount', 'teacherHomepageController@getTeacherVideoCount');

        /*
        ||--------------------------------------------------------------------------------------
        ||     -------------------------- 学生主页 ----------------------------
        ||--------------------------------------------------------------------------------------
         */
        //	名师主页
        Route::get('/student/{studentID}', 'studentHomepageController@index');
        //  获取学员信息
        Route::get('/getStuInfo/{studentID}', 'studentHomepageController@getStuInfo');
        //  获取总数
        Route::post('/getCount', 'studentHomepageController@getCount');
        //  获取课程视频
        Route::post('/getVideo', 'studentHomepageController@getVideo');
        //  获取课程视频总数
        Route::post('/getVideoCount', 'studentHomepageController@getVideoCount');
        //  查看是否关注
        Route::post('/getFirst', 'studentHomepageController@getFirst');

        /*
        ||--------------------------------------------------------------------------------------
        ||     -------------------------- 点评详情 ----------------------------
        ||--------------------------------------------------------------------------------------
         */
        //  已完成点评详情
        Route::get('/detail/{commentID}', 'commentDetailController@index');
        //  获取已完成点评信息
        Route::get('/getDetailInfo/{commentID}/{type}', 'commentDetailController@getDetailInfo');
        //  最新点评推荐
        Route::get('/getNewComment', 'commentDetailController@getNewComment');
        //  获取点评视频评论
        Route::get('/getApplyComment/{commentID}', 'commentDetailController@getApplyComment');
        //  评论点赞
        Route::post('/likesComment', 'commentDetailController@likesComment');
        //  递增视频观看数
        Route::post('/videoIncrement', ['middleware' => 'check', 'uses' => 'commentDetailController@videoIncrement']);
        //  待点评详情
        Route::get('/wait/{commentID}', ['middleware' => 'check', 'uses' => 'commentDetailController@wait']);
        //  上传点评视频
        Route::get('/upload/{orderSn}', ['middleware' => 'check', 'uses' => 'commentDetailController@uploadComment']);
        //  审核未通过重新上传视频
        Route::get('/reUploadComment/{commentID}', ['middleware' => 'check', 'uses' => 'commentDetailController@reUploadComment']);
        //  完成点评视频上传
        Route::post('/finishComment', ['middleware' => 'check', 'uses' => 'commentDetailController@finishComment']);

        /*
        ||--------------------------------------------------------------------------------------
        ||     -------------------------- 购买点评 ----------------------------
        ||--------------------------------------------------------------------------------------
         */
        //	支付页面
        Route::get('/buy/{teacherID}', ['middleware' => 'check', 'uses' => 'buyCommentController@index']);
        // Route::get('/buy/{teacherID}', ['middleware' => ['check', 'operation'], 'uses' => 'buyCommentController@index']);
        //  生成订单
        Route::post('/generateOrder', ['middleware' => 'check', 'uses' => 'buyCommentController@generateOrder']);
        //  微信扫码
        Route::get('/scan/{orderID}', ['middleware' => 'check', 'uses' => 'buyCommentController@scan']);
        //  支付成功
        Route::get('/buySuccess/{orderID}', ['middleware' => 'check', 'uses' => 'buyCommentController@buySuccess']);
        //  上传视频
        Route::get('/buy/upload/{orderID}', ['middleware' => 'check', 'uses' => 'buyCommentController@upload']);
        //	审核未通过重新上传视频
        Route::get('/reUpload/{applyID}', ['middleware' => 'check', 'uses' => 'buyCommentController@reUpload']);
        //  完成上传
        Route::post('/finishUpload', ['middleware' => 'check', 'uses' => 'buyCommentController@finishUpload']);
        
        //  pass平台上传资源
        Route::post('/uploadResource', ['middleware' => 'check', 'uses' => 'buyCommentController@uploadResource']);
        //  pass平台资源转换
        Route::post('/transformation', ['middleware' => 'check', 'uses' => 'buyCommentController@transformation']);

        //  微信支付回调地址
        Route::any('/wxPayCallback', 'buyCommentController@wxPayCallback');
        //  微信扫码获取订单状态
        Route::get('/orderStatus/{orderID}', ['middleware' => 'check', 'uses' => 'buyCommentController@orderStatus']);

        //  支付宝异步回调页面
        Route::any('/alipayAsyncCallback', 'buyCommentController@alipayAsyncCallback');
        //  支付宝同步回调页面
        Route::any('/alipaySyncCallback', 'buyCommentController@alipaySyncCallback');
        //  支付宝支付
        Route::any('/alipay/{orderID}/{callback}', 'buyCommentController@alipay');

    });


    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 关于我们模块 ----------------------------
    ||--------------------------------------------------------------------------------------
     */
    Route::group(['prefix' => '/aboutUs', 'namespace' => 'aboutUs'], function () {
        //公司介绍
        Route::get('/firmintro/{type}', 'firmintroController@index');

        // 取数据接口
        Route::get('/getListone','firmintroController@getListone');
        Route::get('/getListtwo','firmintroController@getListtwo');
        Route::get('/getListthree','firmintroController@getListthree');
        Route::get('/getListfour','firmintroController@getListfour');
        Route::get('/getListfive','firmintroController@getListfive');
        Route::get('/getListsix','firmintroController@getListsix');
    });

});


/*
||--------------------------------------------------------------------------------------
||     -------------------------- 后台台路由组 ----------------------------
||     -------------------------- 各位根据模块或者控制器再另建路由组 ----------------------------
||--------------------------------------------------------------------------------------
||----------后台路由命名规则 列表的路由：***List;添加的路由:add***;修改的路由edit***;删除的路由:del***;以便侧边栏选中判断----
 */


//后台登录
Route::get('/admin/login',['middleware' => 'admins',function () {
    return view('admin.login');
}]);
Route::post('/admin/login', 'Auth\AuthController@adminLogin');

Route::group(['prefix' => '/admin','middleware'=>'adminauth','namespace' => 'Admin'], function () {

    //后台首页
    Route::get('index', 'IndexController@index');

    //页面跳转页面
    Route::get('message', function () {
        return view('admin.message');
    });



    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 权限管理 ----------------------------
    ||--------------------------------------------------------------------------------------
     */
    Route::group(['prefix' => '/auth', 'namespace' => 'auth'], function () {
        /*
        ||--------------------------------------------------------------------------------------
        ||     -------------------------- 角色管理 ----------------------------
        ||--------------------------------------------------------------------------------------
         */
        //  角色列表
        Route::get('/roleList', ['middleware' => 'permission:check.role', 'uses' => 'RoleController@roleList']);
        //  添加角色
        Route::get('/addRole', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@addRole']);
        //  创建角色
        Route::post('/createRole', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@createRole']);
        //  删除角色
        Route::get('/deleteRole/{roleID}', ['middleware' => 'permission:delete.role', 'uses' => 'RoleController@deleteRole']);
        //  编辑角色
        Route::get('/editRole/{roleID}', ['middleware' => 'permission:edit.role', 'uses' => 'RoleController@editRole']);
        //  修改角色
        Route::post('/updateRole', ['middleware' => 'permission:edit.role', 'uses' => 'RoleController@updateRole']);


        //  查看角色用户
        Route::get('/checkRoleUser/{roleID}', ['middleware' => 'permission:check.role', 'uses' => 'RoleController@checkRoleUser']);
        //  删除角色用户
        Route::get('/deleteRoleUser/{type}/{roleID}', ['middleware' => 'permission:delete.role', 'uses' => 'RoleController@deleteRoleUser']);
        //  添加角色用户
        Route::get('/addRoleUser/{roleID}', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@addRoleUser']);
        //  创建角色用户
        Route::post('/createRoleUser', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@createRoleUser']);
        //  获取部门或者职位信息
        Route::get('/getList/{departmentID?}', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@getList']);
        //  获取用户信息
        Route::get('/getUser/{type}/{id}/{roleID}', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@getUser']);


        //  查看角色权限
        Route::get('/checkRolePermission/{roleID}', ['middleware' => 'permission:check.role', 'uses' => 'RoleController@checkRolePermission']);
        //  添加角色权限
        Route::get('/addRolePermission/{roleID}', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@addRolePermission']);
        //  创建角色用户
        Route::post('/createRolePermission', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@createRolePermission']);
        //  获取操作权限信息
        Route::get('/getPermissionInfo/{modelName?}/{roleID?}', ['middleware' => 'permission:add.role', 'uses' => 'RoleController@getPermissionInfo']);

        /*
        ||--------------------------------------------------------------------------------------
        ||     -------------------------- 操作权限 ----------------------------
        ||--------------------------------------------------------------------------------------
         */
        //  操作权限列表
        Route::get('/permissionList', ['middleware' => 'level:1', 'uses' => 'PermissionController@permissionList']);
        //  添加操作权限
        Route::get('/addPermission', ['middleware' => 'level:1', 'uses' => 'PermissionController@addPermission']);
        //  创建操作权限
        Route::post('/createPermission', ['middleware' => 'level:1', 'uses' => 'PermissionController@createPermission']);
        //  删除操作权限
        Route::get('/deletePermission/{permissionID}', ['middleware' => 'level:1', 'uses' => 'PermissionController@deletePermission']);
        //  编辑操作权限
        Route::get('/editPermission/{permissionID}', ['middleware' => 'level:1', 'uses' => 'PermissionController@editPermission']);
        //  修改操作权限
        Route::post('/updatePermission', ['middleware' => 'level:1', 'uses' => 'PermissionController@updatePermission']);
    });


        



/*
||--------------------------------------------------------------------------------------
||     -------------------------- 后台用户模块 ------------------------------
||--------------------------------------------------------------------------------------
 */

    Route::group(['prefix'=>'/users','namespace'=>'users'],function(){
        
        //用户列表
        Route::get('/userList', ['middleware' => 'permission:user.list', 'uses' =>'indexController@index']);
        //查看详情
        Route::get('/show/{id}', ['middleware' => 'permission:user.list', 'uses' =>'indexController@show']);
        //添加用户
        Route::get('/addUser',['middleware' => 'permission:add.user', 'uses' =>'indexController@create']);
        //添加用户
        Route::post('/insert',['middleware' => 'permission:add.user', 'uses' =>'indexController@insert']);
        //编辑用户
        Route::get('editUser/{id}',['middleware' => 'permission:edit.user', 'uses' =>'indexController@edit']);
        //修改用户
        Route::post('update/{id}',['middleware' => 'permission:edit.user', 'uses' =>'indexController@update']);
        //删除用户
        Route::get('delUser/{id}',['middleware' => 'permission:delete.user', 'uses' =>'indexController@delete']);
        //重置密码
        Route::any('resetPass/{id}',['middleware' => 'permission:resetPass.user', 'uses' =>'indexController@resetPass']);
        //更改用户状态
        Route::post('changeStatus',['middleware' => 'permission:changeStatus.user', 'uses' =>'indexController@changeStatus']);


        //我的关注friendsController
        Route::get('focusList/{id}',['middleware' => 'permission:user.list', 'uses' =>'friendsController@focusList']);
        //我的好友
        Route::get('friendsList/{id}',['middleware' => 'permission:user.list', 'uses' =>'friendsController@friendsList']);
        //我的关注删除
        Route::get('delFocus/{userId}/{id}',['middleware' => 'permission:delete.user', 'uses' =>'friendsController@delete']);
        //我的好友删除
        Route::get('delFriends/{userId}/{id}',['middleware' => 'permission:delete.user', 'uses' =>'friendsController@destroy']);




        // -------------------------- 名师路由组 ------------------------------//
        Route::get('famousTeacherList','famousTeacherController@index');
        Route::get('addFamousTeacher','famousTeacherController@create');
        Route::post('insertTeacher','famousTeacherController@insert');
        //编辑名师
        Route::get('editFamousTeacher/{id}','famousTeacherController@editFamousTeacher');
        //执行编辑
        Route::post('doEditFamousTeacher','famousTeacherController@doEditFamousTeacher');
        //删除
        Route::get('delFamousTeacher/{id}','famousTeacherController@delFamousTeacher');


        //名师推荐
        Route::get('recommendFamousList','recommendFamousController@recommendFamousList');
        //添加名师推荐
        Route::get('addRecommendFamous','recommendFamousController@addRecommendFamous');
        Route::post('doAddRecommendFamous','recommendFamousController@doAddRecommendFamous');
        //编辑
        Route::get('editRecommendFamous/{id}','recommendFamousController@editRecommendFamous');
        Route::post('doEditRecommendFamous','recommendFamousController@doEditRecommendFamous');
        //删除
        Route::get('delRecommendFamous/{id}','recommendFamousController@delRecommendFamous');






        //省市联动
        Route::post('province','indexController@province');
        //检查唯一性接口
        Route::post('unique/{table}/{column}','indexController@unique');
    });

    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 导入导出模块 ------------------------------
    ||--------------------------------------------------------------------------------------
     */

    Route::group(['prefix'=>'/excel','namespace'=>'excels'],function(){

        //导入用户信息
        Route::post('userInfoImport','ExcelController@userInfoImport');
        //导出用户信息
        Route::post('userInfoExport','ExcelController@userInfoExport');
        //下载用户导入模板
        Route::get('userInfoTemplate','ExcelController@userInfoTemplate');

        //导出订单
        Route::post('orderExport','ExcelController@orderExport');

        //导出播放统计
        Route::post('specialCountExport','ExcelController@specialCountExport');

        //导出用户统计
        Route::post('userCountExport','ExcelController@userCountExport');

    });




    /*
||--------------------------------------------------------------------------------------
||     -------------------------- 专题课程模块 ------------------------------
||--------------------------------------------------------------------------------------
 */
    Route::group(['prefix' => '/specialCourse', 'namespace' => 'specialCourse'], function () {
        //专题课程列表
        Route::get('specialCourseList', 'SpecialCourseController@specialCourseList');
        //添加专题课程
        Route::get('addSpecialCourse', 'SpecialCourseController@addSpecialCourse');
        Route::post('doAddSpecialCourse','SpecialCourseController@doAddSpecialCourse');
        //编辑专题课程
        Route::get('editSpecialCourse/{id}', 'SpecialCourseController@editSpecialCourse');
        Route::post('doEditSpecialCourse','SpecialCourseController@doEditSpecialCourse');
        //删除专题课程
        Route::get('delSpecialCourse/{id}','SpecialCourseController@delSpecialCourse');
        //专题课程状态
        Route::get('specialCourseState','SpecialCourseController@specialCourseState');
        //专题课程详情
        Route::get('detailSpecialCourse/{id}','SpecialCourseController@detailSpecialCourse');


        //专题章节列表
        Route::get('specialChapterList/{id}','SpecialChapterController@specialChapterList');
        //课程章节状态
        Route::get('specialChapterState','SpecialChapterController@specialChapterState');
        //添加课程章节
        Route::get('addSpecialChapter/{id}','SpecialChapterController@addSpecialChapter');
        //执行添加
        Route::post('doAddSpecialChapter','SpecialChapterController@doAddSpecialChapter');
        //编辑章节
        Route::get('editSpecialChapter/{courseid}/{id}','SpecialChapterController@editSpecialChapter');
        //执行编辑
        Route::post('doEditSpecialChapter','SpecialChapterController@doEditSpecialChapter');
        //删除章节
        Route::get('delSpecialChapter/{courseid}/{id}','SpecialChapterController@delSpecialChapter');



        //专题类型列表
        Route::get('specialTypeList','SpecialTypeController@specialTypeList');
        //添加
        Route::get('addSpecialType','SpecialTypeController@addSpecialType');
        //执行添加
        Route::post('doAddSpecialType','SpecialTypeController@doAddSpecialType');
        //编辑
        Route::get('editSpecialType/{id}','SpecialTypeController@editSpecialType');
        //执行编辑
        Route::post('doEditSpecialType','SpecialTypeController@doEditSpecialType');
        //删除
        Route::get('delSpecialType/{id}','SpecialTypeController@delSpecialType');


        //课程意见反馈
        Route::get('specialFeedbackList','SpecialFeedbackController@specialFeedbackList');
        //意见反馈状态
        Route::get('specialFeedbackState','SpecialFeedbackController@specialFeedbackState');
        //删除
        Route::get('delSpecialFeedback/{id}','SpecialFeedbackController@delSpecialFeedback');


        //课程资料列表
        Route::get('dataList/{id}','SpecialDataController@dataList');
        //资料状态
        Route::get('courseDataState','SpecialDataController@courseDataState');
        //添加课程资料
        Route::get('addData/{id}','SpecialDataController@addData');
        //执行添加
        Route::post('doAddData','SpecialDataController@doAddData');
        //上传
        Route::post('doUploadfile','SpecialDataController@doUploadfile');
        //编辑资料
        Route::get('editData/{id}','SpecialDataController@editData');
        Route::post('doEditData','SpecialDataController@doEditData');
        //删除资料
        Route::get('delData/{courseid}/{id}','SpecialDataController@delData');

        //点评视频推荐
        Route::get('recommendSpecialCourseList','recommendCourseController@recommendSpecialCourseList');
        //添加推荐位
        Route::get('addRecommendSpecialCourse','recommendCourseController@addRecommendSpecialCourse');
        Route::post('doAddRecommendSpecialCourse','recommendCourseController@doAddRecommendSpecialCourse');
        //编辑推荐
        Route::get('editRecommendSpecialCourse/{id}','recommendCourseController@editRecommendSpecialCourse');
        Route::post('doEditRecommendSpecialCourse','recommendCourseController@doEditRecommendSpecialCourse');
        //删除
        Route::get('delRecommendSpecialCourse/{id}','recommendCourseController@delRecommendSpecialCourse');

    });



    /*
	||--------------------------------------------------------------------------------------
	||     -------------------------- 点评课程模块 ------------------------------
	||--------------------------------------------------------------------------------------
	 */
    Route::group(['prefix'=>'/commentCourse','namespace'=>'commentCourse'],function(){
        //演奏视频列表
        Route::get('commentCourseList','commentCourseController@commentCourseList');
        //审核状态
        Route::get('commentState','commentCourseController@commentState');
        //课程状态
        Route::get('comcourseState','commentCourseController@comcourseState');
        //添加演奏视频
        Route::get('addCommentCourse','commentCourseController@addCommentCourse');
        //编辑演奏视频
        Route::get('editCommentCourse/{id}','commentCourseController@editCommentCourse');
        Route::post('doEditCommentCourse','commentCourseController@doEditCommentCourse');
        //删除演奏视频
        Route::get('delCommentCourse/{id}','commentCourseController@delCommentCourse');
        //审核未通过
        Route::post('noPassMsg','commentCourseController@noPassMsg');
        //视频详情
        Route::get('detailCommentCourse/{id}','commentCourseController@detailCommentCourse');
        //审核通过给名师发送短信提示
        Route::get('sendMessage/{phone}/{orderSn}','commentCourseController@sendMessage');


        //名师点评视频
        Route::get('teacherCourseList','teacherCourseController@teacherCourseList');
        //名师审核状态
        Route::get('teacherState','teacherCourseController@teacherState');
        //名师课程状态
        Route::get('teaccourseState','teacherCourseController@teaccourseState');
        //名师点评详情
        Route::get('detailTeacherCommentCourse/{id}','teacherCourseController@detailTeacherCommentCourse');
        //编辑点评视频
        Route::get('editTeacherCourse/{id}','teacherCourseController@editTeacherCourse');
        Route::post('doEditTeacherCourse','teacherCourseController@doEditTeacherCourse');
        //删除名师点评
        Route::get('delTeacherCourse/{id}','teacherCourseController@delTeacherCourse');
        //审核通过给学员发送短信提示
        Route::post('sendStudentMessage','teacherCourseController@sendStudentMessage');


        //点评视频推荐
        Route::get('recommendCourseList','recommendController@recommendCourseList');
        //添加推荐位
        Route::get('addRecommendCourse','recommendController@addRecommendCourse');
        Route::post('doAddRecommendCourse','recommendController@doAddRecommendCourse');
        //编辑推荐
        Route::get('editRecommendCourse/{id}','recommendController@editRecommendCourse');
        Route::post('doEditRecommendCourse','recommendController@doEditRecommendCourse');
        //删除
        Route::get('delRecommendCourse/{id}','recommendController@delRecommendCourse');
    });



    /*
        ||--------------------------------------------------------------------------------------
        ||     -------------------------- 订单管理模块 ------------------------------
        ||--------------------------------------------------------------------------------------
         */
    Route::group(['prefix'=>'/order','namespace'=>'order'],function(){
        //订单列表
        Route::get('orderList/{status}','orderController@orderList');
        //订单状态
        Route::get('orderState','orderController@orderState');
        //删除订单
        Route::get('delOrder/{id}/{status}','orderController@delOrder');
        //添加订单备注
        Route::post('remark','orderController@remark');
        //修改应退金额
        Route::get('editRefundmoney/{id}/{status}','orderController@editRefundmoney');
        //执行确认应退金额
        Route::post('doRefundmoney','orderController@doRefundmoney');
        //修改已退金额
        Route::get('editRetiredmoney/{id}/{status}','orderController@editRetiredmoney');
        //执行确认已退金额
        Route::post('doRetiredmoney','orderController@doRetiredmoney');
        //备注列表
        Route::get('remarkList/{id}','orderController@remarkList');
        //删除备注
        Route::get('delRemark/{orderid}/{id}','orderController@delRemark');


        //退款列表
        Route::get('refundList/{orderSn}','orderController@refundList');
        //退款状态
        Route::get('refundState','orderController@refundState');
        //删除退款
        Route::get('delRefund/{orderSn}/{id}','orderController@delRefund');

        //确认退款
        Route::get('weiXinRefund/{orderSn}','orderController@weiXinRefund');
    });


 /*
||--------------------------------------------------------------------------------------
||     -------------------------- 评论回复管理 ------------------------------
||--------------------------------------------------------------------------------------
*/
Route::group(['prefix'=>'/commentReply','namespace'=>'commentReply'],function(){

    //演奏点评视频评论列表
    Route::get('applyCommentList',['middleware' => 'permission:commentReply.list', 'uses' => 'applyCommentController@applyCommentList']);
    //修改
    Route::get('editapplyComment/{id}',['middleware' => 'permission:edit.commentReply', 'uses' => 'applyCommentController@editapplyComment']);
    //修改方法
    Route::post('editsapplyComment',['middleware' => 'permission:edit.commentReply', 'uses' => 'applyCommentController@editsapplyComment']);
    //删除
    Route::get('delapplyComment/{id}',['middleware' => 'permission:delete.commentReply', 'uses' => 'applyCommentController@delapplyComment']);
    //课程状态
    Route::get('applyCommentStatus',['middleware' => 'permission:edit.commentReply', 'uses' => 'applyCommentController@applyCommentStatus']);
    //审核状态
    Route::get('applyCommentChecks',['middleware' => 'permission:edit.commentReply', 'uses' => 'applyCommentController@applyCommentChecks']);


    //课程评论列表
    Route::get('courseCommentList',['middleware' => 'permission:commentReply.list', 'uses' => 'courseCommentController@courseCommentList']);
    //修改
    Route::get('editcourseComment/{id}',['middleware' => 'permission:edit.commentReply', 'uses' => 'courseCommentController@editcourseComment']);
    //修改方法
    Route::post('editscourseComment',['middleware' => 'permission:edit.commentReply', 'uses' => 'courseCommentController@editscourseComment']);
    //删除
    Route::get('delcourseComment/{id}',['middleware' => 'permission:delete.commentReply', 'uses' => 'courseCommentController@delcourseComment']);
    //课程状态
    Route::get('courseCommentStatus',['middleware' => 'permission:edit.commentReply', 'uses' => 'courseCommentController@courseCommentStatus']);
    //审核状态
    Route::get('courseCommentChecks',['middleware' => 'permission:edit.commentReply', 'uses' => 'courseCommentController@courseCommentChecks']);

});


/*
||--------------------------------------------------------------------------------------
||     -------------------------- 用户收藏管理 ------------------------------
||--------------------------------------------------------------------------------------
*/

Route::group(['prefix'=>'/collection','namespace'=>'collection'],function(){

    //用户收藏列表
    Route::get('collectionList',['middleware' => 'permission:collection.list', 'uses' => 'collectionController@collectionList']);

    //删除
    Route::get('delcollection/{id}',['middleware' => 'permission:delete.collection', 'uses' => 'collectionController@delcollection']);


});

/*
||--------------------------------------------------------------------------------------
||     -------------------------- 内容管理 ------------------------------
||--------------------------------------------------------------------------------------
*/

Route::group(['prefix'=>'/contentManager','namespace'=>'contentManager'],function(){

    //banner列表
    Route::get('bannerList',['middleware' => 'permission:contentManager.list', 'uses' => 'bannerController@bannerList']);
    //修改
    Route::get('editbanner/{id}',['middleware' => 'permission:edit.contentManager', 'uses' => 'bannerController@editbanner']);
    //修改方法
    Route::post('editsbanner',['middleware' => 'permission:edit.contentManager', 'uses' => 'bannerController@editsbanner']);
    //添加
    Route::get('addbanner',['middleware' => 'permission:add.contentManager', 'uses' => 'bannerController@addbanner']);
    //添加方法
    Route::post('addsbanner',['middleware' => 'permission:add.contentManager', 'uses' => 'bannerController@addsbanner']);
    //删除
    Route::get('delbanner/{id}',['middleware' => 'permission:delete.contentManager', 'uses' => 'bannerController@delbanner']);
    //激活锁定
    Route::get('bannerStatus',['middleware' => 'permission:edit.contentManager', 'uses' => 'bannerController@bannerStatus']);



    //合作伙伴列表
    Route::get('partnerList',['middleware' => 'permission:contentManager.list', 'uses' => 'partnerController@partnerList']);
    //修改
    Route::get('editpartner/{id}',['middleware' => 'permission:edit.contentManager', 'uses' => 'partnerController@editpartner']);
    //修改方法
    Route::post('editspartner',['middleware' => 'permission:edit.contentManager', 'uses' => 'partnerController@editspartner']);
    //添加
    Route::get('addpartner',['middleware' => 'permission:add.contentManager', 'uses' => 'partnerController@addpartner']);
    //添加方法
    Route::post('addspartner',['middleware' => 'permission:add.contentManager', 'uses' => 'partnerController@addspartner']);
    //删除
    Route::get('delpartner/{id}',['middleware' => 'permission:delete.contentManager', 'uses' => 'partnerController@delpartner']);
    //激活锁定
    Route::get('partnerStatus',['middleware' => 'permission:edit.contentManager', 'uses' => 'partnerController@partnerStatus']);


    //热门视频列表
    Route::get('hotvideoList',['middleware' => 'permission:contentManager.list', 'uses' => 'hotvideoController@hotvideoList']);
    //修改
    Route::get('edithotvideo/{id}',['middleware' => 'permission:edit.contentManager', 'uses' => 'hotvideoController@edithotvideo']);
    //修改方法
    Route::post('editshotvideo',['middleware' => 'permission:edit.contentManager', 'uses' => 'hotvideoController@editshotvideo']);
    //添加
    Route::get('addhotvideo',['middleware' => 'permission:add.contentManager', 'uses' => 'hotvideoController@addhotvideo']);
    //添加方法
    Route::post('addshotvideo',['middleware' => 'permission:add.contentManager', 'uses' => 'hotvideoController@addshotvideo']);
    //删除
    Route::get('delhotvideo/{id}',['middleware' => 'permission:delete.contentManager', 'uses' => 'hotvideoController@delhotvideo']);
    //激活锁定
    Route::get('hotvideoStatus',['middleware' => 'permission:edit.contentManager', 'uses' => 'hotvideoController@hotvideoStatus']);
    //上传资源
    Route::post('dohotvideo','hotvideoController@dohotvideo');


    //社区名师推荐
    Route::get('recteacherList',['middleware' => 'permission:contentManager.list', 'uses' => 'recteacherController@recteacherList']);
    //修改
    Route::get('editrecteacher/{id}',['middleware' => 'permission:edit.contentManager', 'uses' => 'recteacherController@editrecteacher']);
    //修改方法
    Route::post('editsrecteacher',['middleware' => 'permission:edit.contentManager', 'uses' => 'recteacherController@editsrecteacher']);
    //添加
    Route::get('addrecteacher',['middleware' => 'permission:add.contentManager', 'uses' => 'recteacherController@addrecteacher']);
    //添加方法
    Route::post('addsrecteacher',['middleware' => 'permission:add.contentManager', 'uses' => 'recteacherController@addsrecteacher']);
    //删除
    Route::get('deleterecteacher/{id}',['middleware' => 'permission:delete.contentManager', 'uses' => 'recteacherController@deleterecteacher']);


    //新闻资讯列表
    Route::get('newsList',['middleware' => 'permission:contentManager.list', 'uses' => 'newsController@newsList']);
    //修改
    Route::get('editnews/{id}',['middleware' => 'permission:edit.contentManager', 'uses' => 'newsController@editnews']);
    //修改方法
    Route::post('editsnews',['middleware' => 'permission:edit.contentManager', 'uses' => 'newsController@editsnews']);
    //添加
    Route::get('addnews',['middleware' => 'permission:add.contentManager', 'uses' => 'newsController@addnews']);
    //添加方法
    Route::post('addsnews',['middleware' => 'permission:add.contentManager', 'uses' => 'newsController@addsnews']);
    //删除
    Route::get('delnews/{id}',['middleware' => 'permission:delete.contentManager', 'uses' => 'newsController@delnews']);
    //锁定激活
    Route::get('newsStatus',['middleware' => 'permission:edit.contentManager', 'uses' => 'newsController@newsStatus']);

});



/*
||--------------------------------------------------------------------------------------
||     -------------------------- 活动赛事 ------------------------------
||--------------------------------------------------------------------------------------
*/
    Route::group(['prefix'=>'/activity','namespace'=>'activity'],function(){
        //活动赛事列表
        Route::get('activityList',['middleware' => 'permission:activity.list', 'uses' => 'activityController@activityList']);
        //添加
        Route::get('addactivity',['middleware' => 'permission:add.activity', 'uses' => 'activityController@addactivity']);
        //添加方法
        Route::post('addsactivity',['middleware' => 'permission:add.activity', 'uses' => 'activityController@addsactivity']);
        //编辑
        Route::get('editactivity/{id}',['middleware' => 'permission:edit.activity', 'uses' => 'activityController@editactivity']);
        //编辑方法
        Route::post('editsactivity',['middleware' => 'permission:edit.activity', 'uses' => 'activityController@editsactivity']);
        //删除
        Route::get('delactivity/{id}',['middleware' => 'permission:delete.activity', 'uses' => 'activityController@delactivity']);
        //活动状态
        Route::get('activityStatus',['middleware' => 'permission:edit.activity', 'uses' => 'activityController@activityStatus']);

    });


    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 关于我们 ------------------------------
    ||--------------------------------------------------------------------------------------
    */
    Route::group(['prefix'=>'/aboutUs','namespace'=>'aboutUs'],function(){
        //公司介绍列表
        Route::get('firmIntroList',['middleware' => 'permission:aboutus.list', 'uses' => 'firmIntroController@firmIntroList']);
        //编辑页面
        Route::get('editfirmIntro/{id}',['middleware' => 'permission:edit.aboutus', 'uses' => 'firmIntroController@editfirmIntro']);
        //编辑方法
        Route::post('editsfirmIntro',['middleware' => 'permission:edit.aboutus', 'uses' => 'firmIntroController@editsfirmIntro']);

        //友情链接列表
        Route::get('friendlinkList',['middleware' => 'permission:aboutus.list', 'uses' => 'friendlinkController@friendlinkList']);
        //编辑页面
        Route::get('editfriendlink/{id}',['middleware' => 'permission:edit.aboutus', 'uses' => 'friendlinkController@editfriendlink']);
        //编辑方法
        Route::post('editsfriendlink',['middleware' => 'permission:edit.aboutus', 'uses' => 'friendlinkController@editsfriendlink']);
        //删除
        Route::get('delfriendlink/{id}',['middleware' => 'permission:delete.aboutus', 'uses' => 'friendlinkController@delfriendlink']);
        //添加页面
        Route::get('addfriendlink',['middleware' => 'permission:add.aboutus', 'uses' => 'friendlinkController@addfriendlink']);
        //添加方法
        Route::post('addsfriendlink',['middleware' => 'permission:add.aboutus', 'uses' => 'friendlinkController@addsfriendlink']);
        //状态
        Route::get('frinendStatus',['middleware' => 'permission:edit.aboutus', 'uses' => 'friendlinkController@frinendStatus']);

    });



    /*
   ||--------------------------------------------------------------------------------------
   ||     -------------------------- 公司后台用户管理 ------------------------------
   ||--------------------------------------------------------------------------------------
   */
    Route::group(['prefix'=>'/companyUser','namespace'=>'companyUser'],function(){

        //列表
        Route::get('companyUserList',['middleware' => 'permission:companyUser.list', 'uses' => 'companyUserController@companyUserList']);
        //添加
        Route::get('addcompanyUser',['middleware' => 'permission:add.companyUser', 'uses' => 'companyUserController@addcompanyUser']);
        //添加方法
        Route::post('addscompanyUser',['middleware' => 'permission:add.companyUser', 'uses' => 'companyUserController@addscompanyUser']);
        //编辑
        Route::get('editcompanyUser/{id}',['middleware' => 'permission:edit.companyUser', 'uses' => 'companyUserController@editcompanyUser']);
        //编辑方法
        Route::post('editscompanyUser',['middleware' => 'permission:edit.companyUser', 'uses' => 'companyUserController@editscompanyUser']);
        //删除
        Route::get('delcompanyUser/{id}',['middleware' => 'permission:delete.companyUser', 'uses' => 'companyUserController@delcompanyUser']);
        //状态
        Route::get('companyStatus',['middleware' => 'permission:edit.companyUser', 'uses' => 'companyUserController@companyStatus']);
        //重置密码页面
        Route::get('resetPassword/{id}',['middleware' => 'permission:edit.companyUser', 'uses' => 'companyUserController@resetPassword']);
        //密码提交修改
        Route::post('resetsPassword',['middleware' => 'permission:edit.companyUser', 'uses' => 'companyUserController@resetsPassword']);
        //ajax部门取岗位接口
        Route::get('departPost','companyUserController@departPost');


    });



    /*
  ||--------------------------------------------------------------------------------------
  ||     -------------------------- 部门岗位管理 ------------------------------
  ||--------------------------------------------------------------------------------------
  */
    Route::group(['prefix'=>'/departmentPost','namespace'=>'departmentPost'],function(){

        Route::get('departmentList',['middleware' => 'permission:departmentpost.list', 'uses' => 'departmentController@departmentList']);
        //添加
        Route::get('adddepartment',['middleware' => 'permission:add.departmentpost', 'uses' => 'departmentController@adddepartment']);
        //添加方法
        Route::post('addsdepartment',['middleware' => 'permission:add.departmentpost', 'uses' => 'departmentController@addsdepartment']);
        //编辑
        Route::get('editdepartment/{id}',['middleware' => 'permission:edit.departmentpost', 'uses' => 'departmentController@editdepartment']);
        //编辑方法
        Route::post('editsdepartment',['middleware' => 'permission:edit.departmentpost', 'uses' => 'departmentController@editsdepartment']);
        //删除
        Route::get('deldepartment/{id}',['middleware' => 'permission:delete.departmentpost', 'uses' => 'departmentController@deldepartment']);
        //状态
        Route::get('departmentStatus',['middleware' => 'permission:edit.departmentpost', 'uses' => 'departmentController@departmentStatus']);



        //岗位列表
        Route::get('postList',['middleware' => 'permission:departmentpost.list','uses' => 'postController@postList']);
        //添加
        Route::get('addpost',['middleware' => 'permission:add.departmentpost', 'uses' => 'postController@addpost']);
        //添加方法
        Route::post('addspost',['middleware' => 'permission:add.departmentpost', 'uses' => 'postController@addspost']);
        //编辑
        Route::get('editpost/{id}',['middleware' => 'permission:edit.departmentpost', 'uses' => 'postController@editpost']);
        //编辑方法
        Route::post('editspost',['middleware' => 'permission:edit.departmentpost', 'uses' => 'postController@editspost']);
        //删除
        Route::get('delpost/{id}',['middleware' => 'permission:delete.departmentpost', 'uses' => 'postController@delpost']);
        //状态
        Route::get('postStatus',['middleware' => 'permission:edit.departmentpost', 'uses' => 'postController@postStatus']);

    });





    /*
   ||--------------------------------------------------------------------------------------
   ||     -------------------------- 后台回收站模块 ------------------------------
   ||--------------------------------------------------------------------------------------
    */
    Route::group(['prefix' => '/recycle', 'namespace' => 'recycle'], function () {
        //专题课程列表
        Route::get('recycleCourseList','RecycleCourseController@recycleCourseList');
        //还原
        Route::get('editRecycleCourse/{id}','RecycleCourseController@editRecycleCourse');
        //彻底删除专题课程
        Route::get('delRecycleCourse/{id}','RecycleCourseController@delRecycleCourse');


        //演奏视频列表
        Route::get('recycleCommentCourseList','RecycleCourseController@recycleCommentCourseList');
        //还原
        Route::get('editRecycleCommentCourse/{id}','RecycleCourseController@editRecycleCommentCourse');
        //彻底删除
        Route::get('delRecycleCommentCourse/{id}','RecycleCourseController@delRecycleCommentCourse');


        //点评视频列表
        Route::get('recycleTeacherCourseList','RecycleCourseController@recycleTeacherCourseList');
        //还原
        Route::get('editRecycleTeacherCourse/{id}','RecycleCourseController@editRecycleTeacherCourse');
        //彻底删除
        Route::get('delRecycleTeacherCourse/{id}','RecycleCourseController@delRecycleTeacherCourse');


        //订单列表
        Route::get('recycleOrderList','RecycleCourseController@recycleOrderList');
        //还原
        Route::get('editRecycleOrder/{id}','RecycleCourseController@editRecycleOrder');
        //彻底删除
        Route::get('delRecycleOrder/{id}','RecycleCourseController@delRecycleOrder');
    });


    /*
    ||--------------------------------------------------------------------------------------
    ||     -------------------------- 后台通知管理 ------------------------------
    ||--------------------------------------------------------------------------------------
    */
    Route::group(['prefix' => '/notice', 'namespace' => 'notice'], function () {
        // 通知列表
        Route::get('noticeList',['middleware' => 'permission:list.notice', 'uses' => 'noticeController@noticeList']);
        // 发送通知页
        Route::get('addNotice', ['middleware' => 'permission:add.notice', 'uses' => 'noticeController@addNotice']);
        // 执行添加通知
        Route::post('doAddNotice',['middleware' => 'permission:add.notice', 'uses' => 'noticeController@doAddNotice']);
        // 删除通知信息
        Route::get('delNotice/{id}',['middleware' => 'permission:del.notice', 'uses' => 'noticeController@delNotice']);
        // 修改通知信息页
        Route::get('editNotice/{id}',['middleware' => 'permission:edit.notice', 'uses' => 'noticeController@editNotice']);
        // 执行修改通知信息
        Route::post('doEditNotice', ['middleware' => 'permission:edit.notice', 'uses' => 'noticeController@doEditNotice']);

        // 通知模板列表
        Route::get('noticeTemList',['middleware' => 'permission:list.noticeTem', 'uses' => 'noticeController@noticeTemList']);
        // 添加通知模板
        Route::get('addNoticeTem', ['middleware' => 'permission:add.noticeTem', 'uses' => 'noticeController@addNoticeTem']);
        // 执行添加通知模板
        Route::post('doAddNoticeTem', ['middleware' => 'permission:add.noticeTem', 'uses' => 'noticeController@doAddNoticeTem']);
        // 删除通知模板
        Route::get('delNoticeTem/{id}',['middleware' => 'permission:del.noticeTem', 'uses' => 'noticeController@delNoticeTem']);
        // 通知模板修改页
        Route::get('editNoticeTem/{id}',['middleware' => 'permission:edit.noticeTem', 'uses' => 'noticeController@editNoticeTem']);
        // 执行通知模板修改
        Route::post('doEditNoticeTem', ['middleware' => 'permission:edit.noticeTem', 'uses' => 'noticeController@doEditNoticeTem']);
    });

    /*
       ||--------------------------------------------------------------------------------------
       ||     -------------------------- 后台日志管理 ------------------------------
       ||--------------------------------------------------------------------------------------
       */

    Route::group(['prefix'=>'/logs','namespace'=>'logs'],function(){

        //后台日志管理列表
        Route::get('logList','indexController@logList');
        //日志删除
        Route::get('deleteLog/{tableName}/{id}/{time?}','indexController@destroy');

    });


    /*
       ||--------------------------------------------------------------------------------------
       ||     -------------------------- 后台数据统计 ------------------------------
       ||--------------------------------------------------------------------------------------
       */

    Route::group(['prefix'=>'/count','namespace'=>'count'],function(){
        //注册用户数展示列表
        Route::get('userCountList','userCountController@userCountList');
        //用户统计数计算
        Route::get('userCount/{time?}/{orders?}','userCountController@userCount');

        //订单数
        Route::get('orderCountList','userCountController@orderCountList');

        //专题课程播放统计
        Route::get('specialCountList','countController@specialCountList');
    });
});












