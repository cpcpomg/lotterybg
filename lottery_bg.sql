/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80200
 Source Host           : localhost:3306
 Source Schema         : lottery_bg

 Target Server Type    : MySQL
 Target Server Version : 80200
 File Encoding         : 65001

 Date: 06/07/2025 18:48:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ball_admin
-- ----------------------------
DROP TABLE IF EXISTS `ball_admin`;
CREATE TABLE `ball_admin`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `google_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT NULL,
  `menu_group_id` bigint NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `player_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `todo_all` tinyint NULL DEFAULT 0,
  `tg_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `re_alert` tinyint NULL DEFAULT 0,
  `wi_alert` tinyint NULL DEFAULT 0,
  `white_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `head_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_unique`(`admin_name` ASC) USING BTREE,
  INDEX `menu_group_id`(`menu_group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 143 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后端管理账号' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_admin
-- ----------------------------
INSERT INTO `ball_admin` VALUES (1, 'admin', 'b51c30722c0aaa05c7f12e16a82555ab', 'super_admin', '', NULL, 1, 1, 0, 0, NULL, 0, '', 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for ball_api_config
-- ----------------------------
DROP TABLE IF EXISTS `ball_api_config`;
CREATE TABLE `ball_api_config`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `todo_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `todo_chat` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `todo_wi_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `todo_wi_chat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rw_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rw_chat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tg2_token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `tg2_chat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_api_config
-- ----------------------------
INSERT INTO `ball_api_config` VALUES (1, NULL, NULL, NULL, NULL, '', '', NULL, NULL);

-- ----------------------------
-- Table structure for ball_app
-- ----------------------------
DROP TABLE IF EXISTS `ball_app`;
CREATE TABLE `ball_app`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_type` tinyint NULL DEFAULT NULL COMMENT '会员等级',
  `app_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `status` tinyint NULL DEFAULT NULL COMMENT '状态0禁1启',
  `created_at` bigint NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `level_unique`(`app_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_app
-- ----------------------------
INSERT INTO `ball_app` VALUES (1, 0, 'https://res.yongwan888other.com/yw_250305.apk', 1, NULL, NULL);
INSERT INTO `ball_app` VALUES (2, 1, 'http://8.138.175.151:7788/', 1, NULL, NULL);

-- ----------------------------
-- Table structure for ball_balance_change
-- ----------------------------
DROP TABLE IF EXISTS `ball_balance_change`;
CREATE TABLE `ball_balance_change`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` bigint NULL DEFAULT NULL,
  `player_id` bigint NOT NULL DEFAULT 0 COMMENT '玩家id',
  `change_money` bigint NULL DEFAULT 0 COMMENT '变化金额',
  `init_money` bigint NULL DEFAULT 0 COMMENT '初始金额',
  `dned_money` bigint NULL DEFAULT NULL COMMENT '变化后的金额',
  `balance_change_type` tinyint NOT NULL DEFAULT 0 COMMENT '1充值 2提现 3投注 4赢 5佣金 6人工 ',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单号',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `qr` bigint NULL DEFAULT 0,
  `user_id` bigint NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` bigint NULL DEFAULT NULL,
  `account_type` tinyint NULL DEFAULT NULL,
  `frozen_status` tinyint NULL DEFAULT 1,
  `step` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_id`(`player_id` ASC) USING BTREE,
  INDEX `super_tree`(`super_tree` ASC) USING BTREE,
  INDEX `player_id_order_type`(`player_id` ASC, `balance_change_type` ASC, `order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 543 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '账变表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_balance_change
-- ----------------------------

-- ----------------------------
-- Table structure for ball_bank_card
-- ----------------------------
DROP TABLE IF EXISTS `ball_bank_card`;
CREATE TABLE `ball_bank_card`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT NULL COMMENT '玩家ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `card_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '卡号',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行名字',
  `card_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '持卡人姓名',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态 1正常 2禁用',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `status_check` tinyint NULL DEFAULT NULL,
  `checker` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `check_time` bigint NULL DEFAULT 0,
  `oper_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `has_withdrawal` tinyint NULL DEFAULT 0,
  `ctype` tinyint NULL DEFAULT 0,
  `identity` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sub_branch` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_qr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `top` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '银行卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_bank_card
-- ----------------------------

-- ----------------------------
-- Table structure for ball_commission_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ball_commission_recharge`;
CREATE TABLE `ball_commission_recharge`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `commission_level` tinyint NULL DEFAULT 0 COMMENT '返佣层级',
  `automatic_distribution` tinyint NULL DEFAULT 0 COMMENT '自动发放 1 自动 0不自动',
  `auto_settle_first` tinyint NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 1 COMMENT '状态 1开启 0关闭',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `oper_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `model_type` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_all`(`commission_level` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_commission_recharge
-- ----------------------------
INSERT INTO `ball_commission_recharge` VALUES (1, '充值返佣', 1, 1, 1, 1, 1733469530902, 1739939441986, '', '[{\"edit\":true,\"rate\":\"3\",\"fixed\":0,\"type\":1,\"toSelf\":0,\"min\":\"100\",\"max\":\"99999999\"}]', 0);

-- ----------------------------
-- Table structure for ball_commission_strategy
-- ----------------------------
DROP TABLE IF EXISTS `ball_commission_strategy`;
CREATE TABLE `ball_commission_strategy`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '优惠名称',
  `commission_strategy_type` tinyint NULL DEFAULT 0 COMMENT '1 下注返佣 2盈利返佣 3充值返佣',
  `commission_level` tinyint NULL DEFAULT 0 COMMENT '返佣层级',
  `automatic_distribution` tinyint NULL DEFAULT 0 COMMENT '自动发放 1 自动 0不自动',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态 1开启 0关闭',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `oper_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `min_able` bigint NULL DEFAULT NULL,
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_all`(`commission_strategy_type` ASC, `commission_level` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_commission_strategy
-- ----------------------------

-- ----------------------------
-- Table structure for ball_config_wfail
-- ----------------------------
DROP TABLE IF EXISTS `ball_config_wfail`;
CREATE TABLE `ball_config_wfail`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `status` tinyint NULL DEFAULT 1,
  `created_at` bigint NULL DEFAULT 0,
  `updated_at` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_config_wfail
-- ----------------------------
INSERT INTO `ball_config_wfail` VALUES (1, '卡号不正确', '卡号不正确，无法提现', 1, 0, 0);

-- ----------------------------
-- Table structure for ball_deposit_policy
-- ----------------------------
DROP TABLE IF EXISTS `ball_deposit_policy`;
CREATE TABLE `ball_deposit_policy`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '优惠名称',
  `deposit_policy_type` tinyint NULL DEFAULT 0 COMMENT '优惠类型 1首冲 2每次',
  `pay_type` tinyint NULL DEFAULT 0,
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `auto_settlement` tinyint NULL DEFAULT 0,
  `pay_id` bigint NULL DEFAULT NULL,
  `week` tinyint NULL DEFAULT 8,
  `start_time` bigint NULL DEFAULT 0 COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT 0 COMMENT '结束时间',
  `min` int NULL DEFAULT 0 COMMENT '优惠区间开始',
  `preferential_per` int NOT NULL DEFAULT 0 COMMENT '优惠百分比',
  `max` int NOT NULL DEFAULT 0 COMMENT '优惠区间结束',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态 1开启 2关闭',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '协议',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `overlying` tinyint NULL DEFAULT 0,
  `priority` int NULL DEFAULT 1,
  `first_type` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type_unique`(`deposit_policy_type` ASC, `pay_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存款策略' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_deposit_policy
-- ----------------------------
INSERT INTO `ball_deposit_policy` VALUES (18, '周一', 4, 0, NULL, 1, NULL, 1, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"12\",\"fixed\":0,\"min\":\"100\",\"max\":\"99999999\"}]', 0, 1, 0);
INSERT INTO `ball_deposit_policy` VALUES (19, '周三', 4, 0, NULL, 1, NULL, 3, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"12\",\"fixed\":0,\"min\":\"100\",\"max\":\"99999999\"}]', 0, 1, 0);
INSERT INTO `ball_deposit_policy` VALUES (26, '周日', 4, 0, NULL, 1, NULL, 7, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"12\",\"fixed\":0,\"min\":\"100\",\"max\":\"999999\"}]', 0, 1, 0);
INSERT INTO `ball_deposit_policy` VALUES (27, '周二', 4, 0, NULL, 1, NULL, 2, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"12\",\"fixed\":0,\"min\":\"100\",\"max\":\"9999999\"}]', 0, 1, 0);
INSERT INTO `ball_deposit_policy` VALUES (28, '周四', 4, 0, NULL, 1, NULL, 4, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"12\",\"fixed\":0,\"min\":\"100\",\"max\":\"9999999\"}]', 0, 1, 0);
INSERT INTO `ball_deposit_policy` VALUES (29, '周五', 4, 0, NULL, 1, NULL, 5, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"12\",\"fixed\":0,\"min\":\"100\",\"max\":\"9999999\"}]', 0, 1, 0);
INSERT INTO `ball_deposit_policy` VALUES (30, '周六', 4, 0, NULL, 1, NULL, 6, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"12\",\"fixed\":0,\"min\":\"100\",\"max\":\"9999999\"}]', 0, 1, 0);
INSERT INTO `ball_deposit_policy` VALUES (31, '首冲赠送', 1, 0, NULL, 1, NULL, 8, 0, 0, 0, 0, 0, 1, '', 0, 0, '[{\"edit\":true,\"rate\":\"20\",\"fixed\":0,\"min\":\"100\",\"max\":\"99999999\"}]', 0, 5, 0);

-- ----------------------------
-- Table structure for ball_dialog_notice
-- ----------------------------
DROP TABLE IF EXISTS `ball_dialog_notice`;
CREATE TABLE `ball_dialog_notice`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '语言编码',
  `status` tinyint NULL DEFAULT 1 COMMENT '1正常 2禁用',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '弹窗公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_dialog_notice
-- ----------------------------
INSERT INTO `ball_dialog_notice` VALUES (8, '', '在线充值，请联系右下角24小时在线客服', '0', 1, 1738894930583, 0);

-- ----------------------------
-- Table structure for ball_group
-- ----------------------------
DROP TABLE IF EXISTS `ball_group`;
CREATE TABLE `ball_group`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1 COMMENT '1正常2废除',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_group
-- ----------------------------
INSERT INTO `ball_group` VALUES (1, '超级管理员', 1, 0, 0);
INSERT INTO `ball_group` VALUES (14, '客服', 1, 1738231789210, 0);

-- ----------------------------
-- Table structure for ball_group_menu
-- ----------------------------
DROP TABLE IF EXISTS `ball_group_menu`;
CREATE TABLE `ball_group_menu`  (
  `role_id` bigint NOT NULL,
  `auth_id` bigint NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色权限中间表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_group_menu
-- ----------------------------
INSERT INTO `ball_group_menu` VALUES (1, 1);
INSERT INTO `ball_group_menu` VALUES (1, 2);
INSERT INTO `ball_group_menu` VALUES (1, 3);
INSERT INTO `ball_group_menu` VALUES (1, 4);
INSERT INTO `ball_group_menu` VALUES (1, 5);
INSERT INTO `ball_group_menu` VALUES (1, 6);
INSERT INTO `ball_group_menu` VALUES (1, 7);
INSERT INTO `ball_group_menu` VALUES (1, 8);
INSERT INTO `ball_group_menu` VALUES (1, 9);
INSERT INTO `ball_group_menu` VALUES (1, 10);
INSERT INTO `ball_group_menu` VALUES (1, 11);
INSERT INTO `ball_group_menu` VALUES (1, 12);
INSERT INTO `ball_group_menu` VALUES (1, 13);
INSERT INTO `ball_group_menu` VALUES (1, 14);
INSERT INTO `ball_group_menu` VALUES (1, 15);
INSERT INTO `ball_group_menu` VALUES (1, 16);
INSERT INTO `ball_group_menu` VALUES (1, 17);
INSERT INTO `ball_group_menu` VALUES (1, 18);
INSERT INTO `ball_group_menu` VALUES (1, 19);
INSERT INTO `ball_group_menu` VALUES (1, 20);
INSERT INTO `ball_group_menu` VALUES (1, 21);
INSERT INTO `ball_group_menu` VALUES (1, 22);
INSERT INTO `ball_group_menu` VALUES (1, 23);
INSERT INTO `ball_group_menu` VALUES (1, 24);
INSERT INTO `ball_group_menu` VALUES (1, 25);
INSERT INTO `ball_group_menu` VALUES (1, 26);
INSERT INTO `ball_group_menu` VALUES (1, 27);
INSERT INTO `ball_group_menu` VALUES (1, 28);
INSERT INTO `ball_group_menu` VALUES (1, 29);
INSERT INTO `ball_group_menu` VALUES (1, 30);
INSERT INTO `ball_group_menu` VALUES (1, 31);
INSERT INTO `ball_group_menu` VALUES (1, 32);
INSERT INTO `ball_group_menu` VALUES (1, 33);
INSERT INTO `ball_group_menu` VALUES (1, 34);
INSERT INTO `ball_group_menu` VALUES (1, 35);
INSERT INTO `ball_group_menu` VALUES (1, 36);
INSERT INTO `ball_group_menu` VALUES (1, 37);
INSERT INTO `ball_group_menu` VALUES (1, 38);
INSERT INTO `ball_group_menu` VALUES (1, 39);
INSERT INTO `ball_group_menu` VALUES (1, 40);
INSERT INTO `ball_group_menu` VALUES (1, 41);
INSERT INTO `ball_group_menu` VALUES (1, 42);
INSERT INTO `ball_group_menu` VALUES (1, 43);
INSERT INTO `ball_group_menu` VALUES (1, 44);
INSERT INTO `ball_group_menu` VALUES (1, 45);
INSERT INTO `ball_group_menu` VALUES (1, 46);
INSERT INTO `ball_group_menu` VALUES (1, 47);
INSERT INTO `ball_group_menu` VALUES (1, 48);
INSERT INTO `ball_group_menu` VALUES (1, 49);
INSERT INTO `ball_group_menu` VALUES (1, 50);
INSERT INTO `ball_group_menu` VALUES (1, 51);
INSERT INTO `ball_group_menu` VALUES (1, 52);
INSERT INTO `ball_group_menu` VALUES (1, 53);
INSERT INTO `ball_group_menu` VALUES (1, 54);
INSERT INTO `ball_group_menu` VALUES (1, 55);
INSERT INTO `ball_group_menu` VALUES (1, 56);
INSERT INTO `ball_group_menu` VALUES (1, 57);
INSERT INTO `ball_group_menu` VALUES (1, 58);
INSERT INTO `ball_group_menu` VALUES (1, 59);
INSERT INTO `ball_group_menu` VALUES (1, 60);
INSERT INTO `ball_group_menu` VALUES (1, 61);
INSERT INTO `ball_group_menu` VALUES (1, 62);
INSERT INTO `ball_group_menu` VALUES (1, 63);
INSERT INTO `ball_group_menu` VALUES (1, 64);
INSERT INTO `ball_group_menu` VALUES (1, 65);
INSERT INTO `ball_group_menu` VALUES (1, 66);
INSERT INTO `ball_group_menu` VALUES (1, 67);
INSERT INTO `ball_group_menu` VALUES (1, 68);
INSERT INTO `ball_group_menu` VALUES (1, 69);
INSERT INTO `ball_group_menu` VALUES (1, 70);
INSERT INTO `ball_group_menu` VALUES (1, 71);
INSERT INTO `ball_group_menu` VALUES (1, 72);
INSERT INTO `ball_group_menu` VALUES (1, 73);
INSERT INTO `ball_group_menu` VALUES (1, 74);
INSERT INTO `ball_group_menu` VALUES (1, 75);
INSERT INTO `ball_group_menu` VALUES (1, 76);
INSERT INTO `ball_group_menu` VALUES (1, 77);
INSERT INTO `ball_group_menu` VALUES (1, 78);
INSERT INTO `ball_group_menu` VALUES (1, 79);
INSERT INTO `ball_group_menu` VALUES (1, 80);
INSERT INTO `ball_group_menu` VALUES (1, 81);
INSERT INTO `ball_group_menu` VALUES (1, 82);
INSERT INTO `ball_group_menu` VALUES (1, 83);
INSERT INTO `ball_group_menu` VALUES (1, 84);
INSERT INTO `ball_group_menu` VALUES (1, 85);
INSERT INTO `ball_group_menu` VALUES (1, 86);
INSERT INTO `ball_group_menu` VALUES (1, 87);
INSERT INTO `ball_group_menu` VALUES (1, 88);
INSERT INTO `ball_group_menu` VALUES (1, 89);
INSERT INTO `ball_group_menu` VALUES (1, 90);
INSERT INTO `ball_group_menu` VALUES (1, 91);
INSERT INTO `ball_group_menu` VALUES (1, 92);
INSERT INTO `ball_group_menu` VALUES (1, 93);
INSERT INTO `ball_group_menu` VALUES (1, 94);
INSERT INTO `ball_group_menu` VALUES (1, 95);
INSERT INTO `ball_group_menu` VALUES (1, 96);
INSERT INTO `ball_group_menu` VALUES (1, 97);
INSERT INTO `ball_group_menu` VALUES (1, 98);
INSERT INTO `ball_group_menu` VALUES (1, 99);
INSERT INTO `ball_group_menu` VALUES (1, 100);
INSERT INTO `ball_group_menu` VALUES (1, 101);
INSERT INTO `ball_group_menu` VALUES (1, 102);
INSERT INTO `ball_group_menu` VALUES (1, 103);
INSERT INTO `ball_group_menu` VALUES (1, 104);
INSERT INTO `ball_group_menu` VALUES (1, 105);
INSERT INTO `ball_group_menu` VALUES (1, 106);
INSERT INTO `ball_group_menu` VALUES (1, 107);
INSERT INTO `ball_group_menu` VALUES (1, 108);
INSERT INTO `ball_group_menu` VALUES (1, 109);
INSERT INTO `ball_group_menu` VALUES (1, 110);
INSERT INTO `ball_group_menu` VALUES (1, 111);
INSERT INTO `ball_group_menu` VALUES (1, 112);
INSERT INTO `ball_group_menu` VALUES (1, 113);
INSERT INTO `ball_group_menu` VALUES (1, 114);
INSERT INTO `ball_group_menu` VALUES (1, 115);
INSERT INTO `ball_group_menu` VALUES (1, 116);
INSERT INTO `ball_group_menu` VALUES (1, 117);
INSERT INTO `ball_group_menu` VALUES (1, 118);
INSERT INTO `ball_group_menu` VALUES (1, 119);
INSERT INTO `ball_group_menu` VALUES (1, 120);
INSERT INTO `ball_group_menu` VALUES (1, 121);
INSERT INTO `ball_group_menu` VALUES (1, 122);
INSERT INTO `ball_group_menu` VALUES (1, 123);
INSERT INTO `ball_group_menu` VALUES (1, 124);
INSERT INTO `ball_group_menu` VALUES (1, 125);
INSERT INTO `ball_group_menu` VALUES (1, 126);
INSERT INTO `ball_group_menu` VALUES (1, 127);
INSERT INTO `ball_group_menu` VALUES (1, 128);
INSERT INTO `ball_group_menu` VALUES (1, 129);
INSERT INTO `ball_group_menu` VALUES (1, 130);
INSERT INTO `ball_group_menu` VALUES (1, 131);
INSERT INTO `ball_group_menu` VALUES (1, 132);
INSERT INTO `ball_group_menu` VALUES (1, 133);
INSERT INTO `ball_group_menu` VALUES (1, 134);
INSERT INTO `ball_group_menu` VALUES (1, 135);
INSERT INTO `ball_group_menu` VALUES (1, 136);
INSERT INTO `ball_group_menu` VALUES (1, 137);
INSERT INTO `ball_group_menu` VALUES (1, 138);
INSERT INTO `ball_group_menu` VALUES (1, 139);
INSERT INTO `ball_group_menu` VALUES (1, 140);
INSERT INTO `ball_group_menu` VALUES (1, 141);
INSERT INTO `ball_group_menu` VALUES (1, 142);
INSERT INTO `ball_group_menu` VALUES (1, 143);
INSERT INTO `ball_group_menu` VALUES (1, 144);
INSERT INTO `ball_group_menu` VALUES (1, 145);
INSERT INTO `ball_group_menu` VALUES (1, 146);
INSERT INTO `ball_group_menu` VALUES (1, 147);
INSERT INTO `ball_group_menu` VALUES (1, 148);
INSERT INTO `ball_group_menu` VALUES (1, 149);
INSERT INTO `ball_group_menu` VALUES (1, 150);
INSERT INTO `ball_group_menu` VALUES (1, 151);
INSERT INTO `ball_group_menu` VALUES (1, 152);
INSERT INTO `ball_group_menu` VALUES (1, 153);
INSERT INTO `ball_group_menu` VALUES (1, 154);
INSERT INTO `ball_group_menu` VALUES (1, 155);
INSERT INTO `ball_group_menu` VALUES (1, 156);
INSERT INTO `ball_group_menu` VALUES (1, 157);
INSERT INTO `ball_group_menu` VALUES (1, 158);
INSERT INTO `ball_group_menu` VALUES (1, 159);
INSERT INTO `ball_group_menu` VALUES (1, 160);
INSERT INTO `ball_group_menu` VALUES (1, 161);
INSERT INTO `ball_group_menu` VALUES (1, 162);
INSERT INTO `ball_group_menu` VALUES (1, 163);
INSERT INTO `ball_group_menu` VALUES (1, 164);
INSERT INTO `ball_group_menu` VALUES (1, 165);
INSERT INTO `ball_group_menu` VALUES (1, 166);
INSERT INTO `ball_group_menu` VALUES (1, 167);
INSERT INTO `ball_group_menu` VALUES (1, 168);
INSERT INTO `ball_group_menu` VALUES (1, 169);
INSERT INTO `ball_group_menu` VALUES (1, 170);
INSERT INTO `ball_group_menu` VALUES (1, 171);
INSERT INTO `ball_group_menu` VALUES (1, 172);
INSERT INTO `ball_group_menu` VALUES (1, 173);
INSERT INTO `ball_group_menu` VALUES (1, 177);
INSERT INTO `ball_group_menu` VALUES (1, 178);
INSERT INTO `ball_group_menu` VALUES (1, 179);
INSERT INTO `ball_group_menu` VALUES (1, 180);
INSERT INTO `ball_group_menu` VALUES (1, 181);
INSERT INTO `ball_group_menu` VALUES (1, 182);
INSERT INTO `ball_group_menu` VALUES (1, 183);
INSERT INTO `ball_group_menu` VALUES (1, 184);
INSERT INTO `ball_group_menu` VALUES (1, 185);
INSERT INTO `ball_group_menu` VALUES (7, 11);
INSERT INTO `ball_group_menu` VALUES (7, 13);
INSERT INTO `ball_group_menu` VALUES (7, 14);
INSERT INTO `ball_group_menu` VALUES (7, 15);
INSERT INTO `ball_group_menu` VALUES (7, 16);
INSERT INTO `ball_group_menu` VALUES (7, 17);
INSERT INTO `ball_group_menu` VALUES (7, 18);
INSERT INTO `ball_group_menu` VALUES (7, 19);
INSERT INTO `ball_group_menu` VALUES (7, 20);
INSERT INTO `ball_group_menu` VALUES (7, 21);
INSERT INTO `ball_group_menu` VALUES (7, 149);
INSERT INTO `ball_group_menu` VALUES (7, 177);
INSERT INTO `ball_group_menu` VALUES (7, 173);
INSERT INTO `ball_group_menu` VALUES (7, 22);
INSERT INTO `ball_group_menu` VALUES (7, 23);
INSERT INTO `ball_group_menu` VALUES (7, 24);
INSERT INTO `ball_group_menu` VALUES (7, 25);
INSERT INTO `ball_group_menu` VALUES (7, 26);
INSERT INTO `ball_group_menu` VALUES (7, 27);
INSERT INTO `ball_group_menu` VALUES (7, 28);
INSERT INTO `ball_group_menu` VALUES (7, 29);
INSERT INTO `ball_group_menu` VALUES (7, 155);
INSERT INTO `ball_group_menu` VALUES (7, 161);
INSERT INTO `ball_group_menu` VALUES (7, 162);
INSERT INTO `ball_group_menu` VALUES (7, 179);
INSERT INTO `ball_group_menu` VALUES (7, 30);
INSERT INTO `ball_group_menu` VALUES (7, 31);
INSERT INTO `ball_group_menu` VALUES (7, 32);
INSERT INTO `ball_group_menu` VALUES (7, 33);
INSERT INTO `ball_group_menu` VALUES (7, 34);
INSERT INTO `ball_group_menu` VALUES (7, 35);
INSERT INTO `ball_group_menu` VALUES (7, 36);
INSERT INTO `ball_group_menu` VALUES (7, 37);
INSERT INTO `ball_group_menu` VALUES (7, 38);
INSERT INTO `ball_group_menu` VALUES (7, 47);
INSERT INTO `ball_group_menu` VALUES (7, 48);
INSERT INTO `ball_group_menu` VALUES (7, 53);
INSERT INTO `ball_group_menu` VALUES (7, 54);
INSERT INTO `ball_group_menu` VALUES (7, 55);
INSERT INTO `ball_group_menu` VALUES (7, 56);
INSERT INTO `ball_group_menu` VALUES (7, 57);
INSERT INTO `ball_group_menu` VALUES (7, 58);
INSERT INTO `ball_group_menu` VALUES (7, 59);
INSERT INTO `ball_group_menu` VALUES (7, 60);
INSERT INTO `ball_group_menu` VALUES (7, 61);
INSERT INTO `ball_group_menu` VALUES (7, 62);
INSERT INTO `ball_group_menu` VALUES (7, 63);
INSERT INTO `ball_group_menu` VALUES (7, 64);
INSERT INTO `ball_group_menu` VALUES (7, 65);
INSERT INTO `ball_group_menu` VALUES (7, 66);
INSERT INTO `ball_group_menu` VALUES (7, 168);
INSERT INTO `ball_group_menu` VALUES (7, 169);
INSERT INTO `ball_group_menu` VALUES (7, 170);
INSERT INTO `ball_group_menu` VALUES (7, 171);
INSERT INTO `ball_group_menu` VALUES (7, 172);
INSERT INTO `ball_group_menu` VALUES (7, 67);
INSERT INTO `ball_group_menu` VALUES (7, 68);
INSERT INTO `ball_group_menu` VALUES (7, 69);
INSERT INTO `ball_group_menu` VALUES (7, 70);
INSERT INTO `ball_group_menu` VALUES (7, 71);
INSERT INTO `ball_group_menu` VALUES (7, 72);
INSERT INTO `ball_group_menu` VALUES (7, 73);
INSERT INTO `ball_group_menu` VALUES (7, 74);
INSERT INTO `ball_group_menu` VALUES (7, 75);
INSERT INTO `ball_group_menu` VALUES (7, 76);
INSERT INTO `ball_group_menu` VALUES (7, 77);
INSERT INTO `ball_group_menu` VALUES (7, 78);
INSERT INTO `ball_group_menu` VALUES (7, 79);
INSERT INTO `ball_group_menu` VALUES (7, 80);
INSERT INTO `ball_group_menu` VALUES (7, 81);
INSERT INTO `ball_group_menu` VALUES (7, 82);
INSERT INTO `ball_group_menu` VALUES (7, 83);
INSERT INTO `ball_group_menu` VALUES (7, 84);
INSERT INTO `ball_group_menu` VALUES (7, 85);
INSERT INTO `ball_group_menu` VALUES (7, 86);
INSERT INTO `ball_group_menu` VALUES (7, 87);
INSERT INTO `ball_group_menu` VALUES (7, 88);
INSERT INTO `ball_group_menu` VALUES (7, 89);
INSERT INTO `ball_group_menu` VALUES (7, 90);
INSERT INTO `ball_group_menu` VALUES (7, 91);
INSERT INTO `ball_group_menu` VALUES (7, 92);
INSERT INTO `ball_group_menu` VALUES (7, 93);
INSERT INTO `ball_group_menu` VALUES (7, 94);
INSERT INTO `ball_group_menu` VALUES (7, 95);
INSERT INTO `ball_group_menu` VALUES (7, 96);
INSERT INTO `ball_group_menu` VALUES (7, 97);
INSERT INTO `ball_group_menu` VALUES (7, 150);
INSERT INTO `ball_group_menu` VALUES (7, 151);
INSERT INTO `ball_group_menu` VALUES (7, 152);
INSERT INTO `ball_group_menu` VALUES (7, 153);
INSERT INTO `ball_group_menu` VALUES (7, 154);
INSERT INTO `ball_group_menu` VALUES (7, 98);
INSERT INTO `ball_group_menu` VALUES (7, 99);
INSERT INTO `ball_group_menu` VALUES (7, 100);
INSERT INTO `ball_group_menu` VALUES (7, 101);
INSERT INTO `ball_group_menu` VALUES (7, 102);
INSERT INTO `ball_group_menu` VALUES (7, 103);
INSERT INTO `ball_group_menu` VALUES (7, 104);
INSERT INTO `ball_group_menu` VALUES (7, 105);
INSERT INTO `ball_group_menu` VALUES (7, 106);
INSERT INTO `ball_group_menu` VALUES (7, 107);
INSERT INTO `ball_group_menu` VALUES (7, 108);
INSERT INTO `ball_group_menu` VALUES (7, 109);
INSERT INTO `ball_group_menu` VALUES (7, 110);
INSERT INTO `ball_group_menu` VALUES (7, 111);
INSERT INTO `ball_group_menu` VALUES (7, 112);
INSERT INTO `ball_group_menu` VALUES (7, 113);
INSERT INTO `ball_group_menu` VALUES (7, 114);
INSERT INTO `ball_group_menu` VALUES (7, 115);
INSERT INTO `ball_group_menu` VALUES (7, 116);
INSERT INTO `ball_group_menu` VALUES (7, 137);
INSERT INTO `ball_group_menu` VALUES (7, 138);
INSERT INTO `ball_group_menu` VALUES (7, 139);
INSERT INTO `ball_group_menu` VALUES (7, 140);
INSERT INTO `ball_group_menu` VALUES (7, 141);
INSERT INTO `ball_group_menu` VALUES (7, 142);
INSERT INTO `ball_group_menu` VALUES (7, 163);
INSERT INTO `ball_group_menu` VALUES (7, 164);
INSERT INTO `ball_group_menu` VALUES (7, 165);
INSERT INTO `ball_group_menu` VALUES (7, 166);
INSERT INTO `ball_group_menu` VALUES (7, 167);
INSERT INTO `ball_group_menu` VALUES (7, 144);
INSERT INTO `ball_group_menu` VALUES (7, 145);
INSERT INTO `ball_group_menu` VALUES (7, 146);
INSERT INTO `ball_group_menu` VALUES (7, 9);
INSERT INTO `ball_group_menu` VALUES (7, 1);
INSERT INTO `ball_group_menu` VALUES (7, 2);
INSERT INTO `ball_group_menu` VALUES (7, 3);
INSERT INTO `ball_group_menu` VALUES (7, 4);
INSERT INTO `ball_group_menu` VALUES (7, 5);
INSERT INTO `ball_group_menu` VALUES (7, 6);
INSERT INTO `ball_group_menu` VALUES (7, 7);
INSERT INTO `ball_group_menu` VALUES (7, 8);
INSERT INTO `ball_group_menu` VALUES (7, 10);
INSERT INTO `ball_group_menu` VALUES (7, 39);
INSERT INTO `ball_group_menu` VALUES (7, 117);
INSERT INTO `ball_group_menu` VALUES (7, 143);
INSERT INTO `ball_group_menu` VALUES (8, 11);
INSERT INTO `ball_group_menu` VALUES (8, 13);
INSERT INTO `ball_group_menu` VALUES (8, 14);
INSERT INTO `ball_group_menu` VALUES (8, 15);
INSERT INTO `ball_group_menu` VALUES (8, 16);
INSERT INTO `ball_group_menu` VALUES (8, 17);
INSERT INTO `ball_group_menu` VALUES (8, 18);
INSERT INTO `ball_group_menu` VALUES (8, 19);
INSERT INTO `ball_group_menu` VALUES (8, 20);
INSERT INTO `ball_group_menu` VALUES (8, 21);
INSERT INTO `ball_group_menu` VALUES (8, 149);
INSERT INTO `ball_group_menu` VALUES (8, 177);
INSERT INTO `ball_group_menu` VALUES (8, 173);
INSERT INTO `ball_group_menu` VALUES (8, 22);
INSERT INTO `ball_group_menu` VALUES (8, 23);
INSERT INTO `ball_group_menu` VALUES (8, 24);
INSERT INTO `ball_group_menu` VALUES (8, 25);
INSERT INTO `ball_group_menu` VALUES (8, 26);
INSERT INTO `ball_group_menu` VALUES (8, 27);
INSERT INTO `ball_group_menu` VALUES (8, 28);
INSERT INTO `ball_group_menu` VALUES (8, 29);
INSERT INTO `ball_group_menu` VALUES (8, 155);
INSERT INTO `ball_group_menu` VALUES (8, 161);
INSERT INTO `ball_group_menu` VALUES (8, 162);
INSERT INTO `ball_group_menu` VALUES (8, 179);
INSERT INTO `ball_group_menu` VALUES (8, 30);
INSERT INTO `ball_group_menu` VALUES (8, 31);
INSERT INTO `ball_group_menu` VALUES (8, 32);
INSERT INTO `ball_group_menu` VALUES (8, 33);
INSERT INTO `ball_group_menu` VALUES (8, 34);
INSERT INTO `ball_group_menu` VALUES (8, 35);
INSERT INTO `ball_group_menu` VALUES (8, 36);
INSERT INTO `ball_group_menu` VALUES (8, 37);
INSERT INTO `ball_group_menu` VALUES (8, 38);
INSERT INTO `ball_group_menu` VALUES (8, 47);
INSERT INTO `ball_group_menu` VALUES (8, 48);
INSERT INTO `ball_group_menu` VALUES (8, 53);
INSERT INTO `ball_group_menu` VALUES (8, 54);
INSERT INTO `ball_group_menu` VALUES (8, 55);
INSERT INTO `ball_group_menu` VALUES (8, 56);
INSERT INTO `ball_group_menu` VALUES (8, 57);
INSERT INTO `ball_group_menu` VALUES (8, 58);
INSERT INTO `ball_group_menu` VALUES (8, 59);
INSERT INTO `ball_group_menu` VALUES (8, 60);
INSERT INTO `ball_group_menu` VALUES (8, 61);
INSERT INTO `ball_group_menu` VALUES (8, 62);
INSERT INTO `ball_group_menu` VALUES (8, 63);
INSERT INTO `ball_group_menu` VALUES (8, 64);
INSERT INTO `ball_group_menu` VALUES (8, 65);
INSERT INTO `ball_group_menu` VALUES (8, 66);
INSERT INTO `ball_group_menu` VALUES (8, 168);
INSERT INTO `ball_group_menu` VALUES (8, 169);
INSERT INTO `ball_group_menu` VALUES (8, 170);
INSERT INTO `ball_group_menu` VALUES (8, 171);
INSERT INTO `ball_group_menu` VALUES (8, 172);
INSERT INTO `ball_group_menu` VALUES (8, 67);
INSERT INTO `ball_group_menu` VALUES (8, 68);
INSERT INTO `ball_group_menu` VALUES (8, 69);
INSERT INTO `ball_group_menu` VALUES (8, 70);
INSERT INTO `ball_group_menu` VALUES (8, 71);
INSERT INTO `ball_group_menu` VALUES (8, 72);
INSERT INTO `ball_group_menu` VALUES (8, 73);
INSERT INTO `ball_group_menu` VALUES (8, 74);
INSERT INTO `ball_group_menu` VALUES (8, 75);
INSERT INTO `ball_group_menu` VALUES (8, 76);
INSERT INTO `ball_group_menu` VALUES (8, 77);
INSERT INTO `ball_group_menu` VALUES (8, 78);
INSERT INTO `ball_group_menu` VALUES (8, 79);
INSERT INTO `ball_group_menu` VALUES (8, 80);
INSERT INTO `ball_group_menu` VALUES (8, 81);
INSERT INTO `ball_group_menu` VALUES (8, 82);
INSERT INTO `ball_group_menu` VALUES (8, 83);
INSERT INTO `ball_group_menu` VALUES (8, 84);
INSERT INTO `ball_group_menu` VALUES (8, 85);
INSERT INTO `ball_group_menu` VALUES (8, 86);
INSERT INTO `ball_group_menu` VALUES (8, 87);
INSERT INTO `ball_group_menu` VALUES (8, 88);
INSERT INTO `ball_group_menu` VALUES (8, 89);
INSERT INTO `ball_group_menu` VALUES (8, 90);
INSERT INTO `ball_group_menu` VALUES (8, 91);
INSERT INTO `ball_group_menu` VALUES (8, 92);
INSERT INTO `ball_group_menu` VALUES (8, 93);
INSERT INTO `ball_group_menu` VALUES (8, 94);
INSERT INTO `ball_group_menu` VALUES (8, 95);
INSERT INTO `ball_group_menu` VALUES (8, 96);
INSERT INTO `ball_group_menu` VALUES (8, 97);
INSERT INTO `ball_group_menu` VALUES (8, 150);
INSERT INTO `ball_group_menu` VALUES (8, 151);
INSERT INTO `ball_group_menu` VALUES (8, 152);
INSERT INTO `ball_group_menu` VALUES (8, 153);
INSERT INTO `ball_group_menu` VALUES (8, 154);
INSERT INTO `ball_group_menu` VALUES (8, 98);
INSERT INTO `ball_group_menu` VALUES (8, 99);
INSERT INTO `ball_group_menu` VALUES (8, 100);
INSERT INTO `ball_group_menu` VALUES (8, 101);
INSERT INTO `ball_group_menu` VALUES (8, 102);
INSERT INTO `ball_group_menu` VALUES (8, 103);
INSERT INTO `ball_group_menu` VALUES (8, 104);
INSERT INTO `ball_group_menu` VALUES (8, 105);
INSERT INTO `ball_group_menu` VALUES (8, 106);
INSERT INTO `ball_group_menu` VALUES (8, 107);
INSERT INTO `ball_group_menu` VALUES (8, 108);
INSERT INTO `ball_group_menu` VALUES (8, 109);
INSERT INTO `ball_group_menu` VALUES (8, 110);
INSERT INTO `ball_group_menu` VALUES (8, 111);
INSERT INTO `ball_group_menu` VALUES (8, 112);
INSERT INTO `ball_group_menu` VALUES (8, 113);
INSERT INTO `ball_group_menu` VALUES (8, 114);
INSERT INTO `ball_group_menu` VALUES (8, 115);
INSERT INTO `ball_group_menu` VALUES (8, 116);
INSERT INTO `ball_group_menu` VALUES (8, 137);
INSERT INTO `ball_group_menu` VALUES (8, 138);
INSERT INTO `ball_group_menu` VALUES (8, 139);
INSERT INTO `ball_group_menu` VALUES (8, 140);
INSERT INTO `ball_group_menu` VALUES (8, 141);
INSERT INTO `ball_group_menu` VALUES (8, 142);
INSERT INTO `ball_group_menu` VALUES (8, 163);
INSERT INTO `ball_group_menu` VALUES (8, 164);
INSERT INTO `ball_group_menu` VALUES (8, 165);
INSERT INTO `ball_group_menu` VALUES (8, 166);
INSERT INTO `ball_group_menu` VALUES (8, 167);
INSERT INTO `ball_group_menu` VALUES (8, 144);
INSERT INTO `ball_group_menu` VALUES (8, 145);
INSERT INTO `ball_group_menu` VALUES (8, 146);
INSERT INTO `ball_group_menu` VALUES (8, 9);
INSERT INTO `ball_group_menu` VALUES (8, 1);
INSERT INTO `ball_group_menu` VALUES (8, 2);
INSERT INTO `ball_group_menu` VALUES (8, 3);
INSERT INTO `ball_group_menu` VALUES (8, 4);
INSERT INTO `ball_group_menu` VALUES (8, 5);
INSERT INTO `ball_group_menu` VALUES (8, 6);
INSERT INTO `ball_group_menu` VALUES (8, 7);
INSERT INTO `ball_group_menu` VALUES (8, 8);
INSERT INTO `ball_group_menu` VALUES (8, 10);
INSERT INTO `ball_group_menu` VALUES (8, 39);
INSERT INTO `ball_group_menu` VALUES (8, 117);
INSERT INTO `ball_group_menu` VALUES (8, 143);
INSERT INTO `ball_group_menu` VALUES (1, 187);
INSERT INTO `ball_group_menu` VALUES (4, 10);
INSERT INTO `ball_group_menu` VALUES (4, 11);
INSERT INTO `ball_group_menu` VALUES (4, 13);
INSERT INTO `ball_group_menu` VALUES (4, 14);
INSERT INTO `ball_group_menu` VALUES (4, 15);
INSERT INTO `ball_group_menu` VALUES (4, 16);
INSERT INTO `ball_group_menu` VALUES (4, 17);
INSERT INTO `ball_group_menu` VALUES (4, 18);
INSERT INTO `ball_group_menu` VALUES (4, 19);
INSERT INTO `ball_group_menu` VALUES (4, 20);
INSERT INTO `ball_group_menu` VALUES (4, 21);
INSERT INTO `ball_group_menu` VALUES (4, 149);
INSERT INTO `ball_group_menu` VALUES (4, 177);
INSERT INTO `ball_group_menu` VALUES (4, 12);
INSERT INTO `ball_group_menu` VALUES (4, 173);
INSERT INTO `ball_group_menu` VALUES (4, 22);
INSERT INTO `ball_group_menu` VALUES (4, 23);
INSERT INTO `ball_group_menu` VALUES (4, 24);
INSERT INTO `ball_group_menu` VALUES (4, 25);
INSERT INTO `ball_group_menu` VALUES (4, 26);
INSERT INTO `ball_group_menu` VALUES (4, 27);
INSERT INTO `ball_group_menu` VALUES (4, 28);
INSERT INTO `ball_group_menu` VALUES (4, 29);
INSERT INTO `ball_group_menu` VALUES (4, 155);
INSERT INTO `ball_group_menu` VALUES (4, 161);
INSERT INTO `ball_group_menu` VALUES (4, 162);
INSERT INTO `ball_group_menu` VALUES (4, 179);
INSERT INTO `ball_group_menu` VALUES (4, 30);
INSERT INTO `ball_group_menu` VALUES (4, 31);
INSERT INTO `ball_group_menu` VALUES (4, 32);
INSERT INTO `ball_group_menu` VALUES (4, 33);
INSERT INTO `ball_group_menu` VALUES (4, 34);
INSERT INTO `ball_group_menu` VALUES (4, 35);
INSERT INTO `ball_group_menu` VALUES (4, 36);
INSERT INTO `ball_group_menu` VALUES (4, 37);
INSERT INTO `ball_group_menu` VALUES (4, 38);
INSERT INTO `ball_group_menu` VALUES (4, 39);
INSERT INTO `ball_group_menu` VALUES (4, 40);
INSERT INTO `ball_group_menu` VALUES (4, 41);
INSERT INTO `ball_group_menu` VALUES (4, 42);
INSERT INTO `ball_group_menu` VALUES (4, 43);
INSERT INTO `ball_group_menu` VALUES (4, 44);
INSERT INTO `ball_group_menu` VALUES (4, 45);
INSERT INTO `ball_group_menu` VALUES (4, 46);
INSERT INTO `ball_group_menu` VALUES (4, 47);
INSERT INTO `ball_group_menu` VALUES (4, 48);
INSERT INTO `ball_group_menu` VALUES (4, 49);
INSERT INTO `ball_group_menu` VALUES (4, 50);
INSERT INTO `ball_group_menu` VALUES (4, 51);
INSERT INTO `ball_group_menu` VALUES (4, 52);
INSERT INTO `ball_group_menu` VALUES (4, 178);
INSERT INTO `ball_group_menu` VALUES (4, 53);
INSERT INTO `ball_group_menu` VALUES (4, 54);
INSERT INTO `ball_group_menu` VALUES (4, 55);
INSERT INTO `ball_group_menu` VALUES (4, 56);
INSERT INTO `ball_group_menu` VALUES (4, 57);
INSERT INTO `ball_group_menu` VALUES (4, 58);
INSERT INTO `ball_group_menu` VALUES (4, 59);
INSERT INTO `ball_group_menu` VALUES (4, 60);
INSERT INTO `ball_group_menu` VALUES (4, 61);
INSERT INTO `ball_group_menu` VALUES (4, 62);
INSERT INTO `ball_group_menu` VALUES (4, 63);
INSERT INTO `ball_group_menu` VALUES (4, 64);
INSERT INTO `ball_group_menu` VALUES (4, 65);
INSERT INTO `ball_group_menu` VALUES (4, 66);
INSERT INTO `ball_group_menu` VALUES (4, 168);
INSERT INTO `ball_group_menu` VALUES (4, 169);
INSERT INTO `ball_group_menu` VALUES (4, 170);
INSERT INTO `ball_group_menu` VALUES (4, 171);
INSERT INTO `ball_group_menu` VALUES (4, 172);
INSERT INTO `ball_group_menu` VALUES (4, 68);
INSERT INTO `ball_group_menu` VALUES (4, 69);
INSERT INTO `ball_group_menu` VALUES (4, 70);
INSERT INTO `ball_group_menu` VALUES (4, 71);
INSERT INTO `ball_group_menu` VALUES (4, 72);
INSERT INTO `ball_group_menu` VALUES (4, 73);
INSERT INTO `ball_group_menu` VALUES (4, 74);
INSERT INTO `ball_group_menu` VALUES (4, 75);
INSERT INTO `ball_group_menu` VALUES (4, 76);
INSERT INTO `ball_group_menu` VALUES (4, 77);
INSERT INTO `ball_group_menu` VALUES (4, 78);
INSERT INTO `ball_group_menu` VALUES (4, 79);
INSERT INTO `ball_group_menu` VALUES (4, 80);
INSERT INTO `ball_group_menu` VALUES (4, 81);
INSERT INTO `ball_group_menu` VALUES (4, 82);
INSERT INTO `ball_group_menu` VALUES (4, 83);
INSERT INTO `ball_group_menu` VALUES (4, 84);
INSERT INTO `ball_group_menu` VALUES (4, 85);
INSERT INTO `ball_group_menu` VALUES (4, 86);
INSERT INTO `ball_group_menu` VALUES (4, 87);
INSERT INTO `ball_group_menu` VALUES (4, 88);
INSERT INTO `ball_group_menu` VALUES (4, 89);
INSERT INTO `ball_group_menu` VALUES (4, 90);
INSERT INTO `ball_group_menu` VALUES (4, 91);
INSERT INTO `ball_group_menu` VALUES (4, 92);
INSERT INTO `ball_group_menu` VALUES (4, 93);
INSERT INTO `ball_group_menu` VALUES (4, 94);
INSERT INTO `ball_group_menu` VALUES (4, 95);
INSERT INTO `ball_group_menu` VALUES (4, 187);
INSERT INTO `ball_group_menu` VALUES (4, 96);
INSERT INTO `ball_group_menu` VALUES (4, 97);
INSERT INTO `ball_group_menu` VALUES (4, 150);
INSERT INTO `ball_group_menu` VALUES (4, 151);
INSERT INTO `ball_group_menu` VALUES (4, 152);
INSERT INTO `ball_group_menu` VALUES (4, 153);
INSERT INTO `ball_group_menu` VALUES (4, 154);
INSERT INTO `ball_group_menu` VALUES (4, 184);
INSERT INTO `ball_group_menu` VALUES (4, 98);
INSERT INTO `ball_group_menu` VALUES (4, 99);
INSERT INTO `ball_group_menu` VALUES (4, 100);
INSERT INTO `ball_group_menu` VALUES (4, 101);
INSERT INTO `ball_group_menu` VALUES (4, 102);
INSERT INTO `ball_group_menu` VALUES (4, 103);
INSERT INTO `ball_group_menu` VALUES (4, 104);
INSERT INTO `ball_group_menu` VALUES (4, 105);
INSERT INTO `ball_group_menu` VALUES (4, 106);
INSERT INTO `ball_group_menu` VALUES (4, 107);
INSERT INTO `ball_group_menu` VALUES (4, 108);
INSERT INTO `ball_group_menu` VALUES (4, 109);
INSERT INTO `ball_group_menu` VALUES (4, 110);
INSERT INTO `ball_group_menu` VALUES (4, 111);
INSERT INTO `ball_group_menu` VALUES (4, 112);
INSERT INTO `ball_group_menu` VALUES (4, 113);
INSERT INTO `ball_group_menu` VALUES (4, 114);
INSERT INTO `ball_group_menu` VALUES (4, 115);
INSERT INTO `ball_group_menu` VALUES (4, 116);
INSERT INTO `ball_group_menu` VALUES (4, 137);
INSERT INTO `ball_group_menu` VALUES (4, 138);
INSERT INTO `ball_group_menu` VALUES (4, 139);
INSERT INTO `ball_group_menu` VALUES (4, 140);
INSERT INTO `ball_group_menu` VALUES (4, 141);
INSERT INTO `ball_group_menu` VALUES (4, 142);
INSERT INTO `ball_group_menu` VALUES (4, 163);
INSERT INTO `ball_group_menu` VALUES (4, 164);
INSERT INTO `ball_group_menu` VALUES (4, 165);
INSERT INTO `ball_group_menu` VALUES (4, 166);
INSERT INTO `ball_group_menu` VALUES (4, 167);
INSERT INTO `ball_group_menu` VALUES (4, 144);
INSERT INTO `ball_group_menu` VALUES (4, 145);
INSERT INTO `ball_group_menu` VALUES (4, 146);
INSERT INTO `ball_group_menu` VALUES (4, 67);
INSERT INTO `ball_group_menu` VALUES (4, 180);
INSERT INTO `ball_group_menu` VALUES (4, 117);
INSERT INTO `ball_group_menu` VALUES (4, 143);
INSERT INTO `ball_group_menu` VALUES (1, 188);
INSERT INTO `ball_group_menu` VALUES (1, 189);
INSERT INTO `ball_group_menu` VALUES (1, 190);
INSERT INTO `ball_group_menu` VALUES (1, 191);
INSERT INTO `ball_group_menu` VALUES (1, 192);
INSERT INTO `ball_group_menu` VALUES (1, 195);
INSERT INTO `ball_group_menu` VALUES (1, 198);
INSERT INTO `ball_group_menu` VALUES (1, 201);
INSERT INTO `ball_group_menu` VALUES (1, 202);
INSERT INTO `ball_group_menu` VALUES (1, 203);
INSERT INTO `ball_group_menu` VALUES (1, 204);
INSERT INTO `ball_group_menu` VALUES (1, 205);
INSERT INTO `ball_group_menu` VALUES (1, 206);
INSERT INTO `ball_group_menu` VALUES (1, 207);
INSERT INTO `ball_group_menu` VALUES (1, 208);
INSERT INTO `ball_group_menu` VALUES (1, 209);
INSERT INTO `ball_group_menu` VALUES (1, 210);
INSERT INTO `ball_group_menu` VALUES (1, 211);
INSERT INTO `ball_group_menu` VALUES (1, 212);
INSERT INTO `ball_group_menu` VALUES (1, 213);
INSERT INTO `ball_group_menu` VALUES (1, 214);
INSERT INTO `ball_group_menu` VALUES (1, 215);
INSERT INTO `ball_group_menu` VALUES (1, 216);
INSERT INTO `ball_group_menu` VALUES (1, 217);
INSERT INTO `ball_group_menu` VALUES (1, 218);
INSERT INTO `ball_group_menu` VALUES (1, 219);
INSERT INTO `ball_group_menu` VALUES (1, 222);
INSERT INTO `ball_group_menu` VALUES (1, 223);
INSERT INTO `ball_group_menu` VALUES (1, 224);
INSERT INTO `ball_group_menu` VALUES (1, 225);
INSERT INTO `ball_group_menu` VALUES (1, 226);
INSERT INTO `ball_group_menu` VALUES (1, 229);
INSERT INTO `ball_group_menu` VALUES (1, 230);
INSERT INTO `ball_group_menu` VALUES (1, 231);
INSERT INTO `ball_group_menu` VALUES (1, 232);
INSERT INTO `ball_group_menu` VALUES (1, 233);
INSERT INTO `ball_group_menu` VALUES (1, 234);
INSERT INTO `ball_group_menu` VALUES (1, 235);
INSERT INTO `ball_group_menu` VALUES (1, 236);
INSERT INTO `ball_group_menu` VALUES (1, 237);
INSERT INTO `ball_group_menu` VALUES (1, 238);
INSERT INTO `ball_group_menu` VALUES (11, 13);
INSERT INTO `ball_group_menu` VALUES (11, 16);
INSERT INTO `ball_group_menu` VALUES (11, 17);
INSERT INTO `ball_group_menu` VALUES (11, 20);
INSERT INTO `ball_group_menu` VALUES (11, 235);
INSERT INTO `ball_group_menu` VALUES (11, 40);
INSERT INTO `ball_group_menu` VALUES (11, 41);
INSERT INTO `ball_group_menu` VALUES (11, 42);
INSERT INTO `ball_group_menu` VALUES (11, 43);
INSERT INTO `ball_group_menu` VALUES (11, 44);
INSERT INTO `ball_group_menu` VALUES (11, 45);
INSERT INTO `ball_group_menu` VALUES (11, 46);
INSERT INTO `ball_group_menu` VALUES (11, 47);
INSERT INTO `ball_group_menu` VALUES (11, 48);
INSERT INTO `ball_group_menu` VALUES (11, 49);
INSERT INTO `ball_group_menu` VALUES (11, 50);
INSERT INTO `ball_group_menu` VALUES (11, 51);
INSERT INTO `ball_group_menu` VALUES (11, 52);
INSERT INTO `ball_group_menu` VALUES (11, 178);
INSERT INTO `ball_group_menu` VALUES (11, 236);
INSERT INTO `ball_group_menu` VALUES (11, 93);
INSERT INTO `ball_group_menu` VALUES (11, 95);
INSERT INTO `ball_group_menu` VALUES (11, 10);
INSERT INTO `ball_group_menu` VALUES (11, 11);
INSERT INTO `ball_group_menu` VALUES (11, 39);
INSERT INTO `ball_group_menu` VALUES (11, 67);
INSERT INTO `ball_group_menu` VALUES (11, 92);
INSERT INTO `ball_group_menu` VALUES (1, 239);
INSERT INTO `ball_group_menu` VALUES (1, 240);
INSERT INTO `ball_group_menu` VALUES (1, 241);
INSERT INTO `ball_group_menu` VALUES (1, 242);
INSERT INTO `ball_group_menu` VALUES (1, 243);
INSERT INTO `ball_group_menu` VALUES (1, 244);
INSERT INTO `ball_group_menu` VALUES (1, 245);
INSERT INTO `ball_group_menu` VALUES (1, 246);
INSERT INTO `ball_group_menu` VALUES (1, 247);
INSERT INTO `ball_group_menu` VALUES (3, 13);
INSERT INTO `ball_group_menu` VALUES (3, 14);
INSERT INTO `ball_group_menu` VALUES (3, 15);
INSERT INTO `ball_group_menu` VALUES (3, 16);
INSERT INTO `ball_group_menu` VALUES (3, 17);
INSERT INTO `ball_group_menu` VALUES (3, 18);
INSERT INTO `ball_group_menu` VALUES (3, 19);
INSERT INTO `ball_group_menu` VALUES (3, 20);
INSERT INTO `ball_group_menu` VALUES (3, 21);
INSERT INTO `ball_group_menu` VALUES (3, 149);
INSERT INTO `ball_group_menu` VALUES (3, 177);
INSERT INTO `ball_group_menu` VALUES (3, 234);
INSERT INTO `ball_group_menu` VALUES (3, 235);
INSERT INTO `ball_group_menu` VALUES (3, 195);
INSERT INTO `ball_group_menu` VALUES (3, 203);
INSERT INTO `ball_group_menu` VALUES (3, 247);
INSERT INTO `ball_group_menu` VALUES (3, 173);
INSERT INTO `ball_group_menu` VALUES (3, 229);
INSERT INTO `ball_group_menu` VALUES (3, 230);
INSERT INTO `ball_group_menu` VALUES (3, 231);
INSERT INTO `ball_group_menu` VALUES (3, 232);
INSERT INTO `ball_group_menu` VALUES (3, 245);
INSERT INTO `ball_group_menu` VALUES (3, 23);
INSERT INTO `ball_group_menu` VALUES (3, 24);
INSERT INTO `ball_group_menu` VALUES (3, 25);
INSERT INTO `ball_group_menu` VALUES (3, 26);
INSERT INTO `ball_group_menu` VALUES (3, 27);
INSERT INTO `ball_group_menu` VALUES (3, 28);
INSERT INTO `ball_group_menu` VALUES (3, 29);
INSERT INTO `ball_group_menu` VALUES (3, 155);
INSERT INTO `ball_group_menu` VALUES (3, 161);
INSERT INTO `ball_group_menu` VALUES (3, 162);
INSERT INTO `ball_group_menu` VALUES (3, 179);
INSERT INTO `ball_group_menu` VALUES (3, 38);
INSERT INTO `ball_group_menu` VALUES (3, 42);
INSERT INTO `ball_group_menu` VALUES (3, 43);
INSERT INTO `ball_group_menu` VALUES (3, 44);
INSERT INTO `ball_group_menu` VALUES (3, 45);
INSERT INTO `ball_group_menu` VALUES (3, 46);
INSERT INTO `ball_group_menu` VALUES (3, 47);
INSERT INTO `ball_group_menu` VALUES (3, 48);
INSERT INTO `ball_group_menu` VALUES (3, 49);
INSERT INTO `ball_group_menu` VALUES (3, 50);
INSERT INTO `ball_group_menu` VALUES (3, 51);
INSERT INTO `ball_group_menu` VALUES (3, 237);
INSERT INTO `ball_group_menu` VALUES (3, 55);
INSERT INTO `ball_group_menu` VALUES (3, 56);
INSERT INTO `ball_group_menu` VALUES (3, 57);
INSERT INTO `ball_group_menu` VALUES (3, 69);
INSERT INTO `ball_group_menu` VALUES (3, 70);
INSERT INTO `ball_group_menu` VALUES (3, 71);
INSERT INTO `ball_group_menu` VALUES (3, 72);
INSERT INTO `ball_group_menu` VALUES (3, 81);
INSERT INTO `ball_group_menu` VALUES (3, 82);
INSERT INTO `ball_group_menu` VALUES (3, 86);
INSERT INTO `ball_group_menu` VALUES (3, 89);
INSERT INTO `ball_group_menu` VALUES (3, 90);
INSERT INTO `ball_group_menu` VALUES (3, 92);
INSERT INTO `ball_group_menu` VALUES (3, 93);
INSERT INTO `ball_group_menu` VALUES (3, 94);
INSERT INTO `ball_group_menu` VALUES (3, 95);
INSERT INTO `ball_group_menu` VALUES (3, 187);
INSERT INTO `ball_group_menu` VALUES (3, 96);
INSERT INTO `ball_group_menu` VALUES (3, 97);
INSERT INTO `ball_group_menu` VALUES (3, 151);
INSERT INTO `ball_group_menu` VALUES (3, 152);
INSERT INTO `ball_group_menu` VALUES (3, 181);
INSERT INTO `ball_group_menu` VALUES (3, 182);
INSERT INTO `ball_group_menu` VALUES (3, 184);
INSERT INTO `ball_group_menu` VALUES (3, 185);
INSERT INTO `ball_group_menu` VALUES (3, 144);
INSERT INTO `ball_group_menu` VALUES (3, 145);
INSERT INTO `ball_group_menu` VALUES (3, 146);
INSERT INTO `ball_group_menu` VALUES (3, 10);
INSERT INTO `ball_group_menu` VALUES (3, 11);
INSERT INTO `ball_group_menu` VALUES (3, 22);
INSERT INTO `ball_group_menu` VALUES (3, 35);
INSERT INTO `ball_group_menu` VALUES (3, 39);
INSERT INTO `ball_group_menu` VALUES (3, 53);
INSERT INTO `ball_group_menu` VALUES (3, 54);
INSERT INTO `ball_group_menu` VALUES (3, 67);
INSERT INTO `ball_group_menu` VALUES (3, 68);
INSERT INTO `ball_group_menu` VALUES (3, 80);
INSERT INTO `ball_group_menu` VALUES (3, 85);
INSERT INTO `ball_group_menu` VALUES (3, 88);
INSERT INTO `ball_group_menu` VALUES (3, 150);
INSERT INTO `ball_group_menu` VALUES (3, 180);
INSERT INTO `ball_group_menu` VALUES (3, 143);
INSERT INTO `ball_group_menu` VALUES (1, 249);
INSERT INTO `ball_group_menu` VALUES (1, 251);
INSERT INTO `ball_group_menu` VALUES (1, 250);
INSERT INTO `ball_group_menu` VALUES (1, 248);
INSERT INTO `ball_group_menu` VALUES (1, 252);
INSERT INTO `ball_group_menu` VALUES (1, 253);
INSERT INTO `ball_group_menu` VALUES (1, 254);
INSERT INTO `ball_group_menu` VALUES (1, 255);
INSERT INTO `ball_group_menu` VALUES (1, 256);
INSERT INTO `ball_group_menu` VALUES (1, 257);
INSERT INTO `ball_group_menu` VALUES (1, 258);
INSERT INTO `ball_group_menu` VALUES (1, 259);
INSERT INTO `ball_group_menu` VALUES (1, 260);
INSERT INTO `ball_group_menu` VALUES (1, 261);
INSERT INTO `ball_group_menu` VALUES (1, 262);
INSERT INTO `ball_group_menu` VALUES (1, 263);
INSERT INTO `ball_group_menu` VALUES (1, 264);
INSERT INTO `ball_group_menu` VALUES (1, 265);
INSERT INTO `ball_group_menu` VALUES (1, 266);
INSERT INTO `ball_group_menu` VALUES (1, 267);
INSERT INTO `ball_group_menu` VALUES (1, 268);
INSERT INTO `ball_group_menu` VALUES (1, 269);
INSERT INTO `ball_group_menu` VALUES (1, 270);
INSERT INTO `ball_group_menu` VALUES (1, 271);
INSERT INTO `ball_group_menu` VALUES (1, 272);
INSERT INTO `ball_group_menu` VALUES (1, 273);
INSERT INTO `ball_group_menu` VALUES (1, 274);
INSERT INTO `ball_group_menu` VALUES (1, 275);
INSERT INTO `ball_group_menu` VALUES (1, 276);
INSERT INTO `ball_group_menu` VALUES (1, 277);
INSERT INTO `ball_group_menu` VALUES (1, 278);
INSERT INTO `ball_group_menu` VALUES (1, 279);
INSERT INTO `ball_group_menu` VALUES (1, 280);
INSERT INTO `ball_group_menu` VALUES (1, 281);
INSERT INTO `ball_group_menu` VALUES (1, 282);
INSERT INTO `ball_group_menu` VALUES (1, 283);
INSERT INTO `ball_group_menu` VALUES (1, 284);
INSERT INTO `ball_group_menu` VALUES (1, 285);
INSERT INTO `ball_group_menu` VALUES (1, 286);
INSERT INTO `ball_group_menu` VALUES (2, 281);
INSERT INTO `ball_group_menu` VALUES (2, 266);
INSERT INTO `ball_group_menu` VALUES (2, 264);
INSERT INTO `ball_group_menu` VALUES (2, 273);
INSERT INTO `ball_group_menu` VALUES (2, 282);
INSERT INTO `ball_group_menu` VALUES (2, 271);
INSERT INTO `ball_group_menu` VALUES (2, 251);
INSERT INTO `ball_group_menu` VALUES (2, 270);
INSERT INTO `ball_group_menu` VALUES (2, 14);
INSERT INTO `ball_group_menu` VALUES (2, 15);
INSERT INTO `ball_group_menu` VALUES (2, 16);
INSERT INTO `ball_group_menu` VALUES (2, 177);
INSERT INTO `ball_group_menu` VALUES (2, 284);
INSERT INTO `ball_group_menu` VALUES (2, 286);
INSERT INTO `ball_group_menu` VALUES (2, 29);
INSERT INTO `ball_group_menu` VALUES (2, 31);
INSERT INTO `ball_group_menu` VALUES (2, 38);
INSERT INTO `ball_group_menu` VALUES (2, 55);
INSERT INTO `ball_group_menu` VALUES (2, 47);
INSERT INTO `ball_group_menu` VALUES (2, 81);
INSERT INTO `ball_group_menu` VALUES (2, 86);
INSERT INTO `ball_group_menu` VALUES (2, 89);
INSERT INTO `ball_group_menu` VALUES (2, 93);
INSERT INTO `ball_group_menu` VALUES (2, 96);
INSERT INTO `ball_group_menu` VALUES (2, 97);
INSERT INTO `ball_group_menu` VALUES (2, 151);
INSERT INTO `ball_group_menu` VALUES (2, 144);
INSERT INTO `ball_group_menu` VALUES (2, 145);
INSERT INTO `ball_group_menu` VALUES (2, 146);
INSERT INTO `ball_group_menu` VALUES (2, 259);
INSERT INTO `ball_group_menu` VALUES (2, 261);
INSERT INTO `ball_group_menu` VALUES (2, 262);
INSERT INTO `ball_group_menu` VALUES (2, 272);
INSERT INTO `ball_group_menu` VALUES (2, 248);
INSERT INTO `ball_group_menu` VALUES (2, 10);
INSERT INTO `ball_group_menu` VALUES (2, 11);
INSERT INTO `ball_group_menu` VALUES (2, 283);
INSERT INTO `ball_group_menu` VALUES (2, 22);
INSERT INTO `ball_group_menu` VALUES (2, 23);
INSERT INTO `ball_group_menu` VALUES (2, 30);
INSERT INTO `ball_group_menu` VALUES (2, 35);
INSERT INTO `ball_group_menu` VALUES (2, 54);
INSERT INTO `ball_group_menu` VALUES (2, 39);
INSERT INTO `ball_group_menu` VALUES (2, 67);
INSERT INTO `ball_group_menu` VALUES (2, 80);
INSERT INTO `ball_group_menu` VALUES (2, 85);
INSERT INTO `ball_group_menu` VALUES (2, 88);
INSERT INTO `ball_group_menu` VALUES (2, 92);
INSERT INTO `ball_group_menu` VALUES (2, 150);
INSERT INTO `ball_group_menu` VALUES (2, 143);
INSERT INTO `ball_group_menu` VALUES (6, 261);
INSERT INTO `ball_group_menu` VALUES (6, 265);
INSERT INTO `ball_group_menu` VALUES (6, 281);
INSERT INTO `ball_group_menu` VALUES (6, 262);
INSERT INTO `ball_group_menu` VALUES (6, 263);
INSERT INTO `ball_group_menu` VALUES (6, 266);
INSERT INTO `ball_group_menu` VALUES (6, 264);
INSERT INTO `ball_group_menu` VALUES (6, 273);
INSERT INTO `ball_group_menu` VALUES (6, 282);
INSERT INTO `ball_group_menu` VALUES (6, 271);
INSERT INTO `ball_group_menu` VALUES (6, 250);
INSERT INTO `ball_group_menu` VALUES (6, 251);
INSERT INTO `ball_group_menu` VALUES (6, 252);
INSERT INTO `ball_group_menu` VALUES (6, 270);
INSERT INTO `ball_group_menu` VALUES (6, 13);
INSERT INTO `ball_group_menu` VALUES (6, 14);
INSERT INTO `ball_group_menu` VALUES (6, 15);
INSERT INTO `ball_group_menu` VALUES (6, 16);
INSERT INTO `ball_group_menu` VALUES (6, 17);
INSERT INTO `ball_group_menu` VALUES (6, 18);
INSERT INTO `ball_group_menu` VALUES (6, 19);
INSERT INTO `ball_group_menu` VALUES (6, 20);
INSERT INTO `ball_group_menu` VALUES (6, 21);
INSERT INTO `ball_group_menu` VALUES (6, 149);
INSERT INTO `ball_group_menu` VALUES (6, 177);
INSERT INTO `ball_group_menu` VALUES (6, 234);
INSERT INTO `ball_group_menu` VALUES (6, 235);
INSERT INTO `ball_group_menu` VALUES (6, 284);
INSERT INTO `ball_group_menu` VALUES (6, 286);
INSERT INTO `ball_group_menu` VALUES (6, 173);
INSERT INTO `ball_group_menu` VALUES (6, 269);
INSERT INTO `ball_group_menu` VALUES (6, 229);
INSERT INTO `ball_group_menu` VALUES (6, 230);
INSERT INTO `ball_group_menu` VALUES (6, 231);
INSERT INTO `ball_group_menu` VALUES (6, 232);
INSERT INTO `ball_group_menu` VALUES (6, 245);
INSERT INTO `ball_group_menu` VALUES (6, 23);
INSERT INTO `ball_group_menu` VALUES (6, 24);
INSERT INTO `ball_group_menu` VALUES (6, 25);
INSERT INTO `ball_group_menu` VALUES (6, 26);
INSERT INTO `ball_group_menu` VALUES (6, 27);
INSERT INTO `ball_group_menu` VALUES (6, 28);
INSERT INTO `ball_group_menu` VALUES (6, 29);
INSERT INTO `ball_group_menu` VALUES (6, 155);
INSERT INTO `ball_group_menu` VALUES (6, 161);
INSERT INTO `ball_group_menu` VALUES (6, 162);
INSERT INTO `ball_group_menu` VALUES (6, 179);
INSERT INTO `ball_group_menu` VALUES (6, 30);
INSERT INTO `ball_group_menu` VALUES (6, 31);
INSERT INTO `ball_group_menu` VALUES (6, 32);
INSERT INTO `ball_group_menu` VALUES (6, 33);
INSERT INTO `ball_group_menu` VALUES (6, 34);
INSERT INTO `ball_group_menu` VALUES (6, 38);
INSERT INTO `ball_group_menu` VALUES (6, 54);
INSERT INTO `ball_group_menu` VALUES (6, 55);
INSERT INTO `ball_group_menu` VALUES (6, 56);
INSERT INTO `ball_group_menu` VALUES (6, 57);
INSERT INTO `ball_group_menu` VALUES (6, 222);
INSERT INTO `ball_group_menu` VALUES (6, 42);
INSERT INTO `ball_group_menu` VALUES (6, 43);
INSERT INTO `ball_group_menu` VALUES (6, 44);
INSERT INTO `ball_group_menu` VALUES (6, 45);
INSERT INTO `ball_group_menu` VALUES (6, 46);
INSERT INTO `ball_group_menu` VALUES (6, 47);
INSERT INTO `ball_group_menu` VALUES (6, 236);
INSERT INTO `ball_group_menu` VALUES (6, 275);
INSERT INTO `ball_group_menu` VALUES (6, 276);
INSERT INTO `ball_group_menu` VALUES (6, 277);
INSERT INTO `ball_group_menu` VALUES (6, 278);
INSERT INTO `ball_group_menu` VALUES (6, 279);
INSERT INTO `ball_group_menu` VALUES (6, 80);
INSERT INTO `ball_group_menu` VALUES (6, 81);
INSERT INTO `ball_group_menu` VALUES (6, 82);
INSERT INTO `ball_group_menu` VALUES (6, 83);
INSERT INTO `ball_group_menu` VALUES (6, 84);
INSERT INTO `ball_group_menu` VALUES (6, 85);
INSERT INTO `ball_group_menu` VALUES (6, 86);
INSERT INTO `ball_group_menu` VALUES (6, 87);
INSERT INTO `ball_group_menu` VALUES (6, 88);
INSERT INTO `ball_group_menu` VALUES (6, 89);
INSERT INTO `ball_group_menu` VALUES (6, 90);
INSERT INTO `ball_group_menu` VALUES (6, 91);
INSERT INTO `ball_group_menu` VALUES (6, 93);
INSERT INTO `ball_group_menu` VALUES (6, 96);
INSERT INTO `ball_group_menu` VALUES (6, 97);
INSERT INTO `ball_group_menu` VALUES (6, 150);
INSERT INTO `ball_group_menu` VALUES (6, 151);
INSERT INTO `ball_group_menu` VALUES (6, 152);
INSERT INTO `ball_group_menu` VALUES (6, 153);
INSERT INTO `ball_group_menu` VALUES (6, 154);
INSERT INTO `ball_group_menu` VALUES (6, 144);
INSERT INTO `ball_group_menu` VALUES (6, 145);
INSERT INTO `ball_group_menu` VALUES (6, 146);
INSERT INTO `ball_group_menu` VALUES (6, 233);
INSERT INTO `ball_group_menu` VALUES (6, 259);
INSERT INTO `ball_group_menu` VALUES (6, 272);
INSERT INTO `ball_group_menu` VALUES (6, 248);
INSERT INTO `ball_group_menu` VALUES (6, 10);
INSERT INTO `ball_group_menu` VALUES (6, 11);
INSERT INTO `ball_group_menu` VALUES (6, 283);
INSERT INTO `ball_group_menu` VALUES (6, 22);
INSERT INTO `ball_group_menu` VALUES (6, 35);
INSERT INTO `ball_group_menu` VALUES (6, 39);
INSERT INTO `ball_group_menu` VALUES (6, 67);
INSERT INTO `ball_group_menu` VALUES (6, 92);
INSERT INTO `ball_group_menu` VALUES (6, 143);
INSERT INTO `ball_group_menu` VALUES (9, 281);
INSERT INTO `ball_group_menu` VALUES (9, 266);
INSERT INTO `ball_group_menu` VALUES (9, 264);
INSERT INTO `ball_group_menu` VALUES (9, 273);
INSERT INTO `ball_group_menu` VALUES (9, 282);
INSERT INTO `ball_group_menu` VALUES (9, 271);
INSERT INTO `ball_group_menu` VALUES (9, 250);
INSERT INTO `ball_group_menu` VALUES (9, 251);
INSERT INTO `ball_group_menu` VALUES (9, 270);
INSERT INTO `ball_group_menu` VALUES (9, 13);
INSERT INTO `ball_group_menu` VALUES (9, 14);
INSERT INTO `ball_group_menu` VALUES (9, 15);
INSERT INTO `ball_group_menu` VALUES (9, 16);
INSERT INTO `ball_group_menu` VALUES (9, 17);
INSERT INTO `ball_group_menu` VALUES (9, 18);
INSERT INTO `ball_group_menu` VALUES (9, 19);
INSERT INTO `ball_group_menu` VALUES (9, 20);
INSERT INTO `ball_group_menu` VALUES (9, 21);
INSERT INTO `ball_group_menu` VALUES (9, 149);
INSERT INTO `ball_group_menu` VALUES (9, 177);
INSERT INTO `ball_group_menu` VALUES (9, 234);
INSERT INTO `ball_group_menu` VALUES (9, 235);
INSERT INTO `ball_group_menu` VALUES (9, 284);
INSERT INTO `ball_group_menu` VALUES (9, 286);
INSERT INTO `ball_group_menu` VALUES (9, 29);
INSERT INTO `ball_group_menu` VALUES (9, 31);
INSERT INTO `ball_group_menu` VALUES (9, 38);
INSERT INTO `ball_group_menu` VALUES (9, 55);
INSERT INTO `ball_group_menu` VALUES (9, 47);
INSERT INTO `ball_group_menu` VALUES (9, 276);
INSERT INTO `ball_group_menu` VALUES (9, 81);
INSERT INTO `ball_group_menu` VALUES (9, 82);
INSERT INTO `ball_group_menu` VALUES (9, 86);
INSERT INTO `ball_group_menu` VALUES (9, 89);
INSERT INTO `ball_group_menu` VALUES (9, 93);
INSERT INTO `ball_group_menu` VALUES (9, 96);
INSERT INTO `ball_group_menu` VALUES (9, 97);
INSERT INTO `ball_group_menu` VALUES (9, 151);
INSERT INTO `ball_group_menu` VALUES (9, 144);
INSERT INTO `ball_group_menu` VALUES (9, 145);
INSERT INTO `ball_group_menu` VALUES (9, 146);
INSERT INTO `ball_group_menu` VALUES (9, 233);
INSERT INTO `ball_group_menu` VALUES (9, 259);
INSERT INTO `ball_group_menu` VALUES (9, 261);
INSERT INTO `ball_group_menu` VALUES (9, 262);
INSERT INTO `ball_group_menu` VALUES (9, 272);
INSERT INTO `ball_group_menu` VALUES (9, 248);
INSERT INTO `ball_group_menu` VALUES (9, 10);
INSERT INTO `ball_group_menu` VALUES (9, 11);
INSERT INTO `ball_group_menu` VALUES (9, 283);
INSERT INTO `ball_group_menu` VALUES (9, 22);
INSERT INTO `ball_group_menu` VALUES (9, 23);
INSERT INTO `ball_group_menu` VALUES (9, 30);
INSERT INTO `ball_group_menu` VALUES (9, 35);
INSERT INTO `ball_group_menu` VALUES (9, 54);
INSERT INTO `ball_group_menu` VALUES (9, 39);
INSERT INTO `ball_group_menu` VALUES (9, 67);
INSERT INTO `ball_group_menu` VALUES (9, 275);
INSERT INTO `ball_group_menu` VALUES (9, 80);
INSERT INTO `ball_group_menu` VALUES (9, 85);
INSERT INTO `ball_group_menu` VALUES (9, 88);
INSERT INTO `ball_group_menu` VALUES (9, 92);
INSERT INTO `ball_group_menu` VALUES (9, 150);
INSERT INTO `ball_group_menu` VALUES (9, 143);
INSERT INTO `ball_group_menu` VALUES (10, 261);
INSERT INTO `ball_group_menu` VALUES (10, 265);
INSERT INTO `ball_group_menu` VALUES (10, 281);
INSERT INTO `ball_group_menu` VALUES (10, 262);
INSERT INTO `ball_group_menu` VALUES (10, 263);
INSERT INTO `ball_group_menu` VALUES (10, 266);
INSERT INTO `ball_group_menu` VALUES (10, 264);
INSERT INTO `ball_group_menu` VALUES (10, 273);
INSERT INTO `ball_group_menu` VALUES (10, 282);
INSERT INTO `ball_group_menu` VALUES (10, 271);
INSERT INTO `ball_group_menu` VALUES (10, 250);
INSERT INTO `ball_group_menu` VALUES (10, 251);
INSERT INTO `ball_group_menu` VALUES (10, 252);
INSERT INTO `ball_group_menu` VALUES (10, 270);
INSERT INTO `ball_group_menu` VALUES (10, 11);
INSERT INTO `ball_group_menu` VALUES (10, 13);
INSERT INTO `ball_group_menu` VALUES (10, 14);
INSERT INTO `ball_group_menu` VALUES (10, 15);
INSERT INTO `ball_group_menu` VALUES (10, 16);
INSERT INTO `ball_group_menu` VALUES (10, 17);
INSERT INTO `ball_group_menu` VALUES (10, 18);
INSERT INTO `ball_group_menu` VALUES (10, 19);
INSERT INTO `ball_group_menu` VALUES (10, 20);
INSERT INTO `ball_group_menu` VALUES (10, 21);
INSERT INTO `ball_group_menu` VALUES (10, 149);
INSERT INTO `ball_group_menu` VALUES (10, 177);
INSERT INTO `ball_group_menu` VALUES (10, 234);
INSERT INTO `ball_group_menu` VALUES (10, 235);
INSERT INTO `ball_group_menu` VALUES (10, 238);
INSERT INTO `ball_group_menu` VALUES (10, 284);
INSERT INTO `ball_group_menu` VALUES (10, 286);
INSERT INTO `ball_group_menu` VALUES (10, 173);
INSERT INTO `ball_group_menu` VALUES (10, 269);
INSERT INTO `ball_group_menu` VALUES (10, 229);
INSERT INTO `ball_group_menu` VALUES (10, 230);
INSERT INTO `ball_group_menu` VALUES (10, 231);
INSERT INTO `ball_group_menu` VALUES (10, 232);
INSERT INTO `ball_group_menu` VALUES (10, 245);
INSERT INTO `ball_group_menu` VALUES (10, 22);
INSERT INTO `ball_group_menu` VALUES (10, 23);
INSERT INTO `ball_group_menu` VALUES (10, 24);
INSERT INTO `ball_group_menu` VALUES (10, 25);
INSERT INTO `ball_group_menu` VALUES (10, 26);
INSERT INTO `ball_group_menu` VALUES (10, 27);
INSERT INTO `ball_group_menu` VALUES (10, 28);
INSERT INTO `ball_group_menu` VALUES (10, 29);
INSERT INTO `ball_group_menu` VALUES (10, 155);
INSERT INTO `ball_group_menu` VALUES (10, 161);
INSERT INTO `ball_group_menu` VALUES (10, 162);
INSERT INTO `ball_group_menu` VALUES (10, 179);
INSERT INTO `ball_group_menu` VALUES (10, 30);
INSERT INTO `ball_group_menu` VALUES (10, 31);
INSERT INTO `ball_group_menu` VALUES (10, 32);
INSERT INTO `ball_group_menu` VALUES (10, 33);
INSERT INTO `ball_group_menu` VALUES (10, 34);
INSERT INTO `ball_group_menu` VALUES (10, 35);
INSERT INTO `ball_group_menu` VALUES (10, 36);
INSERT INTO `ball_group_menu` VALUES (10, 37);
INSERT INTO `ball_group_menu` VALUES (10, 38);
INSERT INTO `ball_group_menu` VALUES (10, 54);
INSERT INTO `ball_group_menu` VALUES (10, 55);
INSERT INTO `ball_group_menu` VALUES (10, 56);
INSERT INTO `ball_group_menu` VALUES (10, 57);
INSERT INTO `ball_group_menu` VALUES (10, 222);
INSERT INTO `ball_group_menu` VALUES (10, 40);
INSERT INTO `ball_group_menu` VALUES (10, 42);
INSERT INTO `ball_group_menu` VALUES (10, 43);
INSERT INTO `ball_group_menu` VALUES (10, 44);
INSERT INTO `ball_group_menu` VALUES (10, 45);
INSERT INTO `ball_group_menu` VALUES (10, 46);
INSERT INTO `ball_group_menu` VALUES (10, 47);
INSERT INTO `ball_group_menu` VALUES (10, 51);
INSERT INTO `ball_group_menu` VALUES (10, 236);
INSERT INTO `ball_group_menu` VALUES (10, 275);
INSERT INTO `ball_group_menu` VALUES (10, 276);
INSERT INTO `ball_group_menu` VALUES (10, 277);
INSERT INTO `ball_group_menu` VALUES (10, 278);
INSERT INTO `ball_group_menu` VALUES (10, 279);
INSERT INTO `ball_group_menu` VALUES (10, 68);
INSERT INTO `ball_group_menu` VALUES (10, 69);
INSERT INTO `ball_group_menu` VALUES (10, 70);
INSERT INTO `ball_group_menu` VALUES (10, 71);
INSERT INTO `ball_group_menu` VALUES (10, 72);
INSERT INTO `ball_group_menu` VALUES (10, 73);
INSERT INTO `ball_group_menu` VALUES (10, 74);
INSERT INTO `ball_group_menu` VALUES (10, 75);
INSERT INTO `ball_group_menu` VALUES (10, 76);
INSERT INTO `ball_group_menu` VALUES (10, 77);
INSERT INTO `ball_group_menu` VALUES (10, 78);
INSERT INTO `ball_group_menu` VALUES (10, 79);
INSERT INTO `ball_group_menu` VALUES (10, 80);
INSERT INTO `ball_group_menu` VALUES (10, 81);
INSERT INTO `ball_group_menu` VALUES (10, 82);
INSERT INTO `ball_group_menu` VALUES (10, 83);
INSERT INTO `ball_group_menu` VALUES (10, 84);
INSERT INTO `ball_group_menu` VALUES (10, 85);
INSERT INTO `ball_group_menu` VALUES (10, 86);
INSERT INTO `ball_group_menu` VALUES (10, 87);
INSERT INTO `ball_group_menu` VALUES (10, 88);
INSERT INTO `ball_group_menu` VALUES (10, 89);
INSERT INTO `ball_group_menu` VALUES (10, 90);
INSERT INTO `ball_group_menu` VALUES (10, 91);
INSERT INTO `ball_group_menu` VALUES (10, 92);
INSERT INTO `ball_group_menu` VALUES (10, 93);
INSERT INTO `ball_group_menu` VALUES (10, 94);
INSERT INTO `ball_group_menu` VALUES (10, 95);
INSERT INTO `ball_group_menu` VALUES (10, 187);
INSERT INTO `ball_group_menu` VALUES (10, 96);
INSERT INTO `ball_group_menu` VALUES (10, 97);
INSERT INTO `ball_group_menu` VALUES (10, 150);
INSERT INTO `ball_group_menu` VALUES (10, 151);
INSERT INTO `ball_group_menu` VALUES (10, 152);
INSERT INTO `ball_group_menu` VALUES (10, 153);
INSERT INTO `ball_group_menu` VALUES (10, 154);
INSERT INTO `ball_group_menu` VALUES (10, 180);
INSERT INTO `ball_group_menu` VALUES (10, 181);
INSERT INTO `ball_group_menu` VALUES (10, 182);
INSERT INTO `ball_group_menu` VALUES (10, 183);
INSERT INTO `ball_group_menu` VALUES (10, 184);
INSERT INTO `ball_group_menu` VALUES (10, 185);
INSERT INTO `ball_group_menu` VALUES (10, 144);
INSERT INTO `ball_group_menu` VALUES (10, 145);
INSERT INTO `ball_group_menu` VALUES (10, 146);
INSERT INTO `ball_group_menu` VALUES (10, 233);
INSERT INTO `ball_group_menu` VALUES (10, 259);
INSERT INTO `ball_group_menu` VALUES (10, 272);
INSERT INTO `ball_group_menu` VALUES (10, 248);
INSERT INTO `ball_group_menu` VALUES (10, 10);
INSERT INTO `ball_group_menu` VALUES (10, 283);
INSERT INTO `ball_group_menu` VALUES (10, 39);
INSERT INTO `ball_group_menu` VALUES (10, 67);
INSERT INTO `ball_group_menu` VALUES (10, 143);
INSERT INTO `ball_group_menu` VALUES (12, 261);
INSERT INTO `ball_group_menu` VALUES (12, 265);
INSERT INTO `ball_group_menu` VALUES (12, 281);
INSERT INTO `ball_group_menu` VALUES (12, 262);
INSERT INTO `ball_group_menu` VALUES (12, 263);
INSERT INTO `ball_group_menu` VALUES (12, 266);
INSERT INTO `ball_group_menu` VALUES (12, 264);
INSERT INTO `ball_group_menu` VALUES (12, 273);
INSERT INTO `ball_group_menu` VALUES (12, 282);
INSERT INTO `ball_group_menu` VALUES (12, 271);
INSERT INTO `ball_group_menu` VALUES (12, 250);
INSERT INTO `ball_group_menu` VALUES (12, 251);
INSERT INTO `ball_group_menu` VALUES (12, 252);
INSERT INTO `ball_group_menu` VALUES (12, 270);
INSERT INTO `ball_group_menu` VALUES (12, 13);
INSERT INTO `ball_group_menu` VALUES (12, 14);
INSERT INTO `ball_group_menu` VALUES (12, 15);
INSERT INTO `ball_group_menu` VALUES (12, 16);
INSERT INTO `ball_group_menu` VALUES (12, 17);
INSERT INTO `ball_group_menu` VALUES (12, 18);
INSERT INTO `ball_group_menu` VALUES (12, 19);
INSERT INTO `ball_group_menu` VALUES (12, 20);
INSERT INTO `ball_group_menu` VALUES (12, 177);
INSERT INTO `ball_group_menu` VALUES (12, 234);
INSERT INTO `ball_group_menu` VALUES (12, 235);
INSERT INTO `ball_group_menu` VALUES (12, 284);
INSERT INTO `ball_group_menu` VALUES (12, 286);
INSERT INTO `ball_group_menu` VALUES (12, 173);
INSERT INTO `ball_group_menu` VALUES (12, 269);
INSERT INTO `ball_group_menu` VALUES (12, 229);
INSERT INTO `ball_group_menu` VALUES (12, 230);
INSERT INTO `ball_group_menu` VALUES (12, 231);
INSERT INTO `ball_group_menu` VALUES (12, 232);
INSERT INTO `ball_group_menu` VALUES (12, 245);
INSERT INTO `ball_group_menu` VALUES (12, 23);
INSERT INTO `ball_group_menu` VALUES (12, 24);
INSERT INTO `ball_group_menu` VALUES (12, 25);
INSERT INTO `ball_group_menu` VALUES (12, 26);
INSERT INTO `ball_group_menu` VALUES (12, 27);
INSERT INTO `ball_group_menu` VALUES (12, 28);
INSERT INTO `ball_group_menu` VALUES (12, 29);
INSERT INTO `ball_group_menu` VALUES (12, 155);
INSERT INTO `ball_group_menu` VALUES (12, 161);
INSERT INTO `ball_group_menu` VALUES (12, 162);
INSERT INTO `ball_group_menu` VALUES (12, 179);
INSERT INTO `ball_group_menu` VALUES (12, 31);
INSERT INTO `ball_group_menu` VALUES (12, 32);
INSERT INTO `ball_group_menu` VALUES (12, 38);
INSERT INTO `ball_group_menu` VALUES (12, 54);
INSERT INTO `ball_group_menu` VALUES (12, 55);
INSERT INTO `ball_group_menu` VALUES (12, 56);
INSERT INTO `ball_group_menu` VALUES (12, 57);
INSERT INTO `ball_group_menu` VALUES (12, 222);
INSERT INTO `ball_group_menu` VALUES (12, 47);
INSERT INTO `ball_group_menu` VALUES (12, 275);
INSERT INTO `ball_group_menu` VALUES (12, 276);
INSERT INTO `ball_group_menu` VALUES (12, 277);
INSERT INTO `ball_group_menu` VALUES (12, 278);
INSERT INTO `ball_group_menu` VALUES (12, 279);
INSERT INTO `ball_group_menu` VALUES (12, 69);
INSERT INTO `ball_group_menu` VALUES (12, 70);
INSERT INTO `ball_group_menu` VALUES (12, 71);
INSERT INTO `ball_group_menu` VALUES (12, 72);
INSERT INTO `ball_group_menu` VALUES (12, 75);
INSERT INTO `ball_group_menu` VALUES (12, 76);
INSERT INTO `ball_group_menu` VALUES (12, 77);
INSERT INTO `ball_group_menu` VALUES (12, 78);
INSERT INTO `ball_group_menu` VALUES (12, 81);
INSERT INTO `ball_group_menu` VALUES (12, 82);
INSERT INTO `ball_group_menu` VALUES (12, 83);
INSERT INTO `ball_group_menu` VALUES (12, 86);
INSERT INTO `ball_group_menu` VALUES (12, 89);
INSERT INTO `ball_group_menu` VALUES (12, 90);
INSERT INTO `ball_group_menu` VALUES (12, 93);
INSERT INTO `ball_group_menu` VALUES (12, 96);
INSERT INTO `ball_group_menu` VALUES (12, 97);
INSERT INTO `ball_group_menu` VALUES (12, 151);
INSERT INTO `ball_group_menu` VALUES (12, 152);
INSERT INTO `ball_group_menu` VALUES (12, 154);
INSERT INTO `ball_group_menu` VALUES (12, 144);
INSERT INTO `ball_group_menu` VALUES (12, 145);
INSERT INTO `ball_group_menu` VALUES (12, 146);
INSERT INTO `ball_group_menu` VALUES (12, 233);
INSERT INTO `ball_group_menu` VALUES (12, 259);
INSERT INTO `ball_group_menu` VALUES (12, 272);
INSERT INTO `ball_group_menu` VALUES (12, 248);
INSERT INTO `ball_group_menu` VALUES (12, 10);
INSERT INTO `ball_group_menu` VALUES (12, 11);
INSERT INTO `ball_group_menu` VALUES (12, 283);
INSERT INTO `ball_group_menu` VALUES (12, 22);
INSERT INTO `ball_group_menu` VALUES (12, 30);
INSERT INTO `ball_group_menu` VALUES (12, 35);
INSERT INTO `ball_group_menu` VALUES (12, 39);
INSERT INTO `ball_group_menu` VALUES (12, 67);
INSERT INTO `ball_group_menu` VALUES (12, 68);
INSERT INTO `ball_group_menu` VALUES (12, 74);
INSERT INTO `ball_group_menu` VALUES (12, 80);
INSERT INTO `ball_group_menu` VALUES (12, 85);
INSERT INTO `ball_group_menu` VALUES (12, 88);
INSERT INTO `ball_group_menu` VALUES (12, 92);
INSERT INTO `ball_group_menu` VALUES (12, 150);
INSERT INTO `ball_group_menu` VALUES (12, 143);
INSERT INTO `ball_group_menu` VALUES (1, 298);
INSERT INTO `ball_group_menu` VALUES (1, 299);
INSERT INTO `ball_group_menu` VALUES (1, 300);
INSERT INTO `ball_group_menu` VALUES (1, 301);
INSERT INTO `ball_group_menu` VALUES (1, 302);
INSERT INTO `ball_group_menu` VALUES (1, 303);
INSERT INTO `ball_group_menu` VALUES (1, 304);
INSERT INTO `ball_group_menu` VALUES (1, 305);
INSERT INTO `ball_group_menu` VALUES (1, 306);
INSERT INTO `ball_group_menu` VALUES (1, 307);
INSERT INTO `ball_group_menu` VALUES (1, 308);
INSERT INTO `ball_group_menu` VALUES (1, 309);
INSERT INTO `ball_group_menu` VALUES (1, 310);
INSERT INTO `ball_group_menu` VALUES (1, 311);
INSERT INTO `ball_group_menu` VALUES (1, 312);
INSERT INTO `ball_group_menu` VALUES (1, 313);
INSERT INTO `ball_group_menu` VALUES (1, 314);
INSERT INTO `ball_group_menu` VALUES (1, 315);
INSERT INTO `ball_group_menu` VALUES (1, 316);
INSERT INTO `ball_group_menu` VALUES (1, 317);
INSERT INTO `ball_group_menu` VALUES (1, 318);
INSERT INTO `ball_group_menu` VALUES (1, 319);
INSERT INTO `ball_group_menu` VALUES (1, 320);
INSERT INTO `ball_group_menu` VALUES (1, 321);
INSERT INTO `ball_group_menu` VALUES (1, 322);
INSERT INTO `ball_group_menu` VALUES (1, 323);
INSERT INTO `ball_group_menu` VALUES (1, 324);
INSERT INTO `ball_group_menu` VALUES (1, 325);
INSERT INTO `ball_group_menu` VALUES (1, 326);
INSERT INTO `ball_group_menu` VALUES (1, 327);
INSERT INTO `ball_group_menu` VALUES (1, 328);
INSERT INTO `ball_group_menu` VALUES (1, 329);
INSERT INTO `ball_group_menu` VALUES (1, 330);
INSERT INTO `ball_group_menu` VALUES (5, 251);
INSERT INTO `ball_group_menu` VALUES (5, 252);
INSERT INTO `ball_group_menu` VALUES (5, 271);
INSERT INTO `ball_group_menu` VALUES (5, 261);
INSERT INTO `ball_group_menu` VALUES (5, 265);
INSERT INTO `ball_group_menu` VALUES (5, 281);
INSERT INTO `ball_group_menu` VALUES (5, 262);
INSERT INTO `ball_group_menu` VALUES (5, 263);
INSERT INTO `ball_group_menu` VALUES (5, 266);
INSERT INTO `ball_group_menu` VALUES (5, 264);
INSERT INTO `ball_group_menu` VALUES (5, 273);
INSERT INTO `ball_group_menu` VALUES (5, 282);
INSERT INTO `ball_group_menu` VALUES (5, 270);
INSERT INTO `ball_group_menu` VALUES (5, 15);
INSERT INTO `ball_group_menu` VALUES (5, 16);
INSERT INTO `ball_group_menu` VALUES (5, 177);
INSERT INTO `ball_group_menu` VALUES (5, 203);
INSERT INTO `ball_group_menu` VALUES (5, 173);
INSERT INTO `ball_group_menu` VALUES (5, 229);
INSERT INTO `ball_group_menu` VALUES (5, 230);
INSERT INTO `ball_group_menu` VALUES (5, 231);
INSERT INTO `ball_group_menu` VALUES (5, 232);
INSERT INTO `ball_group_menu` VALUES (5, 245);
INSERT INTO `ball_group_menu` VALUES (5, 269);
INSERT INTO `ball_group_menu` VALUES (5, 284);
INSERT INTO `ball_group_menu` VALUES (5, 286);
INSERT INTO `ball_group_menu` VALUES (5, 29);
INSERT INTO `ball_group_menu` VALUES (5, 55);
INSERT INTO `ball_group_menu` VALUES (5, 57);
INSERT INTO `ball_group_menu` VALUES (5, 327);
INSERT INTO `ball_group_menu` VALUES (5, 328);
INSERT INTO `ball_group_menu` VALUES (5, 236);
INSERT INTO `ball_group_menu` VALUES (5, 81);
INSERT INTO `ball_group_menu` VALUES (5, 86);
INSERT INTO `ball_group_menu` VALUES (5, 89);
INSERT INTO `ball_group_menu` VALUES (5, 93);
INSERT INTO `ball_group_menu` VALUES (5, 96);
INSERT INTO `ball_group_menu` VALUES (5, 97);
INSERT INTO `ball_group_menu` VALUES (5, 151);
INSERT INTO `ball_group_menu` VALUES (5, 276);
INSERT INTO `ball_group_menu` VALUES (5, 144);
INSERT INTO `ball_group_menu` VALUES (5, 145);
INSERT INTO `ball_group_menu` VALUES (5, 146);
INSERT INTO `ball_group_menu` VALUES (5, 233);
INSERT INTO `ball_group_menu` VALUES (5, 248);
INSERT INTO `ball_group_menu` VALUES (5, 259);
INSERT INTO `ball_group_menu` VALUES (5, 272);
INSERT INTO `ball_group_menu` VALUES (5, 10);
INSERT INTO `ball_group_menu` VALUES (5, 11);
INSERT INTO `ball_group_menu` VALUES (5, 283);
INSERT INTO `ball_group_menu` VALUES (5, 22);
INSERT INTO `ball_group_menu` VALUES (5, 23);
INSERT INTO `ball_group_menu` VALUES (5, 54);
INSERT INTO `ball_group_menu` VALUES (5, 39);
INSERT INTO `ball_group_menu` VALUES (5, 67);
INSERT INTO `ball_group_menu` VALUES (5, 80);
INSERT INTO `ball_group_menu` VALUES (5, 85);
INSERT INTO `ball_group_menu` VALUES (5, 88);
INSERT INTO `ball_group_menu` VALUES (5, 92);
INSERT INTO `ball_group_menu` VALUES (5, 150);
INSERT INTO `ball_group_menu` VALUES (5, 275);
INSERT INTO `ball_group_menu` VALUES (5, 143);
INSERT INTO `ball_group_menu` VALUES (1, 331);
INSERT INTO `ball_group_menu` VALUES (1, 332);
INSERT INTO `ball_group_menu` VALUES (1, 333);
INSERT INTO `ball_group_menu` VALUES (1, 334);
INSERT INTO `ball_group_menu` VALUES (1, 335);
INSERT INTO `ball_group_menu` VALUES (1, 336);
INSERT INTO `ball_group_menu` VALUES (1, 337);
INSERT INTO `ball_group_menu` VALUES (1, 338);
INSERT INTO `ball_group_menu` VALUES (1, 339);
INSERT INTO `ball_group_menu` VALUES (1, 340);
INSERT INTO `ball_group_menu` VALUES (1, 341);
INSERT INTO `ball_group_menu` VALUES (1, 342);
INSERT INTO `ball_group_menu` VALUES (1, 343);
INSERT INTO `ball_group_menu` VALUES (1, 344);
INSERT INTO `ball_group_menu` VALUES (1, 345);
INSERT INTO `ball_group_menu` VALUES (1, 346);
INSERT INTO `ball_group_menu` VALUES (1, 347);
INSERT INTO `ball_group_menu` VALUES (1, 348);
INSERT INTO `ball_group_menu` VALUES (1, 349);
INSERT INTO `ball_group_menu` VALUES (1, 350);
INSERT INTO `ball_group_menu` VALUES (1, 352);
INSERT INTO `ball_group_menu` VALUES (1, 353);
INSERT INTO `ball_group_menu` VALUES (13, 341);
INSERT INTO `ball_group_menu` VALUES (13, 342);
INSERT INTO `ball_group_menu` VALUES (13, 343);
INSERT INTO `ball_group_menu` VALUES (13, 344);
INSERT INTO `ball_group_menu` VALUES (13, 345);
INSERT INTO `ball_group_menu` VALUES (13, 346);
INSERT INTO `ball_group_menu` VALUES (13, 347);
INSERT INTO `ball_group_menu` VALUES (13, 348);
INSERT INTO `ball_group_menu` VALUES (13, 349);
INSERT INTO `ball_group_menu` VALUES (13, 350);
INSERT INTO `ball_group_menu` VALUES (13, 351);
INSERT INTO `ball_group_menu` VALUES (13, 352);
INSERT INTO `ball_group_menu` VALUES (13, 353);
INSERT INTO `ball_group_menu` VALUES (13, 10);
INSERT INTO `ball_group_menu` VALUES (13, 270);
INSERT INTO `ball_group_menu` VALUES (13, 11);
INSERT INTO `ball_group_menu` VALUES (13, 13);
INSERT INTO `ball_group_menu` VALUES (13, 14);
INSERT INTO `ball_group_menu` VALUES (13, 15);
INSERT INTO `ball_group_menu` VALUES (13, 16);
INSERT INTO `ball_group_menu` VALUES (13, 17);
INSERT INTO `ball_group_menu` VALUES (13, 18);
INSERT INTO `ball_group_menu` VALUES (13, 19);
INSERT INTO `ball_group_menu` VALUES (13, 20);
INSERT INTO `ball_group_menu` VALUES (13, 21);
INSERT INTO `ball_group_menu` VALUES (13, 149);
INSERT INTO `ball_group_menu` VALUES (13, 177);
INSERT INTO `ball_group_menu` VALUES (13, 234);
INSERT INTO `ball_group_menu` VALUES (13, 235);
INSERT INTO `ball_group_menu` VALUES (13, 238);
INSERT INTO `ball_group_menu` VALUES (13, 12);
INSERT INTO `ball_group_menu` VALUES (13, 195);
INSERT INTO `ball_group_menu` VALUES (13, 203);
INSERT INTO `ball_group_menu` VALUES (13, 247);
INSERT INTO `ball_group_menu` VALUES (13, 331);
INSERT INTO `ball_group_menu` VALUES (13, 332);
INSERT INTO `ball_group_menu` VALUES (13, 333);
INSERT INTO `ball_group_menu` VALUES (13, 334);
INSERT INTO `ball_group_menu` VALUES (13, 335);
INSERT INTO `ball_group_menu` VALUES (13, 336);
INSERT INTO `ball_group_menu` VALUES (13, 337);
INSERT INTO `ball_group_menu` VALUES (13, 338);
INSERT INTO `ball_group_menu` VALUES (13, 339);
INSERT INTO `ball_group_menu` VALUES (13, 340);
INSERT INTO `ball_group_menu` VALUES (1, 354);
INSERT INTO `ball_group_menu` VALUES (1, 355);
INSERT INTO `ball_group_menu` VALUES (1, 356);
INSERT INTO `ball_group_menu` VALUES (1, 357);
INSERT INTO `ball_group_menu` VALUES (1, 358);
INSERT INTO `ball_group_menu` VALUES (1, 359);
INSERT INTO `ball_group_menu` VALUES (1, 360);
INSERT INTO `ball_group_menu` VALUES (1, 361);
INSERT INTO `ball_group_menu` VALUES (1, 362);
INSERT INTO `ball_group_menu` VALUES (1, 363);
INSERT INTO `ball_group_menu` VALUES (1, 364);
INSERT INTO `ball_group_menu` VALUES (1, 351);
INSERT INTO `ball_group_menu` VALUES (1, 365);
INSERT INTO `ball_group_menu` VALUES (1, 366);
INSERT INTO `ball_group_menu` VALUES (1, 367);
INSERT INTO `ball_group_menu` VALUES (1, 368);
INSERT INTO `ball_group_menu` VALUES (1, 369);
INSERT INTO `ball_group_menu` VALUES (1, 370);
INSERT INTO `ball_group_menu` VALUES (1, 371);
INSERT INTO `ball_group_menu` VALUES (1, 372);
INSERT INTO `ball_group_menu` VALUES (1, 373);
INSERT INTO `ball_group_menu` VALUES (1, 374);
INSERT INTO `ball_group_menu` VALUES (1, 375);
INSERT INTO `ball_group_menu` VALUES (1, 376);
INSERT INTO `ball_group_menu` VALUES (1, 377);
INSERT INTO `ball_group_menu` VALUES (1, 378);
INSERT INTO `ball_group_menu` VALUES (1, 379);
INSERT INTO `ball_group_menu` VALUES (1, 380);
INSERT INTO `ball_group_menu` VALUES (1, 381);
INSERT INTO `ball_group_menu` VALUES (1, 382);
INSERT INTO `ball_group_menu` VALUES (15, 341);
INSERT INTO `ball_group_menu` VALUES (15, 342);
INSERT INTO `ball_group_menu` VALUES (15, 343);
INSERT INTO `ball_group_menu` VALUES (15, 344);
INSERT INTO `ball_group_menu` VALUES (15, 345);
INSERT INTO `ball_group_menu` VALUES (15, 346);
INSERT INTO `ball_group_menu` VALUES (15, 347);
INSERT INTO `ball_group_menu` VALUES (15, 348);
INSERT INTO `ball_group_menu` VALUES (15, 377);
INSERT INTO `ball_group_menu` VALUES (15, 349);
INSERT INTO `ball_group_menu` VALUES (15, 350);
INSERT INTO `ball_group_menu` VALUES (15, 351);
INSERT INTO `ball_group_menu` VALUES (15, 378);
INSERT INTO `ball_group_menu` VALUES (15, 352);
INSERT INTO `ball_group_menu` VALUES (15, 353);
INSERT INTO `ball_group_menu` VALUES (15, 379);
INSERT INTO `ball_group_menu` VALUES (15, 359);
INSERT INTO `ball_group_menu` VALUES (15, 360);
INSERT INTO `ball_group_menu` VALUES (15, 361);
INSERT INTO `ball_group_menu` VALUES (15, 362);
INSERT INTO `ball_group_menu` VALUES (15, 363);
INSERT INTO `ball_group_menu` VALUES (15, 364);
INSERT INTO `ball_group_menu` VALUES (15, 10);
INSERT INTO `ball_group_menu` VALUES (15, 270);
INSERT INTO `ball_group_menu` VALUES (15, 11);
INSERT INTO `ball_group_menu` VALUES (15, 13);
INSERT INTO `ball_group_menu` VALUES (15, 14);
INSERT INTO `ball_group_menu` VALUES (15, 15);
INSERT INTO `ball_group_menu` VALUES (15, 16);
INSERT INTO `ball_group_menu` VALUES (15, 17);
INSERT INTO `ball_group_menu` VALUES (15, 18);
INSERT INTO `ball_group_menu` VALUES (15, 19);
INSERT INTO `ball_group_menu` VALUES (15, 20);
INSERT INTO `ball_group_menu` VALUES (15, 21);
INSERT INTO `ball_group_menu` VALUES (15, 149);
INSERT INTO `ball_group_menu` VALUES (15, 177);
INSERT INTO `ball_group_menu` VALUES (15, 234);
INSERT INTO `ball_group_menu` VALUES (15, 235);
INSERT INTO `ball_group_menu` VALUES (15, 238);
INSERT INTO `ball_group_menu` VALUES (15, 380);
INSERT INTO `ball_group_menu` VALUES (15, 381);
INSERT INTO `ball_group_menu` VALUES (15, 12);
INSERT INTO `ball_group_menu` VALUES (15, 195);
INSERT INTO `ball_group_menu` VALUES (15, 203);
INSERT INTO `ball_group_menu` VALUES (15, 247);
INSERT INTO `ball_group_menu` VALUES (15, 331);
INSERT INTO `ball_group_menu` VALUES (15, 332);
INSERT INTO `ball_group_menu` VALUES (15, 333);
INSERT INTO `ball_group_menu` VALUES (15, 334);
INSERT INTO `ball_group_menu` VALUES (15, 335);
INSERT INTO `ball_group_menu` VALUES (15, 382);
INSERT INTO `ball_group_menu` VALUES (15, 336);
INSERT INTO `ball_group_menu` VALUES (15, 337);
INSERT INTO `ball_group_menu` VALUES (15, 338);
INSERT INTO `ball_group_menu` VALUES (15, 339);
INSERT INTO `ball_group_menu` VALUES (15, 340);
INSERT INTO `ball_group_menu` VALUES (15, 354);
INSERT INTO `ball_group_menu` VALUES (15, 355);
INSERT INTO `ball_group_menu` VALUES (15, 356);
INSERT INTO `ball_group_menu` VALUES (15, 357);
INSERT INTO `ball_group_menu` VALUES (15, 358);
INSERT INTO `ball_group_menu` VALUES (15, 365);
INSERT INTO `ball_group_menu` VALUES (15, 366);
INSERT INTO `ball_group_menu` VALUES (15, 367);
INSERT INTO `ball_group_menu` VALUES (15, 368);
INSERT INTO `ball_group_menu` VALUES (15, 369);
INSERT INTO `ball_group_menu` VALUES (15, 370);
INSERT INTO `ball_group_menu` VALUES (15, 371);
INSERT INTO `ball_group_menu` VALUES (15, 372);
INSERT INTO `ball_group_menu` VALUES (15, 373);
INSERT INTO `ball_group_menu` VALUES (15, 375);
INSERT INTO `ball_group_menu` VALUES (15, 376);
INSERT INTO `ball_group_menu` VALUES (15, 374);
INSERT INTO `ball_group_menu` VALUES (15, 39);
INSERT INTO `ball_group_menu` VALUES (15, 40);
INSERT INTO `ball_group_menu` VALUES (15, 51);
INSERT INTO `ball_group_menu` VALUES (15, 178);
INSERT INTO `ball_group_menu` VALUES (15, 236);
INSERT INTO `ball_group_menu` VALUES (15, 237);
INSERT INTO `ball_group_menu` VALUES (15, 329);
INSERT INTO `ball_group_menu` VALUES (15, 53);
INSERT INTO `ball_group_menu` VALUES (15, 246);
INSERT INTO `ball_group_menu` VALUES (15, 58);
INSERT INTO `ball_group_menu` VALUES (15, 59);
INSERT INTO `ball_group_menu` VALUES (15, 60);
INSERT INTO `ball_group_menu` VALUES (15, 61);
INSERT INTO `ball_group_menu` VALUES (15, 62);
INSERT INTO `ball_group_menu` VALUES (15, 198);
INSERT INTO `ball_group_menu` VALUES (15, 63);
INSERT INTO `ball_group_menu` VALUES (15, 64);
INSERT INTO `ball_group_menu` VALUES (15, 65);
INSERT INTO `ball_group_menu` VALUES (15, 66);
INSERT INTO `ball_group_menu` VALUES (15, 168);
INSERT INTO `ball_group_menu` VALUES (15, 169);
INSERT INTO `ball_group_menu` VALUES (15, 170);
INSERT INTO `ball_group_menu` VALUES (15, 171);
INSERT INTO `ball_group_menu` VALUES (15, 172);
INSERT INTO `ball_group_menu` VALUES (15, 218);
INSERT INTO `ball_group_menu` VALUES (15, 219);
INSERT INTO `ball_group_menu` VALUES (15, 267);
INSERT INTO `ball_group_menu` VALUES (15, 268);
INSERT INTO `ball_group_menu` VALUES (15, 67);
INSERT INTO `ball_group_menu` VALUES (15, 68);
INSERT INTO `ball_group_menu` VALUES (15, 69);
INSERT INTO `ball_group_menu` VALUES (15, 70);
INSERT INTO `ball_group_menu` VALUES (15, 71);
INSERT INTO `ball_group_menu` VALUES (15, 72);
INSERT INTO `ball_group_menu` VALUES (15, 73);
INSERT INTO `ball_group_menu` VALUES (15, 74);
INSERT INTO `ball_group_menu` VALUES (15, 75);
INSERT INTO `ball_group_menu` VALUES (15, 76);
INSERT INTO `ball_group_menu` VALUES (15, 77);
INSERT INTO `ball_group_menu` VALUES (15, 78);
INSERT INTO `ball_group_menu` VALUES (15, 79);
INSERT INTO `ball_group_menu` VALUES (15, 80);
INSERT INTO `ball_group_menu` VALUES (15, 81);
INSERT INTO `ball_group_menu` VALUES (15, 82);
INSERT INTO `ball_group_menu` VALUES (15, 83);
INSERT INTO `ball_group_menu` VALUES (15, 84);
INSERT INTO `ball_group_menu` VALUES (15, 85);
INSERT INTO `ball_group_menu` VALUES (15, 86);
INSERT INTO `ball_group_menu` VALUES (15, 87);
INSERT INTO `ball_group_menu` VALUES (15, 88);
INSERT INTO `ball_group_menu` VALUES (15, 89);
INSERT INTO `ball_group_menu` VALUES (15, 90);
INSERT INTO `ball_group_menu` VALUES (15, 91);
INSERT INTO `ball_group_menu` VALUES (15, 92);
INSERT INTO `ball_group_menu` VALUES (15, 93);
INSERT INTO `ball_group_menu` VALUES (15, 94);
INSERT INTO `ball_group_menu` VALUES (15, 95);
INSERT INTO `ball_group_menu` VALUES (15, 187);
INSERT INTO `ball_group_menu` VALUES (15, 96);
INSERT INTO `ball_group_menu` VALUES (15, 97);
INSERT INTO `ball_group_menu` VALUES (15, 150);
INSERT INTO `ball_group_menu` VALUES (15, 151);
INSERT INTO `ball_group_menu` VALUES (15, 152);
INSERT INTO `ball_group_menu` VALUES (15, 153);
INSERT INTO `ball_group_menu` VALUES (15, 154);
INSERT INTO `ball_group_menu` VALUES (15, 180);
INSERT INTO `ball_group_menu` VALUES (15, 181);
INSERT INTO `ball_group_menu` VALUES (15, 182);
INSERT INTO `ball_group_menu` VALUES (15, 183);
INSERT INTO `ball_group_menu` VALUES (15, 184);
INSERT INTO `ball_group_menu` VALUES (15, 185);
INSERT INTO `ball_group_menu` VALUES (15, 240);
INSERT INTO `ball_group_menu` VALUES (15, 241);
INSERT INTO `ball_group_menu` VALUES (15, 242);
INSERT INTO `ball_group_menu` VALUES (15, 243);
INSERT INTO `ball_group_menu` VALUES (15, 244);
INSERT INTO `ball_group_menu` VALUES (15, 98);
INSERT INTO `ball_group_menu` VALUES (15, 99);
INSERT INTO `ball_group_menu` VALUES (15, 100);
INSERT INTO `ball_group_menu` VALUES (15, 101);
INSERT INTO `ball_group_menu` VALUES (15, 102);
INSERT INTO `ball_group_menu` VALUES (15, 103);
INSERT INTO `ball_group_menu` VALUES (15, 104);
INSERT INTO `ball_group_menu` VALUES (15, 105);
INSERT INTO `ball_group_menu` VALUES (15, 106);
INSERT INTO `ball_group_menu` VALUES (15, 107);
INSERT INTO `ball_group_menu` VALUES (15, 108);
INSERT INTO `ball_group_menu` VALUES (15, 109);
INSERT INTO `ball_group_menu` VALUES (15, 110);
INSERT INTO `ball_group_menu` VALUES (15, 111);
INSERT INTO `ball_group_menu` VALUES (15, 112);
INSERT INTO `ball_group_menu` VALUES (15, 113);
INSERT INTO `ball_group_menu` VALUES (15, 114);
INSERT INTO `ball_group_menu` VALUES (15, 115);
INSERT INTO `ball_group_menu` VALUES (15, 116);
INSERT INTO `ball_group_menu` VALUES (15, 253);
INSERT INTO `ball_group_menu` VALUES (15, 254);
INSERT INTO `ball_group_menu` VALUES (15, 255);
INSERT INTO `ball_group_menu` VALUES (15, 256);
INSERT INTO `ball_group_menu` VALUES (15, 257);
INSERT INTO `ball_group_menu` VALUES (15, 258);
INSERT INTO `ball_group_menu` VALUES (15, 117);
INSERT INTO `ball_group_menu` VALUES (15, 118);
INSERT INTO `ball_group_menu` VALUES (15, 119);
INSERT INTO `ball_group_menu` VALUES (15, 120);
INSERT INTO `ball_group_menu` VALUES (15, 121);
INSERT INTO `ball_group_menu` VALUES (15, 122);
INSERT INTO `ball_group_menu` VALUES (15, 123);
INSERT INTO `ball_group_menu` VALUES (15, 124);
INSERT INTO `ball_group_menu` VALUES (15, 125);
INSERT INTO `ball_group_menu` VALUES (15, 239);
INSERT INTO `ball_group_menu` VALUES (15, 280);
INSERT INTO `ball_group_menu` VALUES (15, 330);
INSERT INTO `ball_group_menu` VALUES (15, 126);
INSERT INTO `ball_group_menu` VALUES (15, 127);
INSERT INTO `ball_group_menu` VALUES (15, 128);
INSERT INTO `ball_group_menu` VALUES (15, 129);
INSERT INTO `ball_group_menu` VALUES (15, 130);
INSERT INTO `ball_group_menu` VALUES (15, 148);
INSERT INTO `ball_group_menu` VALUES (15, 131);
INSERT INTO `ball_group_menu` VALUES (15, 132);
INSERT INTO `ball_group_menu` VALUES (15, 133);
INSERT INTO `ball_group_menu` VALUES (15, 134);
INSERT INTO `ball_group_menu` VALUES (15, 135);
INSERT INTO `ball_group_menu` VALUES (15, 136);
INSERT INTO `ball_group_menu` VALUES (15, 137);
INSERT INTO `ball_group_menu` VALUES (15, 138);
INSERT INTO `ball_group_menu` VALUES (15, 139);
INSERT INTO `ball_group_menu` VALUES (15, 140);
INSERT INTO `ball_group_menu` VALUES (15, 141);
INSERT INTO `ball_group_menu` VALUES (15, 142);
INSERT INTO `ball_group_menu` VALUES (15, 156);
INSERT INTO `ball_group_menu` VALUES (15, 157);
INSERT INTO `ball_group_menu` VALUES (15, 158);
INSERT INTO `ball_group_menu` VALUES (15, 159);
INSERT INTO `ball_group_menu` VALUES (15, 160);
INSERT INTO `ball_group_menu` VALUES (15, 163);
INSERT INTO `ball_group_menu` VALUES (15, 164);
INSERT INTO `ball_group_menu` VALUES (15, 165);
INSERT INTO `ball_group_menu` VALUES (15, 166);
INSERT INTO `ball_group_menu` VALUES (15, 167);
INSERT INTO `ball_group_menu` VALUES (15, 188);
INSERT INTO `ball_group_menu` VALUES (15, 189);
INSERT INTO `ball_group_menu` VALUES (15, 190);
INSERT INTO `ball_group_menu` VALUES (15, 191);
INSERT INTO `ball_group_menu` VALUES (15, 192);
INSERT INTO `ball_group_menu` VALUES (15, 143);
INSERT INTO `ball_group_menu` VALUES (15, 144);
INSERT INTO `ball_group_menu` VALUES (15, 145);
INSERT INTO `ball_group_menu` VALUES (15, 146);
INSERT INTO `ball_group_menu` VALUES (15, 147);
INSERT INTO `ball_group_menu` VALUES (15, 233);
INSERT INTO `ball_group_menu` VALUES (15, 9);
INSERT INTO `ball_group_menu` VALUES (15, 1);
INSERT INTO `ball_group_menu` VALUES (15, 2);
INSERT INTO `ball_group_menu` VALUES (15, 3);
INSERT INTO `ball_group_menu` VALUES (15, 4);
INSERT INTO `ball_group_menu` VALUES (15, 5);
INSERT INTO `ball_group_menu` VALUES (15, 6);
INSERT INTO `ball_group_menu` VALUES (15, 7);
INSERT INTO `ball_group_menu` VALUES (15, 8);
INSERT INTO `ball_group_menu` VALUES (15, 201);
INSERT INTO `ball_group_menu` VALUES (15, 202);
INSERT INTO `ball_group_menu` VALUES (15, 204);
INSERT INTO `ball_group_menu` VALUES (15, 205);
INSERT INTO `ball_group_menu` VALUES (15, 206);
INSERT INTO `ball_group_menu` VALUES (15, 207);
INSERT INTO `ball_group_menu` VALUES (15, 208);
INSERT INTO `ball_group_menu` VALUES (15, 224);
INSERT INTO `ball_group_menu` VALUES (15, 225);
INSERT INTO `ball_group_menu` VALUES (15, 226);
INSERT INTO `ball_group_menu` VALUES (15, 209);
INSERT INTO `ball_group_menu` VALUES (15, 223);
INSERT INTO `ball_group_menu` VALUES (14, 341);
INSERT INTO `ball_group_menu` VALUES (14, 342);
INSERT INTO `ball_group_menu` VALUES (14, 343);
INSERT INTO `ball_group_menu` VALUES (14, 344);
INSERT INTO `ball_group_menu` VALUES (14, 345);
INSERT INTO `ball_group_menu` VALUES (14, 346);
INSERT INTO `ball_group_menu` VALUES (14, 347);
INSERT INTO `ball_group_menu` VALUES (14, 348);
INSERT INTO `ball_group_menu` VALUES (14, 377);
INSERT INTO `ball_group_menu` VALUES (14, 349);
INSERT INTO `ball_group_menu` VALUES (14, 350);
INSERT INTO `ball_group_menu` VALUES (14, 351);
INSERT INTO `ball_group_menu` VALUES (14, 378);
INSERT INTO `ball_group_menu` VALUES (14, 352);
INSERT INTO `ball_group_menu` VALUES (14, 353);
INSERT INTO `ball_group_menu` VALUES (14, 379);
INSERT INTO `ball_group_menu` VALUES (14, 359);
INSERT INTO `ball_group_menu` VALUES (14, 360);
INSERT INTO `ball_group_menu` VALUES (14, 361);
INSERT INTO `ball_group_menu` VALUES (14, 362);
INSERT INTO `ball_group_menu` VALUES (14, 363);
INSERT INTO `ball_group_menu` VALUES (14, 364);
INSERT INTO `ball_group_menu` VALUES (14, 10);
INSERT INTO `ball_group_menu` VALUES (14, 270);
INSERT INTO `ball_group_menu` VALUES (14, 11);
INSERT INTO `ball_group_menu` VALUES (14, 13);
INSERT INTO `ball_group_menu` VALUES (14, 14);
INSERT INTO `ball_group_menu` VALUES (14, 15);
INSERT INTO `ball_group_menu` VALUES (14, 16);
INSERT INTO `ball_group_menu` VALUES (14, 17);
INSERT INTO `ball_group_menu` VALUES (14, 18);
INSERT INTO `ball_group_menu` VALUES (14, 19);
INSERT INTO `ball_group_menu` VALUES (14, 20);
INSERT INTO `ball_group_menu` VALUES (14, 21);
INSERT INTO `ball_group_menu` VALUES (14, 149);
INSERT INTO `ball_group_menu` VALUES (14, 177);
INSERT INTO `ball_group_menu` VALUES (14, 234);
INSERT INTO `ball_group_menu` VALUES (14, 235);
INSERT INTO `ball_group_menu` VALUES (14, 238);
INSERT INTO `ball_group_menu` VALUES (14, 380);
INSERT INTO `ball_group_menu` VALUES (14, 381);
INSERT INTO `ball_group_menu` VALUES (14, 12);
INSERT INTO `ball_group_menu` VALUES (14, 195);
INSERT INTO `ball_group_menu` VALUES (14, 203);
INSERT INTO `ball_group_menu` VALUES (14, 247);
INSERT INTO `ball_group_menu` VALUES (14, 332);
INSERT INTO `ball_group_menu` VALUES (14, 333);
INSERT INTO `ball_group_menu` VALUES (14, 334);
INSERT INTO `ball_group_menu` VALUES (14, 335);
INSERT INTO `ball_group_menu` VALUES (14, 336);
INSERT INTO `ball_group_menu` VALUES (14, 337);
INSERT INTO `ball_group_menu` VALUES (14, 338);
INSERT INTO `ball_group_menu` VALUES (14, 339);
INSERT INTO `ball_group_menu` VALUES (14, 340);
INSERT INTO `ball_group_menu` VALUES (14, 354);
INSERT INTO `ball_group_menu` VALUES (14, 355);
INSERT INTO `ball_group_menu` VALUES (14, 356);
INSERT INTO `ball_group_menu` VALUES (14, 357);
INSERT INTO `ball_group_menu` VALUES (14, 358);
INSERT INTO `ball_group_menu` VALUES (14, 365);
INSERT INTO `ball_group_menu` VALUES (14, 366);
INSERT INTO `ball_group_menu` VALUES (14, 367);
INSERT INTO `ball_group_menu` VALUES (14, 368);
INSERT INTO `ball_group_menu` VALUES (14, 369);
INSERT INTO `ball_group_menu` VALUES (14, 370);
INSERT INTO `ball_group_menu` VALUES (14, 371);
INSERT INTO `ball_group_menu` VALUES (14, 372);
INSERT INTO `ball_group_menu` VALUES (14, 373);
INSERT INTO `ball_group_menu` VALUES (14, 375);
INSERT INTO `ball_group_menu` VALUES (14, 376);
INSERT INTO `ball_group_menu` VALUES (14, 374);
INSERT INTO `ball_group_menu` VALUES (14, 39);
INSERT INTO `ball_group_menu` VALUES (14, 40);
INSERT INTO `ball_group_menu` VALUES (14, 51);
INSERT INTO `ball_group_menu` VALUES (14, 178);
INSERT INTO `ball_group_menu` VALUES (14, 236);
INSERT INTO `ball_group_menu` VALUES (14, 237);
INSERT INTO `ball_group_menu` VALUES (14, 329);
INSERT INTO `ball_group_menu` VALUES (14, 53);
INSERT INTO `ball_group_menu` VALUES (14, 246);
INSERT INTO `ball_group_menu` VALUES (14, 58);
INSERT INTO `ball_group_menu` VALUES (14, 59);
INSERT INTO `ball_group_menu` VALUES (14, 60);
INSERT INTO `ball_group_menu` VALUES (14, 61);
INSERT INTO `ball_group_menu` VALUES (14, 62);
INSERT INTO `ball_group_menu` VALUES (14, 198);
INSERT INTO `ball_group_menu` VALUES (14, 63);
INSERT INTO `ball_group_menu` VALUES (14, 64);
INSERT INTO `ball_group_menu` VALUES (14, 65);
INSERT INTO `ball_group_menu` VALUES (14, 66);
INSERT INTO `ball_group_menu` VALUES (14, 168);
INSERT INTO `ball_group_menu` VALUES (14, 169);
INSERT INTO `ball_group_menu` VALUES (14, 170);
INSERT INTO `ball_group_menu` VALUES (14, 171);
INSERT INTO `ball_group_menu` VALUES (14, 172);
INSERT INTO `ball_group_menu` VALUES (14, 218);
INSERT INTO `ball_group_menu` VALUES (14, 219);
INSERT INTO `ball_group_menu` VALUES (14, 267);
INSERT INTO `ball_group_menu` VALUES (14, 268);
INSERT INTO `ball_group_menu` VALUES (14, 67);
INSERT INTO `ball_group_menu` VALUES (14, 68);
INSERT INTO `ball_group_menu` VALUES (14, 69);
INSERT INTO `ball_group_menu` VALUES (14, 70);
INSERT INTO `ball_group_menu` VALUES (14, 71);
INSERT INTO `ball_group_menu` VALUES (14, 72);
INSERT INTO `ball_group_menu` VALUES (14, 73);
INSERT INTO `ball_group_menu` VALUES (14, 74);
INSERT INTO `ball_group_menu` VALUES (14, 75);
INSERT INTO `ball_group_menu` VALUES (14, 76);
INSERT INTO `ball_group_menu` VALUES (14, 77);
INSERT INTO `ball_group_menu` VALUES (14, 78);
INSERT INTO `ball_group_menu` VALUES (14, 79);
INSERT INTO `ball_group_menu` VALUES (14, 80);
INSERT INTO `ball_group_menu` VALUES (14, 81);
INSERT INTO `ball_group_menu` VALUES (14, 82);
INSERT INTO `ball_group_menu` VALUES (14, 83);
INSERT INTO `ball_group_menu` VALUES (14, 84);
INSERT INTO `ball_group_menu` VALUES (14, 85);
INSERT INTO `ball_group_menu` VALUES (14, 86);
INSERT INTO `ball_group_menu` VALUES (14, 87);
INSERT INTO `ball_group_menu` VALUES (14, 88);
INSERT INTO `ball_group_menu` VALUES (14, 89);
INSERT INTO `ball_group_menu` VALUES (14, 90);
INSERT INTO `ball_group_menu` VALUES (14, 91);
INSERT INTO `ball_group_menu` VALUES (14, 92);
INSERT INTO `ball_group_menu` VALUES (14, 93);
INSERT INTO `ball_group_menu` VALUES (14, 94);
INSERT INTO `ball_group_menu` VALUES (14, 95);
INSERT INTO `ball_group_menu` VALUES (14, 187);
INSERT INTO `ball_group_menu` VALUES (14, 96);
INSERT INTO `ball_group_menu` VALUES (14, 97);
INSERT INTO `ball_group_menu` VALUES (14, 150);
INSERT INTO `ball_group_menu` VALUES (14, 151);
INSERT INTO `ball_group_menu` VALUES (14, 152);
INSERT INTO `ball_group_menu` VALUES (14, 153);
INSERT INTO `ball_group_menu` VALUES (14, 154);
INSERT INTO `ball_group_menu` VALUES (14, 180);
INSERT INTO `ball_group_menu` VALUES (14, 181);
INSERT INTO `ball_group_menu` VALUES (14, 182);
INSERT INTO `ball_group_menu` VALUES (14, 183);
INSERT INTO `ball_group_menu` VALUES (14, 184);
INSERT INTO `ball_group_menu` VALUES (14, 185);
INSERT INTO `ball_group_menu` VALUES (14, 240);
INSERT INTO `ball_group_menu` VALUES (14, 241);
INSERT INTO `ball_group_menu` VALUES (14, 242);
INSERT INTO `ball_group_menu` VALUES (14, 243);
INSERT INTO `ball_group_menu` VALUES (14, 244);
INSERT INTO `ball_group_menu` VALUES (14, 98);
INSERT INTO `ball_group_menu` VALUES (14, 99);
INSERT INTO `ball_group_menu` VALUES (14, 100);
INSERT INTO `ball_group_menu` VALUES (14, 101);
INSERT INTO `ball_group_menu` VALUES (14, 102);
INSERT INTO `ball_group_menu` VALUES (14, 103);
INSERT INTO `ball_group_menu` VALUES (14, 104);
INSERT INTO `ball_group_menu` VALUES (14, 105);
INSERT INTO `ball_group_menu` VALUES (14, 106);
INSERT INTO `ball_group_menu` VALUES (14, 107);
INSERT INTO `ball_group_menu` VALUES (14, 108);
INSERT INTO `ball_group_menu` VALUES (14, 109);
INSERT INTO `ball_group_menu` VALUES (14, 110);
INSERT INTO `ball_group_menu` VALUES (14, 111);
INSERT INTO `ball_group_menu` VALUES (14, 112);
INSERT INTO `ball_group_menu` VALUES (14, 113);
INSERT INTO `ball_group_menu` VALUES (14, 114);
INSERT INTO `ball_group_menu` VALUES (14, 115);
INSERT INTO `ball_group_menu` VALUES (14, 116);
INSERT INTO `ball_group_menu` VALUES (14, 253);
INSERT INTO `ball_group_menu` VALUES (14, 254);
INSERT INTO `ball_group_menu` VALUES (14, 255);
INSERT INTO `ball_group_menu` VALUES (14, 256);
INSERT INTO `ball_group_menu` VALUES (14, 257);
INSERT INTO `ball_group_menu` VALUES (14, 258);
INSERT INTO `ball_group_menu` VALUES (14, 117);
INSERT INTO `ball_group_menu` VALUES (14, 118);
INSERT INTO `ball_group_menu` VALUES (14, 119);
INSERT INTO `ball_group_menu` VALUES (14, 120);
INSERT INTO `ball_group_menu` VALUES (14, 121);
INSERT INTO `ball_group_menu` VALUES (14, 122);
INSERT INTO `ball_group_menu` VALUES (14, 123);
INSERT INTO `ball_group_menu` VALUES (14, 124);
INSERT INTO `ball_group_menu` VALUES (14, 125);
INSERT INTO `ball_group_menu` VALUES (14, 239);
INSERT INTO `ball_group_menu` VALUES (14, 280);
INSERT INTO `ball_group_menu` VALUES (14, 330);
INSERT INTO `ball_group_menu` VALUES (14, 126);
INSERT INTO `ball_group_menu` VALUES (14, 127);
INSERT INTO `ball_group_menu` VALUES (14, 128);
INSERT INTO `ball_group_menu` VALUES (14, 129);
INSERT INTO `ball_group_menu` VALUES (14, 130);
INSERT INTO `ball_group_menu` VALUES (14, 148);
INSERT INTO `ball_group_menu` VALUES (14, 131);
INSERT INTO `ball_group_menu` VALUES (14, 132);
INSERT INTO `ball_group_menu` VALUES (14, 133);
INSERT INTO `ball_group_menu` VALUES (14, 134);
INSERT INTO `ball_group_menu` VALUES (14, 135);
INSERT INTO `ball_group_menu` VALUES (14, 136);
INSERT INTO `ball_group_menu` VALUES (14, 137);
INSERT INTO `ball_group_menu` VALUES (14, 138);
INSERT INTO `ball_group_menu` VALUES (14, 139);
INSERT INTO `ball_group_menu` VALUES (14, 140);
INSERT INTO `ball_group_menu` VALUES (14, 141);
INSERT INTO `ball_group_menu` VALUES (14, 142);
INSERT INTO `ball_group_menu` VALUES (14, 156);
INSERT INTO `ball_group_menu` VALUES (14, 157);
INSERT INTO `ball_group_menu` VALUES (14, 158);
INSERT INTO `ball_group_menu` VALUES (14, 159);
INSERT INTO `ball_group_menu` VALUES (14, 160);
INSERT INTO `ball_group_menu` VALUES (14, 163);
INSERT INTO `ball_group_menu` VALUES (14, 164);
INSERT INTO `ball_group_menu` VALUES (14, 165);
INSERT INTO `ball_group_menu` VALUES (14, 166);
INSERT INTO `ball_group_menu` VALUES (14, 167);
INSERT INTO `ball_group_menu` VALUES (14, 188);
INSERT INTO `ball_group_menu` VALUES (14, 189);
INSERT INTO `ball_group_menu` VALUES (14, 190);
INSERT INTO `ball_group_menu` VALUES (14, 191);
INSERT INTO `ball_group_menu` VALUES (14, 192);
INSERT INTO `ball_group_menu` VALUES (14, 143);
INSERT INTO `ball_group_menu` VALUES (14, 144);
INSERT INTO `ball_group_menu` VALUES (14, 145);
INSERT INTO `ball_group_menu` VALUES (14, 146);
INSERT INTO `ball_group_menu` VALUES (14, 147);
INSERT INTO `ball_group_menu` VALUES (14, 233);
INSERT INTO `ball_group_menu` VALUES (14, 9);
INSERT INTO `ball_group_menu` VALUES (14, 1);
INSERT INTO `ball_group_menu` VALUES (14, 2);
INSERT INTO `ball_group_menu` VALUES (14, 3);
INSERT INTO `ball_group_menu` VALUES (14, 4);
INSERT INTO `ball_group_menu` VALUES (14, 5);
INSERT INTO `ball_group_menu` VALUES (14, 6);
INSERT INTO `ball_group_menu` VALUES (14, 7);
INSERT INTO `ball_group_menu` VALUES (14, 8);
INSERT INTO `ball_group_menu` VALUES (14, 201);
INSERT INTO `ball_group_menu` VALUES (14, 202);
INSERT INTO `ball_group_menu` VALUES (14, 204);
INSERT INTO `ball_group_menu` VALUES (14, 205);
INSERT INTO `ball_group_menu` VALUES (14, 206);
INSERT INTO `ball_group_menu` VALUES (14, 207);
INSERT INTO `ball_group_menu` VALUES (14, 208);
INSERT INTO `ball_group_menu` VALUES (14, 224);
INSERT INTO `ball_group_menu` VALUES (14, 225);
INSERT INTO `ball_group_menu` VALUES (14, 226);
INSERT INTO `ball_group_menu` VALUES (14, 209);
INSERT INTO `ball_group_menu` VALUES (14, 223);
INSERT INTO `ball_group_menu` VALUES (14, 331);
INSERT INTO `ball_group_menu` VALUES (1, 383);
INSERT INTO `ball_group_menu` VALUES (1, 384);
INSERT INTO `ball_group_menu` VALUES (1, 385);
INSERT INTO `ball_group_menu` VALUES (1, 386);
INSERT INTO `ball_group_menu` VALUES (1, 387);
INSERT INTO `ball_group_menu` VALUES (1, 388);
INSERT INTO `ball_group_menu` VALUES (1, 389);
INSERT INTO `ball_group_menu` VALUES (1, 390);

-- ----------------------------
-- Table structure for ball_logger_back
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_back`;
CREATE TABLE `ball_logger_back`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NOT NULL,
  `game_id` bigint NULL DEFAULT 0,
  `type` tinyint NOT NULL,
  `money` bigint NOT NULL,
  `status` tinyint NOT NULL,
  `created_at` bigint NOT NULL,
  `account_type` tinyint NULL DEFAULT NULL,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `player_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `top_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ymd` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `start_time` bigint NULL DEFAULT 0,
  `start_ymd` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `step` int NULL DEFAULT NULL,
  `from_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `from_step` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ymd_index`(`ymd` ASC) USING BTREE,
  INDEX `super_tree_step`(`super_tree` ASC, `step` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_back
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_bind_card
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_bind_card`;
CREATE TABLE `ball_logger_bind_card`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NOT NULL COMMENT '玩家ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `card_number` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '卡号',
  `bank_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '银行名字',
  `card_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '持卡人姓名',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0,
  `ctype` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '银行卡' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_bind_card
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_handsup
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_handsup`;
CREATE TABLE `ball_logger_handsup`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT 0,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` bigint NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT 0 COMMENT '1.线下,2.线上\"',
  `money` bigint NOT NULL DEFAULT 0 COMMENT '充值金额',
  `oper_user` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单号',
  `qrmult` tinyint NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `super_tree` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `account_type` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_name`(`type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '下注日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_handsup
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_login
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_login`;
CREATE TABLE `ball_logger_login`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '日志种类 1下注日志(玩家) 2登录日志 3操作日志',
  `super_player_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '管理员id  默认为0',
  `devices` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '玩家日志 默认为 0',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作的ip',
  `ip_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_name`(`player_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_login
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_oper
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_oper`;
CREATE TABLE `ball_logger_oper`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `main_func` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '管理模块',
  `sub_func` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作方法',
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '备注',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作的ip',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作账号',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `player_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `playerName`(`player_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_oper
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_rebate
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_rebate`;
CREATE TABLE `ball_logger_rebate`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT NULL,
  `from_player_id` bigint NULL DEFAULT NULL,
  `account_type` tinyint NULL DEFAULT NULL,
  `player_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `top_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `first_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `from_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT NULL,
  `pay_id` bigint NULL DEFAULT NULL,
  `pay_type` tinyint NULL DEFAULT 0,
  `pay_type_onff` tinyint NULL DEFAULT 0,
  `money` bigint NULL DEFAULT NULL,
  `money_real` bigint NULL DEFAULT NULL,
  `money_usdt` bigint NULL DEFAULT 0,
  `rate_usdt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `fixed` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `status` tinyint NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `step` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `super_tree_step`(`super_tree` ASC, `step` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_rebate
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_recharge`;
CREATE TABLE `ball_logger_recharge`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` bigint NULL DEFAULT NULL,
  `player_id` bigint NULL DEFAULT 0,
  `type` tinyint NULL DEFAULT 0 COMMENT '1.线下,2.线上\"',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态1待付款/2已付款/3已取消/',
  `money` bigint NOT NULL DEFAULT 0 COMMENT '充值金额',
  `money_real` bigint NULL DEFAULT 0,
  `money_sys` bigint NULL DEFAULT 0,
  `money_discount` bigint NULL DEFAULT 0,
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单号',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `user_id` bigint NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oper_user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_id` bigint NULL DEFAULT NULL,
  `account_type` tinyint NULL DEFAULT 0,
  `top_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `first_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `first` tinyint NULL DEFAULT 0,
  `step` int NULL DEFAULT NULL,
  `money_commission` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_unique`(`order_no` ASC) USING BTREE,
  INDEX `player_name`(`username` ASC) USING BTREE,
  INDEX `super_tree_step`(`super_tree` ASC, `step` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '下注日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_sms
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_sms`;
CREATE TABLE `ball_logger_sms`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `sms_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `status` tinyint NULL DEFAULT 1,
  `request` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `response` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phone`(`phone` ASC) USING BTREE,
  INDEX `player_name`(`player_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_sms
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_together
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_together`;
CREATE TABLE `ball_logger_together`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `oid` bigint NULL DEFAULT NULL,
  `player_id` bigint NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 0,
  `money` bigint NULL DEFAULT 0,
  `order_money` bigint NULL DEFAULT 0,
  `step` int NULL DEFAULT 0,
  `money_income` bigint NULL DEFAULT 0,
  `from_user` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `player_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `order_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `expect` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_id`(`player_id` ASC) USING BTREE,
  INDEX `step_supertree`(`super_tree` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 151778 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_together
-- ----------------------------

-- ----------------------------
-- Table structure for ball_logger_withdrawal
-- ----------------------------
DROP TABLE IF EXISTS `ball_logger_withdrawal`;
CREATE TABLE `ball_logger_withdrawal`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT 0,
  `player_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT 0 COMMENT '1.线下,2.线上\"',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '状态1待付款/2已付款/3已取消/',
  `money` bigint NOT NULL DEFAULT 0 COMMENT '充值金额',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单号',
  `rate` int NULL DEFAULT NULL,
  `commission` bigint NULL DEFAULT NULL,
  `checker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `oker` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '处理时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_type` tinyint NULL DEFAULT NULL,
  `behalf_status` tinyint NULL DEFAULT 3,
  `behalf_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `usdt_rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `usdt_money` bigint NULL DEFAULT 0,
  `top_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `first_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `remark_fail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `behalf_id` bigint NULL DEFAULT NULL,
  `behalf_time` bigint NULL DEFAULT 0,
  `ip_addr` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `to_bank` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `to_bank_account` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `step` int NULL DEFAULT NULL,
  `to_bank_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_unique`(`order_no` ASC) USING BTREE,
  INDEX `player_name`(`player_name` ASC) USING BTREE,
  INDEX `super_tree_step`(`super_tree` ASC, `step` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '下注日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_logger_withdrawal
-- ----------------------------

-- ----------------------------
-- Table structure for ball_menu
-- ----------------------------
DROP TABLE IF EXISTS `ball_menu`;
CREATE TABLE `ball_menu`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` bigint NULL DEFAULT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求路径',
  `is_menu` tinyint NULL DEFAULT 0 COMMENT '0否1是',
  `status` tinyint NULL DEFAULT 1 COMMENT '1正常2废除',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 391 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_menu
-- ----------------------------
INSERT INTO `ball_menu` VALUES (1, 9, '用户管理', '/lottery/admin', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (2, 1, '增加', '/lottery/admin/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (3, 1, '修改', '/lottery/admin/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (4, 1, '删除', '/lottery/admin/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (5, 9, '角色管理', '/lottery/group', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (6, 5, '增加', '/lottery/group/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (7, 5, '修改', '/lottery/group/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (8, 5, '删除', '/lottery/group/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (9, 0, '系统管理', '/lottery/sysconfig_root', 99, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (10, 0, '会员管理', '/lottery/player/main', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (11, 10, '会员管理', '/lottery/player', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (12, 10, '会员账务汇总', '/lottery/player/finance', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (13, 11, '增加', '/lottery/player/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (14, 11, '修改', '/lottery/player/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (15, 11, '查看', '/lottery/player/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (16, 11, '账变记录', '/lottery/player/log', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (17, 11, '更改密码', '/lottery/player/edit_pwd', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (18, 11, '更改支付密码', '/lottery/player/edit_pay_pwd', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (19, 11, '禁/启用', '/lottery/player/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (20, 11, '上分', '/lottery/player/add_balance', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (21, 11, '修改出款打码量', '/lottery/player/captcha_pass', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (39, 0, '报表管理', '/lottery/report/main', 3, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (40, 39, '数据总览', '/lottery/report/data', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (51, 39, '充值渠道', '/lottery/report/recharge_way', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (53, 0, '订单管理', '/lottery/bets/main', 4, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (54, 22, '投资订单', '/lottery/nft/plan/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (55, 54, '查看', '/lottery/bets/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (56, 54, '撤单', '/lottery/bets/undo', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (57, 54, '导出', '/lottery/bets/export', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (58, 0, '策略配置', '/lottery/tactics/main', 5, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (59, 58, '存款优惠', '/lottery/tactics/inout', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (60, 59, '增加', '/lottery/tactics/inout/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (61, 59, '修改', '/lottery/tactics/inout/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (62, 59, '删除', '/lottery/tactics/inout/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (63, 58, '返佣策略', '/lottery/tactics/back', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (64, 63, '增加', '/lottery/tactics/back/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (65, 63, '修改', '/lottery/tactics/back/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (66, 63, '删除', '/lottery/tactics/back/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (67, 0, '账务管理', '/lottery/finance/main', 6, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (68, 67, '支付管理', '/lottery/finance/pay', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (69, 68, '增加', '/lottery/finance/pay/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (70, 68, '修改', '/lottery/finance/pay/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (71, 68, '禁/启用', '/lottery/finance/pay/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (72, 68, '查看', '/lottery/finance/pay/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (73, 68, '删除', '/lottery/finance/pay/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (74, 67, '提现方式管理', '/lottery/finance/withdraw', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (75, 74, '增加', '/lottery/finance/withdraw/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (76, 74, '修改', '/lottery/finance/withdraw/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (77, 74, '禁/启用', '/lottery/finance/withdraw/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (78, 74, '查看', '/lottery/finance/withdraw/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (79, 74, '删除', '/lottery/finance/withdraw/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (80, 67, '绑卡审核', '/lottery/finance/bind', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (81, 80, '查看', '/lottery/finance/bind/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (82, 80, '修改', '/lottery/finance/bind/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (83, 80, '禁/启用', '/lottery/finance/bind/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (84, 80, '导出', '/lottery/finance/bind/export', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (85, 67, '线下充值', '/lottery/finance/offline', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (86, 85, '查看', '/lottery/finance/offline/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (87, 85, '导出', '/lottery/finance/offline/export', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (88, 67, '线上充值', '/lottery/finance/online', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (89, 88, '查看', '/lottery/finance/online/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (90, 88, '上分', '/lottery/finance/online/up', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (91, 88, '导出', '/lottery/finance/online/export', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (92, 67, '提现管理', '/lottery/finance/out', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (93, 92, '查看', '/lottery/finance/out/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (94, 92, '审核', '/lottery/finance/out/check', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (95, 92, '导出', '/lottery/finance/out/export', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (96, 67, '上分记录', '/lottery/finance/inlog', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (97, 96, '导出', '/lottery/finance/export', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (98, 0, '运营管理', '/lottery/operation/main', 7, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (99, 98, 'Banner管理', '/lottery/operation/banner', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (100, 99, '增加', '/lottery/operation/banner/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (101, 99, '修改', '/lottery/operation/banner/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (102, 99, '禁/启用', '/lottery/operation/banner/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (103, 99, '查看', '/lottery/operation/banner/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (104, 99, '删除', '/lottery/operation/banner/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (105, 98, '轮播公告', '/lottery/operation/swiper', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (106, 105, '增加', '/lottery/operation/swiper/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (107, 105, '修改', '/lottery/operation/swiper/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (108, 105, '禁/启用', '/lottery/operation/swiper/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (109, 105, '查看', '/lottery/operation/swiper/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (110, 105, '删除', '/lottery/operation/swiper/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (111, 98, '系统公告', '/lottery/operation/notice', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (112, 111, '增加', '/lottery/operation/notice/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (113, 111, '修改', '/lottery/operation/notice/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (114, 111, '禁/启用', '/lottery/operation/notice/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (115, 111, '查看', '/lottery/operation/notice/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (116, 111, '删除', '/lottery/operation/notice/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (117, 0, '商户配置', '/lottery/merchant/main', 8, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (118, 117, '参数配置', '/lottery/merchant/param', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (119, 118, '系统配置', '/lottery/merchant/param/sys', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (120, 118, '注册/登录', '/lottery/merchant/param/loreg', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (121, 118, '客服配置', '/lottery/merchant/param/servicer', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (122, 118, '财务配置', '/lottery/merchant/param/finance', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (123, 118, '风控配置', '/lottery/merchant/param/risk', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (124, 118, '运营配置', '/lottery/merchant/param/operate', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (125, 118, '推广配置', '/lottery/merchant/param/share', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (126, 117, 'VIP配置', '/lottery/merchant/vip', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (127, 126, '增加', '/lottery/merchant/vip/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (128, 126, '修改', '/lottery/merchant/vip/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (129, 126, '查看', '/lottery/merchant/vip/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (130, 126, '删除', '/lottery/merchant/vip/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (131, 117, '后台白名单', '/lottery/merchant/white', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (132, 131, '增加', '/lottery/merchant/white/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (133, 131, '修改', '/lottery/merchant/white/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (134, 131, '禁/启用', '/lottery/merchant/white/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (135, 131, '查看', '/lottery/merchant/white/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (136, 131, '删除', '/lottery/merchant/white/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (137, 117, '前端黑名单', '/lottery/merchant/black', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (138, 137, '增加', '/lottery/merchant/black/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (139, 137, '修改', '/lottery/merchant/black/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (140, 137, '禁/启用', '/lottery/merchant/black/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (141, 137, '查看', '/lottery/merchant/black/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (142, 137, '删除', '/lottery/merchant/black/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (143, 0, '日志管理', '/lottery/log/main', 9, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (144, 143, '下注日志', '/lottery/log/bet', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (145, 143, '登录日志', '/lottery/log/login', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (146, 143, '操作日志', '/lottery/log/operate', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (147, 143, '代理迁移', '/lottery/log/proxy_change', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (148, 126, '状态', '/lottery/merchant/vip/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (149, 11, '设置会员等级', '/lottery/player/edit_level', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (150, 67, '会员USDT', '/lottery/finance/usdt', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (151, 150, '查看', '/lottery/finance/usdt/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (152, 150, '修改', '/lottery/finance/usdt/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (153, 150, '禁/启用', '/lottery/finance/usdt/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (154, 150, '审核', '/lottery/finance/usdt/check', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (155, 23, '结算', '/lottery/game/hand_open', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (156, 117, 'App管理', '/lottery/merchant/app', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (157, 156, '增加', '/lottery/merchant/app/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (158, 156, '修改', '/lottery/merchant/app/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (159, 156, '禁/启用', '/lottery/merchant/app/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (160, 156, '删除', '/lottery/merchant/app/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (161, 23, '添加', '/lottery/game/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (162, 23, '添加-上传', '/lottery/game/add/upload', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (163, 117, 'IP访问限制', '/lottery/merchant/ip_country', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (164, 163, '增加', '/lottery/merchant/ip_country/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (165, 163, '修改', '/lottery/merchant/ip_country/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (166, 163, '删除', '/lottery/merchant/ip_country/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (167, 163, '禁/启用', '/lottery/merchant/ip_country/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (168, 58, '奖金策略', '/lottery/tactics/bonus', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (169, 168, '增加', '/lottery/tactics/bonus/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (170, 168, '修改', '/lottery/tactics/bonus/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (171, 168, '删除', '/lottery/tactics/bonus/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (172, 168, '禁用/启用', '/lottery/tactics/bonus/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (177, 11, '查看IP', '/lottery/player/query_ip', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (178, 39, '下注日报表', '/lottery/report/bet_day', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (179, 23, '撤消', '/lottery/game/cancel', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (180, 67, '代付管理', '/lottery/finance/behalf', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (181, 180, '增加', '/lottery/finance/behalf/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (182, 180, '修改', '/lottery/finance/behalf/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (183, 180, '禁/启用', '/lottery/finance/behalf/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (184, 180, '查看', '/lottery/finance/behalf/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (185, 180, '代付款', '/lottery/finance/behalf/pay', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (187, 92, '代付', '/lottery/finance/out/behalf', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (188, 117, '提现失败配置', '/lottery/merchant/wfail', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (189, 188, '增加', '/lottery/merchant/wfail/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (190, 188, '修改', '/lottery/merchant/wfail/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (191, 188, '禁/启用', '/lottery/merchant/wfail/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (192, 188, '删除', '/lottery/merchant/wfail/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (195, 10, '短信验证码', '/lottery/player/sms', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (198, 59, '禁/启用', '/lottery/tactics/inout/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (201, 9, 'API管理', '/lottery/api_config', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (202, 201, '修改', '/lottery/api_config/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (203, 10, '活跃会员查询', '/lottery/player/active', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (204, 9, '时区管理', '/lottery/timezone', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (205, 204, '增加', '/lottery/timezone/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (206, 204, '修改', '/lottery/timezone/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (207, 204, '删除', '/lottery/timezone/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (208, 204, '设置', '/lottery/timezone/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (209, 9, '银行管理', '/lottery/bank', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (210, 210, '增加地区', '/lottery/bank/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (211, 210, '修改地区', '/lottery/bank/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (212, 210, '删除地区', '/lottery/bank/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (213, 210, '切换地区', '/lottery/bank/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (214, 210, '增加银行', '/lottery/bank/bank/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (215, 210, '修改银行', '/lottery/bank/bank/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (216, 210, '删除银行', '/lottery/bank/bank/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (217, 210, '银行列表', '/lottery/bank/bank', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (218, 58, '返佣策略', '/lottery/tactics/recharge', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (219, 218, '修改', '/lottery/tactics/recharge/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (222, 54, '结算', '/lottery/bets/settle', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (223, 9, '国家管理', '/lottery/country', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (224, 204, '增加', '/lottery/country/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (225, 204, '修改', '/lottery/country/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (226, 204, '删除', '/lottery/country/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (233, 143, '首充日志', '/lottery/log/first', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (234, 11, '补充值', '/lottery/player/repair_re', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (235, 11, '补提现', '/lottery/player/repair_wi', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (236, 39, '代理报表', '/lottery/report/proxy2', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (237, 39, '彩种报表', '/lottery/report/lottery', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (238, 11, '会员群消息', '/lottery/player/rebate', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (239, 118, '汇率配置', '/lottery/merchant/param/rate', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (240, 67, '会员SIM', '/lottery/finance/sim', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (241, 240, '查看', '/lottery/finance/sim/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (242, 240, '修改', '/lottery/finance/sim/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (243, 240, '禁/启用', '/lottery/finance/sim/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (244, 240, '审核', '/lottery/finance/sim/check', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (246, 53, '补返利', '/lottery/bets/repair', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (247, 10, '返佣查询', '/lottery/player/backq', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (253, 98, '弹窗公告', '/lottery/operation/dialog', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (254, 253, '增加', '/lottery/operation/dialog/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (255, 253, '修改', '/lottery/operation/dialog/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (256, 253, '禁/启用', '/lottery/operation/dialog/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (257, 253, '查看', '/lottery/operation/dialog/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (258, 253, '删除', '/lottery/operation/dialog/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (263, 262, '修改', '/lottery/safe/account/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (265, 261, '拉回', '/lottery/safe/recharge/reback', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (266, 262, '账变记录', '/lottery/safe/account/change', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (267, 58, '团队激励', '/lottery/tactics/team', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (268, 267, '修改', '/lottery/tactics/team/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (270, 10, '团队激励查询', '/lottery/player/group', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (276, 275, '查看', '/lottery/finance/wallet/info', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (277, 275, '修改', '/lottery/finance/wallet/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (278, 275, '禁/启用', '/lottery/finance/wallet/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (279, 275, '审核', '/lottery/finance/wallet/check', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (280, 118, '消费队列', '/lottery/merchant/param/queue', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (281, 261, '查看', '/lottery/safe/recharge', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (329, 39, '会员日报表', '/lottery/report/player', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (330, 118, '维护配置', '/lottery/merchant/param/stop', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (331, 0, '彩票管理', '/lottery/lotterys', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (332, 331, '查看', '/lottery/lotterys/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (333, 331, '添加', '/lottery/lotterys/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (334, 331, '修改', '/lottery/lotterys/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (335, 331, '状态', '/lottery/lotterys/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (336, 0, '开奖管理', '/lottery/openLog', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (337, 336, '查看', '/lottery/openLog/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (338, 336, '添加', '/lottery/openLog/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (339, 336, '修改', '/lottery/openLog/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (340, 336, '手动开奖', '/lottery/openLog/open', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (341, 0, '短信管理', '/lottery/sms', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (342, 341, '短信验证码', '/lottery/sms/code', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (343, 341, '短信设置', '/lottery/sms/config', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (344, 341, '短信日志', '/lottery/sms/log', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (345, 0, '订单管理', '/lottery/orders', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (346, 345, '自购订单', '/lottery/order', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (347, 346, '查看', '/lottery/order/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (348, 346, '手动开奖', '/lottery/order/open', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (349, 345, '合买订单管理', '/lottery/together', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (350, 349, '查看', '/lottery/together/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (351, 349, '手动开奖', '/lottery/together/open', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (352, 345, '追号订单管理', '/lottery/reorder', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (353, 352, '查看', '/lottery/reorder/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (354, 0, '待办事项', '/lottery/todo_list', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (355, 354, '存款优惠', '/lottery/todo/recharge', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (356, 354, '存款返佣', '/lottery/todo/recharge/back', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (357, 354, '盈利返佣', '/lottery/todo/bet', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (358, 354, '综合待办', '/lottery/todo/all', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (359, 0, '余额宝', '/lottery/safe', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (360, 359, '余额宝配置', '/lottery/safe/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (361, 359, '余额宝列表', '/lottery/safe/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (362, 0, '抽奖', '/lottery/draw', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (363, 362, '抽奖配置', '/lottery/draw/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (364, 362, '抽奖记录', '/lottery/draw/list', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (365, 0, '机器人管理', '/lottery/bot/bet', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (366, 365, '自动发单', '/lottery/bot/bet', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (367, 366, '添加', '/lottery/bot/bet/add', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (368, 366, '修改', '/lottery/bot/bet/edit', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (369, 366, '删除', '/lottery/bot/bet/del', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (370, 366, '状态', '/lottery/bot/bet/status', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (371, 365, '自动跟单', '/lottery/bot/auto', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (372, 365, '自动满单', '/lottery/bot/auto', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (373, 0, '聊天室管理', '/lottery/red', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (374, 373, '红包列表', '/lottery/red/list', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (375, 374, '发红包', '/lottery/red/send', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (376, 374, '领取详情', '/lottery/red/detail', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (377, 346, '撤单', '/lottery/order/cancel', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (378, 349, '撤单', '/lottery/together/cancel', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (379, 352, '撤单', '/lottery/reorder/cancel', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (380, 11, '投注任务', '/lottery/player/task', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (381, 11, '禁言/踢出', '/lottery/player/chat', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (382, 331, '接口日志', '/lottery/lotterys/api', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (383, 11, '冻结日志', '/lottery/player/bet', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (384, 39, '代理数据查询', '/lottery/report/proxy', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (385, 373, '聊天消息', '/lottery/operation/chat', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (386, 385, '撤回', '/lottery/operation/chat/back', 0, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (387, 0, '风控管理', '/lottery/risk', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (388, 387, '中投列表', '/lottery/risk/bets', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (389, 387, '干预列表', '/lottery/risk/sys', 1, 1, 0, 0);
INSERT INTO `ball_menu` VALUES (390, 373, '托消息统计', '/lottery/chat/tuo', 1, 1, 0, 0);

-- ----------------------------
-- Table structure for ball_pay_behalf
-- ----------------------------
DROP TABLE IF EXISTS `ball_pay_behalf`;
CREATE TABLE `ball_pay_behalf`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_type` tinyint NOT NULL COMMENT '支付类型1usdt2其它',
  `pay_type2` tinyint NULL DEFAULT NULL,
  `area_id` bigint NULL DEFAULT NULL,
  `rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求接口地址',
  `local_callback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '回调地址',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `callback_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `merchant_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `query_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_ifsc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bank_sub` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_attach` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `document_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `document_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `mobile_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1,
  `white_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country_id` bigint NULL DEFAULT NULL,
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_pay_behalf
-- ----------------------------
INSERT INTO `ball_pay_behalf` VALUES (1, '银行卡', NULL, 2, 0, NULL, '1', '', 'player/pay/callback/3', '', 0, 0, '/pay/callback/3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `ball_pay_behalf` VALUES (2, 'USDT', NULL, 3, 0, NULL, '7.5', '', 'player/pay/callback/5', '', 0, 0, '/pay/callback/5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `ball_pay_behalf` VALUES (3, 'Gopay', NULL, 4, 1, NULL, '1', 'http://a.c', 'player/pay/callback/3', '', 1746589002755, 0, '/pay/callback/3', '1111111', NULL, '22222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `ball_pay_behalf` VALUES (4, '支付宝', NULL, 0, 0, NULL, '1', NULL, '', '', 1746589962697, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `ball_pay_behalf` VALUES (5, '微信', NULL, 1, 0, NULL, '1', NULL, '', '', 1746589990869, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);
INSERT INTO `ball_pay_behalf` VALUES (6, 'ABC-银行', NULL, 2, 2, NULL, '1', 'http://b.c', 'player/pay/callback/3', '', 1746590229107, 0, '/pay/callback/3', '1111111111', NULL, '111222222222', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ball_payment_management
-- ----------------------------
DROP TABLE IF EXISTS `ball_payment_management`;
CREATE TABLE `ball_payment_management`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道',
  `pay_type` tinyint NOT NULL COMMENT '支付类型1usdt2其它',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `pay_type_onff` tinyint NOT NULL COMMENT '支付类型1线上2线下',
  `ustd_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求接口地址',
  `ustd_callback` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '回调地址',
  `front_display` tinyint NULL DEFAULT 1 COMMENT '是否显示1是2否',
  `public_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '加密密钥',
  `private_key` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '解密密钥',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示图片',
  `fast_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '快捷金额',
  `min_max` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '充值区间',
  `rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ustd_callback_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `area_code` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `merchant_no` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `return_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `query_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `payment_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unhold` tinyint NULL DEFAULT 0,
  `unhold_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT 0,
  `white_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `black_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `def_money` int NULL DEFAULT 0,
  `use_type` tinyint NULL DEFAULT 0,
  `pay_channel` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 48 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付管理' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_payment_management
-- ----------------------------
INSERT INTO `ball_payment_management` VALUES (1, '人工充值', 0, '', '￥', 2, '', '', 1, '', '', '', 0, 1745779315690, '', '100-500-1000-2000-5000-10000-20000', '', '1', 'http://127.0.0.2:10100/', '', '', '', '', '', '', '', 0, '', 0, '', '', '', 0, 1, 0);

-- ----------------------------
-- Table structure for ball_player
-- ----------------------------
DROP TABLE IF EXISTS `ball_player`;
CREATE TABLE `ball_player`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` bigint NULL DEFAULT 1,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `status` tinyint(1) NULL DEFAULT 1 COMMENT '状态1正常 2封禁',
  `balance` bigint NULL DEFAULT 0 COMMENT '钱包余额(2位小数/100)',
  `the_new_ip` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最新的一次登录ip',
  `the_new_login_time` bigint NULL DEFAULT 0 COMMENT '最新登录时间',
  `cumulative_reflect` bigint NULL DEFAULT 0 COMMENT '累计提现',
  `the_last_ip` varchar(130) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '上一次登录的ip',
  `cumulative_top_up` bigint NULL DEFAULT 0 COMMENT '累计充值',
  `today_win` bigint NULL DEFAULT 0 COMMENT '今日中奖',
  `cumulative_winning` bigint NULL DEFAULT 0 COMMENT '累计中奖',
  `bet_count` int NULL DEFAULT 0 COMMENT '累计投注天数',
  `qq` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `max_reflect` bigint NULL DEFAULT 0 COMMENT '最大提现金额',
  `max_top_up` bigint NULL DEFAULT 0 COMMENT '最大的充值金额',
  `first_reflect` bigint NULL DEFAULT 0 COMMENT '首次提现金额',
  `top_up_times` int NULL DEFAULT 0 COMMENT '充值次数',
  `first_top_up` bigint NULL DEFAULT 0 COMMENT '首次充值金额',
  `first_top_up_time` bigint NULL DEFAULT 0 COMMENT '首次充值金额时间',
  `month_consume` bigint NULL DEFAULT 0 COMMENT '本月消费',
  `month_win` bigint NULL DEFAULT 0 COMMENT '本月中奖',
  `accumulative_bet` bigint NULL DEFAULT 0 COMMENT '累计投注金额',
  `on_line_top_up` bigint NULL DEFAULT 0 COMMENT '线上充值金额',
  `offline_top_up` bigint NULL DEFAULT 0 COMMENT '线下充值金额',
  `artificial_add` bigint NULL DEFAULT 0 COMMENT '人工加款',
  `artificial_subtract` bigint NULL DEFAULT 0 COMMENT '人工减款',
  `bet_today` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '下注日期',
  `reflect_times` int NULL DEFAULT 0 COMMENT '提现次数',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `status_online` tinyint NULL DEFAULT 0,
  `login_ips` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `login_contry` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `frozen_bet` bigint NULL DEFAULT 0,
  `frozen_withdrawal` bigint NULL DEFAULT 0,
  `nickname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `header_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `last_bet` bigint NULL DEFAULT 0,
  `cumulative_reward` bigint NULL DEFAULT 0,
  `from_device` tinyint NULL DEFAULT 0,
  `chat_status` tinyint NULL DEFAULT 0,
  `chat_unable_time` bigint NULL DEFAULT 0,
  `water` bigint NULL DEFAULT 0,
  `water_total` bigint NULL DEFAULT 0,
  `back` bigint NULL DEFAULT 0,
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `curr_up` bigint NULL DEFAULT 0,
  `curr_down` bigint NULL DEFAULT 0,
  `atype` tinyint NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_unique`(`username` ASC) USING BTREE,
  UNIQUE INDEX `phone_unique`(`id` ASC) USING BTREE,
  UNIQUE INDEX `mail_unique`(`id` ASC, `qq` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '玩家账号' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_player
-- ----------------------------

-- ----------------------------
-- Table structure for ball_player_safe
-- ----------------------------
DROP TABLE IF EXISTS `ball_player_safe`;
CREATE TABLE `ball_player_safe`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` bigint NULL DEFAULT 0,
  `updated_at` bigint NULL DEFAULT 0,
  `version` bigint NULL DEFAULT 0,
  `player_id` bigint NULL DEFAULT NULL,
  `player_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `top_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `step` int NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `money` bigint NULL DEFAULT 0,
  `today_income` bigint NULL DEFAULT 0,
  `total_income` bigint NULL DEFAULT 0,
  `order_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT 0,
  `rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `finish_time` bigint NULL DEFAULT 0,
  `status` tinyint NULL DEFAULT 0,
  `curr_income` bigint NULL DEFAULT 0,
  `out_income` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id` ASC) USING BTREE,
  INDEX `super_tree`(`step` ASC, `super_tree` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_player_safe
-- ----------------------------

-- ----------------------------
-- Table structure for ball_safe_config
-- ----------------------------
DROP TABLE IF EXISTS `ball_safe_config`;
CREATE TABLE `ball_safe_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '86',
  `created_at` bigint NULL DEFAULT 0,
  `updated_at` bigint NULL DEFAULT 0,
  `symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `show_h5` tinyint NULL DEFAULT 1,
  `type` tinyint NULL DEFAULT 0,
  `min` int NULL DEFAULT 100,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_safe_config
-- ----------------------------
INSERT INTO `ball_safe_config` VALUES (1, '12', 0, 1742411667737, 'AAAb', 0, 0, 100);

-- ----------------------------
-- Table structure for ball_slideshow
-- ----------------------------
DROP TABLE IF EXISTS `ball_slideshow`;
CREATE TABLE `ball_slideshow`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '游戏id ',
  `policy_type` tinyint NULL DEFAULT 0 COMMENT '策略类型 1存款策略 2返佣策略',
  `deposit_policy_id` bigint NULL DEFAULT 0 COMMENT '存款策略id',
  `commission_strategy_id` bigint NULL DEFAULT 0 COMMENT '返佣策略id',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '语言编码',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '图片地址',
  `status` tinyint NULL DEFAULT 1 COMMENT '1显示 2不显示(前提是 返佣和 存款策略id 为0)',
  `local_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `device` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '轮播图' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_slideshow
-- ----------------------------
INSERT INTO `ball_slideshow` VALUES (29, '余额宝', 1, 0, 0, '1', 'https://res.yongwan888other.com/img/lunbo5.png', 1, 'https://res.yongwan888other.com/img/yeb.png', 0, 0, 0);
INSERT INTO `ball_slideshow` VALUES (32, 'lunbo1', 0, 0, 0, '0', 'https://res.yongwan888other.com/img/lunbo1.png', 1, NULL, 0, 0, 0);
INSERT INTO `ball_slideshow` VALUES (33, 'lunbo2', 0, 0, 0, '0', 'https://res.yongwan888other.com/img/lunbo2.png', 1, NULL, 0, 0, 0);
INSERT INTO `ball_slideshow` VALUES (35, '余额宝', 11, 0, 0, '0', 'https://res.yongwan888other.com/img/yeb.png', 1, 'https://res.yongwan888other.com/img/yeb.png', 0, 0, 1);
INSERT INTO `ball_slideshow` VALUES (36, '2', 11, 0, 0, '0', 'https://res.yongwan888other.com/img/2.png', 1, NULL, 0, 0, 1);
INSERT INTO `ball_slideshow` VALUES (37, '3', 11, 0, 0, '0', 'https://res.yongwan888other.com/img/3.png', 1, NULL, 0, 0, 1);
INSERT INTO `ball_slideshow` VALUES (38, 'h5_1', 0, 0, 0, '0', 'https://res.yongwan888other.com/img/h5_lunbo_1.png', 1, NULL, 0, 0, 0);
INSERT INTO `ball_slideshow` VALUES (39, 'pc_1', 0, 0, 0, '0', 'https://res.yongwan888other.com/img/pc_lunbo_1.png', 1, NULL, 0, 0, 1);

-- ----------------------------
-- Table structure for ball_system_config
-- ----------------------------
DROP TABLE IF EXISTS `ball_system_config`;
CREATE TABLE `ball_system_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `register_if_need_verification_code` tinyint NULL DEFAULT 0 COMMENT '注册是否需要验证码 1需要 2不需要',
  `verification_code_layout` tinyint NULL DEFAULT 0 COMMENT '验证码 格式 1 纯数字 2串字母 3字母数字',
  `password_max_error_times` tinyint NULL DEFAULT 0 COMMENT '密码连续错误的次数',
  `password_error_lock_time` int NULL DEFAULT 0 COMMENT '密码连续错误锁屏时间(秒)',
  `server_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '客服连接',
  `server_url_tmp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `card_can_need_nums` int NULL DEFAULT 0 COMMENT '会员最多绑卡数量',
  `recharge_code_conversion_rate` bigint NULL DEFAULT 0 COMMENT '充值打码量转换比例',
  `captcha_threshold` bigint NULL DEFAULT 0 COMMENT '用户打码设量设置阀值',
  `bet_hand_money_rate` int NULL DEFAULT 0 COMMENT '投注手续费率',
  `fast_money` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '快捷金额',
  `even_need_hand_money` bigint NOT NULL DEFAULT 0 COMMENT '保本扣除手续费',
  `max_usdt_account_nums` int NOT NULL DEFAULT 0 COMMENT '最多可绑定usdt账号数量',
  `max_pix_account_nums` int NOT NULL DEFAULT 0 COMMENT '最多可绑定pix账号数量',
  `withdraw_password_can_update` tinyint NOT NULL DEFAULT 0 COMMENT '提现密码是否可以修改 1 可以 2不可以',
  `can_withdraw_continuity` tinyint NULL DEFAULT 0 COMMENT '是否可以连续提现',
  `withdraw_password_show_need` tinyint NOT NULL DEFAULT 0 COMMENT '控制首页提现密码是否可以关闭',
  `everyday_withdraw_times` int NOT NULL DEFAULT 0 COMMENT '每日的提现上线次数',
  `everyday_withdraw_free` int NULL DEFAULT 0 COMMENT '免手续费次数',
  `withdrawal_rate` int NULL DEFAULT 0 COMMENT '银行提现手续费',
  `withdraw_max` int NULL DEFAULT 10000000,
  `withdraw_min` int NULL DEFAULT 500,
  `withdrawal_rate_max` int NULL DEFAULT 10000000,
  `withdrawal_rate_min` int NULL DEFAULT 50,
  `usdt_withdraw_per` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '86' COMMENT 'usdt 提现提现汇率',
  `withdraw_usdt_automatic_per` int NULL DEFAULT 0 COMMENT '提现usdt自动汇率 1yes 2no',
  `usdt_withdrawal_rate` int NULL DEFAULT 0 COMMENT 'USDT提现手续费',
  `usdt_withdraw_max` int NULL DEFAULT 10000000 COMMENT 'USDT最大提现',
  `usdt_withdraw_min` int NULL DEFAULT 500 COMMENT 'USDT最小提现',
  `usdt_withdrawal_rate_max` int NULL DEFAULT 10000000 COMMENT 'USDT最大提现手续费',
  `usdt_withdrawal_rate_min` int NULL DEFAULT 50 COMMENT 'USDT最小提现手续费',
  `phone_area_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `pay_pwd_npc` tinyint NULL DEFAULT 0 COMMENT '1需要手机验证2不需要',
  `default_proxy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `recharge_area_swtich` tinyint NULL DEFAULT NULL,
  `recharge_max` int NULL DEFAULT NULL,
  `player_bet_max` int NULL DEFAULT 0,
  `player_bet_min` int NULL DEFAULT 0,
  `open_google` tinyint NULL DEFAULT 0 COMMENT '0关1开',
  `open_white` tinyint NULL DEFAULT 0 COMMENT '0关1开',
  `version` bigint NULL DEFAULT 0,
  `new_devices` tinyint NULL DEFAULT 0 COMMENT '0关1开',
  `auto_up` tinyint NULL DEFAULT 0 COMMENT '0关1开',
  `auto_up_off` tinyint NULL DEFAULT 0 COMMENT '0关1开',
  `switch_rebate` tinyint NULL DEFAULT 0,
  `rebate_week` tinyint NULL DEFAULT NULL,
  `rebate_time` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `max_sms` int NULL DEFAULT 5,
  `switch_rebate_first` tinyint NULL DEFAULT 0,
  `switch_rebate_every` tinyint NULL DEFAULT 0,
  `switch_no_recharge` tinyint NULL DEFAULT 0,
  `re_max` tinyint NULL DEFAULT 5,
  `re_time` tinyint NULL DEFAULT 10,
  `check_level_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00:00',
  `close_notice` tinyint NULL DEFAULT 0,
  `todo_model` tinyint NULL DEFAULT 0,
  `game_finish_min` int NULL DEFAULT 140,
  `statis_time` tinyint NULL DEFAULT 0,
  `vip_reward_time` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00:00',
  `sms_interval` int NULL DEFAULT 10,
  `euro_rate` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `bank_list_swtich` tinyint NULL DEFAULT 0,
  `auto_check` tinyint NULL DEFAULT 0,
  `auto_check_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `wi_interval` int NULL DEFAULT 10,
  `day_aim_betc` int NULL DEFAULT 1,
  `day_aim_betm` int NULL DEFAULT 100,
  `week_aim` int NULL DEFAULT 3,
  `month_aim` int NULL DEFAULT 15,
  `back_type` tinyint NULL DEFAULT 0,
  `risk_alert` tinyint NULL DEFAULT 0,
  `risk_wi` tinyint NULL DEFAULT 0,
  `open_aim` tinyint NULL DEFAULT 1,
  `open_aim_alert` tinyint NULL DEFAULT 1,
  `center4` tinyint NULL DEFAULT 0,
  `queue_on` tinyint NULL DEFAULT 1,
  `center2` tinyint NULL DEFAULT 0,
  `game_finish` tinyint NULL DEFAULT 0,
  `game_finish_conf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `game_finish_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `game_finish_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `game_finish_msg2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `game_finish_time2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `game_finish_time3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_move` tinyint NULL DEFAULT 0,
  `account_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `account_msg2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `finish_move` tinyint NULL DEFAULT 0,
  `account_money` bigint NULL DEFAULT NULL,
  `account_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_time2` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `account_time3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `edit_bank_limit` int NULL DEFAULT 48,
  `edit_bank_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `dialog_notice` tinyint NULL DEFAULT 1,
  `mail_required` tinyint NULL DEFAULT 0,
  `server_on` tinyint NULL DEFAULT 0,
  `server_off_txt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `more1u` tinyint NULL DEFAULT 1,
  `more1u_count` int NULL DEFAULT 3,
  `app_version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `order_cancel_time` int NULL DEFAULT 0,
  `order_cancel_type` tinyint NULL DEFAULT 0,
  `fb_appid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `third_show` tinyint NULL DEFAULT 0,
  `uphold` tinyint NULL DEFAULT 0,
  `uphold_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `more1u_min` int NULL DEFAULT 5,
  `game_finish_time4` bigint NULL DEFAULT 0,
  `account_conf` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `account_time4` bigint NULL DEFAULT 0,
  `game_finish_model` tinyint NULL DEFAULT 0,
  `game_finish_quick` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `game_finish_player` tinyint NULL DEFAULT 0,
  `close_users` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `close_trees` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `re_maxu` int NULL DEFAULT 10,
  `re_timeu` int NULL DEFAULT 60,
  `show_yeb` tinyint NULL DEFAULT 1,
  `withdrawal_rate2` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdrawal_rate3` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `withdrawal_rate4` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `website2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `risk_min` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '-0.7',
  `risk_max` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0.7',
  `chat_recharge` int NULL DEFAULT 3000,
  `nickname_prefix` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'cai',
  `gain_recharge` int NULL DEFAULT 0,
  `together_min` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '5',
  `chat_status` tinyint NULL DEFAULT 1,
  `together_limit` int NULL DEFAULT 0,
  `chat_open_time` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bingo_rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '50.1-89.8',
  `chat_share` tinyint NULL DEFAULT 1,
  `phone_enable` tinyint NULL DEFAULT 0,
  `qq_dup_enable` tinyint NULL DEFAULT 0,
  `player_tree` tinyint NULL DEFAULT 1,
  `withdrawal_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '8:00-17:00',
  `chat_limit` int NULL DEFAULT 1,
  `sensitive_words` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `phone_code` tinyint NULL DEFAULT 0,
  `bot1` int NULL DEFAULT 0,
  `bot2` int NULL DEFAULT 0,
  `bot3` int NULL DEFAULT 0,
  `bot4` int NULL DEFAULT 0,
  `bot5` int NULL DEFAULT 0,
  `bot6` int NULL DEFAULT 0,
  `bot7` int NULL DEFAULT 0,
  `bot8` int NULL DEFAULT 0,
  `bot9` int NULL DEFAULT 0,
  `bot10` int NULL DEFAULT 0,
  `bot11` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统配置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_system_config
-- ----------------------------
INSERT INTO `ball_system_config` VALUES (3, 1, 1, 5, 60, 'http://8.138.199.121:5678/chatIndex?kefu_id=yw0122&ent_id=6&visitor_id={0}&visitor_name={1}', 'http://8.138.199.123:5678/chatIndex?kefu_id=yw0122&ent_id=6', 0, 0, 0, 0, '0', 0, 0, 0, 0, 0, 0, 3, 0, 0, 10000000, 100, 10000000, 0, '86', 0, 0, 10000000, 10, 10000000, 0, NULL, 0, NULL, NULL, 1000000000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 3, '12:00', 5, 0, 0, 0, 5, 10, '00:00', 0, 0, 140, 0, '00:00', 10, '5', 0, 0, '0', 20, 1, 100, 3, 15, 0, 0, 0, 1, 1, 0, 1, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, NULL, NULL, NULL, NULL, 24, '修改{0}后无法提现，剩余时间{1}', 1, 0, 0, '承认少时诵诗书', 1, 3, '1', 0, 0, NULL, 0, 0, '系统维护升级中，将于02:50恢复正常', 5, 0, NULL, 0, 0, NULL, 0, NULL, NULL, 10, 60, 1, '0', '0', '', 'http://yongwan8.com/', 'yongwan8.com', '50', '70', 300, 'cai', 300, '5', 1, 20, '', '50.1-89.8', 1, 0, 1, 1, '08:00-22:00', 1, '群\r\nQQ\r\nqq\r\n微信\r\n域名\r\n.com\r\n.cn\r\n.net\r\n.vip', 0, 10, 1, 100, 300, 100, 100, 600, 1500, 800, 6, 77);

-- ----------------------------
-- Table structure for ball_system_notice
-- ----------------------------
DROP TABLE IF EXISTS `ball_system_notice`;
CREATE TABLE `ball_system_notice`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '语言编码',
  `status` tinyint NULL DEFAULT 1 COMMENT '1正常 2禁用',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统公告' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_system_notice
-- ----------------------------
INSERT INTO `ball_system_notice` VALUES (14, '公告', '尊敬的用户：  为了提升服务器性能，优化用户体验，我们计划于以下时间段进行服务器维护：  维护时间： YYYY年MM月DD日 HH:MM 至 HH:MM 维护范围： 全部/部分服务 维护影响： 维护期间可能会出现短暂无法访问或部分功能异常的情况，维护完成后将恢复正常。  我们对此次维护给您带来的不便深表歉意，感谢您的理解与支持。如有疑问，请随时联系客户支持。  感谢您的支持与配合！  [公司名称]团队 YYYY年MM月DD日', '0', 2, 1732520901907, 0);
INSERT INTO `ball_system_notice` VALUES (23, '福利红包', '蛇年大吉,好旺新年福利,平台每晚八点会在聊天室发放8888彩金红包(充值三百即可参与抢红包)', '0', 1, 1738314132248, 0);
INSERT INTO `ball_system_notice` VALUES (24, '中秋节充值赠送福利', '<p>中秋佳节永旺集团特此推出以下活动，与广大玩家一起庆祝大家中秋佳节阖家欢乐！</p>\r\n<p>活动期间每天首充额外赠送以下福利</p>\r\n<p>500额外38</p>\r\n<p>1000额外送88</p>\r\n<p>3000额外送288</p>\r\n<p>5000额外送488</p>\r\n<p>10000额外送988</p>\r\n<p>30000额外送2888</p>\r\n<p>50000额外送4888</p>\r\n<p>100000额外送9888</p>\r\n<p>活动时间2022年9月10号0时开始号至2022年9月15号24时结束。</p>\r\n<p>本次活动不能与任何额外活动叠加！</p>\r\n<p>（如有发现恶意刷流水行为本司有权冻结账户不予结算）</p>', '', 1, 1662739292000, 1743968517005);
INSERT INTO `ball_system_notice` VALUES (25, '国庆节充值赠送福利', '<p>🎉 国庆活动通知 🎉</p>\r\n<p>🔥 活动期间，每日首充，额外豪礼赠送！ 🔥</p>\r\n<p>💰 充值福利如下： <br />💎 充值 500 元，额外赠送 38 元 <br />💎 充值 1000 元，额外赠送 88 元 <br />💎 充值 3000 元，额外赠送 288 元 <br />💎 充值 5000 元，额外赠送 488 元 <br />💎 充值 10000 元，额外赠送 988 元 <br />💎 充值 30000 元，额外赠送 2888 元 <br />💎 充值 50000 元，额外赠送 4888 元 <br />💎 充值 100000 元，额外赠送 9888 元</p>\r\n<p>📅 活动时间： <br />⏳ 2023年10月1日 00:00 开始 至 2023年10月7日 24:00 结束！</p>\r\n<p>⚠️ 特别说明： <br />🚫 本次活动 不可 叠加其他优惠活动！ <br />🚨 如发现 恶意刷流水 行为，本平台有权 冻结账户 并拒绝结算！</p>\r\n<p>🔔 重要提醒： <br />近期有不法分子冒充平台客服进行诈骗！请广大玩家 仅通过平台内在线客服 进行咨询、充值，不要轻信 微信、QQ等第三方聊天软件**，避免上当受骗，造成不必要的损失！</p>\r\n<p>🎯 **安全充值，放心游戏！祝大家国庆快乐！🎊</p>', '', 1, 1696089963000, 1743965732232);
INSERT INTO `ball_system_notice` VALUES (26, '永旺平台游戏协议公告', '<p>一、交易协定： 会员登录本平台后，即默认视为已经接受本平台一切相关交易协定。 二、用户安全： 首次登录平台后，请立即绑定手机号及一张以上本人身份证申办的银行卡。若因上述某一项未做设置或透露上述某一项信息给第三方造成的帐户被盗及相关经济损失，及因为使用第三方软件或手机遗失等其它个人原因造成经济损失，平台概不负责。反之若因平台技术BUG数据泄露造成的个人损失平台双倍赔偿。</p>\r\n<p>三、投注条款：</p>\r\n<ol>\r\n<li>会员对个人帐户的一切操作将被视为有效行为，包括各种错误操作之类的投注等。</li>\r\n<li>因个人网络问题造成的追号不及时，撤单不及时等各类问题皆由会员自行承担。</li>\r\n<li>因官网未开奖或官方开奖号错误平台会统一撤单或修正处理，不做额外补偿。</li>\r\n<li>因会员一切非正常途径的投注及其它黑客行为，平台有权永久冻结其帐户及没收资金处理。</li>\r\n<li>根据实际投注单，若出现派奖错误，平台一概遵循多退少补原则重新处理奖金。</li>\r\n<li>单注中奖金额必须是投注金额的一倍及以上，否则视为恶意刷流水，本司有权冻结账户不予结算。</li>\r\n<li>平台奉行一人一号原则，暂不做强制监督，但保留惩处权利。</li>\r\n</ol>\r\n<p>四、充值提款说明： 1. 根据中国人民银行规定，跨行人民币业务结算需每月定期维护，是以银行维护期间，平台将暂停出款业务，银行维护结束后平台即恢复正常提款。 2. 平台提供银行卡转帐、支付宝转帐及其它在线充值等多种充值方式，请联系在线客服咨询充值，充值绝对不会有损失。 3.平台申请充值单时限依照申请页面提示，到帐时间依平台收款户为准，如因没有使用实时到帐功能导致未能在2个小时内到账收款户，并且收款户为下架状态，所造成的一切损失，平台一律不负任何损失赔偿。 4. 平台充值帐号会不定期更换，请会员每次充值前务必联系客服获取最新的充值帐号，若充值到非公司当前提供的帐号所造成的一切损失，平台一律不予负责。 5. 只要会员绑定的银行卡是本人身份证所申办，银行卡为正常可用状态并在平台绑定为对应的真实姓名和正确卡号，即可完成游戏币直接提现操作。 6.平台提款时间早上10点至晚上10点，其他时间无法提现，提款后请联系在线客服。若半个小时后仍未查询到账，请联系平台客服咨询处理。若确实出现提款卡单之类的意外情况，平台财务会视情况人工补回到账户或重新手动打款处理。 7.针对在平台盗刷他人银行卡的套现行为，平台有权直接冻结所有关联帐户，并没收资金退回原卡处理。</p>\r\n<p>五、秉承公平公正的游戏原则，平台保留不定时修改或增加相关协定、游戏规则或保密条例等的操作权利，并保留一切有争议事项及最后的决策权。</p>\r\n<p>--永旺娱乐 特此公告--</p>', '', 1, 1515563038000, 1744013360036);
INSERT INTO `ball_system_notice` VALUES (27, '正式运营公告', '<p>亲爱的彩民们好：</p>\r\n<p>永旺娱乐平台已于 1月12号 09:00 正式开业，当前已开放充值与提款 欢迎各位彩民第一时间加入游戏 &rarr; 最优质的游戏娱乐体验，尽在永旺娱乐平台 &larr;</p>\r\n<p>--永旺娱乐 特此公告--</p>', '', 1, 1515649926000, 1743968615914);
INSERT INTO `ball_system_notice` VALUES (28, '重要》防止洗钱及诈骗资金-充提违规注意事项公告', '<p>即日起针对充值/提款实施如下措施：</p>\r\n<p>充值： 须使用与【平台绑定姓名相同】的银行卡进行汇款，若使用与绑定卡不同名的卡进行汇款，平台将会对这部分资金冻结管控没收。 提款： 充值人民币但提款虚拟币，都将视为洗钱操作，同时对平台内的资金来源进行冻结管控没收 永旺娱乐 特此通知</p>', '', 1, 1523890656000, 1743968609300);
INSERT INTO `ball_system_notice` VALUES (29, '推荐交易所使用教程', '<p>亲爱的彩民们好：</p>\r\n<p>广大虚拟币使用者有福了，为了提供更快速且安全的充提 平台贴心服务，提供以下合法交易所使用教程如下：</p>\r\n<ol>\r\n<li>币安注册教程：https://res.yongwan888other.com/bnzc.pdf</li>\r\n<li>2. 欧易okx交易所教程：https://res.yongwan888other.com/okx.pdf</li>\r\n</ol>\r\n<p>USDT虚拟货币，安全、快速、合法。 欢迎彩民浏览无痛教程，快速上手，开心使用。</p>\r\n<p>--永旺娱乐，特此通知</p>', '', 1, 1540087364000, 1744013297557);
INSERT INTO `ball_system_notice` VALUES (30, '临时维护公告', '<p>亲爱的彩民们好： 平台进行彩种优化维护，完成时间待定。 维护期间暂无法投注，造成不便，敬请见谅。 永旺娱乐 特此公告</p>', '', 1, 1554793783000, 1744218114047);
INSERT INTO `ball_system_notice` VALUES (31, 'USDT提款承诺10分钟内到账', '<p>USDT提款承诺10分钟内到账</p>\r\n<p>各位亲爱的彩民们好！</p>\r\n<p>USDT是安全，稳定，可靠的虚拟币，随时可以兑换为人民币使用。</p>\r\n<p>使用USDT充值1分钟到账，提款我们承诺任何时间段做到10分钟内到账。</p>\r\n<p>※USDT充值后15分钟内不能申请提款</p>\r\n<p>USDT为币圈最权威的稳定货币，价格锚定美元定价，没有价格波动风险。</p>\r\n<p>USDT现市场持有价值为900多亿人民币，平台以自身信誉担保它的安全性。</p>\r\n<p>境外合法注册经营虚拟币交易所【币安】</p>\r\n<p>币安注册：https://accounts.binance.com/zh-CN/register</p>\r\n<p>币安网页：https://www.binance.com/zh-CN</p>\r\n<p>币安手机：https://www.binance.com/zh-CN/download</p>\r\n<p>&nbsp;</p>\r\n<p>中国用户注册币安需使用VPN及海外邮箱</p>\r\n<p>注册教学步骤：</p>\r\n<p>步骤1. 先进行邮箱注册</p>\r\n<ul>\r\n<li>谷歌：https://mail.google.com</li>\r\n<li>微软：https://outlook.live.com （推荐）</li>\r\n</ul>\r\n<p>步骤2. 开启VPN (节点选择亚洲地区 : 香港、台湾、日本)</p>\r\n<ul>\r\n<li>首次注册实名需要透过VPN完成，此后无需VPN可自由交易。</li>\r\n</ul>\r\n<p>步骤3. 进入注册链结：https://accounts.binance.com/zh-CN/register</p>\r\n<p>步骤4. 选择『邮箱』注册</p>\r\n<p>步骤5. 进行注册接收邮箱验证码</p>\r\n<p>步骤6. 完成注册后，登入进行实名认证</p>\r\n<p>步骤7. 24小时内完成实名认证，即可正常交易</p>\r\n<p>&nbsp;</p>\r\n<p>TREZOR硬件钱包使用教程</p>\r\n<p>教程：https://res.yongwan888other.com/TREZOR.pdf</p>\r\n<p>用户可以使用银行卡，支付宝，微信转账方式购买USDT，随时可兑现人民币。</p>\r\n<p>&nbsp;</p>\r\n<p>--永旺娱乐 特此公告--</p>', '', 1, 1643264125000, 1744012561389);
INSERT INTO `ball_system_notice` VALUES (32, '国庆活动通知', '<p>国庆活动通知！！！</p>\r\n<p>活动期间每天首充额外赠送以下福利</p>\r\n<p>500额外38</p>\r\n<p>1000额外送88</p>\r\n<p>3000额外送288</p>\r\n<p>5000额外送488</p>\r\n<p>10000额外送988</p>\r\n<p>30000额外送2888</p>\r\n<p>50000额外送4888</p>\r\n<p>100000额外送9888</p>\r\n<p>活动时间2023年10月1号0时开始号至2023年10月7号24时结束。 本次活动不能与任何额外活动叠加！ （如有发现恶意刷流水行为本司有权冻结账户不予结算） 由于近期有玩反应有人冒充平台客服对玩家进行诈骗，请广大玩家以平台内在线客服为主，请勿轻信其他微信QQ等聊天软件进行充值，如需充值请联系平台在线客服进行确认，以免上当受骗造成不必要的损失。</p>', '', 1, 1601431745000, 1743968579059);
INSERT INTO `ball_system_notice` VALUES (33, '临时维护公告', '<p>亲爱的彩民们好：</p>\r\n<p>平台进行彩种优化维护，完成时间待定。 维护期间暂无法投注，造成不便，敬请见谅。 永旺娱乐 特此公告</p>', '', 1, 1676323126000, 1743968411479);
INSERT INTO `ball_system_notice` VALUES (34, '新春充值活动', '<p>亲爱的彩民们好：</p>\r\n<p>为迎接新年特此推出新年充值活动 感谢各位亲们的热爱以及支持，即日起充值由原先每笔充值赠送百分之十二调整为每笔充值赠送百分之十五，活动截止时间请留意活动公告</p>', '', 1, 1737789050000, 1743968398914);
INSERT INTO `ball_system_notice` VALUES (36, '新春充值赠送活动截止公告', '即日起新春充值活动结束,充值赠送恢复到百分之十二', '0', 1, 1740795545360, 0);
INSERT INTO `ball_system_notice` VALUES (37, '🔥最新热门活动🔥', '<p><strong>最新活动</strong></p>\r\n<p><strong>①</strong><span style=\"color: #ff0000;\"><strong>超级代理</strong></span><strong>:发展下级，下级每次充值，代理都可以获得</strong><span style=\"color: #ff0000;\"><strong>3%</strong></span><strong>奖励！</strong></p>\r\n<p><strong>②</strong><span style=\"color: #ff0000;\"><strong>天降红包</strong></span><strong>:每日晚8点发送</strong><span style=\"color: #ff0000;\"><strong>8888</strong></span><strong>红包，抢到就是赚，每日单笔充值满300即可参加</strong></p>\r\n<p><strong>③</strong><span style=\"color: #ff0000;\"><strong>充值赠送</strong></span><strong>:充值就送<span style=\"color: #ff0000;\">12%</span>，</strong><strong>不限次数</strong><strong>，笔笔都赠送哦！</strong></p>\r\n<p><strong>④</strong><span style=\"color: #ff0000;\"><strong>首冲奖励</strong></span><strong>:首次充值玩家赠送</strong><span style=\"color: #ff0000;\"><strong>20%</strong></span><strong>！</strong></p>', '', 1, 1743962408000, 1744218268734);
INSERT INTO `ball_system_notice` VALUES (38, '🔥五一活动🔥', '<h2>🔥永旺集团五一活动🔥</h2>\r\n<h2>尊敬的永旺新老会员：</h2>\r\n<h2>为庆祝五一国际节，现特此推出赠送活动。<br />每天首次充值在原赠送<span style=\"color: #ff0000;\">12</span>%的基础上额外赠送彩金！<br />单笔充值满<span style=\"color: #ff0000;\">500</span>送<span style=\"color: #ff0000;\">38</span>彩金！<br />单笔充值满<span style=\"color: #ff0000;\">1000</span>赠送<span style=\"color: #ff0000;\">88</span>彩金<br />单笔充值满<span style=\"color: #ff0000;\">3000</span>赠送<span style=\"color: #ff0000;\">288</span>彩金！<br />单笔充值满<span style=\"color: #ff0000;\">5000</span>赠送<span style=\"color: #ff0000;\">488</span>彩金！<br />单笔充值满<span style=\"color: #ff0000;\">10000</span>赠送<span style=\"color: #ff0000;\">1088</span>彩金！<br />单笔充值满<span style=\"color: #ff0000;\">50000</span>赠送<span style=\"color: #ff0000;\">3888</span>彩金！<br />单笔充值满<span style=\"color: #ff0000;\">100000</span>赠送<span style=\"color: #ff0000;\">8888</span>彩金！<br />活动时间：</h2>\r\n<h2>2025.<span style=\"color: #ff0000;\">5.1</span> 0:00至2025.<span style=\"color: #ff0000;\">5.7</span> 23:59</h2>\r\n<h2>如有疑问请联系永旺在线客服!<br />永旺官方网址：<span style=\"color: #ff0000;\">yongwan8.com</span><br />温馨提示：禁止涮流水，否则扣除所有彩金，一切归属权由永旺所有！</h2>', '0', 1, 1746010938345, 1746012383183);

-- ----------------------------
-- Table structure for ball_version_config
-- ----------------------------
DROP TABLE IF EXISTS `ball_version_config`;
CREATE TABLE `ball_version_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` bigint UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_version_config
-- ----------------------------
INSERT INTO `ball_version_config` VALUES (1, 6);

-- ----------------------------
-- Table structure for ball_withdraw_management
-- ----------------------------
DROP TABLE IF EXISTS `ball_withdraw_management`;
CREATE TABLE `ball_withdraw_management`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '提现名称',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `iamge_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '图片地址',
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '语言编码',
  `rate` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `currency_symbol` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1 COMMENT '1启用 2关闭',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `updated_at` bigint NULL DEFAULT 0 COMMENT '更新时间',
  `sort` tinyint NULL DEFAULT NULL,
  `oper_user` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT NULL,
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `types` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '提现方式' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of ball_withdraw_management
-- ----------------------------
INSERT INTO `ball_withdraw_management` VALUES (7, '银行卡', '', 'withdraw/cc288855ff6b4025a0f8b1097434d211.png', '0', '1', '', 1, 1733223451711, 1734803743083, 0, 'admin', 2, '', '');
INSERT INTO `ball_withdraw_management` VALUES (10, 'USDT', NULL, '0', '0', '7', '$', 1, 1735371736142, 0, 0, 'admin2', 3, NULL, NULL);
INSERT INTO `ball_withdraw_management` VALUES (11, '支付宝', '', '0', '0', '1', '', 1, 1736680894552, 1741332807540, 1, 'admin', 0, '', '');

-- ----------------------------
-- Table structure for lo_back
-- ----------------------------
DROP TABLE IF EXISTS `lo_back`;
CREATE TABLE `lo_back`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `expect` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lo_back
-- ----------------------------
INSERT INTO `lo_back` VALUES (1, 20250522087);
INSERT INTO `lo_back` VALUES (2, 20250522088);
INSERT INTO `lo_back` VALUES (3, 20250522089);
INSERT INTO `lo_back` VALUES (4, 20250623001);
INSERT INTO `lo_back` VALUES (5, 20250623002);
INSERT INTO `lo_back` VALUES (6, 20250623003);
INSERT INTO `lo_back` VALUES (7, 20250623004);
INSERT INTO `lo_back` VALUES (8, 20250623005);
INSERT INTO `lo_back` VALUES (9, 20250623006);
INSERT INTO `lo_back` VALUES (10, 20250623007);
INSERT INTO `lo_back` VALUES (11, 20250623008);
INSERT INTO `lo_back` VALUES (12, 20250623009);
INSERT INTO `lo_back` VALUES (13, 20250623010);
INSERT INTO `lo_back` VALUES (14, 20250623011);
INSERT INTO `lo_back` VALUES (15, 20250623012);
INSERT INTO `lo_back` VALUES (16, 20250623013);
INSERT INTO `lo_back` VALUES (17, 20250623014);
INSERT INTO `lo_back` VALUES (18, 20250623015);
INSERT INTO `lo_back` VALUES (19, 20250623016);

-- ----------------------------
-- Table structure for lo_bet_change
-- ----------------------------
DROP TABLE IF EXISTS `lo_bet_change`;
CREATE TABLE `lo_bet_change`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NOT NULL DEFAULT 0 COMMENT '玩家id',
  `change_money` bigint NULL DEFAULT 0 COMMENT '变化金额',
  `init_money` bigint NULL DEFAULT 0 COMMENT '初始金额',
  `dned_money` bigint NULL DEFAULT NULL COMMENT '变化后的金额',
  `change_type` tinyint NOT NULL DEFAULT 0 COMMENT '1.冻结 2.解除',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单号',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `player_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_id`(`player_id` ASC) USING BTREE,
  INDEX `player_id_order_type`(`player_id` ASC, `change_type` ASC, `order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 232570 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '冻结变化表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_bet_change
-- ----------------------------
INSERT INTO `lo_bet_change` VALUES (231747, 1037, 5000, 0, 5000, 0, 'BG250523009971', 1748005873582, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231748, 1037, -5000, 5000, 0, 1, 'BG250523009971', 1748006359177, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231749, 1037, 5000, 0, 5000, 0, 'BG250523009972', 1748006546157, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231750, 1037, 5000, 5000, 10000, 0, 'BG250523009973', 1748006686148, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231751, 1037, -5000, 10000, 5000, 1, 'BG250523009973', 1748076153798, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231752, 1037, 10000, 5000, 15000, 0, 'BG250524009974', 1748076541993, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231753, 1037, -10000, 15000, 5000, 1, 'BG250524009974', 1748081673184, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231754, 1037, 10000, 5000, 15000, 0, 'BG250524009975', 1748081707913, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231755, 1037, -10000, 15000, 5000, 1, 'BG250524009975', 1748247253883, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231756, 1037, 10000, 5000, 15000, 0, 'BG250526009976', 1748256565141, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231757, 1037, -10000, 15000, 5000, 1, 'BG250526009976', 1748256681601, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231758, 1037, 10000, 5000, 15000, 0, 'BG250526009977', 1748256701827, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231759, 1037, -10000, 15000, 5000, 1, 'BG250526009977', 1748256799378, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231760, 1037, 20000, 5000, 25000, 0, 'BG250526009978', 1748256812695, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231761, 1037, -20000, 25000, 5000, 1, 'BG250526009978', 1748256822272, 'user887', '撤单');
INSERT INTO `lo_bet_change` VALUES (231762, 1037, 415000, 5000, 420000, 0, 'BG250526009979', 1748264165450, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231763, 1037, -415000, 420000, 5000, 1, 'BG250526009979', 1748264444698, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231764, 1037, 415000, 5000, 420000, 0, 'BG250526009980', 1748264501166, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231765, 1037, -415000, 420000, 5000, 1, 'BG250526009980', 1748264618350, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231766, 1037, -5000, 5000, 0, 1, 'BG250523009972', 1748264782134, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231767, 1037, 7000, 0, 7000, 0, 'BG250526009981', 1748264840922, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231768, 1037, -7000, 7000, 0, 1, 'BG250526009981', 1748264858208, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231769, 1037, 11200, 0, 11200, 0, 'BG250526009982', 1748264917180, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231770, 1037, -11200, 11200, 0, 1, 'BG250526009982', 1748264932576, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231771, 1037, 124432, 0, 124432, 0, 'BG250526009983', 1748265141889, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231772, 1037, -124432, 124432, 0, 1, 'BG250526009983', 1748265147659, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231773, 1037, 224000, 0, 224000, 0, 'BG250526009984', 1748265214248, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231774, 1037, -224000, 224000, 0, 1, 'BG250526009984', 1748265221477, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231775, 1037, 112000, 0, 112000, 0, 'BG250526009985', 1748265472992, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231776, 1037, -112000, 112000, 0, 1, 'BG250526009985', 1748265480457, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231777, 1037, 100, 0, 100, 0, 'BG250527009986', 1748334066363, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231778, 1037, -100, 100, 0, 1, 'BG250527009986', 1748337965220, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231779, 1037, 100, 0, 100, 0, 'BG250527009987', 1748348138530, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231780, 1035, 100, 0, 100, 0, 'BG250527009988', 1748348141503, '花露水', '下注');
INSERT INTO `lo_bet_change` VALUES (231781, 1035, -100, 100, 0, 1, 'BG250527009988', 1748348288305, '花露水', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231782, 1037, -100, 100, 0, 1, 'BG250527009987', 1748348288333, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231783, 1035, 100, 0, 100, 0, 'BG250527009989', 1748348388695, '花露水', '下注');
INSERT INTO `lo_bet_change` VALUES (231784, 1037, 100, 0, 100, 0, 'BG250527009990', 1748348390521, 'user887', '下注');
INSERT INTO `lo_bet_change` VALUES (231785, 1037, -100, 100, 0, 1, 'BG250527009990', 1748348424320, 'user887', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231786, 1035, -100, 100, 0, 1, 'BG250527009989', 1748348424331, '花露水', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231787, 1, 10000, 0, 10000, 0, 'BG250602009994', 1748871671133, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231788, 1, -10000, 10000, 0, 1, 'BG250602009994', 1748871682684, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231789, 1, 10000, 0, 10000, 0, 'BG250603009995', 1748954048693, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231790, 1, 10000, 10000, 20000, 0, 'BG250603009996', 1748954285146, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231791, 1, -10000, 20000, 10000, 1, 'BG250603009996', 1748956089133, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (231792, 1, -10000, 10000, 0, 1, 'BG250603009995', 1748956089175, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (231793, 7, 20000, 0, 20000, 0, 'BG250606009999', 1749216165445, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231794, 9, 80000, 0, 80000, 0, 'BG250606010000', 1749216166517, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231795, 6, 40000, 0, 40000, 0, 'BG250606010001', 1749216168612, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231796, 5, 10000, 0, 10000, 0, 'BG250606010002', 1749216170664, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231797, 11, 50000, 0, 50000, 0, 'BG250606010003', 1749216484685, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (231798, 8, 70000, 0, 70000, 0, 'BG250606010004', 1749216485761, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231799, 5, 80000, 10000, 90000, 0, 'BG250606010007', 1749216487042, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231800, 4, 10000, 0, 10000, 0, 'BG250606010008', 1749216489116, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231801, 11, 90000, 50000, 140000, 0, 'BG250606010009', 1749216588150, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (231802, 12, 30000, 0, 30000, 0, 'BG250606010010', 1749216590198, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231803, 13, 80000, 0, 80000, 0, 'BG250606010011', 1749216592217, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231804, 4, 40000, 10000, 50000, 0, 'BG250606010012', 1749216594257, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231805, 8, 50000, 70000, 120000, 0, 'BG250606010013', 1749216595279, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231806, 7, 60000, 20000, 80000, 0, 'BG250606010016', 1749216706394, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231807, 4, 80000, 50000, 130000, 0, 'BG250606010017', 1749216707439, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231808, 11, 90000, 140000, 230000, 0, 'BG250606010018', 1749216709470, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (231809, 10, 30000, 0, 30000, 0, 'BG250606010020', 1749216711546, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231810, 8, 20000, 120000, 140000, 0, 'BG250606010022', 1749216712610, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231811, 5, 60000, 90000, 150000, 0, 'BG250606010023', 1749216713670, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231812, 10, 70000, 30000, 100000, 0, 'BG250606010026', 1749216876805, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231813, 8, 70000, 140000, 210000, 0, 'BG250606010027', 1749216878841, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231814, 9, 120000, 80000, 200000, 0, 'BG250606010028', 1749216880861, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231815, 7, 20000, 80000, 100000, 0, 'BG250606010029', 1749216881897, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231816, 6, 80000, 40000, 120000, 0, 'BG250606010030', 1749216883995, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231817, 12, 60000, 30000, 90000, 0, 'BG250606010031', 1749216889959, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231818, 1, 409300, 0, 409300, 0, 'BG250606010032', 1749217007276, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231819, 7, 70000, 100000, 170000, 0, 'BG250606010033', 1749217008343, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231820, 10, 20000, 100000, 120000, 0, 'BG250606010034', 1749217009399, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231821, 8, 40000, 210000, 250000, 0, 'BG250606010035', 1749217010441, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231822, 12, 60000, 90000, 150000, 0, 'BG250606010037', 1749217012534, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231823, 5, 30000, 150000, 180000, 0, 'BG250606010039', 1749217013591, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231824, 13, 50000, 80000, 130000, 0, 'BG250606010040', 1749217014644, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231825, 6, 80000, 120000, 200000, 0, 'BG250606010041', 1749217015686, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231826, 9, 50000, 200000, 250000, 0, 'BG250606010042', 1749217017730, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231827, 12, 70000, 150000, 220000, 0, 'BG250606010043', 1749217304435, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231828, 10, 50000, 120000, 170000, 0, 'BG250606010045', 1749217319124, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231829, 9, 40000, 250000, 290000, 0, 'BG250606010047', 1749217320174, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231830, 7, 60000, 170000, 230000, 0, 'BG250606010049', 1749217321237, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231831, 6, 70000, 200000, 270000, 0, 'BG250606010052', 1749217410888, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231832, 10, 40000, 170000, 210000, 0, 'BG250606010053', 1749217411946, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231833, 4, 10000, 130000, 140000, 0, 'BG250606010054', 1749217413000, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231834, 7, 40000, 230000, 270000, 0, 'BG250606010055', 1749217415037, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231835, 12, 80000, 220000, 300000, 0, 'BG250606010058', 1749217417091, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231836, 13, 40000, 130000, 170000, 0, 'BG250606010060', 1749217418132, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231837, 1, 50000, 409300, 459300, 0, 'BG250606010062', 1749217491615, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231838, 1, -50000, 459300, 409300, 1, 'BG250606010062', 1749217553370, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231839, 13, -40000, 170000, 130000, 1, 'BG250606010060', 1749217553381, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231840, 12, -80000, 300000, 220000, 1, 'BG250606010058', 1749217553391, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231841, 7, -40000, 270000, 230000, 1, 'BG250606010055', 1749217553398, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231842, 4, -10000, 140000, 130000, 1, 'BG250606010054', 1749217553412, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231843, 10, -40000, 210000, 170000, 1, 'BG250606010053', 1749217553425, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231844, 6, -70000, 270000, 200000, 1, 'BG250606010052', 1749217553438, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231845, 10, 40000, 170000, 210000, 0, 'BG250606010063', 1749217559106, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231846, 8, 40000, 250000, 290000, 0, 'BG250606010064', 1749217561204, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231847, 4, 90000, 130000, 220000, 0, 'BG250606010065', 1749217563236, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231848, 6, 60000, 200000, 260000, 0, 'BG250606010066', 1749217565303, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231849, 13, 20000, 130000, 150000, 0, 'BG250606010068', 1749217566370, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231850, 9, 80000, 290000, 370000, 0, 'BG250606010069', 1749217568421, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231851, 5, 90000, 180000, 270000, 0, 'BG250606010070', 1749217570492, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231852, 12, 40000, 220000, 260000, 0, 'BG250606010071', 1749217671154, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231853, 4, 10000, 220000, 230000, 0, 'BG250606010072', 1749217672203, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231854, 8, 40000, 290000, 330000, 0, 'BG250606010073', 1749217674251, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231855, 13, 10000, 150000, 160000, 0, 'BG250606010074', 1749217675316, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231856, 7, 30000, 230000, 260000, 0, 'BG250606010075', 1749217676353, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231857, 11, 10000, 230000, 240000, 0, 'BG250606010076', 1749217678422, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (231858, 6, 60000, 260000, 320000, 0, 'BG250606010077', 1749217680481, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231859, 5, 90000, 270000, 360000, 0, 'BG250609010078', 1749455512552, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231860, 4, 80000, 230000, 310000, 0, 'BG250609010079', 1749455513635, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231861, 3, 1000000, 0, 1000000, 0, 'BG250609010080', 1749455514252, '1234567', '下注');
INSERT INTO `lo_bet_change` VALUES (231862, 9, 60000, 370000, 430000, 0, 'BG250609010082', 1749455514696, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231863, 11, 60000, 240000, 300000, 0, 'BG250609010083', 1749455515752, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (231864, 8, 70000, 330000, 400000, 0, 'BG250609010084', 1749455516816, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231865, 6, 20000, 320000, 340000, 0, 'BG250609010085', 1749455517858, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231866, 13, 80000, 160000, 240000, 0, 'BG250609010086', 1749455519919, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231867, 10, 40000, 210000, 250000, 0, 'BG250609010087', 1749455521968, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231868, 11, 40000, 300000, 340000, 0, 'BG250611010089', 1749627971323, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (231869, 5, 80000, 360000, 440000, 0, 'BG250611010091', 1749627972446, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231870, 12, 90000, 260000, 350000, 0, 'BG250611010092', 1749627973497, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231871, 10, 70000, 250000, 320000, 0, 'BG250611010093', 1749627975537, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231872, 9, 90000, 430000, 520000, 0, 'BG250611010094', 1749627977587, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231873, 9, -90000, 520000, 430000, 1, 'BG250611010094', 1749630957058, '432564537', '撤单');
INSERT INTO `lo_bet_change` VALUES (231874, 10, -70000, 320000, 250000, 1, 'BG250611010093', 1749630957106, '510471664', '撤单');
INSERT INTO `lo_bet_change` VALUES (231875, 12, -90000, 350000, 260000, 1, 'BG250611010092', 1749630957138, '957259292', '撤单');
INSERT INTO `lo_bet_change` VALUES (231876, 5, -80000, 440000, 360000, 1, 'BG250611010091', 1749630957158, '494830400', '撤单');
INSERT INTO `lo_bet_change` VALUES (231877, 11, -40000, 340000, 300000, 1, 'BG250611010089', 1749630957180, '706540721', '撤单');
INSERT INTO `lo_bet_change` VALUES (231878, 13, 80000, 240000, 320000, 0, 'BG250611010096', 1749631043407, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231879, 7, 90000, 260000, 350000, 0, 'BG250611010097', 1749631044495, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231880, 12, 10000, 260000, 270000, 0, 'BG250611010098', 1749631045674, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231881, 10, 80000, 250000, 330000, 0, 'BG250611010099', 1749631047733, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231882, 8, 50000, 400000, 450000, 0, 'BG250611010100', 1749631048805, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231883, 9, 100000, 430000, 530000, 0, 'BG250611010101', 1749631049870, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231884, 5, 30000, 360000, 390000, 0, 'BG250611010102', 1749631050922, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231885, 4, 80000, 310000, 390000, 0, 'BG250611010103', 1749631053012, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231886, 1, 10000, 409300, 419300, 0, 'BG250611010104', 1749631842088, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231887, 12, 30000, 270000, 300000, 0, 'BG250611010105', 1749632388192, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231888, 5, 20000, 390000, 410000, 0, 'BG250611010106', 1749632390229, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231889, 4, 80000, 390000, 470000, 0, 'BG250611010108', 1749632392280, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231890, 13, 70000, 320000, 390000, 0, 'BG250611010109', 1749632393304, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231891, 1, 10000, 419300, 429300, 0, 'BG250611010110', 1749632554797, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231892, 4, 80000, 470000, 550000, 0, 'BG250611010111', 1749633153612, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (231893, 9, 60000, 530000, 590000, 0, 'BG250611010112', 1749633155680, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231894, 5, 60000, 410000, 470000, 0, 'BG250611010113', 1749633156746, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231895, 13, 20000, 390000, 410000, 0, 'BG250611010114', 1749633157788, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231896, 7, 50000, 350000, 400000, 0, 'BG250611010115', 1749633158846, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231897, 8, 40000, 450000, 490000, 0, 'BG250611010116', 1749633159902, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (231898, 1, 10000, 429300, 439300, 0, 'BG250611010117', 1749633190252, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231899, 1, -10000, 439300, 429300, 1, 'BG250611010117', 1749633391905, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231900, 8, -40000, 490000, 450000, 1, 'BG250611010116', 1749633391912, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231901, 7, -50000, 400000, 350000, 1, 'BG250611010115', 1749633391919, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231902, 13, -20000, 410000, 390000, 1, 'BG250611010114', 1749633391926, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231903, 5, -60000, 470000, 410000, 1, 'BG250611010113', 1749633391926, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231904, 9, -60000, 590000, 530000, 1, 'BG250611010112', 1749633391940, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231905, 4, -80000, 550000, 470000, 1, 'BG250611010111', 1749633391947, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231906, 1, -10000, 429300, 419300, 1, 'BG250611010110', 1749633391956, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231907, 13, -70000, 390000, 320000, 1, 'BG250611010109', 1749633391964, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231908, 4, -80000, 470000, 390000, 1, 'BG250611010108', 1749633391967, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231909, 5, -20000, 410000, 390000, 1, 'BG250611010106', 1749633391983, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231910, 12, -30000, 300000, 270000, 1, 'BG250611010105', 1749633391983, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231911, 1, -10000, 419300, 409300, 1, 'BG250611010104', 1749633391983, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231912, 4, -80000, 390000, 310000, 1, 'BG250611010103', 1749633391998, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231913, 5, -30000, 390000, 360000, 1, 'BG250611010102', 1749633392014, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231914, 9, -100000, 530000, 430000, 1, 'BG250611010101', 1749633392014, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231915, 8, -50000, 450000, 400000, 1, 'BG250611010100', 1749633392014, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231916, 10, -80000, 330000, 250000, 1, 'BG250611010099', 1749633392030, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231917, 12, -10000, 270000, 260000, 1, 'BG250611010098', 1749633392030, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231918, 7, -90000, 350000, 260000, 1, 'BG250611010097', 1749633392045, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231919, 13, -80000, 320000, 240000, 1, 'BG250611010096', 1749633392045, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231920, 10, -40000, 250000, 210000, 1, 'BG250609010087', 1749633392061, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231921, 13, -80000, 240000, 160000, 1, 'BG250609010086', 1749633392061, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231922, 6, -20000, 340000, 320000, 1, 'BG250609010085', 1749633392076, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231923, 8, -70000, 400000, 330000, 1, 'BG250609010084', 1749633392076, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231924, 11, -60000, 300000, 240000, 1, 'BG250609010083', 1749633392092, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231925, 9, -60000, 430000, 370000, 1, 'BG250609010082', 1749633392092, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231926, 3, -1000000, 1000000, 0, 1, 'BG250609010080', 1749633392092, '1234567', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231927, 4, -80000, 310000, 230000, 1, 'BG250609010079', 1749633392108, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231928, 5, -90000, 360000, 270000, 1, 'BG250609010078', 1749633392108, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231929, 6, -60000, 320000, 260000, 1, 'BG250606010077', 1749633392123, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231930, 11, -10000, 240000, 230000, 1, 'BG250606010076', 1749633392123, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231931, 7, -30000, 260000, 230000, 1, 'BG250606010075', 1749633392139, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231932, 13, -10000, 160000, 150000, 1, 'BG250606010074', 1749633392139, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231933, 8, -40000, 330000, 290000, 1, 'BG250606010073', 1749633392155, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231934, 4, -10000, 230000, 220000, 1, 'BG250606010072', 1749633392155, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231935, 12, -40000, 260000, 220000, 1, 'BG250606010071', 1749633392155, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231936, 5, -90000, 270000, 180000, 1, 'BG250606010070', 1749633392171, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231937, 9, -80000, 370000, 290000, 1, 'BG250606010069', 1749633392171, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231938, 13, -20000, 150000, 130000, 1, 'BG250606010068', 1749633392186, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231939, 6, -60000, 260000, 200000, 1, 'BG250606010066', 1749633392186, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231940, 4, -90000, 220000, 130000, 1, 'BG250606010065', 1749633392202, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231941, 8, -40000, 290000, 250000, 1, 'BG250606010064', 1749633392202, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231942, 10, -40000, 210000, 170000, 1, 'BG250606010063', 1749633392218, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231943, 7, -60000, 230000, 170000, 1, 'BG250606010049', 1749633392218, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231944, 9, -40000, 290000, 250000, 1, 'BG250606010047', 1749633392234, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231945, 10, -50000, 170000, 120000, 1, 'BG250606010045', 1749633392234, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231946, 12, -70000, 220000, 150000, 1, 'BG250606010043', 1749633392249, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231947, 9, -50000, 250000, 200000, 1, 'BG250606010042', 1749633392249, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231948, 6, -80000, 200000, 120000, 1, 'BG250606010041', 1749633392249, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231949, 13, -50000, 130000, 80000, 1, 'BG250606010040', 1749633392265, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231950, 5, -30000, 180000, 150000, 1, 'BG250606010039', 1749633392265, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231951, 12, -60000, 150000, 90000, 1, 'BG250606010037', 1749633392280, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231952, 8, -40000, 250000, 210000, 1, 'BG250606010035', 1749633392280, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231953, 10, -20000, 120000, 100000, 1, 'BG250606010034', 1749633392296, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231954, 7, -70000, 170000, 100000, 1, 'BG250606010033', 1749633392296, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231955, 1, -409300, 409300, 0, 1, 'BG250606010032', 1749633392311, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231956, 12, -60000, 90000, 30000, 1, 'BG250606010031', 1749633392311, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231957, 6, -80000, 120000, 40000, 1, 'BG250606010030', 1749633392327, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231958, 7, -20000, 100000, 80000, 1, 'BG250606010029', 1749633392327, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231959, 9, -120000, 200000, 80000, 1, 'BG250606010028', 1749633392343, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231960, 8, -70000, 210000, 140000, 1, 'BG250606010027', 1749633392343, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231961, 10, -70000, 100000, 30000, 1, 'BG250606010026', 1749633392343, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231962, 5, -60000, 150000, 90000, 1, 'BG250606010023', 1749633392358, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231963, 8, -20000, 140000, 120000, 1, 'BG250606010022', 1749633392374, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231964, 10, -30000, 30000, 0, 1, 'BG250606010020', 1749633392374, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231965, 11, -90000, 230000, 140000, 1, 'BG250606010018', 1749633392389, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231966, 4, -80000, 130000, 50000, 1, 'BG250606010017', 1749633392389, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231967, 7, -60000, 80000, 20000, 1, 'BG250606010016', 1749633392405, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231968, 8, -50000, 120000, 70000, 1, 'BG250606010013', 1749633392405, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231969, 4, -40000, 50000, 10000, 1, 'BG250606010012', 1749633392421, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231970, 13, -80000, 80000, 0, 1, 'BG250606010011', 1749633392436, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231971, 12, -30000, 30000, 0, 1, 'BG250606010010', 1749633392436, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231972, 11, -90000, 140000, 50000, 1, 'BG250606010009', 1749633392452, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231973, 4, -10000, 10000, 0, 1, 'BG250606010008', 1749633392452, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231974, 5, -80000, 90000, 10000, 1, 'BG250606010007', 1749633392468, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231975, 8, -70000, 70000, 0, 1, 'BG250606010004', 1749633392468, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231976, 11, -50000, 50000, 0, 1, 'BG250606010003', 1749633392483, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231977, 5, -10000, 10000, 0, 1, 'BG250606010002', 1749633392483, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231978, 6, -40000, 40000, 0, 1, 'BG250606010001', 1749633392499, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231979, 9, -80000, 80000, 0, 1, 'BG250606010000', 1749633392499, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231980, 7, -20000, 20000, 0, 1, 'BG250606009999', 1749633392499, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231981, 5, 80000, 0, 80000, 0, 'BG250611010118', 1749633527262, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (231982, 11, 60000, 0, 60000, 0, 'BG250611010119', 1749633529288, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (231983, 10, 40000, 0, 40000, 0, 'BG250611010120', 1749633530329, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (231984, 9, 10000, 0, 10000, 0, 'BG250611010121', 1749633531359, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (231985, 6, 40000, 0, 40000, 0, 'BG250611010122', 1749633532400, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (231986, 7, 30000, 0, 30000, 0, 'BG250611010124', 1749633534451, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (231987, 12, 90000, 0, 90000, 0, 'BG250611010125', 1749633535491, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (231988, 1, 10000, 0, 10000, 0, 'BG250611010126', 1749634599688, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (231990, 1, -10000, 10000, 0, 1, 'BG250611010126', 1749641300425, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231991, 12, -90000, 90000, 0, 1, 'BG250611010125', 1749641300429, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231992, 7, -30000, 30000, 0, 1, 'BG250611010124', 1749641300429, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231993, 6, -40000, 40000, 0, 1, 'BG250611010122', 1749641300441, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231994, 9, -10000, 10000, 0, 1, 'BG250611010121', 1749641300446, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231995, 10, -40000, 40000, 0, 1, 'BG250611010120', 1749641300557, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231996, 11, -60000, 60000, 0, 1, 'BG250611010119', 1749641300564, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231997, 5, -80000, 80000, 0, 1, 'BG250611010118', 1749641300571, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (231998, 13, 20000, 0, 20000, 0, 'BG250611010128', 1749641309346, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (231999, 8, 90000, 0, 90000, 0, 'BG250611010129', 1749641311379, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232000, 5, 60000, 0, 60000, 0, 'BG250611010130', 1749641312416, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232001, 11, 30000, 0, 30000, 0, 'BG250611010131', 1749641313446, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232002, 6, 20000, 0, 20000, 0, 'BG250611010132', 1749641315505, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232003, 4, 30000, 0, 30000, 0, 'BG250611010133', 1749641317549, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232004, 9, 70000, 0, 70000, 0, 'BG250611010134', 1749641319595, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232005, 10, 60000, 0, 60000, 0, 'BG250611010135', 1749641321646, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232006, 7, 60000, 0, 60000, 0, 'BG250611010136', 1749641322696, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232007, 7, -60000, 60000, 0, 1, 'BG250611010136', 1749641502764, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232008, 10, -60000, 60000, 0, 1, 'BG250611010135', 1749641502779, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232009, 9, -70000, 70000, 0, 1, 'BG250611010134', 1749641502904, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232010, 4, -30000, 30000, 0, 1, 'BG250611010133', 1749641502912, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232011, 6, -20000, 20000, 0, 1, 'BG250611010132', 1749641502919, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232012, 11, -30000, 30000, 0, 1, 'BG250611010131', 1749641502931, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232013, 5, -60000, 60000, 0, 1, 'BG250611010130', 1749641502940, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232014, 8, -90000, 90000, 0, 1, 'BG250611010129', 1749641502947, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232015, 13, -20000, 20000, 0, 1, 'BG250611010128', 1749641502954, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232016, 6, 20000, 0, 20000, 0, 'BG250611010137', 1749641505075, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232017, 11, 20000, 0, 20000, 0, 'BG250611010138', 1749641507112, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232018, 5, 30000, 0, 30000, 0, 'BG250611010139', 1749641508178, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232019, 13, 160000, 0, 160000, 0, 'BG250611010140', 1749641509228, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232020, 10, 120000, 0, 120000, 0, 'BG250611010141', 1749641511283, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232021, 7, 20000, 0, 20000, 0, 'BG250611010142', 1749641512373, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232022, 9, 40000, 0, 40000, 0, 'BG250611010143', 1749641513439, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232023, 12, 50000, 0, 50000, 0, 'BG250611010144', 1749641515503, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232024, 12, -50000, 50000, 0, 1, 'BG250611010144', 1749641641545, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232025, 9, -40000, 40000, 0, 1, 'BG250611010143', 1749641641552, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232026, 7, -20000, 20000, 0, 1, 'BG250611010142', 1749641641559, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232027, 10, -120000, 120000, 0, 1, 'BG250611010141', 1749641641559, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232028, 13, -160000, 160000, 0, 1, 'BG250611010140', 1749641641570, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232029, 5, -30000, 30000, 0, 1, 'BG250611010139', 1749641641572, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232030, 11, -20000, 20000, 0, 1, 'BG250611010138', 1749641641588, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232031, 6, -20000, 20000, 0, 1, 'BG250611010137', 1749641641595, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232032, 8, 80000, 0, 80000, 0, 'BG250611010145', 1749641645059, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232033, 5, 90000, 0, 90000, 0, 'BG250611010146', 1749641647092, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232034, 12, 80000, 0, 80000, 0, 'BG250611010147', 1749641649123, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232035, 10, 60000, 0, 60000, 0, 'BG250611010148', 1749641651157, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232036, 11, 40000, 0, 40000, 0, 'BG250611010149', 1749641653201, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232037, 13, 50000, 0, 50000, 0, 'BG250611010150', 1749641654246, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232038, 4, 80000, 0, 80000, 0, 'BG250611010151', 1749641655267, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232039, 9, 40000, 0, 40000, 0, 'BG250611010152', 1749641656304, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232040, 6, 70000, 0, 70000, 0, 'BG250611010153', 1749641657344, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232041, 6, -70000, 70000, 0, 1, 'BG250611010153', 1749644034992, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232042, 9, -40000, 40000, 0, 1, 'BG250611010152', 1749644035019, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232043, 4, -80000, 80000, 0, 1, 'BG250611010151', 1749644035023, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232044, 13, -50000, 50000, 0, 1, 'BG250611010150', 1749644035033, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232045, 11, -40000, 40000, 0, 1, 'BG250611010149', 1749644035039, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232046, 10, -60000, 60000, 0, 1, 'BG250611010148', 1749644035051, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232047, 12, -80000, 80000, 0, 1, 'BG250611010147', 1749644035060, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232048, 5, -90000, 90000, 0, 1, 'BG250611010146', 1749644035162, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232049, 8, -80000, 80000, 0, 1, 'BG250611010145', 1749644035178, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232050, 5, 40000, 0, 40000, 0, 'BG250611010154', 1749644584065, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232051, 11, 90000, 0, 90000, 0, 'BG250611010155', 1749644585065, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232052, 7, 10000, 0, 10000, 0, 'BG250611010156', 1749644586067, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232053, 9, 50000, 0, 50000, 0, 'BG250611010157', 1749644586082, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232054, 8, 30000, 0, 30000, 0, 'BG250611010158', 1749644587100, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232055, 12, 70000, 0, 70000, 0, 'BG250611010159', 1749644587100, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232056, 12, 80000, 70000, 150000, 0, 'BG250611010160', 1749644588116, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232057, 10, 50000, 0, 50000, 0, 'BG250611010161', 1749644589148, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232058, 6, 40000, 0, 40000, 0, 'BG250611010162', 1749644589163, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232059, 10, 50000, 50000, 100000, 0, 'BG250611010163', 1749644590165, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232060, 4, 60000, 0, 60000, 0, 'BG250611010164', 1749644590182, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232061, 12, 10000, 150000, 160000, 0, 'BG250611010165', 1749644591182, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232062, 6, 40000, 40000, 80000, 0, 'BG250611010166', 1749644592230, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232063, 13, 10000, 0, 10000, 0, 'BG250611010168', 1749644592245, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232064, 11, 60000, 90000, 150000, 0, 'BG250611010167', 1749644592245, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232065, 13, 60000, 10000, 70000, 0, 'BG250611010169', 1749644593293, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232066, 8, 80000, 30000, 110000, 0, 'BG250611010171', 1749644594294, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232067, 5, 50000, 40000, 90000, 0, 'BG250611010170', 1749644594294, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232068, 7, 70000, 10000, 80000, 0, 'BG250611010172', 1749644595311, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232069, 7, 10000, 80000, 90000, 0, 'BG250611010173', 1749644596314, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232070, 9, 10000, 50000, 60000, 0, 'BG250611010174', 1749644597362, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232071, 4, 60000, 60000, 120000, 0, 'BG250611010175', 1749644599381, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232072, 10, 20000, 100000, 120000, 0, 'BG250611010176', 1749644677067, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232073, 13, 50000, 70000, 120000, 0, 'BG250611010177', 1749644679085, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232074, 8, 30000, 110000, 140000, 0, 'BG250611010178', 1749644681118, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232075, 5, 10000, 90000, 100000, 0, 'BG250611010179', 1749644683135, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232076, 7, 20000, 90000, 110000, 0, 'BG250611010180', 1749644684169, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232077, 12, 40000, 160000, 200000, 0, 'BG250611010181', 1749644685200, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232078, 4, 80000, 120000, 200000, 0, 'BG250611010182', 1749644686218, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232079, 9, 60000, 60000, 120000, 0, 'BG250611010183', 1749644687235, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232080, 6, 70000, 80000, 150000, 0, 'BG250611010184', 1749644688252, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232081, 6, -70000, 150000, 80000, 1, 'BG250611010184', 1749648000492, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232082, 9, -60000, 120000, 60000, 1, 'BG250611010183', 1749648000497, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232083, 4, -80000, 200000, 120000, 1, 'BG250611010182', 1749648000503, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232084, 12, -40000, 200000, 160000, 1, 'BG250611010181', 1749648000508, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232085, 7, -20000, 110000, 90000, 1, 'BG250611010180', 1749648000514, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232086, 5, -10000, 100000, 90000, 1, 'BG250611010179', 1749648000521, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232087, 8, -30000, 140000, 110000, 1, 'BG250611010178', 1749648000535, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232088, 13, -50000, 120000, 70000, 1, 'BG250611010177', 1749648000542, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232089, 10, -20000, 120000, 100000, 1, 'BG250611010176', 1749648000543, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232090, 4, -60000, 120000, 60000, 1, 'BG250611010175', 1749648000559, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232091, 9, -10000, 60000, 50000, 1, 'BG250611010174', 1749648000559, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232092, 7, -10000, 90000, 80000, 1, 'BG250611010173', 1749648000585, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232093, 7, -70000, 80000, 10000, 1, 'BG250611010172', 1749648000594, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232094, 8, -80000, 110000, 30000, 1, 'BG250611010171', 1749648000602, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232095, 5, -50000, 90000, 40000, 1, 'BG250611010170', 1749648000611, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232096, 13, -60000, 70000, 10000, 1, 'BG250611010169', 1749648000614, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232097, 13, -10000, 10000, 0, 1, 'BG250611010168', 1749648000632, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232098, 11, -60000, 150000, 90000, 1, 'BG250611010167', 1749648000635, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232099, 6, -40000, 80000, 40000, 1, 'BG250611010166', 1749648000642, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232100, 12, -10000, 160000, 150000, 1, 'BG250611010165', 1749648000650, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232101, 4, -60000, 60000, 0, 1, 'BG250611010164', 1749648000659, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232102, 10, -50000, 100000, 50000, 1, 'BG250611010163', 1749648000667, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232103, 6, -40000, 40000, 0, 1, 'BG250611010162', 1749648000673, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232104, 10, -50000, 50000, 0, 1, 'BG250611010161', 1749648000679, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232105, 12, -80000, 150000, 70000, 1, 'BG250611010160', 1749648000684, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232106, 12, -70000, 70000, 0, 1, 'BG250611010159', 1749648000691, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232107, 8, -30000, 30000, 0, 1, 'BG250611010158', 1749648000694, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232108, 9, -50000, 50000, 0, 1, 'BG250611010157', 1749648000708, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232109, 7, -10000, 10000, 0, 1, 'BG250611010156', 1749648000733, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232110, 11, -90000, 90000, 0, 1, 'BG250611010155', 1749648000750, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232111, 5, -40000, 40000, 0, 1, 'BG250611010154', 1749648000758, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232112, 10, 20000, 0, 20000, 0, 'BG250611010185', 1749648561191, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232113, 7, 90000, 0, 90000, 0, 'BG250611010186', 1749648562262, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232114, 12, 30000, 0, 30000, 0, 'BG250611010187', 1749648563307, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232115, 13, 90000, 0, 90000, 0, 'BG250611010188', 1749648565349, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232116, 8, 50000, 0, 50000, 0, 'BG250611010189', 1749648567395, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232117, 4, 140000, 0, 140000, 0, 'BG250611010190', 1749648569452, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232118, 11, 30000, 0, 30000, 0, 'BG250611010191', 1749648571499, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232119, 6, 90000, 0, 90000, 0, 'BG250611010192', 1749648572545, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232120, 5, 70000, 0, 70000, 0, 'BG250611010193', 1749648574600, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232121, 5, -70000, 70000, 0, 1, 'BG250611010193', 1749884012462, '494830400', '撤单');
INSERT INTO `lo_bet_change` VALUES (232122, 6, -90000, 90000, 0, 1, 'BG250611010192', 1749884012523, '504531754', '撤单');
INSERT INTO `lo_bet_change` VALUES (232123, 11, -30000, 30000, 0, 1, 'BG250611010191', 1749884012548, '706540721', '撤单');
INSERT INTO `lo_bet_change` VALUES (232124, 4, -140000, 140000, 0, 1, 'BG250611010190', 1749884012582, '272956840', '撤单');
INSERT INTO `lo_bet_change` VALUES (232125, 8, -50000, 50000, 0, 1, 'BG250611010189', 1749884012598, '857337651', '撤单');
INSERT INTO `lo_bet_change` VALUES (232126, 13, -90000, 90000, 0, 1, 'BG250611010188', 1749884012619, '951407808', '撤单');
INSERT INTO `lo_bet_change` VALUES (232127, 12, -30000, 30000, 0, 1, 'BG250611010187', 1749884012640, '957259292', '撤单');
INSERT INTO `lo_bet_change` VALUES (232128, 7, -90000, 90000, 0, 1, 'BG250611010186', 1749884012660, '299086397', '撤单');
INSERT INTO `lo_bet_change` VALUES (232129, 10, -20000, 20000, 0, 1, 'BG250611010185', 1749884012675, '510471664', '撤单');
INSERT INTO `lo_bet_change` VALUES (232130, 4, 80000, 0, 80000, 0, 'BG250614010194', 1749884014749, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232131, 9, 50000, 0, 50000, 0, 'BG250614010195', 1749884016797, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232132, 5, 90000, 0, 90000, 0, 'BG250614010196', 1749884018845, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232133, 6, 100000, 0, 100000, 0, 'BG250614010197', 1749884020871, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232134, 10, -1, 0, -1, 0, 'BG250614010198', 1749884021907, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232135, 12, 10000, 0, 10000, 0, 'BG250614010199', 1749884023973, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232136, 11, 140000, 0, 140000, 0, 'BG250614010200', 1749884026023, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232137, 8, 70000, 0, 70000, 0, 'BG250614010201', 1749884028047, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232138, 13, 80000, 0, 80000, 0, 'BG250614010202', 1749884029117, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232139, 7, 70000, 0, 70000, 0, 'BG250614010203', 1749884031154, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232140, 1, 59900000, 0, 59900000, 0, 'BG250614010204', 1749885754044, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232141, 1, -59900000, 59900000, 0, 1, 'BG250614010204', 1749895280496, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232142, 7, -70000, 70000, 0, 1, 'BG250614010203', 1749895280496, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232143, 13, -80000, 80000, 0, 1, 'BG250614010202', 1749895280513, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232144, 8, -70000, 70000, 0, 1, 'BG250614010201', 1749895280513, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232145, 11, -140000, 140000, 0, 1, 'BG250614010200', 1749895280528, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232146, 12, -10000, 10000, 0, 1, 'BG250614010199', 1749895280542, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232147, 6, -100000, 100000, 0, 1, 'BG250614010197', 1749895280548, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232148, 5, -90000, 90000, 0, 1, 'BG250614010196', 1749895280548, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232149, 9, -50000, 50000, 0, 1, 'BG250614010195', 1749895280569, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232150, 4, -80000, 80000, 0, 1, 'BG250614010194', 1749895280576, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232151, 9, 50000, 0, 50000, 0, 'BG250614010205', 1749895300893, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232152, 12, 20000, 0, 20000, 0, 'BG250614010206', 1749895302931, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232153, 4, 80000, 0, 80000, 0, 'BG250614010207', 1749895304968, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232154, 10, 90000, -1, 89999, 0, 'BG250614010208', 1749895307027, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232155, 7, 60000, 0, 60000, 0, 'BG250614010209', 1749895308046, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232156, 13, 60000, 0, 60000, 0, 'BG250614010210', 1749895310086, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232157, 5, 70000, 0, 70000, 0, 'BG250614010211', 1749895312122, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232158, 8, 80000, 0, 80000, 0, 'BG250614010212', 1749895313174, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232159, 1, 419132000, 0, 419132000, 0, 'BG250614010213', 1749895345448, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232160, 1, -419132000, 419132000, 0, 1, 'BG250614010213', 1749912457644, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232161, 8, -80000, 80000, 0, 1, 'BG250614010212', 1749912457651, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232162, 5, -70000, 70000, 0, 1, 'BG250614010211', 1749912457679, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232163, 13, -60000, 60000, 0, 1, 'BG250614010210', 1749912457686, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232164, 7, -60000, 60000, 0, 1, 'BG250614010209', 1749912457693, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232165, 10, -90000, 89999, -1, 1, 'BG250614010208', 1749912457699, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232166, 4, -80000, 80000, 0, 1, 'BG250614010207', 1749912457719, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232167, 12, -20000, 20000, 0, 1, 'BG250614010206', 1749912457733, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232168, 9, -50000, 50000, 0, 1, 'BG250614010205', 1749912457756, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232169, 4, 100000, 0, 100000, 0, 'BG250615010214', 1749970161927, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232170, 12, 70000, 0, 70000, 0, 'BG250615010216', 1749970164038, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232171, 10, 40000, 0, 40000, 0, 'BG250615010217', 1749970166081, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232172, 5, 40000, 0, 40000, 0, 'BG250615010218', 1749970167113, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232173, 11, 60000, 0, 60000, 0, 'BG250615010219', 1749970169161, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232174, 13, 10000, 0, 10000, 0, 'BG250615010220', 1749970170198, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232175, 9, 80000, 0, 80000, 0, 'BG250615010221', 1749970171255, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232176, 6, 30000, 0, 30000, 0, 'BG250615010222', 1749970173334, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232177, 1, 10000, 0, 10000, 0, 'BG250615010223', 1749970182477, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232178, 1, -10000, 10000, 0, 1, 'BG250615010223', 1749970193194, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232179, 1, 10000, 0, 10000, 0, 'BG250615010224', 1749970193354, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232180, 1, -10000, 10000, 0, 1, 'BG250615010224', 1749970207760, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232181, 1, 20000, 0, 20000, 0, 'BG250615010225', 1749970207793, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232182, 1, -20000, 20000, 0, 1, 'BG250615010225', 1749970951145, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232183, 1, 30000, 0, 30000, 0, 'BG250615010226', 1749970951187, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232184, 1, -30000, 30000, 0, 1, 'BG250615010226', 1749971092839, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232185, 1, 30000, 0, 30000, 0, 'BG250615010227', 1749971092881, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232186, 1, -30000, 30000, 0, 1, 'BG250615010227', 1749971309442, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232187, 1, 30000, 0, 30000, 0, 'BG250615010228', 1749971309485, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232188, 1, -30000, 30000, 0, 1, 'BG250615010228', 1749974091991, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232189, 6, -30000, 30000, 0, 1, 'BG250615010222', 1749974092008, '504531754', '撤单');
INSERT INTO `lo_bet_change` VALUES (232190, 9, -80000, 80000, 0, 1, 'BG250615010221', 1749974092026, '432564537', '撤单');
INSERT INTO `lo_bet_change` VALUES (232191, 13, -10000, 10000, 0, 1, 'BG250615010220', 1749974092042, '951407808', '撤单');
INSERT INTO `lo_bet_change` VALUES (232192, 11, -60000, 60000, 0, 1, 'BG250615010219', 1749974092059, '706540721', '撤单');
INSERT INTO `lo_bet_change` VALUES (232193, 5, -40000, 40000, 0, 1, 'BG250615010218', 1749974092075, '494830400', '撤单');
INSERT INTO `lo_bet_change` VALUES (232194, 10, -40000, 40000, 0, 1, 'BG250615010217', 1749974092092, '510471664', '撤单');
INSERT INTO `lo_bet_change` VALUES (232195, 12, -70000, 70000, 0, 1, 'BG250615010216', 1749974092110, '957259292', '撤单');
INSERT INTO `lo_bet_change` VALUES (232196, 4, -100000, 100000, 0, 1, 'BG250615010214', 1749974092127, '272956840', '撤单');
INSERT INTO `lo_bet_change` VALUES (232197, 4, 70000, 0, 70000, 0, 'BG250615010229', 1749974094225, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232198, 9, 70000, 0, 70000, 0, 'BG250615010230', 1749974096270, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232199, 13, 80000, 0, 80000, 0, 'BG250615010231', 1749974097314, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232200, 6, 10000, 0, 10000, 0, 'BG250615010232', 1749974098380, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232201, 8, 30000, 0, 30000, 0, 'BG250615010233', 1749974100429, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232202, 1, 20000, 0, 20000, 0, 'BG250615010234', 1749974215527, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232203, 1, -20000, 20000, 0, 1, 'BG250615010234', 1749974228011, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232204, 8, -30000, 30000, 0, 1, 'BG250615010233', 1749974228026, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232205, 6, -10000, 10000, 0, 1, 'BG250615010232', 1749974228026, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232206, 13, -80000, 80000, 0, 1, 'BG250615010231', 1749974228042, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232207, 9, -70000, 70000, 0, 1, 'BG250615010230', 1749974228058, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232208, 4, -70000, 70000, 0, 1, 'BG250615010229', 1749974228073, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232209, 13, 50000, 0, 50000, 0, 'BG250615010235', 1749974237959, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232210, 12, 90000, 0, 90000, 0, 'BG250615010236', 1749974239013, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232211, 1, 20000, 0, 20000, 0, 'BG250615010237', 1749974239293, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232212, 9, 180000, 0, 180000, 0, 'BG250615010238', 1749974240056, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232213, 6, 20000, 0, 20000, 0, 'BG250615010239', 1749974242127, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232214, 4, 40000, 0, 40000, 0, 'BG250615010240', 1749974243181, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232215, 8, 90000, 0, 90000, 0, 'BG250615010241', 1749974244263, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232216, 10, 60000, 0, 60000, 0, 'BG250615010242', 1749974245305, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232217, 7, 90000, 0, 90000, 0, 'BG250615010243', 1749974247353, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232218, 5, 80000, 0, 80000, 0, 'BG250615010244', 1749974249443, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232219, 5, -80000, 80000, 0, 1, 'BG250615010244', 1749974940433, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232220, 7, -90000, 90000, 0, 1, 'BG250615010243', 1749974940440, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232221, 10, -60000, 60000, 0, 1, 'BG250615010242', 1749974940453, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232222, 8, -90000, 90000, 0, 1, 'BG250615010241', 1749974940460, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232223, 4, -40000, 40000, 0, 1, 'BG250615010240', 1749974940467, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232224, 6, -20000, 20000, 0, 1, 'BG250615010239', 1749974940474, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232225, 9, -180000, 180000, 0, 1, 'BG250615010238', 1749974940489, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232226, 1, -20000, 20000, 0, 1, 'BG250615010237', 1749974940496, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232227, 12, -90000, 90000, 0, 1, 'BG250615010236', 1749974940517, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232228, 13, -50000, 50000, 0, 1, 'BG250615010235', 1749974940531, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232229, 9, 90000, 0, 90000, 0, 'BG250615010245', 1749975255311, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232230, 11, 80000, 0, 80000, 0, 'BG250615010246', 1749975256372, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232231, 4, 90000, 0, 90000, 0, 'BG250615010247', 1749975257398, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232232, 7, 40000, 0, 40000, 0, 'BG250615010248', 1749975258456, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232233, 5, 70000, 0, 70000, 0, 'BG250615010249', 1749975259514, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232234, 6, 20000, 0, 20000, 0, 'BG250615010250', 1749975260566, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232235, 13, 30000, 0, 30000, 0, 'BG250615010251', 1749975261603, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232236, 12, 60000, 0, 60000, 0, 'BG250615010252', 1749975263667, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232237, 5, 40000, 70000, 110000, 0, 'BG250615010253', 1749975315107, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232238, 7, 70000, 40000, 110000, 0, 'BG250615010254', 1749975317174, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232239, 12, 80000, 60000, 140000, 0, 'BG250615010255', 1749975319224, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232240, 10, 20000, 0, 20000, 0, 'BG250615010256', 1749975320302, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232241, 13, 120000, 30000, 150000, 0, 'BG250615010257', 1749975322346, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232242, 6, 30000, 20000, 50000, 0, 'BG250615010258', 1749975324382, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232243, 8, 50000, 0, 50000, 0, 'BG250615010259', 1749975326433, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232244, 9, 10000, 90000, 100000, 0, 'BG250615010260', 1749975378125, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232245, 12, 50000, 140000, 190000, 0, 'BG250615010261', 1749975380169, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232246, 10, 30000, 20000, 50000, 0, 'BG250615010262', 1749975382237, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232247, 5, 20000, 110000, 130000, 0, 'BG250615010263', 1749975384279, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232248, 7, 140000, 110000, 250000, 0, 'BG250615010264', 1749975386304, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232249, 6, 80000, 50000, 130000, 0, 'BG250615010265', 1749975388332, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232250, 11, 180000, 80000, 260000, 0, 'BG250615010266', 1749975389379, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232251, 11, -180000, 260000, 80000, 1, 'BG250615010266', 1749975525166, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232252, 6, -80000, 130000, 50000, 1, 'BG250615010265', 1749975525169, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232253, 7, -140000, 250000, 110000, 1, 'BG250615010264', 1749975525169, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232254, 5, -20000, 130000, 110000, 1, 'BG250615010263', 1749975525185, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232255, 10, -30000, 50000, 20000, 1, 'BG250615010262', 1749975525295, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232256, 12, -50000, 190000, 140000, 1, 'BG250615010261', 1749975525302, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232257, 9, -10000, 100000, 90000, 1, 'BG250615010260', 1749975525309, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232258, 8, -50000, 50000, 0, 1, 'BG250615010259', 1749975525316, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232259, 6, -30000, 50000, 20000, 1, 'BG250615010258', 1749975525324, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232260, 13, -120000, 150000, 30000, 1, 'BG250615010257', 1749975525334, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232261, 10, -20000, 20000, 0, 1, 'BG250615010256', 1749975525342, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232262, 12, -80000, 140000, 60000, 1, 'BG250615010255', 1749975525349, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232263, 7, -70000, 110000, 40000, 1, 'BG250615010254', 1749975525370, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232264, 5, -40000, 110000, 70000, 1, 'BG250615010253', 1749975525377, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232265, 12, -60000, 60000, 0, 1, 'BG250615010252', 1749975525392, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232266, 13, -30000, 30000, 0, 1, 'BG250615010251', 1749975525399, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232267, 6, -20000, 20000, 0, 1, 'BG250615010250', 1749975525405, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232268, 5, -70000, 70000, 0, 1, 'BG250615010249', 1749975525412, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232269, 7, -40000, 40000, 0, 1, 'BG250615010248', 1749975525419, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232270, 4, -90000, 90000, 0, 1, 'BG250615010247', 1749975525426, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232271, 11, -80000, 80000, 0, 1, 'BG250615010246', 1749975525433, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232272, 9, -90000, 90000, 0, 1, 'BG250615010245', 1749975525440, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232273, 8, 80000, 0, 80000, 0, 'BG250615010267', 1749975541398, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232274, 11, 50000, 0, 50000, 0, 'BG250615010268', 1749975542438, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232275, 5, 60000, 0, 60000, 0, 'BG250615010269', 1749975543481, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232276, 7, 30000, 0, 30000, 0, 'BG250615010270', 1749975545505, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232277, 9, 20000, 0, 20000, 0, 'BG250615010271', 1749975546545, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232278, 6, 20000, 0, 20000, 0, 'BG250615010272', 1749975547581, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232279, 4, 90000, 0, 90000, 0, 'BG250615010273', 1749975548610, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232280, 13, 30000, 0, 30000, 0, 'BG250615010274', 1749975549676, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232281, 1, 20000, 0, 20000, 0, 'BG250615010275', 1749986497932, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232282, 1, -20000, 20000, 0, 1, 'BG250615010275', 1749986506061, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232283, 1, 108000, 0, 108000, 0, 'BG250615010277', 1749995241030, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232284, 1, -108000, 108000, 0, 1, 'BG250615010277', 1749995743136, '45678', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232285, 13, -30000, 30000, 0, 1, 'BG250615010274', 1749995743154, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232286, 4, -90000, 90000, 0, 1, 'BG250615010273', 1749995743160, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232287, 6, -20000, 20000, 0, 1, 'BG250615010272', 1749995743176, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232288, 9, -20000, 20000, 0, 1, 'BG250615010271', 1749995743183, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232289, 7, -30000, 30000, 0, 1, 'BG250615010270', 1749995743190, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232290, 5, -60000, 60000, 0, 1, 'BG250615010269', 1749995743210, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232291, 11, -50000, 50000, 0, 1, 'BG250615010268', 1749995743218, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232292, 8, -80000, 80000, 0, 1, 'BG250615010267', 1749995743225, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232293, 4, 30000, 0, 30000, 0, 'BG250615010278', 1749996209339, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232294, 4, -30000, 30000, 0, 1, 'BG250615010278', 1749996219657, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232295, 9, 30000, 0, 30000, 0, 'BG250616010279', 1750042931304, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232296, 10, 60000, 0, 60000, 0, 'BG250616010280', 1750042933364, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232297, 11, 50000, 0, 50000, 0, 'BG250616010281', 1750042934428, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232298, 8, 10000, 0, 10000, 0, 'BG250616010282', 1750042935488, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232299, 12, 10000, 0, 10000, 0, 'BG250616010283', 1750042937524, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232300, 5, 80000, 0, 80000, 0, 'BG250616010284', 1750042939582, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232301, 1, 10000, 0, 10000, 0, 'BG250616010285', 1750043185852, '45678', '下注');
INSERT INTO `lo_bet_change` VALUES (232302, 1, -10000, 10000, 0, 1, 'BG250616010285', 1750043192130, '45678', '撤单');
INSERT INTO `lo_bet_change` VALUES (232303, 5, -80000, 80000, 0, 1, 'BG250616010284', 1750411350270, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232304, 12, -10000, 10000, 0, 1, 'BG250616010283', 1750411350304, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232305, 8, -10000, 10000, 0, 1, 'BG250616010282', 1750411350313, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232306, 11, -50000, 50000, 0, 1, 'BG250616010281', 1750411350326, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232307, 10, -60000, 60000, 0, 1, 'BG250616010280', 1750411350334, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232308, 9, -30000, 30000, 0, 1, 'BG250616010279', 1750411350342, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232309, 5, 140000, 0, 140000, 0, 'BG250620010287', 1750411353088, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232310, 7, 80000, 0, 80000, 0, 'BG250620010288', 1750411355139, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232311, 9, 20000, 0, 20000, 0, 'BG250620010289', 1750411356184, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232312, 12, 70000, 0, 70000, 0, 'BG250620010290', 1750411357260, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232313, 10, 30000, 0, 30000, 0, 'BG250620010291', 1750411359316, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232314, 10, -30000, 30000, 0, 1, 'BG250620010291', 1750411448015, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232315, 12, -70000, 70000, 0, 1, 'BG250620010290', 1750411448030, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232316, 9, -20000, 20000, 0, 1, 'BG250620010289', 1750411448046, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232317, 7, -80000, 80000, 0, 1, 'BG250620010288', 1750411448062, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232318, 5, -140000, 140000, 0, 1, 'BG250620010287', 1750411448062, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232319, 13, 60000, 0, 60000, 0, 'BG250620010292', 1750411452064, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232320, 8, 20000, 0, 20000, 0, 'BG250620010293', 1750411453096, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232321, 9, 70000, 0, 70000, 0, 'BG250620010294', 1750411455147, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232322, 5, 40000, 0, 40000, 0, 'BG250620010295', 1750411457181, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232323, 7, 80000, 0, 80000, 0, 'BG250620010296', 1750411459216, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232324, 12, 10000, 0, 10000, 0, 'BG250620010297', 1750411461251, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232325, 4, 90000, 0, 90000, 0, 'BG250620010298', 1750411462268, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232326, 6, 80000, 0, 80000, 0, 'BG250620010299', 1750411463317, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232327, 6, -80000, 80000, 0, 1, 'BG250620010299', 1750411855647, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232328, 4, -90000, 90000, 0, 1, 'BG250620010298', 1750411855660, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232329, 12, -10000, 10000, 0, 1, 'BG250620010297', 1750411855661, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232330, 7, -80000, 80000, 0, 1, 'BG250620010296', 1750411855676, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232331, 5, -40000, 40000, 0, 1, 'BG250620010295', 1750411855685, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232332, 9, -70000, 70000, 0, 1, 'BG250620010294', 1750411855734, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232333, 8, -20000, 20000, 0, 1, 'BG250620010293', 1750411855741, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232334, 13, -60000, 60000, 0, 1, 'BG250620010292', 1750411855752, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232335, 9, 40000, 0, 40000, 0, 'BG250620010300', 1750411860176, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232336, 5, 30000, 0, 30000, 0, 'BG250620010301', 1750411862243, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232337, 12, 60000, 0, 60000, 0, 'BG250620010302', 1750411864277, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232338, 6, 60000, 0, 60000, 0, 'BG250620010303', 1750411865325, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232339, 8, 20000, 0, 20000, 0, 'BG250620010304', 1750411866344, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232340, 8, -20000, 0, -20000, 1, 'BG250620010304', 1750661366123, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232341, 6, -60000, 0, -60000, 1, 'BG250620010303', 1750661366139, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232342, 12, -60000, 0, -60000, 1, 'BG250620010302', 1750661366151, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232343, 5, -30000, 0, -30000, 1, 'BG250620010301', 1750661366161, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232344, 9, -40000, 0, -40000, 1, 'BG250620010300', 1750661366173, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232345, 12, 70000, 0, 70000, 0, 'BG250623010305', 1750670499069, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232346, 8, 10000, 0, 10000, 0, 'BG250623010306', 1750670501123, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232347, 13, 50000, 0, 50000, 0, 'BG250623010307', 1750670503183, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232348, 1, 1000, 0, 1000, 0, 'BG250623010308', 1750670504113, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232349, 9, 80000, 0, 80000, 0, 'BG250623010310', 1750670504294, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232350, 7, 10000, 0, 10000, 0, 'BG250623010311', 1750670505357, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232351, 4, 10000, 0, 10000, 0, 'BG250623010312', 1750670507400, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232352, 1, 12800, 1000, 13800, 0, 'BG250623010313', 1750681073080, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232353, 1, -12800, 13800, 1000, 1, 'BG250623010313', 1750681101449, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232354, 4, -10000, 10000, 0, 1, 'BG250623010312', 1750681101476, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232355, 7, -10000, 10000, 0, 1, 'BG250623010311', 1750681101485, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232356, 9, -80000, 80000, 0, 1, 'BG250623010310', 1750681101494, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232357, 1, -1000, 1000, 0, 1, 'BG250623010308', 1750681101515, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232358, 13, -50000, 50000, 0, 1, 'BG250623010307', 1750681101522, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232359, 8, -10000, 10000, 0, 1, 'BG250623010306', 1750681101522, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232360, 12, -70000, 70000, 0, 1, 'BG250623010305', 1750681101543, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232361, 4, 140000, 0, 140000, 0, 'BG250623010315', 1750681106118, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232362, 13, 80000, 0, 80000, 0, 'BG250623010316', 1750681108164, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232363, 8, 40000, 0, 40000, 0, 'BG250623010317', 1750681110206, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232364, 1, 12300, 0, 12300, 0, 'BG250623010318', 1750681245893, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232365, 1, -12300, 12300, 0, 1, 'BG250623010318', 1750681255687, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232366, 8, -40000, 40000, 0, 1, 'BG250623010317', 1750681255695, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232367, 13, -80000, 80000, 0, 1, 'BG250623010316', 1750681255704, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232368, 4, -140000, 140000, 0, 1, 'BG250623010315', 1750681255714, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232369, 5, 20000, 0, 20000, 0, 'BG250623010319', 1750681259077, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232370, 13, 10000, 0, 10000, 0, 'BG250623010320', 1750681260129, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232371, 9, 80000, 0, 80000, 0, 'BG250623010322', 1750681262186, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232372, 10, 30000, 0, 30000, 0, 'BG250623010323', 1750681263234, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232373, 11, 60000, 0, 60000, 0, 'BG250623010324', 1750681265261, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232374, 6, 50000, 0, 50000, 0, 'BG250623010325', 1750681267308, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232375, 12, 30000, 0, 30000, 0, 'BG250623010326', 1750681269353, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232376, 12, -30000, 30000, 0, 1, 'BG250623010326', 1750681288599, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232377, 6, -50000, 50000, 0, 1, 'BG250623010325', 1750681288606, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232378, 11, -60000, 60000, 0, 1, 'BG250623010324', 1750681288613, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232379, 10, -30000, 30000, 0, 1, 'BG250623010323', 1750681288620, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232380, 9, -80000, 80000, 0, 1, 'BG250623010322', 1750681288627, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232381, 13, -10000, 10000, 0, 1, 'BG250623010320', 1750681288646, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232382, 5, -20000, 20000, 0, 1, 'BG250623010319', 1750681288662, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232383, 11, 70000, 0, 70000, 0, 'BG250623010328', 1750681293100, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232384, 5, 50000, 0, 50000, 0, 'BG250623010329', 1750681294149, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232385, 6, 20000, 0, 20000, 0, 'BG250623010330', 1750681295190, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232386, 9, 10000, 0, 10000, 0, 'BG250623010331', 1750681296276, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232387, 12, 20000, 0, 20000, 0, 'BG250623010332', 1750681298317, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232388, 13, 70000, 0, 70000, 0, 'BG250623010333', 1750681300371, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232389, 7, 90000, 0, 90000, 0, 'BG250623010334', 1750681301421, '299086397', '下注');
INSERT INTO `lo_bet_change` VALUES (232390, 8, 60000, 0, 60000, 0, 'BG250623010335', 1750681303454, '857337651', '下注');
INSERT INTO `lo_bet_change` VALUES (232391, 10, 80000, 0, 80000, 0, 'BG250623010336', 1750681305515, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232392, 1, 13200, 0, 13200, 0, 'BG250623010337', 1750681328907, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232393, 1, 12300, 13200, 25500, 0, 'BG250623010338', 1750681442939, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232394, 1, 12300, 25500, 37800, 0, 'BG250623010339', 1750681683819, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232395, 1, 12300, 37800, 50100, 0, 'BG250623010340', 1750681805830, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232396, 1, 13100, 50100, 63200, 0, 'BG250623010341', 1750681955851, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232397, 1, 417700, 63200, 480900, 0, 'BG250623010342', 1750681996156, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232398, 1, -417700, 480900, 63200, 1, 'BG250623010342', 1750682012250, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232399, 1, -13100, 63200, 50100, 1, 'BG250623010341', 1750682012269, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232400, 1, -12300, 50100, 37800, 1, 'BG250623010340', 1750682012278, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232401, 1, -12300, 37800, 25500, 1, 'BG250623010339', 1750682012290, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232402, 1, -12300, 25500, 13200, 1, 'BG250623010338', 1750682012298, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232403, 1, -13200, 13200, 0, 1, 'BG250623010337', 1750682012312, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232404, 10, -80000, 80000, 0, 1, 'BG250623010336', 1750682012325, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232405, 8, -60000, 60000, 0, 1, 'BG250623010335', 1750682012333, '857337651', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232406, 7, -90000, 90000, 0, 1, 'BG250623010334', 1750682012340, '299086397', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232407, 13, -70000, 70000, 0, 1, 'BG250623010333', 1750682012346, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232408, 12, -20000, 20000, 0, 1, 'BG250623010332', 1750682012353, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232409, 9, -10000, 10000, 0, 1, 'BG250623010331', 1750682012360, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232410, 6, -20000, 20000, 0, 1, 'BG250623010330', 1750682012367, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232411, 5, -50000, 50000, 0, 1, 'BG250623010329', 1750682012368, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232412, 11, -70000, 70000, 0, 1, 'BG250623010328', 1750682012387, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232413, 11, 70000, 0, 70000, 0, 'BG250623010343', 1750682017093, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232414, 12, 10000, 0, 10000, 0, 'BG250623010344', 1750682019131, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232415, 5, 90000, 0, 90000, 0, 'BG250623010345', 1750682021187, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232416, 10, 70000, 0, 70000, 0, 'BG250623010347', 1750682023256, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232417, 9, 90000, 0, 90000, 0, 'BG250623010348', 1750682024319, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232418, 1, 10000, 0, 10000, 0, 'BG250623010349', 1750682141196, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232419, 1, 2715800, 10000, 2725800, 0, 'BG250623010351', 1750689303958, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232420, 1, 20000, 2725800, 2745800, 0, 'BG250624010352', 1750757157786, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232421, 1, 6000, 2745800, 2751800, 0, 'BG250624010355', 1750758950882, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232422, 1, -6000, 2751800, 2745800, 1, 'BG250624010355', 1751001843931, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232423, 1, -20000, 2745800, 2725800, 1, 'BG250624010352', 1751001845464, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232424, 1, -2715800, 2725800, 10000, 1, 'BG250623010351', 1751001845480, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232425, 1, -10000, 10000, 0, 1, 'BG250623010349', 1751001845495, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232426, 1, 10000, 0, 10000, 0, 'BG250627010356', 1751014414336, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232427, 1, 20000, 10000, 30000, 0, 'BG250627010357', 1751014480293, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232428, 1, 20000, 30000, 50000, 0, 'BG250627010358', 1751014484540, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232429, 1, 20000, 50000, 70000, 0, 'BG250627010359', 1751014486461, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232430, 1, 2751300, 70000, 2821300, 0, 'BG250627010360', 1751030480667, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232431, 1, 30000, 2821300, 2851300, 0, 'BG250627010361', 1751030590853, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232432, 1, 30000, 2851300, 2881300, 0, 'BG250627010362', 1751030593176, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232433, 1, -30000, 2881300, 2851300, 1, 'BG250627010362', 1751030911993, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232434, 1, -30000, 2851300, 2821300, 1, 'BG250627010361', 1751030912009, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232435, 1, -2751300, 2821300, 70000, 1, 'BG250627010360', 1751030912024, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232436, 1, -20000, 70000, 50000, 1, 'BG250627010359', 1751030912039, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232437, 1, -20000, 50000, 30000, 1, 'BG250627010358', 1751030912056, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232438, 1, -20000, 30000, 10000, 1, 'BG250627010357', 1751030912086, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232439, 1, -10000, 10000, 0, 1, 'BG250627010356', 1751030912102, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232440, 1, 2881300, 0, 2881300, 0, 'BG250627010363', 1751030912133, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232441, 1, -2881300, 2881300, 0, 1, 'BG250627010363', 1751030925035, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232442, 1, 130000, 0, 130000, 0, 'BG250627010364', 1751030925075, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232443, 1, 10000, 130000, 140000, 0, 'BG250628010365', 1751095023059, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232444, 1, 10000, 140000, 150000, 0, 'BG250628010366', 1751095159105, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232445, 1, -10000, 150000, 140000, 1, 'BG250628010366', 1751095168063, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232446, 1, -10000, 140000, 130000, 1, 'BG250628010365', 1751095168081, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232447, 1, -130000, 130000, 0, 1, 'BG250627010364', 1751095168095, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232448, 1, 10000, 0, 10000, 0, 'BG250629010367', 1751206619617, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232449, 1, -10000, 10000, 0, 1, 'BG250629010367', 1751206634344, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232450, 1, 15000, 0, 15000, 0, 'BG250629010368', 1751206640746, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232451, 1, -15000, 15000, 0, 1, 'BG250629010368', 1751206733294, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232452, 1, 15000, 0, 15000, 0, 'BG250629010369', 1751206733336, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232453, 1, -15000, 15000, 0, 1, 'BG250629010369', 1751206740444, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232454, 1, 10000, 0, 10000, 0, 'BG250629010370', 1751206740491, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232455, 1, -10000, 10000, 0, 1, 'BG250629010370', 1751206777998, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232456, 1, 15000, 0, 15000, 0, 'BG250629010371', 1751206778039, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232457, 1, -15000, 15000, 0, 1, 'BG250629010371', 1751206798955, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232458, 1, 10000, 0, 10000, 0, 'BG250629010372', 1751206798994, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232459, 1, -10000, 10000, 0, 1, 'BG250629010372', 1751206804618, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232460, 1, 15000, 0, 15000, 0, 'BG250629010373', 1751206804658, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232461, 1, -15000, 15000, 0, 1, 'BG250629010373', 1751207125962, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232462, 1, 10000, 0, 10000, 0, 'BG250629010374', 1751207278781, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232463, 1, -10000, 10000, 0, 1, 'BG250629010374', 1751207289253, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232464, 1, 15000, 0, 15000, 0, 'BG250629010375', 1751207289295, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232465, 1, -15000, 15000, 0, 1, 'BG250629010375', 1751207296191, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232466, 1, 10000, 0, 10000, 0, 'BG250629010376', 1751207296231, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232467, 1, -10000, 10000, 0, 1, 'BG250629010376', 1751253216910, '4567890', '撤单');
INSERT INTO `lo_bet_change` VALUES (232468, 1, 70000, 0, 70000, 0, 'BG250630010377', 1751253217004, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232469, 1, -70000, 70000, 0, 1, 'BG250630010377', 1751267592513, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232470, 9, -90000, 90000, 0, 1, 'BG250623010348', 1751267592520, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232471, 10, -70000, 70000, 0, 1, 'BG250623010347', 1751267592525, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232472, 5, -90000, 90000, 0, 1, 'BG250623010345', 1751267592534, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232473, 12, -10000, 10000, 0, 1, 'BG250623010344', 1751267592539, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232474, 11, -70000, 70000, 0, 1, 'BG250623010343', 1751267592546, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232475, 11, 60000, 0, 60000, 0, 'BG250630010379', 1751267623280, '706540721', '下注');
INSERT INTO `lo_bet_change` VALUES (232476, 45, 10000, 0, 10000, 0, 'BG250630010381', 1751267624344, '059247364', '下注');
INSERT INTO `lo_bet_change` VALUES (232477, 46, 60000, 0, 60000, 0, 'BG250630010382', 1751267626377, '604082268', '下注');
INSERT INTO `lo_bet_change` VALUES (232478, 50, 40000, 0, 40000, 0, 'BG250630010383', 1751267628421, '491203262', '下注');
INSERT INTO `lo_bet_change` VALUES (232479, 10, 40000, 0, 40000, 0, 'BG250630010384', 1751267629454, '510471664', '下注');
INSERT INTO `lo_bet_change` VALUES (232480, 42, 60000, 0, 60000, 0, 'BG250630010385', 1751267631508, '951537876', '下注');
INSERT INTO `lo_bet_change` VALUES (232481, 44, 10000, 0, 10000, 0, 'BG250630010387', 1751267633563, '295659192', '下注');
INSERT INTO `lo_bet_change` VALUES (232482, 6, 40000, 0, 40000, 0, 'BG250630010388', 1751267634615, '504531754', '下注');
INSERT INTO `lo_bet_change` VALUES (232483, 48, 90000, 0, 90000, 0, 'BG250630010389', 1751267635645, '541507174', '下注');
INSERT INTO `lo_bet_change` VALUES (232484, 12, 30000, 0, 30000, 0, 'BG250630010390', 1751267636691, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232485, 13, 20000, 0, 20000, 0, 'BG250630010391', 1751267638724, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232486, 49, 10000, 0, 10000, 0, 'BG250630010392', 1751267640754, '486967862', '下注');
INSERT INTO `lo_bet_change` VALUES (232487, 49, -10000, 10000, 0, 1, 'BG250630010392', 1751288220046, '486967862', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232488, 13, -20000, 20000, 0, 1, 'BG250630010391', 1751288220057, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232489, 12, -30000, 30000, 0, 1, 'BG250630010390', 1751288220066, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232490, 48, -90000, 90000, 0, 1, 'BG250630010389', 1751288220074, '541507174', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232491, 6, -40000, 40000, 0, 1, 'BG250630010388', 1751288220083, '504531754', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232492, 44, -10000, 10000, 0, 1, 'BG250630010387', 1751288220092, '295659192', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232493, 42, -60000, 60000, 0, 1, 'BG250630010385', 1751288220103, '951537876', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232494, 10, -40000, 40000, 0, 1, 'BG250630010384', 1751288220213, '510471664', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232495, 50, -40000, 40000, 0, 1, 'BG250630010383', 1751288220219, '491203262', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232496, 46, -60000, 60000, 0, 1, 'BG250630010382', 1751288220227, '604082268', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232497, 45, -10000, 10000, 0, 1, 'BG250630010381', 1751288220235, '059247364', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232498, 11, -60000, 60000, 0, 1, 'BG250630010379', 1751288220251, '706540721', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232499, 42, 10000, 0, 10000, 0, 'BG250630010393', 1751288487207, '951537876', '下注');
INSERT INTO `lo_bet_change` VALUES (232500, 46, 20000, 0, 20000, 0, 'BG250630010394', 1751288491256, '604082268', '下注');
INSERT INTO `lo_bet_change` VALUES (232501, 4, 20000, 0, 20000, 0, 'BG250630010395', 1751288494340, '272956840', '下注');
INSERT INTO `lo_bet_change` VALUES (232502, 13, 30000, 0, 30000, 0, 'BG250630010396', 1751288498445, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232503, 9, 10000, 0, 10000, 0, 'BG250630010397', 1751288501499, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232504, 48, 20000, 0, 20000, 0, 'BG250630010398', 1751288504549, '541507174', '下注');
INSERT INTO `lo_bet_change` VALUES (232505, 50, 20000, 0, 20000, 0, 'BG250630010399', 1751288511704, '491203262', '下注');
INSERT INTO `lo_bet_change` VALUES (232506, 44, 10000, 0, 10000, 0, 'BG250630010400', 1751288514778, '295659192', '下注');
INSERT INTO `lo_bet_change` VALUES (232507, 12, 30000, 0, 30000, 0, 'BG250630010401', 1751288519864, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232508, 51, 20000, 0, 20000, 0, 'BG250630010402', 1751288521925, '812673318', '下注');
INSERT INTO `lo_bet_change` VALUES (232509, 43, 10000, 0, 10000, 0, 'BG250630010403', 1751288524969, '121234028', '下注');
INSERT INTO `lo_bet_change` VALUES (232510, 5, 20000, 0, 20000, 0, 'BG250630010404', 1751288529039, '494830400', '下注');
INSERT INTO `lo_bet_change` VALUES (232511, 5, -20000, 20000, 0, 1, 'BG250630010404', 1751355264096, '494830400', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232512, 43, -10000, 10000, 0, 1, 'BG250630010403', 1751355264108, '121234028', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232513, 51, -20000, 20000, 0, 1, 'BG250630010402', 1751355264116, '812673318', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232514, 12, -30000, 30000, 0, 1, 'BG250630010401', 1751355264125, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232515, 44, -10000, 10000, 0, 1, 'BG250630010400', 1751355264132, '295659192', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232516, 50, -20000, 20000, 0, 1, 'BG250630010399', 1751355264153, '491203262', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232517, 48, -20000, 20000, 0, 1, 'BG250630010398', 1751355264165, '541507174', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232518, 9, -10000, 10000, 0, 1, 'BG250630010397', 1751355264173, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232519, 13, -30000, 30000, 0, 1, 'BG250630010396', 1751355264179, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232520, 4, -20000, 20000, 0, 1, 'BG250630010395', 1751355264186, '272956840', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232521, 46, -20000, 20000, 0, 1, 'BG250630010394', 1751355264192, '604082268', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232522, 42, -10000, 10000, 0, 1, 'BG250630010393', 1751355264199, '951537876', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232523, 45, 30000, 0, 30000, 0, 'BG250701010405', 1751355275112, '059247364', '下注');
INSERT INTO `lo_bet_change` VALUES (232524, 43, 30000, 0, 30000, 0, 'BG250701010406', 1751355277176, '121234028', '下注');
INSERT INTO `lo_bet_change` VALUES (232525, 51, 10000, 0, 10000, 0, 'BG250701010407', 1751355279223, '812673318', '下注');
INSERT INTO `lo_bet_change` VALUES (232526, 9, 10000, 0, 10000, 0, 'BG250701010408', 1751355281266, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232527, 9, -10000, 10000, 0, 1, 'BG250701010408', 1751355376695, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232528, 51, -10000, 10000, 0, 1, 'BG250701010407', 1751355376709, '812673318', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232529, 43, -30000, 30000, 0, 1, 'BG250701010406', 1751355376723, '121234028', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232530, 45, -30000, 30000, 0, 1, 'BG250701010405', 1751355376733, '059247364', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232531, 45, 20000, 0, 20000, 0, 'BG250701010409', 1751355472352, '059247364', '下注');
INSERT INTO `lo_bet_change` VALUES (232532, 45, -20000, 20000, 0, 1, 'BG250701010409', 1751355639219, '059247364', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232533, 13, 30000, 0, 30000, 0, 'BG250701010410', 1751355649083, '951407808', '下注');
INSERT INTO `lo_bet_change` VALUES (232534, 50, 30000, 0, 30000, 0, 'BG250701010411', 1751355654179, '491203262', '下注');
INSERT INTO `lo_bet_change` VALUES (232535, 50, -30000, 30000, 0, 1, 'BG250701010411', 1751356168531, '491203262', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232536, 13, -30000, 30000, 0, 1, 'BG250701010410', 1751356168545, '951407808', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232537, 1, 10000, 0, 10000, 0, 'BG250701010412', 1751356655615, '4567890', '下注');
INSERT INTO `lo_bet_change` VALUES (232538, 1, -10000, 10000, 0, 1, 'BG250701010412', 1751356697430, '4567890', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232539, 49, 20000, 0, 20000, 0, 'BG250701010416', 1751356717379, '486967862', '下注');
INSERT INTO `lo_bet_change` VALUES (232540, 43, 10000, 0, 10000, 0, 'BG250701010417', 1751356719439, '121234028', '下注');
INSERT INTO `lo_bet_change` VALUES (232541, 9, 10000, 0, 10000, 0, 'BG250701010418', 1751356721484, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232542, 45, 20000, 0, 20000, 0, 'BG250701010419', 1751356722526, '059247364', '下注');
INSERT INTO `lo_bet_change` VALUES (232543, 50, 30000, 0, 30000, 0, 'BG250701010421', 1751356725605, '491203262', '下注');
INSERT INTO `lo_bet_change` VALUES (232544, 12, 20000, 0, 20000, 0, 'BG250701010424', 1751356729712, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232545, 46, 30000, 0, 30000, 0, 'BG250701010425', 1751356731770, '604082268', '下注');
INSERT INTO `lo_bet_change` VALUES (232546, 46, -30000, 30000, 0, 1, 'BG250701010425', 1751356797989, '604082268', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232547, 12, -20000, 20000, 0, 1, 'BG250701010424', 1751356798003, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232548, 50, -30000, 30000, 0, 1, 'BG250701010421', 1751356798031, '491203262', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232549, 45, -20000, 20000, 0, 1, 'BG250701010419', 1751356798042, '059247364', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232550, 9, -10000, 10000, 0, 1, 'BG250701010418', 1751356798052, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232551, 43, -10000, 10000, 0, 1, 'BG250701010417', 1751356798062, '121234028', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232552, 49, -20000, 20000, 0, 1, 'BG250701010416', 1751356798072, '486967862', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232553, 9, 30000, 0, 30000, 0, 'BG250701010426', 1751356834766, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232554, 45, 20000, 0, 20000, 0, 'BG250701010429', 1751356841931, '059247364', '下注');
INSERT INTO `lo_bet_change` VALUES (232555, 51, 10000, 0, 10000, 0, 'BG250701010430', 1751356842985, '812673318', '下注');
INSERT INTO `lo_bet_change` VALUES (232556, 42, 30000, 0, 30000, 0, 'BG250701010431', 1751356845037, '951537876', '下注');
INSERT INTO `lo_bet_change` VALUES (232557, 49, 40000, 0, 40000, 0, 'BG250701010432', 1751356846089, '486967862', '下注');
INSERT INTO `lo_bet_change` VALUES (232558, 12, 20000, 0, 20000, 0, 'BG250701010437', 1751356861389, '957259292', '下注');
INSERT INTO `lo_bet_change` VALUES (232559, 12, -20000, 20000, 0, 1, 'BG250701010437', 1751356947159, '957259292', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232560, 49, -40000, 40000, 0, 1, 'BG250701010432', 1751356947159, '486967862', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232561, 42, -30000, 30000, 0, 1, 'BG250701010431', 1751356947179, '951537876', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232562, 51, -10000, 10000, 0, 1, 'BG250701010430', 1751356947186, '812673318', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232563, 45, -20000, 20000, 0, 1, 'BG250701010429', 1751356947193, '059247364', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232564, 9, -30000, 30000, 0, 1, 'BG250701010426', 1751356947200, '432564537', '订单结算');
INSERT INTO `lo_bet_change` VALUES (232565, 42, 40000, 0, 40000, 0, 'BG250701010438', 1751357491309, '951537876', '下注');
INSERT INTO `lo_bet_change` VALUES (232566, 9, 20000, 0, 20000, 0, 'BG250701010440', 1751357494438, '432564537', '下注');
INSERT INTO `lo_bet_change` VALUES (232567, 51, 10000, 0, 10000, 0, 'BG250701010443', 1751357499554, '812673318', '下注');
INSERT INTO `lo_bet_change` VALUES (232568, 45, 30000, 0, 30000, 0, 'BG250701010445', 1751357506672, '059247364', '下注');
INSERT INTO `lo_bet_change` VALUES (232569, 49, 30000, 0, 30000, 0, 'BG250701010448', 1751357514899, '486967862', '下注');

-- ----------------------------
-- Table structure for lo_bot_auto
-- ----------------------------
DROP TABLE IF EXISTS `lo_bot_auto`;
CREATE TABLE `lo_bot_auto`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `quantity` int NULL DEFAULT 1,
  `type` tinyint NULL DEFAULT 0,
  `status` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_bot_auto
-- ----------------------------
INSERT INTO `lo_bot_auto` VALUES (1, 6, 0, 1);
INSERT INTO `lo_bot_auto` VALUES (2, 10, 1, 1);

-- ----------------------------
-- Table structure for lo_bot_bet
-- ----------------------------
DROP TABLE IF EXISTS `lo_bot_bet`;
CREATE TABLE `lo_bot_bet`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `begin` bigint NULL DEFAULT NULL,
  `end` bigint NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  `lottery_id` bigint NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT 1,
  `bet_config` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL,
  `status` tinyint NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_bot_bet
-- ----------------------------
INSERT INTO `lo_bot_bet` VALUES (1, 0, 23, NULL, NULL, 3, 10, '[{\"txt\":\"四星直选复式\",\"value\":1,\"show\":0},{\"txt\":\"四星直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"中三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"后三直选复式\",\"value\":20,\"show\":1},{\"txt\":\"前三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"中三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"后三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选和值\",\"value\":10,\"show\":0},{\"txt\":\"中三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三直选和值\",\"value\":10,\"show\":0},{\"txt\":\"前三组三复式\",\"value\":20,\"show\":1},{\"txt\":\"中三组三复式\",\"value\":20,\"show\":1},{\"txt\":\"后三组三复式\",\"value\":20,\"show\":1},{\"txt\":\"前三组三胆拖\",\"value\":10,\"show\":1},{\"txt\":\"中三组三胆拖\",\"value\":50,\"show\":1},{\"txt\":\"后三组三胆拖\",\"value\":50,\"show\":1},{\"txt\":\"前三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组六复式\",\"value\":20,\"show\":1},{\"txt\":\"中三组六复式\",\"value\":20,\"show\":1},{\"txt\":\"后三组六复式\",\"value\":10,\"show\":1},{\"txt\":\"前三组六胆拖\",\"value\":20,\"show\":1},{\"txt\":\"中三组六胆拖\",\"value\":1,\"show\":1},{\"txt\":\"后三组六胆拖\",\"value\":1,\"show\":1},{\"txt\":\"前三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三组选和值\",\"value\":10,\"show\":0},{\"txt\":\"后三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三直选组合\",\"value\":20,\"show\":1},{\"txt\":\"中三直选组合\",\"value\":20,\"show\":1},{\"txt\":\"后三直选组合\",\"value\":20,\"show\":1}]', 0);
INSERT INTO `lo_bot_bet` VALUES (2, 0, 23, NULL, NULL, 6, 5, '[{\"txt\":\"四星直选复式\",\"value\":1,\"show\":0},{\"txt\":\"四星直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选复式\",\"value\":100,\"show\":1},{\"txt\":\"中三直选复式\",\"value\":100,\"show\":1},{\"txt\":\"后三直选复式\",\"value\":100,\"show\":1},{\"txt\":\"前三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"中三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"后三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三组三复式\",\"value\":100,\"show\":1},{\"txt\":\"中三组三复式\",\"value\":100,\"show\":1},{\"txt\":\"后三组三复式\",\"value\":100,\"show\":1},{\"txt\":\"前三组三胆拖\",\"value\":100,\"show\":1},{\"txt\":\"中三组三胆拖\",\"value\":100,\"show\":1},{\"txt\":\"后三组三胆拖\",\"value\":1,\"show\":1},{\"txt\":\"前三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组六复式\",\"value\":100,\"show\":1},{\"txt\":\"中三组六复式\",\"value\":100,\"show\":1},{\"txt\":\"后三组六复式\",\"value\":100,\"show\":1},{\"txt\":\"前三组六胆拖\",\"value\":100,\"show\":1},{\"txt\":\"中三组六胆拖\",\"value\":100,\"show\":1},{\"txt\":\"后三组六胆拖\",\"value\":100,\"show\":1},{\"txt\":\"前三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三直选组合\",\"value\":100,\"show\":1},{\"txt\":\"中三直选组合\",\"value\":100,\"show\":1},{\"txt\":\"后三直选组合\",\"value\":100,\"show\":1}]', 0);
INSERT INTO `lo_bot_bet` VALUES (4, 0, 23, NULL, NULL, 8, 5, '[{\"txt\":\"四星直选复式\",\"value\":1,\"show\":0},{\"txt\":\"四星直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"中三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"后三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"前三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"中三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"后三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三组三复式\",\"value\":20,\"show\":1},{\"txt\":\"中三组三复式\",\"value\":20,\"show\":1},{\"txt\":\"后三组三复式\",\"value\":20,\"show\":1},{\"txt\":\"前三组三胆拖\",\"value\":10,\"show\":1},{\"txt\":\"中三组三胆拖\",\"value\":10,\"show\":1},{\"txt\":\"后三组三胆拖\",\"value\":10,\"show\":1},{\"txt\":\"前三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"中三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"后三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"前三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"中三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"后三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"前三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三直选组合\",\"value\":15,\"show\":1},{\"txt\":\"中三直选组合\",\"value\":15,\"show\":1},{\"txt\":\"后三直选组合\",\"value\":15,\"show\":1}]', 0);
INSERT INTO `lo_bot_bet` VALUES (5, 0, 23, NULL, NULL, 4, 5, '[{\"txt\":\"四星直选复式\",\"value\":1,\"show\":0},{\"txt\":\"四星直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"中三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"后三直选复式\",\"value\":10,\"show\":1},{\"txt\":\"前三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"中三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"后三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三组三复式\",\"value\":15,\"show\":1},{\"txt\":\"中三组三复式\",\"value\":15,\"show\":1},{\"txt\":\"后三组三复式\",\"value\":15,\"show\":1},{\"txt\":\"前三组三胆拖\",\"value\":15,\"show\":1},{\"txt\":\"中三组三胆拖\",\"value\":15,\"show\":1},{\"txt\":\"后三组三胆拖\",\"value\":15,\"show\":1},{\"txt\":\"前三组三单式\",\"value\":15,\"show\":0},{\"txt\":\"中三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"中三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"后三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"前三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"中三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"后三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"前三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三直选组合\",\"value\":15,\"show\":1},{\"txt\":\"中三直选组合\",\"value\":15,\"show\":1},{\"txt\":\"后三直选组合\",\"value\":15,\"show\":1}]', 0);
INSERT INTO `lo_bot_bet` VALUES (6, 0, 23, NULL, NULL, 4, 6, '[{\"txt\":\"四星直选复式\",\"value\":1,\"show\":0},{\"txt\":\"四星直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选复式\",\"value\":15,\"show\":1},{\"txt\":\"中三直选复式\",\"value\":15,\"show\":1},{\"txt\":\"后三直选复式\",\"value\":15,\"show\":1},{\"txt\":\"前三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"中三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"后三直选单式\",\"value\":1,\"show\":0},{\"txt\":\"前三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三直选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三组三复式\",\"value\":15,\"show\":1},{\"txt\":\"中三组三复式\",\"value\":15,\"show\":1},{\"txt\":\"后三组三复式\",\"value\":15,\"show\":1},{\"txt\":\"前三组三胆拖\",\"value\":15,\"show\":1},{\"txt\":\"中三组三胆拖\",\"value\":15,\"show\":1},{\"txt\":\"后三组三胆拖\",\"value\":15,\"show\":1},{\"txt\":\"前三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组三单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"中三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"后三组六复式\",\"value\":15,\"show\":1},{\"txt\":\"前三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"中三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"后三组六胆拖\",\"value\":15,\"show\":1},{\"txt\":\"前三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"中三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"后三组六单式\",\"value\":1,\"show\":0},{\"txt\":\"前三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"中三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"后三组选和值\",\"value\":1,\"show\":0},{\"txt\":\"前三直选组合\",\"value\":15,\"show\":1},{\"txt\":\"中三直选组合\",\"value\":15,\"show\":1},{\"txt\":\"后三直选组合\",\"value\":15,\"show\":1}]', 0);
INSERT INTO `lo_bot_bet` VALUES (7, 0, 23, NULL, NULL, 11, 2, '[{\"txt\":\"选五中五\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"选六中五\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"选五中五\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"选六中五\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"选五中五\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"选六中五\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"前三直选复式\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"前三直选单式\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"前三组选复式\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0},{\"txt\":\"前三组选单式\",\"desc\":\"\",\"value\":1,\"show\":1,\"bet\":2,\"limit\":0}]', 1);

-- ----------------------------
-- Table structure for lo_day_statis__
-- ----------------------------
DROP TABLE IF EXISTS `lo_day_statis__`;
CREATE TABLE `lo_day_statis__`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` bigint NULL DEFAULT 0,
  `player_id` bigint NULL DEFAULT NULL,
  `player_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `day_use` bigint NULL DEFAULT 0,
  `day_bingo` bigint NULL DEFAULT 0,
  `day_get` bigint NULL DEFAULT 0,
  `created_at` bigint NULL DEFAULT 0,
  `regist` bigint NULL DEFAULT 0,
  `step` int NULL DEFAULT 0,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `player_id`(`player_id` ASC, `created_at` DESC) USING BTREE,
  INDEX `super_tree`(`super_tree` ASC, `step` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 445 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lo_day_statis__
-- ----------------------------
INSERT INTO `lo_day_statis__` VALUES (1, 1, 1, '45678', 10000, 0, 0, 1748793600000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (2, 2, 1, '45678', 20000, 0, 0, 1748880000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (4, 7, 7, '299086397', 300000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (5, 5, 9, '432564537', 370000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (6, 6, 6, '504531754', 390000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (7, 5, 5, '494830400', 270000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (8, 4, 11, '706540721', 240000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (9, 7, 8, '857337651', 330000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (11, 6, 4, '272956840', 240000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (13, 6, 12, '957259292', 340000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (14, 5, 13, '951407808', 200000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (20, 6, 10, '510471664', 250000, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (29, 2, 1, '45678', 459300, 0, 0, 1749139200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (63, 1, 5, '494830400', 90000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (64, 1, 4, '272956840', 80000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (65, 1, 3, '1234567', 1000000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (66, 1, 9, '432564537', 60000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (67, 1, 11, '706540721', 60000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (68, 1, 8, '857337651', 70000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (69, 1, 6, '504531754', 20000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (70, 1, 13, '951407808', 80000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (71, 1, 10, '510471664', 40000, 0, 0, 1749398400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (72, 10, 11, '706540721', 370000, 770000, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (73, 14, 5, '494830400', 620000, 840000, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (74, 11, 12, '957259292', 580000, 0, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (75, 13, 10, '510471664', 570000, 700000, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (76, 13, 9, '432564537', 530000, 1260000, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (77, 11, 13, '951407808', 610000, 560000, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (78, 12, 7, '299086397', 450000, 490000, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (81, 11, 8, '857337651', 450000, 910000, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (84, 9, 4, '272956840', 690000, 0, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (85, 4, 1, '45678', 40000, 0, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (108, 8, 6, '504531754', 390000, 0, 0, 1749571200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (189, 3, 4, '272956840', 160000, 560000, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (190, 3, 9, '432564537', 100000, 350000, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (191, 3, 5, '494830400', 160000, 490000, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (192, 1, 6, '504531754', 100000, 0, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (193, 2, 10, '510471664', 89999, 0, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (194, 3, 12, '957259292', 30000, 140000, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (195, 1, 11, '706540721', 140000, 0, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (196, 2, 8, '857337651', 150000, 0, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (197, 2, 13, '951407808', 140000, 0, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (198, 2, 7, '299086397', 130000, 0, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (199, 3, 1, '45678', 479032000, 419132000, 0, 1749830400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (214, 7, 4, '272956840', 420000, 490000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (215, 6, 12, '957259292', 350000, 420000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (216, 5, 10, '510471664', 150000, 210000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (217, 8, 5, '494830400', 310000, 980000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (218, 4, 11, '706540721', 370000, 0, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (219, 7, 13, '951407808', 320000, 350000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (220, 8, 9, '432564537', 450000, 1750000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (221, 7, 6, '504531754', 210000, 0, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (222, 12, 1, '45678', 298000, 265000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (232, 4, 8, '857337651', 250000, 0, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (245, 6, 7, '299086397', 370000, 490000, 0, 1749916800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (288, 1, 9, '432564537', 30000, 0, 0, 1750003200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (289, 1, 10, '510471664', 60000, 0, 0, 1750003200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (290, 1, 11, '706540721', 50000, 0, 0, 1750003200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (291, 1, 8, '857337651', 10000, 0, 0, 1750003200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (292, 1, 12, '957259292', 10000, 0, 0, 1750003200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (293, 1, 5, '494830400', 80000, 0, 0, 1750003200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (294, 1, 1, '45678', 10000, 0, 0, 1750003200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (295, 5, 12, '957259292', 140000, 560000, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (296, 3, 5, '494830400', 210000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (297, 2, 7, '299086397', 160000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (298, 3, 9, '432564537', 130000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (300, 1, 10, '510471664', 30000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (302, 1, 13, '951407808', 60000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (303, 2, 8, '857337651', 40000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (308, 1, 4, '272956840', 90000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (309, 2, 6, '504531754', 140000, 0, 0, 1750348800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (315, 4, 12, '957259292', 130000, 0, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (316, 3, 8, '857337651', 110000, 0, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (317, 5, 13, '951407808', 210000, 70000, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (318, 16, 1, '4567890', 3232800, 2731300, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (319, 4, 9, '432564537', 260000, 0, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (320, 2, 7, '299086397', 100000, 0, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (321, 3, 4, '272956840', 150000, 70000, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (330, 4, 5, '494830400', 160000, 140000, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (333, 3, 10, '510471664', 180000, 0, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (334, 4, 11, '706540721', 200000, 490000, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (335, 2, 6, '504531754', 70000, 0, 0, 1750608000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (365, 2, 1, '4567890', 26000, 0, 0, 1750694400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (367, 9, 1, '4567890', 5892600, 0, 0, 1750953600000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (376, 2, 1, '4567890', 20000, 0, 0, 1751040000000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (378, 10, 1, '4567890', 125000, 0, 0, 1751126400000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (388, 2, 1, '4567890', 70000, 20000, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (390, 2, 11, '706540721', 60000, 420000, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (391, 1, 45, '059247364', 10000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (392, 2, 46, '604082268', 80000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (393, 2, 50, '491203262', 60000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (394, 2, 10, '510471664', 40000, 280000, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (395, 2, 42, '951537876', 70000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (396, 2, 44, '295659192', 20000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (397, 1, 6, '504531754', 40000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (398, 2, 48, '541507174', 110000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (399, 2, 12, '957259292', 60000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (400, 2, 13, '951407808', 50000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (401, 1, 49, '486967862', 10000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (406, 1, 4, '272956840', 20000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (408, 1, 9, '432564537', 10000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (413, 1, 51, '812673318', 20000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (414, 1, 43, '121234028', 10000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (415, 1, 5, '494830400', 20000, 0, 0, 1751212800000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (416, 4, 50, '491203262', 60000, 350000, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (417, 5, 45, '059247364', 120000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (418, 2, 43, '121234028', 40000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (419, 3, 51, '812673318', 30000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (420, 4, 9, '432564537', 70000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (422, 1, 13, '951407808', 30000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (424, 2, 1, '4567890', 10000, 20000, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (426, 3, 49, '486967862', 90000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (431, 2, 12, '957259292', 40000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (432, 1, 46, '604082268', 30000, 0, 0, 1751299200000, 0, NULL, NULL);
INSERT INTO `lo_day_statis__` VALUES (437, 2, 42, '951537876', 70000, 0, 0, 1751299200000, 0, NULL, NULL);

-- ----------------------------
-- Table structure for lo_day_statis_total
-- ----------------------------
DROP TABLE IF EXISTS `lo_day_statis_total`;
CREATE TABLE `lo_day_statis_total`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` bigint NULL DEFAULT 1,
  `created_at` bigint NULL DEFAULT 0,
  `recharge` bigint NULL DEFAULT 0,
  `withdrawal` bigint NULL DEFAULT 0,
  `bet` bigint NULL DEFAULT 0,
  `win` bigint NULL DEFAULT 0,
  `expects` int NULL DEFAULT 0,
  `users` int NULL DEFAULT 0,
  `new_users` int NULL DEFAULT 0,
  `recharge_player` int NULL DEFAULT 0,
  `recharge_count` int NULL DEFAULT 0,
  `withdrawal_player` int NULL DEFAULT 0,
  `withdrawal_count` int NULL DEFAULT 0,
  `bet_player` int NULL DEFAULT 0,
  `bet_count` int NULL DEFAULT 0,
  `manual_top_up` bigint NULL DEFAULT 0,
  `manual_deduction` bigint NULL DEFAULT 0,
  `balance` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `create_unique`(`created_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_day_statis_total
-- ----------------------------

-- ----------------------------
-- Table structure for lo_draw_config
-- ----------------------------
DROP TABLE IF EXISTS `lo_draw_config`;
CREATE TABLE `lo_draw_config`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `open` tinyint NULL DEFAULT 1,
  `showh5` tinyint NULL DEFAULT 1,
  `odds_config` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `recharge` int NULL DEFAULT 5000,
  `recharge_rate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `consume` int NULL DEFAULT 1000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_draw_config
-- ----------------------------
INSERT INTO `lo_draw_config` VALUES (1, 1, 0, '[{\"name\":\"一等奖\",\"item\":\"15元\",\"value\":15},{\"name\":\"二等奖\",\"item\":\"10元\",\"value\":10},{\"name\":\"三等奖\",\"item\":\"8元\",\"value\":8},{\"name\":\"谢谢惠顾\",\"item\":\"谢谢惠顾\",\"value\":\"0\"}]', 1000, '30', 5000);

-- ----------------------------
-- Table structure for lo_draw_logger
-- ----------------------------
DROP TABLE IF EXISTS `lo_draw_logger`;
CREATE TABLE `lo_draw_logger`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT NULL,
  `player_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `draw_money` bigint NULL DEFAULT NULL,
  `draw_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT NULL,
  `draw_item` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_draw_logger
-- ----------------------------

-- ----------------------------
-- Table structure for lo_html_version
-- ----------------------------
DROP TABLE IF EXISTS `lo_html_version`;
CREATE TABLE `lo_html_version`  (
  `version` bigint NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_html_version
-- ----------------------------
INSERT INTO `lo_html_version` VALUES (45);

-- ----------------------------
-- Table structure for lo_lottery
-- ----------------------------
DROP TABLE IF EXISTS `lo_lottery`;
CREATE TABLE `lo_lottery`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` bigint NULL DEFAULT 0,
  `updated_at` bigint NULL DEFAULT 0,
  `name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 1,
  `close_time` bigint NULL DEFAULT 300,
  `auto_open` tinyint NULL DEFAULT 1,
  `auto_close` tinyint NULL DEFAULT 0,
  `open_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `close_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `expect` bigint NULL DEFAULT NULL,
  `mul1` float NULL DEFAULT NULL,
  `mul2` float NULL DEFAULT NULL,
  `open_times` int NULL DEFAULT 90,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_lottery
-- ----------------------------
INSERT INTO `lo_lottery` VALUES (1, 0, 1747401913279, '八卦', 1, 1751357570011, 1, 0, '========开盘了========', '========封盘========', 20250623017, 2, 7, 90);

-- ----------------------------
-- Table structure for lo_lottery_report
-- ----------------------------
DROP TABLE IF EXISTS `lo_lottery_report`;
CREATE TABLE `lo_lottery_report`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ymd` bigint NULL DEFAULT 0,
  `lottery_id` bigint NULL DEFAULT NULL,
  `bet_count` int NULL DEFAULT 0,
  `money` bigint NULL DEFAULT 0,
  `win` bigint NULL DEFAULT 0,
  `winners` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ymd_lottery`(`ymd` ASC, `lottery_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_lottery_report
-- ----------------------------

-- ----------------------------
-- Table structure for lo_open_log
-- ----------------------------
DROP TABLE IF EXISTS `lo_open_log`;
CREATE TABLE `lo_open_log`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `open_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `cycle_num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `open_time` bigint NULL DEFAULT NULL,
  `lottery_id` bigint NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT 1,
  `ball_miss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `big_little` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `odd_even` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ball_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `span_three` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ball_two1` int NULL DEFAULT NULL,
  `ball_two2` int NULL DEFAULT NULL,
  `span_two` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `three_miss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `tow_miss` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bsg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `open_pre` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0,
  `risk` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lottery_unique`(`cycle_num` ASC, `lottery_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_open_log
-- ----------------------------
INSERT INTO `lo_open_log` VALUES (1, NULL, '20250623018', 0, 1, 1751798883827, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0);

-- ----------------------------
-- Table structure for lo_order
-- ----------------------------
DROP TABLE IF EXISTS `lo_order`;
CREATE TABLE `lo_order`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` bigint NULL DEFAULT 1,
  `created_at` bigint NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  `player_id` bigint NULL DEFAULT NULL,
  `player_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `top_username` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `lottery_id` bigint NULL DEFAULT NULL,
  `account_type` tinyint NULL DEFAULT NULL,
  `expect` bigint NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0,
  `money` bigint NULL DEFAULT NULL,
  `bet_code` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `bet_count` int NULL DEFAULT 1,
  `multiple` double NULL DEFAULT 1,
  `money_income` bigint NULL DEFAULT 0,
  `settle_time` bigint NULL DEFAULT NULL,
  `step` int NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `parent_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `open_status` tinyint NULL DEFAULT 0,
  `order_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `finish_time` bigint NULL DEFAULT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bet_code2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_u`(`order_id` ASC) USING BTREE,
  INDEX `player_index`(`player_id` ASC) USING BTREE,
  INDEX `expect_index`(`expect` ASC) USING BTREE,
  INDEX `subplayer`(`step` ASC, `super_tree` ASC) USING BTREE,
  INDEX `status_id`(`status` ASC, `id` DESC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 396 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_order
-- ----------------------------

-- ----------------------------
-- Table structure for lo_order_id
-- ----------------------------
DROP TABLE IF EXISTS `lo_order_id`;
CREATE TABLE `lo_order_id`  (
  `id` bigint UNSIGNED NOT NULL,
  `version` bigint UNSIGNED NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_order_id
-- ----------------------------
INSERT INTO `lo_order_id` VALUES (1, 10448);

-- ----------------------------
-- Table structure for lo_player_lottery
-- ----------------------------
DROP TABLE IF EXISTS `lo_player_lottery`;
CREATE TABLE `lo_player_lottery`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT NULL,
  `player_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ymd` bigint NULL DEFAULT 0,
  `lottery_id` bigint NULL DEFAULT NULL,
  `money` bigint NULL DEFAULT 0,
  `win` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `player`(`player_id` ASC, `ymd` ASC, `lottery_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_player_lottery
-- ----------------------------

-- ----------------------------
-- Table structure for lo_player_report
-- ----------------------------
DROP TABLE IF EXISTS `lo_player_report`;
CREATE TABLE `lo_player_report`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT NULL,
  `player_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `ymd` bigint NULL DEFAULT 0,
  `money` bigint NULL DEFAULT 0,
  `win` bigint NULL DEFAULT 0,
  `recharge` bigint NULL DEFAULT 0,
  `withdrawal` bigint NULL DEFAULT 0,
  `step` int NULL DEFAULT NULL,
  `super_tree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `manual_top_up` bigint NULL DEFAULT 0,
  `manual_deduction` bigint NULL DEFAULT 0,
  `bet_count` int NULL DEFAULT 0,
  `recharge_count` int NULL DEFAULT 0,
  `withdrawal_count` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `player`(`player_id` ASC, `ymd` ASC) USING BTREE,
  INDEX `super_step`(`super_tree` ASC, `step` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_player_report
-- ----------------------------

-- ----------------------------
-- Table structure for lo_red_packet
-- ----------------------------
DROP TABLE IF EXISTS `lo_red_packet`;
CREATE TABLE `lo_red_packet`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `version` bigint NULL DEFAULT 1,
  `created_at` bigint NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  `player_id` bigint NULL DEFAULT NULL,
  `describes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `quantity` int NULL DEFAULT NULL,
  `money` bigint NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0,
  `empty_at` bigint NULL DEFAULT 0,
  `type` tinyint NULL DEFAULT 0,
  `red_id` char(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `quantity_receive` int NULL DEFAULT 0,
  `money_receive` bigint NULL DEFAULT 0,
  `status_refund` tinyint NULL DEFAULT 0,
  `account_type` tinyint NULL DEFAULT NULL,
  `rq` int NULL DEFAULT 0,
  `rm` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_red`(`player_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_red_packet
-- ----------------------------

-- ----------------------------
-- Table structure for lo_red_packet_logger
-- ----------------------------
DROP TABLE IF EXISTS `lo_red_packet_logger`;
CREATE TABLE `lo_red_packet_logger`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `red_id` bigint NULL DEFAULT NULL,
  `player_id` bigint NULL DEFAULT NULL,
  `money` bigint NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `open` tinyint NULL DEFAULT NULL,
  `created_at` bigint NULL DEFAULT NULL,
  `updated_at` bigint NULL DEFAULT NULL,
  `from_user` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `describes` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `account_type` tinyint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_red`(`red_id` ASC, `player_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_red_packet_logger
-- ----------------------------

-- ----------------------------
-- Table structure for lo_risk_bets
-- ----------------------------
DROP TABLE IF EXISTS `lo_risk_bets`;
CREATE TABLE `lo_risk_bets`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ymd` bigint NULL DEFAULT NULL,
  `bets` bigint NULL DEFAULT 0,
  `win` bigint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ymd`(`ymd` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_risk_bets
-- ----------------------------

-- ----------------------------
-- Table structure for lo_risk_sys
-- ----------------------------
DROP TABLE IF EXISTS `lo_risk_sys`;
CREATE TABLE `lo_risk_sys`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `ymd` bigint NULL DEFAULT NULL,
  `lottery_id` bigint NULL DEFAULT 0,
  `expect` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0',
  `open_num` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bets` bigint NULL DEFAULT NULL,
  `win` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ymd`(`lottery_id` ASC, `expect` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_risk_sys
-- ----------------------------

-- ----------------------------
-- Table structure for lo_sms_config
-- ----------------------------
DROP TABLE IF EXISTS `lo_sms_config`;
CREATE TABLE `lo_sms_config`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `sms_server` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sms_app_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sms_secret_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sms_unhold` tinyint NULL DEFAULT 0,
  `sms_unhold_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `max_sms` int NULL DEFAULT NULL,
  `sms_interval` int NULL DEFAULT 60,
  `use_once` tinyint NULL DEFAULT 0,
  `sms_message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sms_api` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `sms_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_sms_config
-- ----------------------------
INSERT INTO `lo_sms_config` VALUES (1, 'http://www.huiyuandx.com/api/sms_send', 'cuihua888', '60290bc8a0ee031668bbcd83f2d4833d', 0, '维护', 100, 1, 1, '您的验证码：{0}，如非本人操作，请忽略本短信!', '2', 'notify');

-- ----------------------------
-- Table structure for lo_task_change
-- ----------------------------
DROP TABLE IF EXISTS `lo_task_change`;
CREATE TABLE `lo_task_change`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NOT NULL DEFAULT 0 COMMENT '玩家id',
  `change_money` bigint NULL DEFAULT 0 COMMENT '变化金额',
  `init_money` bigint NULL DEFAULT 0 COMMENT '初始金额',
  `dned_money` bigint NULL DEFAULT NULL COMMENT '变化后的金额',
  `change_type` tinyint NOT NULL DEFAULT 0 COMMENT '1.充值 2.充值优惠 3.投注 4.人工',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单号',
  `created_at` bigint NULL DEFAULT 0 COMMENT '创建时间',
  `player_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `player_id`(`player_id` ASC) USING BTREE,
  INDEX `player_id_order_type`(`player_id` ASC, `change_type` ASC, `order_no` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_task_change
-- ----------------------------

-- ----------------------------
-- Table structure for lo_todo
-- ----------------------------
DROP TABLE IF EXISTS `lo_todo`;
CREATE TABLE `lo_todo`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `qq` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `type` tinyint NULL DEFAULT NULL,
  `num` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `text` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `created_at` bigint NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lo_todo
-- ----------------------------

-- ----------------------------
-- Table structure for lo_ws
-- ----------------------------
DROP TABLE IF EXISTS `lo_ws`;
CREATE TABLE `lo_ws`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `admin_id` bigint NULL DEFAULT NULL,
  `player_id` bigint NULL DEFAULT NULL,
  `user` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `time` bigint NULL DEFAULT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `msg_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint NULL DEFAULT 0,
  `at_status` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `user2` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type2` tinyint NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type_p`(`type2` ASC, `player_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1703 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_ws
-- ----------------------------

-- ----------------------------
-- Table structure for lo_ws_statis
-- ----------------------------
DROP TABLE IF EXISTS `lo_ws_statis`;
CREATE TABLE `lo_ws_statis`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `player_id` bigint NULL DEFAULT NULL,
  `ymd` bigint NULL DEFAULT NULL,
  `player_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `counts` int NULL DEFAULT 0,
  `content_len` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `p_ymd`(`player_id` ASC, `ymd` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of lo_ws_statis
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
