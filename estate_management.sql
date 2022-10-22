/*
 Navicat Premium Data Transfer

 Source Server         : estateM
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : estate_management

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 12/04/2021 17:09:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(100) NOT NULL,
  `TRIGGER_GROUP` varchar(100) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(100) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(100) NOT NULL,
  `TRIGGER_GROUP` varchar(100) NOT NULL,
  `CRON_EXPRESSION` varchar(100) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('hrCleanScheduler', 'Mysql备份任务', '系统任务', '* * * 1 * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('hrCleanScheduler', '测试定时任务', '系统任务', '0/2 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(100) NOT NULL,
  `TRIGGER_GROUP` varchar(100) NOT NULL,
  `INSTANCE_NAME` varchar(100) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(100) DEFAULT NULL,
  `JOB_GROUP` varchar(100) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(100) NOT NULL,
  `JOB_GROUP` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('hrCleanScheduler', 'Mysql备份任务', '系统任务', NULL, 'com.kum.Quart.Task.MysqlBackupsJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('hrCleanScheduler', '测试定时任务', '系统任务', NULL, 'com.kum.Quart.Task.TestJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F40000000000010770800000010000000007800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('hrCleanScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(100) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(100) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(100) NOT NULL,
  `TRIGGER_GROUP` varchar(100) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(100) NOT NULL,
  `TRIGGER_GROUP` varchar(100) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(100) NOT NULL,
  `TRIGGER_GROUP` varchar(100) NOT NULL,
  `JOB_NAME` varchar(100) NOT NULL,
  `JOB_GROUP` varchar(100) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(100) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('hrCleanScheduler', 'Mysql备份任务', '系统任务', 'Mysql备份任务', '系统任务', NULL, 1617206400000, -1, 5, 'PAUSED', 'CRON', 1615205371000, 0, NULL, 0, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('hrCleanScheduler', '测试定时任务', '系统任务', '测试定时任务', '系统任务', NULL, 1616069932000, -1, 5, 'PAUSED', 'CRON', 1616069932000, 0, NULL, 0, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl`;
CREATE TABLE `sys_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限ID',
  `name` varchar(100) NOT NULL COMMENT '权限名称',
  `module_id` int(11) DEFAULT NULL COMMENT '所属权限模块',
  `status` int(1) DEFAULT NULL COMMENT '当前状态，0：正常，1：锁定',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(20) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_acl
-- ----------------------------
BEGIN;
INSERT INTO `sys_acl` VALUES (1, 'system:notice:save', 0, 0, '公告模块-保存', NULL, NULL, NULL);
INSERT INTO `sys_acl` VALUES (2, 'system:user:list', NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_acl_module
-- ----------------------------
DROP TABLE IF EXISTS `sys_acl_module`;
CREATE TABLE `sys_acl_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限模块ID',
  `name` varchar(20) NOT NULL COMMENT '权限模块名称',
  `parent_id` int(3) DEFAULT NULL COMMENT '父级模块ID',
  `status` int(1) DEFAULT NULL COMMENT '当前状态，0：正常，1：锁定',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(20) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_acl_module
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_building
-- ----------------------------
DROP TABLE IF EXISTS `sys_building`;
CREATE TABLE `sys_building` (
  `id` varchar(50) NOT NULL,
  `name` varchar(20) NOT NULL,
  `layers` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `area` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_building
-- ----------------------------
BEGIN;
INSERT INTO `sys_building` VALUES ('843c7eb787cb137650940aab9ee0a0c9', 'lll楼', 100, 10, 20, '2021-03-03 07:17:32');
INSERT INTO `sys_building` VALUES ('b2f0b032219a678503e22fa62356a9db', '不幸福楼', 222, 339, 122, '2021-02-17 14:07:39');
INSERT INTO `sys_building` VALUES ('c786bae071b3b0808ce636983877b8d0', '哈哈哈楼', 100, 10, 20, '2021-03-05 07:17:32');
INSERT INTO `sys_building` VALUES ('ee0250bb3b673e0fb31ea4ec26a0e85d', '幸福楼', 18, 100, 100, '2021-02-15 14:01:54');
COMMIT;

-- ----------------------------
-- Table structure for sys_charge_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_charge_type`;
CREATE TABLE `sys_charge_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charge_name` varchar(20) DEFAULT NULL COMMENT '收费类型名称',
  `charge_money` int(11) DEFAULT NULL COMMENT '收费金额',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_charge_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_charge_type` VALUES (1, '电费', 20, '2021-03-02 12:41:13', '2021-03-02 12:41:13');
INSERT INTO `sys_charge_type` VALUES (2, '天然气', 100, '2021-03-03 07:53:51', '2021-03-03 07:53:51');
COMMIT;

-- ----------------------------
-- Table structure for sys_complaint
-- ----------------------------
DROP TABLE IF EXISTS `sys_complaint`;
CREATE TABLE `sys_complaint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `phone` varchar(12) NOT NULL,
  `title` varchar(255) NOT NULL,
  `address` varchar(50) NOT NULL,
  `text` longtext NOT NULL,
  `is_examine` int(1) DEFAULT '0',
  `examine_data` longtext,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_complaint
-- ----------------------------
BEGIN;
INSERT INTO `sys_complaint` VALUES (2, '', '张三', '1866666666', '人不行', '幸福楼', '门口保安人不行', 1, '好的', '2021-02-21 08:36:16');
INSERT INTO `sys_complaint` VALUES (3, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', '翦珂义', '18697693369', '保安没素质', '幸福楼-g002-111', '保安太没素质了，骂我', 1, '你骂回去', '2021-02-21 08:36:16');
INSERT INTO `sys_complaint` VALUES (4, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', '翦珂义', '18697693369', '保安又骂人', '不幸福楼-g001-0001', '自从上次之后，保安又骂我了', 0, NULL, '2021-02-22 09:54:33');
INSERT INTO `sys_complaint` VALUES (5, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', '李林雨', '17681352846', '保安没素质', '幸福楼-1单元-g001', '保安骂我', 1, '你骂回去', '2021-03-08 12:00:14');
INSERT INTO `sys_complaint` VALUES (6, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', 'aasss', '18697693369', '啊啊啊多', '阿萨达', '啊啊', 0, NULL, '2021-04-12 08:48:37');
INSERT INTO `sys_complaint` VALUES (7, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', 'adsa', '18697693369', '阿达', '啊', '啊', 0, NULL, '2021-04-12 08:51:55');
INSERT INTO `sys_complaint` VALUES (8, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', 'a', '18697693369', '锕', '锕', '锕', 0, NULL, '2021-04-12 08:54:04');
INSERT INTO `sys_complaint` VALUES (9, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', 'a', '18697693369', 'a', 'a', 'a', 0, NULL, '2021-04-12 08:56:03');
INSERT INTO `sys_complaint` VALUES (10, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', 'a', '16713494722', 'a', 'a', 'a', 0, NULL, '2021-04-12 08:57:13');
INSERT INTO `sys_complaint` VALUES (11, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', 'a', '16713494722', 'a', 'a', 'a', 0, NULL, '2021-04-12 09:00:18');
COMMIT;

-- ----------------------------
-- Table structure for sys_facilities
-- ----------------------------
DROP TABLE IF EXISTS `sys_facilities`;
CREATE TABLE `sys_facilities` (
  `id` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `charge_person` varchar(50) NOT NULL,
  `contact_person` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `descri` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_facilities
-- ----------------------------
BEGIN;
INSERT INTO `sys_facilities` VALUES ('74746881a84957d99f4ff77ece042337', '长安医院', '医院', '张平安', '张平安', '0550-6734488', 'aaaaaaaaaaaaaaaaaaa');
INSERT INTO `sys_facilities` VALUES ('b5d8c063ebfaf896f503e1f16efa323f', '汇丰银行', '金融机构', '张无忌', '王五', '0550-6734466', 'sssssssssssssssss');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `group_name` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `class_path` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`,`name`,`group_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (2, '测试定时任务', '系统任务', 'com.kum.Quart.Task.TestJob', '0/2 * * * * ?', '1', '2021-02-25 09:32:23', '2021-02-25 09:32:23');
INSERT INTO `sys_job` VALUES (3, 'Mysql备份任务', '系统任务', 'com.kum.Quart.Task.MysqlBackupsJob', '* * * 1 * ?', '1', '2021-02-25 09:32:23', '2021-02-25 09:32:23');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `date` datetime DEFAULT NULL,
  `text` longtext,
  `html` longtext,
  `author` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES ('1360208908239245313', '小区物业公告模块测试', '2021-02-12 12:47:06', '# 概述\n本模块是 xxx，使用了 xxx 技术。\n\n![啊啊啊](https://www.baidu.com/img/dong_8f1d47bcb77d74a1e029d8cbb3b33854.gif)\n【第一章】道可道，非常道；名可名，非常名。无名天地之始，有名万物之母。故常无欲，以观其妙；常\n\n有欲，以观其徼（jiào）。此两者同出而异名，同谓之玄，玄之又玄，众妙之门。〖译文〗\n\n \n\n【第二章】天下皆知美之为美，斯恶（è）已；皆知善之为善，斯不善已。故有无相生，难易相成，长短相\n\n较，高下相倾，音声相和（hè），前后相随。是以圣人处无为之事，行不言之教，万物作焉而不辞，生而\n\n不有，为而不恃，功成而弗居。夫（fú）唯弗居，是以不去。 〖译文〗\n\n \n\n【第三章】不尚贤，使民不争；不贵难得之货，使民不为盗；不见（xiàn）可欲，使民心不乱。是以圣人\n\n之治，虚其心，实其腹；弱其志，强其骨。常使民无知无欲，使夫（fú）智者不敢为也。为无为，则无不\n\n治。 〖译文〗\n\n \n\n【第四章】道冲而用之或不盈，渊兮似万物之宗。挫其锐，解其纷，和其光，同其尘。湛兮似或存，吾不\n\n知谁之子，象帝之先。 〖译文〗\n\n \n\n【第五章】天地不仁，以万物为刍（chú）狗；圣人不仁，以百姓为刍狗。天地之间，其犹橐龠（tuó\n\nyuè）乎？虚而不屈，动而愈出。多言数（shuò）穷，不如守中。 〖译文〗\n\n \n\n【第六章】谷神不死，是谓玄牝（pìn），玄牝之门，是谓天地根。绵绵若存，用之不勤。 〖译文〗\n\n \n\n【第七章】天长地久。天地所以能长且久者，以其不自生，故能长生。是以圣人后其身而身先，外其身而\n\n身存。非以其无私邪（yé）？故能成其私。 〖译文〗\n\n \n\n【第八章】上善若水。水善利万物而不争，处众人之所恶（wù），故几（jī）于道。居善地，心善渊，与\n\n善仁，言善信，正善治，事善能，动善时。夫唯不争，故无尤。 〖译文〗\n\n \n\n【第九章】持而盈之，不如其已。揣(chuǎi)而锐之，不可长保。金玉满堂，莫之能守。富贵而骄，自遗（\n\nyí）其咎。功成身退，天之道。 〖译文〗\n\n \n\n【第十章】载（zài）营魄抱一，能无离乎？专气致柔，能婴儿乎？涤除玄览，能无疵乎？爱民治国，能无\n\n知（zhì）乎？天门开阖（hé），能无雌乎？明白四达，能无为乎？生之、畜（xù）之，生而不有，为而不\n\n恃，长（zhǎng）而不宰，是谓玄德。 〖译文〗\n\n \n\n【第十一章】三十辐共一毂（gǔ），当其无，有车之用。埏埴（shān zhí）以为器，当其无，有器之用。\n\n凿户牖（yǒu）以为室，当其无，有室之用。故有之以为利，无之以为用。 〖译文〗\n\n \n\n【第十二章】 五色令人目盲，五音令人耳聋，五味令人口爽，驰骋畋（tián）猎令人心发狂，难得之货令\n\n人行妨。是以圣人为腹不为目，故去彼取此。 〖译文〗\n\n \n\n【第十三章】宠辱若惊，贵大患若身。何谓宠辱若惊？宠为下，得之若惊，失之若惊，是谓宠辱若惊。何\n\n谓贵大患若身？吾所以有大患者，为吾有身，及吾无身，吾有何患！故贵以身为天下，若可寄天下；爱以\n\n身为天下，若可托天下。 〖译文〗\n\n \n\n【第十四章】视之不见名曰夷，听之不闻名曰希，搏之不得名曰微。此三者不可致诘（jié），故混（\n\nhùn）而为一。其上不皦（jiǎo皎），其下不昧。绳绳(mǐn mǐn )不可名，复归于无物，是谓无状之状，无\n\n物之象。是谓惚恍。迎之不见其首，随之不见其后。执古之道，以御今之有，能知古始，是谓道纪。 〖译文〗\n\n \n\n【第十五章】古之善为士者，微妙玄通，深不可识。夫唯不可识，故强(qiǎng)为之容。豫焉若冬涉川，犹\n\n兮若畏四邻，俨兮其若容，涣兮若冰之将释，敦兮其若朴，旷兮其若谷，混兮其若浊。孰能浊以静之徐清\n\n？孰能安以久动之徐生？保此道者不欲盈，夫唯不盈，故能蔽不新成。 〖译文〗\n\n \n\n【第十六章】致虚极，守静笃（dǔ），万物并作，吾以观复。夫物芸芸，各复归其根。归根曰静，是谓复\n\n命。复命曰常，知常曰明，不知常，妄作，凶。知常容，容乃公，公乃王（wàng），王（wàng）乃天，天\n\n乃道，道乃久，没（mò）身不殆。 〖译文〗\n\n \n\n【第十七章】太上，下知有之。其次，亲而誉之。其次，畏之。其次，侮之。信不足焉，有不信焉。悠兮\n\n其贵言。功成事遂，百姓皆谓我自然。 〖译文〗\n\n \n\n【第十八章】大道废，有仁义；慧智出，有大伪；六亲不和，有孝慈；国家昏乱，有忠臣。 〖译文〗\n\n \n\n【第十九章】绝圣弃智，民利百倍；绝仁弃义，民复孝慈；绝巧弃利，盗贼无有。此三者，以为文不足，\n\n故令有所属，见（xiàn）素抱朴，少私寡欲。 〖译文〗\n\n \n\n【第二十章】绝学无忧。唯之与阿（ē），相去几何？善之与恶，相去若何？人之所畏，不可不畏。荒兮其\n\n未央哉！众人熙熙，如享太牢，如春登台。我独泊兮其未兆，如婴儿之未孩。傫傫（lěi）兮若无所归。众\n\n人皆有余，而我独若遗。我愚人之心也哉！沌沌兮！俗人昭昭，我独昏昏；俗人察察，我独闷闷。澹（\n\ndàn）兮其若海，飂（liù）兮若无止。众人皆有以，而我独顽似鄙。我独异于人，而贵食(sì)母。 〖译文〗\n\n \n\n【第二十一章】孔德之容，惟道是从。道之为物，惟恍惟惚。惚兮恍兮，其中有象；恍兮惚兮，其中有物\n\n。窈（yǎo）兮冥兮，其中有精；其精甚真，其中有信。自古及今，其名不去，以阅众甫。吾何以知众甫之\n\n状哉？以此。 〖译文〗\n\n \n\n【第二十二章】曲则全，枉则直，洼则盈，敝则新，少则得，多则惑。是以圣人抱一，为天下式。不自见\n\n（xiàn）故明，不自是故彰，不自伐故有功，不自矜故长。夫唯不争，故天下莫能与之争。古之所谓曲则\n\n全者，岂虚言哉！诚全而归之。 〖译文〗\n\n', '<h1><a id=\"_0\"></a>概述</h1>\n<p>本模块是 xxx，使用了 xxx 技术。</p>\n<p><img src=\"https://www.baidu.com/img/dong_8f1d47bcb77d74a1e029d8cbb3b33854.gif\" alt=\"啊啊啊\" /><br />\n【第一章】道可道，非常道；名可名，非常名。无名天地之始，有名万物之母。故常无欲，以观其妙；常</p>\n<p>有欲，以观其徼（jiào）。此两者同出而异名，同谓之玄，玄之又玄，众妙之门。〖译文〗</p>\n<p>【第二章】天下皆知美之为美，斯恶（è）已；皆知善之为善，斯不善已。故有无相生，难易相成，长短相</p>\n<p>较，高下相倾，音声相和（hè），前后相随。是以圣人处无为之事，行不言之教，万物作焉而不辞，生而</p>\n<p>不有，为而不恃，功成而弗居。夫（fú）唯弗居，是以不去。 〖译文〗</p>\n<p>【第三章】不尚贤，使民不争；不贵难得之货，使民不为盗；不见（xiàn）可欲，使民心不乱。是以圣人</p>\n<p>之治，虚其心，实其腹；弱其志，强其骨。常使民无知无欲，使夫（fú）智者不敢为也。为无为，则无不</p>\n<p>治。 〖译文〗</p>\n<p>【第四章】道冲而用之或不盈，渊兮似万物之宗。挫其锐，解其纷，和其光，同其尘。湛兮似或存，吾不</p>\n<p>知谁之子，象帝之先。 〖译文〗</p>\n<p>【第五章】天地不仁，以万物为刍（chú）狗；圣人不仁，以百姓为刍狗。天地之间，其犹橐龠（tuó</p>\n<p>yuè）乎？虚而不屈，动而愈出。多言数（shuò）穷，不如守中。 〖译文〗</p>\n<p>【第六章】谷神不死，是谓玄牝（pìn），玄牝之门，是谓天地根。绵绵若存，用之不勤。 〖译文〗</p>\n<p>【第七章】天长地久。天地所以能长且久者，以其不自生，故能长生。是以圣人后其身而身先，外其身而</p>\n<p>身存。非以其无私邪（yé）？故能成其私。 〖译文〗</p>\n<p>【第八章】上善若水。水善利万物而不争，处众人之所恶（wù），故几（jī）于道。居善地，心善渊，与</p>\n<p>善仁，言善信，正善治，事善能，动善时。夫唯不争，故无尤。 〖译文〗</p>\n<p>【第九章】持而盈之，不如其已。揣(chuǎi)而锐之，不可长保。金玉满堂，莫之能守。富贵而骄，自遗（</p>\n<p>yí）其咎。功成身退，天之道。 〖译文〗</p>\n<p>【第十章】载（zài）营魄抱一，能无离乎？专气致柔，能婴儿乎？涤除玄览，能无疵乎？爱民治国，能无</p>\n<p>知（zhì）乎？天门开阖（hé），能无雌乎？明白四达，能无为乎？生之、畜（xù）之，生而不有，为而不</p>\n<p>恃，长（zhǎng）而不宰，是谓玄德。 〖译文〗</p>\n<p>【第十一章】三十辐共一毂（gǔ），当其无，有车之用。埏埴（shān zhí）以为器，当其无，有器之用。</p>\n<p>凿户牖（yǒu）以为室，当其无，有室之用。故有之以为利，无之以为用。 〖译文〗</p>\n<p>【第十二章】 五色令人目盲，五音令人耳聋，五味令人口爽，驰骋畋（tián）猎令人心发狂，难得之货令</p>\n<p>人行妨。是以圣人为腹不为目，故去彼取此。 〖译文〗</p>\n<p>【第十三章】宠辱若惊，贵大患若身。何谓宠辱若惊？宠为下，得之若惊，失之若惊，是谓宠辱若惊。何</p>\n<p>谓贵大患若身？吾所以有大患者，为吾有身，及吾无身，吾有何患！故贵以身为天下，若可寄天下；爱以</p>\n<p>身为天下，若可托天下。 〖译文〗</p>\n<p>【第十四章】视之不见名曰夷，听之不闻名曰希，搏之不得名曰微。此三者不可致诘（jié），故混（</p>\n<p>hùn）而为一。其上不皦（jiǎo皎），其下不昧。绳绳(mǐn mǐn )不可名，复归于无物，是谓无状之状，无</p>\n<p>物之象。是谓惚恍。迎之不见其首，随之不见其后。执古之道，以御今之有，能知古始，是谓道纪。 〖译文〗</p>\n<p>【第十五章】古之善为士者，微妙玄通，深不可识。夫唯不可识，故强(qiǎng)为之容。豫焉若冬涉川，犹</p>\n<p>兮若畏四邻，俨兮其若容，涣兮若冰之将释，敦兮其若朴，旷兮其若谷，混兮其若浊。孰能浊以静之徐清</p>\n<p>？孰能安以久动之徐生？保此道者不欲盈，夫唯不盈，故能蔽不新成。 〖译文〗</p>\n<p>【第十六章】致虚极，守静笃（dǔ），万物并作，吾以观复。夫物芸芸，各复归其根。归根曰静，是谓复</p>\n<p>命。复命曰常，知常曰明，不知常，妄作，凶。知常容，容乃公，公乃王（wàng），王（wàng）乃天，天</p>\n<p>乃道，道乃久，没（mò）身不殆。 〖译文〗</p>\n<p>【第十七章】太上，下知有之。其次，亲而誉之。其次，畏之。其次，侮之。信不足焉，有不信焉。悠兮</p>\n<p>其贵言。功成事遂，百姓皆谓我自然。 〖译文〗</p>\n<p>【第十八章】大道废，有仁义；慧智出，有大伪；六亲不和，有孝慈；国家昏乱，有忠臣。 〖译文〗</p>\n<p>【第十九章】绝圣弃智，民利百倍；绝仁弃义，民复孝慈；绝巧弃利，盗贼无有。此三者，以为文不足，</p>\n<p>故令有所属，见（xiàn）素抱朴，少私寡欲。 〖译文〗</p>\n<p>【第二十章】绝学无忧。唯之与阿（ē），相去几何？善之与恶，相去若何？人之所畏，不可不畏。荒兮其</p>\n<p>未央哉！众人熙熙，如享太牢，如春登台。我独泊兮其未兆，如婴儿之未孩。傫傫（lěi）兮若无所归。众</p>\n<p>人皆有余，而我独若遗。我愚人之心也哉！沌沌兮！俗人昭昭，我独昏昏；俗人察察，我独闷闷。澹（</p>\n<p>dàn）兮其若海，飂（liù）兮若无止。众人皆有以，而我独顽似鄙。我独异于人，而贵食(sì)母。 〖译文〗</p>\n<p>【第二十一章】孔德之容，惟道是从。道之为物，惟恍惟惚。惚兮恍兮，其中有象；恍兮惚兮，其中有物</p>\n<p>。窈（yǎo）兮冥兮，其中有精；其精甚真，其中有信。自古及今，其名不去，以阅众甫。吾何以知众甫之</p>\n<p>状哉？以此。 〖译文〗</p>\n<p>【第二十二章】曲则全，枉则直，洼则盈，敝则新，少则得，多则惑。是以圣人抱一，为天下式。不自见</p>\n<p>（xiàn）故明，不自是故彰，不自伐故有功，不自矜故长。夫唯不争，故天下莫能与之争。古之所谓曲则</p>\n<p>全者，岂虚言哉！诚全而归之。 〖译文〗</p>\n', '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_options
-- ----------------------------
DROP TABLE IF EXISTS `sys_options`;
CREATE TABLE `sys_options` (
  `id` varchar(80) CHARACTER SET utf8 NOT NULL,
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_options
-- ----------------------------
BEGIN;
INSERT INTO `sys_options` VALUES ('rq_info', '{\"name\":\"翻斗小区\",\"date\":\" 1901-03-31\",\"address\":\"幸福路翻斗小区\",\"builtUpArea\":\"1212\",\"roadArea\":\"34\",\"desc\":\"恭喜你发财\",\"parkingArea\":\"233\",\"afforestedArea\":\"121\",\"phone\":\"0558-8666666\",\"buildingsNumber\":\"100\",\"person\":\"胡图图\"}');
INSERT INTO `sys_options` VALUES ('rq_repair_info', '{\"contact_phone\":\"18697693369\"}');
COMMIT;

-- ----------------------------
-- Table structure for sys_repair
-- ----------------------------
DROP TABLE IF EXISTS `sys_repair`;
CREATE TABLE `sys_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `date` datetime NOT NULL,
  `text` longtext NOT NULL,
  `address` varchar(50) NOT NULL,
  `is_examine` int(1) DEFAULT '0',
  `examine_data` longtext,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_repair
-- ----------------------------
BEGIN;
INSERT INTO `sys_repair` VALUES (1, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', '翦珂义', '人坏了', '18697693369', '2021-02-20 00:00:00', '我人没了我人没了我人没了我人没了我人没了我人没了我人没了我人没了我人没了我人没了我人没了我人没了我人没了', '幸福楼-g2001-001', 1, '已进行抢救，可惜为时已晚。');
INSERT INTO `sys_repair` VALUES (2, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', '哈哈哈', '阿斯蒂芬请问请问', '18119740134', '2021-04-13 08:43:13', '安定区无无群群无多无群', '安定区无群', 0, NULL);
INSERT INTO `sys_repair` VALUES (3, 'a635cb9c1b20bf7d8df803fb9a8fd9ae', '哈哈哈', '阿斯蒂芬请问请问', '18697693369', '2021-04-13 08:43:13', '安定区无无群群无多无群', '安定区无群', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(20) NOT NULL COMMENT '角色名称',
  `role_key` varchar(20) NOT NULL COMMENT '角色权限字符串',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (0, '管理员', 'admin');
INSERT INTO `sys_role` VALUES (1, '普通用户', 'common');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_acl
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_acl`;
CREATE TABLE `sys_role_acl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `acl_id` int(11) NOT NULL COMMENT '权限ID',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `operator` varchar(20) DEFAULT NULL COMMENT '操作人员',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `operate_ip` varchar(20) DEFAULT NULL COMMENT '操作IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_role_acl
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_acl` VALUES (1, 0, 1, NULL, NULL, NULL, NULL);
INSERT INTO `sys_role_acl` VALUES (2, 0, 2, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_room
-- ----------------------------
DROP TABLE IF EXISTS `sys_room`;
CREATE TABLE `sys_room` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_name` varchar(20) NOT NULL COMMENT '单元名称',
  `building_name` varchar(20) NOT NULL COMMENT '楼宇名称',
  `direction` varchar(8) NOT NULL COMMENT '房间朝向',
  `purpose` varchar(10) NOT NULL COMMENT '房间用途',
  `specifications` varchar(10) NOT NULL COMMENT '房间规格',
  `grade` varchar(10) NOT NULL COMMENT '房间等级',
  `builtup_area` varchar(5) NOT NULL COMMENT '建筑面积',
  `use_area` varchar(5) NOT NULL COMMENT '使用面积',
  `is_sale` varchar(8) NOT NULL DEFAULT '0' COMMENT '是否出售',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_room
-- ----------------------------
BEGIN;
INSERT INTO `sys_room` VALUES (1, 'g333', '幸福楼', '坐北朝南', '住宅', '普通', '三室二厅', '111', '100', '已有住户');
INSERT INTO `sys_room` VALUES (2, 'g0201', '幸福楼', '坐北朝南', '商铺', '二室一厅', '高级', '120', '100', '已有住户');
INSERT INTO `sys_room` VALUES (3, 'g0201', '不幸福楼', '坐北朝南', '商铺', '二室一厅', '高级', '120', '100', '空');
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(50) NOT NULL,
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `full_name` varchar(20) DEFAULT NULL COMMENT '用户真实姓名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `phone` varchar(11) NOT NULL COMMENT '手机号',
  `login_ip` varchar(50) DEFAULT NULL COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES ('a635cb9c1b20bf7d8df803fb9a8fd9ae', 'hhhh', '王五', '$2a$10$vEItNpRpCFNsHlBKm7nsXen5d.b.7C6XHRxeEIvw3KpOwTZUe8LfK', '0', '13444444444', NULL, NULL);
INSERT INTO `sys_user` VALUES ('aaa', 'admin', '张三', '$2a$10$vEItNpRpCFNsHlBKm7nsXen5d.b.7C6XHRxeEIvw3KpOwTZUe8LfK', '0', '1867777777', '111.22.22.1', '2021-03-03 12:41:15');
INSERT INTO `sys_user` VALUES ('c9f04eb4051639567fec31fe244f4250', 'wangba', '王八', '$2a$10$9BhCD1XvM8nuDx3lyk.kzuc3NM6nkRIhAkXGOCjRPfRo0SX7crGEe', '1', '15666666666', NULL, NULL);
INSERT INTO `sys_user` VALUES ('d5f62a0c7d48bded2a0060e3c52b63f3', 'dd', 'd', '$2a$10$bD5t9VByYjDLo4xcqVQ4juKgtUJ.aFd/N4RLBxVzy0aa6qtq6XnpS', '0', 'd', NULL, NULL);
INSERT INTO `sys_user` VALUES ('f4cc84f2713b3b896491f7389dac926a', 'f', 'f', '$2a$10$90bQsp6g55gGsuvQxjbUw.wfIIrtPDXoMYzFAKJuMTuLq9c6mlgGS', '0', 'f', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info` (
  `id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `room_id` varchar(50) DEFAULT NULL COMMENT '房间ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_info` VALUES ('1d47c7a0d82c12cd933d8fb1fbc7f657', 'c9f04eb4051639567fec31fe244f4250', '2', NULL, NULL);
INSERT INTO `sys_user_info` VALUES ('aaa', 'aaa', '1', '2021-03-03 16:00:28', '2021-03-03 16:00:30');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_play_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_play_record`;
CREATE TABLE `sys_user_play_record` (
  `id` varchar(50) NOT NULL COMMENT '记录ID',
  `user_id` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `charge_type_id` int(11) DEFAULT NULL COMMENT '费用类型ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_play_record
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_play_record` VALUES ('0', 'aaa', 1, '2021-03-25 10:31:47');
INSERT INTO `sys_user_play_record` VALUES ('1e62aa11713399647939e2fcb88aff18', 'aaa', 2, '2021-03-26 17:11:42');
INSERT INTO `sys_user_play_record` VALUES ('81496808aa7b92b8ac3b58139a96071e', 'aaa', 1, '2021-04-09 11:35:46');
INSERT INTO `sys_user_play_record` VALUES ('a9defa41db8a0233cbc8b5278e6a2f1c', 'a635cb9c1b20bf7d8df803fb9a8fd9ae', 1, '2021-03-28 11:57:53');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(50) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES ('a635cb9c1b20bf7d8df803fb9a8fd9ae', 1);
INSERT INTO `sys_user_role` VALUES ('aaa', 0);
INSERT INTO `sys_user_role` VALUES ('c9f04eb4051639567fec31fe244f4250', 0);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
