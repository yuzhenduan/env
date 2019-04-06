/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.137.4
 Source Server Type    : MySQL
 Source Server Version : 50560
 Source Host           : 192.168.137.4:3306
 Source Schema         : env

 Target Server Type    : MySQL
 Target Server Version : 50560
 File Encoding         : 65001

 Date: 06/04/2019 19:54:05
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for business
-- ----------------------------
DROP TABLE IF EXISTS `business`;
CREATE TABLE `business`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `en_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qa_leader` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `deploy_lock` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `sync_lock` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_en_name`(`en_name`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for business_project
-- ----------------------------
DROP TABLE IF EXISTS `business_project`;
CREATE TABLE `business_project`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_business_project`(`business_id`, `project_id`) USING BTREE,
  INDEX `fk_bp_project_id`(`project_id`) USING BTREE,
  CONSTRAINT `fk_bp_project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_bp_business_id` FOREIGN KEY (`business_id`) REFERENCES `business` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for db_instance
-- ----------------------------
DROP TABLE IF EXISTS `db_instance`;
CREATE TABLE `db_instance`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `host` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `port` smallint(5) UNSIGNED NOT NULL,
  `db_url` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `passwd` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `groupname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monitor` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `locked` tinyint(255) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_db_url`(`db_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for defaults
-- ----------------------------
DROP TABLE IF EXISTS `defaults`;
CREATE TABLE `defaults`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `dict_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `zone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `var_key`(`dict_key`, `zone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for drone
-- ----------------------------
DROP TABLE IF EXISTS `drone`;
CREATE TABLE `drone`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `env` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `business` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `short_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hostname` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `ipv4` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_d_ebi`(`env`, `business`, `ipv4`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for env
-- ----------------------------
DROP TABLE IF EXISTS `env`;
CREATE TABLE `env`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `UUID` char(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_deploy` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `lock_sync` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `in_use` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `set_nginx` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `owner` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `monitor` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `dingding_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `env_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for env_business_db
-- ----------------------------
DROP TABLE IF EXISTS `env_business_db`;
CREATE TABLE `env_business_db`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `env` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `db_url` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) UNSIGNED ZEROFILL NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_ebd`(`env`, `business`, `db_url`) USING BTREE,
  INDEX `fk_ebd_business`(`business`) USING BTREE,
  INDEX `fk_ebd_db_url`(`db_url`) USING BTREE,
  CONSTRAINT `fk_ebd_business` FOREIGN KEY (`business`) REFERENCES `business` (`en_name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ebd_db_url` FOREIGN KEY (`db_url`) REFERENCES `db_instance` (`db_url`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ebd_env` FOREIGN KEY (`env`) REFERENCES `env` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for env_business_host
-- ----------------------------
DROP TABLE IF EXISTS `env_business_host`;
CREATE TABLE `env_business_host`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `env` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(4) UNSIGNED ZEROFILL NOT NULL DEFAULT 0001,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_ebh`(`env`, `business`, `host`) USING BTREE,
  INDEX `fk_ebh_business`(`business`) USING BTREE,
  INDEX `fk_ebh_host`(`host`) USING BTREE,
  CONSTRAINT `fk_ebh_host` FOREIGN KEY (`host`) REFERENCES `hosts` (`host`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ebh_business` FOREIGN KEY (`business`) REFERENCES `business` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ebh_env` FOREIGN KEY (`env`) REFERENCES `env` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for env_var
-- ----------------------------
DROP TABLE IF EXISTS `env_var`;
CREATE TABLE `env_var`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `env` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dict_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_ev`(`env`, `dict_key`) USING BTREE COMMENT '环境名和key唯一',
  CONSTRAINT `fk_ev_env` FOREIGN KEY (`env`) REFERENCES `env` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for group_name
-- ----------------------------
DROP TABLE IF EXISTS `group_name`;
CREATE TABLE `group_name`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `business` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `leader` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `roles` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for hosts
-- ----------------------------
DROP TABLE IF EXISTS `hosts`;
CREATE TABLE `hosts`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `hostname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `host` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `type` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `set_nginx` tinyint(4) NOT NULL DEFAULT 1,
  `nginx_parent` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_host`(`host`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for op_type
-- ----------------------------
DROP TABLE IF EXISTS `op_type`;
CREATE TABLE `op_type`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `query` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有查看权限',
  `config` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有配置权限',
  `created` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有创建权限',
  `deleted` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有删除权限',
  `build` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有构建权限',
  `rebuild` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有rebuild权限',
  `cancel` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有取消权限',
  `sync` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有同步权限',
  `login` tinyint(3) UNSIGNED ZEROFILL NOT NULL COMMENT '是否具有登陆权限',
  `role` smallint(5) UNSIGNED ZEROFILL NOT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `business` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `owner` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `qa` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gitpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `domainname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `domainname_exp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mgt_port` smallint(5) UNSIGNED ZEROFILL NOT NULL,
  `listen_port` smallint(5) UNSIGNED ZEROFILL NOT NULL,
  `code_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开发语言',
  `deploy_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部署类型，后期依据类型选定入口',
  `level` smallint(5) UNSIGNED ZEROFILL NOT NULL COMMENT '1,2,4,8,16,32（依据组合值确定级别）',
  `type` smallint(6) UNSIGNED ZEROFILL NOT NULL COMMENT '服务类别（1，2，4，8，16...）组合类型',
  `status` tinyint(4) NOT NULL COMMENT '服务状态，在用和废弃',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `config_token` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_p`(`business`, `name`) USING BTREE,
  INDEX `fk_p_user`(`owner`) USING BTREE,
  INDEX `fk_p_qa`(`qa`) USING BTREE,
  CONSTRAINT `fk_p_user` FOREIGN KEY (`owner`) REFERENCES `user` (`real_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_p_qa` FOREIGN KEY (`qa`) REFERENCES `user` (`real_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_p_business` FOREIGN KEY (`business`) REFERENCES `business` (`en_name`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for project_var
-- ----------------------------
DROP TABLE IF EXISTS `project_var`;
CREATE TABLE `project_var`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `project_id` int(10) UNSIGNED NOT NULL,
  `dict_key` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_pv`(`project_id`, `dict_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `login_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `real_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电子邮箱',
  `token` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `roles` smallint(5) UNSIGNED DEFAULT NULL COMMENT '角色',
  `groupname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '归属小组',
  `type` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `overlap_business` tinyint(4) NOT NULL,
  `overlap_env` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uniqe_email`(`email`) USING BTREE,
  INDEX `real_name`(`real_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1021 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

