/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : fastadmin

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 11/10/2019 19:17:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_admin
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin`;
CREATE TABLE `fa_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of fa_admin
-- ----------------------------
BEGIN;
INSERT INTO `fa_admin` VALUES (1, 'admin', 'Admin', '075eaec83636846f51c152f29b98a2fd', 's4f3', '/assets/img/avatar.png', 'admin@fastadmin.net', 0, 1569559648, '127.0.0.1', 1492186163, 1569559648, '22d68971-28ca-42ab-9c95-a8f28e2242cd', 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_admin_log`;
CREATE TABLE `fa_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `name` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=808 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员日志表';

-- ----------------------------
-- Records of fa_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `fa_admin_log` VALUES (1, 0, 'Unknown', '/admin/index/login.html', '', '{\"__token__\":\"c8fda6c05d3d0494ecf36c9b8041be12\",\"username\":\"admin\",\"captcha\":\"umns\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569559210);
INSERT INTO `fa_admin_log` VALUES (2, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"9c41909cb1d5a61f76b1d0deeb9e3cba\",\"username\":\"admin\",\"captcha\":\"rvbv\",\"keeplogin\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569559221);
INSERT INTO `fa_admin_log` VALUES (3, 0, 'Unknown', '/admin/index/login.html', '', '{\"__token__\":\"1ff50c1b740b436a73f0d693e75cc82e\",\"username\":\"admin\",\"captcha\":\"eddi\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569559629);
INSERT INTO `fa_admin_log` VALUES (4, 0, 'Unknown', '/admin/index/login.html', '', '{\"__token__\":\"c5acb53c49ad8bb5db697c0c26b9a75f\",\"username\":\"admin\",\"captcha\":\"pknj\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569559638);
INSERT INTO `fa_admin_log` VALUES (5, 1, 'admin', '/admin/index/login.html', '登录', '{\"__token__\":\"d447e45ed11d5dc0ee383e7ded86fc30\",\"username\":\"admin\",\"captcha\":\"u524\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569559648);
INSERT INTO `fa_admin_log` VALUES (6, 1, 'admin', '/admin/auth/group/roletree', '', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569568434);
INSERT INTO `fa_admin_log` VALUES (7, 1, 'admin', '/admin/auth/group/roletree', '', '{\"pid\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569568440);
INSERT INTO `fa_admin_log` VALUES (8, 1, 'admin', '/admin/auth/group/roletree', '', '{\"pid\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569568442);
INSERT INTO `fa_admin_log` VALUES (9, 1, 'admin', '/admin/auth/group/roletree', '', '{\"pid\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569568445);
INSERT INTO `fa_admin_log` VALUES (10, 1, 'admin', '/admin/auth/group/roletree', '', '{\"pid\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569568447);
INSERT INTO `fa_admin_log` VALUES (11, 1, 'admin', '/admin/category/del/ids/1', '分类管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569568877);
INSERT INTO `fa_admin_log` VALUES (12, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569568942);
INSERT INTO `fa_admin_log` VALUES (13, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569590409);
INSERT INTO `fa_admin_log` VALUES (14, 1, 'admin', '/admin/general/attachment/del/ids/2', '常规管理 附件管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569590539);
INSERT INTO `fa_admin_log` VALUES (15, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569591852);
INSERT INTO `fa_admin_log` VALUES (16, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569591873);
INSERT INTO `fa_admin_log` VALUES (17, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"provinceid\":\"\",\"address\":\"\\u5f20\\u5e97\\u9547\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569591886);
INSERT INTO `fa_admin_log` VALUES (18, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"provinceid\":\"\",\"address\":\"\\u5f20\\u5e97\\u9547\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569591912);
INSERT INTO `fa_admin_log` VALUES (19, 1, 'admin', '/admin/company/edit/ids/1?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"address\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u9e20\\u6c5f\\u533a\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569592122);
INSERT INTO `fa_admin_log` VALUES (20, 1, 'admin', '/admin/company/multi/ids/1', '公司管理 批量更新', '{\"ids\":\"1\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569592393);
INSERT INTO `fa_admin_log` VALUES (21, 1, 'admin', '/admin/company/multi/ids/1', '公司管理 批量更新', '{\"ids\":\"1\",\"params\":\"status=hidden\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569592398);
INSERT INTO `fa_admin_log` VALUES (22, 1, 'admin', '/admin/company/edit/ids/1?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/assets\\/img\\/qrcode.png\",\"address\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u9e20\\u6c5f\\u533a\",\"license\":\"\\/assets\\/img\\/qrcode.png\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569592432);
INSERT INTO `fa_admin_log` VALUES (23, 1, 'admin', '/admin/company/edit/ids/1?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"address\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u9e20\\u6c5f\\u533a\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569592467);
INSERT INTO `fa_admin_log` VALUES (24, 1, 'admin', '/admin/company/del/ids/1', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569593061);
INSERT INTO `fa_admin_log` VALUES (25, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u5f0b\\u6c5f\\u533a\",\"address\":\"\\u5f20\\u5e97\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569594616);
INSERT INTO `fa_admin_log` VALUES (26, 1, 'admin', '/admin/company/edit/ids/2?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\",\"address\":\"\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"user.email\":\"893191249@qq.com\",\"user.password\":\"12345678\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569595270);
INSERT INTO `fa_admin_log` VALUES (27, 1, 'admin', '/admin/company/edit/ids/2?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u868c\\u57e0\\u5e02\\/\\u5176\\u5b83\\u533a\",\"address\":\"\\u5f20\\u5e97\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249@qq.com\",\"password\":\"12345678\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569596734);
INSERT INTO `fa_admin_log` VALUES (28, 1, 'admin', '/admin/company/edit/ids/2?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u868c\\u57e0\\u5e02\\/\\u5176\\u5b83\\u533a\",\"address\":\"\\u5f20\\u5e97\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249@qq.com\",\"password\":\"12345678\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569596799);
INSERT INTO `fa_admin_log` VALUES (29, 1, 'admin', '/admin/company/edit/ids/2?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u868c\\u57e0\\u5e02\\/\\u5176\\u5b83\\u533a\",\"address\":\"\\u5f20\\u5e97\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249@qq.com\",\"password\":\"12345678\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569596828);
INSERT INTO `fa_admin_log` VALUES (30, 1, 'admin', '/admin/company/edit/ids/2?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u6d77\\u5357\\u7701\\/\\u4e09\\u4e9a\\u5e02\\/\\u5929\\u6daf\\u533a\",\"address\":\"\\u5f20\\u5e97\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249@qq.com\",\"password\":\"12345678\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597034);
INSERT INTO `fa_admin_log` VALUES (31, 1, 'admin', '/admin/company/del/ids/2', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597278);
INSERT INTO `fa_admin_log` VALUES (32, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5317\\u4eac\\/\\u5317\\u4eac\\u5e02\\/\\u897f\\u57ce\\u533a\",\"address\":\"\\u4e2d\\u56fd\\u6751\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249@qq.com\",\"password\":\"12345678\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597306);
INSERT INTO `fa_admin_log` VALUES (33, 1, 'admin', '/admin/user/user/del/ids/1', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597471);
INSERT INTO `fa_admin_log` VALUES (34, 1, 'admin', '/admin/user/user/del/ids/3', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597481);
INSERT INTO `fa_admin_log` VALUES (35, 1, 'admin', '/admin/user/user/del/ids/4', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597483);
INSERT INTO `fa_admin_log` VALUES (36, 1, 'admin', '/admin/user/user/del/ids/2', '会员管理 会员管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597485);
INSERT INTO `fa_admin_log` VALUES (37, 1, 'admin', '/admin/company/del/ids/3', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597503);
INSERT INTO `fa_admin_log` VALUES (38, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249@qq.com\",\"password\":\"12345678\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569597533);
INSERT INTO `fa_admin_log` VALUES (39, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600150);
INSERT INTO `fa_admin_log` VALUES (40, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600192);
INSERT INTO `fa_admin_log` VALUES (41, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600221);
INSERT INTO `fa_admin_log` VALUES (42, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600259);
INSERT INTO `fa_admin_log` VALUES (43, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600510);
INSERT INTO `fa_admin_log` VALUES (44, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u5f0b\\u6c5f\\u533a\",\"address\":\"11\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"89319124\",\"password\":\"12345678\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600532);
INSERT INTO `fa_admin_log` VALUES (45, 1, 'admin', '/admin/company/del/ids/5', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600577);
INSERT INTO `fa_admin_log` VALUES (46, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"90081249@qq.com\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569600812);
INSERT INTO `fa_admin_log` VALUES (47, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569641378);
INSERT INTO `fa_admin_log` VALUES (48, 1, 'admin', '/admin/company/edit/ids/4?dialog=1', '公司管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u5408\\u80a5\\u5e02\\/\\u7476\\u6d77\\u533a\",\"address\":\"\\u7476\\u6d77\\u516c\\u56ed\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249\"},\"ids\":\"4\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569641398);
INSERT INTO `fa_admin_log` VALUES (49, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\",\"logo\":\"\",\"district\":\"\",\"address\":\"\",\"license\":\"\",\"contact\":\"\",\"phone\":\"\",\"email\":\"\",\"password\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569641606);
INSERT INTO `fa_admin_log` VALUES (50, 1, 'admin', '/admin/company/del/ids/5', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569641609);
INSERT INTO `fa_admin_log` VALUES (51, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u9e20\\u6c5f\\u533a\",\"address\":\"ss\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"\",\"email\":\"\",\"password\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569641839);
INSERT INTO `fa_admin_log` VALUES (52, 1, 'admin', '/admin/company/del/ids/6', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569641870);
INSERT INTO `fa_admin_log` VALUES (53, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u5f0b\\u6c5f\\u533a\",\"address\":\"dd\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"89319124\",\"password\":\"12345678\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569641915);
INSERT INTO `fa_admin_log` VALUES (54, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"logo\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u5f0b\\u6c5f\\u533a\",\"address\":\"ff\",\"license\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"893191249@qq.com\",\"password\":\"12345678\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569642019);
INSERT INTO `fa_admin_log` VALUES (55, 1, 'admin', '/admin/company/del/ids/7', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569642032);
INSERT INTO `fa_admin_log` VALUES (56, 1, 'admin', '/admin/company/del/ids/8', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"8\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569642034);
INSERT INTO `fa_admin_log` VALUES (57, 1, 'admin', '/admin/video/add?dialog=1', '视频类目管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5b66\\u4e60\\u89c6\\u9891\",\"num\":\"10\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569752291);
INSERT INTO `fa_admin_log` VALUES (58, 1, 'admin', '/admin/auth/rule/edit/ids/91?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"fe53606b2dcd86cb1b8faf01de3493be\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"video\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"91\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569752350);
INSERT INTO `fa_admin_log` VALUES (59, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569752352);
INSERT INTO `fa_admin_log` VALUES (60, 1, 'admin', '/admin/auth/rule/del/ids/91', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"91\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754386);
INSERT INTO `fa_admin_log` VALUES (61, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754387);
INSERT INTO `fa_admin_log` VALUES (62, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"fa4de9419008e41af8add7df4ee8d1dd\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"video\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-camera\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754587);
INSERT INTO `fa_admin_log` VALUES (63, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754588);
INSERT INTO `fa_admin_log` VALUES (64, 1, 'admin', '/admin/auth/rule/edit/ids/85?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"cb25a8bab926f44736fcbf735fcb4649\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"company\",\"title\":\"\\u516c\\u53f8\\u7ba1\\u7406\",\"icon\":\"fa fa-apple\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"85\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754657);
INSERT INTO `fa_admin_log` VALUES (65, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754658);
INSERT INTO `fa_admin_log` VALUES (66, 1, 'admin', '/admin/video/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754734);
INSERT INTO `fa_admin_log` VALUES (67, 1, 'admin', '/admin/video/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754736);
INSERT INTO `fa_admin_log` VALUES (68, 1, 'admin', '/admin/video/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754740);
INSERT INTO `fa_admin_log` VALUES (69, 1, 'admin', '/admin/video/index', '', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754743);
INSERT INTO `fa_admin_log` VALUES (70, 1, 'admin', '/admin/auth/rule/edit/ids/104?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"fe88f806ec46e0e4a624962786bd9d44\",\"row\":{\"ismenu\":\"1\",\"pid\":\"103\",\"name\":\"video_detail\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"104\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754769);
INSERT INTO `fa_admin_log` VALUES (71, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754770);
INSERT INTO `fa_admin_log` VALUES (72, 1, 'admin', '/admin/auth/rule/edit/ids/103?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"1614310af3a916e9e77312acca476dbc\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"video\",\"title\":\"\\u89c6\\u9891\\u7c7b\\u76ee\",\"icon\":\"fa fa-camera\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"103\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754824);
INSERT INTO `fa_admin_log` VALUES (73, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754825);
INSERT INTO `fa_admin_log` VALUES (74, 1, 'admin', '/admin/auth/rule/edit/ids/104?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"5efde09fbcf480b8112032f2bb3bb15c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"video_detail\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"104\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754834);
INSERT INTO `fa_admin_log` VALUES (75, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754835);
INSERT INTO `fa_admin_log` VALUES (76, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"ba93370d2398aff83e15fd189627e5c6\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"null \",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754869);
INSERT INTO `fa_admin_log` VALUES (77, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"57a78895572907f6c7bd01b7d8f3c21d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"video\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754877);
INSERT INTO `fa_admin_log` VALUES (78, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"4895002c5b45b429d9837a1c25315233\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"#\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569754888);
INSERT INTO `fa_admin_log` VALUES (79, 1, 'admin', '/admin/auth/rule/del/ids/103', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"103\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755122);
INSERT INTO `fa_admin_log` VALUES (80, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755123);
INSERT INTO `fa_admin_log` VALUES (81, 1, 'admin', '/admin/auth/rule/del/ids/104', '权限管理 菜单规则 删除', '{\"action\":\"del\",\"ids\":\"104\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755128);
INSERT INTO `fa_admin_log` VALUES (82, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755129);
INSERT INTO `fa_admin_log` VALUES (83, 1, 'admin', '/admin/auth/rule/edit/ids/110?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d1b5e369525efee9a93d5b82ff0a2d2f\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"video\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"110\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755290);
INSERT INTO `fa_admin_log` VALUES (84, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755291);
INSERT INTO `fa_admin_log` VALUES (85, 1, 'admin', '/admin/auth/rule/edit/ids/111?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"043ae8d08d1fb7609e5380fcc83e5420\",\"row\":{\"ismenu\":\"1\",\"pid\":\"110\",\"name\":\"video\\/video\",\"title\":\"\\u89c6\\u9891\\u7c7b\\u76ee\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"111\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755303);
INSERT INTO `fa_admin_log` VALUES (86, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755304);
INSERT INTO `fa_admin_log` VALUES (87, 1, 'admin', '/admin/video/video/add?dialog=1', '视频管理 视频类目 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"num\":\"20\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569755751);
INSERT INTO `fa_admin_log` VALUES (88, 1, 'admin', '/admin/auth/rule/edit/ids/111?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"89ed4a5bab4ed5d928c9d277029b6d45\",\"row\":{\"ismenu\":\"1\",\"pid\":\"110\",\"name\":\"video\\/video\",\"title\":\"\\u89c6\\u9891\\u7c7b\\u76ee\",\"icon\":\"fa fa-camera\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"111\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569756011);
INSERT INTO `fa_admin_log` VALUES (89, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569756012);
INSERT INTO `fa_admin_log` VALUES (90, 1, 'admin', '/admin/auth/rule/edit/ids/117?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"dcf1cb7f87c1dde5ac841a5a727d4cc7\",\"row\":{\"ismenu\":\"1\",\"pid\":\"110\",\"name\":\"video\\/video_detail\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa fa-camera-retro\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"117\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569756019);
INSERT INTO `fa_admin_log` VALUES (91, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569756020);
INSERT INTO `fa_admin_log` VALUES (92, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757513);
INSERT INTO `fa_admin_log` VALUES (93, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757517);
INSERT INTO `fa_admin_log` VALUES (94, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757527);
INSERT INTO `fa_admin_log` VALUES (95, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757554);
INSERT INTO `fa_admin_log` VALUES (96, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757696);
INSERT INTO `fa_admin_log` VALUES (97, 1, 'admin', '/admin/video/video_detail/add?dialog=1', '视频管理 视频管理 添加', '{\"dialog\":\"1\",\"row\":{\"video_id\":\"2\",\"name\":\"H5\\u89c6\\u9891\",\"url\":\"url\",\"cover\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"introduce\":\"\\u4ecb\\u7ecd\",\"vtime\":\"03:26:51\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757730);
INSERT INTO `fa_admin_log` VALUES (98, 1, 'admin', '/admin/video/video_detail/add?dialog=1', '视频管理 视频管理 添加', '{\"dialog\":\"1\",\"row\":{\"video_id\":\"2\",\"name\":\"H5\\u89c6\\u9891\",\"url\":\"url\",\"cover\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"introduce\":\"\\u4ecb\\u7ecd\",\"vtime\":\"03:26:51\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757762);
INSERT INTO `fa_admin_log` VALUES (99, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757786);
INSERT INTO `fa_admin_log` VALUES (100, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569757988);
INSERT INTO `fa_admin_log` VALUES (101, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569758036);
INSERT INTO `fa_admin_log` VALUES (102, 1, 'admin', '/admin/auth/rule/edit/ids/123?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"f135301523638a74f5018d40b5cd9cf6\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"question\",\"title\":\"\\u8003\\u9898\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"123\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569758755);
INSERT INTO `fa_admin_log` VALUES (103, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569758757);
INSERT INTO `fa_admin_log` VALUES (104, 1, 'admin', '/admin/auth/rule/edit/ids/124?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"88bd305c197697d21a1b5ca199d8305f\",\"row\":{\"ismenu\":\"1\",\"pid\":\"123\",\"name\":\"question\\/question\",\"title\":\"\\u8003\\u9898\\u7c7b\\u76ee\",\"icon\":\"fa fa-calendar\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"124\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569758776);
INSERT INTO `fa_admin_log` VALUES (105, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569758777);
INSERT INTO `fa_admin_log` VALUES (106, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569760829);
INSERT INTO `fa_admin_log` VALUES (107, 1, 'admin', '/admin/question/question/add?dialog=1', '考题管理 考题类目 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"num\":\"10\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569760852);
INSERT INTO `fa_admin_log` VALUES (108, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569761606);
INSERT INTO `fa_admin_log` VALUES (109, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569761649);
INSERT INTO `fa_admin_log` VALUES (110, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762289);
INSERT INTO `fa_admin_log` VALUES (111, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"type\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answer\":\"C\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762324);
INSERT INTO `fa_admin_log` VALUES (112, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762370);
INSERT INTO `fa_admin_log` VALUES (113, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762434);
INSERT INTO `fa_admin_log` VALUES (114, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"type\":\"1\",\"title\":\"\\u89c6\\u9891\\u7c7b\\u76ee\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answer\":\"D\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762445);
INSERT INTO `fa_admin_log` VALUES (115, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762732);
INSERT INTO `fa_admin_log` VALUES (116, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"type\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answer\":\"D\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762744);
INSERT INTO `fa_admin_log` VALUES (117, 1, 'admin', '/admin/question/question_detail/del/ids/3', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762931);
INSERT INTO `fa_admin_log` VALUES (118, 1, 'admin', '/admin/question/question_detail/del/ids/2', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762933);
INSERT INTO `fa_admin_log` VALUES (119, 1, 'admin', '/admin/question/question_detail/del/ids/1', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569762934);
INSERT INTO `fa_admin_log` VALUES (120, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569766544);
INSERT INTO `fa_admin_log` VALUES (121, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569766572);
INSERT INTO `fa_admin_log` VALUES (122, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"A\",\"B\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569766584);
INSERT INTO `fa_admin_log` VALUES (123, 1, 'admin', '/admin/question/question_detail/del/ids/4', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569766611);
INSERT INTO `fa_admin_log` VALUES (124, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569766624);
INSERT INTO `fa_admin_log` VALUES (125, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"A\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569766641);
INSERT INTO `fa_admin_log` VALUES (126, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767091);
INSERT INTO `fa_admin_log` VALUES (127, 1, 'admin', '/admin/question/question_detail/del/ids/5', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767292);
INSERT INTO `fa_admin_log` VALUES (128, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767304);
INSERT INTO `fa_admin_log` VALUES (129, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767401);
INSERT INTO `fa_admin_log` VALUES (130, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767409);
INSERT INTO `fa_admin_log` VALUES (131, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767451);
INSERT INTO `fa_admin_log` VALUES (132, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"C\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767479);
INSERT INTO `fa_admin_log` VALUES (133, 1, 'admin', '/admin/question/question_detail/del/ids/7', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"7\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767720);
INSERT INTO `fa_admin_log` VALUES (134, 1, 'admin', '/admin/question/question_detail/del/ids/6', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767722);
INSERT INTO `fa_admin_log` VALUES (135, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767751);
INSERT INTO `fa_admin_log` VALUES (136, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"C\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767766);
INSERT INTO `fa_admin_log` VALUES (137, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"C\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767807);
INSERT INTO `fa_admin_log` VALUES (138, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569767997);
INSERT INTO `fa_admin_log` VALUES (139, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"C\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768006);
INSERT INTO `fa_admin_log` VALUES (140, 1, 'admin', '/admin/question/question_detail/del/ids/9,8', '考题管理 考题管理 删除', '{\"action\":\"del\",\"ids\":\"9,8\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768026);
INSERT INTO `fa_admin_log` VALUES (141, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768066);
INSERT INTO `fa_admin_log` VALUES (142, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"C\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768074);
INSERT INTO `fa_admin_log` VALUES (143, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768518);
INSERT INTO `fa_admin_log` VALUES (144, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768527);
INSERT INTO `fa_admin_log` VALUES (145, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768583);
INSERT INTO `fa_admin_log` VALUES (146, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569768987);
INSERT INTO `fa_admin_log` VALUES (147, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769027);
INSERT INTO `fa_admin_log` VALUES (148, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"1\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"A\",\"B\",\"C\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769037);
INSERT INTO `fa_admin_log` VALUES (149, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769045);
INSERT INTO `fa_admin_log` VALUES (150, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769054);
INSERT INTO `fa_admin_log` VALUES (151, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769547);
INSERT INTO `fa_admin_log` VALUES (152, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769549);
INSERT INTO `fa_admin_log` VALUES (153, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769574);
INSERT INTO `fa_admin_log` VALUES (154, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769689);
INSERT INTO `fa_admin_log` VALUES (155, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769694);
INSERT INTO `fa_admin_log` VALUES (156, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769698);
INSERT INTO `fa_admin_log` VALUES (157, 1, 'admin', '/admin/auth/rule/edit/ids/130?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"bbe033c37e0a4f416f1b3d89053d9128\",\"row\":{\"ismenu\":\"1\",\"pid\":\"123\",\"name\":\"question\\/question_detail\",\"title\":\"\\u8003\\u9898\\u7ba1\\u7406\",\"icon\":\"fa fa-adjust\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"130\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769777);
INSERT INTO `fa_admin_log` VALUES (158, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569769778);
INSERT INTO `fa_admin_log` VALUES (159, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569770035);
INSERT INTO `fa_admin_log` VALUES (160, 1, 'admin', '/admin/auth/rule/edit/ids/136?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"d59e15c9664dde44bfdd5b4d2d0b7c36\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"examination\",\"title\":\"\\u8003\\u9898\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"136\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569809981);
INSERT INTO `fa_admin_log` VALUES (161, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569809983);
INSERT INTO `fa_admin_log` VALUES (162, 1, 'admin', '/admin/auth/rule/edit/ids/136?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"0d87ab2c3fe2b200840088dc681ed70d\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"examination\",\"title\":\"\\u8bd5\\u5377\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"136\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810003);
INSERT INTO `fa_admin_log` VALUES (163, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810004);
INSERT INTO `fa_admin_log` VALUES (164, 1, 'admin', '/admin/auth/rule/edit/ids/137?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"0d6e6cac3eb79e6605aa6e80e5f6417f\",\"row\":{\"ismenu\":\"1\",\"pid\":\"136\",\"name\":\"examination\\/examination\",\"title\":\"\\u8bd5\\u5377\\u7ba1\\u7406\",\"icon\":\"fa fa-sticky-note-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"137\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810041);
INSERT INTO `fa_admin_log` VALUES (165, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810042);
INSERT INTO `fa_admin_log` VALUES (166, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810159);
INSERT INTO `fa_admin_log` VALUES (167, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810315);
INSERT INTO `fa_admin_log` VALUES (168, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810530);
INSERT INTO `fa_admin_log` VALUES (169, 1, 'admin', '/admin/question/question/add?dialog=1', '考题管理 考题类目 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"num\":\"20\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810544);
INSERT INTO `fa_admin_log` VALUES (170, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810550);
INSERT INTO `fa_admin_log` VALUES (171, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810552);
INSERT INTO `fa_admin_log` VALUES (172, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810554);
INSERT INTO `fa_admin_log` VALUES (173, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569810555);
INSERT INTO `fa_admin_log` VALUES (174, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813260);
INSERT INTO `fa_admin_log` VALUES (175, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813262);
INSERT INTO `fa_admin_log` VALUES (176, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813368);
INSERT INTO `fa_admin_log` VALUES (177, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813370);
INSERT INTO `fa_admin_log` VALUES (178, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813539);
INSERT INTO `fa_admin_log` VALUES (179, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813541);
INSERT INTO `fa_admin_log` VALUES (180, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813580);
INSERT INTO `fa_admin_log` VALUES (181, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813581);
INSERT INTO `fa_admin_log` VALUES (182, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813583);
INSERT INTO `fa_admin_log` VALUES (183, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813584);
INSERT INTO `fa_admin_log` VALUES (184, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813586);
INSERT INTO `fa_admin_log` VALUES (185, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813586);
INSERT INTO `fa_admin_log` VALUES (186, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813587);
INSERT INTO `fa_admin_log` VALUES (187, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813587);
INSERT INTO `fa_admin_log` VALUES (188, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813688);
INSERT INTO `fa_admin_log` VALUES (189, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813860);
INSERT INTO `fa_admin_log` VALUES (190, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813877);
INSERT INTO `fa_admin_log` VALUES (191, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813882);
INSERT INTO `fa_admin_log` VALUES (192, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813899);
INSERT INTO `fa_admin_log` VALUES (193, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569813993);
INSERT INTO `fa_admin_log` VALUES (194, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814670);
INSERT INTO `fa_admin_log` VALUES (195, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814728);
INSERT INTO `fa_admin_log` VALUES (196, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814730);
INSERT INTO `fa_admin_log` VALUES (197, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814732);
INSERT INTO `fa_admin_log` VALUES (198, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814793);
INSERT INTO `fa_admin_log` VALUES (199, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814794);
INSERT INTO `fa_admin_log` VALUES (200, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814852);
INSERT INTO `fa_admin_log` VALUES (201, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814860);
INSERT INTO `fa_admin_log` VALUES (202, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814908);
INSERT INTO `fa_admin_log` VALUES (203, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814922);
INSERT INTO `fa_admin_log` VALUES (204, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569814945);
INSERT INTO `fa_admin_log` VALUES (205, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815028);
INSERT INTO `fa_admin_log` VALUES (206, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815093);
INSERT INTO `fa_admin_log` VALUES (207, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815096);
INSERT INTO `fa_admin_log` VALUES (208, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815097);
INSERT INTO `fa_admin_log` VALUES (209, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815107);
INSERT INTO `fa_admin_log` VALUES (210, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815170);
INSERT INTO `fa_admin_log` VALUES (211, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815302);
INSERT INTO `fa_admin_log` VALUES (212, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815304);
INSERT INTO `fa_admin_log` VALUES (213, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815305);
INSERT INTO `fa_admin_log` VALUES (214, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815335);
INSERT INTO `fa_admin_log` VALUES (215, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815340);
INSERT INTO `fa_admin_log` VALUES (216, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815396);
INSERT INTO `fa_admin_log` VALUES (217, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815419);
INSERT INTO `fa_admin_log` VALUES (218, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815453);
INSERT INTO `fa_admin_log` VALUES (219, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815458);
INSERT INTO `fa_admin_log` VALUES (220, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569815554);
INSERT INTO `fa_admin_log` VALUES (221, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569833980);
INSERT INTO `fa_admin_log` VALUES (222, 1, 'admin', '/admin/article/article/add?dialog=1', '文章 文章类目管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"num\":\"10\",\"sort\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569834279);
INSERT INTO `fa_admin_log` VALUES (223, 1, 'admin', '/admin/auth/rule/edit/ids/144?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"0e23f3cd7b7c49975ff49bc81fe48e9e\",\"row\":{\"ismenu\":\"1\",\"pid\":\"143\",\"name\":\"article\\/article\",\"title\":\"\\u6587\\u7ae0\\u7c7b\\u76ee\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"144\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569834300);
INSERT INTO `fa_admin_log` VALUES (224, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569834302);
INSERT INTO `fa_admin_log` VALUES (225, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569834859);
INSERT INTO `fa_admin_log` VALUES (226, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569835012);
INSERT INTO `fa_admin_log` VALUES (227, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569835022);
INSERT INTO `fa_admin_log` VALUES (228, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569835410);
INSERT INTO `fa_admin_log` VALUES (229, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569835549);
INSERT INTO `fa_admin_log` VALUES (230, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"clsms\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.2\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569835687);
INSERT INTO `fa_admin_log` VALUES (231, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569836036);
INSERT INTO `fa_admin_log` VALUES (232, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569836171);
INSERT INTO `fa_admin_log` VALUES (233, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569836540);
INSERT INTO `fa_admin_log` VALUES (234, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.4.zip\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569836615);
INSERT INTO `fa_admin_log` VALUES (235, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.4.zip\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569836669);
INSERT INTO `fa_admin_log` VALUES (236, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"recommend\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.0\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569836912);
INSERT INTO `fa_admin_log` VALUES (237, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569836920);
INSERT INTO `fa_admin_log` VALUES (238, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569837571);
INSERT INTO `fa_admin_log` VALUES (239, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569837883);
INSERT INTO `fa_admin_log` VALUES (240, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569838081);
INSERT INTO `fa_admin_log` VALUES (241, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.4.zip\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569838102);
INSERT INTO `fa_admin_log` VALUES (242, 1, 'admin', '/admin/addon/local', '插件管理 本地安装', '{\"name\":\"1.0.4.zip\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569838114);
INSERT INTO `fa_admin_log` VALUES (243, 1, 'admin', '/admin/addon/install', '插件管理 安装', '{\"name\":\"summernote\",\"force\":\"0\",\"uid\":\"0\",\"token\":\"\",\"version\":\"1.0.4\",\"faversion\":\"1.0.0.20190705_beta\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569839031);
INSERT INTO `fa_admin_log` VALUES (244, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569839033);
INSERT INTO `fa_admin_log` VALUES (245, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569839168);
INSERT INTO `fa_admin_log` VALUES (246, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569839190);
INSERT INTO `fa_admin_log` VALUES (247, 1, 'admin', '/admin/article/article_detail/add?dialog=1', '文章 文章管理 添加', '{\"dialog\":\"1\",\"row\":{\"article_id\":\"1\",\"title\":\"\",\"cover\":\"\",\"content\":\"<p><img src=\\\"\\/uploads\\/20190930\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\\\" data-filename=\\\"filename\\\" style=\\\"width: 638px;\\\"><br><\\/p>\",\"ptime\":\"2019-09-30 18:25:48\",\"views\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569839192);
INSERT INTO `fa_admin_log` VALUES (248, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569839201);
INSERT INTO `fa_admin_log` VALUES (249, 1, 'admin', '/admin/article/article_detail/del/ids/1', '文章 文章管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569839260);
INSERT INTO `fa_admin_log` VALUES (250, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569840535);
INSERT INTO `fa_admin_log` VALUES (251, 1, 'admin', '/admin/article/article_detail/add?dialog=1', '文章 文章管理 添加', '{\"dialog\":\"1\",\"row\":{\"article_id\":\"1\",\"title\":\"\\u6587\\u7ae0\\u7c7b\\u76ee\",\"cover\":\"\\/uploads\\/20190930\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"content\":\"<p><img src=\\\"\\/assets\\/img\\/qrcode.png\\\" style=\\\"width: 150px;\\\"><br><\\/p>\",\"ptime\":\"2019-09-30 18:48:24\",\"views\":\"0\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569840539);
INSERT INTO `fa_admin_log` VALUES (252, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569840821);
INSERT INTO `fa_admin_log` VALUES (253, 1, 'admin', '/admin/video/video/index', '视频管理 视频类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569840855);
INSERT INTO `fa_admin_log` VALUES (254, 1, 'admin', '/admin/auth/rule/multi/ids/3', '', '{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=0\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569840970);
INSERT INTO `fa_admin_log` VALUES (255, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569840972);
INSERT INTO `fa_admin_log` VALUES (256, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569841045);
INSERT INTO `fa_admin_log` VALUES (257, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569904946);
INSERT INTO `fa_admin_log` VALUES (258, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569920934);
INSERT INTO `fa_admin_log` VALUES (259, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569920959);
INSERT INTO `fa_admin_log` VALUES (260, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569920969);
INSERT INTO `fa_admin_log` VALUES (261, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569920974);
INSERT INTO `fa_admin_log` VALUES (262, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569920987);
INSERT INTO `fa_admin_log` VALUES (263, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921118);
INSERT INTO `fa_admin_log` VALUES (264, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921127);
INSERT INTO `fa_admin_log` VALUES (265, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921348);
INSERT INTO `fa_admin_log` VALUES (266, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921378);
INSERT INTO `fa_admin_log` VALUES (267, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921408);
INSERT INTO `fa_admin_log` VALUES (268, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921434);
INSERT INTO `fa_admin_log` VALUES (269, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921450);
INSERT INTO `fa_admin_log` VALUES (270, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921493);
INSERT INTO `fa_admin_log` VALUES (271, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921497);
INSERT INTO `fa_admin_log` VALUES (272, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921498);
INSERT INTO `fa_admin_log` VALUES (273, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921562);
INSERT INTO `fa_admin_log` VALUES (274, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921578);
INSERT INTO `fa_admin_log` VALUES (275, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921580);
INSERT INTO `fa_admin_log` VALUES (276, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921590);
INSERT INTO `fa_admin_log` VALUES (277, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921592);
INSERT INTO `fa_admin_log` VALUES (278, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921787);
INSERT INTO `fa_admin_log` VALUES (279, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921788);
INSERT INTO `fa_admin_log` VALUES (280, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921804);
INSERT INTO `fa_admin_log` VALUES (281, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921856);
INSERT INTO `fa_admin_log` VALUES (282, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921882);
INSERT INTO `fa_admin_log` VALUES (283, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921940);
INSERT INTO `fa_admin_log` VALUES (284, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921942);
INSERT INTO `fa_admin_log` VALUES (285, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569921998);
INSERT INTO `fa_admin_log` VALUES (286, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922021);
INSERT INTO `fa_admin_log` VALUES (287, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922026);
INSERT INTO `fa_admin_log` VALUES (288, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922028);
INSERT INTO `fa_admin_log` VALUES (289, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922028);
INSERT INTO `fa_admin_log` VALUES (290, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922029);
INSERT INTO `fa_admin_log` VALUES (291, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922029);
INSERT INTO `fa_admin_log` VALUES (292, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922030);
INSERT INTO `fa_admin_log` VALUES (293, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922031);
INSERT INTO `fa_admin_log` VALUES (294, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922074);
INSERT INTO `fa_admin_log` VALUES (295, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922076);
INSERT INTO `fa_admin_log` VALUES (296, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922078);
INSERT INTO `fa_admin_log` VALUES (297, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922106);
INSERT INTO `fa_admin_log` VALUES (298, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922148);
INSERT INTO `fa_admin_log` VALUES (299, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922150);
INSERT INTO `fa_admin_log` VALUES (300, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922232);
INSERT INTO `fa_admin_log` VALUES (301, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922234);
INSERT INTO `fa_admin_log` VALUES (302, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922235);
INSERT INTO `fa_admin_log` VALUES (303, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922236);
INSERT INTO `fa_admin_log` VALUES (304, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922237);
INSERT INTO `fa_admin_log` VALUES (305, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922237);
INSERT INTO `fa_admin_log` VALUES (306, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922238);
INSERT INTO `fa_admin_log` VALUES (307, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922275);
INSERT INTO `fa_admin_log` VALUES (308, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922578);
INSERT INTO `fa_admin_log` VALUES (309, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922584);
INSERT INTO `fa_admin_log` VALUES (310, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922586);
INSERT INTO `fa_admin_log` VALUES (311, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922700);
INSERT INTO `fa_admin_log` VALUES (312, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569922701);
INSERT INTO `fa_admin_log` VALUES (313, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569923030);
INSERT INTO `fa_admin_log` VALUES (314, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569923034);
INSERT INTO `fa_admin_log` VALUES (315, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569923036);
INSERT INTO `fa_admin_log` VALUES (316, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925449);
INSERT INTO `fa_admin_log` VALUES (317, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925556);
INSERT INTO `fa_admin_log` VALUES (318, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925559);
INSERT INTO `fa_admin_log` VALUES (319, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925561);
INSERT INTO `fa_admin_log` VALUES (320, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925876);
INSERT INTO `fa_admin_log` VALUES (321, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925877);
INSERT INTO `fa_admin_log` VALUES (322, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925878);
INSERT INTO `fa_admin_log` VALUES (323, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925879);
INSERT INTO `fa_admin_log` VALUES (324, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925880);
INSERT INTO `fa_admin_log` VALUES (325, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925950);
INSERT INTO `fa_admin_log` VALUES (326, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569925983);
INSERT INTO `fa_admin_log` VALUES (327, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926013);
INSERT INTO `fa_admin_log` VALUES (328, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926015);
INSERT INTO `fa_admin_log` VALUES (329, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926018);
INSERT INTO `fa_admin_log` VALUES (330, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926018);
INSERT INTO `fa_admin_log` VALUES (331, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926024);
INSERT INTO `fa_admin_log` VALUES (332, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926057);
INSERT INTO `fa_admin_log` VALUES (333, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926087);
INSERT INTO `fa_admin_log` VALUES (334, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926089);
INSERT INTO `fa_admin_log` VALUES (335, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926091);
INSERT INTO `fa_admin_log` VALUES (336, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926091);
INSERT INTO `fa_admin_log` VALUES (337, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926092);
INSERT INTO `fa_admin_log` VALUES (338, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926093);
INSERT INTO `fa_admin_log` VALUES (339, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926095);
INSERT INTO `fa_admin_log` VALUES (340, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926131);
INSERT INTO `fa_admin_log` VALUES (341, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926160);
INSERT INTO `fa_admin_log` VALUES (342, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926162);
INSERT INTO `fa_admin_log` VALUES (343, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926163);
INSERT INTO `fa_admin_log` VALUES (344, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926164);
INSERT INTO `fa_admin_log` VALUES (345, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926164);
INSERT INTO `fa_admin_log` VALUES (346, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926165);
INSERT INTO `fa_admin_log` VALUES (347, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926166);
INSERT INTO `fa_admin_log` VALUES (348, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926166);
INSERT INTO `fa_admin_log` VALUES (349, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926166);
INSERT INTO `fa_admin_log` VALUES (350, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926167);
INSERT INTO `fa_admin_log` VALUES (351, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926167);
INSERT INTO `fa_admin_log` VALUES (352, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926167);
INSERT INTO `fa_admin_log` VALUES (353, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926168);
INSERT INTO `fa_admin_log` VALUES (354, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926168);
INSERT INTO `fa_admin_log` VALUES (355, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926168);
INSERT INTO `fa_admin_log` VALUES (356, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926169);
INSERT INTO `fa_admin_log` VALUES (357, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926169);
INSERT INTO `fa_admin_log` VALUES (358, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926169);
INSERT INTO `fa_admin_log` VALUES (359, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926170);
INSERT INTO `fa_admin_log` VALUES (360, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926170);
INSERT INTO `fa_admin_log` VALUES (361, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926170);
INSERT INTO `fa_admin_log` VALUES (362, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926171);
INSERT INTO `fa_admin_log` VALUES (363, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926171);
INSERT INTO `fa_admin_log` VALUES (364, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926172);
INSERT INTO `fa_admin_log` VALUES (365, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926172);
INSERT INTO `fa_admin_log` VALUES (366, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926172);
INSERT INTO `fa_admin_log` VALUES (367, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926173);
INSERT INTO `fa_admin_log` VALUES (368, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926173);
INSERT INTO `fa_admin_log` VALUES (369, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926174);
INSERT INTO `fa_admin_log` VALUES (370, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926174);
INSERT INTO `fa_admin_log` VALUES (371, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926174);
INSERT INTO `fa_admin_log` VALUES (372, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926175);
INSERT INTO `fa_admin_log` VALUES (373, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926175);
INSERT INTO `fa_admin_log` VALUES (374, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926175);
INSERT INTO `fa_admin_log` VALUES (375, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926176);
INSERT INTO `fa_admin_log` VALUES (376, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926176);
INSERT INTO `fa_admin_log` VALUES (377, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926188);
INSERT INTO `fa_admin_log` VALUES (378, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"2\",\"typedata\":\"0\",\"title\":\"\\u6587\\u7ae0\\u7c7b\\u76ee\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926197);
INSERT INTO `fa_admin_log` VALUES (379, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926201);
INSERT INTO `fa_admin_log` VALUES (380, 1, 'admin', '/admin/question/question_detail/add?dialog=1', '考题管理 考题管理 添加', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"2\",\"typedata\":\"1\",\"title\":\"\\u8bd5\\u5377\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"D\"]}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926212);
INSERT INTO `fa_admin_log` VALUES (381, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926220);
INSERT INTO `fa_admin_log` VALUES (382, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926221);
INSERT INTO `fa_admin_log` VALUES (383, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926223);
INSERT INTO `fa_admin_log` VALUES (384, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926223);
INSERT INTO `fa_admin_log` VALUES (385, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926224);
INSERT INTO `fa_admin_log` VALUES (386, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926224);
INSERT INTO `fa_admin_log` VALUES (387, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926225);
INSERT INTO `fa_admin_log` VALUES (388, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926231);
INSERT INTO `fa_admin_log` VALUES (389, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569926234);
INSERT INTO `fa_admin_log` VALUES (390, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569927659);
INSERT INTO `fa_admin_log` VALUES (391, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569927818);
INSERT INTO `fa_admin_log` VALUES (392, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569929300);
INSERT INTO `fa_admin_log` VALUES (393, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569929336);
INSERT INTO `fa_admin_log` VALUES (394, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569929464);
INSERT INTO `fa_admin_log` VALUES (395, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569929522);
INSERT INTO `fa_admin_log` VALUES (396, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569929668);
INSERT INTO `fa_admin_log` VALUES (397, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569930113);
INSERT INTO `fa_admin_log` VALUES (398, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569930320);
INSERT INTO `fa_admin_log` VALUES (399, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569930553);
INSERT INTO `fa_admin_log` VALUES (400, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569930757);
INSERT INTO `fa_admin_log` VALUES (401, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569930790);
INSERT INTO `fa_admin_log` VALUES (402, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931180);
INSERT INTO `fa_admin_log` VALUES (403, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931284);
INSERT INTO `fa_admin_log` VALUES (404, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931338);
INSERT INTO `fa_admin_log` VALUES (405, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931404);
INSERT INTO `fa_admin_log` VALUES (406, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931502);
INSERT INTO `fa_admin_log` VALUES (407, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931563);
INSERT INTO `fa_admin_log` VALUES (408, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931637);
INSERT INTO `fa_admin_log` VALUES (409, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931658);
INSERT INTO `fa_admin_log` VALUES (410, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931693);
INSERT INTO `fa_admin_log` VALUES (411, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931724);
INSERT INTO `fa_admin_log` VALUES (412, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931746);
INSERT INTO `fa_admin_log` VALUES (413, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931754);
INSERT INTO `fa_admin_log` VALUES (414, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569931851);
INSERT INTO `fa_admin_log` VALUES (415, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932101);
INSERT INTO `fa_admin_log` VALUES (416, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932233);
INSERT INTO `fa_admin_log` VALUES (417, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932344);
INSERT INTO `fa_admin_log` VALUES (418, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932404);
INSERT INTO `fa_admin_log` VALUES (419, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932479);
INSERT INTO `fa_admin_log` VALUES (420, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932540);
INSERT INTO `fa_admin_log` VALUES (421, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932613);
INSERT INTO `fa_admin_log` VALUES (422, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932659);
INSERT INTO `fa_admin_log` VALUES (423, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932671);
INSERT INTO `fa_admin_log` VALUES (424, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932683);
INSERT INTO `fa_admin_log` VALUES (425, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932893);
INSERT INTO `fa_admin_log` VALUES (426, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932929);
INSERT INTO `fa_admin_log` VALUES (427, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932935);
INSERT INTO `fa_admin_log` VALUES (428, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932941);
INSERT INTO `fa_admin_log` VALUES (429, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932947);
INSERT INTO `fa_admin_log` VALUES (430, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569932948);
INSERT INTO `fa_admin_log` VALUES (431, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933055);
INSERT INTO `fa_admin_log` VALUES (432, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933060);
INSERT INTO `fa_admin_log` VALUES (433, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933061);
INSERT INTO `fa_admin_log` VALUES (434, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933070);
INSERT INTO `fa_admin_log` VALUES (435, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933070);
INSERT INTO `fa_admin_log` VALUES (436, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933097);
INSERT INTO `fa_admin_log` VALUES (437, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933099);
INSERT INTO `fa_admin_log` VALUES (438, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933100);
INSERT INTO `fa_admin_log` VALUES (439, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933184);
INSERT INTO `fa_admin_log` VALUES (440, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933186);
INSERT INTO `fa_admin_log` VALUES (441, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933187);
INSERT INTO `fa_admin_log` VALUES (442, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933208);
INSERT INTO `fa_admin_log` VALUES (443, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933213);
INSERT INTO `fa_admin_log` VALUES (444, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933214);
INSERT INTO `fa_admin_log` VALUES (445, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933326);
INSERT INTO `fa_admin_log` VALUES (446, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933329);
INSERT INTO `fa_admin_log` VALUES (447, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933331);
INSERT INTO `fa_admin_log` VALUES (448, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933401);
INSERT INTO `fa_admin_log` VALUES (449, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933409);
INSERT INTO `fa_admin_log` VALUES (450, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933414);
INSERT INTO `fa_admin_log` VALUES (451, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933453);
INSERT INTO `fa_admin_log` VALUES (452, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933455);
INSERT INTO `fa_admin_log` VALUES (453, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933457);
INSERT INTO `fa_admin_log` VALUES (454, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933458);
INSERT INTO `fa_admin_log` VALUES (455, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933459);
INSERT INTO `fa_admin_log` VALUES (456, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933459);
INSERT INTO `fa_admin_log` VALUES (457, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933462);
INSERT INTO `fa_admin_log` VALUES (458, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933462);
INSERT INTO `fa_admin_log` VALUES (459, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933464);
INSERT INTO `fa_admin_log` VALUES (460, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933465);
INSERT INTO `fa_admin_log` VALUES (461, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933466);
INSERT INTO `fa_admin_log` VALUES (462, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933468);
INSERT INTO `fa_admin_log` VALUES (463, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933470);
INSERT INTO `fa_admin_log` VALUES (464, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933474);
INSERT INTO `fa_admin_log` VALUES (465, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933476);
INSERT INTO `fa_admin_log` VALUES (466, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933477);
INSERT INTO `fa_admin_log` VALUES (467, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933478);
INSERT INTO `fa_admin_log` VALUES (468, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933478);
INSERT INTO `fa_admin_log` VALUES (469, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933479);
INSERT INTO `fa_admin_log` VALUES (470, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933480);
INSERT INTO `fa_admin_log` VALUES (471, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933481);
INSERT INTO `fa_admin_log` VALUES (472, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569933481);
INSERT INTO `fa_admin_log` VALUES (473, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935780);
INSERT INTO `fa_admin_log` VALUES (474, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935782);
INSERT INTO `fa_admin_log` VALUES (475, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935785);
INSERT INTO `fa_admin_log` VALUES (476, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935787);
INSERT INTO `fa_admin_log` VALUES (477, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935790);
INSERT INTO `fa_admin_log` VALUES (478, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935791);
INSERT INTO `fa_admin_log` VALUES (479, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935793);
INSERT INTO `fa_admin_log` VALUES (480, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935794);
INSERT INTO `fa_admin_log` VALUES (481, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935799);
INSERT INTO `fa_admin_log` VALUES (482, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935800);
INSERT INTO `fa_admin_log` VALUES (483, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935802);
INSERT INTO `fa_admin_log` VALUES (484, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935803);
INSERT INTO `fa_admin_log` VALUES (485, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935803);
INSERT INTO `fa_admin_log` VALUES (486, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935804);
INSERT INTO `fa_admin_log` VALUES (487, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935805);
INSERT INTO `fa_admin_log` VALUES (488, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935806);
INSERT INTO `fa_admin_log` VALUES (489, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935806);
INSERT INTO `fa_admin_log` VALUES (490, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935807);
INSERT INTO `fa_admin_log` VALUES (491, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935807);
INSERT INTO `fa_admin_log` VALUES (492, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935808);
INSERT INTO `fa_admin_log` VALUES (493, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935808);
INSERT INTO `fa_admin_log` VALUES (494, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935808);
INSERT INTO `fa_admin_log` VALUES (495, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935809);
INSERT INTO `fa_admin_log` VALUES (496, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935809);
INSERT INTO `fa_admin_log` VALUES (497, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935810);
INSERT INTO `fa_admin_log` VALUES (498, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935971);
INSERT INTO `fa_admin_log` VALUES (499, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935972);
INSERT INTO `fa_admin_log` VALUES (500, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935976);
INSERT INTO `fa_admin_log` VALUES (501, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935977);
INSERT INTO `fa_admin_log` VALUES (502, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935979);
INSERT INTO `fa_admin_log` VALUES (503, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935980);
INSERT INTO `fa_admin_log` VALUES (504, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935981);
INSERT INTO `fa_admin_log` VALUES (505, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935981);
INSERT INTO `fa_admin_log` VALUES (506, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569935981);
INSERT INTO `fa_admin_log` VALUES (507, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936036);
INSERT INTO `fa_admin_log` VALUES (508, 1, 'admin', '/admin/article/article/index', '文章 文章类目 查看', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"AND\",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936049);
INSERT INTO `fa_admin_log` VALUES (509, 1, 'admin', '/admin/auth/rule/edit/ids/143?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"fdb6b553975c2d96c307edf787c7f2c4\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"article\",\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"143\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936144);
INSERT INTO `fa_admin_log` VALUES (510, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936146);
INSERT INTO `fa_admin_log` VALUES (511, 1, 'admin', '/admin/auth/rule/edit/ids/143?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"bbdce34afc8e0ef5281ded5d97210e12\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"article\",\"title\":\"\\u6587\\u7ae0\\u7ba1\\u7406\",\"icon\":\"fa fa-building\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"143\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936165);
INSERT INTO `fa_admin_log` VALUES (512, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936166);
INSERT INTO `fa_admin_log` VALUES (513, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936204);
INSERT INTO `fa_admin_log` VALUES (514, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936740);
INSERT INTO `fa_admin_log` VALUES (515, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936741);
INSERT INTO `fa_admin_log` VALUES (516, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936742);
INSERT INTO `fa_admin_log` VALUES (517, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936743);
INSERT INTO `fa_admin_log` VALUES (518, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936746);
INSERT INTO `fa_admin_log` VALUES (519, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936768);
INSERT INTO `fa_admin_log` VALUES (520, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936769);
INSERT INTO `fa_admin_log` VALUES (521, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936769);
INSERT INTO `fa_admin_log` VALUES (522, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936770);
INSERT INTO `fa_admin_log` VALUES (523, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936777);
INSERT INTO `fa_admin_log` VALUES (524, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936777);
INSERT INTO `fa_admin_log` VALUES (525, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936778);
INSERT INTO `fa_admin_log` VALUES (526, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569936780);
INSERT INTO `fa_admin_log` VALUES (527, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937253);
INSERT INTO `fa_admin_log` VALUES (528, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937254);
INSERT INTO `fa_admin_log` VALUES (529, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937257);
INSERT INTO `fa_admin_log` VALUES (530, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937257);
INSERT INTO `fa_admin_log` VALUES (531, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937258);
INSERT INTO `fa_admin_log` VALUES (532, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937259);
INSERT INTO `fa_admin_log` VALUES (533, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937259);
INSERT INTO `fa_admin_log` VALUES (534, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937260);
INSERT INTO `fa_admin_log` VALUES (535, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937260);
INSERT INTO `fa_admin_log` VALUES (536, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937261);
INSERT INTO `fa_admin_log` VALUES (537, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937261);
INSERT INTO `fa_admin_log` VALUES (538, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937261);
INSERT INTO `fa_admin_log` VALUES (539, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937262);
INSERT INTO `fa_admin_log` VALUES (540, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937263);
INSERT INTO `fa_admin_log` VALUES (541, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937263);
INSERT INTO `fa_admin_log` VALUES (542, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937264);
INSERT INTO `fa_admin_log` VALUES (543, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937265);
INSERT INTO `fa_admin_log` VALUES (544, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937265);
INSERT INTO `fa_admin_log` VALUES (545, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937266);
INSERT INTO `fa_admin_log` VALUES (546, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937267);
INSERT INTO `fa_admin_log` VALUES (547, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937267);
INSERT INTO `fa_admin_log` VALUES (548, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937268);
INSERT INTO `fa_admin_log` VALUES (549, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937268);
INSERT INTO `fa_admin_log` VALUES (550, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937269);
INSERT INTO `fa_admin_log` VALUES (551, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937269);
INSERT INTO `fa_admin_log` VALUES (552, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937270);
INSERT INTO `fa_admin_log` VALUES (553, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937271);
INSERT INTO `fa_admin_log` VALUES (554, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937271);
INSERT INTO `fa_admin_log` VALUES (555, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937272);
INSERT INTO `fa_admin_log` VALUES (556, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937272);
INSERT INTO `fa_admin_log` VALUES (557, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937273);
INSERT INTO `fa_admin_log` VALUES (558, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937273);
INSERT INTO `fa_admin_log` VALUES (559, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937274);
INSERT INTO `fa_admin_log` VALUES (560, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937274);
INSERT INTO `fa_admin_log` VALUES (561, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937275);
INSERT INTO `fa_admin_log` VALUES (562, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937275);
INSERT INTO `fa_admin_log` VALUES (563, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937450);
INSERT INTO `fa_admin_log` VALUES (564, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937458);
INSERT INTO `fa_admin_log` VALUES (565, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937461);
INSERT INTO `fa_admin_log` VALUES (566, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937465);
INSERT INTO `fa_admin_log` VALUES (567, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937469);
INSERT INTO `fa_admin_log` VALUES (568, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937473);
INSERT INTO `fa_admin_log` VALUES (569, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937476);
INSERT INTO `fa_admin_log` VALUES (570, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937479);
INSERT INTO `fa_admin_log` VALUES (571, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937481);
INSERT INTO `fa_admin_log` VALUES (572, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569937484);
INSERT INTO `fa_admin_log` VALUES (573, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981544);
INSERT INTO `fa_admin_log` VALUES (574, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981545);
INSERT INTO `fa_admin_log` VALUES (575, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981546);
INSERT INTO `fa_admin_log` VALUES (576, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981547);
INSERT INTO `fa_admin_log` VALUES (577, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981548);
INSERT INTO `fa_admin_log` VALUES (578, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981549);
INSERT INTO `fa_admin_log` VALUES (579, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981550);
INSERT INTO `fa_admin_log` VALUES (580, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981551);
INSERT INTO `fa_admin_log` VALUES (581, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981552);
INSERT INTO `fa_admin_log` VALUES (582, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981553);
INSERT INTO `fa_admin_log` VALUES (583, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981554);
INSERT INTO `fa_admin_log` VALUES (584, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981554);
INSERT INTO `fa_admin_log` VALUES (585, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981555);
INSERT INTO `fa_admin_log` VALUES (586, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981556);
INSERT INTO `fa_admin_log` VALUES (587, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981557);
INSERT INTO `fa_admin_log` VALUES (588, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981558);
INSERT INTO `fa_admin_log` VALUES (589, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981559);
INSERT INTO `fa_admin_log` VALUES (590, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981560);
INSERT INTO `fa_admin_log` VALUES (591, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981560);
INSERT INTO `fa_admin_log` VALUES (592, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981561);
INSERT INTO `fa_admin_log` VALUES (593, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981563);
INSERT INTO `fa_admin_log` VALUES (594, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981565);
INSERT INTO `fa_admin_log` VALUES (595, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981566);
INSERT INTO `fa_admin_log` VALUES (596, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981567);
INSERT INTO `fa_admin_log` VALUES (597, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981568);
INSERT INTO `fa_admin_log` VALUES (598, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981569);
INSERT INTO `fa_admin_log` VALUES (599, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\",\"questionids\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981666);
INSERT INTO `fa_admin_log` VALUES (600, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981923);
INSERT INTO `fa_admin_log` VALUES (601, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981924);
INSERT INTO `fa_admin_log` VALUES (602, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981924);
INSERT INTO `fa_admin_log` VALUES (603, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981925);
INSERT INTO `fa_admin_log` VALUES (604, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981926);
INSERT INTO `fa_admin_log` VALUES (605, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981926);
INSERT INTO `fa_admin_log` VALUES (606, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981926);
INSERT INTO `fa_admin_log` VALUES (607, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981927);
INSERT INTO `fa_admin_log` VALUES (608, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981927);
INSERT INTO `fa_admin_log` VALUES (609, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981928);
INSERT INTO `fa_admin_log` VALUES (610, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981928);
INSERT INTO `fa_admin_log` VALUES (611, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981928);
INSERT INTO `fa_admin_log` VALUES (612, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981930);
INSERT INTO `fa_admin_log` VALUES (613, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981930);
INSERT INTO `fa_admin_log` VALUES (614, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981931);
INSERT INTO `fa_admin_log` VALUES (615, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981931);
INSERT INTO `fa_admin_log` VALUES (616, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981932);
INSERT INTO `fa_admin_log` VALUES (617, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981932);
INSERT INTO `fa_admin_log` VALUES (618, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981933);
INSERT INTO `fa_admin_log` VALUES (619, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981933);
INSERT INTO `fa_admin_log` VALUES (620, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\",\"questionids\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981948);
INSERT INTO `fa_admin_log` VALUES (621, 1, 'admin', '/admin/examination/examination/del/ids/1', '试卷管理 试卷管理 删除', '{\"action\":\"del\",\"ids\":\"1\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981968);
INSERT INTO `fa_admin_log` VALUES (622, 1, 'admin', '/admin/examination/examination/del/ids/2', '试卷管理 试卷管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981970);
INSERT INTO `fa_admin_log` VALUES (623, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981994);
INSERT INTO `fa_admin_log` VALUES (624, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981996);
INSERT INTO `fa_admin_log` VALUES (625, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569981997);
INSERT INTO `fa_admin_log` VALUES (626, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982008);
INSERT INTO `fa_admin_log` VALUES (627, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982009);
INSERT INTO `fa_admin_log` VALUES (628, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982010);
INSERT INTO `fa_admin_log` VALUES (629, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982010);
INSERT INTO `fa_admin_log` VALUES (630, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982011);
INSERT INTO `fa_admin_log` VALUES (631, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982012);
INSERT INTO `fa_admin_log` VALUES (632, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982012);
INSERT INTO `fa_admin_log` VALUES (633, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982013);
INSERT INTO `fa_admin_log` VALUES (634, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982014);
INSERT INTO `fa_admin_log` VALUES (635, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982014);
INSERT INTO `fa_admin_log` VALUES (636, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982015);
INSERT INTO `fa_admin_log` VALUES (637, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982015);
INSERT INTO `fa_admin_log` VALUES (638, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982016);
INSERT INTO `fa_admin_log` VALUES (639, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982017);
INSERT INTO `fa_admin_log` VALUES (640, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982017);
INSERT INTO `fa_admin_log` VALUES (641, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982022);
INSERT INTO `fa_admin_log` VALUES (642, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982022);
INSERT INTO `fa_admin_log` VALUES (643, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982024);
INSERT INTO `fa_admin_log` VALUES (644, 1, 'admin', '/admin/examination/examination/getQuestions', '', '{\"question_id\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1569982024);
INSERT INTO `fa_admin_log` VALUES (645, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008534);
INSERT INTO `fa_admin_log` VALUES (646, 1, 'admin', '/admin/article/article_detail/edit/ids/2?dialog=1', '文章管理 文章管理 编辑', '{\"dialog\":\"1\",\"row\":{\"article_id\":\"1\",\"title\":\"\\u6587\\u7ae0\\u7c7b\\u76ee\",\"cover\":\"\\/uploads\\/20190930\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"content\":\"<p><img src=\\\"\\/assets\\/img\\/qrcode.png\\\" style=\\\"width: 50px;\\\"><br><\\/p>\",\"ptime\":\"2019-09-30 18:48:24\",\"views\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008555);
INSERT INTO `fa_admin_log` VALUES (647, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008559);
INSERT INTO `fa_admin_log` VALUES (648, 1, 'admin', '/admin/article/article_detail/edit/ids/2?dialog=1', '文章管理 文章管理 编辑', '{\"dialog\":\"1\",\"row\":{\"article_id\":\"1\",\"title\":\"\\u6587\\u7ae0\\u7c7b\\u76ee\",\"cover\":\"\",\"content\":\"<p><img src=\\\"\\/assets\\/img\\/qrcode.png\\\" style=\\\"width: 50px;\\\"><br><\\/p>\",\"ptime\":\"2019-09-30 18:48:24\",\"views\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008573);
INSERT INTO `fa_admin_log` VALUES (649, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008576);
INSERT INTO `fa_admin_log` VALUES (650, 1, 'admin', '/admin/article/article_detail/edit/ids/2?dialog=1', '文章管理 文章管理 编辑', '{\"dialog\":\"1\",\"row\":{\"article_id\":\"1\",\"title\":\"\\u6587\\u7ae0\\u7c7b\\u76ee\",\"cover\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"content\":\"<p><img src=\\\"\\/assets\\/img\\/qrcode.png\\\" style=\\\"width: 50px;\\\"><br><\\/p>\",\"ptime\":\"2019-09-30 18:48:24\",\"views\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008587);
INSERT INTO `fa_admin_log` VALUES (651, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"questionids\":\"12,14\"},\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008802);
INSERT INTO `fa_admin_log` VALUES (652, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5b66\\u4e60\\u89c6\\u9891\",\"questionids\":\"15,14,11,12\"},\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570008965);
INSERT INTO `fa_admin_log` VALUES (653, 1, 'admin', '/admin/examination/examination/del/ids/4', '试卷管理 试卷管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570009530);
INSERT INTO `fa_admin_log` VALUES (654, 1, 'admin', '/admin/examination/examination/del/ids/3', '试卷管理 试卷管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570009531);
INSERT INTO `fa_admin_log` VALUES (655, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"11,13,14\"},\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570013709);
INSERT INTO `fa_admin_log` VALUES (656, 1, 'admin', '/admin/examination/examination/add?dialog=1', '试卷管理 试卷管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,11\"},\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570013778);
INSERT INTO `fa_admin_log` VALUES (657, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,11\"},\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570017581);
INSERT INTO `fa_admin_log` VALUES (658, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,11\"},\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570018147);
INSERT INTO `fa_admin_log` VALUES (659, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,11\"},\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570018163);
INSERT INTO `fa_admin_log` VALUES (660, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,13\"},\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019307);
INSERT INTO `fa_admin_log` VALUES (661, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,13,15\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019318);
INSERT INTO `fa_admin_log` VALUES (662, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,13,15,14\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019331);
INSERT INTO `fa_admin_log` VALUES (663, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"11,13\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019349);
INSERT INTO `fa_admin_log` VALUES (664, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15,13\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019373);
INSERT INTO `fa_admin_log` VALUES (665, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"15\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019397);
INSERT INTO `fa_admin_log` VALUES (666, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019485);
INSERT INTO `fa_admin_log` VALUES (667, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019671);
INSERT INTO `fa_admin_log` VALUES (668, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019742);
INSERT INTO `fa_admin_log` VALUES (669, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"11,13\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019807);
INSERT INTO `fa_admin_log` VALUES (670, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"11,12\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019873);
INSERT INTO `fa_admin_log` VALUES (671, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"11,13\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570019944);
INSERT INTO `fa_admin_log` VALUES (672, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"11\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570020156);
INSERT INTO `fa_admin_log` VALUES (673, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570020184);
INSERT INTO `fa_admin_log` VALUES (674, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,12\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570020193);
INSERT INTO `fa_admin_log` VALUES (675, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,11\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570020205);
INSERT INTO `fa_admin_log` VALUES (676, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,13\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570020215);
INSERT INTO `fa_admin_log` VALUES (677, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,13,12\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570020227);
INSERT INTO `fa_admin_log` VALUES (678, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,13,11\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570020236);
INSERT INTO `fa_admin_log` VALUES (679, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570021549);
INSERT INTO `fa_admin_log` VALUES (680, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570021615);
INSERT INTO `fa_admin_log` VALUES (681, 1, 'admin', '/admin/question/question_detail/edit/ids/11?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u9a7e\\u9a76\\u673a\\u52a8\\u8f66\\u5728\\u9053\\u8def\\u4e0a\\u8fdd\\u53cd\\u9053\\u8def\\u4ea4\\u901a\\u5b89\\u5168\\u6cd5\\u7684\\u884c\\u4e3a\\uff0c\\u5c5e\\u4e8e\\u4ec0\\u4e48\\u884c\\u4e3a\\uff1f\",\"optiona\":\"\\u8fdd\\u7ae0\\u884c\\u4e3a\",\"optionb\":\"\\u8fc7\\u5931\\u884c\\u4e3a\",\"optionc\":\"\\u8fdd\\u89c4\\u884c\\u4e3a\",\"optiond\":\"\\u8fdd\\u6cd5\\u884c\\u4e3a\",\"answerdata\":[\"B\"]},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570021658);
INSERT INTO `fa_admin_log` VALUES (682, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,13\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570021671);
INSERT INTO `fa_admin_log` VALUES (683, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,11\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570021682);
INSERT INTO `fa_admin_log` VALUES (684, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"11\"},\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022231);
INSERT INTO `fa_admin_log` VALUES (685, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022329);
INSERT INTO `fa_admin_log` VALUES (686, 1, 'admin', '/admin/question/question_detail/edit/ids/12?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u8def\\u53e3\\u6700\\u524d\\u7aef\\u7684\\u53cc\\u767d\\u5b9e\\u7ebf\\u662f\\u4ec0\\u4e48\\u542b\\u4e49\\uff1f\",\"optiona\":\"\\u7b49\\u5019\\u653e\\u884c\\u7ebf\",\"optionb\":\"\\u505c\\u8f66\\u8ba9\\u884c\\u7ebf\",\"optionc\":\"\\u51cf\\u901f\\u8ba9\\u884c\\u7ebf\",\"optiond\":\"\\u5de6\\u5f2f\\u5f85\\u8f6c\\u7ebf\",\"answerdata\":[\"A\"]},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022456);
INSERT INTO `fa_admin_log` VALUES (687, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022464);
INSERT INTO `fa_admin_log` VALUES (688, 1, 'admin', '/admin/question/question_detail/edit/ids/12?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u8def\\u53e3\\u6700\\u524d\\u7aef\\u7684\\u53cc\\u767d\\u5b9e\\u7ebf\\u662f\\u4ec0\\u4e48\\u542b\\u4e49\\uff1f\",\"optiona\":\"\\u7b49\\u5019\\u653e\\u884c\\u7ebf\",\"optionb\":\"\\u505c\\u8f66\\u8ba9\\u884c\\u7ebf\",\"optionc\":\"\\u51cf\\u901f\\u8ba9\\u884c\\u7ebf\",\"optiond\":\"\\u5de6\\u5f2f\\u5f85\\u8f6c\\u7ebf\",\"answerdata\":[\"A\"]},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022468);
INSERT INTO `fa_admin_log` VALUES (689, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022473);
INSERT INTO `fa_admin_log` VALUES (690, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"H5\\u89c6\\u9891\",\"questionids\":\"0,11,12\"},\"btSelectItem\":\"on\",\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022488);
INSERT INTO `fa_admin_log` VALUES (691, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022570);
INSERT INTO `fa_admin_log` VALUES (692, 1, 'admin', '/admin/question/question_detail/edit/ids/12?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u8def\\u53e3\\u6700\\u524d\\u7aef\\u7684\\u53cc\\u767d\\u5b9e\\u7ebf\\u662f\\u4ec0\\u4e48\\u542b\\u4e49\\uff1f\",\"optiona\":\"\\u7b49\\u5019\\u653e\\u884c\\u7ebf\",\"optionb\":\"\\u505c\\u8f66\\u8ba9\\u884c\\u7ebf\",\"optionc\":\"\\u51cf\\u901f\\u8ba9\\u884c\\u7ebf\",\"optiond\":\"\\u5de6\\u5f2f\\u5f85\\u8f6c\\u7ebf\",\"answerdata\":[\"A\"]},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022575);
INSERT INTO `fa_admin_log` VALUES (693, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022596);
INSERT INTO `fa_admin_log` VALUES (694, 1, 'admin', '/admin/question/question_detail/edit/ids/14?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"2\",\"typedata\":\"0\",\"title\":\"\\u6587\\u7ae0\\u7c7b\\u76ee\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"A\"]},\"ids\":\"14\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022599);
INSERT INTO `fa_admin_log` VALUES (695, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022612);
INSERT INTO `fa_admin_log` VALUES (696, 1, 'admin', '/admin/question/question_detail/edit/ids/12?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u8def\\u53e3\\u6700\\u524d\\u7aef\\u7684\\u53cc\\u767d\\u5b9e\\u7ebf\\u662f\\u4ec0\\u4e48\\u542b\\u4e49\\uff1f\",\"optiona\":\"\\u7b49\\u5019\\u653e\\u884c\\u7ebf\",\"optionb\":\"\\u505c\\u8f66\\u8ba9\\u884c\\u7ebf\",\"optionc\":\"\\u51cf\\u901f\\u8ba9\\u884c\\u7ebf\",\"optiond\":\"\\u5de6\\u5f2f\\u5f85\\u8f6c\\u7ebf\",\"answerdata\":[\"A\"]},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022631);
INSERT INTO `fa_admin_log` VALUES (697, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022726);
INSERT INTO `fa_admin_log` VALUES (698, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022726);
INSERT INTO `fa_admin_log` VALUES (699, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022726);
INSERT INTO `fa_admin_log` VALUES (700, 1, 'admin', '/admin/question/question_detail/edit/ids/12?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u8def\\u53e3\\u6700\\u524d\\u7aef\\u7684\\u53cc\\u767d\\u5b9e\\u7ebf\\u662f\\u4ec0\\u4e48\\u542b\\u4e49\\uff1f\",\"optiona\":\"\\u7b49\\u5019\\u653e\\u884c\\u7ebf\",\"optionb\":\"\\u505c\\u8f66\\u8ba9\\u884c\\u7ebf\",\"optionc\":\"\\u51cf\\u901f\\u8ba9\\u884c\\u7ebf\",\"optiond\":\"\\u5de6\\u5f2f\\u5f85\\u8f6c\\u7ebf\",\"answerdata\":[\"A\"]},\"ids\":\"12\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022728);
INSERT INTO `fa_admin_log` VALUES (701, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022735);
INSERT INTO `fa_admin_log` VALUES (702, 1, 'admin', '/admin/question/question_detail/edit/ids/15?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"2\",\"typedata\":\"1\",\"title\":\"\\u8bd5\\u5377\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"D\"]},\"ids\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022737);
INSERT INTO `fa_admin_log` VALUES (703, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022740);
INSERT INTO `fa_admin_log` VALUES (704, 1, 'admin', '/admin/question/question_detail/edit/ids/11?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"1\",\"typedata\":\"0\",\"title\":\"\\u9a7e\\u9a76\\u673a\\u52a8\\u8f66\\u5728\\u9053\\u8def\\u4e0a\\u8fdd\\u53cd\\u9053\\u8def\\u4ea4\\u901a\\u5b89\\u5168\\u6cd5\\u7684\\u884c\\u4e3a\\uff0c\\u5c5e\\u4e8e\\u4ec0\\u4e48\\u884c\\u4e3a\\uff1f\",\"optiona\":\"\\u8fdd\\u7ae0\\u884c\\u4e3a\",\"optionb\":\"\\u8fc7\\u5931\\u884c\\u4e3a\",\"optionc\":\"\\u8fdd\\u89c4\\u884c\\u4e3a\",\"optiond\":\"\\u8fdd\\u6cd5\\u884c\\u4e3a\",\"answerdata\":[\"A\"]},\"ids\":\"11\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022745);
INSERT INTO `fa_admin_log` VALUES (705, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"2\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"2\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022748);
INSERT INTO `fa_admin_log` VALUES (706, 1, 'admin', '/admin/question/question_detail/edit/ids/15?dialog=1', '考题管理 考题管理 编辑', '{\"dialog\":\"1\",\"row\":{\"question_id\":\"2\",\"typedata\":\"1\",\"title\":\"\\u8bd5\\u5377\\u7ba1\\u7406\",\"optiona\":\"1\",\"optionb\":\"2\",\"optionc\":\"3\",\"optiond\":\"4\",\"answerdata\":[\"B\",\"D\"]},\"ids\":\"15\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022750);
INSERT INTO `fa_admin_log` VALUES (707, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"11,14,12\"},\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022930);
INSERT INTO `fa_admin_log` VALUES (708, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u4e2d\\u6587\",\"questionids\":\"11,14,12,15\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570022942);
INSERT INTO `fa_admin_log` VALUES (709, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570023917);
INSERT INTO `fa_admin_log` VALUES (710, 1, 'admin', '/admin/question/question/index', '考题管理 考题类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570073427);
INSERT INTO `fa_admin_log` VALUES (711, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570100123);
INSERT INTO `fa_admin_log` VALUES (712, 1, 'admin', '/admin/article/article_detail/question/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"questionids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570100452);
INSERT INTO `fa_admin_log` VALUES (713, 1, 'admin', '/admin/article/article_detail/question/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"questionids\":\"12\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570100950);
INSERT INTO `fa_admin_log` VALUES (714, 1, 'admin', '/admin/article/article_detail/question/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"questionids\":\"12,15\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570100962);
INSERT INTO `fa_admin_log` VALUES (715, 1, 'admin', '/admin/article/article_detail/question/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"questionids\":\"12,15\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570101058);
INSERT INTO `fa_admin_log` VALUES (716, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570101111);
INSERT INTO `fa_admin_log` VALUES (717, 1, 'admin', '/admin/article/article/index', '文章管理 文章类目 查看', '{\"searchTable\":\"tbl\",\"searchKey\":\"id\",\"searchValue\":\"1\",\"orderBy\":[[\"name\",\"ASC\"]],\"showField\":\"name\",\"keyField\":\"id\",\"keyValue\":\"1\",\"searchField\":[\"name\"]}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570101184);
INSERT INTO `fa_admin_log` VALUES (718, 1, 'admin', '/admin/article/article_detail/edit/ids/2?dialog=1', '文章管理 文章管理 编辑', '{\"dialog\":\"1\",\"row\":{\"article_id\":\"1\",\"title\":\"2019\\u9a7e\\u6821\\u8003\\u8bd5\\u79d1\\u76ee\\u56db\",\"cover\":\"\\/uploads\\/20190927\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"content\":\"<p><img src=\\\"\\/assets\\/img\\/qrcode.png\\\" style=\\\"width: 50px;\\\"><br><\\/p>\",\"ptime\":\"2019-09-30 18:48:24\",\"views\":\"0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570101204);
INSERT INTO `fa_admin_log` VALUES (719, 1, 'admin', '/admin/auth/rule/edit/ids/156?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"36211461ee466244d340531b71358d41\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"notice\",\"title\":\"\\u516c\\u544a\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"156\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570102722);
INSERT INTO `fa_admin_log` VALUES (720, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570102723);
INSERT INTO `fa_admin_log` VALUES (721, 1, 'admin', '/admin/auth/rule/edit/ids/157?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"93e0039679f93c6856d988e4a93a8537\",\"row\":{\"ismenu\":\"1\",\"pid\":\"156\",\"name\":\"notice\\/notice\",\"title\":\"\\u516c\\u544a\\u7ba1\\u7406\",\"icon\":\"fa fa-building\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"157\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570102746);
INSERT INTO `fa_admin_log` VALUES (722, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570102747);
INSERT INTO `fa_admin_log` VALUES (723, 1, 'admin', '/admin/ajax/upload', '', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570102972);
INSERT INTO `fa_admin_log` VALUES (724, 1, 'admin', '/admin/notice/notice/add?dialog=1', '公告管理 公告管理 添加', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"content\":\"<p><img src=\\\"\\/uploads\\/20191003\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\\\" data-filename=\\\"filename\\\" style=\\\"width: 150px;\\\"><br><\\/p>\",\"objecttype\":\"1\",\"ptime\":\"2019-10-03 19:42:39\",\"views\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570102989);
INSERT INTO `fa_admin_log` VALUES (725, 1, 'admin', '/admin/notice/notice/edit/ids/1?dialog=1', '公告管理 公告管理 编辑', '{\"dialog\":\"1\",\"row\":{\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"content\":\"<p><img src=\\\"\\/uploads\\/20191003\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\\\" data-filename=\\\"filename\\\" style=\\\"width: 150px;\\\"><br><\\/p>\",\"objecttype\":\"0\",\"ptime\":\"2019-10-03 19:42:39\",\"views\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570103044);
INSERT INTO `fa_admin_log` VALUES (726, 1, 'admin', '/admin/plan/plan/add?dialog=1', 'plan 平台学习计划管理 添加', '{\"dialog\":\"1\",\"row\":{\"typedata\":\"0\",\"name\":\"9\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"startdate\":\"2019-10-03\",\"enddate\":\"2019-10-03\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105195);
INSERT INTO `fa_admin_log` VALUES (727, 1, 'admin', '/admin/plan/plan/edit/ids/1?dialog=1', 'plan 平台学习计划管理 编辑', '{\"dialog\":\"1\",\"row\":{\"typedata\":\"1\",\"name\":\"9\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"startdate\":\"2019-10-03\",\"enddate\":\"2019-10-03\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105271);
INSERT INTO `fa_admin_log` VALUES (728, 1, 'admin', '/admin/plan/plan/add?dialog=1', 'plan 平台学习计划管理 添加', '{\"dialog\":\"1\",\"row\":{\"typedata\":\"0\",\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"startdate\":\"2019-10-03\",\"enddate\":\"2019-10-03\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105283);
INSERT INTO `fa_admin_log` VALUES (729, 1, 'admin', '/admin/plan/plan/add?dialog=1', 'plan 平台学习计划管理 添加', '{\"dialog\":\"1\",\"row\":{\"typedata\":\"0\",\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"startdate\":\"2019-10-03\",\"enddate\":\"2019-10-03\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105296);
INSERT INTO `fa_admin_log` VALUES (730, 1, 'admin', '/admin/plan/plan/add?dialog=1', 'plan 平台学习计划管理 添加', '{\"dialog\":\"1\",\"row\":{\"typedata\":\"0\",\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"startdate\":\"2019-10-03\",\"enddate\":\"2019-10-03\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105341);
INSERT INTO `fa_admin_log` VALUES (731, 1, 'admin', '/admin/auth/rule/edit/ids/163?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"3dd2fb018dade61d5ff8e2798215205c\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"plan\",\"title\":\"\\u5e73\\u53f0\\u5b66\\u4e60\\u7ba1\\u7406\",\"icon\":\"fa fa-list\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"163\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105392);
INSERT INTO `fa_admin_log` VALUES (732, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105393);
INSERT INTO `fa_admin_log` VALUES (733, 1, 'admin', '/admin/plan/plan/del/ids/4', '平台学习管理 平台学习计划管理 删除', '{\"action\":\"del\",\"ids\":\"4\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105410);
INSERT INTO `fa_admin_log` VALUES (734, 1, 'admin', '/admin/plan/plan/del/ids/3', '平台学习管理 平台学习计划管理 删除', '{\"action\":\"del\",\"ids\":\"3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570105413);
INSERT INTO `fa_admin_log` VALUES (735, 1, 'admin', '/admin/plan/plan/multi/ids/2', '平台学习管理 平台学习计划管理 批量更新', '{\"ids\":\"2\",\"params\":\"status=normal\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570107110);
INSERT INTO `fa_admin_log` VALUES (736, 1, 'admin', '/admin/auth/rule/edit/ids/164?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"309ecca65f8af82fc60084c94142f1e8\",\"row\":{\"ismenu\":\"1\",\"pid\":\"163\",\"name\":\"plan\\/plan\",\"title\":\"\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\\u7ba1\\u7406\",\"icon\":\"fa fa-first-order\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"164\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570107163);
INSERT INTO `fa_admin_log` VALUES (737, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570107164);
INSERT INTO `fa_admin_log` VALUES (738, 1, 'admin', '/admin/company/add?dialog=1', '公司管理 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u5b66\\u4e60\\u89c6\\u9891\",\"logo\":\"\\/uploads\\/20191003\\/6d88f0620a49c79f5d8e5dba134373e3.jpeg\",\"district\":\"\\u5b89\\u5fbd\\u7701\\/\\u829c\\u6e56\\u5e02\\/\\u9e20\\u6c5f\\u533a\",\"address\":\"\\u5408\\u80a5\\u5305\\u6cb3\\u533a\",\"license\":\"\\/assets\\/img\\/qrcode.png\",\"contact\":\"\\u5f20\\u4e09\",\"phone\":\"13295672345\",\"email\":\"90081249@qq.com\",\"password\":\"12345678\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570153626);
INSERT INTO `fa_admin_log` VALUES (739, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"4\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570158202);
INSERT INTO `fa_admin_log` VALUES (740, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"4\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570158562);
INSERT INTO `fa_admin_log` VALUES (741, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"4\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570158937);
INSERT INTO `fa_admin_log` VALUES (742, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"5\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570159023);
INSERT INTO `fa_admin_log` VALUES (743, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"4\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570159031);
INSERT INTO `fa_admin_log` VALUES (744, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"4,5\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570159190);
INSERT INTO `fa_admin_log` VALUES (745, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"videoids\":\"\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570160871);
INSERT INTO `fa_admin_log` VALUES (746, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"4\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570162060);
INSERT INTO `fa_admin_log` VALUES (747, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"videoids\":\"0\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570162067);
INSERT INTO `fa_admin_log` VALUES (748, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"videoids\":\"0,0\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570162092);
INSERT INTO `fa_admin_log` VALUES (749, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"videoids\":\"0,0,0,0,1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570162212);
INSERT INTO `fa_admin_log` VALUES (750, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"name\":\"10\\u6708\\u5e73\\u53f0\\u5b66\\u4e60\\u8ba1\\u5212\",\"videoids\":\"1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570162423);
INSERT INTO `fa_admin_log` VALUES (751, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179093);
INSERT INTO `fa_admin_log` VALUES (752, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179105);
INSERT INTO `fa_admin_log` VALUES (753, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1,0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179132);
INSERT INTO `fa_admin_log` VALUES (754, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1,0,1,1,0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179142);
INSERT INTO `fa_admin_log` VALUES (755, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179309);
INSERT INTO `fa_admin_log` VALUES (756, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179347);
INSERT INTO `fa_admin_log` VALUES (757, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179464);
INSERT INTO `fa_admin_log` VALUES (758, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1,0\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179481);
INSERT INTO `fa_admin_log` VALUES (759, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179609);
INSERT INTO `fa_admin_log` VALUES (760, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179636);
INSERT INTO `fa_admin_log` VALUES (761, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179697);
INSERT INTO `fa_admin_log` VALUES (762, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179702);
INSERT INTO `fa_admin_log` VALUES (763, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570179706);
INSERT INTO `fa_admin_log` VALUES (764, 1, 'admin', '/admin/examination/examination/edit/ids/9?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"2019\\u9a7e\\u6821\\u8003\\u8bd5\\u79d1\\u76ee\\u4e00\\u8bd5\\u5377\",\"questionids\":\"11,14,12,15\"},\"ids\":\"9\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180282);
INSERT INTO `fa_admin_log` VALUES (765, 1, 'admin', '/admin/examination/examination/edit/ids/8?dialog=1', '试卷管理 试卷管理 编辑', '{\"dialog\":\"1\",\"row\":{\"name\":\"2020\\u9a7e\\u6821\\u8003\\u8bd5\\u79d1\\u76ee\\u4e00\\u8bd5\\u5377\",\"questionids\":\"0,11,12\"},\"ids\":\"8\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180291);
INSERT INTO `fa_admin_log` VALUES (766, 1, 'admin', '/admin/plan/plan/examination/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"examinationids\":\"9\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180319);
INSERT INTO `fa_admin_log` VALUES (767, 1, 'admin', '/admin/plan/plan/examination/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"examinationids\":\"9\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180326);
INSERT INTO `fa_admin_log` VALUES (768, 1, 'admin', '/admin/plan/plan/examination/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"examinationids\":\"9\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180333);
INSERT INTO `fa_admin_log` VALUES (769, 1, 'admin', '/admin/plan/plan/examination/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"examinationids\":\"9\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180443);
INSERT INTO `fa_admin_log` VALUES (770, 1, 'admin', '/admin/plan/plan/examination/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"examinationids\":\"8\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180660);
INSERT INTO `fa_admin_log` VALUES (771, 1, 'admin', '/admin/plan/plan/examination/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"examinationids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180683);
INSERT INTO `fa_admin_log` VALUES (772, 1, 'admin', '/admin/plan/plan/examination/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"examinationids\":\"0,9\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570180691);
INSERT INTO `fa_admin_log` VALUES (773, 1, 'admin', '/admin/plan/plan/notice/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"noticeids\":\"1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570181088);
INSERT INTO `fa_admin_log` VALUES (774, 1, 'admin', '/admin/plan/plan/notice/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"noticeids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570181096);
INSERT INTO `fa_admin_log` VALUES (775, 1, 'admin', '/admin/plan/plan/article/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"articleids\":\"2\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570182446);
INSERT INTO `fa_admin_log` VALUES (776, 1, 'admin', '/admin/plan/plan/article/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"articleids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570182451);
INSERT INTO `fa_admin_log` VALUES (777, 1, 'admin', '/admin/article/article/add?dialog=1', '文章管理 文章类目 添加', '{\"dialog\":\"1\",\"row\":{\"name\":\"\\u963f\\u91cc\\u5df4\\u5df4\",\"num\":\"90\",\"sort\":\"2\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570182543);
INSERT INTO `fa_admin_log` VALUES (778, 1, 'admin', '/admin/plan/plan/article/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"articleids\":\"2\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570182782);
INSERT INTO `fa_admin_log` VALUES (779, 1, 'admin', '/admin/plan/plan/article/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"articleids\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570182788);
INSERT INTO `fa_admin_log` VALUES (780, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"5\"},\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570360964);
INSERT INTO `fa_admin_log` VALUES (781, 1, 'admin', '/admin/plan/plan/company/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"companyids\":\"5,4\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570361593);
INSERT INTO `fa_admin_log` VALUES (782, 1, 'admin', '/admin/plan/plan/video/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"videoids\":\"1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570361723);
INSERT INTO `fa_admin_log` VALUES (783, 1, 'admin', '/admin/plan/plan/notice/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"noticeids\":\"0,1\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570361943);
INSERT INTO `fa_admin_log` VALUES (784, 1, 'admin', '/admin/plan/plan/article/ids/2?dialog=1', '', '{\"dialog\":\"1\",\"row\":{\"articleids\":\"2\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\",\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570362065);
INSERT INTO `fa_admin_log` VALUES (785, 1, 'admin', '/admin/auth/rule/add?dialog=1', '权限管理 菜单规则 添加', '{\"dialog\":\"1\",\"__token__\":\"fde2968d42b62e39456e7628be170bfe\",\"row\":{\"ismenu\":\"1\",\"pid\":\"163\",\"name\":\"company_plan\",\"title\":\"\\u516c\\u53f8\\u5b66\\u4e60\\u8ba1\\u5212\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"}}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570363917);
INSERT INTO `fa_admin_log` VALUES (786, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570363919);
INSERT INTO `fa_admin_log` VALUES (787, 1, 'admin', '/admin/auth/rule/edit/ids/170?dialog=1', '权限管理 菜单规则 编辑', '{\"dialog\":\"1\",\"__token__\":\"e6d8fbbcc3f69d4cd03ef59fb23093a9\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"company_plan\",\"title\":\"\\u516c\\u53f8\\u5b66\\u4e60\\u8ba1\\u5212\",\"icon\":\"fa fa-circle-o\",\"weigh\":\"0\",\"condition\":\"\",\"remark\":\"\",\"status\":\"normal\"},\"ids\":\"170\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570363940);
INSERT INTO `fa_admin_log` VALUES (788, 1, 'admin', '/admin/index/index', '', '{\"action\":\"refreshmenu\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570363941);
INSERT INTO `fa_admin_log` VALUES (789, 1, 'admin', '/admin/auth/group/roletree', '', '{\"pid\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570421030);
INSERT INTO `fa_admin_log` VALUES (790, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>hh<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570442456);
INSERT INTO `fa_admin_log` VALUES (791, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>hh<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570442634);
INSERT INTO `fa_admin_log` VALUES (792, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>hh<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570442703);
INSERT INTO `fa_admin_log` VALUES (793, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>hh<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570442779);
INSERT INTO `fa_admin_log` VALUES (794, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>hh<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570443117);
INSERT INTO `fa_admin_log` VALUES (795, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>\\u60a8\\u8fd8\\u5269\\u4e00\\u4e2a\\u89c6\\u9891\\u4efb\\u52a1\\u672a\\u5b8c\\u6210\\uff0c\\u8bf7\\u4e8e9\\u670815\\u65e5\\u4e4b\\u524d\\u5b8c\\u6210\\u3002<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570443911);
INSERT INTO `fa_admin_log` VALUES (796, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>\\u60a8\\u8fd8\\u5269\\u4e00\\u4e2a\\u89c6\\u9891\\u4efb\\u52a1\\u672a\\u5b8c\\u6210\\uff0c\\u8bf7\\u4e8e9\\u670815\\u65e5\\u4e4b\\u524d\\u5b8c\\u6210\\u3002<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570444325);
INSERT INTO `fa_admin_log` VALUES (797, 1, 'admin', '/admin/message/del/ids/2', '消息管理 删除', '{\"action\":\"del\",\"ids\":\"2\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570444436);
INSERT INTO `fa_admin_log` VALUES (798, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>kk<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570444454);
INSERT INTO `fa_admin_log` VALUES (799, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>kk<\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570445518);
INSERT INTO `fa_admin_log` VALUES (800, 1, 'admin', '/admin/message/del/ids/5,4,3', '消息管理 删除', '{\"action\":\"del\",\"ids\":\"5,4,3\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570445524);
INSERT INTO `fa_admin_log` VALUES (801, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"<p>\\u60a8\\u8fd8\\u5269\\u4e00\\u4e2a\\u89c6\\u9891\\u4efb\\u52a1\\u672a\\u5b8c\\u6210\\uff0c\\u8bf7\\u4e8e9\\u670815\\u65e5\\u4e4b\\u524d\\u5b8c\\u6210\\u3002<br><\\/p>\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570445540);
INSERT INTO `fa_admin_log` VALUES (802, 1, 'admin', '/admin/message/del/ids/7,6', '消息管理 删除', '{\"action\":\"del\",\"ids\":\"7,6\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570445589);
INSERT INTO `fa_admin_log` VALUES (803, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"0\",\"companyids\":\"5,4\",\"content\":\"\\u60a8\\u8fd8\\u5269\\u4e00\\u4e2a\\u89c6\\u9891\\u4efb\\u52a1\\u672a\\u5b8c\\u6210\\uff0c\\u8bf7\\u4e8e9\\u670815\\u65e5\\u4e4b\\u524d\\u5b8c\\u6210\\u3002\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570445600);
INSERT INTO `fa_admin_log` VALUES (804, 1, 'admin', '/admin/message/add?dialog=1', '消息管理 添加', '{\"dialog\":\"1\",\"row\":{\"objectdata\":\"1\",\"companyids\":\"\",\"driverids\":\"2,1\",\"content\":\"\\u8d76\\u7d27\\u5b66\\u4e60\\u6559\\u7a0b\\u5b8c\\u6210\\u9a7e\\u6821\\u8003\\u8bd5\\uff01\"},\"btSelectAll\":\"on\",\"btSelectItem\":\"on\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570447013);
INSERT INTO `fa_admin_log` VALUES (805, 1, 'admin', '/admin/message/del/ids/11', '消息管理 删除', '{\"action\":\"del\",\"ids\":\"11\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570447671);
INSERT INTO `fa_admin_log` VALUES (806, 1, 'admin', '/admin/company/del/ids/5', '公司管理 删除', '{\"action\":\"del\",\"ids\":\"5\",\"params\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570521722);
INSERT INTO `fa_admin_log` VALUES (807, 1, 'admin', '/admin/general/config/emailtest', '', '{\"__token__\":\"60cfad5651bd8a1ca9a74cb3ae298bbe\",\"row\":{\"mail_type\":\"1\",\"mail_smtp_host\":\"smtp.qq.com\",\"mail_smtp_port\":\"465\",\"mail_smtp_user\":\"10000\",\"mail_smtp_pass\":\"password\",\"mail_verify_type\":\"2\",\"mail_from\":\"10000@qq.com\"},\"receiver\":\"893191249@qq.com\"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36', 1570708512);
COMMIT;

-- ----------------------------
-- Table structure for fa_article
-- ----------------------------
DROP TABLE IF EXISTS `fa_article`;
CREATE TABLE `fa_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `sort` int(255) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章类目表';

-- ----------------------------
-- Records of fa_article
-- ----------------------------
BEGIN;
INSERT INTO `fa_article` VALUES (1, '中文', 10, 1);
INSERT INTO `fa_article` VALUES (2, '阿里巴巴', 90, 2);
COMMIT;

-- ----------------------------
-- Table structure for fa_article_detail
-- ----------------------------
DROP TABLE IF EXISTS `fa_article_detail`;
CREATE TABLE `fa_article_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `article_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `content` text COMMENT '正文',
  `ptime` datetime DEFAULT NULL COMMENT '发布时间',
  `views` varchar(255) DEFAULT '0' COMMENT '浏览量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of fa_article_detail
-- ----------------------------
BEGIN;
INSERT INTO `fa_article_detail` VALUES (2, 1, '2019驾校考试科目四', '/uploads/20190927/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '<p><img src=\"/assets/img/qrcode.png\" style=\"width: 50px;\"><br></p>', '2019-09-30 18:48:24', '0');
COMMIT;

-- ----------------------------
-- Table structure for fa_article_question
-- ----------------------------
DROP TABLE IF EXISTS `fa_article_question`;
CREATE TABLE `fa_article_question` (
  `articledetail_id` int(11) DEFAULT NULL,
  `questiondetail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_article_question
-- ----------------------------
BEGIN;
INSERT INTO `fa_article_question` VALUES (2, 12);
INSERT INTO `fa_article_question` VALUES (2, 15);
COMMIT;

-- ----------------------------
-- Table structure for fa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `fa_attachment`;
CREATE TABLE `fa_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='附件表';

-- ----------------------------
-- Records of fa_attachment
-- ----------------------------
BEGIN;
INSERT INTO `fa_attachment` VALUES (1, 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `fa_attachment` VALUES (3, 1, 0, '/uploads/20190927/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '658', '987', 'jpeg', 0, 47594, 'image/jpeg', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', 1569591852, 1569591852, 1569591852, 'local', '6d0b3f8d9123ed8d0552cb74cb451136999477d4');
INSERT INTO `fa_attachment` VALUES (4, 1, 0, '/uploads/20190930/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '658', '987', 'jpeg', 0, 47594, 'image/jpeg', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', 1569839168, 1569839168, 1569839168, 'local', '6d0b3f8d9123ed8d0552cb74cb451136999477d4');
INSERT INTO `fa_attachment` VALUES (5, 1, 0, '/uploads/20191003/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '658', '987', 'jpeg', 0, 47594, 'image/jpeg', '{\"name\":\"828e72e2855b51a005732f4e007c58c92417a61e1bcb1-61VzNc_fw658.jpeg\"}', 1570102972, 1570102972, 1570102972, 'local', '6d0b3f8d9123ed8d0552cb74cb451136999477d4');
INSERT INTO `fa_attachment` VALUES (6, 0, 0, '/uploads/20191008/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '658', '987', 'jpeg', 0, 47594, 'image/jpeg', '', 1570530884, 1570530884, 1570530884, 'local', '6d0b3f8d9123ed8d0552cb74cb451136999477d4');
COMMIT;

-- ----------------------------
-- Table structure for fa_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group`;
CREATE TABLE `fa_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分组表';

-- ----------------------------
-- Records of fa_auth_group
-- ----------------------------
BEGIN;
INSERT INTO `fa_auth_group` VALUES (1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal');
INSERT INTO `fa_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal');
INSERT INTO `fa_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal');
INSERT INTO `fa_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal');
INSERT INTO `fa_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_group_access`;
CREATE TABLE `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限分组表';

-- ----------------------------
-- Records of fa_auth_group_access
-- ----------------------------
BEGIN;
INSERT INTO `fa_auth_group_access` VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for fa_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_auth_rule`;
CREATE TABLE `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`),
  KEY `weigh` (`weigh`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of fa_auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `fa_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `fa_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `fa_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', 'Category tips', 0, 1497429920, 1569840970, 119, 'normal');
INSERT INTO `fa_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal');
INSERT INTO `fa_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `fa_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `fa_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `fa_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal');
INSERT INTO `fa_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal');
INSERT INTO `fa_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal');
INSERT INTO `fa_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `fa_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `fa_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `fa_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `fa_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `fa_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `fa_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `fa_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `fa_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `fa_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `fa_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `fa_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', 'Attachment tips', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `fa_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `fa_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `fa_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `fa_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `fa_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `fa_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `fa_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `fa_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `fa_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `fa_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `fa_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `fa_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', 'Category tips', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `fa_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `fa_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `fa_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `fa_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal');
INSERT INTO `fa_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', 'Admin tips', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `fa_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `fa_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `fa_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `fa_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', 'Admin log tips', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `fa_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `fa_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `fa_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', 'Group tips', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `fa_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `fa_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `fa_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `fa_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', 'Rule tips', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `fa_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `fa_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `fa_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `fa_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', 'Addon tips', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-list', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', 1, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1516374729, 1516374729, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (85, 'file', 0, 'company', '公司管理', 'fa fa-apple', '', '', 1, 1569590146, 1569754657, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (86, 'file', 85, 'company/index', '查看', 'fa fa-circle-o', '', '', 0, 1569590146, 1569590146, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (87, 'file', 85, 'company/add', '添加', 'fa fa-circle-o', '', '', 0, 1569590146, 1569590146, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (88, 'file', 85, 'company/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569590146, 1569590146, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (89, 'file', 85, 'company/del', '删除', 'fa fa-circle-o', '', '', 0, 1569590146, 1569590146, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (90, 'file', 85, 'company/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569590146, 1569590146, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (110, 'file', 0, 'video', '视频管理', 'fa fa-list', '', '', 1, 1569755267, 1569755290, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (111, 'file', 110, 'video/video', '视频类目', 'fa fa-camera', '', '', 1, 1569755267, 1569756011, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (112, 'file', 111, 'video/video/index', '查看', 'fa fa-circle-o', '', '', 0, 1569755267, 1569755267, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (113, 'file', 111, 'video/video/add', '添加', 'fa fa-circle-o', '', '', 0, 1569755267, 1569755267, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (114, 'file', 111, 'video/video/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569755267, 1569755267, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (115, 'file', 111, 'video/video/del', '删除', 'fa fa-circle-o', '', '', 0, 1569755267, 1569755267, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (116, 'file', 111, 'video/video/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569755267, 1569755267, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (117, 'file', 110, 'video/video_detail', '视频管理', 'fa fa-camera-retro', '', '', 1, 1569755717, 1569756019, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (118, 'file', 117, 'video/video_detail/index', '查看', 'fa fa-circle-o', '', '', 0, 1569755717, 1569755717, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (119, 'file', 117, 'video/video_detail/add', '添加', 'fa fa-circle-o', '', '', 0, 1569755717, 1569755717, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (120, 'file', 117, 'video/video_detail/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569755717, 1569755717, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (121, 'file', 117, 'video/video_detail/del', '删除', 'fa fa-circle-o', '', '', 0, 1569755717, 1569755717, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (122, 'file', 117, 'video/video_detail/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569755718, 1569755718, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (123, 'file', 0, 'question', '考题管理', 'fa fa-list', '', '', 1, 1569758718, 1569758755, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (124, 'file', 123, 'question/question', '考题类目', 'fa fa-calendar', '', '', 1, 1569758719, 1569758776, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (125, 'file', 124, 'question/question/index', '查看', 'fa fa-circle-o', '', '', 0, 1569758719, 1569758719, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (126, 'file', 124, 'question/question/add', '添加', 'fa fa-circle-o', '', '', 0, 1569758719, 1569758719, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (127, 'file', 124, 'question/question/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569758719, 1569758719, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (128, 'file', 124, 'question/question/del', '删除', 'fa fa-circle-o', '', '', 0, 1569758719, 1569758719, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (129, 'file', 124, 'question/question/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569758719, 1569758719, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (130, 'file', 123, 'question/question_detail', '考题管理', 'fa fa-adjust', '', '', 1, 1569760354, 1569769777, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (131, 'file', 130, 'question/question_detail/index', '查看', 'fa fa-circle-o', '', '', 0, 1569760354, 1569760354, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (132, 'file', 130, 'question/question_detail/add', '添加', 'fa fa-circle-o', '', '', 0, 1569760354, 1569760354, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (133, 'file', 130, 'question/question_detail/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569760354, 1569760354, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (134, 'file', 130, 'question/question_detail/del', '删除', 'fa fa-circle-o', '', '', 0, 1569760354, 1569760354, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (135, 'file', 130, 'question/question_detail/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569760354, 1569760354, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (136, 'file', 0, 'examination', '试卷管理', 'fa fa-list', '', '', 1, 1569809951, 1569810003, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (137, 'file', 136, 'examination/examination', '试卷管理', 'fa fa-sticky-note-o', '', '', 1, 1569809952, 1569810041, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (138, 'file', 137, 'examination/examination/index', '查看', 'fa fa-circle-o', '', '', 0, 1569809952, 1569809952, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (139, 'file', 137, 'examination/examination/add', '添加', 'fa fa-circle-o', '', '', 0, 1569809952, 1569809952, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (140, 'file', 137, 'examination/examination/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569809952, 1569809952, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (141, 'file', 137, 'examination/examination/del', '删除', 'fa fa-circle-o', '', '', 0, 1569809952, 1569809952, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (142, 'file', 137, 'examination/examination/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569809952, 1569809952, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (143, 'file', 0, 'article', '文章管理', 'fa fa-building', '', '', 1, 1569834140, 1569936165, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (144, 'file', 143, 'article/article', '文章类目', 'fa fa-circle-o', '', '', 1, 1569834140, 1569834300, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (145, 'file', 144, 'article/article/index', '查看', 'fa fa-circle-o', '', '', 0, 1569834140, 1569834140, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (146, 'file', 144, 'article/article/add', '添加', 'fa fa-circle-o', '', '', 0, 1569834140, 1569834140, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (147, 'file', 144, 'article/article/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569834140, 1569834140, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (148, 'file', 144, 'article/article/del', '删除', 'fa fa-circle-o', '', '', 0, 1569834140, 1569834140, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (149, 'file', 144, 'article/article/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569834140, 1569834140, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (150, 'file', 143, 'article/article_detail', '文章管理', 'fa fa-circle-o', '', '', 1, 1569834702, 1569834702, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (151, 'file', 150, 'article/article_detail/index', '查看', 'fa fa-circle-o', '', '', 0, 1569834702, 1569834702, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (152, 'file', 150, 'article/article_detail/add', '添加', 'fa fa-circle-o', '', '', 0, 1569834702, 1569834702, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (153, 'file', 150, 'article/article_detail/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1569834702, 1569834702, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (154, 'file', 150, 'article/article_detail/del', '删除', 'fa fa-circle-o', '', '', 0, 1569834702, 1569834702, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (155, 'file', 150, 'article/article_detail/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1569834702, 1569834702, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (156, 'file', 0, 'notice', '公告管理', 'fa fa-list', '', '', 1, 1570102308, 1570102722, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (157, 'file', 156, 'notice/notice', '公告管理', 'fa fa-building', '', '', 1, 1570102308, 1570102746, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (158, 'file', 157, 'notice/notice/index', '查看', 'fa fa-circle-o', '', '', 0, 1570102308, 1570102686, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (159, 'file', 157, 'notice/notice/add', '添加', 'fa fa-circle-o', '', '', 0, 1570102308, 1570102686, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (160, 'file', 157, 'notice/notice/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1570102308, 1570102686, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (161, 'file', 157, 'notice/notice/del', '删除', 'fa fa-circle-o', '', '', 0, 1570102308, 1570102686, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (162, 'file', 157, 'notice/notice/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1570102308, 1570102686, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (163, 'file', 0, 'plan', '平台学习管理', 'fa fa-list', '', '', 1, 1570104674, 1570105392, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (164, 'file', 163, 'plan/plan', '平台学习计划管理', 'fa fa-first-order', '', '', 1, 1570104674, 1570107163, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (165, 'file', 164, 'plan/plan/index', '查看', 'fa fa-circle-o', '', '', 0, 1570104674, 1570104674, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (166, 'file', 164, 'plan/plan/add', '添加', 'fa fa-circle-o', '', '', 0, 1570104674, 1570104674, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (167, 'file', 164, 'plan/plan/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1570104674, 1570104674, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (168, 'file', 164, 'plan/plan/del', '删除', 'fa fa-circle-o', '', '', 0, 1570104674, 1570104674, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (169, 'file', 164, 'plan/plan/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1570104674, 1570104674, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (170, 'file', 0, 'company_plan', '公司学习计划', 'fa fa-circle-o', '', '', 1, 1570363917, 1570363940, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (171, 'file', 0, 'message', '消息管理', 'fa fa-circle-o', '', '', 1, 1570365280, 1570365280, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (172, 'file', 171, 'message/index', '查看', 'fa fa-circle-o', '', '', 0, 1570365280, 1570365280, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (173, 'file', 171, 'message/add', '添加', 'fa fa-circle-o', '', '', 0, 1570365280, 1570365280, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (174, 'file', 171, 'message/edit', '编辑', 'fa fa-circle-o', '', '', 0, 1570365280, 1570365280, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (175, 'file', 171, 'message/del', '删除', 'fa fa-circle-o', '', '', 0, 1570365280, 1570365280, 0, 'normal');
INSERT INTO `fa_auth_rule` VALUES (176, 'file', 171, 'message/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1570365280, 1570365280, 0, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_category
-- ----------------------------
DROP TABLE IF EXISTS `fa_category`;
CREATE TABLE `fa_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `weigh` (`weigh`,`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='分类表';

-- ----------------------------
-- Records of fa_category
-- ----------------------------
BEGIN;
INSERT INTO `fa_category` VALUES (2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal');
INSERT INTO `fa_category` VALUES (3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal');
INSERT INTO `fa_category` VALUES (4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal');
INSERT INTO `fa_category` VALUES (5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal');
INSERT INTO `fa_category` VALUES (6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal');
INSERT INTO `fa_category` VALUES (7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal');
INSERT INTO `fa_category` VALUES (8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal');
INSERT INTO `fa_category` VALUES (9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal');
INSERT INTO `fa_category` VALUES (10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal');
INSERT INTO `fa_category` VALUES (11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal');
INSERT INTO `fa_category` VALUES (12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal');
INSERT INTO `fa_category` VALUES (13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_company
-- ----------------------------
DROP TABLE IF EXISTS `fa_company`;
CREATE TABLE `fa_company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `logo` varchar(255) DEFAULT NULL COMMENT '公司LOGO',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `license` varchar(255) DEFAULT NULL COMMENT '营业执照',
  `contact` varchar(255) DEFAULT NULL COMMENT '联系人',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号码',
  `district` varchar(255) DEFAULT NULL COMMENT '省市区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='公司表';

-- ----------------------------
-- Records of fa_company
-- ----------------------------
BEGIN;
INSERT INTO `fa_company` VALUES (4, '阿里巴巴', '/uploads/20190927/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '瑶海公园', '/uploads/20190927/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '张三', '13295672345', '安徽省/合肥市/瑶海区');
COMMIT;

-- ----------------------------
-- Table structure for fa_config
-- ----------------------------
DROP TABLE IF EXISTS `fa_config`;
CREATE TABLE `fa_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='系统配置';

-- ----------------------------
-- Records of fa_config
-- ----------------------------
BEGIN;
INSERT INTO `fa_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', '');
INSERT INTO `fa_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果静态资源使用第三方云储存请配置该值', 'string', '', '', '', '');
INSERT INTO `fa_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', '');
INSERT INTO `fa_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', '');
INSERT INTO `fa_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '');
INSERT INTO `fa_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '');
INSERT INTO `fa_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', '');
INSERT INTO `fa_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '{\"default\":\"Default\",\"page\":\"Page\",\"article\":\"Article\",\"test\":\"Test\"}', '', '', '');
INSERT INTO `fa_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{\"basic\":\"Basic\",\"email\":\"Email\",\"dictionary\":\"Dictionary\",\"user\":\"User\",\"example\":\"Example\"}', '', '', '');
INSERT INTO `fa_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '[\"Please select\",\"SMTP\",\"Mail\"]', '', '');
INSERT INTO `fa_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', '');
INSERT INTO `fa_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', '');
INSERT INTO `fa_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', '');
INSERT INTO `fa_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', '');
INSERT INTO `fa_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '[\"None\",\"TLS\",\"SSL\"]', '', '');
INSERT INTO `fa_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');
COMMIT;

-- ----------------------------
-- Table structure for fa_driver
-- ----------------------------
DROP TABLE IF EXISTS `fa_driver`;
CREATE TABLE `fa_driver` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `idcard` varchar(255) DEFAULT NULL COMMENT '身份证号码',
  `nvq` varchar(255) DEFAULT NULL COMMENT '资格证号',
  `carnum` varchar(11) DEFAULT NULL COMMENT '车牌号',
  `phone` varchar(255) DEFAULT NULL COMMENT '手机号',
  `typedata` enum('0','1') DEFAULT '0' COMMENT '队长:0=否,1=是',
  `status` enum('0','1') DEFAULT '0' COMMENT '状态:0=在职,1=离职',
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='驾驶员表';

-- ----------------------------
-- Records of fa_driver
-- ----------------------------
BEGIN;
INSERT INTO `fa_driver` VALUES (3, '/uploads/20191008/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '陈道明', '342401199007189234', '12345678', '皖B8888', '18712398268', '0', '0', 4);
INSERT INTO `fa_driver` VALUES (4, '/uploads/20191008/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '张倩', '342401198906239765', '12345678', '粤B3838', '13295573487', '0', '0', 4);
COMMIT;

-- ----------------------------
-- Table structure for fa_ems
-- ----------------------------
DROP TABLE IF EXISTS `fa_ems`;
CREATE TABLE `fa_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='邮箱验证码表';

-- ----------------------------
-- Table structure for fa_examination
-- ----------------------------
DROP TABLE IF EXISTS `fa_examination`;
CREATE TABLE `fa_examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='试卷表';

-- ----------------------------
-- Records of fa_examination
-- ----------------------------
BEGIN;
INSERT INTO `fa_examination` VALUES (8, '2020驾校考试科目一试卷');
INSERT INTO `fa_examination` VALUES (9, '2019驾校考试科目一试卷');
COMMIT;

-- ----------------------------
-- Table structure for fa_fleet
-- ----------------------------
DROP TABLE IF EXISTS `fa_fleet`;
CREATE TABLE `fa_fleet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `company_id` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT '0' COMMENT '数量',
  `fleeter` varchar(255) DEFAULT NULL COMMENT '车队长',
  `driver_ids` varchar(255) DEFAULT NULL COMMENT '车队长ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='车队表';

-- ----------------------------
-- Records of fa_fleet
-- ----------------------------
BEGIN;
INSERT INTO `fa_fleet` VALUES (17, '第一车队', 4, 2, '陈道明', '3');
COMMIT;

-- ----------------------------
-- Table structure for fa_fleet_driver
-- ----------------------------
DROP TABLE IF EXISTS `fa_fleet_driver`;
CREATE TABLE `fa_fleet_driver` (
  `fleet_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_fleet_driver
-- ----------------------------
BEGIN;
INSERT INTO `fa_fleet_driver` VALUES (17, 3);
INSERT INTO `fa_fleet_driver` VALUES (17, 4);
COMMIT;

-- ----------------------------
-- Table structure for fa_message
-- ----------------------------
DROP TABLE IF EXISTS `fa_message`;
CREATE TABLE `fa_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '收件人',
  `content` text NOT NULL COMMENT '正文',
  `createtime` int(11) NOT NULL COMMENT '发送时间',
  `objectdata` enum('0','1') NOT NULL DEFAULT '0' COMMENT '对象:0=公司,1=驾驶员',
  `msgtable_id` int(11) DEFAULT NULL,
  `msgtable_type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='消息表';

-- ----------------------------
-- Records of fa_message
-- ----------------------------
BEGIN;
INSERT INTO `fa_message` VALUES (8, '阿里巴巴', '您还剩一个视频任务未完成，请于9月15日之前完成。', 1570445600, '0', 4, 'Company');
INSERT INTO `fa_message` VALUES (9, '学习视频', '您还剩一个视频任务未完成，请于9月15日之前完成。', 1570445600, '0', 5, 'Company');
INSERT INTO `fa_message` VALUES (10, '张三', '赶紧学习教程完成驾校考试！', 1570447013, '1', 1, 'Driver');
COMMIT;

-- ----------------------------
-- Table structure for fa_notice
-- ----------------------------
DROP TABLE IF EXISTS `fa_notice`;
CREATE TABLE `fa_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` text COMMENT '正文',
  `objecttype` enum('0','1') DEFAULT '0' COMMENT '对象',
  `ptime` datetime DEFAULT NULL COMMENT '发布时间',
  `views` varchar(255) DEFAULT NULL COMMENT '浏览量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公告表';

-- ----------------------------
-- Records of fa_notice
-- ----------------------------
BEGIN;
INSERT INTO `fa_notice` VALUES (1, '视频管理', '<p><img src=\"/uploads/20191003/6d88f0620a49c79f5d8e5dba134373e3.jpeg\" data-filename=\"filename\" style=\"width: 150px;\"><br></p>', '0', '2019-10-03 19:42:39', '');
COMMIT;

-- ----------------------------
-- Table structure for fa_plan
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan`;
CREATE TABLE `fa_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typedata` enum('0','1') DEFAULT '0' COMMENT '类型:0=日常培训,1=岗前培训',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `enddate` date DEFAULT NULL COMMENT '结束日期',
  `status` enum('0','1') DEFAULT '0' COMMENT '类型:0=平台,1=公司',
  `objectdata` enum('0','1','2') DEFAULT '0' COMMENT '对象:0=全体驾驶员,1=车队,2=驾驶员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='平台学习计划表';

-- ----------------------------
-- Records of fa_plan
-- ----------------------------
BEGIN;
INSERT INTO `fa_plan` VALUES (1, '1', '9月平台学习计划', '2019-10-03', '2019-10-03', '0', '0');
INSERT INTO `fa_plan` VALUES (2, '0', '10月平台学习计划', '2019-10-03', '2019-10-03', '0', '0');
INSERT INTO `fa_plan` VALUES (4, '0', '2019年驾校考试科目三', '2019-10-10', '2019-10-17', '1', '0');
COMMIT;

-- ----------------------------
-- Table structure for fa_plan_article
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan_article`;
CREATE TABLE `fa_plan_article` (
  `plan_id` int(11) DEFAULT NULL,
  `articledetail_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_plan_article
-- ----------------------------
BEGIN;
INSERT INTO `fa_plan_article` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for fa_plan_company
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan_company`;
CREATE TABLE `fa_plan_company` (
  `plan_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('0','1') DEFAULT '0' COMMENT '状态:0=未采纳,1=已采纳',
  `typedata` enum('0','1') DEFAULT '0' COMMENT '类型:0=平台,1=公司',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_plan_company
-- ----------------------------
BEGIN;
INSERT INTO `fa_plan_company` VALUES (2, 5, 3, '0', '0');
INSERT INTO `fa_plan_company` VALUES (2, 4, 4, '0', '0');
INSERT INTO `fa_plan_company` VALUES (4, 4, 6, '0', '1');
COMMIT;

-- ----------------------------
-- Table structure for fa_plan_driver
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan_driver`;
CREATE TABLE `fa_plan_driver` (
  `cplan_id` int(11) DEFAULT NULL,
  `driver_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fa_plan_examination
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan_examination`;
CREATE TABLE `fa_plan_examination` (
  `plan_id` int(11) DEFAULT NULL,
  `examination_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_plan_examination
-- ----------------------------
BEGIN;
INSERT INTO `fa_plan_examination` VALUES (2, 0);
INSERT INTO `fa_plan_examination` VALUES (2, 9);
COMMIT;

-- ----------------------------
-- Table structure for fa_plan_fleet
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan_fleet`;
CREATE TABLE `fa_plan_fleet` (
  `cplan_id` int(11) DEFAULT NULL,
  `fleet_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fa_plan_notice
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan_notice`;
CREATE TABLE `fa_plan_notice` (
  `plan_id` int(11) DEFAULT NULL,
  `notice_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_plan_notice
-- ----------------------------
BEGIN;
INSERT INTO `fa_plan_notice` VALUES (2, 0);
INSERT INTO `fa_plan_notice` VALUES (2, 1);
COMMIT;

-- ----------------------------
-- Table structure for fa_plan_video
-- ----------------------------
DROP TABLE IF EXISTS `fa_plan_video`;
CREATE TABLE `fa_plan_video` (
  `plan_id` int(11) DEFAULT NULL,
  `videodetail_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_plan_video
-- ----------------------------
BEGIN;
INSERT INTO `fa_plan_video` VALUES (2, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for fa_question
-- ----------------------------
DROP TABLE IF EXISTS `fa_question`;
CREATE TABLE `fa_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='考题类目表';

-- ----------------------------
-- Records of fa_question
-- ----------------------------
BEGIN;
INSERT INTO `fa_question` VALUES (1, '中文', 10);
INSERT INTO `fa_question` VALUES (2, '阿里巴巴', 20);
COMMIT;

-- ----------------------------
-- Table structure for fa_question_detail
-- ----------------------------
DROP TABLE IF EXISTS `fa_question_detail`;
CREATE TABLE `fa_question_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `typedata` enum('0','1') DEFAULT '0' COMMENT '类型',
  `title` varchar(255) DEFAULT NULL,
  `answerdata` set('A','B','C','D') DEFAULT NULL COMMENT '答案',
  `optiona` varchar(255) DEFAULT NULL COMMENT 'A',
  `optionb` varchar(255) DEFAULT NULL COMMENT 'B',
  `optionc` varchar(255) DEFAULT NULL COMMENT 'C',
  `optiond` varchar(255) DEFAULT NULL COMMENT 'D',
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='考题表';

-- ----------------------------
-- Records of fa_question_detail
-- ----------------------------
BEGIN;
INSERT INTO `fa_question_detail` VALUES (11, '0', '驾驶机动车在道路上违反道路交通安全法的行为，属于什么行为？', 'A', '违章行为', '过失行为', '违规行为', '违法行为', 1);
INSERT INTO `fa_question_detail` VALUES (12, '0', '路口最前端的双白实线是什么含义？', 'A', '等候放行线', '停车让行线', '减速让行线', '左弯待转线', 1);
INSERT INTO `fa_question_detail` VALUES (13, '0', '视频管理', 'B', '1', '2', '3', '4', 1);
INSERT INTO `fa_question_detail` VALUES (14, '0', '文章类目', 'B', '1', '2', '3', '4', 2);
INSERT INTO `fa_question_detail` VALUES (15, '1', '试卷管理', 'B,D', '1', '2', '3', '4', 2);
COMMIT;

-- ----------------------------
-- Table structure for fa_question_examination
-- ----------------------------
DROP TABLE IF EXISTS `fa_question_examination`;
CREATE TABLE `fa_question_examination` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examination_id` int(11) DEFAULT NULL,
  `questiondetail_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fa_question_examination
-- ----------------------------
BEGIN;
INSERT INTO `fa_question_examination` VALUES (55, 9, 11);
INSERT INTO `fa_question_examination` VALUES (56, 9, 14);
INSERT INTO `fa_question_examination` VALUES (57, 9, 12);
INSERT INTO `fa_question_examination` VALUES (58, 9, 15);
INSERT INTO `fa_question_examination` VALUES (59, 8, 0);
INSERT INTO `fa_question_examination` VALUES (60, 8, 11);
INSERT INTO `fa_question_examination` VALUES (61, 8, 12);
COMMIT;

-- ----------------------------
-- Table structure for fa_sms
-- ----------------------------
DROP TABLE IF EXISTS `fa_sms`;
CREATE TABLE `fa_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) NOT NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) NOT NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='短信验证码表';

-- ----------------------------
-- Table structure for fa_user
-- ----------------------------
DROP TABLE IF EXISTS `fa_user`;
CREATE TABLE `fa_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_id` int(10) unsigned DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `level` tinyint(1) unsigned DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '余额',
  `score` int(10) unsigned DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) NOT NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) NOT NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) NOT NULL DEFAULT '' COMMENT '验证',
  `company_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `mobile` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员表';

-- ----------------------------
-- Records of fa_user
-- ----------------------------
BEGIN;
INSERT INTO `fa_user` VALUES (5, 0, '', '', 'de96469cb885e2e1a9ada8a4c9fad79b', '9iexcA', '893191249@qq.com', '', '', 0, 0, NULL, '', 0.00, 0, 1, 1, 1570524045, 1570524046, '127.0.0.1', 0, '', NULL, NULL, 1570524046, '', 'normal', '', 4);
COMMIT;

-- ----------------------------
-- Table structure for fa_user_group
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_group`;
CREATE TABLE `fa_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员组表';

-- ----------------------------
-- Records of fa_user_group
-- ----------------------------
BEGIN;
INSERT INTO `fa_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1515386468, 1516168298, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_money_log`;
CREATE TABLE `fa_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员余额变动表';

-- ----------------------------
-- Table structure for fa_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_rule`;
CREATE TABLE `fa_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员规则表';

-- ----------------------------
-- Records of fa_user_rule
-- ----------------------------
BEGIN;
INSERT INTO `fa_user_rule` VALUES (1, 0, 'index', '前台', '', 1, 1516168079, 1516168079, 1, 'normal');
INSERT INTO `fa_user_rule` VALUES (2, 0, 'api', 'API接口', '', 1, 1516168062, 1516168062, 2, 'normal');
INSERT INTO `fa_user_rule` VALUES (3, 1, 'user', '会员模块', '', 1, 1515386221, 1516168103, 12, 'normal');
INSERT INTO `fa_user_rule` VALUES (4, 2, 'user', '会员模块', '', 1, 1515386221, 1516168092, 11, 'normal');
INSERT INTO `fa_user_rule` VALUES (5, 3, 'index/user/login', '登录', '', 0, 1515386247, 1515386247, 5, 'normal');
INSERT INTO `fa_user_rule` VALUES (6, 3, 'index/user/register', '注册', '', 0, 1515386262, 1516015236, 7, 'normal');
INSERT INTO `fa_user_rule` VALUES (7, 3, 'index/user/index', '会员中心', '', 0, 1516015012, 1516015012, 9, 'normal');
INSERT INTO `fa_user_rule` VALUES (8, 3, 'index/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 4, 'normal');
INSERT INTO `fa_user_rule` VALUES (9, 4, 'api/user/login', '登录', '', 0, 1515386247, 1515386247, 6, 'normal');
INSERT INTO `fa_user_rule` VALUES (10, 4, 'api/user/register', '注册', '', 0, 1515386262, 1516015236, 8, 'normal');
INSERT INTO `fa_user_rule` VALUES (11, 4, 'api/user/index', '会员中心', '', 0, 1516015012, 1516015012, 10, 'normal');
INSERT INTO `fa_user_rule` VALUES (12, 4, 'api/user/profile', '个人资料', '', 0, 1516015012, 1516015012, 3, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_score_log`;
CREATE TABLE `fa_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员积分变动表';

-- ----------------------------
-- Table structure for fa_user_token
-- ----------------------------
DROP TABLE IF EXISTS `fa_user_token`;
CREATE TABLE `fa_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='会员Token表';

-- ----------------------------
-- Records of fa_user_token
-- ----------------------------
BEGIN;
INSERT INTO `fa_user_token` VALUES ('12b75eae5ebe440421b21ce4a3c8a29747bf0e5b', 5, 1570521987, 1573113987);
INSERT INTO `fa_user_token` VALUES ('15343a1512ac056ccc68125a894f54ee93ef0cce', 5, 1570501579, 1573093579);
INSERT INTO `fa_user_token` VALUES ('1726328a4f717ff0db3fa7a4eef747e2cf1cf0d7', 5, 1570523495, 1573115495);
INSERT INTO `fa_user_token` VALUES ('1df95c3d047ebb9212d2b9e04bd90fdf2f12ba08', 5, 1570524045, 1573116045);
INSERT INTO `fa_user_token` VALUES ('2ccb2c1a9a0babf83c9e671cbd4c425f15005790', 5, 1570523272, 1573115272);
INSERT INTO `fa_user_token` VALUES ('2e4e60cdd904da47b150a4644a6d8c66cd286aec', 5, 1570524046, 1573116046);
INSERT INTO `fa_user_token` VALUES ('3a62a654eceadf4ec14897e882511fc9ec70aff8', 5, 1570521989, 1573113989);
INSERT INTO `fa_user_token` VALUES ('3b60d4afa295fd20399119bd6792433d9ca31dcf', 5, 1570501421, 1573093421);
INSERT INTO `fa_user_token` VALUES ('4e7d024ca13e1bd5607b1b1a78108eeb730b7d16', 5, 1570523201, 1573115201);
INSERT INTO `fa_user_token` VALUES ('4eb4dafc6fc51cfcc0f80c0574dc327fb74bb16e', 5, 1570524034, 1573116034);
INSERT INTO `fa_user_token` VALUES ('55fb8f4a7ee3cac3b2a2b7f51d5bafcd89a90fe0', 5, 1570523325, 1573115325);
INSERT INTO `fa_user_token` VALUES ('5b69492a3d734f30ca360ee204b82382aaedb1f8', 5, 1570523454, 1573115454);
INSERT INTO `fa_user_token` VALUES ('7556a07a8f441047fa7a021cf4bfe76ae4747b74', 5, 1570501507, 1573093507);
INSERT INTO `fa_user_token` VALUES ('85817e547fd8f663d3617079dda4e1658e5de343', 5, 1570523271, 1573115271);
INSERT INTO `fa_user_token` VALUES ('95af98dcfe61270f0babfada44a1a46999c0941a', 5, 1570523377, 1573115377);
INSERT INTO `fa_user_token` VALUES ('98c3d13fbf31dfae8f373233ed5da609f613da4e', 5, 1570521987, 1573113987);
INSERT INTO `fa_user_token` VALUES ('aaebfbd15f678425dcfffca09b4836d433debf09', 5, 1570521988, 1573113988);
INSERT INTO `fa_user_token` VALUES ('cb7488dfb0617fee88d8b96c14df0c54c9015b0c', 5, 1570521984, 1573113984);
INSERT INTO `fa_user_token` VALUES ('cca3645918c2b3e3c9a3e691031befe80c1430e2', 5, 1570521986, 1573113986);
INSERT INTO `fa_user_token` VALUES ('cd842d4a8048bb4d9efa26c2407e75222fcbb5bf', 5, 1570523270, 1573115270);
INSERT INTO `fa_user_token` VALUES ('d3b0b7250f066793582aaec0b96edcb487c90177', 5, 1570524025, 1573116025);
INSERT INTO `fa_user_token` VALUES ('d9c081cb47efdd9a52170ed96e83948780d697be', 5, 1570501699, 1573093699);
INSERT INTO `fa_user_token` VALUES ('e490158f35bed876b23dbb6c582e0b98c5763326', 5, 1570523558, 1573115558);
INSERT INTO `fa_user_token` VALUES ('e547a482313008d03aac907ce54edcfaea76c9e1', 5, 1570521988, 1573113988);
INSERT INTO `fa_user_token` VALUES ('ea4218aec040f3ebd4adcc5e93b6e072cab267e5', 5, 1570524034, 1573116034);
INSERT INTO `fa_user_token` VALUES ('f8987b63ce266e93458cfe26063aa8131584b3a1', 5, 1570523225, 1573115225);
INSERT INTO `fa_user_token` VALUES ('fff6188832e782dc2fc90b636d3b53e494919886', 5, 1570523097, 1573115097);
COMMIT;

-- ----------------------------
-- Table structure for fa_version
-- ----------------------------
DROP TABLE IF EXISTS `fa_version`;
CREATE TABLE `fa_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) NOT NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) NOT NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) NOT NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) NOT NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) NOT NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='版本表';

-- ----------------------------
-- Records of fa_version
-- ----------------------------
BEGIN;
INSERT INTO `fa_version` VALUES (1, '1.1.1,2', '1.2.1', '20M', '更新内容', 'https://www.fastadmin.net/download.html', 1, 1520425318, 0, 0, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_video
-- ----------------------------
DROP TABLE IF EXISTS `fa_video`;
CREATE TABLE `fa_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='视频类目表';

-- ----------------------------
-- Records of fa_video
-- ----------------------------
BEGIN;
INSERT INTO `fa_video` VALUES (1, '学习视频', 10);
INSERT INTO `fa_video` VALUES (2, '阿里巴巴', 20);
COMMIT;

-- ----------------------------
-- Table structure for fa_video_detail
-- ----------------------------
DROP TABLE IF EXISTS `fa_video_detail`;
CREATE TABLE `fa_video_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `cover` varchar(255) DEFAULT NULL COMMENT '封面',
  `introduce` varchar(255) DEFAULT NULL COMMENT '介绍',
  `vtime` time DEFAULT NULL COMMENT '时长',
  `video_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='视频表';

-- ----------------------------
-- Records of fa_video_detail
-- ----------------------------
BEGIN;
INSERT INTO `fa_video_detail` VALUES (1, 'H5视频', 'url', '/uploads/20190927/6d88f0620a49c79f5d8e5dba134373e3.jpeg', '介绍', '03:26:51', 2);
COMMIT;

-- ----------------------------
-- Table structure for fa_wxuser
-- ----------------------------
DROP TABLE IF EXISTS `fa_wxuser`;
CREATE TABLE `fa_wxuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL DEFAULT '' COMMENT '用户openid',
  `nickName` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `gender` tinyint(3) NOT NULL DEFAULT '1' COMMENT '性别',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `session_key` varchar(50) NOT NULL DEFAULT '',
  `avatarUrl` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `driver_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='小程序账户';

SET FOREIGN_KEY_CHECKS = 1;
