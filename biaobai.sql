/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : biaobai

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2018-06-30 22:53:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL DEFAULT '',
  `type` tinyint(4) DEFAULT '101' COMMENT '101 轮播图 102 友情链接',
  `category_id` int(11) DEFAULT '0',
  `image` varchar(255) NOT NULL DEFAULT '',
  `link` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i-type-category` (`type`,`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ad
-- ----------------------------
INSERT INTO `ad` VALUES ('1', '百度', '101', '0', '/uploads/ad-img/img_58500a3e1b241.jpg', 'http://www.baidu.com', '1481640510', '1481640673');
INSERT INTO `ad` VALUES ('2', '腾讯', '101', '0', '/uploads/ad-img/img_58500a67014d3.jpg', 'http://www.qq.com', '1481640551', '1481640751');
INSERT INTO `ad` VALUES ('3', '网易', '101', '0', '/uploads/ad-img/img_58500a8b4fb51.png', 'http://www.163.com', '1481640587', '1481640587');
INSERT INTO `ad` VALUES ('4', '去哪网', '102', '0', '', 'http://www.quna.com', '0', '0');
INSERT INTO `ad` VALUES ('5', '携程', '102', '0', '', '', '0', '0');
INSERT INTO `ad` VALUES ('6', '马蜂窝', '102', '0', '', '', '0', '0');
INSERT INTO `ad` VALUES ('7', '面包旅行', '102', '0', '', '', '0', '0');

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(256) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `admin_menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `admin_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES ('1', '产品管理', null, '/backend/products/index', '0', 0x7B2269636F6E22203A2266612066612D7468227D);
INSERT INTO `admin_menu` VALUES ('2', '产品分类', '1', '/backend/category/index?type=2', '1', null);
INSERT INTO `admin_menu` VALUES ('3', '产品列表', '1', '/backend/products/index', '0', null);
INSERT INTO `admin_menu` VALUES ('4', '新闻管理', null, '/backend/news/index', '1', 0x7B2269636F6E223A2266612066612D6E65777370617065722D6F227D);
INSERT INTO `admin_menu` VALUES ('5', '新闻列表', '4', '/backend/news/index', '0', null);
INSERT INTO `admin_menu` VALUES ('6', '新闻分类', '4', '/backend/category/index?type=1', '1', null);
INSERT INTO `admin_menu` VALUES ('7', '下载管理', null, '/backend/downloads/index', '2', 0x7B2269636F6E223A2266612066612D646F776E6C6F6164227D);
INSERT INTO `admin_menu` VALUES ('8', '下载列表', '7', '/backend/downloads/index', '0', null);
INSERT INTO `admin_menu` VALUES ('9', '下载分类', '7', '/backend/category/index?type=3', '1', null);
INSERT INTO `admin_menu` VALUES ('10', '照片管理', null, '/backend/photos/index', '4', 0x7B2269636F6E223A2266612066612D706963747572652D6F227D);
INSERT INTO `admin_menu` VALUES ('11', '相册列表', '10', '/backend/photos/index', '0', null);
INSERT INTO `admin_menu` VALUES ('12', '相册分类', '10', '/backend/category/index?type=4', '1', null);
INSERT INTO `admin_menu` VALUES ('13', '用户反馈', null, '/backend/feedback/index', '5', 0x7B2269636F6E223A2266612066612D636F6D6D656E74696E67227D);
INSERT INTO `admin_menu` VALUES ('14', '网站配置', null, '/backend/config/index', '6', 0x7B2269636F6E223A2266612066612D636F67227D);
INSERT INTO `admin_menu` VALUES ('15', '基础配置', '14', '/backend/config/base-config', '1', null);
INSERT INTO `admin_menu` VALUES ('16', '其他配置', '14', '/backend/config/index', '2', null);
INSERT INTO `admin_menu` VALUES ('17', '轮播图片', '14', '/backend/ad/index', '3', null);
INSERT INTO `admin_menu` VALUES ('18', '后台配置', null, '/backend/rbac/route/index', '7', 0x7B2269636F6E223A2266612066612D62617273227D);
INSERT INTO `admin_menu` VALUES ('19', '管理员列表', '18', '/backend/admin-user/index', '1', null);
INSERT INTO `admin_menu` VALUES ('20', '权限配置', '18', '/backend/rbac/assignment/index', '2', null);
INSERT INTO `admin_menu` VALUES ('21', '角色列表', '18', '/backend/rbac/role/index', '3', null);
INSERT INTO `admin_menu` VALUES ('22', '权限列表', '18', '/backend/rbac/permission/index', '4', null);
INSERT INTO `admin_menu` VALUES ('23', '规则列表', '18', '/backend/rbac/rule/index', '5', null);
INSERT INTO `admin_menu` VALUES ('24', '路由列表', '18', '/backend/rbac/route/index', '5', null);
INSERT INTO `admin_menu` VALUES ('25', '后台菜单', '18', '/backend/rbac/menu/index', '7', null);
INSERT INTO `admin_menu` VALUES ('26', '开发工具', null, '/gii/default/index', '8', 0x7B2269636F6E223A2266612066612D7368617265227D);
INSERT INTO `admin_menu` VALUES ('27', 'gii', '26', '/gii/default/index', '2', null);
INSERT INTO `admin_menu` VALUES ('28', 'debug', '26', '/debug/default/index', '1', null);
INSERT INTO `admin_menu` VALUES ('29', '模板主题配置', '14', '/backend/config/view-config', '2', null);
INSERT INTO `admin_menu` VALUES ('30', '页面管理', '14', '/backend/page/index', '7', null);
INSERT INTO `admin_menu` VALUES ('31', '友情链接', '14', '/backend/blogroll/index', '8', null);

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `access_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `u-username` (`username`),
  UNIQUE KEY `u-email` (`email`),
  UNIQUE KEY `u-password-reset-token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
