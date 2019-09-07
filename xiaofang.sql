/*
Navicat MySQL Data Transfer

Source Server         : XF
Source Server Version : 50126
Source Host           : localhost:3306
Source Database       : xiaofang

Target Server Type    : MYSQL
Target Server Version : 50126
File Encoding         : 65001

Date: 2019-09-07 18:11:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for akl_block
-- ----------------------------
DROP TABLE IF EXISTS `akl_block`;
CREATE TABLE `akl_block` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `name` varchar(255) DEFAULT '' COMMENT '地块名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `status` varchar(50) DEFAULT NULL COMMENT '状态:是否有效',
  `pointx` varchar(255) DEFAULT NULL COMMENT '经度',
  `pointy` varchar(255) DEFAULT NULL COMMENT '纬度',
  `provice_id` varchar(50) DEFAULT NULL COMMENT '地址省',
  `city_id` varchar(50) DEFAULT NULL COMMENT '地址市',
  `address` varchar(255) DEFAULT NULL COMMENT '详细地址',
  `user_id` varchar(255) DEFAULT '' COMMENT '归属用户',
  `blockProduct` varchar(2000) DEFAULT '' COMMENT '地块生产潜力',
  `blockLimit` varchar(2000) DEFAULT '' COMMENT '限制因素',
  `suitPlant` varchar(2000) DEFAULT '' COMMENT '适合种植的品种;多个以逗号隔开',
  `monitorSite` varchar(255) DEFAULT '' COMMENT '监测站点',
  `field01` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field02` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field03` varchar(50) DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地块信息表';

-- ----------------------------
-- Records of akl_block
-- ----------------------------
INSERT INTO `akl_block` VALUES ('5ed61cebf3b14fdc8727b2f5fa42ba29', '新疆阿勒泰', '2018-10-21 09:11:56', '975c0ddeffa4453681898ebb0d0274f7', 'enabled', '88.126151', '47.852783', '650000', '654300', '', '6789e4c5bff54efcacc0cbcc7f42a4de', '中等', '', '', 'HT0003', null, null, null);

-- ----------------------------
-- Table structure for akl_block_param
-- ----------------------------
DROP TABLE IF EXISTS `akl_block_param`;
CREATE TABLE `akl_block_param` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `name` varchar(255) DEFAULT '' COMMENT '土质名称',
  `block_id` varchar(255) DEFAULT NULL COMMENT '地块ID',
  `ph` decimal(9,2) DEFAULT '0.00' COMMENT 'PH值',
  `phlevel` varchar(255) DEFAULT '' COMMENT 'PH等级',
  `TotalN` decimal(9,2) DEFAULT '0.00' COMMENT '氮值',
  `TotalNLevel` varchar(255) DEFAULT '' COMMENT '氮值等级',
  `AvailableP` decimal(9,2) DEFAULT '0.00' COMMENT '磷值',
  `AvailablePLevel` varchar(255) DEFAULT '' COMMENT '磷等级',
  `AvailableK` decimal(9,2) DEFAULT '0.00' COMMENT '钾值',
  `AvailableKLevel` varchar(255) DEFAULT '' COMMENT '钾等级',
  `SOM` decimal(9,2) DEFAULT '0.00' COMMENT '有机质值',
  `SOMLevel` varchar(255) DEFAULT '' COMMENT '有机质等级',
  `field01` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field02` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field03` varchar(50) DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='土壤参数表';

-- ----------------------------
-- Records of akl_block_param
-- ----------------------------

-- ----------------------------
-- Table structure for akl_block_track
-- ----------------------------
DROP TABLE IF EXISTS `akl_block_track`;
CREATE TABLE `akl_block_track` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `block_id` varchar(255) DEFAULT NULL COMMENT '地块ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `zwfz` varchar(500) DEFAULT '' COMMENT '作物发展阶段',
  `bchyj` varchar(500) DEFAULT '' COMMENT '病虫害预警',
  `bcfzfa` varchar(500) DEFAULT '' COMMENT '病虫防治方案',
  `yjshsj` varchar(500) DEFAULT '' COMMENT '预计收获时间',
  `bzgzjy` varchar(500) DEFAULT '' COMMENT '本周工作建议',
  `field01` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field02` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field03` varchar(50) DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地块监控信息表';

-- ----------------------------
-- Records of akl_block_track
-- ----------------------------

-- ----------------------------
-- Table structure for akl_cost
-- ----------------------------
DROP TABLE IF EXISTS `akl_cost`;
CREATE TABLE `akl_cost` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `block_id` varchar(255) DEFAULT NULL COMMENT '地块ID',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `tsUnitPrice` decimal(9,2) DEFAULT '0.00' COMMENT '碳酸氢铵单价',
  `tsNormalUse` decimal(9,2) DEFAULT '0.00' COMMENT '碳酸氢铵：传统使用量(吨)',
  `tsAKLUse` decimal(9,2) DEFAULT '0.00' COMMENT '碳酸氢铵：爱科农使用量(吨)',
  `fhfUnitPrice` decimal(9,2) DEFAULT '0.00' COMMENT '复合肥单价',
  `fhfNormalUse` decimal(9,2) DEFAULT '0.00' COMMENT '复合肥：传统使用量(吨)',
  `fhfAKLUse` decimal(9,2) DEFAULT '0.00' COMMENT '复合肥：爱科农使用量(吨)',
  `NormalCost` decimal(9,2) DEFAULT '0.00' COMMENT '传统 每公顷成本（传统 碳酸单价*数量+传统复合肥单价*使用量）',
  `AKLCost` decimal(9,2) DEFAULT '0.00' COMMENT '爱科农 每公顷成本（爱科农 碳酸单价*数量+爱科农复合肥单价*使用量）',
  `field01` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field02` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field03` varchar(50) DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成本数据配置表';

-- ----------------------------
-- Records of akl_cost
-- ----------------------------

-- ----------------------------
-- Table structure for akl_income
-- ----------------------------
DROP TABLE IF EXISTS `akl_income`;
CREATE TABLE `akl_income` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `block_id` varchar(255) DEFAULT NULL COMMENT '地块ID',
  `time` datetime DEFAULT NULL COMMENT '时间',
  `UnitPrice` decimal(9,2) DEFAULT '0.00' COMMENT '农作物单价',
  `NormalProduct` decimal(9,2) DEFAULT '0.00' COMMENT '传统方案产量',
  `AKLProduct` decimal(9,2) DEFAULT '0.00' COMMENT '爱科农方案产量',
  `NormalIncome` decimal(9,2) DEFAULT '0.00' COMMENT '传统 收益（单价*传统产量）',
  `AKLIncome` decimal(9,2) DEFAULT '0.00' COMMENT '爱科农 收益（单价*爱科农产量）',
  `field01` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field02` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field03` varchar(50) DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收益数据配置表';

-- ----------------------------
-- Records of akl_income
-- ----------------------------

-- ----------------------------
-- Table structure for bsxf_check_history
-- ----------------------------
DROP TABLE IF EXISTS `bsxf_check_history`;
CREATE TABLE `bsxf_check_history` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `equipment_id` varchar(255) DEFAULT NULL COMMENT '关联设备id',
  `comments` varchar(255) DEFAULT NULL COMMENT '备注',
  `check_user_id` varchar(255) DEFAULT NULL COMMENT '巡检员',
  `check_time` datetime DEFAULT NULL COMMENT '巡检时间',
  `status` varchar(255) DEFAULT NULL COMMENT '有效状态（删除时更改）：enabled; disabled',
  `runStatus` varchar(255) DEFAULT NULL COMMENT '状态：1-正常工作；2-运行异常',
  `field01` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `field02` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `field03` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`id`),
  KEY `equipment_id_index` (`equipment_id`),
  KEY `check_user_id_index` (`check_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bsxf_check_history
-- ----------------------------

-- ----------------------------
-- Table structure for bsxf_equipment
-- ----------------------------
DROP TABLE IF EXISTS `bsxf_equipment`;
CREATE TABLE `bsxf_equipment` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `equipment_type_id` varchar(50) DEFAULT NULL COMMENT '设备类型:现在就灭火器一个',
  `sub_type_id` varchar(50) DEFAULT NULL COMMENT '灭火器类别：1: 4Kg干粉',
  `name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `eno` varchar(255) DEFAULT NULL COMMENT '设备编号',
  `area` varchar(255) DEFAULT NULL COMMENT '区域',
  `location` varchar(255) DEFAULT NULL COMMENT '位置',
  `comments` varchar(255) DEFAULT NULL COMMENT '详细描述',
  `status` varchar(255) DEFAULT NULL COMMENT '有效状态（删除时更改）：enabled; disabled',
  `runStatus` varchar(255) DEFAULT NULL COMMENT '状态：1-正常工作；2-运行异常',
  `effDate` datetime DEFAULT NULL COMMENT '有效起期',
  `expDate` datetime DEFAULT NULL COMMENT '有效止期',
  `checkFreq` int(11) DEFAULT NULL COMMENT '巡检频率:1-每月一次；2-半月1次；3-10天每次；4-每周一次',
  `remainNum` int(11) DEFAULT NULL COMMENT '每月剩余巡检次数,在下个月时会将这个字段复制到lastremainNum字段，这个字段重置',
  `lastRemainNum` int(11) DEFAULT NULL COMMENT '上月剩余巡检次数',
  `check_user_id` varchar(50) DEFAULT NULL COMMENT '巡检负责人',
  `pointx` varchar(50) DEFAULT NULL COMMENT '经度',
  `pointy` varchar(50) DEFAULT NULL COMMENT '纬度',
  `field01` varchar(50) DEFAULT NULL COMMENT '扩展字段1',
  `field02` varchar(50) DEFAULT NULL COMMENT '扩展字段2',
  `field03` varchar(50) DEFAULT NULL COMMENT '扩展字段3',
  PRIMARY KEY (`id`),
  KEY `equipment_type_id_index` (`equipment_type_id`),
  KEY `eno_index` (`eno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bsxf_equipment
-- ----------------------------
INSERT INTO `bsxf_equipment` VALUES ('9221ea2c3ae042b39a4d48f302c3174d', '2019-09-07 17:52:55', null, 'cd0154dddbff4c6786bb7859cb03ed28', null, '1', '1', 'test1', 'No1', '新吴区', '新安', '11111', 'enabled', '1', '2019-09-01 00:00:00', '2020-09-30 00:00:00', '1', '0', '0', '242836a8123a4c829707527845e337cb', '65.20002', '51.546028', null, null, null);

-- ----------------------------
-- Table structure for data
-- ----------------------------
DROP TABLE IF EXISTS `data`;
CREATE TABLE `data` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `data_time` datetime DEFAULT NULL,
  `gateway_logo` varchar(50) DEFAULT NULL,
  `sensor_name` int(11) DEFAULT NULL,
  `channel_name` int(11) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `up_state` int(11) DEFAULT NULL,
  `equip_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data
-- ----------------------------
INSERT INTO `data` VALUES ('1', '2014-07-08 00:03:09', '192.168.0.22', '1', '4', '19', '0', 'c4c44c4ef76c473aa085a484390098cc');
INSERT INTO `data` VALUES ('2', '2014-07-26 00:03:57', '192.168.0.22', '1', '242', '2.99', '0', 'c4c44c4ef76c473aa085a484390098cc');
INSERT INTO `data` VALUES ('3', '2014-07-26 00:09:51', '192.168.0.22', '2', '4', '31', '0', '0fa751a7a2294ab9a6ba058cd2a75d5f');

-- ----------------------------
-- Table structure for ec_category
-- ----------------------------
DROP TABLE IF EXISTS `ec_category`;
CREATE TABLE `ec_category` (
  `status` varchar(32) NOT NULL,
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `like_id` varchar(128) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ec_category
-- ----------------------------
INSERT INTO `ec_category` VALUES ('enabled', '01324530d7c74c089c9778bcabce697b', '单鞋', '000000060000000300000002', '1', 'ea0c6fc62d0643e5ab3b140c1ffc2525');
INSERT INTO `ec_category` VALUES ('enabled', '0219f2a8a0dd4d5b9740dc113ae0553b', '服装', '00000001', '0', '0');
INSERT INTO `ec_category` VALUES ('enabled', '07b6f8f9a9714dab9fd4641c9ddc8d6a', '玩具/模型/动漫/早教/益智', '00000004', '3', '0');
INSERT INTO `ec_category` VALUES ('enabled', '0dda7c80c5e5490aa089d1938f21043b', '卫衣/绒衫', '0000000600000015', '14', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '0ee2fddb72e740c58969762bbda40660', '夹克/皮衣', '000000060000000200000006', '5', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category` VALUES ('enabled', '0f30300c1cd240f9af461d4e1f5ef7aa', '儿童配饰/发饰', '0000000600000008', '7', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '2cd163fc4faf4c9ab2205abf0528ad9a', '箱包配饰', '00000002', '1', '0');
INSERT INTO `ec_category` VALUES ('enabled', '2e00abaa99b244dfb62ca5a388c4ea6e', '风衣', '000000060000000200000002', '1', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category` VALUES ('enabled', '3604343058b9435b9820093149cdf839', '男包', '0000000200000002', '1', '2cd163fc4faf4c9ab2205abf0528ad9a');
INSERT INTO `ec_category` VALUES ('enabled', '3ec44d6a5bba4296b43fcbd308402fa0', '外套/夹克/大衣', '0000000600000002', '1', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '42c7958de9ff442192b66d75089d2a02', '尿片/洗护/喂哺/推车床', '00000005', '4', '0');
INSERT INTO `ec_category` VALUES ('enabled', '448b662e91bd4b59b2ec9b2c477f695e', '儿童玩具其他', '0000000700000002', '1', '91f4fc1e2c5442db876b5e128dd2de9c');
INSERT INTO `ec_category` VALUES ('enabled', '46d0779c7a864940ab307f1d7d6bc730', '马甲/背心', '0000000600000012', '11', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '474e6f8b5a7347e6a824b0f639a8b544', '其它', '0000000600000009', '8', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '48904af60cce40138cca7b103d28e69e', '靴子/雪地靴', '000000060000000300000001', '0', 'ea0c6fc62d0643e5ab3b140c1ffc2525');
INSERT INTO `ec_category` VALUES ('enabled', '48daf0f4c4f6464cadb9b20b362c5dd3', 'T恤/吊带衫', '0000000600000006', '5', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '4975dcec1b4e4fff89f4d9d6212895a9', '棉袄/棉服', '0000000600000007', '6', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '535d96f5a110468896b90fae0e51b3f8', '儿童泳衣/裤', '0000000600000016', '15', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '539b1b84da27489b9f34bd3d61693307', '雨具', '000000050000000100000001', '0', 'eef81085e4ba406aa027c51331128d31');
INSERT INTO `ec_category` VALUES ('enabled', '5587bbbd27184572af59f33d7d0d615e', '帽子/围巾/口罩/手套/耳套/脚套', '0000000600000001', '0', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '5ca0eecc59d34e2296058ff1cc307ad0', '普通外套', '000000060000000200000003', '2', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category` VALUES ('enabled', '615840079e27449d9cc1ce4d2e980b17', '其它', '000000060000000200000001', '0', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category` VALUES ('enabled', '6503bb7e029542cab70ef5459f46b376', '衬衫', '0000000600000013', '12', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '6a2b3a98fcb249b2bb67fa51442c8c83', '帽子', '000000060000000100000001', '0', '5587bbbd27184572af59f33d7d0d615e');
INSERT INTO `ec_category` VALUES ('enabled', '6c64cebdebd94a8fbe284b2fbefad803', '男装', '0000000100000008', '1', '0219f2a8a0dd4d5b9740dc113ae0553b');
INSERT INTO `ec_category` VALUES ('enabled', '72659899e05042f9af75a7720830f9f7', '女童裙装', '0000000600000011', '10', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '7520ac1d56f640dda97ae3b75e9dddf3', '童装/童鞋/亲子装', '00000003', '2', '0');
INSERT INTO `ec_category` VALUES ('enabled', '806894ef9bad419a8f62ef5081e9d718', '套装', '0000000600000004', '3', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', '83eece47f49548cd8ae668e09bc72098', '早教/音乐/智能玩具', '0000000700000001', '0', '91f4fc1e2c5442db876b5e128dd2de9c');
INSERT INTO `ec_category` VALUES ('enabled', '91f4fc1e2c5442db876b5e128dd2de9c', '玩具/模型/动漫/早教/益智', '00000007', '6', '0');
INSERT INTO `ec_category` VALUES ('enabled', '926338a5c0eb4684a06f8481c2aaeadf', '童装/童鞋/亲子装', '00000006', '5', '0');
INSERT INTO `ec_category` VALUES ('enabled', '9ab7009cc2b94289bce66ad952260941', '休闲', '000000020000000200000001', '0', '3604343058b9435b9820093149cdf839');
INSERT INTO `ec_category` VALUES ('enabled', 'b2ff29b7fe014eecb5c6368d8c06fec7', '手套', '000000060000000100000003', '2', '5587bbbd27184572af59f33d7d0d615e');
INSERT INTO `ec_category` VALUES ('enabled', 'b91d32db897447b2b6ee2872c8d9c6ce', '西服/小西装', '000000060000000200000004', '3', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category` VALUES ('enabled', 'c987838e45944af8bc51cdfb05030b1d', '女装', '0000000100000007', '0', '0219f2a8a0dd4d5b9740dc113ae0553b');
INSERT INTO `ec_category` VALUES ('enabled', 'cad84b58c32749e596c5ef4ff28eda64', '板鞋', '000000020000000200000002', '1', '3604343058b9435b9820093149cdf839');
INSERT INTO `ec_category` VALUES ('enabled', 'cb107aaccf4947029588aecebd0428b9', '早教书籍', '000000070000000100000001', '0', '83eece47f49548cd8ae668e09bc72098');
INSERT INTO `ec_category` VALUES ('enabled', 'cbd54f8f1b184228b5e732d608378f62', '围巾', '000000060000000100000002', '1', '5587bbbd27184572af59f33d7d0d615e');
INSERT INTO `ec_category` VALUES ('enabled', 'cf684a2dfcb248e582fb41df2a926610', '羽绒服/羽绒内胆', '0000000600000014', '13', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', 'd094a60eee574a3280e4f7e9ae51cec4', '童装裤子', '0000000600000010', '9', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', 'd66068e2daf6436e9252a39687a510a9', '女包', '0000000200000004', '3', '2cd163fc4faf4c9ab2205abf0528ad9a');
INSERT INTO `ec_category` VALUES ('enabled', 'd9a166cde2ff481db98c1436664a11db', '帆布鞋', '000000060000000300000003', '2', 'ea0c6fc62d0643e5ab3b140c1ffc2525');
INSERT INTO `ec_category` VALUES ('enabled', 'e650bb78830340a7a9af97e4c2455a7a', '毛衣/针织衫', '0000000600000005', '4', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', 'ea0c6fc62d0643e5ab3b140c1ffc2525', '童鞋/婴儿鞋', '0000000600000003', '2', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category` VALUES ('enabled', 'eef81085e4ba406aa027c51331128d31', '背带/学步带/出行用品', '0000000500000001', '0', '42c7958de9ff442192b66d75089d2a02');
INSERT INTO `ec_category` VALUES ('enabled', 'f1a30ca1a3854f6281906b93dd71bf14', '大衣', '000000060000000200000005', '4', '3ec44d6a5bba4296b43fcbd308402fa0');

-- ----------------------------
-- Table structure for ec_category_copy
-- ----------------------------
DROP TABLE IF EXISTS `ec_category_copy`;
CREATE TABLE `ec_category_copy` (
  `status` varchar(32) NOT NULL,
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `like_id` varchar(128) NOT NULL,
  `sort_no` int(11) NOT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ec_category_copy
-- ----------------------------
INSERT INTO `ec_category_copy` VALUES ('enabled', '01324530d7c74c089c9778bcabce697b', '单鞋', '000000060000000300000002', '1', 'ea0c6fc62d0643e5ab3b140c1ffc2525');
INSERT INTO `ec_category_copy` VALUES ('enabled', '0219f2a8a0dd4d5b9740dc113ae0553b', '服装', '00000001', '0', '0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '07b6f8f9a9714dab9fd4641c9ddc8d6a', '玩具/模型/动漫/早教/益智', '00000004', '3', '0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '0dda7c80c5e5490aa089d1938f21043b', '卫衣/绒衫', '0000000600000015', '14', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '0ee2fddb72e740c58969762bbda40660', '夹克/皮衣', '000000060000000200000006', '5', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '0f30300c1cd240f9af461d4e1f5ef7aa', '儿童配饰/发饰', '0000000600000008', '7', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '2cd163fc4faf4c9ab2205abf0528ad9a', '箱包配饰', '00000002', '1', '0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '2e00abaa99b244dfb62ca5a388c4ea6e', '风衣', '000000060000000200000002', '1', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '3604343058b9435b9820093149cdf839', '男包', '0000000200000002', '1', '2cd163fc4faf4c9ab2205abf0528ad9a');
INSERT INTO `ec_category_copy` VALUES ('enabled', '3ec44d6a5bba4296b43fcbd308402fa0', '外套/夹克/大衣', '0000000600000002', '1', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '42c7958de9ff442192b66d75089d2a02', '尿片/洗护/喂哺/推车床', '00000005', '4', '0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '448b662e91bd4b59b2ec9b2c477f695e', '儿童玩具其他', '0000000700000002', '1', '91f4fc1e2c5442db876b5e128dd2de9c');
INSERT INTO `ec_category_copy` VALUES ('enabled', '46d0779c7a864940ab307f1d7d6bc730', '马甲/背心', '0000000600000012', '11', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '474e6f8b5a7347e6a824b0f639a8b544', '其它', '0000000600000009', '8', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '48904af60cce40138cca7b103d28e69e', '靴子/雪地靴', '000000060000000300000001', '0', 'ea0c6fc62d0643e5ab3b140c1ffc2525');
INSERT INTO `ec_category_copy` VALUES ('enabled', '48daf0f4c4f6464cadb9b20b362c5dd3', 'T恤/吊带衫', '0000000600000006', '5', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '4975dcec1b4e4fff89f4d9d6212895a9', '棉袄/棉服', '0000000600000007', '6', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '535d96f5a110468896b90fae0e51b3f8', '儿童泳衣/裤', '0000000600000016', '15', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '539b1b84da27489b9f34bd3d61693307', '雨具', '000000050000000100000001', '0', 'eef81085e4ba406aa027c51331128d31');
INSERT INTO `ec_category_copy` VALUES ('enabled', '5587bbbd27184572af59f33d7d0d615e', '帽子/围巾/口罩/手套/耳套/脚套', '0000000600000001', '0', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '5ca0eecc59d34e2296058ff1cc307ad0', '普通外套', '000000060000000200000003', '2', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '615840079e27449d9cc1ce4d2e980b17', '其它', '000000060000000200000001', '0', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '6503bb7e029542cab70ef5459f46b376', '衬衫', '0000000600000013', '12', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '6a2b3a98fcb249b2bb67fa51442c8c83', '帽子', '000000060000000100000001', '0', '5587bbbd27184572af59f33d7d0d615e');
INSERT INTO `ec_category_copy` VALUES ('enabled', '6c64cebdebd94a8fbe284b2fbefad803', '男装', '0000000100000008', '1', '0219f2a8a0dd4d5b9740dc113ae0553b');
INSERT INTO `ec_category_copy` VALUES ('enabled', '72659899e05042f9af75a7720830f9f7', '女童裙装', '0000000600000011', '10', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '7520ac1d56f640dda97ae3b75e9dddf3', '童装/童鞋/亲子装', '00000003', '2', '0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '806894ef9bad419a8f62ef5081e9d718', '套装', '0000000600000004', '3', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', '83eece47f49548cd8ae668e09bc72098', '早教/音乐/智能玩具', '0000000700000001', '0', '91f4fc1e2c5442db876b5e128dd2de9c');
INSERT INTO `ec_category_copy` VALUES ('enabled', '91f4fc1e2c5442db876b5e128dd2de9c', '玩具/模型/动漫/早教/益智', '00000007', '6', '0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '926338a5c0eb4684a06f8481c2aaeadf', '童装/童鞋/亲子装', '00000006', '5', '0');
INSERT INTO `ec_category_copy` VALUES ('enabled', '9ab7009cc2b94289bce66ad952260941', '休闲', '000000020000000200000001', '0', '3604343058b9435b9820093149cdf839');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'b2ff29b7fe014eecb5c6368d8c06fec7', '手套', '000000060000000100000003', '2', '5587bbbd27184572af59f33d7d0d615e');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'b91d32db897447b2b6ee2872c8d9c6ce', '西服/小西装', '000000060000000200000004', '3', '3ec44d6a5bba4296b43fcbd308402fa0');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'c987838e45944af8bc51cdfb05030b1d', '女装', '0000000100000007', '0', '0219f2a8a0dd4d5b9740dc113ae0553b');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'cad84b58c32749e596c5ef4ff28eda64', '板鞋', '000000020000000200000002', '1', '3604343058b9435b9820093149cdf839');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'cb107aaccf4947029588aecebd0428b9', '早教书籍', '000000070000000100000001', '0', '83eece47f49548cd8ae668e09bc72098');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'cbd54f8f1b184228b5e732d608378f62', '围巾', '000000060000000100000002', '1', '5587bbbd27184572af59f33d7d0d615e');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'cf684a2dfcb248e582fb41df2a926610', '羽绒服/羽绒内胆', '0000000600000014', '13', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'd094a60eee574a3280e4f7e9ae51cec4', '童装裤子', '0000000600000010', '9', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'd66068e2daf6436e9252a39687a510a9', '女包', '0000000200000004', '3', '2cd163fc4faf4c9ab2205abf0528ad9a');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'd9a166cde2ff481db98c1436664a11db', '帆布鞋', '000000060000000300000003', '2', 'ea0c6fc62d0643e5ab3b140c1ffc2525');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'e650bb78830340a7a9af97e4c2455a7a', '毛衣/针织衫', '0000000600000005', '4', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'ea0c6fc62d0643e5ab3b140c1ffc2525', '童鞋/婴儿鞋', '0000000600000003', '2', '926338a5c0eb4684a06f8481c2aaeadf');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'eef81085e4ba406aa027c51331128d31', '背带/学步带/出行用品', '0000000500000001', '0', '42c7958de9ff442192b66d75089d2a02');
INSERT INTO `ec_category_copy` VALUES ('enabled', 'f1a30ca1a3854f6281906b93dd71bf14', '大衣', '000000060000000200000005', '4', '3ec44d6a5bba4296b43fcbd308402fa0');

-- ----------------------------
-- Table structure for ec_company
-- ----------------------------
DROP TABLE IF EXISTS `ec_company`;
CREATE TABLE `ec_company` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `province_id` varchar(50) DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL,
  `area_id` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `mall_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ec_company
-- ----------------------------
INSERT INTO `ec_company` VALUES ('83bb4538394e47049e1ac315488f4bba', 'asdasdsdasd', '130000', '130300', '130324', 'asd', 'asd', 'asd');

-- ----------------------------
-- Table structure for ec_favorites
-- ----------------------------
DROP TABLE IF EXISTS `ec_favorites`;
CREATE TABLE `ec_favorites` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `product_id` varchar(50) DEFAULT NULL,
  `member_id` varchar(50) DEFAULT NULL,
  `favorite_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ec_favorites
-- ----------------------------
INSERT INTO `ec_favorites` VALUES ('20d3e09281f247c2af33e503dcb9bced', '003335a9c7254d638eeb1da1eacf409d', '6ee83ae4af6f481a83abdae164f41dde', '2012-08-07 10:01:29');
INSERT INTO `ec_favorites` VALUES ('213bac94c8bb476b8d4c24ea69fbaae7', null, '6ee83ae4af6f481a83abdae164f41dde', '2012-08-13 17:21:08');
INSERT INTO `ec_favorites` VALUES ('252286b7747743ff905d4382d1a37cfb', '003335a9c7254d638eeb1da1eacf409d', '6ee83ae4af6f481a83abdae164f41dde', '2012-08-07 10:04:56');
INSERT INTO `ec_favorites` VALUES ('d57d040d45b54337a4618e282be1db3c', '003335a9c7254d638eeb1da1eacf409d', '6ee83ae4af6f481a83abdae164f41dde', '2012-08-07 10:04:28');
INSERT INTO `ec_favorites` VALUES ('e33fb7535b204606a3f257e8a1f2b2c7', null, '6ee83ae4af6f481a83abdae164f41dde', '2012-08-07 11:12:33');

-- ----------------------------
-- Table structure for ec_infomation
-- ----------------------------
DROP TABLE IF EXISTS `ec_infomation`;
CREATE TABLE `ec_infomation` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `msg` varchar(3000) DEFAULT NULL,
  `user_ids` varchar(3000) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `create_user` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `content` longtext,
  `rec_user_ids` varchar(3000) DEFAULT NULL,
  `noticeType_id` varchar(50) DEFAULT NULL,
  `affix` varchar(100) DEFAULT NULL,
  `create_user_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ec_infomation
-- ----------------------------

-- ----------------------------
-- Table structure for ec_station_config
-- ----------------------------
DROP TABLE IF EXISTS `ec_station_config`;
CREATE TABLE `ec_station_config` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `auth_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `smsName` varchar(255) DEFAULT NULL,
  `smsPasswd` varchar(255) DEFAULT NULL,
  `company_name` varchar(300) DEFAULT NULL,
  `company_address` varchar(500) DEFAULT NULL,
  `company_tel` varchar(100) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `pointx` varchar(50) DEFAULT NULL,
  `pointy` varchar(50) DEFAULT NULL,
  `auth_data` varchar(10) DEFAULT NULL,
  `intro` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ec_station_config
-- ----------------------------
INSERT INTO `ec_station_config` VALUES ('87bfb548e4b3478683cc0cbe4f07f449', 'Y', '我的系统', 'd:/app/ddc', 'hzjun618', '10466df52195d5051511', '', '', '', '0', '116.09036', '39.936892', 'Y', '<p>\r\n	<strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 门头沟物联网基础平台&nbsp;</strong></p>\r\n<p>\r\n	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;用户清单</p>\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width: 500px\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"text-align: center\">\r\n				<strong>序号</strong></td>\r\n			<td style=\"text-align: center\">\r\n				<strong>机构名称</strong></td>\r\n			<td style=\"text-align: center\">\r\n				<strong>用户名(管理员)</strong></td>\r\n			<td style=\"text-align: center\">\r\n				<strong>默认密码</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center\">\r\n				1</td>\r\n			<td style=\"text-align: center\">\r\n				科学技术委员会</td>\r\n			<td style=\"text-align: center\">\r\n				KJWadmin</td>\r\n			<td style=\"text-align: center\">\r\n				123456</td>\r\n		</tr>\r\n		<tr>\r\n			<td style=\"text-align: center\">\r\n				2</td>\r\n			<td style=\"text-align: center\">\r\n				北京山地生态科技研究所</td>\r\n			<td style=\"text-align: center\">\r\n				SDSadmin</td>\r\n			<td style=\"text-align: center\">\r\n				123456</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>\r\n	&nbsp;</p>\r\n');

-- ----------------------------
-- Table structure for gateway_conf
-- ----------------------------
DROP TABLE IF EXISTS `gateway_conf`;
CREATE TABLE `gateway_conf` (
  `gateway_id` int(11) NOT NULL AUTO_INCREMENT,
  `work_mod` int(11) DEFAULT NULL,
  `gateway_port` int(11) DEFAULT NULL,
  `gateway_logo` varchar(50) DEFAULT NULL,
  `poll_interval` int(11) DEFAULT NULL,
  `timeout` int(11) DEFAULT NULL,
  PRIMARY KEY (`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gateway_conf
-- ----------------------------
INSERT INTO `gateway_conf` VALUES ('1', '0', '502', '58.215.3.70', '10', '120');
INSERT INTO `gateway_conf` VALUES ('2', '1', '502', '1100201305020006', '10', '120');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('clusterQuartzScheduler', '巡检提醒任务', 'DEFAULT', '0 0 10 25-31 * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('clusterQuartzScheduler', '巡检次数恢复任务', 'DEFAULT', '0 0 0 1 * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`) USING BTREE,
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`) USING BTREE,
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('clusterQuartzScheduler', 'timerJobDetail', 'DEFAULT', null, 'org.bsxf.schedule.TestJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('clusterQuartzScheduler', '巡检提醒任务', 'DEFAULT', null, 'org.bsxf.schedule.XJEmailNoticeQuartz', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('clusterQuartzScheduler', '巡检次数恢复任务', 'DEFAULT', null, 'org.bsxf.schedule.XJNumberBackupQuartz', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000007800);
INSERT INTO `qrtz_job_details` VALUES ('clusterQuartzScheduler', '设备监测数据更新', 'DEFAULF', null, 'org.bsxf.schedule.MTGQuartz', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787000737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000007800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('clusterQuartzScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('clusterQuartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('clusterQuartzScheduler', 'CN04L02010005891567849549388', '1567851082111', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
INSERT INTO `qrtz_simple_triggers` VALUES ('clusterQuartzScheduler', 'timerTrigger', 'DEFAULT', '-1', '300000', '679');

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`) USING BTREE,
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`) USING BTREE,
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`) USING BTREE,
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('clusterQuartzScheduler', 'timerTrigger', 'DEFAULT', 'timerJobDetail', 'DEFAULT', null, '1567851155612', '1567850855612', '0', 'WAITING', 'SIMPLE', '1567647455612', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400096A6F6244657461696C7372001D6F72672E71756172747A2E696D706C2E4A6F6244657461696C496D706CABC3CAEC015A54AF0200075A000A6475726162696C6974795A000D73686F756C645265636F7665724C000B6465736372697074696F6E7400124C6A6176612F6C616E672F537472696E673B4C000567726F757071007E00094C00086A6F62436C6173737400114C6A6176612F6C616E672F436C6173733B4C000A6A6F62446174614D61707400174C6F72672F71756172747A2F4A6F62446174614D61703B4C00046E616D6571007E0009787000007074000744454641554C54767200196F72672E627378662E7363686564756C652E546573744A6F62000000000000000000000078707371007E0000007371007E00053F4000000000000C77080000001000000000780074000E74696D65724A6F6244657461696C7800);
INSERT INTO `qrtz_triggers` VALUES ('clusterQuartzScheduler', '巡检提醒任务', 'DEFAULT', '巡检提醒任务', 'DEFAULT', null, '1569376800000', '-1', '0', 'WAITING', 'CRON', '1567666379000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400096A6F6244657461696C7372001D6F72672E71756172747A2E696D706C2E4A6F6244657461696C496D706CABC3CAEC015A54AF0200075A000A6475726162696C6974795A000D73686F756C645265636F7665724C000B6465736372697074696F6E7400124C6A6176612F6C616E672F537472696E673B4C000567726F757071007E00094C00086A6F62436C6173737400114C6A6176612F6C616E672F436C6173733B4C000A6A6F62446174614D61707400174C6F72672F71756172747A2F4A6F62446174614D61703B4C00046E616D6571007E0009787000007074000744454641554C54767200256F72672E627378662E7363686564756C652E584A456D61696C4E6F7469636551756172747A000000000000000000000078707371007E0000007371007E00053F4000000000000C770800000010000000007800740012E5B7A1E6A380E68F90E98692E4BBBBE58AA17800);
INSERT INTO `qrtz_triggers` VALUES ('clusterQuartzScheduler', '巡检次数恢复任务', 'DEFAULT', '巡检次数恢复任务', 'DEFAULT', null, '1569859200000', '-1', '0', 'WAITING', 'CRON', '1567666556000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400096A6F6244657461696C7372001D6F72672E71756172747A2E696D706C2E4A6F6244657461696C496D706CABC3CAEC015A54AF0200075A000A6475726162696C6974795A000D73686F756C645265636F7665724C000B6465736372697074696F6E7400124C6A6176612F6C616E672F537472696E673B4C000567726F757071007E00094C00086A6F62436C6173737400114C6A6176612F6C616E672F436C6173733B4C000A6A6F62446174614D61707400174C6F72672F71756172747A2F4A6F62446174614D61703B4C00046E616D6571007E0009787000007074000744454641554C54767200266F72672E627378662E7363686564756C652E584A4E756D6265724261636B757051756172747A000000000000000000000078707371007E0000007371007E00053F4000000000000C770800000010000000007800740018E5B7A1E6A380E6ACA1E695B0E681A2E5A48DE4BBBBE58AA17800);

-- ----------------------------
-- Table structure for ss_area
-- ----------------------------
DROP TABLE IF EXISTS `ss_area`;
CREATE TABLE `ss_area` (
  `id` varchar(250) NOT NULL DEFAULT '',
  `name` varchar(250) DEFAULT NULL,
  `parent_id` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_ss_area_id` (`id`) USING BTREE,
  KEY `index_area_parent_id` (`parent_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_area
-- ----------------------------
INSERT INTO `ss_area` VALUES ('110000', '北京市', '0');
INSERT INTO `ss_area` VALUES ('110100', '市辖区', '110000');
INSERT INTO `ss_area` VALUES ('110101', '东城区', '110100');
INSERT INTO `ss_area` VALUES ('110102', '西城区', '110100');
INSERT INTO `ss_area` VALUES ('110103', '崇文区', '110100');
INSERT INTO `ss_area` VALUES ('110104', '宣武区', '110100');
INSERT INTO `ss_area` VALUES ('110105', '朝阳区', '110100');
INSERT INTO `ss_area` VALUES ('110106', '丰台区', '110100');
INSERT INTO `ss_area` VALUES ('110107', '石景山区', '110100');
INSERT INTO `ss_area` VALUES ('110108', '海淀区', '110100');
INSERT INTO `ss_area` VALUES ('110109', '门头沟区', '110100');
INSERT INTO `ss_area` VALUES ('110111', '房山区', '110100');
INSERT INTO `ss_area` VALUES ('110112', '通州区', '110100');
INSERT INTO `ss_area` VALUES ('110113', '顺义区', '110100');
INSERT INTO `ss_area` VALUES ('110114', '昌平区', '110100');
INSERT INTO `ss_area` VALUES ('110115', '大兴区', '110100');
INSERT INTO `ss_area` VALUES ('110116', '怀柔区', '110100');
INSERT INTO `ss_area` VALUES ('110117', '平谷区', '110100');
INSERT INTO `ss_area` VALUES ('110200', '县', '110000');
INSERT INTO `ss_area` VALUES ('110228', '密云县', '110200');
INSERT INTO `ss_area` VALUES ('110229', '延庆县', '110200');
INSERT INTO `ss_area` VALUES ('120000', '天津市', '0');
INSERT INTO `ss_area` VALUES ('120100', '市辖区', '120000');
INSERT INTO `ss_area` VALUES ('120101', '和平区', '120100');
INSERT INTO `ss_area` VALUES ('120102', '河东区', '120100');
INSERT INTO `ss_area` VALUES ('120103', '河西区', '120100');
INSERT INTO `ss_area` VALUES ('120104', '南开区', '120100');
INSERT INTO `ss_area` VALUES ('120105', '河北区', '120100');
INSERT INTO `ss_area` VALUES ('120106', '红桥区', '120100');
INSERT INTO `ss_area` VALUES ('120107', '塘沽区', '120100');
INSERT INTO `ss_area` VALUES ('120108', '汉沽区', '120100');
INSERT INTO `ss_area` VALUES ('120109', '大港区', '120100');
INSERT INTO `ss_area` VALUES ('120110', '东丽区', '120100');
INSERT INTO `ss_area` VALUES ('120111', '西青区', '120100');
INSERT INTO `ss_area` VALUES ('120112', '津南区', '120100');
INSERT INTO `ss_area` VALUES ('120113', '北辰区', '120100');
INSERT INTO `ss_area` VALUES ('120114', '武清区', '120100');
INSERT INTO `ss_area` VALUES ('120115', '宝坻区', '120100');
INSERT INTO `ss_area` VALUES ('120200', '县', '120000');
INSERT INTO `ss_area` VALUES ('120221', '宁河县', '120200');
INSERT INTO `ss_area` VALUES ('120223', '静海县', '120200');
INSERT INTO `ss_area` VALUES ('120225', '蓟　县', '120200');
INSERT INTO `ss_area` VALUES ('130000', '河北省', '0');
INSERT INTO `ss_area` VALUES ('130100', '石家庄市', '130000');
INSERT INTO `ss_area` VALUES ('130101', '市辖区', '130100');
INSERT INTO `ss_area` VALUES ('130102', '长安区', '130100');
INSERT INTO `ss_area` VALUES ('130103', '桥东区', '130100');
INSERT INTO `ss_area` VALUES ('130104', '桥西区', '130100');
INSERT INTO `ss_area` VALUES ('130105', '新华区', '130100');
INSERT INTO `ss_area` VALUES ('130107', '井陉矿区', '130100');
INSERT INTO `ss_area` VALUES ('130108', '裕华区', '130100');
INSERT INTO `ss_area` VALUES ('130121', '井陉县', '130100');
INSERT INTO `ss_area` VALUES ('130123', '正定县', '130100');
INSERT INTO `ss_area` VALUES ('130124', '栾城县', '130100');
INSERT INTO `ss_area` VALUES ('130125', '行唐县', '130100');
INSERT INTO `ss_area` VALUES ('130126', '灵寿县', '130100');
INSERT INTO `ss_area` VALUES ('130127', '高邑县', '130100');
INSERT INTO `ss_area` VALUES ('130128', '深泽县', '130100');
INSERT INTO `ss_area` VALUES ('130129', '赞皇县', '130100');
INSERT INTO `ss_area` VALUES ('130130', '无极县', '130100');
INSERT INTO `ss_area` VALUES ('130131', '平山县', '130100');
INSERT INTO `ss_area` VALUES ('130132', '元氏县', '130100');
INSERT INTO `ss_area` VALUES ('130133', '赵　县', '130100');
INSERT INTO `ss_area` VALUES ('130181', '辛集市', '130100');
INSERT INTO `ss_area` VALUES ('130182', '藁城市', '130100');
INSERT INTO `ss_area` VALUES ('130183', '晋州市', '130100');
INSERT INTO `ss_area` VALUES ('130184', '新乐市', '130100');
INSERT INTO `ss_area` VALUES ('130185', '鹿泉市', '130100');
INSERT INTO `ss_area` VALUES ('130200', '唐山市', '130000');
INSERT INTO `ss_area` VALUES ('130201', '市辖区', '130200');
INSERT INTO `ss_area` VALUES ('130202', '路南区', '130200');
INSERT INTO `ss_area` VALUES ('130203', '路北区', '130200');
INSERT INTO `ss_area` VALUES ('130204', '古冶区', '130200');
INSERT INTO `ss_area` VALUES ('130205', '开平区', '130200');
INSERT INTO `ss_area` VALUES ('130207', '丰南区', '130200');
INSERT INTO `ss_area` VALUES ('130208', '丰润区', '130200');
INSERT INTO `ss_area` VALUES ('130223', '滦　县', '130200');
INSERT INTO `ss_area` VALUES ('130224', '滦南县', '130200');
INSERT INTO `ss_area` VALUES ('130225', '乐亭县', '130200');
INSERT INTO `ss_area` VALUES ('130227', '迁西县', '130200');
INSERT INTO `ss_area` VALUES ('130229', '玉田县', '130200');
INSERT INTO `ss_area` VALUES ('130230', '唐海县', '130200');
INSERT INTO `ss_area` VALUES ('130281', '遵化市', '130200');
INSERT INTO `ss_area` VALUES ('130283', '迁安市', '130200');
INSERT INTO `ss_area` VALUES ('130300', '秦皇岛市', '130000');
INSERT INTO `ss_area` VALUES ('130301', '市辖区', '130300');
INSERT INTO `ss_area` VALUES ('130302', '海港区', '130300');
INSERT INTO `ss_area` VALUES ('130303', '山海关区', '130300');
INSERT INTO `ss_area` VALUES ('130304', '北戴河区', '130300');
INSERT INTO `ss_area` VALUES ('130321', '青龙满族自治县', '130300');
INSERT INTO `ss_area` VALUES ('130322', '昌黎县', '130300');
INSERT INTO `ss_area` VALUES ('130323', '抚宁县', '130300');
INSERT INTO `ss_area` VALUES ('130324', '卢龙县', '130300');
INSERT INTO `ss_area` VALUES ('130400', '邯郸市', '130000');
INSERT INTO `ss_area` VALUES ('130401', '市辖区', '130400');
INSERT INTO `ss_area` VALUES ('130402', '邯山区', '130400');
INSERT INTO `ss_area` VALUES ('130403', '丛台区', '130400');
INSERT INTO `ss_area` VALUES ('130404', '复兴区', '130400');
INSERT INTO `ss_area` VALUES ('130406', '峰峰矿区', '130400');
INSERT INTO `ss_area` VALUES ('130421', '邯郸县', '130400');
INSERT INTO `ss_area` VALUES ('130423', '临漳县', '130400');
INSERT INTO `ss_area` VALUES ('130424', '成安县', '130400');
INSERT INTO `ss_area` VALUES ('130425', '大名县', '130400');
INSERT INTO `ss_area` VALUES ('130426', '涉　县', '130400');
INSERT INTO `ss_area` VALUES ('130427', '磁　县', '130400');
INSERT INTO `ss_area` VALUES ('130428', '肥乡县', '130400');
INSERT INTO `ss_area` VALUES ('130429', '永年县', '130400');
INSERT INTO `ss_area` VALUES ('130430', '邱　县', '130400');
INSERT INTO `ss_area` VALUES ('130431', '鸡泽县', '130400');
INSERT INTO `ss_area` VALUES ('130432', '广平县', '130400');
INSERT INTO `ss_area` VALUES ('130433', '馆陶县', '130400');
INSERT INTO `ss_area` VALUES ('130434', '魏　县', '130400');
INSERT INTO `ss_area` VALUES ('130435', '曲周县', '130400');
INSERT INTO `ss_area` VALUES ('130481', '武安市', '130400');
INSERT INTO `ss_area` VALUES ('130500', '邢台市', '130000');
INSERT INTO `ss_area` VALUES ('130501', '市辖区', '130500');
INSERT INTO `ss_area` VALUES ('130502', '桥东区', '130500');
INSERT INTO `ss_area` VALUES ('130503', '桥西区', '130500');
INSERT INTO `ss_area` VALUES ('130521', '邢台县', '130500');
INSERT INTO `ss_area` VALUES ('130522', '临城县', '130500');
INSERT INTO `ss_area` VALUES ('130523', '内丘县', '130500');
INSERT INTO `ss_area` VALUES ('130524', '柏乡县', '130500');
INSERT INTO `ss_area` VALUES ('130525', '隆尧县', '130500');
INSERT INTO `ss_area` VALUES ('130526', '任　县', '130500');
INSERT INTO `ss_area` VALUES ('130527', '南和县', '130500');
INSERT INTO `ss_area` VALUES ('130528', '宁晋县', '130500');
INSERT INTO `ss_area` VALUES ('130529', '巨鹿县', '130500');
INSERT INTO `ss_area` VALUES ('130530', '新河县', '130500');
INSERT INTO `ss_area` VALUES ('130531', '广宗县', '130500');
INSERT INTO `ss_area` VALUES ('130532', '平乡县', '130500');
INSERT INTO `ss_area` VALUES ('130533', '威　县', '130500');
INSERT INTO `ss_area` VALUES ('130534', '清河县', '130500');
INSERT INTO `ss_area` VALUES ('130535', '临西县', '130500');
INSERT INTO `ss_area` VALUES ('130581', '南宫市', '130500');
INSERT INTO `ss_area` VALUES ('130582', '沙河市', '130500');
INSERT INTO `ss_area` VALUES ('130600', '保定市', '130000');
INSERT INTO `ss_area` VALUES ('130601', '市辖区', '130600');
INSERT INTO `ss_area` VALUES ('130602', '新市区', '130600');
INSERT INTO `ss_area` VALUES ('130603', '北市区', '130600');
INSERT INTO `ss_area` VALUES ('130604', '南市区', '130600');
INSERT INTO `ss_area` VALUES ('130621', '满城县', '130600');
INSERT INTO `ss_area` VALUES ('130622', '清苑县', '130600');
INSERT INTO `ss_area` VALUES ('130623', '涞水县', '130600');
INSERT INTO `ss_area` VALUES ('130624', '阜平县', '130600');
INSERT INTO `ss_area` VALUES ('130625', '徐水县', '130600');
INSERT INTO `ss_area` VALUES ('130626', '定兴县', '130600');
INSERT INTO `ss_area` VALUES ('130627', '唐　县', '130600');
INSERT INTO `ss_area` VALUES ('130628', '高阳县', '130600');
INSERT INTO `ss_area` VALUES ('130629', '容城县', '130600');
INSERT INTO `ss_area` VALUES ('130630', '涞源县', '130600');
INSERT INTO `ss_area` VALUES ('130631', '望都县', '130600');
INSERT INTO `ss_area` VALUES ('130632', '安新县', '130600');
INSERT INTO `ss_area` VALUES ('130633', '易　县', '130600');
INSERT INTO `ss_area` VALUES ('130634', '曲阳县', '130600');
INSERT INTO `ss_area` VALUES ('130635', '蠡　县', '130600');
INSERT INTO `ss_area` VALUES ('130636', '顺平县', '130600');
INSERT INTO `ss_area` VALUES ('130637', '博野县', '130600');
INSERT INTO `ss_area` VALUES ('130638', '雄　县', '130600');
INSERT INTO `ss_area` VALUES ('130681', '涿州市', '130600');
INSERT INTO `ss_area` VALUES ('130682', '定州市', '130600');
INSERT INTO `ss_area` VALUES ('130683', '安国市', '130600');
INSERT INTO `ss_area` VALUES ('130684', '高碑店市', '130600');
INSERT INTO `ss_area` VALUES ('130700', '张家口市', '130000');
INSERT INTO `ss_area` VALUES ('130701', '市辖区', '130700');
INSERT INTO `ss_area` VALUES ('130702', '桥东区', '130700');
INSERT INTO `ss_area` VALUES ('130703', '桥西区', '130700');
INSERT INTO `ss_area` VALUES ('130705', '宣化区', '130700');
INSERT INTO `ss_area` VALUES ('130706', '下花园区', '130700');
INSERT INTO `ss_area` VALUES ('130721', '宣化县', '130700');
INSERT INTO `ss_area` VALUES ('130722', '张北县', '130700');
INSERT INTO `ss_area` VALUES ('130723', '康保县', '130700');
INSERT INTO `ss_area` VALUES ('130724', '沽源县', '130700');
INSERT INTO `ss_area` VALUES ('130725', '尚义县', '130700');
INSERT INTO `ss_area` VALUES ('130726', '蔚　县', '130700');
INSERT INTO `ss_area` VALUES ('130727', '阳原县', '130700');
INSERT INTO `ss_area` VALUES ('130728', '怀安县', '130700');
INSERT INTO `ss_area` VALUES ('130729', '万全县', '130700');
INSERT INTO `ss_area` VALUES ('130730', '怀来县', '130700');
INSERT INTO `ss_area` VALUES ('130731', '涿鹿县', '130700');
INSERT INTO `ss_area` VALUES ('130732', '赤城县', '130700');
INSERT INTO `ss_area` VALUES ('130733', '崇礼县', '130700');
INSERT INTO `ss_area` VALUES ('130800', '承德市', '130000');
INSERT INTO `ss_area` VALUES ('130801', '市辖区', '130800');
INSERT INTO `ss_area` VALUES ('130802', '双桥区', '130800');
INSERT INTO `ss_area` VALUES ('130803', '双滦区', '130800');
INSERT INTO `ss_area` VALUES ('130804', '鹰手营子矿区', '130800');
INSERT INTO `ss_area` VALUES ('130821', '承德县', '130800');
INSERT INTO `ss_area` VALUES ('130822', '兴隆县', '130800');
INSERT INTO `ss_area` VALUES ('130823', '平泉县', '130800');
INSERT INTO `ss_area` VALUES ('130824', '滦平县', '130800');
INSERT INTO `ss_area` VALUES ('130825', '隆化县', '130800');
INSERT INTO `ss_area` VALUES ('130826', '丰宁满族自治县', '130800');
INSERT INTO `ss_area` VALUES ('130827', '宽城满族自治县', '130800');
INSERT INTO `ss_area` VALUES ('130828', '围场满族蒙古族自治县', '130800');
INSERT INTO `ss_area` VALUES ('130900', '沧州市', '130000');
INSERT INTO `ss_area` VALUES ('130901', '市辖区', '130900');
INSERT INTO `ss_area` VALUES ('130902', '新华区', '130900');
INSERT INTO `ss_area` VALUES ('130903', '运河区', '130900');
INSERT INTO `ss_area` VALUES ('130921', '沧　县', '130900');
INSERT INTO `ss_area` VALUES ('130922', '青　县', '130900');
INSERT INTO `ss_area` VALUES ('130923', '东光县', '130900');
INSERT INTO `ss_area` VALUES ('130924', '海兴县', '130900');
INSERT INTO `ss_area` VALUES ('130925', '盐山县', '130900');
INSERT INTO `ss_area` VALUES ('130926', '肃宁县', '130900');
INSERT INTO `ss_area` VALUES ('130927', '南皮县', '130900');
INSERT INTO `ss_area` VALUES ('130928', '吴桥县', '130900');
INSERT INTO `ss_area` VALUES ('130929', '献　县', '130900');
INSERT INTO `ss_area` VALUES ('130930', '孟村回族自治县', '130900');
INSERT INTO `ss_area` VALUES ('130981', '泊头市', '130900');
INSERT INTO `ss_area` VALUES ('130982', '任丘市', '130900');
INSERT INTO `ss_area` VALUES ('130983', '黄骅市', '130900');
INSERT INTO `ss_area` VALUES ('130984', '河间市', '130900');
INSERT INTO `ss_area` VALUES ('131000', '廊坊市', '130000');
INSERT INTO `ss_area` VALUES ('131001', '市辖区', '131000');
INSERT INTO `ss_area` VALUES ('131002', '安次区', '131000');
INSERT INTO `ss_area` VALUES ('131003', '广阳区', '131000');
INSERT INTO `ss_area` VALUES ('131022', '固安县', '131000');
INSERT INTO `ss_area` VALUES ('131023', '永清县', '131000');
INSERT INTO `ss_area` VALUES ('131024', '香河县', '131000');
INSERT INTO `ss_area` VALUES ('131025', '大城县', '131000');
INSERT INTO `ss_area` VALUES ('131026', '文安县', '131000');
INSERT INTO `ss_area` VALUES ('131028', '大厂回族自治县', '131000');
INSERT INTO `ss_area` VALUES ('131081', '霸州市', '131000');
INSERT INTO `ss_area` VALUES ('131082', '三河市', '131000');
INSERT INTO `ss_area` VALUES ('131100', '衡水市', '130000');
INSERT INTO `ss_area` VALUES ('131101', '市辖区', '131100');
INSERT INTO `ss_area` VALUES ('131102', '桃城区', '131100');
INSERT INTO `ss_area` VALUES ('131121', '枣强县', '131100');
INSERT INTO `ss_area` VALUES ('131122', '武邑县', '131100');
INSERT INTO `ss_area` VALUES ('131123', '武强县', '131100');
INSERT INTO `ss_area` VALUES ('131124', '饶阳县', '131100');
INSERT INTO `ss_area` VALUES ('131125', '安平县', '131100');
INSERT INTO `ss_area` VALUES ('131126', '故城县', '131100');
INSERT INTO `ss_area` VALUES ('131127', '景　县', '131100');
INSERT INTO `ss_area` VALUES ('131128', '阜城县', '131100');
INSERT INTO `ss_area` VALUES ('131181', '冀州市', '131100');
INSERT INTO `ss_area` VALUES ('131182', '深州市', '131100');
INSERT INTO `ss_area` VALUES ('140000', '山西省', '0');
INSERT INTO `ss_area` VALUES ('140100', '太原市', '140000');
INSERT INTO `ss_area` VALUES ('140101', '市辖区', '140100');
INSERT INTO `ss_area` VALUES ('140105', '小店区', '140100');
INSERT INTO `ss_area` VALUES ('140106', '迎泽区', '140100');
INSERT INTO `ss_area` VALUES ('140107', '杏花岭区', '140100');
INSERT INTO `ss_area` VALUES ('140108', '尖草坪区', '140100');
INSERT INTO `ss_area` VALUES ('140109', '万柏林区', '140100');
INSERT INTO `ss_area` VALUES ('140110', '晋源区', '140100');
INSERT INTO `ss_area` VALUES ('140121', '清徐县', '140100');
INSERT INTO `ss_area` VALUES ('140122', '阳曲县', '140100');
INSERT INTO `ss_area` VALUES ('140123', '娄烦县', '140100');
INSERT INTO `ss_area` VALUES ('140181', '古交市', '140100');
INSERT INTO `ss_area` VALUES ('140200', '大同市', '140000');
INSERT INTO `ss_area` VALUES ('140201', '市辖区', '140200');
INSERT INTO `ss_area` VALUES ('140202', '城　区', '140200');
INSERT INTO `ss_area` VALUES ('140203', '矿　区', '140200');
INSERT INTO `ss_area` VALUES ('140211', '南郊区', '140200');
INSERT INTO `ss_area` VALUES ('140212', '新荣区', '140200');
INSERT INTO `ss_area` VALUES ('140221', '阳高县', '140200');
INSERT INTO `ss_area` VALUES ('140222', '天镇县', '140200');
INSERT INTO `ss_area` VALUES ('140223', '广灵县', '140200');
INSERT INTO `ss_area` VALUES ('140224', '灵丘县', '140200');
INSERT INTO `ss_area` VALUES ('140225', '浑源县', '140200');
INSERT INTO `ss_area` VALUES ('140226', '左云县', '140200');
INSERT INTO `ss_area` VALUES ('140227', '大同县', '140200');
INSERT INTO `ss_area` VALUES ('140300', '阳泉市', '140000');
INSERT INTO `ss_area` VALUES ('140301', '市辖区', '140300');
INSERT INTO `ss_area` VALUES ('140302', '城　区', '140300');
INSERT INTO `ss_area` VALUES ('140303', '矿　区', '140300');
INSERT INTO `ss_area` VALUES ('140311', '郊　区', '140300');
INSERT INTO `ss_area` VALUES ('140321', '平定县', '140300');
INSERT INTO `ss_area` VALUES ('140322', '盂　县', '140300');
INSERT INTO `ss_area` VALUES ('140400', '长治市', '140000');
INSERT INTO `ss_area` VALUES ('140401', '市辖区', '140400');
INSERT INTO `ss_area` VALUES ('140402', '城　区', '140400');
INSERT INTO `ss_area` VALUES ('140411', '郊　区', '140400');
INSERT INTO `ss_area` VALUES ('140421', '长治县', '140400');
INSERT INTO `ss_area` VALUES ('140423', '襄垣县', '140400');
INSERT INTO `ss_area` VALUES ('140424', '屯留县', '140400');
INSERT INTO `ss_area` VALUES ('140425', '平顺县', '140400');
INSERT INTO `ss_area` VALUES ('140426', '黎城县', '140400');
INSERT INTO `ss_area` VALUES ('140427', '壶关县', '140400');
INSERT INTO `ss_area` VALUES ('140428', '长子县', '140400');
INSERT INTO `ss_area` VALUES ('140429', '武乡县', '140400');
INSERT INTO `ss_area` VALUES ('140430', '沁　县', '140400');
INSERT INTO `ss_area` VALUES ('140431', '沁源县', '140400');
INSERT INTO `ss_area` VALUES ('140481', '潞城市', '140400');
INSERT INTO `ss_area` VALUES ('140500', '晋城市', '140000');
INSERT INTO `ss_area` VALUES ('140501', '市辖区', '140500');
INSERT INTO `ss_area` VALUES ('140502', '城　区', '140500');
INSERT INTO `ss_area` VALUES ('140521', '沁水县', '140500');
INSERT INTO `ss_area` VALUES ('140522', '阳城县', '140500');
INSERT INTO `ss_area` VALUES ('140524', '陵川县', '140500');
INSERT INTO `ss_area` VALUES ('140525', '泽州县', '140500');
INSERT INTO `ss_area` VALUES ('140581', '高平市', '140500');
INSERT INTO `ss_area` VALUES ('140600', '朔州市', '140000');
INSERT INTO `ss_area` VALUES ('140601', '市辖区', '140600');
INSERT INTO `ss_area` VALUES ('140602', '朔城区', '140600');
INSERT INTO `ss_area` VALUES ('140603', '平鲁区', '140600');
INSERT INTO `ss_area` VALUES ('140621', '山阴县', '140600');
INSERT INTO `ss_area` VALUES ('140622', '应　县', '140600');
INSERT INTO `ss_area` VALUES ('140623', '右玉县', '140600');
INSERT INTO `ss_area` VALUES ('140624', '怀仁县', '140600');
INSERT INTO `ss_area` VALUES ('140700', '晋中市', '140000');
INSERT INTO `ss_area` VALUES ('140701', '市辖区', '140700');
INSERT INTO `ss_area` VALUES ('140702', '榆次区', '140700');
INSERT INTO `ss_area` VALUES ('140721', '榆社县', '140700');
INSERT INTO `ss_area` VALUES ('140722', '左权县', '140700');
INSERT INTO `ss_area` VALUES ('140723', '和顺县', '140700');
INSERT INTO `ss_area` VALUES ('140724', '昔阳县', '140700');
INSERT INTO `ss_area` VALUES ('140725', '寿阳县', '140700');
INSERT INTO `ss_area` VALUES ('140726', '太谷县', '140700');
INSERT INTO `ss_area` VALUES ('140727', '祁　县', '140700');
INSERT INTO `ss_area` VALUES ('140728', '平遥县', '140700');
INSERT INTO `ss_area` VALUES ('140729', '灵石县', '140700');
INSERT INTO `ss_area` VALUES ('140781', '介休市', '140700');
INSERT INTO `ss_area` VALUES ('140800', '运城市', '140000');
INSERT INTO `ss_area` VALUES ('140801', '市辖区', '140800');
INSERT INTO `ss_area` VALUES ('140802', '盐湖区', '140800');
INSERT INTO `ss_area` VALUES ('140821', '临猗县', '140800');
INSERT INTO `ss_area` VALUES ('140822', '万荣县', '140800');
INSERT INTO `ss_area` VALUES ('140823', '闻喜县', '140800');
INSERT INTO `ss_area` VALUES ('140824', '稷山县', '140800');
INSERT INTO `ss_area` VALUES ('140825', '新绛县', '140800');
INSERT INTO `ss_area` VALUES ('140826', '绛　县', '140800');
INSERT INTO `ss_area` VALUES ('140827', '垣曲县', '140800');
INSERT INTO `ss_area` VALUES ('140828', '夏　县', '140800');
INSERT INTO `ss_area` VALUES ('140829', '平陆县', '140800');
INSERT INTO `ss_area` VALUES ('140830', '芮城县', '140800');
INSERT INTO `ss_area` VALUES ('140881', '永济市', '140800');
INSERT INTO `ss_area` VALUES ('140882', '河津市', '140800');
INSERT INTO `ss_area` VALUES ('140900', '忻州市', '140000');
INSERT INTO `ss_area` VALUES ('140901', '市辖区', '140900');
INSERT INTO `ss_area` VALUES ('140902', '忻府区', '140900');
INSERT INTO `ss_area` VALUES ('140921', '定襄县', '140900');
INSERT INTO `ss_area` VALUES ('140922', '五台县', '140900');
INSERT INTO `ss_area` VALUES ('140923', '代　县', '140900');
INSERT INTO `ss_area` VALUES ('140924', '繁峙县', '140900');
INSERT INTO `ss_area` VALUES ('140925', '宁武县', '140900');
INSERT INTO `ss_area` VALUES ('140926', '静乐县', '140900');
INSERT INTO `ss_area` VALUES ('140927', '神池县', '140900');
INSERT INTO `ss_area` VALUES ('140928', '五寨县', '140900');
INSERT INTO `ss_area` VALUES ('140929', '岢岚县', '140900');
INSERT INTO `ss_area` VALUES ('140930', '河曲县', '140900');
INSERT INTO `ss_area` VALUES ('140931', '保德县', '140900');
INSERT INTO `ss_area` VALUES ('140932', '偏关县', '140900');
INSERT INTO `ss_area` VALUES ('140981', '原平市', '140900');
INSERT INTO `ss_area` VALUES ('141000', '临汾市', '140000');
INSERT INTO `ss_area` VALUES ('141001', '市辖区', '141000');
INSERT INTO `ss_area` VALUES ('141002', '尧都区', '141000');
INSERT INTO `ss_area` VALUES ('141021', '曲沃县', '141000');
INSERT INTO `ss_area` VALUES ('141022', '翼城县', '141000');
INSERT INTO `ss_area` VALUES ('141023', '襄汾县', '141000');
INSERT INTO `ss_area` VALUES ('141024', '洪洞县', '141000');
INSERT INTO `ss_area` VALUES ('141025', '古　县', '141000');
INSERT INTO `ss_area` VALUES ('141026', '安泽县', '141000');
INSERT INTO `ss_area` VALUES ('141027', '浮山县', '141000');
INSERT INTO `ss_area` VALUES ('141028', '吉　县', '141000');
INSERT INTO `ss_area` VALUES ('141029', '乡宁县', '141000');
INSERT INTO `ss_area` VALUES ('141030', '大宁县', '141000');
INSERT INTO `ss_area` VALUES ('141031', '隰　县', '141000');
INSERT INTO `ss_area` VALUES ('141032', '永和县', '141000');
INSERT INTO `ss_area` VALUES ('141033', '蒲　县', '141000');
INSERT INTO `ss_area` VALUES ('141034', '汾西县', '141000');
INSERT INTO `ss_area` VALUES ('141081', '侯马市', '141000');
INSERT INTO `ss_area` VALUES ('141082', '霍州市', '141000');
INSERT INTO `ss_area` VALUES ('141100', '吕梁市', '140000');
INSERT INTO `ss_area` VALUES ('141101', '市辖区', '141100');
INSERT INTO `ss_area` VALUES ('141102', '离石区', '141100');
INSERT INTO `ss_area` VALUES ('141121', '文水县', '141100');
INSERT INTO `ss_area` VALUES ('141122', '交城县', '141100');
INSERT INTO `ss_area` VALUES ('141123', '兴　县', '141100');
INSERT INTO `ss_area` VALUES ('141124', '临　县', '141100');
INSERT INTO `ss_area` VALUES ('141125', '柳林县', '141100');
INSERT INTO `ss_area` VALUES ('141126', '石楼县', '141100');
INSERT INTO `ss_area` VALUES ('141127', '岚　县', '141100');
INSERT INTO `ss_area` VALUES ('141128', '方山县', '141100');
INSERT INTO `ss_area` VALUES ('141129', '中阳县', '141100');
INSERT INTO `ss_area` VALUES ('141130', '交口县', '141100');
INSERT INTO `ss_area` VALUES ('141181', '孝义市', '141100');
INSERT INTO `ss_area` VALUES ('141182', '汾阳市', '141100');
INSERT INTO `ss_area` VALUES ('150000', '内蒙古自治区', '0');
INSERT INTO `ss_area` VALUES ('150100', '呼和浩特市', '150000');
INSERT INTO `ss_area` VALUES ('150101', '市辖区', '150100');
INSERT INTO `ss_area` VALUES ('150102', '新城区', '150100');
INSERT INTO `ss_area` VALUES ('150103', '回民区', '150100');
INSERT INTO `ss_area` VALUES ('150104', '玉泉区', '150100');
INSERT INTO `ss_area` VALUES ('150105', '赛罕区', '150100');
INSERT INTO `ss_area` VALUES ('150121', '土默特左旗', '150100');
INSERT INTO `ss_area` VALUES ('150122', '托克托县', '150100');
INSERT INTO `ss_area` VALUES ('150123', '和林格尔县', '150100');
INSERT INTO `ss_area` VALUES ('150124', '清水河县', '150100');
INSERT INTO `ss_area` VALUES ('150125', '武川县', '150100');
INSERT INTO `ss_area` VALUES ('150200', '包头市', '150000');
INSERT INTO `ss_area` VALUES ('150201', '市辖区', '150200');
INSERT INTO `ss_area` VALUES ('150202', '东河区', '150200');
INSERT INTO `ss_area` VALUES ('150203', '昆都仑区', '150200');
INSERT INTO `ss_area` VALUES ('150204', '青山区', '150200');
INSERT INTO `ss_area` VALUES ('150205', '石拐区', '150200');
INSERT INTO `ss_area` VALUES ('150206', '白云矿区', '150200');
INSERT INTO `ss_area` VALUES ('150207', '九原区', '150200');
INSERT INTO `ss_area` VALUES ('150221', '土默特右旗', '150200');
INSERT INTO `ss_area` VALUES ('150222', '固阳县', '150200');
INSERT INTO `ss_area` VALUES ('150223', '达尔罕茂明安联合旗', '150200');
INSERT INTO `ss_area` VALUES ('150300', '乌海市', '150000');
INSERT INTO `ss_area` VALUES ('150301', '市辖区', '150300');
INSERT INTO `ss_area` VALUES ('150302', '海勃湾区', '150300');
INSERT INTO `ss_area` VALUES ('150303', '海南区', '150300');
INSERT INTO `ss_area` VALUES ('150304', '乌达区', '150300');
INSERT INTO `ss_area` VALUES ('150400', '赤峰市', '150000');
INSERT INTO `ss_area` VALUES ('150401', '市辖区', '150400');
INSERT INTO `ss_area` VALUES ('150402', '红山区', '150400');
INSERT INTO `ss_area` VALUES ('150403', '元宝山区', '150400');
INSERT INTO `ss_area` VALUES ('150404', '松山区', '150400');
INSERT INTO `ss_area` VALUES ('150421', '阿鲁科尔沁旗', '150400');
INSERT INTO `ss_area` VALUES ('150422', '巴林左旗', '150400');
INSERT INTO `ss_area` VALUES ('150423', '巴林右旗', '150400');
INSERT INTO `ss_area` VALUES ('150424', '林西县', '150400');
INSERT INTO `ss_area` VALUES ('150425', '克什克腾旗', '150400');
INSERT INTO `ss_area` VALUES ('150426', '翁牛特旗', '150400');
INSERT INTO `ss_area` VALUES ('150428', '喀喇沁旗', '150400');
INSERT INTO `ss_area` VALUES ('150429', '宁城县', '150400');
INSERT INTO `ss_area` VALUES ('150430', '敖汉旗', '150400');
INSERT INTO `ss_area` VALUES ('150500', '通辽市', '150000');
INSERT INTO `ss_area` VALUES ('150501', '市辖区', '150500');
INSERT INTO `ss_area` VALUES ('150502', '科尔沁区', '150500');
INSERT INTO `ss_area` VALUES ('150521', '科尔沁左翼中旗', '150500');
INSERT INTO `ss_area` VALUES ('150522', '科尔沁左翼后旗', '150500');
INSERT INTO `ss_area` VALUES ('150523', '开鲁县', '150500');
INSERT INTO `ss_area` VALUES ('150524', '库伦旗', '150500');
INSERT INTO `ss_area` VALUES ('150525', '奈曼旗', '150500');
INSERT INTO `ss_area` VALUES ('150526', '扎鲁特旗', '150500');
INSERT INTO `ss_area` VALUES ('150581', '霍林郭勒市', '150500');
INSERT INTO `ss_area` VALUES ('150600', '鄂尔多斯市', '150000');
INSERT INTO `ss_area` VALUES ('150602', '东胜区', '150600');
INSERT INTO `ss_area` VALUES ('150621', '达拉特旗', '150600');
INSERT INTO `ss_area` VALUES ('150622', '准格尔旗', '150600');
INSERT INTO `ss_area` VALUES ('150623', '鄂托克前旗', '150600');
INSERT INTO `ss_area` VALUES ('150624', '鄂托克旗', '150600');
INSERT INTO `ss_area` VALUES ('150625', '杭锦旗', '150600');
INSERT INTO `ss_area` VALUES ('150626', '乌审旗', '150600');
INSERT INTO `ss_area` VALUES ('150627', '伊金霍洛旗', '150600');
INSERT INTO `ss_area` VALUES ('150700', '呼伦贝尔市', '150000');
INSERT INTO `ss_area` VALUES ('150701', '市辖区', '150700');
INSERT INTO `ss_area` VALUES ('150702', '海拉尔区', '150700');
INSERT INTO `ss_area` VALUES ('150721', '阿荣旗', '150700');
INSERT INTO `ss_area` VALUES ('150722', '莫力达瓦达斡尔族自治旗', '150700');
INSERT INTO `ss_area` VALUES ('150723', '鄂伦春自治旗', '150700');
INSERT INTO `ss_area` VALUES ('150724', '鄂温克族自治旗', '150700');
INSERT INTO `ss_area` VALUES ('150725', '陈巴尔虎旗', '150700');
INSERT INTO `ss_area` VALUES ('150726', '新巴尔虎左旗', '150700');
INSERT INTO `ss_area` VALUES ('150727', '新巴尔虎右旗', '150700');
INSERT INTO `ss_area` VALUES ('150781', '满洲里市', '150700');
INSERT INTO `ss_area` VALUES ('150782', '牙克石市', '150700');
INSERT INTO `ss_area` VALUES ('150783', '扎兰屯市', '150700');
INSERT INTO `ss_area` VALUES ('150784', '额尔古纳市', '150700');
INSERT INTO `ss_area` VALUES ('150785', '根河市', '150700');
INSERT INTO `ss_area` VALUES ('150800', '巴彦淖尔市', '150000');
INSERT INTO `ss_area` VALUES ('150801', '市辖区', '150800');
INSERT INTO `ss_area` VALUES ('150802', '临河区', '150800');
INSERT INTO `ss_area` VALUES ('150821', '五原县', '150800');
INSERT INTO `ss_area` VALUES ('150822', '磴口县', '150800');
INSERT INTO `ss_area` VALUES ('150823', '乌拉特前旗', '150800');
INSERT INTO `ss_area` VALUES ('150824', '乌拉特中旗', '150800');
INSERT INTO `ss_area` VALUES ('150825', '乌拉特后旗', '150800');
INSERT INTO `ss_area` VALUES ('150826', '杭锦后旗', '150800');
INSERT INTO `ss_area` VALUES ('150900', '乌兰察布市', '150000');
INSERT INTO `ss_area` VALUES ('150901', '市辖区', '150900');
INSERT INTO `ss_area` VALUES ('150902', '集宁区', '150900');
INSERT INTO `ss_area` VALUES ('150921', '卓资县', '150900');
INSERT INTO `ss_area` VALUES ('150922', '化德县', '150900');
INSERT INTO `ss_area` VALUES ('150923', '商都县', '150900');
INSERT INTO `ss_area` VALUES ('150924', '兴和县', '150900');
INSERT INTO `ss_area` VALUES ('150925', '凉城县', '150900');
INSERT INTO `ss_area` VALUES ('150926', '察哈尔右翼前旗', '150900');
INSERT INTO `ss_area` VALUES ('150927', '察哈尔右翼中旗', '150900');
INSERT INTO `ss_area` VALUES ('150928', '察哈尔右翼后旗', '150900');
INSERT INTO `ss_area` VALUES ('150929', '四子王旗', '150900');
INSERT INTO `ss_area` VALUES ('150981', '丰镇市', '150900');
INSERT INTO `ss_area` VALUES ('152200', '兴安盟', '150000');
INSERT INTO `ss_area` VALUES ('152201', '乌兰浩特市', '152200');
INSERT INTO `ss_area` VALUES ('152202', '阿尔山市', '152200');
INSERT INTO `ss_area` VALUES ('152221', '科尔沁右翼前旗', '152200');
INSERT INTO `ss_area` VALUES ('152222', '科尔沁右翼中旗', '152200');
INSERT INTO `ss_area` VALUES ('152223', '扎赉特旗', '152200');
INSERT INTO `ss_area` VALUES ('152224', '突泉县', '152200');
INSERT INTO `ss_area` VALUES ('152500', '锡林郭勒盟', '150000');
INSERT INTO `ss_area` VALUES ('152501', '二连浩特市', '152500');
INSERT INTO `ss_area` VALUES ('152502', '锡林浩特市', '152500');
INSERT INTO `ss_area` VALUES ('152522', '阿巴嘎旗', '152500');
INSERT INTO `ss_area` VALUES ('152523', '苏尼特左旗', '152500');
INSERT INTO `ss_area` VALUES ('152524', '苏尼特右旗', '152500');
INSERT INTO `ss_area` VALUES ('152525', '东乌珠穆沁旗', '152500');
INSERT INTO `ss_area` VALUES ('152526', '西乌珠穆沁旗', '152500');
INSERT INTO `ss_area` VALUES ('152527', '太仆寺旗', '152500');
INSERT INTO `ss_area` VALUES ('152528', '镶黄旗', '152500');
INSERT INTO `ss_area` VALUES ('152529', '正镶白旗', '152500');
INSERT INTO `ss_area` VALUES ('152530', '正蓝旗', '152500');
INSERT INTO `ss_area` VALUES ('152531', '多伦县', '152500');
INSERT INTO `ss_area` VALUES ('152900', '阿拉善盟', '150000');
INSERT INTO `ss_area` VALUES ('152921', '阿拉善左旗', '152900');
INSERT INTO `ss_area` VALUES ('152922', '阿拉善右旗', '152900');
INSERT INTO `ss_area` VALUES ('152923', '额济纳旗', '152900');
INSERT INTO `ss_area` VALUES ('210000', '辽宁省', '0');
INSERT INTO `ss_area` VALUES ('210100', '沈阳市', '210000');
INSERT INTO `ss_area` VALUES ('210101', '市辖区', '210100');
INSERT INTO `ss_area` VALUES ('210102', '和平区', '210100');
INSERT INTO `ss_area` VALUES ('210103', '沈河区', '210100');
INSERT INTO `ss_area` VALUES ('210104', '大东区', '210100');
INSERT INTO `ss_area` VALUES ('210105', '皇姑区', '210100');
INSERT INTO `ss_area` VALUES ('210106', '铁西区', '210100');
INSERT INTO `ss_area` VALUES ('210111', '苏家屯区', '210100');
INSERT INTO `ss_area` VALUES ('210112', '东陵区', '210100');
INSERT INTO `ss_area` VALUES ('210113', '新城子区', '210100');
INSERT INTO `ss_area` VALUES ('210114', '于洪区', '210100');
INSERT INTO `ss_area` VALUES ('210122', '辽中县', '210100');
INSERT INTO `ss_area` VALUES ('210123', '康平县', '210100');
INSERT INTO `ss_area` VALUES ('210124', '法库县', '210100');
INSERT INTO `ss_area` VALUES ('210181', '新民市', '210100');
INSERT INTO `ss_area` VALUES ('210200', '大连市', '210000');
INSERT INTO `ss_area` VALUES ('210201', '市辖区', '210200');
INSERT INTO `ss_area` VALUES ('210202', '中山区', '210200');
INSERT INTO `ss_area` VALUES ('210203', '西岗区', '210200');
INSERT INTO `ss_area` VALUES ('210204', '沙河口区', '210200');
INSERT INTO `ss_area` VALUES ('210211', '甘井子区', '210200');
INSERT INTO `ss_area` VALUES ('210212', '旅顺口区', '210200');
INSERT INTO `ss_area` VALUES ('210213', '金州区', '210200');
INSERT INTO `ss_area` VALUES ('210224', '长海县', '210200');
INSERT INTO `ss_area` VALUES ('210281', '瓦房店市', '210200');
INSERT INTO `ss_area` VALUES ('210282', '普兰店市', '210200');
INSERT INTO `ss_area` VALUES ('210283', '庄河市', '210200');
INSERT INTO `ss_area` VALUES ('210300', '鞍山市', '210000');
INSERT INTO `ss_area` VALUES ('210301', '市辖区', '210300');
INSERT INTO `ss_area` VALUES ('210302', '铁东区', '210300');
INSERT INTO `ss_area` VALUES ('210303', '铁西区', '210300');
INSERT INTO `ss_area` VALUES ('210304', '立山区', '210300');
INSERT INTO `ss_area` VALUES ('210311', '千山区', '210300');
INSERT INTO `ss_area` VALUES ('210321', '台安县', '210300');
INSERT INTO `ss_area` VALUES ('210323', '岫岩满族自治县', '210300');
INSERT INTO `ss_area` VALUES ('210381', '海城市', '210300');
INSERT INTO `ss_area` VALUES ('210400', '抚顺市', '210000');
INSERT INTO `ss_area` VALUES ('210401', '市辖区', '210400');
INSERT INTO `ss_area` VALUES ('210402', '新抚区', '210400');
INSERT INTO `ss_area` VALUES ('210403', '东洲区', '210400');
INSERT INTO `ss_area` VALUES ('210404', '望花区', '210400');
INSERT INTO `ss_area` VALUES ('210411', '顺城区', '210400');
INSERT INTO `ss_area` VALUES ('210421', '抚顺县', '210400');
INSERT INTO `ss_area` VALUES ('210422', '新宾满族自治县', '210400');
INSERT INTO `ss_area` VALUES ('210423', '清原满族自治县', '210400');
INSERT INTO `ss_area` VALUES ('210500', '本溪市', '210000');
INSERT INTO `ss_area` VALUES ('210501', '市辖区', '210500');
INSERT INTO `ss_area` VALUES ('210502', '平山区', '210500');
INSERT INTO `ss_area` VALUES ('210503', '溪湖区', '210500');
INSERT INTO `ss_area` VALUES ('210504', '明山区', '210500');
INSERT INTO `ss_area` VALUES ('210505', '南芬区', '210500');
INSERT INTO `ss_area` VALUES ('210521', '本溪满族自治县', '210500');
INSERT INTO `ss_area` VALUES ('210522', '桓仁满族自治县', '210500');
INSERT INTO `ss_area` VALUES ('210600', '丹东市', '210000');
INSERT INTO `ss_area` VALUES ('210601', '市辖区', '210600');
INSERT INTO `ss_area` VALUES ('210602', '元宝区', '210600');
INSERT INTO `ss_area` VALUES ('210603', '振兴区', '210600');
INSERT INTO `ss_area` VALUES ('210604', '振安区', '210600');
INSERT INTO `ss_area` VALUES ('210624', '宽甸满族自治县', '210600');
INSERT INTO `ss_area` VALUES ('210681', '东港市', '210600');
INSERT INTO `ss_area` VALUES ('210682', '凤城市', '210600');
INSERT INTO `ss_area` VALUES ('210700', '锦州市', '210000');
INSERT INTO `ss_area` VALUES ('210701', '市辖区', '210700');
INSERT INTO `ss_area` VALUES ('210702', '古塔区', '210700');
INSERT INTO `ss_area` VALUES ('210703', '凌河区', '210700');
INSERT INTO `ss_area` VALUES ('210711', '太和区', '210700');
INSERT INTO `ss_area` VALUES ('210726', '黑山县', '210700');
INSERT INTO `ss_area` VALUES ('210727', '义　县', '210700');
INSERT INTO `ss_area` VALUES ('210781', '凌海市', '210700');
INSERT INTO `ss_area` VALUES ('210782', '北宁市', '210700');
INSERT INTO `ss_area` VALUES ('210800', '营口市', '210000');
INSERT INTO `ss_area` VALUES ('210801', '市辖区', '210800');
INSERT INTO `ss_area` VALUES ('210802', '站前区', '210800');
INSERT INTO `ss_area` VALUES ('210803', '西市区', '210800');
INSERT INTO `ss_area` VALUES ('210804', '鲅鱼圈区', '210800');
INSERT INTO `ss_area` VALUES ('210811', '老边区', '210800');
INSERT INTO `ss_area` VALUES ('210881', '盖州市', '210800');
INSERT INTO `ss_area` VALUES ('210882', '大石桥市', '210800');
INSERT INTO `ss_area` VALUES ('210900', '阜新市', '210000');
INSERT INTO `ss_area` VALUES ('210901', '市辖区', '210900');
INSERT INTO `ss_area` VALUES ('210902', '海州区', '210900');
INSERT INTO `ss_area` VALUES ('210903', '新邱区', '210900');
INSERT INTO `ss_area` VALUES ('210904', '太平区', '210900');
INSERT INTO `ss_area` VALUES ('210905', '清河门区', '210900');
INSERT INTO `ss_area` VALUES ('210911', '细河区', '210900');
INSERT INTO `ss_area` VALUES ('210921', '阜新蒙古族自治县', '210900');
INSERT INTO `ss_area` VALUES ('210922', '彰武县', '210900');
INSERT INTO `ss_area` VALUES ('211000', '辽阳市', '210000');
INSERT INTO `ss_area` VALUES ('211001', '市辖区', '211000');
INSERT INTO `ss_area` VALUES ('211002', '白塔区', '211000');
INSERT INTO `ss_area` VALUES ('211003', '文圣区', '211000');
INSERT INTO `ss_area` VALUES ('211004', '宏伟区', '211000');
INSERT INTO `ss_area` VALUES ('211005', '弓长岭区', '211000');
INSERT INTO `ss_area` VALUES ('211011', '太子河区', '211000');
INSERT INTO `ss_area` VALUES ('211021', '辽阳县', '211000');
INSERT INTO `ss_area` VALUES ('211081', '灯塔市', '211000');
INSERT INTO `ss_area` VALUES ('211100', '盘锦市', '210000');
INSERT INTO `ss_area` VALUES ('211101', '市辖区', '211100');
INSERT INTO `ss_area` VALUES ('211102', '双台子区', '211100');
INSERT INTO `ss_area` VALUES ('211103', '兴隆台区', '211100');
INSERT INTO `ss_area` VALUES ('211121', '大洼县', '211100');
INSERT INTO `ss_area` VALUES ('211122', '盘山县', '211100');
INSERT INTO `ss_area` VALUES ('211200', '铁岭市', '210000');
INSERT INTO `ss_area` VALUES ('211201', '市辖区', '211200');
INSERT INTO `ss_area` VALUES ('211202', '银州区', '211200');
INSERT INTO `ss_area` VALUES ('211204', '清河区', '211200');
INSERT INTO `ss_area` VALUES ('211221', '铁岭县', '211200');
INSERT INTO `ss_area` VALUES ('211223', '西丰县', '211200');
INSERT INTO `ss_area` VALUES ('211224', '昌图县', '211200');
INSERT INTO `ss_area` VALUES ('211281', '调兵山市', '211200');
INSERT INTO `ss_area` VALUES ('211282', '开原市', '211200');
INSERT INTO `ss_area` VALUES ('211300', '朝阳市', '210000');
INSERT INTO `ss_area` VALUES ('211301', '市辖区', '211300');
INSERT INTO `ss_area` VALUES ('211302', '双塔区', '211300');
INSERT INTO `ss_area` VALUES ('211303', '龙城区', '211300');
INSERT INTO `ss_area` VALUES ('211321', '朝阳县', '211300');
INSERT INTO `ss_area` VALUES ('211322', '建平县', '211300');
INSERT INTO `ss_area` VALUES ('211324', '喀喇沁左翼蒙古族自治县', '211300');
INSERT INTO `ss_area` VALUES ('211381', '北票市', '211300');
INSERT INTO `ss_area` VALUES ('211382', '凌源市', '211300');
INSERT INTO `ss_area` VALUES ('211400', '葫芦岛市', '210000');
INSERT INTO `ss_area` VALUES ('211401', '市辖区', '211400');
INSERT INTO `ss_area` VALUES ('211402', '连山区', '211400');
INSERT INTO `ss_area` VALUES ('211403', '龙港区', '211400');
INSERT INTO `ss_area` VALUES ('211404', '南票区', '211400');
INSERT INTO `ss_area` VALUES ('211421', '绥中县', '211400');
INSERT INTO `ss_area` VALUES ('211422', '建昌县', '211400');
INSERT INTO `ss_area` VALUES ('211481', '兴城市', '211400');
INSERT INTO `ss_area` VALUES ('220000', '吉林省', '0');
INSERT INTO `ss_area` VALUES ('220100', '长春市', '220000');
INSERT INTO `ss_area` VALUES ('220101', '市辖区', '220100');
INSERT INTO `ss_area` VALUES ('220102', '南关区', '220100');
INSERT INTO `ss_area` VALUES ('220103', '宽城区', '220100');
INSERT INTO `ss_area` VALUES ('220104', '朝阳区', '220100');
INSERT INTO `ss_area` VALUES ('220105', '二道区', '220100');
INSERT INTO `ss_area` VALUES ('220106', '绿园区', '220100');
INSERT INTO `ss_area` VALUES ('220112', '双阳区', '220100');
INSERT INTO `ss_area` VALUES ('220122', '农安县', '220100');
INSERT INTO `ss_area` VALUES ('220181', '九台市', '220100');
INSERT INTO `ss_area` VALUES ('220182', '榆树市', '220100');
INSERT INTO `ss_area` VALUES ('220183', '德惠市', '220100');
INSERT INTO `ss_area` VALUES ('220200', '吉林市', '220000');
INSERT INTO `ss_area` VALUES ('220201', '市辖区', '220200');
INSERT INTO `ss_area` VALUES ('220202', '昌邑区', '220200');
INSERT INTO `ss_area` VALUES ('220203', '龙潭区', '220200');
INSERT INTO `ss_area` VALUES ('220204', '船营区', '220200');
INSERT INTO `ss_area` VALUES ('220211', '丰满区', '220200');
INSERT INTO `ss_area` VALUES ('220221', '永吉县', '220200');
INSERT INTO `ss_area` VALUES ('220281', '蛟河市', '220200');
INSERT INTO `ss_area` VALUES ('220282', '桦甸市', '220200');
INSERT INTO `ss_area` VALUES ('220283', '舒兰市', '220200');
INSERT INTO `ss_area` VALUES ('220284', '磐石市', '220200');
INSERT INTO `ss_area` VALUES ('220300', '四平市', '220000');
INSERT INTO `ss_area` VALUES ('220301', '市辖区', '220300');
INSERT INTO `ss_area` VALUES ('220302', '铁西区', '220300');
INSERT INTO `ss_area` VALUES ('220303', '铁东区', '220300');
INSERT INTO `ss_area` VALUES ('220322', '梨树县', '220300');
INSERT INTO `ss_area` VALUES ('220323', '伊通满族自治县', '220300');
INSERT INTO `ss_area` VALUES ('220381', '公主岭市', '220300');
INSERT INTO `ss_area` VALUES ('220382', '双辽市', '220300');
INSERT INTO `ss_area` VALUES ('220400', '辽源市', '220000');
INSERT INTO `ss_area` VALUES ('220401', '市辖区', '220400');
INSERT INTO `ss_area` VALUES ('220402', '龙山区', '220400');
INSERT INTO `ss_area` VALUES ('220403', '西安区', '220400');
INSERT INTO `ss_area` VALUES ('220421', '东丰县', '220400');
INSERT INTO `ss_area` VALUES ('220422', '东辽县', '220400');
INSERT INTO `ss_area` VALUES ('220500', '通化市', '220000');
INSERT INTO `ss_area` VALUES ('220501', '市辖区', '220500');
INSERT INTO `ss_area` VALUES ('220502', '东昌区', '220500');
INSERT INTO `ss_area` VALUES ('220503', '二道江区', '220500');
INSERT INTO `ss_area` VALUES ('220521', '通化县', '220500');
INSERT INTO `ss_area` VALUES ('220523', '辉南县', '220500');
INSERT INTO `ss_area` VALUES ('220524', '柳河县', '220500');
INSERT INTO `ss_area` VALUES ('220581', '梅河口市', '220500');
INSERT INTO `ss_area` VALUES ('220582', '集安市', '220500');
INSERT INTO `ss_area` VALUES ('220600', '白山市', '220000');
INSERT INTO `ss_area` VALUES ('220601', '市辖区', '220600');
INSERT INTO `ss_area` VALUES ('220602', '八道江区', '220600');
INSERT INTO `ss_area` VALUES ('220621', '抚松县', '220600');
INSERT INTO `ss_area` VALUES ('220622', '靖宇县', '220600');
INSERT INTO `ss_area` VALUES ('220623', '长白朝鲜族自治县', '220600');
INSERT INTO `ss_area` VALUES ('220625', '江源县', '220600');
INSERT INTO `ss_area` VALUES ('220681', '临江市', '220600');
INSERT INTO `ss_area` VALUES ('220700', '松原市', '220000');
INSERT INTO `ss_area` VALUES ('220701', '市辖区', '220700');
INSERT INTO `ss_area` VALUES ('220702', '宁江区', '220700');
INSERT INTO `ss_area` VALUES ('220721', '前郭尔罗斯蒙古族自治县', '220700');
INSERT INTO `ss_area` VALUES ('220722', '长岭县', '220700');
INSERT INTO `ss_area` VALUES ('220723', '乾安县', '220700');
INSERT INTO `ss_area` VALUES ('220724', '扶余县', '220700');
INSERT INTO `ss_area` VALUES ('220800', '白城市', '220000');
INSERT INTO `ss_area` VALUES ('220801', '市辖区', '220800');
INSERT INTO `ss_area` VALUES ('220802', '洮北区', '220800');
INSERT INTO `ss_area` VALUES ('220821', '镇赉县', '220800');
INSERT INTO `ss_area` VALUES ('220822', '通榆县', '220800');
INSERT INTO `ss_area` VALUES ('220881', '洮南市', '220800');
INSERT INTO `ss_area` VALUES ('220882', '大安市', '220800');
INSERT INTO `ss_area` VALUES ('222400', '延边朝鲜族自治州', '220000');
INSERT INTO `ss_area` VALUES ('222401', '延吉市', '222400');
INSERT INTO `ss_area` VALUES ('222402', '图们市', '222400');
INSERT INTO `ss_area` VALUES ('222403', '敦化市', '222400');
INSERT INTO `ss_area` VALUES ('222404', '珲春市', '222400');
INSERT INTO `ss_area` VALUES ('222405', '龙井市', '222400');
INSERT INTO `ss_area` VALUES ('222406', '和龙市', '222400');
INSERT INTO `ss_area` VALUES ('222424', '汪清县', '222400');
INSERT INTO `ss_area` VALUES ('222426', '安图县', '222400');
INSERT INTO `ss_area` VALUES ('230000', '黑龙江省', '0');
INSERT INTO `ss_area` VALUES ('230100', '哈尔滨市', '230000');
INSERT INTO `ss_area` VALUES ('230101', '市辖区', '230100');
INSERT INTO `ss_area` VALUES ('230102', '道里区', '230100');
INSERT INTO `ss_area` VALUES ('230103', '南岗区', '230100');
INSERT INTO `ss_area` VALUES ('230104', '道外区', '230100');
INSERT INTO `ss_area` VALUES ('230106', '香坊区', '230100');
INSERT INTO `ss_area` VALUES ('230107', '动力区', '230100');
INSERT INTO `ss_area` VALUES ('230108', '平房区', '230100');
INSERT INTO `ss_area` VALUES ('230109', '松北区', '230100');
INSERT INTO `ss_area` VALUES ('230111', '呼兰区', '230100');
INSERT INTO `ss_area` VALUES ('230123', '依兰县', '230100');
INSERT INTO `ss_area` VALUES ('230124', '方正县', '230100');
INSERT INTO `ss_area` VALUES ('230125', '宾　县', '230100');
INSERT INTO `ss_area` VALUES ('230126', '巴彦县', '230100');
INSERT INTO `ss_area` VALUES ('230127', '木兰县', '230100');
INSERT INTO `ss_area` VALUES ('230128', '通河县', '230100');
INSERT INTO `ss_area` VALUES ('230129', '延寿县', '230100');
INSERT INTO `ss_area` VALUES ('230181', '阿城市', '230100');
INSERT INTO `ss_area` VALUES ('230182', '双城市', '230100');
INSERT INTO `ss_area` VALUES ('230183', '尚志市', '230100');
INSERT INTO `ss_area` VALUES ('230184', '五常市', '230100');
INSERT INTO `ss_area` VALUES ('230200', '齐齐哈尔市', '230000');
INSERT INTO `ss_area` VALUES ('230201', '市辖区', '230200');
INSERT INTO `ss_area` VALUES ('230202', '龙沙区', '230200');
INSERT INTO `ss_area` VALUES ('230203', '建华区', '230200');
INSERT INTO `ss_area` VALUES ('230204', '铁锋区', '230200');
INSERT INTO `ss_area` VALUES ('230205', '昂昂溪区', '230200');
INSERT INTO `ss_area` VALUES ('230206', '富拉尔基区', '230200');
INSERT INTO `ss_area` VALUES ('230207', '碾子山区', '230200');
INSERT INTO `ss_area` VALUES ('230208', '梅里斯达斡尔族区', '230200');
INSERT INTO `ss_area` VALUES ('230221', '龙江县', '230200');
INSERT INTO `ss_area` VALUES ('230223', '依安县', '230200');
INSERT INTO `ss_area` VALUES ('230224', '泰来县', '230200');
INSERT INTO `ss_area` VALUES ('230225', '甘南县', '230200');
INSERT INTO `ss_area` VALUES ('230227', '富裕县', '230200');
INSERT INTO `ss_area` VALUES ('230229', '克山县', '230200');
INSERT INTO `ss_area` VALUES ('230230', '克东县', '230200');
INSERT INTO `ss_area` VALUES ('230231', '拜泉县', '230200');
INSERT INTO `ss_area` VALUES ('230281', '讷河市', '230200');
INSERT INTO `ss_area` VALUES ('230300', '鸡西市', '230000');
INSERT INTO `ss_area` VALUES ('230301', '市辖区', '230300');
INSERT INTO `ss_area` VALUES ('230302', '鸡冠区', '230300');
INSERT INTO `ss_area` VALUES ('230303', '恒山区', '230300');
INSERT INTO `ss_area` VALUES ('230304', '滴道区', '230300');
INSERT INTO `ss_area` VALUES ('230305', '梨树区', '230300');
INSERT INTO `ss_area` VALUES ('230306', '城子河区', '230300');
INSERT INTO `ss_area` VALUES ('230307', '麻山区', '230300');
INSERT INTO `ss_area` VALUES ('230321', '鸡东县', '230300');
INSERT INTO `ss_area` VALUES ('230381', '虎林市', '230300');
INSERT INTO `ss_area` VALUES ('230382', '密山市', '230300');
INSERT INTO `ss_area` VALUES ('230400', '鹤岗市', '230000');
INSERT INTO `ss_area` VALUES ('230401', '市辖区', '230400');
INSERT INTO `ss_area` VALUES ('230402', '向阳区', '230400');
INSERT INTO `ss_area` VALUES ('230403', '工农区', '230400');
INSERT INTO `ss_area` VALUES ('230404', '南山区', '230400');
INSERT INTO `ss_area` VALUES ('230405', '兴安区', '230400');
INSERT INTO `ss_area` VALUES ('230406', '东山区', '230400');
INSERT INTO `ss_area` VALUES ('230407', '兴山区', '230400');
INSERT INTO `ss_area` VALUES ('230421', '萝北县', '230400');
INSERT INTO `ss_area` VALUES ('230422', '绥滨县', '230400');
INSERT INTO `ss_area` VALUES ('230500', '双鸭山市', '230000');
INSERT INTO `ss_area` VALUES ('230501', '市辖区', '230500');
INSERT INTO `ss_area` VALUES ('230502', '尖山区', '230500');
INSERT INTO `ss_area` VALUES ('230503', '岭东区', '230500');
INSERT INTO `ss_area` VALUES ('230505', '四方台区', '230500');
INSERT INTO `ss_area` VALUES ('230506', '宝山区', '230500');
INSERT INTO `ss_area` VALUES ('230521', '集贤县', '230500');
INSERT INTO `ss_area` VALUES ('230522', '友谊县', '230500');
INSERT INTO `ss_area` VALUES ('230523', '宝清县', '230500');
INSERT INTO `ss_area` VALUES ('230524', '饶河县', '230500');
INSERT INTO `ss_area` VALUES ('230600', '大庆市', '230000');
INSERT INTO `ss_area` VALUES ('230601', '市辖区', '230600');
INSERT INTO `ss_area` VALUES ('230602', '萨尔图区', '230600');
INSERT INTO `ss_area` VALUES ('230603', '龙凤区', '230600');
INSERT INTO `ss_area` VALUES ('230604', '让胡路区', '230600');
INSERT INTO `ss_area` VALUES ('230605', '红岗区', '230600');
INSERT INTO `ss_area` VALUES ('230606', '大同区', '230600');
INSERT INTO `ss_area` VALUES ('230621', '肇州县', '230600');
INSERT INTO `ss_area` VALUES ('230622', '肇源县', '230600');
INSERT INTO `ss_area` VALUES ('230623', '林甸县', '230600');
INSERT INTO `ss_area` VALUES ('230624', '杜尔伯特蒙古族自治县', '230600');
INSERT INTO `ss_area` VALUES ('230700', '伊春市', '230000');
INSERT INTO `ss_area` VALUES ('230701', '市辖区', '230700');
INSERT INTO `ss_area` VALUES ('230702', '伊春区', '230700');
INSERT INTO `ss_area` VALUES ('230703', '南岔区', '230700');
INSERT INTO `ss_area` VALUES ('230704', '友好区', '230700');
INSERT INTO `ss_area` VALUES ('230705', '西林区', '230700');
INSERT INTO `ss_area` VALUES ('230706', '翠峦区', '230700');
INSERT INTO `ss_area` VALUES ('230707', '新青区', '230700');
INSERT INTO `ss_area` VALUES ('230708', '美溪区', '230700');
INSERT INTO `ss_area` VALUES ('230709', '金山屯区', '230700');
INSERT INTO `ss_area` VALUES ('230710', '五营区', '230700');
INSERT INTO `ss_area` VALUES ('230711', '乌马河区', '230700');
INSERT INTO `ss_area` VALUES ('230712', '汤旺河区', '230700');
INSERT INTO `ss_area` VALUES ('230713', '带岭区', '230700');
INSERT INTO `ss_area` VALUES ('230714', '乌伊岭区', '230700');
INSERT INTO `ss_area` VALUES ('230715', '红星区', '230700');
INSERT INTO `ss_area` VALUES ('230716', '上甘岭区', '230700');
INSERT INTO `ss_area` VALUES ('230722', '嘉荫县', '230700');
INSERT INTO `ss_area` VALUES ('230781', '铁力市', '230700');
INSERT INTO `ss_area` VALUES ('230800', '佳木斯市', '230000');
INSERT INTO `ss_area` VALUES ('230801', '市辖区', '230800');
INSERT INTO `ss_area` VALUES ('230802', '永红区', '230800');
INSERT INTO `ss_area` VALUES ('230803', '向阳区', '230800');
INSERT INTO `ss_area` VALUES ('230804', '前进区', '230800');
INSERT INTO `ss_area` VALUES ('230805', '东风区', '230800');
INSERT INTO `ss_area` VALUES ('230811', '郊　区', '230800');
INSERT INTO `ss_area` VALUES ('230822', '桦南县', '230800');
INSERT INTO `ss_area` VALUES ('230826', '桦川县', '230800');
INSERT INTO `ss_area` VALUES ('230828', '汤原县', '230800');
INSERT INTO `ss_area` VALUES ('230833', '抚远县', '230800');
INSERT INTO `ss_area` VALUES ('230881', '同江市', '230800');
INSERT INTO `ss_area` VALUES ('230882', '富锦市', '230800');
INSERT INTO `ss_area` VALUES ('230900', '七台河市', '230000');
INSERT INTO `ss_area` VALUES ('230901', '市辖区', '230900');
INSERT INTO `ss_area` VALUES ('230902', '新兴区', '230900');
INSERT INTO `ss_area` VALUES ('230903', '桃山区', '230900');
INSERT INTO `ss_area` VALUES ('230904', '茄子河区', '230900');
INSERT INTO `ss_area` VALUES ('230921', '勃利县', '230900');
INSERT INTO `ss_area` VALUES ('231000', '牡丹江市', '230000');
INSERT INTO `ss_area` VALUES ('231001', '市辖区', '231000');
INSERT INTO `ss_area` VALUES ('231002', '东安区', '231000');
INSERT INTO `ss_area` VALUES ('231003', '阳明区', '231000');
INSERT INTO `ss_area` VALUES ('231004', '爱民区', '231000');
INSERT INTO `ss_area` VALUES ('231005', '西安区', '231000');
INSERT INTO `ss_area` VALUES ('231024', '东宁县', '231000');
INSERT INTO `ss_area` VALUES ('231025', '林口县', '231000');
INSERT INTO `ss_area` VALUES ('231081', '绥芬河市', '231000');
INSERT INTO `ss_area` VALUES ('231083', '海林市', '231000');
INSERT INTO `ss_area` VALUES ('231084', '宁安市', '231000');
INSERT INTO `ss_area` VALUES ('231085', '穆棱市', '231000');
INSERT INTO `ss_area` VALUES ('231100', '黑河市', '230000');
INSERT INTO `ss_area` VALUES ('231101', '市辖区', '231100');
INSERT INTO `ss_area` VALUES ('231102', '爱辉区', '231100');
INSERT INTO `ss_area` VALUES ('231121', '嫩江县', '231100');
INSERT INTO `ss_area` VALUES ('231123', '逊克县', '231100');
INSERT INTO `ss_area` VALUES ('231124', '孙吴县', '231100');
INSERT INTO `ss_area` VALUES ('231181', '北安市', '231100');
INSERT INTO `ss_area` VALUES ('231182', '五大连池市', '231100');
INSERT INTO `ss_area` VALUES ('231200', '绥化市', '230000');
INSERT INTO `ss_area` VALUES ('231201', '市辖区', '231200');
INSERT INTO `ss_area` VALUES ('231202', '北林区', '231200');
INSERT INTO `ss_area` VALUES ('231221', '望奎县', '231200');
INSERT INTO `ss_area` VALUES ('231222', '兰西县', '231200');
INSERT INTO `ss_area` VALUES ('231223', '青冈县', '231200');
INSERT INTO `ss_area` VALUES ('231224', '庆安县', '231200');
INSERT INTO `ss_area` VALUES ('231225', '明水县', '231200');
INSERT INTO `ss_area` VALUES ('231226', '绥棱县', '231200');
INSERT INTO `ss_area` VALUES ('231281', '安达市', '231200');
INSERT INTO `ss_area` VALUES ('231282', '肇东市', '231200');
INSERT INTO `ss_area` VALUES ('231283', '海伦市', '231200');
INSERT INTO `ss_area` VALUES ('232700', '大兴安岭地区', '230000');
INSERT INTO `ss_area` VALUES ('232721', '呼玛县', '232700');
INSERT INTO `ss_area` VALUES ('232722', '塔河县', '232700');
INSERT INTO `ss_area` VALUES ('232723', '漠河县', '232700');
INSERT INTO `ss_area` VALUES ('310000', '上海市', '0');
INSERT INTO `ss_area` VALUES ('310100', '市辖区', '310000');
INSERT INTO `ss_area` VALUES ('310101', '黄浦区', '310100');
INSERT INTO `ss_area` VALUES ('310103', '卢湾区', '310100');
INSERT INTO `ss_area` VALUES ('310104', '徐汇区', '310100');
INSERT INTO `ss_area` VALUES ('310105', '长宁区', '310100');
INSERT INTO `ss_area` VALUES ('310106', '静安区', '310100');
INSERT INTO `ss_area` VALUES ('310107', '普陀区', '310100');
INSERT INTO `ss_area` VALUES ('310108', '闸北区', '310100');
INSERT INTO `ss_area` VALUES ('310109', '虹口区', '310100');
INSERT INTO `ss_area` VALUES ('310110', '杨浦区', '310100');
INSERT INTO `ss_area` VALUES ('310112', '闵行区', '310100');
INSERT INTO `ss_area` VALUES ('310113', '宝山区', '310100');
INSERT INTO `ss_area` VALUES ('310114', '嘉定区', '310100');
INSERT INTO `ss_area` VALUES ('310115', '浦东新区', '310100');
INSERT INTO `ss_area` VALUES ('310116', '金山区', '310100');
INSERT INTO `ss_area` VALUES ('310117', '松江区', '310100');
INSERT INTO `ss_area` VALUES ('310118', '青浦区', '310100');
INSERT INTO `ss_area` VALUES ('310119', '南汇区', '310100');
INSERT INTO `ss_area` VALUES ('310120', '奉贤区', '310100');
INSERT INTO `ss_area` VALUES ('310200', '县', '310000');
INSERT INTO `ss_area` VALUES ('310230', '崇明县', '310200');
INSERT INTO `ss_area` VALUES ('320000', '江苏省', '0');
INSERT INTO `ss_area` VALUES ('320100', '南京市', '320000');
INSERT INTO `ss_area` VALUES ('320101', '市辖区', '320100');
INSERT INTO `ss_area` VALUES ('320102', '玄武区', '320100');
INSERT INTO `ss_area` VALUES ('320103', '白下区', '320100');
INSERT INTO `ss_area` VALUES ('320104', '秦淮区', '320100');
INSERT INTO `ss_area` VALUES ('320105', '建邺区', '320100');
INSERT INTO `ss_area` VALUES ('320106', '鼓楼区', '320100');
INSERT INTO `ss_area` VALUES ('320107', '下关区', '320100');
INSERT INTO `ss_area` VALUES ('320111', '浦口区', '320100');
INSERT INTO `ss_area` VALUES ('320113', '栖霞区', '320100');
INSERT INTO `ss_area` VALUES ('320114', '雨花台区', '320100');
INSERT INTO `ss_area` VALUES ('320115', '江宁区', '320100');
INSERT INTO `ss_area` VALUES ('320116', '六合区', '320100');
INSERT INTO `ss_area` VALUES ('320124', '溧水县', '320100');
INSERT INTO `ss_area` VALUES ('320125', '高淳县', '320100');
INSERT INTO `ss_area` VALUES ('320200', '无锡市', '320000');
INSERT INTO `ss_area` VALUES ('320201', '市辖区', '320200');
INSERT INTO `ss_area` VALUES ('320202', '崇安区', '320200');
INSERT INTO `ss_area` VALUES ('320203', '南长区', '320200');
INSERT INTO `ss_area` VALUES ('320204', '北塘区', '320200');
INSERT INTO `ss_area` VALUES ('320205', '锡山区', '320200');
INSERT INTO `ss_area` VALUES ('320206', '惠山区', '320200');
INSERT INTO `ss_area` VALUES ('320211', '滨湖区', '320200');
INSERT INTO `ss_area` VALUES ('320281', '江阴市', '320200');
INSERT INTO `ss_area` VALUES ('320282', '宜兴市', '320200');
INSERT INTO `ss_area` VALUES ('320300', '徐州市', '320000');
INSERT INTO `ss_area` VALUES ('320301', '市辖区', '320300');
INSERT INTO `ss_area` VALUES ('320302', '鼓楼区', '320300');
INSERT INTO `ss_area` VALUES ('320303', '云龙区', '320300');
INSERT INTO `ss_area` VALUES ('320304', '九里区', '320300');
INSERT INTO `ss_area` VALUES ('320305', '贾汪区', '320300');
INSERT INTO `ss_area` VALUES ('320311', '泉山区', '320300');
INSERT INTO `ss_area` VALUES ('320321', '丰　县', '320300');
INSERT INTO `ss_area` VALUES ('320322', '沛　县', '320300');
INSERT INTO `ss_area` VALUES ('320323', '铜山县', '320300');
INSERT INTO `ss_area` VALUES ('320324', '睢宁县', '320300');
INSERT INTO `ss_area` VALUES ('320381', '新沂市', '320300');
INSERT INTO `ss_area` VALUES ('320382', '邳州市', '320300');
INSERT INTO `ss_area` VALUES ('320400', '常州市', '320000');
INSERT INTO `ss_area` VALUES ('320401', '市辖区', '320400');
INSERT INTO `ss_area` VALUES ('320402', '天宁区', '320400');
INSERT INTO `ss_area` VALUES ('320404', '钟楼区', '320400');
INSERT INTO `ss_area` VALUES ('320405', '戚墅堰区', '320400');
INSERT INTO `ss_area` VALUES ('320411', '新北区', '320400');
INSERT INTO `ss_area` VALUES ('320412', '武进区', '320400');
INSERT INTO `ss_area` VALUES ('320481', '溧阳市', '320400');
INSERT INTO `ss_area` VALUES ('320482', '金坛市', '320400');
INSERT INTO `ss_area` VALUES ('320500', '苏州市', '320000');
INSERT INTO `ss_area` VALUES ('320501', '市辖区', '320500');
INSERT INTO `ss_area` VALUES ('320502', '沧浪区', '320500');
INSERT INTO `ss_area` VALUES ('320503', '平江区', '320500');
INSERT INTO `ss_area` VALUES ('320504', '金阊区', '320500');
INSERT INTO `ss_area` VALUES ('320505', '虎丘区', '320500');
INSERT INTO `ss_area` VALUES ('320506', '吴中区', '320500');
INSERT INTO `ss_area` VALUES ('320507', '相城区', '320500');
INSERT INTO `ss_area` VALUES ('320581', '常熟市', '320500');
INSERT INTO `ss_area` VALUES ('320582', '张家港市', '320500');
INSERT INTO `ss_area` VALUES ('320583', '昆山市', '320500');
INSERT INTO `ss_area` VALUES ('320584', '吴江市', '320500');
INSERT INTO `ss_area` VALUES ('320585', '太仓市', '320500');
INSERT INTO `ss_area` VALUES ('320600', '南通市', '320000');
INSERT INTO `ss_area` VALUES ('320601', '市辖区', '320600');
INSERT INTO `ss_area` VALUES ('320602', '崇川区', '320600');
INSERT INTO `ss_area` VALUES ('320611', '港闸区', '320600');
INSERT INTO `ss_area` VALUES ('320621', '海安县', '320600');
INSERT INTO `ss_area` VALUES ('320623', '如东县', '320600');
INSERT INTO `ss_area` VALUES ('320681', '启东市', '320600');
INSERT INTO `ss_area` VALUES ('320682', '如皋市', '320600');
INSERT INTO `ss_area` VALUES ('320683', '通州市', '320600');
INSERT INTO `ss_area` VALUES ('320684', '海门市', '320600');
INSERT INTO `ss_area` VALUES ('320700', '连云港市', '320000');
INSERT INTO `ss_area` VALUES ('320701', '市辖区', '320700');
INSERT INTO `ss_area` VALUES ('320703', '连云区', '320700');
INSERT INTO `ss_area` VALUES ('320705', '新浦区', '320700');
INSERT INTO `ss_area` VALUES ('320706', '海州区', '320700');
INSERT INTO `ss_area` VALUES ('320721', '赣榆县', '320700');
INSERT INTO `ss_area` VALUES ('320722', '东海县', '320700');
INSERT INTO `ss_area` VALUES ('320723', '灌云县', '320700');
INSERT INTO `ss_area` VALUES ('320724', '灌南县', '320700');
INSERT INTO `ss_area` VALUES ('320800', '淮安市', '320000');
INSERT INTO `ss_area` VALUES ('320801', '市辖区', '320800');
INSERT INTO `ss_area` VALUES ('320802', '清河区', '320800');
INSERT INTO `ss_area` VALUES ('320803', '楚州区', '320800');
INSERT INTO `ss_area` VALUES ('320804', '淮阴区', '320800');
INSERT INTO `ss_area` VALUES ('320811', '清浦区', '320800');
INSERT INTO `ss_area` VALUES ('320826', '涟水县', '320800');
INSERT INTO `ss_area` VALUES ('320829', '洪泽县', '320800');
INSERT INTO `ss_area` VALUES ('320830', '盱眙县', '320800');
INSERT INTO `ss_area` VALUES ('320831', '金湖县', '320800');
INSERT INTO `ss_area` VALUES ('320900', '盐城市', '320000');
INSERT INTO `ss_area` VALUES ('320901', '市辖区', '320900');
INSERT INTO `ss_area` VALUES ('320902', '亭湖区', '320900');
INSERT INTO `ss_area` VALUES ('320903', '盐都区', '320900');
INSERT INTO `ss_area` VALUES ('320921', '响水县', '320900');
INSERT INTO `ss_area` VALUES ('320922', '滨海县', '320900');
INSERT INTO `ss_area` VALUES ('320923', '阜宁县', '320900');
INSERT INTO `ss_area` VALUES ('320924', '射阳县', '320900');
INSERT INTO `ss_area` VALUES ('320925', '建湖县', '320900');
INSERT INTO `ss_area` VALUES ('320981', '东台市', '320900');
INSERT INTO `ss_area` VALUES ('320982', '大丰市', '320900');
INSERT INTO `ss_area` VALUES ('321000', '扬州市', '320000');
INSERT INTO `ss_area` VALUES ('321001', '市辖区', '321000');
INSERT INTO `ss_area` VALUES ('321002', '广陵区', '321000');
INSERT INTO `ss_area` VALUES ('321003', '邗江区', '321000');
INSERT INTO `ss_area` VALUES ('321011', '郊　区', '321000');
INSERT INTO `ss_area` VALUES ('321023', '宝应县', '321000');
INSERT INTO `ss_area` VALUES ('321081', '仪征市', '321000');
INSERT INTO `ss_area` VALUES ('321084', '高邮市', '321000');
INSERT INTO `ss_area` VALUES ('321088', '江都市', '321000');
INSERT INTO `ss_area` VALUES ('321100', '镇江市', '320000');
INSERT INTO `ss_area` VALUES ('321101', '市辖区', '321100');
INSERT INTO `ss_area` VALUES ('321102', '京口区', '321100');
INSERT INTO `ss_area` VALUES ('321111', '润州区', '321100');
INSERT INTO `ss_area` VALUES ('321112', '丹徒区', '321100');
INSERT INTO `ss_area` VALUES ('321181', '丹阳市', '321100');
INSERT INTO `ss_area` VALUES ('321182', '扬中市', '321100');
INSERT INTO `ss_area` VALUES ('321183', '句容市', '321100');
INSERT INTO `ss_area` VALUES ('321200', '泰州市', '320000');
INSERT INTO `ss_area` VALUES ('321201', '市辖区', '321200');
INSERT INTO `ss_area` VALUES ('321202', '海陵区', '321200');
INSERT INTO `ss_area` VALUES ('321203', '高港区', '321200');
INSERT INTO `ss_area` VALUES ('321281', '兴化市', '321200');
INSERT INTO `ss_area` VALUES ('321282', '靖江市', '321200');
INSERT INTO `ss_area` VALUES ('321283', '泰兴市', '321200');
INSERT INTO `ss_area` VALUES ('321284', '姜堰市', '321200');
INSERT INTO `ss_area` VALUES ('321300', '宿迁市', '320000');
INSERT INTO `ss_area` VALUES ('321301', '市辖区', '321300');
INSERT INTO `ss_area` VALUES ('321302', '宿城区', '321300');
INSERT INTO `ss_area` VALUES ('321311', '宿豫区', '321300');
INSERT INTO `ss_area` VALUES ('321322', '沭阳县', '321300');
INSERT INTO `ss_area` VALUES ('321323', '泗阳县', '321300');
INSERT INTO `ss_area` VALUES ('321324', '泗洪县', '321300');
INSERT INTO `ss_area` VALUES ('330000', '浙江省', '0');
INSERT INTO `ss_area` VALUES ('330100', '杭州市', '330000');
INSERT INTO `ss_area` VALUES ('330101', '市辖区', '330100');
INSERT INTO `ss_area` VALUES ('330102', '上城区', '330100');
INSERT INTO `ss_area` VALUES ('330103', '下城区', '330100');
INSERT INTO `ss_area` VALUES ('330104', '江干区', '330100');
INSERT INTO `ss_area` VALUES ('330105', '拱墅区', '330100');
INSERT INTO `ss_area` VALUES ('330106', '西湖区', '330100');
INSERT INTO `ss_area` VALUES ('330108', '滨江区', '330100');
INSERT INTO `ss_area` VALUES ('330109', '萧山区', '330100');
INSERT INTO `ss_area` VALUES ('330110', '余杭区', '330100');
INSERT INTO `ss_area` VALUES ('330122', '桐庐县', '330100');
INSERT INTO `ss_area` VALUES ('330127', '淳安县', '330100');
INSERT INTO `ss_area` VALUES ('330182', '建德市', '330100');
INSERT INTO `ss_area` VALUES ('330183', '富阳市', '330100');
INSERT INTO `ss_area` VALUES ('330185', '临安市', '330100');
INSERT INTO `ss_area` VALUES ('330200', '宁波市', '330000');
INSERT INTO `ss_area` VALUES ('330201', '市辖区', '330200');
INSERT INTO `ss_area` VALUES ('330203', '海曙区', '330200');
INSERT INTO `ss_area` VALUES ('330204', '江东区', '330200');
INSERT INTO `ss_area` VALUES ('330205', '江北区', '330200');
INSERT INTO `ss_area` VALUES ('330206', '北仑区', '330200');
INSERT INTO `ss_area` VALUES ('330211', '镇海区', '330200');
INSERT INTO `ss_area` VALUES ('330212', '鄞州区', '330200');
INSERT INTO `ss_area` VALUES ('330225', '象山县', '330200');
INSERT INTO `ss_area` VALUES ('330226', '宁海县', '330200');
INSERT INTO `ss_area` VALUES ('330281', '余姚市', '330200');
INSERT INTO `ss_area` VALUES ('330282', '慈溪市', '330200');
INSERT INTO `ss_area` VALUES ('330283', '奉化市', '330200');
INSERT INTO `ss_area` VALUES ('330300', '温州市', '330000');
INSERT INTO `ss_area` VALUES ('330301', '市辖区', '330300');
INSERT INTO `ss_area` VALUES ('330302', '鹿城区', '330300');
INSERT INTO `ss_area` VALUES ('330303', '龙湾区', '330300');
INSERT INTO `ss_area` VALUES ('330304', '瓯海区', '330300');
INSERT INTO `ss_area` VALUES ('330322', '洞头县', '330300');
INSERT INTO `ss_area` VALUES ('330324', '永嘉县', '330300');
INSERT INTO `ss_area` VALUES ('330326', '平阳县', '330300');
INSERT INTO `ss_area` VALUES ('330327', '苍南县', '330300');
INSERT INTO `ss_area` VALUES ('330328', '文成县', '330300');
INSERT INTO `ss_area` VALUES ('330329', '泰顺县', '330300');
INSERT INTO `ss_area` VALUES ('330381', '瑞安市', '330300');
INSERT INTO `ss_area` VALUES ('330382', '乐清市', '330300');
INSERT INTO `ss_area` VALUES ('330400', '嘉兴市', '330000');
INSERT INTO `ss_area` VALUES ('330401', '市辖区', '330400');
INSERT INTO `ss_area` VALUES ('330402', '秀城区', '330400');
INSERT INTO `ss_area` VALUES ('330411', '秀洲区', '330400');
INSERT INTO `ss_area` VALUES ('330421', '嘉善县', '330400');
INSERT INTO `ss_area` VALUES ('330424', '海盐县', '330400');
INSERT INTO `ss_area` VALUES ('330481', '海宁市', '330400');
INSERT INTO `ss_area` VALUES ('330482', '平湖市', '330400');
INSERT INTO `ss_area` VALUES ('330483', '桐乡市', '330400');
INSERT INTO `ss_area` VALUES ('330500', '湖州市', '330000');
INSERT INTO `ss_area` VALUES ('330501', '市辖区', '330500');
INSERT INTO `ss_area` VALUES ('330502', '吴兴区', '330500');
INSERT INTO `ss_area` VALUES ('330503', '南浔区', '330500');
INSERT INTO `ss_area` VALUES ('330521', '德清县', '330500');
INSERT INTO `ss_area` VALUES ('330522', '长兴县', '330500');
INSERT INTO `ss_area` VALUES ('330523', '安吉县', '330500');
INSERT INTO `ss_area` VALUES ('330600', '绍兴市', '330000');
INSERT INTO `ss_area` VALUES ('330601', '市辖区', '330600');
INSERT INTO `ss_area` VALUES ('330602', '越城区', '330600');
INSERT INTO `ss_area` VALUES ('330621', '绍兴县', '330600');
INSERT INTO `ss_area` VALUES ('330624', '新昌县', '330600');
INSERT INTO `ss_area` VALUES ('330681', '诸暨市', '330600');
INSERT INTO `ss_area` VALUES ('330682', '上虞市', '330600');
INSERT INTO `ss_area` VALUES ('330683', '嵊州市', '330600');
INSERT INTO `ss_area` VALUES ('330700', '金华市', '330000');
INSERT INTO `ss_area` VALUES ('330701', '市辖区', '330700');
INSERT INTO `ss_area` VALUES ('330702', '婺城区', '330700');
INSERT INTO `ss_area` VALUES ('330703', '金东区', '330700');
INSERT INTO `ss_area` VALUES ('330723', '武义县', '330700');
INSERT INTO `ss_area` VALUES ('330726', '浦江县', '330700');
INSERT INTO `ss_area` VALUES ('330727', '磐安县', '330700');
INSERT INTO `ss_area` VALUES ('330781', '兰溪市', '330700');
INSERT INTO `ss_area` VALUES ('330782', '义乌市', '330700');
INSERT INTO `ss_area` VALUES ('330783', '东阳市', '330700');
INSERT INTO `ss_area` VALUES ('330784', '永康市', '330700');
INSERT INTO `ss_area` VALUES ('330800', '衢州市', '330000');
INSERT INTO `ss_area` VALUES ('330801', '市辖区', '330800');
INSERT INTO `ss_area` VALUES ('330802', '柯城区', '330800');
INSERT INTO `ss_area` VALUES ('330803', '衢江区', '330800');
INSERT INTO `ss_area` VALUES ('330822', '常山县', '330800');
INSERT INTO `ss_area` VALUES ('330824', '开化县', '330800');
INSERT INTO `ss_area` VALUES ('330825', '龙游县', '330800');
INSERT INTO `ss_area` VALUES ('330881', '江山市', '330800');
INSERT INTO `ss_area` VALUES ('330900', '舟山市', '330000');
INSERT INTO `ss_area` VALUES ('330901', '市辖区', '330900');
INSERT INTO `ss_area` VALUES ('330902', '定海区', '330900');
INSERT INTO `ss_area` VALUES ('330903', '普陀区', '330900');
INSERT INTO `ss_area` VALUES ('330921', '岱山县', '330900');
INSERT INTO `ss_area` VALUES ('330922', '嵊泗县', '330900');
INSERT INTO `ss_area` VALUES ('331000', '台州市', '330000');
INSERT INTO `ss_area` VALUES ('331001', '市辖区', '331000');
INSERT INTO `ss_area` VALUES ('331002', '椒江区', '331000');
INSERT INTO `ss_area` VALUES ('331003', '黄岩区', '331000');
INSERT INTO `ss_area` VALUES ('331004', '路桥区', '331000');
INSERT INTO `ss_area` VALUES ('331021', '玉环县', '331000');
INSERT INTO `ss_area` VALUES ('331022', '三门县', '331000');
INSERT INTO `ss_area` VALUES ('331023', '天台县', '331000');
INSERT INTO `ss_area` VALUES ('331024', '仙居县', '331000');
INSERT INTO `ss_area` VALUES ('331081', '温岭市', '331000');
INSERT INTO `ss_area` VALUES ('331082', '临海市', '331000');
INSERT INTO `ss_area` VALUES ('331100', '丽水市', '330000');
INSERT INTO `ss_area` VALUES ('331101', '市辖区', '331100');
INSERT INTO `ss_area` VALUES ('331102', '莲都区', '331100');
INSERT INTO `ss_area` VALUES ('331121', '青田县', '331100');
INSERT INTO `ss_area` VALUES ('331122', '缙云县', '331100');
INSERT INTO `ss_area` VALUES ('331123', '遂昌县', '331100');
INSERT INTO `ss_area` VALUES ('331124', '松阳县', '331100');
INSERT INTO `ss_area` VALUES ('331125', '云和县', '331100');
INSERT INTO `ss_area` VALUES ('331126', '庆元县', '331100');
INSERT INTO `ss_area` VALUES ('331127', '景宁畲族自治县', '331100');
INSERT INTO `ss_area` VALUES ('331181', '龙泉市', '331100');
INSERT INTO `ss_area` VALUES ('340000', '安徽省', '0');
INSERT INTO `ss_area` VALUES ('340100', '合肥市', '340000');
INSERT INTO `ss_area` VALUES ('340101', '市辖区', '340100');
INSERT INTO `ss_area` VALUES ('340102', '瑶海区', '340100');
INSERT INTO `ss_area` VALUES ('340103', '庐阳区', '340100');
INSERT INTO `ss_area` VALUES ('340104', '蜀山区', '340100');
INSERT INTO `ss_area` VALUES ('340111', '包河区', '340100');
INSERT INTO `ss_area` VALUES ('340121', '长丰县', '340100');
INSERT INTO `ss_area` VALUES ('340122', '肥东县', '340100');
INSERT INTO `ss_area` VALUES ('340123', '肥西县', '340100');
INSERT INTO `ss_area` VALUES ('340200', '芜湖市', '340000');
INSERT INTO `ss_area` VALUES ('340201', '市辖区', '340200');
INSERT INTO `ss_area` VALUES ('340202', '镜湖区', '340200');
INSERT INTO `ss_area` VALUES ('340203', '马塘区', '340200');
INSERT INTO `ss_area` VALUES ('340204', '新芜区', '340200');
INSERT INTO `ss_area` VALUES ('340207', '鸠江区', '340200');
INSERT INTO `ss_area` VALUES ('340221', '芜湖县', '340200');
INSERT INTO `ss_area` VALUES ('340222', '繁昌县', '340200');
INSERT INTO `ss_area` VALUES ('340223', '南陵县', '340200');
INSERT INTO `ss_area` VALUES ('340300', '蚌埠市', '340000');
INSERT INTO `ss_area` VALUES ('340301', '市辖区', '340300');
INSERT INTO `ss_area` VALUES ('340302', '龙子湖区', '340300');
INSERT INTO `ss_area` VALUES ('340303', '蚌山区', '340300');
INSERT INTO `ss_area` VALUES ('340304', '禹会区', '340300');
INSERT INTO `ss_area` VALUES ('340311', '淮上区', '340300');
INSERT INTO `ss_area` VALUES ('340321', '怀远县', '340300');
INSERT INTO `ss_area` VALUES ('340322', '五河县', '340300');
INSERT INTO `ss_area` VALUES ('340323', '固镇县', '340300');
INSERT INTO `ss_area` VALUES ('340400', '淮南市', '340000');
INSERT INTO `ss_area` VALUES ('340401', '市辖区', '340400');
INSERT INTO `ss_area` VALUES ('340402', '大通区', '340400');
INSERT INTO `ss_area` VALUES ('340403', '田家庵区', '340400');
INSERT INTO `ss_area` VALUES ('340404', '谢家集区', '340400');
INSERT INTO `ss_area` VALUES ('340405', '八公山区', '340400');
INSERT INTO `ss_area` VALUES ('340406', '潘集区', '340400');
INSERT INTO `ss_area` VALUES ('340421', '凤台县', '340400');
INSERT INTO `ss_area` VALUES ('340500', '马鞍山市', '340000');
INSERT INTO `ss_area` VALUES ('340501', '市辖区', '340500');
INSERT INTO `ss_area` VALUES ('340502', '金家庄区', '340500');
INSERT INTO `ss_area` VALUES ('340503', '花山区', '340500');
INSERT INTO `ss_area` VALUES ('340504', '雨山区', '340500');
INSERT INTO `ss_area` VALUES ('340521', '当涂县', '340500');
INSERT INTO `ss_area` VALUES ('340600', '淮北市', '340000');
INSERT INTO `ss_area` VALUES ('340601', '市辖区', '340600');
INSERT INTO `ss_area` VALUES ('340602', '杜集区', '340600');
INSERT INTO `ss_area` VALUES ('340603', '相山区', '340600');
INSERT INTO `ss_area` VALUES ('340604', '烈山区', '340600');
INSERT INTO `ss_area` VALUES ('340621', '濉溪县', '340600');
INSERT INTO `ss_area` VALUES ('340700', '铜陵市', '340000');
INSERT INTO `ss_area` VALUES ('340701', '市辖区', '340700');
INSERT INTO `ss_area` VALUES ('340702', '铜官山区', '340700');
INSERT INTO `ss_area` VALUES ('340703', '狮子山区', '340700');
INSERT INTO `ss_area` VALUES ('340711', '郊　区', '340700');
INSERT INTO `ss_area` VALUES ('340721', '铜陵县', '340700');
INSERT INTO `ss_area` VALUES ('340800', '安庆市', '340000');
INSERT INTO `ss_area` VALUES ('340801', '市辖区', '340800');
INSERT INTO `ss_area` VALUES ('340802', '迎江区', '340800');
INSERT INTO `ss_area` VALUES ('340803', '大观区', '340800');
INSERT INTO `ss_area` VALUES ('340811', '郊　区', '340800');
INSERT INTO `ss_area` VALUES ('340822', '怀宁县', '340800');
INSERT INTO `ss_area` VALUES ('340823', '枞阳县', '340800');
INSERT INTO `ss_area` VALUES ('340824', '潜山县', '340800');
INSERT INTO `ss_area` VALUES ('340825', '太湖县', '340800');
INSERT INTO `ss_area` VALUES ('340826', '宿松县', '340800');
INSERT INTO `ss_area` VALUES ('340827', '望江县', '340800');
INSERT INTO `ss_area` VALUES ('340828', '岳西县', '340800');
INSERT INTO `ss_area` VALUES ('340881', '桐城市', '340800');
INSERT INTO `ss_area` VALUES ('341000', '黄山市', '340000');
INSERT INTO `ss_area` VALUES ('341001', '市辖区', '341000');
INSERT INTO `ss_area` VALUES ('341002', '屯溪区', '341000');
INSERT INTO `ss_area` VALUES ('341003', '黄山区', '341000');
INSERT INTO `ss_area` VALUES ('341004', '徽州区', '341000');
INSERT INTO `ss_area` VALUES ('341021', '歙　县', '341000');
INSERT INTO `ss_area` VALUES ('341022', '休宁县', '341000');
INSERT INTO `ss_area` VALUES ('341023', '黟　县', '341000');
INSERT INTO `ss_area` VALUES ('341024', '祁门县', '341000');
INSERT INTO `ss_area` VALUES ('341100', '滁州市', '340000');
INSERT INTO `ss_area` VALUES ('341101', '市辖区', '341100');
INSERT INTO `ss_area` VALUES ('341102', '琅琊区', '341100');
INSERT INTO `ss_area` VALUES ('341103', '南谯区', '341100');
INSERT INTO `ss_area` VALUES ('341122', '来安县', '341100');
INSERT INTO `ss_area` VALUES ('341124', '全椒县', '341100');
INSERT INTO `ss_area` VALUES ('341125', '定远县', '341100');
INSERT INTO `ss_area` VALUES ('341126', '凤阳县', '341100');
INSERT INTO `ss_area` VALUES ('341181', '天长市', '341100');
INSERT INTO `ss_area` VALUES ('341182', '明光市', '341100');
INSERT INTO `ss_area` VALUES ('341200', '阜阳市', '340000');
INSERT INTO `ss_area` VALUES ('341201', '市辖区', '341200');
INSERT INTO `ss_area` VALUES ('341202', '颍州区', '341200');
INSERT INTO `ss_area` VALUES ('341203', '颍东区', '341200');
INSERT INTO `ss_area` VALUES ('341204', '颍泉区', '341200');
INSERT INTO `ss_area` VALUES ('341221', '临泉县', '341200');
INSERT INTO `ss_area` VALUES ('341222', '太和县', '341200');
INSERT INTO `ss_area` VALUES ('341225', '阜南县', '341200');
INSERT INTO `ss_area` VALUES ('341226', '颍上县', '341200');
INSERT INTO `ss_area` VALUES ('341282', '界首市', '341200');
INSERT INTO `ss_area` VALUES ('341300', '宿州市', '340000');
INSERT INTO `ss_area` VALUES ('341301', '市辖区', '341300');
INSERT INTO `ss_area` VALUES ('341302', '墉桥区', '341300');
INSERT INTO `ss_area` VALUES ('341321', '砀山县', '341300');
INSERT INTO `ss_area` VALUES ('341322', '萧　县', '341300');
INSERT INTO `ss_area` VALUES ('341323', '灵璧县', '341300');
INSERT INTO `ss_area` VALUES ('341324', '泗　县', '341300');
INSERT INTO `ss_area` VALUES ('341400', '巢湖市', '340000');
INSERT INTO `ss_area` VALUES ('341401', '市辖区', '341400');
INSERT INTO `ss_area` VALUES ('341402', '居巢区', '341400');
INSERT INTO `ss_area` VALUES ('341421', '庐江县', '341400');
INSERT INTO `ss_area` VALUES ('341422', '无为县', '341400');
INSERT INTO `ss_area` VALUES ('341423', '含山县', '341400');
INSERT INTO `ss_area` VALUES ('341424', '和　县', '341400');
INSERT INTO `ss_area` VALUES ('341500', '六安市', '340000');
INSERT INTO `ss_area` VALUES ('341501', '市辖区', '341500');
INSERT INTO `ss_area` VALUES ('341502', '金安区', '341500');
INSERT INTO `ss_area` VALUES ('341503', '裕安区', '341500');
INSERT INTO `ss_area` VALUES ('341521', '寿　县', '341500');
INSERT INTO `ss_area` VALUES ('341522', '霍邱县', '341500');
INSERT INTO `ss_area` VALUES ('341523', '舒城县', '341500');
INSERT INTO `ss_area` VALUES ('341524', '金寨县', '341500');
INSERT INTO `ss_area` VALUES ('341525', '霍山县', '341500');
INSERT INTO `ss_area` VALUES ('341600', '亳州市', '340000');
INSERT INTO `ss_area` VALUES ('341601', '市辖区', '341600');
INSERT INTO `ss_area` VALUES ('341602', '谯城区', '341600');
INSERT INTO `ss_area` VALUES ('341621', '涡阳县', '341600');
INSERT INTO `ss_area` VALUES ('341622', '蒙城县', '341600');
INSERT INTO `ss_area` VALUES ('341623', '利辛县', '341600');
INSERT INTO `ss_area` VALUES ('341700', '池州市', '340000');
INSERT INTO `ss_area` VALUES ('341701', '市辖区', '341700');
INSERT INTO `ss_area` VALUES ('341702', '贵池区', '341700');
INSERT INTO `ss_area` VALUES ('341721', '东至县', '341700');
INSERT INTO `ss_area` VALUES ('341722', '石台县', '341700');
INSERT INTO `ss_area` VALUES ('341723', '青阳县', '341700');
INSERT INTO `ss_area` VALUES ('341800', '宣城市', '340000');
INSERT INTO `ss_area` VALUES ('341801', '市辖区', '341800');
INSERT INTO `ss_area` VALUES ('341802', '宣州区', '341800');
INSERT INTO `ss_area` VALUES ('341821', '郎溪县', '341800');
INSERT INTO `ss_area` VALUES ('341822', '广德县', '341800');
INSERT INTO `ss_area` VALUES ('341823', '泾　县', '341800');
INSERT INTO `ss_area` VALUES ('341824', '绩溪县', '341800');
INSERT INTO `ss_area` VALUES ('341825', '旌德县', '341800');
INSERT INTO `ss_area` VALUES ('341881', '宁国市', '341800');
INSERT INTO `ss_area` VALUES ('350000', '福建省', '0');
INSERT INTO `ss_area` VALUES ('350100', '福州市', '350000');
INSERT INTO `ss_area` VALUES ('350101', '市辖区', '350100');
INSERT INTO `ss_area` VALUES ('350102', '鼓楼区', '350100');
INSERT INTO `ss_area` VALUES ('350103', '台江区', '350100');
INSERT INTO `ss_area` VALUES ('350104', '仓山区', '350100');
INSERT INTO `ss_area` VALUES ('350105', '马尾区', '350100');
INSERT INTO `ss_area` VALUES ('350111', '晋安区', '350100');
INSERT INTO `ss_area` VALUES ('350121', '闽侯县', '350100');
INSERT INTO `ss_area` VALUES ('350122', '连江县', '350100');
INSERT INTO `ss_area` VALUES ('350123', '罗源县', '350100');
INSERT INTO `ss_area` VALUES ('350124', '闽清县', '350100');
INSERT INTO `ss_area` VALUES ('350125', '永泰县', '350100');
INSERT INTO `ss_area` VALUES ('350128', '平潭县', '350100');
INSERT INTO `ss_area` VALUES ('350181', '福清市', '350100');
INSERT INTO `ss_area` VALUES ('350182', '长乐市', '350100');
INSERT INTO `ss_area` VALUES ('350200', '厦门市', '350000');
INSERT INTO `ss_area` VALUES ('350201', '市辖区', '350200');
INSERT INTO `ss_area` VALUES ('350203', '思明区', '350200');
INSERT INTO `ss_area` VALUES ('350205', '海沧区', '350200');
INSERT INTO `ss_area` VALUES ('350206', '湖里区', '350200');
INSERT INTO `ss_area` VALUES ('350211', '集美区', '350200');
INSERT INTO `ss_area` VALUES ('350212', '同安区', '350200');
INSERT INTO `ss_area` VALUES ('350213', '翔安区', '350200');
INSERT INTO `ss_area` VALUES ('350300', '莆田市', '350000');
INSERT INTO `ss_area` VALUES ('350301', '市辖区', '350300');
INSERT INTO `ss_area` VALUES ('350302', '城厢区', '350300');
INSERT INTO `ss_area` VALUES ('350303', '涵江区', '350300');
INSERT INTO `ss_area` VALUES ('350304', '荔城区', '350300');
INSERT INTO `ss_area` VALUES ('350305', '秀屿区', '350300');
INSERT INTO `ss_area` VALUES ('350322', '仙游县', '350300');
INSERT INTO `ss_area` VALUES ('350400', '三明市', '350000');
INSERT INTO `ss_area` VALUES ('350401', '市辖区', '350400');
INSERT INTO `ss_area` VALUES ('350402', '梅列区', '350400');
INSERT INTO `ss_area` VALUES ('350403', '三元区', '350400');
INSERT INTO `ss_area` VALUES ('350421', '明溪县', '350400');
INSERT INTO `ss_area` VALUES ('350423', '清流县', '350400');
INSERT INTO `ss_area` VALUES ('350424', '宁化县', '350400');
INSERT INTO `ss_area` VALUES ('350425', '大田县', '350400');
INSERT INTO `ss_area` VALUES ('350426', '尤溪县', '350400');
INSERT INTO `ss_area` VALUES ('350427', '沙　县', '350400');
INSERT INTO `ss_area` VALUES ('350428', '将乐县', '350400');
INSERT INTO `ss_area` VALUES ('350429', '泰宁县', '350400');
INSERT INTO `ss_area` VALUES ('350430', '建宁县', '350400');
INSERT INTO `ss_area` VALUES ('350481', '永安市', '350400');
INSERT INTO `ss_area` VALUES ('350500', '泉州市', '350000');
INSERT INTO `ss_area` VALUES ('350501', '市辖区', '350500');
INSERT INTO `ss_area` VALUES ('350502', '鲤城区', '350500');
INSERT INTO `ss_area` VALUES ('350503', '丰泽区', '350500');
INSERT INTO `ss_area` VALUES ('350504', '洛江区', '350500');
INSERT INTO `ss_area` VALUES ('350505', '泉港区', '350500');
INSERT INTO `ss_area` VALUES ('350521', '惠安县', '350500');
INSERT INTO `ss_area` VALUES ('350524', '安溪县', '350500');
INSERT INTO `ss_area` VALUES ('350525', '永春县', '350500');
INSERT INTO `ss_area` VALUES ('350526', '德化县', '350500');
INSERT INTO `ss_area` VALUES ('350527', '金门县', '350500');
INSERT INTO `ss_area` VALUES ('350581', '石狮市', '350500');
INSERT INTO `ss_area` VALUES ('350582', '晋江市', '350500');
INSERT INTO `ss_area` VALUES ('350583', '南安市', '350500');
INSERT INTO `ss_area` VALUES ('350600', '漳州市', '350000');
INSERT INTO `ss_area` VALUES ('350601', '市辖区', '350600');
INSERT INTO `ss_area` VALUES ('350602', '芗城区', '350600');
INSERT INTO `ss_area` VALUES ('350603', '龙文区', '350600');
INSERT INTO `ss_area` VALUES ('350622', '云霄县', '350600');
INSERT INTO `ss_area` VALUES ('350623', '漳浦县', '350600');
INSERT INTO `ss_area` VALUES ('350624', '诏安县', '350600');
INSERT INTO `ss_area` VALUES ('350625', '长泰县', '350600');
INSERT INTO `ss_area` VALUES ('350626', '东山县', '350600');
INSERT INTO `ss_area` VALUES ('350627', '南靖县', '350600');
INSERT INTO `ss_area` VALUES ('350628', '平和县', '350600');
INSERT INTO `ss_area` VALUES ('350629', '华安县', '350600');
INSERT INTO `ss_area` VALUES ('350681', '龙海市', '350600');
INSERT INTO `ss_area` VALUES ('350700', '南平市', '350000');
INSERT INTO `ss_area` VALUES ('350701', '市辖区', '350700');
INSERT INTO `ss_area` VALUES ('350702', '延平区', '350700');
INSERT INTO `ss_area` VALUES ('350721', '顺昌县', '350700');
INSERT INTO `ss_area` VALUES ('350722', '浦城县', '350700');
INSERT INTO `ss_area` VALUES ('350723', '光泽县', '350700');
INSERT INTO `ss_area` VALUES ('350724', '松溪县', '350700');
INSERT INTO `ss_area` VALUES ('350725', '政和县', '350700');
INSERT INTO `ss_area` VALUES ('350781', '邵武市', '350700');
INSERT INTO `ss_area` VALUES ('350782', '武夷山市', '350700');
INSERT INTO `ss_area` VALUES ('350783', '建瓯市', '350700');
INSERT INTO `ss_area` VALUES ('350784', '建阳市', '350700');
INSERT INTO `ss_area` VALUES ('350800', '龙岩市', '350000');
INSERT INTO `ss_area` VALUES ('350801', '市辖区', '350800');
INSERT INTO `ss_area` VALUES ('350802', '新罗区', '350800');
INSERT INTO `ss_area` VALUES ('350821', '长汀县', '350800');
INSERT INTO `ss_area` VALUES ('350822', '永定县', '350800');
INSERT INTO `ss_area` VALUES ('350823', '上杭县', '350800');
INSERT INTO `ss_area` VALUES ('350824', '武平县', '350800');
INSERT INTO `ss_area` VALUES ('350825', '连城县', '350800');
INSERT INTO `ss_area` VALUES ('350881', '漳平市', '350800');
INSERT INTO `ss_area` VALUES ('350900', '宁德市', '350000');
INSERT INTO `ss_area` VALUES ('350901', '市辖区', '350900');
INSERT INTO `ss_area` VALUES ('350902', '蕉城区', '350900');
INSERT INTO `ss_area` VALUES ('350921', '霞浦县', '350900');
INSERT INTO `ss_area` VALUES ('350922', '古田县', '350900');
INSERT INTO `ss_area` VALUES ('350923', '屏南县', '350900');
INSERT INTO `ss_area` VALUES ('350924', '寿宁县', '350900');
INSERT INTO `ss_area` VALUES ('350925', '周宁县', '350900');
INSERT INTO `ss_area` VALUES ('350926', '柘荣县', '350900');
INSERT INTO `ss_area` VALUES ('350981', '福安市', '350900');
INSERT INTO `ss_area` VALUES ('350982', '福鼎市', '350900');
INSERT INTO `ss_area` VALUES ('360000', '江西省', '0');
INSERT INTO `ss_area` VALUES ('360100', '南昌市', '360000');
INSERT INTO `ss_area` VALUES ('360101', '市辖区', '360100');
INSERT INTO `ss_area` VALUES ('360102', '东湖区', '360100');
INSERT INTO `ss_area` VALUES ('360103', '西湖区', '360100');
INSERT INTO `ss_area` VALUES ('360104', '青云谱区', '360100');
INSERT INTO `ss_area` VALUES ('360105', '湾里区', '360100');
INSERT INTO `ss_area` VALUES ('360111', '青山湖区', '360100');
INSERT INTO `ss_area` VALUES ('360121', '南昌县', '360100');
INSERT INTO `ss_area` VALUES ('360122', '新建县', '360100');
INSERT INTO `ss_area` VALUES ('360123', '安义县', '360100');
INSERT INTO `ss_area` VALUES ('360124', '进贤县', '360100');
INSERT INTO `ss_area` VALUES ('360200', '景德镇市', '360000');
INSERT INTO `ss_area` VALUES ('360201', '市辖区', '360200');
INSERT INTO `ss_area` VALUES ('360202', '昌江区', '360200');
INSERT INTO `ss_area` VALUES ('360203', '珠山区', '360200');
INSERT INTO `ss_area` VALUES ('360222', '浮梁县', '360200');
INSERT INTO `ss_area` VALUES ('360281', '乐平市', '360200');
INSERT INTO `ss_area` VALUES ('360300', '萍乡市', '360000');
INSERT INTO `ss_area` VALUES ('360301', '市辖区', '360300');
INSERT INTO `ss_area` VALUES ('360302', '安源区', '360300');
INSERT INTO `ss_area` VALUES ('360313', '湘东区', '360300');
INSERT INTO `ss_area` VALUES ('360321', '莲花县', '360300');
INSERT INTO `ss_area` VALUES ('360322', '上栗县', '360300');
INSERT INTO `ss_area` VALUES ('360323', '芦溪县', '360300');
INSERT INTO `ss_area` VALUES ('360400', '九江市', '360000');
INSERT INTO `ss_area` VALUES ('360401', '市辖区', '360400');
INSERT INTO `ss_area` VALUES ('360402', '庐山区', '360400');
INSERT INTO `ss_area` VALUES ('360403', '浔阳区', '360400');
INSERT INTO `ss_area` VALUES ('360421', '九江县', '360400');
INSERT INTO `ss_area` VALUES ('360423', '武宁县', '360400');
INSERT INTO `ss_area` VALUES ('360424', '修水县', '360400');
INSERT INTO `ss_area` VALUES ('360425', '永修县', '360400');
INSERT INTO `ss_area` VALUES ('360426', '德安县', '360400');
INSERT INTO `ss_area` VALUES ('360427', '星子县', '360400');
INSERT INTO `ss_area` VALUES ('360428', '都昌县', '360400');
INSERT INTO `ss_area` VALUES ('360429', '湖口县', '360400');
INSERT INTO `ss_area` VALUES ('360430', '彭泽县', '360400');
INSERT INTO `ss_area` VALUES ('360481', '瑞昌市', '360400');
INSERT INTO `ss_area` VALUES ('360500', '新余市', '360000');
INSERT INTO `ss_area` VALUES ('360501', '市辖区', '360500');
INSERT INTO `ss_area` VALUES ('360502', '渝水区', '360500');
INSERT INTO `ss_area` VALUES ('360521', '分宜县', '360500');
INSERT INTO `ss_area` VALUES ('360600', '鹰潭市', '360000');
INSERT INTO `ss_area` VALUES ('360601', '市辖区', '360600');
INSERT INTO `ss_area` VALUES ('360602', '月湖区', '360600');
INSERT INTO `ss_area` VALUES ('360622', '余江县', '360600');
INSERT INTO `ss_area` VALUES ('360681', '贵溪市', '360600');
INSERT INTO `ss_area` VALUES ('360700', '赣州市', '360000');
INSERT INTO `ss_area` VALUES ('360701', '市辖区', '360700');
INSERT INTO `ss_area` VALUES ('360702', '章贡区', '360700');
INSERT INTO `ss_area` VALUES ('360721', '赣　县', '360700');
INSERT INTO `ss_area` VALUES ('360722', '信丰县', '360700');
INSERT INTO `ss_area` VALUES ('360723', '大余县', '360700');
INSERT INTO `ss_area` VALUES ('360724', '上犹县', '360700');
INSERT INTO `ss_area` VALUES ('360725', '崇义县', '360700');
INSERT INTO `ss_area` VALUES ('360726', '安远县', '360700');
INSERT INTO `ss_area` VALUES ('360727', '龙南县', '360700');
INSERT INTO `ss_area` VALUES ('360728', '定南县', '360700');
INSERT INTO `ss_area` VALUES ('360729', '全南县', '360700');
INSERT INTO `ss_area` VALUES ('360730', '宁都县', '360700');
INSERT INTO `ss_area` VALUES ('360731', '于都县', '360700');
INSERT INTO `ss_area` VALUES ('360732', '兴国县', '360700');
INSERT INTO `ss_area` VALUES ('360733', '会昌县', '360700');
INSERT INTO `ss_area` VALUES ('360734', '寻乌县', '360700');
INSERT INTO `ss_area` VALUES ('360735', '石城县', '360700');
INSERT INTO `ss_area` VALUES ('360781', '瑞金市', '360700');
INSERT INTO `ss_area` VALUES ('360782', '南康市', '360700');
INSERT INTO `ss_area` VALUES ('360800', '吉安市', '360000');
INSERT INTO `ss_area` VALUES ('360801', '市辖区', '360800');
INSERT INTO `ss_area` VALUES ('360802', '吉州区', '360800');
INSERT INTO `ss_area` VALUES ('360803', '青原区', '360800');
INSERT INTO `ss_area` VALUES ('360821', '吉安县', '360800');
INSERT INTO `ss_area` VALUES ('360822', '吉水县', '360800');
INSERT INTO `ss_area` VALUES ('360823', '峡江县', '360800');
INSERT INTO `ss_area` VALUES ('360824', '新干县', '360800');
INSERT INTO `ss_area` VALUES ('360825', '永丰县', '360800');
INSERT INTO `ss_area` VALUES ('360826', '泰和县', '360800');
INSERT INTO `ss_area` VALUES ('360827', '遂川县', '360800');
INSERT INTO `ss_area` VALUES ('360828', '万安县', '360800');
INSERT INTO `ss_area` VALUES ('360829', '安福县', '360800');
INSERT INTO `ss_area` VALUES ('360830', '永新县', '360800');
INSERT INTO `ss_area` VALUES ('360881', '井冈山市', '360800');
INSERT INTO `ss_area` VALUES ('360900', '宜春市', '360000');
INSERT INTO `ss_area` VALUES ('360901', '市辖区', '360900');
INSERT INTO `ss_area` VALUES ('360902', '袁州区', '360900');
INSERT INTO `ss_area` VALUES ('360921', '奉新县', '360900');
INSERT INTO `ss_area` VALUES ('360922', '万载县', '360900');
INSERT INTO `ss_area` VALUES ('360923', '上高县', '360900');
INSERT INTO `ss_area` VALUES ('360924', '宜丰县', '360900');
INSERT INTO `ss_area` VALUES ('360925', '靖安县', '360900');
INSERT INTO `ss_area` VALUES ('360926', '铜鼓县', '360900');
INSERT INTO `ss_area` VALUES ('360981', '丰城市', '360900');
INSERT INTO `ss_area` VALUES ('360982', '樟树市', '360900');
INSERT INTO `ss_area` VALUES ('360983', '高安市', '360900');
INSERT INTO `ss_area` VALUES ('361000', '抚州市', '360000');
INSERT INTO `ss_area` VALUES ('361001', '市辖区', '361000');
INSERT INTO `ss_area` VALUES ('361002', '临川区', '361000');
INSERT INTO `ss_area` VALUES ('361021', '南城县', '361000');
INSERT INTO `ss_area` VALUES ('361022', '黎川县', '361000');
INSERT INTO `ss_area` VALUES ('361023', '南丰县', '361000');
INSERT INTO `ss_area` VALUES ('361024', '崇仁县', '361000');
INSERT INTO `ss_area` VALUES ('361025', '乐安县', '361000');
INSERT INTO `ss_area` VALUES ('361026', '宜黄县', '361000');
INSERT INTO `ss_area` VALUES ('361027', '金溪县', '361000');
INSERT INTO `ss_area` VALUES ('361028', '资溪县', '361000');
INSERT INTO `ss_area` VALUES ('361029', '东乡县', '361000');
INSERT INTO `ss_area` VALUES ('361030', '广昌县', '361000');
INSERT INTO `ss_area` VALUES ('361100', '上饶市', '360000');
INSERT INTO `ss_area` VALUES ('361101', '市辖区', '361100');
INSERT INTO `ss_area` VALUES ('361102', '信州区', '361100');
INSERT INTO `ss_area` VALUES ('361121', '上饶县', '361100');
INSERT INTO `ss_area` VALUES ('361122', '广丰县', '361100');
INSERT INTO `ss_area` VALUES ('361123', '玉山县', '361100');
INSERT INTO `ss_area` VALUES ('361124', '铅山县', '361100');
INSERT INTO `ss_area` VALUES ('361125', '横峰县', '361100');
INSERT INTO `ss_area` VALUES ('361126', '弋阳县', '361100');
INSERT INTO `ss_area` VALUES ('361127', '余干县', '361100');
INSERT INTO `ss_area` VALUES ('361128', '鄱阳县', '361100');
INSERT INTO `ss_area` VALUES ('361129', '万年县', '361100');
INSERT INTO `ss_area` VALUES ('361130', '婺源县', '361100');
INSERT INTO `ss_area` VALUES ('361181', '德兴市', '361100');
INSERT INTO `ss_area` VALUES ('370000', '山东省', '0');
INSERT INTO `ss_area` VALUES ('370100', '济南市', '370000');
INSERT INTO `ss_area` VALUES ('370101', '市辖区', '370100');
INSERT INTO `ss_area` VALUES ('370102', '历下区', '370100');
INSERT INTO `ss_area` VALUES ('370103', '市中区', '370100');
INSERT INTO `ss_area` VALUES ('370104', '槐荫区', '370100');
INSERT INTO `ss_area` VALUES ('370105', '天桥区', '370100');
INSERT INTO `ss_area` VALUES ('370112', '历城区', '370100');
INSERT INTO `ss_area` VALUES ('370113', '长清区', '370100');
INSERT INTO `ss_area` VALUES ('370124', '平阴县', '370100');
INSERT INTO `ss_area` VALUES ('370125', '济阳县', '370100');
INSERT INTO `ss_area` VALUES ('370126', '商河县', '370100');
INSERT INTO `ss_area` VALUES ('370181', '章丘市', '370100');
INSERT INTO `ss_area` VALUES ('370200', '青岛市', '370000');
INSERT INTO `ss_area` VALUES ('370201', '市辖区', '370200');
INSERT INTO `ss_area` VALUES ('370202', '市南区', '370200');
INSERT INTO `ss_area` VALUES ('370203', '市北区', '370200');
INSERT INTO `ss_area` VALUES ('370205', '四方区', '370200');
INSERT INTO `ss_area` VALUES ('370211', '黄岛区', '370200');
INSERT INTO `ss_area` VALUES ('370212', '崂山区', '370200');
INSERT INTO `ss_area` VALUES ('370213', '李沧区', '370200');
INSERT INTO `ss_area` VALUES ('370214', '城阳区', '370200');
INSERT INTO `ss_area` VALUES ('370281', '胶州市', '370200');
INSERT INTO `ss_area` VALUES ('370282', '即墨市', '370200');
INSERT INTO `ss_area` VALUES ('370283', '平度市', '370200');
INSERT INTO `ss_area` VALUES ('370284', '胶南市', '370200');
INSERT INTO `ss_area` VALUES ('370285', '莱西市', '370200');
INSERT INTO `ss_area` VALUES ('370300', '淄博市', '370000');
INSERT INTO `ss_area` VALUES ('370301', '市辖区', '370300');
INSERT INTO `ss_area` VALUES ('370302', '淄川区', '370300');
INSERT INTO `ss_area` VALUES ('370303', '张店区', '370300');
INSERT INTO `ss_area` VALUES ('370304', '博山区', '370300');
INSERT INTO `ss_area` VALUES ('370305', '临淄区', '370300');
INSERT INTO `ss_area` VALUES ('370306', '周村区', '370300');
INSERT INTO `ss_area` VALUES ('370321', '桓台县', '370300');
INSERT INTO `ss_area` VALUES ('370322', '高青县', '370300');
INSERT INTO `ss_area` VALUES ('370323', '沂源县', '370300');
INSERT INTO `ss_area` VALUES ('370400', '枣庄市', '370000');
INSERT INTO `ss_area` VALUES ('370401', '市辖区', '370400');
INSERT INTO `ss_area` VALUES ('370402', '市中区', '370400');
INSERT INTO `ss_area` VALUES ('370403', '薛城区', '370400');
INSERT INTO `ss_area` VALUES ('370404', '峄城区', '370400');
INSERT INTO `ss_area` VALUES ('370405', '台儿庄区', '370400');
INSERT INTO `ss_area` VALUES ('370406', '山亭区', '370400');
INSERT INTO `ss_area` VALUES ('370481', '滕州市', '370400');
INSERT INTO `ss_area` VALUES ('370500', '东营市', '370000');
INSERT INTO `ss_area` VALUES ('370501', '市辖区', '370500');
INSERT INTO `ss_area` VALUES ('370502', '东营区', '370500');
INSERT INTO `ss_area` VALUES ('370503', '河口区', '370500');
INSERT INTO `ss_area` VALUES ('370521', '垦利县', '370500');
INSERT INTO `ss_area` VALUES ('370522', '利津县', '370500');
INSERT INTO `ss_area` VALUES ('370523', '广饶县', '370500');
INSERT INTO `ss_area` VALUES ('370600', '烟台市', '370000');
INSERT INTO `ss_area` VALUES ('370601', '市辖区', '370600');
INSERT INTO `ss_area` VALUES ('370602', '芝罘区', '370600');
INSERT INTO `ss_area` VALUES ('370611', '福山区', '370600');
INSERT INTO `ss_area` VALUES ('370612', '牟平区', '370600');
INSERT INTO `ss_area` VALUES ('370613', '莱山区', '370600');
INSERT INTO `ss_area` VALUES ('370634', '长岛县', '370600');
INSERT INTO `ss_area` VALUES ('370681', '龙口市', '370600');
INSERT INTO `ss_area` VALUES ('370682', '莱阳市', '370600');
INSERT INTO `ss_area` VALUES ('370683', '莱州市', '370600');
INSERT INTO `ss_area` VALUES ('370684', '蓬莱市', '370600');
INSERT INTO `ss_area` VALUES ('370685', '招远市', '370600');
INSERT INTO `ss_area` VALUES ('370686', '栖霞市', '370600');
INSERT INTO `ss_area` VALUES ('370687', '海阳市', '370600');
INSERT INTO `ss_area` VALUES ('370700', '潍坊市', '370000');
INSERT INTO `ss_area` VALUES ('370701', '市辖区', '370700');
INSERT INTO `ss_area` VALUES ('370702', '潍城区', '370700');
INSERT INTO `ss_area` VALUES ('370703', '寒亭区', '370700');
INSERT INTO `ss_area` VALUES ('370704', '坊子区', '370700');
INSERT INTO `ss_area` VALUES ('370705', '奎文区', '370700');
INSERT INTO `ss_area` VALUES ('370724', '临朐县', '370700');
INSERT INTO `ss_area` VALUES ('370725', '昌乐县', '370700');
INSERT INTO `ss_area` VALUES ('370781', '青州市', '370700');
INSERT INTO `ss_area` VALUES ('370782', '诸城市', '370700');
INSERT INTO `ss_area` VALUES ('370783', '寿光市', '370700');
INSERT INTO `ss_area` VALUES ('370784', '安丘市', '370700');
INSERT INTO `ss_area` VALUES ('370785', '高密市', '370700');
INSERT INTO `ss_area` VALUES ('370786', '昌邑市', '370700');
INSERT INTO `ss_area` VALUES ('370800', '济宁市', '370000');
INSERT INTO `ss_area` VALUES ('370801', '市辖区', '370800');
INSERT INTO `ss_area` VALUES ('370802', '市中区', '370800');
INSERT INTO `ss_area` VALUES ('370811', '任城区', '370800');
INSERT INTO `ss_area` VALUES ('370826', '微山县', '370800');
INSERT INTO `ss_area` VALUES ('370827', '鱼台县', '370800');
INSERT INTO `ss_area` VALUES ('370828', '金乡县', '370800');
INSERT INTO `ss_area` VALUES ('370829', '嘉祥县', '370800');
INSERT INTO `ss_area` VALUES ('370830', '汶上县', '370800');
INSERT INTO `ss_area` VALUES ('370831', '泗水县', '370800');
INSERT INTO `ss_area` VALUES ('370832', '梁山县', '370800');
INSERT INTO `ss_area` VALUES ('370881', '曲阜市', '370800');
INSERT INTO `ss_area` VALUES ('370882', '兖州市', '370800');
INSERT INTO `ss_area` VALUES ('370883', '邹城市', '370800');
INSERT INTO `ss_area` VALUES ('370900', '泰安市', '370000');
INSERT INTO `ss_area` VALUES ('370901', '市辖区', '370900');
INSERT INTO `ss_area` VALUES ('370902', '泰山区', '370900');
INSERT INTO `ss_area` VALUES ('370903', '岱岳区', '370900');
INSERT INTO `ss_area` VALUES ('370921', '宁阳县', '370900');
INSERT INTO `ss_area` VALUES ('370923', '东平县', '370900');
INSERT INTO `ss_area` VALUES ('370982', '新泰市', '370900');
INSERT INTO `ss_area` VALUES ('370983', '肥城市', '370900');
INSERT INTO `ss_area` VALUES ('371000', '威海市', '370000');
INSERT INTO `ss_area` VALUES ('371001', '市辖区', '371000');
INSERT INTO `ss_area` VALUES ('371002', '环翠区', '371000');
INSERT INTO `ss_area` VALUES ('371081', '文登市', '371000');
INSERT INTO `ss_area` VALUES ('371082', '荣成市', '371000');
INSERT INTO `ss_area` VALUES ('371083', '乳山市', '371000');
INSERT INTO `ss_area` VALUES ('371100', '日照市', '370000');
INSERT INTO `ss_area` VALUES ('371101', '市辖区', '371100');
INSERT INTO `ss_area` VALUES ('371102', '东港区', '371100');
INSERT INTO `ss_area` VALUES ('371103', '岚山区', '371100');
INSERT INTO `ss_area` VALUES ('371121', '五莲县', '371100');
INSERT INTO `ss_area` VALUES ('371122', '莒　县', '371100');
INSERT INTO `ss_area` VALUES ('371200', '莱芜市', '370000');
INSERT INTO `ss_area` VALUES ('371201', '市辖区', '371200');
INSERT INTO `ss_area` VALUES ('371202', '莱城区', '371200');
INSERT INTO `ss_area` VALUES ('371203', '钢城区', '371200');
INSERT INTO `ss_area` VALUES ('371300', '临沂市', '370000');
INSERT INTO `ss_area` VALUES ('371301', '市辖区', '371300');
INSERT INTO `ss_area` VALUES ('371302', '兰山区', '371300');
INSERT INTO `ss_area` VALUES ('371311', '罗庄区', '371300');
INSERT INTO `ss_area` VALUES ('371312', '河东区', '371300');
INSERT INTO `ss_area` VALUES ('371321', '沂南县', '371300');
INSERT INTO `ss_area` VALUES ('371322', '郯城县', '371300');
INSERT INTO `ss_area` VALUES ('371323', '沂水县', '371300');
INSERT INTO `ss_area` VALUES ('371324', '苍山县', '371300');
INSERT INTO `ss_area` VALUES ('371325', '费　县', '371300');
INSERT INTO `ss_area` VALUES ('371326', '平邑县', '371300');
INSERT INTO `ss_area` VALUES ('371327', '莒南县', '371300');
INSERT INTO `ss_area` VALUES ('371328', '蒙阴县', '371300');
INSERT INTO `ss_area` VALUES ('371329', '临沭县', '371300');
INSERT INTO `ss_area` VALUES ('371400', '德州市', '370000');
INSERT INTO `ss_area` VALUES ('371401', '市辖区', '371400');
INSERT INTO `ss_area` VALUES ('371402', '德城区', '371400');
INSERT INTO `ss_area` VALUES ('371421', '陵　县', '371400');
INSERT INTO `ss_area` VALUES ('371422', '宁津县', '371400');
INSERT INTO `ss_area` VALUES ('371423', '庆云县', '371400');
INSERT INTO `ss_area` VALUES ('371424', '临邑县', '371400');
INSERT INTO `ss_area` VALUES ('371425', '齐河县', '371400');
INSERT INTO `ss_area` VALUES ('371426', '平原县', '371400');
INSERT INTO `ss_area` VALUES ('371427', '夏津县', '371400');
INSERT INTO `ss_area` VALUES ('371428', '武城县', '371400');
INSERT INTO `ss_area` VALUES ('371481', '乐陵市', '371400');
INSERT INTO `ss_area` VALUES ('371482', '禹城市', '371400');
INSERT INTO `ss_area` VALUES ('371500', '聊城市', '370000');
INSERT INTO `ss_area` VALUES ('371501', '市辖区', '371500');
INSERT INTO `ss_area` VALUES ('371502', '东昌府区', '371500');
INSERT INTO `ss_area` VALUES ('371521', '阳谷县', '371500');
INSERT INTO `ss_area` VALUES ('371522', '莘　县', '371500');
INSERT INTO `ss_area` VALUES ('371523', '茌平县', '371500');
INSERT INTO `ss_area` VALUES ('371524', '东阿县', '371500');
INSERT INTO `ss_area` VALUES ('371525', '冠　县', '371500');
INSERT INTO `ss_area` VALUES ('371526', '高唐县', '371500');
INSERT INTO `ss_area` VALUES ('371581', '临清市', '371500');
INSERT INTO `ss_area` VALUES ('371600', '滨州市', '370000');
INSERT INTO `ss_area` VALUES ('371601', '市辖区', '371600');
INSERT INTO `ss_area` VALUES ('371602', '滨城区', '371600');
INSERT INTO `ss_area` VALUES ('371621', '惠民县', '371600');
INSERT INTO `ss_area` VALUES ('371622', '阳信县', '371600');
INSERT INTO `ss_area` VALUES ('371623', '无棣县', '371600');
INSERT INTO `ss_area` VALUES ('371624', '沾化县', '371600');
INSERT INTO `ss_area` VALUES ('371625', '博兴县', '371600');
INSERT INTO `ss_area` VALUES ('371626', '邹平县', '371600');
INSERT INTO `ss_area` VALUES ('371700', '荷泽市', '370000');
INSERT INTO `ss_area` VALUES ('371701', '市辖区', '371700');
INSERT INTO `ss_area` VALUES ('371702', '牡丹区', '371700');
INSERT INTO `ss_area` VALUES ('371721', '曹　县', '371700');
INSERT INTO `ss_area` VALUES ('371722', '单　县', '371700');
INSERT INTO `ss_area` VALUES ('371723', '成武县', '371700');
INSERT INTO `ss_area` VALUES ('371724', '巨野县', '371700');
INSERT INTO `ss_area` VALUES ('371725', '郓城县', '371700');
INSERT INTO `ss_area` VALUES ('371726', '鄄城县', '371700');
INSERT INTO `ss_area` VALUES ('371727', '定陶县', '371700');
INSERT INTO `ss_area` VALUES ('371728', '东明县', '371700');
INSERT INTO `ss_area` VALUES ('410000', '河南省', '0');
INSERT INTO `ss_area` VALUES ('410100', '郑州市', '410000');
INSERT INTO `ss_area` VALUES ('410101', '市辖区', '410100');
INSERT INTO `ss_area` VALUES ('410102', '中原区', '410100');
INSERT INTO `ss_area` VALUES ('410103', '二七区', '410100');
INSERT INTO `ss_area` VALUES ('410104', '管城回族区', '410100');
INSERT INTO `ss_area` VALUES ('410105', '金水区', '410100');
INSERT INTO `ss_area` VALUES ('410106', '上街区', '410100');
INSERT INTO `ss_area` VALUES ('410108', '邙山区', '410100');
INSERT INTO `ss_area` VALUES ('410122', '中牟县', '410100');
INSERT INTO `ss_area` VALUES ('410181', '巩义市', '410100');
INSERT INTO `ss_area` VALUES ('410182', '荥阳市', '410100');
INSERT INTO `ss_area` VALUES ('410183', '新密市', '410100');
INSERT INTO `ss_area` VALUES ('410184', '新郑市', '410100');
INSERT INTO `ss_area` VALUES ('410185', '登封市', '410100');
INSERT INTO `ss_area` VALUES ('410200', '开封市', '410000');
INSERT INTO `ss_area` VALUES ('410201', '市辖区', '410200');
INSERT INTO `ss_area` VALUES ('410202', '龙亭区', '410200');
INSERT INTO `ss_area` VALUES ('410203', '顺河回族区', '410200');
INSERT INTO `ss_area` VALUES ('410204', '鼓楼区', '410200');
INSERT INTO `ss_area` VALUES ('410205', '南关区', '410200');
INSERT INTO `ss_area` VALUES ('410211', '郊　区', '410200');
INSERT INTO `ss_area` VALUES ('410221', '杞　县', '410200');
INSERT INTO `ss_area` VALUES ('410222', '通许县', '410200');
INSERT INTO `ss_area` VALUES ('410223', '尉氏县', '410200');
INSERT INTO `ss_area` VALUES ('410224', '开封县', '410200');
INSERT INTO `ss_area` VALUES ('410225', '兰考县', '410200');
INSERT INTO `ss_area` VALUES ('410300', '洛阳市', '410000');
INSERT INTO `ss_area` VALUES ('410301', '市辖区', '410300');
INSERT INTO `ss_area` VALUES ('410302', '老城区', '410300');
INSERT INTO `ss_area` VALUES ('410303', '西工区', '410300');
INSERT INTO `ss_area` VALUES ('410304', '廛河回族区', '410300');
INSERT INTO `ss_area` VALUES ('410305', '涧西区', '410300');
INSERT INTO `ss_area` VALUES ('410306', '吉利区', '410300');
INSERT INTO `ss_area` VALUES ('410307', '洛龙区', '410300');
INSERT INTO `ss_area` VALUES ('410322', '孟津县', '410300');
INSERT INTO `ss_area` VALUES ('410323', '新安县', '410300');
INSERT INTO `ss_area` VALUES ('410324', '栾川县', '410300');
INSERT INTO `ss_area` VALUES ('410325', '嵩　县', '410300');
INSERT INTO `ss_area` VALUES ('410326', '汝阳县', '410300');
INSERT INTO `ss_area` VALUES ('410327', '宜阳县', '410300');
INSERT INTO `ss_area` VALUES ('410328', '洛宁县', '410300');
INSERT INTO `ss_area` VALUES ('410329', '伊川县', '410300');
INSERT INTO `ss_area` VALUES ('410381', '偃师市', '410300');
INSERT INTO `ss_area` VALUES ('410400', '平顶山市', '410000');
INSERT INTO `ss_area` VALUES ('410401', '市辖区', '410400');
INSERT INTO `ss_area` VALUES ('410402', '新华区', '410400');
INSERT INTO `ss_area` VALUES ('410403', '卫东区', '410400');
INSERT INTO `ss_area` VALUES ('410404', '石龙区', '410400');
INSERT INTO `ss_area` VALUES ('410411', '湛河区', '410400');
INSERT INTO `ss_area` VALUES ('410421', '宝丰县', '410400');
INSERT INTO `ss_area` VALUES ('410422', '叶　县', '410400');
INSERT INTO `ss_area` VALUES ('410423', '鲁山县', '410400');
INSERT INTO `ss_area` VALUES ('410425', '郏　县', '410400');
INSERT INTO `ss_area` VALUES ('410481', '舞钢市', '410400');
INSERT INTO `ss_area` VALUES ('410482', '汝州市', '410400');
INSERT INTO `ss_area` VALUES ('410500', '安阳市', '410000');
INSERT INTO `ss_area` VALUES ('410501', '市辖区', '410500');
INSERT INTO `ss_area` VALUES ('410502', '文峰区', '410500');
INSERT INTO `ss_area` VALUES ('410503', '北关区', '410500');
INSERT INTO `ss_area` VALUES ('410505', '殷都区', '410500');
INSERT INTO `ss_area` VALUES ('410506', '龙安区', '410500');
INSERT INTO `ss_area` VALUES ('410522', '安阳县', '410500');
INSERT INTO `ss_area` VALUES ('410523', '汤阴县', '410500');
INSERT INTO `ss_area` VALUES ('410526', '滑　县', '410500');
INSERT INTO `ss_area` VALUES ('410527', '内黄县', '410500');
INSERT INTO `ss_area` VALUES ('410581', '林州市', '410500');
INSERT INTO `ss_area` VALUES ('410600', '鹤壁市', '410000');
INSERT INTO `ss_area` VALUES ('410601', '市辖区', '410600');
INSERT INTO `ss_area` VALUES ('410602', '鹤山区', '410600');
INSERT INTO `ss_area` VALUES ('410603', '山城区', '410600');
INSERT INTO `ss_area` VALUES ('410611', '淇滨区', '410600');
INSERT INTO `ss_area` VALUES ('410621', '浚　县', '410600');
INSERT INTO `ss_area` VALUES ('410622', '淇　县', '410600');
INSERT INTO `ss_area` VALUES ('410700', '新乡市', '410000');
INSERT INTO `ss_area` VALUES ('410701', '市辖区', '410700');
INSERT INTO `ss_area` VALUES ('410702', '红旗区', '410700');
INSERT INTO `ss_area` VALUES ('410703', '卫滨区', '410700');
INSERT INTO `ss_area` VALUES ('410704', '凤泉区', '410700');
INSERT INTO `ss_area` VALUES ('410711', '牧野区', '410700');
INSERT INTO `ss_area` VALUES ('410721', '新乡县', '410700');
INSERT INTO `ss_area` VALUES ('410724', '获嘉县', '410700');
INSERT INTO `ss_area` VALUES ('410725', '原阳县', '410700');
INSERT INTO `ss_area` VALUES ('410726', '延津县', '410700');
INSERT INTO `ss_area` VALUES ('410727', '封丘县', '410700');
INSERT INTO `ss_area` VALUES ('410728', '长垣县', '410700');
INSERT INTO `ss_area` VALUES ('410781', '卫辉市', '410700');
INSERT INTO `ss_area` VALUES ('410782', '辉县市', '410700');
INSERT INTO `ss_area` VALUES ('410800', '焦作市', '410000');
INSERT INTO `ss_area` VALUES ('410801', '市辖区', '410800');
INSERT INTO `ss_area` VALUES ('410802', '解放区', '410800');
INSERT INTO `ss_area` VALUES ('410803', '中站区', '410800');
INSERT INTO `ss_area` VALUES ('410804', '马村区', '410800');
INSERT INTO `ss_area` VALUES ('410811', '山阳区', '410800');
INSERT INTO `ss_area` VALUES ('410821', '修武县', '410800');
INSERT INTO `ss_area` VALUES ('410822', '博爱县', '410800');
INSERT INTO `ss_area` VALUES ('410823', '武陟县', '410800');
INSERT INTO `ss_area` VALUES ('410825', '温　县', '410800');
INSERT INTO `ss_area` VALUES ('410881', '济源市', '410800');
INSERT INTO `ss_area` VALUES ('410882', '沁阳市', '410800');
INSERT INTO `ss_area` VALUES ('410883', '孟州市', '410800');
INSERT INTO `ss_area` VALUES ('410900', '濮阳市', '410000');
INSERT INTO `ss_area` VALUES ('410901', '市辖区', '410900');
INSERT INTO `ss_area` VALUES ('410902', '华龙区', '410900');
INSERT INTO `ss_area` VALUES ('410922', '清丰县', '410900');
INSERT INTO `ss_area` VALUES ('410923', '南乐县', '410900');
INSERT INTO `ss_area` VALUES ('410926', '范　县', '410900');
INSERT INTO `ss_area` VALUES ('410927', '台前县', '410900');
INSERT INTO `ss_area` VALUES ('410928', '濮阳县', '410900');
INSERT INTO `ss_area` VALUES ('411000', '许昌市', '410000');
INSERT INTO `ss_area` VALUES ('411001', '市辖区', '411000');
INSERT INTO `ss_area` VALUES ('411002', '魏都区', '411000');
INSERT INTO `ss_area` VALUES ('411023', '许昌县', '411000');
INSERT INTO `ss_area` VALUES ('411024', '鄢陵县', '411000');
INSERT INTO `ss_area` VALUES ('411025', '襄城县', '411000');
INSERT INTO `ss_area` VALUES ('411081', '禹州市', '411000');
INSERT INTO `ss_area` VALUES ('411082', '长葛市', '411000');
INSERT INTO `ss_area` VALUES ('411100', '漯河市', '410000');
INSERT INTO `ss_area` VALUES ('411101', '市辖区', '411100');
INSERT INTO `ss_area` VALUES ('411102', '源汇区', '411100');
INSERT INTO `ss_area` VALUES ('411103', '郾城区', '411100');
INSERT INTO `ss_area` VALUES ('411104', '召陵区', '411100');
INSERT INTO `ss_area` VALUES ('411121', '舞阳县', '411100');
INSERT INTO `ss_area` VALUES ('411122', '临颍县', '411100');
INSERT INTO `ss_area` VALUES ('411200', '三门峡市', '410000');
INSERT INTO `ss_area` VALUES ('411201', '市辖区', '411200');
INSERT INTO `ss_area` VALUES ('411202', '湖滨区', '411200');
INSERT INTO `ss_area` VALUES ('411221', '渑池县', '411200');
INSERT INTO `ss_area` VALUES ('411222', '陕　县', '411200');
INSERT INTO `ss_area` VALUES ('411224', '卢氏县', '411200');
INSERT INTO `ss_area` VALUES ('411281', '义马市', '411200');
INSERT INTO `ss_area` VALUES ('411282', '灵宝市', '411200');
INSERT INTO `ss_area` VALUES ('411300', '南阳市', '410000');
INSERT INTO `ss_area` VALUES ('411301', '市辖区', '411300');
INSERT INTO `ss_area` VALUES ('411302', '宛城区', '411300');
INSERT INTO `ss_area` VALUES ('411303', '卧龙区', '411300');
INSERT INTO `ss_area` VALUES ('411321', '南召县', '411300');
INSERT INTO `ss_area` VALUES ('411322', '方城县', '411300');
INSERT INTO `ss_area` VALUES ('411323', '西峡县', '411300');
INSERT INTO `ss_area` VALUES ('411324', '镇平县', '411300');
INSERT INTO `ss_area` VALUES ('411325', '内乡县', '411300');
INSERT INTO `ss_area` VALUES ('411326', '淅川县', '411300');
INSERT INTO `ss_area` VALUES ('411327', '社旗县', '411300');
INSERT INTO `ss_area` VALUES ('411328', '唐河县', '411300');
INSERT INTO `ss_area` VALUES ('411329', '新野县', '411300');
INSERT INTO `ss_area` VALUES ('411330', '桐柏县', '411300');
INSERT INTO `ss_area` VALUES ('411381', '邓州市', '411300');
INSERT INTO `ss_area` VALUES ('411400', '商丘市', '410000');
INSERT INTO `ss_area` VALUES ('411401', '市辖区', '411400');
INSERT INTO `ss_area` VALUES ('411402', '梁园区', '411400');
INSERT INTO `ss_area` VALUES ('411403', '睢阳区', '411400');
INSERT INTO `ss_area` VALUES ('411421', '民权县', '411400');
INSERT INTO `ss_area` VALUES ('411422', '睢　县', '411400');
INSERT INTO `ss_area` VALUES ('411423', '宁陵县', '411400');
INSERT INTO `ss_area` VALUES ('411424', '柘城县', '411400');
INSERT INTO `ss_area` VALUES ('411425', '虞城县', '411400');
INSERT INTO `ss_area` VALUES ('411426', '夏邑县', '411400');
INSERT INTO `ss_area` VALUES ('411481', '永城市', '411400');
INSERT INTO `ss_area` VALUES ('411500', '信阳市', '410000');
INSERT INTO `ss_area` VALUES ('411501', '市辖区', '411500');
INSERT INTO `ss_area` VALUES ('411502', '师河区', '411500');
INSERT INTO `ss_area` VALUES ('411503', '平桥区', '411500');
INSERT INTO `ss_area` VALUES ('411521', '罗山县', '411500');
INSERT INTO `ss_area` VALUES ('411522', '光山县', '411500');
INSERT INTO `ss_area` VALUES ('411523', '新　县', '411500');
INSERT INTO `ss_area` VALUES ('411524', '商城县', '411500');
INSERT INTO `ss_area` VALUES ('411525', '固始县', '411500');
INSERT INTO `ss_area` VALUES ('411526', '潢川县', '411500');
INSERT INTO `ss_area` VALUES ('411527', '淮滨县', '411500');
INSERT INTO `ss_area` VALUES ('411528', '息　县', '411500');
INSERT INTO `ss_area` VALUES ('411600', '周口市', '410000');
INSERT INTO `ss_area` VALUES ('411601', '市辖区', '411600');
INSERT INTO `ss_area` VALUES ('411602', '川汇区', '411600');
INSERT INTO `ss_area` VALUES ('411621', '扶沟县', '411600');
INSERT INTO `ss_area` VALUES ('411622', '西华县', '411600');
INSERT INTO `ss_area` VALUES ('411623', '商水县', '411600');
INSERT INTO `ss_area` VALUES ('411624', '沈丘县', '411600');
INSERT INTO `ss_area` VALUES ('411625', '郸城县', '411600');
INSERT INTO `ss_area` VALUES ('411626', '淮阳县', '411600');
INSERT INTO `ss_area` VALUES ('411627', '太康县', '411600');
INSERT INTO `ss_area` VALUES ('411628', '鹿邑县', '411600');
INSERT INTO `ss_area` VALUES ('411681', '项城市', '411600');
INSERT INTO `ss_area` VALUES ('411700', '驻马店市', '410000');
INSERT INTO `ss_area` VALUES ('411701', '市辖区', '411700');
INSERT INTO `ss_area` VALUES ('411702', '驿城区', '411700');
INSERT INTO `ss_area` VALUES ('411721', '西平县', '411700');
INSERT INTO `ss_area` VALUES ('411722', '上蔡县', '411700');
INSERT INTO `ss_area` VALUES ('411723', '平舆县', '411700');
INSERT INTO `ss_area` VALUES ('411724', '正阳县', '411700');
INSERT INTO `ss_area` VALUES ('411725', '确山县', '411700');
INSERT INTO `ss_area` VALUES ('411726', '泌阳县', '411700');
INSERT INTO `ss_area` VALUES ('411727', '汝南县', '411700');
INSERT INTO `ss_area` VALUES ('411728', '遂平县', '411700');
INSERT INTO `ss_area` VALUES ('411729', '新蔡县', '411700');
INSERT INTO `ss_area` VALUES ('420000', '湖北省', '0');
INSERT INTO `ss_area` VALUES ('420100', '武汉市', '420000');
INSERT INTO `ss_area` VALUES ('420101', '市辖区', '420100');
INSERT INTO `ss_area` VALUES ('420102', '江岸区', '420100');
INSERT INTO `ss_area` VALUES ('420103', '江汉区', '420100');
INSERT INTO `ss_area` VALUES ('420104', '乔口区', '420100');
INSERT INTO `ss_area` VALUES ('420105', '汉阳区', '420100');
INSERT INTO `ss_area` VALUES ('420106', '武昌区', '420100');
INSERT INTO `ss_area` VALUES ('420107', '青山区', '420100');
INSERT INTO `ss_area` VALUES ('420111', '洪山区', '420100');
INSERT INTO `ss_area` VALUES ('420112', '东西湖区', '420100');
INSERT INTO `ss_area` VALUES ('420113', '汉南区', '420100');
INSERT INTO `ss_area` VALUES ('420114', '蔡甸区', '420100');
INSERT INTO `ss_area` VALUES ('420115', '江夏区', '420100');
INSERT INTO `ss_area` VALUES ('420116', '黄陂区', '420100');
INSERT INTO `ss_area` VALUES ('420117', '新洲区', '420100');
INSERT INTO `ss_area` VALUES ('420200', '黄石市', '420000');
INSERT INTO `ss_area` VALUES ('420201', '市辖区', '420200');
INSERT INTO `ss_area` VALUES ('420202', '黄石港区', '420200');
INSERT INTO `ss_area` VALUES ('420203', '西塞山区', '420200');
INSERT INTO `ss_area` VALUES ('420204', '下陆区', '420200');
INSERT INTO `ss_area` VALUES ('420205', '铁山区', '420200');
INSERT INTO `ss_area` VALUES ('420222', '阳新县', '420200');
INSERT INTO `ss_area` VALUES ('420281', '大冶市', '420200');
INSERT INTO `ss_area` VALUES ('420300', '十堰市', '420000');
INSERT INTO `ss_area` VALUES ('420301', '市辖区', '420300');
INSERT INTO `ss_area` VALUES ('420302', '茅箭区', '420300');
INSERT INTO `ss_area` VALUES ('420303', '张湾区', '420300');
INSERT INTO `ss_area` VALUES ('420321', '郧　县', '420300');
INSERT INTO `ss_area` VALUES ('420322', '郧西县', '420300');
INSERT INTO `ss_area` VALUES ('420323', '竹山县', '420300');
INSERT INTO `ss_area` VALUES ('420324', '竹溪县', '420300');
INSERT INTO `ss_area` VALUES ('420325', '房　县', '420300');
INSERT INTO `ss_area` VALUES ('420381', '丹江口市', '420300');
INSERT INTO `ss_area` VALUES ('420500', '宜昌市', '420000');
INSERT INTO `ss_area` VALUES ('420501', '市辖区', '420500');
INSERT INTO `ss_area` VALUES ('420502', '西陵区', '420500');
INSERT INTO `ss_area` VALUES ('420503', '伍家岗区', '420500');
INSERT INTO `ss_area` VALUES ('420504', '点军区', '420500');
INSERT INTO `ss_area` VALUES ('420505', '猇亭区', '420500');
INSERT INTO `ss_area` VALUES ('420506', '夷陵区', '420500');
INSERT INTO `ss_area` VALUES ('420525', '远安县', '420500');
INSERT INTO `ss_area` VALUES ('420526', '兴山县', '420500');
INSERT INTO `ss_area` VALUES ('420527', '秭归县', '420500');
INSERT INTO `ss_area` VALUES ('420528', '长阳土家族自治县', '420500');
INSERT INTO `ss_area` VALUES ('420529', '五峰土家族自治县', '420500');
INSERT INTO `ss_area` VALUES ('420581', '宜都市', '420500');
INSERT INTO `ss_area` VALUES ('420582', '当阳市', '420500');
INSERT INTO `ss_area` VALUES ('420583', '枝江市', '420500');
INSERT INTO `ss_area` VALUES ('420600', '襄樊市', '420000');
INSERT INTO `ss_area` VALUES ('420601', '市辖区', '420600');
INSERT INTO `ss_area` VALUES ('420602', '襄城区', '420600');
INSERT INTO `ss_area` VALUES ('420606', '樊城区', '420600');
INSERT INTO `ss_area` VALUES ('420607', '襄阳区', '420600');
INSERT INTO `ss_area` VALUES ('420624', '南漳县', '420600');
INSERT INTO `ss_area` VALUES ('420625', '谷城县', '420600');
INSERT INTO `ss_area` VALUES ('420626', '保康县', '420600');
INSERT INTO `ss_area` VALUES ('420682', '老河口市', '420600');
INSERT INTO `ss_area` VALUES ('420683', '枣阳市', '420600');
INSERT INTO `ss_area` VALUES ('420684', '宜城市', '420600');
INSERT INTO `ss_area` VALUES ('420700', '鄂州市', '420000');
INSERT INTO `ss_area` VALUES ('420701', '市辖区', '420700');
INSERT INTO `ss_area` VALUES ('420702', '梁子湖区', '420700');
INSERT INTO `ss_area` VALUES ('420703', '华容区', '420700');
INSERT INTO `ss_area` VALUES ('420704', '鄂城区', '420700');
INSERT INTO `ss_area` VALUES ('420800', '荆门市', '420000');
INSERT INTO `ss_area` VALUES ('420801', '市辖区', '420800');
INSERT INTO `ss_area` VALUES ('420802', '东宝区', '420800');
INSERT INTO `ss_area` VALUES ('420804', '掇刀区', '420800');
INSERT INTO `ss_area` VALUES ('420821', '京山县', '420800');
INSERT INTO `ss_area` VALUES ('420822', '沙洋县', '420800');
INSERT INTO `ss_area` VALUES ('420881', '钟祥市', '420800');
INSERT INTO `ss_area` VALUES ('420900', '孝感市', '420000');
INSERT INTO `ss_area` VALUES ('420901', '市辖区', '420900');
INSERT INTO `ss_area` VALUES ('420902', '孝南区', '420900');
INSERT INTO `ss_area` VALUES ('420921', '孝昌县', '420900');
INSERT INTO `ss_area` VALUES ('420922', '大悟县', '420900');
INSERT INTO `ss_area` VALUES ('420923', '云梦县', '420900');
INSERT INTO `ss_area` VALUES ('420981', '应城市', '420900');
INSERT INTO `ss_area` VALUES ('420982', '安陆市', '420900');
INSERT INTO `ss_area` VALUES ('420984', '汉川市', '420900');
INSERT INTO `ss_area` VALUES ('421000', '荆州市', '420000');
INSERT INTO `ss_area` VALUES ('421001', '市辖区', '421000');
INSERT INTO `ss_area` VALUES ('421002', '沙市区', '421000');
INSERT INTO `ss_area` VALUES ('421003', '荆州区', '421000');
INSERT INTO `ss_area` VALUES ('421022', '公安县', '421000');
INSERT INTO `ss_area` VALUES ('421023', '监利县', '421000');
INSERT INTO `ss_area` VALUES ('421024', '江陵县', '421000');
INSERT INTO `ss_area` VALUES ('421081', '石首市', '421000');
INSERT INTO `ss_area` VALUES ('421083', '洪湖市', '421000');
INSERT INTO `ss_area` VALUES ('421087', '松滋市', '421000');
INSERT INTO `ss_area` VALUES ('421100', '黄冈市', '420000');
INSERT INTO `ss_area` VALUES ('421101', '市辖区', '421100');
INSERT INTO `ss_area` VALUES ('421102', '黄州区', '421100');
INSERT INTO `ss_area` VALUES ('421121', '团风县', '421100');
INSERT INTO `ss_area` VALUES ('421122', '红安县', '421100');
INSERT INTO `ss_area` VALUES ('421123', '罗田县', '421100');
INSERT INTO `ss_area` VALUES ('421124', '英山县', '421100');
INSERT INTO `ss_area` VALUES ('421125', '浠水县', '421100');
INSERT INTO `ss_area` VALUES ('421126', '蕲春县', '421100');
INSERT INTO `ss_area` VALUES ('421127', '黄梅县', '421100');
INSERT INTO `ss_area` VALUES ('421181', '麻城市', '421100');
INSERT INTO `ss_area` VALUES ('421182', '武穴市', '421100');
INSERT INTO `ss_area` VALUES ('421200', '咸宁市', '420000');
INSERT INTO `ss_area` VALUES ('421201', '市辖区', '421200');
INSERT INTO `ss_area` VALUES ('421202', '咸安区', '421200');
INSERT INTO `ss_area` VALUES ('421221', '嘉鱼县', '421200');
INSERT INTO `ss_area` VALUES ('421222', '通城县', '421200');
INSERT INTO `ss_area` VALUES ('421223', '崇阳县', '421200');
INSERT INTO `ss_area` VALUES ('421224', '通山县', '421200');
INSERT INTO `ss_area` VALUES ('421281', '赤壁市', '421200');
INSERT INTO `ss_area` VALUES ('421300', '随州市', '420000');
INSERT INTO `ss_area` VALUES ('421301', '市辖区', '421300');
INSERT INTO `ss_area` VALUES ('421302', '曾都区', '421300');
INSERT INTO `ss_area` VALUES ('421381', '广水市', '421300');
INSERT INTO `ss_area` VALUES ('422800', '恩施土家族苗族自治州', '420000');
INSERT INTO `ss_area` VALUES ('422801', '恩施市', '422800');
INSERT INTO `ss_area` VALUES ('422802', '利川市', '422800');
INSERT INTO `ss_area` VALUES ('422822', '建始县', '422800');
INSERT INTO `ss_area` VALUES ('422823', '巴东县', '422800');
INSERT INTO `ss_area` VALUES ('422825', '宣恩县', '422800');
INSERT INTO `ss_area` VALUES ('422826', '咸丰县', '422800');
INSERT INTO `ss_area` VALUES ('422827', '来凤县', '422800');
INSERT INTO `ss_area` VALUES ('422828', '鹤峰县', '422800');
INSERT INTO `ss_area` VALUES ('429000', '省直辖行政单位', '420000');
INSERT INTO `ss_area` VALUES ('429004', '仙桃市', '429000');
INSERT INTO `ss_area` VALUES ('429005', '潜江市', '429000');
INSERT INTO `ss_area` VALUES ('429006', '天门市', '429000');
INSERT INTO `ss_area` VALUES ('429021', '神农架林区', '429000');
INSERT INTO `ss_area` VALUES ('430000', '湖南省', '0');
INSERT INTO `ss_area` VALUES ('430100', '长沙市', '430000');
INSERT INTO `ss_area` VALUES ('430101', '市辖区', '430100');
INSERT INTO `ss_area` VALUES ('430102', '芙蓉区', '430100');
INSERT INTO `ss_area` VALUES ('430103', '天心区', '430100');
INSERT INTO `ss_area` VALUES ('430104', '岳麓区', '430100');
INSERT INTO `ss_area` VALUES ('430105', '开福区', '430100');
INSERT INTO `ss_area` VALUES ('430111', '雨花区', '430100');
INSERT INTO `ss_area` VALUES ('430121', '长沙县', '430100');
INSERT INTO `ss_area` VALUES ('430122', '望城县', '430100');
INSERT INTO `ss_area` VALUES ('430124', '宁乡县', '430100');
INSERT INTO `ss_area` VALUES ('430181', '浏阳市', '430100');
INSERT INTO `ss_area` VALUES ('430200', '株洲市', '430000');
INSERT INTO `ss_area` VALUES ('430201', '市辖区', '430200');
INSERT INTO `ss_area` VALUES ('430202', '荷塘区', '430200');
INSERT INTO `ss_area` VALUES ('430203', '芦淞区', '430200');
INSERT INTO `ss_area` VALUES ('430204', '石峰区', '430200');
INSERT INTO `ss_area` VALUES ('430211', '天元区', '430200');
INSERT INTO `ss_area` VALUES ('430221', '株洲县', '430200');
INSERT INTO `ss_area` VALUES ('430223', '攸　县', '430200');
INSERT INTO `ss_area` VALUES ('430224', '茶陵县', '430200');
INSERT INTO `ss_area` VALUES ('430225', '炎陵县', '430200');
INSERT INTO `ss_area` VALUES ('430281', '醴陵市', '430200');
INSERT INTO `ss_area` VALUES ('430300', '湘潭市', '430000');
INSERT INTO `ss_area` VALUES ('430301', '市辖区', '430300');
INSERT INTO `ss_area` VALUES ('430302', '雨湖区', '430300');
INSERT INTO `ss_area` VALUES ('430304', '岳塘区', '430300');
INSERT INTO `ss_area` VALUES ('430321', '湘潭县', '430300');
INSERT INTO `ss_area` VALUES ('430381', '湘乡市', '430300');
INSERT INTO `ss_area` VALUES ('430382', '韶山市', '430300');
INSERT INTO `ss_area` VALUES ('430400', '衡阳市', '430000');
INSERT INTO `ss_area` VALUES ('430401', '市辖区', '430400');
INSERT INTO `ss_area` VALUES ('430405', '珠晖区', '430400');
INSERT INTO `ss_area` VALUES ('430406', '雁峰区', '430400');
INSERT INTO `ss_area` VALUES ('430407', '石鼓区', '430400');
INSERT INTO `ss_area` VALUES ('430408', '蒸湘区', '430400');
INSERT INTO `ss_area` VALUES ('430412', '南岳区', '430400');
INSERT INTO `ss_area` VALUES ('430421', '衡阳县', '430400');
INSERT INTO `ss_area` VALUES ('430422', '衡南县', '430400');
INSERT INTO `ss_area` VALUES ('430423', '衡山县', '430400');
INSERT INTO `ss_area` VALUES ('430424', '衡东县', '430400');
INSERT INTO `ss_area` VALUES ('430426', '祁东县', '430400');
INSERT INTO `ss_area` VALUES ('430481', '耒阳市', '430400');
INSERT INTO `ss_area` VALUES ('430482', '常宁市', '430400');
INSERT INTO `ss_area` VALUES ('430500', '邵阳市', '430000');
INSERT INTO `ss_area` VALUES ('430501', '市辖区', '430500');
INSERT INTO `ss_area` VALUES ('430502', '双清区', '430500');
INSERT INTO `ss_area` VALUES ('430503', '大祥区', '430500');
INSERT INTO `ss_area` VALUES ('430511', '北塔区', '430500');
INSERT INTO `ss_area` VALUES ('430521', '邵东县', '430500');
INSERT INTO `ss_area` VALUES ('430522', '新邵县', '430500');
INSERT INTO `ss_area` VALUES ('430523', '邵阳县', '430500');
INSERT INTO `ss_area` VALUES ('430524', '隆回县', '430500');
INSERT INTO `ss_area` VALUES ('430525', '洞口县', '430500');
INSERT INTO `ss_area` VALUES ('430527', '绥宁县', '430500');
INSERT INTO `ss_area` VALUES ('430528', '新宁县', '430500');
INSERT INTO `ss_area` VALUES ('430529', '城步苗族自治县', '430500');
INSERT INTO `ss_area` VALUES ('430581', '武冈市', '430500');
INSERT INTO `ss_area` VALUES ('430600', '岳阳市', '430000');
INSERT INTO `ss_area` VALUES ('430601', '市辖区', '430600');
INSERT INTO `ss_area` VALUES ('430602', '岳阳楼区', '430600');
INSERT INTO `ss_area` VALUES ('430603', '云溪区', '430600');
INSERT INTO `ss_area` VALUES ('430611', '君山区', '430600');
INSERT INTO `ss_area` VALUES ('430621', '岳阳县', '430600');
INSERT INTO `ss_area` VALUES ('430623', '华容县', '430600');
INSERT INTO `ss_area` VALUES ('430624', '湘阴县', '430600');
INSERT INTO `ss_area` VALUES ('430626', '平江县', '430600');
INSERT INTO `ss_area` VALUES ('430681', '汨罗市', '430600');
INSERT INTO `ss_area` VALUES ('430682', '临湘市', '430600');
INSERT INTO `ss_area` VALUES ('430700', '常德市', '430000');
INSERT INTO `ss_area` VALUES ('430701', '市辖区', '430700');
INSERT INTO `ss_area` VALUES ('430702', '武陵区', '430700');
INSERT INTO `ss_area` VALUES ('430703', '鼎城区', '430700');
INSERT INTO `ss_area` VALUES ('430721', '安乡县', '430700');
INSERT INTO `ss_area` VALUES ('430722', '汉寿县', '430700');
INSERT INTO `ss_area` VALUES ('430723', '澧　县', '430700');
INSERT INTO `ss_area` VALUES ('430724', '临澧县', '430700');
INSERT INTO `ss_area` VALUES ('430725', '桃源县', '430700');
INSERT INTO `ss_area` VALUES ('430726', '石门县', '430700');
INSERT INTO `ss_area` VALUES ('430781', '津市市', '430700');
INSERT INTO `ss_area` VALUES ('430800', '张家界市', '430000');
INSERT INTO `ss_area` VALUES ('430801', '市辖区', '430800');
INSERT INTO `ss_area` VALUES ('430802', '永定区', '430800');
INSERT INTO `ss_area` VALUES ('430811', '武陵源区', '430800');
INSERT INTO `ss_area` VALUES ('430821', '慈利县', '430800');
INSERT INTO `ss_area` VALUES ('430822', '桑植县', '430800');
INSERT INTO `ss_area` VALUES ('430900', '益阳市', '430000');
INSERT INTO `ss_area` VALUES ('430901', '市辖区', '430900');
INSERT INTO `ss_area` VALUES ('430902', '资阳区', '430900');
INSERT INTO `ss_area` VALUES ('430903', '赫山区', '430900');
INSERT INTO `ss_area` VALUES ('430921', '南　县', '430900');
INSERT INTO `ss_area` VALUES ('430922', '桃江县', '430900');
INSERT INTO `ss_area` VALUES ('430923', '安化县', '430900');
INSERT INTO `ss_area` VALUES ('430981', '沅江市', '430900');
INSERT INTO `ss_area` VALUES ('431000', '郴州市', '430000');
INSERT INTO `ss_area` VALUES ('431001', '市辖区', '431000');
INSERT INTO `ss_area` VALUES ('431002', '北湖区', '431000');
INSERT INTO `ss_area` VALUES ('431003', '苏仙区', '431000');
INSERT INTO `ss_area` VALUES ('431021', '桂阳县', '431000');
INSERT INTO `ss_area` VALUES ('431022', '宜章县', '431000');
INSERT INTO `ss_area` VALUES ('431023', '永兴县', '431000');
INSERT INTO `ss_area` VALUES ('431024', '嘉禾县', '431000');
INSERT INTO `ss_area` VALUES ('431025', '临武县', '431000');
INSERT INTO `ss_area` VALUES ('431026', '汝城县', '431000');
INSERT INTO `ss_area` VALUES ('431027', '桂东县', '431000');
INSERT INTO `ss_area` VALUES ('431028', '安仁县', '431000');
INSERT INTO `ss_area` VALUES ('431081', '资兴市', '431000');
INSERT INTO `ss_area` VALUES ('431100', '永州市', '430000');
INSERT INTO `ss_area` VALUES ('431101', '市辖区', '431100');
INSERT INTO `ss_area` VALUES ('431102', '芝山区', '431100');
INSERT INTO `ss_area` VALUES ('431103', '冷水滩区', '431100');
INSERT INTO `ss_area` VALUES ('431121', '祁阳县', '431100');
INSERT INTO `ss_area` VALUES ('431122', '东安县', '431100');
INSERT INTO `ss_area` VALUES ('431123', '双牌县', '431100');
INSERT INTO `ss_area` VALUES ('431124', '道　县', '431100');
INSERT INTO `ss_area` VALUES ('431125', '江永县', '431100');
INSERT INTO `ss_area` VALUES ('431126', '宁远县', '431100');
INSERT INTO `ss_area` VALUES ('431127', '蓝山县', '431100');
INSERT INTO `ss_area` VALUES ('431128', '新田县', '431100');
INSERT INTO `ss_area` VALUES ('431129', '江华瑶族自治县', '431100');
INSERT INTO `ss_area` VALUES ('431200', '怀化市', '430000');
INSERT INTO `ss_area` VALUES ('431201', '市辖区', '431200');
INSERT INTO `ss_area` VALUES ('431202', '鹤城区', '431200');
INSERT INTO `ss_area` VALUES ('431221', '中方县', '431200');
INSERT INTO `ss_area` VALUES ('431222', '沅陵县', '431200');
INSERT INTO `ss_area` VALUES ('431223', '辰溪县', '431200');
INSERT INTO `ss_area` VALUES ('431224', '溆浦县', '431200');
INSERT INTO `ss_area` VALUES ('431225', '会同县', '431200');
INSERT INTO `ss_area` VALUES ('431226', '麻阳苗族自治县', '431200');
INSERT INTO `ss_area` VALUES ('431227', '新晃侗族自治县', '431200');
INSERT INTO `ss_area` VALUES ('431228', '芷江侗族自治县', '431200');
INSERT INTO `ss_area` VALUES ('431229', '靖州苗族侗族自治县', '431200');
INSERT INTO `ss_area` VALUES ('431230', '通道侗族自治县', '431200');
INSERT INTO `ss_area` VALUES ('431281', '洪江市', '431200');
INSERT INTO `ss_area` VALUES ('431300', '娄底市', '430000');
INSERT INTO `ss_area` VALUES ('431301', '市辖区', '431300');
INSERT INTO `ss_area` VALUES ('431302', '娄星区', '431300');
INSERT INTO `ss_area` VALUES ('431321', '双峰县', '431300');
INSERT INTO `ss_area` VALUES ('431322', '新化县', '431300');
INSERT INTO `ss_area` VALUES ('431381', '冷水江市', '431300');
INSERT INTO `ss_area` VALUES ('431382', '涟源市', '431300');
INSERT INTO `ss_area` VALUES ('433100', '湘西土家族苗族自治州', '430000');
INSERT INTO `ss_area` VALUES ('433101', '吉首市', '433100');
INSERT INTO `ss_area` VALUES ('433122', '泸溪县', '433100');
INSERT INTO `ss_area` VALUES ('433123', '凤凰县', '433100');
INSERT INTO `ss_area` VALUES ('433124', '花垣县', '433100');
INSERT INTO `ss_area` VALUES ('433125', '保靖县', '433100');
INSERT INTO `ss_area` VALUES ('433126', '古丈县', '433100');
INSERT INTO `ss_area` VALUES ('433127', '永顺县', '433100');
INSERT INTO `ss_area` VALUES ('433130', '龙山县', '433100');
INSERT INTO `ss_area` VALUES ('440000', '广东省', '0');
INSERT INTO `ss_area` VALUES ('440100', '广州市', '440000');
INSERT INTO `ss_area` VALUES ('440101', '市辖区', '440100');
INSERT INTO `ss_area` VALUES ('440102', '东山区', '440100');
INSERT INTO `ss_area` VALUES ('440103', '荔湾区', '440100');
INSERT INTO `ss_area` VALUES ('440104', '越秀区', '440100');
INSERT INTO `ss_area` VALUES ('440105', '海珠区', '440100');
INSERT INTO `ss_area` VALUES ('440106', '天河区', '440100');
INSERT INTO `ss_area` VALUES ('440107', '芳村区', '440100');
INSERT INTO `ss_area` VALUES ('440111', '白云区', '440100');
INSERT INTO `ss_area` VALUES ('440112', '黄埔区', '440100');
INSERT INTO `ss_area` VALUES ('440113', '番禺区', '440100');
INSERT INTO `ss_area` VALUES ('440114', '花都区', '440100');
INSERT INTO `ss_area` VALUES ('440183', '增城市', '440100');
INSERT INTO `ss_area` VALUES ('440184', '从化市', '440100');
INSERT INTO `ss_area` VALUES ('440200', '韶关市', '440000');
INSERT INTO `ss_area` VALUES ('440201', '市辖区', '440200');
INSERT INTO `ss_area` VALUES ('440203', '武江区', '440200');
INSERT INTO `ss_area` VALUES ('440204', '浈江区', '440200');
INSERT INTO `ss_area` VALUES ('440205', '曲江区', '440200');
INSERT INTO `ss_area` VALUES ('440222', '始兴县', '440200');
INSERT INTO `ss_area` VALUES ('440224', '仁化县', '440200');
INSERT INTO `ss_area` VALUES ('440229', '翁源县', '440200');
INSERT INTO `ss_area` VALUES ('440232', '乳源瑶族自治县', '440200');
INSERT INTO `ss_area` VALUES ('440233', '新丰县', '440200');
INSERT INTO `ss_area` VALUES ('440281', '乐昌市', '440200');
INSERT INTO `ss_area` VALUES ('440282', '南雄市', '440200');
INSERT INTO `ss_area` VALUES ('440300', '深圳市', '440000');
INSERT INTO `ss_area` VALUES ('440301', '市辖区', '440300');
INSERT INTO `ss_area` VALUES ('440303', '罗湖区', '440300');
INSERT INTO `ss_area` VALUES ('440304', '福田区', '440300');
INSERT INTO `ss_area` VALUES ('440305', '南山区', '440300');
INSERT INTO `ss_area` VALUES ('440306', '宝安区', '440300');
INSERT INTO `ss_area` VALUES ('440307', '龙岗区', '440300');
INSERT INTO `ss_area` VALUES ('440308', '盐田区', '440300');
INSERT INTO `ss_area` VALUES ('440400', '珠海市', '440000');
INSERT INTO `ss_area` VALUES ('440401', '市辖区', '440400');
INSERT INTO `ss_area` VALUES ('440402', '香洲区', '440400');
INSERT INTO `ss_area` VALUES ('440403', '斗门区', '440400');
INSERT INTO `ss_area` VALUES ('440404', '金湾区', '440400');
INSERT INTO `ss_area` VALUES ('440500', '汕头市', '440000');
INSERT INTO `ss_area` VALUES ('440501', '市辖区', '440500');
INSERT INTO `ss_area` VALUES ('440507', '龙湖区', '440500');
INSERT INTO `ss_area` VALUES ('440511', '金平区', '440500');
INSERT INTO `ss_area` VALUES ('440512', '濠江区', '440500');
INSERT INTO `ss_area` VALUES ('440513', '潮阳区', '440500');
INSERT INTO `ss_area` VALUES ('440514', '潮南区', '440500');
INSERT INTO `ss_area` VALUES ('440515', '澄海区', '440500');
INSERT INTO `ss_area` VALUES ('440523', '南澳县', '440500');
INSERT INTO `ss_area` VALUES ('440600', '佛山市', '440000');
INSERT INTO `ss_area` VALUES ('440601', '市辖区', '440600');
INSERT INTO `ss_area` VALUES ('440604', '禅城区', '440600');
INSERT INTO `ss_area` VALUES ('440605', '南海区', '440600');
INSERT INTO `ss_area` VALUES ('440606', '顺德区', '440600');
INSERT INTO `ss_area` VALUES ('440607', '三水区', '440600');
INSERT INTO `ss_area` VALUES ('440608', '高明区', '440600');
INSERT INTO `ss_area` VALUES ('440700', '江门市', '440000');
INSERT INTO `ss_area` VALUES ('440701', '市辖区', '440700');
INSERT INTO `ss_area` VALUES ('440703', '蓬江区', '440700');
INSERT INTO `ss_area` VALUES ('440704', '江海区', '440700');
INSERT INTO `ss_area` VALUES ('440705', '新会区', '440700');
INSERT INTO `ss_area` VALUES ('440781', '台山市', '440700');
INSERT INTO `ss_area` VALUES ('440783', '开平市', '440700');
INSERT INTO `ss_area` VALUES ('440784', '鹤山市', '440700');
INSERT INTO `ss_area` VALUES ('440785', '恩平市', '440700');
INSERT INTO `ss_area` VALUES ('440800', '湛江市', '440000');
INSERT INTO `ss_area` VALUES ('440801', '市辖区', '440800');
INSERT INTO `ss_area` VALUES ('440802', '赤坎区', '440800');
INSERT INTO `ss_area` VALUES ('440803', '霞山区', '440800');
INSERT INTO `ss_area` VALUES ('440804', '坡头区', '440800');
INSERT INTO `ss_area` VALUES ('440811', '麻章区', '440800');
INSERT INTO `ss_area` VALUES ('440823', '遂溪县', '440800');
INSERT INTO `ss_area` VALUES ('440825', '徐闻县', '440800');
INSERT INTO `ss_area` VALUES ('440881', '廉江市', '440800');
INSERT INTO `ss_area` VALUES ('440882', '雷州市', '440800');
INSERT INTO `ss_area` VALUES ('440883', '吴川市', '440800');
INSERT INTO `ss_area` VALUES ('440900', '茂名市', '440000');
INSERT INTO `ss_area` VALUES ('440901', '市辖区', '440900');
INSERT INTO `ss_area` VALUES ('440902', '茂南区', '440900');
INSERT INTO `ss_area` VALUES ('440903', '茂港区', '440900');
INSERT INTO `ss_area` VALUES ('440923', '电白县', '440900');
INSERT INTO `ss_area` VALUES ('440981', '高州市', '440900');
INSERT INTO `ss_area` VALUES ('440982', '化州市', '440900');
INSERT INTO `ss_area` VALUES ('440983', '信宜市', '440900');
INSERT INTO `ss_area` VALUES ('441200', '肇庆市', '440000');
INSERT INTO `ss_area` VALUES ('441201', '市辖区', '441200');
INSERT INTO `ss_area` VALUES ('441202', '端州区', '441200');
INSERT INTO `ss_area` VALUES ('441203', '鼎湖区', '441200');
INSERT INTO `ss_area` VALUES ('441223', '广宁县', '441200');
INSERT INTO `ss_area` VALUES ('441224', '怀集县', '441200');
INSERT INTO `ss_area` VALUES ('441225', '封开县', '441200');
INSERT INTO `ss_area` VALUES ('441226', '德庆县', '441200');
INSERT INTO `ss_area` VALUES ('441283', '高要市', '441200');
INSERT INTO `ss_area` VALUES ('441284', '四会市', '441200');
INSERT INTO `ss_area` VALUES ('441300', '惠州市', '440000');
INSERT INTO `ss_area` VALUES ('441301', '市辖区', '441300');
INSERT INTO `ss_area` VALUES ('441302', '惠城区', '441300');
INSERT INTO `ss_area` VALUES ('441303', '惠阳区', '441300');
INSERT INTO `ss_area` VALUES ('441322', '博罗县', '441300');
INSERT INTO `ss_area` VALUES ('441323', '惠东县', '441300');
INSERT INTO `ss_area` VALUES ('441324', '龙门县', '441300');
INSERT INTO `ss_area` VALUES ('441400', '梅州市', '440000');
INSERT INTO `ss_area` VALUES ('441401', '市辖区', '441400');
INSERT INTO `ss_area` VALUES ('441402', '梅江区', '441400');
INSERT INTO `ss_area` VALUES ('441421', '梅　县', '441400');
INSERT INTO `ss_area` VALUES ('441422', '大埔县', '441400');
INSERT INTO `ss_area` VALUES ('441423', '丰顺县', '441400');
INSERT INTO `ss_area` VALUES ('441424', '五华县', '441400');
INSERT INTO `ss_area` VALUES ('441426', '平远县', '441400');
INSERT INTO `ss_area` VALUES ('441427', '蕉岭县', '441400');
INSERT INTO `ss_area` VALUES ('441481', '兴宁市', '441400');
INSERT INTO `ss_area` VALUES ('441500', '汕尾市', '440000');
INSERT INTO `ss_area` VALUES ('441501', '市辖区', '441500');
INSERT INTO `ss_area` VALUES ('441502', '城　区', '441500');
INSERT INTO `ss_area` VALUES ('441521', '海丰县', '441500');
INSERT INTO `ss_area` VALUES ('441523', '陆河县', '441500');
INSERT INTO `ss_area` VALUES ('441581', '陆丰市', '441500');
INSERT INTO `ss_area` VALUES ('441600', '河源市', '440000');
INSERT INTO `ss_area` VALUES ('441601', '市辖区', '441600');
INSERT INTO `ss_area` VALUES ('441602', '源城区', '441600');
INSERT INTO `ss_area` VALUES ('441621', '紫金县', '441600');
INSERT INTO `ss_area` VALUES ('441622', '龙川县', '441600');
INSERT INTO `ss_area` VALUES ('441623', '连平县', '441600');
INSERT INTO `ss_area` VALUES ('441624', '和平县', '441600');
INSERT INTO `ss_area` VALUES ('441625', '东源县', '441600');
INSERT INTO `ss_area` VALUES ('441700', '阳江市', '440000');
INSERT INTO `ss_area` VALUES ('441701', '市辖区', '441700');
INSERT INTO `ss_area` VALUES ('441702', '江城区', '441700');
INSERT INTO `ss_area` VALUES ('441721', '阳西县', '441700');
INSERT INTO `ss_area` VALUES ('441723', '阳东县', '441700');
INSERT INTO `ss_area` VALUES ('441781', '阳春市', '441700');
INSERT INTO `ss_area` VALUES ('441800', '清远市', '440000');
INSERT INTO `ss_area` VALUES ('441801', '市辖区', '441800');
INSERT INTO `ss_area` VALUES ('441802', '清城区', '441800');
INSERT INTO `ss_area` VALUES ('441821', '佛冈县', '441800');
INSERT INTO `ss_area` VALUES ('441823', '阳山县', '441800');
INSERT INTO `ss_area` VALUES ('441825', '连山壮族瑶族自治县', '441800');
INSERT INTO `ss_area` VALUES ('441826', '连南瑶族自治县', '441800');
INSERT INTO `ss_area` VALUES ('441827', '清新县', '441800');
INSERT INTO `ss_area` VALUES ('441881', '英德市', '441800');
INSERT INTO `ss_area` VALUES ('441882', '连州市', '441800');
INSERT INTO `ss_area` VALUES ('441900', '东莞市', '440000');
INSERT INTO `ss_area` VALUES ('442000', '中山市', '440000');
INSERT INTO `ss_area` VALUES ('445100', '潮州市', '440000');
INSERT INTO `ss_area` VALUES ('445101', '市辖区', '445100');
INSERT INTO `ss_area` VALUES ('445102', '湘桥区', '445100');
INSERT INTO `ss_area` VALUES ('445121', '潮安县', '445100');
INSERT INTO `ss_area` VALUES ('445122', '饶平县', '445100');
INSERT INTO `ss_area` VALUES ('445200', '揭阳市', '440000');
INSERT INTO `ss_area` VALUES ('445201', '市辖区', '445200');
INSERT INTO `ss_area` VALUES ('445202', '榕城区', '445200');
INSERT INTO `ss_area` VALUES ('445221', '揭东县', '445200');
INSERT INTO `ss_area` VALUES ('445222', '揭西县', '445200');
INSERT INTO `ss_area` VALUES ('445224', '惠来县', '445200');
INSERT INTO `ss_area` VALUES ('445281', '普宁市', '445200');
INSERT INTO `ss_area` VALUES ('445300', '云浮市', '440000');
INSERT INTO `ss_area` VALUES ('445301', '市辖区', '445300');
INSERT INTO `ss_area` VALUES ('445302', '云城区', '445300');
INSERT INTO `ss_area` VALUES ('445321', '新兴县', '445300');
INSERT INTO `ss_area` VALUES ('445322', '郁南县', '445300');
INSERT INTO `ss_area` VALUES ('445323', '云安县', '445300');
INSERT INTO `ss_area` VALUES ('445381', '罗定市', '445300');
INSERT INTO `ss_area` VALUES ('450000', '广西壮族自治区', '0');
INSERT INTO `ss_area` VALUES ('450100', '南宁市', '450000');
INSERT INTO `ss_area` VALUES ('450101', '市辖区', '450100');
INSERT INTO `ss_area` VALUES ('450102', '兴宁区', '450100');
INSERT INTO `ss_area` VALUES ('450103', '青秀区', '450100');
INSERT INTO `ss_area` VALUES ('450105', '江南区', '450100');
INSERT INTO `ss_area` VALUES ('450107', '西乡塘区', '450100');
INSERT INTO `ss_area` VALUES ('450108', '良庆区', '450100');
INSERT INTO `ss_area` VALUES ('450109', '邕宁区', '450100');
INSERT INTO `ss_area` VALUES ('450122', '武鸣县', '450100');
INSERT INTO `ss_area` VALUES ('450123', '隆安县', '450100');
INSERT INTO `ss_area` VALUES ('450124', '马山县', '450100');
INSERT INTO `ss_area` VALUES ('450125', '上林县', '450100');
INSERT INTO `ss_area` VALUES ('450126', '宾阳县', '450100');
INSERT INTO `ss_area` VALUES ('450127', '横　县', '450100');
INSERT INTO `ss_area` VALUES ('450200', '柳州市', '450000');
INSERT INTO `ss_area` VALUES ('450201', '市辖区', '450200');
INSERT INTO `ss_area` VALUES ('450202', '城中区', '450200');
INSERT INTO `ss_area` VALUES ('450203', '鱼峰区', '450200');
INSERT INTO `ss_area` VALUES ('450204', '柳南区', '450200');
INSERT INTO `ss_area` VALUES ('450205', '柳北区', '450200');
INSERT INTO `ss_area` VALUES ('450221', '柳江县', '450200');
INSERT INTO `ss_area` VALUES ('450222', '柳城县', '450200');
INSERT INTO `ss_area` VALUES ('450223', '鹿寨县', '450200');
INSERT INTO `ss_area` VALUES ('450224', '融安县', '450200');
INSERT INTO `ss_area` VALUES ('450225', '融水苗族自治县', '450200');
INSERT INTO `ss_area` VALUES ('450226', '三江侗族自治县', '450200');
INSERT INTO `ss_area` VALUES ('450300', '桂林市', '450000');
INSERT INTO `ss_area` VALUES ('450301', '市辖区', '450300');
INSERT INTO `ss_area` VALUES ('450302', '秀峰区', '450300');
INSERT INTO `ss_area` VALUES ('450303', '叠彩区', '450300');
INSERT INTO `ss_area` VALUES ('450304', '象山区', '450300');
INSERT INTO `ss_area` VALUES ('450305', '七星区', '450300');
INSERT INTO `ss_area` VALUES ('450311', '雁山区', '450300');
INSERT INTO `ss_area` VALUES ('450321', '阳朔县', '450300');
INSERT INTO `ss_area` VALUES ('450322', '临桂县', '450300');
INSERT INTO `ss_area` VALUES ('450323', '灵川县', '450300');
INSERT INTO `ss_area` VALUES ('450324', '全州县', '450300');
INSERT INTO `ss_area` VALUES ('450325', '兴安县', '450300');
INSERT INTO `ss_area` VALUES ('450326', '永福县', '450300');
INSERT INTO `ss_area` VALUES ('450327', '灌阳县', '450300');
INSERT INTO `ss_area` VALUES ('450328', '龙胜各族自治县', '450300');
INSERT INTO `ss_area` VALUES ('450329', '资源县', '450300');
INSERT INTO `ss_area` VALUES ('450330', '平乐县', '450300');
INSERT INTO `ss_area` VALUES ('450331', '荔蒲县', '450300');
INSERT INTO `ss_area` VALUES ('450332', '恭城瑶族自治县', '450300');
INSERT INTO `ss_area` VALUES ('450400', '梧州市', '450000');
INSERT INTO `ss_area` VALUES ('450401', '市辖区', '450400');
INSERT INTO `ss_area` VALUES ('450403', '万秀区', '450400');
INSERT INTO `ss_area` VALUES ('450404', '蝶山区', '450400');
INSERT INTO `ss_area` VALUES ('450405', '长洲区', '450400');
INSERT INTO `ss_area` VALUES ('450421', '苍梧县', '450400');
INSERT INTO `ss_area` VALUES ('450422', '藤　县', '450400');
INSERT INTO `ss_area` VALUES ('450423', '蒙山县', '450400');
INSERT INTO `ss_area` VALUES ('450481', '岑溪市', '450400');
INSERT INTO `ss_area` VALUES ('450500', '北海市', '450000');
INSERT INTO `ss_area` VALUES ('450501', '市辖区', '450500');
INSERT INTO `ss_area` VALUES ('450502', '海城区', '450500');
INSERT INTO `ss_area` VALUES ('450503', '银海区', '450500');
INSERT INTO `ss_area` VALUES ('450512', '铁山港区', '450500');
INSERT INTO `ss_area` VALUES ('450521', '合浦县', '450500');
INSERT INTO `ss_area` VALUES ('450600', '防城港市', '450000');
INSERT INTO `ss_area` VALUES ('450601', '市辖区', '450600');
INSERT INTO `ss_area` VALUES ('450602', '港口区', '450600');
INSERT INTO `ss_area` VALUES ('450603', '防城区', '450600');
INSERT INTO `ss_area` VALUES ('450621', '上思县', '450600');
INSERT INTO `ss_area` VALUES ('450681', '东兴市', '450600');
INSERT INTO `ss_area` VALUES ('450700', '钦州市', '450000');
INSERT INTO `ss_area` VALUES ('450701', '市辖区', '450700');
INSERT INTO `ss_area` VALUES ('450702', '钦南区', '450700');
INSERT INTO `ss_area` VALUES ('450703', '钦北区', '450700');
INSERT INTO `ss_area` VALUES ('450721', '灵山县', '450700');
INSERT INTO `ss_area` VALUES ('450722', '浦北县', '450700');
INSERT INTO `ss_area` VALUES ('450800', '贵港市', '450000');
INSERT INTO `ss_area` VALUES ('450801', '市辖区', '450800');
INSERT INTO `ss_area` VALUES ('450802', '港北区', '450800');
INSERT INTO `ss_area` VALUES ('450803', '港南区', '450800');
INSERT INTO `ss_area` VALUES ('450804', '覃塘区', '450800');
INSERT INTO `ss_area` VALUES ('450821', '平南县', '450800');
INSERT INTO `ss_area` VALUES ('450881', '桂平市', '450800');
INSERT INTO `ss_area` VALUES ('450900', '玉林市', '450000');
INSERT INTO `ss_area` VALUES ('450901', '市辖区', '450900');
INSERT INTO `ss_area` VALUES ('450902', '玉州区', '450900');
INSERT INTO `ss_area` VALUES ('450921', '容　县', '450900');
INSERT INTO `ss_area` VALUES ('450922', '陆川县', '450900');
INSERT INTO `ss_area` VALUES ('450923', '博白县', '450900');
INSERT INTO `ss_area` VALUES ('450924', '兴业县', '450900');
INSERT INTO `ss_area` VALUES ('450981', '北流市', '450900');
INSERT INTO `ss_area` VALUES ('451000', '百色市', '450000');
INSERT INTO `ss_area` VALUES ('451001', '市辖区', '451000');
INSERT INTO `ss_area` VALUES ('451002', '右江区', '451000');
INSERT INTO `ss_area` VALUES ('451021', '田阳县', '451000');
INSERT INTO `ss_area` VALUES ('451022', '田东县', '451000');
INSERT INTO `ss_area` VALUES ('451023', '平果县', '451000');
INSERT INTO `ss_area` VALUES ('451024', '德保县', '451000');
INSERT INTO `ss_area` VALUES ('451025', '靖西县', '451000');
INSERT INTO `ss_area` VALUES ('451026', '那坡县', '451000');
INSERT INTO `ss_area` VALUES ('451027', '凌云县', '451000');
INSERT INTO `ss_area` VALUES ('451028', '乐业县', '451000');
INSERT INTO `ss_area` VALUES ('451029', '田林县', '451000');
INSERT INTO `ss_area` VALUES ('451030', '西林县', '451000');
INSERT INTO `ss_area` VALUES ('451031', '隆林各族自治县', '451000');
INSERT INTO `ss_area` VALUES ('451100', '贺州市', '450000');
INSERT INTO `ss_area` VALUES ('451101', '市辖区', '451100');
INSERT INTO `ss_area` VALUES ('451102', '八步区', '451100');
INSERT INTO `ss_area` VALUES ('451121', '昭平县', '451100');
INSERT INTO `ss_area` VALUES ('451122', '钟山县', '451100');
INSERT INTO `ss_area` VALUES ('451123', '富川瑶族自治县', '451100');
INSERT INTO `ss_area` VALUES ('451200', '河池市', '450000');
INSERT INTO `ss_area` VALUES ('451201', '市辖区', '451200');
INSERT INTO `ss_area` VALUES ('451202', '金城江区', '451200');
INSERT INTO `ss_area` VALUES ('451221', '南丹县', '451200');
INSERT INTO `ss_area` VALUES ('451222', '天峨县', '451200');
INSERT INTO `ss_area` VALUES ('451223', '凤山县', '451200');
INSERT INTO `ss_area` VALUES ('451224', '东兰县', '451200');
INSERT INTO `ss_area` VALUES ('451225', '罗城仫佬族自治县', '451200');
INSERT INTO `ss_area` VALUES ('451226', '环江毛南族自治县', '451200');
INSERT INTO `ss_area` VALUES ('451227', '巴马瑶族自治县', '451200');
INSERT INTO `ss_area` VALUES ('451228', '都安瑶族自治县', '451200');
INSERT INTO `ss_area` VALUES ('451229', '大化瑶族自治县', '451200');
INSERT INTO `ss_area` VALUES ('451281', '宜州市', '451200');
INSERT INTO `ss_area` VALUES ('451300', '来宾市', '450000');
INSERT INTO `ss_area` VALUES ('451301', '市辖区', '451300');
INSERT INTO `ss_area` VALUES ('451302', '兴宾区', '451300');
INSERT INTO `ss_area` VALUES ('451321', '忻城县', '451300');
INSERT INTO `ss_area` VALUES ('451322', '象州县', '451300');
INSERT INTO `ss_area` VALUES ('451323', '武宣县', '451300');
INSERT INTO `ss_area` VALUES ('451324', '金秀瑶族自治县', '451300');
INSERT INTO `ss_area` VALUES ('451381', '合山市', '451300');
INSERT INTO `ss_area` VALUES ('451400', '崇左市', '450000');
INSERT INTO `ss_area` VALUES ('451401', '市辖区', '451400');
INSERT INTO `ss_area` VALUES ('451402', '江洲区', '451400');
INSERT INTO `ss_area` VALUES ('451421', '扶绥县', '451400');
INSERT INTO `ss_area` VALUES ('451422', '宁明县', '451400');
INSERT INTO `ss_area` VALUES ('451423', '龙州县', '451400');
INSERT INTO `ss_area` VALUES ('451424', '大新县', '451400');
INSERT INTO `ss_area` VALUES ('451425', '天等县', '451400');
INSERT INTO `ss_area` VALUES ('451481', '凭祥市', '451400');
INSERT INTO `ss_area` VALUES ('460000', '海南省', '0');
INSERT INTO `ss_area` VALUES ('460100', '海口市', '460000');
INSERT INTO `ss_area` VALUES ('460101', '市辖区', '460100');
INSERT INTO `ss_area` VALUES ('460105', '秀英区', '460100');
INSERT INTO `ss_area` VALUES ('460106', '龙华区', '460100');
INSERT INTO `ss_area` VALUES ('460107', '琼山区', '460100');
INSERT INTO `ss_area` VALUES ('460108', '美兰区', '460100');
INSERT INTO `ss_area` VALUES ('460200', '三亚市', '460000');
INSERT INTO `ss_area` VALUES ('460201', '市辖区', '460200');
INSERT INTO `ss_area` VALUES ('469000', '省直辖县级行政单位', '460000');
INSERT INTO `ss_area` VALUES ('469001', '五指山市', '469000');
INSERT INTO `ss_area` VALUES ('469002', '琼海市', '469000');
INSERT INTO `ss_area` VALUES ('469003', '儋州市', '469000');
INSERT INTO `ss_area` VALUES ('469005', '文昌市', '469000');
INSERT INTO `ss_area` VALUES ('469006', '万宁市', '469000');
INSERT INTO `ss_area` VALUES ('469007', '东方市', '469000');
INSERT INTO `ss_area` VALUES ('469025', '定安县', '469000');
INSERT INTO `ss_area` VALUES ('469026', '屯昌县', '469000');
INSERT INTO `ss_area` VALUES ('469027', '澄迈县', '469000');
INSERT INTO `ss_area` VALUES ('469028', '临高县', '469000');
INSERT INTO `ss_area` VALUES ('469030', '白沙黎族自治县', '469000');
INSERT INTO `ss_area` VALUES ('469031', '昌江黎族自治县', '469000');
INSERT INTO `ss_area` VALUES ('469033', '乐东黎族自治县', '469000');
INSERT INTO `ss_area` VALUES ('469034', '陵水黎族自治县', '469000');
INSERT INTO `ss_area` VALUES ('469035', '保亭黎族苗族自治县', '469000');
INSERT INTO `ss_area` VALUES ('469036', '琼中黎族苗族自治县', '469000');
INSERT INTO `ss_area` VALUES ('469037', '西沙群岛', '469000');
INSERT INTO `ss_area` VALUES ('469038', '南沙群岛', '469000');
INSERT INTO `ss_area` VALUES ('469039', '中沙群岛的岛礁及其海域', '469000');
INSERT INTO `ss_area` VALUES ('500000', '重庆市', '0');
INSERT INTO `ss_area` VALUES ('500100', '市辖区', '500000');
INSERT INTO `ss_area` VALUES ('500101', '万州区', '500100');
INSERT INTO `ss_area` VALUES ('500102', '涪陵区', '500100');
INSERT INTO `ss_area` VALUES ('500103', '渝中区', '500100');
INSERT INTO `ss_area` VALUES ('500104', '大渡口区', '500100');
INSERT INTO `ss_area` VALUES ('500105', '江北区', '500100');
INSERT INTO `ss_area` VALUES ('500106', '沙坪坝区', '500100');
INSERT INTO `ss_area` VALUES ('500107', '九龙坡区', '500100');
INSERT INTO `ss_area` VALUES ('500108', '南岸区', '500100');
INSERT INTO `ss_area` VALUES ('500109', '北碚区', '500100');
INSERT INTO `ss_area` VALUES ('500110', '万盛区', '500100');
INSERT INTO `ss_area` VALUES ('500111', '双桥区', '500100');
INSERT INTO `ss_area` VALUES ('500112', '渝北区', '500100');
INSERT INTO `ss_area` VALUES ('500113', '巴南区', '500100');
INSERT INTO `ss_area` VALUES ('500114', '黔江区', '500100');
INSERT INTO `ss_area` VALUES ('500115', '长寿区', '500100');
INSERT INTO `ss_area` VALUES ('500200', '县', '500000');
INSERT INTO `ss_area` VALUES ('500222', '綦江县', '500200');
INSERT INTO `ss_area` VALUES ('500223', '潼南县', '500200');
INSERT INTO `ss_area` VALUES ('500224', '铜梁县', '500200');
INSERT INTO `ss_area` VALUES ('500225', '大足县', '500200');
INSERT INTO `ss_area` VALUES ('500226', '荣昌县', '500200');
INSERT INTO `ss_area` VALUES ('500227', '璧山县', '500200');
INSERT INTO `ss_area` VALUES ('500228', '梁平县', '500200');
INSERT INTO `ss_area` VALUES ('500229', '城口县', '500200');
INSERT INTO `ss_area` VALUES ('500230', '丰都县', '500200');
INSERT INTO `ss_area` VALUES ('500231', '垫江县', '500200');
INSERT INTO `ss_area` VALUES ('500232', '武隆县', '500200');
INSERT INTO `ss_area` VALUES ('500233', '忠　县', '500200');
INSERT INTO `ss_area` VALUES ('500234', '开　县', '500200');
INSERT INTO `ss_area` VALUES ('500235', '云阳县', '500200');
INSERT INTO `ss_area` VALUES ('500236', '奉节县', '500200');
INSERT INTO `ss_area` VALUES ('500237', '巫山县', '500200');
INSERT INTO `ss_area` VALUES ('500238', '巫溪县', '500200');
INSERT INTO `ss_area` VALUES ('500240', '石柱土家族自治县', '500200');
INSERT INTO `ss_area` VALUES ('500241', '秀山土家族苗族自治县', '500200');
INSERT INTO `ss_area` VALUES ('500242', '酉阳土家族苗族自治县', '500200');
INSERT INTO `ss_area` VALUES ('500243', '彭水苗族土家族自治县', '500200');
INSERT INTO `ss_area` VALUES ('500300', '市', '500000');
INSERT INTO `ss_area` VALUES ('500381', '江津市', '500300');
INSERT INTO `ss_area` VALUES ('500382', '合川市', '500300');
INSERT INTO `ss_area` VALUES ('500383', '永川市', '500300');
INSERT INTO `ss_area` VALUES ('500384', '南川市', '500300');
INSERT INTO `ss_area` VALUES ('510000', '四川省', '0');
INSERT INTO `ss_area` VALUES ('510100', '成都市', '510000');
INSERT INTO `ss_area` VALUES ('510101', '市辖区', '510100');
INSERT INTO `ss_area` VALUES ('510104', '锦江区', '510100');
INSERT INTO `ss_area` VALUES ('510105', '青羊区', '510100');
INSERT INTO `ss_area` VALUES ('510106', '金牛区', '510100');
INSERT INTO `ss_area` VALUES ('510107', '武侯区', '510100');
INSERT INTO `ss_area` VALUES ('510108', '成华区', '510100');
INSERT INTO `ss_area` VALUES ('510112', '龙泉驿区', '510100');
INSERT INTO `ss_area` VALUES ('510113', '青白江区', '510100');
INSERT INTO `ss_area` VALUES ('510114', '新都区', '510100');
INSERT INTO `ss_area` VALUES ('510115', '温江区', '510100');
INSERT INTO `ss_area` VALUES ('510121', '金堂县', '510100');
INSERT INTO `ss_area` VALUES ('510122', '双流县', '510100');
INSERT INTO `ss_area` VALUES ('510124', '郫　县', '510100');
INSERT INTO `ss_area` VALUES ('510129', '大邑县', '510100');
INSERT INTO `ss_area` VALUES ('510131', '蒲江县', '510100');
INSERT INTO `ss_area` VALUES ('510132', '新津县', '510100');
INSERT INTO `ss_area` VALUES ('510181', '都江堰市', '510100');
INSERT INTO `ss_area` VALUES ('510182', '彭州市', '510100');
INSERT INTO `ss_area` VALUES ('510183', '邛崃市', '510100');
INSERT INTO `ss_area` VALUES ('510184', '崇州市', '510100');
INSERT INTO `ss_area` VALUES ('510300', '自贡市', '510000');
INSERT INTO `ss_area` VALUES ('510301', '市辖区', '510300');
INSERT INTO `ss_area` VALUES ('510302', '自流井区', '510300');
INSERT INTO `ss_area` VALUES ('510303', '贡井区', '510300');
INSERT INTO `ss_area` VALUES ('510304', '大安区', '510300');
INSERT INTO `ss_area` VALUES ('510311', '沿滩区', '510300');
INSERT INTO `ss_area` VALUES ('510321', '荣　县', '510300');
INSERT INTO `ss_area` VALUES ('510322', '富顺县', '510300');
INSERT INTO `ss_area` VALUES ('510400', '攀枝花市', '510000');
INSERT INTO `ss_area` VALUES ('510401', '市辖区', '510400');
INSERT INTO `ss_area` VALUES ('510402', '东　区', '510400');
INSERT INTO `ss_area` VALUES ('510403', '西　区', '510400');
INSERT INTO `ss_area` VALUES ('510411', '仁和区', '510400');
INSERT INTO `ss_area` VALUES ('510421', '米易县', '510400');
INSERT INTO `ss_area` VALUES ('510422', '盐边县', '510400');
INSERT INTO `ss_area` VALUES ('510500', '泸州市', '510000');
INSERT INTO `ss_area` VALUES ('510501', '市辖区', '510500');
INSERT INTO `ss_area` VALUES ('510502', '江阳区', '510500');
INSERT INTO `ss_area` VALUES ('510503', '纳溪区', '510500');
INSERT INTO `ss_area` VALUES ('510504', '龙马潭区', '510500');
INSERT INTO `ss_area` VALUES ('510521', '泸　县', '510500');
INSERT INTO `ss_area` VALUES ('510522', '合江县', '510500');
INSERT INTO `ss_area` VALUES ('510524', '叙永县', '510500');
INSERT INTO `ss_area` VALUES ('510525', '古蔺县', '510500');
INSERT INTO `ss_area` VALUES ('510600', '德阳市', '510000');
INSERT INTO `ss_area` VALUES ('510601', '市辖区', '510600');
INSERT INTO `ss_area` VALUES ('510603', '旌阳区', '510600');
INSERT INTO `ss_area` VALUES ('510623', '中江县', '510600');
INSERT INTO `ss_area` VALUES ('510626', '罗江县', '510600');
INSERT INTO `ss_area` VALUES ('510681', '广汉市', '510600');
INSERT INTO `ss_area` VALUES ('510682', '什邡市', '510600');
INSERT INTO `ss_area` VALUES ('510683', '绵竹市', '510600');
INSERT INTO `ss_area` VALUES ('510700', '绵阳市', '510000');
INSERT INTO `ss_area` VALUES ('510701', '市辖区', '510700');
INSERT INTO `ss_area` VALUES ('510703', '涪城区', '510700');
INSERT INTO `ss_area` VALUES ('510704', '游仙区', '510700');
INSERT INTO `ss_area` VALUES ('510722', '三台县', '510700');
INSERT INTO `ss_area` VALUES ('510723', '盐亭县', '510700');
INSERT INTO `ss_area` VALUES ('510724', '安　县', '510700');
INSERT INTO `ss_area` VALUES ('510725', '梓潼县', '510700');
INSERT INTO `ss_area` VALUES ('510726', '北川羌族自治县', '510700');
INSERT INTO `ss_area` VALUES ('510727', '平武县', '510700');
INSERT INTO `ss_area` VALUES ('510781', '江油市', '510700');
INSERT INTO `ss_area` VALUES ('510800', '广元市', '510000');
INSERT INTO `ss_area` VALUES ('510801', '市辖区', '510800');
INSERT INTO `ss_area` VALUES ('510802', '市中区', '510800');
INSERT INTO `ss_area` VALUES ('510811', '元坝区', '510800');
INSERT INTO `ss_area` VALUES ('510812', '朝天区', '510800');
INSERT INTO `ss_area` VALUES ('510821', '旺苍县', '510800');
INSERT INTO `ss_area` VALUES ('510822', '青川县', '510800');
INSERT INTO `ss_area` VALUES ('510823', '剑阁县', '510800');
INSERT INTO `ss_area` VALUES ('510824', '苍溪县', '510800');
INSERT INTO `ss_area` VALUES ('510900', '遂宁市', '510000');
INSERT INTO `ss_area` VALUES ('510901', '市辖区', '510900');
INSERT INTO `ss_area` VALUES ('510903', '船山区', '510900');
INSERT INTO `ss_area` VALUES ('510904', '安居区', '510900');
INSERT INTO `ss_area` VALUES ('510921', '蓬溪县', '510900');
INSERT INTO `ss_area` VALUES ('510922', '射洪县', '510900');
INSERT INTO `ss_area` VALUES ('510923', '大英县', '510900');
INSERT INTO `ss_area` VALUES ('511000', '内江市', '510000');
INSERT INTO `ss_area` VALUES ('511001', '市辖区', '511000');
INSERT INTO `ss_area` VALUES ('511002', '市中区', '511000');
INSERT INTO `ss_area` VALUES ('511011', '东兴区', '511000');
INSERT INTO `ss_area` VALUES ('511024', '威远县', '511000');
INSERT INTO `ss_area` VALUES ('511025', '资中县', '511000');
INSERT INTO `ss_area` VALUES ('511028', '隆昌县', '511000');
INSERT INTO `ss_area` VALUES ('511100', '乐山市', '510000');
INSERT INTO `ss_area` VALUES ('511101', '市辖区', '511100');
INSERT INTO `ss_area` VALUES ('511102', '市中区', '511100');
INSERT INTO `ss_area` VALUES ('511111', '沙湾区', '511100');
INSERT INTO `ss_area` VALUES ('511112', '五通桥区', '511100');
INSERT INTO `ss_area` VALUES ('511113', '金口河区', '511100');
INSERT INTO `ss_area` VALUES ('511123', '犍为县', '511100');
INSERT INTO `ss_area` VALUES ('511124', '井研县', '511100');
INSERT INTO `ss_area` VALUES ('511126', '夹江县', '511100');
INSERT INTO `ss_area` VALUES ('511129', '沐川县', '511100');
INSERT INTO `ss_area` VALUES ('511132', '峨边彝族自治县', '511100');
INSERT INTO `ss_area` VALUES ('511133', '马边彝族自治县', '511100');
INSERT INTO `ss_area` VALUES ('511181', '峨眉山市', '511100');
INSERT INTO `ss_area` VALUES ('511300', '南充市', '510000');
INSERT INTO `ss_area` VALUES ('511301', '市辖区', '511300');
INSERT INTO `ss_area` VALUES ('511302', '顺庆区', '511300');
INSERT INTO `ss_area` VALUES ('511303', '高坪区', '511300');
INSERT INTO `ss_area` VALUES ('511304', '嘉陵区', '511300');
INSERT INTO `ss_area` VALUES ('511321', '南部县', '511300');
INSERT INTO `ss_area` VALUES ('511322', '营山县', '511300');
INSERT INTO `ss_area` VALUES ('511323', '蓬安县', '511300');
INSERT INTO `ss_area` VALUES ('511324', '仪陇县', '511300');
INSERT INTO `ss_area` VALUES ('511325', '西充县', '511300');
INSERT INTO `ss_area` VALUES ('511381', '阆中市', '511300');
INSERT INTO `ss_area` VALUES ('511400', '眉山市', '510000');
INSERT INTO `ss_area` VALUES ('511401', '市辖区', '511400');
INSERT INTO `ss_area` VALUES ('511402', '东坡区', '511400');
INSERT INTO `ss_area` VALUES ('511421', '仁寿县', '511400');
INSERT INTO `ss_area` VALUES ('511422', '彭山县', '511400');
INSERT INTO `ss_area` VALUES ('511423', '洪雅县', '511400');
INSERT INTO `ss_area` VALUES ('511424', '丹棱县', '511400');
INSERT INTO `ss_area` VALUES ('511425', '青神县', '511400');
INSERT INTO `ss_area` VALUES ('511500', '宜宾市', '510000');
INSERT INTO `ss_area` VALUES ('511501', '市辖区', '511500');
INSERT INTO `ss_area` VALUES ('511502', '翠屏区', '511500');
INSERT INTO `ss_area` VALUES ('511521', '宜宾县', '511500');
INSERT INTO `ss_area` VALUES ('511522', '南溪县', '511500');
INSERT INTO `ss_area` VALUES ('511523', '江安县', '511500');
INSERT INTO `ss_area` VALUES ('511524', '长宁县', '511500');
INSERT INTO `ss_area` VALUES ('511525', '高　县', '511500');
INSERT INTO `ss_area` VALUES ('511526', '珙　县', '511500');
INSERT INTO `ss_area` VALUES ('511527', '筠连县', '511500');
INSERT INTO `ss_area` VALUES ('511528', '兴文县', '511500');
INSERT INTO `ss_area` VALUES ('511529', '屏山县', '511500');
INSERT INTO `ss_area` VALUES ('511600', '广安市', '510000');
INSERT INTO `ss_area` VALUES ('511601', '市辖区', '511600');
INSERT INTO `ss_area` VALUES ('511602', '广安区', '511600');
INSERT INTO `ss_area` VALUES ('511621', '岳池县', '511600');
INSERT INTO `ss_area` VALUES ('511622', '武胜县', '511600');
INSERT INTO `ss_area` VALUES ('511623', '邻水县', '511600');
INSERT INTO `ss_area` VALUES ('511681', '华莹市', '511600');
INSERT INTO `ss_area` VALUES ('511700', '达州市', '510000');
INSERT INTO `ss_area` VALUES ('511701', '市辖区', '511700');
INSERT INTO `ss_area` VALUES ('511702', '通川区', '511700');
INSERT INTO `ss_area` VALUES ('511721', '达　县', '511700');
INSERT INTO `ss_area` VALUES ('511722', '宣汉县', '511700');
INSERT INTO `ss_area` VALUES ('511723', '开江县', '511700');
INSERT INTO `ss_area` VALUES ('511724', '大竹县', '511700');
INSERT INTO `ss_area` VALUES ('511725', '渠　县', '511700');
INSERT INTO `ss_area` VALUES ('511781', '万源市', '511700');
INSERT INTO `ss_area` VALUES ('511800', '雅安市', '510000');
INSERT INTO `ss_area` VALUES ('511801', '市辖区', '511800');
INSERT INTO `ss_area` VALUES ('511802', '雨城区', '511800');
INSERT INTO `ss_area` VALUES ('511821', '名山县', '511800');
INSERT INTO `ss_area` VALUES ('511822', '荥经县', '511800');
INSERT INTO `ss_area` VALUES ('511823', '汉源县', '511800');
INSERT INTO `ss_area` VALUES ('511824', '石棉县', '511800');
INSERT INTO `ss_area` VALUES ('511825', '天全县', '511800');
INSERT INTO `ss_area` VALUES ('511826', '芦山县', '511800');
INSERT INTO `ss_area` VALUES ('511827', '宝兴县', '511800');
INSERT INTO `ss_area` VALUES ('511900', '巴中市', '510000');
INSERT INTO `ss_area` VALUES ('511901', '市辖区', '511900');
INSERT INTO `ss_area` VALUES ('511902', '巴州区', '511900');
INSERT INTO `ss_area` VALUES ('511921', '通江县', '511900');
INSERT INTO `ss_area` VALUES ('511922', '南江县', '511900');
INSERT INTO `ss_area` VALUES ('511923', '平昌县', '511900');
INSERT INTO `ss_area` VALUES ('512000', '资阳市', '510000');
INSERT INTO `ss_area` VALUES ('512001', '市辖区', '512000');
INSERT INTO `ss_area` VALUES ('512002', '雁江区', '512000');
INSERT INTO `ss_area` VALUES ('512021', '安岳县', '512000');
INSERT INTO `ss_area` VALUES ('512022', '乐至县', '512000');
INSERT INTO `ss_area` VALUES ('512081', '简阳市', '512000');
INSERT INTO `ss_area` VALUES ('513200', '阿坝藏族羌族自治州', '510000');
INSERT INTO `ss_area` VALUES ('513221', '汶川县', '513200');
INSERT INTO `ss_area` VALUES ('513222', '理　县', '513200');
INSERT INTO `ss_area` VALUES ('513223', '茂　县', '513200');
INSERT INTO `ss_area` VALUES ('513224', '松潘县', '513200');
INSERT INTO `ss_area` VALUES ('513225', '九寨沟县', '513200');
INSERT INTO `ss_area` VALUES ('513226', '金川县', '513200');
INSERT INTO `ss_area` VALUES ('513227', '小金县', '513200');
INSERT INTO `ss_area` VALUES ('513228', '黑水县', '513200');
INSERT INTO `ss_area` VALUES ('513229', '马尔康县', '513200');
INSERT INTO `ss_area` VALUES ('513230', '壤塘县', '513200');
INSERT INTO `ss_area` VALUES ('513231', '阿坝县', '513200');
INSERT INTO `ss_area` VALUES ('513232', '若尔盖县', '513200');
INSERT INTO `ss_area` VALUES ('513233', '红原县', '513200');
INSERT INTO `ss_area` VALUES ('513300', '甘孜藏族自治州', '510000');
INSERT INTO `ss_area` VALUES ('513321', '康定县', '513300');
INSERT INTO `ss_area` VALUES ('513322', '泸定县', '513300');
INSERT INTO `ss_area` VALUES ('513323', '丹巴县', '513300');
INSERT INTO `ss_area` VALUES ('513324', '九龙县', '513300');
INSERT INTO `ss_area` VALUES ('513325', '雅江县', '513300');
INSERT INTO `ss_area` VALUES ('513326', '道孚县', '513300');
INSERT INTO `ss_area` VALUES ('513327', '炉霍县', '513300');
INSERT INTO `ss_area` VALUES ('513328', '甘孜县', '513300');
INSERT INTO `ss_area` VALUES ('513329', '新龙县', '513300');
INSERT INTO `ss_area` VALUES ('513330', '德格县', '513300');
INSERT INTO `ss_area` VALUES ('513331', '白玉县', '513300');
INSERT INTO `ss_area` VALUES ('513332', '石渠县', '513300');
INSERT INTO `ss_area` VALUES ('513333', '色达县', '513300');
INSERT INTO `ss_area` VALUES ('513334', '理塘县', '513300');
INSERT INTO `ss_area` VALUES ('513335', '巴塘县', '513300');
INSERT INTO `ss_area` VALUES ('513336', '乡城县', '513300');
INSERT INTO `ss_area` VALUES ('513337', '稻城县', '513300');
INSERT INTO `ss_area` VALUES ('513338', '得荣县', '513300');
INSERT INTO `ss_area` VALUES ('513400', '凉山彝族自治州', '510000');
INSERT INTO `ss_area` VALUES ('513401', '西昌市', '513400');
INSERT INTO `ss_area` VALUES ('513422', '木里藏族自治县', '513400');
INSERT INTO `ss_area` VALUES ('513423', '盐源县', '513400');
INSERT INTO `ss_area` VALUES ('513424', '德昌县', '513400');
INSERT INTO `ss_area` VALUES ('513425', '会理县', '513400');
INSERT INTO `ss_area` VALUES ('513426', '会东县', '513400');
INSERT INTO `ss_area` VALUES ('513427', '宁南县', '513400');
INSERT INTO `ss_area` VALUES ('513428', '普格县', '513400');
INSERT INTO `ss_area` VALUES ('513429', '布拖县', '513400');
INSERT INTO `ss_area` VALUES ('513430', '金阳县', '513400');
INSERT INTO `ss_area` VALUES ('513431', '昭觉县', '513400');
INSERT INTO `ss_area` VALUES ('513432', '喜德县', '513400');
INSERT INTO `ss_area` VALUES ('513433', '冕宁县', '513400');
INSERT INTO `ss_area` VALUES ('513434', '越西县', '513400');
INSERT INTO `ss_area` VALUES ('513435', '甘洛县', '513400');
INSERT INTO `ss_area` VALUES ('513436', '美姑县', '513400');
INSERT INTO `ss_area` VALUES ('513437', '雷波县', '513400');
INSERT INTO `ss_area` VALUES ('520000', '贵州省', '0');
INSERT INTO `ss_area` VALUES ('520100', '贵阳市', '520000');
INSERT INTO `ss_area` VALUES ('520101', '市辖区', '520100');
INSERT INTO `ss_area` VALUES ('520102', '南明区', '520100');
INSERT INTO `ss_area` VALUES ('520103', '云岩区', '520100');
INSERT INTO `ss_area` VALUES ('520111', '花溪区', '520100');
INSERT INTO `ss_area` VALUES ('520112', '乌当区', '520100');
INSERT INTO `ss_area` VALUES ('520113', '白云区', '520100');
INSERT INTO `ss_area` VALUES ('520114', '小河区', '520100');
INSERT INTO `ss_area` VALUES ('520121', '开阳县', '520100');
INSERT INTO `ss_area` VALUES ('520122', '息烽县', '520100');
INSERT INTO `ss_area` VALUES ('520123', '修文县', '520100');
INSERT INTO `ss_area` VALUES ('520181', '清镇市', '520100');
INSERT INTO `ss_area` VALUES ('520200', '六盘水市', '520000');
INSERT INTO `ss_area` VALUES ('520201', '钟山区', '520200');
INSERT INTO `ss_area` VALUES ('520203', '六枝特区', '520200');
INSERT INTO `ss_area` VALUES ('520221', '水城县', '520200');
INSERT INTO `ss_area` VALUES ('520222', '盘　县', '520200');
INSERT INTO `ss_area` VALUES ('520300', '遵义市', '520000');
INSERT INTO `ss_area` VALUES ('520301', '市辖区', '520300');
INSERT INTO `ss_area` VALUES ('520302', '红花岗区', '520300');
INSERT INTO `ss_area` VALUES ('520303', '汇川区', '520300');
INSERT INTO `ss_area` VALUES ('520321', '遵义县', '520300');
INSERT INTO `ss_area` VALUES ('520322', '桐梓县', '520300');
INSERT INTO `ss_area` VALUES ('520323', '绥阳县', '520300');
INSERT INTO `ss_area` VALUES ('520324', '正安县', '520300');
INSERT INTO `ss_area` VALUES ('520325', '道真仡佬族苗族自治县', '520300');
INSERT INTO `ss_area` VALUES ('520326', '务川仡佬族苗族自治县', '520300');
INSERT INTO `ss_area` VALUES ('520327', '凤冈县', '520300');
INSERT INTO `ss_area` VALUES ('520328', '湄潭县', '520300');
INSERT INTO `ss_area` VALUES ('520329', '余庆县', '520300');
INSERT INTO `ss_area` VALUES ('520330', '习水县', '520300');
INSERT INTO `ss_area` VALUES ('520381', '赤水市', '520300');
INSERT INTO `ss_area` VALUES ('520382', '仁怀市', '520300');
INSERT INTO `ss_area` VALUES ('520400', '安顺市', '520000');
INSERT INTO `ss_area` VALUES ('520401', '市辖区', '520400');
INSERT INTO `ss_area` VALUES ('520402', '西秀区', '520400');
INSERT INTO `ss_area` VALUES ('520421', '平坝县', '520400');
INSERT INTO `ss_area` VALUES ('520422', '普定县', '520400');
INSERT INTO `ss_area` VALUES ('520423', '镇宁布依族苗族自治县', '520400');
INSERT INTO `ss_area` VALUES ('520424', '关岭布依族苗族自治县', '520400');
INSERT INTO `ss_area` VALUES ('520425', '紫云苗族布依族自治县', '520400');
INSERT INTO `ss_area` VALUES ('522200', '铜仁地区', '520000');
INSERT INTO `ss_area` VALUES ('522201', '铜仁市', '522200');
INSERT INTO `ss_area` VALUES ('522222', '江口县', '522200');
INSERT INTO `ss_area` VALUES ('522223', '玉屏侗族自治县', '522200');
INSERT INTO `ss_area` VALUES ('522224', '石阡县', '522200');
INSERT INTO `ss_area` VALUES ('522225', '思南县', '522200');
INSERT INTO `ss_area` VALUES ('522226', '印江土家族苗族自治县', '522200');
INSERT INTO `ss_area` VALUES ('522227', '德江县', '522200');
INSERT INTO `ss_area` VALUES ('522228', '沿河土家族自治县', '522200');
INSERT INTO `ss_area` VALUES ('522229', '松桃苗族自治县', '522200');
INSERT INTO `ss_area` VALUES ('522230', '万山特区', '522200');
INSERT INTO `ss_area` VALUES ('522300', '黔西南布依族苗族自治州', '520000');
INSERT INTO `ss_area` VALUES ('522301', '兴义市', '522300');
INSERT INTO `ss_area` VALUES ('522322', '兴仁县', '522300');
INSERT INTO `ss_area` VALUES ('522323', '普安县', '522300');
INSERT INTO `ss_area` VALUES ('522324', '晴隆县', '522300');
INSERT INTO `ss_area` VALUES ('522325', '贞丰县', '522300');
INSERT INTO `ss_area` VALUES ('522326', '望谟县', '522300');
INSERT INTO `ss_area` VALUES ('522327', '册亨县', '522300');
INSERT INTO `ss_area` VALUES ('522328', '安龙县', '522300');
INSERT INTO `ss_area` VALUES ('522400', '毕节地区', '520000');
INSERT INTO `ss_area` VALUES ('522401', '毕节市', '522400');
INSERT INTO `ss_area` VALUES ('522422', '大方县', '522400');
INSERT INTO `ss_area` VALUES ('522423', '黔西县', '522400');
INSERT INTO `ss_area` VALUES ('522424', '金沙县', '522400');
INSERT INTO `ss_area` VALUES ('522425', '织金县', '522400');
INSERT INTO `ss_area` VALUES ('522426', '纳雍县', '522400');
INSERT INTO `ss_area` VALUES ('522427', '威宁彝族回族苗族自治县', '522400');
INSERT INTO `ss_area` VALUES ('522428', '赫章县', '522400');
INSERT INTO `ss_area` VALUES ('522600', '黔东南苗族侗族自治州', '520000');
INSERT INTO `ss_area` VALUES ('522601', '凯里市', '522600');
INSERT INTO `ss_area` VALUES ('522622', '黄平县', '522600');
INSERT INTO `ss_area` VALUES ('522623', '施秉县', '522600');
INSERT INTO `ss_area` VALUES ('522624', '三穗县', '522600');
INSERT INTO `ss_area` VALUES ('522625', '镇远县', '522600');
INSERT INTO `ss_area` VALUES ('522626', '岑巩县', '522600');
INSERT INTO `ss_area` VALUES ('522627', '天柱县', '522600');
INSERT INTO `ss_area` VALUES ('522628', '锦屏县', '522600');
INSERT INTO `ss_area` VALUES ('522629', '剑河县', '522600');
INSERT INTO `ss_area` VALUES ('522630', '台江县', '522600');
INSERT INTO `ss_area` VALUES ('522631', '黎平县', '522600');
INSERT INTO `ss_area` VALUES ('522632', '榕江县', '522600');
INSERT INTO `ss_area` VALUES ('522633', '从江县', '522600');
INSERT INTO `ss_area` VALUES ('522634', '雷山县', '522600');
INSERT INTO `ss_area` VALUES ('522635', '麻江县', '522600');
INSERT INTO `ss_area` VALUES ('522636', '丹寨县', '522600');
INSERT INTO `ss_area` VALUES ('522700', '黔南布依族苗族自治州', '520000');
INSERT INTO `ss_area` VALUES ('522701', '都匀市', '522700');
INSERT INTO `ss_area` VALUES ('522702', '福泉市', '522700');
INSERT INTO `ss_area` VALUES ('522722', '荔波县', '522700');
INSERT INTO `ss_area` VALUES ('522723', '贵定县', '522700');
INSERT INTO `ss_area` VALUES ('522725', '瓮安县', '522700');
INSERT INTO `ss_area` VALUES ('522726', '独山县', '522700');
INSERT INTO `ss_area` VALUES ('522727', '平塘县', '522700');
INSERT INTO `ss_area` VALUES ('522728', '罗甸县', '522700');
INSERT INTO `ss_area` VALUES ('522729', '长顺县', '522700');
INSERT INTO `ss_area` VALUES ('522730', '龙里县', '522700');
INSERT INTO `ss_area` VALUES ('522731', '惠水县', '522700');
INSERT INTO `ss_area` VALUES ('522732', '三都水族自治县', '522700');
INSERT INTO `ss_area` VALUES ('530000', '云南省', '0');
INSERT INTO `ss_area` VALUES ('530100', '昆明市', '530000');
INSERT INTO `ss_area` VALUES ('530101', '市辖区', '530100');
INSERT INTO `ss_area` VALUES ('530102', '五华区', '530100');
INSERT INTO `ss_area` VALUES ('530103', '盘龙区', '530100');
INSERT INTO `ss_area` VALUES ('530111', '官渡区', '530100');
INSERT INTO `ss_area` VALUES ('530112', '西山区', '530100');
INSERT INTO `ss_area` VALUES ('530113', '东川区', '530100');
INSERT INTO `ss_area` VALUES ('530121', '呈贡县', '530100');
INSERT INTO `ss_area` VALUES ('530122', '晋宁县', '530100');
INSERT INTO `ss_area` VALUES ('530124', '富民县', '530100');
INSERT INTO `ss_area` VALUES ('530125', '宜良县', '530100');
INSERT INTO `ss_area` VALUES ('530126', '石林彝族自治县', '530100');
INSERT INTO `ss_area` VALUES ('530127', '嵩明县', '530100');
INSERT INTO `ss_area` VALUES ('530128', '禄劝彝族苗族自治县', '530100');
INSERT INTO `ss_area` VALUES ('530129', '寻甸回族彝族自治县', '530100');
INSERT INTO `ss_area` VALUES ('530181', '安宁市', '530100');
INSERT INTO `ss_area` VALUES ('530300', '曲靖市', '530000');
INSERT INTO `ss_area` VALUES ('530301', '市辖区', '530300');
INSERT INTO `ss_area` VALUES ('530302', '麒麟区', '530300');
INSERT INTO `ss_area` VALUES ('530321', '马龙县', '530300');
INSERT INTO `ss_area` VALUES ('530322', '陆良县', '530300');
INSERT INTO `ss_area` VALUES ('530323', '师宗县', '530300');
INSERT INTO `ss_area` VALUES ('530324', '罗平县', '530300');
INSERT INTO `ss_area` VALUES ('530325', '富源县', '530300');
INSERT INTO `ss_area` VALUES ('530326', '会泽县', '530300');
INSERT INTO `ss_area` VALUES ('530328', '沾益县', '530300');
INSERT INTO `ss_area` VALUES ('530381', '宣威市', '530300');
INSERT INTO `ss_area` VALUES ('530400', '玉溪市', '530000');
INSERT INTO `ss_area` VALUES ('530401', '市辖区', '530400');
INSERT INTO `ss_area` VALUES ('530402', '红塔区', '530400');
INSERT INTO `ss_area` VALUES ('530421', '江川县', '530400');
INSERT INTO `ss_area` VALUES ('530422', '澄江县', '530400');
INSERT INTO `ss_area` VALUES ('530423', '通海县', '530400');
INSERT INTO `ss_area` VALUES ('530424', '华宁县', '530400');
INSERT INTO `ss_area` VALUES ('530425', '易门县', '530400');
INSERT INTO `ss_area` VALUES ('530426', '峨山彝族自治县', '530400');
INSERT INTO `ss_area` VALUES ('530427', '新平彝族傣族自治县', '530400');
INSERT INTO `ss_area` VALUES ('530428', '元江哈尼族彝族傣族自治县', '530400');
INSERT INTO `ss_area` VALUES ('530500', '保山市', '530000');
INSERT INTO `ss_area` VALUES ('530501', '市辖区', '530500');
INSERT INTO `ss_area` VALUES ('530502', '隆阳区', '530500');
INSERT INTO `ss_area` VALUES ('530521', '施甸县', '530500');
INSERT INTO `ss_area` VALUES ('530522', '腾冲县', '530500');
INSERT INTO `ss_area` VALUES ('530523', '龙陵县', '530500');
INSERT INTO `ss_area` VALUES ('530524', '昌宁县', '530500');
INSERT INTO `ss_area` VALUES ('530600', '昭通市', '530000');
INSERT INTO `ss_area` VALUES ('530601', '市辖区', '530600');
INSERT INTO `ss_area` VALUES ('530602', '昭阳区', '530600');
INSERT INTO `ss_area` VALUES ('530621', '鲁甸县', '530600');
INSERT INTO `ss_area` VALUES ('530622', '巧家县', '530600');
INSERT INTO `ss_area` VALUES ('530623', '盐津县', '530600');
INSERT INTO `ss_area` VALUES ('530624', '大关县', '530600');
INSERT INTO `ss_area` VALUES ('530625', '永善县', '530600');
INSERT INTO `ss_area` VALUES ('530626', '绥江县', '530600');
INSERT INTO `ss_area` VALUES ('530627', '镇雄县', '530600');
INSERT INTO `ss_area` VALUES ('530628', '彝良县', '530600');
INSERT INTO `ss_area` VALUES ('530629', '威信县', '530600');
INSERT INTO `ss_area` VALUES ('530630', '水富县', '530600');
INSERT INTO `ss_area` VALUES ('530700', '丽江市', '530000');
INSERT INTO `ss_area` VALUES ('530701', '市辖区', '530700');
INSERT INTO `ss_area` VALUES ('530702', '古城区', '530700');
INSERT INTO `ss_area` VALUES ('530721', '玉龙纳西族自治县', '530700');
INSERT INTO `ss_area` VALUES ('530722', '永胜县', '530700');
INSERT INTO `ss_area` VALUES ('530723', '华坪县', '530700');
INSERT INTO `ss_area` VALUES ('530724', '宁蒗彝族自治县', '530700');
INSERT INTO `ss_area` VALUES ('530800', '思茅市', '530000');
INSERT INTO `ss_area` VALUES ('530801', '市辖区', '530800');
INSERT INTO `ss_area` VALUES ('530802', '翠云区', '530800');
INSERT INTO `ss_area` VALUES ('530821', '普洱哈尼族彝族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530822', '墨江哈尼族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530823', '景东彝族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530824', '景谷傣族彝族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530825', '镇沅彝族哈尼族拉祜族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530826', '江城哈尼族彝族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530827', '孟连傣族拉祜族佤族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530828', '澜沧拉祜族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530829', '西盟佤族自治县', '530800');
INSERT INTO `ss_area` VALUES ('530900', '临沧市', '530000');
INSERT INTO `ss_area` VALUES ('530901', '市辖区', '530900');
INSERT INTO `ss_area` VALUES ('530902', '临翔区', '530900');
INSERT INTO `ss_area` VALUES ('530921', '凤庆县', '530900');
INSERT INTO `ss_area` VALUES ('530922', '云　县', '530900');
INSERT INTO `ss_area` VALUES ('530923', '永德县', '530900');
INSERT INTO `ss_area` VALUES ('530924', '镇康县', '530900');
INSERT INTO `ss_area` VALUES ('530925', '双江拉祜族佤族布朗族傣族自治县', '530900');
INSERT INTO `ss_area` VALUES ('530926', '耿马傣族佤族自治县', '530900');
INSERT INTO `ss_area` VALUES ('530927', '沧源佤族自治县', '530900');
INSERT INTO `ss_area` VALUES ('532300', '楚雄彝族自治州', '530000');
INSERT INTO `ss_area` VALUES ('532301', '楚雄市', '532300');
INSERT INTO `ss_area` VALUES ('532322', '双柏县', '532300');
INSERT INTO `ss_area` VALUES ('532323', '牟定县', '532300');
INSERT INTO `ss_area` VALUES ('532324', '南华县', '532300');
INSERT INTO `ss_area` VALUES ('532325', '姚安县', '532300');
INSERT INTO `ss_area` VALUES ('532326', '大姚县', '532300');
INSERT INTO `ss_area` VALUES ('532327', '永仁县', '532300');
INSERT INTO `ss_area` VALUES ('532328', '元谋县', '532300');
INSERT INTO `ss_area` VALUES ('532329', '武定县', '532300');
INSERT INTO `ss_area` VALUES ('532331', '禄丰县', '532300');
INSERT INTO `ss_area` VALUES ('532500', '红河哈尼族彝族自治州', '530000');
INSERT INTO `ss_area` VALUES ('532501', '个旧市', '532500');
INSERT INTO `ss_area` VALUES ('532502', '开远市', '532500');
INSERT INTO `ss_area` VALUES ('532522', '蒙自县', '532500');
INSERT INTO `ss_area` VALUES ('532523', '屏边苗族自治县', '532500');
INSERT INTO `ss_area` VALUES ('532524', '建水县', '532500');
INSERT INTO `ss_area` VALUES ('532525', '石屏县', '532500');
INSERT INTO `ss_area` VALUES ('532526', '弥勒县', '532500');
INSERT INTO `ss_area` VALUES ('532527', '泸西县', '532500');
INSERT INTO `ss_area` VALUES ('532528', '元阳县', '532500');
INSERT INTO `ss_area` VALUES ('532529', '红河县', '532500');
INSERT INTO `ss_area` VALUES ('532530', '金平苗族瑶族傣族自治县', '532500');
INSERT INTO `ss_area` VALUES ('532531', '绿春县', '532500');
INSERT INTO `ss_area` VALUES ('532532', '河口瑶族自治县', '532500');
INSERT INTO `ss_area` VALUES ('532600', '文山壮族苗族自治州', '530000');
INSERT INTO `ss_area` VALUES ('532621', '文山县', '532600');
INSERT INTO `ss_area` VALUES ('532622', '砚山县', '532600');
INSERT INTO `ss_area` VALUES ('532623', '西畴县', '532600');
INSERT INTO `ss_area` VALUES ('532624', '麻栗坡县', '532600');
INSERT INTO `ss_area` VALUES ('532625', '马关县', '532600');
INSERT INTO `ss_area` VALUES ('532626', '丘北县', '532600');
INSERT INTO `ss_area` VALUES ('532627', '广南县', '532600');
INSERT INTO `ss_area` VALUES ('532628', '富宁县', '532600');
INSERT INTO `ss_area` VALUES ('532800', '西双版纳傣族自治州', '530000');
INSERT INTO `ss_area` VALUES ('532801', '景洪市', '532800');
INSERT INTO `ss_area` VALUES ('532822', '勐海县', '532800');
INSERT INTO `ss_area` VALUES ('532823', '勐腊县', '532800');
INSERT INTO `ss_area` VALUES ('532900', '大理白族自治州', '530000');
INSERT INTO `ss_area` VALUES ('532901', '大理市', '532900');
INSERT INTO `ss_area` VALUES ('532922', '漾濞彝族自治县', '532900');
INSERT INTO `ss_area` VALUES ('532923', '祥云县', '532900');
INSERT INTO `ss_area` VALUES ('532924', '宾川县', '532900');
INSERT INTO `ss_area` VALUES ('532925', '弥渡县', '532900');
INSERT INTO `ss_area` VALUES ('532926', '南涧彝族自治县', '532900');
INSERT INTO `ss_area` VALUES ('532927', '巍山彝族回族自治县', '532900');
INSERT INTO `ss_area` VALUES ('532928', '永平县', '532900');
INSERT INTO `ss_area` VALUES ('532929', '云龙县', '532900');
INSERT INTO `ss_area` VALUES ('532930', '洱源县', '532900');
INSERT INTO `ss_area` VALUES ('532931', '剑川县', '532900');
INSERT INTO `ss_area` VALUES ('532932', '鹤庆县', '532900');
INSERT INTO `ss_area` VALUES ('533100', '德宏傣族景颇族自治州', '530000');
INSERT INTO `ss_area` VALUES ('533102', '瑞丽市', '533100');
INSERT INTO `ss_area` VALUES ('533103', '潞西市', '533100');
INSERT INTO `ss_area` VALUES ('533122', '梁河县', '533100');
INSERT INTO `ss_area` VALUES ('533123', '盈江县', '533100');
INSERT INTO `ss_area` VALUES ('533124', '陇川县', '533100');
INSERT INTO `ss_area` VALUES ('533300', '怒江傈僳族自治州', '530000');
INSERT INTO `ss_area` VALUES ('533321', '泸水县', '533300');
INSERT INTO `ss_area` VALUES ('533323', '福贡县', '533300');
INSERT INTO `ss_area` VALUES ('533324', '贡山独龙族怒族自治县', '533300');
INSERT INTO `ss_area` VALUES ('533325', '兰坪白族普米族自治县', '533300');
INSERT INTO `ss_area` VALUES ('533400', '迪庆藏族自治州', '530000');
INSERT INTO `ss_area` VALUES ('533421', '香格里拉县', '533400');
INSERT INTO `ss_area` VALUES ('533422', '德钦县', '533400');
INSERT INTO `ss_area` VALUES ('533423', '维西傈僳族自治县', '533400');
INSERT INTO `ss_area` VALUES ('540000', '西藏自治区', '0');
INSERT INTO `ss_area` VALUES ('540100', '拉萨市', '540000');
INSERT INTO `ss_area` VALUES ('540101', '市辖区', '540100');
INSERT INTO `ss_area` VALUES ('540102', '城关区', '540100');
INSERT INTO `ss_area` VALUES ('540121', '林周县', '540100');
INSERT INTO `ss_area` VALUES ('540122', '当雄县', '540100');
INSERT INTO `ss_area` VALUES ('540123', '尼木县', '540100');
INSERT INTO `ss_area` VALUES ('540124', '曲水县', '540100');
INSERT INTO `ss_area` VALUES ('540125', '堆龙德庆县', '540100');
INSERT INTO `ss_area` VALUES ('540126', '达孜县', '540100');
INSERT INTO `ss_area` VALUES ('540127', '墨竹工卡县', '540100');
INSERT INTO `ss_area` VALUES ('542100', '昌都地区', '540000');
INSERT INTO `ss_area` VALUES ('542121', '昌都县', '542100');
INSERT INTO `ss_area` VALUES ('542122', '江达县', '542100');
INSERT INTO `ss_area` VALUES ('542123', '贡觉县', '542100');
INSERT INTO `ss_area` VALUES ('542124', '类乌齐县', '542100');
INSERT INTO `ss_area` VALUES ('542125', '丁青县', '542100');
INSERT INTO `ss_area` VALUES ('542126', '察雅县', '542100');
INSERT INTO `ss_area` VALUES ('542127', '八宿县', '542100');
INSERT INTO `ss_area` VALUES ('542128', '左贡县', '542100');
INSERT INTO `ss_area` VALUES ('542129', '芒康县', '542100');
INSERT INTO `ss_area` VALUES ('542132', '洛隆县', '542100');
INSERT INTO `ss_area` VALUES ('542133', '边坝县', '542100');
INSERT INTO `ss_area` VALUES ('542200', '山南地区', '540000');
INSERT INTO `ss_area` VALUES ('542221', '乃东县', '542200');
INSERT INTO `ss_area` VALUES ('542222', '扎囊县', '542200');
INSERT INTO `ss_area` VALUES ('542223', '贡嘎县', '542200');
INSERT INTO `ss_area` VALUES ('542224', '桑日县', '542200');
INSERT INTO `ss_area` VALUES ('542225', '琼结县', '542200');
INSERT INTO `ss_area` VALUES ('542226', '曲松县', '542200');
INSERT INTO `ss_area` VALUES ('542227', '措美县', '542200');
INSERT INTO `ss_area` VALUES ('542228', '洛扎县', '542200');
INSERT INTO `ss_area` VALUES ('542229', '加查县', '542200');
INSERT INTO `ss_area` VALUES ('542231', '隆子县', '542200');
INSERT INTO `ss_area` VALUES ('542232', '错那县', '542200');
INSERT INTO `ss_area` VALUES ('542233', '浪卡子县', '542200');
INSERT INTO `ss_area` VALUES ('542300', '日喀则地区', '540000');
INSERT INTO `ss_area` VALUES ('542301', '日喀则市', '542300');
INSERT INTO `ss_area` VALUES ('542322', '南木林县', '542300');
INSERT INTO `ss_area` VALUES ('542323', '江孜县', '542300');
INSERT INTO `ss_area` VALUES ('542324', '定日县', '542300');
INSERT INTO `ss_area` VALUES ('542325', '萨迦县', '542300');
INSERT INTO `ss_area` VALUES ('542326', '拉孜县', '542300');
INSERT INTO `ss_area` VALUES ('542327', '昂仁县', '542300');
INSERT INTO `ss_area` VALUES ('542328', '谢通门县', '542300');
INSERT INTO `ss_area` VALUES ('542329', '白朗县', '542300');
INSERT INTO `ss_area` VALUES ('542330', '仁布县', '542300');
INSERT INTO `ss_area` VALUES ('542331', '康马县', '542300');
INSERT INTO `ss_area` VALUES ('542332', '定结县', '542300');
INSERT INTO `ss_area` VALUES ('542333', '仲巴县', '542300');
INSERT INTO `ss_area` VALUES ('542334', '亚东县', '542300');
INSERT INTO `ss_area` VALUES ('542335', '吉隆县', '542300');
INSERT INTO `ss_area` VALUES ('542336', '聂拉木县', '542300');
INSERT INTO `ss_area` VALUES ('542337', '萨嘎县', '542300');
INSERT INTO `ss_area` VALUES ('542338', '岗巴县', '542300');
INSERT INTO `ss_area` VALUES ('542400', '那曲地区', '540000');
INSERT INTO `ss_area` VALUES ('542421', '那曲县', '542400');
INSERT INTO `ss_area` VALUES ('542422', '嘉黎县', '542400');
INSERT INTO `ss_area` VALUES ('542423', '比如县', '542400');
INSERT INTO `ss_area` VALUES ('542424', '聂荣县', '542400');
INSERT INTO `ss_area` VALUES ('542425', '安多县', '542400');
INSERT INTO `ss_area` VALUES ('542426', '申扎县', '542400');
INSERT INTO `ss_area` VALUES ('542427', '索　县', '542400');
INSERT INTO `ss_area` VALUES ('542428', '班戈县', '542400');
INSERT INTO `ss_area` VALUES ('542429', '巴青县', '542400');
INSERT INTO `ss_area` VALUES ('542430', '尼玛县', '542400');
INSERT INTO `ss_area` VALUES ('542500', '阿里地区', '540000');
INSERT INTO `ss_area` VALUES ('542521', '普兰县', '542500');
INSERT INTO `ss_area` VALUES ('542522', '札达县', '542500');
INSERT INTO `ss_area` VALUES ('542523', '噶尔县', '542500');
INSERT INTO `ss_area` VALUES ('542524', '日土县', '542500');
INSERT INTO `ss_area` VALUES ('542525', '革吉县', '542500');
INSERT INTO `ss_area` VALUES ('542526', '改则县', '542500');
INSERT INTO `ss_area` VALUES ('542527', '措勤县', '542500');
INSERT INTO `ss_area` VALUES ('542600', '林芝地区', '540000');
INSERT INTO `ss_area` VALUES ('542621', '林芝县', '542600');
INSERT INTO `ss_area` VALUES ('542622', '工布江达县', '542600');
INSERT INTO `ss_area` VALUES ('542623', '米林县', '542600');
INSERT INTO `ss_area` VALUES ('542624', '墨脱县', '542600');
INSERT INTO `ss_area` VALUES ('542625', '波密县', '542600');
INSERT INTO `ss_area` VALUES ('542626', '察隅县', '542600');
INSERT INTO `ss_area` VALUES ('542627', '朗　县', '542600');
INSERT INTO `ss_area` VALUES ('610000', '陕西省', '0');
INSERT INTO `ss_area` VALUES ('610100', '西安市', '610000');
INSERT INTO `ss_area` VALUES ('610101', '市辖区', '610100');
INSERT INTO `ss_area` VALUES ('610102', '新城区', '610100');
INSERT INTO `ss_area` VALUES ('610103', '碑林区', '610100');
INSERT INTO `ss_area` VALUES ('610104', '莲湖区', '610100');
INSERT INTO `ss_area` VALUES ('610111', '灞桥区', '610100');
INSERT INTO `ss_area` VALUES ('610112', '未央区', '610100');
INSERT INTO `ss_area` VALUES ('610113', '雁塔区', '610100');
INSERT INTO `ss_area` VALUES ('610114', '阎良区', '610100');
INSERT INTO `ss_area` VALUES ('610115', '临潼区', '610100');
INSERT INTO `ss_area` VALUES ('610116', '长安区', '610100');
INSERT INTO `ss_area` VALUES ('610122', '蓝田县', '610100');
INSERT INTO `ss_area` VALUES ('610124', '周至县', '610100');
INSERT INTO `ss_area` VALUES ('610125', '户　县', '610100');
INSERT INTO `ss_area` VALUES ('610126', '高陵县', '610100');
INSERT INTO `ss_area` VALUES ('610200', '铜川市', '610000');
INSERT INTO `ss_area` VALUES ('610201', '市辖区', '610200');
INSERT INTO `ss_area` VALUES ('610202', '王益区', '610200');
INSERT INTO `ss_area` VALUES ('610203', '印台区', '610200');
INSERT INTO `ss_area` VALUES ('610204', '耀州区', '610200');
INSERT INTO `ss_area` VALUES ('610222', '宜君县', '610200');
INSERT INTO `ss_area` VALUES ('610300', '宝鸡市', '610000');
INSERT INTO `ss_area` VALUES ('610301', '市辖区', '610300');
INSERT INTO `ss_area` VALUES ('610302', '渭滨区', '610300');
INSERT INTO `ss_area` VALUES ('610303', '金台区', '610300');
INSERT INTO `ss_area` VALUES ('610304', '陈仓区', '610300');
INSERT INTO `ss_area` VALUES ('610322', '凤翔县', '610300');
INSERT INTO `ss_area` VALUES ('610323', '岐山县', '610300');
INSERT INTO `ss_area` VALUES ('610324', '扶风县', '610300');
INSERT INTO `ss_area` VALUES ('610326', '眉　县', '610300');
INSERT INTO `ss_area` VALUES ('610327', '陇　县', '610300');
INSERT INTO `ss_area` VALUES ('610328', '千阳县', '610300');
INSERT INTO `ss_area` VALUES ('610329', '麟游县', '610300');
INSERT INTO `ss_area` VALUES ('610330', '凤　县', '610300');
INSERT INTO `ss_area` VALUES ('610331', '太白县', '610300');
INSERT INTO `ss_area` VALUES ('610400', '咸阳市', '610000');
INSERT INTO `ss_area` VALUES ('610401', '市辖区', '610400');
INSERT INTO `ss_area` VALUES ('610402', '秦都区', '610400');
INSERT INTO `ss_area` VALUES ('610403', '杨凌区', '610400');
INSERT INTO `ss_area` VALUES ('610404', '渭城区', '610400');
INSERT INTO `ss_area` VALUES ('610422', '三原县', '610400');
INSERT INTO `ss_area` VALUES ('610423', '泾阳县', '610400');
INSERT INTO `ss_area` VALUES ('610424', '乾　县', '610400');
INSERT INTO `ss_area` VALUES ('610425', '礼泉县', '610400');
INSERT INTO `ss_area` VALUES ('610426', '永寿县', '610400');
INSERT INTO `ss_area` VALUES ('610427', '彬　县', '610400');
INSERT INTO `ss_area` VALUES ('610428', '长武县', '610400');
INSERT INTO `ss_area` VALUES ('610429', '旬邑县', '610400');
INSERT INTO `ss_area` VALUES ('610430', '淳化县', '610400');
INSERT INTO `ss_area` VALUES ('610431', '武功县', '610400');
INSERT INTO `ss_area` VALUES ('610481', '兴平市', '610400');
INSERT INTO `ss_area` VALUES ('610500', '渭南市', '610000');
INSERT INTO `ss_area` VALUES ('610501', '市辖区', '610500');
INSERT INTO `ss_area` VALUES ('610502', '临渭区', '610500');
INSERT INTO `ss_area` VALUES ('610521', '华　县', '610500');
INSERT INTO `ss_area` VALUES ('610522', '潼关县', '610500');
INSERT INTO `ss_area` VALUES ('610523', '大荔县', '610500');
INSERT INTO `ss_area` VALUES ('610524', '合阳县', '610500');
INSERT INTO `ss_area` VALUES ('610525', '澄城县', '610500');
INSERT INTO `ss_area` VALUES ('610526', '蒲城县', '610500');
INSERT INTO `ss_area` VALUES ('610527', '白水县', '610500');
INSERT INTO `ss_area` VALUES ('610528', '富平县', '610500');
INSERT INTO `ss_area` VALUES ('610581', '韩城市', '610500');
INSERT INTO `ss_area` VALUES ('610582', '华阴市', '610500');
INSERT INTO `ss_area` VALUES ('610600', '延安市', '610000');
INSERT INTO `ss_area` VALUES ('610601', '市辖区', '610600');
INSERT INTO `ss_area` VALUES ('610602', '宝塔区', '610600');
INSERT INTO `ss_area` VALUES ('610621', '延长县', '610600');
INSERT INTO `ss_area` VALUES ('610622', '延川县', '610600');
INSERT INTO `ss_area` VALUES ('610623', '子长县', '610600');
INSERT INTO `ss_area` VALUES ('610624', '安塞县', '610600');
INSERT INTO `ss_area` VALUES ('610625', '志丹县', '610600');
INSERT INTO `ss_area` VALUES ('610626', '吴旗县', '610600');
INSERT INTO `ss_area` VALUES ('610627', '甘泉县', '610600');
INSERT INTO `ss_area` VALUES ('610628', '富　县', '610600');
INSERT INTO `ss_area` VALUES ('610629', '洛川县', '610600');
INSERT INTO `ss_area` VALUES ('610630', '宜川县', '610600');
INSERT INTO `ss_area` VALUES ('610631', '黄龙县', '610600');
INSERT INTO `ss_area` VALUES ('610632', '黄陵县', '610600');
INSERT INTO `ss_area` VALUES ('610700', '汉中市', '610000');
INSERT INTO `ss_area` VALUES ('610701', '市辖区', '610700');
INSERT INTO `ss_area` VALUES ('610702', '汉台区', '610700');
INSERT INTO `ss_area` VALUES ('610721', '南郑县', '610700');
INSERT INTO `ss_area` VALUES ('610722', '城固县', '610700');
INSERT INTO `ss_area` VALUES ('610723', '洋　县', '610700');
INSERT INTO `ss_area` VALUES ('610724', '西乡县', '610700');
INSERT INTO `ss_area` VALUES ('610725', '勉　县', '610700');
INSERT INTO `ss_area` VALUES ('610726', '宁强县', '610700');
INSERT INTO `ss_area` VALUES ('610727', '略阳县', '610700');
INSERT INTO `ss_area` VALUES ('610728', '镇巴县', '610700');
INSERT INTO `ss_area` VALUES ('610729', '留坝县', '610700');
INSERT INTO `ss_area` VALUES ('610730', '佛坪县', '610700');
INSERT INTO `ss_area` VALUES ('610800', '榆林市', '610000');
INSERT INTO `ss_area` VALUES ('610801', '市辖区', '610800');
INSERT INTO `ss_area` VALUES ('610802', '榆阳区', '610800');
INSERT INTO `ss_area` VALUES ('610821', '神木县', '610800');
INSERT INTO `ss_area` VALUES ('610822', '府谷县', '610800');
INSERT INTO `ss_area` VALUES ('610823', '横山县', '610800');
INSERT INTO `ss_area` VALUES ('610824', '靖边县', '610800');
INSERT INTO `ss_area` VALUES ('610825', '定边县', '610800');
INSERT INTO `ss_area` VALUES ('610826', '绥德县', '610800');
INSERT INTO `ss_area` VALUES ('610827', '米脂县', '610800');
INSERT INTO `ss_area` VALUES ('610828', '佳　县', '610800');
INSERT INTO `ss_area` VALUES ('610829', '吴堡县', '610800');
INSERT INTO `ss_area` VALUES ('610830', '清涧县', '610800');
INSERT INTO `ss_area` VALUES ('610831', '子洲县', '610800');
INSERT INTO `ss_area` VALUES ('610900', '安康市', '610000');
INSERT INTO `ss_area` VALUES ('610901', '市辖区', '610900');
INSERT INTO `ss_area` VALUES ('610902', '汉滨区', '610900');
INSERT INTO `ss_area` VALUES ('610921', '汉阴县', '610900');
INSERT INTO `ss_area` VALUES ('610922', '石泉县', '610900');
INSERT INTO `ss_area` VALUES ('610923', '宁陕县', '610900');
INSERT INTO `ss_area` VALUES ('610924', '紫阳县', '610900');
INSERT INTO `ss_area` VALUES ('610925', '岚皋县', '610900');
INSERT INTO `ss_area` VALUES ('610926', '平利县', '610900');
INSERT INTO `ss_area` VALUES ('610927', '镇坪县', '610900');
INSERT INTO `ss_area` VALUES ('610928', '旬阳县', '610900');
INSERT INTO `ss_area` VALUES ('610929', '白河县', '610900');
INSERT INTO `ss_area` VALUES ('611000', '商洛市', '610000');
INSERT INTO `ss_area` VALUES ('611001', '市辖区', '611000');
INSERT INTO `ss_area` VALUES ('611002', '商州区', '611000');
INSERT INTO `ss_area` VALUES ('611021', '洛南县', '611000');
INSERT INTO `ss_area` VALUES ('611022', '丹凤县', '611000');
INSERT INTO `ss_area` VALUES ('611023', '商南县', '611000');
INSERT INTO `ss_area` VALUES ('611024', '山阳县', '611000');
INSERT INTO `ss_area` VALUES ('611025', '镇安县', '611000');
INSERT INTO `ss_area` VALUES ('611026', '柞水县', '611000');
INSERT INTO `ss_area` VALUES ('620000', '甘肃省', '0');
INSERT INTO `ss_area` VALUES ('620100', '兰州市', '620000');
INSERT INTO `ss_area` VALUES ('620101', '市辖区', '620100');
INSERT INTO `ss_area` VALUES ('620102', '城关区', '620100');
INSERT INTO `ss_area` VALUES ('620103', '七里河区', '620100');
INSERT INTO `ss_area` VALUES ('620104', '西固区', '620100');
INSERT INTO `ss_area` VALUES ('620105', '安宁区', '620100');
INSERT INTO `ss_area` VALUES ('620111', '红古区', '620100');
INSERT INTO `ss_area` VALUES ('620121', '永登县', '620100');
INSERT INTO `ss_area` VALUES ('620122', '皋兰县', '620100');
INSERT INTO `ss_area` VALUES ('620123', '榆中县', '620100');
INSERT INTO `ss_area` VALUES ('620200', '嘉峪关市', '620000');
INSERT INTO `ss_area` VALUES ('620201', '市辖区', '620200');
INSERT INTO `ss_area` VALUES ('620300', '金昌市', '620000');
INSERT INTO `ss_area` VALUES ('620301', '市辖区', '620300');
INSERT INTO `ss_area` VALUES ('620302', '金川区', '620300');
INSERT INTO `ss_area` VALUES ('620321', '永昌县', '620300');
INSERT INTO `ss_area` VALUES ('620400', '白银市', '620000');
INSERT INTO `ss_area` VALUES ('620401', '市辖区', '620400');
INSERT INTO `ss_area` VALUES ('620402', '白银区', '620400');
INSERT INTO `ss_area` VALUES ('620403', '平川区', '620400');
INSERT INTO `ss_area` VALUES ('620421', '靖远县', '620400');
INSERT INTO `ss_area` VALUES ('620422', '会宁县', '620400');
INSERT INTO `ss_area` VALUES ('620423', '景泰县', '620400');
INSERT INTO `ss_area` VALUES ('620500', '天水市', '620000');
INSERT INTO `ss_area` VALUES ('620501', '市辖区', '620500');
INSERT INTO `ss_area` VALUES ('620502', '秦城区', '620500');
INSERT INTO `ss_area` VALUES ('620503', '北道区', '620500');
INSERT INTO `ss_area` VALUES ('620521', '清水县', '620500');
INSERT INTO `ss_area` VALUES ('620522', '秦安县', '620500');
INSERT INTO `ss_area` VALUES ('620523', '甘谷县', '620500');
INSERT INTO `ss_area` VALUES ('620524', '武山县', '620500');
INSERT INTO `ss_area` VALUES ('620525', '张家川回族自治县', '620500');
INSERT INTO `ss_area` VALUES ('620600', '武威市', '620000');
INSERT INTO `ss_area` VALUES ('620601', '市辖区', '620600');
INSERT INTO `ss_area` VALUES ('620602', '凉州区', '620600');
INSERT INTO `ss_area` VALUES ('620621', '民勤县', '620600');
INSERT INTO `ss_area` VALUES ('620622', '古浪县', '620600');
INSERT INTO `ss_area` VALUES ('620623', '天祝藏族自治县', '620600');
INSERT INTO `ss_area` VALUES ('620700', '张掖市', '620000');
INSERT INTO `ss_area` VALUES ('620701', '市辖区', '620700');
INSERT INTO `ss_area` VALUES ('620702', '甘州区', '620700');
INSERT INTO `ss_area` VALUES ('620721', '肃南裕固族自治县', '620700');
INSERT INTO `ss_area` VALUES ('620722', '民乐县', '620700');
INSERT INTO `ss_area` VALUES ('620723', '临泽县', '620700');
INSERT INTO `ss_area` VALUES ('620724', '高台县', '620700');
INSERT INTO `ss_area` VALUES ('620725', '山丹县', '620700');
INSERT INTO `ss_area` VALUES ('620800', '平凉市', '620000');
INSERT INTO `ss_area` VALUES ('620801', '市辖区', '620800');
INSERT INTO `ss_area` VALUES ('620802', '崆峒区', '620800');
INSERT INTO `ss_area` VALUES ('620821', '泾川县', '620800');
INSERT INTO `ss_area` VALUES ('620822', '灵台县', '620800');
INSERT INTO `ss_area` VALUES ('620823', '崇信县', '620800');
INSERT INTO `ss_area` VALUES ('620824', '华亭县', '620800');
INSERT INTO `ss_area` VALUES ('620825', '庄浪县', '620800');
INSERT INTO `ss_area` VALUES ('620826', '静宁县', '620800');
INSERT INTO `ss_area` VALUES ('620900', '酒泉市', '620000');
INSERT INTO `ss_area` VALUES ('620901', '市辖区', '620900');
INSERT INTO `ss_area` VALUES ('620902', '肃州区', '620900');
INSERT INTO `ss_area` VALUES ('620921', '金塔县', '620900');
INSERT INTO `ss_area` VALUES ('620922', '安西县', '620900');
INSERT INTO `ss_area` VALUES ('620923', '肃北蒙古族自治县', '620900');
INSERT INTO `ss_area` VALUES ('620924', '阿克塞哈萨克族自治县', '620900');
INSERT INTO `ss_area` VALUES ('620981', '玉门市', '620900');
INSERT INTO `ss_area` VALUES ('620982', '敦煌市', '620900');
INSERT INTO `ss_area` VALUES ('621000', '庆阳市', '620000');
INSERT INTO `ss_area` VALUES ('621001', '市辖区', '621000');
INSERT INTO `ss_area` VALUES ('621002', '西峰区', '621000');
INSERT INTO `ss_area` VALUES ('621021', '庆城县', '621000');
INSERT INTO `ss_area` VALUES ('621022', '环　县', '621000');
INSERT INTO `ss_area` VALUES ('621023', '华池县', '621000');
INSERT INTO `ss_area` VALUES ('621024', '合水县', '621000');
INSERT INTO `ss_area` VALUES ('621025', '正宁县', '621000');
INSERT INTO `ss_area` VALUES ('621026', '宁　县', '621000');
INSERT INTO `ss_area` VALUES ('621027', '镇原县', '621000');
INSERT INTO `ss_area` VALUES ('621100', '定西市', '620000');
INSERT INTO `ss_area` VALUES ('621101', '市辖区', '621100');
INSERT INTO `ss_area` VALUES ('621102', '安定区', '621100');
INSERT INTO `ss_area` VALUES ('621121', '通渭县', '621100');
INSERT INTO `ss_area` VALUES ('621122', '陇西县', '621100');
INSERT INTO `ss_area` VALUES ('621123', '渭源县', '621100');
INSERT INTO `ss_area` VALUES ('621124', '临洮县', '621100');
INSERT INTO `ss_area` VALUES ('621125', '漳　县', '621100');
INSERT INTO `ss_area` VALUES ('621126', '岷　县', '621100');
INSERT INTO `ss_area` VALUES ('621200', '陇南市', '620000');
INSERT INTO `ss_area` VALUES ('621201', '市辖区', '621200');
INSERT INTO `ss_area` VALUES ('621202', '武都区', '621200');
INSERT INTO `ss_area` VALUES ('621221', '成　县', '621200');
INSERT INTO `ss_area` VALUES ('621222', '文　县', '621200');
INSERT INTO `ss_area` VALUES ('621223', '宕昌县', '621200');
INSERT INTO `ss_area` VALUES ('621224', '康　县', '621200');
INSERT INTO `ss_area` VALUES ('621225', '西和县', '621200');
INSERT INTO `ss_area` VALUES ('621226', '礼　县', '621200');
INSERT INTO `ss_area` VALUES ('621227', '徽　县', '621200');
INSERT INTO `ss_area` VALUES ('621228', '两当县', '621200');
INSERT INTO `ss_area` VALUES ('622900', '临夏回族自治州', '620000');
INSERT INTO `ss_area` VALUES ('622901', '临夏市', '622900');
INSERT INTO `ss_area` VALUES ('622921', '临夏县', '622900');
INSERT INTO `ss_area` VALUES ('622922', '康乐县', '622900');
INSERT INTO `ss_area` VALUES ('622923', '永靖县', '622900');
INSERT INTO `ss_area` VALUES ('622924', '广河县', '622900');
INSERT INTO `ss_area` VALUES ('622925', '和政县', '622900');
INSERT INTO `ss_area` VALUES ('622926', '东乡族自治县', '622900');
INSERT INTO `ss_area` VALUES ('622927', '积石山保安族东乡族撒拉族自治县', '622900');
INSERT INTO `ss_area` VALUES ('623000', '甘南藏族自治州', '620000');
INSERT INTO `ss_area` VALUES ('623001', '合作市', '623000');
INSERT INTO `ss_area` VALUES ('623021', '临潭县', '623000');
INSERT INTO `ss_area` VALUES ('623022', '卓尼县', '623000');
INSERT INTO `ss_area` VALUES ('623023', '舟曲县', '623000');
INSERT INTO `ss_area` VALUES ('623024', '迭部县', '623000');
INSERT INTO `ss_area` VALUES ('623025', '玛曲县', '623000');
INSERT INTO `ss_area` VALUES ('623026', '碌曲县', '623000');
INSERT INTO `ss_area` VALUES ('623027', '夏河县', '623000');
INSERT INTO `ss_area` VALUES ('630000', '青海省', '0');
INSERT INTO `ss_area` VALUES ('630100', '西宁市', '630000');
INSERT INTO `ss_area` VALUES ('630101', '市辖区', '630100');
INSERT INTO `ss_area` VALUES ('630102', '城东区', '630100');
INSERT INTO `ss_area` VALUES ('630103', '城中区', '630100');
INSERT INTO `ss_area` VALUES ('630104', '城西区', '630100');
INSERT INTO `ss_area` VALUES ('630105', '城北区', '630100');
INSERT INTO `ss_area` VALUES ('630121', '大通回族土族自治县', '630100');
INSERT INTO `ss_area` VALUES ('630122', '湟中县', '630100');
INSERT INTO `ss_area` VALUES ('630123', '湟源县', '630100');
INSERT INTO `ss_area` VALUES ('632100', '海东地区', '630000');
INSERT INTO `ss_area` VALUES ('632121', '平安县', '632100');
INSERT INTO `ss_area` VALUES ('632122', '民和回族土族自治县', '632100');
INSERT INTO `ss_area` VALUES ('632123', '乐都县', '632100');
INSERT INTO `ss_area` VALUES ('632126', '互助土族自治县', '632100');
INSERT INTO `ss_area` VALUES ('632127', '化隆回族自治县', '632100');
INSERT INTO `ss_area` VALUES ('632128', '循化撒拉族自治县', '632100');
INSERT INTO `ss_area` VALUES ('632200', '海北藏族自治州', '630000');
INSERT INTO `ss_area` VALUES ('632221', '门源回族自治县', '632200');
INSERT INTO `ss_area` VALUES ('632222', '祁连县', '632200');
INSERT INTO `ss_area` VALUES ('632223', '海晏县', '632200');
INSERT INTO `ss_area` VALUES ('632224', '刚察县', '632200');
INSERT INTO `ss_area` VALUES ('632300', '黄南藏族自治州', '630000');
INSERT INTO `ss_area` VALUES ('632321', '同仁县', '632300');
INSERT INTO `ss_area` VALUES ('632322', '尖扎县', '632300');
INSERT INTO `ss_area` VALUES ('632323', '泽库县', '632300');
INSERT INTO `ss_area` VALUES ('632324', '河南蒙古族自治县', '632300');
INSERT INTO `ss_area` VALUES ('632500', '海南藏族自治州', '630000');
INSERT INTO `ss_area` VALUES ('632521', '共和县', '632500');
INSERT INTO `ss_area` VALUES ('632522', '同德县', '632500');
INSERT INTO `ss_area` VALUES ('632523', '贵德县', '632500');
INSERT INTO `ss_area` VALUES ('632524', '兴海县', '632500');
INSERT INTO `ss_area` VALUES ('632525', '贵南县', '632500');
INSERT INTO `ss_area` VALUES ('632600', '果洛藏族自治州', '630000');
INSERT INTO `ss_area` VALUES ('632621', '玛沁县', '632600');
INSERT INTO `ss_area` VALUES ('632622', '班玛县', '632600');
INSERT INTO `ss_area` VALUES ('632623', '甘德县', '632600');
INSERT INTO `ss_area` VALUES ('632624', '达日县', '632600');
INSERT INTO `ss_area` VALUES ('632625', '久治县', '632600');
INSERT INTO `ss_area` VALUES ('632626', '玛多县', '632600');
INSERT INTO `ss_area` VALUES ('632700', '玉树藏族自治州', '630000');
INSERT INTO `ss_area` VALUES ('632721', '玉树县', '632700');
INSERT INTO `ss_area` VALUES ('632722', '杂多县', '632700');
INSERT INTO `ss_area` VALUES ('632723', '称多县', '632700');
INSERT INTO `ss_area` VALUES ('632724', '治多县', '632700');
INSERT INTO `ss_area` VALUES ('632725', '囊谦县', '632700');
INSERT INTO `ss_area` VALUES ('632726', '曲麻莱县', '632700');
INSERT INTO `ss_area` VALUES ('632800', '海西蒙古族藏族自治州', '630000');
INSERT INTO `ss_area` VALUES ('632801', '格尔木市', '632800');
INSERT INTO `ss_area` VALUES ('632802', '德令哈市', '632800');
INSERT INTO `ss_area` VALUES ('632821', '乌兰县', '632800');
INSERT INTO `ss_area` VALUES ('632822', '都兰县', '632800');
INSERT INTO `ss_area` VALUES ('632823', '天峻县', '632800');
INSERT INTO `ss_area` VALUES ('640000', '宁夏回族自治区', '0');
INSERT INTO `ss_area` VALUES ('640100', '银川市', '640000');
INSERT INTO `ss_area` VALUES ('640101', '市辖区', '640100');
INSERT INTO `ss_area` VALUES ('640104', '兴庆区', '640100');
INSERT INTO `ss_area` VALUES ('640105', '西夏区', '640100');
INSERT INTO `ss_area` VALUES ('640106', '金凤区', '640100');
INSERT INTO `ss_area` VALUES ('640121', '永宁县', '640100');
INSERT INTO `ss_area` VALUES ('640122', '贺兰县', '640100');
INSERT INTO `ss_area` VALUES ('640181', '灵武市', '640100');
INSERT INTO `ss_area` VALUES ('640200', '石嘴山市', '640000');
INSERT INTO `ss_area` VALUES ('640201', '市辖区', '640200');
INSERT INTO `ss_area` VALUES ('640202', '大武口区', '640200');
INSERT INTO `ss_area` VALUES ('640205', '惠农区', '640200');
INSERT INTO `ss_area` VALUES ('640221', '平罗县', '640200');
INSERT INTO `ss_area` VALUES ('640300', '吴忠市', '640000');
INSERT INTO `ss_area` VALUES ('640301', '市辖区', '640300');
INSERT INTO `ss_area` VALUES ('640302', '利通区', '640300');
INSERT INTO `ss_area` VALUES ('640323', '盐池县', '640300');
INSERT INTO `ss_area` VALUES ('640324', '同心县', '640300');
INSERT INTO `ss_area` VALUES ('640381', '青铜峡市', '640300');
INSERT INTO `ss_area` VALUES ('640400', '固原市', '640000');
INSERT INTO `ss_area` VALUES ('640401', '市辖区', '640400');
INSERT INTO `ss_area` VALUES ('640402', '原州区', '640400');
INSERT INTO `ss_area` VALUES ('640422', '西吉县', '640400');
INSERT INTO `ss_area` VALUES ('640423', '隆德县', '640400');
INSERT INTO `ss_area` VALUES ('640424', '泾源县', '640400');
INSERT INTO `ss_area` VALUES ('640425', '彭阳县', '640400');
INSERT INTO `ss_area` VALUES ('640500', '中卫市', '640000');
INSERT INTO `ss_area` VALUES ('640501', '市辖区', '640500');
INSERT INTO `ss_area` VALUES ('640502', '沙坡头区', '640500');
INSERT INTO `ss_area` VALUES ('640521', '中宁县', '640500');
INSERT INTO `ss_area` VALUES ('640522', '海原县', '640500');
INSERT INTO `ss_area` VALUES ('650000', '新疆维吾尔自治区', '0');
INSERT INTO `ss_area` VALUES ('650100', '乌鲁木齐市', '650000');
INSERT INTO `ss_area` VALUES ('650101', '市辖区', '650100');
INSERT INTO `ss_area` VALUES ('650102', '天山区', '650100');
INSERT INTO `ss_area` VALUES ('650103', '沙依巴克区', '650100');
INSERT INTO `ss_area` VALUES ('650104', '新市区', '650100');
INSERT INTO `ss_area` VALUES ('650105', '水磨沟区', '650100');
INSERT INTO `ss_area` VALUES ('650106', '头屯河区', '650100');
INSERT INTO `ss_area` VALUES ('650107', '达坂城区', '650100');
INSERT INTO `ss_area` VALUES ('650108', '东山区', '650100');
INSERT INTO `ss_area` VALUES ('650121', '乌鲁木齐县', '650100');
INSERT INTO `ss_area` VALUES ('650200', '克拉玛依市', '650000');
INSERT INTO `ss_area` VALUES ('650201', '市辖区', '650200');
INSERT INTO `ss_area` VALUES ('650202', '独山子区', '650200');
INSERT INTO `ss_area` VALUES ('650203', '克拉玛依区', '650200');
INSERT INTO `ss_area` VALUES ('650204', '白碱滩区', '650200');
INSERT INTO `ss_area` VALUES ('650205', '乌尔禾区', '650200');
INSERT INTO `ss_area` VALUES ('652100', '吐鲁番地区', '650000');
INSERT INTO `ss_area` VALUES ('652101', '吐鲁番市', '652100');
INSERT INTO `ss_area` VALUES ('652122', '鄯善县', '652100');
INSERT INTO `ss_area` VALUES ('652123', '托克逊县', '652100');
INSERT INTO `ss_area` VALUES ('652200', '哈密地区', '650000');
INSERT INTO `ss_area` VALUES ('652201', '哈密市', '652200');
INSERT INTO `ss_area` VALUES ('652222', '巴里坤哈萨克自治县', '652200');
INSERT INTO `ss_area` VALUES ('652223', '伊吾县', '652200');
INSERT INTO `ss_area` VALUES ('652300', '昌吉回族自治州', '650000');
INSERT INTO `ss_area` VALUES ('652301', '昌吉市', '652300');
INSERT INTO `ss_area` VALUES ('652302', '阜康市', '652300');
INSERT INTO `ss_area` VALUES ('652303', '米泉市', '652300');
INSERT INTO `ss_area` VALUES ('652323', '呼图壁县', '652300');
INSERT INTO `ss_area` VALUES ('652324', '玛纳斯县', '652300');
INSERT INTO `ss_area` VALUES ('652325', '奇台县', '652300');
INSERT INTO `ss_area` VALUES ('652327', '吉木萨尔县', '652300');
INSERT INTO `ss_area` VALUES ('652328', '木垒哈萨克自治县', '652300');
INSERT INTO `ss_area` VALUES ('652700', '博尔塔拉蒙古自治州', '650000');
INSERT INTO `ss_area` VALUES ('652701', '博乐市', '652700');
INSERT INTO `ss_area` VALUES ('652722', '精河县', '652700');
INSERT INTO `ss_area` VALUES ('652723', '温泉县', '652700');
INSERT INTO `ss_area` VALUES ('652800', '巴音郭楞蒙古自治州', '650000');
INSERT INTO `ss_area` VALUES ('652801', '库尔勒市', '652800');
INSERT INTO `ss_area` VALUES ('652822', '轮台县', '652800');
INSERT INTO `ss_area` VALUES ('652823', '尉犁县', '652800');
INSERT INTO `ss_area` VALUES ('652824', '若羌县', '652800');
INSERT INTO `ss_area` VALUES ('652825', '且末县', '652800');
INSERT INTO `ss_area` VALUES ('652826', '焉耆回族自治县', '652800');
INSERT INTO `ss_area` VALUES ('652827', '和静县', '652800');
INSERT INTO `ss_area` VALUES ('652828', '和硕县', '652800');
INSERT INTO `ss_area` VALUES ('652829', '博湖县', '652800');
INSERT INTO `ss_area` VALUES ('652900', '阿克苏地区', '650000');
INSERT INTO `ss_area` VALUES ('652901', '阿克苏市', '652900');
INSERT INTO `ss_area` VALUES ('652922', '温宿县', '652900');
INSERT INTO `ss_area` VALUES ('652923', '库车县', '652900');
INSERT INTO `ss_area` VALUES ('652924', '沙雅县', '652900');
INSERT INTO `ss_area` VALUES ('652925', '新和县', '652900');
INSERT INTO `ss_area` VALUES ('652926', '拜城县', '652900');
INSERT INTO `ss_area` VALUES ('652927', '乌什县', '652900');
INSERT INTO `ss_area` VALUES ('652928', '阿瓦提县', '652900');
INSERT INTO `ss_area` VALUES ('652929', '柯坪县', '652900');
INSERT INTO `ss_area` VALUES ('653000', '克孜勒苏柯尔克孜自治州', '650000');
INSERT INTO `ss_area` VALUES ('653001', '阿图什市', '653000');
INSERT INTO `ss_area` VALUES ('653022', '阿克陶县', '653000');
INSERT INTO `ss_area` VALUES ('653023', '阿合奇县', '653000');
INSERT INTO `ss_area` VALUES ('653024', '乌恰县', '653000');
INSERT INTO `ss_area` VALUES ('653100', '喀什地区', '650000');
INSERT INTO `ss_area` VALUES ('653101', '喀什市', '653100');
INSERT INTO `ss_area` VALUES ('653121', '疏附县', '653100');
INSERT INTO `ss_area` VALUES ('653122', '疏勒县', '653100');
INSERT INTO `ss_area` VALUES ('653123', '英吉沙县', '653100');
INSERT INTO `ss_area` VALUES ('653124', '泽普县', '653100');
INSERT INTO `ss_area` VALUES ('653125', '莎车县', '653100');
INSERT INTO `ss_area` VALUES ('653126', '叶城县', '653100');
INSERT INTO `ss_area` VALUES ('653127', '麦盖提县', '653100');
INSERT INTO `ss_area` VALUES ('653128', '岳普湖县', '653100');
INSERT INTO `ss_area` VALUES ('653129', '伽师县', '653100');
INSERT INTO `ss_area` VALUES ('653130', '巴楚县', '653100');
INSERT INTO `ss_area` VALUES ('653131', '塔什库尔干塔吉克自治县', '653100');
INSERT INTO `ss_area` VALUES ('653200', '和田地区', '650000');
INSERT INTO `ss_area` VALUES ('653201', '和田市', '653200');
INSERT INTO `ss_area` VALUES ('653221', '和田县', '653200');
INSERT INTO `ss_area` VALUES ('653222', '墨玉县', '653200');
INSERT INTO `ss_area` VALUES ('653223', '皮山县', '653200');
INSERT INTO `ss_area` VALUES ('653224', '洛浦县', '653200');
INSERT INTO `ss_area` VALUES ('653225', '策勒县', '653200');
INSERT INTO `ss_area` VALUES ('653226', '于田县', '653200');
INSERT INTO `ss_area` VALUES ('653227', '民丰县', '653200');
INSERT INTO `ss_area` VALUES ('654000', '伊犁哈萨克自治州', '650000');
INSERT INTO `ss_area` VALUES ('654002', '伊宁市', '654000');
INSERT INTO `ss_area` VALUES ('654003', '奎屯市', '654000');
INSERT INTO `ss_area` VALUES ('654021', '伊宁县', '654000');
INSERT INTO `ss_area` VALUES ('654022', '察布查尔锡伯自治县', '654000');
INSERT INTO `ss_area` VALUES ('654023', '霍城县', '654000');
INSERT INTO `ss_area` VALUES ('654024', '巩留县', '654000');
INSERT INTO `ss_area` VALUES ('654025', '新源县', '654000');
INSERT INTO `ss_area` VALUES ('654026', '昭苏县', '654000');
INSERT INTO `ss_area` VALUES ('654027', '特克斯县', '654000');
INSERT INTO `ss_area` VALUES ('654028', '尼勒克县', '654000');
INSERT INTO `ss_area` VALUES ('654200', '塔城地区', '650000');
INSERT INTO `ss_area` VALUES ('654201', '塔城市', '654200');
INSERT INTO `ss_area` VALUES ('654202', '乌苏市', '654200');
INSERT INTO `ss_area` VALUES ('654221', '额敏县', '654200');
INSERT INTO `ss_area` VALUES ('654223', '沙湾县', '654200');
INSERT INTO `ss_area` VALUES ('654224', '托里县', '654200');
INSERT INTO `ss_area` VALUES ('654225', '裕民县', '654200');
INSERT INTO `ss_area` VALUES ('654226', '和布克赛尔蒙古自治县', '654200');
INSERT INTO `ss_area` VALUES ('654300', '阿勒泰地区', '650000');
INSERT INTO `ss_area` VALUES ('654301', '阿勒泰市', '654300');
INSERT INTO `ss_area` VALUES ('654321', '布尔津县', '654300');
INSERT INTO `ss_area` VALUES ('654322', '富蕴县', '654300');
INSERT INTO `ss_area` VALUES ('654323', '福海县', '654300');
INSERT INTO `ss_area` VALUES ('654324', '哈巴河县', '654300');
INSERT INTO `ss_area` VALUES ('654325', '青河县', '654300');
INSERT INTO `ss_area` VALUES ('654326', '吉木乃县', '654300');
INSERT INTO `ss_area` VALUES ('659000', '省直辖行政单位', '650000');
INSERT INTO `ss_area` VALUES ('659001', '石河子市', '659000');
INSERT INTO `ss_area` VALUES ('659002', '阿拉尔市', '659000');
INSERT INTO `ss_area` VALUES ('659003', '图木舒克市', '659000');
INSERT INTO `ss_area` VALUES ('659004', '五家渠市', '659000');
INSERT INTO `ss_area` VALUES ('710000', '台湾省', '0');
INSERT INTO `ss_area` VALUES ('810000', '香港特别行政区', '0');
INSERT INTO `ss_area` VALUES ('820000', '澳门特别行政区', '0');

-- ----------------------------
-- Table structure for ss_attachment
-- ----------------------------
DROP TABLE IF EXISTS `ss_attachment`;
CREATE TABLE `ss_attachment` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `businessId` varchar(255) DEFAULT NULL COMMENT '业务ID',
  `create_time` datetime DEFAULT NULL COMMENT '上传时间',
  `fileType` varchar(2) DEFAULT '' COMMENT '附件类型：1.巡检记录提交；2.二维码；3.设备照片；4.扩展',
  `filename` varchar(255) DEFAULT '' COMMENT '文件名',
  `filepath` varchar(255) DEFAULT '' COMMENT '文件路径',
  `field01` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field02` varchar(50) DEFAULT '' COMMENT '扩展字段',
  `field03` varchar(50) DEFAULT '' COMMENT '扩展字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件上传表';

-- ----------------------------
-- Records of ss_attachment
-- ----------------------------
INSERT INTO `ss_attachment` VALUES ('6b8af0c1a76144459c3770d7c46d74df', '5ed61cebf3b14fdc8727b2f5fa42ba29', '2018-10-21 09:11:42', '0', '阿勒泰-4.jpg', '/5ed61cebf3b14fdc8727b2f5fa42ba29/0', '', null, null);
INSERT INTO `ss_attachment` VALUES ('901affd00f6e49eb8e715bf2dd9508a0', '5ed61cebf3b14fdc8727b2f5fa42ba29', '2018-10-21 09:11:33', '0', '阿勒泰-1.jpg', '/5ed61cebf3b14fdc8727b2f5fa42ba29/0', '', null, null);
INSERT INTO `ss_attachment` VALUES ('ae4acb0efd744beca5a3100fc429958c', '5ed61cebf3b14fdc8727b2f5fa42ba29', '2018-10-21 09:11:41', '0', '阿勒泰-2.jpg', '/5ed61cebf3b14fdc8727b2f5fa42ba29/0', '', null, null);
INSERT INTO `ss_attachment` VALUES ('f0b87ac435944a78b989f119817f4b96', '5ed61cebf3b14fdc8727b2f5fa42ba29', '2018-10-21 09:11:41', '0', '阿勒泰-3.jpg', '/5ed61cebf3b14fdc8727b2f5fa42ba29/0', '', null, null);

-- ----------------------------
-- Table structure for ss_category
-- ----------------------------
DROP TABLE IF EXISTS `ss_category`;
CREATE TABLE `ss_category` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `parent_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  `category_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_category
-- ----------------------------
INSERT INTO `ss_category` VALUES ('0001', '所有分类', 'enabled', '0', null, '0', null);
INSERT INTO `ss_category` VALUES ('00010001', '一级分类', 'enabled', '0001', '0', '0', '121221222');
INSERT INTO `ss_category` VALUES ('000100010001', '2222', 'disabled', '00010001', '0', '0', '');
INSERT INTO `ss_category` VALUES ('000100010002', '1', 'disabled', '00010001', '0', '1', '');
INSERT INTO `ss_category` VALUES ('000100010003', '2', 'disabled', '00010001', '0', '2', '');
INSERT INTO `ss_category` VALUES ('000100010004', '232332', 'disabled', '00010001', '0', '3', '');
INSERT INTO `ss_category` VALUES ('00010002', '学习文件', 'enabled', '0001', '1', '1', '');

-- ----------------------------
-- Table structure for ss_del_widget_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_del_widget_user`;
CREATE TABLE `ss_del_widget_user` (
  `id` varchar(50) NOT NULL,
  `widgetId` varchar(50) NOT NULL,
  `userId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_del_widget_user
-- ----------------------------
INSERT INTO `ss_del_widget_user` VALUES ('1f9b9e1824bc43b292b5f8fedad1d3b5', '314e8444c03b4a1fba7d5b17d019eed6', '1');
INSERT INTO `ss_del_widget_user` VALUES ('2fa1354bc5694a3ab9bc5a06d200b3c6', 'c83e1793f9f04dc890bf15f4c6c654fc', '1');
INSERT INTO `ss_del_widget_user` VALUES ('34f17482e70441a2b31f533e3359b2fa', '0ed0d750d1b0436d89ef1a4b2b33e443', '1');
INSERT INTO `ss_del_widget_user` VALUES ('fbfd95f5dd2b451dbae796c599fa600f', 'ea5303a71406436da1a6cc5e7137be1d', '1');

-- ----------------------------
-- Table structure for ss_department
-- ----------------------------
DROP TABLE IF EXISTS `ss_department`;
CREATE TABLE `ss_department` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `depCode` varchar(255) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `postCode` varchar(50) DEFAULT NULL,
  `phoneNumber` varchar(50) DEFAULT NULL,
  `depType` varchar(50) DEFAULT NULL,
  `depLevel` varchar(50) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  `create_user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`parent_id`) USING BTREE,
  CONSTRAINT `ss_department_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `ss_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_department
-- ----------------------------
INSERT INTO `ss_department` VALUES ('0001', '总公司', '总公司', '0001', null, 'enabled', '232000', '6571699', null, '0', '0', '1');
INSERT INTO `ss_department` VALUES ('87eacfdf53de4893a130274e7c357351', '江苏分公司', '江分', '232', '0001', 'enabled', '232000', '0550123456', '1', '0', '1', '1');

-- ----------------------------
-- Table structure for ss_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `ss_dictionary`;
CREATE TABLE `ss_dictionary` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  `default_flg` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `ext_filed` varchar(255) DEFAULT NULL,
  `type_code` varchar(255) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  `jgId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_dictionary
-- ----------------------------
INSERT INTO `ss_dictionary` VALUES ('0445948c44c64f01af45497808a0d972', '灭火器类别', '', 'n', 'enabled', '0', '', 'xf_category', null, null);
INSERT INTO `ss_dictionary` VALUES ('0773f3feee4747808165c3a490a56d0c', '设备类型', '', 'n', 'enabled', '0', '', 'xf_type', null, null);
INSERT INTO `ss_dictionary` VALUES ('07da8a9463f14914aabbc1ca859ee371', '设备运行状态', '', 'n', 'enabled', '0', '', 'xf_status', null, null);
INSERT INTO `ss_dictionary` VALUES ('1514525022cd4d01b350497b41e0d4e3', '管理员', '0', 'n', 'enabled', '0', '', 'iot_userType', '7d8eac49b96a4f419630720c881c59a7', null);
INSERT INTO `ss_dictionary` VALUES ('15537734799d473388959b5f61ac2a0f', '灭火器', '1', 'n', 'enabled', '0', '', 'xf_type', '0773f3feee4747808165c3a490a56d0c', null);
INSERT INTO `ss_dictionary` VALUES ('5be42bc9b366459ca5148cf2985744c6', '每10天1次', '3', 'n', 'enabled', '2', '', 'xf_check_freq', '796724d8a47d4b3a9d916bf6ab8cd631', null);
INSERT INTO `ss_dictionary` VALUES ('645708c850da4b6fb6f9609f38f2d837', '经销商', '2', 'n', 'disabled', '2', '', 'iot_userType', '7d8eac49b96a4f419630720c881c59a7', null);
INSERT INTO `ss_dictionary` VALUES ('66e5de247f6d45ff905dd7e92e14239c', '有效', 'enabled', 'n', 'enabled', '0', '', 'status', '69ef79c6272644199c2b320f69938f2c', null);
INSERT INTO `ss_dictionary` VALUES ('69ef79c6272644199c2b320f69938f2c', '设备状态', '', 'n', 'enabled', '0', '', 'status', null, null);
INSERT INTO `ss_dictionary` VALUES ('74d60414d1404e8491ddb2614d35da87', '无效', 'disabled', 'n', 'enabled', '1', '', 'status', '69ef79c6272644199c2b320f69938f2c', null);
INSERT INTO `ss_dictionary` VALUES ('796724d8a47d4b3a9d916bf6ab8cd631', '巡检频率', '', 'n', 'enabled', '0', '', 'xf_check_freq', null, null);
INSERT INTO `ss_dictionary` VALUES ('7d8eac49b96a4f419630720c881c59a7', '用户类型', '', 'n', 'enabled', '0', '', 'iot_userType', null, null);
INSERT INTO `ss_dictionary` VALUES ('83b38c08947040378e58ac8684080736', '每月1次', '1', 'n', 'enabled', '0', '', 'xf_check_freq', '796724d8a47d4b3a9d916bf6ab8cd631', null);
INSERT INTO `ss_dictionary` VALUES ('8b9595f837954336bd873980ea1798a0', '正常工作', '1', 'n', 'enabled', '0', '', 'xf_status', '07da8a9463f14914aabbc1ca859ee371', null);
INSERT INTO `ss_dictionary` VALUES ('a10222cbc94a4ae8b68f21ff9e1eaa0b', '4Kg干粉', '1', 'y', 'enabled', '0', '', 'xf_category', '0445948c44c64f01af45497808a0d972', null);
INSERT INTO `ss_dictionary` VALUES ('a1cfff9d22c14a3db368cb8f20549942', '巡检员', '1', 'n', 'enabled', '1', '', 'iot_userType', '7d8eac49b96a4f419630720c881c59a7', null);
INSERT INTO `ss_dictionary` VALUES ('a4ffed324635410fa582f37d36e1b27b', '每半月一次', '2', 'n', 'enabled', '1', '', 'xf_check_freq', '796724d8a47d4b3a9d916bf6ab8cd631', null);
INSERT INTO `ss_dictionary` VALUES ('c6f53e923c6a486ba345ab6ddaecae3a', '运行异常', '2', 'n', 'enabled', '1', '', 'xf_status', '07da8a9463f14914aabbc1ca859ee371', null);
INSERT INTO `ss_dictionary` VALUES ('d45a2fec3df146ac8b86f3a5c9317256', '客户', '3', 'n', 'disabled', '3', '', 'iot_userType', '7d8eac49b96a4f419630720c881c59a7', null);

-- ----------------------------
-- Table structure for ss_email_config
-- ----------------------------
DROP TABLE IF EXISTS `ss_email_config`;
CREATE TABLE `ss_email_config` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `host` varchar(255) NOT NULL COMMENT 'SMTP服务器',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `port` varchar(255) NOT NULL COMMENT '端口',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮箱配置';

-- ----------------------------
-- Records of ss_email_config
-- ----------------------------
INSERT INTO `ss_email_config` VALUES ('470ffc9b0e724371a0cb9c1e4f961191', '2015-04-14 12:26:41', '2019-09-05 15:00:39', '1', '1', 'enabled', 'smtp.163.com', 'binnz_java@163.com', 'xiaoqin_bin0220', '25');

-- ----------------------------
-- Table structure for ss_email_send
-- ----------------------------
DROP TABLE IF EXISTS `ss_email_send`;
CREATE TABLE `ss_email_send` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `host` varchar(255) DEFAULT NULL COMMENT 'SMTP服务器',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `port` varchar(255) DEFAULT NULL COMMENT '端口',
  `subject` varchar(255) DEFAULT NULL COMMENT '主题',
  `message` text COMMENT '内容',
  `toemail` varchar(255) DEFAULT NULL COMMENT '接收者',
  `fsend` varchar(255) DEFAULT NULL COMMENT '是否发送',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮箱发送记录';

-- ----------------------------
-- Records of ss_email_send
-- ----------------------------
INSERT INTO `ss_email_send` VALUES ('7e88d6bb4f244b0faa0f6229d053e31f', '2019-09-05 15:05:21', '2019-09-05 15:05:21', '1', '1', 'enabled', 'smtp.163.com', 'binnz_java@163.com', 'xiaoqin_bin0220', '25', 'test', '本邮件为测试邮件', 'binnz_java@163.com', '1', '2019-09-05 15:05:21');

-- ----------------------------
-- Table structure for ss_employee
-- ----------------------------
DROP TABLE IF EXISTS `ss_employee`;
CREATE TABLE `ss_employee` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) DEFAULT NULL,
  `job_no` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `birth_day` datetime DEFAULT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `nativep` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `department_id` varchar(50) DEFAULT NULL,
  `post_id` varchar(50) DEFAULT NULL,
  `relstatus` varchar(255) DEFAULT NULL,
  `reluser` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `usercreate` varchar(50) DEFAULT NULL,
  `organId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_employee
-- ----------------------------
INSERT INTO `ss_employee` VALUES ('a638f5c8f4384d08b2e5e96025ec44c6', '寰宇老总', '1233', '0', null, '', '', '', '', '', '', '', '', '00010001', '', 'false', '', 'enabled', '0', '45859559355a44baaa90c5be493f4270');
INSERT INTO `ss_employee` VALUES ('fac7ed0b23eb42009b8ed89423f50c81', '朱天', '1111', '0', null, '', '', '', '', '', '', '', '', '00010001', '', 'false', '', 'enabled', '0', '80d444d275b24bd6b27fa0034de5465e');

-- ----------------------------
-- Table structure for ss_event
-- ----------------------------
DROP TABLE IF EXISTS `ss_event`;
CREATE TABLE `ss_event` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `details` varchar(255) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` varchar(50) DEFAULT NULL,
  `isopen` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_event
-- ----------------------------
INSERT INTO `ss_event` VALUES ('1361499156936', '我很好  屁民\r\n', null, '2013-02-22 09:15:00', '2013-02-22 13:45:00', '你好世界我的中华1', '1', '2013-02-22 10:12:43', '1', 'false');
INSERT INTO `ss_event` VALUES ('1361762023878', '', null, '2013-02-25 09:55:00', '2013-02-25 14:05:00', '很好的日程', '1', '2013-02-25 11:13:45', '1', 'false');
INSERT INTO `ss_event` VALUES ('1361780895196', '', null, '2013-02-27 09:35:00', '2013-02-27 14:15:00', '新123', '1', '2013-02-25 16:28:17', '1', 'false');
INSERT INTO `ss_event` VALUES ('1361780922260', '', null, '2013-02-28 11:10:00', '2013-02-28 17:00:00', '22222', '1', '2013-02-25 16:28:43', '1', 'false');
INSERT INTO `ss_event` VALUES ('1365742246763', '12', null, '2013-04-10 09:30:00', '2013-04-10 00:25:00', '新建日程', '1', '2013-04-12 12:50:48', '1', 'false');
INSERT INTO `ss_event` VALUES ('1372408333387', null, null, '2013-06-25 11:20:00', '2013-06-25 14:00:00', '新建日程', '1', '2013-06-28 16:32:18', '1', 'false');
INSERT INTO `ss_event` VALUES ('1399868014204', null, null, '2014-05-13 10:15:00', '2014-05-13 13:55:00', '新建日程', '1', '2014-05-12 12:13:36', '1', 'false');

-- ----------------------------
-- Table structure for ss_file_store
-- ----------------------------
DROP TABLE IF EXISTS `ss_file_store`;
CREATE TABLE `ss_file_store` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `create_user_id` varchar(50) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `affix` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `catalog_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_file_store
-- ----------------------------
INSERT INTO `ss_file_store` VALUES ('fe2146b407f24b4884f6d3c5da214678', '我的文件', '1', '2013-02-27 15:12:00', '2', 'fileStore/1361948791984', 'enabled', '00010002');
INSERT INTO `ss_file_store` VALUES ('ff53ebad6e954f9d88a5e9feb6aa836c', '你的文件222', '1', '2013-02-27 16:31:47', '', 'fileStore/1361953900296', 'enabled', '00010002');

-- ----------------------------
-- Table structure for ss_job
-- ----------------------------
DROP TABLE IF EXISTS `ss_job`;
CREATE TABLE `ss_job` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` varchar(50) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `deal_user_id` varchar(50) DEFAULT NULL,
  `sth_user_list_id` varchar(50) DEFAULT NULL,
  `affix` varchar(255) DEFAULT NULL,
  `level_id` varchar(50) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `finash_date` datetime DEFAULT NULL,
  `job_status` varchar(255) DEFAULT NULL,
  `parent_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_job
-- ----------------------------
INSERT INTO `ss_job` VALUES ('03c28ab81309494e83d28c5ff867fe93', 'wwwwwwww', '2013-03-04 13:14:28', '1', 'ffffffffffff', '1', null, 'job/1362374049156', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-03-23 00:00:00', null, '3', null);
INSERT INTO `ss_job` VALUES ('11053c774af9414592d997691da1aac2', '11111', '2013-03-04 12:40:56', '1', '2222', '1', null, 'job/1362372039625', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-03-22 00:00:00', null, '1', null);
INSERT INTO `ss_job` VALUES ('2308fab86f7d4066b448340324ec513f', '123123', '2013-03-04 12:43:23', '1', '213', '1', null, 'job/1362372190734', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-03-15 00:00:00', null, '1', null);
INSERT INTO `ss_job` VALUES ('3c242d81e8f0499a83ecfd015d375769', '123123ttttt', '2013-03-03 15:53:18', '1', '123123123', '1', null, 'job/1362297186375', '1803aca57c3441a3b8e1b6df2118016f', 'enabled', '2013-03-30 00:00:00', null, '1', null);
INSERT INTO `ss_job` VALUES ('48121aa3a4194ce88f381262d77315ee', 'qweqweqwe', '2013-06-28 16:59:18', '1', 'qweqweqweqwe', '1', null, 'job/1372409941578', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-06-29 00:00:00', null, '2', null);
INSERT INTO `ss_job` VALUES ('4a30750cfd8a4783b05e5b7be418e2fd', '看看你的活干的怎么样了', '2013-03-05 15:38:14', '1', '啊啊啊啊啊啊啊啊啊啊啊啊', '111c95d9938b4fc49ca88f7e0d09b6fb', null, 'job/1362469068281', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-03-15 00:00:00', null, '1', null);
INSERT INTO `ss_job` VALUES ('56454ab9bb4e4957a8ef570225b8a6c8', '你好工作', '2013-03-05 14:11:48', '1', '啊实打实的', '1', null, 'job/1362463894140', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-03-16 00:00:00', null, '1', null);
INSERT INTO `ss_job` VALUES ('59c30e25f1044871a041ad826275741c', '暂存的', '2013-03-03 16:19:06', '1', '1222222222', '045c8cec7da54274b3429560f2f1addf', null, 'job/1362298711953', '1803aca57c3441a3b8e1b6df2118016f', 'enabled', '2013-03-16 00:00:00', null, '1', null);
INSERT INTO `ss_job` VALUES ('ab44dd7d6adf4f3eb01ab56617725332', '刺杀本拉登', '2013-03-05 13:05:21', '1', '给你们三天时间，一定要功能掉他，否则你们就等着死吧，\r\n还有你们的老婆我先帮你们照顾，不用担心家里，放心的去干吧', '1', null, 'job/1362459850203', '1803aca57c3441a3b8e1b6df2118016f', 'enabled', '2013-03-30 00:00:00', null, '3', null);
INSERT INTO `ss_job` VALUES ('d46ef398b5964fa59f7117c64d2da16b', '123123', '2013-03-04 12:46:18', '1', '23213', '1', null, 'job/1362372357968', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-03-09 00:00:00', null, '3', null);
INSERT INTO `ss_job` VALUES ('d6d07113dc8e4f579c4214b4db53f12c', '杀人的任务', '2013-03-04 12:51:48', '1', '21212', '1', null, 'job/1362372679046', '6e96bffa33024f3dabc276c2d905a004', 'enabled', '2013-03-23 00:00:00', null, '3', null);

-- ----------------------------
-- Table structure for ss_job_project
-- ----------------------------
DROP TABLE IF EXISTS `ss_job_project`;
CREATE TABLE `ss_job_project` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `create_time` datetime DEFAULT NULL,
  `last_update_time` datetime DEFAULT NULL,
  `create_user_id` varchar(50) DEFAULT NULL,
  `last_update_user_id` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `rgdj` float DEFAULT NULL,
  `dj` float DEFAULT NULL,
  `cldj` float DEFAULT NULL,
  `remark` text,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_job_project
-- ----------------------------
INSERT INTO `ss_job_project` VALUES ('38b225fe5a114480871786afe272d739', '2013-08-28 15:08:05', '2013-10-09 20:10:40', '1', '1', '灌缝', 'm', '10', '50', '2', '', 'enabled');
INSERT INTO `ss_job_project` VALUES ('6514eb3c4e7443ce9903d819993ece88', null, '2013-10-09 20:10:44', null, '1', '沥青', 'M2', '2.2', '34', '2', '', 'enabled');
INSERT INTO `ss_job_project` VALUES ('a318b56f0d4d4423aad90da07e2430ce', '2013-08-28 11:21:08', '2013-10-09 20:10:49', '1', '1', '平石', 'm2', '10', '30', '2', '', 'enabled');
INSERT INTO `ss_job_project` VALUES ('d4584f91774f4de09a1b8901389ee346', null, '2013-10-09 20:10:53', null, '1', 'q', 'q', '3', '12.4', '2', '', 'enabled');
INSERT INTO `ss_job_project` VALUES ('fe070f3d70a04e46a15e05a9ae4e57a0', null, null, null, null, 'aaa', '', null, null, null, '', 'disabled');

-- ----------------------------
-- Table structure for ss_job_report
-- ----------------------------
DROP TABLE IF EXISTS `ss_job_report`;
CREATE TABLE `ss_job_report` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `content` text,
  `affix` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `job_id` varchar(50) DEFAULT NULL,
  `report_user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_job_report
-- ----------------------------
INSERT INTO `ss_job_report` VALUES ('144ea10095284b3b96b6750f7c586e4f', '啊实打实的\r\n按时大声大声道\r\n啊实打实的\r\nasdasdasdasdasd\r\n按时大声大声道', 'job/report/1362466093015', '2013-03-05 14:48:25', 'ab44dd7d6adf4f3eb01ab56617725332', '1');
INSERT INTO `ss_job_report` VALUES ('3914db8577b3414aad5923c8fc95efd8', '我来个汇报', 'job/report/1362469220843', '2013-03-05 15:40:28', 'd46ef398b5964fa59f7117c64d2da16b', '111c95d9938b4fc49ca88f7e0d09b6fb');
INSERT INTO `ss_job_report` VALUES ('46b05b2f6c324952bbedf57c7e95dc5d', '又完成了', 'job/report/1362461442921', '2013-03-05 13:30:55', 'ab44dd7d6adf4f3eb01ab56617725332', '1');
INSERT INTO `ss_job_report` VALUES ('bf8e096da601460ca2a7d02dd9f30869', null, 'job/report/1362461335750', '2013-03-05 13:29:13', 'ab44dd7d6adf4f3eb01ab56617725332', '1');
INSERT INTO `ss_job_report` VALUES ('ca3b0c68262b491a86d443e5849e63d2', '第一阶段已完成', 'job/report/1372409990515', '2013-06-28 17:00:05', '48121aa3a4194ce88f381262d77315ee', '1');

-- ----------------------------
-- Table structure for ss_job_sthuser
-- ----------------------------
DROP TABLE IF EXISTS `ss_job_sthuser`;
CREATE TABLE `ss_job_sthuser` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(50) DEFAULT NULL,
  `job_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_id` (`user_id`) USING BTREE,
  KEY `index_job_id` (`job_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_job_sthuser
-- ----------------------------
INSERT INTO `ss_job_sthuser` VALUES ('10667e53c0eb49a8ab0a903ce4cb6a08', '111c95d9938b4fc49ca88f7e0d09b6fb', '11053c774af9414592d997691da1aac2');
INSERT INTO `ss_job_sthuser` VALUES ('41d6e02d29ab4a16bd0b3ab5c0e5044a', '111c95d9938b4fc49ca88f7e0d09b6fb', '2308fab86f7d4066b448340324ec513f');
INSERT INTO `ss_job_sthuser` VALUES ('51450dd7f6734d4a9f212454b6e0bd9a', '045c8cec7da54274b3429560f2f1addf', '11053c774af9414592d997691da1aac2');
INSERT INTO `ss_job_sthuser` VALUES ('5d7c446d42f944908e51b02ceb56e8fe', '045c8cec7da54274b3429560f2f1addf', '2308fab86f7d4066b448340324ec513f');
INSERT INTO `ss_job_sthuser` VALUES ('843f244fec6d4fae8e18b6088e9fdc56', '045c8cec7da54274b3429560f2f1addf', 'ab44dd7d6adf4f3eb01ab56617725332');
INSERT INTO `ss_job_sthuser` VALUES ('a17fae7c8ff64c31b38658b17d90cdc7', '111c95d9938b4fc49ca88f7e0d09b6fb', 'd6d07113dc8e4f579c4214b4db53f12c');
INSERT INTO `ss_job_sthuser` VALUES ('c0f861d769b440f5a3dae68faa88c46d', '8f3f56ead9b94aa9992eb8619bf1d8e6', '48121aa3a4194ce88f381262d77315ee');
INSERT INTO `ss_job_sthuser` VALUES ('c2a855e11c1f46678330d6ab7890404a', '045c8cec7da54274b3429560f2f1addf', 'd6d07113dc8e4f579c4214b4db53f12c');
INSERT INTO `ss_job_sthuser` VALUES ('cf6fe3bbf9fe4039bc471c418ded378f', '045c8cec7da54274b3429560f2f1addf', '59c30e25f1044871a041ad826275741c');
INSERT INTO `ss_job_sthuser` VALUES ('e71bed632e7d42bca0c24f0223c544cf', '045c8cec7da54274b3429560f2f1addf', 'd46ef398b5964fa59f7117c64d2da16b');
INSERT INTO `ss_job_sthuser` VALUES ('eb01d5ba324c453383a0a9062b7e87f9', '111c95d9938b4fc49ca88f7e0d09b6fb', 'd46ef398b5964fa59f7117c64d2da16b');
INSERT INTO `ss_job_sthuser` VALUES ('ef2044322ff649a2ae610357afe0b9b0', '111c95d9938b4fc49ca88f7e0d09b6fb', '48121aa3a4194ce88f381262d77315ee');
INSERT INTO `ss_job_sthuser` VALUES ('f178190071ac4ba387dfa76dc3edabeb', '111c95d9938b4fc49ca88f7e0d09b6fb', 'ab44dd7d6adf4f3eb01ab56617725332');

-- ----------------------------
-- Table structure for ss_letter
-- ----------------------------
DROP TABLE IF EXISTS `ss_letter`;
CREATE TABLE `ss_letter` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `send_user` varchar(255) DEFAULT NULL COMMENT '发送者',
  `recep_user` varchar(255) DEFAULT NULL COMMENT '接收者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信';

-- ----------------------------
-- Records of ss_letter
-- ----------------------------
INSERT INTO `ss_letter` VALUES ('11f428cf6c684f97a47839662028cae9', '2015-04-24 10:22:41', '2015-04-24 10:22:41', '1', '1', 'enabled', '2015-04-24 10:22:41', '11', '111', 'admin胡', 'admin胡,北京寰宇,中石化,中石油,科大讯飞,苏灿,舍利子,龙源,ttt');
INSERT INTO `ss_letter` VALUES ('315ff8b104194345ac003dfca2a8f5d1', '2015-04-24 10:23:16', '2015-04-24 10:23:16', '1', '1', 'enabled', '2015-04-24 10:23:16', '11', '11', 'admin胡', 'admin胡,北京寰宇,中石化,中石油,科大讯飞,苏灿,舍利子,龙源,ttt');
INSERT INTO `ss_letter` VALUES ('5ff56271aeb747f4b52067e2090235c7', '2015-04-14 15:45:50', '2015-04-14 15:45:50', '1', '1', 'enabled', '2015-04-14 15:45:50', 'ddd', 'dddd', 'admin胡', 'admin胡,北京寰宇,中石化,中石油,科大讯飞,苏灿,舍利子,龙源');
INSERT INTO `ss_letter` VALUES ('c1c5f53f60d94072872e8bce95489dca', '2015-04-14 15:53:33', '2015-04-24 10:14:12', '1', '1', 'enabled', '2015-04-14 00:00:00', '您的申请审核成功', '祝你快乐', 'admin胡', 'admin胡,北京寰宇,中石化,中石油,科大讯飞,苏灿,舍利子,龙源,ttt');
INSERT INTO `ss_letter` VALUES ('d583e767230c497c94ff323706d93fd6', '2015-04-14 16:01:44', '2015-04-24 10:13:42', '1', '1', 'enabled', '2015-04-14 00:00:00', 'ff', 'fff', 'admin胡', 'admin胡,北京寰宇,中石化,中石油,科大讯飞,苏灿,舍利子,龙源');

-- ----------------------------
-- Table structure for ss_letter_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_letter_user`;
CREATE TABLE `ss_letter_user` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `letter_id` varchar(255) DEFAULT NULL COMMENT '站内短信ID',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `readflg` varchar(255) DEFAULT NULL COMMENT '已读标记',
  `recpflg` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信用户';

-- ----------------------------
-- Records of ss_letter_user
-- ----------------------------
INSERT INTO `ss_letter_user` VALUES ('0abb4766de714bd2ae5012dc117e5ef2', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', 'cc9a92e7eaf74e06bb4cc5bdcb9954e0', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('120c038026cc49be9a56aa4648bdd2b6', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', '1', 'Y', 'Y');
INSERT INTO `ss_letter_user` VALUES ('1321d76e64b241258d245ef65b9e5158', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', '5133c2ff86424f1baed0b498d55fd72b', 'N', 'Y');
INSERT INTO `ss_letter_user` VALUES ('1443376b7ebd40b39168b5ba183e0ee9', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', '5133c2ff86424f1baed0b498d55fd72b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('28ab55c2c257453b831347ce2b7be9a3', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', '9937fd26011b4b26a3f0c2489c249d16', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('2a604f10e58b4df692ae1ab8c9ec7ca4', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', '7fc0e40391fb462a8530b7eb9438824e', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('2d7581372a404c769fd553b92ff5ceff', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', 'e38f330a7f3440c88cbb237101f4c661', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('3b15eb70b2824e3496e29abcfc1ed2a8', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', '1', 'N', 'Y');
INSERT INTO `ss_letter_user` VALUES ('3f512d91bde24cf99a84d3497d2d0077', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', '9937fd26011b4b26a3f0c2489c249d16', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('43d296d59e4d4f6d8ba3ee4e0a24d119', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', 'ad426c437bd3487bab6bc21392524c18', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('49683bde30b6444cbb79c53994403100', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', 'ad426c437bd3487bab6bc21392524c18', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('49c75d9de1cd400fae39d3ef9263ec02', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', '9937fd26011b4b26a3f0c2489c249d16', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('4d7c8f3551bb48458ca0cd41fb711ce7', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', '3ff7249ea6dc444195dff508b744393b', 'Y', 'Y');
INSERT INTO `ss_letter_user` VALUES ('4f8ce12fb88646f1bafa75e810d9002d', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', '9937fd26011b4b26a3f0c2489c249d16', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('51875a54a49c4df493e7d87c8f31d914', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', '446ef08979da4d9e87ab6ad9ab4d4e8b', 'N', 'Y');
INSERT INTO `ss_letter_user` VALUES ('5b74f49939304ece8c201cfabebfa9f7', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', '1', 'Y', 'Y');
INSERT INTO `ss_letter_user` VALUES ('682a04e06ee94623a2bbe06a8a4e35b9', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', 'cc9a92e7eaf74e06bb4cc5bdcb9954e0', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('788a160b9c754114979fb3c109903cd9', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', 'ad426c437bd3487bab6bc21392524c18', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('7b0092a70ee546c5a95ae147305c7a17', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', 'e38f330a7f3440c88cbb237101f4c661', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('7d2423e66f2d47cab1d79b8d16d6492c', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', '3ff7249ea6dc444195dff508b744393b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('901438665b9e436bb12bcb202dbf5f3d', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', 'cc9a92e7eaf74e06bb4cc5bdcb9954e0', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('95b3e132d889436b827e99ca7b9ee48e', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', '446ef08979da4d9e87ab6ad9ab4d4e8b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('96d5e4c43e164c478bc9966aca81189e', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', '446ef08979da4d9e87ab6ad9ab4d4e8b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('998ac14f228248e18f291bcaf1ba01b9', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', '3ff7249ea6dc444195dff508b744393b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('a68b7b90cdc64c7181adaf1dd0fabd21', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', '5133c2ff86424f1baed0b498d55fd72b', 'Y', 'Y');
INSERT INTO `ss_letter_user` VALUES ('addf05ad1d504023badbe2334bedeff7', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', '7fc0e40391fb462a8530b7eb9438824e', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('b3cbcae3ee4545679f751cab9454e655', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', '7fc0e40391fb462a8530b7eb9438824e', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('bb8542f8b1484096af9df288b479e082', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', '3ff7249ea6dc444195dff508b744393b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('beb93645dd364a72b1d640932754270f', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', 'cc9a92e7eaf74e06bb4cc5bdcb9954e0', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('c697f93ab0234a8bba3a570a16d202e6', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', 'ad426c437bd3487bab6bc21392524c18', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('c7ada00e5d294a6e95389c5bae88f6ef', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', '5133c2ff86424f1baed0b498d55fd72b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('c8bed28e1da8498db915de300951068c', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', '3ff7249ea6dc444195dff508b744393b', 'Y', 'Y');
INSERT INTO `ss_letter_user` VALUES ('ca49fffb6d7b4d218caa26a6bfe87b25', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', '7fc0e40391fb462a8530b7eb9438824e', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('d1be7414473e4bf8b55ae3f7eb99bc78', null, null, null, null, 'enabled', 'd583e767230c497c94ff323706d93fd6', '446ef08979da4d9e87ab6ad9ab4d4e8b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('d433adec640c47698711663fa24f3955', null, null, null, null, 'enabled', '315ff8b104194345ac003dfca2a8f5d1', 'cc9a92e7eaf74e06bb4cc5bdcb9954e0', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('d5e19db2087147cdb6a56244f4cdcfa2', null, null, null, null, 'enabled', '5ff56271aeb747f4b52067e2090235c7', '7fc0e40391fb462a8530b7eb9438824e', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('dd6e03f823bd43e5ad4464cad69e56f6', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', '5133c2ff86424f1baed0b498d55fd72b', 'Y', 'Y');
INSERT INTO `ss_letter_user` VALUES ('e62692d7ae91453b8430b2be9369728b', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', '9937fd26011b4b26a3f0c2489c249d16', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('f5152574b7284287b4f9bf05c8af5e3d', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', '1', 'Y', 'Y');
INSERT INTO `ss_letter_user` VALUES ('fa1f1466c6ab488e97e7d86a3f4e44f8', null, null, null, null, 'enabled', 'c1c5f53f60d94072872e8bce95489dca', '446ef08979da4d9e87ab6ad9ab4d4e8b', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('fa9e0abbc36d45858cff0a055413860f', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', 'ad426c437bd3487bab6bc21392524c18', 'N', 'N');
INSERT INTO `ss_letter_user` VALUES ('fd8c673951d34831b71178d5c7790198', null, null, null, null, 'enabled', '11f428cf6c684f97a47839662028cae9', '1', 'Y', 'Y');

-- ----------------------------
-- Table structure for ss_log
-- ----------------------------
DROP TABLE IF EXISTS `ss_log`;
CREATE TABLE `ss_log` (
  `THREAD_NAME` varchar(255) DEFAULT NULL,
  `LOGGER_NAME` varchar(255) DEFAULT NULL,
  `LOG_TIME` timestamp NULL DEFAULT NULL,
  `LEVEL` varchar(20) DEFAULT NULL,
  `MESSAGE` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_log
-- ----------------------------
INSERT INTO `ss_log` VALUES ('catalina-exec-22', 'DBLogExample', '2013-09-06 14:18:50', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-22', 'DBLogExample', '2013-09-06 14:19:11', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-22', 'DBLogExample', '2013-09-06 14:19:34', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-78', 'DBLogExample', '2013-09-06 14:27:24', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-80', 'DBLogExample', '2013-09-06 14:31:37', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-80', 'DBLogExample', '2013-09-06 14:35:53', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-80', 'DBLogExample', '2013-09-06 14:38:09', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-80', 'DBLogExample', '2013-09-06 14:38:31', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-88', 'DBLogExample', '2013-09-06 14:43:00', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-88', 'DBLogExample', '2013-09-06 14:43:10', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2013-09-06 14:45:28', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-3', 'DBLogExample', '2013-09-06 14:49:44', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-13', 'DBLogExample', '2013-09-06 14:54:38', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-13', 'DBLogExample', '2013-09-06 14:55:07', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-55', 'DBLogExample', '2013-09-06 15:28:40', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-11', 'DBLogExample', '2013-09-06 15:37:00', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-11', 'DBLogExample', '2013-09-06 15:41:36', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-36', 'DBLogExample', '2013-09-06 15:44:11', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-52', 'DBLogExample', '2013-09-06 15:45:22', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2013-09-06 16:16:25', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2013-09-06 16:16:40', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-18', 'DBLogExample', '2013-09-06 16:29:37', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-26', 'DBLogExample', '2013-09-06 16:38:17', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-09-06 16:44:13', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-09-06 16:44:57', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-09-06 16:45:59', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-32', 'DBLogExample', '2013-11-18 20:00:40', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1384775402234\\障害表（北京）_2013-09-13.xlsx]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 10:09:22', 'INFO', 'admin删除文件[d:\\app\\zfxt\\thouse\\1385517708234\\logo2.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-57', 'DBLogExample', '2013-11-27 10:16:52', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-57', 'DBLogExample', '2013-11-27 10:16:54', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\start.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-56', 'DBLogExample', '2013-11-27 10:16:57', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\start(1).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-55', 'DBLogExample', '2013-11-27 10:16:59', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\logo2.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-57', 'DBLogExample', '2013-11-27 10:17:02', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\logo1.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-57', 'DBLogExample', '2013-11-27 10:17:04', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\65确认图片.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-88', 'DBLogExample', '2013-11-27 10:25:13', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-85', 'DBLogExample', '2013-11-27 10:25:15', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情(3).jpg]');
INSERT INTO `ss_log` VALUES ('Queue Consumer-dblog-1', 'DBLogExample', '2013-11-27 10:25:17', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情(2).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-85', 'DBLogExample', '2013-11-27 10:25:20', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情(1).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:06:52', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:06:54', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情(3).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:06:57', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情(2).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:06:59', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\无锡新区房管局-房源详情(1).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:07:02', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\start.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:07:04', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\start(2).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:07:05', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\start(1).jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2013-11-27 11:07:07', 'INFO', 'admin删除文件[d:\\app\\zfxt\\house\\1385517708234\\logo2.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-47', 'DBLogExample', '2013-11-27 11:07:10', 'INFO', 'admin删除文件[d:\\app\\zfxt\\thouse\\1385517708234\\无锡新区房管局-房源详情.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-70', 'DBLogExample', '2013-12-05 21:39:19', 'INFO', 'admin删除文件[d:\\app\\zfxt\\thouse\\1386250718265\\Orgbtn01.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-21', 'DBLogExample', '2013-12-24 20:46:26', 'INFO', 'admin删除文件[d:\\app\\zfxt\\undefined\\65确认图片.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-77', 'DBLogExample', '2014-01-17 13:20:10', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-74', 'DBLogExample', '2014-01-17 13:20:19', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2014-04-30 16:09:05', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-34', 'DBLogExample', '2014-05-13 11:17:55', 'INFO', 'admin删除文件[d:\\app\\zfxt\\post\\1399945220031\\upload.txt]');
INSERT INTO `ss_log` VALUES ('catalina-exec-34', 'DBLogExample', '2014-05-13 11:18:31', 'INFO', 'admin删除文件[d:\\app\\zfxt\\post\\1399945220031\\readme0226.txt]');
INSERT INTO `ss_log` VALUES ('catalina-exec-35', 'DBLogExample', '2014-05-13 11:20:49', 'INFO', 'admin删除文件[d:\\app\\zfxt\\post\\1399945220031\\当天工作.txt]');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2014-05-13 12:33:51', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-46', 'DBLogExample', '2014-06-03 13:55:09', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-64', 'DBLogExample', '2014-06-03 13:55:43', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-22', 'DBLogExample', '2014-06-03 16:16:19', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-95', 'DBLogExample', '2014-06-03 16:25:47', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-88', 'DBLogExample', '2014-06-03 16:26:46', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-55', 'DBLogExample', '2014-06-03 16:29:37', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-69', 'DBLogExample', '2014-06-03 16:31:01', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-96', 'DBLogExample', '2014-06-03 16:36:36', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-86', 'DBLogExample', '2014-06-03 16:45:55', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-95', 'DBLogExample', '2014-06-03 16:45:57', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2014-06-04 08:52:05', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-86', 'DBLogExample', '2014-06-04 08:56:28', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-81', 'DBLogExample', '2014-06-04 09:08:31', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-56', 'DBLogExample', '2014-06-04 09:26:12', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-58', 'DBLogExample', '2014-06-04 09:26:58', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-27', 'DBLogExample', '2014-06-04 09:37:08', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2014-06-04 09:55:22', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-43', 'DBLogExample', '2014-06-04 09:57:25', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-62', 'DBLogExample', '2014-06-04 10:36:24', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-95', 'DBLogExample', '2014-06-04 10:41:12', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-15', 'DBLogExample', '2014-06-05 13:18:23', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-9', 'DBLogExample', '2014-06-05 13:48:48', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-11', 'DBLogExample', '2014-06-05 13:48:59', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-12', 'DBLogExample', '2014-06-05 13:49:20', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2014-06-05 13:53:12', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-9', 'DBLogExample', '2014-06-05 13:58:51', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-34', 'DBLogExample', '2014-06-05 15:07:48', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-39', 'DBLogExample', '2014-06-05 15:08:26', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-49', 'DBLogExample', '2014-06-05 15:09:24', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-54', 'DBLogExample', '2014-06-05 15:10:00', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-61', 'DBLogExample', '2014-06-05 15:11:01', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-84', 'DBLogExample', '2014-06-06 14:42:16', 'INFO', 'admin删除文件[d:\\app\\iotjk\\undefined\\tyd.jpg]');
INSERT INTO `ss_log` VALUES ('catalina-exec-93', 'DBLogExample', '2014-06-06 14:43:31', 'INFO', 'admin删除文件[d:\\app\\iotjk\\undefined\\regional.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-79', 'DBLogExample', '2014-06-06 16:31:43', 'INFO', 'admin删除文件[d:\\app\\iotjk\\archite\\1402043321750\\regional.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-80', 'DBLogExample', '2014-06-06 16:31:45', 'INFO', 'admin删除文件[d:\\app\\iotjk\\archite\\1402043321750\\architecture.gif]');
INSERT INTO `ss_log` VALUES ('catalina-exec-63', 'DBLogExample', '2014-06-07 17:10:01', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-95', 'DBLogExample', '2014-06-07 17:55:54', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-36', 'DBLogExample', '2014-06-17 21:39:58', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-86', 'DBLogExample', '2014-06-18 10:37:23', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-99', 'DBLogExample', '2014-06-18 10:37:36', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2014-06-18 12:12:22', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2014-06-18 13:03:24', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-15', 'DBLogExample', '2014-06-18 13:03:52', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-28', 'DBLogExample', '2014-06-18 13:05:40', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-28', 'DBLogExample', '2014-06-18 13:06:16', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-26', 'DBLogExample', '2014-06-18 13:06:44', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-31', 'DBLogExample', '2014-06-18 13:07:36', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2014-06-18 13:08:09', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-42', 'DBLogExample', '2014-06-19 10:56:06', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-42', 'DBLogExample', '2014-06-19 10:56:20', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-80', 'DBLogExample', '2014-06-20 13:31:52', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-4', 'DBLogExample', '2014-06-20 13:40:16', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-5', 'DBLogExample', '2014-06-20 13:53:45', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-9', 'DBLogExample', '2014-06-20 13:54:21', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-5', 'DBLogExample', '2014-06-20 13:59:44', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2014-06-20 14:00:03', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-92', 'DBLogExample', '2014-06-20 16:13:40', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-87', 'DBLogExample', '2014-06-20 16:15:13', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-93', 'DBLogExample', '2014-06-20 16:15:15', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-18', 'DBLogExample', '2014-06-20 16:15:25', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2014-06-20 16:15:29', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-35', 'DBLogExample', '2014-06-21 13:46:14', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-58', 'DBLogExample', '2014-06-21 13:57:18', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-85', 'DBLogExample', '2014-06-21 14:45:44', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-69', 'DBLogExample', '2014-06-21 14:50:13', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-23', 'DBLogExample', '2014-06-28 15:01:24', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-23', 'DBLogExample', '2014-06-28 15:01:43', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-7', 'DBLogExample', '2014-06-28 15:11:20', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-9', 'DBLogExample', '2014-06-28 15:11:34', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-21', 'DBLogExample', '2014-06-28 15:24:13', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-29', 'DBLogExample', '2014-06-28 15:24:39', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-32', 'DBLogExample', '2014-06-28 15:25:17', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-11', 'DBLogExample', '2014-06-29 09:18:14', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-55', 'DBLogExample', '2014-06-29 10:06:06', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-32', 'DBLogExample', '2014-06-29 10:24:08', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2014-06-29 10:24:30', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-18', 'DBLogExample', '2014-07-01 15:22:09', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-18', 'DBLogExample', '2014-07-01 15:24:58', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-42', 'DBLogExample', '2014-07-01 15:25:07', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-18', 'DBLogExample', '2014-07-01 15:25:37', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-43', 'DBLogExample', '2014-07-01 15:26:38', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-43', 'DBLogExample', '2014-07-01 15:26:48', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-45', 'DBLogExample', '2014-07-01 15:27:03', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-43', 'DBLogExample', '2014-07-01 15:28:38', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-15', 'DBLogExample', '2014-07-02 09:10:27', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-10', 'DBLogExample', '2014-07-02 09:10:51', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-15', 'DBLogExample', '2014-07-17 09:21:44', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-1', 'DBLogExample', '2015-01-20 09:25:28', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-12', 'DBLogExample', '2015-01-20 09:47:39', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-9', 'DBLogExample', '2015-01-20 14:05:55', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-5', 'DBLogExample', '2015-03-27 21:02:30', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-25', 'DBLogExample', '2015-03-27 21:29:14', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-25', 'DBLogExample', '2015-03-27 21:31:06', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-25', 'DBLogExample', '2015-03-27 21:31:34', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-25', 'DBLogExample', '2015-03-27 21:32:07', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2015-03-27 21:32:42', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-27 21:42:30', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-27 21:52:10', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-27 21:53:15', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-17', 'DBLogExample', '2015-03-27 21:54:50', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-27 22:02:23', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-27 22:04:13', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-27 22:04:33', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-5', 'DBLogExample', '2015-03-27 22:05:18', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-5', 'DBLogExample', '2015-03-27 22:06:21', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-28 09:55:30', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-28 09:56:03', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-03-28 09:56:25', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-9', 'DBLogExample', '2015-03-29 16:13:17', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-9', 'DBLogExample', '2015-03-29 16:15:09', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2015-03-29 16:17:47', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2015-03-29 16:18:58', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2015-03-29 16:20:24', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2015-03-29 16:20:28', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-27', 'DBLogExample', '2015-03-29 16:21:53', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2015-03-29 16:28:36', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2015-03-29 16:29:35', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2015-03-29 16:30:14', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-37', 'DBLogExample', '2015-03-29 16:31:11', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-48', 'DBLogExample', '2015-03-29 16:32:28', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-48', 'DBLogExample', '2015-03-29 16:32:45', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-48', 'DBLogExample', '2015-03-29 16:39:13', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-62', 'DBLogExample', '2015-03-29 16:41:15', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-62', 'DBLogExample', '2015-03-29 16:41:34', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-62', 'DBLogExample', '2015-03-29 16:44:15', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-62', 'DBLogExample', '2015-03-29 16:46:37', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2015-03-29 16:55:10', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-10', 'DBLogExample', '2015-03-29 16:56:36', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-20', 'DBLogExample', '2015-03-29 17:06:43', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-5', 'DBLogExample', '2015-03-29 17:18:04', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-19', 'DBLogExample', '2015-03-29 17:20:37', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-5', 'DBLogExample', '2015-04-01 11:03:17', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-2', 'DBLogExample', '2015-04-01 11:08:52', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2015-04-01 11:09:07', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-8', 'DBLogExample', '2015-04-01 11:09:23', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-07 12:26:52', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-41', 'DBLogExample', '2015-04-08 13:49:59', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-41', 'DBLogExample', '2015-04-08 13:55:46', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-17', 'DBLogExample', '2015-04-08 14:12:49', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-17', 'DBLogExample', '2015-04-08 14:13:05', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-10 13:22:22', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-7', 'DBLogExample', '2015-04-13 17:12:44', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-4', 'DBLogExample', '2015-04-15 15:22:38', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-4', 'DBLogExample', '2015-04-15 15:22:56', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:36:56', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:38:19', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:38:28', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:38:48', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:39:13', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:39:22', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:40:05', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:40:11', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 15:40:25', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2015-04-15 15:41:30', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-16', 'DBLogExample', '2015-04-15 15:41:40', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-1', 'DBLogExample', '2015-04-15 16:04:17', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2015-04-15 16:07:03', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2015-04-15 16:07:12', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2015-04-15 16:07:26', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('catalina-exec-6', 'DBLogExample', '2015-04-15 16:07:38', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-4', 'DBLogExample', '2015-04-24 10:09:29', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-8', 'DBLogExample', '2015-04-24 10:10:39', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-8', 'DBLogExample', '2015-04-24 10:11:30', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-5', 'DBLogExample', '2015-05-04 22:28:56', 'INFO', 'helloworld!!');
INSERT INTO `ss_log` VALUES ('http-8080-5', 'DBLogExample', '2015-05-04 22:29:02', 'INFO', 'helloworld!!');

-- ----------------------------
-- Table structure for ss_member
-- ----------------------------
DROP TABLE IF EXISTS `ss_member`;
CREATE TABLE `ss_member` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `member_type_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_member
-- ----------------------------
INSERT INTO `ss_member` VALUES ('6ee83ae4af6f481a83abdae164f41dde', 'hzjun', null, '59495173f26ac88c7c0db7f1aef710d9b6413181', '3cd3e1e2f2e02732', null, 'enabled', '1');

-- ----------------------------
-- Table structure for ss_menu
-- ----------------------------
DROP TABLE IF EXISTS `ss_menu`;
CREATE TABLE `ss_menu` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `menu_id` varchar(30) DEFAULT NULL,
  `menu_name` varchar(128) NOT NULL,
  `menu_link` varchar(128) DEFAULT NULL,
  `parent_id` varchar(128) DEFAULT NULL,
  `sort_no` int(12) DEFAULT '0',
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_menu
-- ----------------------------
INSERT INTO `ss_menu` VALUES ('00547ab6730f4168abbdec72e51ff707', '', 'tttttttt', 'b', '214f63e32dc14a38a1f5ae827616ca26', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('024729adf03244269698f3c3f017689b', '00010007', '养护管理', '', '1', '5', 'disabled');
INSERT INTO `ss_menu` VALUES ('05c94fdb631547c9b419f94714c7003a', '0004', '坐标管理(模拟数据)', '/equipment/points', 'a18b10fd52634e6d8017d9bcd9acd1e2', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('0a3f43265986401fad926d8a0ee5452c', '', '设备机构分配', '/over/equipment-jg', 'a18b10fd52634e6d8017d9bcd9acd1e2', '5', 'disabled');
INSERT INTO `ss_menu` VALUES ('0af13862ed5c4a87b7b201986d25c5db', '0004', '已办事项', '/hflow/dealed.html', 'b3e52a4b106c44e180ebbcbbf60a5340', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('0bf67178fddb4c9ab4db27460b81dc40', '0001', '养护日志', '/nk/bringLog/list', '024729adf03244269698f3c3f017689b', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('0d4ecb68b83e47e4906839bfe717e3c8', '', '烦烦烦', 'c', '214f63e32dc14a38a1f5ae827616ca26', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('0d81511330b54e52b5763c0a3636fe59', '0006', 'sql监控', '/druid/dataSource', '2d46569b7df04444884170cb1ab8c539', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('1', '0001', '所有菜单', null, '0', '0', 'enabled');
INSERT INTO `ss_menu` VALUES ('11132c2e625748d68b5ee2c53516381f', '000100020006', '促销管理', '/promotion/promotion/list', '4', '6', 'disabled');
INSERT INTO `ss_menu` VALUES ('11fc280502f7499a978093135fae5a23', '0001', '模板管理', '/rp/postTemplate/list', '3a44f243822d47cfa88c27739313e939', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('12a7c21ed85947319187bb3512cf8510', '', '组织管理', '/iotjk/organ/list', '2', '4', 'disabled');
INSERT INTO `ss_menu` VALUES ('1314718e3a5147529da40b14ac213e1f', '', 'ffff', '', 'dd769aa1bd6644a7adcfeddb2eafc01a', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('14d583b203b94f518292fed0904cfb5a', '00010015', '统计分析', '', '1', '12', 'disabled');
INSERT INTO `ss_menu` VALUES ('1547c39421254855aa6b064c5ee3b4d6', '0001', '工程信息', '/nk/project/list', 'f8da37d306be41a1aab22e58bcfad33b', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('16c75aa0761343c589895a4c0a84b634', '0003', '地图监测（百度）', '/baidu/gisindex', 'acd31b8a94ce4ca8bf151c5ca94273ad', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('1889cea0616c4ef7b47fb7869c8ef0d7', '0002', '桥梁信息', '/nk/bridge/list', '8a82c074cc814351b3507d1e5628bf88', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('18bbd628f788468fa8bc9473fb1cb5df', '0001', '我的日程', '/sevent/list', '19f698abe2cc4577a380fc624de5abc4', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('19b299bcf3da47e5871f1a06338a6d82', '0001', '设备维护记录', '/maintain/list', 'acd31b8a94ce4ca8bf151c5ca94273ad', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('19f698abe2cc4577a380fc624de5abc4', '00010006', '办公管理', '', '1', '6', 'disabled');
INSERT INTO `ss_menu` VALUES ('1a46706d91cd43ea9d5f27218c4628c7', '0003', '作业项目设置', '/nk/jobProject/list', '024729adf03244269698f3c3f017689b', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('2', '00010001', '用户权限管理', '', '1', '19', 'enabled');
INSERT INTO `ss_menu` VALUES ('214f63e32dc14a38a1f5ae827616ca26', '0001', '二级菜单', '', 'dd769aa1bd6644a7adcfeddb2eafc01a', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('22bd8a2c89a742b6bfcfbccdefcabee8', '0012', '站点配置', '/stationConfig/create', '2d46569b7df04444884170cb1ab8c539', '11', 'enabled');
INSERT INTO `ss_menu` VALUES ('24311a409f194b7bb7facd4014464dac', '', '工单发布', '/iotjk/workOrder/list', 'cfac8a3df8b940e690f72860697b2b36', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('2517e03b0c4c47c388bdb0893cca12b4', '0002', '数据异常告警', '/alarm/list', 'acd31b8a94ce4ca8bf151c5ca94273ad', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('2d46569b7df04444884170cb1ab8c539', '00010003', '系统管理', '/main', '1', '20', 'enabled');
INSERT INTO `ss_menu` VALUES ('2e267cb380df458891a0bdfafe3c7030', '0002', '通知公告', '/infomation/noticelist', '19f698abe2cc4577a380fc624de5abc4', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('3', '000100010001', '用户管理', '/account/user/list', '2', '0', 'enabled');
INSERT INTO `ss_menu` VALUES ('3550a9d36dd646cdbed9b0b4c2a54376', '', '监控告警', '', '1', '25', 'disabled');
INSERT INTO `ss_menu` VALUES ('3989c843fbe34c1083c52a8c4281f43c', '0001', '流程设计', '/hflow/wflist.html', 'b3e52a4b106c44e180ebbcbbf60a5340', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('3a44f243822d47cfa88c27739313e939', '00010012', '公文管理', '', '1', '4', 'disabled');
INSERT INTO `ss_menu` VALUES ('3b5db06b9801403cb40dad3d67958675', '0021', '导入模板', '/upload/importTemplete', '2d46569b7df04444884170cb1ab8c539', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('3b76a06474d64ba3930bc22cfc9cf2d5', null, '基础信息管理', '', '1', '1', 'enabled');
INSERT INTO `ss_menu` VALUES ('4', '00010002', '产品管理', '', '1', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('417e1cfaad2147b191d13521f910e087', '0015', '技术演示', '/demo/index', '2d46569b7df04444884170cb1ab8c539', '5', 'disabled');
INSERT INTO `ss_menu` VALUES ('44c5d8dc4590412aa68c3cab96609cb8', '000100020002', '品牌管理', '/product/brand/list', '4', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('455b4fb41c9c430abe0e4140dff49673', '', '三级2', '', '214f63e32dc14a38a1f5ae827616ca26', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('4739559c001c4f17af27571ad8258873', '0004', '代办事项', '/wf/dotaskList', '19f698abe2cc4577a380fc624de5abc4', '4', 'disabled');
INSERT INTO `ss_menu` VALUES ('4b144058d07a486d9d9e3810f94f6708', '', '设备数据趋势列表', '/equipment/qsfxList', '14d583b203b94f518292fed0904cfb5a', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('4d46b90124ef4acbbbad06d8d91611db', '0007', '会议安排', '/boardroom/plan', '19f698abe2cc4577a380fc624de5abc4', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('5', '000100010002', '角色管理', '/account/role/list', '2', '1', 'enabled');
INSERT INTO `ss_menu` VALUES ('51d761f3bb71420496964adf60cbefab', '', '在线知识库', '/iotjk/knowledge/list', 'd77a4bf02d3e490fb713bdd410f50fa4', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('5408cd05c6034811bd6fa8e4eac1fb4d', '', '机车管理', '', '1', '26', 'disabled');
INSERT INTO `ss_menu` VALUES ('5de47bb3a8044939b9a8087a38bae632', '', '站房管理', '/iotjk/station/list', 'a18b10fd52634e6d8017d9bcd9acd1e2', '7', 'disabled');
INSERT INTO `ss_menu` VALUES ('5dfc4e4136d043dfb6ef0a8e8bd7eb6a', '0019', '短信账号', '/smsStep/create', '2d46569b7df04444884170cb1ab8c539', '11', 'disabled');
INSERT INTO `ss_menu` VALUES ('6', '000100010003', '菜单管理', '/account/menu/list', '2d46569b7df04444884170cb1ab8c539', '12', 'disabled');
INSERT INTO `ss_menu` VALUES ('65a71b41a0d342fdbfc29bd06292db7c', '0002', '流程启动', '/hflow/startflow.html', 'b3e52a4b106c44e180ebbcbbf60a5340', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('6790131e373741349e5c9fc13d111bcc', '0002', '设备信息管理', '/equipment/list', 'a18b10fd52634e6d8017d9bcd9acd1e2', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('6d81082df924462fbfb283302b8c9002', '0002', '发文拟稿', '/rp/postFile/todolist', '3a44f243822d47cfa88c27739313e939', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('6f97034e75c549d6adad95e0f56adb81', '0001', '订单管理', '/order/order/list', 'd95d945dbf4643c5a3b3dc3e8a3421ca', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('7', '000100020001', '分类管理', '/product/category/list', '4', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('762d1bc786f246f88179a1f2b1abd068', '', '邮箱配置', '/sys/emailConfig/create', 'e86a537f840e4a5881c00930ddfe3e89', '0', 'enabled');
INSERT INTO `ss_menu` VALUES ('778c5b21aa6a487a98d4e58eb858a589', '', '分类机构分配', '/over/parts-jg', 'a18b10fd52634e6d8017d9bcd9acd1e2', '6', 'disabled');
INSERT INTO `ss_menu` VALUES ('7849cd54767d4885a679d353101de57b', '', '我收到的工单', '/iotjk/workOrder/mylist', 'cfac8a3df8b940e690f72860697b2b36', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('7b325f6ed35246c9a30f8a8cf9b963d3', '0001', '组织机构管理', '/department/list', '8866963483214c288f035f44b5570ee0', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('8083e1068f654582af25253e9e9b1835', '000100020004', '产品类型', '/product/ptype/list', '4', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('8181dd537b9e466088e4c3892c3c5f4b', '000100010004', '权限管理', '/permission/list', '2', '3', 'enabled');
INSERT INTO `ss_menu` VALUES ('82e8727156ee4048a8907024c2adcaa9', '0003', '区域信息管理', '/regional/list', 'a18b10fd52634e6d8017d9bcd9acd1e2', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('83cd0e3c473c44889e9bce4280fa5836', '0006', '个人信息', '/account/user/userinfo', '19f698abe2cc4577a380fc624de5abc4', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('83f4be60951642ff9d280f59357ffa6b', '0018', 'logger设置', '/account/user/logger', '2d46569b7df04444884170cb1ab8c539', '6', 'disabled');
INSERT INTO `ss_menu` VALUES ('884d6712023a4abb830444b4f4145914', '0003', '小区管理', '/estate/list', '8a82c074cc814351b3507d1e5628bf88', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('8866963483214c288f035f44b5570ee0', '00010005', '组织机构管理', '', '1', '18', 'disabled');
INSERT INTO `ss_menu` VALUES ('8a82c074cc814351b3507d1e5628bf88', '00010009', '房源管理', '', '1', '7', 'disabled');
INSERT INTO `ss_menu` VALUES ('96e4be7b9410404bae0295a2d07d56ef', null, '巡检记录查询', '/history/list', '3b76a06474d64ba3930bc22cfc9cf2d5', '1', 'enabled');
INSERT INTO `ss_menu` VALUES ('981d4c14b5834985ab2f88093e1ca5b1', '', '外围系统', '/iotjk/peripSys/list', '2d46569b7df04444884170cb1ab8c539', '9', 'disabled');
INSERT INTO `ss_menu` VALUES ('99387d22c0334a00840d509385a9f9c7', '0002', '员工档案', '/employee/list', '8866963483214c288f035f44b5570ee0', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('9af3e8b2ac3a4deab2dd966daeb427b6', '', '区域管理', '/stationConfig/areaList', '2d46569b7df04444884170cb1ab8c539', '12', 'enabled');
INSERT INTO `ss_menu` VALUES ('9b3bdd1d1a8c451ab7ff417cb5f74ef7', '0001', '字典管理', '/config/dictionary/list', '2d46569b7df04444884170cb1ab8c539', '11', 'enabled');
INSERT INTO `ss_menu` VALUES ('9b7ae6b38cac457eb9eb2193e255f4f6', '', '我的信息', '/sys/letter/mylist', 'c71c9469becf49cebcb410ab9efebd65', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('9b847e7e366c4a2fb0a219c00d380f1e', '0003', '请假管理', '/oa/leave/apply', '19f698abe2cc4577a380fc624de5abc4', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('9dc93112e0c54965909b213a3fffbd52', '000100010005', '菜单管理', '/account/menu/mullist', '2d46569b7df04444884170cb1ab8c539', '0', 'enabled');
INSERT INTO `ss_menu` VALUES ('9df0855d17fd45f89761c563a8026d04', '', '地图监测（网程）', '/baidu/gisindexII', 'acd31b8a94ce4ca8bf151c5ca94273ad', '4', 'disabled');
INSERT INTO `ss_menu` VALUES ('9ecd99b9bbfc4d45b84f37615830f878', '0003', '代办事项', '/hflow/toDeal.html', 'b3e52a4b106c44e180ebbcbbf60a5340', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('9f75efb31a4143fc975b54191df57464', '0010', '打印模板', '/printTemp/list', '2d46569b7df04444884170cb1ab8c539', '5', 'disabled');
INSERT INTO `ss_menu` VALUES ('a18b10fd52634e6d8017d9bcd9acd1e2', '00010013', '基础信息管理', '', '1', '10', 'disabled');
INSERT INTO `ss_menu` VALUES ('a1f49e71793e4f5d8dcc60bc939bcda6', '0002', '养护月度填报', '/nk/bringMonth/list', '024729adf03244269698f3c3f017689b', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('a444c6696ec349d8b4e05b6b0832ecea', '000100020003', '规格管理', '/product/specification/list', '4', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('a44f9d984a504002a2d0a34c28fcdb20', '0002', '工程月度填报', '/nk/projectMonth/list', 'f8da37d306be41a1aab22e58bcfad33b', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('a7729b3e6f864d14b71d43253853d8e0', '0024', '操作日志', '/account/user/loglist', '2d46569b7df04444884170cb1ab8c539', '11', 'enabled');
INSERT INTO `ss_menu` VALUES ('a8d371dfe2ba4a299bc0fa6c03a4bba4', '', '发送记录', '/sys/emialSend/list', 'e86a537f840e4a5881c00930ddfe3e89', '1', 'enabled');
INSERT INTO `ss_menu` VALUES ('a977553a25c8481f90a4bbd8730fb640', '0016', '工作布置', '/job/list', '2d46569b7df04444884170cb1ab8c539', '7', 'disabled');
INSERT INTO `ss_menu` VALUES ('acd31b8a94ce4ca8bf151c5ca94273ad', '00010014', '监测管理', '', '1', '8', 'disabled');
INSERT INTO `ss_menu` VALUES ('b3aa7ba007ca4ca9828061ef6a6bce96', '', '任务管理', '/quartz/list', '2d46569b7df04444884170cb1ab8c539', '13', 'enabled');
INSERT INTO `ss_menu` VALUES ('b3e52a4b106c44e180ebbcbbf60a5340', '00010010', '工作流程', '', '1', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('b4a499c1c79a4fac8f9be394d8fcbb20', '0001', '设备查询', '/equipment/query', 'f59a64b38c1149fd907a61bae82c753a', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('b780877f2e7d4622b28f1e4da6680f70', '0006', '出租统计', '/houseRent/cztj', '8a82c074cc814351b3507d1e5628bf88', '4', 'disabled');
INSERT INTO `ss_menu` VALUES ('b83dfd0df715435a821efa9d2ee47a55', '', '监测列表', '/equipment/eqList', 'acd31b8a94ce4ca8bf151c5ca94273ad', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('b8eb9b0e6a5c4a3296473ed02426ce14', '', '机车信息', '/iotjk/locomotive/list', '5408cd05c6034811bd6fa8e4eac1fb4d', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('bb954d09b5834baa95c101033c69516b', '', '设备应用', '/iotjk/equipmentApp/list', 'a18b10fd52634e6d8017d9bcd9acd1e2', '8', 'disabled');
INSERT INTO `ss_menu` VALUES ('bf4dd630836d44179ce695d80cae9c71', '0001', '设备属性扩展管理', '/equipmentType/list', 'a18b10fd52634e6d8017d9bcd9acd1e2', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('c08bae2b310a41eeb61f9545ffa2ab32', '0005', '房源统计', '/houseRent/fytj', '8a82c074cc814351b3507d1e5628bf88', '4', 'disabled');
INSERT INTO `ss_menu` VALUES ('c1e3ad0a9a014f87a4cead25ec905de7', '0001', '房源信息', '/houseRent/list', '8a82c074cc814351b3507d1e5628bf88', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('c1f0375b5b27433abde7c5b466ebebd7', '', '再来个', 'd', '1314718e3a5147529da40b14ac213e1f', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('c25b81cd733a44809f125fa7360d38fa', '0004', '基本参数设置', '/alarmStep/create', 'acd31b8a94ce4ca8bf151c5ca94273ad', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('c2824606c2c74b90bcfa1656383bba4f', '0017', '流程管理', '/wf/tab', '2d46569b7df04444884170cb1ab8c539', '9', 'disabled');
INSERT INTO `ss_menu` VALUES ('c4975fa149c64ec380bc89725c16a76e', '0005', '流程启动', '/wf/start-list', '19f698abe2cc4577a380fc624de5abc4', '5', 'disabled');
INSERT INTO `ss_menu` VALUES ('c5d3a9278a8b4eda9c435d73c235f791', '0005', '机构管理', '/region/jglist', '8866963483214c288f035f44b5570ee0', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('c71c9469becf49cebcb410ab9efebd65', '', '站内信', '', '1', '24', 'disabled');
INSERT INTO `ss_menu` VALUES ('c8960daee9564e199ffdc614d5983ffe', '', '设备分类管理', '/iotjk/partsCategory/list', 'a18b10fd52634e6d8017d9bcd9acd1e2', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('cc11510eedef4eb3a2932a867789440a', '', '状态监测', '/equipment/ztjc', '3550a9d36dd646cdbed9b0b4c2a54376', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('cfac8a3df8b940e690f72860697b2b36', '', '工单管理', '', '1', '21', 'disabled');
INSERT INTO `ss_menu` VALUES ('d1cd800381174a9aaee609b369bc02e0', '0001', '设备数据趋势', '/equipment/qsfx', '14d583b203b94f518292fed0904cfb5a', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('d77a4bf02d3e490fb713bdd410f50fa4', '', '售后服务', '', '1', '22', 'disabled');
INSERT INTO `ss_menu` VALUES ('d95d945dbf4643c5a3b3dc3e8a3421ca', '00010004', '订单管理', '', '1', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('dc589edcc88748febb21ef2d19435674', '0007', '房屋管理', '/house/list', '8a82c074cc814351b3507d1e5628bf88', '5', 'disabled');
INSERT INTO `ss_menu` VALUES ('dc66ce835bc04d38a3cfc22234553f6a', '0003', '收文管理', '/rp/recepFile/list', '3a44f243822d47cfa88c27739313e939', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('dd391d0323d34a40ba9b318eaf9397d8', '00010018', '三级菜单', 'a', '214f63e32dc14a38a1f5ae827616ca26', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('dd769aa1bd6644a7adcfeddb2eafc01a', '00010017', '一级菜单', '', '1', '6', 'disabled');
INSERT INTO `ss_menu` VALUES ('e0030c524d6d4f5489bd9b377244512e', null, '二维码打印', '/equipment/list', '3b76a06474d64ba3930bc22cfc9cf2d5', '2', 'enabled');
INSERT INTO `ss_menu` VALUES ('e0813cee5145437fabe383996824d4b1', '0004', '部件管理', '/widget/list', '2d46569b7df04444884170cb1ab8c539', '10', 'disabled');
INSERT INTO `ss_menu` VALUES ('e14d15818dd646338a0b0df70f968de9', '0013', '分类管理', '/category/list', '2d46569b7df04444884170cb1ab8c539', '3', 'disabled');
INSERT INTO `ss_menu` VALUES ('e72a1d4a8a6b4188ac556321bc8e677a', '0007', '任务管理', '/quartz/list', '2d46569b7df04444884170cb1ab8c539', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('e86a537f840e4a5881c00930ddfe3e89', '', '邮箱管理', '', '1', '23', 'enabled');
INSERT INTO `ss_menu` VALUES ('e925a0fa57e146b7ab5f08649a1b1783', '0008', '户型图管理', '/houseImg/list', '8a82c074cc814351b3507d1e5628bf88', '7', 'disabled');
INSERT INTO `ss_menu` VALUES ('ebb88baa5cf4452d868d438806f4008d', '000100020005', '产品管理', '/product/product/list', '4', '4', 'disabled');
INSERT INTO `ss_menu` VALUES ('efbddd1f454c495c844f04bd051a99de', '', '发送记录', '/sys/letter/list', 'c71c9469becf49cebcb410ab9efebd65', '0', 'disabled');
INSERT INTO `ss_menu` VALUES ('f11e99748cff4cccb0969000983f9114', '', '服务日志', '/static/tools/getLog.jsp', '2d46569b7df04444884170cb1ab8c539', '14', 'enabled');
INSERT INTO `ss_menu` VALUES ('f244b5740a244f8ea008d06747db200e', '0020', '发送短信', '/smsStep/tosendMsg', '2d46569b7df04444884170cb1ab8c539', '12', 'disabled');
INSERT INTO `ss_menu` VALUES ('f2471687e2524ce4a33ed849bd2ac3dd', '0004', '待审核房源', '/houseRent/auditlist', '8a82c074cc814351b3507d1e5628bf88', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('f27fcdf9cb384c9b90654478da3b5343', '', '机车绑定', '/iotjk/locomotive/bd', '5408cd05c6034811bd6fa8e4eac1fb4d', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('f472f488d6144fbea0628e4922954e79', null, '设备管理', '/equipment/list', '3b76a06474d64ba3930bc22cfc9cf2d5', '0', 'enabled');
INSERT INTO `ss_menu` VALUES ('f5186a15850b4ddfa9307e5aad584c9d', '0003', '区划管理', '/region/list', '8866963483214c288f035f44b5570ee0', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('f59a64b38c1149fd907a61bae82c753a', '00010016', '综合查询', '', '1', '7', 'disabled');
INSERT INTO `ss_menu` VALUES ('f8da37d306be41a1aab22e58bcfad33b', '00010008', '工程管理', '', '1', '6', 'disabled');
INSERT INTO `ss_menu` VALUES ('f9c56a6fc567471698f7ef0a0c33cc5e', '', '维护管理', '/mainten/maintenIndex', 'd77a4bf02d3e490fb713bdd410f50fa4', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('fb98a2c309fd48349debd84398c15ddd', '0014', '知识库', '/fileStore/list', '2d46569b7df04444884170cb1ab8c539', '9', 'disabled');
INSERT INTO `ss_menu` VALUES ('fc51fbd0974c41fb8b1829bf06b41902', '', '新测试', 'abc', 'f59a64b38c1149fd907a61bae82c753a', '1', 'disabled');
INSERT INTO `ss_menu` VALUES ('fdb26159a14d494fa59b32b1c3cd2112', '0023', '区域管理', '/stationConfig/areaList', '2d46569b7df04444884170cb1ab8c539', '2', 'disabled');
INSERT INTO `ss_menu` VALUES ('fdf9c95600c64da2a6b59a4e15c55d6a', '0022', 'html模板', '/htmlTemplate/list', '2d46569b7df04444884170cb1ab8c539', '8', 'disabled');

-- ----------------------------
-- Table structure for ss_permission
-- ----------------------------
DROP TABLE IF EXISTS `ss_permission`;
CREATE TABLE `ss_permission` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `val` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `menu_id` varchar(50) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_permission
-- ----------------------------
INSERT INTO `ss_permission` VALUES ('11d2b77caa814921937f044cacc15b4b', 'user:edit', '编辑用户', '3', 'enabled');
INSERT INTO `ss_permission` VALUES ('142ea153b32045bbb0e0c2b7aebc5727', 'role:add', '角色添加', '5', 'disabled');
INSERT INTO `ss_permission` VALUES ('236d03e9dbe4482897da0be1b9607817', 'role:del', '删除角色', '5', 'disabled');
INSERT INTO `ss_permission` VALUES ('306d0b3b927645a2b83d84a27eb7d749', 'role:edit', '编辑角色', '5', 'enabled');
INSERT INTO `ss_permission` VALUES ('3fcad9d187f84c23b922073c6b0b0337', 'permi:edit', '编辑权限', '8181dd537b9e466088e4c3892c3c5f4b', 'enabled');
INSERT INTO `ss_permission` VALUES ('41a3e760337c4fd2a720aa28f2e2c63c', 'user:del', '删除用户', '3', 'disabled');
INSERT INTO `ss_permission` VALUES ('4de0985103ed4578af59c462406045e5', 'menu:edit', ' 编辑菜单', '6', 'enabled');
INSERT INTO `ss_permission` VALUES ('75dcf3faf97341aeba45d06fb539e34d', 'employee:edit', '编辑员工', '99387d22c0334a00840d509385a9f9c7', 'enabled');
INSERT INTO `ss_permission` VALUES ('81327a876e63400dbd91f86cd932fc1f', 'department:edit', '编辑部门', '7b325f6ed35246c9a30f8a8cf9b963d3', 'enabled');
INSERT INTO `ss_permission` VALUES ('9ef618b55aa84754a7cc6623527e8d1c', 'role:disMenu', '分配菜单', '5', 'enabled');
INSERT INTO `ss_permission` VALUES ('9f075953063f4eb6bf7b3e498daa685d', 'notice:edit', '编辑公告', '2e267cb380df458891a0bdfafe3c7030', 'enabled');
INSERT INTO `ss_permission` VALUES ('a8288de5f1ac4ba09c9fdd3c613203b8', 'menu:del', '删除菜单', '6', 'disabled');
INSERT INTO `ss_permission` VALUES ('b47f37219347459d857f3da0fb8f803e', 'role:disUser', '分配用户', '5', 'enabled');
INSERT INTO `ss_permission` VALUES ('b82b3127ffc64bff868a8fc943a06161', 'permi:del', '删除权限', '8181dd537b9e466088e4c3892c3c5f4b', 'disabled');
INSERT INTO `ss_permission` VALUES ('bc3710403cf248ae8f3fa811b215c592', 'fileStore:edit', '知识库编辑', 'fb98a2c309fd48349debd84398c15ddd', 'enabled');
INSERT INTO `ss_permission` VALUES ('c388166911444edf92dcbadb001d9542', 'notice:edit', '编辑公告', '2e267cb380df458891a0bdfafe3c7030', 'enabled');
INSERT INTO `ss_permission` VALUES ('df72e048298647bd99ece8bca4294fc9', 'user:nadd', '添加用户', '3', 'disabled');

-- ----------------------------
-- Table structure for ss_pos_widget_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_pos_widget_user`;
CREATE TABLE `ss_pos_widget_user` (
  `id` varchar(50) NOT NULL,
  `userId` varchar(50) NOT NULL,
  `widgetId` varchar(50) DEFAULT NULL,
  `col` int(11) DEFAULT NULL,
  `row` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_pos_widget_user
-- ----------------------------
INSERT INTO `ss_pos_widget_user` VALUES ('03af91229b834abfbbd88142a37064b9', '1', '7c76fc1b7f2644c89fc79af64329278c', '0', '1');
INSERT INTO `ss_pos_widget_user` VALUES ('52a11546791d456aba935414cad122bb', '1', 'f9ba5c9d0f174ba1beb43e2b40c96752', '1', '0');
INSERT INTO `ss_pos_widget_user` VALUES ('666fbbe06a9341f4b48f29a6d2d47dc9', '41505e5dabe14303b4dbc91dacd4b9a0', 'c0c9bf1b590141e8a28d3da98591583b', '1', '0');
INSERT INTO `ss_pos_widget_user` VALUES ('6ae43d34d33d467ea9b74dd0ff4f04a5', '41505e5dabe14303b4dbc91dacd4b9a0', 'c83e1793f9f04dc890bf15f4c6c654fc', '0', '1');
INSERT INTO `ss_pos_widget_user` VALUES ('6c210c6130e14703af291c15e5ad5685', '1', '314e8444c03b4a1fba7d5b17d019eed6', '0', '1');
INSERT INTO `ss_pos_widget_user` VALUES ('6ee548b8b05b44c9bf9b92f40a55e327', '41505e5dabe14303b4dbc91dacd4b9a0', '7c76fc1b7f2644c89fc79af64329278c', '0', '0');
INSERT INTO `ss_pos_widget_user` VALUES ('78dd10c83ca649078485c2485cdbcaa2', '1', 'c83e1793f9f04dc890bf15f4c6c654fc', '1', '1');
INSERT INTO `ss_pos_widget_user` VALUES ('932c961a184e4d2f9f9ef0751d8b554e', '1', 'ea5303a71406436da1a6cc5e7137be1d', '0', '4');
INSERT INTO `ss_pos_widget_user` VALUES ('a33c7ccf80dd4b42bd600f8b877b71c9', '1', '0ed0d750d1b0436d89ef1a4b2b33e443', '0', '0');
INSERT INTO `ss_pos_widget_user` VALUES ('a842f32bed05425b96c27a8ebfbc5be3', '41505e5dabe14303b4dbc91dacd4b9a0', 'ea5303a71406436da1a6cc5e7137be1d', '1', '2');
INSERT INTO `ss_pos_widget_user` VALUES ('c55c34e3730743d68277bebb4fdc39cf', '1', 'c0c9bf1b590141e8a28d3da98591583b', '0', '0');
INSERT INTO `ss_pos_widget_user` VALUES ('e1748c130462462bad6071593aaf5140', '41505e5dabe14303b4dbc91dacd4b9a0', 'f9ba5c9d0f174ba1beb43e2b40c96752', '1', '1');

-- ----------------------------
-- Table structure for ss_recycle
-- ----------------------------
DROP TABLE IF EXISTS `ss_recycle`;
CREATE TABLE `ss_recycle` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `tablec` varchar(255) NOT NULL COMMENT '表名',
  `table_name` varchar(255) NOT NULL COMMENT '表中文名',
  `col` varchar(255) DEFAULT NULL COMMENT '列名称',
  `col_name` varchar(255) NOT NULL COMMENT '列中文名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='回收站';

-- ----------------------------
-- Records of ss_recycle
-- ----------------------------
INSERT INTO `ss_recycle` VALUES ('00010006', '2014-06-30 10:31:54', null, '1', null, 'ss_department', '部门表', 'ffff', 'name');
INSERT INTO `ss_recycle` VALUES ('0af4107f21a44dc893ca314868d93024', '2014-09-13 20:49:40', null, '1', null, 'iotjk_parts_category', '部件分类', 'aa', 'name');
INSERT INTO `ss_recycle` VALUES ('0cfd2c9a7a0c49b9bccde978103dd3cd', '2014-12-10 13:32:28', null, '1', null, 'iotjk_parts_category', '部件分类', 'ffff', 'name');
INSERT INTO `ss_recycle` VALUES ('4911dc682e6348719a2b7a4cddb6541c', '2014-09-13 20:56:14', null, '1', null, 'iotjk_parts_category', '部件分类', 'aaaa', 'name');
INSERT INTO `ss_recycle` VALUES ('6577aef74e17424fb78b0e48743669ef', '2014-12-10 13:29:12', null, '1', null, 'iotjk_parts_category', '部件分类', 'saddsadsasad', 'name');
INSERT INTO `ss_recycle` VALUES ('7153347f00604fdebe81aee95271f60d', '2014-12-10 17:03:42', null, '1', null, 'iotjk_parts_category', '部件分类', 'XXX仪表', 'name');
INSERT INTO `ss_recycle` VALUES ('74c0e3596a0944cba01b76d2234ec60e', '2014-12-10 13:31:43', null, '1', null, 'iotjk_parts_category', '部件分类', 'dd', 'name');
INSERT INTO `ss_recycle` VALUES ('9732ca0368814ac8a7649111205ee4a2', '2014-07-02 15:22:32', null, '1', null, 'wl_test', '测试', 'asdasd', 'name');
INSERT INTO `ss_recycle` VALUES ('9d8c853a70d84bbcbdf366a5d9e05275', '2014-12-10 13:31:43', null, '1', null, 'iotjk_parts_category', '部件分类', 'dd', 'name');
INSERT INTO `ss_recycle` VALUES ('c26a56d6010e4b57b626300ae510ca06', '2014-12-10 13:31:43', null, '1', null, 'iotjk_parts_category', '部件分类', 'dd', 'name');
INSERT INTO `ss_recycle` VALUES ('c6a24085ab444f27b87e09842db11982', '2014-12-10 13:31:43', null, '1', null, 'iotjk_parts_category', '部件分类', 'ff', 'name');
INSERT INTO `ss_recycle` VALUES ('c6ba887a1d504c69a8d5d3f07342e5ed', '2014-12-10 13:32:03', null, '1', null, 'iotjk_parts_category', '部件分类', 'ddd', 'name');
INSERT INTO `ss_recycle` VALUES ('c916b29a94e74b78ab7519c771297663', '2014-09-13 21:14:58', null, '1', null, 'iotjk_parts_category', '部件分类', 'fgggg', 'name');
INSERT INTO `ss_recycle` VALUES ('d3b47b25e1244b4f83bce89cddde2d2c', '2014-12-10 13:36:11', null, '1', null, 'iotjk_parts_category', '部件分类', '工业仪表', 'name');
INSERT INTO `ss_recycle` VALUES ('e9ae247bd5124485a14c22bfc565233e', '2014-12-10 13:28:33', null, '1', null, 'iotjk_parts_category', '部件分类', 'sdfsdfdsf', 'name');
INSERT INTO `ss_recycle` VALUES ('fd3e98da34764a0da48c6f96be252dad', '2014-09-17 15:58:02', null, '1', null, 'iotjk_parts_category', '部件分类', '立交桥', 'name');

-- ----------------------------
-- Table structure for ss_region
-- ----------------------------
DROP TABLE IF EXISTS `ss_region`;
CREATE TABLE `ss_region` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `name` varchar(255) NOT NULL COMMENT '区划名称',
  `code` varchar(255) DEFAULT NULL COMMENT '区划编码',
  `regid` varchar(255) DEFAULT NULL COMMENT 'like ID',
  `parent_id` varchar(255) DEFAULT NULL COMMENT '父区划ID',
  `status` varchar(50) DEFAULT NULL,
  `widgets` varchar(3000) DEFAULT NULL,
  `rtype` varchar(10) DEFAULT NULL,
  `sort_no` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_region
-- ----------------------------
INSERT INTO `ss_region` VALUES ('0001', null, null, null, null, '所有区划', null, null, null, 'enabled', null, 'qh', null);
INSERT INTO `ss_region` VALUES ('00010001', '2014-06-05 12:54:03', '2014-06-05 14:40:43', '1', '1', '环保局', '123', null, '0001', 'disabled', '0ed0d750d1b0436d89ef1a4b2b33e443,7c76fc1b7f2644c89fc79af64329278c', 'qh', null);
INSERT INTO `ss_region` VALUES ('000100010001', '2014-09-13 17:58:37', '2014-09-13 17:58:37', '1', '1', 'sdfsdf', '', null, '00010001', 'disabled', null, 'qh', null);
INSERT INTO `ss_region` VALUES ('00010002', '2014-06-05 12:55:36', '2014-06-05 14:41:08', '1', '1', '能源局', '123', null, '0001', 'disabled', '7c76fc1b7f2644c89fc79af64329278c', 'qh', null);
INSERT INTO `ss_region` VALUES ('000100020001', '2014-09-13 17:59:21', '2014-09-13 17:59:21', '1', '1', 'hhhhhhhhhhhh', '', null, '00010002', 'disabled', null, 'qh', null);
INSERT INTO `ss_region` VALUES ('00010003', '2014-06-05 12:55:56', '2014-06-05 13:34:14', '1', '1', '国土局', '', null, '0001', 'disabled', null, 'qh', null);
INSERT INTO `ss_region` VALUES ('00010004', '2014-06-18 19:13:02', '2014-12-10 09:29:53', '1', '1', '北京市', '110000', null, '0001', 'enabled', null, 'qh', null);
INSERT INTO `ss_region` VALUES ('000100040001', '2014-06-18 19:13:24', '2014-07-01 15:32:03', '1', '5630bd42c78041ab80b4d5e849690483', '蠡湖街道', '', null, '00010004', 'disabled', '0ed0d750d1b0436d89ef1a4b2b33e443,314e8444c03b4a1fba7d5b17d019eed6', 'qh', null);
INSERT INTO `ss_region` VALUES ('0001000400010001', '2014-06-19 09:32:32', '2014-09-10 19:30:21', '1', '1', '蠡湖街道委办局', '2013', null, '000100040001', 'disabled', null, 'jg', null);
INSERT INTO `ss_region` VALUES ('00010004000100010001', '2014-06-28 14:53:15', '2014-06-28 14:53:15', '1', '1', 'ffff', null, null, '0001000400010001', 'disabled', null, 'jg', null);
INSERT INTO `ss_region` VALUES ('0001000400010002', '2014-07-02 09:39:12', '2014-07-02 09:39:12', '45e1b69ced704f9c9184344fea2aa700', '45e1b69ced704f9c9184344fea2aa700', '河北', null, null, '000100040001', 'disabled', null, 'jg', null);
INSERT INTO `ss_region` VALUES ('00010004000100020001', '2014-07-02 09:39:56', '2014-07-02 09:39:56', '45e1b69ced704f9c9184344fea2aa700', '45e1b69ced704f9c9184344fea2aa700', '河北II', null, null, '0001000400010002', 'disabled', null, 'jg', null);
INSERT INTO `ss_region` VALUES ('000100040002', '2014-06-28 15:42:50', '2014-06-28 15:42:50', '1', '1', '马山街道', '', null, '00010004', 'disabled', null, 'qh', null);
INSERT INTO `ss_region` VALUES ('000100040003', '2014-12-10 09:30:20', '2014-12-10 09:30:20', '1', '1', '门头沟区', '110109', null, '00010004', 'enabled', null, 'qh', null);
INSERT INTO `ss_region` VALUES ('0001000400030001', '2014-12-10 10:20:27', '2014-12-10 11:26:33', '1', '1', '科学技术委员会', 'STC', null, '000100040003', 'enabled', 'c0c9bf1b590141e8a28d3da98591583b,f9ba5c9d0f174ba1beb43e2b40c96752', 'jg', null);
INSERT INTO `ss_region` VALUES ('00010005', '2014-06-21 15:06:49', '2014-06-21 15:06:49', '1', '1', '锡山区', '', null, '0001', 'disabled', null, 'qh', null);

-- ----------------------------
-- Table structure for ss_role
-- ----------------------------
DROP TABLE IF EXISTS `ss_role`;
CREATE TABLE `ss_role` (
  `widgets` varchar(3000) DEFAULT NULL,
  `permissions` varchar(3000) DEFAULT NULL,
  `status` varchar(32) NOT NULL,
  `id` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL,
  `alias` varchar(50) DEFAULT NULL,
  `remark` text,
  `regionId` varchar(50) DEFAULT NULL,
  `jgId` varchar(50) DEFAULT NULL,
  `organId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_role
-- ----------------------------
INSERT INTO `ss_role` VALUES (null, null, 'enabled', '276ea7451f084c0199bd60e1de9d1060', '巡检员角色', '巡检员角色', '只具备巡检员权限', null, null, null);
INSERT INTO `ss_role` VALUES (null, '', 'enabled', 'da8408bb19ca443bb5072823669283d6', '管理员角色', '管理员角色', '具备管理员权限', null, null, null);

-- ----------------------------
-- Table structure for ss_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `ss_role_menu`;
CREATE TABLE `ss_role_menu` (
  `role_id` varchar(50) NOT NULL DEFAULT '',
  `menu_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`,`menu_id`),
  KEY `FK1306854B4BFAA23E` (`role_id`) USING BTREE,
  KEY `FK1306854BF125681E` (`menu_id`) USING BTREE,
  CONSTRAINT `ss_role_menu_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `ss_role` (`id`),
  CONSTRAINT `ss_role_menu_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `ss_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_role_menu
-- ----------------------------
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', '1');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', '24311a409f194b7bb7facd4014464dac');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', '51d761f3bb71420496964adf60cbefab');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', '7849cd54767d4885a679d353101de57b');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', '9b7ae6b38cac457eb9eb2193e255f4f6');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', 'c71c9469becf49cebcb410ab9efebd65');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', 'cfac8a3df8b940e690f72860697b2b36');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', 'd77a4bf02d3e490fb713bdd410f50fa4');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', 'efbddd1f454c495c844f04bd051a99de');
INSERT INTO `ss_role_menu` VALUES ('276ea7451f084c0199bd60e1de9d1060', 'f9c56a6fc567471698f7ef0a0c33cc5e');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '1');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '2');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '22bd8a2c89a742b6bfcfbccdefcabee8');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '2d46569b7df04444884170cb1ab8c539');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '3');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '3b76a06474d64ba3930bc22cfc9cf2d5');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '5');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '762d1bc786f246f88179a1f2b1abd068');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '8181dd537b9e466088e4c3892c3c5f4b');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '96e4be7b9410404bae0295a2d07d56ef');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '9af3e8b2ac3a4deab2dd966daeb427b6');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '9b3bdd1d1a8c451ab7ff417cb5f74ef7');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', '9dc93112e0c54965909b213a3fffbd52');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', 'a7729b3e6f864d14b71d43253853d8e0');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', 'a8d371dfe2ba4a299bc0fa6c03a4bba4');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', 'b3aa7ba007ca4ca9828061ef6a6bce96');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', 'e0030c524d6d4f5489bd9b377244512e');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', 'e86a537f840e4a5881c00930ddfe3e89');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', 'f11e99748cff4cccb0969000983f9114');
INSERT INTO `ss_role_menu` VALUES ('da8408bb19ca443bb5072823669283d6', 'f472f488d6144fbea0628e4922954e79');

-- ----------------------------
-- Table structure for ss_sms
-- ----------------------------
DROP TABLE IF EXISTS `ss_sms`;
CREATE TABLE `ss_sms` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `user_login_name` varchar(255) DEFAULT NULL,
  `seq_id` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `send_user_id` varchar(255) DEFAULT NULL,
  `create_time_id` varchar(50) DEFAULT NULL,
  `stype` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_sms
-- ----------------------------
INSERT INTO `ss_sms` VALUES ('3d4ce91492654a9a8c61b490b768fbca', 'lk0248', '13395117782', '长时间开车还是很累的', '1', '2013-06-27 12:37:29', 'send');
INSERT INTO `ss_sms` VALUES ('9cda0159dfdf4ce2aa2f83eb0cfd7ebe', null, '13395117782', '怎么查不到回复啊？', null, '2013-06-27 12:44:26', 'receive');
INSERT INTO `ss_sms` VALUES ('db0d64dae922477894638fb2f2cbfd66', null, '13395117782', '是啊，要小心哦', null, '2013-06-27 12:38:49', 'receive');

-- ----------------------------
-- Table structure for ss_sms_step
-- ----------------------------
DROP TABLE IF EXISTS `ss_sms_step`;
CREATE TABLE `ss_sms_step` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `account` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `port` varchar(255) DEFAULT NULL,
  `passwd` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `server_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_sms_step
-- ----------------------------
INSERT INTO `ss_sms_step` VALUES ('5c67b1dd94954e34897cf61baf10f775', '0510C00029661', '202.102.41.101', '9005', 'jy662981', '051087563005', 'http://localhost:8088/uisp');

-- ----------------------------
-- Table structure for ss_station_config
-- ----------------------------
DROP TABLE IF EXISTS `ss_station_config`;
CREATE TABLE `ss_station_config` (
  `id` varchar(255) NOT NULL DEFAULT '',
  `auth_code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `smsName` varchar(255) DEFAULT NULL,
  `smsPasswd` varchar(255) DEFAULT NULL,
  `company_name` varchar(300) DEFAULT NULL,
  `company_address` varchar(500) DEFAULT NULL,
  `company_tel` varchar(100) DEFAULT NULL,
  `fail_count` int(11) DEFAULT NULL,
  `pointx` varchar(50) DEFAULT NULL,
  `pointy` varchar(50) DEFAULT NULL,
  `auth_data` varchar(10) DEFAULT NULL,
  `intro` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_station_config
-- ----------------------------
INSERT INTO `ss_station_config` VALUES ('87bfb548e4b3478683cc0cbe4f07f449', 'Y', '消防巡检系统', 'D:\\bsxf', 'nzb', '0000', '', '', '', '0', '119.983784', '31.818005', 'Y', '<p>\r\n	博世集团的联系方式（联系信息Email：binnz_java@163.com、电话：13861061396 地址：江苏常州）</p>\r\n');

-- ----------------------------
-- Table structure for ss_user
-- ----------------------------
DROP TABLE IF EXISTS `ss_user`;
CREATE TABLE `ss_user` (
  `id` varchar(50) NOT NULL DEFAULT '',
  `login_name` varchar(255) NOT NULL COMMENT '登录名',
  `name` varchar(64) DEFAULT NULL COMMENT '真实姓名',
  `user_type` varchar(64) DEFAULT NULL COMMENT '用户类型',
  `password` varchar(255) DEFAULT NULL COMMENT '密码,默认123456',
  `email` varchar(128) DEFAULT NULL COMMENT '邮箱',
  `status` varchar(32) DEFAULT NULL COMMENT '状态',
  `create_time` datetime DEFAULT NULL COMMENT '创建日期',
  `is_lock` int(11) DEFAULT NULL COMMENT '是否重复登录，提供锁功能',
  `lock_time` varchar(100) DEFAULT NULL COMMENT '锁定时间',
  `phone_no` varchar(100) DEFAULT NULL COMMENT '手机号',
  `card_no` varchar(100) DEFAULT NULL COMMENT '身份证',
  `exp_date` date DEFAULT NULL COMMENT '用户过期日期',
  PRIMARY KEY (`id`),
  KEY `login_name` (`login_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_user
-- ----------------------------
INSERT INTO `ss_user` VALUES ('1', 'will', 'will', '0', '4a7d1ed414474e4033ac29ccb8653d9b', 'binnz_java@163.com', 'enabled', null, null, '2013-11-17 19:27:11', '', '', '2015-05-28');
INSERT INTO `ss_user` VALUES ('242836a8123a4c829707527845e337cb', '巡检员1', '巡检员1', '1', '4a7d1ed414474e4033ac29ccb8653d9b', '', 'enabled', '2019-09-05 17:39:02', null, null, '', '', '2022-10-05');
INSERT INTO `ss_user` VALUES ('cd0154dddbff4c6786bb7859cb03ed28', 'admin', '管理员', '0', '4a7d1ed414474e4033ac29ccb8653d9b', '', 'enabled', '2019-09-05 17:41:59', null, null, '', '', null);

-- ----------------------------
-- Table structure for ss_user_log
-- ----------------------------
DROP TABLE IF EXISTS `ss_user_log`;
CREATE TABLE `ss_user_log` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `user_id` varchar(255) NOT NULL COMMENT '用户id',
  `ip` varchar(255) NOT NULL COMMENT 'ip地址',
  `log_time` datetime NOT NULL COMMENT '动作时间',
  `log_type` varchar(255) NOT NULL COMMENT '登录或登出',
  `session_id` varchar(50) DEFAULT NULL,
  `log_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_user_log
-- ----------------------------
INSERT INTO `ss_user_log` VALUES ('00a1e6c8f66b47bf92814ba34ffa59aa', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-20 13:08:58', '0', '2703E057412FD543FDFAA03D457B7F7B', '4');
INSERT INTO `ss_user_log` VALUES ('00effdaf82344d9885272efa1542da11', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 11:10:28', '0', '4503B3559B86BABE66DFF9B192100F7F', '31');
INSERT INTO `ss_user_log` VALUES ('00f9f6c604c74f678ee21c86597244a5', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-18 17:40:24', '0', '0402FB54D9B53594EA17CE77C294737F', '15');
INSERT INTO `ss_user_log` VALUES ('01ae103ce99041cc8c2f3bb0d3de1a0a', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:50:39', '修改了角色信息[admin]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('01cc9628f8644f9ba241b70c68b65b70', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-20 13:11:50', '0', '8DF1394151271D7BEC4AB83FDB9B0D93', '5');
INSERT INTO `ss_user_log` VALUES ('028c408e32c84cbcbf4b66a3a05f612b', '1', '0:0:0:0:0:0:0:1', '2017-04-05 21:41:06', '0', 'FB8710910DCD78885D92421ADD2C6B4A', '28');
INSERT INTO `ss_user_log` VALUES ('02cb8864641042ff82ad05bcd884ffb5', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2019-09-03 20:06:54', '0', 'E973F6522A040580F788D4BCC58BE7E9', '60');
INSERT INTO `ss_user_log` VALUES ('032353f0de3c4f86acb5abae01b7956a', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:31:32', '删除了用户信息[3ac0c6a64b29471288668c689e57b2c4]', 'ABDE0D5B91137D8A3D394925A17C4FDC', null);
INSERT INTO `ss_user_log` VALUES ('0407028748774cf1a92841f981db3b38', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-29 23:30:40', '0', '7FDFDB7FD21BA43FB1B59E0BEB67AB19', '21');
INSERT INTO `ss_user_log` VALUES ('0482956a36d3406cb38d68146ea8cd6e', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 23:45:41', '0', '629F63E424E181EDB1BE1E5553BD9851', '13');
INSERT INTO `ss_user_log` VALUES ('04a3dd8dd7634375a1a2603bbe44bdc5', '1', '0:0:0:0:0:0:0:1', '2017-04-05 17:19:55', '新增了菜单[地块信息管理]', '1D40E20D31FE80F0F878E73216A6102D', null);
INSERT INTO `ss_user_log` VALUES ('04ea3ce36e7a48edb5b948ee8f729a20', '1', '0:0:0:0:0:0:0:1', '2017-04-10 23:19:58', '0', '3CA1B48E615F4B7AB90E00070FF4204B', '45');
INSERT INTO `ss_user_log` VALUES ('055167327fb744b58a3b7d8917e0c76f', '1', '0:0:0:0:0:0:0:1', '2017-04-01 16:51:37', '新增了菜单[TestUpload]', '73AC91CF79B8699D861F4C85D62FBC8D', null);
INSERT INTO `ss_user_log` VALUES ('068381d6443f4f2387f9866edb7cfe1d', '975c0ddeffa4453681898ebb0d0274f7', '114.242.248.203', '2018-10-23 15:38:48', '0', '7BD92458B856C6B19AAB306AF5516C3E', '55');
INSERT INTO `ss_user_log` VALUES ('07a5582939a146adb0bed70d7573d320', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:31:12', '删除了菜单信息[[acd31b8a94ce4ca8bf151c5ca94273ad]]', 'ABDE0D5B91137D8A3D394925A17C4FDC', null);
INSERT INTO `ss_user_log` VALUES ('07d09c44d95c4e20b2b20372fb0dc63d', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 09:57:09', '1', '10B8F68B7686F5F93911765C342879A5', null);
INSERT INTO `ss_user_log` VALUES ('08f02254aa194beaa9367b71db467e00', '1', '0:0:0:0:0:0:0:1', '2017-04-10 00:33:56', '修改了菜单信息[实时数据监控配置]', 'E4F1EE9F9691B5F864383878D53296BC', null);
INSERT INTO `ss_user_log` VALUES ('0925bd6df8c549aabcc8ed782d36f99f', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 14:14:36', '0', '69445BE0A5EFD8626D53241EAC7E021E', '8');
INSERT INTO `ss_user_log` VALUES ('092fcc5283334e9ab4cc232b356a9fbc', '6789e4c5bff54efcacc0cbcc7f42a4de', '124.200.97.234', '2018-11-02 18:41:34', '0', '2AEFF6C084E4414701234EA748321728', '2');
INSERT INTO `ss_user_log` VALUES ('09446b12f3d4402996a5a421586efdaf', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 11:05:40', '0', '1BDB78BE8412B01DC8958DD4203BD898', '30');
INSERT INTO `ss_user_log` VALUES ('0a0f7910ece840a4b3547838172bb338', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-28 23:55:15', '1', '5288684FC2F247B7D7B8470874855C7D', null);
INSERT INTO `ss_user_log` VALUES ('0a63423f354f433b8b1f19926328af07', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-28 23:35:23', '0', '058BECB0DFD3FA5E44B536A8F61E04BB', '22');
INSERT INTO `ss_user_log` VALUES ('0b366b163aa7439ea88aae9b334e28a9', '1', '0:0:0:0:0:0:0:1', '2017-04-11 23:23:15', '0', '42CC215274F56E96FE3F370AC1053A34', '47');
INSERT INTO `ss_user_log` VALUES ('0c06689915c64847bbb15abe074c9c57', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-17 17:05:00', '0', '62C698D9C3116EB2F13B818FFB44CC57', '14');
INSERT INTO `ss_user_log` VALUES ('0da6744963da446d917deac905807dda', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-13 14:12:59', '1', '130345B0F9FF85EECC13FB1C5DA4F486', null);
INSERT INTO `ss_user_log` VALUES ('0dd134d4c8864bbd924d35cf10956e33', '1', '0:0:0:0:0:0:0:1', '2017-04-05 21:00:16', '0', '14157BAB8049C29DDEBD1C04DC7A6E8C', '27');
INSERT INTO `ss_user_log` VALUES ('0de3985947794f449f091712b75cdc1d', '1', '0:0:0:0:0:0:0:1', '2017-03-31 12:49:36', '0', '5032C372F9C82E0B6679667FC31E963A', '1');
INSERT INTO `ss_user_log` VALUES ('0de57e83e7cc41918344e2d745d16ca3', '1', '0:0:0:0:0:0:0:1', '2017-04-17 23:51:47', '删除了菜单信息[[a7729b3e6f864d14b71d43253853d8e0]]', '34F61B40DB379660F9244FF535482C83', null);
INSERT INTO `ss_user_log` VALUES ('0deefae65d5f47a29b06560959f1b550', '1', '0:0:0:0:0:0:0:1', '2017-04-10 23:48:05', '0', '9C9D31A459534450085A0FE6E018268A', '46');
INSERT INTO `ss_user_log` VALUES ('0e158c96fb334e40a640435a9d3571c4', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:01:16', '0', 'BC9CE542F7B2CF905B2C31D576559508', '49');
INSERT INTO `ss_user_log` VALUES ('0e6e5b59d3e54c42a8bd510d38a09acf', '1', '0:0:0:0:0:0:0:1', '2017-03-31 14:19:27', '0', '1066DC0115DA93A723B3BEC2ACAA15B1', '9');
INSERT INTO `ss_user_log` VALUES ('0f418b98c89c456492e840a86088dab2', '1', '', '2017-04-12 23:01:11', '1', '69288C27CE92ACAE28DF86682139ACD6', null);
INSERT INTO `ss_user_log` VALUES ('10fdc52bfa6d4c0f80a1db540503f235', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:55:47', '删除了菜单信息[[12a7c21ed85947319187bb3512cf8510]]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('11751429ea8040cab38e3c2be9a95912', '975c0ddeffa4453681898ebb0d0274f7', '223.104.3.183', '2018-10-23 15:38:16', '0', 'E8F8CDFDE7B7EDC093E1FAA49A9B6ED2', '54');
INSERT INTO `ss_user_log` VALUES ('11b88c7eea4642aa8f47aac6d80d1823', 'ee219a8dcfd1494e82e6afb20cccdbe9', '', '2018-10-19 18:03:32', '1', '363C5D57F7760D2561D5FD73A00BA587', null);
INSERT INTO `ss_user_log` VALUES ('12455b8cc216437599f23903e172d212', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 11:48:12', '0', '61450AAB471F79AD911EFC3D26393949', '2');
INSERT INTO `ss_user_log` VALUES ('12893aafa6eb42708f95f1e7bf353e14', '1', '0:0:0:0:0:0:0:1', '2017-04-01 16:51:46', '修改了菜单信息[邮箱配置]', '73AC91CF79B8699D861F4C85D62FBC8D', null);
INSERT INTO `ss_user_log` VALUES ('12cd5d9b5c904220b508a431519eb855', '1', '0:0:0:0:0:0:0:1', '2017-04-01 16:53:58', '0', 'DE5F2CD01F565EE71453AA8A55D729BE', '14');
INSERT INTO `ss_user_log` VALUES ('1394ff17976c44af9da178d23d57ae2a', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-18 09:42:57', '0', '93A5FF87040844DC9A1B016E478B755A', '37');
INSERT INTO `ss_user_log` VALUES ('13adb29fb98f47a9822a69be424a3a39', '1', '0:0:0:0:0:0:0:1', '2019-09-03 17:50:19', '0', '1D17CAA6EEE1B59AEEC284A0A4647F7D', '77');
INSERT INTO `ss_user_log` VALUES ('147ec1d465994453ac1d4b84f91ac667', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-14 15:02:10', '0', 'F41DBF240B8373F929067CCA6AF3DD84', '10');
INSERT INTO `ss_user_log` VALUES ('16a1ba92e9e04633ade30f29396f8d2d', '1', '0:0:0:0:0:0:0:1', '2017-04-18 22:35:50', '0', '86CC515BF42D633B5A406FA1864BAD78', '69');
INSERT INTO `ss_user_log` VALUES ('16dd7e163ccf408da7fd035904af6f7e', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-18 22:34:42', '0', 'BDED79678BC91BB32FBC255650859C3F', '2');
INSERT INTO `ss_user_log` VALUES ('16ef2272519649a6916eb94e4f23bc97', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2019-09-03 20:08:03', '0', 'BBECE63FBBE6B24DDC484E70D2AAA48F', '61');
INSERT INTO `ss_user_log` VALUES ('170441d097ac4b06b8ffc7e489219e2e', '1', '0:0:0:0:0:0:0:1', '2017-04-05 17:20:18', '新增了菜单[地块管理]', '1D40E20D31FE80F0F878E73216A6102D', null);
INSERT INTO `ss_user_log` VALUES ('170821c4b3ff41569781fa25279ca494', '1', '', '2017-04-04 16:15:26', '1', '286DBA0B0DC4B5C915D27105F187D714', null);
INSERT INTO `ss_user_log` VALUES ('1894b65630d749d695201917c6ee3087', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:32', '修改了菜单信息[月度账单查询]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('1a1fc1febff94a659858f8dfd4699345', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-19 18:15:23', '1', '1ED8EDF3395DF7E44F7A8DF9C8E6D880', null);
INSERT INTO `ss_user_log` VALUES ('1bc75e10fa3944779fcee97718717de8', 'cd0154dddbff4c6786bb7859cb03ed28', '', '2019-09-07 10:37:44', '1', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('1bf9cb4913514a85acd63c7a646e2ac1', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-20 13:39:51', '1', '341939D231A65CA05B59F946BD57409A', null);
INSERT INTO `ss_user_log` VALUES ('1c10e63952594b39bf19980803425d64', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-18 23:21:45', '0', 'D9517C20340B1F64D439557F26C3020D', '16');
INSERT INTO `ss_user_log` VALUES ('1c67aee36d2b45f19625711d4ba95fbe', '1', '0:0:0:0:0:0:0:1', '2017-04-04 17:22:25', '0', '3DCD7108719A3DD2C55F2744FB661CF3', '21');
INSERT INTO `ss_user_log` VALUES ('1cbafc57dab84f089984e64323b6b796', '1', '0:0:0:0:0:0:0:1', '2017-03-31 12:59:44', '0', '5061D040E7D74F45D216FD0B62F70515', '2');
INSERT INTO `ss_user_log` VALUES ('1dae80f3445547499eb58a0a47d70cea', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-19 17:28:43', '1', '4FB6BBF0CB792748B2CA1A21D92F8D3C', null);
INSERT INTO `ss_user_log` VALUES ('1df9a4afac014bb5b1ac41df88653a3a', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 17:12:32', '0', '8C27A4D0E70153A4C3C17B61EEF28172', '47');
INSERT INTO `ss_user_log` VALUES ('1f6430be69f6491e96da06ac8eef5fb4', 'ee219a8dcfd1494e82e6afb20cccdbe9', '58.243.254.131', '2018-10-19 17:53:13', '0', '6A2E26EE551C6557F8ACCD51896B4B1F', '1');
INSERT INTO `ss_user_log` VALUES ('1fdef8e99ef54c6da189f757d125c2ae', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:54:32', '删除了菜单信息[[d77a4bf02d3e490fb713bdd410f50fa4]]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('1ffc0a2d88864655a4e67602badede92', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 17:57:27', '修改了菜单信息[设备管理]', 'BB93C2E1910BDEE7D047773353B9283E', null);
INSERT INTO `ss_user_log` VALUES ('2061a16f2ef246668c71d7b315d88aee', '1', '0:0:0:0:0:0:0:1', '2017-04-18 22:40:19', '修改了菜单信息[种植方案管理]', '76FF09DCE5970B6E70F5FC31A28C8425', null);
INSERT INTO `ss_user_log` VALUES ('20c580d26af24efb9da49bbf40135754', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 23:53:25', '0', '2E8785F9408600F953F82EF8B0908555', '15');
INSERT INTO `ss_user_log` VALUES ('214a292346024f49afd2caf61c473b02', '975c0ddeffa4453681898ebb0d0274f7', '61.148.245.25', '2018-10-21 09:04:03', '新增了用户信息[well]', 'C0021303A3F64213779B70EDF2AC0ACC', null);
INSERT INTO `ss_user_log` VALUES ('214d970938414247b83e3188dd26c339', '1', '0:0:0:0:0:0:0:1', '2017-04-13 14:14:23', '0', 'E94F5E2EB9136C90CEC35D84E51894E2', '58');
INSERT INTO `ss_user_log` VALUES ('2156339b1aed4d07911921a692385974', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-20 13:36:26', '0', '341939D231A65CA05B59F946BD57409A', '19');
INSERT INTO `ss_user_log` VALUES ('21752e19b305415bafa9703dea24e0d5', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:09:03', '0', '6AF49C65AEF38A750D65C0BA36710FC4', '86');
INSERT INTO `ss_user_log` VALUES ('21c6586b5e934fa69a409afa0a15b428', '1', '0:0:0:0:0:0:0:1', '2017-04-05 17:18:53', '0', '1D40E20D31FE80F0F878E73216A6102D', '22');
INSERT INTO `ss_user_log` VALUES ('229e3678673c45579a74ec3eeccc9604', '1', '0:0:0:0:0:0:0:1', '2017-04-12 22:55:43', '0', '69288C27CE92ACAE28DF86682139ACD6', '48');
INSERT INTO `ss_user_log` VALUES ('22ea4ee2f8cf4185890dbecd0673191e', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-28 23:34:48', '0', 'C163AFABC98F2524D4330592D790ED7E', '17');
INSERT INTO `ss_user_log` VALUES ('247024be997646c8ae3094a35411fa8f', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:15', '删除了菜单信息[[54b6b87be1c449c09fa796ac9a8b5666]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('24e3289bef9941f694a4072ec2351cdb', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-29 00:03:19', '1', '8E0D2A6B2D5D1855B5745BB59DC3E6C9', null);
INSERT INTO `ss_user_log` VALUES ('255822dd4a27446eb28bb0b36a141c71', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 09:57:31', '1', 'AE15A849B3D0730F169C383CA7F904DF', null);
INSERT INTO `ss_user_log` VALUES ('255a232170f640a095074c12835f5d03', '1', '', '2017-04-13 14:28:32', '1', '4DCAF82D5141F6047F616614DAF5AFA2', null);
INSERT INTO `ss_user_log` VALUES ('261be523063741a2908fbe11baeae0fb', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-21 22:15:32', '1', '4E3E9DBEBF9A3E6AF58CA86641213EFF', null);
INSERT INTO `ss_user_log` VALUES ('26ab3c8b3db04eff98e0a6813f8a9d38', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-18 17:41:51', '1', '0402FB54D9B53594EA17CE77C294737F', null);
INSERT INTO `ss_user_log` VALUES ('2747218abd184e8caa5c1f30220a1069', '1', '0:0:0:0:0:0:0:1', '2017-04-10 01:30:42', '0', '2A6E85FBC6799C0C6EFA5E9801D8154A', '42');
INSERT INTO `ss_user_log` VALUES ('278a7de290674ca8b3ba40f19ade87d1', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-13 14:24:20', '1', '529DB2FBADF13FAF8C1A6D2508461E05', null);
INSERT INTO `ss_user_log` VALUES ('28c1824a7a8c406ebe696c4564c21359', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:11', '删除了菜单信息[[4862c3c91d684350be53203f767dbe84]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('29002121e0984669ba0e35c83dbca196', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 17:09:04', '0', 'BAA3064ABBAB49AC91CE9635DB5B4128', '7');
INSERT INTO `ss_user_log` VALUES ('298a3319febb46659152ecde9338896e', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-19 18:02:43', '1', '7C5A300542513D6517A372BB4EA46D90', null);
INSERT INTO `ss_user_log` VALUES ('29be8099301b4c9fb32a44e2520699fe', '1', '', '2017-04-05 17:20:57', '1', '1D40E20D31FE80F0F878E73216A6102D', null);
INSERT INTO `ss_user_log` VALUES ('2a70eba95ec447b28f35f34e3b6e2b9d', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 16:34:07', '0', 'B9374E894D1FB0579F3F8B9E17B3C202', '45');
INSERT INTO `ss_user_log` VALUES ('2b84f31b753c4e19b2e7167866dc1c35', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:57:22', '删除了菜单信息[[8866963483214c288f035f44b5570ee0]]', '94ED40E2715DA48885D81D4C45D7EE6C', null);
INSERT INTO `ss_user_log` VALUES ('2b97d03adc744fefae8d59aa5ea2bf23', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 06:50:33', '0', 'DE5559FD9CB191ED633A3259DE55200D', '24');
INSERT INTO `ss_user_log` VALUES ('2bd8395422bc4153aa6c978d1f879839', '1', '', '2017-04-18 22:54:16', '1', '76FF09DCE5970B6E70F5FC31A28C8425', null);
INSERT INTO `ss_user_log` VALUES ('2bff2ed7664d49cb9bb44e70b191fe21', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-29 23:20:45', '0', '70956EDEA411C381A09E73501D552419', '25');
INSERT INTO `ss_user_log` VALUES ('2c8ad805479c471c90809d9057cd5f4a', '1', '0:0:0:0:0:0:0:1', '2017-04-18 14:21:03', '0', '0FA17C82E2A764EFE125A0C819A61C1B', '66');
INSERT INTO `ss_user_log` VALUES ('2d24e5bc3e3d4ced82b0a50d250b3c60', '1', '0:0:0:0:0:0:0:1', '2019-09-04 12:53:52', '0', '1FA3C154DCB4AB2BFDBA60125A819BEB', '80');
INSERT INTO `ss_user_log` VALUES ('2e19d6b4bf7a417f92702c41db6ed9d1', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-17 18:55:23', '0', 'F129AFF0785541A870139468B7A9257E', '35');
INSERT INTO `ss_user_log` VALUES ('2f421831edf443cb95f4a328723c7c8e', '1', '0:0:0:0:0:0:0:1', '2019-09-05 09:38:18', '0', 'C67F402D9CB87931CC69B7651874C355', '84');
INSERT INTO `ss_user_log` VALUES ('3063204fc4ec4f91b533f83cebaf8c11', '1', '', '2017-04-13 14:14:18', '1', 'BB33CC6CB9A45CB90AEA199BDAC0A246', null);
INSERT INTO `ss_user_log` VALUES ('31a55342baf74007884d14c5ba314af1', '1', '0:0:0:0:0:0:0:1', '2019-09-04 20:41:37', '0', '672D36D2CA1F336453273296092E3D97', '83');
INSERT INTO `ss_user_log` VALUES ('31eb1083ae2043489cd188a628268e58', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 09:49:35', '0', '10B8F68B7686F5F93911765C342879A5', '27');
INSERT INTO `ss_user_log` VALUES ('331a760cab4145f8ab109963eb9e919e', '1', '0:0:0:0:0:0:0:1', '2017-04-10 00:32:58', '新增了菜单[成本数据配置]', 'E4F1EE9F9691B5F864383878D53296BC', null);
INSERT INTO `ss_user_log` VALUES ('333bf6bdf3c24248b9a803bfdae8d080', '1', '', '2017-04-10 01:32:30', '1', '2A6E85FBC6799C0C6EFA5E9801D8154A', null);
INSERT INTO `ss_user_log` VALUES ('340846dd95f94fc898940f4ebca0220e', '1', '0:0:0:0:0:0:0:1', '2017-04-13 14:24:27', '0', '4DCAF82D5141F6047F616614DAF5AFA2', '59');
INSERT INTO `ss_user_log` VALUES ('3586fbf1224042a8baf9e653cd179077', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:56', '0', '13FA6B6B1200EF6DC07A836D56E557C0', '5');
INSERT INTO `ss_user_log` VALUES ('35f4d1b5f46e4e6c94c83bccdb23d40f', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 11:04:29', '0', 'FACB11760144F970BA98A5C8CDDE5977', '29');
INSERT INTO `ss_user_log` VALUES ('370b2c3e05054b058e8caf4244e8028f', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-19 16:11:26', '1', '7F168286D9B43B75C1482245457EFC00', null);
INSERT INTO `ss_user_log` VALUES ('37a111980b8d468ea9c2534da118e600', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-13 14:19:26', '1', '69445BE0A5EFD8626D53241EAC7E021E', null);
INSERT INTO `ss_user_log` VALUES ('37ff8f521b6641e0b6c481162484fe0a', '1', '', '2017-04-01 16:52:24', '1', '73AC91CF79B8699D861F4C85D62FBC8D', null);
INSERT INTO `ss_user_log` VALUES ('3825843d49fd46bfb4a7272149bb53fd', '1', '0:0:0:0:0:0:0:1', '2019-09-04 13:30:17', '0', 'F81DBB722206F78952DE49F60B617BE4', '82');
INSERT INTO `ss_user_log` VALUES ('38660756055b423a902a565a45496d00', '1', '', '2017-04-04 15:55:24', '1', '73BEC156544D6FCFDEE8690C1B8F6BE3', null);
INSERT INTO `ss_user_log` VALUES ('3a17a4d0d7c449009425e2abaed2d9a6', '1', '', '2017-03-31 12:59:36', '1', '5032C372F9C82E0B6679667FC31E963A', null);
INSERT INTO `ss_user_log` VALUES ('3a98c564ae0c46329e535fe74c3f2381', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:55:32', '修改了角色信息[管理员角色]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('3bde38ecb816460ea9d63f2d0403c82e', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:43:33', '修改了菜单信息[菜单管理]', '9EC7350D109557BE8817893BD1F5811D', null);
INSERT INTO `ss_user_log` VALUES ('3cd1eaf235ee495da14c3acf1e19d83f', '1', '', '2017-04-17 16:25:21', '1', '339C49B653248127048A9AC5CA1E6A7B', null);
INSERT INTO `ss_user_log` VALUES ('3d6d5da5829746bfa457f9f60b9d9b69', '1', '0:0:0:0:0:0:0:1', '2017-04-13 11:44:19', '0', '3FC58DA9D589759490603EFD0ED59EB9', '55');
INSERT INTO `ss_user_log` VALUES ('3dec3cce5905493c98e2fff25adaeefe', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:19:09', '删除了菜单信息[[f11e99748cff4cccb0969000983f9114]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('3df4ae553b9c418c9173210d924e5a66', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:03:16', '新增了菜单[农田遥感数据]', 'BC9CE542F7B2CF905B2C31D576559508', null);
INSERT INTO `ss_user_log` VALUES ('3e5198843f934934806ede71a905a5f2', '1', '0:0:0:0:0:0:0:1', '2017-04-13 00:24:14', '新增了用户信息[何伟]', 'EF677CD3BD668300B013A09E27F6CE6B', null);
INSERT INTO `ss_user_log` VALUES ('3e6e156df9a7414e892217a3ff26ce0b', '1', '0:0:0:0:0:0:0:1', '2017-04-09 13:41:24', '0', 'BB4D5AB03D21913B2CF4146C382BB6F7', '39');
INSERT INTO `ss_user_log` VALUES ('3fc99759918046a4a96701cb453d00a9', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 07:39:20', '1', 'DE5559FD9CB191ED633A3259DE55200D', null);
INSERT INTO `ss_user_log` VALUES ('4006786a51074eaa8cf4f999aa60f893', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 06:51:01', '0', 'C2908943ED335F91F6718197F3758F46', '25');
INSERT INTO `ss_user_log` VALUES ('404ce1d6d7b84c76b2966aed68b49ab5', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:17:12', '删除了菜单信息[[b4a499c1c79a4fac8f9be394d8fcbb20]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('404ceb883da3406a82c82d574260f0eb', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-18 23:48:17', '0', '9BCC521C94D5FF094D13AE5714E0AA1B', '17');
INSERT INTO `ss_user_log` VALUES ('40bee397006748d49ebdcf659ca0de33', '1', '', '2017-04-10 00:34:50', '1', 'E4F1EE9F9691B5F864383878D53296BC', null);
INSERT INTO `ss_user_log` VALUES ('41a8b28921534362b87e0aa3d4a94885', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-01 17:52:01', '0', '480568735BF8820B310BB5F3544F7AD2', '22');
INSERT INTO `ss_user_log` VALUES ('41ad6bd4ba85422883d913cac0d69116', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-14 18:07:30', '0', '80CEB71065C483D58AAB3F9D4949A53F', '13');
INSERT INTO `ss_user_log` VALUES ('41ed99eae7e14c569515748aed0befdc', '1', '0:0:0:0:0:0:0:1', '2017-04-05 22:21:34', '0', 'BA06A578735F76D52E546F2D2EE2A660', '29');
INSERT INTO `ss_user_log` VALUES ('445955dac9a64f61a9c9e03798c54cff', '1', '', '2019-09-03 15:44:13', '1', 'DFCC34070B5FCA11D3494FEB648C8754', null);
INSERT INTO `ss_user_log` VALUES ('44c04a356b0a4562add56a027c4c8444', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 17:52:46', '新增了用户信息[zhufeng]', '36DAD471F51766E61EE7CFD3BD8FDADD', null);
INSERT INTO `ss_user_log` VALUES ('44ecfa045d8b4b6890d2070bd351b4ed', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:31:25', '修改了菜单信息[基础信息管理]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('465ed400da664de0aea31676265c77e4', '6789e4c5bff54efcacc0cbcc7f42a4de', '124.200.97.234', '2018-12-19 08:53:12', '0', '2EBFE35C39D6E670DB55F1A67B3643FE', '3');
INSERT INTO `ss_user_log` VALUES ('465f69b96ea444ad99d0c05dd296ebf1', '1', '', '2017-04-14 15:01:57', '1', 'BFA65E06B2F8A82FDAF8A38A2B119A99', null);
INSERT INTO `ss_user_log` VALUES ('4913df29898a45d99d8f233a887b1991', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-18 17:42:12', '1', '06FD5D8D70A0B672C98CA5C315D1428B', null);
INSERT INTO `ss_user_log` VALUES ('4939b191a1284fb6a1dc5e7508aa4c23', '1', '0:0:0:0:0:0:0:1', '2017-04-01 17:01:48', '0', '5EFDD84E9D4C38AD23AD7076C9B4769F', '16');
INSERT INTO `ss_user_log` VALUES ('4a030cc6df2b4f6eb6a32093a42b305d', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-05-03 07:40:06', '1', 'C6AAAA23C73C11CC1D6F8E4514ABB29C', null);
INSERT INTO `ss_user_log` VALUES ('4a2f5c8f64594daeadc939ceb3f7f781', '47b13e33493a46c488c859b867c06090', '', '2018-10-19 17:23:31', '1', '9324CDCDA12F23FA60797D966038AF58', null);
INSERT INTO `ss_user_log` VALUES ('4be03933a6a94a12af035cf85d6c2824', '1', '', '2017-04-09 13:41:09', '1', 'AF4B31BD4A2F5F5F149F11B2F3148F79', null);
INSERT INTO `ss_user_log` VALUES ('4c2489d5021b47d7842e8e18a12acbde', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:01:08', '新增了菜单[农田遥感数据]', '69288C27CE92ACAE28DF86682139ACD6', null);
INSERT INTO `ss_user_log` VALUES ('4cc74d01fd064bca8ceadbc46917a6c2', '1', '0:0:0:0:0:0:0:1', '2017-04-01 17:02:22', '0', 'B9BFFA035171B4A232C20F9199D21A25', '17');
INSERT INTO `ss_user_log` VALUES ('4d26a654c39a4bc99629c1370c1ddda0', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-21 23:45:32', '1', '19B74C3230E8DB4CF59BBC2C847FAC65', null);
INSERT INTO `ss_user_log` VALUES ('4d2c13d5f6694384ab9341bcb1dc254f', '1', '0:0:0:0:0:0:0:1', '2017-03-31 16:19:31', '新增了用户信息[hewei]', '1D4ED8EB6CC9CE76BFB7B7F1998F38D8', null);
INSERT INTO `ss_user_log` VALUES ('4dc74c23e64646cbaf15de2d2ed738eb', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-18 10:12:25', '0', 'D0FDA5711F7EF7CBAB0341CBE8112463', '38');
INSERT INTO `ss_user_log` VALUES ('4df8fac413884abb970b165d500309c4', '1', '0:0:0:0:0:0:0:1', '2017-04-10 00:33:08', '修改了菜单信息[地块管理]', 'E4F1EE9F9691B5F864383878D53296BC', null);
INSERT INTO `ss_user_log` VALUES ('4f87f9e966cc4dc4bfc53b1f09942a89', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:18:51', '删除了菜单信息[[5dfc4e4136d043dfb6ef0a8e8bd7eb6a]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('4fef8bcdb454409987ae6398fe8045e5', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 14:13:03', '0', 'BF2BD0C2E1656E68EA62072D3D109C11', '7');
INSERT INTO `ss_user_log` VALUES ('50467282602745a3802a68d3026aa7c3', 'ee219a8dcfd1494e82e6afb20cccdbe9', '124.200.97.234', '2018-11-01 17:14:34', '0', '73A6293A76E610970B3E680CB95D2828', '4');
INSERT INTO `ss_user_log` VALUES ('50a7d632139f46699a0e5af8cde2f7f4', '975c0ddeffa4453681898ebb0d0274f7', '49.90.23.252', '2018-10-19 17:28:07', '0', '4FB6BBF0CB792748B2CA1A21D92F8D3C', '48');
INSERT INTO `ss_user_log` VALUES ('50adda249471499fb017431b1ea9553e', '975c0ddeffa4453681898ebb0d0274f7', '49.90.23.252', '2018-10-17 18:47:57', '0', 'F0FC45A0CCD693292367791E47A0521A', '34');
INSERT INTO `ss_user_log` VALUES ('50e8e5a5a5cb482e84936c41593a803a', '1', '0:0:0:0:0:0:0:1', '2017-04-10 01:12:35', '新增了菜单[收益数据配置]', '281048EF7EE500D7D374DBB70138411A', null);
INSERT INTO `ss_user_log` VALUES ('51d784e96d874aacbb271dee24810bd0', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:37:49', '0', 'A2A9B5DBEB45B5DF1B92E0E57D903595', '3');
INSERT INTO `ss_user_log` VALUES ('524aa3df898649cd8397a5fb12da9f0e', '1', '', '2017-04-18 22:38:12', '1', '86CC515BF42D633B5A406FA1864BAD78', null);
INSERT INTO `ss_user_log` VALUES ('5250111111dc44b99318029f04426fd3', '1', '0:0:0:0:0:0:0:1', '2019-09-05 14:15:33', '删除了菜单信息[[f59a64b38c1149fd907a61bae82c753a]]', '717CBB5CA6B8320DAD2841565F5611D0', null);
INSERT INTO `ss_user_log` VALUES ('53223bceeebd49d38c60cdb69f4809f8', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:31:37', '删除了用户信息[6789e4c5bff54efcacc0cbcc7f42a4de]', 'ABDE0D5B91137D8A3D394925A17C4FDC', null);
INSERT INTO `ss_user_log` VALUES ('53eb6e20d1af49118de34f7867eea5d6', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 18:05:27', '0', '1ED8EDF3395DF7E44F7A8DF9C8E6D880', '52');
INSERT INTO `ss_user_log` VALUES ('5428c0285d794fa4b919aba5740261fa', '975c0ddeffa4453681898ebb0d0274f7', '61.148.245.25', '2018-10-21 09:02:57', '0', 'C0021303A3F64213779B70EDF2AC0ACC', '53');
INSERT INTO `ss_user_log` VALUES ('54528081b0ec450eafb78db3d1b3a2ff', '1', '0:0:0:0:0:0:0:1', '2017-04-04 15:47:36', '0', '73BEC156544D6FCFDEE8690C1B8F6BE3', '19');
INSERT INTO `ss_user_log` VALUES ('54b12921572f4a0db06eabad35858718', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-18 22:54:55', '0', 'E95D41C15D411F96AA013F889B01D243', '3');
INSERT INTO `ss_user_log` VALUES ('54c1600c982c4b7081fa510977be36e4', '1', '0:0:0:0:0:0:0:1', '2017-04-13 11:17:57', '0', 'DC499ADAF3F80D4339BD021B21B60DB1', '52');
INSERT INTO `ss_user_log` VALUES ('54eaad9266e34ee78014beeeceea561f', '975c0ddeffa4453681898ebb0d0274f7', '', '2019-09-03 20:08:45', '1', 'BBECE63FBBE6B24DDC484E70D2AAA48F', null);
INSERT INTO `ss_user_log` VALUES ('5504cda53e92452d888e9fc3b0daec2b', '1', '0:0:0:0:0:0:0:1', '2017-04-14 15:01:43', '0', 'BFA65E06B2F8A82FDAF8A38A2B119A99', '62');
INSERT INTO `ss_user_log` VALUES ('550fe86e0a50466bbbcf463c94bd311b', '1', '0:0:0:0:0:0:0:1', '2017-04-13 11:31:54', '0', '8284D0CBA790F166B7739DFEBA25CFAF', '54');
INSERT INTO `ss_user_log` VALUES ('55e69b5e86c44423bf84112501e1550a', '975c0ddeffa4453681898ebb0d0274f7', '', '2019-09-03 14:52:47', '1', '289F5B5045C2851DBAF9C2C9F80E8321', null);
INSERT INTO `ss_user_log` VALUES ('560fb1b53c1b48949c2deaceeca28dce', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 16:00:56', '0', '4E944750E2265C34C8730657E12E56C6', '44');
INSERT INTO `ss_user_log` VALUES ('566a795adeb64ab8a004c493f5382b5e', '1', '0:0:0:0:0:0:0:1', '2019-09-03 14:53:28', '0', '5F191E5BC83B7FCA036B1A8A1806704F', '73');
INSERT INTO `ss_user_log` VALUES ('581b274968be4160b985ba0f76a919b3', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 22:48:30', '0', 'CC4C7FA79A2A7DA5CD355089E039A756', '10');
INSERT INTO `ss_user_log` VALUES ('581cfbcecf7648d8b84aa01437538697', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:39:35', '0', '9EC7350D109557BE8817893BD1F5811D', '4');
INSERT INTO `ss_user_log` VALUES ('58f3d8536b1444948ed2a1c4e7fbdd69', '1', '', '2017-04-18 22:54:48', '1', '71328F98F9601F4FF3159B0FA47562BD', null);
INSERT INTO `ss_user_log` VALUES ('5a0eb2b5c0d44e86a712cb4d50143a07', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:34:04', '0', '46B096274199733B750FEC40D47B44C5', '7');
INSERT INTO `ss_user_log` VALUES ('5b0f9109ba334f8bb0f068374f8394cb', '1', '', '2019-09-03 15:43:23', '1', '8354E1CBCA6FAA82AB809C78DD59648C', null);
INSERT INTO `ss_user_log` VALUES ('5ba5104202f4413691c74b3820657f8c', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-18 17:41:57', '0', '06FD5D8D70A0B672C98CA5C315D1428B', '1');
INSERT INTO `ss_user_log` VALUES ('5c20e7b27d0e4664897651dfc43c4f73', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:54:40', '删除了菜单信息[[14d583b203b94f518292fed0904cfb5a]]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('5c33c37dceeb4b63948b05f3576084d5', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 11:11:23', '1', '4503B3559B86BABE66DFF9B192100F7F', null);
INSERT INTO `ss_user_log` VALUES ('5d20357e893441ddb4a554fea809ad28', '1', '0:0:0:0:0:0:0:1', '2019-09-03 20:08:52', '0', '43F3C73679B7DF8C2FEA248D46D42A6F', '78');
INSERT INTO `ss_user_log` VALUES ('5d9cff6a93404fc29a49838a80594fe0', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:44:09', '修改了菜单信息[巡检记录查询]', '9EC7350D109557BE8817893BD1F5811D', null);
INSERT INTO `ss_user_log` VALUES ('5da543046bfa422ba943628860179839', '1', '', '2017-04-10 23:46:06', '1', '3CA1B48E615F4B7AB90E00070FF4204B', null);
INSERT INTO `ss_user_log` VALUES ('5dd5e1e129a740c6903d8a6a18c79210', '1', '0:0:0:0:0:0:0:1', '2017-04-01 16:52:22', '修改了菜单信息[TestUpload]', '73AC91CF79B8699D861F4C85D62FBC8D', null);
INSERT INTO `ss_user_log` VALUES ('5f931ff6aafd4e668e68d595ee386232', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-21 22:14:19', '0', '4E3E9DBEBF9A3E6AF58CA86641213EFF', '20');
INSERT INTO `ss_user_log` VALUES ('6027facf251e43c6810d7a8978280e15', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 11:05:49', '1', '1BDB78BE8412B01DC8958DD4203BD898', null);
INSERT INTO `ss_user_log` VALUES ('60f69e37e7ec443ab8ead4ce4ba0469d', '1', '0:0:0:0:0:0:0:1', '2017-04-01 17:00:25', '修改了菜单信息[TestUpload]', '17DE6A4E8DDEF2C0004EBE210257C7FA', null);
INSERT INTO `ss_user_log` VALUES ('613ad8efc9404c7ead59fc84095e1a65', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 17:51:36', '删除了用户信息[47b13e33493a46c488c859b867c06090]', '36DAD471F51766E61EE7CFD3BD8FDADD', null);
INSERT INTO `ss_user_log` VALUES ('614bf5c29bce441eb507cab579623c77', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-13 11:31:43', '1', '7BA95FAE775CF45548DBB033C20CFC61', null);
INSERT INTO `ss_user_log` VALUES ('6220288b04c84c61a2022a6befc7a723', '1', '', '2017-04-13 11:46:58', '1', '8284D0CBA790F166B7739DFEBA25CFAF', null);
INSERT INTO `ss_user_log` VALUES ('63c00d44f94d422a9ca5424fd65cce15', '1', '', '2019-09-03 15:19:43', '1', 'EDC7C86028936D7C0CBF8B905D95011F', null);
INSERT INTO `ss_user_log` VALUES ('6432115aca7b4096b1bc26093c673368', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 11:05:07', '0', 'CA9B67CA49C4F5411D04C13262951C48', '30');
INSERT INTO `ss_user_log` VALUES ('646cef3e951a4ed0882a4bd97f5837bf', '1', '0:0:0:0:0:0:0:1', '2017-04-04 16:05:43', '0', '286DBA0B0DC4B5C915D27105F187D714', '20');
INSERT INTO `ss_user_log` VALUES ('65162323899b4eec996a8568fe9682a5', '1', '0:0:0:0:0:0:0:1', '2019-09-04 13:16:02', '0', '4B0210E25CE3BAA009FD3AFF2C00AB97', '81');
INSERT INTO `ss_user_log` VALUES ('6681ce9f1a034a62b8c1ea65dd2df9c7', '1', '0:0:0:0:0:0:0:1', '2017-04-05 22:41:33', '0', 'E22424481563F29AE1D43C80AF8A083E', '31');
INSERT INTO `ss_user_log` VALUES ('6685fdd7bea14d4c9be3ad37aefeb4c2', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:32:05', '0', '747B3B15790ED386E5BC0E8AF5670D36', '6');
INSERT INTO `ss_user_log` VALUES ('669df36209e243488fadbc23424f2f53', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:30:54', '新增了菜单[二维码打印]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('6774461828894fd2b8858ac08c24b4b0', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 17:06:51', '0', '52EC886D142C662480E9E55E2EC4C487', '46');
INSERT INTO `ss_user_log` VALUES ('677f64ee145047c3817896b6ba1354ab', '1', '0:0:0:0:0:0:0:1', '2017-04-05 22:31:01', '0', 'CB9E3217B4B6EA65472FF2D910EA0225', '30');
INSERT INTO `ss_user_log` VALUES ('67cbc738c5e54595a140fdd843074b35', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-21 22:14:09', '1', '99B0891D763E44A18E11A0E859450D0C', null);
INSERT INTO `ss_user_log` VALUES ('681fdc00eaad4dad8d08e81ce771d51f', '1', '', '2017-04-13 11:30:26', '1', '2280656CFC3D63767D61A8B19F2F9B88', null);
INSERT INTO `ss_user_log` VALUES ('69033a63380b4b65861dea3038e06c7e', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:18:34', '删除了菜单信息[[a18b10fd52634e6d8017d9bcd9acd1e2]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('6a053b0a6c2f4d368b4f926d05382fac', '975c0ddeffa4453681898ebb0d0274f7', '49.90.23.252', '2018-10-19 15:57:22', '0', '7F168286D9B43B75C1482245457EFC00', '43');
INSERT INTO `ss_user_log` VALUES ('6b8945f094864464a4be1d20b7f143f5', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:08:33', '新增了菜单[效益对比分析]', 'BC9CE542F7B2CF905B2C31D576559508', null);
INSERT INTO `ss_user_log` VALUES ('6bd7ae3132474aa9a2885570bc2e9ce7', '1', '0:0:0:0:0:0:0:1', '2019-09-03 15:33:11', '0', '8354E1CBCA6FAA82AB809C78DD59648C', '75');
INSERT INTO `ss_user_log` VALUES ('6c3bb3e223c746feb9a53c94791082f4', '1', '0:0:0:0:0:0:0:1', '2017-04-18 22:54:23', '0', '71328F98F9601F4FF3159B0FA47562BD', '71');
INSERT INTO `ss_user_log` VALUES ('6ce92d4174584d289d0e0de8e5068067', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:17:54', '删除了菜单信息[[14d583b203b94f518292fed0904cfb5a]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('6d745f0de5ef4473a050c6fe8abd6e92', '1', '0:0:0:0:0:0:0:1', '2017-04-01 16:55:04', '0', '17DE6A4E8DDEF2C0004EBE210257C7FA', '15');
INSERT INTO `ss_user_log` VALUES ('6e21b0592e3641acbf90b0de479cfa54', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 17:53:28', '0', '7D4EFAAC9E33B1B08EC6BC50DCDD71F9', '50');
INSERT INTO `ss_user_log` VALUES ('6e34fb0a4c744458b33b9b9092515f2e', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:17:51', '删除了菜单信息[[d1cd800381174a9aaee609b369bc02e0]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('6efdbc880c3840a4958ceb7c437089d1', '1', '0:0:0:0:0:0:0:1', '2017-04-18 22:38:17', '0', '76FF09DCE5970B6E70F5FC31A28C8425', '70');
INSERT INTO `ss_user_log` VALUES ('6f43c64c343a4c1dac76354aad1a56d3', '1', '0:0:0:0:0:0:0:1', '2017-04-17 23:40:13', '0', '34F61B40DB379660F9244FF535482C83', '65');
INSERT INTO `ss_user_log` VALUES ('713c530569e8452a937dbf0c8f68e950', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 11:30:34', '0', '7BA95FAE775CF45548DBB033C20CFC61', '1');
INSERT INTO `ss_user_log` VALUES ('714eadb8e70e4955be12efe30388ea1d', '1', '0:0:0:0:0:0:0:1', '2017-04-07 18:20:32', '0', 'E3DE66C55E2E24C500ACBD41066DE390', '36');
INSERT INTO `ss_user_log` VALUES ('71df1a306ff544e3b151772366f75321', '47b13e33493a46c488c859b867c06090', '', '2018-10-19 17:08:47', '1', 'A950A13113496584789E7894B34BB43A', null);
INSERT INTO `ss_user_log` VALUES ('7218ac6a8f984ff487c7efbac30d99d4', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 16:28:14', '0', 'D92B3CD9CE1C2437E7DE5AC29342331B', '5');
INSERT INTO `ss_user_log` VALUES ('72e43c1ceb604130bb39fbb5f6f63c61', '1', '', '2017-04-01 17:02:17', '1', '5EFDD84E9D4C38AD23AD7076C9B4769F', null);
INSERT INTO `ss_user_log` VALUES ('730de93aba5f4985b4225ac257c08ae7', '47b13e33493a46c488c859b867c06090', '58.243.254.131', '2018-10-19 17:08:55', '0', 'E91FD1513F92238C7104FE1DDA6628C2', '2');
INSERT INTO `ss_user_log` VALUES ('733778d883be4561819adc2441a06a6f', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:17:06', '0', 'DEFF70B87082E50402CA4B92DEFE192C', '2');
INSERT INTO `ss_user_log` VALUES ('74d7f9090f4b4035ae53a670625dad64', '1', '', '2017-03-31 13:46:26', '1', '46B096274199733B750FEC40D47B44C5', null);
INSERT INTO `ss_user_log` VALUES ('76637826530d4bc7a288cc52cb7e01ac', '1', '0:0:0:0:0:0:0:1', '2017-04-01 17:02:15', '修改了菜单信息[TestUpload]', '5EFDD84E9D4C38AD23AD7076C9B4769F', null);
INSERT INTO `ss_user_log` VALUES ('769fff41033b4130b2045ebaeb913021', '1', '', '2019-09-03 14:50:55', '1', 'E15F37707C120FBE8F981BD8B4162794', null);
INSERT INTO `ss_user_log` VALUES ('76c43493e05449b3b29640641e69b087', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 11:14:40', '0', '9319F0C38056F69A6FA22E27D0064860', '32');
INSERT INTO `ss_user_log` VALUES ('777ccd2519a84eb895090c737a8ad973', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:36:31', '删除了菜单信息[[e0813cee5145437fabe383996824d4b1]]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('778a9302d75f4a1589d1146cd015c3ce', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-18 10:40:25', '0', 'E3E130D661C7EC2BBEFFDE38776F5CF1', '39');
INSERT INTO `ss_user_log` VALUES ('77be14277b11417e89f8a5bf1ff15c86', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:44:17', '修改了菜单信息[二维码打印]', '9EC7350D109557BE8817893BD1F5811D', null);
INSERT INTO `ss_user_log` VALUES ('77eb3809a00b4d3e996fae72bd8dcd98', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:13:10', '0', '97AE3D707B5DF0DCFF92C2B4DA39BB56', '3');
INSERT INTO `ss_user_log` VALUES ('794c25f329f64e1ebe086baa70270860', '1', '', '2019-09-05 17:56:59', '1', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('79b20fdc8e1f492b87ce3bf020470f71', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 09:41:38', '0', '973E3E4D1619B2D6B86FEED63BC91F1C', '40');
INSERT INTO `ss_user_log` VALUES ('7a135441fd8f49d8bf1957fc155723ee', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 09:57:38', '0', 'E7FDE2D85393BFC2E38E409ACE6D5EE9', '29');
INSERT INTO `ss_user_log` VALUES ('7b157dd6e63e4195ab12f558e1bac7c7', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 18:01:03', '0', '7C5A300542513D6517A372BB4EA46D90', '51');
INSERT INTO `ss_user_log` VALUES ('7b4eefb0deb04307ba90794e6afe9dfc', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-18 10:09:43', '1', '93A5FF87040844DC9A1B016E478B755A', null);
INSERT INTO `ss_user_log` VALUES ('7b82583671c54ef39c1d19cf147b2753', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-18 10:20:03', '1', 'D0FDA5711F7EF7CBAB0341CBE8112463', null);
INSERT INTO `ss_user_log` VALUES ('7cefc989a7eb4552b9b0dd7f5427b335', '6789e4c5bff54efcacc0cbcc7f42a4de', '124.200.97.234', '2018-12-19 08:53:41', '0', '9B3624DA53CAD35264B2B3CAE2D02F2B', '4');
INSERT INTO `ss_user_log` VALUES ('7d5976de48f545f7849996edaaa4224c', '1', '0:0:0:0:0:0:0:1', '2017-04-13 14:14:14', '修改了菜单信息[实时进展信息]', 'BB33CC6CB9A45CB90AEA199BDAC0A246', null);
INSERT INTO `ss_user_log` VALUES ('7d8db4551c194fceb22ddcd477e3cf84', '1', '', '2017-04-18 17:34:19', '1', '950A741416744BF0BDC01792D41D2886', null);
INSERT INTO `ss_user_log` VALUES ('7da65d2318b741cb91cd35b5aea3b314', '1', '0:0:0:0:0:0:0:1', '2017-04-07 16:40:25', '0', 'CCB4CE7B96DC9ECCF321BDE8264FDCF9', '32');
INSERT INTO `ss_user_log` VALUES ('7daf5039b8c94237941e1706a97c7716', '1', '0:0:0:0:0:0:0:1', '2017-04-05 18:59:53', '0', 'BD074C11194CA97DE0F11B65FBEC9131', '24');
INSERT INTO `ss_user_log` VALUES ('7e4d315b85e8482b9549276f4974cc19', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2019-09-03 14:51:11', '0', '01DCED58B5C8BD58BE6A0514A1E29F4C', '35');
INSERT INTO `ss_user_log` VALUES ('807f9238e4ac4c92840d1d140d396bcd', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 11:04:58', '1', 'FACB11760144F970BA98A5C8CDDE5977', null);
INSERT INTO `ss_user_log` VALUES ('816e001d9fad49a6980139eb5b0727c2', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 11:18:45', '0', '5D7C857286F5E3A5B1072D6A434634F1', '33');
INSERT INTO `ss_user_log` VALUES ('81bb1ef52cb3490294a83e2a96d18e4e', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 07:40:24', '0', '48EF38E12894B5C4CEB294C274C987C2', '26');
INSERT INTO `ss_user_log` VALUES ('81d606b5a295432eb0dc4393334d5c83', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-17 17:29:42', '1', '62C698D9C3116EB2F13B818FFB44CC57', null);
INSERT INTO `ss_user_log` VALUES ('827900c613344694af8846e77294e582', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-20 13:36:14', '1', '2B47C3E3EAA5E7C2B2859EDE7D8083DF', null);
INSERT INTO `ss_user_log` VALUES ('82de2b74bdb646b9b639bfa65fd7e596', '1', '0:0:0:0:0:0:0:1', '2017-04-10 22:51:14', '0', '48B75A8CA5916C9D95B5B042D5C820B2', '44');
INSERT INTO `ss_user_log` VALUES ('83b0d2c534db45f9a1e858ca22ba94b2', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 22:09:07', '0', '99B0891D763E44A18E11A0E859450D0C', '8');
INSERT INTO `ss_user_log` VALUES ('84a7a05fe75d47d68cfd54b7cdc6fd86', '1', '0:0:0:0:0:0:0:1', '2017-03-31 14:20:29', '删除了菜单信息[[7b325f6ed35246c9a30f8a8cf9b963d3]]', '1066DC0115DA93A723B3BEC2ACAA15B1', null);
INSERT INTO `ss_user_log` VALUES ('852df3b939be4c3291b91dfe68e50bc8', '1', '0:0:0:0:0:0:0:1', '2017-03-31 14:23:08', '新增了角色信息[管理员]', '1066DC0115DA93A723B3BEC2ACAA15B1', null);
INSERT INTO `ss_user_log` VALUES ('86351dec47e34219a2ee26930b727ce1', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-28 23:35:14', '1', 'C163AFABC98F2524D4330592D790ED7E', null);
INSERT INTO `ss_user_log` VALUES ('866c21d2ff3f43a8a7b07e7d3b93485e', '1', '0:0:0:0:0:0:0:1', '2017-04-01 16:52:28', '0', '7F5B66FE885246009012A5661A4EE568', '13');
INSERT INTO `ss_user_log` VALUES ('86e934c4d50c4b1c97d45b3f718c4fcd', '1', '0:0:0:0:0:0:0:1', '2019-09-03 15:43:54', '0', 'DFCC34070B5FCA11D3494FEB648C8754', '76');
INSERT INTO `ss_user_log` VALUES ('86ee207c59ee4aee8ebb7d96097f22e1', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 11:25:59', '0', '33C49B0A31FEB74A656F1ADD823F4276', '41');
INSERT INTO `ss_user_log` VALUES ('88e4bc7b956d49b384295c51d42f5909', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 14:23:54', '0', '529DB2FBADF13FAF8C1A6D2508461E05', '9');
INSERT INTO `ss_user_log` VALUES ('891f1844d9b2489d8145ee4a8c477fc7', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-28 23:42:09', '0', '0BC05CD5FDF04B5804D939877DA3DAF4', '18');
INSERT INTO `ss_user_log` VALUES ('894fa24fa2e04cfb85996cc6bc167ec8', '1', '', '2017-04-17 17:04:51', '1', '235563046083AF4834309E84D073E31C', null);
INSERT INTO `ss_user_log` VALUES ('8a26381736fa4dc5b1eb1c4e0b355918', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:25:09', '新增了菜单[设备管理]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('8b11311ee4534c65992fb133f5707cf3', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-20 13:40:05', '0', '47C3EBA53BFBB43B658D2D8EBF68E6B9', '7');
INSERT INTO `ss_user_log` VALUES ('8cd1a91948d342f4be79f8a1089948a7', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 17:57:47', '0', '39619709F110C88A2847540B6BCEC312', '10');
INSERT INTO `ss_user_log` VALUES ('8dae35816c47469e98bab87fb1e88d7f', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-29 00:03:33', '0', 'EEF8DE257A354D3CCD498B63E623A404', '24');
INSERT INTO `ss_user_log` VALUES ('8e594f6fa2574702b62bb01fbb8cb90b', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 12:30:04', '0', '0199DE4CD1C8D79B77F8123E5F6B846B', '5');
INSERT INTO `ss_user_log` VALUES ('8f23a134122a4709b11b56589cd468e2', '47b13e33493a46c488c859b867c06090', '58.243.254.131', '2018-10-19 17:08:35', '0', 'A950A13113496584789E7894B34BB43A', '1');
INSERT INTO `ss_user_log` VALUES ('90de9deefc86420094f3074b5bd60dc3', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:55:17', '修改了角色信息[巡检员角色]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('94ae81b1437e45db88c13a4315a66685', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-21 23:55:19', '0', '8CC313B94AF2B29B4EB85A59B7D4A3A4', '21');
INSERT INTO `ss_user_log` VALUES ('95117609d33a4dc19bfe3986535b5484', '1', '0:0:0:0:0:0:0:1', '2017-04-13 00:21:58', '0', 'EF677CD3BD668300B013A09E27F6CE6B', '51');
INSERT INTO `ss_user_log` VALUES ('95528274016b49a6a9b29cb27af54103', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:46:34', '0', 'BCCFB38C0A2A44EB663120821ECD734E', '8');
INSERT INTO `ss_user_log` VALUES ('964aacf8857a4f488e1f2d093a07f065', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-28 23:41:58', '1', '058BECB0DFD3FA5E44B536A8F61E04BB', null);
INSERT INTO `ss_user_log` VALUES ('980e5f920a5e48bebe75f1a1143f3fae', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 17:51:11', '0', '36DAD471F51766E61EE7CFD3BD8FDADD', '49');
INSERT INTO `ss_user_log` VALUES ('982e91c2e1f544e7a0e8059e8ed77e76', '975c0ddeffa4453681898ebb0d0274f7', '', '2019-09-03 15:33:01', '1', '743AA000933FCF17AE7F23B08FF075BE', null);
INSERT INTO `ss_user_log` VALUES ('988d57365f96455d9b47771840ec0912', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:27:50', '新增了菜单[灭火器管理]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('98f8196e7c924d86ad0fe7c48ab60103', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-05-01 17:51:49', '1', 'BD61CCE99EE9791C3CBDA09DB3DF963E', null);
INSERT INTO `ss_user_log` VALUES ('992df2394a2d47d19b48670ede83ac73', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-14 15:03:46', '0', '69A0D3156A4632F3493AAA89927BC82E', '11');
INSERT INTO `ss_user_log` VALUES ('998f145b35a9482891a014502bc4bef2', '1', '', '2017-04-13 11:48:02', '1', '19163599F441070F5A1A1FD25A06169C', null);
INSERT INTO `ss_user_log` VALUES ('9995377cec1b4575b6d9e88a5171b0f9', '1', '0:0:0:0:0:0:0:1', '2017-04-09 13:38:24', '0', 'AF4B31BD4A2F5F5F149F11B2F3148F79', '38');
INSERT INTO `ss_user_log` VALUES ('999b63f1ebec4761a0267a77b31c8de4', '1', '', '2017-04-13 14:14:26', '1', 'E94F5E2EB9136C90CEC35D84E51894E2', null);
INSERT INTO `ss_user_log` VALUES ('99eb7398de274ab5a14c13f2d2a4f4f2', '1', '0:0:0:0:0:0:0:1', '2019-09-05 14:14:37', '0', '717CBB5CA6B8320DAD2841565F5611D0', '85');
INSERT INTO `ss_user_log` VALUES ('9ba8687b42394a3195f549ae22cdf39a', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-28 23:55:29', '0', '63B4047C482F51FCDA12C6142613A902', '23');
INSERT INTO `ss_user_log` VALUES ('9bfb81bcbb914a25acd99fdb681e8986', '1', '0:0:0:0:0:0:0:1', '2017-04-18 17:35:16', '修改了用户信息[hewei]', '6288B0DAF372F0BE45B5854E1D89EEAA', null);
INSERT INTO `ss_user_log` VALUES ('9c0caf2d7112400586418f6e2ad478de', '1', '0:0:0:0:0:0:0:1', '2019-09-03 15:12:13', '0', 'EDC7C86028936D7C0CBF8B905D95011F', '74');
INSERT INTO `ss_user_log` VALUES ('9c66438de0484ab592b9abba42ab75b4', 'ee219a8dcfd1494e82e6afb20cccdbe9', '', '2018-10-19 17:53:19', '1', '6A2E26EE551C6557F8ACCD51896B4B1F', null);
INSERT INTO `ss_user_log` VALUES ('9c9647eff9ee4fc9982197640ad2685f', '1', '0:0:0:0:0:0:0:1', '2019-09-05 14:15:29', '删除了菜单信息[[fc51fbd0974c41fb8b1829bf06b41902]]', '717CBB5CA6B8320DAD2841565F5611D0', null);
INSERT INTO `ss_user_log` VALUES ('9ccaad0bd17f4391b4750bd473152e5e', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 17:41:21', '0', 'C19D1BE64C1FDB795062E3E35093C926', '8');
INSERT INTO `ss_user_log` VALUES ('9d8dee3ba8c947acba2cac279e9e3716', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 11:11:31', '0', 'C753613CB9F97A5AB1A2430126542E9F', '32');
INSERT INTO `ss_user_log` VALUES ('9e346e0284f7474d8d2384ae9ee0ff1c', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-03 09:57:24', '0', 'AE15A849B3D0730F169C383CA7F904DF', '28');
INSERT INTO `ss_user_log` VALUES ('9e541a8e86be4f73a4200bfe8e684273', '1', '0:0:0:0:0:0:0:1', '2017-04-13 11:47:02', '0', '19163599F441070F5A1A1FD25A06169C', '56');
INSERT INTO `ss_user_log` VALUES ('9e86e3f871c14b4b863c5a92d35b1847', '1', '0:0:0:0:0:0:0:1', '2017-04-17 23:51:41', '删除了菜单信息[[83f4be60951642ff9d280f59357ffa6b]]', '34F61B40DB379660F9244FF535482C83', null);
INSERT INTO `ss_user_log` VALUES ('9f02843740bf4068be8055dddd9c6bde', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2019-09-03 15:28:58', '0', '743AA000933FCF17AE7F23B08FF075BE', '59');
INSERT INTO `ss_user_log` VALUES ('9f925780dcc846b58b78337f1da35292', 'cd0154dddbff4c6786bb7859cb03ed28', '', '2019-09-07 17:57:30', '1', 'BB93C2E1910BDEE7D047773353B9283E', null);
INSERT INTO `ss_user_log` VALUES ('a0103c8956f14dc5b34c2fed184be6d0', '3ac0c6a64b29471288668c689e57b2c4', '', '2019-09-03 14:51:35', '1', '01DCED58B5C8BD58BE6A0514A1E29F4C', null);
INSERT INTO `ss_user_log` VALUES ('a017253560154d4b81cfb7d8d7874646', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-19 22:38:28', '0', 'FC5AA467562A3BF0ECC8FE915E4B6D3A', '18');
INSERT INTO `ss_user_log` VALUES ('a0641e4f1a044edba170fe1e464e3473', '1', '0:0:0:0:0:0:0:1', '2017-04-07 17:35:58', '0', 'C72AA0A115E21D90A2B9AAE5C2AF4035', '33');
INSERT INTO `ss_user_log` VALUES ('a07c18d089e54406b9d3b005d91e7081', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:17:18', '删除了菜单信息[[f59a64b38c1149fd907a61bae82c753a]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('a096626c16a04405888cbca10c775fae', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 22:15:42', '0', 'A8E374551E1A2DEFF38850BE99E03EA7', '9');
INSERT INTO `ss_user_log` VALUES ('a11614c5abbb4c75842d01cba508b633', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:56:28', '删除了菜单信息[[c71c9469becf49cebcb410ab9efebd65]]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('a1387919e7a841a2b580e6d3ee6b275a', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:54:28', '删除了菜单信息[[5408cd05c6034811bd6fa8e4eac1fb4d]]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('a147c3c901084bacac491824b44f440e', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-01 17:36:09', '0', 'BD61CCE99EE9791C3CBDA09DB3DF963E', '26');
INSERT INTO `ss_user_log` VALUES ('a159d182e73c4459bb8d19688177a92c', 'ee219a8dcfd1494e82e6afb20cccdbe9', '58.243.254.131', '2018-10-19 18:02:56', '0', '363C5D57F7760D2561D5FD73A00BA587', '2');
INSERT INTO `ss_user_log` VALUES ('a1b2605819cb4e28805c06620e4b096c', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-29 00:02:03', '1', '63B4047C482F51FCDA12C6142613A902', null);
INSERT INTO `ss_user_log` VALUES ('a30eba1533f54de195edc38bba37b19f', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 07:43:23', '1', '48EF38E12894B5C4CEB294C274C987C2', null);
INSERT INTO `ss_user_log` VALUES ('a48b29c79d014f91aac146d53e200d3e', 'ee219a8dcfd1494e82e6afb20cccdbe9', '58.243.254.131', '2018-10-19 18:15:32', '0', 'A318C53F441940CFAD4E148F341D82BC', '3');
INSERT INTO `ss_user_log` VALUES ('a4e02372523a485ea00e55a75598246b', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:27:59', '修改了菜单信息[设备管理]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('a56da5be4c784c81b59f391baceb85fa', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:19:14', '删除了菜单信息[[f244b5740a244f8ea008d06747db200e]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('a6089bcba69240a89d5764af8563f088', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-05 17:57:45', '0', '5FEA30B25D35453F00EFE917199853C6', '1');
INSERT INTO `ss_user_log` VALUES ('a67288468653433e9e71affd02f0947c', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-05-01 19:30:19', '0', 'B4ADFF4E8F5CDB1EC66F948C21AE3156', '23');
INSERT INTO `ss_user_log` VALUES ('abb613409d704117bf523a56cb56043f', '1', '0:0:0:0:0:0:0:1', '2017-04-13 14:13:15', '0', 'BB33CC6CB9A45CB90AEA199BDAC0A246', '57');
INSERT INTO `ss_user_log` VALUES ('ad53dd2dd5104b0ba750b7478f2276cd', '1', '0:0:0:0:0:0:0:1', '2017-03-31 15:51:38', '0', '1D4ED8EB6CC9CE76BFB7B7F1998F38D8', '11');
INSERT INTO `ss_user_log` VALUES ('ae93d6123f544bb99e5dc047cd420977', '1', '0:0:0:0:0:0:0:1', '2017-03-31 14:23:57', '新增了角色信息[农场主]', '1066DC0115DA93A723B3BEC2ACAA15B1', null);
INSERT INTO `ss_user_log` VALUES ('af8b77a3981a481da31f0bac9ca02cf2', '1', '', '2017-03-31 13:14:21', '1', '97AE3D707B5DF0DCFF92C2B4DA39BB56', null);
INSERT INTO `ss_user_log` VALUES ('afff432b2a1345d99ac370a6056a7c8e', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:35:52', '0', '8F8872AB0756B73D8720BD3DC07A7B0E', '88');
INSERT INTO `ss_user_log` VALUES ('b01a5a6f022b441faa5df85d3671385e', '1', '0:0:0:0:0:0:0:1', '2017-04-18 22:39:56', '修改了菜单信息[种植方案配置]', '76FF09DCE5970B6E70F5FC31A28C8425', null);
INSERT INTO `ss_user_log` VALUES ('b01c7952ee304aa28cee440ddc3a9a87', '1', '0:0:0:0:0:0:0:1', '2017-04-07 17:40:37', '0', '59CF17DC7781B828C53AEF791E022C8B', '34');
INSERT INTO `ss_user_log` VALUES ('b070f300445549e4ac08796dd0cc0095', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-17 18:46:05', '0', '6CF2109ECFC1CE33C689EE14564C3191', '33');
INSERT INTO `ss_user_log` VALUES ('b0a7e66e89654af7949e04124e09136b', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-21 23:55:11', '1', '2E8785F9408600F953F82EF8B0908555', null);
INSERT INTO `ss_user_log` VALUES ('b1ae6b6a19d142b4920260f210bbd617', '975c0ddeffa4453681898ebb0d0274f7', '124.200.97.234', '2018-11-01 17:12:39', '0', '61E40F348EFA3EE275B4B2BFE0346875', '56');
INSERT INTO `ss_user_log` VALUES ('b2270521866d4ec98a1a5266236a1375', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:19:54', '删除了菜单信息[[c71c9469becf49cebcb410ab9efebd65]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('b24d029816604cde84709fae64641c65', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:44:02', '修改了菜单信息[灭火器管理]', '9EC7350D109557BE8817893BD1F5811D', null);
INSERT INTO `ss_user_log` VALUES ('b282658dce6a40248be2bc804529558a', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-13 14:13:05', '1', 'BF2BD0C2E1656E68EA62072D3D109C11', null);
INSERT INTO `ss_user_log` VALUES ('b361f485cf5741f9b07b92ccba34b9aa', '1', '0:0:0:0:0:0:0:1', '2017-04-18 17:33:39', '修改了用户信息[admin]', '950A741416744BF0BDC01792D41D2886', null);
INSERT INTO `ss_user_log` VALUES ('b3ef31ff7ed940248eedcaeb76ce7539', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:36:14', '删除了菜单信息[[981d4c14b5834985ab2f88093e1ca5b1]]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('b5fcac04798148869e083eac37091d15', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:14:29', '0', '3CC118735F9203D6B50761C7BDE7E67B', '4');
INSERT INTO `ss_user_log` VALUES ('b63a7a542c3640a185fc9973b8a7a9c8', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:30:05', '修改了菜单信息[巡检记录查询]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('b6c50222eff542acb830893fdb5ade11', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 17:46:20', '0', 'BB93C2E1910BDEE7D047773353B9283E', '9');
INSERT INTO `ss_user_log` VALUES ('b7bdde0839e64b64843103022a974b23', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-19 17:52:59', '1', '36DAD471F51766E61EE7CFD3BD8FDADD', null);
INSERT INTO `ss_user_log` VALUES ('b819d5e0045f49e0a0c91ede6a3b4f3a', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:31:15', '删除了菜单信息[[a18b10fd52634e6d8017d9bcd9acd1e2]]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('badac76056244e29a70d51d610b0199f', '1', '', '2017-04-18 17:40:15', '1', '6288B0DAF372F0BE45B5854E1D89EEAA', null);
INSERT INTO `ss_user_log` VALUES ('bb73ede80ef147cdab5213e827ed02af', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-18 23:48:12', '1', 'D9517C20340B1F64D439557F26C3020D', null);
INSERT INTO `ss_user_log` VALUES ('bb7727a1a5bb451aa95371a4f7984892', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2019-09-03 14:52:02', '0', '289F5B5045C2851DBAF9C2C9F80E8321', '58');
INSERT INTO `ss_user_log` VALUES ('bb94a99203784f1f8f71b9cf9bd6afed', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:19:33', '删除了菜单信息[[d77a4bf02d3e490fb713bdd410f50fa4]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('bbada8a5997045cdbc64bc4ec11e21f7', '1', '', '2019-09-04 13:14:11', '1', '1FA3C154DCB4AB2BFDBA60125A819BEB', null);
INSERT INTO `ss_user_log` VALUES ('bbe932f272ca42a28fb76a487a63178e', '1', '0:0:0:0:0:0:0:1', '2019-09-04 09:33:48', '0', '61795E9A3637D50D01199B0B0BA4ACF3', '79');
INSERT INTO `ss_user_log` VALUES ('bc0deb070dc94f7fabd96934384135f6', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-26 09:27:56', '0', '95E09FE4C108856F55CFCA0A971010AA', '16');
INSERT INTO `ss_user_log` VALUES ('bc2ba12ee16244fe8c6562996d91065d', '1', '0:0:0:0:0:0:0:1', '2017-04-12 22:56:54', '删除了菜单信息[[e86a537f840e4a5881c00930ddfe3e89]]', '69288C27CE92ACAE28DF86682139ACD6', null);
INSERT INTO `ss_user_log` VALUES ('bc50727b65d74e1fafa2c6876ae3ea63', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-21 09:25:22', '1', 'C0021303A3F64213779B70EDF2AC0ACC', null);
INSERT INTO `ss_user_log` VALUES ('bc579eab43e54e8fbac6f149276f1721', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-05-03 11:05:33', '1', 'CA9B67CA49C4F5411D04C13262951C48', null);
INSERT INTO `ss_user_log` VALUES ('be60e625597d4aa39bc55ff74c97939b', '1', '0:0:0:0:0:0:0:1', '2017-04-10 01:32:38', '0', '64406A9D58932B5122BA8BEA8923E634', '43');
INSERT INTO `ss_user_log` VALUES ('bf366f1ac7a34d9e879c6a67bf649880', '1', '0:0:0:0:0:0:0:1', '2017-04-18 17:34:28', '0', '6288B0DAF372F0BE45B5854E1D89EEAA', '68');
INSERT INTO `ss_user_log` VALUES ('bf51c6e426f042849fe9f37fe6fe2c32', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-28 23:52:53', '0', '5288684FC2F247B7D7B8470874855C7D', '19');
INSERT INTO `ss_user_log` VALUES ('bf9cf55dc6f04ba5ab8485e420a4e8bf', '1', '0:0:0:0:0:0:0:1', '2017-04-05 17:20:53', '修改了菜单信息[地块管理]', '1D40E20D31FE80F0F878E73216A6102D', null);
INSERT INTO `ss_user_log` VALUES ('c0a48783c43044b89be0852464723a55', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-20 13:14:39', '0', '2B47C3E3EAA5E7C2B2859EDE7D8083DF', '6');
INSERT INTO `ss_user_log` VALUES ('c19f548aee704702afa7e2dc1e126b17', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 17:08:15', '新增了用户信息[zhufeng]', '52EC886D142C662480E9E55E2EC4C487', null);
INSERT INTO `ss_user_log` VALUES ('c322028be8964246ae8283568d946597', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-21 23:48:53', '1', '629F63E424E181EDB1BE1E5553BD9851', null);
INSERT INTO `ss_user_log` VALUES ('c3b78a70dd02481cb48384a6f33e470c', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:50:05', '新增了角色信息[admin]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('c4b34c4022154a2ba589210f8677a868', '1', '0:0:0:0:0:0:0:1', '2017-04-13 11:29:29', '0', '2280656CFC3D63767D61A8B19F2F9B88', '53');
INSERT INTO `ss_user_log` VALUES ('c4b7c6b360e14ddfa8dd6a5c411e533f', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:19:19', '0', 'ABDE0D5B91137D8A3D394925A17C4FDC', '87');
INSERT INTO `ss_user_log` VALUES ('c4eb210d9be540428628a59fbf0f31ea', '1', '0:0:0:0:0:0:0:1', '2017-04-05 20:59:05', '0', '8CB87A54D662145D5F99D5BB290C2712', '26');
INSERT INTO `ss_user_log` VALUES ('c52d3d5d64914d7ba33d890ad4b1fa7a', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-18 23:21:35', '1', 'E95D41C15D411F96AA013F889B01D243', null);
INSERT INTO `ss_user_log` VALUES ('c68fd5b4becd4cff90ab0317d46c1b9e', '1', '0:0:0:0:0:0:0:1', '2017-04-10 00:34:17', '修改了菜单信息[实时数据监控配置]', 'E4F1EE9F9691B5F864383878D53296BC', null);
INSERT INTO `ss_user_log` VALUES ('c7239883eacb4686894211af583fd2f7', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:04:09', '新增了菜单[制定种植方案]', 'BC9CE542F7B2CF905B2C31D576559508', null);
INSERT INTO `ss_user_log` VALUES ('c758206f03834d7ab2123234f7ad7158', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:31:40', '删除了用户信息[ee219a8dcfd1494e82e6afb20cccdbe9]', 'ABDE0D5B91137D8A3D394925A17C4FDC', null);
INSERT INTO `ss_user_log` VALUES ('c831f9963fe641489fd1827a3531466d', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 07:39:49', '0', 'C6AAAA23C73C11CC1D6F8E4514ABB29C', '27');
INSERT INTO `ss_user_log` VALUES ('c83e4b5d58854573a5c84ca673d5ded2', '1', '0:0:0:0:0:0:0:1', '2017-04-10 00:30:58', '0', 'E4F1EE9F9691B5F864383878D53296BC', '40');
INSERT INTO `ss_user_log` VALUES ('c98cbfdecab34a29ad9447e04ed18672', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 11:18:38', '1', '9319F0C38056F69A6FA22E27D0064860', null);
INSERT INTO `ss_user_log` VALUES ('ca52873f25424178b890e04270de86bc', '1', '0:0:0:0:0:0:0:1', '2017-04-13 14:28:43', '0', 'FA7B99F2ABAEC827C7146A5F674B0C1A', '60');
INSERT INTO `ss_user_log` VALUES ('caebaa9c279b4e16a0762fad7d614e26', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:41:59', '新增了用户信息[admin]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('caf42ccaae6d4231883c5476e1bb553c', '1', '0:0:0:0:0:0:0:1', '2017-04-10 01:32:25', '修改了菜单信息[收益数据配置]', '2A6E85FBC6799C0C6EFA5E9801D8154A', null);
INSERT INTO `ss_user_log` VALUES ('cbcb3b1f833e4e0bad516b68666b56f6', '1', '', '2017-04-01 16:53:46', '1', '7F5B66FE885246009012A5661A4EE568', null);
INSERT INTO `ss_user_log` VALUES ('cd9b4ceef86842f1ad1a8dd802479c71', '1', '0:0:0:0:0:0:0:1', '2017-04-08 10:47:31', '0', '3475CE91462A046E5129FAA9E9DB5FA3', '37');
INSERT INTO `ss_user_log` VALUES ('cefb97b8e0774e7ba32ebccf3fbf97fb', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:19:22', '删除了菜单信息[[cfac8a3df8b940e690f72860697b2b36]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('cfb42f373ba74532a8b766e81dfca239', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 07:43:32', '0', '512BCA1E410E35F4C8A5AFB38BF897CF', '28');
INSERT INTO `ss_user_log` VALUES ('d0d8f24ee8044d5ab94ee1de6e94ca64', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-19 15:29:42', '0', 'A819F0F6C5492D7D966FB8244634EFAA', '42');
INSERT INTO `ss_user_log` VALUES ('d27540fbcf0844498b8455e66637c70c', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 23:19:41', '0', '659C2231752775A6AE35687C53048F23', '11');
INSERT INTO `ss_user_log` VALUES ('d30d3d22879043fdab2bef5e2e422e6b', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:54:25', '删除了菜单信息[[3550a9d36dd646cdbed9b0b4c2a54376]]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('d69e9b88ebda402b9b41b644d9f024aa', '47b13e33493a46c488c859b867c06090', '', '2018-10-19 17:12:21', '1', 'E91FD1513F92238C7104FE1DDA6628C2', null);
INSERT INTO `ss_user_log` VALUES ('d724f46d49af4f7a9c2ba3bdf4e0f56a', '47b13e33493a46c488c859b867c06090', '58.243.254.131', '2018-10-19 17:15:27', '0', '9324CDCDA12F23FA60797D966038AF58', '3');
INSERT INTO `ss_user_log` VALUES ('d8a5d6ede0ed4a04b83030171b243f9d', '1', '', '2019-09-05 17:35:29', '1', 'ABDE0D5B91137D8A3D394925A17C4FDC', null);
INSERT INTO `ss_user_log` VALUES ('d9931269b6794b158b656466514f319d', '1', '0:0:0:0:0:0:0:1', '2019-09-03 14:48:26', '0', 'E15F37707C120FBE8F981BD8B4162794', '72');
INSERT INTO `ss_user_log` VALUES ('d9b597c96eac4566baee4ebaf5db044b', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-20 13:11:43', '1', '2703E057412FD543FDFAA03D457B7F7B', null);
INSERT INTO `ss_user_log` VALUES ('da6975b9cb07436f82cca975d0da912a', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:50:28', '新增了角色信息[巡检员]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('db77d66a8ab24fd9ae33616e2125330b', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:19', '删除了菜单信息[[ec685952e09c4d5d88d9f21874575e2e]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('dd764ddb48c9496aa346da73998e561e', '975c0ddeffa4453681898ebb0d0274f7', '124.200.97.234', '2018-11-14 16:34:22', '0', '59195673D1B79296D4ADA91165965727', '57');
INSERT INTO `ss_user_log` VALUES ('ddb14f3a7dc54d45ac173f3756b79adc', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:07:16', '修改了菜单信息[实时进展信息]', 'BC9CE542F7B2CF905B2C31D576559508', null);
INSERT INTO `ss_user_log` VALUES ('de55fdd383e644cb89b863f8675d4dad', '47b13e33493a46c488c859b867c06090', '49.90.23.252', '2018-10-19 17:28:52', '0', '4414412A0CED64A1FA788262C5225D05', '4');
INSERT INTO `ss_user_log` VALUES ('df37031e7ecf49908e19132e10d3542b', '1', '0:0:0:0:0:0:0:1', '2017-03-31 14:23:26', '修改了角色信息[系统管理员]', '1066DC0115DA93A723B3BEC2ACAA15B1', null);
INSERT INTO `ss_user_log` VALUES ('df5bdcdc755b4ede9dc51b7dba3dd5e0', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-11-01 17:14:24', '1', '61E40F348EFA3EE275B4B2BFE0346875', null);
INSERT INTO `ss_user_log` VALUES ('dfe728325fa048099e02b38fe0bf0aaa', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:18:18', '删除了菜单信息[[acd31b8a94ce4ca8bf151c5ca94273ad]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('e0512c45430745bc98645651cb3e92ff', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:36', '删除了菜单信息[[4dd11e1ec16840d5bbf9f0513cd7b4b3]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('e05ccdb9519348bdb4a279063ac41c7b', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-04-29 23:30:25', '1', '70956EDEA411C381A09E73501D552419', null);
INSERT INTO `ss_user_log` VALUES ('e1127c18bd9f46e7a9df4e748aed2e4d', '1', '0:0:0:0:0:0:0:1', '2017-04-17 23:51:35', '删除了菜单信息[[fdb26159a14d494fa59b32b1c3cd2112]]', '34F61B40DB379660F9244FF535482C83', null);
INSERT INTO `ss_user_log` VALUES ('e11b46f7177f4cf0839bc17567c764cd', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-19 17:08:29', '1', '52EC886D142C662480E9E55E2EC4C487', null);
INSERT INTO `ss_user_log` VALUES ('e1af8e44da3e4dfca630b5c292c03b09', '1', '0:0:0:0:0:0:0:1', '2017-04-04 15:31:09', '0', 'E99483F057FCEA23B475560D3B815DFA', '18');
INSERT INTO `ss_user_log` VALUES ('e226ea18493642dcb9d5b7a59a7c84f2', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-14 16:58:09', '0', '0A18B7E38083462DDBC3D699EBD904A3', '12');
INSERT INTO `ss_user_log` VALUES ('e26e6a909c354fd3a70854662c73bb21', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-05-03 11:10:21', '1', '0F7EB4C2AD5E479AF24D780E64A81D3F', null);
INSERT INTO `ss_user_log` VALUES ('e2f73cfa60aa4daeb4bdafa0d3b5f008', '1', '0:0:0:0:0:0:0:1', '2017-04-13 15:24:53', '0', '4DB7102B118FDA0202BCE7F3C4FBE688', '61');
INSERT INTO `ss_user_log` VALUES ('e3140adf3061428c9d06c545cd1d8226', '6789e4c5bff54efcacc0cbcc7f42a4de', '61.148.245.25', '2018-10-21 09:14:03', '0', '0E03C0D68AF392F67EE82397D3655520', '1');
INSERT INTO `ss_user_log` VALUES ('e3f32a93e28145e5967d54b36dcc30f7', '1', '0:0:0:0:0:0:0:1', '2017-04-05 17:21:05', '0', '6D7DBBF91EA3BFF9B1D3079CD5B9BEB1', '23');
INSERT INTO `ss_user_log` VALUES ('e40a0ec3e8a04171991b41cbcefcc727', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 12:11:02', '0', '8E7BC24A3B806EEAB038C17C96C45BC2', '3');
INSERT INTO `ss_user_log` VALUES ('e5a660cf1ee0486ea7c557422784f8f3', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-05-03 11:14:35', '1', 'C753613CB9F97A5AB1A2430126542E9F', null);
INSERT INTO `ss_user_log` VALUES ('e61793068d7d4f6ca2b38a455f5ba151', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 14:09:33', '0', '130345B0F9FF85EECC13FB1C5DA4F486', '6');
INSERT INTO `ss_user_log` VALUES ('e7ab1c078c3d44bca5203190169a08b9', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 23:48:58', '0', '6DCD42025D46542169F5E823E45A3D96', '14');
INSERT INTO `ss_user_log` VALUES ('e7faa0cf7be34e398b8865e9d507e673', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 11:05:56', '0', '0F7EB4C2AD5E479AF24D780E64A81D3F', '31');
INSERT INTO `ss_user_log` VALUES ('e8341aedbada433d908cf14c09e9750d', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-18 22:35:16', '1', 'BDED79678BC91BB32FBC255650859C3F', null);
INSERT INTO `ss_user_log` VALUES ('e902c462a41640d2b54f103fd8666792', '1', '0:0:0:0:0:0:0:1', '2017-04-18 16:34:57', '0', '950A741416744BF0BDC01792D41D2886', '67');
INSERT INTO `ss_user_log` VALUES ('ea968a868d2e4f2a96813e4a2ea5c291', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-05-03 11:21:27', '0', '08D5CB47CA2085DA076DCF1DDB1CBDAB', '34');
INSERT INTO `ss_user_log` VALUES ('eaaae8e92cd449028c93ebd665d47ce6', '1', '0:0:0:0:0:0:0:1', '2017-04-17 16:24:19', '0', '339C49B653248127048A9AC5CA1E6A7B', '63');
INSERT INTO `ss_user_log` VALUES ('eb30fb0c579447f799958bb4ed734dd4', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-21 22:48:18', '1', 'A8E374551E1A2DEFF38850BE99E03EA7', null);
INSERT INTO `ss_user_log` VALUES ('ebcdcc2e9d4643098488d6b40d83caf5', '3ac0c6a64b29471288668c689e57b2c4', '', '2017-05-03 11:20:40', '1', '5D7C857286F5E3A5B1072D6A434634F1', null);
INSERT INTO `ss_user_log` VALUES ('ee5ad0aa3b224724ab2ff0e26a0ef7ea', '1', '0:0:0:0:0:0:0:1', '2017-04-01 16:50:45', '0', '73AC91CF79B8699D861F4C85D62FBC8D', '12');
INSERT INTO `ss_user_log` VALUES ('eeb551a0285044d4a2100702b2df8fa9', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:02:55', '修改了菜单信息[功能导航]', 'BC9CE542F7B2CF905B2C31D576559508', null);
INSERT INTO `ss_user_log` VALUES ('ef226f330a2b4f83b302c093a83dd15d', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-29 00:02:12', '0', '8E0D2A6B2D5D1855B5745BB59DC3E6C9', '20');
INSERT INTO `ss_user_log` VALUES ('ef8aefa7663b4b7db5f73d851c43789a', '1', '0:0:0:0:0:0:0:1', '2017-04-12 23:05:16', '新增了菜单[实时进展]', 'BC9CE542F7B2CF905B2C31D576559508', null);
INSERT INTO `ss_user_log` VALUES ('f08e0298ad8f49bfbad60cd7bc254a32', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:45:44', '修改了用户信息[will]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('f0e4ecf56d1d49528d3c572d1385cd5f', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-04-20 13:14:30', '1', '8DF1394151271D7BEC4AB83FDB9B0D93', null);
INSERT INTO `ss_user_log` VALUES ('f10d6c1ef00244878eb5df7e29fcb73a', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:29:51', '新增了菜单[巡检记录查询]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('f2014f84bfc64904896ad3f52c6c3370', '975c0ddeffa4453681898ebb0d0274f7', '58.243.254.131', '2018-10-17 19:10:28', '0', '570C1BBA30AA6EC3C85D7E8E0D9D466A', '36');
INSERT INTO `ss_user_log` VALUES ('f32875ab9c744db89075f0c3005ee231', 'cd0154dddbff4c6786bb7859cb03ed28', '', '2019-09-07 10:39:30', '1', 'A2A9B5DBEB45B5DF1B92E0E57D903595', null);
INSERT INTO `ss_user_log` VALUES ('f48d022c9fe844b5b07e22f6be20d5a4', '1', '0:0:0:0:0:0:0:1', '2017-04-13 00:10:54', '0', 'BDE0040F4E3C0954FABF28C750320D73', '50');
INSERT INTO `ss_user_log` VALUES ('f54ed4fd7de84587b68a9b254655d1c4', '1', '0:0:0:0:0:0:0:1', '2017-04-05 20:03:23', '0', '719936797D4041E27E80B28FEC97E639', '25');
INSERT INTO `ss_user_log` VALUES ('f6d8178474594b30b194d3609605eba0', '1', '0:0:0:0:0:0:0:1', '2017-04-07 17:49:37', '0', 'E2F8699E19ADA4CB55BFFA013703C3DE', '35');
INSERT INTO `ss_user_log` VALUES ('f7387dd47c8946089bc4f4448761c052', '1', '0:0:0:0:0:0:0:1', '2017-04-10 00:34:55', '0', '281048EF7EE500D7D374DBB70138411A', '41');
INSERT INTO `ss_user_log` VALUES ('f7b2acf675bd4e928fed5f2157233d93', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:40', '删除了菜单信息[[af430813e8334fd9811964bd12ef376d]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('f823778a6bb4423190d75c03a8a8a7e2', '1', '', '2017-03-31 13:20:47', '1', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('f909210fbed340dfb4dfb69eb2b21a7e', '975c0ddeffa4453681898ebb0d0274f7', '0:0:0:0:0:0:0:1', '2017-04-21 23:39:00', '0', '19B74C3230E8DB4CF59BBC2C847FAC65', '12');
INSERT INTO `ss_user_log` VALUES ('fa2a967de9364bcbb1f7b24f5c58ed04', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 10:29:59', '修改了菜单信息[灭火器管理]', 'DEFF70B87082E50402CA4B92DEFE192C', null);
INSERT INTO `ss_user_log` VALUES ('fbdfded387bb4fdba6127ba99763c42c', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:19:03', '删除了菜单信息[[e0813cee5145437fabe383996824d4b1]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('fc85b3511da74fdaabeeba14b9f76f58', '1', '0:0:0:0:0:0:0:1', '2017-04-17 17:00:40', '0', '235563046083AF4834309E84D073E31C', '64');
INSERT INTO `ss_user_log` VALUES ('fcdad6409a1041b593cec150cf111199', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:56:21', '删除了菜单信息[[cfac8a3df8b940e690f72860697b2b36]]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('fd3aff8840564a9689ec2b2141c1e13d', '975c0ddeffa4453681898ebb0d0274f7', '', '2017-05-03 06:51:14', '1', 'C2908943ED335F91F6718197F3758F46', null);
INSERT INTO `ss_user_log` VALUES ('fda6efb18cf04af18b79eb50b4ad5350', '1', '', '2019-09-05 17:57:39', '1', '94ED40E2715DA48885D81D4C45D7EE6C', null);
INSERT INTO `ss_user_log` VALUES ('fe18db01217e4ee98a7ed95b4f34a38f', '3ac0c6a64b29471288668c689e57b2c4', '0:0:0:0:0:0:0:1', '2017-04-13 12:21:42', '0', '995EA4C46F9783F433275076499E3B1B', '4');
INSERT INTO `ss_user_log` VALUES ('fe87a23b774342879d7c7f90b2e74573', 'cd0154dddbff4c6786bb7859cb03ed28', '0:0:0:0:0:0:0:1', '2019-09-07 16:44:34', '0', 'C4EE7EDA5B6E723D098893F1172DD9D5', '6');
INSERT INTO `ss_user_log` VALUES ('fef80c66478646b2b78dd9ae4e1dbf54', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:20:00', '删除了菜单信息[[0bf97d7964de4ca7b59ccf5c3c4f6879]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('ff19b06d03464bbfaf7dab01e8909e42', '1', '0:0:0:0:0:0:0:1', '2017-04-18 17:33:01', '修改了用户信息[will]', '950A741416744BF0BDC01792D41D2886', null);
INSERT INTO `ss_user_log` VALUES ('ff3c186d83b546e7ab60999f6437fd72', '1', '0:0:0:0:0:0:0:1', '2017-03-31 13:18:43', '删除了菜单信息[[e72a1d4a8a6b4188ac556321bc8e677a]]', '3CC118735F9203D6B50761C7BDE7E67B', null);
INSERT INTO `ss_user_log` VALUES ('ff6e5e264f4241509872ff4bc878258b', '975c0ddeffa4453681898ebb0d0274f7', '', '2018-10-19 10:03:05', '1', '973E3E4D1619B2D6B86FEED63BC91F1C', null);
INSERT INTO `ss_user_log` VALUES ('ff94cfb2431f46a2ac4da9c5dc8d8e03', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:57:05', '0', '94ED40E2715DA48885D81D4C45D7EE6C', '89');
INSERT INTO `ss_user_log` VALUES ('ffd585cbfedc4cf7a4e1d62c6a2b175f', '1', '0:0:0:0:0:0:0:1', '2019-09-05 17:39:02', '新增了用户信息[巡检员1]', '8F8872AB0756B73D8720BD3DC07A7B0E', null);
INSERT INTO `ss_user_log` VALUES ('fff77722253c4ca7ada57e7e7f7bb3d6', '1', '0:0:0:0:0:0:0:1', '2017-03-31 14:26:11', '0', '2B4A655B05F9A060094E37AF6A87D76F', '10');

-- ----------------------------
-- Table structure for ss_user_role
-- ----------------------------
DROP TABLE IF EXISTS `ss_user_role`;
CREATE TABLE `ss_user_role` (
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `role_id` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK1306854B4BFAA13E` (`role_id`) USING BTREE,
  CONSTRAINT `ss_user_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `ss_role` (`id`),
  CONSTRAINT `ss_user_role_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ss_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_user_role
-- ----------------------------
INSERT INTO `ss_user_role` VALUES ('242836a8123a4c829707527845e337cb', '276ea7451f084c0199bd60e1de9d1060');
INSERT INTO `ss_user_role` VALUES ('1', 'da8408bb19ca443bb5072823669283d6');
INSERT INTO `ss_user_role` VALUES ('cd0154dddbff4c6786bb7859cb03ed28', 'da8408bb19ca443bb5072823669283d6');

-- ----------------------------
-- Table structure for ss_widget
-- ----------------------------
DROP TABLE IF EXISTS `ss_widget`;
CREATE TABLE `ss_widget` (
  `id` varchar(255) NOT NULL DEFAULT '' COMMENT 'ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  `create_user_id` varchar(50) DEFAULT NULL COMMENT '创建人',
  `last_update_user_id` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  `name` varchar(255) NOT NULL COMMENT '部件名称',
  `url` varchar(255) NOT NULL COMMENT '部件地址',
  `status` varchar(255) DEFAULT NULL COMMENT 'Description',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ss_widget
-- ----------------------------
INSERT INTO `ss_widget` VALUES ('0ed0d750d1b0436d89ef1a4b2b33e443', '2014-06-05 14:24:20', '2014-06-05 15:12:22', '1', '1', '代办事项', 'widget/scheduler', 'disabled');
INSERT INTO `ss_widget` VALUES ('314e8444c03b4a1fba7d5b17d019eed6', '2014-06-05 15:14:35', '2014-06-05 15:14:35', '1', '1', '通知公告', 'widget/notice', 'disabled');
INSERT INTO `ss_widget` VALUES ('7c76fc1b7f2644c89fc79af64329278c', '2014-06-05 14:40:34', '2014-06-05 22:12:49', '1', '1', '天气', 'static/widget/weather.jsp', 'enabled');
INSERT INTO `ss_widget` VALUES ('c0c9bf1b590141e8a28d3da98591583b', '2014-06-18 10:37:08', '2014-06-18 10:37:08', '1', '1', '我的信息', 'static/widget/myInfo.jsp', 'enabled');
INSERT INTO `ss_widget` VALUES ('c83e1793f9f04dc890bf15f4c6c654fc', '2014-07-28 21:31:33', '2014-07-28 21:31:33', '1', '1', '历史趋势', 'static/widget/lsqx.jsp', 'enabled');
INSERT INTO `ss_widget` VALUES ('ea5303a71406436da1a6cc5e7137be1d', '2014-06-05 21:08:28', '2014-06-05 22:12:55', '1', '1', '日历', 'static/widget/calendar.jsp', 'enabled');
INSERT INTO `ss_widget` VALUES ('f9ba5c9d0f174ba1beb43e2b40c96752', '2014-06-18 13:52:13', '2014-06-18 13:52:24', '1', '1', '区域设备总览', 'static/widget/eqList.jsp', 'enabled');

-- ----------------------------
-- Table structure for write_table
-- ----------------------------
DROP TABLE IF EXISTS `write_table`;
CREATE TABLE `write_table` (
  `sn` int(11) NOT NULL AUTO_INCREMENT,
  `gateway_logo` varchar(50) DEFAULT NULL,
  `sensor_name` int(11) DEFAULT NULL,
  `start_addr` int(11) DEFAULT NULL,
  `data_val` longtext,
  `cmd_status` int(11) DEFAULT NULL,
  `reval` int(11) DEFAULT NULL,
  `cmd_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of write_table
-- ----------------------------
DROP TRIGGER IF EXISTS `infomation_cf_insert`;
DELIMITER ;;
CREATE TRIGGER `infomation_cf_insert` AFTER INSERT ON `ec_infomation` FOR EACH ROW begin set @x = "hello trigger";
       
end
;;
DELIMITER ;
