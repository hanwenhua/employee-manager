/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : employeemanager

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2018-04-19 16:48:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for application
-- ----------------------------
DROP TABLE IF EXISTS `application`;
CREATE TABLE `application` (
  `app_id` int(11) NOT NULL AUTO_INCREMENT,
  `app_reason` varchar(255) DEFAULT NULL,
  `app_result` tinyint(1) DEFAULT '0',
  `attend_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`app_id`),
  KEY `FK_9wx0gm9e04sxa4spsnnvshr2v` (`attend_id`),
  KEY `FK_ncy74ck30mee5rdkk2uhl76r4` (`type_id`),
  CONSTRAINT `FK_9wx0gm9e04sxa4spsnnvshr2v` FOREIGN KEY (`attend_id`) REFERENCES `attend` (`attend_id`),
  CONSTRAINT `FK_ncy74ck30mee5rdkk2uhl76r4` FOREIGN KEY (`type_id`) REFERENCES `attend_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of application
-- ----------------------------
INSERT INTO `application` VALUES ('9', '123', '1', '380', '1');
INSERT INTO `application` VALUES ('10', 'wu', '1', '381', '2');
INSERT INTO `application` VALUES ('11', '3', '1', '382', '1');

-- ----------------------------
-- Table structure for attend
-- ----------------------------
DROP TABLE IF EXISTS `attend`;
CREATE TABLE `attend` (
  `attend_id` int(11) NOT NULL AUTO_INCREMENT,
  `duty_day` varchar(50) NOT NULL,
  `is_come` tinyint(1) DEFAULT NULL,
  `punch_time` datetime DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`attend_id`),
  KEY `FK_sxsglsafwbl3kjyu20pulbv7` (`type_id`),
  KEY `FK_e5w782m7lqroclf83divt40iv` (`emp_id`),
  CONSTRAINT `FK_e5w782m7lqroclf83divt40iv` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`),
  CONSTRAINT `FK_sxsglsafwbl3kjyu20pulbv7` FOREIGN KEY (`type_id`) REFERENCES `attend_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attend
-- ----------------------------
INSERT INTO `attend` VALUES ('380', '2018-04-19', '0', '2018-04-19 16:00:22', '1', '101');
INSERT INTO `attend` VALUES ('381', '2018-04-19', '0', '2018-04-19 16:10:42', '5', '102');
INSERT INTO `attend` VALUES ('382', '2018-04-19', '0', '2018-04-19 16:12:25', '1', '103');

-- ----------------------------
-- Table structure for attend_type
-- ----------------------------
DROP TABLE IF EXISTS `attend_type`;
CREATE TABLE `attend_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attend_type
-- ----------------------------
INSERT INTO `attend_type` VALUES ('1', '1');
INSERT INTO `attend_type` VALUES ('2', '2');
INSERT INTO `attend_type` VALUES ('3', '3');
INSERT INTO `attend_type` VALUES ('4', '4');
INSERT INTO `attend_type` VALUES ('5', '5');

-- ----------------------------
-- Table structure for check_back
-- ----------------------------
DROP TABLE IF EXISTS `check_back`;
CREATE TABLE `check_back` (
  `check_id` int(11) NOT NULL AUTO_INCREMENT,
  `check_reason` varchar(255) DEFAULT NULL,
  `check_result` tinyint(1) NOT NULL,
  `app_id` int(11) DEFAULT NULL,
  `mgr_id` int(11) NOT NULL,
  PRIMARY KEY (`check_id`),
  KEY `FK_939cwdph0r4ia2okhjqn7f92y` (`app_id`),
  KEY `FK_cfkusgfp28so2n7lyvat4byju` (`mgr_id`),
  CONSTRAINT `FK_939cwdph0r4ia2okhjqn7f92y` FOREIGN KEY (`app_id`) REFERENCES `application` (`app_id`),
  CONSTRAINT `FK_cfkusgfp28so2n7lyvat4byju` FOREIGN KEY (`mgr_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of check_back
-- ----------------------------
INSERT INTO `check_back` VALUES ('44', null, '1', '9', '101');
INSERT INTO `check_back` VALUES ('45', null, '0', '10', '101');
INSERT INTO `check_back` VALUES ('46', null, '1', '11', '101');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_account` varchar(50) NOT NULL,
  `emp_password` varchar(50) NOT NULL DEFAULT '123456',
  `emp_name` varchar(255) DEFAULT NULL,
  `emp_className` varchar(255) DEFAULT NULL,
  `emp_tel` varchar(255) DEFAULT NULL,
  `emp_bedroom` varchar(255) DEFAULT NULL,
  `dept_name` varchar(50) DEFAULT NULL,
  `mgr_id` int(11) DEFAULT NULL,
  `emp_type` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`emp_id`),
  UNIQUE KEY `UK_5tltp1u3mevdum1ilp1ft71rg` (`emp_account`),
  KEY `FK_5f44y8jo1j00uhenw2naboii8` (`mgr_id`),
  CONSTRAINT `FK_5f44y8jo1j00uhenw2naboii8` FOREIGN KEY (`mgr_id`) REFERENCES `employee` (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('101', 'admin', 'admin', 'admin', null, null, null, null, null, '2');
INSERT INTO `employee` VALUES ('102', 'a', 'a', 'a', '4#444', '13363453456', '1', null, null, '1');
INSERT INTO `employee` VALUES ('103', 'b', 'b', 'b', null, null, null, null, null, '1');
SET FOREIGN_KEY_CHECKS=1;
