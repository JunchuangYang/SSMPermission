/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50640
Source Host           : localhost:3306
Source Database       : permissionssm

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2020-11-19 09:15:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义、主键uuid',
  `name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `nickName` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '昵称',
  `phoneNum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `email` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES ('AAAAAAAAAAAAAA', '李四', '小四', '20202020202', 'LIsi@163.com');
INSERT INTO `member` VALUES ('BBBBBBBBBBBBBB', '王五', '小吴', '17803005858', 'XiaoWU@163.com');
INSERT INTO `member` VALUES ('E61D65F673D54F68B0861025C69773DB', '张三', '小三', '18888888888', 'zs@163.com');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义、主键uuid',
  `orderNum` varchar(20) COLLATE utf8_bin NOT NULL COMMENT '订单编号 不为空 唯一',
  `orderTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '下单时间',
  `peopleCount` int(11) DEFAULT NULL COMMENT '出行人数',
  `orderDesc` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '订单描述(其它信息)',
  `payType` int(11) DEFAULT NULL COMMENT '付方式(0 支付宝 1 微信 2其它)',
  `orderStatus` int(11) DEFAULT NULL COMMENT '订单状态(0 未支付 1 已支付)',
  `productId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '产品id',
  `memberId` varchar(32) COLLATE utf8_bin DEFAULT NULL COMMENT '会员id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderNum` (`orderNum`),
  KEY `productId` (`productId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`memberId`) REFERENCES `member` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '12345', '2018-02-03 12:00:00', '2', '没什么', '0', '1', '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '67890', '2020-11-17 08:24:44', '2', '没什么', '1', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'AAAAAAAAAAAAAA');
INSERT INTO `orders` VALUES ('3081770BC3984EF092D9E99760FDABDE', '55555', '2020-11-17 08:24:46', '2', '没什么', '2', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'BBBBBBBBBBBBBB');
INSERT INTO `orders` VALUES ('3B9A2F04BB01427D8745F39586C92D90', '34567', '2020-11-17 08:25:59', '2', '', '3', '0', '35DBF13FEA6B4624B390E3CB578A62D9', 'AAAAAAAAAAAAAA');
INSERT INTO `orders` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', '33333', '2020-11-17 08:24:48', '2', '没什么', '1', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '54321', '2020-11-17 08:24:50', '2', '没什么', '2', '1', '676C5BD1D35E429A8C2E114939C5685A', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', '22222', '2020-11-16 21:44:58', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'BBBBBBBBBBBBBB');
INSERT INTO `orders` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '98765', '2020-11-17 08:24:52', '2', '没什么', '1', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', '44444', '2020-11-17 08:24:53', '2', '没什么', '2', '1', '9F71F01CB448476DAFB309AA6DF9497F', 'E61D65F673D54F68B0861025C69773DB');
INSERT INTO `orders` VALUES ('E4DD4C45EED84870ABA83574A801083E', '11111', '2020-11-16 21:45:06', '2', '没什么', '0', '1', '12B7ABF2A4C544568B0A7C69F36BF8B7', 'BBBBBBBBBBBBBB');

-- ----------------------------
-- Table structure for order_traveller
-- ----------------------------
DROP TABLE IF EXISTS `order_traveller`;
CREATE TABLE `order_traveller` (
  `orderId` varchar(32) COLLATE utf8_bin NOT NULL,
  `travellerId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`orderId`,`travellerId`),
  KEY `travellerId` (`travellerId`),
  CONSTRAINT `order_traveller_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_traveller_ibfk_2` FOREIGN KEY (`travellerId`) REFERENCES `traveller` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of order_traveller
