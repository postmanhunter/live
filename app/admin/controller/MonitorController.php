<?php

/**
 * 直播监控
 */
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;

class MonitorController extends AdminbaseController {
    function index(){

		$config=getConfigPri();
		$this->config=$config;
		$this->assign('config', $config);
        
        $lists = Db::name("live")
            ->where(['islive'=>1,'isvideo'=>0])
			->order("starttime desc")
			->paginate(6);
        
        $lists->each(function($v,$k){
			$v['userinfo']=getUserInfo($v['uid']);
            if($this->config['cdn_switch']==5){
                $auth_url=$v['pull'];
            }else{
                $auth_url=PrivateKeyA('http',$v['stream'].'.flv',0);
            }
            $v['url']=$auth_url;
            return $v; 
        });

        
        $page = $lists->render();

    	$this->assign('lists', $lists);

    	$this->assign("page", $page);
    	
    	return $this->fetch();

    }
    
	public function full()
	{
        $uid = $this->request->param('uid', 0, 'intval');
        
        $where['islive']=1;
        $where['uid']=$uid;
        
		$live=Db::name("live")->where($where)->find();
		$config=getConfigPri();
        
		if($live['title']=="")
		{
			$live['title']="直播监控后台";
		}
        
        if($config['cdn_switch']==5){
            $pull=$live['pull'];
        }else{
            $pull=urldecode(PrivateKeyA('http',$live['stream'].'.flv',0));
        }
		$live['pull']=$pull;
		$this->assign('config', $config);
		$this->assign('live', $live);
        
		return $this->fetch();
	}
	public function stopRoom(){
        
		$uid = $this->request->param('uid', 0, 'intval');
        
        $where['islive']=1;
        $where['uid']=$uid;
        
		$liveinfo=Db::name("live")->field("uid,showid,starttime,title,province,city,stream,lng,lat,type,type_val,liveclassid")->where($where)->find();
        
		Db::name("live")->where(" uid='{$uid}'")->delete();
        
		if($liveinfo){
			$liveinfo['endtime']=time();
			$liveinfo['time']=date("Y-m-d",$liveinfo['showid']);
            
            $where2=[];
            $where2['touid']=$uid;
            $where2['showid']=$liveinfo['showid'];
            
			$votes=Db::name("user_coinrecord")
				->where($where2)
				->sum('totalcoin');
			$liveinfo['votes']=0;
			if($votes){
				$liveinfo['votes']=$votes;
			}
            
            $stream=$liveinfo['stream'];
			$nums=zSize('user_'.$stream);

			hDel("livelist",$uid);
			delcache($uid.'_zombie');
			delcache($uid.'_zombie_uid');
			delcache('attention_'.$uid);
			delcache('user_'.$stream);
			
			
			$liveinfo['nums']=$nums;
			
			Db::name("live_record")->insert($liveinfo);
            
            /* 游戏处理 */
            $where3=[];
            $where3['state']=0;
            $where3['liveuid']=$uid;
            $where3['stream']=$stream;
            
			$game=Db::name("game")
				->where($where3)
				->find();
			if($game){
				$total=Db::name("gamerecord")
					->field("uid,sum(coin_1 + coin_2 + coin_3 + coin_4 + coin_5 + coin_6) as total")
					->where(["gameid"=>$game['id']])
					->group('uid')
					->select();
				foreach($total as $k=>$v){
                    
                    Db::name("user")->where(["id"=> $v['uid']])->setInc('coin',$v['total']);

					delcache('userinfo_'.$v['uid']);
					
					$insert=array("type"=>'1',"action"=>'20',"uid"=>$v['uid'],"touid"=>$v['uid'],"giftid"=>$game['id'],"giftcount"=>1,"totalcoin"=>$v['total'],"addtime"=>$nowtime );
                    
                    Db::name("user_coinrecord")->insert($insert);
				}

				Db::name("game")->where(["id"=> $game['id']])->save(array('state' =>'3','endtime' => time() ) );
				$brandToken=$stream."_".$game["action"]."_".$game['starttime']."_Game";
				delcache($brandToken);
			}   
		}
        //$redis -> close();
        $action="监控 关闭直播间：{$uid}";
        setAdminLog($action);
		
//		echo "{'status':0,'data':{},'info':''}";
//		exit;
		//echo  json_encode( array("status"=>'1','info'=>'') );
		$this->success("操作成功！");
	}				
}
