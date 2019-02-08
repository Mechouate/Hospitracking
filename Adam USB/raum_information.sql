/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lbm

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-01 22:05:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `raum_information`
-- ----------------------------
DROP TABLE IF EXISTS `raum_information`;
CREATE TABLE `raum_information` (
  `raum_id` int(255) UNSIGNED AUTO_INCREMENT,
  `raum_name` varchar(255) DEFAULT NULL,
  `raum_ip_adr` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`raum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_information
-- ----------------------------
