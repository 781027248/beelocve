/*
MySQL Data Transfer
Source Host: localhost
Source Database: beelove
Target Host: localhost
Target Database: beelove
Date: 2020/9/5 16:30:21
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for friends
-- ----------------------------
DROP TABLE IF EXISTS `friends`;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friends_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `friends_remarks` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `friends` VALUES ('7', '1', '2', 'ah');
INSERT INTO `friends` VALUES ('8', '2', '1', null);
INSERT INTO `friends` VALUES ('9', '10', '2', null);
INSERT INTO `friends` VALUES ('10', '2', '10', null);
INSERT INTO `friends` VALUES ('67', '11', '2', null);
INSERT INTO `friends` VALUES ('68', '2', '11', null);
INSERT INTO `friends` VALUES ('69', '2', '12', null);
INSERT INTO `friends` VALUES ('70', '12', '2', null);