INSERT INTO `admin_user` VALUES ('1', 'admin', '', '21232f297a57a5a743894a0e4a801fc3', null, '739800600@qq.com', '10', '', '0', '1530276775');
INSERT INTO `admin_user` VALUES ('4', 'demo', '', 'fe01ce2a7fbac8fafaed7c982a04e229', null, 'demo@demo.com', '10', '', '1481431804', '1481431804');

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('Administrator', '1', '1482897657');
INSERT INTO `auth_assignment` VALUES ('AdministratorAccess', '1', '1482897661');
INSERT INTO `auth_assignment` VALUES ('Visitor', '4', '1482897661');
INSERT INTO `auth_assignment` VALUES ('VisitorAccess', '4', '1482897661');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/backend/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/ad/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/ad/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/ad/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/ad/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/ad/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/ad/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/ad/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/admin-user/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/admin-user/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/admin-user/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/admin-user/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/admin-user/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/admin-user/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/admin-user/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/blogroll/*', '2', null, null, null, '1490367199', '1490367199');
INSERT INTO `auth_item` VALUES ('/backend/blogroll/create', '2', null, null, null, '1490367193', '1490367193');
INSERT INTO `auth_item` VALUES ('/backend/blogroll/delete', '2', null, null, null, '1490367197', '1490367197');
INSERT INTO `auth_item` VALUES ('/backend/blogroll/index', '2', null, null, null, '1490367188', '1490367188');
INSERT INTO `auth_item` VALUES ('/backend/blogroll/update', '2', null, null, null, '1490367195', '1490367195');
INSERT INTO `auth_item` VALUES ('/backend/blogroll/view', '2', null, null, null, '1490367191', '1490367191');
INSERT INTO `auth_item` VALUES ('/backend/category/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/category/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/category/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/category/index', '2', null, null, null, '1482977677', '1482977677');
INSERT INTO `auth_item` VALUES ('/backend/category/index?type=1', '2', null, null, null, '1482977712', '1482977712');
INSERT INTO `auth_item` VALUES ('/backend/category/index?type=2', '2', null, null, null, '1482977717', '1482977717');
INSERT INTO `auth_item` VALUES ('/backend/category/index?type=3', '2', null, null, null, '1482977721', '1482977721');
INSERT INTO `auth_item` VALUES ('/backend/category/index?type=4', '2', null, null, null, '1482977728', '1482977728');
INSERT INTO `auth_item` VALUES ('/backend/category/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/category/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/category/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/base-config', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/config/view-config', '2', null, null, null, '1483066838', '1483066838');
INSERT INTO `auth_item` VALUES ('/backend/default/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/default/clear-cache', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/default/edit-password', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/default/error', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/default/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/default/login', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/default/logout', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/default/ueditor', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/downloads/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/downloads/check', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/downloads/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/downloads/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/downloads/delete-all', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/downloads/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/downloads/un-check', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/downloads/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/downloads/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/downloads/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/feedback/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/feedback/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/feedback/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/feedback/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/feedback/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/news/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/news/check', '2', null, null, null, '1490367231', '1490367231');
INSERT INTO `auth_item` VALUES ('/backend/news/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/news/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/news/delete-all', '2', null, null, null, '1490367236', '1490367236');
INSERT INTO `auth_item` VALUES ('/backend/news/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/news/un-check', '2', null, null, null, '1490367233', '1490367233');
INSERT INTO `auth_item` VALUES ('/backend/news/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/news/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/news/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/page/*', '2', null, null, null, '1483164471', '1483164471');
INSERT INTO `auth_item` VALUES ('/backend/page/create', '2', null, null, null, '1483164471', '1483164471');
INSERT INTO `auth_item` VALUES ('/backend/page/delete', '2', null, null, null, '1483164471', '1483164471');
INSERT INTO `auth_item` VALUES ('/backend/page/index', '2', null, null, null, '1483164471', '1483164471');
INSERT INTO `auth_item` VALUES ('/backend/page/update', '2', null, null, null, '1483164471', '1483164471');
INSERT INTO `auth_item` VALUES ('/backend/page/upload', '2', null, null, null, '1483164471', '1483164471');
INSERT INTO `auth_item` VALUES ('/backend/page/view', '2', null, null, null, '1483164471', '1483164471');
INSERT INTO `auth_item` VALUES ('/backend/photos/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/check', '2', null, null, null, '1490367238', '1490367238');
INSERT INTO `auth_item` VALUES ('/backend/photos/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/delete-all', '2', null, null, null, '1490367242', '1490367242');
INSERT INTO `auth_item` VALUES ('/backend/photos/delete-detail', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/photos/edit-detail', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/set-cover', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/photos/un-check', '2', null, null, null, '1490367240', '1490367240');
INSERT INTO `auth_item` VALUES ('/backend/photos/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/upload-photo', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/photos/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/products/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/products/check', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/products/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/products/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/products/delete-all', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/products/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/products/un-check', '2', null, null, null, '1490367249', '1490367249');
INSERT INTO `auth_item` VALUES ('/backend/products/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/products/upload', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/products/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/assignment/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/assignment/assign', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/assignment/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/assignment/revoke', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/assignment/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/default/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/default/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/menu/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/menu/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/menu/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/menu/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/menu/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/menu/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/assign', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/remove', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/permission/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/assign', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/remove', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/role/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/route/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/route/assign', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/route/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/route/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/route/refresh', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/route/remove', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/rule/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/rule/create', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/rule/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/rule/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/rule/update', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/rule/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/activate', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/change-password', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/delete', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/login', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/logout', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/request-password-reset', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/reset-password', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/signup', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/backend/rbac/user/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1482977163', '1482977163');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1482977163', '1482977163');
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1482977163', '1482977163');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1482977163', '1482977163');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1482977163', '1482977163');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1482977163', '1482977163');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1482977163', '1482977163');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1482896720', '1482896720');
INSERT INTO `auth_item` VALUES ('Administrator', '1', '超级管理员', null, null, '1482896582', '1482898405');
INSERT INTO `auth_item` VALUES ('AdministratorAccess', '2', '超级管理员权限', null, null, '1482897169', '1482898428');
INSERT INTO `auth_item` VALUES ('Visitor', '1', '后台参观者', 'VisitorRule', null, '1482897794', '1482899002');
INSERT INTO `auth_item` VALUES ('VisitorAccess', '2', '浏览者权限，只读权限', 'VisitorRule', null, '1482897866', '1482898974');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/ad/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/ad/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/ad/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/ad/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/ad/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/ad/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/ad/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/ad/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/ad/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/ad/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/ad/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/ad/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/ad/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/ad/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/admin-user/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/admin-user/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/admin-user/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/admin-user/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/admin-user/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/admin-user/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/admin-user/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/admin-user/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/admin-user/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/admin-user/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/admin-user/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/admin-user/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/admin-user/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/admin-user/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/category/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/category/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/category/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/category/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/category/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/category/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/category/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/category/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/category/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/category/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/category/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/category/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/base-config');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/base-config');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/config/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/config/view-config');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/default/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/default/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/default/edit-password');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/default/edit-password');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/default/error');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/default/error');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/default/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/default/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/default/login');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/default/login');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/default/logout');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/default/logout');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/downloads/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/downloads/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/downloads/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/downloads/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/downloads/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/downloads/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/downloads/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/downloads/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/downloads/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/downloads/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/downloads/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/downloads/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/downloads/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/downloads/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/feedback/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/feedback/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/feedback/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/feedback/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/feedback/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/feedback/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/feedback/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/feedback/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/feedback/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/feedback/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/news/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/news/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/news/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/news/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/news/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/news/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/news/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/news/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/news/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/news/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/news/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/news/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/news/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/news/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/edit-detail');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/edit-detail');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/upload-photo');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/upload-photo');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/photos/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/photos/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/products/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/products/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/products/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/products/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/products/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/products/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/products/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/products/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/products/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/products/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/products/upload');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/products/upload');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/products/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/products/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/assignment/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/assignment/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/assignment/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/assignment/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/assignment/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/assignment/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/default/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/default/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/default/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/default/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/menu/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/menu/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/menu/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/menu/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/menu/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/menu/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/menu/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/menu/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/menu/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/menu/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/menu/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/menu/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/assign');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/assign');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/remove');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/remove');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/permission/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/permission/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/assign');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/assign');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/remove');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/remove');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/role/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/role/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/route/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/route/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/route/assign');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/route/assign');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/route/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/route/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/route/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/route/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/route/refresh');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/route/refresh');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/route/remove');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/route/remove');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/rule/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/rule/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/rule/create');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/rule/create');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/rule/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/rule/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/rule/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/rule/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/rule/update');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/rule/update');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/rule/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/rule/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/*');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/activate');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/activate');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/change-password');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/change-password');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/delete');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/delete');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/index');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/login');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/login');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/logout');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/logout');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/signup');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/signup');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/backend/rbac/user/view');
INSERT INTO `auth_item_child` VALUES ('VisitorAccess', '/backend/rbac/user/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/debug/default/db-explain');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('AdministratorAccess', '/gii/default/view');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------
INSERT INTO `auth_rule` VALUES ('VisitorRule', 'O:36:\"app\\modules\\backend\\rbac\\VisitorRule\":3:{s:4:\"name\";s:11:\"VisitorRule\";s:9:\"createdAt\";i:1482898941;s:9:\"updatedAt\";i:1482898941;}', '1482898941', '1482898941');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父id',
  `path` varchar(50) NOT NULL DEFAULT '0' COMMENT '完整的父id 用/分开',
  `type` tinyint(4) NOT NULL COMMENT '1.news 2 products 3 download 4 photo',
  `image` varchar(255) DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `i-type-pid` (`type`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '游学研学', '0', '', '2', '', '', '', '1481360463', '1490457550');
INSERT INTO `category` VALUES ('2', '默认分类', '0', '', '1', '/uploads/products-img/img_58f32726aa3df.png', '测试', '测试，测试测试', '1481367786', '1492330278');
INSERT INTO `category` VALUES ('3', '新闻分类2', '2', '2', '1', '', '', '', '1481372394', '1499598678');
INSERT INTO `category` VALUES ('4', '旅行度假', '0', '', '2', '', '', '', '1481609361', '1490457573');
INSERT INTO `category` VALUES ('5', '下载文档', '0', '', '3', '', '', '', '1482155225', '1482155225');
INSERT INTO `category` VALUES ('6', '企业环境', '0', '', '4', '', '', '', '1482559711', '1482559711');
INSERT INTO `category` VALUES ('7', '商务考察', '0', '', '2', '', '', '', '1490457590', '1490457590');
INSERT INTO `category` VALUES ('8', '测试修改path', '0', '', '1', '', '', '', '1498831600', '1498833499');
INSERT INTO `category` VALUES ('9', '测试修改path2', '3', '', '1', '', '', '', '1498832464', '1499598673');
INSERT INTO `category` VALUES ('10', '修改path3', '9', '9', '1', '', '', '', '1498832583', '1499598673');

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '字段名英文',
  `label` varchar(50) DEFAULT NULL COMMENT '字段标注',
  `value` varchar(3000) NOT NULL DEFAULT '' COMMENT '字段值',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iu-name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('2', 'contact_us', '联系我们', '<p>公司: 在北京网络科技</p><p>联系人: 李sss</p><p>QQ: 739800600</p><p>电话: 1304351</p><p>E-mail: 739800600@qq.com</p><p>地址: 北京市丰台区大红门</p>', '1481350005', '1482902162');
INSERT INTO `config` VALUES ('3', 'contact_us_page_id', '联系我们', '1', '1481355647', '1483169811');
INSERT INTO `config` VALUES ('4', 'jianjie', '企业简介', '北京雄鹰国际旅行社是新时代投资管理集团旗下的专业旅游平台,依托集团广泛而强大的资源和团队，雄鹰国旅专注于游学交流，商务考察，专项旅行，帆船体验，机票代理等，致力于通过旅行提高青少年的品格与素养，为旅行者提供专业化，个性化的优质服务testtesttest', '1490458199', '1490458199');
INSERT INTO `config` VALUES ('5', 'gongyi', '公益广告', '<script type=\"text/javascript\"> var yibo_id =40276;</script><script src=\"http://yibo.iyiyun.com/yibo.js?random=309727\" type=\"text/javascript\"></script>', '1494309812', '1494309845');
INSERT INTO `config` VALUES ('6', 'top_right_data', '头部右侧数据', '电话:13240702278,17346512591', '1507598988', '1507598988');

-- ----------------------------
-- Table structure for content
-- ----------------------------
DROP TABLE IF EXISTS `content`;
CREATE TABLE `content` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '类型1news,2product3photo',
  `category_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0不显示1显示',
  `admin_user_id` int(11) NOT NULL DEFAULT '0',
  `hits` int(11) NOT NULL DEFAULT '0' COMMENT '浏览数点击数',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `i-type-status-title` (`type`,`status`,`title`),
  KEY `i-update` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content
-- ----------------------------
INSERT INTO `content` VALUES ('1', '测试1', '1', '0', '', '测试测试222', '', '1', '0', '0', '0', '1481269292');
INSERT INTO `content` VALUES ('7', '新闻2', '1', '3', '', '吃豆腐的房地产', '', '0', '0', '0', '1481264976', '1481379895');
INSERT INTO `content` VALUES ('9', 'dfdsfadfdsfdsfds', '1', '0', '', 'dfsdds', '', '0', '0', '0', '1481265228', '1481265228');
INSERT INTO `content` VALUES ('10', 'dfsdfds312321的所得税法', '1', '0', '', '的范德萨发的', '', '0', '1', '0', '1481265362', '1481265362');
INSERT INTO `content` VALUES ('11', '测试你好', '1', '0', '', '三大市场', '', '1', '1', '0', '1481265454', '1481265454');
INSERT INTO `content` VALUES ('13', 'sdfdsvds', '1', '0', '', 'dsfadsfdsa adfdasfd', '', '0', '1', '0', '1481265650', '1481265650');
INSERT INTO `content` VALUES ('14', 'dfsdfds312321的所得税法dsfdsf', '1', '0', '', 'fdsdsfsdfds', '', '0', '1', '0', '1481268136', '1481268136');
INSERT INTO `content` VALUES ('15', '测试测试测试', '1', '0', '', '测试测试222', '', '0', '1', '0', '1481268506', '1481268506');
INSERT INTO `content` VALUES ('16', '电风扇的范德萨', '1', '0', '', '东方闪电', '', '0', '1', '0', '1481268645', '1481268645');
INSERT INTO `content` VALUES ('17', 'ceshi', '1', '2', '', '测试', '', '1', '1', '0', '1481294417', '1482486244');
INSERT INTO `content` VALUES ('18', '测试测试', '1', '0', '', '测试3333333', '', '1', '1', '1', '1481294436', '1481294436');
INSERT INTO `content` VALUES ('19', '测试测试测试', '1', '2', '', '测试测试', '', '1', '1', '14', '1481294458', '1482120320');
INSERT INTO `content` VALUES ('20', '德国代购2016 Marc Jacobs/马克·雅可布 女士撞色皮质直板钱包', '2', '1', '', '<p>德国代购2016 Marc Jacobs/马克·雅可布 女士撞色皮质直板钱包</p>', '', '1', '1', '0', '1481455753', '1482071209');
INSERT INTO `content` VALUES ('21', '测试测试', '2', '1', '/uploads/products-img/img_584d571075916.jpg', '测试', '', '1', '1', '0', '1481463544', '1481552670');
INSERT INTO `content` VALUES ('22', '测试测试测试', '2', '1', '/uploads/products-img/img_584d57438ddb0.jpg', '测试测试测试', '', '1', '1', '0', '1481463619', '1481463619');
INSERT INTO `content` VALUES ('23', '测试产品22222222222222', '2', '1', '/uploads/products-img/img_584d5d65a0855.jpg', '测试产品', '', '1', '1', '0', '1481465189', '1481465189');
INSERT INTO `content` VALUES ('24', '飒飒的范德萨范德萨似懂非懂是', '2', '1', '/uploads/products-img/img_58575c9b83b7b.png', '<p>似懂非懂是付的是</p><p><br></p>', '', '1', '1', '1', '1481465708', '1482120751');
INSERT INTO `content` VALUES ('25', '美国代购2016 MOTHER 女士磨边牛仔裤', '2', '1', '/uploads/products-img/img_584eb27571659.jpg', '重度磨损和猫须褶皱为这款褪色 MOTHER 牛仔裤带来做旧效果。5 口袋设计。钮扣和拉链门襟。', '', '1', '1', '5', '1481552501', '1481552688');
INSERT INTO `content` VALUES ('26', '关于公司考勤制度', '3', '5', '', '<p>关于公司考勤制度</p>', '', '1', '1', '0', '1482155706', '1482157422');
INSERT INTO `content` VALUES ('27', '测试', '3', '5', '', '', '', '0', '1', '0', '1482200020', '1482202904');
INSERT INTO `content` VALUES ('28', '继承测试', '1', '2', '', '继承测试', 'gggg', '1', '1', '10', '1482291369', '1510469205');
INSERT INTO `content` VALUES ('29', '产品继承测试', '2', '1', '/uploads/products-img/img_5859f8c6724c8.jpg', '', '', '1', '1', '23', '1482291398', '1482325074');
INSERT INTO `content` VALUES ('30', '办公环境', '4', '6', '', '', '', '1', '1', '8', '1482560413', '1482560413');
INSERT INTO `content` VALUES ('31', '测试相册', '4', '6', '', '测试', '测试', '1', '1', '0', '1482654720', '1482654720');
INSERT INTO `content` VALUES ('32', 'cccc', '3', '5', '', '', 'ssss', '0', '1', '0', '1489731591', '1494326191');
INSERT INTO `content` VALUES ('33', '测试测试', '2', '1', '/uploads/products-img/img_59119bdcd73a2.jpg', 'ddddd', 'fffff', '0', '1', '0', '1494325122', '1510469150');

-- ----------------------------
-- Table structure for content_detail
-- ----------------------------
DROP TABLE IF EXISTS `content_detail`;
CREATE TABLE `content_detail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `detail` text NOT NULL,
  `params` varchar(1000) NOT NULL DEFAULT '',
  `file_url` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `i-content` (`content_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of content_detail
-- ----------------------------
INSERT INTO `content_detail` VALUES ('1', '1', '测试detail,123232,45454545', '', '', '1481264096', '1481269292');
INSERT INTO `content_detail` VALUES ('3', '7', '测试测试', '', '', '1481264976', '1481379895');
INSERT INTO `content_detail` VALUES ('4', '9', 'dsfdsfdsfdsfdsdfsdfds', '', '', '1481265228', '1481265228');
INSERT INTO `content_detail` VALUES ('5', '10', '打算vdsvdsdsfadf是打发第三方打发第三方', '', '', '1481265362', '1481265362');
INSERT INTO `content_detail` VALUES ('6', '11', '是的撒FDSAD', '', '', '1481265454', '1481265454');
INSERT INTO `content_detail` VALUES ('7', '13', 'dfadsfda', '', '', '1481265650', '1481265650');
INSERT INTO `content_detail` VALUES ('8', '14', 'dsfdsfdsfdsfds', '', '', '1481268136', '1481268136');
INSERT INTO `content_detail` VALUES ('9', '15', '电风扇的范德萨发生的', '', '', '1481268506', '1481268506');
INSERT INTO `content_detail` VALUES ('10', '16', '大多数是范德萨', '', '', '1481268645', '1481268645');
INSERT INTO `content_detail` VALUES ('11', '17', '<p><img src=\"/uploads/redactor-img/1/892f7f6043-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png\" alt=\"892f7f6043-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png\"/>测试测试</p>', '', '', '1481294417', '1482486244');
INSERT INTO `content_detail` VALUES ('12', '18', '测试测试测试', '', '', '1481294436', '1481294436');
INSERT INTO `content_detail` VALUES ('13', '19', '<p>水电费的所得税法</p><p><img src=\"/uploads/redactor-img/1/892f7f6043-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png\"></p><p><br></p><p><img></p>', '', '', '1481294458', '1482120320');
INSERT INTO `content_detail` VALUES ('14', '20', '<p><img></p><p><img src=\"/uploads/redactor-img/1/3c779817e7-9c1ab2f5-f848-4e09-bb3e-9b10c2938520.png\"></p><p><img></p><p><img></p><p>发货相关问题</p><p>SEND ABOUT</p><p>购买来源：本店所有商品均为海外购，所有海外购商品均从（美国、欧洲、香港）正品专柜、官网、百货公司购买，正品保证，请放心选购。</p><p>邮寄方式：本店商品均为海外直发，欧洲商家一般经由我们香港仓、澳门仓等中转再转发国内快递发往您；美国商家一般采用美国直邮方式到国内自动转为EMS直接发往您。</p><p>物流显示：因淘宝物流显示问题，本店商品到达国内才会转为发货状态并显示国内物流单号。一般商品到货时间为2-4周。因而当您的订单淘宝未显示发货，请不要心急，商品都在正常国际运输中，我们全程为您监控物流进程，如有异常会及时通知您。如有疑问，可以咨询在线客服，请勿催单哦！</p><p>特别提醒：以上发货及运送时间均为理论时效，但偶有意外如恶劣天气、清关延误、节假日等国际物流的不确定因素请理性看待。</p><p>退换货政策详解</p><p>RETURN POLICY</p><p>商品签收： 确认签收前，请务必 本人签收 ，并当场拍照验货。如遇 严重质量问题或商品错发 请保留商品问题照片及物流签收有效凭证联系 在线客服处理。 如签收后发现严重质量问题请在签收时间起 48小时内 联系处理， 过后恕不负责，且需保持商品完好无损 （产品包装、吊牌、配件保持原样情况下）。 本店不接受任何形式的拒收 ，如因拒收产生一切后果由收件人负责。</p><p>退换说明： 本店不支持退换货，除严重商品质量问题和商品错发外。</p><p>码数、型号、颜色、款式、均由顾客自行决定，客服建议只供参考，不对此负责，不作为退换货理由。</p><p>所有主观原因(但不限于)：面料与想象有差距，例如厚薄或透明度、手感软硬等。不适合自己、穿上不好看、没想象中漂亮。个人认为做工不好等。细微瑕疵、线头、不明显或可去除的画粉痕迹、极好处理的小脱线，存在于鞋底的污迹或刮痕，不明显处的走线不直、偶尔有烫钻装饰的脱落、细微的印花脱落开裂、羽毛制品轻量掉毛，因运输造成的不平整或皱折、不同显示器解析度和颜色质量造成的网上图片与实物颜色存在一定色差、主观认为不是正品等，均不属于质量问题，不支持退换货。</p><p>退货地址：由于我公司为海外公司，商品均为海外直发， 退货需退回指定的海外物流仓库，详情请咨询在线客服。若因寄到非指定的退货地址，造成商品退换货失败，客户需自行承担后果。</p><p>差价问题：关于打折商品购买之后再度打折，或原来价格商品购买之后打折的情况，本店不退差价。</p><p>关税问题：  如遇海关查验，按照海关规定，收件人为办理清关和交纳税金的责任人。 税金产生后无法办理退货退款 。 为保证清关的顺利， 请填写收件人姓名的时候务必使用真实姓名 ，如使用假名将无法正常完成清关，导致扣件等情况，一切后果将由收件人承担。</p><p>如协商一致退货，请务必遵守如下规则：</p><p>本店不接受未经沟通自主邮寄包裹的退换货，如自行邮寄一律拒收。</p><p>本店不接受任何到付件，寄送包裹需要亲先行垫付邮费。</p><p>请务必保持退货商品的标签吊牌包装等的商品完整性。</p><p>寄出包裹后，请联系客服告知物流公司和运单号码，方便客服查询。</p>', '', '', '1481455753', '1482071209');
INSERT INTO `content_detail` VALUES ('15', '21', 'sadsadsadasdas122333333', '', '', '1481463544', '1481552670');
INSERT INTO `content_detail` VALUES ('16', '22', '测试测试测试', '', '', '1481463619', '1481463619');
INSERT INTO `content_detail` VALUES ('17', '23', '测试测试测试', '', '', '1481465189', '1481465189');
INSERT INTO `content_detail` VALUES ('18', '24', '<p>sdsadsadasdsaasdsadcas</p><p><img src=\"/uploads/redactor-img/1/99ebc906c2-a165a89a-83d3-4882-948c-a551be1bb769.jpg\"></p>', '', '', '1481465708', '1482120751');
INSERT INTO `content_detail` VALUES ('19', '25', '商品由美国百货公司发货，下单即采购。约1~2周到货。\r\n商品货号：s1569032116\r\n商品说明：\r\n重度磨损和猫须褶皱为这款褪色 MOTHER 牛仔裤带来做旧效果。5 口袋设计。钮扣和拉链门襟。\r\n\r\n面料: 弹性牛仔布。\r\n98% 棉 / 2% 弹性纤维。\r\n冷水洗涤。\r\n美国制造。\r\n进口面料。\r\n\r\n尺寸\r\n裆高: 9.75 英寸 / 25 厘米\r\n裤子内长: 28.75 英寸 / 73 厘米\r\n裤脚口: 11.75 英寸 / 30 厘米\r\n所列尺寸以 27 号为标准 2010 年，受到突破传统牛仔裤的启发，业内专家 Lela Tillem (Citizens of Humanity) 和 Tim Kaeding (7 For All Mankind) 推出了 MOTHER 牛仔服饰：精致裁剪、超软织物的奢华牛仔裤系列。MOTHER 牛仔裤将显长腿部的外型、创新的水洗工艺、完美的修身效果和令人难以置信的舒适感融入到高度演变的奢华牛仔系列中。这款高级牛仔裤适合并修饰各种体型。 查看所有 MOTHER 的评论\r\n售后服务：香港仓库收到日期计起30天可以申请退换货,final sale不退不换,商家运费$35\r\n最后更新：2016-10-27 22:03', '', '', '1481552501', '1481552688');
INSERT INTO `content_detail` VALUES ('20', '26', '<p>关于公司考勤制度</p>', '', '/uploads/downloads/yiicms5857e77c7167d.zip', '1482155706', '1482157422');
INSERT INTO `content_detail` VALUES ('21', '27', '<p>测试测试<span class=\"redactor-invisible-space\">测试<span class=\"redactor-invisible-space\">测试<span class=\"redactor-invisible-space\">测试<span class=\"redactor-invisible-space\">测试<span class=\"redactor-invisible-space\"></span></span></span></span></span></p>', '', '/uploads/downloads/yiicms585893d4e19c8.zip', '1482200020', '1482202904');
INSERT INTO `content_detail` VALUES ('22', '28', '<p>继承测试</p>', '', '', '1482291369', '1482291661');
INSERT INTO `content_detail` VALUES ('23', '29', '<p>产品继承</p>', '<p>产品继承</p>', '', null, '1482325074');
INSERT INTO `content_detail` VALUES ('24', '30', '', '', '/uploads/photos/30/img_585e2a68b0fe2.jpg', '1482566248', '1482566248');
INSERT INTO `content_detail` VALUES ('25', '30', '', '', '/uploads/photos/30/img_585e2abda64a2.jpg', '1482566333', '1482566333');
INSERT INTO `content_detail` VALUES ('26', '30', '', '', '/uploads/photos/30/img_585f60a17b4fa.jpg', '1482645665', '1482645665');
INSERT INTO `content_detail` VALUES ('27', '30', '', '', '/uploads/photos/30/img_585f60a888c8a.jpg', '1482645672', '1482645672');
INSERT INTO `content_detail` VALUES ('28', '30', '', '', '/uploads/photos/30/img_585f60bbb3340.jpg', '1482645691', '1482645691');
INSERT INTO `content_detail` VALUES ('29', '30', '', '', '/uploads/photos/30/img_585f73b9d439b.jpg', '1482650553', '1482650553');
INSERT INTO `content_detail` VALUES ('30', '30', '', '', '/uploads/photos/30/img_585f7414e39c8.jpg', '1482650644', '1482650644');
INSERT INTO `content_detail` VALUES ('31', '30', '', '', '/uploads/photos/30/img_585f7a31d66e1.jpg', '1482652209', '1482652209');
INSERT INTO `content_detail` VALUES ('32', '30', '', '', '/uploads/photos/30/img_585f7a84578d6.jpg', '1482652292', '1482652292');
INSERT INTO `content_detail` VALUES ('33', '30', '', '', '/uploads/photos/30/img_585f7afeb8410.jpg', '1482652414', '1482652414');
INSERT INTO `content_detail` VALUES ('34', '30', '', '', '/uploads/photos/30/img_585f7c8f432bd.png', '1482652815', '1482652815');
INSERT INTO `content_detail` VALUES ('35', '30', '', '', '/uploads/photos/30/img_585f7cabe31fd.jpg', '1482652843', '1482652843');
INSERT INTO `content_detail` VALUES ('36', '31', 'ceshi', '', '/uploads/photos/31/img_585f8410249c6.jpg', '1482654736', '1482913682');
INSERT INTO `content_detail` VALUES ('37', '31', '测试2', '', '/uploads/photos/31/img_585f84183ea3b.jpg', '1482654744', '1482822674');
INSERT INTO `content_detail` VALUES ('38', '31', 'ceshi34', '', '/uploads/photos/31/img_585f8410249c6.jpg', '1482655165', '1482913687');
INSERT INTO `content_detail` VALUES ('39', '32', '<p>ssss</p>', '', '/uploads/downloads/yiicms58cb8007d61e7.rar', '1489731591', '1489731591');
INSERT INTO `content_detail` VALUES ('40', '33', '<p>是打发第三方</p>', '<p>胜多负少订单上</p>', '', '1494325122', '1494325122');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `subject` varchar(125) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `body` varchar(255) NOT NULL DEFAULT '',
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '测试测试', '李先生', '13240702278', '739800600@qq.com', '你好你好你好', '1481433870', '1481433870');
INSERT INTO `feedback` VALUES ('2', '你好', '你好', '', '739800600@qq.com', '你好，你好', '1481434463', '1481434463');
INSERT INTO `feedback` VALUES ('3', 'sddfsfsfds', 'dsfsdfsdds', '', '739800600@qq.com', 'sdfdsfds', '1501242456', '1501242456');
INSERT INTO `feedback` VALUES ('4', 'ddddddd', 'ddddd', '', '739800600@qq.com', 'dsfsdfds', '1501242645', '1501242645');
INSERT INTO `feedback` VALUES ('5', 'dsfsdfdsfsd', 'dddd', '', '739800600@qq.com', 'dsfsdfdsfds', '1501397774', '1501397774');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m140209_132017_init', '1494032883');
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', '1494032883');
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', '1494032884');
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', '1494032884');
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1482895903');
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', '1494032884');
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', '1494032884');
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', '1494032884');
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', '1494032884');
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', '1494032884');
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', '1494032884');
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', '1494032884');
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', '1494032884');

-- ----------------------------
-- Table structure for page
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `image` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `template` varchar(100) NOT NULL DEFAULT '' COMMENT '模板路径',
  `content` text NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of page
-- ----------------------------
INSERT INTO `page` VALUES ('1', '关于我们', '', '关于我们', '关于我们', 'page', '<p><iframe class=\"ueditor_baidumap\" src=\"http://dev.qy.com/assets/7a0b751e/dialogs/map/show.html#center=116.404,39.915&zoom=10&width=530&height=340&markers=116.404,39.915&markerStyles=l,A\" frameborder=\"0\" width=\"534\" height=\"344\"></iframe></p>', '1483165325', '1483170261');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `times` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '10002', '可以做我女朋友吗？可以做我女朋友吗？可以做我女朋友吗？可以做我女朋友吗？', '{\"btnone\":\"\\u597d\",\"btntwo\":\"\\u4e0d\\u597d\",\"accept\":[{\"title\":\"\\u4e48\\u4e48\\u54d2\",\"icon\":\"\"}],\"refuse\":[{\"title\":\"\\u4e48\\u4e48\\u54d2\",\"icon\":\"\"},{\"title\":\"\\u4e48\\u4e48\\u54d2\",\"icon\":\"\"}]}', '1530281544', null, '0');
INSERT INTO `question` VALUES ('2', '10002', '可以做我女朋友吗？', '{\"btnone\":\"\\u597d\",\"btntwo\":\"\\u4e0d\\u597d\",\"accept\":[{\"title\":\"\\u4e48\\u4e48\\u54d2\",\"icon\":\"\"}],\"refuse\":[{\"title\":\"\\u4e48\\u4e48\\u54d2\",\"icon\":\"\"},{\"title\":\"\\u4e48\\u4e48\\u54d2\",\"icon\":\"\"}]}', '1530281544', null, '0');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `id` int(11) NOT NULL,
  `questionid` int(11) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `button` varchar(50) DEFAULT NULL,
  `myreply` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `userid` bigint(20) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  `iscx` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('3', '10002', 'stpb-frmWKqF9NrIkkaYGmKDQ3r52vFT', '1529920589', null, '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(32) CHARACTER SET utf8mb4 NOT NULL DEFAULT '',
  `userpass` char(64) NOT NULL DEFAULT '',
  `useremail` varchar(100) DEFAULT '',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  `logintime` int(11) DEFAULT '0' COMMENT '登录时间',
  `loginip` bigint(20) DEFAULT '0' COMMENT '登陆ip',
  `avatar` varchar(225) DEFAULT NULL COMMENT '头像',
  `nickname` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `unionid` char(32) DEFAULT NULL,
  `jifen` int(10) unsigned DEFAULT '0',
  `appidopenid` char(32) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `unionid` (`unionid`) USING BTREE,
  KEY `appidopenid` (`appidopenid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10003 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10002', 'A01000300', '$2y$13$Oie0ON1sLNgP3uvz3pwSFORJ7PRrIATBnrSQMHggKBvHKbUjbC3Ka', '', '1529920589', '1529920589', '2130706433', 'https://wx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTIC1gYOJ4wMWg41fzPRXib7Ak47ibQG5WiaUGoan8qyXcfiaj8CZiaVgr0I355Ha7Kezn41QoSA9rrRkdg/132', '锋君', null, '0', 'oJO4I48RJ3Kecs0eI_UdjWROeqeM');
