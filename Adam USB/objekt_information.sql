/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : lbm

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-01 20:13:27


*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `objekt_information`
-- ----------------------------
DROP TABLE IF EXISTS `objekt_information`;
CREATE TABLE `objekt_information` (
  `objekt_id` int(225) UNSIGNED AUTO_INCREMENT,
  `objekt_name` varchar(225) DEFAULT NULL,
  `objekt_mac_adr` varchar(225) DEFAULT NULL,
  `objekt_type` varchar(40) DEFAULT NULL,
  `create_date` timestamp,
  `raum_id` int(255) UNSIGNED NOT NULL,
  PRIMARY KEY (`objekt_id`),
  FOREIGN KEY (`raum_id`)  REFERENCES `raum_information`(`raum_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_information
-- ----------------------------
