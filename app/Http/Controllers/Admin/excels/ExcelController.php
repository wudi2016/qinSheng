<?php

namespace App\Http\Controllers\Admin\excels;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use DB;
use Excel;
use Input;
use Auth;
use Carbon\Carbon;

class ExcelController extends Controller
{

    /**
     * 用户信息表的导入
     */
    public function userInfoImport()
    {
        return $this->userImport('users');
    }

    /**
     * 用户信息表-->导出下载模板
     */
    public function userInfoTemplate()
    {
        $megs = ['用户账号', '用户姓名', '性别sex(1:男,2:女)', '手机号phone', '钢琴等级(例:钢琴一级)', '学琴年限(例如:2016)', '学琴月份(例如:5)','省code(省管理)', '市code(市管理)','出生年份(例:1996)', '出生月份(例:5)', '出生日(例:25)', '用户身份(学生:0,教师:1)', '所在单位(例:中央音乐学院)', '毕业院校(例:中央音乐学院)', '学历(例:大学)', '职称(例:教授)'];
        $this->template('users', '用户信息导入模板', $megs);
    }

    /**
     * 用户信息表的导出
     */
    public function userInfoExport()
    {
        $info = json_decode($_POST['excels']);
        return $this->export($info, '用户信息表');
    }

    /**
     *导出订单
     */
    public function orderExport(){
        $info = json_decode($_POST['excels']);
        return $this->export($info,'订单表');
    }


    /**
     *封装导入
     */
    public function import($table)
    {
        if (Input::hasFile('excel')) { //判断是否止传文件
            $entension = Input::file('excel')->getClientOriginalExtension();//上传文件的后缀
//            dd($entension);
            if ($entension == 'xls' || $entension == 'xlsx') { //判断上传格式是否是excel格式
                Excel::load(Input::file('excel'), function ($reader) use ($table,&$result) {
                    $reader = $reader->getSheet(0);//获取excel的第几张表
                    $results = $reader->toArray();//获取表中的数据

                    $names = array_shift($results);//将数组中第一条数组取出

                    $info = DB::select("select column_name from information_schema.columns where `TABLE_SCHEMA` = 'qinsheng' and `TABLE_NAME` = ? ", [$table]);
                    foreach ($info as $val) {
                        $datas[$val->column_name] = $val->column_name;
                    }
                    $array = $datas;
                    unset($results[0]);
                    $c = array_diff($names,$array);
                    $flag = empty($c)?1:0;
                    if($flag){
                        foreach ($results as $key => $val) {
                            $data = array_combine($names, $val);

                            if(array_key_exists('startTime',$data)){
                                $time = substr(strrchr($data['startTime'],'-'),1,2).'-'.$data['startTime'];
                                $data['startTime'] = substr($time,0,8);
                            }
                            if(array_key_exists('endTime',$data)){
                                $time = substr(strrchr($data['endTime'],'-'),1,2).'-'.$data['endTime'];
                                $data['endTime'] = substr($time,0,8);
                            }

                            $data['created_at'] = date('Y-m-d H:i:s', time());
                            $data['updated_at'] = date('Y-m-d H:i:s', time());

                            DB::table($table)->insert($data);
                        }
                        $result = '1';
                    }else{
                        $result = '0';
                    }
                });

                if($result){
                    return redirect()->back()->with('status', '信息导入成功');

                }else{
                    return redirect()->back()->withInput()->withErrors('上传模板不匹配');
                }
            } else {
                return redirect()->back()->withInput()->withErrors('上传格式只支持excel');
            }
        } else {
            return redirect()->back()->withInput()->withErrors('没有导入文件');
        }
    }

