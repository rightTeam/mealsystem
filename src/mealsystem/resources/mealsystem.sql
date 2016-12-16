/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : mealsystem

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2016-12-16 16:47:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `account` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '账户名',
  `password` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '账户密码',
  `type` char(15) COLLATE utf8_bin NOT NULL COMMENT '用户类型',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '用户名',
  `sex` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `phone` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `remark` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('banana', 'banana', 'kitchen', '哼哼', '女', '3265', null);
INSERT INTO `account` VALUES ('orange', 'orange', 'administrator', null, null, null, null);

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
INSERT INTO `meal` VALUES ('3', '红烧牛肉', '1', 0x31, '1', 0x31, 'c', null, null, '62208652-e4d9-4c4f-9c63-4affa47685fa.png');
INSERT INTO `meal` VALUES ('4', '拌面', '4', 0x34, '4', 0x34, 'd', null, null, '62208652-e4d9-4c4f-9c63-4affa47685fa.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '重大喜讯', 0xE88081E69DBFE5A8B6E5B08FE4B889, '老板娘', '2016-12-03 13:39:24');
INSERT INTO `notice` VALUES ('2', '新闻', 0xE88081E69DBFE7A6BBE5A99A, '小三', null);
INSERT INTO `notice` VALUES ('4', '号外号外', 0xE4BDA0E698AF, '小五', '2016-12-03 00:00:00');
INSERT INTO `notice` VALUES ('5', '头条', 0xE88081E69DBFE59B9BE5A99A, '小六', '2016-12-06 00:00:00');
INSERT INTO `notice` VALUES ('6', '', '', '', '2016-12-08 00:00:00');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `o_time` datetime DEFAULT NULL COMMENT '下单时间',
  `t_number` char(10) COLLATE utf8_bin DEFAULT NULL COMMENT '桌号',
  `o_meal` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '存下单菜品id',
  `o_piece` double DEFAULT NULL COMMENT '总价',
  `o_ispay` int(2) DEFAULT '1' COMMENT '0、未买单，1、已买单',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('1', '2016-12-08 15:51:24', '10', '1,2,3,4', '57', '0');
INSERT INTO `order` VALUES ('2', '2016-12-08 15:51:42', '11', '1,2', '172', '0');
INSERT INTO `order` VALUES ('3', '2016-12-08 15:52:02', '12', '3,2', '47', '0');
INSERT INTO `order` VALUES ('4', '2016-12-09 20:36:58', '1', '212', '232', '0');
INSERT INTO `order` VALUES ('5', '2016-12-09 20:36:59', '1', '1', '12', '0');
INSERT INTO `order` VALUES ('6', '2016-11-01 20:36:58', '312', '2', '13', '0');
INSERT INTO `order` VALUES ('7', '2016-11-25 20:36:58', '31', '34', '412', '0');
INSERT INTO `order` VALUES ('8', '2016-01-05 20:36:58', '1', '41', '42', '0');
INSERT INTO `order` VALUES ('9', '2016-12-24 20:36:58', '3', '1', '42', '0');
INSERT INTO `order` VALUES ('10', '2016-10-01 20:51:02', '3', '2', '12', '0');
INSERT INTO `order` VALUES ('11', '2016-10-28 20:51:09', '4', '3', '35', '0');
INSERT INTO `order` VALUES ('12', '2016-09-01 20:51:14', '5', '4', '53', '0');
INSERT INTO `order` VALUES ('13', '2016-09-30 20:51:21', '5', '5', '23', '0');
INSERT INTO `order` VALUES ('14', '2015-01-01 20:51:27', '6', '5', '12', '0');
INSERT INTO `order` VALUES ('15', '2017-01-01 20:51:36', '4', '1', '42', '0');
INSERT INTO `order` VALUES ('16', '2016-01-09 20:36:58', '6', '9', '50', '0');
INSERT INTO `order` VALUES ('17', '2016-12-13 09:52:18', '1', '', '10', '0');
INSERT INTO `order` VALUES ('24', '2016-12-13 10:49:52', 'A3', '1,2,3', '53', '0');
INSERT INTO `order` VALUES ('25', '2016-12-13 10:51:03', 'A4', '1,2,3', '79', '0');
INSERT INTO `order` VALUES ('26', '2016-12-13 10:57:33', 'A1', '1,2,3', '97', '1');
INSERT INTO `order` VALUES ('27', '2016-12-13 15:14:07', 'A2', '1,2,3', '53', '0');
INSERT INTO `order` VALUES ('28', '2016-12-13 15:17:51', 'A3', '1,2,3', '53', '0');
INSERT INTO `order` VALUES ('29', '2016-12-13 15:21:10', 'A3', '', '53', '0');
INSERT INTO `order` VALUES ('30', '2016-12-13 15:26:36', 'A4', '1,2', '52', '0');
INSERT INTO `order` VALUES ('31', '2016-12-14 20:44:01', 'A2', '1,2,3', '53', '0');
INSERT INTO `order` VALUES ('32', '2016-12-14 21:18:23', 'A5', '1,2,3', '53', '1');
INSERT INTO `order` VALUES ('33', '2016-12-15 10:31:32', 'A1', '1,2,3', '53', '1');
INSERT INTO `order` VALUES ('34', '2016-12-15 10:56:58', 'A6', '1,2,3', '53', '1');
INSERT INTO `order` VALUES ('35', '2016-12-15 11:22:36', 'A7', '1,2,3', '53', '1');
INSERT INTO `order` VALUES ('36', '2016-12-15 11:25:01', 'A7', '1,2,3', '53', '1');
INSERT INTO `order` VALUES ('37', '2016-12-15 11:41:25', 'A8', '1,2,3,4', '57', '1');
INSERT INTO `order` VALUES ('38', '2016-12-15 11:43:32', 'A8', '1', '60', '1');
INSERT INTO `order` VALUES ('39', '2016-12-15 12:15:18', 'A5', '1,2,3', '83', '1');

-- ----------------------------
-- Table structure for performance
-- ----------------------------
DROP TABLE IF EXISTS `performance`;
CREATE TABLE `performance` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '业绩id',
  `p_mode` char(15) DEFAULT NULL COMMENT '业绩模式（月/年）',
  `p_generates` double DEFAULT NULL COMMENT '业绩营销额',
  `p_time` datetime DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of performance
-- ----------------------------
INSERT INTO `performance` VALUES ('2', '2月', '3', '2016-12-29 22:21:51');
INSERT INTO `performance` VALUES ('3', '3月', '23', '2016-12-29 22:21:51');
INSERT INTO `performance` VALUES ('4', '2014年', '2', '2016-12-29 22:21:51');
INSERT INTO `performance` VALUES ('5', '5年1', '2', '2016-12-29 22:21:51');
INSERT INTO `performance` VALUES ('43', '1月', '92', '2016-12-16 10:28:55');
INSERT INTO `performance` VALUES ('44', '9月', '76', '2016-12-16 10:28:55');
INSERT INTO `performance` VALUES ('45', '10月', '47', '2016-12-16 10:28:55');
INSERT INTO `performance` VALUES ('46', '11月', '425', '2016-12-16 10:28:55');
INSERT INTO `performance` VALUES ('47', '12月', '1530', '2016-12-16 10:28:55');
INSERT INTO `performance` VALUES ('48', '2016年', '2170', '2016-12-16 10:28:55');

-- ----------------------------
-- Table structure for table
-- ----------------------------
DROP TABLE IF EXISTS `table`;
CREATE TABLE `table` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_number` char(15) COLLATE utf8_bin NOT NULL,
  `t_isNull` int(2) NOT NULL COMMENT '是否有人0、没有；1、有',
  `t_isReq` int(2) NOT NULL COMMENT '餐桌请求：0、无请求；1、下单；2、买单',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of table
-- ----------------------------
INSERT INTO `table` VALUES ('1', 'A1', '1', '0');
INSERT INTO `table` VALUES ('2', 'A2', '1', '0');
INSERT INTO `table` VALUES ('3', 'A3', '1', '0');
INSERT INTO `table` VALUES ('4', 'A4', '1', '0');
INSERT INTO `table` VALUES ('5', 'A5', '0', '0');
INSERT INTO `table` VALUES ('6', 'A6', '1', '0');
INSERT INTO `table` VALUES ('7', 'A7', '1', '0');
INSERT INTO `table` VALUES ('8', 'A8', '0', '0');
INSERT INTO `table` VALUES ('9', 'A9', '0', '0');
INSERT INTO `table` VALUES ('10', 'A10', '0', '0');
INSERT INTO `table` VALUES ('11', 'B1', '0', '0');
INSERT INTO `table` VALUES ('12', 'B2', '0', '0');
INSERT INTO `table` VALUES ('13', 'B3', '0', '0');
INSERT INTO `table` VALUES ('14', 'B4', '0', '0');
INSERT INTO `table` VALUES ('15', 'B5', '0', '0');
INSERT INTO `table` VALUES ('16', 'B6', '0', '0');
INSERT INTO `table` VALUES ('17', 'B7', '0', '0');
INSERT INTO `table` VALUES ('18', 'B8', '0', '0');
INSERT INTO `table` VALUES ('19', 'B9', '0', '0');
INSERT INTO `table` VALUES ('20', 'B10', '0', '0');
