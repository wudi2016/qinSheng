<?php

namespace Primecloud\Pass\Kernel;

use Primecloud\Pass\Kernel\PassBase as Http;
use Primecloud\Pass\Kernel\Config;

class User
{
    public $http;
	public $url;
    public $AppID;
    public $host;

    public function __construct() 
    {
	    $this -> url = Config::Url;
		$this -> AppID = Config::AppID;
		$this -> host = $_SERVER['HTTP_HOST'];
		$this -> http = Http::create() -> init($this -> url);
    }


	/*
     *申请app
	*/
	public function apply()
	{
		$array = $this -> http -> get([
		    'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@". $this -> host ."/user/UserApplyLicense",
			'Referer' => "http://". $this -> host .""
		]);
		if ($array['code'] == '407') {
			return false;
		} else {
			(!isset($_COOKIE['sessionid']) || $_COOKIE['sessionid'] != $array['data']['License']) && setcookie("sessionid", $array['data']['License'], time() + 10 * 60, '/');
			return $array;
		}
	}


    /*
     * 登陆login
     */
    public function login($userName, $userPassword)
    {
		return $info = $this -> http -> post(
	        [
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserLogin",
				'Referer' => "http://". $this -> host .""
	        ],
	        [
	        	'userName' => $userName,
	        	'userPassword' => $userPassword
	        ]
        );
    }


	/*
	*获取登录状态信息
	*/
	public function loginstatus()
	{
		return $array = $this -> http -> get([
		    'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserwhetherLogin",
			'Referer' => "http://". $this -> host .""
		]);
	}


    /*
     * 注册register
     */
    public function register($userName, $userPassword, $email, $phone) 
    {
		return $info = $this -> http -> post(
			[	
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserRegister",
				'Referer' => "http://". $this -> host .""
			],
			[
				'userName' => $userName,
				'userPassword' => $userPassword,
				'email' => $email,
				'phone' => $phone
			]
		);
    }


	/*
	* 修改密码repasswd
	*/
	public function repasswd($oldpwd, $newpwd)
	{   
		return $info = $this -> http -> post(
			[
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserUpdatePassword",
				'Referer' => "http://". $this -> host .""
			],
			[
				'oldPassword' => $oldpwd,
				'newPassword' => $newpwd
			]
		);
        //注册以后的操作
	}


	/*
     * 用户注销接口
     */
	 public function login_exists()
	 {
		return $arr = $this -> http -> get([
			'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserExit",
			'Referer' => "http://". $this -> host ."",
		]);
	 }


	 /*
     * 申请注册开发者
     */
	 public function applydeveloper($DeveloperName, $Profile, $Email, $Phone, $papersNum, $Website, $Whether, $PapersType)
	 {
		return $info = $this -> http -> post(
			[
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/DeveloperInfo",
				'Referer' => "http://". $this -> host .""
			],
			[
				'DeveloperName' => $DeveloperName,
				'Profile' => $Profile, 
				'Email' => $Email,
				'Phone' => $Phone,
				'PapersNum' => $papersNum,
				'Website' => $Website,
				'Whether' => $Whether,
				'PapersType' => $PapersType
			]
		);
	 }


	 /*
	 *申请appid
	 */
	 public function applyid($APPName, $PackageName, $type)
	 {
		 return $info = $this -> http -> post(
			[
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@userID/user/UserCreateAPPID",
				'Referer' => "http://". $this -> host .""
			],
	 		[
	 			'APPName' => $APPName, 
	 			'PackageName' => $PackageName, 
	 			'type' => $type
	 		]
		 );
	 }

	 
	 /*
     * 获取appid列表信息
     */
	 public function getapplist()
	 {
		return $info = $this -> http -> get([
			'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserselectInfo?fristnum=0&addnum=10",
			'Referer' => "http://". $this -> host ."",
		]);
	 }


	/*
	* 修改appid信息
	*/
	public function updateappid($APPName, $PackageName, $type, $appid)
	{
		return $arr = $this -> http -> post(
			[
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserUpdateAPPID",
				'Referer' => "http://". $this -> host ."",
			],
			[
				'APPName' => $APPName, 
				'PackageName' => $PackageName, 
				'type' => $type, 
				'APPID' => $appid
			]
		);
	}


	/*
	 *删除appid
	 */
    public function deleteapplyid($appid)
    {
		return $info = $this -> http -> post(
			[
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/UserDelAppid",
				'Referer' => "http://". $this -> host .""
			],
			[
				'appid' => $appid
			]
		);	
	}


	/*
	* 获取权限列表
	*/
	public function rolelist()
	{
		return	$this -> http -> get([				
			'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/rbac/GetRoleList",
			'Referer' => "http://". $this -> host .""
		]);
		
	}


	//获取有权限的信息列表(根据appid进行查询)
	public function appidrolelist($appid)
	{
		return $this -> http -> get([
			'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/rbac/GetRoleList?APPID=". $appid,
			'Referer' => "http://". $this -> host .""
		]);
	}


	//获取验证码
	public function getcodes($phone)
	{
		return $info = $this -> http -> post(
			[
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/GetAuthCode",
				'Referer' => "http://". $this -> host .""
			],
			[
				'phone' => $phone
			]
		);	
		
	}


	//忘记密码接口
	public function forgetpwds($username, $code, $newpwd)
	{
		return $info = $this -> http -> post(
			[
				'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@user/user/ForgotPwd",
				'Referer' => "http://". $this -> host .""
			],
			[
				'userName' => $username,
				'authcode' => $code,
				'password' => $newpwd
			]
		);	
	}


	/*
	* APP对应的角色的接口(包括添加，删除)
	*/
	public function makerole($pinurl)
	{
		$arr = $this -> http -> get([
			'User-Action' => "web://".$this -> AppID.$this -> http -> GetUriUser() ."@user/rbac/APPIDRoleImp". $pinurl,
			'Referer' => "http://". $this -> host .""
		]);
		return $arr;
	}


    /*
     * 封装post方法
     */
    private function methodpost($geturl, $body) 
    {
        return $info = $this -> http -> post([
	        'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@$geturl",
	        'Referer' => "http://". $this -> host .""
        ],$body);
    }


	/*
	* 封装get方法
	*/
	private function methodget($geturl)
	{
		return $info = $this -> http -> get([
            'User-Action' => "web://". $this -> AppID.$this -> http -> GetUriUser() ."@$geturl",
            'Referer' => "http://". $this -> host .""
        ]);
	}

}