-- ----------------------------
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '000000000000');
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('2FF351C4AC744E2092DCF08CFD314420', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('5DC6A48DD4E94592AE904930EA866AFA', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('A0657832D93E4B10AE88A2D4B70B1A28', '3FE27DF2A4E44A6DBC5D0FE4651D3D3E');
INSERT INTO `order_traveller` VALUES ('0E7231DC797C486290E8713CA3C6ECCC', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('3081770BC3984EF092D9E99760FDABDE', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('55F9AF582D5A4DB28FB4EC3199385762', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('96CC8BD43C734CC2ACBFF09501B4DD5D', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('CA005CF1BE3C4EF68F88ABC7DF30E976', 'EE7A71FB6945483FBF91543DBE851960');
INSERT INTO `order_traveller` VALUES ('E4DD4C45EED84870ABA83574A801083E', 'EE7A71FB6945483FBF91543DBE851960');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `pid` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义，主键uuid',
  `permissionName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '权限名',
  `url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '资源路径',
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('123', 'user findAll', '/user/findAll.do');
INSERT INTO `permission` VALUES ('234', 'user findById', '/user/findById.do');

-- ----------------------------
-- Table structure for persistent_logins
-- ----------------------------
DROP TABLE IF EXISTS `persistent_logins`;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `series` varchar(64) COLLATE utf8_bin NOT NULL,
  `token` varchar(64) COLLATE utf8_bin NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of persistent_logins
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '产品编号',
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品名',
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '出发城市名',
  `departureTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出发时间',
  `productPrice` double DEFAULT NULL COMMENT '产品价格',
  `productDesc` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '产品描述',
  `productStatus` int(11) DEFAULT NULL COMMENT '产品状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`,`productNum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('0E64A795156F45DEAC07FB0A72A92B27', 'itcast-004', '北京4日游', '北京', '2020-05-25 16:13:48', '10000', '', '1');
INSERT INTO `product` VALUES ('12B7ABF2A4C544568B0A7C69F36BF8B7', 'xpt-003', '上海五日游', '上海', '2018-04-25 14:30:00', '1800', '魔都我来了', '0');
INSERT INTO `product` VALUES ('35DBF13FEA6B4624B390E3CB578A62D9', 'itcast-002', '北京2日游', '北京', '2020-05-25 16:13:24', '100', '', '0');
INSERT INTO `product` VALUES ('4E50876AFC96414D98711A387A9ED927', 'itcast-003', '北京3日游', '北京', null, '100', '', '0');
INSERT INTO `product` VALUES ('676C5BD1D35E429A8C2E114939C5685A', 'xpt-002', '北京二日游', '北京', null, '1200', '不错的旅行', '1');
INSERT INTO `product` VALUES ('9F71F01CB448476DAFB309AA6DF9497F', 'xpt-001', '北京一日游', '北京', null, '1200', '不错的旅行', '1');
INSERT INTO `product` VALUES ('CEC75B42A32D43F485C8000104B996D1', 'itcast-006', '北京6日游', '北京', null, '100', '', '1');
INSERT INTO `product` VALUES ('f55a998e8d764f669f7583cb1bd93193', 'itcast-001', '北京1日游', '北京', '2020-05-18 22:10:51', '100', '哈哈哈哈', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义，主键uuid',
  `roleName` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色名',
  `roleDesc` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '角色描述',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1111', 'ADMIN', 'vip');
INSERT INTO `role` VALUES ('2222', 'USER', 'vip');
INSERT INTO `role` VALUES ('3333', 'EMP', 'ordinary');
INSERT INTO `role` VALUES ('4444', 'GUEST', 'ordinary');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `permissionId` varchar(32) COLLATE utf8_bin NOT NULL,
  `roleId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`permissionId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`permissionId`) REFERENCES `permission` (`pid`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('123', '1111');
INSERT INTO `role_permission` VALUES ('234', '1111');
INSERT INTO `role_permission` VALUES ('123', '2222');

-- ----------------------------
-- Table structure for syslog
-- ----------------------------
DROP TABLE IF EXISTS `syslog`;
CREATE TABLE `syslog` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '主键 无意义uuid',
  `visitTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '访问时间',
  `username` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '操作者用户名',
  `ip` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '访问ip',
  `url` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '访问资源url',
  `executionTime` int(11) DEFAULT NULL COMMENT '执行时长',
  `method` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '访问方法',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of syslog
-- ----------------------------
INSERT INTO `syslog` VALUES ('001FE1F531434EA9AE063D7C1DAFBFD5', '2020-11-16 21:34:12', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '9', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('00FFF9040FBC4594AD8D2389F0DB874D', '2020-11-16 15:35:45', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '226', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('0127FF82A93D46E6A57B271B72E4DC3B', '2020-11-16 15:31:49', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '16', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('014BECB944814EB981CBBD11E5E5CEF2', '2020-11-18 11:09:06', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '8', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('0229A812F59043CBB33F913D42E3F57A', '2020-11-18 19:43:07', 'lzx', '0:0:0:0:0:0:0:1', '/user/modifyUser.do', '720', '[类名] com.itheima.web.UserController[方法名] modifyUser');
INSERT INTO `syslog` VALUES ('02B69C55861346AF8891906E34E86D10', '2020-11-16 15:28:59', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '13', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('02F2365EDA9645DA850A407FAA123AB5', '2020-11-16 21:41:11', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '11', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('0351541CC1F3473BA05D822CAFE639F1', '2020-09-30 20:14:25', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('03C35C8017514EE88380657FC157F7B6', '2020-11-16 21:45:44', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '5', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('03F3852B2717472C854D728A990E1A44', '2020-09-30 20:14:04', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '263', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('042FFF5FD89D4D6EAB9F0BC6D160988F', '2020-09-30 20:14:37', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('04A5DDD33DF64FEABA09D29E5729B175', '2020-11-18 19:47:48', 'lzx', '0:0:0:0:0:0:0:1', '/user/modifyUser.do', '408', '[类名] com.itheima.web.UserController[方法名] modifyUser');
INSERT INTO `syslog` VALUES ('056034B73B034C8B89F8227AAABD0B1C', '2020-11-18 16:53:32', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '11', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('05B960AD2DA34391AA896318D3132284', '2020-09-30 20:14:00', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('05E23F755DB9432D9DF1169D55F970CD', '2020-09-30 20:15:14', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '4', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('061754F0A5A84E6388632756FA8D2DCC', '2020-11-17 14:53:56', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '383', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('063D77CFF4724A8EAD9AAA1F8C0DA181', '2020-11-18 11:07:02', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findById.do', '2', '[类名] com.itheima.web.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('0744DB53B78E4541AAE38922BE26C80B', '2020-11-18 11:08:59', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '9', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('08CED42D38AC478492993081AFA7C4D8', '2020-11-18 11:07:34', 'lzx', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPer.do', '20', '[类名] com.itheima.web.RoleController[方法名] findRoleByIdAndAllPer');
INSERT INTO `syslog` VALUES ('0CAC36469BE047A6934401D75BA07858', '2020-09-30 20:15:23', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('0E49768BA75B4F2C84864DB9E0DF45C6', '2020-11-17 08:17:42', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '35', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('0EC856B70EBA4C6BB778A65A802816F5', '2020-09-30 20:14:36', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('0EF0068DF46B45A885F397923721570F', '2020-11-18 16:47:18', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '24', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('0F2B9D41E3F346D0A5AEC65A02453564', '2020-11-17 08:17:39', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '11', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('100386A1503F40B3B7A1B54923A1F850', '2020-09-30 20:16:39', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('10ABD071B0154E2F8D3747883876388F', '2020-09-30 20:14:47', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('10B1859E6F5D4727BA4C1AD6FF718495', '2020-11-18 11:10:34', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '17', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1194EA2F81FA446BB2789E804B50F081', '2020-09-30 20:15:08', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('11CC437BB5D84FF9A82A2E22FD35F44B', '2020-11-16 21:11:15', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '43', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('13157339B299460EB5D9AF68A76B0D04', '2020-11-16 15:37:24', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '33', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('13591DBC81C9431A83CE85738F1FD28C', '2020-11-16 21:38:53', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '183', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('13E8EAABE872477CA673FEDED324CEC1', '2020-11-16 15:31:52', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1523507FF265420CBADFFD93B04B1531', '2020-11-16 20:57:42', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('155043DEBDA44D6E8D78B70A382A8851', '2020-11-16 21:30:04', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '28', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('161782BB7A694A229358A6A25688BA8B', '2020-11-18 11:09:39', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '10', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('16AD42281172495AA482B490DAF1D098', '2020-09-30 20:16:42', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('187A18A9ECC0436E8F1356574FA70A9C', '2020-11-18 10:59:56', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '368', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('198CE277CCCC48CCB2FDCE45D8B11D81', '2020-11-17 08:25:36', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '35', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('199A2EE52985451F8AC4F06DEA9E4E8C', '2020-09-30 20:14:36', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('19D1DE7A60B045F4B946039DF5B5C909', '2020-11-14 20:01:49', 'lzx', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', '63', '[类名] com.itheima.web.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('19E89510EE1B43DF8ECA89F576491A33', '2020-11-16 21:11:24', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('19F16DC4BC994B13A1D6D4871DB321DC', '2020-09-30 20:15:15', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1ABBC100558E44709DAA7FF10B5562BE', '2020-09-30 20:17:09', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1AC583B358D547AEB706AFD7DB2F26A0', '2020-11-16 17:37:04', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '49', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1B2C5B211F25448F8C6D13A3411EE3C8', '2020-11-18 19:38:38', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '37', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1BD18A92CCF14ED2A8D5F559A4AA19D2', '2020-11-16 21:52:01', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '17', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1C81D80BBC4D4C978A3E0D5D4561C217', '2020-09-30 20:13:55', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '10', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1CBD8AC95D624F9AB8241489367B395E', '2020-11-18 11:10:20', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1D0D7962383A44F2BFC690E2D3F06C57', '2020-09-30 20:14:40', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1E7C13883AED4C68A6C52337D074E11D', '2020-11-18 11:10:13', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('1E7C70B23F654233AD7B417AD5376340', '2020-11-16 21:11:22', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '16', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('208A9817432B4607A2660CFA3560630F', '2020-09-30 20:15:19', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('209302CB0EFE4196BB564AB1FAA82E93', '2020-11-16 21:51:55', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '272', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('212D8313692F44CEA110BAB6D57A26E6', '2020-11-16 21:49:46', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '12', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('23970DBE32624B329870ECA4D52C0171', '2020-11-18 18:51:43', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '341', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('23AEEAD6869545C7BEA2E29436D9BE4F', '2020-11-18 16:53:13', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '45', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('240967D6DF8F42EA8CFCA7C50E12F638', '2020-11-16 15:31:43', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '19', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2524018D19FB405D9C42CDA2E194BA45', '2020-11-14 20:02:05', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '24', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('25CD65F7505F4A80A5048AE6D19704C1', '2020-09-30 20:15:07', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('26B30430243E4351B73D0E84A0559531', '2020-09-30 20:14:52', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2712BC1843A24DACA6C635E2A52B4F36', '2020-09-30 20:13:45', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2972992BA70E413AABBD0A5C042576CE', '2020-09-30 20:14:11', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '73', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('2B457F45A25F46548006E3CE86B53AE9', '2020-09-30 20:13:38', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2C4DEC5AA66E4123AC7DFBC628C9AA95', '2020-11-16 15:37:19', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '34', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2C59BA3CA8DB4F90B2B04DB9F2495CFB', '2020-09-30 20:15:39', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2DD89874C1FE43B98CB1F30233646990', '2020-11-17 08:26:12', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2F00AF8FB57A4D90AD88D5C04DFBB87D', '2020-09-30 20:15:08', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2F0BBCAE4EE94D6E8AA35C84757026D7', '2020-11-16 21:45:41', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '17', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2FD4DDAB58704C43A609F538C55D5DCA', '2020-11-16 15:34:40', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('2FE103871D5E4B7BB8E1205603A14C1C', '2020-11-16 15:38:29', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('302A9C9A49DD4E759A726D9C0695F301', '2020-09-30 20:15:15', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('31CAE260660C4949A774B9E96AB10CC9', '2020-09-30 20:15:18', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3271C5DAF98D4419A42E23B7AC546DAD', '2020-11-18 11:06:52', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('32A0B1EBCB9D4394BA16F024B15C3A82', '2020-11-16 21:03:06', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('32A3B018D8054627BB9980BE2035E8D4', '2020-11-16 21:29:58', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('32EB2108698046DBAA38C64A88DB5EE6', '2020-11-16 21:19:07', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '13', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('33453BD4005E459FABB5E27D90BA6819', '2020-11-18 11:09:12', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '6', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('33F51E8E07EE4C95B95118951466BF3B', '2020-11-16 15:34:47', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '46', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('35885DA2A92E41D3873F498ED3F95F34', '2020-11-18 11:10:10', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('35E291F9E4EE4177B48DADDF827B4127', '2020-11-17 08:26:03', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '18', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('381ED09B59FB4806905B2EE5D0212088', '2020-09-30 20:14:36', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('38B41359A4134F9F95B68E6363744811', '2020-11-18 11:07:20', 'lzx', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPer.do', '227', '[类名] com.itheima.web.RoleController[方法名] findRoleByIdAndAllPer');
INSERT INTO `syslog` VALUES ('397226ED1AA2438A85CB659CD707BEB0', '2020-09-30 20:14:18', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3A2E1BA79DB048B6A762DF5D56E22D72', '2020-11-16 20:52:19', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('3C8F867923C843C688247F961EBF1AF0', '2020-11-17 14:54:32', 'lzx', '0:0:0:0:0:0:0:1', '/user/findById.do', '21', '[类名] com.itheima.web.UserController[方法名] findById');
INSERT INTO `syslog` VALUES ('3CBB8D2C92224651A277F82D2344175A', '2020-11-16 21:08:01', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '13', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3CC27B9FD9204287BDAE476CBB37FDEB', '2020-09-30 20:15:03', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3DA2BA56FD12422F88BCED4C416FCA3D', '2020-09-30 20:16:34', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3DB6918320B14FAFBB2860B2FE9907C2', '2020-11-18 16:45:36', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3E20534B8B154531A77B154758F68353', '2020-11-16 15:37:30', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '36', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3F05A19C481142AD8A3A422F70427765', '2020-11-16 15:31:35', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '81', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('3F88D64C188F4660B4F05552FD628935', '2020-11-17 08:17:43', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('403C95DBA7434F4D89E6F81EA1357C4A', '2020-11-18 11:09:54', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '72', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('40620F8B56B04E7B8E03A02FDFA58654', '2020-09-30 20:15:19', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('406912001C96424DB2250280001214B7', '2020-11-17 08:17:08', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '27', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('40BEBB7281D640A0835898429BB04509', '2020-09-30 20:14:28', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('40E05D14CD264F3F931A528DA230C69C', '2020-11-18 11:08:55', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '5', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('41F23BB76F5142ABB3853A9218C3BDEE', '2020-11-16 21:34:01', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '11', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('42A8D4AE5D4547EC9489D5181C174E27', '2020-09-30 20:16:50', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4309166D7D924E6B8EAA55CE9BF5CC07', '2020-09-30 20:14:38', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4331B52F115A4B7CAE7CBBB488546B03', '2020-11-16 21:33:55', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '286', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4346940727474981B3D21C1163CEFE9C', '2020-11-18 11:08:00', 'lzx', '0:0:0:0:0:0:0:1', '/user/findById.do', '5', '[类名] com.itheima.web.UserController[方法名] findById');
INSERT INTO `syslog` VALUES ('43D3550581D74BF79B6567E4129CDF9D', '2020-09-30 20:14:41', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('444E864FA97B40AFB16433730A127DB4', '2020-11-16 21:30:23', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('4529F6C797DA440DAFA47C8423AA2065', '2020-11-14 20:01:22', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '311', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('45963628DA004398B95F7ED551C027BC', '2020-11-14 20:01:56', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '11', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4678593A9D684970937273A05C2198E6', '2020-11-18 16:45:58', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '13', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('472EE3CC69FE44DA9115B95A7CCF43F2', '2020-11-16 21:05:27', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '52', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('47B90295406745C090EF5C739BE6E598', '2020-11-16 21:45:22', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('47F9963D8F954D449424C252447C80CF', '2020-11-16 17:36:52', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '201', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('48EEB9B9FC7D49A1B135EE2E6BE64135', '2020-11-17 14:55:43', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '8', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4A394A2E0BC84AA5A9BC08DA5C13CD7B', '2020-11-16 21:30:06', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('4B41459BCD364178AE3B30525D5FDEAF', '2020-09-30 20:14:40', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4B8E2D45BA9D44198DB8DD948F6507A1', '2020-09-30 20:15:35', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4CC5A148EEA34E39ABD56CD6169ABE0A', '2020-09-30 20:17:00', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4D567128A232487489A7BAD3DEF573A8', '2020-11-18 11:09:36', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '109', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4D5E88365DFB4283BAE37FBF79DF83AF', '2020-09-30 20:14:55', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4DF250DFA8D44F32A4F58B7E85195367', '2020-11-16 15:28:03', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '3068', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4E4BAD9AE7104075AFD8B155ACBAFA8C', '2020-11-18 11:09:16', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '48', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('4F3D26D677DC46E4912A85F4D7A773BE', '2020-11-18 11:06:48', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5002AB05C1F04A78AA0633E0C1119EE6', '2020-11-16 21:18:55', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('51C57B1A6FD8434BA7D34856A0974C02', '2020-09-30 20:16:52', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5497EB24879146C99B740E3FA5B0F2A1', '2020-11-16 15:38:26', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '15', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('54DBC2C88E7B4FA59E3A37AF31940444', '2020-11-14 20:02:45', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '15', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('558D76803FF24CE1A67E2BCFFC4B5CB4', '2020-09-30 20:15:07', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '4', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5673706BE96247DCB837276A2C6D33D3', '2020-11-18 11:07:18', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '9', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('56E898192B0B46CD804C5F5EAA69498E', '2020-11-18 11:10:12', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('58256412D9454A628C2B424A7624FB2C', '2020-11-17 08:17:00', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '311', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('59EF0F8C6A8F43D7BD1AD06B09FAF16F', '2020-11-16 10:27:22', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '270', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5A624BEC779C48E88C835BDB3EC35956', '2020-11-18 19:41:51', 'lzx', '0:0:0:0:0:0:0:1', '/user/modifyUser.do', '174', '[类名] com.itheima.web.UserController[方法名] modifyUser');
INSERT INTO `syslog` VALUES ('5AC05D48A90045278E8716A3D95B27FC', '2020-09-30 20:16:47', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5BEA307C2ADB4A5EACF30FC17842F89B', '2020-09-30 20:15:16', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5C12288264924130A35688B444194491', '2020-11-18 19:58:57', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '237', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5C1C6842E7224492B4C717B86CD3CB44', '2020-11-18 11:08:11', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5D7EDBA5B7484DD4B1D60DD7D76F148A', '2020-11-18 19:38:23', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '264', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('5DCC1F73CCC84D4DBC9FF2B899843F16', '2020-11-16 21:34:09', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '20', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('61685AD003E14444BEFC6470D02592F9', '2020-09-30 20:14:07', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '62', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('63201E8A3BE947279C152510353A2F88', '2020-11-17 08:17:34', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('63882E070275481384B1E06F10195132', '2020-11-18 18:52:15', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '29', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('63CCC800EC054AC3ACBB304CB300E9B5', '2020-11-18 11:07:07', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '34', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('64F6D3B99B734237BB99430DCD0E23D4', '2020-11-16 21:15:17', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '10', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('65A2684C41E049B1B8D908EB6B49E72D', '2020-11-16 15:35:53', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '16', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6955778C412842EC856C9B24D3900C02', '2020-11-14 20:02:35', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '52', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6982336B413345769ED7E68EC505A33B', '2020-09-30 20:15:17', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('69E74D0CBEB5402586C210AC5B5B1219', '2020-11-18 16:53:02', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '38', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6B945177E52B485B9A15FC9E6544326B', '2020-11-17 19:51:58', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '144', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6BB9A28424A7460BB2694190F5019979', '2020-09-30 20:14:39', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6BD33AE3B7A54A42A31655EFCDF01C58', '2020-09-30 20:14:16', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6D1C822E40154AA494C56A53B5E76276', '2020-11-16 21:29:45', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '24', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('6D8CB337FC454DCFB38B68EF7B024891', '2020-11-16 21:18:50', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '180', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6E0FF969681C484E9AFF5F8933F4F0EF', '2020-11-18 16:46:02', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '11', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('6EBA5C889F384B0DBEAEA2015F4E7519', '2020-11-16 21:08:03', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('6F7975D02D6F42E7B281DCC3DF4150F1', '2020-11-16 15:38:32', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '25', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('6F875DE1E31442BBA32DABF109ABB962', '2020-09-30 20:16:30', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('70266572B38E427A86BB0043DE433668', '2020-11-16 21:49:48', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '18', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7051680A6D4A400EA6F8283E9B2A140E', '2020-11-14 20:02:13', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '31', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('727838A7B4E24061B40950DC00241D4C', '2020-11-16 21:29:41', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '362', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('729775DA30A5499B95D509D2B91814B6', '2020-11-17 19:52:03', 'lzx', '0:0:0:0:0:0:0:1', '/role/findById.do', '52', '[类名] com.itheima.web.RoleController[方法名] findById');
INSERT INTO `syslog` VALUES ('73C47E53B02A4D1C9429B7C780ED504B', '2020-09-30 20:14:39', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7460EBA61E43406F958456DED661FD7C', '2020-11-16 21:39:03', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('74CF5701556D4586B8805F0EEAA33A40', '2020-11-16 21:30:20', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '30', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7565BAA6C2A044E59B9E40253DF97355', '2020-11-18 11:07:28', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '8', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('758A390330B64BD48EDA78D079CFF3B6', '2020-09-30 20:14:42', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '10', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('76D4F5B0AE64480880286AAF6FC80F0D', '2020-11-17 08:32:41', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '26', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('78CB14B933464E3690295D32AB6B2E75', '2020-11-16 20:52:02', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('795ECCC580B64A3385007DD9C808C895', '2020-11-18 11:09:46', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '11', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('797DAE7EFB1E482B990AD894EF4314D0', '2020-11-16 20:57:29', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '24', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('79CF441554B041098DD39326B740711C', '2020-11-14 20:04:13', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '6', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7B81000347C34E83B22665F283D28489', '2020-11-18 11:08:31', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '13', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7C62CC28C8BF4856B42F3E30CD619D66', '2020-11-14 20:01:45', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '9', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7CC4D92AAEE547ECB3BE46F5E5216C70', '2020-09-30 20:14:22', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('7F26530B51F44D7DB8D8880B1F219709', '2020-09-30 20:15:29', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8203F5C8643748D0B8C0C9F98CB5591F', '2020-11-18 11:00:02', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '14', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('82E1F7B9667D460587CDC302840D2EFC', '2020-09-30 20:13:57', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '20', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('83684282AF7E431598C660991910CC38', '2020-11-18 11:08:44', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '8', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('83C8188CE8184DFB9E88264BD319CBEA', '2020-11-17 08:25:43', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '12', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('86240E6D28744F0F93F775DEE0EEA64E', '2020-11-18 16:51:04', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '34', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8732CB41B10B4C7A89BF75C437C1A95F', '2020-11-17 08:26:16', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '18', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('873D5C7C05DE4895BD22D22BACD062B4', '2020-11-16 15:31:46', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '10', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('88681D11B8824EEA80C16D9D6CCE07B6', '2020-11-14 20:02:19', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '36', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('88B32FC640B44E08B24F37433A70F2F4', '2020-11-17 08:25:46', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '16', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('89EFA185AE684D04A52BD0EC5D5B16B0', '2020-11-14 20:01:41', 'lzx', '0:0:0:0:0:0:0:1', '/user/findById.do', '44', '[类名] com.itheima.web.UserController[方法名] findById');
INSERT INTO `syslog` VALUES ('8A0B1B6284774D6DB07A29C0D5911EE6', '2020-11-18 16:50:44', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '213', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8A48150890F14AD9833C1CAEA76BF50D', '2020-09-30 20:14:28', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8A66DBF1573148DE96B80C473A729554', '2020-11-16 21:41:28', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '21', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8ACC170F2513488DB6D210094D4EC402', '2020-11-16 15:34:50', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '23', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8AE0E53CE3C94F5CA0EA54BFA9BD1867', '2020-11-18 19:47:48', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '182', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8C5C5CE98595464DA10CC235986E3557', '2020-09-30 20:15:06', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8D2CBB3277EF43EB8D4939F12CDADFF1', '2020-11-16 21:01:18', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '43', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8DE0F86950084A01967694A6CC833526', '2020-11-18 11:09:26', 'lzx', '0:0:0:0:0:0:0:1', '/product/findById.do', '6', '[类名] com.itheima.web.ProductController[方法名] findById');
INSERT INTO `syslog` VALUES ('8E75D816C3AF4280BDACC63387179232', '2020-11-18 11:40:05', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '383', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8ECBDC95CDB34BA68229DA42C37CC5E2', '2020-09-30 20:14:29', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('8FC5A5976E1545A2B088B92C2C082E0F', '2020-11-16 20:57:32', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '24', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('905E214629C74771B96CB423B6C5EE47', '2020-11-18 11:10:17', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '59', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('908B5BFA76404338B8A19C9A4344C96D', '2020-09-30 20:14:41', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('90E4535428794B09A56AF4728D8F0930', '2020-11-18 19:38:31', 'lzx', '0:0:0:0:0:0:0:1', '/user/findUserByIdAndAllRole.do', '239', '[类名] com.itheima.web.UserController[方法名] findUserByIdAndAllRole');
INSERT INTO `syslog` VALUES ('91103E82FDCB499CA55F7ED24B86D134', '2020-09-30 20:15:11', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('914E4A5575164AE88AB57E57A4B36EAA', '2020-11-16 15:28:55', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '11', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('992523D769474293A9A8424DF05B07F0', '2020-11-18 16:51:09', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '11', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('99618E90DFE0471A990F6FB53C5C9FFB', '2020-11-16 21:02:54', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '35', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('99791BC67E214758827E2C0F724FF6B2', '2020-09-30 20:16:48', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9ABE838A977145FD956B2697289D5F84', '2020-11-16 21:41:04', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '508', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9C5793367F2C404281AC47F9F1BA52F7', '2020-11-17 14:55:37', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '13', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9D8ECC230A004959B1C0E834ABAE8025', '2020-09-30 20:14:14', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '9', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9EBC42346AE247AF91846D590DF8EA9C', '2020-09-30 20:15:20', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '10', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9ED9A3E894F846C09FA621A6AACF0F96', '2020-11-16 21:41:49', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '18', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('9F79499163214B00818AD61B5EEF2F9A', '2020-11-16 20:51:55', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '342', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A17E74C95CF54CCB95D656195DC01C2B', '2020-11-16 21:05:48', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '10', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A33F602BCCF249C19A7B549ADD8F7425', '2020-11-16 21:04:01', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '17', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A35ED4DE5C4241999F4CFAD1C1097F51', '2020-11-16 21:15:14', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '337', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A39F92FEFEF642EAB408D5E1AC760663', '2020-09-30 20:16:46', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A442091590444A2FA5E52147B259ED5C', '2020-09-30 20:15:31', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A4EAA4A93ED54B73BBF63C07CAB82218', '2020-11-14 20:04:02', 'lzx', '0:0:0:0:0:0:0:1', '/product/findById.do', '10', '[类名] com.itheima.web.ProductController[方法名] findById');
INSERT INTO `syslog` VALUES ('A4F36D07569D48F383C6232EB3547250', '2020-11-16 20:52:15', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '17', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A52FC24F1E964F14AEBF95EF1242F32E', '2020-11-18 11:07:40', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '16', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A7993D60878E4B069E75014912D5E77A', '2020-09-30 20:14:29', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A7A34B2F0CDE4161A49B1FBCE2E0F355', '2020-09-30 20:17:11', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A83C161468CF4CE2B954876286E22C39', '2020-11-16 20:57:54', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '20', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A90E858A31FE41F9B2307A0DD4252520', '2020-11-18 11:06:57', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('A94BFBAB6D3D4AA5A26CC04CEC4B1F47', '2020-09-30 20:15:12', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('AA652C5D51354D509E07D00A7E401D52', '2020-11-18 11:08:38', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '7', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('AAA21271E0DC4FD29EC6AE1D85D4BA10', '2020-09-30 20:15:16', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('AB272C9FA6554F0387643FC1F8FBEC9F', '2020-11-18 11:07:00', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '7', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('ABB5D0EBA35041EB97155A56514C3927', '2020-11-16 21:08:44', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '10', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('AC1B607F04BA46EB8CC5CCC9516AF255', '2020-11-16 21:45:26', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '15', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('AC247674CAB64693BA9CB7076F7C25E5', '2020-11-16 20:57:24', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '380', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('AC3EE623C91D421BB89B027BCCBA75A9', '2020-11-16 21:52:05', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '15', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('AD93D184ECD5494DA49AF0EA82C1479E', '2020-09-30 20:17:02', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('AE01708423A541D3AE95732FB12586CC', '2020-11-14 20:03:53', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '10', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B07B479115D6462F8208A128698B9C23', '2020-11-16 21:38:56', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '13', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('B0CEE2E80D8046B3BF79304CC5ED6EFF', '2020-11-16 21:52:03', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B0F713EE2CC141FB8C49ADEC4B112893', '2020-09-30 20:15:21', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B2A720F4AE4B460796BC5613A02C31BD', '2020-11-18 11:06:59', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findById.do', '2', '[类名] com.itheima.web.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('B2D082D0CD0941819B09E56FB66EAE71', '2020-11-16 15:31:25', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '321', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B3B25D45C085448D8B419C4341679C79', '2020-11-18 16:45:34', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '20', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B49776E6982744DC96E7164931E698A9', '2020-11-17 08:18:55', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '26', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B4BD24D44B9F4DC1A243E25E3C6509D6', '2020-11-18 11:09:49', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '17', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B5AD18CAB9F84753AD069CF1D8F22368', '2020-11-16 21:41:19', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '21', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B74CEDAABBD643DA94BE74CE0A2054BD', '2020-09-30 20:14:23', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('B810EF6D6F504F89814CD7B36FC48DC3', '2020-11-16 21:08:46', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('B8B884638F9A45DAA38FC7314D24C6E8', '2020-11-16 21:41:52', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '21', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('BA1D6256FB754AD7B0381AED83D7F4AB', '2020-09-30 20:14:33', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('BB20C61ABCA1427ABE428356EFF6AFCD', '2020-11-16 21:49:51', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('BB9A9B4C26274554A6FC248E91B18534', '2020-11-18 19:40:08', 'lzx', '0:0:0:0:0:0:0:1', '/user/modifyUser.do', '175', '[类名] com.itheima.web.UserController[方法名] modifyUser');
INSERT INTO `syslog` VALUES ('BC7535979A324379884FE202E6E68B2A', '2020-09-30 20:15:20', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('BCBF3D40239D482DA3D2166E9C033C99', '2020-11-18 16:47:22', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '12', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('BF2063E70950427F91DE55A1951D42FE', '2020-11-17 08:25:53', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '9', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('BFAE98B75491442A9166C5D478FD1841', '2020-11-18 16:53:33', 'lzx', '0:0:0:0:0:0:0:1', '/role/findById.do', '49', '[类名] com.itheima.web.RoleController[方法名] findById');
INSERT INTO `syslog` VALUES ('BFB5F9117A364C2185482C227B7610B6', '2020-09-30 20:14:39', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C06F9AD9658247BB9EE29B0BA849A596', '2020-11-17 14:54:27', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '22', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C0CF0FD36B5A4C2CA532B2EABF6FBEB9', '2020-11-17 14:55:36', 'lzx', '0:0:0:0:0:0:0:1', '/user/addUser.do', '204', '[类名] com.itheima.web.UserController[方法名] addUser');
INSERT INTO `syslog` VALUES ('C2F3E67B11244B108E6002023F8DDA89', '2020-09-30 20:16:35', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C3062B5E09F8462DB980FDC0647568FC', '2020-11-18 16:53:38', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '9', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C3753FE25B7F455AB6E565153425554A', '2020-11-16 21:39:01', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '58', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C47CBF8F57BD4FD8853BD993611BDA36', '2020-11-18 11:07:04', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '14', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C49B40EE40374E1E9F50B4C03C5F3F6D', '2020-09-30 20:15:18', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C508182775994AB6A9E9E7C2D0E6C6BE', '2020-09-30 20:14:37', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '4', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C5A3C19091A1471E8692933131087E30', '2020-09-30 20:15:33', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C7AB3E2D72814B6C9EA83C0401072578', '2020-09-30 20:14:51', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '4', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C85FC99672DC42E4B38026E1A2C1B1CF', '2020-11-18 11:08:36', 'lzx', '0:0:0:0:0:0:0:1', '/role/findRoleByIdAndAllPer.do', '13', '[类名] com.itheima.web.RoleController[方法名] findRoleByIdAndAllPer');
INSERT INTO `syslog` VALUES ('C87CEE1E51E1440B90E26D118F999FB6', '2020-11-16 20:57:34', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('C935010A7EF44EF689806AF44770DD10', '2020-09-30 20:16:32', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '4', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C93DA8C66F47404F9578534C4600758D', '2020-11-14 20:03:49', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '14', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C97F7D4D4F884DECAB43765CF77D726E', '2020-09-30 20:14:44', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('C9A5E4F10ECE48FD8CB75AA3F07BAAD3', '2020-09-30 20:14:38', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('CBD7D6AB95E44996862FA483722CCF8F', '2020-09-30 20:15:16', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('CD69A1573A9D4094B005C7D1EC30E124', '2020-09-30 20:16:44', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('CDB49B3A75CF4956B23408D3BB6528DC', '2020-11-17 08:17:45', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '13', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('CFEA69F2AFD04951A5D1FA811FCBDDED', '2020-11-18 11:07:47', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '88', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D022AF628A5440F1961B427D6B020A67', '2020-11-18 11:10:22', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('D1AD3305D8834D46AE3B5119575F3B8E', '2020-09-30 20:15:04', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D1BAFCA1DE1348CEA5EAD85856EA0079', '2020-11-16 21:19:09', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('D1F90D3F149A4A5C93474B8B63BF8B23', '2020-11-16 21:29:56', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '13', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D25C6E3BF06E40D8915585F55BE215D0', '2020-11-18 11:08:26', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '11', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D3279D08DB9845E2875AFB4C2021C288', '2020-09-30 20:14:27', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '14', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D36ADF9DE9BF4238B208AEF71D743EF9', '2020-11-16 15:34:36', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '48', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D3B60781D8974ABBAF2329E062E82DA7', '2020-09-30 20:15:17', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D4CA763AFE6646EEB3D8CD5832A3E155', '2020-11-18 11:06:55', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findById.do', '5', '[类名] com.itheima.web.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('D504803751184D8D8545052B058443C3', '2020-11-18 11:09:31', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '19', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D595C28F377C4CE8BB9E2F7256236EE4', '2020-11-16 21:05:43', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D5F88A42D5094FF8A644432BFC545D3E', '2020-11-18 11:41:54', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '31', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D62AAD5B148C4C54A9EEB0B815DABD4D', '2020-09-30 20:14:21', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D6B21F086BEF417196CC52576338FF41', '2020-11-16 15:31:57', 'lzx', '0:0:0:0:0:0:0:1', '/product/findAll.do', '8', '[类名] com.itheima.web.ProductController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D6F49BB9446A4EE1AEA7574C1E31FB1E', '2020-11-14 20:03:04', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('D837053BCCA04351AD73769826E4B005', '2020-11-16 21:41:20', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('D8864DA636B541849433F72E1D76603E', '2020-11-16 21:11:12', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '296', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D8ADD47007444410BCA1E7AC86874E13', '2020-09-30 20:13:50', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '53', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D90D9E655F7C4B8B8986A32B10048C59', '2020-09-30 20:15:27', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D9F95184E5784978A377B2EA4FC14C3F', '2020-09-30 20:15:09', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('D9FC797A32FF4E519483D67E17ED3DFF', '2020-11-16 20:57:44', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('DA250035C21D43A285372B182C3F3B29', '2020-11-17 08:25:51', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '14', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('DBA958B8766A492C85EB4138B07A4185', '2020-11-18 16:46:04', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '11', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('DC4B852B482D4C128FFDF3790BDA20AC', '2020-09-30 20:14:31', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('DD9A317FFD4C4A73A64833DE53C7A5E6', '2020-11-16 21:52:28', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '18', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('DF1BD527B4CB47E3801B25CD59B3AB42', '2020-09-30 20:14:50', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('DF8917FA3E2A465FBB84F205E1588507', '2020-09-30 20:13:53', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '149', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('DF9916832A534630B8E1BD5E3D25D2E1', '2020-09-30 20:14:51', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E0B3555DBA0A4628A9BF6523BBD77162', '2020-11-16 21:08:21', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('E13904D49D3D4B1C9A163599F16B9124', '2020-11-17 08:26:10', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '10', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E177F4CC15A74DFB99E713369767DB62', '2020-09-30 20:15:15', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E26EDE45C33F4D398AA67D7680FAD289', '2020-11-18 16:45:53', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '23', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E3CDFACA6D1E48DD85BA39B5585200C9', '2020-09-30 20:14:57', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E3FAB0DAE6C441EEB2C3DF56F40F344D', '2020-11-16 21:05:45', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '8', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('E40F3ECAD96840749CC703849D0FE1DF', '2020-09-30 20:14:41', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '6', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E42A06258AB34A54AF8045C7BFD1BC61', '2020-11-18 11:06:44', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findById.do', '5', '[类名] com.itheima.web.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('E5643667E9B34A83930DAC5CA2F224AF', '2020-11-16 15:28:49', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '27', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E593D7CE179641F2965C618B3D31FF56', '2020-11-16 21:45:29', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '12', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('E6B7214F515E4D85888C7366773630FF', '2020-11-18 11:10:42', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E73C3A9FA25D42BCA0B1970F79D63C86', '2020-11-16 10:27:27', 'lzx', '0:0:0:0:0:0:0:1', '/user/findById.do', '90', '[类名] com.itheima.web.UserController[方法名] findById');
INSERT INTO `syslog` VALUES ('E7D784F1EE7F4A70BF6CF65BF42B8603', '2020-09-30 20:15:19', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '5', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E81D632B162F4AB19BE3AEA3F9669204', '2020-09-30 20:14:27', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('E8FA32570F5944ED81226066A17F7FAF', '2020-11-18 11:07:50', 'lzx', '0:0:0:0:0:0:0:1', '/user/findById.do', '36', '[类名] com.itheima.web.UserController[方法名] findById');
INSERT INTO `syslog` VALUES ('EA096D9389C64454971AEB58452CC5C7', '2020-11-18 11:09:44', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '54', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('EB3F53ADBEE64BD2A38FD2813A8EE247', '2020-11-17 14:54:10', 'lzx', '0:0:0:0:0:0:0:1', '/user/findById.do', '172', '[类名] com.itheima.web.UserController[方法名] findById');
INSERT INTO `syslog` VALUES ('EB9C5BC86F3240D1B89C3739C7377539', '2020-11-16 20:57:58', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '69', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('EC0C224066BE4E50AABA839A5A1B3357', '2020-09-30 20:14:49', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '9', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('EF635AEA7E134369A4963C6C0EF485D2', '2020-09-30 20:17:07', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F1DA35A02ACA4AE89A06DD539891E4C6', '2020-09-30 20:14:54', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '8', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F22AC9EEDD3C446FA16F48B3914F43A8', '2020-11-16 10:27:39', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '16', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F3524898F19D44568918B17B9CE7D76D', '2020-11-16 15:38:19', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '208', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F358EA83DC2C4162899A03A5AE46AD80', '2020-11-16 21:49:41', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '29', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F35F67A588E24E73AE03B4445E3198F9', '2020-11-18 11:06:39', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findAll.do', '42', '[类名] com.itheima.web.PermissionController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F36DA40F0CB547ECADBF76608A1D08A6', '2020-11-18 11:07:13', 'lzx', '0:0:0:0:0:0:0:1', '/role/findById.do', '31', '[类名] com.itheima.web.RoleController[方法名] findById');
INSERT INTO `syslog` VALUES ('F386F1D283AE4036AE08D12398BBEA17', '2020-11-18 11:07:55', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '7', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F3D25691AA774207A5DD60365C4F64BD', '2020-11-14 20:02:51', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '13', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('F3D558083C4245468938DC4ACD7D5608', '2020-11-18 19:58:57', 'lzx', '0:0:0:0:0:0:0:1', '/user/modifyUser.do', '520', '[类名] com.itheima.web.UserController[方法名] modifyUser');
INSERT INTO `syslog` VALUES ('F5B8CD9F925841EAAA4DF988F0B464EB', '2020-11-17 08:17:51', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '6', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('F786B46EF8124F2D98CFD5646F63C6CE', '2020-11-18 11:10:01', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '7', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F92D9F064F9E4190A3BA1D5B9D0BA39B', '2020-11-18 16:45:18', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '321', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F97ADBB1369A4C338F56C8F0E302A1E5', '2020-09-30 20:15:08', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '4', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('F9D838D829894EB4A3EE37F27E4B4EB1', '2020-11-17 14:54:41', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '20', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('FA7587A9937C4E04AB3DF2ACE96DED18', '2020-11-18 11:10:04', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findById.do', '29', '[类名] com.itheima.web.OrdersController[方法名] findById');
INSERT INTO `syslog` VALUES ('FB2098FEEC9249488EDBBD0DDFDA5B5F', '2020-11-18 11:06:51', 'lzx', '0:0:0:0:0:0:0:1', '/permission/findById.do', '20', '[类名] com.itheima.web.PermissionController[方法名] findById');
INSERT INTO `syslog` VALUES ('FC03B13566D643C88FAE532ABF2A1D38', '2020-09-30 20:15:43', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');
INSERT INTO `syslog` VALUES ('FC33021CF641492CBA9525FBFB3E4BA8', '2020-11-18 11:10:08', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '21', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('FD613C244E184B878942BCEB37CEE173', '2020-11-14 20:01:35', 'lzx', '0:0:0:0:0:0:0:1', '/user/findAll.do', '39', '[类名] com.itheima.web.UserController[方法名] findAll');
INSERT INTO `syslog` VALUES ('FDAF23C909FC4F808BC251E7DF27E307', '2020-11-16 21:02:56', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '16', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('FDB1ECB44BA445449D12A9E4E2329D31', '2020-11-16 21:08:18', 'lzx', '0:0:0:0:0:0:0:1', '/orders/findAll.do', '16', '[类名] com.itheima.web.OrdersController[方法名] findAll');
INSERT INTO `syslog` VALUES ('FED122ACC63B4DEC8E5474C900FF5272', '2020-11-18 18:54:01', 'lzx', '0:0:0:0:0:0:0:1', '/rolefindAll.do', '58225', '[类名] com.itheima.web.RoleController[方法名] findAll');
INSERT INTO `syslog` VALUES ('FFC8199198F94F959A4DB07287032944', '2020-09-30 20:14:58', 'lzx', '0:0:0:0:0:0:0:1', '/syslog/findAll.do', '7', '[类名] com.itheima.web.SysLogController[方法名] findAll');

-- ----------------------------
-- Table structure for traveller
-- ----------------------------
DROP TABLE IF EXISTS `traveller`;
CREATE TABLE `traveller` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义、主键uuid',
  `NAME` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '姓名',
  `sex` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
  `phoneNum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话号码',
  `credentialsType` int(11) DEFAULT NULL COMMENT '证件类型 0身份证 1护照 2军官证',
  `credentialsNum` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '证件号码',
  `travellerType` int(11) DEFAULT NULL COMMENT '旅客类型(人群) 0 成人 1 儿童',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of traveller
-- ----------------------------
INSERT INTO `traveller` VALUES ('000000000000', '阿萨德', '女', '17803003333', '1', '410777788892545452', '1');
INSERT INTO `traveller` VALUES ('3FE27DF2A4E44A6DBC5D0FE4651D3D3E', '张龙', '男', '13333333333', '0', '123456789009876543', '0');
INSERT INTO `traveller` VALUES ('EE7A71FB6945483FBF91543DBE851960', '张小龙', '男', '15555555555', '0', '987654321123456789', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(32) COLLATE utf8_bin NOT NULL COMMENT '无意义，主键uuid',
  `email` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '非空，唯一',
  `username` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '用户名',
  `PASSWORD` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '密码（加密）',
  `phoneNum` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
  `STATUS` int(11) DEFAULT NULL COMMENT '状态0 未开启 1 开启',
  PRIMARY KEY (`id`,`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('000', 'ceshi@123.com', 'ceshi', '$2a$10$UiPMyA4fZ0GukBgN8nyULenqHPhBgtHSCjj3Zob34CZBWHvZcTMRG', '000000', '1');
INSERT INTO `users` VALUES ('111-111', 'XXXXXX', 'lzx', '$2a$10$t5g.syuaao6eRAEPttqww.tJUxgopUe74aFTr.AA0j1x72yld0mg6', '9006', '1');
INSERT INTO `users` VALUES ('1B7CC006FD1D4AC6A05A914982943DED', 'lisi@qq.com', 'lisi', '$2a$10$iBIwQvuN4v9XVP3N9975ZecGdvHK/iWguKB5qBIfYogi5djNBJgUK', '123456', '1');
INSERT INTO `users` VALUES ('57D8BB13AEBF445D81EE1CB72E7B1826', 'wangwu@qq.com', 'wangwu', '$2a$10$y3ubKJS0WQhGuxiRTwkE1.3MwgHpkimpiTq8ofKxS/tRxDr6/Uu8G', '123456', '1');
INSERT INTO `users` VALUES ('936EAD47F8D845EF858D282788F353C8', '2222222@qq.com', '李秀娥', '$2a$10$gGE7ECu4ZV0RtMaqeRPePOr0kWBgVEMz5fNtP7XMyKAgDfaO2Usbi', '17656219006', '1');

-- ----------------------------
-- Table structure for users_role
-- ----------------------------
DROP TABLE IF EXISTS `users_role`;
CREATE TABLE `users_role` (
  `userId` varchar(32) COLLATE utf8_bin NOT NULL,
  `roleId` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`userId`,`roleId`),
  KEY `roleId` (`roleId`),
  CONSTRAINT `users_role_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  CONSTRAINT `users_role_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of users_role
-- ----------------------------
INSERT INTO `users_role` VALUES ('111-111', '1111');
INSERT INTO `users_role` VALUES ('1B7CC006FD1D4AC6A05A914982943DED', '1111');
INSERT INTO `users_role` VALUES ('000', '2222');
INSERT INTO `users_role` VALUES ('111-111', '2222');
INSERT INTO `users_role` VALUES ('57D8BB13AEBF445D81EE1CB72E7B1826', '2222');
INSERT INTO `users_role` VALUES ('111-111', '3333');
