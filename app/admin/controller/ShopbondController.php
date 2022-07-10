<?php

/**
 * 店铺申请
 */
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;

class ShopbondController extends AdminbaseController {
    protected function getStatus($k=''){
        $status=[
            '-1'=>'已扣除',
            '0'=>'已退回',
            '1'=>'已支付',
        ];
        if($k==''){
            return $status;
        }
        return isset($status[$k])?$status[$k]:'';
    }
    function index(){
        
        $data = $this->request->param();
        $map=[];
        
        $start_time=isset($data['start_time']) ? $data['start_time']: '';
        $end_time=isset($data['end_time']) ? $data['end_time']: '';
        
        if($start_time!=""){
           $map[]=['addtime','>=',strtotime($start_time)];
        }

        if($end_time!=""){
           $map[]=['addtime','<=',strtotime($end_time) + 60*60*24];
        }
        
        $status=isset($data['status']) ? $data['status']: '';
        if($status!=''){
            $map[]=['status','=',$status];
        }
        
        $uid=isset($data['uid']) ? $data['uid']: '';
        if($uid!=''){
            $lianguid=getLianguser($uid);
            if($lianguid){
                $map[]=['uid',['=',$uid],['in',$lianguid],'or'];
            }else{
                $map[]=['uid','=',$uid];
            }
        }
			

    	$lists = Db::name("shop_bond")
                ->where($map)
                ->order("id DESC")
                ->paginate(20);
        $lists->each(function($v,$k){
			$v['userinfo']=getUserInfo($v['uid']);
            return $v;           
        });
        
        $lists->appends($data);
        $page = $lists->render();

    	$this->assign('lists', $lists);

    	$this->assign("page", $page);
        
        $this->assign('status', $this->getStatus());
    	
    	return $this->fetch();
    }
		
    function setstatus(){
        
        $id = $this->request->param('id', 0, 'intval');
        $status = $this->request->param('status', 0, 'intval');
        
        $info = DB::name('shop_bond')->where("id={$id}")->find();
        if(!$info){
            $this->error("数据传入失败！");
        }
        
        if($info['status']!=1){
            $this->error('已处理，请勿多次操作');
        }
        
        $rs=DB::name("shop_bond")->where("id='{$id}' and status=1")->setField('status',$status);
        if($rs===false){
            $this->error("操作失败！");
        }
        
		
		
        if($status==0){
            /* 退回 */
            $uid=$info['uid'];
            $total=$info['bond'];
            
            DB::name('user')->where("id={$uid}")->inc('coin',$total)->update();
            
            DB::name("user_coinrecord")->insert(array("type"=>'1',"action"=>'15',"uid"=>$uid,"touid"=>$uid,"giftid"=>0,"giftcount"=>1,"totalcoin"=>$total,"addtime"=>time() ));
        }
		
		
		$status_name=$status==0?'退回':'扣除';
		$action=$status_name.'店铺保证金ID: '.$info['uid'];
		
		setAdminLog($action);
        
        $this->success("操作成功！");
    }

		
}
