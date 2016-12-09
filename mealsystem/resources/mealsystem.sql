/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : mealsystem

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2016-12-08 18:27:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `a_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '账户名',
  `a_password` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '账户密码',
  `u_type` char(15) COLLATE utf8_bin NOT NULL COMMENT '用户类型',
  `a_authority` int(2) NOT NULL COMMENT '权限：1、普通员工；2、后厨、3、管理员',
  PRIMARY KEY (`a_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('apple', 'apple', 'waiter', '1');
INSERT INTO `account` VALUES ('banana', 'banana', 'kitchen', '2');
INSERT INTO `account` VALUES ('orange', 'orange', 'administrator', '1');

-- ----------------------------
-- Table structure for kitchen
-- ----------------------------
DROP TABLE IF EXISTS `kitchen`;
CREATE TABLE `kitchen` (
  `o_id` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '后厨id（与订单id公用）',
  `o_time` datetime DEFAULT NULL COMMENT '下单时间',
  `t_number` char(15) COLLATE utf8_bin NOT NULL COMMENT '桌号',
  `o_meal` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '存下单菜品id',
  `k_state` int(2) DEFAULT NULL COMMENT '菜品的状态 是否上菜'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of kitchen
-- ----------------------------

-- ----------------------------
-- Table structure for meal
-- ----------------------------
DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜品id',
  `m_name` char(15) COLLATE utf8_bin NOT NULL COMMENT '菜名',
  `m_piece` double NOT NULL COMMENT '单价',
  `m_describe` text COLLATE utf8_bin COMMENT '菜品简介',
  `m_sale` int(11) DEFAULT NULL COMMENT '销售量',
  `m_data` text COLLATE utf8_bin COMMENT '菜品描述',
  `m_classify` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `m_add_time` datetime DEFAULT NULL,
  `m_add_user` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `m_image` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '图片路径',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of meal
-- ----------------------------
INSERT INTO `meal` VALUES ('1', '铁板牛肉', '30', 0xE9A699, '100', 0xE7899BE88289E38081E6B48BE891B1, 'a', null, 'lin', '62208652-e4d9-4c4f-9c63-4affa47685fa.png');
INSERT INTO `meal` VALUES ('2', '蓝瘦香菇', '22', 0xE5BE88E8939DEFBC8CE683B3E88F87, '55', 0xE4BDA0E78C9C, 'b', null, null, '62208652-e4d9-4c4f-9c63-4affa47685fa.png');
INSERT INTO `meal` VALUES ('3', '1', '1', 0x31, '1', 0x31, 'c', null, null, '62208652-e4d9-4c4f-9c63-4affa47685fa.png');
INSERT INTO `meal` VALUES ('4', '4', '4', 0x34, '4', 0x34, 'd', null, null, '62208652-e4d9-4c4f-9c63-4affa47685fa.png');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `n_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `n_title` varchar(255) COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `n_content` text COLLATE utf8_bin COMMENT '公告内容',
  `n_user` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '发布者',
  `n_time` datetime DEFAULT NULL COMMENT '发布时间',
  PRIMARY KEY (`n_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '重大喜讯', 0xE88081E69DBFE5A8B6E5B08FE4B889, '老板娘', '2016-12-03 13:39:24');
INSERT INTO `notice` VALUES ('2', '新闻', 0xE88081E69DBFE7A6BBE5A99A, '小三', null);
INSERT INTO `notice` VALUES ('4', '号外号外', 0xE4BDA0E698AF, '小五', '2016-12-03 00:00:00');
INSERT INTO `notice` VALUES ('5', '头条', 0xE88081E69DBFE59B9BE5A99A, '小六', '2016-12-06 00:00:00');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `o_time` datetime DEFAULT NULL COMMENT '下单时间',
  `t_number` char(10) COLLATE utf8_bin NOT NULL COMMENT '桌号',
  `o_meal` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '存下单菜品id',
  `o_piece` double DEFAULT NULL COMMENT '总价',
  `o_ispay` int(2) NOT NULL DEFAULT '1' COMMENT '1、未买单，2、已买单',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '2016-12-08 15:51:24', '10', '1,2,3,4', '57', '1');
INSERT INTO `order` VALUES ('2', '2016-12-08 15:51:42', '11', '1,2', '172', '1');
INSERT INTO `order` VALUES ('3', '2016-12-08 15:52:02', '12', '3,2', '47', '1');

-- ----------------------------
-- Table structure for performance
-- ----------------------------
DROP TABLE IF EXISTS `performance`;
CREATE TABLE `performance` (
  `p_id` varchar(255) NOT NULL COMMENT '业绩id',
  `p_mode` char(15) DEFAULT NULL COMMENT '业绩模式（月/年）',
  `p_generates` double DEFAULT NULL COMMENT '业绩营销额',
  `p_time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of performance
-- ----------------------------

-- ----------------------------
-- Table structure for table
-- ----------------------------
DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_number` char(15) COLLATE utf8_bin NOT NULL,
  `t_isNull` int(2) NOT NULL COMMENT '是否有人1、没有；2、有',
  `t_isReq` int(2) NOT NULL COMMENT '餐桌请求：1、无请求；2、有请求；3、上菜',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of table
-- ----------------------------
INSERT INTO `table` VALUES ('1', '1', '1', '1');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `u_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `a_name` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '账户名',
  `u_name` char(15) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `u_sex` char(2) COLLATE utf8_bin DEFAULT NULL,
  `u_phone` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `u_type` char(15) COLLATE utf8_bin NOT NULL,
  `u_remark` text COLLATE utf8_bin COMMENT '备注',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES ('1', '曼城', '阿圭罗', 'n', '555', '员工', 0xE4BDA0E5A5BD);
INSERT INTO `user_message` VALUES ('2', '拜仁', '莱万', '男', '1223', '厨师', null);
INSERT INTO `user_message` VALUES ('3', '5882', '梅球王', null, '12580', '老板', 0xE4B896E7958CE7ACACE4B880);
INSERT INTO `user_message` VALUES ('4', '皇马', '小小罗', null, '555', '老板', 0xE4B896E7958C);
