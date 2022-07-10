<?php

/**
 * 短视频
 */
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;

class VideoController extends AdminbaseController {

	protected function getStatus($k=''){
        $status=array(
            '0'=>'待审核',
            '1'=>'通过',
            '2'=>'拒绝',
        );
        if($k===''){
            return $status;
        }
        
        return isset($status[$k]) ? $status[$k]: '';
    }
    
    protected function getDel($k=''){
        $isdel=array(
            '0'=>'上架',
            '1'=>'下架',
        );
        if($k===''){
            return $isdel;
        }
        
        return isset($isdel[$k]) ? $isdel[$k]: '';
    }
    
    protected function getOrdertype($k=''){
        $type=array(
            'comments DESC'=>'评论数排序',
            'likes DESC'=>'点赞数排序',
            'shares DESC'=>'分享数排序',
        );
        if($k===''){
            return $type;
        }
        
        return isset($type[$k]) ? $type[$k]: '';
    }
    
    protected function getCLass(){
        $list = Db::name('video_class')
            ->order("list_order asc")
            ->column('*','id');
        return $list;
    }
    
    function index(){

		$data = $this->request->param();
        $map=[];
		
        $status=isset($data['status']) ? $data['status']: '';
        if($status!=''){
            $map[]=['status','=',$status];
        }
        
        $isdel=isset($data['isdel']) ? $data['isdel']: '';
        if($isdel!=''){
            $map[]=['isdel','=',$isdel];
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
        
        $keyword=isset($data['keyword']) ? $data['keyword']: '';
        if($keyword!=''){
            $map[]=['id','=',$keyword];
        }
        
        $keyword1=isset($data['keyword1']) ? $data['keyword1']: '';
        if($keyword1!=''){
            $map[]=['title','like','%'.$keyword1.'%'];
        }
        
        $ordertype=isset($data['ordertype']) ? $data['ordertype']: 'id DESC';
        

        $lists = Db::name("video")
            ->where($map)
			->order($ordertype)
			->paginate(20);
        
        $lists->each(function($v,$k){
			$v['userinfo']=getUserInfo($v['uid']);
			$v['thumb']=get_upload_path($v['thumb']);
            return $v;
        });
        
        $lists->appends($data);
        
        $page = $lists->render();

    	$this->assign('lists', $lists);

    	$this->assign("page", $page);
        
    	$this->assign("status", $this->getStatus());
    	$this->assign("ordertype", $this->getOrdertype());
    	$this->assign("isdel", $this->getDel());
    	$this->assign("class", $this->getCLass());
        
    	$this->assign("status2", $status);
    	$this->assign("isdel2", $isdel);

        
    	
    	return $this->fetch('index');
        
    }
    
    public function wait(){
        $this->assign('sign','wait');
        return $this->index();
    }
    public function nopass(){
        $this->assign('sign','nopass');
        return $this->index();
    }
    
    public function lower(){
        $this->assign('sign','lower');
        return $this->index();
    }
		
	function del(){
        $data = $this->request->param();
        
        if (isset($data['id'])) {
            $id = $data['id']; //获取删除id

            $rs = DB::name('video')->where("id={$id}")->delete();
            if(!$rs){
                $this->error("删除失败！");
            }
            
            DB::name("video_black")->where("videoid={$id}")->delete();	 //删除视频拉黑
            DB::name("video_comments")->where("videoid={$id}")->delete();	 //删除视频评论
            DB::name("video_like")->where("videoid={$id}")->delete();	 //删除视频喜欢
            DB::name("video_report")->where("videoid={$id}")->delete();	 //删除视频举报
            DB::name("video_comments_like")->where("videoid={$id}")->delete(); //删除视频评论喜欢
			
			
			$action="删除视频：{$id}";
			setAdminLog($action);

            
        } elseif (isset($data['ids'])) {
            $ids = $data['ids'];
            
            $rs = DB::name('video')->where('id', 'in', $ids)->delete();
            if(!$rs){
                $this->error("删除失败！");
            }
            
            DB::name("video_black")->where('videoid', 'in', $ids)->delete();	 //删除视频拉黑
            DB::name("video_comments")->where('videoid', 'in', $ids)->delete();	 //删除视频评论
            DB::name("video_like")->where('videoid', 'in', $ids)->delete();	 //删除视频喜欢
            DB::name("video_report")->where('videoid', 'in', $ids)->delete();	 //删除视频举报
            DB::name("video_comments_like")->where('videoid', 'in', $ids)->delete(); //删除视频评论喜欢
			
		    $action="删除视频：".implode(",",$ids);
			setAdminLog($action);

        }
        
        $this->success("删除成功！");								  			
	}
    
	function add(){
        $this->assign("class", $this->getCLass());
		return $this->fetch();
	}
    function addPost(){
		if ($this->request->isPost()) {
            
            $data      = $this->request->param();
            
			$uid=$data['uid'];

			if($uid==""){
				$this->error("请填写用户ID");
			}
            
            $isexist=DB::name("user")->where("id={$uid} and user_type=2")->value('id');
            if(!$isexist){
                $this->error("该用户不存在");
            }
			$title=$data['title'];
			if($title==""){
				$this->error("请填写标题");
			}
            
			$thumb=$data['thumb'];
			if($thumb==""){
				$this->error("请上传图片");
			}

			$data['thumb']=set_upload_path($thumb);
			$data['thumb_s']=set_upload_path($thumb);
            
			$href=$data['href'];
			if($href==""){
				$this->error("请上传视频");
			}

			$data['href']=set_upload_path($href);
            
            $href_w=$data['href_w'];
			if($href_w==""){
				$this->error("请上传水印视频");
			}

			$data['href_w']=set_upload_path($href_w);
			
			
			//计算封面尺寸比例
			$anyway='1.1';

            $configpub=getConfigPub(); //获取公共配置信息

			$thumb_url=get_upload_path($thumb);

            $refer=$configpub['site'];
            $option=array('http'=>array('header'=>"Referer: {$refer}"));
            $context=stream_context_create($option);//创建资源流上下文
            $file_contents = file_get_contents($thumb_url,false, $context);//将整个文件读入一个字符串
            $thumb_size = getimagesizefromstring($file_contents);//从字符串中获取图像尺寸信息

			if($thumb_size){
				$thumb_width=$thumb_size[0];  //封面-宽
				$thumb_height=$thumb_size[1];  //封面-高

				$anyway=round($thumb_height/$thumb_width); 
			}
			
			$data['anyway']=$anyway;
            
            $data['addtime']=time();
            
			$id = DB::name('video')->insertGetId($data);
            if(!$id){
                $this->error("添加失败！");
            }
			
			$action="添加视频：{$id}";
			setAdminLog($action);
            
            $this->success("添加成功！");
            
		}
	}
        
    function edit(){
        
        $id   = $this->request->param('id', 0, 'intval');
        
        $data=Db::name('video')
            ->where("id={$id}")
            ->find();
        if(!$data){
            $this->error("信息错误");
        }
        $data['userinfo']=getUserInfo($data['uid']);
		
		$goodsinfo=[];
        if($data['type']==1){
            //获取视频绑定的商品
            $goodsinfo=Db::name("shop_goods")->where("id={$data['goodsid']}")->find();
        }
	
		
		if($goodsinfo){
			$thumb_arr=explode(',',$goodsinfo['thumbs']);
			$goodsinfo['thumb']=get_upload_path($thumb_arr[0]);
			
			$oneclass_name=Db::name("shop_goods_class")->where("gc_id={$goodsinfo['one_classid']}")->value("gc_name");
			$twoclass_name=Db::name("shop_goods_class")->where("gc_id={$goodsinfo['two_classid']}")->value("gc_name");
			$threeclass_name=Db::name("shop_goods_class")->where("gc_id={$goodsinfo['three_classid']}")->value("gc_name");

			$goodsinfo['oneclass_name']=isset($oneclass_name)?$oneclass_name:'无';
			$goodsinfo['twoclass_name']=isset($twoclass_name)?$twoclass_name:'无';
			$goodsinfo['threeclass_name']=isset($threeclass_name)?$threeclass_name:'无';
			

			$goodsinfo['old_price']=$goodsinfo['original_price'];
			$goodsinfo['price']=$goodsinfo['present_price'];
			$goodsinfo['des']=$goodsinfo['goods_desc'];
			$goodsinfo['type_name']='站外商品';
			if($goodsinfo['type']==0){ //站内
				$goodsinfo['old_price']='无';
				$goodsinfo['price']=$goodsinfo['low_price'];
				$goodsinfo['des']=$goodsinfo['content'];
				$goodsinfo['type_name']='站内商品';
				$goodsinfo['href']='无';
			}
			
		}

        $this->assign('data', $data);
        $this->assign('goodsinfo', $goodsinfo);
		
        
        $this->assign("class", $this->getCLass());
        
        return $this->fetch();
	}
	function editPost(){
		if ($this->request->isPost()) {
            
            $data = $this->request->param();
            
			
			/*$title=$data['title'];
			if($title==""){
				$this->error("请填写标题");
			}*/
            
			$thumb=$data['thumb'];
			if($thumb==""){
				$this->error("请上传图片");
			}

			$thumb_old=$data['thumb_old'];
			if($thumb!=$thumb_old){
				$data['thumb']=set_upload_path($thumb);
				$data['thumb_w']=set_upload_path($thumb);
			}
            
			$href=$data['href'];
			if($href==""){
				$this->error("请上传视频");
			}

			$href_old=$data['href_old'];
			if($href!=$href_old){
				$data['href']=set_upload_path($href);
			}
            
            $href_w=$data['href_w'];
			if($href_w==""){
				$this->error("请上传水印视频");
			}

			$href_w_old=$data['href_w_old'];
			if($href_w!=$href_w_old){
				$data['href_w']=set_upload_path($href_w);
			}
			
			//计算封面尺寸比例
            $configpub=getConfigPub(); //获取公共配置信息
			$anyway='1.1';
			$thumb_url=get_upload_path($thumb);
			
            $refer=$configpub['site'];
            $option=array('http'=>array('header'=>"Referer: {$refer}"));
            $context=stream_context_create($option);//创建资源流上下文
            $file_contents = file_get_contents($thumb_url,false, $context);//将整个文件读入一个字符串
            $thumb_size = getimagesizefromstring($file_contents);//从字符串中获取图像尺寸信息

			if($thumb_size){
				$thumb_width=$thumb_size[0];  //封面-宽
				$thumb_height=$thumb_size[1];  //封面-高

				$anyway=round($thumb_height/$thumb_width); 
			}
			
			$data['anyway']=$anyway;
			unset($data['thumb_old']);
			unset($data['href_old']);
			unset($data['href_w_old']);
            
			$rs = DB::name('video')->update($data);
            if($rs===false){
                $this->error("修改失败！");
            }
			
			
			$action="编辑视频：{$data['id']}";
			setAdminLog($action);
            
            $this->success("修改成功！");
		}
	}
	
    /* 审核 */
    public function setstatus(){
        $id = $this->request->param('id', 0, 'intval');
        $status = $this->request->param('status', 0, 'intval');
        $reason = $this->request->param('reason');
        if($reason==''){
            $reason='';
        }
        if($id){
            $result=DB::name("video")->where(['id'=>$id])->update(['status'=>$status,'xiajia_reason'=>$reason]);				
            if($result){
                if($status==1){
                    //将视频喜欢列表的状态更改
                    DB::name("video_like")->where("videoid={$id}")->setField('status',0);

                    //更新此视频的举报信息
                    $data1=array(
                        'status'=>1,
                        'uptime'=>time()
                    );

                    DB::name("video_report")->where("videoid={$id}")->update($data1);
                }
                
                if($status==-1){
                    //将视频喜欢列表的状态更改
                    DB::name("video_like")->where("videoid={$id}")->setField('status',1);
                }
                
				$action="审核视频：视频ID({$id}),状态({$status})";
			    setAdminLog($action);
                $this->success('操作成功');
             }else{
                $this->error('操作失败');
             }
			 
			
        }else{				
            $this->error('数据传入失败！');
        }
    	
    }
    
    /* 上下架 */
    public function setDel(){
        $id = $this->request->param('id', 0, 'intval');
        $isdel = $this->request->param('isdel', 0, 'intval');
        $reason = $this->request->param('reason');
        if($reason==''){
			$reason='';
		}
        if($id){

            //判断用户是否注销
            $uid=DB::name("video")->where(['id'=>$id])->value('uid');
            if($uid){
                $is_destroy=checkIsDestroy($uid);
                if($is_destroy){
                    $this->error("该用户已注销,视频不可上架");
                }
            }


            $result=DB::name("video")->where(['id'=>$id])->update(['isdel'=>$isdel,'xiajia_reason'=>$reason]);				
            if($result){
                if($isdel==1){
                    //将视频喜欢列表的状态更改
                    DB::name("video_like")->where("videoid={$id}")->setField('status',0);

                    //更新此视频的举报信息
                    $data1=array(
                        'status'=>1,
                        'uptime'=>time()
                    );

                    DB::name("video_report")->where("videoid={$id}")->update($data1);
                }
                
                if($isdel==0){
                    //将视频喜欢列表的状态更改
                    DB::name("video_like")->where("videoid={$id}")->setField('status',1);
                }
				
				
				$action="上下架视频：视频ID({$id}),状态({$isdel})";
			    setAdminLog($action);
                
            
                $this->success('操作成功');
             }else{
                $this->error('操作失败');
             }
        }else{				
            $this->error('数据传入失败！');
        }
    	
    }


    public function  see(){
        
        $id   = $this->request->param('id', 0, 'intval');
        
        $data=Db::name('video')
            ->where("id={$id}")
            ->find();
        if(!$data){
            $this->error("信息错误");
        }
        
        $data['href']=get_upload_path($data['href']);
        
        $this->assign('data', $data);
        return $this->fetch();
        
    }

}
