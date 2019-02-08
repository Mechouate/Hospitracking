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
-- Table structure for `news_information`
-- ----------------------------
DROP TABLE IF EXISTS `news_information`;
CREATE TABLE `news_information` (
  `News_id` int(255) NOT NULL AUTO_INCREMENT,
  `News_title` varchar(255) DEFAULT NULL,
  `News_content` varchar(500)  DEFAULT NULL,
    `News_created_by_nick` varchar(500) DEFAULT NULL,
  `Created_by_user_id` int(255) DEFAULT NULL,
  `created_date`  datetime DEFAULT CURRENT_TIMESTAMP,
  `Beacon_id` int(255) DEFAULT NULL,
  PRIMARY KEY (`News_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_information
-- ----------------------------
