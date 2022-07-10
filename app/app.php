<?php

return [

        // 异常页面的模板文件
   //'exception_tmpl'         => CMF_ROOT . '/themes/404.html',

    // 错误显示信息,非调试模式有效
    'error_message'          => '页面错误！请稍后再试～',
    // 显示错误信息
    'show_error_msg'         => false,
    // 异常处理handle类 留空使用 \think\exception\Handle
    'exception_handle'       => '',

    // 是否开启多语言
    'lang_switch_on'         => false,
    // 默认语言
    'default_lang'           => 'zh-cn',
    
    // 默认模块名
    'default_module'         => 'Portal',
    // 默认控制器名
    'default_controller'     => 'Index',
    // 默认操作名
    'default_action'         => 'index',
	
	// 默认全局过滤方法 用逗号分隔多个
	'default_filter'         => 'htmlspecialchars,stripslashes,strip_tags',
];


