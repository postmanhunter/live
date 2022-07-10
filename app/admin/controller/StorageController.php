<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2019 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 老猫 <zxxjjforever@163.com>
// +----------------------------------------------------------------------
namespace app\admin\controller;

use cmf\controller\AdminBaseController;

class StorageController extends AdminBaseController
{

    /**
     * 文件存储
     * @adminMenu(
     *     'name'   => '文件存储',
     *     'parent' => 'admin/Setting/default',
     *     'display'=> true,
     *     'hasView'=> true,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文件存储',
     *     'param'  => ''
     * )
     */
    public function index()
    {
        $storage = cmf_get_option('storage');

        /*var_dump($storage);
        die;*/

        if (empty($storage)) {
            $storage['type']     = 'Local';
            $storage['storages'] = ['Local' => ['name' => '本地']];
        } else {
            if (empty($storage['type'])) {
                $storage['type'] = 'Local';
            }

            if (empty($storage['storages']['Local'])) {
                $storage['storages']['Local'] = ['name' => '本地'];
            }
        }

        $this->assign($storage);
        return $this->fetch();
    }

    /**
     * 文件存储
     * @adminMenu(
     *     'name'   => '文件存储设置提交',
     *     'parent' => 'index',
     *     'display'=> false,
     *     'hasView'=> false,
     *     'order'  => 10000,
     *     'icon'   => '',
     *     'remark' => '文件存储设置提交',
     *     'param'  => ''
     * )
     */
    public function settingPost()
    {
        $post = $this->request->post();

        $storage = cmf_get_option('storage');
		
		$action="修改文件存储 ";
		if($storage['type']!=$post['type']){
			$type=[
				'Local'=>'本地',
				'Qiniu'=>'七牛云存储'
			];
			$action.='存储类型 '.$type[$post['type']].' ';
		}

        $storage['type'] = $post['type'];
        cmf_set_option('storage', $storage);
		

		setAdminLog($action);
		
		
        $this->success("设置成功！", '');

    }


}