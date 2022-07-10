<?php

    use think\Db;
    use cmf\lib\Storage;
    // 应用公共文件
    error_reporting(E_ALL);
    //ini_set('display_errors','On');
    //error_reporting(E_ERROR | E_WARNING | E_PARSE);
    require_once dirname(__FILE__).'/redis.php';

	/* 去除NULL 判断空处理 主要针对字符串类型*/
	function checkNull($checkstr){
		$checkstr=urldecode($checkstr);
		$checkstr=htmlspecialchars($checkstr);
		$checkstr=trim($checkstr);

		if( strstr($checkstr,'null') || (!$checkstr && $checkstr!=0 ) ){
			$str='';
		}else{
			$str=$checkstr;
		}
		return $str;	
	}
	
	/* 去除emoji表情 */
	function filterEmoji($str){
		$str = preg_replace_callback(
			'/./u',
			function (array $match) {
				return strlen($match[0]) >= 4 ? '' : $match[0];
			},
			$str);
		return $str;
	}

	/* 获取公共配置 */
	function getConfigPub() {
		$key='getConfigPub';
		$config=getcaches($key);
		if(!$config){
			$config=Db::name("option")
                    ->field('option_value')
                    ->where("option_name='site_info'")
                    ->find();
            $config=json_decode($config['option_value'],true);
            
            if($config){
                setcaches($key,$config);
            }
            
		}
        
        if(isset($config['live_time_coin'])){
            if(is_array($config['live_time_coin'])){
                
            }else if($config['live_time_coin']){
                $config['live_time_coin']=preg_split('/,|，/',$config['live_time_coin']);
            }else{
                $config['live_time_coin']=array();
            }
        }else{
            $config['live_time_coin']=array();
        }
        
        if(isset($config['login_type'])){
            if(is_array($config['login_type'])){
                
            }else if($config['login_type']){
                $config['login_type']=preg_split('/,|，/',$config['login_type']);
            }else{
                $config['login_type']=array();
            }
        }else{
            $config['login_type']=array();
        }
        
        
        if(isset($config['share_type'])){
            if(is_array($config['share_type'])){
                
            }else if($config['share_type']){
                $config['share_type']=preg_split('/,|，/',$config['share_type']);
            }else{
                $config['share_type']=array();
            }
        }else{
            $config['share_type']=array();
        }
        
        if(isset($config['live_type'])){
            if(is_array($config['live_type'])){
                
            }else if($config['live_type']){
                $live_type=preg_split('/,|，/',$config['live_type']);
                foreach($live_type as $k=>$v){
                    $live_type[$k]=preg_split('/;|；/',$v);
                }
                $config['live_type']=$live_type;
            }else{
                $config['live_type']=array();
            }
        }else{
            $config['live_type']=array();
        }
            
		return 	$config;
	}	
	
	/* 获取私密配置 */
	function getConfigPri() {
		$key='getConfigPri';
		$config=getcaches($key);
		if(!$config){
			$config=Db::name("option")
                ->field('option_value')
                ->where("option_name='configpri'")
                ->find();
            $config=json_decode($config['option_value'],true);
			if($config){
                setcaches($key,$config);
            }
			
		}
        
        if(isset($config['game_switch'])){
            if(is_array($config['game_switch'])){
                
            }else if($config['game_switch']){
                $config['game_switch']=preg_split('/,|，/',$config['game_switch']);
            }else{
                $config['game_switch']=array();
            }
        }else{
            $config['game_switch']=array();
        }
        
		return 	$config;
	}
    
	/**
	 * 转化数据库保存的文件路径，为可以访问的url
	 */
	function get_upload_path($file){
        if($file==''){
            return $file;
        }
		if(strpos($file,"http")===0){
			return $file;
		}else if(strpos($file,"/")===0){
            $configpub=getConfigPub();
			$filepath= $configpub['site'].$file;
			return $filepath;
		}else{

			$fileinfo=explode("_",$file);//上传云存储标识：qiniu：七牛云；aws：亚马逊
			$storage_type=$fileinfo[0];
			$start=strlen($storage_type)+1;
			if($storage_type=='qiniu'){ //七牛云
				$storage = Storage::instance();
				$file=substr($file,$start);
				return html_entity_decode($storage->getImageUrl($file));
			}else if($storage_type=='aws'){ //亚马逊
				$configpri=getConfigPri();
				$space_host= $configpri['aws_hosturl'];
				$file=substr($file,$start);
				return html_entity_decode($space_host."/".$file);
			}else{

				$style='';

	            $storage = Storage::instance();
	            return $storage->getImageUrl($file, $style);
			}


            
		}
	}	
	/* 获取等级 */
	function getLevelList(){
        $key='level';
		$level=getcaches($key);
		if(!$level){
			$level= Db::name("level")->order("level_up asc")->select();
            if($level){
                setcaches($key,$level);
            }else{
				delcache($key);
			}
		}
        
        foreach($level as $k=>$v){
            $v['thumb']=get_upload_path($v['thumb']);
            $v['thumb_mark']=get_upload_path($v['thumb_mark']);
            $v['bg']=get_upload_path($v['bg']);                 
            if($v['colour']){
                $v['colour']='#'.$v['colour'];
            }else{
                $v['colour']='#ffdd00';
            }
            $level[$k]=$v;
        }
        
        return $level;
    }
	function getLevel($experience){
		$level_a=1;
		$levelid=1;
		
        $level=getLevelList();

		foreach($level as $k=>$v){
			if( $v['level_up']>=$experience){
				$levelid=$v['levelid'];
				break;
			}else{
				$level_a = $v['levelid'];
			}
		}
		$levelid = $levelid < $level_a ? $level_a:$levelid;
		
		return (string)$levelid;
	}
	/* 主播等级 */
	function getLevelAnchorList(){
		$key='levelanchor';
		$level=getcaches($key);
		if(!$level){
			$level= Db::name("level_anchor")->order("level_up asc")->select();
            if($level){
                setcaches($key,$level);
            }else{
				delcache($key);
			}
		}
        
        foreach($level as $k=>$v){
            $v['thumb']=get_upload_path($v['thumb']);
            $v['thumb_mark']=get_upload_path($v['thumb_mark']);
            $v['bg']=get_upload_path($v['bg']);
            $level[$k]=$v;
        }
            
        return $level;
    }
	function getLevelAnchor($experience){
		$levelid=1;
		$level_a=1;
        $level=getLevelAnchorList();
        
		foreach($level as $k=>$v){
			if( $v['level_up']>=$experience){
				$levelid=$v['levelid'];
				break;
			}else{
				$level_a = $v['levelid'];
			}
		}
		$levelid = $levelid < $level_a ? $level_a:$levelid;
		
		return $levelid;
	}

	/* 判断是否关注 */
	function isAttention($uid,$touid) {
        $where['uid']=$uid;
        $where['touid']=$touid;
		$id=Db::name("user_attention")->where($where)->find();
		if($id){
			return  1;
		}else{
			return  0;
		}			 	
	}
	/*判断是否拉黑*/ 
	function isBlack($uid,$touid){
        $where['uid']=$uid;
        $where['touid']=$touid;
		$isexist=Db::name("user_black")->where($where)->find();
		if($isexist){
			return 1;
		}else{
			return 0;					
		}
	}
	/* 关注人数 */
	function getFollownums($uid) 
	{
        $where['uid']=$uid;
		return Db::name("user_attention")->where($where)->count();
	}
	/* 粉丝人数 */
	function getFansnums($uid) 
	{
        $where['touid']=$uid;
		return Db::name("user_attention")->where($where)->count();
	} 
	/* 用户基本信息 */
    function getUserInfo($uid) {
        $where['id']=$uid;
        $info= Db::name("user")->field("id,user_nicename,avatar,avatar_thumb,sex,signature,consumption,votestotal,province,user_status,city,birthday,issuper,end_bantime")->where($where)->find();
		if(!$info){
            $info['id']=$uid;
            $info['user_nicename']='用户不存在';
            $info['avatar']='/default.jpg';
            $info['avatar_thumb']='/default_thumb.jpg';
            $info['sex']='0';
            $info['signature']='';
            $info['consumption']='0';
            $info['votestotal']='0';
            $info['province']='';
            $info['city']='';
            $info['birthday']='';
            $info['issuper']='0';
			$info['user_status']='1';
        }
        
        if($info){
            $info['avatar']=get_upload_path($info['avatar']);
			$info['avatar_thumb']=get_upload_path($info['avatar_thumb']);
			$info['level']=getLevel($info['consumption']);
			$info['level_anchor']=getLevelAnchor($info['votestotal']);

			$info['vip']=getUserVip($uid);
			$info['liang']=getUserLiang($uid);
            
            if($info['birthday']){
                $info['birthday']=date('Y-m-d',$info['birthday']);   
            }else{
                $info['birthday']='';
            }

            $token=Db::name("user_token")->where("user_id={$uid}")->value("token");
            $info['token']=$token;
            
        }
				
		return 	$info;		
    }	 
	/*获取收到礼物数量(tsd) 以及送出的礼物数量（tsc） */
	function getgif($uid)
	{
		
		$count=Db::query('select sum(case when touid='.$uid.' then 1 else 0 end) as tsd,sum(case when uid='.$uid.' then 1 else 0 end) as tsc from cmf_user_coinrecord');
		return 	$count;		
	}
	/* 用户信息 含有私密信息 */
   function getUserPrivateInfo($uid) {
       $where['id']=$uid;
        $info= Db::name("user")->field('id,user_login,user_nicename,avatar,avatar_thumb,sex,signature,consumption,votestotal,province,city,coin,votes,birthday,issuper')->where($where)->find();
		if($info){
			$info['lighttime']="0";
			$info['light']=0;
			$info['level']=getLevel($info['consumption']);
			$info['level_anchor']=getLevelAnchor($info['votestotal']);
			$info['avatar']=get_upload_path($info['avatar']);
			$info['avatar_thumb']=get_upload_path($info['avatar_thumb']);
			
			$info['vip']=getUserVip($uid);
			$info['liang']=getUserLiang($uid);
            
            if($info['birthday']){
                $info['birthday']=date('Y-m-d',$info['birthday']);   
            }else{
                $info['birthday']='';
            }

            $token=Db::name("user_token")->where("user_id={$uid}")->value("token");
            $info['token']=$token;
		}
		return 	$info;		
    }			
		
		/* 用户信息 含有私密信息 */
    function getUserToken($uid) {
        $where['user_id']=$uid;
		$info= Db::name("user_token")->field('token')->where($where)->find();
        if(!$info){
            return '';
        }
		return 	$info['token'];		
    }				
	/* 房间管理员 */
	function getIsAdmin($uid,$showid){
		if($uid==$showid){		
			return 50;
		}
		$isuper=isSuper($uid);
		if($isuper){
			return 60;
		}
        $where['uid']=$uid;
        $where['liveuid']=$showid;
		$id=Db::name("live_manager")->where($where)->find();

		if($id)	{
			return 40;					
		}
		return 30;		
	}
	/*判断token是否过期*/
	function checkToken($uid,$token){

		if(!$uid || !$token){
            session('uid',null);		
            session('token',null);
            session('user',null);
            cookie('uid',null);
            cookie('token',null);
			return 700;	
		}
        
        $key="token_".$uid;
		$userinfo=getcaches($key);


		if(!$userinfo){
            $where['user_id']=$uid;
			$userinfo=Db::name("user_token")->field('token,expire_time')->where($where)->find();	
            if($userinfo){
                setcaches($key,$userinfo);
            }else{
				delcache($key);
			}
		}
        
		if(!$userinfo || $userinfo['token']!=$token || $userinfo['expire_time']<time()){
            session('uid',null);		
            session('token',null);
            session('user',null);
            cookie('uid',null);
            cookie('token',null);
			return 700;				
		}else{
			return 	0;				
		} 
	}
	/*前台个人中心判断是否登录*/
	function LogIn()
	{
		$uid=session("uid");
		if($uid<=0)
		{
			header("Location: /"); 
			exit;
		}
	}
	/* 判断账号是否超管 */
	function isSuper($uid){
        $where['uid']=$uid;
		$isexist=Db::name("user_super")->where($where)->find();
		if($isexist){
			return 1;
		}			
		return 0;
	}
	/* 判断账号是被拉黑 */
	function isDisable($uid){
        $where['id']=$uid;
		$status=Db::name("user")->field("user_status")->where($where)->find();
		if(!$status || $status['user_status']==0){
			return 0;
		}
		return 1;
	}
	
	/* 过滤关键词 */
	function filterField($field){
		$configpri=getConfigPri();
		
		$sensitive_field=$configpri['sensitive_field'];
		
		$sensitive=explode(",",$sensitive_field);
		$replace=array();
		$preg=array();
		foreach($sensitive as $k=>$v){
			if($v){
				$re='';
				$num=mb_strlen($v);
				for($i=0;$i<$num;$i++){
					$re.='*';
				}
				$replace[$k]=$re;
				$preg[$k]='/'.$v.'/';
			}else{
				unset($sensitive[$k]);
			}
		}
		
		return preg_replace($preg,$replace,$field);
	}
	
	/* 检验手机号 */
	function checkMobile($mobile){
		$ismobile = preg_match("/^1[3|4|5|6|7|8|9]\d{9}$/",$mobile);
		if($ismobile){
			return 1;
		}else{
			return 0;
		}
	}
	

	/*直播间判断是否开启僵尸粉*/
	function isZombie($uid)
	{
        $where['id']=$uid;
		$userinfo=Db::name("user")->field("iszombie")->where($where)->find();
        if(!$userinfo){
            return 0;
        }
		return $userinfo['iszombie'];		
	}
	/* 时间差计算 */
	function datetime($time){
		$cha=time()-$time;
		$iz=floor($cha/60);
		$hz=floor($iz/60);
		$dz=floor($hz/24);
		/* 秒 */
		$s=$cha%60;
		/* 分 */
		$i=floor($iz%60);
		/* 时 */
		$h=floor($hz/24);
		/* 天 */
		
		if($cha<60){
			 return $cha.'秒前';
		}else if($iz<60){
			return $iz.'分钟前';
		}else if($hz<24){
			return $hz.'小时'.$i.'分钟前';
		}else if($dz<30){
			return $dz.'天前';
		}else{
			return date("Y-m-d",$time);
		}
	}
    
	/* 时长格式化 */
	/*function getSeconds($cha,$type=0){		 
		$iz=floor($cha/60);
		$hz=floor($iz/60);
		$dz=floor($hz/24);
		// 秒
		$s=$cha%60;
		// 分
		$i=floor($iz%60);
		// 时
		$h=floor($hz/24);
		// 天
        
        if($type==1){
            if($s<10){
                $s='0'.$s;
            }
            if($i<10){
                $i='0'.$i;
            }

            if($h<10){
                $h='0'.$h;
            }
            
            if($hz<10){
                $hz='0'.$hz;
            }
            return $hz.':'.$i.':'.$s; 
        }
        
		
		if($cha<60){
			return $cha.'秒';
		}else if($iz<60){
			return $iz.'分钟'.$s.'秒';
		}else if($hz<24){
			return $hz.'小时'.$i.'分钟'.$s.'秒';
		}else if($dz<30){
			return $dz.'天'.$h.'小时'.$i.'分钟'.$s.'秒';
		}
	}*/	

	/* 时长格式化 */
	function getSeconds($time,$type=0){

		if(!$time){
			return (string)$time;
		}

	    $value = array(
	      "years"   => 0,
	      "days"    => 0,
	      "hours"   => 0,
	      "minutes" => 0,
	      "seconds" => 0
	    );
	    
	    if($time >= 31556926){
	      $value["years"] = floor($time/31556926);
	      $time = ($time%31556926);
	    }
	    if($time >= 86400){
	      $value["days"] = floor($time/86400);
	      $time = ($time%86400);
	    }
	    if($time >= 3600){
	      $value["hours"] = floor($time/3600);
	      $time = ($time%3600);
	    }
	    if($time >= 60){
	      $value["minutes"] = floor($time/60);
	      $time = ($time%60);
	    }
	    $value["seconds"] = floor($time);

	    if($value['years']){
	    	if($type==1&&$value['years']<10){
	    		$value['years']='0'.$value['years'];
	    	}
	    }

	    if($value['days']){
	    	if($type==1&&$value['days']<10){
	    		$value['days']='0'.$value['days'];
	    	}
	    }

	    if($value['hours']){
	    	if($type==1&&$value['hours']<10){
	    		$value['hours']='0'.$value['hours'];
	    	}
	    }

	    if($value['minutes']){
	    	if($type==1&&$value['minutes']<10){
	    		$value['minutes']='0'.$value['minutes'];
	    	}
	    }

	    if($value['seconds']){
	    	if($type==1&&$value['seconds']<10){
	    		$value['seconds']='0'.$value['seconds'];
	    	}
	    }

	    if($value['years']){
	    	$t=$value["years"] ."年".$value["days"] ."天". $value["hours"] ."小时". $value["minutes"] ."分".$value["seconds"]."秒";
	    }else if($value['days']){
	    	$t=$value["days"] ."天". $value["hours"] ."小时". $value["minutes"] ."分".$value["seconds"]."秒";
	    }else if($value['hours']){
	    	$t=$value["hours"] ."小时". $value["minutes"] ."分".$value["seconds"]."秒";
	    }else if($value['minutes']){
	    	$t=$value["minutes"] ."分".$value["seconds"]."秒";
	    }else if($value['seconds']){
	    	$t=$value["seconds"]."秒";
	    }
	    
	    return $t;

	}
    
	/*判断该用户是否已经认证*/
	function auth($uid)
	{
        $where['uid']=$uid;
		$user_auth=Db::name("user_auth")->field('uid,status')->where($where)->find();
		if($user_auth)
		{
			return $user_auth["status"];
		}

        return 3;

	}

	/* 获取指定长度的随机字符串 */
	function random($length = 6 , $numeric = 0) {
		PHP_VERSION < '4.2.0' && mt_srand((double)microtime() * 1000000);
		if($numeric) {
			$hash = sprintf('%0'.$length.'d', mt_rand(0, pow(10, $length) - 1));
		} else {
			$hash = '';
			$chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789abcdefghjkmnpqrstuvwxyz';
			$max = strlen($chars) - 1;
			for($i = 0; $i < $length; $i++) {
				$hash .= $chars[mt_rand(0, $max)];
			}
		}
		return $hash;
	}
	
	
	/* 发送验证码 */
	function sendCode_huyi($mobile,$code){
		$rs=array();
		$config = getConfigPri();
        
        if(!$config['sendcode_switch']){
            $rs['code']=667;
			$rs['msg']='123456';
            return $rs;
        }
		/* 互亿无线 */
		$target = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
        $content="您的验证码是：".$code."。请不要把验证码泄露给其他人。";
		
		$post_data = "account=".$config['ihuyi_account']."&password=".$config['ihuyi_ps']."&mobile=".$mobile."&content=".rawurlencode($content);
		//密码可以使用明文密码或使用32位MD5加密
		$gets = xml_to_array(Post($post_data, $target));
        file_put_contents(CMF_ROOT.'data/sendCode_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').' 提交参数信息 gets:'.json_encode($gets)."\r\n",FILE_APPEND);
        
		if($gets['SubmitResult']['code']==2){
            setSendcode(array('type'=>'1','account'=>$mobile,'content'=>$content));
			$rs['code']=0;
		}else{
			$rs['code']=1002;
			$rs['msg']=$gets['SubmitResult']['msg'];
		} 
		return $rs;
	}
	
	function Post($curlPost,$url){
		$curl = curl_init();
		curl_setopt($curl, CURLOPT_URL, $url);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_NOBODY, true);
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $curlPost);
		$return_str = curl_exec($curl);
		curl_close($curl);
		return $return_str;
	}
	
	function xml_to_array($xml){
		$reg = "/<(\w+)[^>]*>([\\x00-\\xFF]*)<\\/\\1>/";
		if(preg_match_all($reg, $xml, $matches)){
			$count = count($matches[0]);
			for($i = 0; $i < $count; $i++){
			$subxml= $matches[2][$i];
			$key = $matches[1][$i];
				if(preg_match( $reg, $subxml )){
					$arr[$key] = xml_to_array( $subxml );
				}else{
					$arr[$key] = $subxml;
				}
			}
		}
		return $arr;
	}
	/* 发送验证码 */
	
    /* 发送验证码 -- 容联云 */
	function sendCode_ronglianyun($mobile,$code){
        
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
        
		$config = getConfigPri();
        
        if(!$config['sendcode_switch']){
            $rs['code']=667;
			$rs['msg']='123456';
            return $rs;
        }
        
        require_once CMF_ROOT.'sdk/ronglianyun/CCPRestSDK.php';
        
        //主帐号
        $accountSid= $config['ccp_sid'];
        //主帐号Token
        $accountToken= $config['ccp_token'];
        //应用Id
        $appId=$config['ccp_appid'];
        //请求地址，格式如下，不需要写https://
        $serverIP='app.cloopen.com';
        //请求端口 
        $serverPort='8883';
        //REST版本号
        $softVersion='2013-12-26';
        
        $tempId=$config['ccp_tempid'];
        
        file_put_contents(CMF_ROOT.'data/sendCode_ccp_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').' 提交参数信息 post_data: accountSid:'.$accountSid.";accountToken:{$accountToken};appId:{$appId};tempId:{$tempId}\r\n",FILE_APPEND);

        $rest = new \REST($serverIP,$serverPort,$softVersion);
        $rest->setAccount($accountSid,$accountToken);
        $rest->setAppId($appId);
        
        $datas=[];
        $datas[]=$code;
        
        $result = $rest->sendTemplateSMS($mobile,$datas,$tempId);
        file_put_contents(CMF_ROOT.'data/sendCode_ccp_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').' 提交参数信息 result:'.json_encode($result)."\r\n",FILE_APPEND);
        
         if($result == NULL ) {
            $rs['code']=1002;
			$rs['msg']="获取失败";
            return $rs;
         }
         if($result->statusCode!=0) {
            //echo "error code :" . $result->statusCode . "<br>";
            //echo "error msg :" . $result->statusMsg . "<br>";
            //TODO 添加错误处理逻辑
            $rs['code']=1002;
			//$rs['msg']=$gets['SubmitResult']['msg'];
			$rs['msg']="获取失败";
            return $rs;
         }
        $content=$code;
        setSendcode(array('type'=>'1','account'=>$mobile,'content'=>$content));

		return $rs;
	}   
	
	/* 发送验证码 -- 容联云 */
	function sendCodeByRonglian($mobile,$code){
        
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
        
		$config = getConfigPri();
      
        require_once CMF_ROOT.'sdk/ronglianyun/CCPRestSDK.php';
        
        //主帐号
        $accountSid= $config['ccp_sid'];
        //主帐号Token
        $accountToken= $config['ccp_token'];
        //应用Id
        $appId=$config['ccp_appid'];
        //请求地址，格式如下，不需要写https://
        $serverIP='app.cloopen.com';
        //请求端口 
        $serverPort='8883';
        //REST版本号
        $softVersion='2013-12-26';
        
        $tempId=$config['ccp_tempid'];
        
        file_put_contents(CMF_ROOT.'data/sendCode_ccp_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').' 提交参数信息 post_data: accountSid:'.$accountSid.";accountToken:{$accountToken};appId:{$appId};tempId:{$tempId}\r\n",FILE_APPEND);

        $rest = new \REST($serverIP,$serverPort,$softVersion);
        $rest->setAccount($accountSid,$accountToken);
        $rest->setAppId($appId);
        
        $datas=[];
        $datas[]=$code;
        
        $result = $rest->sendTemplateSMS($mobile,$datas,$tempId);
        file_put_contents(CMF_ROOT.'data/sendCode_ccp_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').' 提交参数信息 result:'.json_encode($result)."\r\n",FILE_APPEND);
        
         if($result == NULL ) {
            $rs['code']=1002;
			$rs['msg']="获取失败";
            return $rs;
         }
         if($result->statusCode!=0) {
            //echo "error code :" . $result->statusCode . "<br>";
            //echo "error msg :" . $result->statusMsg . "<br>";
            //TODO 添加错误处理逻辑
            $rs['code']=1002;
			//$rs['msg']=$gets['SubmitResult']['msg'];
			$rs['msg']="获取失败";
            return $rs;
         }
      
		return $rs;
	}

	//阿里云短信
	function sendCodeByAli($country_code,$mobile,$code){
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
        
        $config = getConfigPri();

        //判断是否是国外
        $aly_sendcode_type=$config['aly_sendcode_type'];
        if($aly_sendcode_type==1 && $country_code!=86){ //国内
            $rs['code']=1002;
            $rs['msg']='平台短信仅支持中国大陆地区';
            return $rs;
        }

        if($aly_sendcode_type==2 && $country_code==86){
            $rs['code']=1002;
            $rs['msg']='平台短信仅支持国际/港澳台地区';
            return $rs;
        }
		
		require_once CMF_ROOT.'sdk/aliyunsms/AliSmsApi.php';
        
		$config_dl  = array(
            'accessKeyId' => $config['aly_keydi'], 
            'accessKeySecret' => $config['aly_secret'], 
            'PhoneNumbers' => $mobile, 
            'SignName' => $config['aly_signName'], //国内短信签名 
            'TemplateCode' => $config['aly_templateCode'], //国内短信模板ID
            'TemplateParam' => array("code"=>$code) 
        );

        $config_hw  = array(
            'accessKeyId' => $config['aly_keydi'], 
            'accessKeySecret' => $config['aly_secret'], 
            'PhoneNumbers' => $country_code.$mobile, 
            'SignName' => $config['aly_hw_signName'], //港澳台/国外短信签名 
            'TemplateCode' => $config['aly_hw_templateCode'], //港澳台/国外短信模板ID
            'TemplateParam' => array("code"=>$code) 
        );

        if($aly_sendcode_type==1){ //国内
            $config=$config_dl;
        }else if($aly_sendcode_type==2){ //国际/港澳台地区
            $config=$config_hw;
        }else{

            if($country_code==86){
                $config=$config_dl;
            }else{
                $config=$config_hw;
            }
        }
		 
		$go = new \AliSmsApi($config);
		$result = $go->send_sms();
		file_put_contents(CMF_ROOT.'data/sendCode_ccp_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').' 提交参数信息 result:'.json_encode($result)."\r\n",FILE_APPEND);
		
        if($result == NULL ) {
            $rs['code']=1002;
			$rs['msg']="发送失败";
            return $rs;
        }
		if($result['Code']!='OK') {
            //TODO 添加错误处理逻辑
            $rs['code']=1002;
			//$rs['msg']=$result['Code'];
			$rs['msg']="获取失败";
            return $rs;
        }
		return $rs;
	}

	//腾讯云短信
    function sendCodeByTencentSms($nationCode,$mobile,$code){
        require_once CMF_ROOT."sdk/tencentSms/index.php";
        $rs=array();
        $configpri = getConfigPri();
        
        $appid=$configpri['tencent_sms_appid'];
        $appkey=$configpri['tencent_sms_appkey'];


        $smsSign_dl = $configpri['tencent_sms_signName'];
        $smsSign_hw = $configpri['tencent_sms_hw_signName'];
        $templateId_dl=$configpri['tencent_sms_templateCode'];
        $templateId_hw=$configpri['tencent_sms_templateCode'];

        $tencent_sendcode_type=$configpri['tencent_sendcode_type'];

        if($tencent_sendcode_type==1){ //中国大陆
            $smsSign = $smsSign_dl;
            $templateId = $templateId_dl;

        }else if($tencent_sendcode_type==2){//港澳台/国际

            $smsSign=$smsSign_hw;
            $templateId = $templateId_hw;

        }else{ //全球

            if($nationCode==86){
                $smsSign = $smsSign_dl;
                $templateId = $templateId_dl;
            }else{
                $smsSign=$smsSign_hw;
                $templateId = $templateId_hw;
            }
        }

    
        $sender = new \Qcloud\Sms\SmsSingleSender($appid,$appkey);

        $params = [$code]; //参数列表与腾讯云后台创建模板时加的参数列表保持一致
        $result = $sender->sendWithParam($nationCode, $mobile, $templateId, $params, $smsSign, "", "");  // 签名参数未提供或者为空时，会使用默认签名发送短信
                
        //file_put_contents(API_ROOT.'/../log/sendCode_tencent_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').' 提交参数信息 result:'.json_encode($result)."\r\n",FILE_APPEND);
        $arr=json_decode($result,TRUE);

        if($arr['result']==0 && $arr['errmsg']=='OK'){
            //setSendcode(array('type'=>'1','account'=>$mobile,'content'=>"验证码:".$code."---国家区号:".$nationCode));
            $rs['code']=0;
        }else{
            $rs['code']=1002;
            $rs['msg']=$arr['errmsg'];
            // $rs['msg']='验证码发送失败';
        } 
        return $rs;     
                
    }

	/* 发送验证码 */
	function sendCode($country_code,$mobile,$code){
        
		$rs = array('code' => 0, 'msg' => '', 'info' => array());
        
		$config = getConfigPri();
        
        if(!$config['sendcode_switch']){
            $rs['code']=667;
			$rs['msg']='123456';
            return $rs;
        }

        $typecode_switch=$config['typecode_switch'];
		if($typecode_switch=='1'){//阿里云
			$res=sendCodeByAli($country_code,$mobile,$code);
		}else if($typecode_switch=='2'){ //容联云
            $res=sendCodeByRonglian($mobile,$code);
        }else if($typecode_switch=='3'){ //腾讯云
            $res=sendCodeByTencentSms($country_code,$mobile,$code);//腾讯云
        }
        $content=$code;
        setSendcode(array('type'=>'1','account'=>$mobile,'content'=>$content));

		return $res;
	}
	
	/**导出Excel 表格
   * @param $expTitle 名称
   * @param $expCellName 参数
   * @param $expTableData 内容
   * @throws \PHPExcel_Exception
   * @throws \PHPExcel_Reader_Exception
   */
	function exportExcel($expTitle,$expCellName,$expTableData,$cellName)
	{
		//$xlsTitle = iconv('utf-8', 'gb2312', $expTitle);//文件名称
		$xlsTitle =  $expTitle;//文件名称
		$fileName = $xlsTitle.'_'.date('YmdHis');//or $xlsTitle 文件名称可根据自己情况设定
		$cellNum = count($expCellName);
		$dataNum = count($expTableData);
		
        $path= CMF_ROOT.'sdk/PHPExcel/';
        require_once( $path ."PHPExcel.php");
        
		$objPHPExcel = new \PHPExcel();
		$objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(10);
		for($i=0;$i<$cellNum;$i++){
			$objPHPExcel->setActiveSheetIndex(0)->setCellValue($cellName[$i].'1', $expCellName[$i][1]);
		}
		for($i=0;$i<$dataNum;$i++){
			for($j=0;$j<$cellNum;$j++){
				$objPHPExcel->getActiveSheet(0)->setCellValue($cellName[$j].($i+2), filterEmoji( $expTableData[$i][$expCellName[$j][0]] ) );
			}
		}
		header('pragma:public');
		header('Content-type:application/vnd.ms-excel;charset=utf-8;name="'.$xlsTitle.'.xls"');
		header("Content-Disposition:attachment;filename={$fileName}.xls");//attachment新窗口打印inline本窗口打印
		$objWriter = \PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');//Excel5为xls格式，excel2007为xlsx格式
		$objWriter->save('php://output');
		exit;
	}
    
	/* 密码检查 */
	function passcheck($user_pass) {
        /* 必须包含字母、数字 */
        $preg='/^(?=.*[A-Za-z])(?=.*[0-9])[a-zA-Z0-9~!@&%#_]{6,20}$/';
        $isok=preg_match($preg,$user_pass);
        if($isok){
            return 1;
        }
        return 0;
	}	
	
	/**
	*  @desc 获取推拉流地址
	*  @param string $host 协议，如:http、rtmp
	*  @param string $stream 流名,如有则包含 .flv、.m3u8
	*  @param int $type 类型，0表示播流，1表示推流
	*/
	function PrivateKeyA($host,$stream,$type){
		$configpri=getConfigPri();
		$cdn_switch=$configpri['cdn_switch'];
		//$cdn_switch=3;
		switch($cdn_switch){
			case '1':
				$url=PrivateKey_ali($host,$stream,$type);
				break;
			case '2':
				$url=PrivateKey_tx($host,$stream,$type);
				break;
			case '3':
				$url=PrivateKey_qn($host,$stream,$type);
				break;
			case '4':
				$url=PrivateKey_ws($host,$stream,$type);
				break;
			case '5':
				$url=PrivateKey_wy($host,$stream,$type);
				break;
			case '6':
				$url=PrivateKey_ady($host,$stream,$type);
				break;
		}

		
		return $url;
	}
	
	/**
	*  @desc 阿里云直播A类鉴权
	*  @param string $host 协议，如:http、rtmp
	*  @param string $stream 流名,如有则包含 .flv、.m3u8
	*  @param int $type 类型，0表示播流，1表示推流
	*/
	function PrivateKey_ali($host,$stream,$type){
		$configpri=getConfigPri();
		$push=$configpri['push_url'];
		$pull=$configpri['pull_url'];
		$key_push=$configpri['auth_key_push'];
		$length_push=$configpri['auth_length_push'];
		$key_pull=$configpri['auth_key_pull'];
		$length_pull=$configpri['auth_length_pull'];
        
        $stream_a=explode('.',$stream);
		$streamKey = isset($stream_a[0])?$stream_a[0]:'';
		$ext = isset($stream_a[1])?$stream_a[1]:'';
		if($type==1){
			$domain=$host.'://'.$push;
			$time=time() + $length_push;
		}else{
			$domain=$host.'://'.$pull;
			$time=time() + $length_pull;
		}
		
		$filename="/5showcam/".$stream;
		
		if($type==1){
            if($key_push!=''){
                $sstring = $filename."-".$time."-0-0-".$key_push;
                $md5=md5($sstring);
                $auth_key="auth_key=".$time."-0-0-".$md5;
            }
			if($auth_key){
				$auth_key='?'.$auth_key;
			}
			//$domain.$filename.'?vhost='.$configpri['pull_url'].$auth_key;
			$url=array(
				'cdn'=>$domain.'/5showcam',
				'stream'=>$stream.$auth_key,
			);
		}else{
            if($key_pull!=''){
                $sstring = $filename."-".$time."-0-0-".$key_pull;
                $md5=md5($sstring);
                $auth_key="auth_key=".$time."-0-0-".$md5;
            }
			if($auth_key){
				$auth_key='?'.$auth_key;
			}
			$url=$domain.$filename.$auth_key;
            
            $configpub=getConfigPub();
            
            if(strstr($configpub['site'],'https')){
                $url=str_replace('http:','https:',$url);
            }
			
			if($type==3){
				$url_a=explode('/'.$stream,$url);
				$url=array(
					'cdn'=>$url_a[0],
					'stream'=>$stream.$url_a[1],
				);
			}
		}
		
		return $url;
	}
	
	/**
	*  @desc 腾讯云推拉流地址
	*  @param string $host 协议，如:http、rtmp
	*  @param string $stream 流名,如有则包含 .flv、.m3u8
	*  @param int $type 类型，0表示播流，1表示推流
	*/
	function PrivateKey_tx($host,$stream,$type){
		$configpri=getConfigPri();
		$bizid=$configpri['tx_bizid'];
		$push_url_key=$configpri['tx_push_key'];
		$play_url_key=$configpri['tx_play_key'];
        $push=$configpri['tx_push'];
		$pull=$configpri['tx_pull'];
		
		$stream_a=explode('.',$stream);
		$streamKey = isset($stream_a[0])? $stream_a[0] : '';
		$ext = isset($stream_a[1])? $stream_a[1] : '';
		
		//$live_code = $bizid . "_" .$streamKey;    
		$live_code = $streamKey;    
		
		$now=time();  	
		$now_time = $now + 3*60*60;
		$txTime = dechex($now_time);

		$txSecret = md5($push_url_key . $live_code . $txTime);
		$safe_url = "?txSecret=" .$txSecret."&txTime=" .$txTime;

		$play_safe_url='';
		//后台开启了播流鉴权
		if($configpri['tx_play_key_switch']){
			//播流鉴权时间

			$play_auth_time=$now+(int)$configpri['tx_play_time'];
			$txPlayTime = dechex($play_auth_time);
			$txPlaySecret = md5($play_url_key . $live_code . $txPlayTime);
			$play_safe_url = "?txSecret=" .$txPlaySecret."&txTime=" .$txPlayTime;

		}		

		if($type==1){
			//$push_url = "rtmp://" . $bizid . ".livepush2.myqcloud.com/live/" .  $live_code . "?bizid=" . $bizid . "&record=flv" .$safe_url;	可录像
			//$url = "rtmp://" . $bizid .".livepush2.myqcloud.com/live/" . $live_code . "?bizid=" . $bizid . "" .$safe_url;
			$url=array(
				'cdn'=>"rtmp://{$push}/live",
				'stream'=>$live_code.$safe_url,
			);
		}else{
			$url = "http://{$pull}/live/" . $live_code . ".flv".$play_safe_url;
			
			if($ext){
				$url = "http://{$pull}/live/" . $live_code . ".".$ext.$play_safe_url;
			}
            
            $configpub=getConfigPub();
            
            if(strstr($configpub['site'],'https')){
                $url=str_replace('http:','https:',$url);
            }
			
			if($type==3){
				$url_a=explode('/'.$live_code,$url);
				$url=array(
					'cdn'=>"rtmp://{$pull}/live",
					'stream'=>$live_code,
				);
			}
		}
		
		return $url;
	}

	/**
	*  @desc 七牛云直播
	*  @param string $host 协议，如:http、rtmp
	*  @param string $stream 流名,如有则包含 .flv、.m3u8
	*  @param int $type 类型，0表示播流，1表示推流
	*/
	function PrivateKey_qn($host,$stream,$type){
		require_once CMF_ROOT.'sdk/qiniucdn/Pili_v2.php';
		$configpri=getConfigPri();
		$ak=$configpri['qn_ak'];
		$sk=$configpri['qn_sk'];
		$hubName=$configpri['qn_hname'];
		$push=$configpri['qn_push'];
		$pull=$configpri['qn_pull'];
		$stream_a=explode('.',$stream);
		$streamKey = $stream_a[0];
		$ext = isset($stream_a[1])? $stream_a[1] : '';

		if($type==1){
			$time=time() +60*60*10;
			
			
			//初始化流名  创建新流对象,然后在进行推流
			//用于解决 Obs:无法访问指定的频道或串流秘钥的问题
			/*$mac = new \Qiniu\Pili\Mac($ak, $sk);
			$client = new \Qiniu\Pili\Client($mac);
			$hub = $client->hub($hubName);

			$stream_res = $hub->stream($streamKey);
			$resp = $hub->create($streamKey);*/
			
			//RTMP 推流地址
			$url2 = \Qiniu\Pili\RTMPPublishURL($push, $hubName, $streamKey, $time, $ak, $sk);
			$url_a=explode('/'.$streamKey,$url2);
			//return $url_a;
			$url=array(
				'cdn'=>$url_a[0],
				'stream'=>$streamKey.$url_a[1],
			);
		}else{
			if($ext=='flv'){
				$pull=str_replace('pili-live-rtmp','pili-live-hdl',$pull);
				//HDL 直播地址
				$url = \Qiniu\Pili\HDLPlayURL($pull, $hubName, $streamKey);
			}else if($ext=='m3u8'){
				$pull=str_replace('pili-live-rtmp','pili-live-hls',$pull);
				//HLS 直播地址
				$url = \Qiniu\Pili\HLSPlayURL($pull, $hubName, $streamKey);
			}else{
				//RTMP 直播放址
				$url = \Qiniu\Pili\RTMPPlayURL($pull, $hubName, $streamKey);
			}
			if($type==3){
				$url_a=explode('/'.$stream,$url);
				$url=array(
					'cdn'=>$url_a[0],
					'stream'=>$stream.$url_a[1],
				);
			}
		}
				
		return $url;
	}
	/**
	*  @desc 网宿推拉流
	*  @param string $host 协议，如:http、rtmp
	*  @param string $stream 流名,如有则包含 .flv、.m3u8
	*  @param int $type 类型，0表示播流，1表示推流
	*/
	function PrivateKey_ws($host,$stream,$type){
		$configpri=getConfigPri();
        
        $stream_a=explode('.',$stream);
		$streamKey = isset($stream_a[0])? $stream_a[0] : '';
		$ext = isset($stream_a[1])? $stream_a[1] : '';
		if($type==1){
			$domain=$host.'://'.$configpri['ws_push'];
			//$time=time() +60*60*10;
			$filename="/".$configpri['ws_apn'];
			$url=array(
				'cdn'=>$domain.$filename,
				'stream'=>$streamKey,
			);
		}else{
			$domain=$host.'://'.$configpri['ws_pull'];
			//$time=time() - 60*30 + $configpri['auth_length'];
			$filename="/".$configpri['ws_apn']."/".$stream;
			$url=$domain.$filename;
			if($type==3){
				$url_a=explode('/'.$stream,$url);
				$url=array(
					'cdn'=>$url_a[0],
					'stream'=>$stream.$url_a[1],
				);
			}
		}
		return $url;
	}
	
	/**网易cdn获取拉流地址**/
	function PrivateKey_wy($host,$stream,$type)
	{
		$configpri=getConfigPri();
		$appkey=$configpri['wy_appkey'];
		$appSecret=$configpri['wy_appsecret'];
		$nonce =rand(1000,9999);
		$curTime=time();
		$var=$appSecret.$nonce.$curTime;
		$checkSum=sha1($appSecret.$nonce.$curTime);
        
        $stream_a=explode('.',$stream);
		$streamKey = isset($stream_a[0])? $stream_a[0] : '';
		$ext = isset($stream_a[1])? $stream_a[1] : '';

		$header =array(
			"Content-Type:application/json;charset=utf-8",
			"AppKey:".$appkey,
			"Nonce:" .$nonce,
			"CurTime:".$curTime,
			"CheckSum:".$checkSum,
		);
        
        if($type==1){
            $url='https://vcloud.163.com/app/channel/create';
            $paramarr = array(
                "name"  =>$streamKey,
                "type"  =>0,
            );
        }else{
            $url='https://vcloud.163.com/app/address';
            $paramarr = array(
                "cid"  =>$streamKey,
            );
        }
        $paramarr=json_encode($paramarr);
        
		$curl=curl_init();
		curl_setopt($curl,CURLOPT_URL, $url);
		curl_setopt($curl,CURLOPT_HEADER, 0);
		curl_setopt($curl,CURLOPT_HTTPHEADER, $header); 
		curl_setopt($curl,CURLOPT_RETURNTRANSFER, 1);
		curl_setopt($curl,CURLOPT_SSL_VERIFYHOST,0);
		curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,0);
		curl_setopt($curl,CURLOPT_POST, 1);
		curl_setopt($curl,CURLOPT_POSTFIELDS, $paramarr);
		$data = curl_exec($curl);
		curl_close($curl);
		$url=json_decode($data,1);
		return $url;
	}
	
	/**
	*  @desc 奥点云推拉流
	*  @param string $host 协议，如:http、rtmp
	*  @param string $stream 流名,如有则包含 .flv、.m3u8
	*  @param int $type 类型，0表示播流，1表示推流
	*/
	function PrivateKey_ady($host,$stream,$type){
		$configpri=getConfigPri();
		$stream_a=explode('.',$stream);
		$streamKey = isset($stream_a[0])? $stream_a[0] : '';
		$ext = isset($stream_a[1])? $stream_a[1] : '';

		if($type==1){
			$domain=$host.'://'.$configpri['ady_push'];
			//$time=time() +60*60*10;
			$filename="/".$configpri['ady_apn'];
			$url=array(
				'cdn'=>$domain.$filename,
				'stream'=>$streamKey,
			);
		}else{
			if($ext=='m3u8'){
				$domain=$host.'://'.$configpri['ady_hls_pull'];
				//$time=time() - 60*30 + $configpri['auth_length'];
				$filename="/".$configpri['ady_apn']."/".$stream;
				$url=$domain.$filename;
			}else{
				$domain=$host.'://'.$configpri['ady_pull'];
				//$time=time() - 60*30 + $configpri['auth_length'];
				$filename="/".$configpri['ady_apn']."/".$stream;
				$url=$domain.$filename;
			}
			
			if($type==3){
				$url_a=explode('/'.$stream,$url);
				$url=array(
					'cdn'=>$url_a[0],
					'stream'=>$stream.$url_a[1],
				);
			}
		}
				
		return $url;
	}
	
	/* 生成邀请码 */
	function createCode($len=6,$format='ALL'){
        $is_abc = $is_numer = 0;
        $password = $tmp =''; 
        switch($format){
            case 'ALL':
                $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                break;
            case 'ALL2':
                $chars='ABCDEFGHJKLMNPQRSTUVWXYZ0123456789';
                break;
            case 'CHAR':
                $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
                break;
            case 'NUMBER':
                $chars='0123456789';
                break;
            default :
                $chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
                break;
        }
        
        while(strlen($password)<$len){
            $tmp =substr($chars,(mt_rand()%strlen($chars)),1);
            if(($is_numer <> 1 && is_numeric($tmp) && $tmp > 0 )|| $format == 'CHAR'){
                $is_numer = 1;
            }
            if(($is_abc <> 1 && preg_match('/[a-zA-Z]/',$tmp)) || $format == 'NUMBER'){
                $is_abc = 1;
            }
            $password.= $tmp;
        }
        if($is_numer <> 1 || $is_abc <> 1 || empty($password) ){
            $password = createCode($len,$format);
        }
        if($password!=''){
            
            $oneinfo=Db::name("agent_code")->field("uid")->where("code='{$password}'")->find();
            if(!$oneinfo){
                return $password;
            }            
        }
        $password = createCode($len,$format);
        return $password;
    }


	
	/* 数字格式化 */
	function NumberFormat($num){
		if($num<10000){

		}else if($num<1000000){
			$num=round($num/10000,2).'万';
		}else if($num<100000000){
			$num=round($num/10000,1).'万';
		}else if($num<10000000000){
			$num=round($num/100000000,2).'亿';
		}else{
			$num=round($num/100000000,1).'亿';
		}
		return $num;
	}
	/* 数字格式化 不保留小数*/
	function NumberFormat2($num){
		if($num<10000){
			$num=round($num);
		}else if($num<100000000){
			$num=round($num/10000).'万';
		}else{
			$num=round($num/100000000).'亿';
		}
		return $num;
	}
	
	/* 获取用户VIP */
	function getUserVip($uid){
		$rs=array(
			'type'=>'0',
		);
		$nowtime=time();
		$key='vip_'.$uid;
		$isexist=getcaches($key);
		if(!$isexist){
            $where['uid']=$uid;
			$isexist=Db::name("vip_user")->where($where)->find();		
			if($isexist){
				setcaches($key,$isexist);
			}else{
				delcache($key);
			}
		}

		if($isexist){
			if($isexist['endtime'] <= $nowtime){
				return $rs;
			}
			$rs['type']='1';
		}

		return $rs;
	}

	/* 获取用户坐骑 */
	function getUserCar($uid){
		$rs=array(
			'id'=>'0',
			'swf'=>'',
			'swftime'=>'0',
			'words'=>'',
		);
		$nowtime=time();
		$key='car_'.$uid;
		$isexist=getcaches($key);
		if(!$isexist){
            $where['uid']=$uid;
			$isexist=Db::name("car_user")->where("status=1")->where($where)->find();
			if($isexist){
				setcaches($key,$isexist);
			}else{
				delcache($key);
			}
		}
		if($isexist){
			if($isexist['endtime']<= $nowtime){
				return $rs;
			}
			$key2='carinfo';
			$car_list=getcaches($key2);
			if(!$car_list){
				$car_list=Db::name("car")->order("list_order asc")->select();
				if($car_list){
					setcaches($key2,$car_list);
				}else{
					delcache($key);
				}
			}
			$info=array();
			if($car_list){
				foreach($car_list as $k=>$v){
					if($v['id']==$isexist['carid']){
						$info=$v;
					}	
				}
				
				if($info){
					$rs['id']=$info['id'];
					$rs['swf']=get_upload_path($info['swf']) ;
					$rs['swftime']=$info['swftime'];
					$rs['words']=$info['words'];
				}
			}
			
		}
		
		return $rs;
	}

	/* 获取用户靓号 */
	function getUserLiang($uid){
		$rs=array(
			'name'=>'0',
		);
		$nowtime=time();
		$key='liang_'.$uid;
		$isexist=getcaches($key);
		if(!$isexist){
            $where['uid']=$uid;
			$isexist=Db::name("liang")->where("status=1 and state=1")->where($where)->find();
			if($isexist){
				setcaches($key,$isexist);
			}else{
				delcache($key);
			}
		}
		if($isexist){
			$rs['name']=$isexist['name'];
		}
		return $rs;
	}
	
	/* 邀请奖励 */
	function setAgentProfit($uid,$total){
		/* 分销 */
		$distribut1=0;
		$configpri=getConfigPri();
		if($configpri['agent_switch']==1){
            $where['uid']=$uid;
			$agent=Db::name("agent")->where($where)->find();
			$isinsert=0;
			/* 一级 */
			if($agent['one_uid'] && $configpri['distribut1']){
				$distribut1=$total*$configpri['distribut1']*0.01;
                if($distribut1>0){                    
                    $ifok=Db::name('agent_profit')
                            ->where([['uid','=',$agent['one_uid']]])
                            ->inc('one_profit',$distribut1)
                            ->update();
                    if(!$ifok){
                        Db::name("agent_profit")->insert(array('uid'=>$agent['one_uid'],'one_profit' =>$distribut1 ));
                    }
                    
                    Db::name('user')
                        ->where([['id','=',$agent['one_uid']]])
                        ->inc('votes',$distribut1)
                        ->update();
                    
                    $isinsert=1;
                    
                    $insert_votes=[
                        'type'=>'1',
                        'action'=>'3',
                        'uid'=>$agent['one_uid'],
                        'fromid'=>$uid,
                        'total'=>$distribut1,
                        'votes'=>$distribut1,
                        'addtime'=>time(),
                    ];
                    Db::name('user_voterecord')->insert($insert_votes);
                }
			}
			
			if($isinsert==1){
				$data=array(
					'uid'=>$uid,
					'total'=>$total,
					'one_uid'=>$agent['one_uid'],
					'one_profit'=>$distribut1,
					'addtime'=>time(),
				);
				Db::name("agent_profit_recode")->insert($data);
			}
		}
		return 1;
		
	}
    
    /* 家族分成 */
    function setFamilyDivide($liveuid,$total){
        $configpri=getConfigPri();
	
		$anthor_total=$total;
		/* 家族 */
		if($configpri['family_switch']==1){
            $where['uid']=$liveuid;
			$user_family=Db::name('family_user')
							->field("familyid,divide_family")
							->where("state=2")
                            ->where($where)
							->find();

			if($user_family){
				$familyinfo=Db::name('family')
							->field("uid,divide_family")
							->where('id='.$user_family['familyid'])
							->find();
                if($familyinfo){
                    $divide_family=$familyinfo['divide_family'];

                    /* 主播 */
                    if( $user_family['divide_family']>=0){
                        $divide_family=$user_family['divide_family'];
                        
                    }
                    $family_total=$total * $divide_family * 0.01;
                    

                        $anthor_total=floor(($total - $family_total)*100)/100;
                        $addtime=time();
                        $time=date('Y-m-d',$addtime);
                        Db::name('family_profit')
                               ->insert(array("uid"=>$liveuid,"time"=>$time,"addtime"=>$addtime,"profit"=>$family_total,"profit_anthor"=>$anthor_total,"total"=>$total,"familyid"=>$user_family['familyid']));

                    if($family_total){
                        
                        Db::name('user')
                            ->where([['id','=',$familyinfo['uid']]])
                            ->inc('votes',$family_total)
                            ->update();
                
                        $insert_votes=[
                            'type'=>'1',
                            'action'=>'4',
                            'uid'=>$familyinfo['uid'],
                            'fromid'=>$liveuid,
                            'total'=>$family_total,
                            'votes'=>$family_total,
                            'addtime'=>time(),
                        ];
                        Db::name('user_voterecord')->insert($insert_votes);
                    }
                }
			}
		}
        return $anthor_total;
    }
	
	/* ip限定 */
	function ip_limit(){
		$configpri=getConfigPri();
		if($configpri['iplimit_switch']==0){
			return 0;
		}
		$date = date("Ymd");
		$ip= ip2long(get_client_ip(0,true)) ;
		$isexist=Db::name("getcode_limit_ip")->field('ip,date,times')->where("ip={$ip}")->find();
		if(!$isexist){
			$data=array(
				"ip" => $ip,
				"date" => $date,
				"times" => 1,
			);
			$isexist=Db::name("getcode_limit_ip")->insert($data);
			return 0;
		}elseif($date == $isexist['date'] && $isexist['times'] >= $configpri['iplimit_times'] ){
			return 1;
		}else{
			if($date == $isexist['date']){
				$isexist=Db::name("getcode_limit_ip")->where("ip={$ip}")->setInc('times',1);
				return 0;
			}else{
				$isexist=Db::name("getcode_limit_ip")->where("ip={$ip}")->update(array('date'=> $date ,'times'=>1));
				return 0;
			}
		}	
	}	
    
    /* 验证码记录 */
    function setSendcode($data){
        if($data){
            $data['addtime']=time();
            Db::name('sendcode')->insert($data);
        }
    }

    /* 检测用户是否存在 */
    function checkUser($where){
        if(!$where){
            return 0;
        }

        $isexist=Db::name('user')->field('id')->where($where)->find();
        
        if($isexist){
            return 1;
        }
        
        return 0;
    }
        
    /* 管理员操作日志 */
    function setAdminLog($action){
        $data=array(
            'adminid'=>session('ADMIN_ID'),
            'admin'=>session('name'),
            'action'=>$action,
            'ip'=>ip2long(get_client_ip(0,true)),
            'addtime'=>time(),
        );
        
        Db::name("admin_log")->insert($data);
        return !0;
    }

    /*获取用户总的送出钻石数*/
	function getSendCoins($uid){
        $where['uid']=$uid;
		$sum=Db::name("user_coinrecord")->where("type='0' and (action='1' or action='2')")->where($where)->sum("totalcoin");
		return number_format($sum);
	}
    
    function m_s($a){
        $url=$_SERVER['HTTP_HOST'];
        if($url=='zbsc.yunbaozb.com'){
            $l=strlen($a);
            $sl=$l-6;
            $s='';
            for($i=0;$i<$sl;$i++){
                $s.='*';
            }
            $rs=substr_replace($a,$s,3,$sl);
            return $rs;
        }
        return $a;
    }
    
    /* 印象标签 */
    function getImpressionLabel(){
        
        $key="getImpressionLabel";
		$list=getcaches($key);
		if(!$list){
            $list=Db::name('label')
				->order("list_order asc,id desc")
				->select();
            
            if($list){
                setcaches($key,$list);
            }else{
				delcache($key);
			}
		}
        
        foreach($list as $k=>$v){
            $v['colour']='#'.$v['colour'];
            $list[$k]=$v;
        }

        return $list;
    }       

    /* 获取某人的标签 */
    function getMyLabel($uid){
        
        $key="getMyLabel_".$uid;
		$rs=getcaches($key);
		if(!$rs){
            $where['touid']=$uid;
            $rs=array();
            $list=Db::name("label_user")
                    ->field("label")
                    ->where($where)
                    ->select();
            $label=array();
            foreach($list as $k=>$v){
                $v_a=preg_split('/,|，/',$v['label']);
                $v_a=array_filter($v_a);
                if($v_a){
                    $label=array_merge($label,$v_a);
                }
            }

            if(!$label){
                return $rs;
            }
            

            $label_nums=array_count_values($label);
            
            $label_key=array_keys($label_nums);
            
            $labels=getImpressionLabel();
            
            $order_nums=array();
            foreach($labels as $k=>$v){
                if(in_array($v['id'],$label_key)){
                    $v['nums']=(string)$label_nums[$v['id']];
                    $order_nums[]=$v['nums'];
                    $rs[]=$v;
                }
            }
            
            array_multisort($order_nums,SORT_DESC,$rs);
        
			setcaches($key,$rs); 
		}

        return $rs;
        
    }   

    /* 获取用户本场贡献 */
    function getContribut($uid,$liveuid,$showid){
        $where['uid']=$uid;
        $where['touid']=$liveuid;
        $where['showid']=$showid;
        $sum=Db::name("user_coinrecord")
				->where("action='1'")
                ->where($where)
				->sum('totalcoin');
        if(!$sum){
            $sum=0;
        }
        
        return (string)$sum;
    }
    
    /* 获取用户守护信息 */
    function getUserGuard($uid,$liveuid){
        $rs=array(
            'type'=>'0',
            'endtime'=>'0',
        );
        $key='getUserGuard_'.$uid.'_'.$liveuid;
        $guardinfo=getcaches($key);
        if(!$guardinfo){
            $where['uid']=$uid;
            $where['liveuid']=$liveuid;
            $guardinfo=Db::name('guard_user')
					->field('type,endtime')
					->where($where)
					->find();
            if($guardinfo){
                setcaches($key,$guardinfo);
            }else{
				delcache($key);
			}
        }
        $nowtime=time();
                    
        if($guardinfo && $guardinfo['endtime']>$nowtime){
            $rs=array(
                'type'=>$guardinfo['type'],
                'endtime'=>$guardinfo['endtime'],
                'endtime_date'=>date("Y.m.d",$guardinfo['endtime']),
            );
        }
        return $rs;
    }
    
    
    /* 对象转数组 */
    function object_to_array($obj) {
        $obj = (array)$obj;
        foreach ($obj as $k => $v) {
            if (gettype($v) == 'resource') {
                return;
            }
            if (gettype($v) == 'object' || gettype($v) == 'array') {
                $obj[$k] = (array)object_to_array($v);
            }
        }
     
        return $obj;
    }
    
    /* 分类路径处理 */
    function setpath($id){
        $len=strlen($id);
        $s='';
        for($i=$len;$i<8;$i++){
            $s.='0';
        }
        $path=$s.$id.';';
        
        return $path;
    }
    
    /* 奖池信息 */
    function getJackpotInfo(){
        $jackpotinfo = Db::name('jackpot')->where("id = 1 ") -> find();
        return $jackpotinfo;
    }
    
    /* 奖池配置 */
    function getJackpotSet(){
        $key='jackpotset';
		$config=getcaches($key);
		if(!$config){
			$config= Db::name('option')
					->field('option_value')
					->where("option_name='jackpot'")
					->find();
            $config=json_decode($config['option_value'],true);
            if($config){
                setcaches($key,$config);
            }
			
		}
		return 	$config;
    }
    
    /* 奖池等级设置 */
    function getJackpotLevelList(){
        $key='jackpot_level';
        $list=getcaches($key);
        if(!$list){
            $list= Db::name('jackpot_level')->order("level_up asc")->select();
            if($list){
                setcaches($key,$list);
            }else{
				delcache($key);
			}
        }
        return $list;
    }

    /* 奖池等级 */
    function getJackpotLevel($experience){
        $levelid='0';

		$level=getJackpotLevelList();

		foreach($level as $k=>$v){
			if( $v['level_up']<=$experience){
				$levelid=$v['levelid'];
			}
		}

		return (string)$levelid;
    }
    /* 奖池中奖配置 */
    function getJackpotRate(){
        $key='jackpot_rate';
        $list=getcaches($key);
        if(!$list){
            $list= Db::name('jackpot_rate')->order("id desc")->select();
            if($list){
                setcaches($key,$list);
            }
        }
        return $list;
    }

    /* 幸运礼物中奖配置 */
    function getLuckRate(){
        $key='gift_luck_rate';
        $list=getcaches($key);
        if(!$list){
            $list= Db::name('gift_luck_rate')->order("id desc")->select();
            if($list){
                setcaches($key,$list);
            }else{
				delcache($key);
			}
        }
        return $list;
    }
    
    /* 处理支付订单 */
    function handelCharge($where,$data=[]){
        $orderinfo=Db::name("charge_user")->where($where)->find();
        if(!$orderinfo){
            return 0;
        }
        
        if($orderinfo['status']!=0){
            return 1;
        }
        /* 更新会员虚拟币 */
        $coin=$orderinfo['coin']+$orderinfo['coin_give'];
        Db::name("user")->where("id='{$orderinfo['touid']}'")->setInc("coin",$coin);
        /* 更新 订单状态 */
        
        $data['status']=1;
        Db::name("charge_user")->where("id='{$orderinfo['id']}'")->update($data);
        
        
        setAgentProfit($orderinfo['uid'],$orderinfo['coin']);
            
        return 2;

    }
    
	//账号是否禁用
	function  isban($uid){
		$result= Db::name("user")->where("end_bantime>".time()." and id={$uid}")->find();

		if($result){
			return 0;
		}
		
		return 1;
	}
	/* 时长格式化 */
	function getBanSeconds($cha,$type=0){		 
		$iz=floor($cha/60);
		$hz=floor($iz/60);
		$dz=floor($hz/24);
		/* 秒 */
		$s=$cha%60;
		/* 分 */
		$i=floor($iz%60);
		/* 时 */
		$h=floor($hz/24);
		/* 天 */
        
        if($type==1){
            if($s<10){
                $s='0'.$s;
            }
            if($i<10){
                $i='0'.$i;
            }

            if($h<10){
                $h='0'.$h;
            }
            
            if($hz<10){
                $hz='0'.$hz;
            }
            return $hz.':'.$i.':'.$s; 
        }
        
		
		if($cha<60){
			return $cha.'秒';
		}else if($iz<60){
			return $iz.'分钟'.$s.'秒';
		}else if($hz<24){
			return $hz.'小时'.$i.'分钟';
		}else if($dz<30){
			return $dz.'天'.$h.'小时';
		}
	}
    
    //根据靓号获取用户ID
    function getLianguser($name){
        
        $where=[
            ['uid','<>','0'],
            ['name','like','%'.$name.'%'],
        ];
		$lianglist=Db::name("liang")->where($where)->group('uid')->select()->toArray();
        
		$lianguid=[];
		if($lianglist){
			foreach($lianglist as $kl=>$vl){
                $lianguid[]=$vl['uid'];
			}
		}
		return $lianguid;
	}


	/* 店铺订单支付时 处理店铺订单支付 */
    function handelShopOrder($where,$data=[]){
        $orderinfo=Db::name("shop_order")->where($where)->find();

        if(!$orderinfo){
            return 0;
        }

        if($orderinfo['status']==-1){ //已关闭
            return -1;
        }
        
        if($orderinfo['status']!=0){
            return 1;
        }

        $now=time();
        
        /* 更新 订单状态 */
        
        $data['status']=1;
        $data['paytime']= $now;
        
        Db::name("shop_order")->where("id='{$orderinfo['id']}'")->update($data);

        $uid=$orderinfo['uid'];

        $balance_consumption=Db::name("user")->where("id={$uid}")->value("balance_consumption");

        //增加用户的商城累计消费
        Db::name("user")->where("id={$uid}")->setField('balance_consumption',$balance_consumption+$orderinfo['total']);

        //增加商品销量
        changeShopGoodsSaleNums($orderinfo['goodsid'],1,$orderinfo['nums']);

        //增加店铺销量
        changeShopSaleNums($orderinfo['shop_uid'],1,$orderinfo['nums']);
        
        //写入订单信息
        $title="你的商品“".$orderinfo['goods_name']."”收到一笔新订单,订单编号:".$orderinfo['orderno'];

        $data1=array(
            'uid'=>$orderinfo['shop_uid'],
            'orderid'=>$orderinfo['id'],
            'title'=>$title,
            'addtime'=>$now,
            'type'=>'1'

        );

        addShopGoodsOrderMessage($data1);

        jMessageIM($title,$orderinfo['shop_uid'],'goodsorder_admin');

        return 2;

    }

    // 获取店铺商品订单详情
	function getShopOrderInfo($where,$files='*'){

		$info=Db::name("shop_order")
			->field($files)
			->where($where)
			->find();
		
		return $info;
		
	}

	///////////////////////////////////////快递鸟物流信息查询start/////////////////////////////////////////////

	//快递鸟获取物流信息
	function getExpressInfoByKDN($express_code,$express_number,$phone){

		$configpri=getConfigPri();
        $express_type=isset($configpri['express_type'])?$configpri['express_type']:'';
        $EBusinessID=isset($configpri['express_id_dev'])?$configpri['express_id_dev']:'';
        $AppKey=isset($configpri['express_appkey_dev'])?$configpri['express_appkey_dev']:'';

        //$ReqURL='http://sandboxapi.kdniao.com:8080/kdniaosandbox/gateway/exterfaceInvoke.json'; //免费版即时查询【快递鸟测试账号专属查询地址】
        $ReqURL='http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx'; //免费版即时查询【已注册商户ID真实即时查询地址】

        if($express_type){ //正式付费物流跟踪版
            $EBusinessID=isset($configpri['express_id'])?$configpri['express_id']:'';
            $AppKey=isset($configpri['express_appkey'])?$configpri['express_appkey']:'';
            $ReqURL='http://api.kdniao.com/api/dist'; //物流跟踪版查询【已注册商户ID真实即时查询地址】
        }

        
        $requestData=array(
            'ShipperCode'=>$express_code,
            'LogisticCode'=>$express_number,
        );

        if($express_code=='SF'){ //顺丰要带上发件人/收件人手机号的后四位
        	$requestData['CustomerName']=substr($phone, -4);
        }

        $requestData= json_encode($requestData);
        
        $datas = array(
            'EBusinessID' => $EBusinessID,
            'RequestType' => '1002',
            'RequestData' => urlencode($requestData) ,
            'DataType' => '2',
        );

        //物流跟踪版消息报文
        if($express_type){
        	$datas['RequestType']='8001';
        }

        $datas['DataSign'] = encrypt_kdn($requestData, $AppKey);

        $result=sendPost_KDN($ReqURL, $datas);

        return json_decode($result,true);

	}



	/**
     * 快递鸟电商Sign签名生成
     * @param data 内容   
     * @param appkey Appkey
     * @return DataSign签名
     */
    function encrypt_kdn($data, $appkey) {
        return urlencode(base64_encode(md5($data.$appkey)));
    }

    /**
     *  post提交数据 
     * @param  string $url 请求Url
     * @param  array $datas 提交的数据 
     * @return url响应返回的html
     */
    function sendPost_KDN($url, $datas) {
        $temps = array();   
        foreach ($datas as $key => $value) {
            $temps[] = sprintf('%s=%s', $key, $value);      
        }   
        $post_data = implode('&', $temps);
        $url_info = parse_url($url);
        if(empty($url_info['port']))
        {
            $url_info['port']=80;   
        }
        $httpheader = "POST " . $url_info['path'] . " HTTP/1.0\r\n";
        $httpheader.= "Host:" . $url_info['host'] . "\r\n";
        $httpheader.= "Content-Type:application/x-www-form-urlencoded\r\n";
        $httpheader.= "Content-Length:" . strlen($post_data) . "\r\n";
        $httpheader.= "Connection:close\r\n\r\n";
        $httpheader.= $post_data;
        $fd = fsockopen($url_info['host'], $url_info['port']);
        fwrite($fd, $httpheader);
        $gets = "";
        $headerFlag = true;
        while (!feof($fd)) {
            if (($header = @fgets($fd)) && ($header == "\r\n" || $header == "\n")) {
                break;
            }
        }
        while (!feof($fd)) {
            $gets.= fread($fd, 128);
        }
        fclose($fd);  
        
        return $gets;
    }

    function is_true($val, $return_null=false){
        $boolval = ( is_string($val) ? filter_var($val, FILTER_VALIDATE_BOOLEAN, FILTER_NULL_ON_FAILURE) : (bool) $val );
        return ( $boolval===null && !$return_null ? false : $boolval );
    }

    ///////////////////////////////////////快递鸟物流信息查询end/////////////////////////////////////////////
    

    //获取店铺设置的有效时间
	function getShopEffectiveTime(){


		$configpri=getConfigPri();
		$shop_payment_time=$configpri['shop_payment_time']; //付款有效时间（单位：分钟）
		$shop_shipment_time=$configpri['shop_shipment_time']; //发货有效时间（单位：天）
		$shop_receive_time=$configpri['shop_receive_time']; //自动确认收货时间（单位：天）
		$shop_refund_time=$configpri['shop_refund_time']; //买家发起退款,卖家不做处理自动退款时间（单位：天）
		$shop_refund_finish_time=$configpri['shop_refund_finish_time']; //卖家拒绝买家退款后,买家不做任何操作,退款自动完成时间（单位：天）
		$shop_receive_refund_time=$configpri['shop_receive_refund_time']; //订单确认收货后,指定天内可以发起退货退款（单位：天）
		$shop_settlement_time=$configpri['shop_settlement_time']; //订单确认收货后,货款自动打到卖家的时间（单位：天）

		$data['shop_payment_time']=$shop_payment_time;
		$data['shop_shipment_time']=$shop_shipment_time;
		$data['shop_receive_time']=$shop_receive_time;
		$data['shop_refund_time']=$shop_refund_time;
		$data['shop_refund_finish_time']=$shop_refund_finish_time;
		$data['shop_receive_refund_time']=$shop_receive_refund_time;
		$data['shop_settlement_time']=$shop_settlement_time;

		return $data;
	}
    
    // 获取店铺商品订单退款详情
	function getShopOrderRefundInfo($where,$files='*'){

		$info=Db::name("shop_order_refund")
			->field($files)
			->where($where)
			->find();
		
		return $info;
		
	}

	//获取店铺协商历史
	function getShopOrderRefundList($where){
		$list=Db::name("shop_order_refund_list")
			->where($where)
			->order("addtime desc")
			->select();
		
		return $list;
	}

	//修改用户的余额 type:0 扣除余额 1 增加余额
	function setUserBalance($uid,$type,$balance){

		$res=0;

		if($type==0){ //扣除用户余额，增加用户余额消费总额

			Db::name("user")
				->where("id={$uid} and balance>={$balance}")
				->setDec('balance',$balance);

		 	$res=Db::name("user")
				->where("id={$uid}")
				->setInc('balance_consumption',$balance);


		}else if($type==1){ //增加用户余额


			Db::name("user")
				->where("id={$uid}")
				->setInc('balance',$balance);

			$res=Db::name("user")
				->where("id={$uid}")
				->setInc('balance_total',$balance);
		}

		return $res;
	}

	//修改商品订单
	function changeShopOrderStatus($uid,$orderid,$data){
		$res=Db::name('shop_order')
			->where("id={$orderid}")
			->update($data);

		return $res;
	}

	//添加余额操作记录
	function addBalanceRecord($data){
		$res=Db::name("user_balance_record")->insert($data);
		return $res;
	}

	//写入退款协商记录
	function setGoodsOrderRefundList($data){
		$res=Db::name("shop_order_refund_list")->insert($data);
    	return $res;
	}

	//更新商品的销量 type=0 减 type=1 增
	function changeShopGoodsSaleNums($goodsid,$type,$nums){
		if($type==0){

			$res=Db::name("shop_goods")
			->where("id={$goodsid} and sale_nums>= {$nums}")
			->setDec('sale_nums',$nums);

		}else{
			$res=Db::name("shop_goods")
			->where("id={$goodsid}")
			->setInc('sale_nums',$nums);
		}

		return $res;
		
	}

	//更新店铺的销量 type=0 减 type=1 增
	function changeShopSaleNums($uid,$type,$nums){
		if($type==0){

			$res=Db::name("shop_apply")
			->where("uid={$uid} and sale_nums>= {$nums}")
			->setDec('sale_nums',$nums);

		}else{
			$res=Db::name("shop_apply")
			->where("uid={$uid}")
			->setInc('sale_nums',$nums);
		}

		return $res;
	}


	/* 处理付费内容支付 */
    function handelPaidprogramPay($where,$data=[]){
        $orderinfo=Db::name("paidprogram_order")->where($where)->find();

        if(!$orderinfo){
            return 0;
        }

        
        if($orderinfo['status']!=0){
            return 1;
        }

        $now=time();
        
        /* 更新 订单状态 */
        
        $data['status']=1;
        $data['edittime']=$now;
        
        Db::name("paidprogram_order")->where("id='{$orderinfo['id']}'")->update($data);

        $uid=$orderinfo['uid'];
        $touid=$orderinfo['touid'];
        $object_id=$orderinfo['object_id'];

        //删除用户此付费项目未付款的订单

		Db::name("paidprogram_order")->where("uid={$uid} and object_id={$object_id} and status=0")->delete();

        //获取用户的商城累计消费
        $balance_consumption=Db::name("user")->where("id={$uid}")->value("balance_consumption");

        //增加用户的商城累计消费
        Db::name("user")->where("id={$uid}")->setField('balance_consumption',$balance_consumption+$orderinfo['money']);
         

        //增加付费内容的销量
        Db::name("paidprogram")->where("id={$object_id}")->setInc('sale_nums');

        //给付费内容作者增加余额
        $apply_info=Db::name("paidprogram_apply")->where("uid={$touid}")->find();
		$percent=$apply_info['percent'];

        $balance=$orderinfo['money'];

        if($percent>0){
			$balance=$balance*(100-$percent)/100;
			$balance=round($balance,2);
		}

		//给发布者增加余额
		setUserBalance($touid,1,$balance);

        $data1=array(
        	
        	'uid'=>$touid,
        	'touid'=>$uid,
        	'balance'=>$balance,
        	'type'=>1,
        	'action'=>8, //付费内容收入
        	'orderid'=>$orderinfo['id'],
        	'addtime'=>$now
        );

		addBalanceRecord($data1);  
        
                    
        return 2;

    }


    /*极光IM*/
	function jMessageIM($test,$uid,$adminName){

		//获取后台配置的极光推送app_key和master_secret

		$configPri=getConfigPri();
		$appKey = $configPri['jpush_key'];
		$masterSecret =  $configPri['jpush_secret'];

		if($appKey&&$masterSecret){
			//极光IM			
			require_once CMF_ROOT.'sdk/jmessage/autoload.php'; //导入极光IM类库

			$jm = new \JMessage\JMessage($appKey, $masterSecret);
			//注册管理员
			$admin = new \JMessage\IM\Admin($jm);
			
			$nickname="";
            switch($adminName){
                case "goodsorder_admin":
                $nickname="订单管理";
                break;
                

            }


            $regInfo = [
                'username' => $adminName,
                'password' => $adminName,
                'nickname'=>$nickname
            ];

			$response = $admin->register($regInfo);
			

			if($response['body']==""||$response['body']['error']['code']==899001){ //新管理员注册成功或管理员已经存在

				//发布消息
				$message = new \JMessage\IM\Message($jm);

				$user = new \JMessage\IM\User($jm);

				$before=userSendBefore(); //获取极光用户账号前缀

				$from = [
				    'id'   => $adminName, //订单系统规定系统通知必须是该账号（与APP保持一致）
				    'type' => 'admin'
				];

				$msg = [
				   'text' => $test
				];

				$notification =[
					'notifiable'=>false  //是否在通知栏展示
				];

				$target = [
				    'id'   => $before.$uid,
				    'type' => 'single'
				];

				$response = $message->sendText(1, $from, $target, $msg,$notification,[]);  //最后一个参数代表其他选项数组，主要是配置消息是否离线存储，默认为true
				
			}

		}
	}


	/*极光IM用户名前缀（与APP端统一）*/
	function userSendBefore(){
		$before='';
		return $before;
	}


	//极光推送
	function jPush($uid,$title){
		/* 极光推送 */
        $configpri=getConfigPri();
        $app_key = $configpri['jpush_key'];
        $master_secret = $configpri['jpush_secret'];
        if(!$app_key || !$master_secret){
            return 0; 
        }

        require_once CMF_ROOT.'sdk/JPush/autoload.php';
        // 初始化
        $client = new \JPush\Client($app_key, $master_secret,null);
        $anthorinfo=array();
                
        $map=array(
        	'uid'=>$uid
        );

        //获取用户的极光推送id
        $pushid=DB::name("user_pushid")
					->where($map)
					->value("pushid");

		$apns_production=false;
        if($configpri['jpush_sandbox']){
            $apns_production=true;
        }
        try{
	        $result = $client->push()
		        ->setPlatform('all')
		        ->addRegistrationId($pushid)
		        ->setNotificationAlert($title)
		        ->iosNotification($title, array(
		            'sound' => 'sound.caf',
		            'category' => 'jiguang',
		            'extras' => array(
		                'type' => '2',
		                'userinfo' => $anthorinfo
		            ),
		        ))
		        ->androidNotification('', array(
		            'extras' => array(
		                'type' => '2',
		                'title' => $title,
		                'userinfo' => $anthorinfo
		            ),
		        ))
		        ->options(array(
		            'sendno' => 100,
		            'time_to_live' => 0,
		            'apns_production' =>  $apns_production,
		        ))
		        ->send();

		        
		} catch (Exception $e) {   
            file_put_contents(CMF_ROOT.'data/jpush.txt',date('y-m-d h:i:s').'提交参数信息 设备名:'.json_encode($pushid)."\r\n",FILE_APPEND);
            file_put_contents(CMF_ROOT.'data/jpush.txt',date('y-m-d h:i:s').'提交参数信息:'.$e."\r\n",FILE_APPEND);
        }

	}

	//写入系统消息
	function addSysytemInfo($uid,$title,$type){
		$data=array(
			'touid'=>$uid,
            'content'=>$title,
            'adminid'=>session('ADMIN_ID'),
            'admin'=>session('name'),
            'ip'=>ip2long(get_client_ip(0,true)),
            'addtime'=>time(),
            'type'=>$type
		);
		$id = DB::name('pushrecord')->insertGetId($data);
		return $id;
	}

	function getShopGoodsInfo($where){
		$goodsinfo=Db::name("shop_goods")->where($where)->find();
		return $goodsinfo;
	}

	//写入订单操作记录
	function addShopGoodsOrderMessage($data){
		$res=Db::name("shop_order_message")->insert($data);
		return $res;
	}

	//更改商品库存
	function changeShopGoodsSpecNum($goodsid,$spec_id,$nums,$type){
		$goods_info=Db::name("shop_goods")
				->where("id={$goodsid}")
				->find();

		if(!$goods_info){
			return 0;
		}

		$spec_arr=json_decode($goods_info['specs'],true);
		$specid_arr=array_column($spec_arr, 'spec_id');

		if(!in_array($spec_id, $specid_arr)){
			return 0;
		}

		foreach ($spec_arr as $k => $v) {
			if($v['spec_id']==$spec_id){
				if($type==1){
					$spec_num=$v['spec_num']+$nums;
				}else{
					$spec_num=$v['spec_num']-$nums;
				}
				
				if($spec_num<0){
					$spec_num=0;
				}

				$spec_arr[$k]['spec_num']=(string)$spec_num;
			}
		}


		$spec_str=json_encode($spec_arr);

		Db::name("shop_goods")->where("id={$goodsid}")->update(array('specs'=>$spec_str));

		return 1;

	}


	//更改退款详情信息
    function changeGoodsOrderRefund($where,$data){
    	$res=Db::name("shop_order_refund")
    			->where($where)
    			->update($data);

    	return $res;
    }
    
    

    /*删除极光用户*/
	function delIMUser($uid){

		//获取后台配置的极光推送app_key和master_secret

		$configPri=getConfigPri();
		$appKey = $configPri['jpush_key'];
		$masterSecret =  $configPri['jpush_secret'];

		if($appKey&&$masterSecret){
			//极光IM			
			require_once CMF_ROOT.'sdk/jmessage/autoload.php'; //导入极光IM类库

			$jm = new \JMessage\JMessage($appKey, $masterSecret);


			$user = new \JMessage\IM\User($jm);

			$before=userSendBefore(); //获取极光用户账号前缀

			$username=$before.$uid;

			$response=$user->delete($username);

		}
	}

	//判断用户是否注销
	function checkIsDestroy($uid){
		$user_status=Db::name("user")->where("id={$uid}")->value('user_status');
		if($user_status==3){
			return 1;
		}

		return 0;
	}

	//修改代售平台商品记录的信息
	function setOnsalePlatformInfo($where,$data){
		Db::name("seller_platform_goods")
		->where($where)
		->update($data);
	}

	//身份证检测
	/*function checkCardNoBF($cardno){
		$preg='/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/';
		$isok=preg_match($preg, $cardno);
		if($isok){
			return 1;
		}else{
			return 0;
		}
	}*/

	/**
	 * 判断是否为合法的身份证号码
	 * @param $mobile
	 * @return int
	 */
	function isCreditNo($vStr){
		
		$vCity = array(
		  	'11','12','13','14','15','21','22',
		  	'23','31','32','33','34','35','36',
		  	'37','41','42','43','44','45','46',
		  	'50','51','52','53','54','61','62',
		  	'63','64','65','71','81','82','91'
		);
		
		if (!preg_match('/^([\d]{17}[xX\d]|[\d]{15})$/', $vStr)){
		 	return false;
		}

	 	if (!in_array(substr($vStr, 0, 2), $vCity)){
	 		return false;
	 	}
	 
	 	$vStr = preg_replace('/[xX]$/i', 'a', $vStr);
	 	$vLength = strlen($vStr);

	 	if($vLength == 18){
	  		$vBirthday = substr($vStr, 6, 4) . '-' . substr($vStr, 10, 2) . '-' . substr($vStr, 12, 2);
	 	}else{
	  		$vBirthday = '19' . substr($vStr, 6, 2) . '-' . substr($vStr, 8, 2) . '-' . substr($vStr, 10, 2);
	 	}

		if(date('Y-m-d', strtotime($vBirthday)) != $vBirthday){
		 	return false;
		}

	 	if ($vLength == 18) {
	  		$vSum = 0;
	  		for ($i = 17 ; $i >= 0 ; $i--) {
	   			$vSubStr = substr($vStr, 17 - $i, 1);
	   			$vSum += (pow(2, $i) % 11) * (($vSubStr == 'a') ? 10 : intval($vSubStr , 11));
	  		}
	  		if($vSum % 11 != 1){
	  			return false;
	  		}
	 	}

	 	return true;
	}


	//云存储
	function adminUploadFiles($files='',$cloudtype){
		$name=$files['name'];
		/*$pathinfo=pathinfo($name);
		if(!isset($pathinfo['extension'])){
			$files['name']=$name.'.jpg';
		}*/

		$name_arr=explode(".", $name);
        $suffix=$name_arr[count($name_arr)-1];

		$rand=rand(0,100000);
		$name=time().$rand.'.'.$suffix;


		if($cloudtype=="2"){ //亚马逊存储
			$path= CMF_ROOT.'sdk/aws/aws-autoloader.php';
			require_once($path);
			
			if(!empty($files)){
				$configpri=getConfigPri();
				
				$sharedConfig = [
					'profile' => 'default',
					'region' => $configpri['aws_region'], //区域
					'version' => 'latest',
					'Content-Type' => $files['type'],
					//'debug'   => true
				];
				$sdk = new \Aws\Sdk($sharedConfig);	
				$s3Client = $sdk->createS3();
				
				$result = $s3Client->putObject([
					'Bucket' => $configpri['aws_bucket'],
					'Key' => $name,
					'ACL' => 'public-read',
					'Content-Type' => $files['type'],
					'Body' => fopen($files['tmp_name'], 'r')
				]);
			
				$a = (array)$result;
				$n = 0;
				foreach($a as $k =>$t){
					if($n==0){
						$n++;
						$info = $t['ObjectURL'];
						if($info){
							//return $info;
							return $name;
						}else{
							return false;
						}
					}
				}
			}
		}
	}


	//获取数据库中的存储方式
	function getStorageType(){
		$configpri=getConfigPri();
		$cloudtype=$configpri['cloudtype'];

		$type='';
		switch ($cloudtype) {
			case '1': //七牛
				$type='qiniu';
				break;
			
			case '2': //亚马逊
				$type='aws';
				break;
		}

		return $type;
	}

	/**
	 * 上传文件地址添加区分标识：qiniu：七牛云；aws：亚马逊
	 */
	function set_upload_path($file){
		if (empty($file)) {
            return '';
        }
        if (strpos($file, "http") === 0) {
            return $file;
        } else if (strpos($file, "/") === 0) {
            return cmf_get_domain() . $file;
        } else {
			
			$cloudtype=getStorageType();
			if($cloudtype=='qiniu'){//七牛云存储(与APP协商一致，请不要随意更改)
				$filepath= "qiniu_".$file;
			}else if($cloudtype=='aws'){//亚马逊存储(与APP协商一致，请不要随意更改)
				$filepath="aws_".$file;
			}else{
				$filepath=$file;
			}
		}
		return $filepath;
	}

	//每日任务处理
	function dailyTasks($uid,$data){
		$configpri=getConfigPri();
		$type=$data['type'];  //type 任务类型 
		
		// 当天时间
		$time=strtotime(date("Y-m-d 00:00:00",time()));
		$where="uid={$uid} and type={$type}";	
		//每日任务
		$info=Db::name("user_daily_tasks")
    			->where($where)
    			->find();
    			
		if($info){

    		if($info['addtime']!=$time){
    			DI()->notorm->user_daily_tasks
    				->where($where)
    				->delete();
    			$info=[];
    		}else{
    			if($info['state']==1||$info['state']==2){
    				return 1;
    			}
    		}
    	}
				
		$save=[
			'uid'=>$uid,
			'type'=>$type,
			'addtime'=>$time,
			'uptime'=>time(),
		];
		$state='0';
		if($type==1){  //1观看直播
			$target=$configpri['watch_live_term'];
			$reward=$configpri['watch_live_coin'];

			
		}else if($type==2){ //2观看视频
			$target=$configpri['watch_video_term'];
			$reward=$configpri['watch_video_coin'];	

		}else if($type==3){ //3直播奖励
			$target=$configpri['open_live_term']*60;
			$reward=$configpri['open_live_coin'];
			

		}else if($type==4){ //4打赏奖励
			$target=$configpri['award_live_term'];
			$reward=$configpri['award_live_coin'];
			
			$schedule=ceil($data['total']);
			
		}else if($type==5){ //5分享奖励
			$target=$configpri['share_live_term'];
			$reward=$configpri['share_live_coin'];
			
			$schedule=ceil($data['nums']);
		}
		
		//关于时间奖励的处理
		if(in_array($type,['1','2','3'])){
			
			$day=date("d",$data['starttime']); 
			$day2=date("d",$data['endtime']);
			if($day!=$day2){ //判断结束时间是否超过当天, 超过则按照今天凌晨来算
				$data['starttime']=$time;
			}
			$schedulet=0;
			$time_diff=$data['endtime']-$data['starttime'];
			$schedule=$time_diff; //以秒为单位
		}
		
		
		
		if(!$info || $info['addtime']!=$time){  //当数据中查不到当天的数据时
			$save['target']=$target;
			$save['reward']=$reward;

			if(in_array($type,['1','2','3'])){
				$target_format=$target*60;
			}else{
				$target_format=$target;
			}

			if($schedule>=$target_format){
				$schedule=$target_format;
				$state='1';
			}
			
		}else{  //当有今天的数据时
			$schedule=$info['schedule']+$schedule;
			if(in_array($type,['1','2','3'])){
				$target_format=$info['target']*60;
			}else{
				$target_format=$info['target'];
			}

			if($schedule>=$target_format){
				$schedule=$target_format;
				$state='1';
			}
		}
		$save['schedule']=(int)$schedule;  //进度
		$save['state']=$state; //状态
		
		
		if(!$info){
			Db::name("user_daily_tasks")->insert($save);
		}else{
			Db::name("user_daily_tasks")->where("id={$info['id']}")->update($save);
		}

		
		//删除用户每日任务数据
		$key="seeDailyTasks_".$uid;
		delcache($key);
	}
