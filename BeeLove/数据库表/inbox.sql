/*
MySQL Data Transfer
Source Host: localhost
Source Database: beelove
Target Host: localhost
Target Database: beelove
Date: 2020/9/5 16:30:26
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for inbox
-- ----------------------------
DROP TABLE IF EXISTS `inbox`;
CREATE TABLE `inbox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `content` varchar(300) NOT NULL,
  `sendtime` datetime NOT NULL,
  `isread` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `inbox` VALUES ('1', '10', '2', 'test', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('4', '10', '2', '123', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('5', '10', '2', 'aewsdfadfg', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('6', '10', '2', 'asfdagwasdfgfgesdaefrsadfs', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('7', '10', '2', 'asdas', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('8', '10', '2', 'asdasd', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('9', '10', '2', 'asdasda', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('10', '10', '2', 'sad', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('11', '10', '2', 'asd', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('12', '10', '2', 'asdasd', '2020-09-03 00:00:00', '0');
INSERT INTO `inbox` VALUES ('13', '11', '2', '123', '2020-09-04 00:00:00', '0');
INSERT INTO `inbox` VALUES ('15', '11', '2', '369', '2020-09-04 00:00:00', '0');
