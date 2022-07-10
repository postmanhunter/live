<?php
/**
 * 分销
 */
class Api_Agent extends PhalApi_Api {

	public function getRules() {
		return array(
            'getCode' => array(
				'uid' => array('name' => 'uid', 'type' => 'int', 'desc' => '用户ID'),
				'token' => array('name' => 'token', 'type' => 'string', 'desc' => '用户token'),
			),

			'checkAgent'=>array(
				'uid' => array('name' => 'uid', 'type' => 'int', 'desc' => '用户ID'),
                'token' => array('name' => 'token', 'type' => 'string', 'desc' => '用户token'),
			),
		);
	}
	

	/**
	 * 分享信息
	 * @desc 用于 获取分享信息
	 * @return int code 操作码，0表示成功
	 * @return array info 
	 * @return string info[0].code 邀请码
	 * @return string info[0].href 二维码链接
	 * @return string info[0].qr 二维码图片链接
	 * @return string msg 提示信息
	 */
	public function getCode() {
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
		
        $uid=checkNull($this->uid);
        $token=checkNull($this->token);
        
        $checkToken = checkToken($uid,$token);
		if($checkToken==700){
			$rs['code']=700;
			$rs['msg']='您的登陆状态失效，请重新登陆！';
			return $rs;
		}
		
		$domain = new Domain_Agent();
		$info = $domain->getCode($uid);
        
        if(!$info){
            $rs['code']=1001;
			$rs['msg']='信息错误';
			return $rs;
        }

		$href=get_upload_path('/portal/index/scanqr');
		$info['href']=$href;
        $qr=scerweima($href);
        $info['qr']=get_upload_path($qr);
        
		$rs['info'][0]=$info;
		return $rs;			
	}


	/**
	 * 获取邀请开关和邀请码必填开关以及用户是否设置了邀请码
	 * @desc 用于 获取邀请开关和邀请码必填开关以及用户是否设置了邀请码
	 * @return int code 操作码，0表示成功
	 * @return array info 
	 * @return int info[0]. agent_switch 邀请开关 1打开 0关闭
	 * @return int info[0]. agent_must 邀请码是否必填 1是 0否
	 * @return int info[0]. has_agent 是否已经设置过邀请码 1是 0否
	 * @return string msg 提示信息
	 */
	public function checkAgent(){

		$rs = array('code' => 0, 'msg' => '', 'info' => array());

		$uid=checkNull($this->uid);
		$token=checkNull($this->token);

		$checkToken=checkToken($uid,$token);
		if($checkToken==700){
			$rs['code'] = $checkToken;
			$rs['msg'] = '您的登陆状态失效，请重新登陆！';
			return $rs;
		}else if($checkToken==10020){
			$rs['code'] = 700;
			$rs['msg'] = '该账号已被禁用';
			return $rs;
		}


		$configpri=getConfigPri();

		$info[0]['agent_switch']=$configpri['agent_switch'];
		$info[0]['agent_must']=$configpri['agent_must'];  //此参数结合用户登录接口返回的isreg,如果agent_must=0时，只有在isreg=1时app端才会弹窗显示邀请码
		$info[0]['has_agent']=(string)checkAgentIsExist($uid);

		$rs['info']=$info;

		return $rs;
	}	
	

}
