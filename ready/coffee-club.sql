/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : coffee-club

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 13/10/2020 16:03:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `u_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户id',
  `food_id` int(11) NOT NULL COMMENT '食物id',
  `num` int(11) NULL DEFAULT 1 COMMENT '食物数量',
  `sysdate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`u_id`, `food_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES ('admin@mail.com', 1001, 1, '2020-10-12 21:53:02');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(4) NOT NULL,
  `typeid` int(20) NOT NULL,
  `parent_id` int(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT NULL,
  `cate_pic` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`, `typeid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 1000, 0, '咖啡', '咖啡要喝好', '纵享丝滑', 1, 'cate01.png');
INSERT INTO `category` VALUES (2, 1010, 1000, '冷咖啡', NULL, '纵享丝滑', 2, 'rate0101.jpg');
INSERT INTO `category` VALUES (3, 1020, 1000, '热咖啡', NULL, '纵享丝滑', 3, 'rate0102.jpg');
INSERT INTO `category` VALUES (4, 2000, 0, '早餐', '早餐要吃好', '纵享丝滑', 4, 'cate02.png');
INSERT INTO `category` VALUES (5, 3000, 0, '小吃', '小吃要小点口吃', '纵享丝滑', 5, 'cate03.png');
INSERT INTO `category` VALUES (6, 4000, 0, '午餐', '午餐要吃饱', '纵享丝滑', 6, 'cate04.png');
INSERT INTO `category` VALUES (7, 5000, 0, '薯条', '薯条要沾番茄酱', '纵享丝滑', 7, 'cate05.png');
INSERT INTO `category` VALUES (8, 6000, 0, '晚餐', '晚餐要吃少', '纵享丝滑', 8, 'cate06.png');

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('cream', '奶油', '3', 1000);
INSERT INTO `dict` VALUES ('fruit', '果碎', '5', 3000);
INSERT INTO `dict` VALUES ('size', '大小', '4', 2000);
INSERT INTO `dict` VALUES ('sugar', '糖', '2', 1000);
INSERT INTO `dict` VALUES ('temp', '温度', '1', 1000);

-- ----------------------------
-- Table structure for dict_son
-- ----------------------------
DROP TABLE IF EXISTS `dict_son`;
CREATE TABLE `dict_son`  (
  `id` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dictid` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `dictid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_son
-- ----------------------------
INSERT INTO `dict_son` VALUES ('s1', 'temp', 'temp0', '冷');
INSERT INTO `dict_son` VALUES ('s10', 'size', 'size2', '大份');
INSERT INTO `dict_son` VALUES ('s11', 'fruit', 'fruit0', '有果碎');
INSERT INTO `dict_son` VALUES ('s12', 'fruit', 'fruit1', '无果碎');
INSERT INTO `dict_son` VALUES ('s2', 'temp', 'temp1', '热');
INSERT INTO `dict_son` VALUES ('s3', 'sugar', 'sugar0', '无糖');
INSERT INTO `dict_son` VALUES ('s4', 'sugar', 'sugar1', '半糖');
INSERT INTO `dict_son` VALUES ('s5', 'sugar', 'sugar2', '全糖');
INSERT INTO `dict_son` VALUES ('s6', 'cream', 'cream0', '无奶油');
INSERT INTO `dict_son` VALUES ('s7', 'cream', 'cream1', '有奶油');
INSERT INTO `dict_son` VALUES ('s8', 'size', 'size0', '小份');
INSERT INTO `dict_son` VALUES ('s9', 'size', 'size1', '中份');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `u_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `food_id` int(11) NOT NULL,
  `islike` int(255) NULL DEFAULT 1 COMMENT '0-未收藏 1-已收藏',
  `sysdate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`u_id`, `food_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES ('admin@mail.com', 1001, 1, '2020-10-12 16:26:15');
INSERT INTO `favorite` VALUES ('admin@mail.com', 1003, 0, '2020-10-12 16:05:59');
INSERT INTO `favorite` VALUES ('admin@mail.com', 1017, 0, '2020-10-12 16:26:06');
INSERT INTO `favorite` VALUES ('admin@mail.com', 1030, 1, '2020-10-12 15:59:53');

