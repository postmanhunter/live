<?php

class Domain_Live {
	
	public function checkBan($uid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->checkBan($uid);
		return $rs;
	}

	public function createRoom($uid,$data) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->createRoom($uid,$data);
		return $rs;
	}
	
	public function getFansIds($touid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->getFansIds($touid);
		return $rs;
	}
	
	public function changeLive($uid,$stream,$status) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->changeLive($uid,$stream,$status);
		return $rs;
	}
	
	public function changeLiveType($uid,$stream,$data) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->changeLiveType($uid,$stream,$data);
		return $rs;
	}

	public function stopRoom($uid,$stream) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->stopRoom($uid,$stream);
		return $rs;
	}
	
	public function stopInfo($stream) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->stopInfo($stream);
		return $rs;
	}
	
	public function checkLive($uid,$liveuid,$stream) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->checkLive($uid,$liveuid,$stream);
		return $rs;
	}
	
	public function roomCharge($uid,$liveuid,$stream) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->roomCharge($uid,$liveuid,$stream);
		return $rs;
	}
	
	public function getUserCoin($uid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->getUserCoin($uid);
		return $rs;
	}
	
	public function isZombie($uid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->isZombie($uid);
		return $rs;
	}
	
	public function getZombie($stream,$where) {
        $rs = array();
				
        $model = new Model_Live();
        $rs = $model->getZombie($stream,$where);

        return $rs;
    }	

	public function getPop($touid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->getPop($touid);
		return $rs;
	}

	public function getGiftList($live_type) {

        $key='getGiftList';
		$list=getcaches($key);

		if(!$list){
			$model = new Model_Live();
            $list = $model->getGiftList();
            if($list){
                setcaches($key,$list);
            }
		}
        

        foreach($list as $k=>$v){
			$list[$k]['gifticon']=get_upload_path($v['gifticon']);
			if($live_type==1 && $v['mark']==3){ //语音聊天室
				$list[$k]['mark']=0;
			}
		}	
        
		return $list;
	}
	public function getPropgiftList() {

        $key='getPropgiftList';
		$list=getcaches($key);

		if(!$list){
			$model = new Model_Live();
            $list = $model->getPropgiftList();
            if($list){
                setcaches($key,$list);
            }
		}
        
        foreach($list as $k=>$v){
			$list[$k]['gifticon']=get_upload_path($v['gifticon']);
		}	
        
		return $list;
    }
	
	public function sendGift($uid,$liveuid,$stream,$giftid,$giftcount,$ispack,$touids) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->sendGift($uid,$liveuid,$stream,$giftid,$giftcount,$ispack,$touids);
		return $rs;
	}

	public function sendBarrage($uid,$liveuid,$stream,$giftid,$giftcount,$content) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->sendBarrage($uid,$liveuid,$stream,$giftid,$giftcount,$content);
		return $rs;
	}
	
	public function setAdmin($liveuid,$touid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->setAdmin($liveuid,$touid);
		return $rs;
	}
	
	public function getAdminList($liveuid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->getAdminList($liveuid);
		return $rs;
	}
	
	public function getUserHome($uid,$touid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->getUserHome($uid,$touid);
		return $rs;
	}
    
	public function getReportClass() {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->getReportClass();
		return $rs;
	}

	public function setReport($uid,$touid,$content) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->setReport($uid,$touid,$content);
		return $rs;
	}

	public function getVotes($liveuid) {
		$rs = array();

		$model = new Model_Live();
		$rs = $model->getVotes($liveuid);
		return $rs;
	}
    
	public function checkShut($uid,$liveuid) {
		$rs = array();
		$model = new Model_Live();
		$rs = $model->checkShut($uid,$liveuid);
		return $rs;
	}
    
    public function setShutUp($uid,$liveuid,$touid,$showid) {
		$rs = array();
		$model = new Model_Live();
		$rs = $model->setShutUp($uid,$liveuid,$touid,$showid);
		return $rs;
	}

	public function kicking($uid,$liveuid,$touid) {
		$rs = array();
		$model = new Model_Live();
		$rs = $model->kicking($uid,$liveuid,$touid);
		return $rs;
	}
    
    public function superStopRoom($uid,$liveuid,$type) {
		$rs = array();
		$model = new Model_Live();
		$rs = $model->superStopRoom($uid,$liveuid,$type);
		return $rs;
	}

	public function getContribut($uid,$liveuid,$showid) {
		$rs = array();
		$model = new Model_Live();
		$rs = $model->getContribut($uid,$liveuid,$showid);
		return $rs;
	}	
    
	public function checkLiveing($uid,$stream) {
		$rs = array();
		$model = new Model_Live();
		$rs = $model->checkLiveing($uid,$stream);
		return $rs;
	}	
    
    public function getLiveInfo($liveuid) {
		$rs = array();
		$model = new Model_Live();
		$rs = $model->getLiveInfo($liveuid);
		return $rs;
	}

	public function setLiveGoodsIsShow($uid,$goodsid){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->setLiveGoodsIsShow($uid,$goodsid);
		return $rs;
	}

	public function getLiveShowGoods($liveuid){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->getLiveShowGoods($liveuid);
		return $rs;
	}

	public function applyVoiceLiveMic($uid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->applyVoiceLiveMic($uid,$stream);
		return $rs;
	}
	public function cancelVoiceLiveMicApply($uid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->cancelVoiceLiveMicApply($uid,$stream);
		return $rs;
	}
	public function handleVoiceMicApply($uid,$stream,$apply_uid,$status){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->handleVoiceMicApply($uid,$stream,$apply_uid,$status);
		return $rs;
	}
	public function getVoiceMicApplyList($uid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->getVoiceMicApplyList($uid,$stream);
		return $rs;
	}
	public function changeVoiceEmptyMicStatus($uid,$stream,$position,$status){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->changeVoiceEmptyMicStatus($uid,$stream,$position,$status);
		return $rs;
	}

	public function anchorGetVoiceMicList($uid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->anchorGetVoiceMicList($uid,$stream);
		return $rs;
	}

	public function changeVoiceMicStatus($uid,$stream,$position,$status){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->changeVoiceMicStatus($uid,$stream,$position,$status);
		return $rs;
	}

	public function userCloseVoiceMic($uid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->userCloseVoiceMic($uid,$stream);
		return $rs;
	}

	public function closeUserVoiceMic($uid,$liveuid,$stream,$touid){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->closeUserVoiceMic($uid,$liveuid,$stream,$touid);
		return $rs;
	}

	public function getVoiceMicStream($uid,$liveuid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->getVoiceMicStream($uid,$liveuid,$stream);
		return $rs;
	}

	public function voiceLiveSendGift($uid,$liveuid,$stream,$touids,$giftid,$giftcount,$ispack){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->voiceLiveSendGift($uid,$liveuid,$stream,$touids,$giftid,$giftcount,$ispack);
		return $rs;
	}

	public function getVoiceLivePullStreams($uid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->getVoiceLivePullStreams($uid,$stream);
		return $rs;
	}

	public function userGetVoiceMicList($liveuid,$stream){
		$rs = array();
		$model = new Model_Live();
		$rs = $model->userGetVoiceMicList($liveuid,$stream);
		return $rs;
	}
}
