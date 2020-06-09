/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : internship

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2020-06-08 22:19:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accusation
-- ----------------------------
DROP TABLE IF EXISTS `accusation`;
CREATE TABLE `accusation` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `jobID` int(4) DEFAULT NULL,
  `studentID` int(4) NOT NULL,
  `bossID` int(4) NOT NULL,
  `target` varchar(15) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bossIDA` (`bossID`),
  KEY `studentIDA` (`studentID`),
  KEY `jobIDA` (`jobID`),
  CONSTRAINT `bossIDA` FOREIGN KEY (`bossID`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobIDA` FOREIGN KEY (`jobID`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentIDA` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accusation
-- ----------------------------
INSERT INTO `accusation` VALUES ('12', null, '1', '1', 'toEnterprise', '这个公司tql');
INSERT INTO `accusation` VALUES ('13', null, '1', '1', 'toStudent', '这个人的信息造假');
INSERT INTO `accusation` VALUES ('14', '6', '1', '2', 'toJob', '职位真实信息和平台信息不一致');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `pw` varchar(25) NOT NULL,
  `realname` varchar(25) NOT NULL,
  `telephone` char(11) NOT NULL,
  `level` char(10) NOT NULL DEFAULT '普通管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '123', '111', '张三', '15767010363', '超级管理员');
INSERT INTO `admin` VALUES ('2', '456', '111', '李四', '18718031079', '普通管理员');
INSERT INTO `admin` VALUES ('3', 'qqq', '111', '爱爱', '18718031079', '普通管理员');
INSERT INTO `admin` VALUES ('4', '222', '222', '这种', '18718031079', '普通管理员');
INSERT INTO `admin` VALUES ('5', '111', '111', '张三', '18118031079', '普通管理员');

-- ----------------------------
-- Table structure for candidate
-- ----------------------------
DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `jobID` int(4) NOT NULL,
  `studentID` int(4) NOT NULL,
  `bossID` int(4) NOT NULL,
  `state` varchar(20) NOT NULL DEFAULT '未处理',
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `schedule` datetime DEFAULT NULL,
  `area` varchar(25) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `note` varchar(255) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bossIDC` (`bossID`),
  KEY `studentIDC` (`studentID`),
  KEY `jobIDC` (`jobID`),
  CONSTRAINT `bossIDC` FOREIGN KEY (`bossID`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `jobIDC` FOREIGN KEY (`jobID`) REFERENCES `job` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentIDC` FOREIGN KEY (`studentID`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of candidate
-- ----------------------------
INSERT INTO `candidate` VALUES ('9', '6', '3', '2', '未处理', '2020-05-10 15:50:43', null, null, null, null, null);
INSERT INTO `candidate` VALUES ('10', '6', '1', '2', '已接受面试', '2020-06-06 09:29:57', '2020-06-25 16:00:00', '江西-上饶', '玉山县区冰溪镇甘露园二期', '来吧', null);
INSERT INTO `candidate` VALUES ('13', '9', '1', '4', '已拒绝', '2020-05-11 13:02:19', null, null, null, '能力不合适', null);
INSERT INTO `candidate` VALUES ('14', '10', '1', '4', '已拒绝面试', '2020-05-25 19:03:18', '2020-05-28 16:00:00', '北京', '小胡同', '带上纸和笔', '啧啧');
INSERT INTO `candidate` VALUES ('15', '11', '1', '4', '已拒绝面试', '2020-06-06 09:30:08', '2020-05-27 17:00:00', '北京', '小胡同', 'zci快来', '想是是是');
INSERT INTO `candidate` VALUES ('16', '12', '1', '4', '已接受面试', '2020-05-25 19:03:34', '2020-05-19 10:00:00', '北京', '小胡同', '尽快过来8', '');
INSERT INTO `candidate` VALUES ('17', '5', '1', '1', '未处理', '2020-05-15 15:00:44', null, null, null, null, null);
INSERT INTO `candidate` VALUES ('18', '12', '6', '4', '未处理', '2020-05-23 15:12:35', null, null, null, null, null);
INSERT INTO `candidate` VALUES ('19', '11', '6', '4', '未处理', '2020-05-23 15:12:38', null, null, null, null, null);
INSERT INTO `candidate` VALUES ('20', '9', '3', '4', '邀请面试', '2020-05-25 14:27:28', '2020-05-28 09:00:00', '北京', '小胡同', '来吧', null);
INSERT INTO `candidate` VALUES ('21', '10', '3', '4', '已拒绝', '2020-05-25 19:02:29', null, null, null, '不合适8', null);
INSERT INTO `candidate` VALUES ('22', '11', '3', '4', '邀请面试', '2020-05-25 19:02:27', '2020-05-26 08:00:00', '北京', '小胡同', '快拒绝8', '时间不对');
INSERT INTO `candidate` VALUES ('23', '12', '3', '4', '已拒绝', '2020-06-06 09:35:08', '2020-05-25 14:39:51', '北京', '小胡同', '信息', null);
INSERT INTO `candidate` VALUES ('24', '35', '3', '4', '未处理', '2020-05-25 18:52:41', '2020-05-28 15:14:06', '北京', '小胡同', 'yous', null);
INSERT INTO `candidate` VALUES ('26', '35', '7', '4', '未处理', '2020-05-23 20:16:33', null, null, null, null, null);
INSERT INTO `candidate` VALUES ('27', '36', '8', '4', '邀请面试', '2020-06-06 09:35:02', '2020-06-25 05:00:00', '北京', '小胡同', null, null);

-- ----------------------------
-- Table structure for enterprise
-- ----------------------------
DROP TABLE IF EXISTS `enterprise`;
CREATE TABLE `enterprise` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `pw` varchar(25) NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `telephone` char(11) DEFAULT NULL,
  `QQ` varchar(25) DEFAULT NULL,
  `area` varchar(25) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `founded` datetime DEFAULT NULL,
  `scale` varchar(25) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enterprise
-- ----------------------------
INSERT INTO `enterprise` VALUES ('1', '111', '111', '广东海洋大学', '4622754@qq.com', '13640112637', null, '广东-湛江', '麻章区海大路1号', '2007-01-01 00:00:00', '10000人以上', '广东海洋大学（Guangdong Ocean University）坐落于海滨城市湛江市，是广东省人民政府和国家海洋局共建的广东省重点建设大学之一，是一所以海洋、水产、食品学科为特色，理、工、农、文、经、管、法、教、艺等学科协调发展，以应用学科为主体的多科性海洋大学。是具有“学士、硕士、博士”完整学位授权体系的大学，也是广东省高水平大学重点学科建设项目高校。', '2020-05-10 15:14:09');
INSERT INTO `enterprise` VALUES ('2', '222', '111', '友帮宝信息技术服务有限公司', '462275413@qq.com', '18718031079', null, '江西-上饶', '玉山县区冰溪镇甘露园二期', '2018-06-01 00:00:00', '20-90人', '从事信息技术，计算机软件硬件，网络科技，通信科技领域内技术开发，技术咨询，商务信息咨询，【不含理财咨询，金融咨询】，企业管理【不含投资与资产管理，基金管理】咨询，市场营销策划，市场信息咨询与调查，展览展示服务，会务服务，电脑图文设计制作，企业形象策划【依法须经批准的项目，经相关部门批准后方可开展经营活动】。', '2020-05-11 11:34:33');
INSERT INTO `enterprise` VALUES ('3', '333', '111', '米哈游', '462275413@qq.com', '18718031079', '462275413', '上海', '徐汇区宜山路1388号民润大厦', '2012-02-01 00:00:00', '10000人以上', '上海米哈游网络科技股份有限公司（简称米哈游，miHoYo），成立于2011年，秉持“技术宅拯救世界”的信条，梦想成为世界一流的ACG内容与服务提供商，分布在上海总部和东京分公司。原创IP“崩坏”以游戏，漫画，周边，动画等产品形态为载体，覆盖中国大陆，港台，日本，韩国，北美等全球市场，拥有三千万用户，特别在中国ACG受众人群中，拥有顶级影响力。公司现在在上海 • 东京两大魔都设有据点，核心团队近两百人 ， 半数来自清华，北大，浙大，上海交大， 复旦，同济，中科大这七所院校，超过一半来自985高校。', '2020-05-05 23:11:44');
INSERT INTO `enterprise` VALUES ('4', '444', '111', '测试公司', null, '18718031079', null, '北京', '小胡同', '2020-01-01 00:00:00', '0-20人', null, '2020-05-10 15:42:57');
INSERT INTO `enterprise` VALUES ('5', '555', '111', '另一个测试公司', null, '18718031079', null, '广东-韶关', '韶关丹霞山', '2020-01-01 00:00:00', '0-20人', null, '2020-05-21 19:23:54');
INSERT INTO `enterprise` VALUES ('6', '666', '111', null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for job
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `bossID` int(4) NOT NULL,
  `type` varchar(25) NOT NULL,
  `salary` varchar(25) NOT NULL,
  `workTime` varchar(25) NOT NULL,
  `area` varchar(25) NOT NULL,
  `address` varchar(255) NOT NULL,
  `introduction` varchar(255) NOT NULL,
  `updateTime` timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `bossID` (`bossID`),
  CONSTRAINT `bossID` FOREIGN KEY (`bossID`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('4', 'web前端开发工程师', '3', '特色职位-软件开发', '15-30K·16薪', '8点-18点，双休', '上海', '徐汇区宜山路1388号民润大厦', '1、负责项目WEB活动需求开发；\n2、负责活动中通用组件的开发；\n3、负责游戏内容站（官网、攻略站、资料站、漫画站）系统的开发；\n4、负责内部工具类需求开发，如流程管理工具，知识分享工具，内部消息通讯工具等。', '2020-05-05 22:32:39');
INSERT INTO `job` VALUES ('5', '辅导员助理', '1', '特色职位-家教助教', '3000-4000/月', '8点-16点，有时加班', '广东-湛江', '麻章区海大路1号', '主要是协助辅导员进行文档处理', '2020-05-10 15:16:49');
INSERT INTO `job` VALUES ('6', '货拉拉兼职搬家', '2', '其他-临时工', '300 元/天  日结', '08:00-18:00和18:00-23:00', '江西-上饶', '玉山县区冰溪镇甘露园二期', '岗位要求： 年满18-48岁，无明显外露大面积纹身，无犯罪记录。 薪酬福利： 每单费用每人大概100-300元不等，多劳多得，按单不按天！ 工作时间： 每家搬运约2-5小时/单，每天做2-3单。 工作内容： 根据自己空闲时间和位置合理接订单，然后前往搬家地点集合。 搬运费用一单一结，做完走财务账，最多不会超过3天打银行卡 工作模式： 需来公司进行培训开通账号，开通后、我们会根据你的住址就近安排搬家订单；', '2020-05-10 15:36:30');
INSERT INTO `job` VALUES ('7', '测试1', '2', '其他-其他', '300 元/天', '08:00-18:00', '江西-上饶', '玉山县区冰溪镇甘露园二期', '测试用例', '2020-05-10 15:37:27');
INSERT INTO `job` VALUES ('9', '测试3', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-11 11:49:23');
INSERT INTO `job` VALUES ('10', '测试4', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-11 11:49:26');
INSERT INTO `job` VALUES ('11', '测试5', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-11 11:49:31');
INSERT INTO `job` VALUES ('12', '测试6', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-11 13:01:36');
INSERT INTO `job` VALUES ('14', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('15', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('16', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('17', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('18', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('19', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('20', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('21', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('22', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('23', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('24', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('25', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('26', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('27', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('28', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('29', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('30', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('31', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('32', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('33', '测试2', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('34', '测试3', '4', '其他-其他', '300 元/天', '08:00-18:00', '北京', '小胡同', '测试', '2020-05-10 15:46:44');
INSERT INTO `job` VALUES ('35', '测试7', '4', '体力达人-快递配送', '每单10块', '每天12点-14点', '北京', '小胡同', '送外卖', '2020-05-23 15:29:50');
INSERT INTO `job` VALUES ('36', '测试', '4', '体力达人-会展执行', '每天100块', '每天中午', '北京', '小胡同', '赛事', '2020-05-23 20:19:37');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `pw` varchar(25) NOT NULL,
  `realname` varchar(25) DEFAULT NULL,
  `sex` char(2) DEFAULT '男',
  `age` int(2) DEFAULT NULL,
  `Email` varchar(25) DEFAULT NULL,
  `telephone` char(11) DEFAULT NULL,
  `QQ` varchar(25) DEFAULT NULL,
  `area` varchar(25) DEFAULT NULL,
  `politic` varchar(25) DEFAULT NULL,
  `education` varchar(255) DEFAULT NULL,
  `career` varchar(255) DEFAULT NULL,
  `introduction` varchar(255) DEFAULT NULL,
  `updateTime` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `CV` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '111', '1111', '李梅梅', '女', '22', '462275413@qq.com', '13640112637', '462275413', '山西-长治', '共青团员', '2016年-2020年就读广东海洋大学软件工程', '2019年12月至2020年1月在腾讯兼职前端开发', '喜欢敲代码', '2020-05-16 15:36:09', '1');
INSERT INTO `student` VALUES ('3', '333', '1111', '王明', '男', '23', 'zhu462275413@qq.com', '18718031079', '909285925', '山西-阳泉', '党员', '2015至2020年就读广东海洋大学寸金学院的信息管理专业', '2019年10月-12月，在校外卓越团队兼职摄影师', '喜欢摄影', '2020-06-06 09:02:40', '0');
INSERT INTO `student` VALUES ('4', '444', '1111', null, '男', null, null, null, null, null, null, null, null, null, '2020-05-15 20:49:30', '0');
INSERT INTO `student` VALUES ('5', '555', '1111', null, '男', null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `student` VALUES ('6', '666', '1111', '李萌', '女', '34', null, '18718031079', null, '河北-秦皇岛', null, null, null, null, '2020-05-23 15:24:11', '1');
INSERT INTO `student` VALUES ('7', '777', '1111', '张三', '女', '31', null, '18718031079', null, '河北-秦皇岛', null, null, null, null, '2020-05-23 20:17:24', '1');
INSERT INTO `student` VALUES ('8', '888', '111', '张三', '男', '18', null, '18718031079', null, '河北-秦皇岛', null, null, null, null, '2020-06-06 09:28:55', '1');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------
INSERT INTO `test` VALUES ('1', '2');
INSERT INTO `test` VALUES ('3', '3');
INSERT INTO `test` VALUES ('4', '4');
INSERT INTO `test` VALUES ('5', '3');
INSERT INTO `test` VALUES ('6', '2221');
INSERT INTO `test` VALUES ('7', '3332');
INSERT INTO `test` VALUES ('8', '444');
INSERT INTO `test` VALUES ('9', '111');

-- ----------------------------
-- Event structure for expireDelete
-- ----------------------------
DROP EVENT IF EXISTS `expireDelete`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `expireDelete` ON SCHEDULE EVERY 1 MINUTE STARTS '2020-04-30 20:55:42' ON COMPLETION PRESERVE ENABLE COMMENT 'every minute delete candidate updated for more than 30 days' DO DELETE from candidate where TIMESTAMPDIFF(DAY,updateTime,NOW()) > 30
;;
DELIMITER ;
