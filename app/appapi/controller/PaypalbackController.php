<?php
/**
 * 贝宝支付Paypal异步回调【因为Paypal后台的回调地址只能设置一个，所以钻石充值时调用Paypal、订单支付时使用Paypal、付费内容支付时使用Paypal都调用该回调地址，通过不同的参数标识来分别处理】
 */
namespace app\appapi\controller;

use cmf\controller\HomeBaseController;
use think\Db;
use think\db\Query;

class PaypalbackController extends HomebaseController {

	//paypal支付 回调
	public function notify_paypal() {
		$content=file_get_contents("php://input");  
		//$this->logpaypal("content:".$content);
		/*$content='mc_gross=0.01&invoice=24438_20210106105917499&protection_eligibility=Eligible&payer_id=8UGGRYQKUUDUL&payment_date=18%3A59%3A26+Jan+05%2C+2021+PST&payment_status=Completed&charset=gb2312&first_name=John&mc_fee=0.01&notify_version=3.9&custom=coin_charge&payer_status=verified&business=sb-98i6u4130511%40business.example.com&quantity=1&verify_sign=AD1sO25IpdpNvMtgou92AtLABX1vAG2yXQ7YNB-RYJmvZV1MbbKHgCQz&payer_email=sb-xjm43x4156025%40personal.example.com&txn_id=69L19241UB264913T&payment_type=instant&last_name=Doe&receiver_email=sb-98i6u4130511%40business.example.com&payment_fee=0.01&shipping_discount=0.00&receiver_id=ALT7CQ8BT6F82&insurance_amount=0.00&txn_type=express_checkout&item_name=99999%D7%EA%CA%AF&discount=0.00&mc_currency=USD&item_number=&residence_country=US&test_ipn=1&shipping_method=Default&transaction_subject=99999%D7%EA%CA%AF&payment_gross=0.01&ipn_track_id=a21d26ec1df39';*/
	
		$data=array();
		$content_arr=explode("&",$content);
		foreach($content_arr as $k=>$v){
			$v2=explode('=',$v);
			$data[$v2[0]]=$v2[1];
			
		}
		
		// require(SITE_PATH.'paypal/PaypalIPN.php');
		require_once(CMF_ROOT."sdk/paypal/PaypalIPN.php");
		
		$ipn = new \PaypalIPN();

		$configpri=getConfigPri();
		if(!$configpri['paypal_sandbox']){ //沙盒模式
			$ipn->useSandbox();
		}
		
		
		$verified = $ipn->verifyIPN();


		$this->logpaypal("verified:".json_encode($verified));
		
		$notify_type = $data['custom']; //订单类型
		$this->logpaypal("notify_type:".json_encode($notify_type));

		if($verified) {//验证成功
			//支付宝交易号
			$trade_no = $data['txn_id']; //三方支付订单号

			$total_fee = $data['mc_gross']; //订单价格
			$out_trade_no = $data['invoice']; //系统订单编号

			if($notify_type=="coin_charge"){//钻石充值

				$this->logpaypal("content:".$content);
				$this->logpaypal("data:".json_encode($data));
				$this->logpaypal("verified:".json_encode($verified));

				$where=[];
				$where['orderno']=$out_trade_no;
				$where['money']=$total_fee;
				$where['type']=5;

				$charge_data=[
					'trade_no'=>$trade_no,
					'ambient'=>1
				];

				if(!$configpri['paypal_sandbox']){
					$charge_data['ambient']=0;
				}

				$this->logpaypal("where:".json_encode($where));
				$res=handelCharge($where,$charge_data);
				if($res==0){
                    $this->logpaypal("orderno:".$out_trade_no.' 订单信息不存在');	
                    echo "fail";
                    exit;
				}

				$this->logpaypal("成功");	
				echo "success";		//请不要修改或删除
				header("HTTP/1.1 200 OK");
				exit;

			}

			if($notify_type=="order_pay"){ //商品订单支付

				$this->logpaypal_order("content:".$content);
				$this->logpaypal_order("data:".json_encode($data));
				$this->logpaypal_order("verified:".json_encode($verified));

				$where=[];
				$where['orderno']=$out_trade_no;
				$where['total']=$total_fee;

				$order_data=[
					'type'=>5,
					'trade_no'=>$trade_no
				];

				$this->logpaypal_order("where:".json_encode($where));

				$res=handelShopOrder($where,$order_data);
				if($res==0){
					$this->logpaypal_order("orderno:".$out_trade_no.' 订单信息不存在');	
            		echo "fail";
                    exit;
				}

				if($res==-1){
		            $this->logpaypal_order("orderno:".$out_trade_no.' 订单已关闭');	
		            echo "fail";
                    exit;
		        }

		        $this->logpaypal_order("成功");	
				echo "success";		//请不要修改或删除
				header("HTTP/1.1 200 OK");
				exit;

			}

			if($notify_type=="paidprogram_pay"){ //付费内容支付

				$this->logpaypal_paidprogram("content:".$content);
				$this->logpaypal_paidprogram("data:".json_encode($data));
				$this->logpaypal_paidprogram("verified:".json_encode($verified));

				$where=[];
				$where['orderno']=$out_trade_no;
                $where['money']=$total_fee;

                $paidprogram_data=[
                	'type'=>5,
                    'trade_no'=>$trade_no
                ];

                $this->logpaypal_paidprogram("where:".json_encode($where));
                $res=handelPaidprogramPay($where,$paidprogram_data);

                if($res==0){
                    $this->logpaypal_paidprogram("orderno:".$out_trade_no.' 订单信息不存在');	
                    echo "fail";
                    exit;
				}

				$this->logpaypal_paidprogram("成功");	
				echo "success";		//请不要修改或删除
				header("HTTP/1.1 200 OK");
				exit;

			}
	
			
		}else {
			
			if($notify_type=="coin_charge"){ //钻石充值
				$this->logpaypal("验证失败");
			}else if($notify_type=="order_pay"){ //商品订单支付
				$this->logpaypal_order("验证失败");
			}else if($notify_type=="paidprogram_pay"){ //付费内容支付
				$this->logpaypal_paidprogram("验证失败");
			}
					
			//验证失败
			echo "fail";
		}			
		
	}
	
	/* 打印log */
	public function logpaypal($msg){
		file_put_contents(CMF_ROOT.'data/paypallog/coincharge_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').'  msg:'.$msg."\r\n",FILE_APPEND);
	}

	/* 打印log */
	public function logpaypal_order($msg){
		file_put_contents(CMF_ROOT.'data/paypallog/orderpay_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').'  msg:'.$msg."\r\n",FILE_APPEND);
	}

	/* 打印log */
	public function logpaypal_paidprogram($msg){
		file_put_contents(CMF_ROOT.'data/paypallog/paidprogram_'.date('Y-m-d').'.txt',date('Y-m-d H:i:s').'  msg:'.$msg."\r\n",FILE_APPEND);
	}
	
}