    /**
     *封装导入
     */
    public function userImport($table)
    {
        if (Input::hasFile('excel')) { //判断是否止传文件
            $entension = Input::file('excel')->getClientOriginalExtension();//上传文件的后缀
            if ($entension == 'xls' || $entension == 'xlsx') { //判断上传格式是否是excel格式
                Excel::load(Input::file('excel'), function ($reader) use ($table,&$result,&$res,&$username,&$phone,&$userFlag,&$phoneFlag) {
                    $reader = $reader->getSheet(0);//获取excel的第几张表
                    $results = $reader->toArray();//获取表中的数据

                    $names = array_shift($results);//将数组中第一条数组取出

                    $info = DB::select("select column_name from information_schema.columns where `TABLE_SCHEMA` = 'qinsheng' and `TABLE_NAME` = ? ", [$table]);
                    foreach ($info as $val) {
                        $datas[$val->column_name] = $val->column_name;
                    }
                    $array = $datas;
                    unset($results[0]);//去除注释行
                    $c = array_diff($names,$array);
                    $flag = empty($c)?1:0;
                    if($flag){
                        //过滤数据库唯一字段重复导入的问题
                        foreach($results as $key=>$val){
                            $res = array_combine($names,$val);
                            if(!empty($res['username'])){
                                if(DB::table('users')->where('username',$res['username'])->where('type','<>','3')->first()){
                                    $username = true;
                                    return $username;
                                }
                                //验证用户名格式
                                if(!preg_match("/^[\x80-\xff_a-zA-Z0-9]{4,16}$/",$res['username'])){
                                    $userFlag = true;
                                    return $userFlag;
                                }
                            }
                            if(!empty($res['phone'])){
                                if(DB::table('users')->where('phone',$res['phone'])->first()){
                                    $phone = true;
                                    return $phone;
                                }
                                //验证手机号格式
                                if(!preg_match('/^[1][358][0-9]{9}$/',$res['phone']) && !preg_match('/^[1][7][07][0-9]{8}$/',$res['phone'])){
                                    $phoneFlag = true;
                                    return $phoneFlag;
                                }
                            }
                        }
                        //导入数据入库
                        foreach ($results as $key => $val) {
                            $data = array_combine($names, $val);
                            $data['created_at'] = Carbon::now();
                            $data['updated_at'] = Carbon::now();
                            $data['password'] = bcrypt('123456');
                            $data['checks'] = 0;
                            //生成邀请码
                            $yaoqingma = '';
                            $randomNum     = ['0','1','2','3','4','5','6','7','8','9'];
                            $randomLowcase = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
                            $randomUpcase  = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
                            $randomarr     = array_merge($randomNum,$randomLowcase,$randomUpcase);
                            $keyarr        = array_rand($randomarr,6);

                            for ($i=0;$i<6;$i++){
                                $yaoqingma .= $randomarr[$keyarr[$i]];
                            }
                            $data['yaoqingma'] = $yaoqingma;

                            DB::table($table)->insert($data);

                        }
                        $result = '1';
                    }else{
                        $result = '0';
                    }
                });
                //如果数据库唯一字段已存在，那么就不导入，直接报错
                if($username) return redirect()->back()->with('errors', "用户名 {$res['username']} 已存在");

                if($phone) return redirect()->back()->with('errors', "手机号 {$res['phone']} 已存在");

                if($userFlag) return redirect()->back()->with('errors', "用户名 {$res['username']} 格式不正确");

                if($phoneFlag) return redirect()->back()->with('errors', "手机号 {$res['phone']} 格式不正确");

                if($result){
                    return redirect()->back()->with('status', '信息导入成功');
                }else{
                    return redirect()->back()->withInput()->withErrors('上传模板不匹配');
                }
            } else {
                return redirect()->back()->withInput()->withErrors('上传格式只支持excel');
            }
        } else {
            return redirect()->back()->withInput()->withErrors('没有导入文件');
        }
    }


    /**
     *封装导出
     */
    public function export($info, $title)
    {
        if(!$info){
            return redirect()->back()->withInput()->withErrors('没有数据可导出');
        }
        foreach ($info as $v) {
            $data[] = get_object_vars($v);
        }
        $titles = array_keys($data[0]);
        $titles = array_combine($titles, $titles);
        array_unshift($data, $titles);
        Excel::create(iconv('UTF-8', 'GBK',$title), function ($excel) use ($data) {
            $excel->sheet('sheet', function ($sheet) use ($data) {
                $sheet->rows($data);
            });
        })->download('xlsx');
    }

    /**
     *封装模板
     */
    public function template($table, $title, $msg)
    {
        $info = DB::select("select column_name from information_schema.columns where `TABLE_SCHEMA` = 'qinsheng' and `TABLE_NAME` = ? ", [$table]);
        foreach ($info as $val) {
            $datas[$val->column_name] = $val->column_name;
        }
        $array = $datas;
        $array['userGrade'] = 1;
        $array['yaoqingma'] = 'yaoqingma';
        $array['fromyaoqingma'] = 'fromyaoqingma';
        $array['pic'] = 'pic';
        $array['password'] = 'password';
        $array['checks'] = 1;
        $array['remember_token'] = 'remember_token';
        $array['email'] = 'email';
        $array['postId'] = 1;
        $array['departId'] = 1;

        if ($array['id']) {
            unset($array['id']);
        }
        if ($array['created_at']) {
            unset($array['created_at']);
        }
        if ($array['updated_at']) {
            unset($array['updated_at']);
        }
        if ($array['userGrade']) {
            unset($array['userGrade']);
        }
        if ($array['yaoqingma']) {
            unset($array['yaoqingma']);
        }
        if ($array['fromyaoqingma']) {
            unset($array['fromyaoqingma']);
        }
        if ($array['pic']) {
            unset($array['pic']);
        }
        if ($array['password']) {
            unset($array['password']);
        }
        if ($array['checks']) {
            unset($array['checks']);
        }
        if ($array['remember_token']) {
            unset($array['remember_token']);
        }
        if ($array['email']) {
            unset($array['email']);
        }
        if ($array['postId']) {
            unset($array['postId']);
        }
        if ($array['departId']) {
            unset($array['departId']);
        }


        $data[] = $array;
        $messages = array_combine($array, $msg);
        $data[1] = $messages;
        Excel::create(iconv('UTF-8', 'GBK',$title), function ($excel) use ($data) {
            $excel->sheet('sheet', function ($sheet) use ($data) {
                $sheet->rows($data);
            });
        })->download('xlsx');
    }
}
