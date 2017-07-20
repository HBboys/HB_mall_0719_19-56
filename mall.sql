/*
Navicat MySQL Data Transfer

Source Server         : MikeHe
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-07-20 14:57:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `gid` int(11) NOT NULL,
  `gname` varchar(255) DEFAULT NULL,
  `price` int(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `timeonshelf` datetime DEFAULT NULL,
  `sellerid` int(11) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `picref` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gid`),
  KEY `sellerid` (`sellerid`),
  CONSTRAINT `sellerid` FOREIGN KEY (`sellerid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '笔', '12', '2', '2017-04-08 00:00:00', '1', '文具', null);
INSERT INTO `good` VALUES ('2', '橡皮', '12', '1', '2017-04-09 00:00:00', '2', '文具', null);
INSERT INTO `good` VALUES ('3', '电脑', '12', '1', '2017-07-19 15:25:23', '1', '电子产品', null);
INSERT INTO `good` VALUES ('4', '桌子', '12', '2', '2017-07-20 15:28:26', '2', '文具', null);
INSERT INTO `good` VALUES ('5', '手机', '1', '1', '2017-07-12 15:51:15', '1', '电子产品', null);
INSERT INTO `good` VALUES ('6', '鼠标', '1', '1', '2017-07-12 15:51:15', '1', '电子产品', null);
INSERT INTO `good` VALUES ('7', '大米', '1', '1', '2017-07-12 15:51:15', '1', '食品', null);
INSERT INTO `good` VALUES ('8', '牛奶', '1', '1', '2017-07-12 15:51:15', '1', '食品', null);
INSERT INTO `good` VALUES ('9', '面包', '1', '1', '2017-07-12 15:51:15', '1', '食品', null);
INSERT INTO `good` VALUES ('10', '耳机', '1', '1', '2017-07-12 15:51:15', '1', '电子产品', null);
INSERT INTO `good` VALUES ('11', '水杯', '11', '1', '2017-07-12 15:51:15', '1', '生活用品', null);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `orderid` int(11) NOT NULL,
  `buyerid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `commenttext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `gid` (`gid`),
  KEY `buyerid` (`buyerid`),
  CONSTRAINT `buyerid` FOREIGN KEY (`buyerid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gid` FOREIGN KEY (`gid`) REFERENCES `good` (`gid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isseller` int(11) DEFAULT NULL,
  `money` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'CalmDowning', '123', '12345', '123@1.com', '0', '100.787');
INSERT INTO `user` VALUES ('2', 'Regulus', '123', '12345', 'qwewqe', '1', '100');
