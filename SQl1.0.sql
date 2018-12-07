drop database Company;
CREATE DATABASE IF NOT EXISTS Company DEFAULT CHARACTER SET utf8;
use Company;
CREATE TABLE `custom_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` varchar(45) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('1', 'OD20181200001', 'CT0100001', '2018-12-07 10:22', '官方商城', '3', '10', 'EM00001', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('2', 'OD20181200002', 'CT0100002', '2018-12-07 10:22', '官方商城', '3', '10', 'EM00003', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('3', 'OD20181200003', 'CT0100003', '2018-12-07 10:22', '官方商城', '3', '10.99', 'EM00001', '2');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('4', 'OD20181200004', 'CT0100001', '2018-12-07 10:22', '电商自营店', '3', '23', 'EM00002', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('5', 'OD20181200005', 'CT0100002', '2018-12-07 10:22', '加盟实体店', '3', '10.99', 'EM00001', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('6', 'OD20181200006', 'CT0200001', '2018-12-07 10:22', '电商自营店', '300', '10.99', 'EM00001', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('7', 'OD20181200007', 'CT0200002', '2018-12-07 10:22', '自营实体店', '260', '30', 'EM00002', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('8', 'OD20181200008', 'CT0100001', '2018-12-07 10:22', '官方商城', '3', '10', 'EM00001', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('9', 'OD20181200009', 'CT0100002', '2018-12-07 10:22', '官方商城', '3', '10', 'EM00003', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('10', 'OD20181200010', 'CT0100003', '2018-12-07 10:22', '官方商城', '3', '10.99', 'EM00001', '2');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('11', 'OD20181200011', 'CT0100001', '2018-12-07 10:22', '电商自营店', '3', '23', 'EM00002', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('12', 'OD20181200012', 'CT0100002', '2018-12-07 10:22', '加盟实体店', '3', '10.99', 'EM00001', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('13', 'OD20181200013', 'CT0200001', '2018-12-07 10:22', '电商自营店', '300', '10.99', 'EM00001', '1');
INSERT INTO `company`.`custom_order` (`id`, `order_num`, `custom_num`, `order_time`, `order_channel`, `amount`, `unit_price`, `saler_num`, `activity`) VALUES ('14', 'OD20181200014', 'CT0200002', '2018-12-07 10:22', '自营实体店', '260', '30', 'EM00002', '1');
