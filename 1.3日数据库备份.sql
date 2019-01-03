/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50709
Source Host           : localhost:3306
Source Database       : business

Target Server Type    : MYSQL
Target Server Version : 50709
File Encoding         : 65001

Date: 2019-01-03 15:21:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for buaftersale
-- ----------------------------
DROP TABLE IF EXISTS `buaftersale`;
CREATE TABLE `buaftersale` (
  `aftersale_id` int(11) NOT NULL AUTO_INCREMENT,
  `aftersale_roll` varchar(200) NOT NULL,
  `order_num` varchar(45) NOT NULL,
  `question_type` varchar(20) NOT NULL,
  `question` varchar(200) NOT NULL,
  `employee_id` varchar(200) NOT NULL,
  `processing_date` date NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`aftersale_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buaftersale
-- ----------------------------

-- ----------------------------
-- Table structure for bucompany_link_man
-- ----------------------------
DROP TABLE IF EXISTS `bucompany_link_man`;
CREATE TABLE `bucompany_link_man` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `belong_company` varchar(45) NOT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bucompany_link_man
-- ----------------------------
INSERT INTO `bucompany_link_man` VALUES ('1', '青大1', '15655556666', 'CT0200001', '');
INSERT INTO `bucompany_link_man` VALUES ('2', '青大2', '15655557777', 'CT0200001', '');
INSERT INTO `bucompany_link_man` VALUES ('3', '青大3', '15655558888', 'CT0200001', '');
INSERT INTO `bucompany_link_man` VALUES ('4', '科大1', '8567', 'CT0200002', '');
INSERT INTO `bucompany_link_man` VALUES ('5', '科大2', '8568', 'CT0200002', '');

-- ----------------------------
-- Table structure for budepartment
-- ----------------------------
DROP TABLE IF EXISTS `budepartment`;
CREATE TABLE `budepartment` (
  `department_id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) NOT NULL,
  `department_desc` varchar(200) DEFAULT NULL,
  `department_setting` varchar(200) DEFAULT NULL,
  `productmaster_id` int(11) NOT NULL,
  PRIMARY KEY (`department_id`),
  KEY `productmaster_id` (`productmaster_id`),
  CONSTRAINT `budepartment_ibfk_1` FOREIGN KEY (`productmaster_id`) REFERENCES `buproductmaster` (`productmaster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of budepartment
-- ----------------------------
INSERT INTO `budepartment` VALUES ('1', '电视部门', '电视销售', '', '1');
INSERT INTO `budepartment` VALUES ('2', '空调部门', '空调销售', '', '2');
INSERT INTO `budepartment` VALUES ('3', '洗衣机部门', '洗衣机销售', '', '3');
INSERT INTO `budepartment` VALUES ('4', '冰箱部门', '冰箱销售', '', '4');
INSERT INTO `budepartment` VALUES ('5', '厨卫大电部门', '厨卫大电销售', '', '5');
INSERT INTO `budepartment` VALUES ('6', '厨房小电部门', '厨房小电销售', '', '6');
INSERT INTO `budepartment` VALUES ('7', '生活电器部门', '生活电器销售', '', '7');
INSERT INTO `budepartment` VALUES ('8', '个护健康部门', '个护健康销售', '', '8');
INSERT INTO `budepartment` VALUES ('9', '家庭影音部门', '家庭影音销售', '', '9');

-- ----------------------------
-- Table structure for buemployee
-- ----------------------------
DROP TABLE IF EXISTS `buemployee`;
CREATE TABLE `buemployee` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` varchar(45) DEFAULT NULL,
  `employee_name` varchar(50) NOT NULL,
  `employee_password` varchar(50) NOT NULL,
  `employee_photo` varchar(200) DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  `employee_count` int(11) DEFAULT NULL,
  `employee_status` int(11) DEFAULT NULL,
  `role_id` int(11) NOT NULL,
  `rec_time` varchar(200) DEFAULT NULL,
  `time_last_error` varchar(200) DEFAULT NULL,
  `rec_address` varchar(200) DEFAULT NULL,
  `rec_useraent` varchar(200) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `department_id` (`department_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `buemployee_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `budepartment` (`department_id`),
  CONSTRAINT `buemployee_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `burole` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buemployee
-- ----------------------------
INSERT INTO `buemployee` VALUES ('1', 'EM00001', 'Bill', '202cb962ac59075b964b07152d234b70', null, '1', '3', '0', '1', '2018-12-24 15:14:25', null, '0.0.0.0', 'google', '15688887777', '青岛大学');
INSERT INTO `buemployee` VALUES ('2', 'EM00002', '我是销售', '202cb962ac59075b964b07152d234b70', null, '2', null, null, '3', null, null, null, null, '13188888888', '青岛大学');
INSERT INTO `buemployee` VALUES ('3', 'EM00003', '我是经理', '202cb962ac59075b964b07152d234b70', null, '3', null, null, '2', null, null, null, null, '15688887777', '青岛大学');
INSERT INTO `buemployee` VALUES ('4', 'EM00004', '我是售后', '202cb962ac59075b964b07152d234b70', null, '4', null, null, '4', null, null, null, null, '15688887777', '青岛大学');

-- ----------------------------
-- Table structure for bufeedback
-- ----------------------------
DROP TABLE IF EXISTS `bufeedback`;
CREATE TABLE `bufeedback` (
  `feedback_id` int(11) NOT NULL AUTO_INCREMENT,
  `feedback_roll` varchar(200) NOT NULL,
  `aftersale_roll` varchar(200) NOT NULL,
  `feedback_date` date NOT NULL,
  `charge` int(11) NOT NULL,
  `others` varchar(200) DEFAULT NULL,
  `confirment` int(11) NOT NULL,
  PRIMARY KEY (`feedback_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bufeedback
-- ----------------------------

-- ----------------------------
-- Table structure for buproduct
-- ----------------------------
DROP TABLE IF EXISTS `buproduct`;
CREATE TABLE `buproduct` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_rollno` varchar(200) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `product_picture` varchar(500) DEFAULT NULL,
  `productdevelop_id` int(11) NOT NULL,
  `product_cost` varchar(50) DEFAULT NULL,
  `product_price` varchar(50) DEFAULT NULL,
  `product_unit` varchar(50) DEFAULT NULL,
  `product_size` varchar(200) DEFAULT NULL,
  `product_weight` varchar(200) DEFAULT NULL,
  `product_color` varchar(200) DEFAULT NULL,
  `product_model` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `productdevelop_id` (`productdevelop_id`),
  CONSTRAINT `buproduct_ibfk_1` FOREIGN KEY (`productdevelop_id`) REFERENCES `buproductdevelop` (`productdevelop_id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buproduct
-- ----------------------------
INSERT INTO `buproduct` VALUES ('1', 'PD201800001', '海信超薄曲面电视', '', '1', '3000', '4799', 'mm', '1599x258x972mm', '37.8kg', '黑色', '65英寸');
INSERT INTO `buproduct` VALUES ('2', 'PD201800002', '小米曲面电视', '', '1', '2000', '3299', 'mm', '1334x190x830mm', '13.73kg', '灰黑色', '55英寸');
INSERT INTO `buproduct` VALUES ('3', 'PD201800003', 'LCT超薄电视', '', '2', '1000', '2799', 'mm', '1238x76x718mm', '11.8kg', '银河灰', '55英寸');
INSERT INTO `buproduct` VALUES ('4', 'PD201800004', '康佳电视', '', '2', '2000', '3599', 'mm', '1462x92x848mm', '22.7kg', '银色', '65英寸');
INSERT INTO `buproduct` VALUES ('5', 'PD201800005', 'LGOLED电视', '', '3', '7000', '11999', 'mm', '1228x46.9x707mm', '25.3kg', '黑色灰', '55英寸');
INSERT INTO `buproduct` VALUES ('6', 'PD201800006', '创维OLED电视', '', '3', '6000	', '8999', 'mm', '1226x69x709mm', '22kg', '灰色+银色', '55英寸');
INSERT INTO `buproduct` VALUES ('7', 'PD201800007', '小米4k超清电视', '', '4', '1000', '2299', 'mm', '1365x190x845mm', '12.5kg', '黑色', '55英寸');
INSERT INTO `buproduct` VALUES ('8', 'PD201800008', '创维4k超清电视', '', '4', '800', '1999', 'mm', '1130x92.6x663.5mm', '15kg', ' 黑色+银色烫金', '50英寸');
INSERT INTO `buproduct` VALUES ('9', 'PD201800009', '海信55吋', '', '5', '1000', '2399', 'mm', '1244x85x721mm', '22kg', '黑色', '55英寸');
INSERT INTO `buproduct` VALUES ('10', 'PD201800010', '小米55吋', '', '5', '2000', '3699', 'mm', '1456.3x77.2x850.87mm', '21.8kg', '黑色', '55英寸');
INSERT INTO `buproduct` VALUES ('11', 'PD201800011', '小米65吋', '', '6', '2000', '3799', 'mm', '1238x76x718mm', '11.8kg', '黑色', '65英寸');
INSERT INTO `buproduct` VALUES ('12', 'PD201800012', '创维65吋', '', '6', '2000', '3799', 'mm', '1462x92x848mm', '22.7kg', '银色', '65英寸');
INSERT INTO `buproduct` VALUES ('13', 'PD201800013', '电视挂件', '', '7', '5', '19.9', 'mm', '', '', '黑色', '');
INSERT INTO `buproduct` VALUES ('14', 'PD201800014', '遥控器', '', '7', '20', '50', 'mm', '', ' ', '银色', '');
INSERT INTO `buproduct` VALUES ('15', 'PD201810001', '美的壁挂式空调', '', '8', '3000', '2299', 'mm', '870x205x275mm', '11kg', '白色', '');
INSERT INTO `buproduct` VALUES ('16', 'PD201810002', '奥克斯壁挂式空调', '', '8', '1000', '2049', 'mm', ' 845x295x550mm', '32.5kg', '窈青白', '');
INSERT INTO `buproduct` VALUES ('17', 'PD201810003', '美的柜式空调', '', '9', '3000', '4899', 'mm', '1900x650x440mm', '36kg', '陶瓷白', '');
INSERT INTO `buproduct` VALUES ('18', 'PD201810004', '奥克斯柜式空调', '', '9', '3000', '4099', 'mm', '1830x440x440mm', '52kg', '窈青白', '');
INSERT INTO `buproduct` VALUES ('19', 'PD201810005', '美的中央空调', '', '10', '6000', '8480', 'mm', ' 1140x210x450mm', '80kg', '浅灰色', '');
INSERT INTO `buproduct` VALUES ('20', 'PD201810006', '海尔中央空调', '', '10', '6000', '8880', 'mm', '1300x450x180mm', ' 30kg', '白色', '');
INSERT INTO `buproduct` VALUES ('21', 'PD201810007', '美的一级能效空调', '', '11', '1000', '3299', 'mm', ' 785x555x300mm', '27kg', '陶瓷白', '');
INSERT INTO `buproduct` VALUES ('22', 'PD201810008', '格力一级能效空调', '', '11', '6000', '10499', 'mm', '1800x402x455mm', ' 58kg', '金秋白', '');
INSERT INTO `buproduct` VALUES ('23', 'PD201810009', '奥克斯变频空调', '', '12', '1000', '2899', 'mm', '920x620x400mm', '30kg', '金色', '');
INSERT INTO `buproduct` VALUES ('24', 'PD201810010', '格力变频空调', '', '12', '1000', '3399', 'mm', ' 835x290x192mm', ' 13.5kg', '白色', '');
INSERT INTO `buproduct` VALUES ('25', 'PD201810011', '美的1.5匹空调', '', '13', '1000', '2299', 'mm', ' 880x290x230mm', '11kg', '白色', '');
INSERT INTO `buproduct` VALUES ('26', 'PD201810012', '奥克斯1.5匹空调', '', '13', '1000', '2899', 'mm', ' 860x545x315mm', ' 30kg', '金色', '');
INSERT INTO `buproduct` VALUES ('27', 'PD201810013', '全新机器', '', '14', '200', '1000', 'mm', '', '', '', '');
INSERT INTO `buproduct` VALUES ('28', 'PD201820001', '美的滚筒洗衣机', '', '15', '1000', '2599', 'mm', '595x560x850mm', '8kg', '玉兰白', '80kg');
INSERT INTO `buproduct` VALUES ('29', 'PD201820002', '海尔滚筒洗衣机', '', '15', '800', '1799', 'mm', '595x460x845mm', '7kg', '金秋色', '64kg');
INSERT INTO `buproduct` VALUES ('30', 'PD201820003', '美的洗烘一体机', '', '16', '1000', '2599', 'mm', '595x560x850mm', '8kg', '玉兰白', '75kg');
INSERT INTO `buproduct` VALUES ('31', 'PD201820004', '西门子洗烘一体机', '', '16', '2000', '4299', 'mm', '598x590x848mm', '8kg', '白色', '78kg');
INSERT INTO `buproduct` VALUES ('32', 'PD201820005', '海尔波轮洗衣机', '', '17', '7000', '11999', 'mm', '550x570x940mm', '8kg', '月光灰', '34kg');
INSERT INTO `buproduct` VALUES ('33', 'PD201820006', '小天鹅波轮洗衣机', '', '17', '800', '1099', 'mm', '645x649x1010mm', '8kg', '灰色', '39kg');
INSERT INTO `buproduct` VALUES ('34', 'PD201820007', '美的迷你洗衣机', '', '18', '500', '799', 'mm', '525x515x920mm', '5.5kg', '灰色', '33kg');
INSERT INTO `buproduct` VALUES ('35', 'PD201820008', '海尔迷你洗衣机', '', '18', '600', '899', 'mm', '580x590x990mm', '7.2kg', ' 灰色', '35kg');
INSERT INTO `buproduct` VALUES ('36', 'PD201820009', '美的烘干机', '', '19', '1000', '2599', 'mm', '595x560x850mm', '8kg', '玉兰白', '80kg');
INSERT INTO `buproduct` VALUES ('37', 'PD201820010', '西门子烘干机', '', '19', '5000', '7299', 'mm', '670x690x998mm', '9kg', '白色', '56kg');
INSERT INTO `buproduct` VALUES ('38', 'PD201820011', '洗衣机水管', '', '20', '5', '9.9', 'mm', '40-50mm', '', '', '');
INSERT INTO `buproduct` VALUES ('39', 'PD201830001', '海尔多门冰箱', '', '21', '2000', '4199', 'mm', '833x666x1825mm', '94kg', '香槟金色', '485L');
INSERT INTO `buproduct` VALUES ('40', 'PD201830002', '美的多门冰箱', '', '21', '800', '2999', 'mm', '625x673x1870mm', '86kg', '爵士棕', '319L');
INSERT INTO `buproduct` VALUES ('41', 'PD201830004', '容声对开门冰箱', '', '22', '1000', '2799', 'mm', '910x646x1786mm', '94kg', '珍珠白', '526L');
INSERT INTO `buproduct` VALUES ('42', 'PD2018320005', '美的三门冰箱', '', '23', '800', '1499', 'mm', '544x595x1759mm', '60kg', '阳光米', '213L');
INSERT INTO `buproduct` VALUES ('43', 'PD201830006', '海尔三门冰箱', '', '23', '1000', '2299', 'mm', '640x740x1870mm', '8kg', '灰色', '39L');
INSERT INTO `buproduct` VALUES ('44', 'PD201830007', '海尔双门冰箱', '', '24', '2000', '4399', 'mm', '525x515x920mm', '5.5kg', '灰色', '33L');
INSERT INTO `buproduct` VALUES ('45', 'PD201830008', '容声双开冰箱', '', '24', '1000', '2799', 'mm', '910x646x1786mm', '107kg', ' 珍珠白', '526L');
INSERT INTO `buproduct` VALUES ('46', 'PD201830009', '海尔冰柜', '', '25', '1000', '2599', 'mm', '570x560x880mm', '35kg', '玉兰白', '80L');
INSERT INTO `buproduct` VALUES ('47', 'PD201830010', '妮雪冰柜', '', '25', '800', '1549', 'mm', '2200x900x850mm', '87kg', '白色', '501L');
INSERT INTO `buproduct` VALUES ('48', 'PD201830009', '海澜酒柜', '', '26', '1000', '2780', '', '', '', '', '');
INSERT INTO `buproduct` VALUES ('49', 'PD201830009', '氟利昂', '', '27', '20', '75', '', '', '', '', '');
INSERT INTO `buproduct` VALUES ('50', 'PD201840001', '华帝油烟机', '', '28', '800', '1299', 'mm', '895x410x563mm', '19kg', '浅灰色', '');
INSERT INTO `buproduct` VALUES ('51', 'PD201840002', '美的油烟机', '', '28', '600', '899', 'mm', '625x673x1870mm', '20kg', '黑色', '');
INSERT INTO `buproduct` VALUES ('52', 'PD201840003', '苏泊尔燃气灶', '', '29', '200', '499', '', '', '', '天际银', '');
INSERT INTO `buproduct` VALUES ('53', 'PD201840004', '华帝燃气灶', '', '29', '100', '399', '', '', '', '珍珠白', '');
INSERT INTO `buproduct` VALUES ('54', 'PD201840005', '海尔烟灶套装', '', '30', '1000', '1349', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('55', 'PD201840006', '火星人集成灶', '', '31', '5000', '7699', 'mm', '960x720x1140mm', '82kg', '黑色', '57L');
INSERT INTO `buproduct` VALUES ('56', 'PD201840007', '康宝消毒柜', '', '32', '200', '439', '', '', '', '灰色', '');
INSERT INTO `buproduct` VALUES ('57', 'PD201840008', '美的洗碗机', '', '33', '800', '2899', '', '', '', ' 黑色', '');
INSERT INTO `buproduct` VALUES ('58', 'PD201840009', '海尔电热水器', '', '34', '800', '1149', '', '', '', '玉兰白', '');
INSERT INTO `buproduct` VALUES ('59', 'PD201840010', '阿诗丹顿电热水器', '', '34', '100', '238', '', '', '', '白色', '');
INSERT INTO `buproduct` VALUES ('60', 'PD201840011', '海尔燃气热水器', '', '35', '800', '1099', '', '', '', '拉丝银', '');
INSERT INTO `buproduct` VALUES ('61', 'PD201840012', '美的嵌入式烤箱', '', '36', '1000', '3999', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('62', 'PD201850001', '九阳破壁机', '', '37', '800', '1299', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('63', 'PD201850002', '美的电烤箱', '', '38', '80', '299', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('64', 'PD201850003', '苏泊尔电饭煲', '', '39', '80', '299', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('65', 'PD201850004', '苏泊尔电压力锅', '', '40', '60', '299', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('66', 'PD201850005', '飞利浦咖啡机', '', '41', '70', '219', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('67', 'PD201850006', '九阳豆浆机', '', '42', '100', '399', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('68', 'PD201850007', '三的料理机', '', '43', '30', '78', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('69', 'PD201850008', '苏泊尔电炖锅', '', '44', '20', '199', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('70', 'PD201850009', '利仁电饼铛', '', '45', '100', '499', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('71', 'PD201850010', '苏泊尔多用途锅', '', '46', '70', '299', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('72', 'PD201850011', '美的电热水壶', '', '47', '200', '500', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('73', 'PD201850012', '格兰仕微波炉机', '', '48', '500', '799', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('74', 'PD201850013', '美的榨汁', '', '49', '500', '899', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('75', 'PD201850014', '小熊养生壶', '', '50', '50', '200', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('76', 'PD201850015', '苏泊尔电磁炉', '', '51', '30', '199', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('77', 'PD201850016', '东菱面包机', '', '52', '200', '499', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('78', 'PD201850017', '九阳空气炸锅', '', '53', '1000', '4999', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('79', 'PD201850018', '九阳面条机', '', '54', '200', '799', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('80', 'PD201850019', '九阳电陶炉', '', '55', '200', '249', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('81', 'PD201850020', '小熊煮蛋器', '', '56', '20', '99', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('82', 'PD201850021', '莫飞电烧烤炉', '', '57', '700', '1090', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('83', 'PD201860001', '美的取暖电器', '', '58', '100', '429', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('84', 'PD201860002', '牧田除尘器', '', '59', '200', '557', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('85', 'PD201860003', '小米空气净化器', '', '60', '100', '1499', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('86', 'PD201860004', '米家扫地机器人', '', '61', '800', '1699', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('87', 'PD201860005', '科沃斯拖地机', '', '62', '700', '1099', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('88', 'PD201860006', '奥克斯干衣机', '', '63', '80', '169', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('89', 'PD201860007', '摩托罗拉电话机', '', '64', '80', '229', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('90', 'PD201860008', '美的饮水机', '', '65', '500', '989', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('91', 'PD201860009', '小米净水器', '', '66', '600', '1999', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('92', 'PD201860010', '百奥除湿器', '', '67', '800', '2480', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('93', 'PD201860011', '飞利浦熨斗', '', '68', '70', '129', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('94', 'PD201860012', '小熊加湿器', '', '69', '20', '79.9', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('95', 'PD201860013', '戴森电风扇', '', '70', '2000', '4950', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('96', 'PD201860014', '美的冷风扇', '', '71', '400', '799', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('97', 'PD201860015', '飞科毛球修剪器', '', '72', '15', '33', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('98', 'PD201860016', '滤网', '', '73', '19', '39', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('99', 'PD201870001', '飞科剃须刀', '', '74', '30', '99', '', '', '', '深蓝', '');
INSERT INTO `buproduct` VALUES ('100', 'PD201870002', 'kkc电动牙刷', '', '75', '20', '159', '', '', '', '粉色', '');
INSERT INTO `buproduct` VALUES ('101', 'PD201870003', '飞科电吹风', '', '76', '40', '69', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('102', 'PD201870004', '璐瑶按摩器', '', '77', '70', '149', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('103', 'PD201870005', '千选健康秤', '', '78', '5', '29.8', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('104', 'PD201870006', '奥克斯卷发器', '', '79', '29', '59.9', '', '', '', '粉色', '');
INSERT INTO `buproduct` VALUES ('105', 'PD201870007', '慕金脱毛器', '', '80', '800', '2299', '', '', '', '黑金', '');
INSERT INTO `buproduct` VALUES ('106', 'PD201870008', '飞科理发器', '', '81', '40', '69', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('107', 'PD201870009', '南极人足浴盆', '', '82', '80', '299', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('108', 'PD201870010', '康健源足疗机', '', '83', '60', '199', '', '', '', '金色', '');
INSERT INTO `buproduct` VALUES ('109', 'PD201870011', '金稻美容器', '', '84', '70', '198', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('110', 'PD201870012', '金稻洁面仪', '', '85', '70', '168', '', '', '', '粉色', '');
INSERT INTO `buproduct` VALUES ('111', 'PD201870013', '本博按摩椅', '', '86', '1000', '3198', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('112', 'PD201880001', '惠威家庭影院', '', '87', '3000', '5899', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('113', 'PD201870002', '新科KTV音响', '', '88', '400', '899', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('114', 'PD201870003', '先科迷你音响', '', '89', '70', '69.9', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('115', 'PD201870004', '先科DVD', '', '90', '1000', '69', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('116', 'PD201870005', '天龙功放', '', '91', '800', '2180', '', '', '', '黑', '');
INSERT INTO `buproduct` VALUES ('117', 'PD201870006', '小米回音壁', '', '92', '100', '399', '', '', '', '白色', '');
INSERT INTO `buproduct` VALUES ('118', 'PD2018700073', '音响插头', '', '93', '1', '7', '', '', '', '黑', '');

-- ----------------------------
-- Table structure for buproductdevelop
-- ----------------------------
DROP TABLE IF EXISTS `buproductdevelop`;
CREATE TABLE `buproductdevelop` (
  `productdevelop_id` int(11) NOT NULL AUTO_INCREMENT,
  `productdevelop_name` varchar(200) NOT NULL,
  `productmaster_id` int(11) NOT NULL,
  PRIMARY KEY (`productdevelop_id`),
  KEY `productmaster_id` (`productmaster_id`),
  CONSTRAINT `buproductdevelop_ibfk_1` FOREIGN KEY (`productmaster_id`) REFERENCES `buproductmaster` (`productmaster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buproductdevelop
-- ----------------------------
INSERT INTO `buproductdevelop` VALUES ('1', '曲面电视', '1');
INSERT INTO `buproductdevelop` VALUES ('2', '超薄电视', '1');
INSERT INTO `buproductdevelop` VALUES ('3', 'OLED电视', '1');
INSERT INTO `buproductdevelop` VALUES ('4', '4K超清电视', '1');
INSERT INTO `buproductdevelop` VALUES ('5', '55英寸', '1');
INSERT INTO `buproductdevelop` VALUES ('6', '65英寸', '1');
INSERT INTO `buproductdevelop` VALUES ('7', '电视配件', '1');
INSERT INTO `buproductdevelop` VALUES ('8', '壁挂式空调', '2');
INSERT INTO `buproductdevelop` VALUES ('9', '柜式空调', '2');
INSERT INTO `buproductdevelop` VALUES ('10', '中央空调', '2');
INSERT INTO `buproductdevelop` VALUES ('11', '一级能效空调', '2');
INSERT INTO `buproductdevelop` VALUES ('12', '变频空调', '2');
INSERT INTO `buproductdevelop` VALUES ('13', '1.5匹空调', '2');
INSERT INTO `buproductdevelop` VALUES ('14', '以旧换新', '2');
INSERT INTO `buproductdevelop` VALUES ('15', '滚筒洗衣机', '3');
INSERT INTO `buproductdevelop` VALUES ('16', '洗烘一体机', '3');
INSERT INTO `buproductdevelop` VALUES ('17', '波轮洗衣机', '3');
INSERT INTO `buproductdevelop` VALUES ('18', '迷你洗衣机', '3');
INSERT INTO `buproductdevelop` VALUES ('19', '烘干机', '3');
INSERT INTO `buproductdevelop` VALUES ('20', '洗衣机配件', '3');
INSERT INTO `buproductdevelop` VALUES ('21', '多门', '4');
INSERT INTO `buproductdevelop` VALUES ('22', '对开门', '4');
INSERT INTO `buproductdevelop` VALUES ('23', '三门', '4');
INSERT INTO `buproductdevelop` VALUES ('24', '双门', '4');
INSERT INTO `buproductdevelop` VALUES ('25', '冷柜/冰吧', '4');
INSERT INTO `buproductdevelop` VALUES ('26', '酒柜', '4');
INSERT INTO `buproductdevelop` VALUES ('27', '冰箱配件', '4');
INSERT INTO `buproductdevelop` VALUES ('28', '油烟机', '5');
INSERT INTO `buproductdevelop` VALUES ('29', '燃气灶', '5');
INSERT INTO `buproductdevelop` VALUES ('30', '烟灶套装', '5');
INSERT INTO `buproductdevelop` VALUES ('31', '集成灶', '5');
INSERT INTO `buproductdevelop` VALUES ('32', '消毒柜', '5');
INSERT INTO `buproductdevelop` VALUES ('33', '洗碗机', '5');
INSERT INTO `buproductdevelop` VALUES ('34', '电热水器', '5');
INSERT INTO `buproductdevelop` VALUES ('35', '燃气热水器', '5');
INSERT INTO `buproductdevelop` VALUES ('36', '嵌入式厨电', '5');
INSERT INTO `buproductdevelop` VALUES ('37', '破壁机', '6');
INSERT INTO `buproductdevelop` VALUES ('38', '电烤箱', '6');
INSERT INTO `buproductdevelop` VALUES ('39', '电饭煲', '6');
INSERT INTO `buproductdevelop` VALUES ('40', '电压力锅', '6');
INSERT INTO `buproductdevelop` VALUES ('41', '咖啡机', '6');
INSERT INTO `buproductdevelop` VALUES ('42', '豆浆机', '6');
INSERT INTO `buproductdevelop` VALUES ('43', '料理机', '6');
INSERT INTO `buproductdevelop` VALUES ('44', '电炖锅', '6');
INSERT INTO `buproductdevelop` VALUES ('45', '电饼铛', '6');
INSERT INTO `buproductdevelop` VALUES ('46', '多用途锅', '6');
INSERT INTO `buproductdevelop` VALUES ('47', '电水壶/热水瓶', '6');
INSERT INTO `buproductdevelop` VALUES ('48', '微波炉', '6');
INSERT INTO `buproductdevelop` VALUES ('49', '榨汁机/原汁机', '6');
INSERT INTO `buproductdevelop` VALUES ('50', '养生壶', '6');
INSERT INTO `buproductdevelop` VALUES ('51', '电磁炉', '6');
INSERT INTO `buproductdevelop` VALUES ('52', '面包机', '6');
INSERT INTO `buproductdevelop` VALUES ('53', '空气炸锅', '6');
INSERT INTO `buproductdevelop` VALUES ('54', '面条机', '6');
INSERT INTO `buproductdevelop` VALUES ('55', '电陶炉', '6');
INSERT INTO `buproductdevelop` VALUES ('56', '煮蛋器', '6');
INSERT INTO `buproductdevelop` VALUES ('57', '电烧烤炉', '6');
INSERT INTO `buproductdevelop` VALUES ('58', '取暖电器', '7');
INSERT INTO `buproductdevelop` VALUES ('59', '吸尘器/除螨仪', '7');
INSERT INTO `buproductdevelop` VALUES ('60', '空气净化器', '7');
INSERT INTO `buproductdevelop` VALUES ('61', '扫地机器人', '7');
INSERT INTO `buproductdevelop` VALUES ('62', '蒸汽拖把/拖地机', '7');
INSERT INTO `buproductdevelop` VALUES ('63', '干衣机', '7');
INSERT INTO `buproductdevelop` VALUES ('64', '电话机', '7');
INSERT INTO `buproductdevelop` VALUES ('65', '饮水机', '7');
INSERT INTO `buproductdevelop` VALUES ('66', '净水器', '7');
INSERT INTO `buproductdevelop` VALUES ('67', '除湿机', '7');
INSERT INTO `buproductdevelop` VALUES ('68', '挂烫机/熨斗', '7');
INSERT INTO `buproductdevelop` VALUES ('69', '加湿器', '7');
INSERT INTO `buproductdevelop` VALUES ('70', '电风扇', '7');
INSERT INTO `buproductdevelop` VALUES ('71', '冷风扇', '7');
INSERT INTO `buproductdevelop` VALUES ('72', '毛球修剪器', '7');
INSERT INTO `buproductdevelop` VALUES ('73', '生活电器配件', '7');
INSERT INTO `buproductdevelop` VALUES ('74', '剃须刀', '8');
INSERT INTO `buproductdevelop` VALUES ('75', '电动牙刷', '8');
INSERT INTO `buproductdevelop` VALUES ('76', '电吹风', '8');
INSERT INTO `buproductdevelop` VALUES ('77', '按摩器', '8');
INSERT INTO `buproductdevelop` VALUES ('78', '健康秤', '8');
INSERT INTO `buproductdevelop` VALUES ('79', '卷/直发器', '8');
INSERT INTO `buproductdevelop` VALUES ('80', '剃/脱毛器', '8');
INSERT INTO `buproductdevelop` VALUES ('81', '理发器', '8');
INSERT INTO `buproductdevelop` VALUES ('82', '足浴盆', '8');
INSERT INTO `buproductdevelop` VALUES ('83', '足疗机', '8');
INSERT INTO `buproductdevelop` VALUES ('84', '美容器', '8');
INSERT INTO `buproductdevelop` VALUES ('85', '洁面仪', '8');
INSERT INTO `buproductdevelop` VALUES ('86', '按摩椅', '8');
INSERT INTO `buproductdevelop` VALUES ('87', '家庭影院', '9');
INSERT INTO `buproductdevelop` VALUES ('88', 'KTV音响', '9');
INSERT INTO `buproductdevelop` VALUES ('89', '迷你音响', '9');
INSERT INTO `buproductdevelop` VALUES ('90', 'DVD', '9');
INSERT INTO `buproductdevelop` VALUES ('91', '功放', '9');
INSERT INTO `buproductdevelop` VALUES ('92', '回音壁', '9');
INSERT INTO `buproductdevelop` VALUES ('93', '影音配件', '9');

-- ----------------------------
-- Table structure for buproductmaster
-- ----------------------------
DROP TABLE IF EXISTS `buproductmaster`;
CREATE TABLE `buproductmaster` (
  `productmaster_id` int(11) NOT NULL AUTO_INCREMENT,
  `productmaster_name` varchar(200) NOT NULL,
  PRIMARY KEY (`productmaster_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of buproductmaster
-- ----------------------------
INSERT INTO `buproductmaster` VALUES ('1', '电视');
INSERT INTO `buproductmaster` VALUES ('2', '空调');
INSERT INTO `buproductmaster` VALUES ('3', '洗衣机');
INSERT INTO `buproductmaster` VALUES ('4', '冰箱');
INSERT INTO `buproductmaster` VALUES ('5', '厨卫大电');
INSERT INTO `buproductmaster` VALUES ('6', '厨房小电');
INSERT INTO `buproductmaster` VALUES ('7', '生活电器');
INSERT INTO `buproductmaster` VALUES ('8', '个护健康');
INSERT INTO `buproductmaster` VALUES ('9', '家庭影音');

-- ----------------------------
-- Table structure for burole
-- ----------------------------
DROP TABLE IF EXISTS `burole`;
CREATE TABLE `burole` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  `role_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of burole
-- ----------------------------
INSERT INTO `burole` VALUES ('1', '管理员', '管理一切后台信息');
INSERT INTO `burole` VALUES ('2', '经理', '管理员工部门信息');
INSERT INTO `burole` VALUES ('3', '销售人员', '销售服务');
INSERT INTO `burole` VALUES ('4', '售后人员', '售后服务');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phnone` varchar(45) DEFAULT NULL,
  `address` varchar(45) NOT NULL,
  `level` int(11) DEFAULT NULL COMMENT '1为vip',
  `link_man` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customer_id_UNIQUE` (`customer_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'CT0100001', '高洪续', '15653291562', '家', '1', '');
INSERT INTO `customer` VALUES ('2', 'CT0100002', 'leo', '110', '家', '1', '');
INSERT INTO `customer` VALUES ('3', 'CT0100003', 'coulson', '120', '宿舍', '0', '');
INSERT INTO `customer` VALUES ('4', 'CT0200001', '青岛大学', '', '宁夏路188', '1', '');
INSERT INTO `customer` VALUES ('7', 'CT0200002', '青科大', null, '松岭路', '1', null);

-- ----------------------------
-- Table structure for custom_order
-- ----------------------------
DROP TABLE IF EXISTS `custom_order`;
CREATE TABLE `custom_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(45) NOT NULL,
  `product_num` varchar(45) NOT NULL,
  `custom_num` varchar(45) NOT NULL,
  `order_time` varchar(45) NOT NULL,
  `order_channel` varchar(45) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit_price` varchar(45) NOT NULL,
  `saler_num` varchar(45) NOT NULL,
  `activity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `orderNum_UNIQUE` (`order_num`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom_order
-- ----------------------------
INSERT INTO `custom_order` VALUES ('1', 'OD20181200001', 'PD201800003', 'CT0100001', '2018-12-07 10:22', '官方商城', '3', '10', 'EM00001', '1');
INSERT INTO `custom_order` VALUES ('2', 'OD20181200002', 'PD201800008', 'CT0100002', '2018-12-07 10:22', '官方商城', '3', '10', 'EM00003', '1');
INSERT INTO `custom_order` VALUES ('3', 'OD20181200003', 'PD201810002', 'CT0100003', '2018-12-07 10:22', '官方商城', '3', '10.99', 'EM00001', '2');
INSERT INTO `custom_order` VALUES ('4', 'OD20181200004', 'PD201810010', 'CT0100001', '2018-12-07 10:22', '官方商城', '6', '25', 'EM00002', '1');
INSERT INTO `custom_order` VALUES ('5', 'OD20181200005', 'PD201800008', 'CT0100002', '2018-12-07 10:22', '加盟实体店', '3', '1999', 'EM00001', '1');
INSERT INTO `custom_order` VALUES ('6', 'OD20181200006', 'PD201810010', 'CT0200001', '2018-12-07 10:22', '电商自营店', '300', '10.99', 'EM00001', '1');
INSERT INTO `custom_order` VALUES ('7', 'OD20181200007', 'PD201820005', 'CT0200002', '2018-12-07 10:22', '加盟实体店', '26', '30', 'EM00002', '1');
INSERT INTO `custom_order` VALUES ('8', 'OD20181200008', 'PD201810002', 'CT0100001', '2018-12-07 10:22', '自营实体店', '30', '70', 'EM00001', '1');
INSERT INTO `custom_order` VALUES ('9', 'OD20181200009', 'PD201820005', 'CT0100002', '2018-12-07 10:22', '官方商城', '3', '10', 'EM00003', '1');
INSERT INTO `custom_order` VALUES ('10', 'OD20181200010', 'PD201830009', 'CT0100003', '2018-12-07 10:22', '官方商城', '3', '10.99', 'EM00001', '2');
INSERT INTO `custom_order` VALUES ('11', 'OD20181200011', 'PD201810010', 'CT0100001', '2018-12-07 10:22', '电商自营店', '3', '23', 'EM00002', '1');
INSERT INTO `custom_order` VALUES ('12', 'OD20181200012', 'PD201830009', 'CT0100002', '2018-12-07 10:22', '加盟实体店', '3', '10.99', 'EM00001', '1');
INSERT INTO `custom_order` VALUES ('13', 'OD20181200013', 'PD201830009', 'CT0200001', '2018-12-07 10:22', '电商自营店', '300', '50', 'EM00001', '1');
INSERT INTO `custom_order` VALUES ('14', 'OD20181200014', 'PD201820005', 'CT0200002', '2018-12-07 10:22', '自营实体店', '260', '78', 'EM00002', '1');
INSERT INTO `custom_order` VALUES ('15', 'OD20181200015', 'PD201810010', 'CT0100001', '2018-12-07 10:22', '电商自营店', '4', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('16', 'OD20181200016', 'PD201810010', 'CT0100001', '2018-12-07 10:22', '加盟实体店', '5', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('17', 'OD20181200017', 'PD201810010', 'CT0100001', '2018-12-07 10:22', '电商自营店', '3', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('18', 'OD20181200018', 'PD201810010', 'CT0100002', '2018-12-07 10:22', '加盟实体店', '2', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('19', 'OD20181200019', 'PD201810010', 'CT0100002', '2018-12-07 10:22', '电商自营店', '1', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('20', 'OD20190100001', 'PD201810010', 'CT0100001', '2019-01-01 08:30', '电商自营店', '2', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('21', 'OD20190100002', 'PD201810010', 'CT0100002', '2019-01-01 08:30', '官方商城', '2', '10.99', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('22', 'OD20190100003', 'PD201810010', 'CT0100001', '2019-01-01 08:30', '官方商城', '2', '10.99', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('23', 'OD20190100004', 'PD201810010', 'CT0100002', '2019-01-01 08:30', '电商自营店', '2', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('24', 'OD20190100005', 'PD201810010', 'CT0100001', '2019-01-01 08:30', '官方商城', '2', '10.99', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('25', 'OD20181100001', 'PD201820005', 'CT0200002', '2018-11-27 09:43', '自营实体店', '3', '10.99', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('26', 'OD20181100002', 'PD201820005', 'CT0100001', '2018-11-27 09:43', '电商自营店', '3', '23', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('27', 'OD20181100003', 'PD201830009', 'CT0100001', '2018-11-27 09:43', '电商自营店', '3', '10.99', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('28', 'OD20181100004', 'PD201820005', 'CT0200002', '2018-11-27 09:43', '自营实体店', '300', '50', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('29', 'OD20181100005', 'PD201830009', 'CT0100001', '2018-11-27 09:43', '电商自营店', '260', '78', 'EM00003', null);
INSERT INTO `custom_order` VALUES ('30', 'OD20181100006', 'PD201810010', 'CT0100001', '2018-11-03 19:43', '自营实体店', '6', '25', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('31', 'OD20181100007', 'PD201800008', 'CT0100002', '2018-11-03 19:43', '电商自营店', '3', '1999', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('32', 'OD20181100008', 'PD201810010', 'CT0200001', '2018-11-03 19:43', '加盟实体店', '300', '10.99', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('33', 'OD20181100009', 'PD201820005', 'CT0200002', '2018-11-03 19:43', '电商自营店', '26', '30', 'EM00002', null);
INSERT INTO `custom_order` VALUES ('34', 'OD20181100010', 'PD201810002', 'CT0100001', '2018-11-03 19:43', '加盟实体店', '30', '70', 'EM00001', null);
INSERT INTO `custom_order` VALUES ('35', 'OD20181100011', 'PD201820005', 'CT0100002', '2018-11-03 19:43', '电商自营店', '3', '10', 'EM00003', null);

-- ----------------------------
-- Table structure for employee_con_role
-- ----------------------------
DROP TABLE IF EXISTS `employee_con_role`;
CREATE TABLE `employee_con_role` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee_con_role
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '顾客信息', null, null);
INSERT INTO `permission` VALUES ('2', '产品信息', null, null);
INSERT INTO `permission` VALUES ('3', '部门信息', null, null);
INSERT INTO `permission` VALUES ('4', '订单信息', null, null);
INSERT INTO `permission` VALUES ('5', '服务信息', null, null);
INSERT INTO `permission` VALUES ('6', '人员管理', null, null);
INSERT INTO `permission` VALUES ('7', '部门管理', null, null);
INSERT INTO `permission` VALUES ('8', '产品管理', null, null);
INSERT INTO `permission` VALUES ('9', '顾客管理', null, null);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '1');
INSERT INTO `role_permission` VALUES ('2', '1', '2');
INSERT INTO `role_permission` VALUES ('3', '1', '3');
INSERT INTO `role_permission` VALUES ('4', '1', '4');
INSERT INTO `role_permission` VALUES ('5', '1', '5');
INSERT INTO `role_permission` VALUES ('6', '2', '1');
INSERT INTO `role_permission` VALUES ('7', '2', '3');
INSERT INTO `role_permission` VALUES ('8', '2', '4');
INSERT INTO `role_permission` VALUES ('9', '2', '2');
INSERT INTO `role_permission` VALUES ('10', '2', '6');
INSERT INTO `role_permission` VALUES ('11', '3', '3');
INSERT INTO `role_permission` VALUES ('12', '3', '1');
INSERT INTO `role_permission` VALUES ('13', '3', '2');
INSERT INTO `role_permission` VALUES ('14', '3', '3');
INSERT INTO `role_permission` VALUES ('15', '3', '4');
INSERT INTO `role_permission` VALUES ('16', '4', '4');
INSERT INTO `role_permission` VALUES ('17', '4', '5');
INSERT INTO `role_permission` VALUES ('18', '1', '6');
INSERT INTO `role_permission` VALUES ('19', '4', '1');
INSERT INTO `role_permission` VALUES ('20', '2', '7');
INSERT INTO `role_permission` VALUES ('21', '2', '8');
INSERT INTO `role_permission` VALUES ('22', '1', '7');
INSERT INTO `role_permission` VALUES ('23', '1', '8');
INSERT INTO `role_permission` VALUES ('24', '3', '9');
INSERT INTO `role_permission` VALUES ('25', '2', '9');