-- ----------------------------
-- Table structure for foods
-- ----------------------------
DROP TABLE IF EXISTS `foods`;
CREATE TABLE `foods`  (
  `id` int(11) NOT NULL,
  `food_id` int(20) NOT NULL,
  `food_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `food_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `typeid` int(20) NOT NULL,
  `food_price` decimal(10, 2) NULL DEFAULT NULL,
  `food_rate` int(11) NULL DEFAULT NULL,
  `food_count` int(11) NULL DEFAULT NULL,
  `food_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `food_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `food_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, 1001, '抹茶瑞纳冰', '纵享丝滑', 1010, 30.00, 5, 50, '抹茶瑞纳冰很美味', 'coffee.png');
INSERT INTO `foods` VALUES (2, 1002, '拿铁', '纵享丝滑', 1020, 31.00, 3, 51, '拿铁很美味', 'coffee.png');
INSERT INTO `foods` VALUES (3, 1003, '陨石拿铁', '纵享丝滑', 1010, 32.00, 4, 52, '陨石拿铁很美味', 'coffee.png');
INSERT INTO `foods` VALUES (4, 1004, '厚乳拿铁', '纵享丝滑', 1020, 33.00, 5, 53, '厚乳拿铁很美味', 'coffee.png');
INSERT INTO `foods` VALUES (5, 1005, '醉心黑摩卡', '纵享丝滑', 1010, 34.00, 4, 54, '醉心黑摩卡很美味', 'coffee.png');
INSERT INTO `foods` VALUES (6, 1006, '精粹奥瑞白', '纵享丝滑', 1020, 35.00, 3, 55, '精粹奥瑞白很美味', 'coffee.png');
INSERT INTO `foods` VALUES (7, 1007, '食物7', '纵享丝滑', 2000, 36.00, 5, 56, '食物7很美味', 'breakfast.png');
INSERT INTO `foods` VALUES (8, 1008, '食物8', '纵享丝滑', 2000, 37.00, 5, 57, '食物8很美味', 'breakfast.png');
INSERT INTO `foods` VALUES (9, 1009, '食物9', '纵享丝滑', 2000, 38.00, 5, 58, '食物9很美味', 'breakfast.png');
INSERT INTO `foods` VALUES (10, 1010, '食物10', '纵享丝滑', 2000, 39.00, 5, 59, '食物10很美味', 'breakfast.png');
INSERT INTO `foods` VALUES (11, 1011, '食物11', '纵享丝滑', 3000, 40.00, 5, 60, '食物11很美味', 'Munch.png');
INSERT INTO `foods` VALUES (12, 1012, '食物12', '纵享丝滑', 3000, 41.00, 4, 61, '食物12很美味', 'Munch.png');
INSERT INTO `foods` VALUES (13, 1013, '食物13', '纵享丝滑', 3000, 42.00, 4, 62, '食物13很美味', 'Munch.png');
INSERT INTO `foods` VALUES (14, 1014, '食物14', '纵享丝滑', 3000, 43.00, 4, 63, '食物14很美味', 'Munch.png');
INSERT INTO `foods` VALUES (15, 1015, '食物15', '纵享丝滑', 4000, 44.00, 4, 64, '食物15很美味', 'lunch.png');
INSERT INTO `foods` VALUES (16, 1016, '食物16', '纵享丝滑', 4000, 45.00, 4, 65, '食物16很美味', 'lunch.png');
INSERT INTO `foods` VALUES (17, 1017, '食物17', '纵享丝滑', 4000, 46.00, 3, 66, '食物17很美味', 'lunch.png');
INSERT INTO `foods` VALUES (18, 1018, '食物18', '纵享丝滑', 4000, 47.00, 3, 67, '食物18很美味', 'lunch.png');
INSERT INTO `foods` VALUES (19, 1019, '食物19', '纵享丝滑', 5000, 48.00, 3, 68, '食物19很美味', 'fries.png');
INSERT INTO `foods` VALUES (20, 1020, '食物20', '纵享丝滑', 5000, 49.00, 4, 69, '食物20很美味', 'fries.png');
INSERT INTO `foods` VALUES (21, 1021, '食物21', '纵享丝滑', 5000, 50.00, 4, 70, '食物21很美味', 'fries.png');
INSERT INTO `foods` VALUES (22, 1022, '食物22', '纵享丝滑', 5000, 51.00, 5, 71, '食物22很美味', 'fries.png');
INSERT INTO `foods` VALUES (23, 1023, '食物23', '纵享丝滑', 6000, 52.00, 5, 72, '食物23很美味', 'dinner.png');
INSERT INTO `foods` VALUES (24, 1024, '食物24', '纵享丝滑', 6000, 53.00, 5, 73, '食物24很美味', 'dinner.png');
INSERT INTO `foods` VALUES (25, 1025, '食物25', '纵享丝滑', 6000, 54.00, 5, 74, '食物25很美味', 'dinner.png');
INSERT INTO `foods` VALUES (26, 1026, '食物26', '纵享丝滑', 6000, 55.00, 5, 75, '食物26很美味', 'dinner.png');
INSERT INTO `foods` VALUES (27, 1027, '食物27', '纵享丝滑', 6000, 56.00, 5, 76, '食物27很美味', 'dinner.png');
INSERT INTO `foods` VALUES (28, 1028, '食物28', '纵享丝滑', 6000, 57.00, 3, 77, '食物28很美味', 'dinner.png');
INSERT INTO `foods` VALUES (29, 1029, '食物29', '纵享丝滑', 6000, 58.00, 5, 78, '食物29很美味', 'dinner.png');
INSERT INTO `foods` VALUES (30, 1030, '食物30', '纵享丝滑', 6000, 59.00, 4, 79, '食物30很美味', 'dinner.png');

-- ----------------------------
-- Table structure for order_foods
-- ----------------------------
DROP TABLE IF EXISTS `order_foods`;
CREATE TABLE `order_foods`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `food_id` int(11) NULL DEFAULT NULL,
  `sku_id` int(11) NOT NULL COMMENT '食物skuid',
  `price` decimal(10, 2) NOT NULL COMMENT '食物价格',
  `num` int(11) NOT NULL COMMENT '食物数量',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物名称',
  `food_c&h` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物温度',
  `food_sugar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物糖度',
  `food_cream` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物奶油',
  `food_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '食物图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order_foods
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户id',
  `order_status` int(11) NOT NULL COMMENT '支付状态 0提交订单 1支付完成等待取餐 2表示已取餐 3表示订单完成',
  `pay_status` int(11) NOT NULL DEFAULT 0 COMMENT '支付状态 0为未付款 1已付款',
  `order_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '订单编号',
  `total_price` decimal(8, 2) NOT NULL COMMENT '订单支付的价格',
  `created_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '订单创建时间\r\n',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin@mail.com', 'admin', '000000', 'my.png');
INSERT INTO `user` VALUES (4, 'li@mail.com', '李四', '0', NULL);

SET FOREIGN_KEY_CHECKS = 1;
