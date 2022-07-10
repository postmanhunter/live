<?php
/**
 * 系统消息
 */
class Api_Message extends PhalApi_Api {

	public function getRules() {
		return array(
			'getList' => array(
				'uid' => array('name' => 'uid', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '用户ID'),
				'token' => array('name' => 'token', 'type' => 'string',  'require' => true, 'desc' => '用户Token'),
				'p' => array('name' => 'p', 'type' => 'int','default'=>1, 'desc' => '页码'),
			),

			'getShopOrderList' => array(
				'uid' => array('name' => 'uid', 'type' => 'int', 'min' => 1, 'require' => true, 'desc' => '用户ID'),
				'token' => array('name' => 'token', 'type' => 'string',  'require' => true, 'desc' => '用户Token'),
				'p' => array('name' => 'p', 'type' => 'int','default'=>1, 'desc' => '页码'),
			),

		);
	}
	
	/**
	 * 获取系统消息列表
	 * @desc 用于 获取系统消息列表
	 * @return int code 操作码，0表示成功
	 * @return array info 
	 * @return string info[0] 支付信息
	 * @return string msg 提示信息
	 */
	public function getList() {
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
		
		$uid=checkNull($this->uid);
		$token=checkNull($this->token);
		$p=checkNull($this->p);
        
        if($p<1){
			$p=1;
		}
        
        
        $checkToken=checkToken($uid,$token);
		if($checkToken==700){
			$rs['code'] = $checkToken;
			$rs['msg'] = '您的登陆状态失效，请重新登陆！';
			return $rs;
		}
		
		$domain = new Domain_Message();
		$list = $domain->getList($uid,$p);
		
        foreach($list as $k=>$v){
            $v['addtime']=date('Y-m-d H:i',$v['addtime']);
            $list[$k]=$v;
        }

		
		$rs['info']=$list;
		return $rs;			
	}


	/**
	 * 获取店铺订单列表
	 * @desc 用于 获取店铺订单列表
	 * @return int code 操作码，0表示成功
	 * @return array info 
	 * @return int info[0].title 消息标题
	 * @return int info[0].orderid 订单ID
	 * @return int info[0].addtime 消息添加时间
	 * @return int info[0].type 用户身份 0买家 1卖家
	 * @return int info[0].avatar 用户头像
	 * @return int info[0].status 订单状态
	 * @return int info[0].is_commission 是否为佣金结算信息 0 否 1 是【如果为1时，app消息列表不显示点击查看】
	 * @return string msg 提示信息
	 */
	public function getShopOrderList(){
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
		
		$uid=checkNull($this->uid);
		$token=checkNull($this->token);
		$p=checkNull($this->p);
        
        $checkToken=checkToken($uid,$token);
		if($checkToken==700){
			$rs['code'] = $checkToken;
			$rs['msg'] = '您的登陆状态失效，请重新登陆！';
			return $rs;
		}
		
		$domain = new Domain_Message();
		$res = $domain->getShopOrderList($uid,$p);
		$rs['info']=$res;
		return $rs;
	}	
	
}
