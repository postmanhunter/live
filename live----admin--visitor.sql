/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : yuanma-live

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2021-05-25 13:46:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cmf_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_admin_log`;
CREATE TABLE `cmf_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminid` int(11) NOT NULL COMMENT '管理员ID',
  `admin` varchar(255) NOT NULL COMMENT '管理员',
  `action` text NOT NULL COMMENT '操作内容',
  `ip` bigint(20) NOT NULL COMMENT 'IP地址',
  `addtime` int(11) NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_admin_menu`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_admin_menu`;
CREATE TABLE `cmf_admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父菜单id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `controller` (`controller`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=517 DEFAULT CHARSET=utf8mb4 COMMENT='后台菜单表';

-- ----------------------------
-- Records of cmf_admin_menu
-- ----------------------------
INSERT INTO `cmf_admin_menu` VALUES ('1', '0', '0', '1', '10000', 'admin', 'Plugin', 'default', '', '插件中心', 'cloud', '插件中心');
INSERT INTO `cmf_admin_menu` VALUES ('6', '0', '0', '1', '3', 'admin', 'Setting', 'default', '', '设置', 'cogs', '系统设置入口');
INSERT INTO `cmf_admin_menu` VALUES ('7', '6', '1', '0', '50', 'admin', 'Link', 'index', '', '友情链接', '', '友情链接管理');
INSERT INTO `cmf_admin_menu` VALUES ('8', '7', '1', '0', '10000', 'admin', 'Link', 'add', '', '添加友情链接', '', '添加友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('9', '7', '2', '0', '10000', 'admin', 'Link', 'addPost', '', '添加友情链接提交保存', '', '添加友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('10', '7', '1', '0', '10000', 'admin', 'Link', 'edit', '', '编辑友情链接', '', '编辑友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('11', '7', '2', '0', '10000', 'admin', 'Link', 'editPost', '', '编辑友情链接提交保存', '', '编辑友情链接提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('12', '7', '2', '0', '10000', 'admin', 'Link', 'delete', '', '删除友情链接', '', '删除友情链接');
INSERT INTO `cmf_admin_menu` VALUES ('13', '7', '2', '0', '10000', 'admin', 'Link', 'listOrder', '', '友情链接排序', '', '友情链接排序');
INSERT INTO `cmf_admin_menu` VALUES ('14', '7', '2', '0', '10000', 'admin', 'Link', 'toggle', '', '友情链接显示隐藏', '', '友情链接显示隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('20', '0', '1', '0', '10000', 'admin', 'Menu', 'index', '', '后台菜单', '', '后台菜单管理');
INSERT INTO `cmf_admin_menu` VALUES ('21', '20', '1', '0', '10000', 'admin', 'Menu', 'lists', '', '所有菜单', '', '后台所有菜单列表');
INSERT INTO `cmf_admin_menu` VALUES ('22', '20', '1', '0', '10000', 'admin', 'Menu', 'add', '', '后台菜单添加', '', '后台菜单添加');
INSERT INTO `cmf_admin_menu` VALUES ('23', '20', '2', '0', '10000', 'admin', 'Menu', 'addPost', '', '后台菜单添加提交保存', '', '后台菜单添加提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('24', '20', '1', '0', '10000', 'admin', 'Menu', 'edit', '', '后台菜单编辑', '', '后台菜单编辑');
INSERT INTO `cmf_admin_menu` VALUES ('25', '20', '2', '0', '10000', 'admin', 'Menu', 'editPost', '', '后台菜单编辑提交保存', '', '后台菜单编辑提交保存');
INSERT INTO `cmf_admin_menu` VALUES ('26', '20', '2', '0', '10000', 'admin', 'Menu', 'delete', '', '后台菜单删除', '', '后台菜单删除');
INSERT INTO `cmf_admin_menu` VALUES ('27', '20', '2', '0', '10000', 'admin', 'Menu', 'listOrder', '', '后台菜单排序', '', '后台菜单排序');
INSERT INTO `cmf_admin_menu` VALUES ('28', '20', '1', '0', '10000', 'admin', 'Menu', 'getActions', '', '导入新后台菜单', '', '导入新后台菜单');
INSERT INTO `cmf_admin_menu` VALUES ('42', '1', '1', '1', '10000', 'admin', 'Plugin', 'index', '', '插件列表', '', '插件列表');
INSERT INTO `cmf_admin_menu` VALUES ('43', '42', '2', '0', '10000', 'admin', 'Plugin', 'toggle', '', '插件启用禁用', '', '插件启用禁用');
INSERT INTO `cmf_admin_menu` VALUES ('44', '42', '1', '0', '10000', 'admin', 'Plugin', 'setting', '', '插件设置', '', '插件设置');
INSERT INTO `cmf_admin_menu` VALUES ('45', '42', '2', '0', '10000', 'admin', 'Plugin', 'settingPost', '', '插件设置提交', '', '插件设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('46', '42', '2', '0', '10000', 'admin', 'Plugin', 'install', '', '插件安装', '', '插件安装');
INSERT INTO `cmf_admin_menu` VALUES ('47', '42', '2', '0', '10000', 'admin', 'Plugin', 'update', '', '插件更新', '', '插件更新');
INSERT INTO `cmf_admin_menu` VALUES ('48', '42', '2', '0', '10000', 'admin', 'Plugin', 'uninstall', '', '卸载插件', '', '卸载插件');
INSERT INTO `cmf_admin_menu` VALUES ('49', '110', '0', '1', '10000', 'admin', 'User', 'default', '', '管理组', '', '管理组');
INSERT INTO `cmf_admin_menu` VALUES ('50', '49', '1', '1', '10000', 'admin', 'Rbac', 'index', '', '角色管理', '', '角色管理');
INSERT INTO `cmf_admin_menu` VALUES ('51', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleAdd', '', '添加角色', '', '添加角色');
INSERT INTO `cmf_admin_menu` VALUES ('52', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleAddPost', '', '添加角色提交', '', '添加角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('53', '50', '1', '0', '10000', 'admin', 'Rbac', 'roleEdit', '', '编辑角色', '', '编辑角色');
INSERT INTO `cmf_admin_menu` VALUES ('54', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleEditPost', '', '编辑角色提交', '', '编辑角色提交');
INSERT INTO `cmf_admin_menu` VALUES ('55', '50', '2', '0', '10000', 'admin', 'Rbac', 'roleDelete', '', '删除角色', '', '删除角色');
INSERT INTO `cmf_admin_menu` VALUES ('56', '50', '1', '0', '10000', 'admin', 'Rbac', 'authorize', '', '设置角色权限', '', '设置角色权限');
INSERT INTO `cmf_admin_menu` VALUES ('57', '50', '2', '0', '10000', 'admin', 'Rbac', 'authorizePost', '', '角色授权提交', '', '角色授权提交');
INSERT INTO `cmf_admin_menu` VALUES ('58', '0', '1', '0', '10000', 'admin', 'RecycleBin', 'index', '', '回收站', '', '回收站');
INSERT INTO `cmf_admin_menu` VALUES ('59', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'restore', '', '回收站还原', '', '回收站还原');
INSERT INTO `cmf_admin_menu` VALUES ('60', '58', '2', '0', '10000', 'admin', 'RecycleBin', 'delete', '', '回收站彻底删除', '', '回收站彻底删除');
INSERT INTO `cmf_admin_menu` VALUES ('71', '6', '1', '1', '0', 'admin', 'Setting', 'site', '', '网站信息', '', '网站信息');
INSERT INTO `cmf_admin_menu` VALUES ('72', '71', '2', '0', '10000', 'admin', 'Setting', 'sitePost', '', '网站信息设置提交', '', '网站信息设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('73', '0', '1', '0', '1', 'admin', 'Setting', 'password', '', '密码修改', '', '密码修改');
INSERT INTO `cmf_admin_menu` VALUES ('74', '73', '2', '0', '10000', 'admin', 'Setting', 'passwordPost', '', '密码修改提交', '', '密码修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('75', '6', '1', '1', '10000', 'admin', 'Setting', 'upload', '', '上传设置', '', '上传设置');
INSERT INTO `cmf_admin_menu` VALUES ('76', '75', '2', '0', '10000', 'admin', 'Setting', 'uploadPost', '', '上传设置提交', '', '上传设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('77', '6', '1', '0', '10000', 'admin', 'Setting', 'clearCache', '', '清除缓存', '', '清除缓存');
INSERT INTO `cmf_admin_menu` VALUES ('78', '6', '1', '1', '40', 'admin', 'Slide', 'index', '', '幻灯片管理', '', '幻灯片管理');
INSERT INTO `cmf_admin_menu` VALUES ('79', '78', '1', '0', '10000', 'admin', 'Slide', 'add', '', '添加幻灯片', '', '添加幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('80', '78', '2', '0', '10000', 'admin', 'Slide', 'addPost', '', '添加幻灯片提交', '', '添加幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('81', '78', '1', '0', '10000', 'admin', 'Slide', 'edit', '', '编辑幻灯片', '', '编辑幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('82', '78', '2', '0', '10000', 'admin', 'Slide', 'editPost', '', '编辑幻灯片提交', '', '编辑幻灯片提交');
INSERT INTO `cmf_admin_menu` VALUES ('83', '78', '2', '0', '10000', 'admin', 'Slide', 'delete', '', '删除幻灯片', '', '删除幻灯片');
INSERT INTO `cmf_admin_menu` VALUES ('84', '78', '1', '0', '10000', 'admin', 'SlideItem', 'index', '', '幻灯片页面列表', '', '幻灯片页面列表');
INSERT INTO `cmf_admin_menu` VALUES ('85', '84', '1', '0', '10000', 'admin', 'SlideItem', 'add', '', '幻灯片页面添加', '', '幻灯片页面添加');
INSERT INTO `cmf_admin_menu` VALUES ('86', '84', '2', '0', '10000', 'admin', 'SlideItem', 'addPost', '', '幻灯片页面添加提交', '', '幻灯片页面添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('87', '84', '1', '0', '10000', 'admin', 'SlideItem', 'edit', '', '幻灯片页面编辑', '', '幻灯片页面编辑');
INSERT INTO `cmf_admin_menu` VALUES ('88', '84', '2', '0', '10000', 'admin', 'SlideItem', 'editPost', '', '幻灯片页面编辑提交', '', '幻灯片页面编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('89', '84', '2', '0', '10000', 'admin', 'SlideItem', 'delete', '', '幻灯片页面删除', '', '幻灯片页面删除');
INSERT INTO `cmf_admin_menu` VALUES ('90', '84', '2', '0', '10000', 'admin', 'SlideItem', 'ban', '', '幻灯片页面隐藏', '', '幻灯片页面隐藏');
INSERT INTO `cmf_admin_menu` VALUES ('91', '84', '2', '0', '10000', 'admin', 'SlideItem', 'cancelBan', '', '幻灯片页面显示', '', '幻灯片页面显示');
INSERT INTO `cmf_admin_menu` VALUES ('92', '84', '2', '0', '10000', 'admin', 'SlideItem', 'listOrder', '', '幻灯片页面排序', '', '幻灯片页面排序');
INSERT INTO `cmf_admin_menu` VALUES ('93', '6', '1', '0', '10000', 'admin', 'Storage', 'index', '', '文件存储', '', '文件存储');
INSERT INTO `cmf_admin_menu` VALUES ('94', '93', '2', '0', '10000', 'admin', 'Storage', 'settingPost', '', '文件存储设置提交', '', '文件存储设置提交');
INSERT INTO `cmf_admin_menu` VALUES ('110', '0', '0', '1', '4', 'user', 'AdminIndex', 'default', '', '用户管理', 'group', '用户管理');
INSERT INTO `cmf_admin_menu` VALUES ('111', '49', '1', '1', '10000', 'admin', 'User', 'index', '', '管理员', '', '管理员管理');
INSERT INTO `cmf_admin_menu` VALUES ('112', '111', '1', '0', '10000', 'admin', 'User', 'add', '', '管理员添加', '', '管理员添加');
INSERT INTO `cmf_admin_menu` VALUES ('113', '111', '2', '0', '10000', 'admin', 'User', 'addPost', '', '管理员添加提交', '', '管理员添加提交');
INSERT INTO `cmf_admin_menu` VALUES ('114', '111', '1', '0', '10000', 'admin', 'User', 'edit', '', '管理员编辑', '', '管理员编辑');
INSERT INTO `cmf_admin_menu` VALUES ('115', '111', '2', '0', '10000', 'admin', 'User', 'editPost', '', '管理员编辑提交', '', '管理员编辑提交');
INSERT INTO `cmf_admin_menu` VALUES ('116', '111', '1', '0', '10000', 'admin', 'User', 'userInfo', '', '个人信息', '', '管理员个人信息修改');
INSERT INTO `cmf_admin_menu` VALUES ('117', '111', '2', '0', '10000', 'admin', 'User', 'userInfoPost', '', '管理员个人信息修改提交', '', '管理员个人信息修改提交');
INSERT INTO `cmf_admin_menu` VALUES ('118', '111', '2', '0', '10000', 'admin', 'User', 'delete', '', '管理员删除', '', '管理员删除');
INSERT INTO `cmf_admin_menu` VALUES ('119', '111', '2', '0', '10000', 'admin', 'User', 'ban', '', '停用管理员', '', '停用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('120', '111', '2', '0', '10000', 'admin', 'User', 'cancelBan', '', '启用管理员', '', '启用管理员');
INSERT INTO `cmf_admin_menu` VALUES ('121', '0', '1', '0', '10000', 'user', 'AdminAsset', 'index', '', '资源管理', 'file', '资源管理列表');
INSERT INTO `cmf_admin_menu` VALUES ('122', '121', '2', '0', '10000', 'user', 'AdminAsset', 'delete', '', '删除文件', '', '删除文件');
INSERT INTO `cmf_admin_menu` VALUES ('123', '110', '0', '1', '10000', 'user', 'AdminIndex', 'default1', '', '用户组', '', '用户组');
INSERT INTO `cmf_admin_menu` VALUES ('124', '123', '1', '1', '1', 'user', 'AdminIndex', 'index', '', '本站用户', '', '本站用户');
INSERT INTO `cmf_admin_menu` VALUES ('125', '124', '2', '0', '10000', 'user', 'AdminIndex', 'ban', '', '本站用户拉黑', '', '本站用户拉黑');
INSERT INTO `cmf_admin_menu` VALUES ('126', '124', '2', '0', '10000', 'user', 'AdminIndex', 'cancelBan', '', '本站用户启用', '', '本站用户启用');
INSERT INTO `cmf_admin_menu` VALUES ('127', '49', '1', '1', '10000', 'admin', 'adminlog', 'index', '', '操作日志', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('128', '127', '1', '0', '10000', 'admin', 'adminlog', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('129', '127', '1', '0', '10000', 'admin', 'adminlog', 'export', '', '导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('130', '0', '1', '1', '15', 'admin', 'Agent', 'default', '', '邀请奖励', 'sitemap', '');
INSERT INTO `cmf_admin_menu` VALUES ('131', '130', '1', '1', '10000', 'admin', 'agent', 'index', '', '邀请关系', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('132', '130', '1', '1', '10000', 'admin', 'agent', 'index2', '', '邀请收益', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('133', '0', '1', '1', '11', 'admin', 'car', 'default', '', '道具管理', 'shopping-cart', '');
INSERT INTO `cmf_admin_menu` VALUES ('134', '133', '1', '1', '10000', 'admin', 'car', 'index', '', '坐骑管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('135', '134', '1', '0', '10000', 'admin', 'car', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('136', '134', '1', '0', '10000', 'admin', 'car', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('137', '134', '1', '0', '10000', 'admin', 'car', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('138', '134', '1', '0', '10000', 'admin', 'car', 'editPost', '', '编辑添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('139', '134', '1', '0', '10000', 'admin', 'car', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('140', '134', '1', '0', '10000', 'admin', 'car', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('141', '133', '1', '1', '10000', 'admin', 'liang', 'index', '', '靓号管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('142', '141', '1', '0', '10000', 'admin', 'liang', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('143', '141', '1', '0', '10000', 'admin', 'liang', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('144', '6', '1', '1', '1', 'admin', 'setting', 'configpri', '', '私密设置', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('145', '144', '1', '0', '10000', 'admin', 'setting', 'configpriPost', '', '提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('146', '0', '1', '1', '5', 'admin', 'jackpot', 'set', '', '奖池管理', 'trophy', '');
INSERT INTO `cmf_admin_menu` VALUES ('147', '146', '1', '0', '10000', 'admin', 'jackpot', 'setPost', '', '设置提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('148', '146', '1', '0', '10000', 'admin', 'jackpot', 'index', '', '奖池等级', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('149', '148', '1', '0', '10000', 'admin', 'jackpot', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('150', '148', '1', '0', '10000', 'admin', 'jackpot', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('151', '148', '1', '0', '10000', 'admin', 'jackpot', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('152', '148', '1', '0', '10000', 'admin', 'jackpot', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('153', '148', '1', '0', '10000', 'admin', 'jackpot', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('154', '0', '1', '1', '7', 'admin', 'live', 'default', '', '直播管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('155', '154', '1', '1', '1', 'admin', 'liveclass', 'index', '', '直播分类', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('156', '155', '1', '0', '10000', 'admin', 'liveclass', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('157', '155', '1', '0', '10000', 'admin', 'liveclass', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('158', '155', '1', '0', '10000', 'admin', 'liveclass', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('159', '155', '1', '0', '10000', 'admin', 'liveclass', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('160', '155', '1', '0', '10000', 'admin', 'liveclass', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('161', '155', '1', '0', '10000', 'admin', 'liveclass', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('162', '154', '1', '1', '2', 'admin', 'liveban', 'index', '', '禁播管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('163', '162', '1', '0', '10000', 'admin', 'liveban', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('164', '154', '1', '1', '3', 'admin', 'liveshut', 'index', '', '禁言管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('165', '164', '1', '0', '10000', 'admin', 'liveshut', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('166', '154', '1', '1', '4', 'admin', 'livekick', 'index', '', '踢人管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('167', '166', '1', '0', '10000', 'admin', 'livekick', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('168', '154', '1', '1', '5', 'admin', 'liveing', 'index', '', '直播列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('169', '168', '1', '0', '10000', 'admin', 'liveing', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('170', '168', '1', '0', '10000', 'admin', 'liveing', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('171', '168', '1', '0', '10000', 'admin', 'liveing', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('172', '168', '1', '0', '10000', 'admin', 'liveing', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('173', '168', '1', '0', '10000', 'admin', 'liveing', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('174', '154', '1', '1', '6', 'admin', 'monitor', 'index', '', '直播监控', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('175', '174', '1', '0', '10000', 'admin', 'monitor', 'full', '', '大屏', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('176', '174', '1', '0', '10000', 'admin', 'monitor', 'stop', '', '关播', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('177', '154', '1', '1', '7', 'admin', 'gift', 'index', '', '礼物管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('178', '177', '1', '0', '10000', 'admin', 'gift', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('179', '177', '1', '0', '10000', 'admin', 'gift', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('180', '177', '1', '0', '10000', 'admin', 'gift', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('181', '177', '1', '0', '10000', 'admin', 'gift', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('182', '177', '1', '0', '10000', 'admin', 'gift', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('183', '177', '1', '0', '10000', 'admin', 'gift', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('184', '154', '1', '1', '9', 'admin', 'report', 'defult', '', '举报管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('185', '184', '1', '1', '10000', 'admin', 'reportcat', 'index', '', '举报分类', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('186', '185', '1', '0', '10000', 'admin', 'reportcat', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('187', '185', '1', '0', '10000', 'admin', 'reportcat', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('188', '185', '1', '0', '10000', 'admin', 'reportcat', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('189', '185', '1', '0', '10000', 'admin', 'reportcat', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('190', '185', '1', '0', '10000', 'admin', 'reportcat', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('191', '185', '1', '0', '10000', 'admin', 'reportcat', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('192', '184', '1', '1', '10000', 'admin', 'report', 'index', '', '举报列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('193', '192', '1', '0', '10000', 'admin', 'report', 'setstatus', '', '处理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('194', '154', '1', '1', '10', 'admin', 'liverecord', 'index', '', '直播记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('195', '0', '1', '1', '8', 'admin', 'video', 'default', '', '视频管理', 'video-camera', '');
INSERT INTO `cmf_admin_menu` VALUES ('196', '195', '1', '1', '2', 'admin', 'music', 'index', '', '音乐管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('197', '195', '1', '1', '1', 'admin', 'musiccat', 'index', '', '音乐分类', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('198', '196', '1', '0', '10000', 'admin', 'music', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('199', '196', '1', '0', '10000', 'admin', 'music', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('200', '196', '1', '0', '10000', 'admin', 'music', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('201', '196', '1', '0', '10000', 'admin', 'music', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('202', '196', '1', '0', '10000', 'admin', 'music', 'listen', '', '试听', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('203', '196', '1', '0', '10000', 'admin', 'music', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('204', '196', '1', '0', '10000', 'admin', 'music', 'canceldel', '', '取消删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('205', '197', '1', '0', '10000', 'admin', 'musiccat', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('206', '197', '1', '0', '10000', 'admin', 'musiccat', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('207', '197', '1', '0', '10000', 'admin', 'musiccat', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('208', '197', '1', '0', '10000', 'admin', 'musiccat', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('209', '197', '1', '0', '10000', 'admin', 'musiccat', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('210', '197', '1', '0', '10000', 'admin', 'musiccat', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('211', '0', '1', '1', '16', 'admin', 'shop', 'default', '', '店铺管理', 'shopping-cart', '');
INSERT INTO `cmf_admin_menu` VALUES ('212', '211', '1', '1', '1', 'admin', 'shopapply', 'index', '', '店铺申请', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('213', '212', '1', '0', '1', 'admin', 'shopapply', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('214', '212', '1', '0', '2', 'admin', 'shopapply', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('215', '212', '1', '0', '3', 'admin', 'shopapply', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('216', '211', '1', '1', '2', 'admin', 'shopbond', 'index', '', '保证金', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('217', '216', '1', '0', '10000', 'admin', 'shopbond', 'setstatus', '', '处理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('218', '211', '1', '1', '3', 'admin', 'shopgoods', 'index', '', '商品管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('219', '218', '1', '0', '1', 'admin', 'shopgoods', 'setstatus', '', '上下架', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('220', '218', '1', '0', '2', 'admin', 'shopgoods', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('221', '0', '1', '1', '17', 'admin', 'turntable', 'default', '', '大转盘', 'gamepad', '');
INSERT INTO `cmf_admin_menu` VALUES ('222', '221', '1', '1', '1', 'admin', 'turntablecon', 'index', '', '价格管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('223', '222', '1', '0', '10000', 'admin', 'turntablecon', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('224', '222', '1', '0', '10000', 'admin', 'turntablecon', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('225', '222', '1', '0', '10000', 'admin', 'turntablecon', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('226', '221', '1', '1', '2', 'admin', 'turntable', 'index', '', '奖品管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('227', '226', '1', '0', '10000', 'admin', 'turntable', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('228', '226', '1', '0', '10000', 'admin', 'turntable', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('229', '221', '1', '1', '3', 'admin', 'turntable', 'index2', '', '转盘记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('230', '221', '1', '1', '4', 'admin', 'turntable', 'index3', '', '线下奖品', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('231', '230', '1', '0', '10000', 'admin', 'turntable', 'setstatus', '', '处理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('232', '0', '1', '1', '14', 'admin', 'level', 'default', '', '等级管理', 'level-up', '');
INSERT INTO `cmf_admin_menu` VALUES ('233', '232', '1', '1', '10000', 'admin', 'level', 'index', '', '用户等级', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('234', '233', '1', '0', '10000', 'admin', 'level', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('235', '233', '1', '0', '10000', 'admin', 'level', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('236', '233', '1', '0', '10000', 'admin', 'level', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('237', '233', '1', '0', '10000', 'admin', 'level', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('238', '233', '1', '0', '10000', 'admin', 'level', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('239', '232', '1', '1', '10000', 'admin', 'levelanchor', 'index', '', '主播等级', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('240', '239', '1', '0', '10000', 'admin', 'levelanchor', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('241', '239', '1', '0', '10000', 'admin', 'levelanchor', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('242', '239', '1', '0', '10000', 'admin', 'levelanchor', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('243', '239', '1', '0', '10000', 'admin', 'levelanchor', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('244', '239', '1', '0', '10000', 'admin', 'levelanchor', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('245', '0', '1', '1', '13', 'admin', 'guard', 'index', '', '守护管理', 'shield', '');
INSERT INTO `cmf_admin_menu` VALUES ('246', '245', '1', '0', '10000', 'admin', 'guard', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('247', '245', '1', '0', '10000', 'admin', 'guard', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('248', '141', '1', '0', '10000', 'admin', 'liang', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('249', '141', '1', '0', '10000', 'admin', 'liang', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('250', '141', '1', '0', '10000', 'admin', 'liang', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('251', '141', '1', '0', '10000', 'admin', 'liang', 'setstatus', '', '设置状态', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('252', '141', '1', '0', '10000', 'admin', 'liang', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('253', '133', '1', '1', '10000', 'admin', 'vip', 'default', '', 'VIP管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('254', '253', '1', '1', '1', 'admin', 'vip', 'index', '', 'VIP列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('255', '254', '1', '0', '10000', 'admin', 'vip', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('256', '254', '1', '0', '10000', 'admin', 'vip', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('257', '254', '1', '0', '10000', 'admin', 'vip', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('258', '253', '1', '1', '2', 'admin', 'vipuser', 'index', '', 'VIP用户', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('259', '258', '1', '0', '10000', 'admin', 'vipuser', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('260', '258', '1', '0', '10000', 'admin', 'vipuser', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('261', '258', '1', '0', '10000', 'admin', 'vipuser', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('262', '258', '1', '0', '10000', 'admin', 'vipuser', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('263', '258', '1', '0', '10000', 'admin', 'vipuser', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('264', '0', '1', '1', '10', 'admin', 'family', 'default', '', '家族管理', 'university', '');
INSERT INTO `cmf_admin_menu` VALUES ('265', '264', '1', '1', '10000', 'admin', 'family', 'index', '', '家族列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('266', '265', '1', '0', '10000', 'admin', 'family', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('267', '265', '1', '0', '10000', 'admin', 'family', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('268', '265', '1', '0', '10000', 'admin', 'family', 'disable', '', '禁用', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('269', '265', '1', '0', '10000', 'admin', 'family', 'enable', '', '启用', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('270', '265', '1', '0', '10000', 'admin', 'family', 'profit', '', '收益', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('271', '265', '1', '0', '10000', 'admin', 'family', 'cash', '', '提现', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('272', '265', '1', '0', '10000', 'admin', 'family', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('273', '264', '1', '1', '10000', 'admin', 'familyuser', 'index', '', '成员管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('274', '273', '1', '0', '10000', 'admin', 'familyuser', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('275', '273', '1', '0', '10000', 'admin', 'familyuser', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('276', '273', '1', '0', '10000', 'admin', 'familyuser', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('277', '273', '1', '0', '10000', 'admin', 'familyuser', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('278', '273', '1', '0', '10000', 'admin', 'familyuser', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('279', '0', '1', '1', '9', 'admin', 'finance', 'default', '', '财务管理', 'rmb', '');
INSERT INTO `cmf_admin_menu` VALUES ('280', '279', '1', '1', '1', 'admin', 'chargerules', 'index', '', '充值规则', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('281', '280', '1', '0', '10000', 'admin', 'chargerules', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('282', '280', '1', '0', '10000', 'admin', 'chargerules', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('283', '280', '1', '0', '10000', 'admin', 'chargerules', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('284', '280', '1', '0', '10000', 'admin', 'chargerules', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('285', '280', '1', '0', '10000', 'admin', 'chargerules', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('286', '280', '1', '0', '10000', 'admin', 'chargerules', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('287', '279', '1', '1', '2', 'admin', 'charge', 'index', '', '钻石充值记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('288', '287', '1', '0', '10000', 'admin', 'charge', 'setpay', '', '确认支付', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('289', '287', '1', '0', '10000', 'admin', 'charge', 'export', '', '导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('290', '279', '1', '1', '3', 'admin', 'manual', 'index', '', '手动充值钻石', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('291', '290', '1', '0', '10000', 'admin', 'manual', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('292', '290', '1', '0', '10000', 'admin', 'manual', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('293', '290', '1', '0', '10000', 'admin', 'manual', 'export', '', '导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('294', '279', '1', '1', '4', 'admin', 'coinrecord', 'index', '', '钻石消费记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('295', '279', '1', '1', '5', 'admin', 'cash', 'index', '', '映票提现记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('296', '295', '1', '0', '10000', 'admin', 'cash', 'export', '', '导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('297', '295', '1', '0', '10000', 'admin', 'cash', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('298', '295', '1', '0', '10000', 'admin', 'cash', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('299', '6', '1', '1', '10000', 'admin', 'guide', 'set', '', '引导页', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('300', '299', '1', '0', '10000', 'admin', 'guide', 'setPost', '', '设置提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('301', '299', '1', '0', '10000', 'admin', 'guide', 'index', '', '管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('302', '301', '1', '0', '10000', 'admin', 'guide', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('303', '301', '1', '0', '10000', 'admin', 'guide', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('304', '301', '1', '0', '10000', 'admin', 'guide', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('305', '301', '1', '0', '10000', 'admin', 'guide', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('306', '301', '1', '0', '10000', 'admin', 'guide', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('307', '301', '1', '0', '10000', 'admin', 'guide', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('308', '0', '1', '1', '6', 'admin', 'auth', 'index', '', '身份认证', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('310', '308', '1', '0', '10000', 'admin', 'auth', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('311', '308', '1', '0', '10000', 'admin', 'auth', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('312', '195', '1', '1', '4', 'admin', 'video', 'index', 'isdel=0&status=1', '审核通过列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('313', '312', '1', '0', '10000', 'admin', 'video', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('314', '312', '1', '0', '10000', 'admin', 'video', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('315', '312', '1', '0', '10000', 'admin', 'video', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('316', '312', '1', '0', '10000', 'admin', 'video', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('317', '312', '1', '0', '10000', 'admin', 'video', 'setstatus', '', '上下架', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('318', '312', '1', '0', '10000', 'admin', 'video', 'see', '', '查看', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('319', '195', '1', '0', '8', 'admin', 'videocom', 'index', '', '视频评论', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('320', '319', '1', '0', '10000', 'admin', 'videocom', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('321', '195', '1', '1', '9', 'admin', 'videorepcat', 'index', '', '举报类型', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('322', '321', '1', '0', '10000', 'admin', 'videorepcat', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('323', '321', '1', '0', '10000', 'admin', 'videorepcat', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('324', '321', '1', '0', '10000', 'admin', 'videorepcat', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('325', '321', '1', '0', '10000', 'admin', 'videorepcat', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('326', '321', '1', '0', '10000', 'admin', 'videorepcat', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('327', '321', '1', '0', '10000', 'admin', 'videorepcat', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('328', '195', '1', '1', '10', 'admin', 'videorep', 'index', '', '举报列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('329', '328', '1', '0', '10000', 'admin', 'videorep', 'setstatus', '', '处理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('330', '328', '1', '0', '10000', 'admin', 'videorep', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('331', '0', '1', '1', '18', 'admin', 'Loginbonus', 'index', '', '登录奖励', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('332', '331', '1', '0', '10000', 'admin', 'Loginbonus', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('333', '331', '1', '0', '10000', 'admin', 'Loginbonus', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('334', '0', '1', '1', '12', 'admin', 'red', 'index', '', '红包管理', 'envelope', '');
INSERT INTO `cmf_admin_menu` VALUES ('335', '334', '1', '0', '10000', 'admin', 'red', 'index2', '', '领取详情', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('336', '0', '1', '1', '19', 'admin', 'note', 'default', '', '消息管理', 'bell', '');
INSERT INTO `cmf_admin_menu` VALUES ('337', '336', '1', '1', '10000', 'admin', 'sendcode', 'index', '', '验证码管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('338', '337', '1', '0', '10000', 'admin', 'sendcode', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('339', '337', '1', '0', '10000', 'admin', 'sendcode', 'export', '', '导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('340', '336', '1', '1', '10000', 'admin', 'push', 'index', '', '推送管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('341', '340', '1', '0', '10000', 'admin', 'push', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('342', '340', '1', '0', '10000', 'admin', 'push', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('343', '340', '1', '0', '10000', 'admin', 'push', 'export', '', '导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('344', '336', '1', '1', '10000', 'admin', 'system', 'index', '', '直播间消息', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('345', '344', '1', '0', '10000', 'admin', 'system', 'send', '', '发送', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('346', '123', '1', '1', '2', 'admin', 'Impression', 'index', '', '标签管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('347', '346', '1', '0', '10000', 'admin', 'Impression', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('348', '346', '1', '0', '10000', 'admin', 'Impression', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('349', '346', '1', '0', '10000', 'admin', 'Impression', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('350', '346', '1', '0', '10000', 'admin', 'Impression', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('351', '346', '1', '0', '10000', 'admin', 'Impression', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('352', '346', '1', '0', '10000', 'admin', 'Impression', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('353', '0', '1', '1', '20', 'admin', 'portal', 'default', '', '内容管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('354', '353', '1', '1', '10000', 'admin', 'feedback', 'index', '', '用户反馈', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('355', '354', '1', '0', '10000', 'admin', 'feedback', 'setstatus', '', '处理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('356', '354', '1', '0', '10000', 'admin', 'feedback', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('357', '353', '1', '1', '10000', 'portal', 'AdminPage', 'index', '', '页面管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('358', '357', '1', '0', '10000', 'portal', 'AdminPage', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('359', '357', '1', '0', '10000', 'portal', 'AdminPage', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('360', '357', '1', '0', '10000', 'portal', 'AdminPage', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('361', '357', '1', '0', '10000', 'portal', 'AdminPage', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('362', '357', '1', '0', '10000', 'portal', 'AdminPage', 'delete', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('363', '195', '1', '1', '3', 'admin', 'videoclass', 'index', '', '视频分类', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('364', '363', '1', '0', '10000', 'admin', 'videoclass', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('365', '363', '1', '0', '10000', 'admin', 'videoclass', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('366', '363', '1', '0', '10000', 'admin', 'videoclass', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('367', '363', '1', '0', '10000', 'admin', 'videoclass', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('368', '363', '1', '0', '10000', 'admin', 'videoclass', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('369', '363', '1', '0', '10000', 'admin', 'videoclass', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('370', '154', '1', '1', '8', 'admin', 'sticker', 'index', '', '贴纸列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('371', '370', '1', '0', '10000', 'admin', 'sticker', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('372', '370', '1', '0', '10000', 'admin', 'sticker', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('373', '370', '1', '0', '10000', 'admin', 'sticker', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('374', '370', '1', '0', '10000', 'admin', 'sticker', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('375', '370', '1', '0', '10000', 'admin', 'sticker', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('376', '370', '1', '0', '10000', 'admin', 'sticker', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('377', '0', '1', '1', '8', 'admin', 'Dynamic', 'default', '', '动态管理', 'star-o', '');
INSERT INTO `cmf_admin_menu` VALUES ('378', '377', '1', '1', '10000', 'admin', 'Dynamic', 'index', 'isdel=0&status=1', '审核通过', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('379', '377', '1', '1', '10000', 'admin', 'Dynamic', 'wait', 'isdel=0&status=0', '等待审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('380', '377', '1', '1', '10000', 'admin', 'Dynamic', 'nopass', 'isdel=0&status=-1', '未通过', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('381', '377', '1', '1', '10000', 'admin', 'Dynamic', 'lower', 'isdel=1', '下架列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('382', '377', '1', '1', '10000', 'admin', 'Dynamicrepotcat', 'index', '', '举报类型', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('383', '382', '1', '0', '10000', 'admin', 'Dynamicrepotcat', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('384', '382', '1', '0', '10000', 'admin', 'Dynamicrepotcat', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('385', '382', '1', '0', '10000', 'admin', 'Dynamicrepotcat', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('386', '382', '1', '0', '10000', 'admin', 'Dynamicrepotcat', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('387', '382', '1', '0', '10000', 'admin', 'Dynamicrepotcat', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('388', '382', '1', '0', '10000', 'admin', 'Dynamicrepotcat', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('389', '377', '1', '1', '10000', 'admin', 'Dynamicrepot', 'index', '', '举报列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('390', '389', '1', '0', '10000', 'admin', 'Dynamicrepot', 'setstatus', '', '处理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('391', '389', '1', '0', '10000', 'admin', 'Dynamicrepot', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('392', '377', '1', '0', '10000', 'admin', 'Dynamiccom', 'index', '', '评论列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('393', '392', '1', '0', '10000', 'admin', 'Dynamiccom', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('394', '195', '1', '1', '5', 'admin', 'video', 'wait', 'isdel=0&status=0&is_draft=0', '待审核列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('395', '195', '1', '1', '6', 'admin', 'video', 'nopass', 'isdel=0&status=2', '未通过列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('396', '195', '1', '1', '7', 'admin', 'video', 'lower', 'isdel=1', '下架列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('397', '378', '1', '0', '10000', 'admin', 'dynamic', 'setstatus', '', '审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('398', '378', '1', '0', '10000', 'admin', 'dynamic', 'see', '', '查看', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('399', '378', '1', '0', '10000', 'admin', 'dynamic', 'setdel', '', '上下架', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('400', '378', '1', '0', '10000', 'admin', 'dynamic', 'setrecom', '', '设置推荐值', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('401', '378', '1', '0', '10000', 'admin', 'Dynamic', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('402', '154', '1', '1', '11', 'admin', 'game', 'index', '', '游戏记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('403', '402', '1', '0', '10000', 'admin', 'game', 'index2', '', 'x详情', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('404', '124', '1', '0', '10000', 'user', 'AdminIndex', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('405', '124', '1', '0', '10000', 'user', 'AdminIndex', 'addPost', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('406', '124', '1', '0', '10000', 'user', 'AdminIndex', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('407', '124', '1', '0', '10000', 'user', 'AdminIndex', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('408', '124', '1', '0', '10000', 'user', 'AdminIndex', 'setban', '', '禁用时间', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('409', '124', '1', '0', '10000', 'user', 'AdminIndex', 'setsuper', '', '设置、取消超管', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('410', '124', '1', '0', '10000', 'user', 'AdminIndex', 'sethot', '', '设置取消热门', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('411', '124', '1', '0', '10000', 'user', 'AdminIndex', 'setrecommend', '', '设置取消推荐', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('412', '124', '1', '0', '10000', 'user', 'AdminIndex', 'setzombie', '', '开启关闭僵尸粉', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('413', '124', '1', '0', '10000', 'user', 'AdminIndex', 'setzombiep', '', '设置取消为僵尸粉', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('414', '124', '1', '0', '10000', 'user', 'adminIndex', 'setzombiepall', '', '批量设置/取消为僵尸粉', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('415', '124', '1', '0', '10000', 'user', 'adminIndex', 'setzombieall', '', '一键开启/关闭僵尸粉', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('416', '211', '1', '1', '4', 'Admin', 'Goodsclass', 'index', '', '商品分类列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('417', '416', '1', '0', '1', 'Admin', 'Goodsclass', 'add', '', '商品分类添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('418', '211', '1', '1', '5', 'Admin', 'Buyeraddress', 'index', '', '收货地址管理', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('419', '211', '1', '1', '6', 'Admin', 'Express', 'index', '', '物流公司列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('420', '419', '1', '0', '1', 'Admin', 'Express', 'add', '', '物流公司添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('421', '420', '1', '0', '10000', 'Admin', 'Express', 'add_post', '', '物流公司添加保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('422', '419', '1', '0', '2', 'Admin', 'Express', 'edit', '', '物流公司编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('423', '422', '1', '0', '10000', 'Admin', 'Express', 'edit_post', '', '物流公司编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('424', '419', '1', '0', '3', 'Admin', 'Express', 'del', '', '物流公司删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('425', '419', '1', '0', '4', 'Admin', 'Express', 'listOrder', '', '物流公司排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('427', '211', '1', '1', '7', 'Admin', 'Refundreason', 'index', '', '买家申请退款原因', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('428', '427', '1', '0', '1', 'Admin', 'Refundreason', 'add', '', '添加退款原因', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('429', '428', '1', '0', '10000', 'Admin', 'Refundreason', 'add_post', '', '添加保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('430', '427', '1', '0', '2', 'Admin', 'Refundreason', 'edit', '', '编辑退款原因', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('431', '430', '1', '0', '10000', 'Admin', 'Refundreason', 'edit_post', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('432', '427', '1', '0', '3', 'Admin', 'Refundreason', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('433', '427', '1', '0', '4', 'Admin', 'Refundreason', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('434', '211', '1', '1', '8', 'Admin', 'Refusereason', 'index', '', '卖家拒绝退款原因', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('435', '211', '1', '1', '9', 'Admin', 'Platformreason', 'index', '', '退款平台介入原因', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('436', '211', '1', '1', '10', 'Admin', 'Goodsorder', 'index', '', '商品订单列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('437', '211', '1', '1', '11', 'Admin', 'Refundlist', 'index', '', '退款列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('438', '211', '1', '1', '12', 'Admin', 'Shopcash', 'index', '', '提现记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('439', '0', '1', '1', '21', 'admin', 'paidprogram', 'default', '', '付费内容', 'imdb', '');
INSERT INTO `cmf_admin_menu` VALUES ('440', '434', '1', '0', '1', 'Admin', 'Refusereason', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('441', '440', '1', '0', '10000', 'Admin', 'Refusereason', 'add_post', '', '添加保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('442', '434', '1', '0', '2', 'Admin', 'Refusereason', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('443', '442', '1', '0', '10000', 'Admin', 'Refusereason', 'edit_post', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('444', '434', '1', '0', '3', 'Admin', 'Refusereason', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('445', '434', '1', '0', '4', 'Admin', 'Refusereason', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('446', '435', '1', '0', '1', 'Admin', 'Platformreason', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('447', '446', '1', '0', '10000', 'Admin', 'Platformreason', 'add_post', '', '添加保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('448', '435', '1', '0', '2', 'Admin', 'Platformreason', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('449', '448', '1', '0', '10000', 'Admin', 'Platformreason', 'edit_post', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('450', '435', '1', '0', '3', 'Admin', 'Platformreason', 'listOrder', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('451', '435', '1', '0', '4', 'Admin', 'Platformreason', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('452', '436', '1', '0', '1', 'Admin', 'Goodsorder', 'info', '', '订单详情', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('453', '437', '1', '0', '1', 'Admin', 'Refundlist', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('454', '453', '1', '0', '1', 'Admin', 'Refundlist', 'edit_post', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('455', '438', '1', '0', '1', 'Admin', 'Shopcash', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('456', '455', '1', '0', '1', 'Admin', 'Shopcash', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('457', '438', '1', '0', '2', 'Admin', 'Shopcash', 'export', '', '导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('458', '439', '1', '1', '1', 'Admin', 'Paidprogramclass', 'classlist', '', '付费内容分类列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('459', '458', '1', '0', '1', 'Admin', 'Paidprogramclass', 'class_add', '', '添加付费内容分类', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('460', '459', '1', '0', '10000', 'Admin', 'Paidprogramclass', 'class_add_post', '', '添加保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('461', '458', '1', '0', '2', 'Admin', 'Paidprogramclass', 'class_edit', '', '编辑付费内容分类', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('462', '461', '1', '0', '10000', 'Admin', 'Paidprogramclass', 'class_edit_post', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('463', '458', '1', '0', '3', 'Admin', 'Paidprogramclass', 'class_del', '', '付费内容分类删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('464', '458', '1', '0', '4', 'Admin', 'Paidprogramclass', 'listOrder', '', '付费内容分类排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('465', '439', '1', '1', '2', 'Admin', 'Paidprogram', 'index', '', '付费内容列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('466', '439', '1', '1', '3', 'Admin', 'Paidprogram', 'applylist', '', '付费内容申请列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('467', '439', '1', '1', '4', 'Admin', 'Paidprogram', 'orderlist', '', '付费内容订单', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('468', '417', '1', '0', '10000', 'Admin', 'Goodsclass', 'addPost', '', '商品分类添加保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('469', '218', '1', '0', '3', 'Admin', 'Shopgoods', 'edit', '', '商品审核/详情', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('470', '218', '1', '0', '4', 'Admin', 'Shopgoods', 'editPost', '', '商品审核提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('471', '416', '1', '0', '2', 'Admin', 'Goodsclass', 'edit', '', '商品分类编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('472', '471', '1', '0', '10000', 'Admin', 'Goodsclass', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('473', '416', '1', '0', '3', 'Admin', 'Goodsclass', 'del', '', '商品分类删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('474', '418', '1', '0', '1', 'Admin', 'Buyeraddress', 'del', '', '收货地址删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('475', '218', '1', '0', '5', 'Admin', 'Shopgoods', 'commentlist', '', '评价列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('476', '475', '1', '0', '1', 'Admin', 'Shopgoods', 'delComment', '', '删除评价', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('477', '465', '1', '0', '1', 'Admin', 'Paidprogram', 'edit', '', '编辑付费内容', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('478', '477', '1', '0', '10000', 'Admin', 'Paidprogram', 'edit_post', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('479', '465', '1', '0', '10000', 'Admin', 'Paidprogram', 'del', '', '删除付费内容', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('480', '465', '1', '0', '10000', 'Admin', 'Paidprogram', 'videoplay', '', '付费内容观看', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('481', '466', '1', '0', '1', 'Admin', 'Paidprogram', 'apply_edit', '', '编辑付费内容申请', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('482', '481', '1', '0', '1', 'Admin', 'Paidprogram', 'apply_edit_post', '', '付费内容申请编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('483', '466', '1', '0', '2', 'Admin', 'Paidprogram', 'apply_del', '', '删除付费内容申请', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('484', '467', '1', '0', '10000', 'Admin', 'Paidprogram', 'setPay', '', '确认支付', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('485', '467', '1', '0', '10000', 'Admin', 'Paidprogram', 'export', '', '导出付费内容订单', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('487', '211', '1', '1', '13', 'Admin', 'Balance', 'index', '', '余额手动充值', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('488', '487', '1', '0', '10000', 'Admin', 'Balance', 'add', '', '充值添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('489', '488', '1', '0', '10000', 'Admin', 'Balance', 'addPost', '', '余额充值保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('490', '487', '1', '0', '10000', 'Admin', 'Balance', 'export', '', '余额充值记录导出', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('492', '264', '1', '1', '10000', 'admin', 'familyuser', 'divideapply', '', '分成申请列表', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('493', '492', '1', '0', '10000', 'admin', 'familyuser', 'applyedit', '', '审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('494', '493', '1', '0', '10000', 'admin', 'familyuser', 'applyeditPost', '', '审核提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('495', '492', '1', '0', '10000', 'admin', 'familyuser', 'delapply', '', '删除审核', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('496', '279', '1', '1', '10000', 'admin', 'Scorerecord', 'index', '', '积分记录', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('497', '377', '1', '1', '10000', 'admin', 'Dynamiclabel', 'index', '', '话题标签', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('498', '497', '1', '0', '10000', 'admin', 'Dynamiclabel', 'add', '', '添加', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('499', '498', '1', '0', '10000', 'admin', 'Dynamiclabel', 'add_post', '', '添加提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('500', '497', '1', '0', '10000', 'admin', 'Dynamiclabel', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('501', '500', '1', '0', '10000', 'admin', 'Dynamiclabel', 'edit_post', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('502', '497', '1', '0', '10000', 'admin', 'Dynamiclabel', 'listsorders', '', '排序', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('503', '497', '1', '0', '10000', 'admin', 'Dynamiclabel', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('504', '124', '1', '0', '10000', 'user', 'AdminIndex', 'del', '', '本站用户删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('505', '211', '1', '1', '10000', 'Admin', 'Shopcategory', 'index', '', '经营类目申请', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('506', '505', '1', '0', '10000', 'admin', 'Shopcategory', 'edit', '', '编辑', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('507', '505', '1', '0', '10000', 'admin', 'Shopcategory', 'editPost', '', '编辑提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('508', '505', '1', '0', '10000', 'admin', 'Shopcategory', 'del', '', '删除', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('509', '212', '1', '0', '10000', 'admin', 'shopapply', 'platformedit', '', '平台自营店铺信息', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('510', '509', '1', '0', '10000', 'admin', 'shopapply', 'platformeditPost', '', '平台自营店铺提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('511', '218', '1', '0', '10000', 'admin', 'shopgoods', 'add', '', '添加商品', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('512', '511', '1', '0', '10000', 'admin', 'shopgoods', 'addpost', '', '商品添加保存', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('513', '436', '1', '0', '10000', 'admin', 'goodsorder', 'setexpress', '', '填写物流', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('514', '513', '1', '0', '10000', 'admin', 'goodsorder', 'setexpresspost', '', '填写物流提交', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('515', '437', '1', '0', '10000', 'admin', 'refundlist', 'platformedit', '', '平台自营处理退款', '', '');
INSERT INTO `cmf_admin_menu` VALUES ('516', '515', '1', '0', '10000', 'admin', 'refundlist', 'platformedit_post', '', '平台自营商品退款提交', '', '');

-- ----------------------------
-- Table structure for `cmf_agent`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_agent`;
CREATE TABLE `cmf_agent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `one_uid` int(11) NOT NULL DEFAULT '0' COMMENT '上级用户id',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_agent
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_agent_code`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_agent_code`;
CREATE TABLE `cmf_agent_code` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '邀请码',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_agent_code
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_agent_profit`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_agent_profit`;
CREATE TABLE `cmf_agent_profit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `one_profit` decimal(65,2) DEFAULT '0.00' COMMENT '一级收益',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_agent_profit
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_agent_profit_recode`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_agent_profit_recode`;
CREATE TABLE `cmf_agent_profit_recode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `total` int(11) DEFAULT '0' COMMENT '消费总数',
  `one_uid` int(11) DEFAULT '0' COMMENT '一级ID',
  `one_profit` decimal(65,2) DEFAULT '0.00' COMMENT '一级收益',
  `addtime` int(11) DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_agent_profit_recode
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_apply_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_apply_goods_class`;
CREATE TABLE `cmf_apply_goods_class` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `uid` int(12) NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_classid` varchar(255) NOT NULL COMMENT '商品一级分类ID',
  `reason` text COMMENT '审核说明',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `uptime` int(12) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0 处理中 1 成功 2 失败',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_apply_goods_class
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_asset`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_asset`;
CREATE TABLE `cmf_asset` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `file_size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小,单位B',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:可用,0:不可用',
  `download_times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `file_key` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件惟一码',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `file_path` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件路径,相对于upload目录,可以为url',
  `file_md5` varchar(32) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '文件md5值',
  `file_sha1` varchar(40) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '' COMMENT '文件后缀名,不包括点',
  `more` text COMMENT '其它详细信息,JSON格式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='资源表';

-- ----------------------------
-- Records of cmf_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_access`;
CREATE TABLE `cmf_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of cmf_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_auth_rule`;
CREATE TABLE `cmf_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `module` (`app`,`status`,`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COMMENT='权限规则表';

-- ----------------------------
-- Records of cmf_auth_rule
-- ----------------------------
INSERT INTO `cmf_auth_rule` VALUES ('1', '1', 'admin', 'admin_url', 'admin/Hook/index', '', '钩子管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('2', '1', 'admin', 'admin_url', 'admin/Hook/plugins', '', '钩子插件管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('3', '1', 'admin', 'admin_url', 'admin/Hook/pluginListOrder', '', '钩子插件排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('4', '1', 'admin', 'admin_url', 'admin/Hook/sync', '', '同步钩子', '');
INSERT INTO `cmf_auth_rule` VALUES ('5', '1', 'admin', 'admin_url', 'admin/Link/index', '', '友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('6', '1', 'admin', 'admin_url', 'admin/Link/add', '', '添加友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('7', '1', 'admin', 'admin_url', 'admin/Link/addPost', '', '添加友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('8', '1', 'admin', 'admin_url', 'admin/Link/edit', '', '编辑友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('9', '1', 'admin', 'admin_url', 'admin/Link/editPost', '', '编辑友情链接提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('10', '1', 'admin', 'admin_url', 'admin/Link/delete', '', '删除友情链接', '');
INSERT INTO `cmf_auth_rule` VALUES ('11', '1', 'admin', 'admin_url', 'admin/Link/listOrder', '', '友情链接排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('12', '1', 'admin', 'admin_url', 'admin/Link/toggle', '', '友情链接显示隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('13', '1', 'admin', 'admin_url', 'admin/Mailer/index', '', '邮箱配置', '');
INSERT INTO `cmf_auth_rule` VALUES ('14', '1', 'admin', 'admin_url', 'admin/Mailer/indexPost', '', '邮箱配置提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('15', '1', 'admin', 'admin_url', 'admin/Mailer/template', '', '邮件模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('16', '1', 'admin', 'admin_url', 'admin/Mailer/templatePost', '', '邮件模板提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('17', '1', 'admin', 'admin_url', 'admin/Mailer/test', '', '邮件发送测试', '');
INSERT INTO `cmf_auth_rule` VALUES ('18', '1', 'admin', 'admin_url', 'admin/Menu/index', '', '后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('19', '1', 'admin', 'admin_url', 'admin/Menu/lists', '', '所有菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('20', '1', 'admin', 'admin_url', 'admin/Menu/add', '', '后台菜单添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('21', '1', 'admin', 'admin_url', 'admin/Menu/addPost', '', '后台菜单添加提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('22', '1', 'admin', 'admin_url', 'admin/Menu/edit', '', '后台菜单编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('23', '1', 'admin', 'admin_url', 'admin/Menu/editPost', '', '后台菜单编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('24', '1', 'admin', 'admin_url', 'admin/Menu/delete', '', '后台菜单删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('25', '1', 'admin', 'admin_url', 'admin/Menu/listOrder', '', '后台菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('26', '1', 'admin', 'admin_url', 'admin/Menu/getActions', '', '导入新后台菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('27', '1', 'admin', 'admin_url', 'admin/Nav/index', '', '导航管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('28', '1', 'admin', 'admin_url', 'admin/Nav/add', '', '添加导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('29', '1', 'admin', 'admin_url', 'admin/Nav/addPost', '', '添加导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('30', '1', 'admin', 'admin_url', 'admin/Nav/edit', '', '编辑导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('31', '1', 'admin', 'admin_url', 'admin/Nav/editPost', '', '编辑导航提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('32', '1', 'admin', 'admin_url', 'admin/Nav/delete', '', '删除导航', '');
INSERT INTO `cmf_auth_rule` VALUES ('33', '1', 'admin', 'admin_url', 'admin/NavMenu/index', '', '导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('34', '1', 'admin', 'admin_url', 'admin/NavMenu/add', '', '添加导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('35', '1', 'admin', 'admin_url', 'admin/NavMenu/addPost', '', '添加导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('36', '1', 'admin', 'admin_url', 'admin/NavMenu/edit', '', '编辑导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('37', '1', 'admin', 'admin_url', 'admin/NavMenu/editPost', '', '编辑导航菜单提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('38', '1', 'admin', 'admin_url', 'admin/NavMenu/delete', '', '删除导航菜单', '');
INSERT INTO `cmf_auth_rule` VALUES ('39', '1', 'admin', 'admin_url', 'admin/NavMenu/listOrder', '', '导航菜单排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('40', '1', 'admin', 'admin_url', 'admin/Plugin/default', '', '插件中心', '');
INSERT INTO `cmf_auth_rule` VALUES ('41', '1', 'admin', 'admin_url', 'admin/Plugin/index', '', '插件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('42', '1', 'admin', 'admin_url', 'admin/Plugin/toggle', '', '插件启用禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('43', '1', 'admin', 'admin_url', 'admin/Plugin/setting', '', '插件设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('44', '1', 'admin', 'admin_url', 'admin/Plugin/settingPost', '', '插件设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('45', '1', 'admin', 'admin_url', 'admin/Plugin/install', '', '插件安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('46', '1', 'admin', 'admin_url', 'admin/Plugin/update', '', '插件更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('47', '1', 'admin', 'admin_url', 'admin/Plugin/uninstall', '', '卸载插件', '');
INSERT INTO `cmf_auth_rule` VALUES ('48', '1', 'admin', 'admin_url', 'admin/Rbac/index', '', '角色管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('49', '1', 'admin', 'admin_url', 'admin/Rbac/roleAdd', '', '添加角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('50', '1', 'admin', 'admin_url', 'admin/Rbac/roleAddPost', '', '添加角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('51', '1', 'admin', 'admin_url', 'admin/Rbac/roleEdit', '', '编辑角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('52', '1', 'admin', 'admin_url', 'admin/Rbac/roleEditPost', '', '编辑角色提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('53', '1', 'admin', 'admin_url', 'admin/Rbac/roleDelete', '', '删除角色', '');
INSERT INTO `cmf_auth_rule` VALUES ('54', '1', 'admin', 'admin_url', 'admin/Rbac/authorize', '', '设置角色权限', '');
INSERT INTO `cmf_auth_rule` VALUES ('55', '1', 'admin', 'admin_url', 'admin/Rbac/authorizePost', '', '角色授权提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('56', '1', 'admin', 'admin_url', 'admin/RecycleBin/index', '', '回收站', '');
INSERT INTO `cmf_auth_rule` VALUES ('57', '1', 'admin', 'admin_url', 'admin/RecycleBin/restore', '', '回收站还原', '');
INSERT INTO `cmf_auth_rule` VALUES ('58', '1', 'admin', 'admin_url', 'admin/RecycleBin/delete', '', '回收站彻底删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('59', '1', 'admin', 'admin_url', 'admin/Route/index', '', 'URL美化', '');
INSERT INTO `cmf_auth_rule` VALUES ('60', '1', 'admin', 'admin_url', 'admin/Route/add', '', '添加路由规则', '');
INSERT INTO `cmf_auth_rule` VALUES ('61', '1', 'admin', 'admin_url', 'admin/Route/addPost', '', '添加路由规则提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('62', '1', 'admin', 'admin_url', 'admin/Route/edit', '', '路由规则编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('63', '1', 'admin', 'admin_url', 'admin/Route/editPost', '', '路由规则编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('64', '1', 'admin', 'admin_url', 'admin/Route/delete', '', '路由规则删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('65', '1', 'admin', 'admin_url', 'admin/Route/ban', '', '路由规则禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('66', '1', 'admin', 'admin_url', 'admin/Route/open', '', '路由规则启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('67', '1', 'admin', 'admin_url', 'admin/Route/listOrder', '', '路由规则排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('68', '1', 'admin', 'admin_url', 'admin/Route/select', '', '选择URL', '');
INSERT INTO `cmf_auth_rule` VALUES ('69', '1', 'admin', 'admin_url', 'admin/Setting/default', '', '设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('70', '1', 'admin', 'admin_url', 'admin/Setting/site', '', '网站信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('71', '1', 'admin', 'admin_url', 'admin/Setting/sitePost', '', '网站信息设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('72', '1', 'admin', 'admin_url', 'admin/Setting/password', '', '密码修改', '');
INSERT INTO `cmf_auth_rule` VALUES ('73', '1', 'admin', 'admin_url', 'admin/Setting/passwordPost', '', '密码修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('74', '1', 'admin', 'admin_url', 'admin/Setting/upload', '', '上传设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('75', '1', 'admin', 'admin_url', 'admin/Setting/uploadPost', '', '上传设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('76', '1', 'admin', 'admin_url', 'admin/Setting/clearCache', '', '清除缓存', '');
INSERT INTO `cmf_auth_rule` VALUES ('77', '1', 'admin', 'admin_url', 'admin/Slide/index', '', '幻灯片管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('78', '1', 'admin', 'admin_url', 'admin/Slide/add', '', '添加幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('79', '1', 'admin', 'admin_url', 'admin/Slide/addPost', '', '添加幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('80', '1', 'admin', 'admin_url', 'admin/Slide/edit', '', '编辑幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('81', '1', 'admin', 'admin_url', 'admin/Slide/editPost', '', '编辑幻灯片提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('82', '1', 'admin', 'admin_url', 'admin/Slide/delete', '', '删除幻灯片', '');
INSERT INTO `cmf_auth_rule` VALUES ('83', '1', 'admin', 'admin_url', 'admin/SlideItem/index', '', '幻灯片页面列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('84', '1', 'admin', 'admin_url', 'admin/SlideItem/add', '', '幻灯片页面添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('85', '1', 'admin', 'admin_url', 'admin/SlideItem/addPost', '', '幻灯片页面添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('86', '1', 'admin', 'admin_url', 'admin/SlideItem/edit', '', '幻灯片页面编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('87', '1', 'admin', 'admin_url', 'admin/SlideItem/editPost', '', '幻灯片页面编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('88', '1', 'admin', 'admin_url', 'admin/SlideItem/delete', '', '幻灯片页面删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('89', '1', 'admin', 'admin_url', 'admin/SlideItem/ban', '', '幻灯片页面隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('90', '1', 'admin', 'admin_url', 'admin/SlideItem/cancelBan', '', '幻灯片页面显示', '');
INSERT INTO `cmf_auth_rule` VALUES ('91', '1', 'admin', 'admin_url', 'admin/SlideItem/listOrder', '', '幻灯片页面排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('92', '1', 'admin', 'admin_url', 'admin/Storage/index', '', '文件存储', '');
INSERT INTO `cmf_auth_rule` VALUES ('93', '1', 'admin', 'admin_url', 'admin/Storage/settingPost', '', '文件存储设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('94', '1', 'admin', 'admin_url', 'admin/Theme/index', '', '模板管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('95', '1', 'admin', 'admin_url', 'admin/Theme/install', '', '安装模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('96', '1', 'admin', 'admin_url', 'admin/Theme/uninstall', '', '卸载模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('97', '1', 'admin', 'admin_url', 'admin/Theme/installTheme', '', '模板安装', '');
INSERT INTO `cmf_auth_rule` VALUES ('98', '1', 'admin', 'admin_url', 'admin/Theme/update', '', '模板更新', '');
INSERT INTO `cmf_auth_rule` VALUES ('99', '1', 'admin', 'admin_url', 'admin/Theme/active', '', '启用模板', '');
INSERT INTO `cmf_auth_rule` VALUES ('100', '1', 'admin', 'admin_url', 'admin/Theme/files', '', '模板文件列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('101', '1', 'admin', 'admin_url', 'admin/Theme/fileSetting', '', '模板文件设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('102', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayData', '', '模板文件数组数据列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('103', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEdit', '', '模板文件数组数据添加编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('104', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataEditPost', '', '模板文件数组数据添加编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('105', '1', 'admin', 'admin_url', 'admin/Theme/fileArrayDataDelete', '', '模板文件数组数据删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('106', '1', 'admin', 'admin_url', 'admin/Theme/settingPost', '', '模板文件编辑提交保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('107', '1', 'admin', 'admin_url', 'admin/Theme/dataSource', '', '模板文件设置数据源', '');
INSERT INTO `cmf_auth_rule` VALUES ('108', '1', 'admin', 'admin_url', 'admin/Theme/design', '', '模板设计', '');
INSERT INTO `cmf_auth_rule` VALUES ('109', '1', 'admin', 'admin_url', 'admin/User/default', '', '管理组', '');
INSERT INTO `cmf_auth_rule` VALUES ('110', '1', 'admin', 'admin_url', 'admin/User/index', '', '管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('111', '1', 'admin', 'admin_url', 'admin/User/add', '', '管理员添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('112', '1', 'admin', 'admin_url', 'admin/User/addPost', '', '管理员添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('113', '1', 'admin', 'admin_url', 'admin/User/edit', '', '管理员编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('114', '1', 'admin', 'admin_url', 'admin/User/editPost', '', '管理员编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('115', '1', 'admin', 'admin_url', 'admin/User/userInfo', '', '个人信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('116', '1', 'admin', 'admin_url', 'admin/User/userInfoPost', '', '管理员个人信息修改提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('117', '1', 'admin', 'admin_url', 'admin/User/delete', '', '管理员删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('118', '1', 'admin', 'admin_url', 'admin/User/ban', '', '停用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('119', '1', 'admin', 'admin_url', 'admin/User/cancelBan', '', '启用管理员', '');
INSERT INTO `cmf_auth_rule` VALUES ('120', '1', 'user', 'admin_url', 'user/AdminAsset/index', '', '资源管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('121', '1', 'user', 'admin_url', 'user/AdminAsset/delete', '', '删除文件', '');
INSERT INTO `cmf_auth_rule` VALUES ('122', '1', 'user', 'admin_url', 'user/AdminIndex/default', '', '用户管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('123', '1', 'user', 'admin_url', 'user/AdminIndex/default1', '', '用户组', '');
INSERT INTO `cmf_auth_rule` VALUES ('124', '1', 'user', 'admin_url', 'user/AdminIndex/index', '', '本站用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('125', '1', 'user', 'admin_url', 'user/AdminIndex/ban', '', '本站用户拉黑', '');
INSERT INTO `cmf_auth_rule` VALUES ('126', '1', 'user', 'admin_url', 'user/AdminIndex/cancelBan', '', '本站用户启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('127', '1', 'user', 'admin_url', 'user/AdminOauth/index', '', '第三方用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('128', '1', 'user', 'admin_url', 'user/AdminOauth/delete', '', '删除第三方用户绑定', '');
INSERT INTO `cmf_auth_rule` VALUES ('129', '1', 'user', 'admin_url', 'user/AdminUserAction/index', '', '用户操作管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('130', '1', 'user', 'admin_url', 'user/AdminUserAction/edit', '', '编辑用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('131', '1', 'user', 'admin_url', 'user/AdminUserAction/editPost', '', '编辑用户操作提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('132', '1', 'user', 'admin_url', 'user/AdminUserAction/sync', '', '同步用户操作', '');
INSERT INTO `cmf_auth_rule` VALUES ('133', '1', 'admin', 'admin_url', 'admin/adminlog/index', '', '操作日志', '');
INSERT INTO `cmf_auth_rule` VALUES ('134', '1', 'admin', 'admin_url', 'admin/adminlog/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('135', '1', 'admin', 'admin_url', 'admin/adminlog/export', '', '导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('136', '1', 'admin', 'admin_url', 'admin/Agent/default', '', '邀请奖励', '');
INSERT INTO `cmf_auth_rule` VALUES ('137', '1', 'admin', 'admin_url', 'admin/agent/index', '', '邀请关系', '');
INSERT INTO `cmf_auth_rule` VALUES ('138', '1', 'admin', 'admin_url', 'admin/agent/index2', '', '邀请收益', '');
INSERT INTO `cmf_auth_rule` VALUES ('139', '1', 'admin', 'admin_url', 'admin/car/default', '', '道具管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('140', '1', 'admin', 'admin_url', 'admin/car/index', '', '坐骑管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('141', '1', 'admin', 'admin_url', 'admin/car/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('142', '1', 'admin', 'admin_url', 'admin/car/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('143', '1', 'admin', 'admin_url', 'admin/car/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('144', '1', 'admin', 'admin_url', 'admin/car/editPost', '', '编辑添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('145', '1', 'admin', 'admin_url', 'admin/car/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('146', '1', 'admin', 'admin_url', 'admin/car/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('147', '1', 'admin', 'admin_url', 'admin/liang/index', '', '靓号管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('148', '1', 'admin', 'admin_url', 'admin/liang/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('149', '1', 'admin', 'admin_url', 'admin/liang/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('150', '1', 'admin', 'admin_url', 'admin/setting/configpri', '', '私密设置', '');
INSERT INTO `cmf_auth_rule` VALUES ('151', '1', 'admin', 'admin_url', 'admin/setting/configpriPost', '', '提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('152', '1', 'admin', 'admin_url', 'admin/jackpot/set', '', '奖池管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('153', '1', 'admin', 'admin_url', 'admin/jackpot/setPost', '', '设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('154', '1', 'admin', 'admin_url', 'admin/jackpot/index', '', '奖池等级', '');
INSERT INTO `cmf_auth_rule` VALUES ('155', '1', 'admin', 'admin_url', 'admin/jackpot/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('156', '1', 'admin', 'admin_url', 'admin/jackpot/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('157', '1', 'admin', 'admin_url', 'admin/jackpot/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('158', '1', 'admin', 'admin_url', 'admin/jackpot/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('159', '1', 'admin', 'admin_url', 'admin/jackpot/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('160', '1', 'admin', 'admin_url', 'admin/live/default', '', '直播管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('161', '1', 'admin', 'admin_url', 'admin/liveclass/index', '', '直播分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('162', '1', 'admin', 'admin_url', 'admin/liveclass/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('163', '1', 'admin', 'admin_url', 'admin/liveclass/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('164', '1', 'admin', 'admin_url', 'admin/liveclass/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('165', '1', 'admin', 'admin_url', 'admin/liveclass/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('166', '1', 'admin', 'admin_url', 'admin/liveclass/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('167', '1', 'admin', 'admin_url', 'admin/liveclass/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('168', '1', 'admin', 'admin_url', 'admin/liveban/index', '', '禁播管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('169', '1', 'admin', 'admin_url', 'admin/liveban/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('170', '1', 'admin', 'admin_url', 'admin/liveshut/index', '', '禁言管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('171', '1', 'admin', 'admin_url', 'admin/liveshut/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('172', '1', 'admin', 'admin_url', 'admin/livekick/index', '', '踢人管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('173', '1', 'admin', 'admin_url', 'admin/livekick/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('174', '1', 'admin', 'admin_url', 'admin/liveing/index', '', '直播列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('175', '1', 'admin', 'admin_url', 'admin/liveing/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('176', '1', 'admin', 'admin_url', 'admin/liveing/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('177', '1', 'admin', 'admin_url', 'admin/liveing/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('178', '1', 'admin', 'admin_url', 'admin/liveing/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('179', '1', 'admin', 'admin_url', 'admin/liveing/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('180', '1', 'admin', 'admin_url', 'admin/monitor/index', '', '直播监控', '');
INSERT INTO `cmf_auth_rule` VALUES ('181', '1', 'admin', 'admin_url', 'admin/monitor/full', '', '大屏', '');
INSERT INTO `cmf_auth_rule` VALUES ('182', '1', 'admin', 'admin_url', 'admin/monitor/stop', '', '关播', '');
INSERT INTO `cmf_auth_rule` VALUES ('183', '1', 'admin', 'admin_url', 'admin/gift/index', '', '礼物管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('184', '1', 'admin', 'admin_url', 'admin/gift/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('185', '1', 'admin', 'admin_url', 'admin/gift/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('186', '1', 'admin', 'admin_url', 'admin/gift/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('187', '1', 'admin', 'admin_url', 'admin/gift/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('188', '1', 'admin', 'admin_url', 'admin/gift/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('189', '1', 'admin', 'admin_url', 'admin/gift/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('190', '1', 'admin', 'admin_url', 'admin/report/defult', '', '举报管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('191', '1', 'admin', 'admin_url', 'admin/reportcat/index', '', '举报分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('192', '1', 'admin', 'admin_url', 'admin/reportcat/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('193', '1', 'admin', 'admin_url', 'admin/reportcat/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('194', '1', 'admin', 'admin_url', 'admin/reportcat/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('195', '1', 'admin', 'admin_url', 'admin/reportcat/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('196', '1', 'admin', 'admin_url', 'admin/reportcat/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('197', '1', 'admin', 'admin_url', 'admin/reportcat/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('198', '1', 'admin', 'admin_url', 'admin/report/index', '', '举报列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('199', '1', 'admin', 'admin_url', 'admin/report/setstatus', '', '处理', '');
INSERT INTO `cmf_auth_rule` VALUES ('200', '1', 'admin', 'admin_url', 'admin/liverecord/index', '', '直播记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('201', '1', 'admin', 'admin_url', 'admin/video/default', '', '视频管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('202', '1', 'admin', 'admin_url', 'admin/music/index', '', '音乐管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('203', '1', 'admin', 'admin_url', 'admin/musiccat/index', '', '音乐分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('204', '1', 'admin', 'admin_url', 'admin/music/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('205', '1', 'admin', 'admin_url', 'admin/music/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('206', '1', 'admin', 'admin_url', 'admin/music/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('207', '1', 'admin', 'admin_url', 'admin/music/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('208', '1', 'admin', 'admin_url', 'admin/music/listen', '', '试听', '');
INSERT INTO `cmf_auth_rule` VALUES ('209', '1', 'admin', 'admin_url', 'admin/music/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('210', '1', 'admin', 'admin_url', 'admin/music/canceldel', '', '取消删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('211', '1', 'admin', 'admin_url', 'admin/musiccat/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('212', '1', 'admin', 'admin_url', 'admin/musiccat/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('213', '1', 'admin', 'admin_url', 'admin/musiccat/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('214', '1', 'admin', 'admin_url', 'admin/musiccat/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('215', '1', 'admin', 'admin_url', 'admin/musiccat/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('216', '1', 'admin', 'admin_url', 'admin/musiccat/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('217', '1', 'admin', 'admin_url', 'admin/shop/default', '', '店铺管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('218', '1', 'admin', 'admin_url', 'admin/shopapply/index', '', '店铺申请', '');
INSERT INTO `cmf_auth_rule` VALUES ('219', '1', 'admin', 'admin_url', 'admin/shopapply/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('220', '1', 'admin', 'admin_url', 'admin/shopapply/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('221', '1', 'admin', 'admin_url', 'admin/shopapply/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('222', '1', 'admin', 'admin_url', 'admin/shopbond/index', '', '保证金', '');
INSERT INTO `cmf_auth_rule` VALUES ('223', '1', 'admin', 'admin_url', 'admin/shopbond/setstatus', '', '处理', '');
INSERT INTO `cmf_auth_rule` VALUES ('224', '1', 'admin', 'admin_url', 'admin/shopgoods/index', '', '商品管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('225', '1', 'admin', 'admin_url', 'admin/shopgoods/setstatus', '', '上下架', '');
INSERT INTO `cmf_auth_rule` VALUES ('226', '1', 'admin', 'admin_url', 'admin/shopgoods/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('227', '1', 'admin', 'admin_url', 'admin/turntable/default', '', '大转盘', '');
INSERT INTO `cmf_auth_rule` VALUES ('228', '1', 'admin', 'admin_url', 'admin/turntablecon/index', '', '价格管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('229', '1', 'admin', 'admin_url', 'admin/turntablecon/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('230', '1', 'admin', 'admin_url', 'admin/turntablecon/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('231', '1', 'admin', 'admin_url', 'admin/turntablecon/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('232', '1', 'admin', 'admin_url', 'admin/turntable/index', '', '奖品管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('233', '1', 'admin', 'admin_url', 'admin/turntable/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('234', '1', 'admin', 'admin_url', 'admin/turntable/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('235', '1', 'admin', 'admin_url', 'admin/turntable/index2', '', '转盘记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('236', '1', 'admin', 'admin_url', 'admin/turntable/index3', '', '线下奖品', '');
INSERT INTO `cmf_auth_rule` VALUES ('237', '1', 'admin', 'admin_url', 'admin/turntable/setstatus', '', '处理', '');
INSERT INTO `cmf_auth_rule` VALUES ('238', '1', 'admin', 'admin_url', 'admin/level/default', '', '等级管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('239', '1', 'admin', 'admin_url', 'admin/level/index', '', '用户等级', '');
INSERT INTO `cmf_auth_rule` VALUES ('240', '1', 'admin', 'admin_url', 'admin/level/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('241', '1', 'admin', 'admin_url', 'admin/level/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('242', '1', 'admin', 'admin_url', 'admin/level/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('243', '1', 'admin', 'admin_url', 'admin/level/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('244', '1', 'admin', 'admin_url', 'admin/level/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('245', '1', 'admin', 'admin_url', 'admin/levelanchor/index', '', '主播等级', '');
INSERT INTO `cmf_auth_rule` VALUES ('246', '1', 'admin', 'admin_url', 'admin/levelanchor/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('247', '1', 'admin', 'admin_url', 'admin/levelanchor/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('248', '1', 'admin', 'admin_url', 'admin/levelanchor/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('249', '1', 'admin', 'admin_url', 'admin/levelanchor/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('250', '1', 'admin', 'admin_url', 'admin/levelanchor/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('251', '1', 'admin', 'admin_url', 'admin/guard/index', '', '守护管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('252', '1', 'admin', 'admin_url', 'admin/guard/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('253', '1', 'admin', 'admin_url', 'admin/guard/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('254', '1', 'admin', 'admin_url', 'admin/liang/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('255', '1', 'admin', 'admin_url', 'admin/liang/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('256', '1', 'admin', 'admin_url', 'admin/liang/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('257', '1', 'admin', 'admin_url', 'admin/liang/setstatus', '', '设置状态', '');
INSERT INTO `cmf_auth_rule` VALUES ('258', '1', 'admin', 'admin_url', 'admin/liang/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('259', '1', 'admin', 'admin_url', 'admin/vip/default', '', 'VIP管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('260', '1', 'admin', 'admin_url', 'admin/vip/index', '', 'VIP列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('261', '1', 'admin', 'admin_url', 'admin/vip/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('262', '1', 'admin', 'admin_url', 'admin/vip/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('263', '1', 'admin', 'admin_url', 'admin/vip/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('264', '1', 'admin', 'admin_url', 'admin/vipuser/index', '', 'VIP用户', '');
INSERT INTO `cmf_auth_rule` VALUES ('265', '1', 'admin', 'admin_url', 'admin/vipuser/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('266', '1', 'admin', 'admin_url', 'admin/vipuser/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('267', '1', 'admin', 'admin_url', 'admin/vipuser/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('268', '1', 'admin', 'admin_url', 'admin/vipuser/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('269', '1', 'admin', 'admin_url', 'admin/vipuser/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('270', '1', 'admin', 'admin_url', 'admin/family/default', '', '家族管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('271', '1', 'admin', 'admin_url', 'admin/family/index', '', '家族列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('272', '1', 'admin', 'admin_url', 'admin/family/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('273', '1', 'admin', 'admin_url', 'admin/family/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('274', '1', 'admin', 'admin_url', 'admin/family/disable', '', '禁用', '');
INSERT INTO `cmf_auth_rule` VALUES ('275', '1', 'admin', 'admin_url', 'admin/family/enable', '', '启用', '');
INSERT INTO `cmf_auth_rule` VALUES ('276', '1', 'admin', 'admin_url', 'admin/family/profit', '', '收益', '');
INSERT INTO `cmf_auth_rule` VALUES ('277', '1', 'admin', 'admin_url', 'admin/family/cash', '', '提现', '');
INSERT INTO `cmf_auth_rule` VALUES ('278', '1', 'admin', 'admin_url', 'admin/family/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('279', '1', 'admin', 'admin_url', 'admin/familyuser/index', '', '成员管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('280', '1', 'admin', 'admin_url', 'admin/familyuser/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('281', '1', 'admin', 'admin_url', 'admin/familyuser/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('282', '1', 'admin', 'admin_url', 'admin/familyuser/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('283', '1', 'admin', 'admin_url', 'admin/familyuser/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('284', '1', 'admin', 'admin_url', 'admin/familyuser/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('285', '1', 'admin', 'admin_url', 'admin/finance/default', '', '财务管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('286', '1', 'admin', 'admin_url', 'admin/chargerules/index', '', '充值规则', '');
INSERT INTO `cmf_auth_rule` VALUES ('287', '1', 'admin', 'admin_url', 'admin/chargerules/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('288', '1', 'admin', 'admin_url', 'admin/chargerules/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('289', '1', 'admin', 'admin_url', 'admin/chargerules/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('290', '1', 'admin', 'admin_url', 'admin/chargerules/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('291', '1', 'admin', 'admin_url', 'admin/chargerules/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('292', '1', 'admin', 'admin_url', 'admin/chargerules/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('293', '1', 'admin', 'admin_url', 'admin/charge/index', '', '钻石充值记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('294', '1', 'admin', 'admin_url', 'admin/charge/setpay', '', '确认支付', '');
INSERT INTO `cmf_auth_rule` VALUES ('295', '1', 'admin', 'admin_url', 'admin/charge/export', '', '导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('296', '1', 'admin', 'admin_url', 'admin/manual/index', '', '手动充值钻石', '');
INSERT INTO `cmf_auth_rule` VALUES ('297', '1', 'admin', 'admin_url', 'admin/manual/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('298', '1', 'admin', 'admin_url', 'admin/manual/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('299', '1', 'admin', 'admin_url', 'admin/manual/export', '', '导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('300', '1', 'admin', 'admin_url', 'admin/coinrecord/index', '', '钻石消费记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('301', '1', 'admin', 'admin_url', 'admin/cash/index', '', '映票提现记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('302', '1', 'admin', 'admin_url', 'admin/cash/export', '', '导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('303', '1', 'admin', 'admin_url', 'admin/cash/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('304', '1', 'admin', 'admin_url', 'admin/cash/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('305', '1', 'admin', 'admin_url', 'admin/guide/set', '', '引导页', '');
INSERT INTO `cmf_auth_rule` VALUES ('306', '1', 'admin', 'admin_url', 'admin/guide/setPost', '', '设置提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('307', '1', 'admin', 'admin_url', 'admin/guide/index', '', '管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('308', '1', 'admin', 'admin_url', 'admin/guide/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('309', '1', 'admin', 'admin_url', 'admin/guide/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('310', '1', 'admin', 'admin_url', 'admin/guide/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('311', '1', 'admin', 'admin_url', 'admin/guide/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('312', '1', 'admin', 'admin_url', 'admin/guide/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('313', '1', 'admin', 'admin_url', 'admin/guide/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('314', '1', 'admin', 'admin_url', 'admin/auth/index', '', '身份认证', '');
INSERT INTO `cmf_auth_rule` VALUES ('315', '1', 'admin', 'admin_url', 'admin/auth/setstatus', '', '处理', '');
INSERT INTO `cmf_auth_rule` VALUES ('316', '1', 'admin', 'admin_url', 'admin/auth/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('317', '1', 'admin', 'admin_url', 'admin/auth/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('318', '1', 'admin', 'admin_url', 'admin/video/index', 'isdel=0&status=1', '审核通过列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('319', '1', 'admin', 'admin_url', 'admin/video/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('320', '1', 'admin', 'admin_url', 'admin/video/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('321', '1', 'admin', 'admin_url', 'admin/video/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('322', '1', 'admin', 'admin_url', 'admin/video/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('323', '1', 'admin', 'admin_url', 'admin/video/setstatus', '', '上下架', '');
INSERT INTO `cmf_auth_rule` VALUES ('324', '1', 'admin', 'admin_url', 'admin/video/see', '', '查看', '');
INSERT INTO `cmf_auth_rule` VALUES ('325', '1', 'admin', 'admin_url', 'admin/videocom/index', '', '视频评论', '');
INSERT INTO `cmf_auth_rule` VALUES ('326', '1', 'admin', 'admin_url', 'admin/videocom/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('327', '1', 'admin', 'admin_url', 'admin/videorepcat/index', '', '举报类型', '');
INSERT INTO `cmf_auth_rule` VALUES ('328', '1', 'admin', 'admin_url', 'admin/videorepcat/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('329', '1', 'admin', 'admin_url', 'admin/videorepcat/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('330', '1', 'admin', 'admin_url', 'admin/videorepcat/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('331', '1', 'admin', 'admin_url', 'admin/videorepcat/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('332', '1', 'admin', 'admin_url', 'admin/videorepcat/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('333', '1', 'admin', 'admin_url', 'admin/videorepcat/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('334', '1', 'admin', 'admin_url', 'admin/videorep/index', '', '举报列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('335', '1', 'admin', 'admin_url', 'admin/videorep/setstatus', '', '处理', '');
INSERT INTO `cmf_auth_rule` VALUES ('336', '1', 'admin', 'admin_url', 'admin/videorep/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('337', '1', 'admin', 'admin_url', 'admin/Loginbonus/index', '', '登录奖励', '');
INSERT INTO `cmf_auth_rule` VALUES ('338', '1', 'admin', 'admin_url', 'admin/Loginbonus/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('339', '1', 'admin', 'admin_url', 'admin/Loginbonus/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('340', '1', 'admin', 'admin_url', 'admin/red/index', '', '红包管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('341', '1', 'admin', 'admin_url', 'admin/red/index2', '', '领取详情', '');
INSERT INTO `cmf_auth_rule` VALUES ('342', '1', 'admin', 'admin_url', 'admin/note/default', '', '消息管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('343', '1', 'admin', 'admin_url', 'admin/sendcode/index', '', '验证码管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('344', '1', 'admin', 'admin_url', 'admin/sendcode/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('345', '1', 'admin', 'admin_url', 'admin/sendcode/export', '', '导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('346', '1', 'admin', 'admin_url', 'admin/push/index', '', '推送管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('347', '1', 'admin', 'admin_url', 'admin/push/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('348', '1', 'admin', 'admin_url', 'admin/push/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('349', '1', 'admin', 'admin_url', 'admin/push/export', '', '导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('350', '1', 'admin', 'admin_url', 'admin/system/index', '', '直播间消息', '');
INSERT INTO `cmf_auth_rule` VALUES ('351', '1', 'admin', 'admin_url', 'admin/system/send', '', '发送', '');
INSERT INTO `cmf_auth_rule` VALUES ('352', '1', 'admin', 'admin_url', 'admin/Impression/index', '', '标签管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('353', '1', 'admin', 'admin_url', 'admin/Impression/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('354', '1', 'admin', 'admin_url', 'admin/Impression/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('355', '1', 'admin', 'admin_url', 'admin/Impression/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('356', '1', 'admin', 'admin_url', 'admin/Impression/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('357', '1', 'admin', 'admin_url', 'admin/Impression/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('358', '1', 'admin', 'admin_url', 'admin/Impression/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('359', '1', 'admin', 'admin_url', 'admin/portal/default', '', '内容管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('360', '1', 'admin', 'admin_url', 'admin/feedback/index', '', '用户反馈', '');
INSERT INTO `cmf_auth_rule` VALUES ('361', '1', 'admin', 'admin_url', 'admin/feedback/setstatus', '', '处理', '');
INSERT INTO `cmf_auth_rule` VALUES ('362', '1', 'admin', 'admin_url', 'admin/feedback/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('363', '1', 'portal', 'admin_url', 'portal/AdminPage/index', '', '页面管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('364', '1', 'portal', 'admin_url', 'portal/AdminPage/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('365', '1', 'portal', 'admin_url', 'portal/AdminPage/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('366', '1', 'portal', 'admin_url', 'portal/AdminPage/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('367', '1', 'portal', 'admin_url', 'portal/AdminPage/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('368', '1', 'portal', 'admin_url', 'portal/AdminPage/delete', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('369', '1', 'admin', 'admin_url', 'admin/videoclass/index', '', '视频分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('370', '1', 'admin', 'admin_url', 'admin/videoclass/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('371', '1', 'admin', 'admin_url', 'admin/videoclass/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('372', '1', 'admin', 'admin_url', 'admin/videoclass/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('373', '1', 'admin', 'admin_url', 'admin/videoclass/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('374', '1', 'admin', 'admin_url', 'admin/videoclass/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('375', '1', 'admin', 'admin_url', 'admin/videoclass/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('376', '1', 'admin', 'admin_url', 'admin/sticker/index', '', '贴纸列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('377', '1', 'admin', 'admin_url', 'admin/sticker/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('378', '1', 'admin', 'admin_url', 'admin/sticker/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('379', '1', 'admin', 'admin_url', 'admin/sticker/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('380', '1', 'admin', 'admin_url', 'admin/sticker/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('381', '1', 'admin', 'admin_url', 'admin/sticker/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('382', '1', 'admin', 'admin_url', 'admin/sticker/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('383', '1', 'admin', 'admin_url', 'admin/Dynamic/default', '', '动态管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('384', '1', 'admin', 'admin_url', 'admin/Dynamic/index', 'isdel=0&status=1', '审核通过', '');
INSERT INTO `cmf_auth_rule` VALUES ('385', '1', 'admin', 'admin_url', 'admin/Dynamic/wait', 'isdel=0&status=0', '等待审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('386', '1', 'admin', 'admin_url', 'admin/Dynamic/nopass', 'isdel=0&status=-1', '未通过', '');
INSERT INTO `cmf_auth_rule` VALUES ('387', '1', 'admin', 'admin_url', 'admin/Dynamic/lower', 'isdel=1', '下架列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('388', '1', 'admin', 'admin_url', 'admin/Dynamicrepotcat/index', '', '举报类型', '');
INSERT INTO `cmf_auth_rule` VALUES ('389', '1', 'admin', 'admin_url', 'admin/Dynamicrepotcat/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('390', '1', 'admin', 'admin_url', 'admin/Dynamicrepotcat/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('391', '1', 'admin', 'admin_url', 'admin/Dynamicrepotcat/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('392', '1', 'admin', 'admin_url', 'admin/Dynamicrepotcat/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('393', '1', 'admin', 'admin_url', 'admin/Dynamicrepotcat/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('394', '1', 'admin', 'admin_url', 'admin/Dynamicrepotcat/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('395', '1', 'admin', 'admin_url', 'admin/Dynamicrepot/index', '', '举报列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('396', '1', 'admin', 'admin_url', 'admin/Dynamicrepot/setstatus', '', '处理', '');
INSERT INTO `cmf_auth_rule` VALUES ('397', '1', 'admin', 'admin_url', 'admin/Dynamicrepot/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('398', '1', 'admin', 'admin_url', 'admin/Dynamiccom/index', '', '评论列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('399', '1', 'admin', 'admin_url', 'admin/Dynamiccom/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('400', '1', 'admin', 'admin_url', 'admin/video/wait', 'isdel=0&status=0&is_draft=0', '待审核列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('401', '1', 'admin', 'admin_url', 'admin/video/nopass', 'isdel=0&status=2', '未通过列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('402', '1', 'admin', 'admin_url', 'admin/video/lower', 'isdel=1', '下架列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('403', '1', 'admin', 'admin_url', 'admin/dynamic/setstatus', '', '审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('404', '1', 'admin', 'admin_url', 'admin/dynamic/see', '', '查看', '');
INSERT INTO `cmf_auth_rule` VALUES ('405', '1', 'admin', 'admin_url', 'admin/dynamic/setdel', '', '上下架', '');
INSERT INTO `cmf_auth_rule` VALUES ('406', '1', 'admin', 'admin_url', 'admin/dynamic/setrecom', '', '设置推荐值', '');
INSERT INTO `cmf_auth_rule` VALUES ('407', '1', 'admin', 'admin_url', 'admin/Dynamic/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('408', '1', 'admin', 'admin_url', 'admin/game/index', '', '游戏记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('409', '1', 'admin', 'admin_url', 'admin/game/index2', '', 'x详情', '');
INSERT INTO `cmf_auth_rule` VALUES ('410', '1', 'user', 'admin_url', 'user/AdminIndex/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('411', '1', 'user', 'admin_url', 'user/AdminIndex/addPost', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('412', '1', 'user', 'admin_url', 'user/AdminIndex/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('413', '1', 'user', 'admin_url', 'user/AdminIndex/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('414', '1', 'user', 'admin_url', 'user/AdminIndex/setban', '', '禁用时间', '');
INSERT INTO `cmf_auth_rule` VALUES ('415', '1', 'user', 'admin_url', 'user/AdminIndex/setsuper', '', '设置、取消超管', '');
INSERT INTO `cmf_auth_rule` VALUES ('416', '1', 'user', 'admin_url', 'user/AdminIndex/sethot', '', '设置取消热门', '');
INSERT INTO `cmf_auth_rule` VALUES ('417', '1', 'user', 'admin_url', 'user/AdminIndex/setrecommend', '', '设置取消推荐', '');
INSERT INTO `cmf_auth_rule` VALUES ('418', '1', 'user', 'admin_url', 'user/AdminIndex/setzombie', '', '开启关闭僵尸粉', '');
INSERT INTO `cmf_auth_rule` VALUES ('419', '1', 'user', 'admin_url', 'user/AdminIndex/setzombiep', '', '设置取消为僵尸粉', '');
INSERT INTO `cmf_auth_rule` VALUES ('420', '1', 'user', 'admin_url', 'user/adminIndex/setzombiepall', '', '批量设置/取消为僵尸粉', '');
INSERT INTO `cmf_auth_rule` VALUES ('421', '1', 'user', 'admin_url', 'user/adminIndex/setzombieall', '', '一键开启/关闭僵尸粉', '');
INSERT INTO `cmf_auth_rule` VALUES ('422', '1', 'Admin', 'admin_url', 'Admin/Goodsclass/index', '', '商品分类列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('423', '1', 'Admin', 'admin_url', 'Admin/Goodsclass/add', '', '商品分类添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('424', '1', 'Admin', 'admin_url', 'Admin/Buyeraddress/index', '', '收货地址管理', '');
INSERT INTO `cmf_auth_rule` VALUES ('425', '1', 'Admin', 'admin_url', 'Admin/Express/index', '', '物流公司列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('426', '1', 'Admin', 'admin_url', 'Admin/Express/add', '', '物流公司添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('427', '1', 'Admin', 'admin_url', 'Admin/Express/add_post', '', '物流公司添加保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('428', '1', 'Admin', 'admin_url', 'Admin/Express/edit', '', '物流公司编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('429', '1', 'Admin', 'admin_url', 'Admin/Express/edit_post', '', '物流公司编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('430', '1', 'Admin', 'admin_url', 'Admin/Express/del', '', '物流公司删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('431', '1', 'Admin', 'admin_url', 'Admin/Express/listOrder', '', '物流公司排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('432', '1', 'Admin', 'admin_url', 'Admin/Express/changeStatus', '', '物流公司显示/隐藏', '');
INSERT INTO `cmf_auth_rule` VALUES ('433', '1', 'Admin', 'admin_url', 'Admin/Refundreason/index', '', '买家申请退款原因', '');
INSERT INTO `cmf_auth_rule` VALUES ('434', '1', 'Admin', 'admin_url', 'Admin/Refundreason/add', '', '添加退款原因', '');
INSERT INTO `cmf_auth_rule` VALUES ('435', '1', 'Admin', 'admin_url', 'Admin/Refundreason/add_post', '', '添加保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('436', '1', 'Admin', 'admin_url', 'Admin/Refundreason/edit', '', '编辑退款原因', '');
INSERT INTO `cmf_auth_rule` VALUES ('437', '1', 'Admin', 'admin_url', 'Admin/Refundreason/edit_post', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('438', '1', 'Admin', 'admin_url', 'Admin/Refundreason/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('439', '1', 'Admin', 'admin_url', 'Admin/Refundreason/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('440', '1', 'Admin', 'admin_url', 'Admin/Refusereason/index', '', '卖家拒绝退款原因', '');
INSERT INTO `cmf_auth_rule` VALUES ('441', '1', 'Admin', 'admin_url', 'Admin/Platformreason/index', '', '退款平台介入原因', '');
INSERT INTO `cmf_auth_rule` VALUES ('442', '1', 'Admin', 'admin_url', 'Admin/Goodsorder/index', '', '商品订单列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('443', '1', 'Admin', 'admin_url', 'Admin/Refundlist/index', '', '退款列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('444', '1', 'Admin', 'admin_url', 'Admin/Shopcash/index', '', '提现记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('445', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/default', '', '付费内容', '');
INSERT INTO `cmf_auth_rule` VALUES ('446', '1', 'Admin', 'admin_url', 'Admin/Refusereason/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('447', '1', 'Admin', 'admin_url', 'Admin/Refusereason/add_post', '', '添加保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('448', '1', 'Admin', 'admin_url', 'Admin/Refusereason/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('449', '1', 'Admin', 'admin_url', 'Admin/Refusereason/edit_post', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('450', '1', 'Admin', 'admin_url', 'Admin/Refusereason/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('451', '1', 'Admin', 'admin_url', 'Admin/Refusereason/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('452', '1', 'Admin', 'admin_url', 'Admin/Platformreason/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('453', '1', 'Admin', 'admin_url', 'Admin/Platformreason/add_post', '', '添加保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('454', '1', 'Admin', 'admin_url', 'Admin/Platformreason/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('455', '1', 'Admin', 'admin_url', 'Admin/Platformreason/edit_post', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('456', '1', 'Admin', 'admin_url', 'Admin/Platformreason/listOrder', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('457', '1', 'Admin', 'admin_url', 'Admin/Platformreason/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('458', '1', 'Admin', 'admin_url', 'Admin/Goodsorder/info', '', '订单详情', '');
INSERT INTO `cmf_auth_rule` VALUES ('459', '1', 'Admin', 'admin_url', 'Admin/Refundlist/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('460', '1', 'Admin', 'admin_url', 'Admin/Refundlist/edit_post', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('461', '1', 'Admin', 'admin_url', 'Admin/Shopcash/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('462', '1', 'Admin', 'admin_url', 'Admin/Shopcash/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('463', '1', 'Admin', 'admin_url', 'Admin/Shopcash/export', '', '导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('464', '1', 'Admin', 'admin_url', 'Admin/Paidprogramclass/classlist', '', '付费内容分类列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('465', '1', 'Admin', 'admin_url', 'Admin/Paidprogramclass/class_add', '', '添加付费内容分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('466', '1', 'Admin', 'admin_url', 'Admin/Paidprogramclass/class_add_post', '', '添加保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('467', '1', 'Admin', 'admin_url', 'Admin/Paidprogramclass/class_edit', '', '编辑付费内容分类', '');
INSERT INTO `cmf_auth_rule` VALUES ('468', '1', 'Admin', 'admin_url', 'Admin/Paidprogramclass/class_edit_post', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('469', '1', 'Admin', 'admin_url', 'Admin/Paidprogramclass/class_del', '', '付费内容分类删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('470', '1', 'Admin', 'admin_url', 'Admin/Paidprogramclass/listOrder', '', '付费内容分类排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('471', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/index', '', '付费内容列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('472', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/applylist', '', '付费内容申请列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('473', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/orderlist', '', '付费内容订单', '');
INSERT INTO `cmf_auth_rule` VALUES ('474', '1', 'Admin', 'admin_url', 'Admin/Goodsclass/addPost', '', '商品分类添加保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('475', '1', 'Admin', 'admin_url', 'Admin/Shopgoods/edit', '', '商品审核/详情', '');
INSERT INTO `cmf_auth_rule` VALUES ('476', '1', 'Admin', 'admin_url', 'Admin/Shopgoods/editPost', '', '商品审核提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('477', '1', 'Admin', 'admin_url', 'Admin/Goodsclass/edit', '', '商品分类编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('478', '1', 'Admin', 'admin_url', 'Admin/Goodsclass/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('479', '1', 'Admin', 'admin_url', 'Admin/Goodsclass/del', '', '商品分类删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('480', '1', 'Admin', 'admin_url', 'Admin/Buyeraddress/del', '', '收货地址删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('481', '1', 'Admin', 'admin_url', 'Admin/Shopgoods/commentlist', '', '评价列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('482', '1', 'Admin', 'admin_url', 'Admin/Shopgoods/delComment', '', '删除评价', '');
INSERT INTO `cmf_auth_rule` VALUES ('483', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/edit', '', '编辑付费内容', '');
INSERT INTO `cmf_auth_rule` VALUES ('484', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/edit_post', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('485', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/del', '', '删除付费内容', '');
INSERT INTO `cmf_auth_rule` VALUES ('486', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/videoplay', '', '付费内容观看', '');
INSERT INTO `cmf_auth_rule` VALUES ('487', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/apply_edit', '', '编辑付费内容申请', '');
INSERT INTO `cmf_auth_rule` VALUES ('488', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/apply_edit_post', '', '付费内容申请编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('489', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/apply_del', '', '删除付费内容申请', '');
INSERT INTO `cmf_auth_rule` VALUES ('490', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/setPay', '', '确认支付', '');
INSERT INTO `cmf_auth_rule` VALUES ('491', '1', 'Admin', 'admin_url', 'Admin/Paidprogram/export', '', '导出付费内容订单', '');
INSERT INTO `cmf_auth_rule` VALUES ('492', '1', 'Admin', 'admin_url', 'Admin/Video/draft', 'is_draft=1', '草稿视频列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('493', '1', 'Admin', 'admin_url', 'Admin/Balance/index', '', '余额手动充值', '');
INSERT INTO `cmf_auth_rule` VALUES ('494', '1', 'Admin', 'admin_url', 'Admin/Balance/add', '', '充值添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('495', '1', 'Admin', 'admin_url', 'Admin/Balance/addPost', '', '余额充值保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('496', '1', 'Admin', 'admin_url', 'Admin/Balance/export', '', '余额充值记录导出', '');
INSERT INTO `cmf_auth_rule` VALUES ('497', '1', 'admin', 'admin_url', 'admin/goodsgroup/index', '', '拼团列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('498', '1', 'admin', 'admin_url', 'admin/familyuser/divideapply', '', '分成申请列表', '');
INSERT INTO `cmf_auth_rule` VALUES ('499', '1', 'admin', 'admin_url', 'admin/familyuser/applyedit', '', '审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('500', '1', 'admin', 'admin_url', 'admin/familyuser/applyeditPost', '', '审核提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('501', '1', 'admin', 'admin_url', 'admin/familyuser/delapply', '', '删除审核', '');
INSERT INTO `cmf_auth_rule` VALUES ('502', '1', 'admin', 'admin_url', 'admin/Scorerecord/index', '', '积分记录', '');
INSERT INTO `cmf_auth_rule` VALUES ('503', '1', 'admin', 'admin_url', 'admin/Dynamiclabel/index', '', '话题标签', '');
INSERT INTO `cmf_auth_rule` VALUES ('504', '1', 'admin', 'admin_url', 'admin/Dynamiclabel/add', '', '添加', '');
INSERT INTO `cmf_auth_rule` VALUES ('505', '1', 'admin', 'admin_url', 'admin/Dynamiclabel/add_post', '', '添加提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('506', '1', 'admin', 'admin_url', 'admin/Dynamiclabel/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('507', '1', 'admin', 'admin_url', 'admin/Dynamiclabel/edit_post', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('508', '1', 'admin', 'admin_url', 'admin/Dynamiclabel/listsorders', '', '排序', '');
INSERT INTO `cmf_auth_rule` VALUES ('509', '1', 'admin', 'admin_url', 'admin/Dynamiclabel/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('510', '1', 'user', 'admin_url', 'user/AdminIndex/del', '', '本站用户删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('511', '1', 'Admin', 'admin_url', 'Admin/Shopcategory/index', '', '经营类目申请', '');
INSERT INTO `cmf_auth_rule` VALUES ('512', '1', 'admin', 'admin_url', 'admin/Shopcategory/edit', '', '编辑', '');
INSERT INTO `cmf_auth_rule` VALUES ('513', '1', 'admin', 'admin_url', 'admin/Shopcategory/editPost', '', '编辑提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('514', '1', 'admin', 'admin_url', 'admin/Shopcategory/del', '', '删除', '');
INSERT INTO `cmf_auth_rule` VALUES ('515', '1', 'admin', 'admin_url', 'admin/shopapply/platformedit', '', '平台自营店铺信息', '');
INSERT INTO `cmf_auth_rule` VALUES ('516', '1', 'admin', 'admin_url', 'admin/shopapply/platformeditPost', '', '平台自营店铺提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('517', '1', 'admin', 'admin_url', 'admin/shopgoods/add', '', '添加商品', '');
INSERT INTO `cmf_auth_rule` VALUES ('518', '1', 'admin', 'admin_url', 'admin/shopgoods/addpost', '', '商品添加保存', '');
INSERT INTO `cmf_auth_rule` VALUES ('519', '1', 'admin', 'admin_url', 'admin/goodsorder/setexpress', '', '填写物流', '');
INSERT INTO `cmf_auth_rule` VALUES ('520', '1', 'admin', 'admin_url', 'admin/goodsorder/setexpresspost', '', '填写物流提交', '');
INSERT INTO `cmf_auth_rule` VALUES ('521', '1', 'admin', 'admin_url', 'admin/refundlist/platformedit', '', '平台自营处理退款', '');
INSERT INTO `cmf_auth_rule` VALUES ('522', '1', 'admin', 'admin_url', 'admin/refundlist/platformedit_post', '', '平台自营商品退款提交', '');

-- ----------------------------
-- Table structure for `cmf_backpack`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_backpack`;
CREATE TABLE `cmf_backpack` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `giftid` int(11) NOT NULL DEFAULT '0' COMMENT '礼物ID',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_backpack
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_balance_charge_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_balance_charge_admin`;
CREATE TABLE `cmf_balance_charge_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '充值对象ID',
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_balance_charge_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_car`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car`;
CREATE TABLE `cmf_car` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '名称',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `swf` varchar(255) NOT NULL DEFAULT '' COMMENT '动画链接',
  `swftime` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '动画时长',
  `needcoin` int(20) NOT NULL DEFAULT '0' COMMENT '价格',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分价格',
  `list_order` int(10) NOT NULL DEFAULT '9999' COMMENT '序号',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `words` varchar(255) NOT NULL DEFAULT '' COMMENT '进场话术',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_car
-- ----------------------------
INSERT INTO `cmf_car` VALUES ('1', '小乌龟', 'car_1.png', 'car_gif_1.gif', '4.00', '100', '100', '3', '1500455416', '骑着小乌龟进场了', '0');
INSERT INTO `cmf_car` VALUES ('2', '小毛驴', 'car_2.png', 'car_gif_2.gif', '4.01', '200', '20', '1', '1500455559', '骑着小毛驴进场了', '0');
INSERT INTO `cmf_car` VALUES ('5', '魔法扫把', 'car_5.png', 'car_gif_5.gif', '4.00', '300', '300', '2', '1501585432', '骑着魔法扫把进场了', '0');

-- ----------------------------
-- Table structure for `cmf_car_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_car_user`;
CREATE TABLE `cmf_car_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `carid` int(11) NOT NULL DEFAULT '0' COMMENT '坐骑ID',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否启用',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_car_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_cash_account`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_cash_account`;
CREATE TABLE `cmf_cash_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型，1表示支付宝，2表示微信，3表示银行卡',
  `account_bank` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '账号',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_cash_account
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_cash_record`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_cash_record`;
CREATE TABLE `cmf_cash_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `votes` int(20) NOT NULL DEFAULT '0' COMMENT '提现映票数',
  `orderno` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `trade_no` varchar(100) NOT NULL DEFAULT '' COMMENT '三方订单号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0审核中，1审核通过，2审核拒绝',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '账号类型',
  `account_bank` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称',
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '帐号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_cash_record
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_charge_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_charge_admin`;
CREATE TABLE `cmf_charge_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '充值对象ID',
  `coin` int(20) NOT NULL DEFAULT '0' COMMENT '钻石数',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_charge_admin
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_charge_rules`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_charge_rules`;
CREATE TABLE `cmf_charge_rules` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '钻石数',
  `coin_ios` int(11) NOT NULL DEFAULT '0' COMMENT '苹果钻石数',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '安卓金额',
  `product_id` varchar(50) NOT NULL DEFAULT '' COMMENT '苹果项目ID',
  `give` int(11) NOT NULL DEFAULT '0' COMMENT '赠送钻石数',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `coin_paypal` int(11) NOT NULL DEFAULT '0' COMMENT 'paypal支付钻石数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_charge_rules
-- ----------------------------
INSERT INTO `cmf_charge_rules` VALUES ('1', '1000钻石', '999999', '40', '0.01', 'coin_600', '0', '0', '1484984685', '55');
INSERT INTO `cmf_charge_rules` VALUES ('2', '3000钻石', '3000', '2100', '30.00', 'coin_3000', '0', '1', '1484985389', '300');
INSERT INTO `cmf_charge_rules` VALUES ('3', '9800钻石', '9800', '9800', '98.00', 'coin_9800', '200', '2', '1484985412', '980');
INSERT INTO `cmf_charge_rules` VALUES ('4', '38800钻石', '38800', '38800', '388.00', 'coin_38800', '500', '3', '1484985445', '3880');
INSERT INTO `cmf_charge_rules` VALUES ('5', '58800钻石', '58800', '58800', '588.00', 'coin_58800', '1200', '4', '1484985458', '5880');

-- ----------------------------
-- Table structure for `cmf_charge_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_charge_user`;
CREATE TABLE `cmf_charge_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '充值对象ID',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '钻石数',
  `coin_give` int(11) NOT NULL DEFAULT '0' COMMENT '赠送钻石数',
  `orderno` varchar(50) NOT NULL DEFAULT '' COMMENT '商家订单号',
  `trade_no` varchar(100) NOT NULL DEFAULT '' COMMENT '三方平台订单号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付类型 1支付宝 2 微信支付 3 苹果支付 4 微信小程序 5 paypal 6 braintree_paypal',
  `ambient` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支付环境',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_charge_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_dynamic`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_dynamic`;
CREATE TABLE `cmf_dynamic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(255) DEFAULT '' COMMENT '标题',
  `thumb` text COMMENT '图片地址：多张图片用分号隔开',
  `video_thumb` varchar(255) DEFAULT '' COMMENT '视频封面',
  `href` varchar(255) DEFAULT '' COMMENT '视频地址',
  `voice` varchar(255) DEFAULT '' COMMENT '语音链接',
  `length` int(11) DEFAULT '0' COMMENT '语音时长',
  `likes` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `type` int(10) NOT NULL DEFAULT '0' COMMENT '动态类型：0：纯文字；1：文字+图片；2：文字+视频；3：文字+语音',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1删除（下架）0不下架',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '视频状态 0未审核 1通过 2拒绝',
  `uptime` int(12) DEFAULT '0' COMMENT '审核不通过时间（第一次审核不通过时更改此值，用于判断是否发送极光IM）',
  `xiajia_reason` varchar(255) DEFAULT '' COMMENT '下架原因',
  `lat` varchar(255) DEFAULT '' COMMENT '维度',
  `lng` varchar(255) DEFAULT '' COMMENT '经度',
  `city` varchar(255) DEFAULT '' COMMENT '城市',
  `address` varchar(255) DEFAULT '' COMMENT '详细地理位置',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `fail_reason` varchar(255) DEFAULT '' COMMENT '审核原因',
  `show_val` int(12) NOT NULL DEFAULT '0' COMMENT '曝光值',
  `recommend_val` int(20) DEFAULT '0' COMMENT '推荐值',
  `labelid` int(11) NOT NULL DEFAULT '0' COMMENT '标签ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_dynamic
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_dynamic_comments`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_dynamic_comments`;
CREATE TABLE `cmf_dynamic_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '评论用户ID',
  `touid` int(10) NOT NULL DEFAULT '0' COMMENT '被评论用户ID',
  `dynamicid` int(10) NOT NULL DEFAULT '0' COMMENT '动态ID',
  `commentid` int(10) NOT NULL DEFAULT '0' COMMENT '评论iD',
  `parentid` int(10) NOT NULL DEFAULT '0' COMMENT '上级评论ID',
  `content` text NOT NULL COMMENT '评论内容',
  `likes` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型，0文字1语音',
  `voice` varchar(255) NOT NULL DEFAULT '' COMMENT '语音链接',
  `length` int(11) NOT NULL DEFAULT '0' COMMENT '时长',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_dynamic_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_dynamic_comments_like`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_dynamic_comments_like`;
CREATE TABLE `cmf_dynamic_comments_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '点赞用户ID',
  `commentid` int(10) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `touid` int(12) NOT NULL DEFAULT '0' COMMENT '被喜欢的评论者id',
  `dynamicid` int(12) NOT NULL DEFAULT '0' COMMENT '评论所属动态id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_dynamic_comments_like
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_dynamic_label`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_dynamic_label`;
CREATE TABLE `cmf_dynamic_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `orderno` int(11) NOT NULL DEFAULT '10000' COMMENT '序号',
  `isrecommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐 0否  1是',
  `use_nums` int(11) NOT NULL DEFAULT '0' COMMENT '使用次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_dynamic_label
-- ----------------------------
INSERT INTO `cmf_dynamic_label` VALUES ('1', '如何快速搭建直播平台', 'dynamic_label_1.png', '10', '0', '26');
INSERT INTO `cmf_dynamic_label` VALUES ('3', '中国的领土一寸也不能丢', 'dynamic_label_3.png', '3', '0', '7');
INSERT INTO `cmf_dynamic_label` VALUES ('4', '蜘蛛倒挂睡觉不会掉下来吗', 'dynamic_label_4.png', '4', '0', '2');
INSERT INTO `cmf_dynamic_label` VALUES ('5', '三星堆遗址再次启动发掘', 'dynamic_label_5.png', '2', '0', '1');
INSERT INTO `cmf_dynamic_label` VALUES ('6', '好人好事图鉴', 'dynamic_label_6.png', '5', '1', '8');
INSERT INTO `cmf_dynamic_label` VALUES ('7', '致敬教育的燃灯者', 'dynamic_label_7.png', '6', '1', '4');
INSERT INTO `cmf_dynamic_label` VALUES ('8', '身边的美食鉴赏', 'dynamic_label_8.png', '7', '1', '1');
INSERT INTO `cmf_dynamic_label` VALUES ('9', '人人公益节', 'dynamic_label_9.png', '8', '1', '1');
INSERT INTO `cmf_dynamic_label` VALUES ('10', '如何看待综艺恶意剪辑', 'dynamic_label_10.png', '9', '1', '3');

-- ----------------------------
-- Table structure for `cmf_dynamic_like`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_dynamic_like`;
CREATE TABLE `cmf_dynamic_like` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '点赞用户',
  `dynamicid` int(10) NOT NULL DEFAULT '0' COMMENT '动态id',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '点赞时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '动态是否被删除或被拒绝 0被删除或被拒绝 1 正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_dynamic_like
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_dynamic_report`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_dynamic_report`;
CREATE TABLE `cmf_dynamic_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '举报用户ID',
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '被举报用户ID',
  `dynamicid` int(11) NOT NULL DEFAULT '0' COMMENT '动态ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '举报内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0处理中 1已处理  2审核失败',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `dynamic_type` int(10) NOT NULL DEFAULT '0' COMMENT '动态类型：0：纯文字；1：文字+图片‘；2：视频+图片；3：语音+图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_dynamic_report
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_dynamic_report_classify`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_dynamic_report_classify`;
CREATE TABLE `cmf_dynamic_report_classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` int(10) NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '举报类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_dynamic_report_classify
-- ----------------------------
INSERT INTO `cmf_dynamic_report_classify` VALUES ('1', '1', '低俗色情');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('2', '2', '侮辱谩骂');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('3', '3', '盗用他人作品');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('4', '4', '骗取点击');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('5', '5', '其他');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('6', '10000', '垃圾广告');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('7', '10000', '用户为未成年');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('8', '10000', '任性打抱不平，就爱举报	');
INSERT INTO `cmf_dynamic_report_classify` VALUES ('9', '10000', '引人不适	');

-- ----------------------------
-- Table structure for `cmf_family`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_family`;
CREATE TABLE `cmf_family` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '家族名称',
  `badge` varchar(255) NOT NULL DEFAULT '' COMMENT '家族图标',
  `apply_pos` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证正面',
  `apply_side` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证背面',
  `briefing` text COMMENT '简介',
  `carded` varchar(255) NOT NULL DEFAULT '' COMMENT '证件号',
  `fullname` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '申请状态 0未审核 1 审核失败 2 审核通过 3',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `disable` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否禁用',
  `divide_family` int(11) NOT NULL DEFAULT '0' COMMENT '分成比例',
  `istip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否需要通知',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_family
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_family_profit`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_family_profit`;
CREATE TABLE `cmf_family_profit` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '主播ID',
  `familyid` int(11) NOT NULL DEFAULT '0' COMMENT '家族ID',
  `time` varchar(50) NOT NULL DEFAULT '' COMMENT '格式化日期',
  `profit_anthor` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '主播收益',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '总收益',
  `profit` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '家族收益',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_family_profit
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_family_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_family_user`;
CREATE TABLE `cmf_family_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `familyid` int(11) NOT NULL DEFAULT '0' COMMENT '家族ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '原因',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `signout` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退出',
  `istip` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核后是否需要通知',
  `signout_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '踢出或拒绝理由',
  `signout_istip` tinyint(4) NOT NULL DEFAULT '0' COMMENT '踢出或拒绝是否需要通知',
  `divide_family` int(11) NOT NULL DEFAULT '-1' COMMENT '家族分成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_family_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_family_user_divide_apply`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_family_user_divide_apply`;
CREATE TABLE `cmf_family_user_divide_apply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `familyid` int(11) NOT NULL DEFAULT '0' COMMENT '家族id',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '处理状态 0 等待审核 1 同意 -1 拒绝',
  `divide` int(11) NOT NULL DEFAULT '0' COMMENT '家族分成',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_family_user_divide_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_feedback`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_feedback`;
CREATE TABLE `cmf_feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `version` varchar(50) NOT NULL DEFAULT '' COMMENT '系统版本号',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '设备',
  `content` text NOT NULL COMMENT '内容',
  `addtime` int(11) NOT NULL COMMENT '提交时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_game`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_game`;
CREATE TABLE `cmf_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` tinyint(1) DEFAULT '0' COMMENT '游戏名称',
  `liveuid` int(11) DEFAULT '0' COMMENT '主播ID',
  `bankerid` int(11) DEFAULT '0' COMMENT '庄家ID，0表示平台',
  `stream` varchar(255) DEFAULT '' COMMENT '直播流名',
  `starttime` int(11) DEFAULT '0' COMMENT '本次游戏开始时间',
  `endtime` int(11) DEFAULT '0' COMMENT '游戏结束时间',
  `result` varchar(255) DEFAULT '0' COMMENT '本轮游戏结果',
  `state` tinyint(1) DEFAULT '0' COMMENT '当前游戏状态（0是进行中，1是正常结束，2是 主播关闭 3意外结束）',
  `banker_profit` int(11) DEFAULT '0' COMMENT '庄家收益',
  `banker_card` varchar(50) DEFAULT '' COMMENT '庄家牌型',
  `isintervene` tinyint(1) DEFAULT '0' COMMENT '是否进行系统干预',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_game
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_gamerecord`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gamerecord`;
CREATE TABLE `cmf_gamerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action` tinyint(1) DEFAULT '0' COMMENT '游戏类型',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `liveuid` int(11) DEFAULT '0' COMMENT '主播ID',
  `gameid` int(11) DEFAULT '0' COMMENT '游戏ID',
  `coin_1` int(11) DEFAULT '0' COMMENT '1位置下注金额',
  `coin_2` int(11) DEFAULT '0' COMMENT '2位置下注金额',
  `coin_3` int(11) DEFAULT '0' COMMENT '3位置下注金额',
  `coin_4` int(11) DEFAULT '0' COMMENT '4位置下注金额',
  `coin_5` int(11) DEFAULT '0' COMMENT '5位置下注金额',
  `coin_6` int(11) DEFAULT '0' COMMENT '6位置下注金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '处理状态 0 未处理 1 已处理',
  `addtime` int(11) DEFAULT '0' COMMENT '下注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_gamerecord
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_getcode_limit_ip`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_getcode_limit_ip`;
CREATE TABLE `cmf_getcode_limit_ip` (
  `ip` bigint(20) NOT NULL COMMENT 'ip地址',
  `date` varchar(30) NOT NULL DEFAULT '' COMMENT '时间',
  `times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '次数',
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_getcode_limit_ip
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_gift`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gift`;
CREATE TABLE `cmf_gift` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mark` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标识，0普通，1热门，2守护',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '类型,0普通礼物，1豪华礼物，2贴纸礼物，3手绘礼物',
  `sid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `giftname` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `needcoin` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `gifticon` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `list_order` int(3) NOT NULL DEFAULT '9999' COMMENT '序号',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `swftype` tinyint(1) NOT NULL DEFAULT '0' COMMENT '动画类型，0gif,1svga',
  `swf` varchar(255) NOT NULL DEFAULT '' COMMENT '动画链接',
  `swftime` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '动画时长',
  `isplatgift` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全站礼物：0：否；1：是',
  `sticker_id` int(11) NOT NULL DEFAULT '0' COMMENT '贴纸ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_gift
-- ----------------------------
INSERT INTO `cmf_gift` VALUES ('1', '2', '1', '0', '爱神丘比特', '5000', 'gift_1.png', '9999', '1578386860', '1', 'gift_gif_1.svga', '6.30', '1', '0');
INSERT INTO `cmf_gift` VALUES ('2', '0', '1', '0', '爱心飞机', '2000', 'gift_2.png', '9999', '1578386860', '1', 'gift_gif_2.svga', '7.50', '1', '0');
INSERT INTO `cmf_gift` VALUES ('3', '0', '1', '0', '告白气球', '1000', 'gift_3.png', '9999', '1578386860', '1', 'gift_gif_3.svga', '4.10', '1', '0');
INSERT INTO `cmf_gift` VALUES ('4', '0', '1', '0', '流星雨', '10000', 'gift_4.png', '9999', '1578386860', '1', 'gift_gif_4.svga', '6.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('5', '0', '1', '0', '玫瑰花束', '500', 'gift_5.png', '9999', '1578386860', '1', 'gift_gif_5.svga', '4.10', '1', '0');
INSERT INTO `cmf_gift` VALUES ('6', '2', '1', '0', '梦幻城堡', '20000', 'gift_6.png', '9999', '1578386860', '1', 'gift_gif_6.svga', '7.60', '1', '0');
INSERT INTO `cmf_gift` VALUES ('7', '0', '1', '0', '跑车', '300', 'gift_7.png', '9999', '1578386860', '1', 'gift_gif_7.svga', '3.50', '1', '0');
INSERT INTO `cmf_gift` VALUES ('8', '1', '1', '0', '鹊桥相会', '100', 'gift_8.png', '9999', '1578386860', '1', 'gift_gif_8.svga', '7.50', '0', '0');
INSERT INTO `cmf_gift` VALUES ('9', '0', '1', '0', '旋转木马', '500', 'gift_9.png', '9999', '1578386860', '1', 'gift_gif_9.svga', '5.00', '1', '0');
INSERT INTO `cmf_gift` VALUES ('10', '0', '1', '0', '游轮', '1000', 'gift_10.png', '9999', '1578386860', '1', 'gift_gif_10.svga', '4.90', '0', '0');
INSERT INTO `cmf_gift` VALUES ('11', '0', '0', '0', '红包', '50', 'gift_11.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('12', '0', '0', '0', '棒棒糖', '5', 'gift_12.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('13', '0', '0', '0', '爱心大炮', '300', 'gift_13.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('14', '0', '0', '0', '冰淇淋', '50', 'gift_14.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('15', '0', '0', '0', '粉丝牌', '100', 'gift_15.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('16', '0', '0', '0', '干杯', '10', 'gift_16.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('17', '2', '0', '0', '皇冠', '150', 'gift_17.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('18', '0', '0', '0', '金话筒', '130', 'gift_18.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('19', '0', '3', '0', '蓝色妖姬', '10', 'gift_19.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('20', '3', '0', '0', '魔法棒', '10', 'gift_20.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('21', '1', '0', '0', '吃药啦', '1', 'gift_21.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('22', '0', '0', '0', '666', '2', 'gift_22.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('23', '2', '0', '0', '水晶球', '23', 'gift_23.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('24', '0', '3', '0', '甜心巧克力', '24', 'gift_24.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('25', '3', '0', '0', '炸翻全场', '25', 'gift_25.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('26', '0', '0', '0', '樱花奶茶', '26', 'gift_26.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('27', '1', '0', '0', '大金砖', '27', 'gift_27.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('28', '3', '0', '0', '掌声鼓励', '1', 'gift_28.png', '9999', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('29', '0', '2', '0', '狗狗眼镜', '1000', 'face_036.png', '4', '1578386860', '0', '', '4.00', '0', '1');
INSERT INTO `cmf_gift` VALUES ('30', '0', '2', '0', '雪茄墨镜', '2000', 'face_037.png', '3', '1578386860', '0', '', '3.00', '0', '2');
INSERT INTO `cmf_gift` VALUES ('62', '0', '0', '0', '甜甜圈', '10', 'gift_33.png', '1', '1516002459', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('74', '0', '3', '0', '红唇', '10', 'gift_32.png', '2', '1578386860', '0', '', '0.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('75', '0', '1', '0', '百变小丑', '1000', 'gift_29.png', '9999', '1578386860', '1', 'gift_gif_29.svga', '5.00', '0', '0');
INSERT INTO `cmf_gift` VALUES ('76', '0', '1', '0', '钞票枪', '500', 'gift_30.png', '9999', '1578386860', '1', 'gift_gif_30.svga', '2.90', '1', '0');
INSERT INTO `cmf_gift` VALUES ('77', '0', '1', '0', '星际火箭', '1000', 'gift_31.png', '3', '1578386860', '1', 'gift_gif_31.svga', '3.70', '1', '0');
INSERT INTO `cmf_gift` VALUES ('116', '0', '2', '0', '尖叫鸡', '3000', 'face_039.png', '2', '1584174130', '0', '', '2.90', '0', '3');
INSERT INTO `cmf_gift` VALUES ('117', '2', '2', '0', '蒙面美人', '3500', 'face_041.png', '1', '1584174130', '0', '', '4.10', '0', '4');
INSERT INTO `cmf_gift` VALUES ('118', '0', '2', '0', '独角兽', '4000', 'face_043.png', '0', '1584174130', '0', '', '2.40', '0', '5');
INSERT INTO `cmf_gift` VALUES ('119', '1', '1', '0', '520', '520', 'gift_34.png', '9999', '1590040626', '1', 'gift_gif_34.svga', '5.00', '0', '0');

-- ----------------------------
-- Table structure for `cmf_gift_luck_rate`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gift_luck_rate`;
CREATE TABLE `cmf_gift_luck_rate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `giftid` int(11) NOT NULL DEFAULT '0' COMMENT '礼物ID',
  `nums` int(10) unsigned NOT NULL COMMENT '数量',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '倍数',
  `rate` decimal(20,3) NOT NULL DEFAULT '0.000' COMMENT '中奖概率',
  `isall` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否全站，0否1是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_gift_luck_rate
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_gift_sort`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_gift_sort`;
CREATE TABLE `cmf_gift_sort` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `sortname` varchar(20) NOT NULL DEFAULT '' COMMENT '分类名',
  `orderno` int(3) NOT NULL DEFAULT '0' COMMENT '序号',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_gift_sort
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_guard`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guard`;
CREATE TABLE `cmf_guard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '守护名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '守护类型，1普通2尊贵',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `length_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '时长类型，0天，1月，2年',
  `length` int(11) NOT NULL DEFAULT '0' COMMENT '时长',
  `length_time` int(11) NOT NULL DEFAULT '0' COMMENT '时长秒数',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_guard
-- ----------------------------
INSERT INTO `cmf_guard` VALUES ('1', '7天体验', '1', '300', '0', '7', '604800', '1540862056', '1607305125', '888');
INSERT INTO `cmf_guard` VALUES ('2', '1个月', '1', '1000', '1', '1', '2592000', '1540862139', '1601005269', '888');
INSERT INTO `cmf_guard` VALUES ('3', '尊贵守护全年', '2', '12000', '2', '1', '31536000', '1540862377', '1546479176', '888');

-- ----------------------------
-- Table structure for `cmf_guard_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guard_user`;
CREATE TABLE `cmf_guard_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `liveuid` int(11) NOT NULL DEFAULT '0' COMMENT '主播ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '守护类型,1普通守护，2尊贵守护',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `liveuid_index` (`liveuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_guard_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_guide`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_guide`;
CREATE TABLE `cmf_guide` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片/视频链接',
  `href` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '跳转链接',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型',
  `list_order` int(11) NOT NULL DEFAULT '10000' COMMENT '序号',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_guide
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_hook`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook`;
CREATE TABLE `cmf_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子表';

-- ----------------------------
-- Records of cmf_hook
-- ----------------------------
INSERT INTO `cmf_hook` VALUES ('2', '1', '0', '应用开始', 'app_begin', 'cmf', '应用开始');
INSERT INTO `cmf_hook` VALUES ('3', '1', '0', '模块初始化', 'module_init', 'cmf', '模块初始化');
INSERT INTO `cmf_hook` VALUES ('4', '1', '0', '控制器开始', 'action_begin', 'cmf', '控制器开始');
INSERT INTO `cmf_hook` VALUES ('5', '1', '0', '视图输出过滤', 'view_filter', 'cmf', '视图输出过滤');
INSERT INTO `cmf_hook` VALUES ('6', '1', '0', '应用结束', 'app_end', 'cmf', '应用结束');
INSERT INTO `cmf_hook` VALUES ('7', '1', '0', '日志write方法', 'log_write', 'cmf', '日志write方法');
INSERT INTO `cmf_hook` VALUES ('8', '1', '0', '输出结束', 'response_end', 'cmf', '输出结束');
INSERT INTO `cmf_hook` VALUES ('9', '1', '0', '后台控制器初始化', 'admin_init', 'cmf', '后台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('10', '1', '0', '前台控制器初始化', 'home_init', 'cmf', '前台控制器初始化');
INSERT INTO `cmf_hook` VALUES ('11', '1', '1', '发送手机验证码', 'send_mobile_verification_code', 'cmf', '发送手机验证码');
INSERT INTO `cmf_hook` VALUES ('12', '3', '0', '模板 body标签开始', 'body_start', '', '模板 body标签开始');
INSERT INTO `cmf_hook` VALUES ('13', '3', '0', '模板 head标签结束前', 'before_head_end', '', '模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('14', '3', '0', '模板底部开始', 'footer_start', '', '模板底部开始');
INSERT INTO `cmf_hook` VALUES ('15', '3', '0', '模板底部开始之前', 'before_footer', '', '模板底部开始之前');
INSERT INTO `cmf_hook` VALUES ('16', '3', '0', '模板底部结束之前', 'before_footer_end', '', '模板底部结束之前');
INSERT INTO `cmf_hook` VALUES ('17', '3', '0', '模板 body 标签结束之前', 'before_body_end', '', '模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('18', '3', '0', '模板左边栏开始', 'left_sidebar_start', '', '模板左边栏开始');
INSERT INTO `cmf_hook` VALUES ('19', '3', '0', '模板左边栏结束之前', 'before_left_sidebar_end', '', '模板左边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('20', '3', '0', '模板右边栏开始', 'right_sidebar_start', '', '模板右边栏开始');
INSERT INTO `cmf_hook` VALUES ('21', '3', '0', '模板右边栏结束之前', 'before_right_sidebar_end', '', '模板右边栏结束之前');
INSERT INTO `cmf_hook` VALUES ('22', '3', '1', '评论区', 'comment', '', '评论区');
INSERT INTO `cmf_hook` VALUES ('23', '3', '1', '留言区', 'guestbook', '', '留言区');
INSERT INTO `cmf_hook` VALUES ('24', '2', '0', '后台首页仪表盘', 'admin_dashboard', 'admin', '后台首页仪表盘');
INSERT INTO `cmf_hook` VALUES ('25', '4', '0', '后台模板 head标签结束前', 'admin_before_head_end', '', '后台模板 head标签结束前');
INSERT INTO `cmf_hook` VALUES ('26', '4', '0', '后台模板 body 标签结束之前', 'admin_before_body_end', '', '后台模板 body 标签结束之前');
INSERT INTO `cmf_hook` VALUES ('27', '2', '0', '后台登录页面', 'admin_login', 'admin', '后台登录页面');
INSERT INTO `cmf_hook` VALUES ('28', '1', '1', '前台模板切换', 'switch_theme', 'cmf', '前台模板切换');
INSERT INTO `cmf_hook` VALUES ('29', '3', '0', '主要内容之后', 'after_content', '', '主要内容之后');
INSERT INTO `cmf_hook` VALUES ('32', '2', '1', '获取上传界面', 'fetch_upload_view', 'user', '获取上传界面');
INSERT INTO `cmf_hook` VALUES ('33', '3', '0', '主要内容之前', 'before_content', 'cmf', '主要内容之前');
INSERT INTO `cmf_hook` VALUES ('34', '1', '0', '日志写入完成', 'log_write_done', 'cmf', '日志写入完成');
INSERT INTO `cmf_hook` VALUES ('35', '1', '1', '后台模板切换', 'switch_admin_theme', 'cmf', '后台模板切换');
INSERT INTO `cmf_hook` VALUES ('36', '1', '1', '验证码图片', 'captcha_image', 'cmf', '验证码图片');
INSERT INTO `cmf_hook` VALUES ('37', '2', '1', '后台模板设计界面', 'admin_theme_design_view', 'admin', '后台模板设计界面');
INSERT INTO `cmf_hook` VALUES ('38', '2', '1', '后台设置网站信息界面', 'admin_setting_site_view', 'admin', '后台设置网站信息界面');
INSERT INTO `cmf_hook` VALUES ('39', '2', '1', '后台清除缓存界面', 'admin_setting_clear_cache_view', 'admin', '后台清除缓存界面');
INSERT INTO `cmf_hook` VALUES ('40', '2', '1', '后台导航管理界面', 'admin_nav_index_view', 'admin', '后台导航管理界面');
INSERT INTO `cmf_hook` VALUES ('41', '2', '1', '后台友情链接管理界面', 'admin_link_index_view', 'admin', '后台友情链接管理界面');
INSERT INTO `cmf_hook` VALUES ('42', '2', '1', '后台幻灯片管理界面', 'admin_slide_index_view', 'admin', '后台幻灯片管理界面');
INSERT INTO `cmf_hook` VALUES ('43', '2', '1', '后台管理员列表界面', 'admin_user_index_view', 'admin', '后台管理员列表界面');
INSERT INTO `cmf_hook` VALUES ('44', '2', '1', '后台角色管理界面', 'admin_rbac_index_view', 'admin', '后台角色管理界面');
INSERT INTO `cmf_hook` VALUES ('49', '2', '1', '用户管理本站用户列表界面', 'user_admin_index_view', 'user', '用户管理本站用户列表界面');
INSERT INTO `cmf_hook` VALUES ('50', '2', '1', '资源管理列表界面', 'user_admin_asset_index_view', 'user', '资源管理列表界面');
INSERT INTO `cmf_hook` VALUES ('51', '2', '1', '用户管理第三方用户列表界面', 'user_admin_oauth_index_view', 'user', '用户管理第三方用户列表界面');
INSERT INTO `cmf_hook` VALUES ('52', '2', '1', '后台首页界面', 'admin_index_index_view', 'admin', '后台首页界面');
INSERT INTO `cmf_hook` VALUES ('53', '2', '1', '后台回收站界面', 'admin_recycle_bin_index_view', 'admin', '后台回收站界面');
INSERT INTO `cmf_hook` VALUES ('54', '2', '1', '后台菜单管理界面', 'admin_menu_index_view', 'admin', '后台菜单管理界面');
INSERT INTO `cmf_hook` VALUES ('55', '2', '1', '后台自定义登录是否开启钩子', 'admin_custom_login_open', 'admin', '后台自定义登录是否开启钩子');
INSERT INTO `cmf_hook` VALUES ('64', '2', '1', '后台幻灯片页面列表界面', 'admin_slide_item_index_view', 'admin', '后台幻灯片页面列表界面');
INSERT INTO `cmf_hook` VALUES ('65', '2', '1', '后台幻灯片页面添加界面', 'admin_slide_item_add_view', 'admin', '后台幻灯片页面添加界面');
INSERT INTO `cmf_hook` VALUES ('66', '2', '1', '后台幻灯片页面编辑界面', 'admin_slide_item_edit_view', 'admin', '后台幻灯片页面编辑界面');
INSERT INTO `cmf_hook` VALUES ('67', '2', '1', '后台管理员添加界面', 'admin_user_add_view', 'admin', '后台管理员添加界面');
INSERT INTO `cmf_hook` VALUES ('68', '2', '1', '后台管理员编辑界面', 'admin_user_edit_view', 'admin', '后台管理员编辑界面');
INSERT INTO `cmf_hook` VALUES ('69', '2', '1', '后台角色添加界面', 'admin_rbac_role_add_view', 'admin', '后台角色添加界面');
INSERT INTO `cmf_hook` VALUES ('70', '2', '1', '后台角色编辑界面', 'admin_rbac_role_edit_view', 'admin', '后台角色编辑界面');
INSERT INTO `cmf_hook` VALUES ('71', '2', '1', '后台角色授权界面', 'admin_rbac_authorize_view', 'admin', '后台角色授权界面');

-- ----------------------------
-- Table structure for `cmf_hook_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_hook_plugin`;
CREATE TABLE `cmf_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统钩子插件表';

-- ----------------------------
-- Records of cmf_hook_plugin
-- ----------------------------
INSERT INTO `cmf_hook_plugin` VALUES ('1', '10000', '1', 'fetch_upload_view', 'Qiniu');

-- ----------------------------
-- Table structure for `cmf_jackpot`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_jackpot`;
CREATE TABLE `cmf_jackpot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `total` bigint(20) NOT NULL DEFAULT '0' COMMENT '奖池金额',
  `level` tinyint(4) NOT NULL DEFAULT '0' COMMENT '奖池等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_jackpot
-- ----------------------------
INSERT INTO `cmf_jackpot` VALUES ('1', '0', '0');

-- ----------------------------
-- Table structure for `cmf_jackpot_level`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_jackpot_level`;
CREATE TABLE `cmf_jackpot_level` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `levelid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `level_up` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '经验下限',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_jackpot_level
-- ----------------------------
INSERT INTO `cmf_jackpot_level` VALUES ('1', '1', '5000', '1457923458');
INSERT INTO `cmf_jackpot_level` VALUES ('2', '2', '10000', '1459240543');
INSERT INTO `cmf_jackpot_level` VALUES ('3', '3', '15000', '1459240560');

-- ----------------------------
-- Table structure for `cmf_jackpot_rate`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_jackpot_rate`;
CREATE TABLE `cmf_jackpot_rate` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `giftid` int(11) NOT NULL DEFAULT '0' COMMENT '礼物ID',
  `nums` int(10) unsigned NOT NULL COMMENT '数量',
  `rate_jackpot` text COLLATE utf8mb4_unicode_ci COMMENT '奖池概率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_jackpot_rate
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_label`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_label`;
CREATE TABLE `cmf_label` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '标签名称',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  `colour` varchar(255) NOT NULL DEFAULT '' COMMENT '颜色',
  `colour2` varchar(255) NOT NULL DEFAULT '' COMMENT '尾色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_label
-- ----------------------------
INSERT INTO `cmf_label` VALUES ('1', '小清新', '666', '#4edc90', '#22804e');
INSERT INTO `cmf_label` VALUES ('2', '阳光女神', '9', '#2595b8', '#33caf9');
INSERT INTO `cmf_label` VALUES ('3', '性感', '99', '#e5007f', '#f05bad');
INSERT INTO `cmf_label` VALUES ('4', '二次元', '44443', '#d48d24', '#f9b552');
INSERT INTO `cmf_label` VALUES ('5', '好声音', '4443', '#b3aa04', '#fff649');
INSERT INTO `cmf_label` VALUES ('6', '喊麦达人', '21788', '#0a8c88', '#06d9d1');
INSERT INTO `cmf_label` VALUES ('7', '才艺', '7', '#648717', '#8fc41e');
INSERT INTO `cmf_label` VALUES ('8', '潮范儿', '8', '#990e5a', '#ea2893');
INSERT INTO `cmf_label` VALUES ('9', '舞蹈达人', '9', '#2f9aba', '#4cd1f8');
INSERT INTO `cmf_label` VALUES ('10', '学生', '77', '#53730f', '#8fc41e');
INSERT INTO `cmf_label` VALUES ('11', '高颜值', '7', '#1a9995', '#01d8d0');
INSERT INTO `cmf_label` VALUES ('12', '游戏大神', '7', '#ed6942', '#e69881');
INSERT INTO `cmf_label` VALUES ('13', '帅气男神', '1000', '#01d9ce', '#6be3dd');
INSERT INTO `cmf_label` VALUES ('15', '小哥哥', '88', '#ff0000', '#ff0000');
INSERT INTO `cmf_label` VALUES ('16', '清纯可人', '999', '#318742', '#f08bcd');

-- ----------------------------
-- Table structure for `cmf_label_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_label_user`;
CREATE TABLE `cmf_label_user` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '对方ID',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT '选择的标签',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  KEY `uid_touid_index` (`uid`,`touid`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `touid` (`touid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_label_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_level`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_level`;
CREATE TABLE `cmf_level` (
  `levelid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `levelname` varchar(50) NOT NULL DEFAULT '' COMMENT '等级名称',
  `level_up` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '经验上限',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `colour` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称颜色',
  `thumb_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '头像角标',
  `bg` varchar(255) NOT NULL DEFAULT '' COMMENT '背景',
  PRIMARY KEY (`id`,`levelid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_level
-- ----------------------------
INSERT INTO `cmf_level` VALUES ('1', '一级', '49', '1457923458', '1', 'level_1.png', 'b2d65e', 'level_mark_1.png', 'level_bg_1.png');
INSERT INTO `cmf_level` VALUES ('2', '二级', '149', '1459240543', '2', 'level_2.png', 'b2d65e', 'level_mark_2.png', 'level_bg_2.png');
INSERT INTO `cmf_level` VALUES ('3', '三级', '299', '1459240560', '3', 'level_3.png', 'b2d65e', 'level_mark_3.png', 'level_bg_3.png');
INSERT INTO `cmf_level` VALUES ('4', '四级', '499', '1459240618', '4', 'level_4.png', 'b2d65e', 'level_mark_4.png', 'level_bg_4.png');
INSERT INTO `cmf_level` VALUES ('5', '五级', '899', '1459240659', '5', 'level_5.png', 'b2d65e', 'level_mark_5.png', 'level_bg_5.png');
INSERT INTO `cmf_level` VALUES ('6', '六级', '20000', '1459240684', '6', 'level_6.png', 'ffb500', 'level_mark_6.png', 'level_bg_6.png');
INSERT INTO `cmf_level` VALUES ('7', '七级', '29999', '1463802287', '7', 'level_7.png', 'ffb500', 'level_mark_7.png', 'level_bg_7.png');
INSERT INTO `cmf_level` VALUES ('8', '八级', '39999', '1463980529', '8', 'level_8.png', 'ffb500', 'level_mark_8.png', 'level_bg_8.png');
INSERT INTO `cmf_level` VALUES ('9', '九级', '49999', '1463980683', '9', 'level_9.png', 'ffb500', 'level_mark_9.png', 'level_bg_9.png');
INSERT INTO `cmf_level` VALUES ('10', '十级', '59999', '1465371136', '10', 'level_10.png', 'ffb500', 'level_mark_10.png', 'level_bg_10.png');
INSERT INTO `cmf_level` VALUES ('11', '十一级', '69999', '1506127062', '16', 'level_11.png', '00b6f1', 'level_mark_11.png', 'level_bg_11.png');
INSERT INTO `cmf_level` VALUES ('12', '十二级', '79999', '1514969928', '18', 'level_12.png', '00b6f1', 'level_mark_12.png', 'level_bg_12.png');
INSERT INTO `cmf_level` VALUES ('13', '十三级', '89999', '1514969950', '19', 'level_13.png', '00b6f1', 'level_mark_13.png', 'level_bg_13.png');
INSERT INTO `cmf_level` VALUES ('14', '十四级', '99999', '1514969962', '20', 'level_14.png', '00b6f1', 'level_mark_14.png', 'level_bg_14.png');
INSERT INTO `cmf_level` VALUES ('15', '十五级', '199999', '1514970130', '21', 'level_15.png', '00b6f1', 'level_mark_15.png', 'level_bg_15.png');
INSERT INTO `cmf_level` VALUES ('16', '十六级', '299999', '1514970245', '22', 'level_16.png', 'f36836', 'level_mark_16.png', 'level_bg_16.png');
INSERT INTO `cmf_level` VALUES ('17', '十七级', '399999', '1514970263', '23', 'level_17.png', 'f36836', 'level_mark_17.png', 'level_bg_17.png');
INSERT INTO `cmf_level` VALUES ('18', '十八级', '499999', '1514970277', '24', 'level_18.png', 'f36836', 'level_mark_18.png', 'level_bg_18.png');
INSERT INTO `cmf_level` VALUES ('19', '十九级', '599999', '1514970300', '25', 'level_19.png', 'f36836', 'level_mark_19.png', 'level_bg_19.png');
INSERT INTO `cmf_level` VALUES ('20', '神王', '999999999', '1514970325', '26', 'level_20.png', 'f36836', 'level_mark_20.png', 'level_bg_20.png');

-- ----------------------------
-- Table structure for `cmf_level_anchor`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_level_anchor`;
CREATE TABLE `cmf_level_anchor` (
  `levelid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `levelname` varchar(50) DEFAULT '' COMMENT '等级名称',
  `level_up` int(20) unsigned DEFAULT '0' COMMENT '等级上限',
  `addtime` int(11) DEFAULT '0' COMMENT '添加时间',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '标识',
  `thumb_mark` varchar(255) NOT NULL DEFAULT '' COMMENT '头像角标',
  `bg` varchar(255) NOT NULL DEFAULT '' COMMENT '背景',
  PRIMARY KEY (`id`,`levelid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_level_anchor
-- ----------------------------
INSERT INTO `cmf_level_anchor` VALUES ('1', '一级', '49', '1457923458', '1', 'level_anchor_1.png', 'level_anchor_mark_1.png', 'level_anchor_bg_1.png');
INSERT INTO `cmf_level_anchor` VALUES ('2', '二级', '149', '1459240543', '2', 'level_anchor_2.png', 'level_anchor_mark_2.png', 'level_anchor_bg_2.png');
INSERT INTO `cmf_level_anchor` VALUES ('3', '三级', '299', '1459240560', '3', 'level_anchor_3.png', 'level_anchor_mark_3.png', 'level_anchor_bg_3.png');
INSERT INTO `cmf_level_anchor` VALUES ('4', '四级', '499', '1459240618', '4', 'level_anchor_4.png', 'level_anchor_mark_4.png', 'level_anchor_bg_4.png');
INSERT INTO `cmf_level_anchor` VALUES ('5', '五级', '899', '1459240659', '5', 'level_anchor_5.png', 'level_anchor_mark_5.png', 'level_anchor_bg_5.png');
INSERT INTO `cmf_level_anchor` VALUES ('6', '六级', '20000', '1459240684', '6', 'level_anchor_6.png', 'level_anchor_mark_6.png', 'level_anchor_bg_6.png');
INSERT INTO `cmf_level_anchor` VALUES ('7', '七级', '29999', '1463802287', '7', 'level_anchor_7.png', 'level_anchor_mark_7.png', 'level_anchor_bg_7.png');
INSERT INTO `cmf_level_anchor` VALUES ('8', '八级', '39999', '1463980529', '8', 'level_anchor_8.png', 'level_anchor_mark_8.png', 'level_anchor_bg_8.png');
INSERT INTO `cmf_level_anchor` VALUES ('9', '九级', '1000000', '1463980683', '9', 'level_anchor_9.png', 'level_anchor_mark_9.png', 'level_anchor_bg_9.png');
INSERT INTO `cmf_level_anchor` VALUES ('10', '十级', '999999999', '1465371136', '10', 'level_anchor_10.png', 'level_anchor_mark_10.png', 'level_anchor_bg_10.png');

-- ----------------------------
-- Table structure for `cmf_liang`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_liang`;
CREATE TABLE `cmf_liang` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '靓号',
  `length` int(11) NOT NULL DEFAULT '0' COMMENT '长度',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分价格',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '购买用户ID',
  `buytime` int(11) NOT NULL DEFAULT '0' COMMENT '购买时间',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '靓号销售状态',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '启用状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_liang
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_link`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_link`;
CREATE TABLE `cmf_link` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:显示;0:不显示',
  `rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接描述',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '友情链接地址',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '友情链接名称',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '友情链接图标',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `rel` varchar(50) NOT NULL DEFAULT '' COMMENT '链接与网站的关系',
  PRIMARY KEY (`id`),
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='友情链接表';

-- ----------------------------
-- Records of cmf_link
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_live`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_live`;
CREATE TABLE `cmf_live` (
  `uid` int(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `showid` int(12) NOT NULL DEFAULT '0' COMMENT '直播标识',
  `islive` int(1) NOT NULL DEFAULT '0' COMMENT '直播状态',
  `starttime` int(12) NOT NULL DEFAULT '0' COMMENT '开播时间',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `stream` varchar(255) NOT NULL DEFAULT '' COMMENT '流名',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `pull` varchar(255) NOT NULL DEFAULT '' COMMENT '播流地址',
  `lng` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '直播类型',
  `type_val` varchar(255) NOT NULL DEFAULT '' COMMENT '类型值',
  `isvideo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否假视频',
  `wy_cid` varchar(255) NOT NULL DEFAULT '' COMMENT '网易房间ID(当不使用网易是默认为空)',
  `goodnum` varchar(255) NOT NULL DEFAULT '0' COMMENT '靓号',
  `anyway` tinyint(1) NOT NULL DEFAULT '1' COMMENT '横竖屏，0表示竖屏，1表示横屏',
  `liveclassid` int(11) NOT NULL DEFAULT '0' COMMENT '直播分类ID',
  `hotvotes` int(11) NOT NULL DEFAULT '0' COMMENT '热门礼物总额',
  `pkuid` int(11) NOT NULL DEFAULT '0' COMMENT 'PK对方ID',
  `pkstream` varchar(255) NOT NULL DEFAULT '' COMMENT 'pk对方的流名',
  `ismic` tinyint(1) NOT NULL DEFAULT '0' COMMENT '连麦开关，0是关，1是开',
  `ishot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热门',
  `isrecommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推荐',
  `deviceinfo` varchar(255) NOT NULL DEFAULT '' COMMENT '设备信息',
  `isshop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启店铺',
  `game_action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '游戏类型',
  `banker_coin` bigint(20) DEFAULT '0' COMMENT '庄家余额',
  `isoff` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否断流，0否1是',
  `offtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '断流时间',
  `recommend_time` int(1) NOT NULL DEFAULT '0' COMMENT '推荐时间',
  `live_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '直播类型 0 视频直播 1 语音聊天室',
  PRIMARY KEY (`uid`),
  KEY `index_islive_starttime` (`islive`,`starttime`) USING BTREE,
  KEY `index_uid_stream` (`uid`,`stream`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_live
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_live_ban`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_live_ban`;
CREATE TABLE `cmf_live_ban` (
  `liveuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主播ID',
  `superid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '超管ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`liveuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_live_ban
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_live_class`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_live_class`;
CREATE TABLE `cmf_live_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `des` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_live_class
-- ----------------------------
INSERT INTO `cmf_live_class` VALUES ('1', '音乐', 'liveclass_1.png', '流行、摇滚、说唱、民族等，线上最强演唱会', '13');
INSERT INTO `cmf_live_class` VALUES ('2', '舞蹈', 'liveclass_2.png', '现代舞、钢管舞、肚皮舞等，谈恋爱不如跳舞', '14');
INSERT INTO `cmf_live_class` VALUES ('3', '户外', 'liveclass_3.png', '街头、野外任你选择，健身、旅行任你畅玩', '3');
INSERT INTO `cmf_live_class` VALUES ('4', '校园', 'liveclass_4.png', '学生党分享校园乐事', '4');
INSERT INTO `cmf_live_class` VALUES ('5', '交友', 'liveclass_5.png', '单身男女聚集地，线上交友趣事多', '5');
INSERT INTO `cmf_live_class` VALUES ('6', '喊麦', 'liveclass_6.png', '欧美有RAP，我们有MC', '6');
INSERT INTO `cmf_live_class` VALUES ('7', '游戏', 'liveclass_7.png', '是时候展示你真正的技术了', '7');
INSERT INTO `cmf_live_class` VALUES ('8', '直播购', 'liveclass_8.png', '买买买，分享最美好的东西', '1');
INSERT INTO `cmf_live_class` VALUES ('9', '美食', 'liveclass_9.png', '吃货？主厨？唯美食不可辜负', '9');
INSERT INTO `cmf_live_class` VALUES ('10', '才艺', 'liveclass_10.png', '手工艺、魔术、画画、化妆等，艺术高手在民间', '10');
INSERT INTO `cmf_live_class` VALUES ('11', '男神', 'liveclass_11.png', '前方有一大波迷妹即将赶到', '11');
INSERT INTO `cmf_live_class` VALUES ('12', '女神', 'liveclass_12.png', '高颜值，好身材就要秀出来', '12');

-- ----------------------------
-- Table structure for `cmf_live_kick`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_live_kick`;
CREATE TABLE `cmf_live_kick` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `liveuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主播ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `actionid` int(11) NOT NULL DEFAULT '0' COMMENT '操作用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_live_kick
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_live_manager`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_live_manager`;
CREATE TABLE `cmf_live_manager` (
  `uid` int(12) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `liveuid` int(12) NOT NULL DEFAULT '0' COMMENT '主播ID',
  KEY `uid_touid_index` (`liveuid`,`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_live_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_live_record`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_live_record`;
CREATE TABLE `cmf_live_record` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `showid` int(11) NOT NULL DEFAULT '0' COMMENT '直播标识',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '关播时人数',
  `starttime` int(11) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `stream` varchar(255) NOT NULL DEFAULT '' COMMENT '流名',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图',
  `lng` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(255) NOT NULL DEFAULT '' COMMENT '纬度',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '直播类型',
  `type_val` varchar(255) NOT NULL DEFAULT '' COMMENT '类型值',
  `votes` varchar(255) NOT NULL DEFAULT '0' COMMENT '本次直播收益',
  `time` varchar(255) NOT NULL DEFAULT '' COMMENT '格式日期',
  `liveclassid` int(11) NOT NULL DEFAULT '0' COMMENT '直播分类ID',
  `video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '回放地址',
  `live_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '直播类型 0 视频直播 1 语音聊天室',
  `deviceinfo` varchar(255) NOT NULL DEFAULT '' COMMENT '设备信息',
  PRIMARY KEY (`id`),
  KEY `index_uid_start` (`uid`,`starttime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_live_record
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_live_shut`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_live_shut`;
CREATE TABLE `cmf_live_shut` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `liveuid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '主播ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `showid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '禁言类型，0永久',
  `actionid` int(11) NOT NULL DEFAULT '0' COMMENT '操作者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_live_shut
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_loginbonus`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_loginbonus`;
CREATE TABLE `cmf_loginbonus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day` int(10) NOT NULL DEFAULT '0' COMMENT '登录天数',
  `coin` int(10) NOT NULL DEFAULT '0' COMMENT '登录奖励',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_loginbonus
-- ----------------------------
INSERT INTO `cmf_loginbonus` VALUES ('1', '1', '10', '0', '1601258637');
INSERT INTO `cmf_loginbonus` VALUES ('2', '2', '20', '0', '0');
INSERT INTO `cmf_loginbonus` VALUES ('3', '3', '30', '0', '0');
INSERT INTO `cmf_loginbonus` VALUES ('4', '4', '40', '0', '0');
INSERT INTO `cmf_loginbonus` VALUES ('5', '5', '50', '0', '0');
INSERT INTO `cmf_loginbonus` VALUES ('6', '6', '60', '0', '0');
INSERT INTO `cmf_loginbonus` VALUES ('7', '7', '70', '0', '1543644538');

-- ----------------------------
-- Table structure for `cmf_music`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_music`;
CREATE TABLE `cmf_music` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '音乐名称',
  `author` varchar(255) NOT NULL DEFAULT '' COMMENT '演唱者',
  `uploader` int(255) NOT NULL DEFAULT '0' COMMENT '上传者ID',
  `upload_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上传类型  1管理员上传 2 用户上传',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '封面地址',
  `length` varchar(255) NOT NULL DEFAULT '' COMMENT '音乐长度',
  `file_url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件地址',
  `use_nums` int(12) NOT NULL DEFAULT '0' COMMENT '被使用次数',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否被删除 0否 1是',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(12) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `classify_id` int(12) NOT NULL DEFAULT '0' COMMENT '音乐分类ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_music
-- ----------------------------
INSERT INTO `cmf_music` VALUES ('1', 'Panama', 'Matteo', '1', '1', 'music_thumb_1.jpg', '00:31', 'music_1.mp3', '117', '0', '1528535261', '1536733965', '1');
INSERT INTO `cmf_music` VALUES ('3', 'California (On My Mind)', 'Stewart Mac', '1', '1', 'music_thumb_3.jpg', '00:29', 'music_3.mp3', '258', '0', '1529747678', '0', '1');
INSERT INTO `cmf_music` VALUES ('4', '最美的期待', '周笔畅', '1', '1', 'music_thumb_4.png', '00:22', 'music_4.mp3', '138', '0', '1530090995', '1590217881', '19');
INSERT INTO `cmf_music` VALUES ('5', 'Friendshipss', 'Pascal Letoublon', '1', '1', 'music_thumb_5.jpg', '00:40', 'music_5.mp3', '509', '0', '1530095432', '1567569166', '0');
INSERT INTO `cmf_music` VALUES ('7', 'Seve', 'Tez Cadey', '1', '1', 'music_thumb_7.png', '00:31', 'music_7.mp3', '182', '0', '1530096728', '0', '1');
INSERT INTO `cmf_music` VALUES ('8', 'Ce Frumoasa E Iubirea', 'Giulia Anghelescu', '1', '1', 'music_thumb_8.png', '00:49', 'music_8.mp3', '230', '0', '1531382523', '0', '1');
INSERT INTO `cmf_music` VALUES ('9', '夜空的寂静', '赵海洋', '1', '1', 'music_thumb_9.jpg', '00:39', 'music_9.mp3', '125', '0', '1531383448', '1590217645', '16');
INSERT INTO `cmf_music` VALUES ('10', '清晨的美好', '张宇桦', '1', '1', 'music_thumb_10.jpg', '00:37', 'music_10.mp3', '238', '0', '1531384116', '1590217636', '18');
INSERT INTO `cmf_music` VALUES ('11', 'Because of You', 'Kelly Clarkson', '1', '1', 'music_thumb_11.jpg', '03:40', 'music_11.mp3', '131', '0', '1535004946', '1601257704', '17');

-- ----------------------------
-- Table structure for `cmf_music_classify`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_music_classify`;
CREATE TABLE `cmf_music_classify` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `list_order` int(12) NOT NULL DEFAULT '9999' COMMENT '排序号',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(12) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `img_url` varchar(255) NOT NULL DEFAULT '' COMMENT '分类图标地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_music_classify
-- ----------------------------
INSERT INTO `cmf_music_classify` VALUES ('16', '热歌', '2', '0', '1544862438', '0', 'music_class_16.png');
INSERT INTO `cmf_music_classify` VALUES ('17', '新歌', '0', '0', '1544862465', '0', 'music_class_17.png');
INSERT INTO `cmf_music_classify` VALUES ('18', '经典', '0', '0', '1544862498', '0', 'music_class_18.png');
INSERT INTO `cmf_music_classify` VALUES ('19', '潮流', '1', '0', '1545291271', '0', 'music_class_19.png');

-- ----------------------------
-- Table structure for `cmf_music_collection`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_music_collection`;
CREATE TABLE `cmf_music_collection` (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(12) NOT NULL DEFAULT '0' COMMENT '用户id',
  `music_id` int(12) NOT NULL DEFAULT '0' COMMENT '音乐id',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `updatetime` int(12) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '音乐收藏状态 1收藏 0 取消收藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_music_collection
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_option`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_option`;
CREATE TABLE `cmf_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`),
  UNIQUE KEY `option_name` (`option_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='全站配置表';

-- ----------------------------
-- Records of cmf_option
-- ----------------------------
INSERT INTO `cmf_option` VALUES ('1', '1', 'site_info', '{\"maintain_switch\":\"0\",\"maintain_tips\":\"\\u7ef4\\u62a4\\u901a\\u77e5\\uff1a\\u4e3a\\u4e86\\u66f4\\u597d\\u7684\\u4e3a\\u60a8\\u670d\\u52a1\\uff0c\\u672c\\u7ad9\\u6b63\\u5728\\u5347\\u7ea7\\u7ef4\\u62a4\\u4e2d\\uff0c\\u56e0\\u6b64\\u5e26\\u6765\\u4e0d\\u4fbf\\u6df1\\u8868\\u6b49\\u610f\",\"company_name\":\"\",\"company_desc\":\"\",\"site_name\":\"\\u76f4\\u64ad\",\"site\":\"\",\"copyright\":\"\",\"name_coin\":\"\\u94bb\\u77f3\",\"name_score\":\"\\u79ef\\u5206\",\"name_votes\":\"\\u6620\\u7968\",\"mobile\":\"\",\"address\":\"\",\"apk_ewm\":\"\",\"ipa_ewm\":\"\",\"wechat_ewm\":\"\",\"voicelive_icon\":\"\",\"voicelive_name\":\"\\u804a\\u5929\\u5ba4\",\"site_seo_title\":\"\",\"site_seo_keywords\":\"\",\"site_seo_description\":\"\",\"isup\":\"0\",\"apk_ver\":\"\",\"apk_url\":\"\",\"apk_des\":\"\\u6709\\u65b0\\u7248\\u672c\\uff0c\\u662f\\u5426\\u66f4\\u65b0\",\"ipa_ver\":\"\",\"ios_shelves\":\"1\",\"ipa_url\":\"\",\"ipa_des\":\"\\u6709\\u65b0\\u7248\\u672c\\uff0c\\u662f\\u5426\\u66f4\\u65b0\\r\\n\",\"qr_url\":\"\",\"wx_siteurl\":\"https:\\/\\/x.com\\/wxshare\\/Share\\/show?roomnum=\",\"share_title\":\"\\u5206\\u4eab\\u4e86{username}\\u7684\\u7cbe\\u5f69\\u76f4\\u64ad\\uff01\",\"share_des\":\"\\u6211\\u770b\\u5230\\u4e00\\u4e2a\\u5f88\\u597d\\u770b\\u7684\\u76f4\\u64ad\\uff0c\\u5feb\\u6765\\u8ddf\\u6211\\u4e00\\u8d77\\u56f4\\u89c2\\u5427\",\"app_android\":\"\",\"app_ios\":\"\",\"video_share_title\":\"\\u5206\\u4eab\\u4e86{username}\\u7684\\u7cbe\\u5f69\\u89c6\\u9891\\uff01\",\"video_share_des\":\"\\u6211\\u770b\\u5230\\u4e00\\u4e2a\\u5f88\\u597d\\u770b\\u7684\\u89c6\\u9891\\uff0c\\u5feb\\u6765\\u8ddf\\u6211\\u4e00\\u8d77\\u56f4\\u89c2\\u5427\",\"live_time_coin\":\"20,30,40,50,60\",\"sprout_key\":\"\",\"sprout_key_ios\":\"\",\"skin_whiting\":\"7\",\"skin_smooth\":\"5\",\"skin_tenderness\":\"5\",\"brightness\":\"60\",\"eye_brow\":\"20\",\"big_eye\":\"20\",\"eye_length\":\"30\",\"eye_corner\":\"60\",\"eye_alat\":\"30\",\"face_lift\":\"40\",\"face_shave\":\"10\",\"mouse_lift\":\"10\",\"nose_lift\":\"10\",\"chin_lift\":\"30\",\"forehead_lift\":\"50\",\"lengthen_noseLift\":\"60\",\"payment_des\":\"1. \\u4ed8\\u8d39\\u5185\\u5bb9\\u5fc5\\u987b\\u7b26\\u5408\\u4e2d\\u534e\\u4eba\\u6c11\\u5171\\u548c\\u56fd\\u6cd5\\u5f8b\\u6cd5\\u89c4\\uff0c\\u4e0d\\u5f97\\u6d89\\u53ca\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u6cd5\\u89c4\\u7981\\u6b62\\u7684\\u4e00\\u5207\\u8fdd\\u6cd5\\u5185\\u5bb9\\u3002\\r\\n2.\\u5e73\\u53f0\\u6709\\u6743\\u5229\\u5bf9\\u7528\\u6237\\u4e0a\\u4f20\\u7684\\u4ed8\\u8d39\\u5185\\u5bb9\\u8fdb\\u884c\\u76d1\\u7ba1\\u53ca\\u5ba1\\u6838\\u3002\\r\\n3.\\u5982\\u53d1\\u73b0\\u8fdd\\u53cd\\u56fd\\u5bb6\\u6cd5\\u5f8b\\u7684\\u5185\\u5bb9\\uff0c\\u5e73\\u53f0\\u6709\\u6743\\u5229\\u50cf\\u76f8\\u5173\\u90e8\\u95e8\\u4e3e\\u8bc1\\u4e3e\\u62a5\\u3002\\r\\n4.\\u8bf7\\u4ed4\\u7ec6\\u9605\\u8bfb\",\"payment_time\":\"1\",\"payment_percent\":\"10\",\"login_alert_title\":\"\\u670d\\u52a1\\u534f\\u8bae\\u548c\\u9690\\u79c1\\u653f\\u7b56\",\"login_alert_content\":\"\\u8bf7\\u60a8\\u52a1\\u5fc5\\u4ed4\\u7ec6\\u9605\\u8bfb\\uff0c\\u5145\\u5206\\u7406\\u89e3\\u670d\\u52a1\\u534f\\u8bae\\u548c\\u9690\\u79c1\\u653f\\u7b56\\u5404\\u6761\\u6b3e\\uff0c\\u5305\\u62ec\\u4f46\\u4e0d\\u9650\\u4e8e\\u4e3a\\u4e86\\u5411\\u60a8\\u63d0\\u4f9b\\u5373\\u65f6\\u901a\\u8baf\\uff0c\\u5185\\u5bb9\\u5206\\u4eab\\u7b49\\u670d\\u52a1\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u6536\\u96c6\\u60a8\\u8bbe\\u5907\\u4fe1\\u606f\\u548c\\u4e2a\\u4eba\\u4fe1\\u606f\\uff0c\\u60a8\\u53ef\\u4ee5\\u5728\\u8bbe\\u7f6e\\u4e2d\\u67e5\\u770b\\uff0c\\u7ba1\\u7406\\u60a8\\u7684\\u6388\\u6743\\u3002\\u60a8\\u53ef\\u9605\\u8bfb\\u300a\\u9690\\u79c1\\u653f\\u7b56\\u300b\\u548c\\u300a\\u670d\\u52a1\\u534f\\u8bae\\u300b\\u4e86\\u89e3\\u8be6\\u7ec6\\u4fe1\\u606f\\uff0c\\u5982\\u60a8\\u540c\\u610f\\uff0c\\u8bf7\\u70b9\\u51fb\\u540c\\u610f\\u63a5\\u53d7\\u6211\\u4eec\\u7684\\u670d\\u52a1\\u3002\",\"login_clause_title\":\"\\u767b\\u5f55\\u5373\\u4ee3\\u8868\\u540c\\u610f\\u300a\\u9690\\u79c1\\u653f\\u7b56\\u300b\\u548c\\u300a\\u670d\\u52a1\\u534f\\u8bae\\u300b\",\"login_private_title\":\"\\u300a\\u9690\\u79c1\\u653f\\u7b56\\u300b\",\"login_private_url\":\"\\/portal\\/page\\/index?id=3\",\"login_service_title\":\"\\u300a\\u670d\\u52a1\\u534f\\u8bae\\u300b\",\"login_service_url\":\"\\/portal\\/page\\/index?id=4\",\"wxmini_version\":\"\",\"wxmini_shelves_version\":\"\",\"wxmini_des\":\"\\u4f18\\u5316\\u90e8\\u5206\\u529f\\u80fd\",\"login_type\":\"qq,wx,facebook,twitter,ios\",\"share_type\":\"qq,qzone,wx,wchat,facebook,twitter\",\"live_type\":\"0;\\u666e\\u901a\\u623f\\u95f4,1;\\u5bc6\\u7801\\u623f\\u95f4,2;\\u95e8\\u7968\\u623f\\u95f4,3;\\u8ba1\\u65f6\\u623f\\u95f4\"}');
INSERT INTO `cmf_option` VALUES ('2', '1', 'cmf_settings', '{\"banned_usernames\":\"\"}');
INSERT INTO `cmf_option` VALUES ('3', '1', 'cdn_settings', '{\"cdn_static_root\":\"\"}');
INSERT INTO `cmf_option` VALUES ('4', '1', 'admin_settings', '{\"admin_password\":\"\",\"admin_theme\":\"admin_simpleboot3\",\"admin_style\":\"flatadmin\"}');
INSERT INTO `cmf_option` VALUES ('5', '1', 'storage', '{\"storages\":{\"Qiniu\":{\"name\":\"\\u4e03\\u725b\\u4e91\\u5b58\\u50a8\",\"driver\":\"\\\\plugins\\\\qiniu\\\\lib\\\\Qiniu\"}},\"type\":\"Qiniu\"}');
INSERT INTO `cmf_option` VALUES ('6', '1', 'configpri', '{\"family_switch\":\"1\",\"family_member_divide_switch\":\"0\",\"service_switch\":\"1\",\"service_url\":\"\",\"sensitive_words\":\"\\u6bdb\\u6cfd\\u4e1c,\\u4e60\\u8fd1\\u5e73,\\u80e1\\u9526\\u6d9b,\\u6c5f\\u6cfd\\u6c11,\\u6731\\u9555\\u57fa,\\u4e14,weixin,qq,\\u5fae\\u4fe1,QQ\",\"reg_reward\":\"\",\"bonus_switch\":\"1\",\"login_wx_pc_appid\":\"\",\"login_wx_pc_appsecret\":\"\",\"login_wx_appid\":\"\",\"login_wx_appsecret\":\"\",\"sendcode_switch\":\"0\",\"typecode_switch\":\"3\",\"aly_keydi\":\"\",\"aly_secret\":\"\",\"aly_sendcode_type\":\"2\",\"aly_signName\":\"\",\"aly_templateCode\":\"\",\"aly_hw_signName\":\"\",\"aly_hw_templateCode\":\"\",\"ccp_sid\":\"\",\"ccp_token\":\"\",\"ccp_appid\":\"\",\"ccp_tempid\":\"\",\"tencent_sendcode_type\":\"1\",\"tencent_sms_appid\":\"\",\"tencent_sms_appkey\":\"\",\"tencent_sms_signName\":\"\",\"tencent_sms_templateCode\":\"\",\"tencent_sms_hw_signName\":\"\",\"tencent_sms_hw_templateCode\":\"\",\"iplimit_switch\":\"0\",\"iplimit_times\":\"10\",\"auth_islimit\":\"0\",\"level_islimit\":\"0\",\"level_limit\":\"1\",\"speak_limit\":\"0\",\"barrage_limit\":\"0\",\"barrage_fee\":\"10\",\"userlist_time\":\"60\",\"mic_limit\":\"0\",\"chatserver\":\"\",\"live_sdk\":\"1\",\"cdn_switch\":\"2\",\"push_url\":\"\",\"auth_key_push\":\"\",\"auth_length_push\":\"1800\",\"pull_url\":\"\",\"auth_key_pull\":\"\",\"auth_length_pull\":\"1800\",\"aliy_key_id\":\"\",\"aliy_key_secret\":\"\",\"aliy_playback_site\":\"\",\"tx_appid\":\"\",\"tx_bizid\":\"\",\"tx_push_key\":\"\",\"tx_acc_key\":\"\",\"tx_api_key\":\"\",\"tx_play_key\":\"\",\"tx_play_time\":\"\",\"tx_play_key_switch\":\"0\",\"tx_push\":\"\",\"tx_pull\":\"\",\"txcloud_secret_id\":\"\",\"txcloud_secret_key\":\"\",\"qn_ak\":\"\",\"qn_sk\":\"\",\"qn_hname\":\"\",\"qn_push\":\"\",\"qn_pull\":\"\",\"ws_push\":\"\",\"ws_pull\":\"\",\"ws_apn\":\"\",\"wy_appkey\":\"\",\"wy_appsecret\":\"\",\"ady_push\":\"\",\"ady_pull\":\"\",\"ady_hls_pull\":\"\",\"ady_apn\":\"\",\"cash_rate\":\"100\",\"cash_take\":\"20\",\"cash_min\":\"1\",\"cash_start\":\"1\",\"cash_end\":\"20\",\"cash_max_times\":\"0\",\"letter_switch\":\"1\",\"jpush_sandbox\":\"0\",\"jpush_key\":\"\",\"jpush_secret\":\"\",\"aliapp_partner\":\"\",\"aliapp_seller_id\":\"\",\"aliapp_key_android\":\"\",\"aliapp_key_ios\":\"\",\"aliapp_check\":\"\",\"wx_appid\":\"\",\"wx_appsecret\":\"\",\"wx_mchid\":\"\",\"wx_key\":\"\",\"braintree_paypal_environment\":\"0\",\"braintree_merchantid_sandbox\":\"\",\"braintree_publickey_sandbox\":\"\",\"braintree_privatekey_sandbox\":\"\",\"braintree_merchantid_product\":\"\",\"braintree_publickey_product\":\"\",\"braintree_privatekey_product\":\"\",\"wx_mini_appid\":\"\",\"wx_mini_appsecret\":\"\",\"wx_mini_mchid\":\"\",\"wx_mini_key\":\"\",\"aliapp_switch\":\"1\",\"wx_switch\":\"1\",\"aliapp_pc\":\"1\",\"wx_switch_pc\":\"1\",\"wx_mini_switch\":\"1\",\"braintree_paypal_switch\":\"1\",\"shop_aliapp_switch\":\"1\",\"shop_wx_switch\":\"1\",\"shop_wxmini_switch\":\"1\",\"shop_balance_switch\":\"1\",\"shop_braintree_paypal_switch\":\"1\",\"shop_wxmini_balance_switch\":\"1\",\"paidprogram_aliapp_switch\":\"1\",\"paidprogram_wx_switch\":\"1\",\"paidprogram_balance_switch\":\"1\",\"paidprogram_braintree_paypal_switch\":\"1\",\"agent_switch\":\"1\",\"agent_must\":\"0\",\"distribut1\":\"20\",\"um_apikey\":\"\",\"um_apisecurity\":\"\",\"um_appkey_android\":\"\",\"um_appkey_ios\":\"\",\"video_audit_switch\":\"0\",\"video_watermark\":\"\",\"shop_system_name\":\"\\u76f4\\u64ad\\u5c0f\\u5e97\",\"shop_bond\":\"10\",\"show_switch\":\"0\",\"show_category_switch\":\"0\",\"shoporder_percent\":\"10\",\"goods_switch\":\"0\",\"shop_certificate_desc\":\"\\u4ee5\\u4e0b\\u8425\\u4e1a\\u6267\\u7167\\u4fe1\\u606f\\u6765\\u6e90\\u4e8e\\u4e70\\u5bb6\\u81ea\\u884c\\u7533\\u62a5\\u6216\\u5de5\\u5546\\u7cfb\\u7edf\\u6570\\u636e\\uff0c\\u5177\\u4f53\\u4ee5\\u5de5\\u5546\\u90e8\\u95e8\\u767b\\u8bb0\\u4e3a\\u51c6\\uff0c\\u7ecf\\u8425\\u8005\\u9700\\u8981\\u786e\\u4fdd\\u4fe1\\u606f\\u771f\\u5b9e\\u6709\\u6548\\uff0c\\u5e73\\u53f0\\u4e5f\\u5c06\\u5b9a\\u671f\\u6838\\u67e5\\u3002\\u5982\\u4e0e\\u5b9e\\u9645\\u4e0d\\u7b26\\uff0c\\u4e3a\\u907f\\u514d\\u8fdd\\u89c4\\uff0c\\u8bf7\\u8054\\u7cfb\\u5f53\\u5730\\u5de5\\u5546\\u90e8\\u95e8\\u6216\\u5e73\\u53f0\\u5ba2\\u670d\\u66f4\\u65b0\\u3002\",\"shop_payment_time\":\"30\",\"shop_shipment_time\":\"2\",\"shop_receive_time\":\"15\",\"shop_refund_time\":\"1\",\"shop_refund_finish_time\":\"2\",\"shop_receive_refund_time\":\"1\",\"shop_settlement_time\":\"1\",\"balance_cash_min\":\"1\",\"balance_cash_start\":\"1\",\"balance_cash_end\":\"30\",\"balance_cash_max_times\":\"0\",\"dynamic_auth\":\"0\",\"dynamic_switch\":\"0\",\"comment_weight\":\"10\",\"like_weight\":\"20\",\"game_banker_limit\":\"100\",\"game_odds\":\"0\",\"game_odds_p\":\"100\",\"game_odds_u\":\"30\",\"game_pump\":\"10\",\"turntable_switch\":\"1\",\"express_type\":\"0\",\"express_id_dev\":\"\",\"express_appkey_dev\":\"\",\"express_id\":\"\",\"express_appkey\":\"\",\"watch_live_term\":\"1\",\"watch_live_coin\":\"100\",\"watch_video_term\":\"1\",\"watch_video_coin\":\"10\",\"open_live_term\":\"0.1\",\"open_live_coin\":\"30\",\"award_live_term\":\"100\",\"award_live_coin\":\"100\",\"share_live_term\":\"1\",\"share_live_coin\":\"200\",\"cloudtype\":\"1\",\"aws_bucket\":\"\",\"aws_region\":\"\",\"aws_hosturl\":\"\",\"aws_identitypoolid\":\"\",\"game_switch\":\"1,3\"}');
INSERT INTO `cmf_option` VALUES ('7', '1', 'jackpot', '{\"switch\":\"1\",\"luck_anchor\":\"5\",\"luck_jackpot\":\"30\"}');
INSERT INTO `cmf_option` VALUES ('8', '1', 'guide', '{\"switch\":\"1\",\"type\":\"0\",\"time\":\"3\"}');
INSERT INTO `cmf_option` VALUES ('9', '1', 'upload_setting', '{\"max_files\":\"20\",\"chunk_size\":\"512\",\"file_types\":{\"image\":{\"upload_max_filesize\":\"10240\",\"extensions\":\"jpg,jpeg,png,gif,bmp4,svga\"},\"video\":{\"upload_max_filesize\":\"102400\",\"extensions\":\"mp4\"},\"audio\":{\"upload_max_filesize\":\"102400\",\"extensions\":\"mp3\"},\"file\":{\"upload_max_filesize\":\"102400\",\"extensions\":\"txt,pdf,doc,docx,xls,xlsx,ppt,pptx,svga,mp4\"}}}');

-- ----------------------------
-- Table structure for `cmf_paidprogram`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_paidprogram`;
CREATE TABLE `cmf_paidprogram` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `classid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容简介',
  `personal_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '个人介绍',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '付费内容价格',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '文件类型 0 单视频 1 多视频',
  `videos` text NOT NULL COMMENT '视频json串',
  `sale_nums` bigint(20) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否审核通过 -1 拒绝 0 审核中 1 通过',
  `evaluate_nums` bigint(20) NOT NULL DEFAULT '0' COMMENT '评价总人数',
  `evaluate_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '评价总分',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_paidprogram
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_paidprogram_apply`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_paidprogram_apply`;
CREATE TABLE `cmf_paidprogram_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核状态 -1 拒绝 0 审核中 1 通过',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `percent` int(11) NOT NULL DEFAULT '0' COMMENT '抽水比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_paidprogram_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_paidprogram_class`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_paidprogram_class`;
CREATE TABLE `cmf_paidprogram_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名称',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0不显示 1 显示',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_paidprogram_class
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_paidprogram_comment`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_paidprogram_comment`;
CREATE TABLE `cmf_paidprogram_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` bigint(20) NOT NULL DEFAULT '0' COMMENT '项目发布者ID',
  `object_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '付费项目ID',
  `grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '评价等级',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_paidprogram_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_paidprogram_order`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_paidprogram_order`;
CREATE TABLE `cmf_paidprogram_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` bigint(20) NOT NULL DEFAULT '0' COMMENT '付费项目发布者ID',
  `object_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '付费项目ID',
  `type` tinyint(1) NOT NULL COMMENT '支付方式 1 支付宝 2 微信 3 余额 4 微信小程序 5 paypal 6 Braintree_paypal',
  `status` tinyint(1) NOT NULL COMMENT '订单状态 0 未支付 1 已支付',
  `orderno` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '三方订单编号',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '下单时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 0 否 1 是（用于删除付费项目）',
  PRIMARY KEY (`id`),
  KEY `uid_objectid_status` (`uid`,`object_id`,`status`) USING BTREE,
  KEY `uid_status` (`uid`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_paidprogram_order
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_plugin`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_plugin`;
CREATE TABLE `cmf_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` varchar(255) NOT NULL COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='插件表';

-- ----------------------------
-- Records of cmf_plugin
-- ----------------------------
INSERT INTO `cmf_plugin` VALUES ('1', '1', '0', '1', '0', 'Qiniu', '七牛云存储', '', '', 'ThinkCMF', '', '1.0.1', 'ThinkCMF七牛专享优惠码:507670e8', '{\"accessKey\":\"\",\"secretKey\":\"\",\"protocol\":\"https\",\"domain\":\"\",\"bucket\":\"\",\"zone\":\"z0\"}');

-- ----------------------------
-- Table structure for `cmf_portal_category`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category`;
CREATE TABLE `cmf_portal_category` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类父id',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类文章数',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '分类层级关系路径',
  `seo_title` varchar(100) NOT NULL DEFAULT '',
  `seo_keywords` varchar(255) NOT NULL DEFAULT '',
  `seo_description` varchar(255) NOT NULL DEFAULT '',
  `list_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类列表模板',
  `one_tpl` varchar(50) NOT NULL DEFAULT '' COMMENT '分类文章页模板',
  `more` text COMMENT '扩展属性',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章分类表';

-- ----------------------------
-- Records of cmf_portal_category
-- ----------------------------
INSERT INTO `cmf_portal_category` VALUES ('1', '0', '0', '0', '0', '10000', 'ceshi1', '', '0-1', '', '', '', '', '', '{\"thumbnail\":\"\"}');
INSERT INTO `cmf_portal_category` VALUES ('2', '0', '0', '1', '1620885778', '10000', '111', '', '0-2', '', '', '', '', '', '{\"thumbnail\":\"\"}');

-- ----------------------------
-- Table structure for `cmf_portal_category_post`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_category_post`;
CREATE TABLE `cmf_portal_category_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章id',
  `category_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `term_taxonomy_id` (`category_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='portal应用 分类文章对应表';

-- ----------------------------
-- Records of cmf_portal_category_post
-- ----------------------------
INSERT INTO `cmf_portal_category_post` VALUES ('1', '2', '1', '10000', '0');

-- ----------------------------
-- Table structure for `cmf_portal_post`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_post`;
CREATE TABLE `cmf_portal_post` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `post_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类型,1:文章;2:页面',
  `post_format` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '内容格式;1:html;2:md',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发表者用户id',
  `post_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:已发布;0:未发布;',
  `comment_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '评论状态;1:允许;0:不允许',
  `is_top` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶;1:置顶;0:不置顶',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_hits` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '查看数',
  `post_favorites` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '收藏数',
  `post_like` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `comment_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `published_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `post_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'post标题',
  `post_keywords` varchar(150) NOT NULL DEFAULT '' COMMENT 'seo keywords',
  `post_excerpt` varchar(500) NOT NULL DEFAULT '' COMMENT 'post摘要',
  `post_source` varchar(150) NOT NULL DEFAULT '' COMMENT '转载文章的来源',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `post_content` longtext COMMENT '文章内容',
  `post_content_filtered` text COMMENT '处理过的文章内容',
  `more` text COMMENT '扩展属性,如缩略图;格式为json',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '页面类型，0单页面，2关于我们',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`create_time`,`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章表';

-- ----------------------------
-- Records of cmf_portal_post
-- ----------------------------
INSERT INTO `cmf_portal_post` VALUES ('2', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575612912', '1603088562', '1575612840', '0', '社区公约', '', '', '', '', '&lt;p&gt;  社区公约，内容可在管理后台设置。&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '2', '1');
INSERT INTO `cmf_portal_post` VALUES ('3', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575612937', '1589269790', '1575612900', '0', '隐私政策', '', '', '', '', '\n&lt;p style=&quot;white-space: normal;&quot;&gt;  隐私政策，内容可在管理后台设置。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '2', '9999');
INSERT INTO `cmf_portal_post` VALUES ('4', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575612961', '1589269754', '1575612900', '0', '服务协议', '', '', '', '', '&lt;p&gt;  服务协议，内容可在管理后台设置。&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '2', '9999');
INSERT INTO `cmf_portal_post` VALUES ('5', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575612983', '1578534055', '1575612960', '0', '联系我们', '', '', '', '', '\n&lt;p style=&quot;margin-top: 0px; margin-bottom: 20px; white-space: normal; padding: 0px; font-size: 14px; line-height: 25.2px; text-indent: 28px; color: rgb(85, 85, 85); font-family: arial, &quot;&gt;联系我们，内容可在管理后台设置。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '2', '9999');
INSERT INTO `cmf_portal_post` VALUES ('6', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575613058', '1591087668', '1575613020', '0', '用户充值协议', '', '', '', '', '&lt;p&gt;用户充值协议用户充值协议用户充值协议用户充值协议&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('10', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575613012', '1578534178', '1575612960', '0', '主播协议', '', '', '', '', '&lt;p&gt;   主播协议，内容可在管理后台设置。&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '2', '9999');
INSERT INTO `cmf_portal_post` VALUES ('18', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575613036', '1599550227', '1575612960', '0', '签约说明', '', '', '', '', '&lt;p&gt;签约说明&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('26', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575613184', '1575613184', '1575613140', '0', '幸运礼物说明', '', '', '', '', '&lt;p&gt;幸运礼物功能，用户送出“幸运礼物”会有几率获得礼物翻倍中奖和奖池中奖的机会。&lt;/p&gt;', null, '{\"thumbnail\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('31', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1576912662', '1578565627', '1576912620', '0', '直播带货功能', '', '', '', '', '&lt;p&gt;轮播1&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('33', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1576913347', '1613809019', '1576913280', '0', '直播系统', '', '', '', '', '&lt;p&gt;轮播2&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('34', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1576913387', '1578565656', '1576913340', '0', '超值服务', '', '', '', '', '&lt;p&gt;轮播3&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('35', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1575613926', '1594174677', '1575613860', '0', '转盘规则', '', '', '', '', '&lt;p&gt;转盘规则转盘规则转盘规则&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('38', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1576655010', '1578562536', '1576654980', '0', '小店界面联系客服', '', '', '', '', '&lt;p&gt;小店界面联系客服&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('39', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1576655030', '1576655030', '1576654980', '0', '道具礼物说明', '', '', '', '', '\n&lt;p style=&quot;white-space: normal;&quot;&gt;道具礼物说明&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;道具礼物说明&lt;/p&gt;\n&lt;p style=&quot;white-space: normal;&quot;&gt;道具礼物说明&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('40', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1585211267', '1593574434', '1585211220', '0', '付费内容管理规范', '', '', '', '', '&lt;p&gt;付费内容管理规范说明&lt;/p&gt;', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');
INSERT INTO `cmf_portal_post` VALUES ('44', '0', '2', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '1592911539', '1621565471', '1592911500', '0', '注销账号', '', '', '', '', '\n&lt;p style=&quot;white-space: normal; line-height: 1.5em;&quot;&gt;&lt;strong&gt;    注销账号是不可恢复的操作，你应自行备份账号相关的信息和数据，操作之前，请确认与账号相关的所有服务均已妥善处理。&lt;/strong&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal; line-height: 1.5em;&quot;&gt;&lt;strong&gt;     注销账号后，你将无法再使用本账号或找回你添加的任何内容信息，包括但不限于：&lt;/strong&gt;&lt;/p&gt;\n&lt;p style=&quot;white-space: normal; line-height: 1.5em;&quot;&gt;（1）你将无法登录、使用本账号，你的朋友将无法通过本账号联系你。&lt;/p&gt;\n&lt;p style=&quot;white-space: normal; line-height: 1.5em;&quot;&gt;（2）你账号的个人资料和历史信息（包含昵称、头像、作品、消息记录、粉丝、关注等）都将无法找回。&lt;/p&gt;\n&lt;p style=&quot;white-space: normal; line-height: 1.5em;&quot;&gt;（3）关注你账号的所有用户将被取消关注，与账号相关的所有功能或服务都将无法继续使用。&lt;/p&gt;\n&lt;p&gt;&lt;br&gt;&lt;/p&gt;\n', null, '{\"thumbnail\":\"\",\"template\":\"\"}', '0', '9999');

-- ----------------------------
-- Table structure for `cmf_portal_tag`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag`;
CREATE TABLE `cmf_portal_tag` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布,0:不发布',
  `recommended` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否推荐;1:推荐;0:不推荐',
  `post_count` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签文章数',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '标签名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='portal应用 文章标签表';

-- ----------------------------
-- Records of cmf_portal_tag
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_portal_tag_post`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_portal_tag_post`;
CREATE TABLE `cmf_portal_tag_post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '标签 id',
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文章 id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:发布;0:不发布',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='portal应用 标签文章对应表';

-- ----------------------------
-- Records of cmf_portal_tag_post
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_pushrecord`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_pushrecord`;
CREATE TABLE `cmf_pushrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `touid` text NOT NULL COMMENT '推送对象',
  `content` text NOT NULL COMMENT '推送内容',
  `adminid` int(11) NOT NULL COMMENT '管理员ID',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员账号',
  `ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '管理员IP地址',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '发送时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '消息类型 0 后台手动发布的系统消息 1 商品消息 2 认证消息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_pushrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_recycle_bin`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_recycle_bin`;
CREATE TABLE `cmf_recycle_bin` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT '0' COMMENT '删除内容 id',
  `create_time` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  `table_name` varchar(60) DEFAULT '' COMMENT '删除内容所在表名',
  `name` varchar(255) DEFAULT '' COMMENT '删除内容名称',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT=' 回收站';

-- ----------------------------
-- Records of cmf_recycle_bin
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_red`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_red`;
CREATE TABLE `cmf_red` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL DEFAULT '0' COMMENT '直播标识',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `liveuid` int(11) NOT NULL DEFAULT '0' COMMENT '主播ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '红包类型，0平均，1手气',
  `type_grant` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发放类型，0立即，1延迟',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '钻石数',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `des` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `effecttime` int(11) NOT NULL DEFAULT '0' COMMENT '生效时间',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0抢中，1抢完',
  `coin_rob` int(11) NOT NULL DEFAULT '0' COMMENT '钻石数',
  `nums_rob` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  PRIMARY KEY (`id`),
  KEY `liveuid_showid` (`showid`,`liveuid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_red
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_red_record`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_red_record`;
CREATE TABLE `cmf_red_record` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `redid` int(11) NOT NULL DEFAULT '0' COMMENT '红包ID',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金额',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `redid` (`redid`) USING BTREE COMMENT '红包ID索引'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_red_record
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_report`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_report`;
CREATE TABLE `cmf_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '对方ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_report
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_report_classify`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_report_classify`;
CREATE TABLE `cmf_report_classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` int(10) NOT NULL DEFAULT '9999' COMMENT '排序',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '举报类型名称',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_report_classify
-- ----------------------------
INSERT INTO `cmf_report_classify` VALUES ('1', '0', '骗取点击', '1544855181');
INSERT INTO `cmf_report_classify` VALUES ('2', '0', '低俗色情', '1544855189');
INSERT INTO `cmf_report_classify` VALUES ('3', '0', '侮辱谩骂', '1544855198');
INSERT INTO `cmf_report_classify` VALUES ('4', '0', '盗用他人作品', '1544855213');
INSERT INTO `cmf_report_classify` VALUES ('5', '0', '引人不适', '1544855224');
INSERT INTO `cmf_report_classify` VALUES ('6', '0', '任性打抱不平，就爱举报', '1544855259');
INSERT INTO `cmf_report_classify` VALUES ('7', '0', '其他', '1544855273');
INSERT INTO `cmf_report_classify` VALUES ('8', '9999', '垃圾广告', '1599709932');
INSERT INTO `cmf_report_classify` VALUES ('9', '9999', '用户为未成年', '1599709942');

-- ----------------------------
-- Table structure for `cmf_role`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role`;
CREATE TABLE `cmf_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='角色表';

-- ----------------------------
-- Records of cmf_role
-- ----------------------------
INSERT INTO `cmf_role` VALUES ('1', '0', '1', '1329633709', '1329633709', '0', '超级管理员', '拥有网站最高管理员权限！');

-- ----------------------------
-- Table structure for `cmf_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_role_user`;
CREATE TABLE `cmf_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of cmf_role_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_route`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_route`;
CREATE TABLE `cmf_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态;1:启用,0:不启用',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'URL规则类型;1:用户自定义;2:别名添加',
  `full_url` varchar(255) NOT NULL DEFAULT '' COMMENT '完整url',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '实际显示的url',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='url路由表';

-- ----------------------------
-- Records of cmf_route
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_seller_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_seller_goods_class`;
CREATE TABLE `cmf_seller_goods_class` (
  `uid` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `goods_classid` int(11) NOT NULL DEFAULT '0' COMMENT '商品一级分类id',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示 0 否 1 是'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_seller_goods_class
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_seller_platform_goods`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_seller_platform_goods`;
CREATE TABLE `cmf_seller_platform_goods` (
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `goodsid` bigint(20) NOT NULL DEFAULT '0' COMMENT '平台自营商品ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品售卖状态 0 下架 1 上架',
  `issale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品是否直播间在售 0 否 1 是',
  `live_isshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '直播间是否展示商品简介 0 否 1 是 默认0',
  KEY `uid_goodsid` (`uid`,`goodsid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_seller_platform_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_sendcode`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_sendcode`;
CREATE TABLE `cmf_sendcode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '消息类型，1表示短信验证码，2表示邮箱验证码',
  `account` varchar(255) NOT NULL COMMENT '接收账号',
  `content` text NOT NULL COMMENT '消息内容',
  `addtime` int(11) NOT NULL COMMENT '提交时间',
  `send_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送验证码类型 1 阿里云 2 容联云 3 腾讯云',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_sendcode
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_address`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_address`;
CREATE TABLE `cmf_shop_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `country_code` int(11) NOT NULL DEFAULT '86' COMMENT '国家代号',
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为默认地址 0 否 1 是',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_address
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_apply`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_apply`;
CREATE TABLE `cmf_shop_apply` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '封面',
  `des` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `cardno` varchar(255) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `country_code` int(11) NOT NULL DEFAULT '86' COMMENT '国家代号',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '电话',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '市',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '地区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `service_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '客服电话',
  `receiver` varchar(255) NOT NULL DEFAULT '' COMMENT '退货收货人',
  `receiver_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '退货人联系电话',
  `receiver_province` varchar(255) NOT NULL DEFAULT '' COMMENT '退货人省份',
  `receiver_city` varchar(255) NOT NULL DEFAULT '' COMMENT '退货人市',
  `receiver_area` varchar(255) NOT NULL COMMENT '退货人地区',
  `receiver_address` varchar(255) NOT NULL COMMENT '退货人详细地址',
  `license` varchar(255) NOT NULL DEFAULT '' COMMENT '许可证',
  `certificate` varchar(255) NOT NULL DEFAULT '' COMMENT '营业执照',
  `other` varchar(255) NOT NULL COMMENT '其他证件',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0审核中1通过2拒绝',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '原因',
  `order_percent` int(11) NOT NULL DEFAULT '0' COMMENT '订单分成比例',
  `sale_nums` bigint(11) NOT NULL DEFAULT '0' COMMENT '店铺总销量',
  `quality_points` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '店铺商品质量(商品描述)平均分',
  `service_points` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '店铺服务态度平均分',
  `express_points` float(11,1) NOT NULL DEFAULT '0.0' COMMENT '物流服务平均分',
  `shipment_overdue_num` int(11) NOT NULL DEFAULT '0' COMMENT '店铺逾期发货次数',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_apply
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_bond`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_bond`;
CREATE TABLE `cmf_shop_bond` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `bond` int(11) NOT NULL DEFAULT '0' COMMENT '保证金',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态，0已退回1已支付,-1已扣除',
  `addtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `uptime` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_shop_bond
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_express`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_express`;
CREATE TABLE `cmf_shop_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `express_name` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司电话',
  `express_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司客服电话',
  `express_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司图标',
  `express_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示 0 否 1 是',
  `express_code` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司对应三方平台的编码',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '编辑时间',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_express
-- ----------------------------
INSERT INTO `cmf_shop_express` VALUES ('1', '顺丰速运', '95338', 'express_1.png', '1', 'SF', '1583898216', '1586230241', '1');
INSERT INTO `cmf_shop_express` VALUES ('2', '韵达速递', '95546', 'express_2.png', '0', 'YD', '1583905367', '1605668643', '2');
INSERT INTO `cmf_shop_express` VALUES ('3', '中通快递', '95311', 'express_3.png', '1', 'ZTO', '1583905579', '0', '3');
INSERT INTO `cmf_shop_express` VALUES ('4', '圆通速递', '95554', 'express_4.png', '1', 'YTO', '1583905611', '1586230191', '4');
INSERT INTO `cmf_shop_express` VALUES ('5', '申通快递', '95543', 'express_5.png', '1', 'STO', '1583905650', '0', '5');
INSERT INTO `cmf_shop_express` VALUES ('6', '中国邮政', '11183', 'express_6.png', '1', 'YZPY', '1583905722', '0', '6');
INSERT INTO `cmf_shop_express` VALUES ('7', '百世快递', '95320', 'express_7.png', '1', 'HTKY', '1583905749', '0', '7');
INSERT INTO `cmf_shop_express` VALUES ('8', '宅急送', '400-6789-000', 'express_8.png', '1', 'ZJS', '1583905771', '0', '8');

-- ----------------------------
-- Table structure for `cmf_shop_goods`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_goods`;
CREATE TABLE `cmf_shop_goods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `one_classid` int(11) NOT NULL DEFAULT '0' COMMENT '商品一级分类',
  `two_classid` int(11) NOT NULL DEFAULT '0' COMMENT '商品二级分类',
  `three_classid` int(11) NOT NULL DEFAULT '0' COMMENT '商品三级分类',
  `video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '商品视频地址',
  `video_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '商品视频封面',
  `thumbs` text NOT NULL COMMENT '封面',
  `content` longtext NOT NULL COMMENT '商品文字内容',
  `pictures` text NOT NULL COMMENT '商品内容图集',
  `specs` longtext NOT NULL COMMENT '商品规格',
  `postage` int(11) NOT NULL DEFAULT '0' COMMENT '邮费',
  `addtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '时间',
  `uptime` bigint(20) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0审核中-1商家下架1通过-2管理员下架 2拒绝',
  `isrecom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐，0否1是',
  `sale_nums` int(11) NOT NULL DEFAULT '0' COMMENT '总销量',
  `refuse_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '商品拒绝原因',
  `issale` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品是否在直播间销售 0 否 1 是(针对用户自己发布的商品)',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品类型 0 站内商品 1 站外商品 2平台自营',
  `original_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '站外商品原价',
  `present_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '站外商品现价',
  `goods_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '站外商品简介',
  `href` varchar(255) NOT NULL DEFAULT '' COMMENT '站外商品链接',
  `live_isshow` tinyint(1) NOT NULL DEFAULT '0' COMMENT '直播间是否展示商品简介 0 否 1 是 默认0',
  `low_price` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '站外商品最低价',
  `admin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '发布自营商品的管理员id',
  `commission` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '主播代卖平台商品的佣金',
  PRIMARY KEY (`id`),
  KEY `uid_status` (`uid`,`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_goods
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_goods_class`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_goods_class`;
CREATE TABLE `cmf_shop_goods_class` (
  `gc_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品分类ID',
  `gc_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类名称',
  `gc_parentid` int(11) NOT NULL DEFAULT '0' COMMENT '上级分类ID',
  `gc_one_id` int(11) NOT NULL COMMENT '所属一级分类ID',
  `gc_sort` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类排序号',
  `gc_isshow` tinyint(1) NOT NULL COMMENT '是否展示 0 否 1 是',
  `gc_addtime` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类添加时间',
  `gc_edittime` int(11) NOT NULL DEFAULT '0' COMMENT '商品分类修改时间',
  `gc_grade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品分类等级',
  `gc_icon` varchar(255) NOT NULL COMMENT '商品分类图标',
  PRIMARY KEY (`gc_id`) USING BTREE,
  KEY `list1` (`gc_parentid`,`gc_isshow`) USING BTREE,
  KEY `gc_parentid` (`gc_parentid`) USING BTREE,
  KEY `gc_grade` (`gc_grade`) USING BTREE,
  KEY `list2` (`gc_one_id`,`gc_grade`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_shop_goods_class
-- ----------------------------
INSERT INTO `cmf_shop_goods_class` VALUES ('1', '手机/数码/电脑办公', '0', '0', '111', '1', '1581417338', '1605592066', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('2', '手机', '1', '1', '12234', '1', '1581418030', '0', '2', 'shop_two_class_1.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('3', '华为', '2', '1', '1', '1', '1581419247', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('4', '苹果', '2', '1', '2423', '1', '1581419261', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('5', '小米', '2', '1', '3', '1', '1581419272', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('6', 'OPPO', '2', '1', '4', '1', '1581419284', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('7', 'vivo', '2', '1', '5', '1', '1581419312', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('8', '数码', '1', '1', '223423', '1', '1581420086', '1581581595', '2', 'shop_two_class_2.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('9', '佳能', '8', '1', '1234', '1', '1581420123', '1581581595', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('11', '索尼', '8', '1', '3234', '1', '1581420243', '1581581595', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('12', '三星', '2', '1', '6', '1', '1581559545', '1581580638', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('13', '电脑办公', '1', '1', '11', '1', '1581559571', '1599217485', '2', 'shop_two_class_3.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('14', '华硕', '13', '1', '11', '1', '1581559693', '1599217485', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('15', '戴尔', '13', '1', '1', '1', '1581559874', '1599217485', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('16', '惠普', '13', '1', '1', '1', '1581559886', '1599217485', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('17', '宏碁', '13', '1', '1', '1', '1581559897', '1599217485', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('18', '联想', '13', '1', '1', '1', '1581559911', '1599217485', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('19', '家具/家饰/家纺', '0', '0', '3000', '1', '1582271415', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('20', '家具', '19', '19', '1', '1', '1582271459', '0', '2', 'shop_two_class_4.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('21', '布艺软饰', '19', '19', '2', '1', '1582271471', '0', '2', 'shop_two_class_5.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('22', '床上用品', '19', '19', '3', '1', '1582271491', '0', '2', 'shop_two_class_6.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('23', '沙发', '20', '19', '1', '1', '1582271560', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('24', '床', '20', '19', '2', '1', '1582271574', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('25', '电视柜', '20', '19', '3', '1', '1582271588', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('26', '鞋柜', '20', '19', '4', '1', '1582271607', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('27', '窗帘', '21', '19', '1', '1', '1582272244', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('28', '地毯', '21', '19', '2', '1', '1582272254', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('29', '桌布', '21', '19', '3', '1', '1582272265', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('30', '沙发垫', '21', '19', '4', '1', '1582272281', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('31', '四件套', '22', '19', '1', '1', '1582272322', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('32', '空调被', '22', '19', '2', '1', '1582272331', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('33', '夏凉被', '22', '19', '3', '1', '1582272341', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('34', '枕头', '22', '19', '4', '1', '1582272378', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('35', '竹席', '22', '19', '5', '1', '1582272404', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('36', '美食/生鲜/零食', '0', '0', '1111', '1', '1582272626', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('37', '美食', '36', '36', '11', '1', '1582272696', '0', '2', 'shop_two_class_7.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('38', '生鲜', '36', '36', '2', '1', '1582272705', '0', '2', 'shop_two_class_8.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('39', '零食', '36', '36', '3', '1', '1582272715', '0', '2', 'shop_two_class_9.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('40', '牛奶', '37', '36', '1', '1', '1582272837', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('41', '红茶', '37', '36', '2', '1', '1582272847', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('42', '绿茶', '37', '36', '2', '1', '1582272857', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('43', '黑茶', '37', '36', '3', '1', '1582272868', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('44', '荔枝', '38', '36', '1', '1', '1582272950', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('45', '芒果', '38', '36', '2', '1', '1582272959', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('46', '樱桃', '38', '36', '3', '1', '1582272968', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('47', '小龙虾', '38', '36', '4', '1', '1582272994', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('48', '三文鱼', '38', '36', '5', '1', '1582273003', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('49', '零食大礼包', '39', '36', '1', '1', '1582273055', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('50', '面包', '39', '36', '2', '1', '1582273064', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('51', '巧克力', '39', '36', '3', '1', '1582273093', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('52', '鱼干', '39', '36', '4', '1', '1582273115', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('53', '女鞋/箱包/钟表/珠宝', '0', '0', '4', '1', '1582772109', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('54', '精品女鞋', '53', '53', '1', '1', '1582772122', '1582772266', '2', 'shop_two_class_10.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('55', '潮流女包', '53', '53', '2', '1', '1582772155', '0', '2', 'shop_two_class_11.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('56', '精品男包', '53', '53', '3', '1', '1582772177', '0', '2', 'shop_two_class_12.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('57', '功能箱包', '53', '53', '4', '1', '1582772204', '0', '2', 'shop_two_class_13.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('58', '钟表', '53', '53', '5', '1', '1582772232', '0', '2', 'shop_two_class_14.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('59', '珠宝首饰', '53', '53', '6', '1', '1582772248', '0', '2', 'shop_two_class_15.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('60', '马丁靴', '54', '53', '1', '1', '1582772311', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('61', '高跟鞋', '54', '53', '2', '1', '1582772323', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('62', '帆布鞋', '54', '53', '3', '1', '1582772346', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('63', '松糕鞋', '54', '53', '4', '1', '1582772416', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('64', '真皮包', '55', '53', '1', '1', '1582772438', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('65', '单肩包', '55', '53', '2', '1', '1582772449', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('66', '斜挎包', '55', '53', '3', '1', '1582772460', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('67', '钱包', '55', '53', '4', '1', '1582772479', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('68', '手拿包', '55', '53', '5', '1', '1582772488', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('69', '钥匙包', '55', '53', '6', '1', '1582772505', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('70', '男士钱包', '56', '53', '1', '1', '1582772539', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('71', '双肩包', '56', '53', '2', '1', '1582772568', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('72', '单肩/斜挎包', '56', '53', '3', '1', '1582772590', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('73', '商务公文包', '56', '53', '4', '1', '1582772614', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('74', '拉杆箱', '57', '53', '1', '1', '1582772654', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('75', '旅行包', '57', '53', '2', '1', '1582772664', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('76', '电脑包', '57', '53', '3', '1', '1582772674', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('77', '登山包', '57', '53', '4', '1', '1582772699', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('78', '休闲运动包', '57', '53', '5', '1', '1582772722', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('79', '天梭', '58', '53', '1', '1', '1582772745', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('80', '浪琴', '58', '53', '2', '1', '1582772760', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('81', '欧米茄', '58', '53', '3', '1', '1582772770', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('82', '卡西欧', '58', '53', '4', '1', '1582772790', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('83', '天王', '58', '53', '5', '1', '1582772810', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('84', '闹钟', '58', '53', '6', '1', '1582772828', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('85', '挂钟', '58', '53', '7', '1', '1582772838', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('86', '座钟', '58', '53', '8', '1', '1582772852', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('87', '钟表配件', '58', '53', '9', '1', '1582772870', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('88', '黄金', '59', '53', '1', '1', '1582772908', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('89', '钻石', '59', '53', '2', '1', '1582772917', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('90', '翡翠玉石', '59', '53', '3', '1', '1582772928', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('91', '水晶玛瑙', '59', '53', '4', '1', '1582772950', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('92', '手串/把件', '59', '53', '5', '1', '1582772978', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('93', '银饰', '59', '53', '6', '1', '1582773002', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('94', '珍珠', '59', '53', '7', '1', '1582773012', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('95', '汽车/汽车用品', '0', '0', '5', '1', '1582773070', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('96', '汽车装饰', '95', '95', '1', '1', '1582773104', '0', '2', 'shop_two_class_16.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('97', '车载电器', '95', '95', '2', '1', '1582773118', '0', '2', 'shop_two_class_17.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('98', '汽车美容', '95', '95', '3', '1', '1582773147', '0', '2', 'shop_two_class_18.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('99', '随车用品', '95', '95', '4', '1', '1582773181', '0', '2', 'shop_two_class_19.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('100', '坐垫套装', '96', '95', '1', '1', '1582773212', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('101', '脚垫', '96', '95', '2', '1', '1582773223', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('102', '方向盘套', '96', '95', '3', '1', '1582773246', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('103', '装饰灯', '96', '95', '4', '1', '1582773279', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('104', '车衣', '96', '95', '5', '1', '1582773301', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('105', '雨刮器', '96', '95', '6', '1', '1582773313', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('106', '雨眉', '96', '95', '7', '1', '1582773323', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('107', '行车记录仪', '97', '95', '1', '1', '1582773354', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('108', '车载充电器', '97', '95', '2', '1', '1582773367', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('109', '倒车雷达', '97', '95', '3', '1', '1582773398', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('110', '车载吸尘器', '97', '95', '4', '1', '1582773429', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('111', '应急电源', '97', '95', '5', '1', '1582773454', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('112', '车载电器配件', '97', '95', '6', '1', '1582773472', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('113', '洗车机', '98', '95', '1', '1', '1582773497', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('114', '洗车水枪', '98', '95', '2', '1', '1582773508', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('115', '玻璃水', '98', '95', '3', '1', '1582773519', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('116', '车蜡', '98', '95', '4', '1', '1582773539', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('117', '汽车贴膜', '98', '95', '5', '1', '1582773549', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('118', '底盘装甲', '98', '95', '5', '1', '1582773569', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('119', '补漆笔', '98', '95', '6', '1', '1582773587', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('120', '汽车美容配件', '98', '95', '7', '1', '1582773611', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('121', '灭火器', '99', '95', '1', '1', '1582773638', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('122', '保温杯', '99', '95', '2', '1', '1582773647', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('123', '充气泵', '99', '95', '3', '1', '1582773673', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('124', '车载床', '99', '95', '4', '1', '1582773682', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('125', '储物箱', '99', '95', '5', '1', '1582773706', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('126', '母婴/玩具', '0', '0', '6', '1', '1582773775', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('127', '奶粉', '126', '126', '1', '1', '1582773803', '0', '2', 'shop_two_class_20.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('128', '营养辅食', '126', '126', '2', '1', '1582773816', '0', '2', 'shop_two_class_21.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('129', '尿不湿', '126', '126', '3', '1', '1582773833', '0', '2', 'shop_two_class_22.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('130', '喂养用品', '126', '126', '4', '1', '1582773846', '0', '2', 'shop_two_class_23.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('131', '母婴洗护用品', '126', '126', '5', '1', '1582773874', '0', '2', 'shop_two_class_24.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('132', '寝居服饰', '126', '126', '5', '1', '1582773907', '0', '2', 'shop_two_class_25.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('133', '妈妈专区', '126', '126', '6', '1', '1582773924', '0', '2', 'shop_two_class_26.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('134', '童车童床', '126', '126', '7', '1', '1582773943', '0', '2', 'shop_two_class_27.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('135', '玩具', '126', '126', '8', '1', '1582773954', '0', '2', 'shop_two_class_28.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('136', '1段奶粉', '127', '126', '1', '1', '1582773979', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('137', '2段奶粉', '127', '126', '2', '1', '1582773991', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('138', '3段奶粉', '127', '126', '3', '1', '1582774002', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('139', '4段奶粉', '127', '126', '4', '1', '1582774017', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('140', '特殊配方奶粉', '127', '126', '5', '1', '1582774052', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('141', '米粉/菜粉', '128', '126', '1', '1', '1582774085', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('142', '面条/粥', '128', '126', '2', '1', '1582774099', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('143', '果泥/果汁', '128', '126', '3', '1', '1582774138', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('144', '宝宝零食', '128', '126', '4', '1', '1582774157', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('145', 'NB', '129', '126', '1', '1', '1582774204', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('146', 'S', '129', '126', '2', '1', '1582774213', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('147', 'M', '129', '126', '3', '1', '1582774227', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('148', 'L', '129', '126', '4', '1', '1582774246', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('149', 'XL', '129', '126', '5', '1', '1582774263', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('150', '拉拉裤', '129', '126', '6', '1', '1582774276', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('151', '奶瓶奶嘴', '130', '126', '1', '1', '1582774305', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('152', '吸奶器', '130', '126', '2', '1', '1582774316', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('153', '辅食料理机', '130', '126', '3', '1', '1582774332', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('154', '儿童餐具', '130', '126', '4', '1', '1582774350', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('155', '水壶/水杯', '130', '126', '6', '1', '1582774368', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('156', '牙胶安抚', '130', '126', '7', '1', '1582774396', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('157', '宝宝护肤', '131', '126', '1', '1', '1582774430', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('158', '日常护理', '131', '126', '2', '1', '1582774444', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('159', '洗发沐浴', '131', '126', '3', '1', '1582774459', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('160', '驱蚊防晒', '131', '126', '4', '1', '1582774475', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('161', '理发器', '131', '126', '5', '1', '1582774489', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('162', '洗澡用具', '131', '126', '6', '1', '1582774506', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('163', '婴童睡袋/抱被', '132', '126', '1', '1', '1582774553', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('164', '婴童隔尿垫/巾', '132', '126', '2', '1', '1582774570', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('165', '婴童浴巾/浴衣', '132', '126', '3', '1', '1582774584', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('166', '婴童毛巾/口水巾', '132', '126', '4', '1', '1582774597', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('167', '婴童布尿裤/尿布', '132', '126', '5', '1', '1582774613', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('168', '婴儿内衣', '132', '126', '6', '1', '1582774644', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('169', '爬行垫', '132', '126', '7', '1', '1582774660', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('170', '孕妈装', '133', '126', '1', '1', '1582774710', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('171', '孕妇护肤', '133', '126', '2', '1', '1582774727', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('172', '孕妇内衣', '133', '126', '3', '1', '1582774764', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('173', '防溢乳垫', '133', '126', '4', '1', '1582774788', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('174', '婴儿推车', '134', '126', '1', '1', '1582774839', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('175', '婴儿床', '134', '126', '2', '1', '1582774850', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('176', '餐椅', '134', '126', '3', '1', '1582774871', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('177', '学步车', '134', '126', '4', '1', '1582774882', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('178', '积木', '135', '126', '1', '1', '1582774927', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('179', '芭比娃娃', '135', '126', '2', '1', '1582774937', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('180', '毛绒玩具', '135', '126', '3', '1', '1582774967', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('181', '益智玩具', '135', '126', '4', '1', '1582774984', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('182', '服装/男装/女装', '0', '0', '7', '1', '1585703754', '1585703923', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('183', '女装', '182', '182', '1', '1', '1585703810', '1585703948', '2', 'shop_two_class_29.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('184', '卫衣', '183', '182', '1', '1', '1585703834', '1585703967', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('185', '休闲裤', '183', '182', '2', '1', '1585703850', '1585703997', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('186', '男装', '182', '182', '2', '1', '1585704024', '0', '2', 'shop_two_class_30.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('187', '运动服', '186', '182', '1', '1', '1585704052', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('188', '西装', '186', '182', '2', '1', '1585704064', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('189', '衬衫', '186', '182', '3', '1', '1585704100', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('190', '连衣裙', '183', '182', '3', '1', '1585704113', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('191', 'T恤', '183', '182', '4', '1', '1585704128', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('192', '时尚套装', '183', '182', '5', '1', '1585704146', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('193', '医药', '0', '0', '8', '1', '1585705240', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('194', '眼药水', '193', '193', '1', '1', '1585705254', '0', '2', 'shop_two_class_31.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('195', '口罩', '193', '193', '2', '1', '1585705266', '0', '2', 'shop_two_class_32.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('196', 'KN95', '195', '193', '1', '1', '1585709911', '1585721825', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('197', '普通一次医用口罩', '195', '193', '2', '1', '1585709936', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('198', '抗疲劳', '194', '193', '1', '1', '1585709951', '1585721805', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('199', '防近视', '194', '193', '2', '1', '1585709974', '0', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('200', '游戏 / 动漫 / 影视', '0', '0', '9', '1', '1585901648', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('201', '游戏', '200', '200', '1', '1', '1585901690', '1601012289', '2', 'shop_two_class_33.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('202', '动漫周边', '200', '200', '2', '1', '1585901704', '0', '2', 'shop_two_class_34.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('203', '热门影视周边', '200', '200', '3', '1', '1585901720', '0', '2', 'shop_two_class_35.png');
INSERT INTO `cmf_shop_goods_class` VALUES ('204', 'DNF', '201', '200', '1', '1', '1585901741', '1601012289', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('205', '梦幻西游', '201', '200', '2', '1', '1585901748', '1601012289', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('206', ' 魔兽', '201', '200', '3', '1', '1585901759', '1601012289', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('207', 'LOL', '201', '200', '4', '1', '1585901770', '1601012289', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('208', '坦克世界', '201', '200', '5', '1', '1585901783', '1601012289', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('209', '剑网3', '201', '200', '6', '1', '1585901797', '1601012289', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('211', 'DOTA2', '201', '200', '7', '1', '1585901826', '1601012289', '3', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('212', '笔记本', '0', '0', '1111', '1', '1599286060', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('213', '好好', '0', '0', '7', '1', '1599286121', '0', '1', '');
INSERT INTO `cmf_shop_goods_class` VALUES ('217', '英雄', '13', '1', '4', '1', '1605600136', '0', '3', '');

-- ----------------------------
-- Table structure for `cmf_shop_order`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_order`;
CREATE TABLE `cmf_shop_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '购买者ID',
  `shop_uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '卖家用户ID',
  `goodsid` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品id',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `spec_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品规格ID',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '规格名称',
  `spec_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '规格封面',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `price` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品单价',
  `total` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '商品总价（包含邮费）',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '购买者姓名',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '购买者联系电话',
  `country` varchar(255) NOT NULL DEFAULT '' COMMENT '国家',
  `country_code` int(11) NOT NULL DEFAULT '0' COMMENT '国家代号',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '购买者省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '购买者市',
  `area` varchar(255) NOT NULL DEFAULT '' COMMENT '购买者地区',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '购买者详细地址',
  `postage` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `orderno` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单类型 1 支付宝 2 微信 3 余额 4 微信小程序 5 paypal 6 Braintree_paypal',
  `trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '三方订单号',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '订单状态  -1 已关闭  0 待付款 1 待发货 2 待收货 3 待评价 4 已评价 5 退款',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '订单添加时间',
  `cancel_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单取消时间',
  `paytime` int(11) NOT NULL DEFAULT '0' COMMENT '订单付款时间',
  `shipment_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单发货时间',
  `receive_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单收货时间',
  `evaluate_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单评价时间',
  `settlement_time` int(11) NOT NULL DEFAULT '0' COMMENT '订单结算时间（款项打给卖家）',
  `is_append_evaluate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可追加评价',
  `order_percent` int(11) NOT NULL DEFAULT '0' COMMENT '订单抽成比例',
  `refund_starttime` int(11) NOT NULL DEFAULT '0' COMMENT '订单发起退款时间',
  `refund_endtime` int(11) NOT NULL DEFAULT '0' COMMENT '订单退款处理结束时间',
  `refund_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款处理结果 -2取消申请 -1 失败 0 处理中 1 成功 ',
  `refund_shop_result` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款时卖家处理结果 0 未处理 -1 拒绝 1 同意',
  `express_name` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司电话',
  `express_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司图标',
  `express_code` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司对应三方平台的编码',
  `express_number` varchar(255) NOT NULL DEFAULT '' COMMENT '物流单号',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '订单是否删除 0 否 -1 买家删除 -2 卖家删除 1 买家卖家都删除',
  `message` varchar(255) NOT NULL DEFAULT '' COMMENT '买家留言内容',
  `commission` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '平台自营商品设置的代售佣金',
  `liveuid` bigint(20) NOT NULL DEFAULT '0' COMMENT '代售平台商品的主播ID',
  `admin_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '发布自营商品的管理员id',
  PRIMARY KEY (`id`),
  KEY `id_uid` (`id`,`uid`) USING BTREE,
  KEY `shopuid_status` (`shop_uid`,`status`) USING BTREE,
  KEY `shopuid_status_refundstatus` (`shop_uid`,`status`,`refund_status`) USING BTREE,
  KEY `id_shopuid` (`id`,`shop_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_order
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_order_comments`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_order_comments`;
CREATE TABLE `cmf_shop_order_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `orderid` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品订单ID',
  `goodsid` bigint(20) NOT NULL COMMENT '商品ID',
  `shop_uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺用户id',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '文字内容',
  `thumbs` text NOT NULL COMMENT '评论图片列表',
  `video_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '视频封面',
  `video_url` varchar(255) NOT NULL DEFAULT '' COMMENT '视频地址',
  `is_anonym` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否匿名 0否 1是',
  `quality_points` tinyint(1) NOT NULL DEFAULT '0' COMMENT '商品描述评分',
  `service_points` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务态度评分',
  `express_points` tinyint(1) NOT NULL DEFAULT '0' COMMENT '物流速度评分',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_append` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否是追评0 否 1 是',
  PRIMARY KEY (`id`),
  KEY `goodsid_isappend` (`goodsid`,`is_append`) USING BTREE,
  KEY `uid_orderid` (`uid`,`orderid`,`is_append`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_order_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_order_message`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_order_message`;
CREATE TABLE `cmf_shop_order_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL COMMENT '消息内容',
  `orderid` bigint(20) NOT NULL DEFAULT '0',
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '接受消息用户ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户身份 0买家 1卖家',
  `is_commission` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否订单结算消息 0 否 1 是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_order_message
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_order_refund`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_order_refund`;
CREATE TABLE `cmf_shop_order_refund` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '买家id',
  `orderid` bigint(20) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `goodsid` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `shop_uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '商家ID',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `content` varchar(300) NOT NULL DEFAULT '' COMMENT '退款说明',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '退款图片（废弃）',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款类型 0 仅退款 1退货退款',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `shop_process_time` int(11) NOT NULL DEFAULT '0' COMMENT '店铺处理时间',
  `shop_result` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺处理结果 -1 拒绝 0 处理中 1 同意',
  `shop_process_num` tinyint(1) NOT NULL DEFAULT '0' COMMENT '店铺驳回次数',
  `platform_process_time` int(11) NOT NULL DEFAULT '0' COMMENT '平台处理时间',
  `platform_result` tinyint(1) NOT NULL DEFAULT '0' COMMENT '平台处理结果 -1 拒绝 0 处理中 1 同意',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '平台处理账号',
  `ip` bigint(20) NOT NULL DEFAULT '0' COMMENT '平台账号ip',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '退款处理状态 0 处理中 -1 买家已取消 1 已完成 ',
  `is_platform_interpose` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否平台介入 0 否 1 是',
  `system_process_time` int(11) NOT NULL DEFAULT '0' COMMENT '系统自动处理时间',
  `platform_interpose_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '申请平台介入的理由',
  `platform_interpose_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '申请平台介入的详细原因',
  `platform_interpose_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '申请平台介入的图片举证',
  PRIMARY KEY (`id`),
  KEY `uid_orderid` (`uid`,`orderid`) USING BTREE,
  KEY `orderid_shopuid` (`orderid`,`shop_uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_order_refund
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_order_refund_list`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_order_refund_list`;
CREATE TABLE `cmf_shop_order_refund_list` (
  `orderid` bigint(11) NOT NULL DEFAULT '0' COMMENT '订单ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '处理方 1 买家 2 卖家 3 平台 4 系统',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `desc` varchar(255) NOT NULL DEFAULT '' COMMENT '处理说明',
  `handle_desc` varchar(300) NOT NULL DEFAULT '' COMMENT '处理备注说明',
  `refuse_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '卖家拒绝理由'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_order_refund_list
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_platform_reason`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_platform_reason`;
CREATE TABLE `cmf_shop_platform_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '原因名称',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0不显示 1 显示',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_platform_reason
-- ----------------------------
INSERT INTO `cmf_shop_platform_reason` VALUES ('1', '卖家未履行约定', '1', '1', '1584774096', '1589785484');
INSERT INTO `cmf_shop_platform_reason` VALUES ('2', '商品质量存在问题', '2', '1', '1584774114', '0');
INSERT INTO `cmf_shop_platform_reason` VALUES ('3', '卖家态度蛮横无理', '3', '1', '1584774131', '0');
INSERT INTO `cmf_shop_platform_reason` VALUES ('4', '其它', '4', '1', '1589785536', '0');

-- ----------------------------
-- Table structure for `cmf_shop_points`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_points`;
CREATE TABLE `cmf_shop_points` (
  `shop_uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '店铺用户ID',
  `evaluate_total` bigint(20) NOT NULL DEFAULT '0' COMMENT '评价总数',
  `quality_points_total` int(11) NOT NULL DEFAULT '0' COMMENT '店铺商品质量(商品描述)总分',
  `service_points_total` int(11) NOT NULL DEFAULT '0' COMMENT '店铺服务态度总分',
  `express_points_total` int(11) NOT NULL DEFAULT '0' COMMENT '物流服务总分'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_points
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_shop_refund_reason`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_refund_reason`;
CREATE TABLE `cmf_shop_refund_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '原因名称',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0不显示 1 显示',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_refund_reason
-- ----------------------------
INSERT INTO `cmf_shop_refund_reason` VALUES ('1', '拍错/拍多/不想要了', '1', '1', '1584430567', '1584432392');
INSERT INTO `cmf_shop_refund_reason` VALUES ('2', '卖家未按约定时间发货', '2', '1', '1584430600', '0');
INSERT INTO `cmf_shop_refund_reason` VALUES ('3', '其他', '4', '1', '1584431428', '0');
INSERT INTO `cmf_shop_refund_reason` VALUES ('4', '存在质量问题', '3', '1', '1586829690', '0');
INSERT INTO `cmf_shop_refund_reason` VALUES ('5', '7天无理由退款', '0', '1', '1586829705', '0');

-- ----------------------------
-- Table structure for `cmf_shop_refuse_reason`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_shop_refuse_reason`;
CREATE TABLE `cmf_shop_refuse_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '原因名称',
  `list_order` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0不显示 1 显示',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `edittime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_shop_refuse_reason
-- ----------------------------
INSERT INTO `cmf_shop_refuse_reason` VALUES ('1', '买家未举证/举证无效', '1', '1', '1584698435', '1584699310');
INSERT INTO `cmf_shop_refuse_reason` VALUES ('2', '收到退货后再退款', '2', '1', '1584698538', '0');
INSERT INTO `cmf_shop_refuse_reason` VALUES ('3', '已发货,请买家承担运费', '3', '1', '1584698558', '0');
INSERT INTO `cmf_shop_refuse_reason` VALUES ('4', '商品损坏', '0', '1', '1586829756', '0');

-- ----------------------------
-- Table structure for `cmf_slide`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide`;
CREATE TABLE `cmf_slide` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示,0不显示',
  `delete_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '删除时间',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片分类',
  `remark` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '分类备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片表';

-- ----------------------------
-- Records of cmf_slide
-- ----------------------------
INSERT INTO `cmf_slide` VALUES ('1', '1', '0', 'PC首页轮播', '不可删除');
INSERT INTO `cmf_slide` VALUES ('2', '1', '0', 'APP首页轮播', '不可删除');
INSERT INTO `cmf_slide` VALUES ('3', '1', '1596874182', ' ', '');
INSERT INTO `cmf_slide` VALUES ('4', '1', '1596878259', ' ', '');
INSERT INTO `cmf_slide` VALUES ('5', '1', '0', 'APP商城轮播', '不可删除');

-- ----------------------------
-- Table structure for `cmf_slide_item`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_slide_item`;
CREATE TABLE `cmf_slide_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `slide_id` int(11) NOT NULL DEFAULT '0' COMMENT '幻灯片id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态,1:显示;0:隐藏',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '幻灯片名称',
  `image` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片图片',
  `url` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片链接',
  `target` varchar(10) NOT NULL DEFAULT '' COMMENT '友情链接打开方式',
  `description` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '幻灯片描述',
  `content` text CHARACTER SET utf8 COMMENT '幻灯片内容',
  `more` text COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `slide_id` (`slide_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='幻灯片子项表';

-- ----------------------------
-- Records of cmf_slide_item
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_theme`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme`;
CREATE TABLE `cmf_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_theme
-- ----------------------------
INSERT INTO `cmf_theme` VALUES ('1', '0', '0', '0', '0', 'default', 'default', '1.0.0', 'http://demo.thinkcmf.com', '', 'ThinkCMF', 'http://www.thinkcmf.com', 'zh-cn', 'ThinkCMF默认模板', 'ThinkCMF默认模板');

-- ----------------------------
-- Table structure for `cmf_theme_file`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_theme_file`;
CREATE TABLE `cmf_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_theme_file
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_turntable`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_turntable`;
CREATE TABLE `cmf_turntable` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型，0无奖1钻石2礼物',
  `type_val` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '类型值',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `rate` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '中奖率',
  `uptime` bigint(20) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_turntable
-- ----------------------------
INSERT INTO `cmf_turntable` VALUES ('1', '1', '200', '', '10.000', '1615446136');
INSERT INTO `cmf_turntable` VALUES ('2', '2', '5', '', '10.000', '1600165609');
INSERT INTO `cmf_turntable` VALUES ('3', '1', '5000', '', '10.000', '1600165620');
INSERT INTO `cmf_turntable` VALUES ('4', '2', '28', '', '10.000', '1600165627');
INSERT INTO `cmf_turntable` VALUES ('5', '2', '74', '', '10.000', '1600166128');
INSERT INTO `cmf_turntable` VALUES ('6', '3', '水晶鞋', '', '10.000', '1600165643');
INSERT INTO `cmf_turntable` VALUES ('7', '0', '0', '', '0.000', '1594864893');
INSERT INTO `cmf_turntable` VALUES ('8', '2', '76', '', '10.000', '1612577164');

-- ----------------------------
-- Table structure for `cmf_turntable_con`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_turntable_con`;
CREATE TABLE `cmf_turntable_con` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `times` int(11) NOT NULL DEFAULT '0' COMMENT '次数',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_turntable_con
-- ----------------------------
INSERT INTO `cmf_turntable_con` VALUES ('1', '1', '10', '9999');
INSERT INTO `cmf_turntable_con` VALUES ('2', '10', '100', '9999');
INSERT INTO `cmf_turntable_con` VALUES ('3', '100', '1000', '9999');

-- ----------------------------
-- Table structure for `cmf_turntable_log`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_turntable_log`;
CREATE TABLE `cmf_turntable_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `liveuid` bigint(20) NOT NULL DEFAULT '0' COMMENT '主播ID',
  `showid` bigint(20) NOT NULL DEFAULT '0' COMMENT '直播标识',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `addtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '时间',
  `iswin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否中奖',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_turntable_log
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_turntable_win`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_turntable_win`;
CREATE TABLE `cmf_turntable_win` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `logid` bigint(20) NOT NULL DEFAULT '0' COMMENT '转盘记录ID',
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型，0无奖1钻石2礼物',
  `type_val` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '类型值',
  `thumb` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '图片',
  `nums` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `addtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '处理状态，0未处理1已处理',
  `uptime` bigint(20) NOT NULL DEFAULT '0' COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of cmf_turntable_win
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user`;
CREATE TABLE `cmf_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户类型;1:admin;2:会员',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nicename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `avatar_thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '小头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(15) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  `consumption` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '消费总额',
  `votes` decimal(20,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '映票余额',
  `votestotal` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '映票总额',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `isrecommend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 未推荐 1 推荐',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '三方标识',
  `login_type` varchar(20) NOT NULL DEFAULT 'phone' COMMENT '注册方式',
  `iszombie` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启僵尸粉',
  `isrecord` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开起回放',
  `iszombiep` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否僵尸粉',
  `issuper` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否超管',
  `ishot` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否热门显示',
  `goodnum` varchar(255) NOT NULL DEFAULT '0' COMMENT '当前装备靓号',
  `source` varchar(255) NOT NULL DEFAULT 'pc' COMMENT '注册来源',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '所在地',
  `end_bantime` bigint(20) NOT NULL DEFAULT '0' COMMENT '禁用到期时间',
  `balance` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '用户商城人民币账户金额',
  `balance_total` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '用户商城累计收入人民币',
  `balance_consumption` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '用户商城累计消费人民币',
  `recommend_time` int(1) NOT NULL DEFAULT '0' COMMENT '推荐时间',
  `country_code` int(11) NOT NULL DEFAULT '86' COMMENT '国家代号',
  PRIMARY KEY (`id`),
  KEY `user_login` (`user_login`) USING BTREE,
  KEY `user_nicename` (`user_nicename`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=45516 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of cmf_user
-- ----------------------------
INSERT INTO `cmf_user` VALUES ('1', '1', '0', '0', '1621907720', '0', '0', '1571800517', '1', 'admin', '###66bc82ebde1af7c7a129adf2a2eb4f57', 'admin', 'admin@163.com', '', '', '', '', '39.87.148.46', '', '', null, '0', '0.00', '0', '', '', '0', '', 'phone', '0', '0', '0', '0', '1', '0', 'pc', '', '0', '3052.00', '3052.00', '0.00', '0', '86');

-- ----------------------------
-- Table structure for `cmf_user_attention`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_attention`;
CREATE TABLE `cmf_user_attention` (
  `uid` int(12) NOT NULL COMMENT '用户ID',
  `touid` int(12) NOT NULL COMMENT '关注人ID',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '时间',
  KEY `uid_touid_index` (`uid`,`touid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_user_attention
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_auth`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_auth`;
CREATE TABLE `cmf_user_auth` (
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `real_name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `cer_no` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证号',
  `front_view` varchar(255) NOT NULL DEFAULT '' COMMENT '正面',
  `back_view` varchar(255) NOT NULL DEFAULT '' COMMENT '反面',
  `handset_view` varchar(255) NOT NULL DEFAULT '' COMMENT '手持',
  `reason` text COMMENT '审核说明',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `uptime` int(12) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0 处理中 1 成功 2 失败',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_auth
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_balance_cashrecord`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_balance_cashrecord`;
CREATE TABLE `cmf_user_balance_cashrecord` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `money` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `orderno` varchar(50) NOT NULL DEFAULT '' COMMENT '订单号',
  `trade_no` varchar(100) NOT NULL DEFAULT '' COMMENT '三方订单号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态，0审核中，1审核通过，2审核拒绝',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '账号类型 1 支付宝 2 微信 3 银行卡',
  `account_bank` varchar(255) NOT NULL DEFAULT '' COMMENT '银行名称',
  `account` varchar(255) NOT NULL DEFAULT '' COMMENT '帐号',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_balance_cashrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_balance_record`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_balance_record`;
CREATE TABLE `cmf_user_balance_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `touid` bigint(20) NOT NULL COMMENT '对方用户id',
  `balance` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '操作的余额数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支类型,0支出1收入',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支行为 1 买家使用余额付款 2 系统自动结算货款给卖家  3 卖家超时未发货,退款给买家 4 买家发起退款，卖家超时未处理,系统自动退款 5买家发起退款，卖家同意 6 买家发起退款，平台介入后同意 7 用户使用余额购买付费项目  8 付费项目收入 9 代售平台商品佣金',
  `orderid` bigint(20) NOT NULL DEFAULT '0' COMMENT '对应的订单ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_balance_record
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_banrecord`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_banrecord`;
CREATE TABLE `cmf_user_banrecord` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ban_reason` varchar(255) DEFAULT '' COMMENT '被禁用原因',
  `ban_long` int(10) DEFAULT '0' COMMENT '用户禁用时长：单位：分钟',
  `uid` int(10) DEFAULT '0' COMMENT '禁用 用户ID',
  `addtime` int(10) DEFAULT '0' COMMENT '提交时间',
  `end_time` int(10) DEFAULT '0' COMMENT '禁用到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_banrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_beauty_params`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_beauty_params`;
CREATE TABLE `cmf_user_beauty_params` (
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `params` varchar(500) NOT NULL DEFAULT '' COMMENT '美颜参数json字符串',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_user_beauty_params
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_black`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_black`;
CREATE TABLE `cmf_user_black` (
  `uid` int(12) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` int(12) NOT NULL DEFAULT '0' COMMENT '被拉黑人ID',
  KEY `uid_touid_index` (`uid`,`touid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_black
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_coinrecord`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_coinrecord`;
CREATE TABLE `cmf_user_coinrecord` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支类型,0支出1收入',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支行为，1赠送礼物,2弹幕,3登录奖励,4购买VIP,5购买坐骑,6房间扣费,7计时扣费,8发送红包,9抢红包,10开通守护,11注册奖励,12礼物中奖,13奖池中奖,14缴纳保证金,15退还保证金,16转盘游戏,17转盘中奖,18购买靓号,19游戏下注,20游戏退还,21每日任务奖励',
  `uid` int(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` int(20) NOT NULL DEFAULT '0' COMMENT '对方ID',
  `giftid` int(20) NOT NULL DEFAULT '0' COMMENT '行为对应ID',
  `giftcount` int(20) NOT NULL DEFAULT '0' COMMENT '数量',
  `totalcoin` int(20) NOT NULL DEFAULT '0' COMMENT '总价',
  `showid` int(12) NOT NULL DEFAULT '0' COMMENT '直播标识',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `mark` tinyint(1) NOT NULL DEFAULT '0' COMMENT '标识，1表示热门礼物，2表示守护礼物',
  `ispack` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为背包礼物 0 否 1 是',
  PRIMARY KEY (`id`),
  KEY `action_uid_addtime` (`action`,`uid`,`addtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_coinrecord
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_daily_tasks`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_daily_tasks`;
CREATE TABLE `cmf_user_daily_tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(12) NOT NULL DEFAULT '0' COMMENT '用户uid',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '任务类型 1观看直播（分钟）, 2观看视频（分钟）, 3直播奖励（分钟）, 4打赏奖励（个）, 5分享奖励（次）',
  `target` int(11) NOT NULL DEFAULT '0' COMMENT '目标(单位为分钟)',
  `schedule` int(11) NOT NULL DEFAULT '0' COMMENT '当前进度(时间计算的都是以秒为单位记录)',
  `reward` int(5) NOT NULL DEFAULT '0' COMMENT '奖励钻石数量',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '生成时间',
  `uptime` int(12) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `state` tinyint(1) DEFAULT '0' COMMENT '状态 0未达成  1可领取  2已领取',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`,`type`) USING BTREE,
  KEY `uid_2` (`uid`) USING BTREE,
  KEY `uid_3` (`uid`,`type`,`addtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='每日任务';

-- ----------------------------
-- Records of cmf_user_daily_tasks
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_goods_collect`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_goods_collect`;
CREATE TABLE `cmf_user_goods_collect` (
  `uid` int(12) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `goodsid` int(12) NOT NULL COMMENT '商品id',
  `goodsuid` int(12) NOT NULL COMMENT '商品所有者用户id',
  `addtime` int(12) NOT NULL COMMENT '时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_user_goods_collect
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_goods_visit`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_goods_visit`;
CREATE TABLE `cmf_user_goods_visit` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` bigint(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `goodsid` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `time_format` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_goods_visit
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_pushid`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_pushid`;
CREATE TABLE `cmf_user_pushid` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `pushid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户对应极光registration_id',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_pushid
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_scorerecord`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_scorerecord`;
CREATE TABLE `cmf_user_scorerecord` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支类型,0支出1收入',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支行为，4购买VIP,5购买坐骑,18购买靓号,21游戏获胜',
  `uid` int(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` int(20) NOT NULL DEFAULT '0' COMMENT '对方ID',
  `giftid` int(20) NOT NULL DEFAULT '0' COMMENT '行为对应ID',
  `giftcount` int(20) NOT NULL DEFAULT '0' COMMENT '数量',
  `totalcoin` int(20) NOT NULL DEFAULT '0' COMMENT '总价',
  `showid` int(12) NOT NULL DEFAULT '0' COMMENT '直播标识',
  `addtime` int(12) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `game_action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '游戏类型',
  PRIMARY KEY (`id`),
  KEY `action_uid_addtime` (`action`,`uid`,`addtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_scorerecord
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_sign`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_sign`;
CREATE TABLE `cmf_user_sign` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `bonus_day` int(11) NOT NULL DEFAULT '0' COMMENT '登录天数',
  `bonus_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `count_day` int(11) NOT NULL DEFAULT '0' COMMENT '连续登陆天数',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_sign
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_super`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_super`;
CREATE TABLE `cmf_user_super` (
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_super
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_token`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_token`;
CREATE TABLE `cmf_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户客户端登录 token 表';

-- ----------------------------
-- Records of cmf_user_token
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_voterecord`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_voterecord`;
CREATE TABLE `cmf_user_voterecord` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支类型,0支出，1收入',
  `action` tinyint(1) NOT NULL DEFAULT '0' COMMENT '收支行为,1收礼物2弹幕3分销收益4家族长收益6房间收费7计时收费10守护',
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `fromid` bigint(20) NOT NULL DEFAULT '0' COMMENT '来源用户ID',
  `actionid` bigint(20) NOT NULL DEFAULT '0' COMMENT '行为对应ID',
  `nums` bigint(20) NOT NULL DEFAULT '0' COMMENT '数量',
  `total` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '总价',
  `showid` bigint(20) NOT NULL DEFAULT '0' COMMENT '直播标识',
  `votes` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '收益映票',
  `addtime` bigint(20) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `action_uid_addtime` (`action`,`uid`,`addtime`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_voterecord
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_user_zombie`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_user_zombie`;
CREATE TABLE `cmf_user_zombie` (
  `uid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_user_zombie
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_verification_code`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_verification_code`;
CREATE TABLE `cmf_verification_code` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '表id',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '当天已经发送成功的次数',
  `send_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后发送成功时间',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证码过期时间',
  `code` varchar(8) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '最后发送成功的验证码',
  `account` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '手机号或者邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='手机邮箱数字验证码表';

-- ----------------------------
-- Records of cmf_verification_code
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video`;
CREATE TABLE `cmf_video` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '封面图片',
  `thumb_s` varchar(255) NOT NULL DEFAULT '' COMMENT '封面小图',
  `href` varchar(255) NOT NULL DEFAULT '' COMMENT '视频地址',
  `href_w` varchar(255) NOT NULL DEFAULT '' COMMENT '水印视频',
  `likes` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `views` int(11) NOT NULL DEFAULT '1' COMMENT '浏览数（涉及到推荐排序机制，所以默认为1）',
  `comments` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `steps` int(11) NOT NULL DEFAULT '0' COMMENT '踩总数',
  `shares` int(11) NOT NULL DEFAULT '0' COMMENT '分享数量',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '发布时间',
  `lat` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `lng` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除 1删除（下架）0不下架',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '视频状态 0未审核 1通过 2拒绝',
  `music_id` int(12) NOT NULL DEFAULT '0' COMMENT '背景音乐ID',
  `xiajia_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '下架原因',
  `nopass_time` int(12) NOT NULL DEFAULT '0' COMMENT '审核不通过时间（第一次审核不通过时更改此值，用于判断是否发送极光IM）',
  `watch_ok` int(12) NOT NULL DEFAULT '1' COMMENT '视频完整看完次数(涉及到推荐排序机制，所以默认为1)',
  `is_ad` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否为广告视频 0 否 1 是',
  `ad_endtime` int(12) NOT NULL DEFAULT '0' COMMENT '广告显示到期时间',
  `ad_url` varchar(255) NOT NULL DEFAULT '' COMMENT '广告外链',
  `orderno` int(12) NOT NULL DEFAULT '0' COMMENT '权重值，数字越大越靠前',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '视频绑定类型 0 未绑定 1 商品  2 付费内容',
  `goodsid` bigint(20) NOT NULL DEFAULT '0' COMMENT '商品ID',
  `classid` int(11) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `anyway` varchar(10) NOT NULL DEFAULT '1.1' COMMENT '横竖屏(封面-高/宽)，大于1表示竖屏,小于1表示横屏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_video
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video_black`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_black`;
CREATE TABLE `cmf_video_black` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `videoid` int(10) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_video_black
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video_class`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_class`;
CREATE TABLE `cmf_video_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_video_class
-- ----------------------------
INSERT INTO `cmf_video_class` VALUES ('1', '美食', '1');
INSERT INTO `cmf_video_class` VALUES ('2', '旅行', '2');
INSERT INTO `cmf_video_class` VALUES ('3', '摄影', '3');
INSERT INTO `cmf_video_class` VALUES ('4', '穿搭', '4');
INSERT INTO `cmf_video_class` VALUES ('5', '美妆', '5');
INSERT INTO `cmf_video_class` VALUES ('6', '宠物', '6');
INSERT INTO `cmf_video_class` VALUES ('7', '搞笑', '7');
INSERT INTO `cmf_video_class` VALUES ('10', '校园', '8');
INSERT INTO `cmf_video_class` VALUES ('11', '影视', '9');
INSERT INTO `cmf_video_class` VALUES ('12', '人文', '10');

-- ----------------------------
-- Table structure for `cmf_video_comments`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_comments`;
CREATE TABLE `cmf_video_comments` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '评论用户ID',
  `touid` int(10) NOT NULL DEFAULT '0' COMMENT '被评论的用户ID',
  `videoid` int(10) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `commentid` int(10) NOT NULL DEFAULT '0' COMMENT '所属评论ID',
  `parentid` int(10) NOT NULL DEFAULT '0' COMMENT '上级评论ID',
  `content` text COMMENT '评论内容',
  `likes` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `at_info` varchar(255) NOT NULL DEFAULT '' COMMENT '评论时被@用户的信息（json串）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_video_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video_comments_like`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_comments_like`;
CREATE TABLE `cmf_video_comments_like` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `commentid` int(10) NOT NULL DEFAULT '0' COMMENT '评论ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `touid` int(12) NOT NULL DEFAULT '0' COMMENT '被喜欢的评论者id',
  `videoid` int(12) NOT NULL DEFAULT '0' COMMENT '评论所属视频id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_video_comments_like
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video_like`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_like`;
CREATE TABLE `cmf_video_like` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `videoid` int(10) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '视频是否被删除或被拒绝 0被删除或被拒绝 1 正常',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_video_like
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video_report`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_report`;
CREATE TABLE `cmf_video_report` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `touid` int(11) NOT NULL DEFAULT '0' COMMENT '被举报用户ID',
  `videoid` int(11) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0处理中 1已处理  2审核失败',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '提交时间',
  `uptime` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_video_report
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video_report_classify`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_report_classify`;
CREATE TABLE `cmf_video_report_classify` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` int(10) NOT NULL DEFAULT '9999' COMMENT '排序',
  `name` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '举报类型名称',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_video_report_classify
-- ----------------------------
INSERT INTO `cmf_video_report_classify` VALUES ('1', '0', '骗取点击', '1544855181');
INSERT INTO `cmf_video_report_classify` VALUES ('2', '0', '低俗色情', '1544855189');
INSERT INTO `cmf_video_report_classify` VALUES ('3', '0', '侮辱谩骂', '1544855198');
INSERT INTO `cmf_video_report_classify` VALUES ('4', '0', '盗用他人作品', '1544855213');
INSERT INTO `cmf_video_report_classify` VALUES ('5', '0', '引人不适', '1544855224');
INSERT INTO `cmf_video_report_classify` VALUES ('6', '0', '任性打抱不平，就爱举报', '1544855259');
INSERT INTO `cmf_video_report_classify` VALUES ('7', '0', '其他', '1544855273');

-- ----------------------------
-- Table structure for `cmf_video_step`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_step`;
CREATE TABLE `cmf_video_step` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `videoid` int(10) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_video_step
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_video_view`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_video_view`;
CREATE TABLE `cmf_video_view` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `videoid` int(10) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cmf_video_view
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_vip`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_vip`;
CREATE TABLE `cmf_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '价格',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `length` int(11) NOT NULL DEFAULT '1' COMMENT '时长（月）',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分价格',
  `list_order` int(11) NOT NULL DEFAULT '9999' COMMENT '序号',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_vip
-- ----------------------------
INSERT INTO `cmf_vip` VALUES ('1', '10', 'VIP1', '1', '10', '3', '1499925149');
INSERT INTO `cmf_vip` VALUES ('2', '300', 'vip3', '3', '300', '2', '1499925155');
INSERT INTO `cmf_vip` VALUES ('3', '1000', 'vip6', '6', '1000', '1', '1499925166');

-- ----------------------------
-- Table structure for `cmf_vip_user`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_vip_user`;
CREATE TABLE `cmf_vip_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '到期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cmf_vip_user
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_voicelive_applymic`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_voicelive_applymic`;
CREATE TABLE `cmf_voicelive_applymic` (
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `liveuid` bigint(20) NOT NULL DEFAULT '0' COMMENT '主播ID',
  `stream` varchar(255) NOT NULL DEFAULT '' COMMENT '流名',
  `index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '申请麦位（待用）',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '申请上麦时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_voicelive_applymic
-- ----------------------------

-- ----------------------------
-- Table structure for `cmf_voicelive_mic`
-- ----------------------------
DROP TABLE IF EXISTS `cmf_voicelive_mic`;
CREATE TABLE `cmf_voicelive_mic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `liveuid` bigint(20) NOT NULL DEFAULT '0' COMMENT '主播ID',
  `live_stream` varchar(255) NOT NULL DEFAULT '' COMMENT '主播房间流名',
  `stream` varchar(255) NOT NULL DEFAULT '' COMMENT '用户连麦的流名',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '麦位状态 -1 关麦；  0无人； 1开麦 ； 2 禁麦；',
  `mic_closeuid` bigint(20) NOT NULL DEFAULT '0' COMMENT '关麦用户ID【主播或当前麦位用户自己】',
  `position` tinyint(1) NOT NULL DEFAULT '-1' COMMENT '麦序 0代表第一个 以此类推',
  `push_url` varchar(255) NOT NULL DEFAULT '' COMMENT '连麦用户推流地址',
  `pull_url` varchar(255) NOT NULL DEFAULT '' COMMENT '连麦用户播流地址',
  `addtime` int(11) NOT NULL DEFAULT '0' COMMENT '上麦时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cmf_voicelive_mic
-- ----------------------------

-- ----------------------------
-- Function structure for `getDistance`
-- ----------------------------
DROP FUNCTION IF EXISTS `getDistance`;
DELIMITER ;;
CREATE DEFINER=`livenew`@`127.0.0.1` FUNCTION `getDistance`(lat1 FLOAT, lon1 FLOAT, lat2 FLOAT, lon2 FLOAT) RETURNS float
    DETERMINISTIC
BEGIN
    RETURN ROUND(6378.138 * 2 * ASIN(SQRT(POW(SIN((lat1 * PI() / 180 - lat2 * PI() / 180) / 2), 2)
           + COS(lat1 * PI() / 180) * COS(lat2 * PI() / 180)
           * POW(SIN(( lon1 * PI() / 180 - lon2 * PI() / 180 ) / 2),2))),2);
END
;;
DELIMITER ;
