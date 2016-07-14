<?php
namespace App\commonApi\Messages;

class Messages {

    public $phone;
    public $content;
    public $returnCode;

    public function setInfo($phone,$content){
        $this->phone = $phone;
        $this->content = $content;
    }

    public function sendMsg(){

        $sn="SUD-KEY-010-00408";

        $pwd="6032FBF20A8B3EF1DE4614F1E557D2FB";

        $mobile=$this -> phone;

        $content=$this->content;

        $ext='';

        $rrid='';

        $stime='';

        $stype=1;

        $ssafe=1;

        $scode=1;                //1表示UTF-8，2表示GB2312

        $MARK = "|";

        $Md5key="4r6tg9";

        $Md5Sign=md5($sn.$MARK.$pwd.$MARK.$mobile.$MARK.$content.$MARK.$ext.$MARK.$rrid.$MARK.$stime.$MARK.$stype.$MARK.$ssafe.$MARK.$scode.$MARK.$Md5key);

        $target = "http://sdk8.interface.sudas.cn/z_mdsmssend.php";

        $subdate="sn=".$sn."&pwd=".$pwd."&Md5Sign=".$Md5Sign."&mobile=".$mobile."&content=".urlencode($content)."&ext=".$ext."&stime=".$stime."&rrid=".$rrid."&stype=".$stype."&ssafe=".$ssafe."&scode=".$scode;

        $sendMsgID=$this->SudasSmsPost($target,$subdate);

        return $sendMsgID;

    }

    //-2	帐号/密码不正确	1.序列号未注册2.密码加密不正确3.密码已被修改
    //-4	余额不足	直接调用查询余额是否为0或不足
    //-5	数据格式错误
    //-6	参数有误	看参数传的是否均正常,请调试程序查看各参数
    //-7	权限受限	该序列号是否已经开通了调用该方法的权限
    //-8	流量控制错误
    //-9	扩展码权限错误	该序列号是否已经开通了扩展子号的权限
    //-10	短信内容过长
    //-12	序列号状态错误	序列号是否被禁用
    //-13	内容包含关键字
    //-14	服务器写文件失败
    //-15	文件内容base64编码错误
    //-17	没有权限
    //-18	上次提交没有等待返回不能继续提交
    //-19	禁止同时使用多个接口地址
    //-20	数据校验错误	MD5Sign值校验有误。加密顺序见参数表
    //-21	号码超限制	号码数量超过通道最大限制
    function SudasSmsPost($url,$request)
    {
        $output=true;

        $show_header=false;

        $ch=curl_init();

        curl_setopt($ch, CURLOPT_URL,$url);

        curl_setopt($ch, CURLOPT_POSTFIELDS,$request);    //发送的数据

        curl_setopt($ch, CURLOPT_RETURNTRANSFER,$output); //设定返回的数据是否自动显示

        curl_setopt($ch, CURLOPT_HEADER,$show_header);    //设定是否显示头信息

        $ReturnData = curl_exec($ch);

        curl_close($ch);

        return $ReturnData;
    }

    public function createCode(){
        return str_shuffle(mt_rand(100, 999). "" .mt_rand(100, 999));
    }

    public function response($sendMsgID,$code){

        if($sendMsgID > 1){
            return Response() -> json(["type" => true, "info" => $code]);
        }else{
            return Response() -> json(["type" => false, "info" => $sendMsgID]);
        }
    }

}
