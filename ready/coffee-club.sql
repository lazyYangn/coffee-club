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

 Date: 05/10/2020 22:05:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for carts
-- ----------------------------
DROP TABLE IF EXISTS `carts`;
CREATE TABLE `carts`  (
  `cart_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `u_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户id',
  `skus_id` int(11) NOT NULL COMMENT 'sku食物id',
  `food_id` int(11) NOT NULL COMMENT '食物id',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物名称',
  `food_c&h` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物温度',
  `food_sugar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物甜度',
  `food_cream` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物奶油',
  `food_num` int(11) NOT NULL COMMENT '食物数量',
  `food_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物图片',
  PRIMARY KEY (`cart_id`, `u_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO `carts` VALUES (1, 'admin@mail.com', 1, 1000, '食物1', '1', '1', '1', 1, 'coffee.png');

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
INSERT INTO `category` VALUES (2, 1010, 1000, '冷咖啡', NULL, '纵享丝滑', 2, '');
INSERT INTO `category` VALUES (3, 1020, 1000, '热咖啡', NULL, '纵享丝滑', 3, '');
INSERT INTO `category` VALUES (4, 2000, 0, '早餐', '早餐要吃好', '纵享丝滑', 4, 'cate02.png');
INSERT INTO `category` VALUES (5, 3000, 0, '小吃', '小吃要小点口吃', '纵享丝滑', 5, 'cate03.png');
INSERT INTO `category` VALUES (6, 4000, 0, '午餐', '午餐要吃饱', '纵享丝滑', 6, 'cate04.png');
INSERT INTO `category` VALUES (7, 5000, 0, '薯条', '薯条要沾番茄酱', '纵享丝滑', 7, 'cate05.png');
INSERT INTO `category` VALUES (8, 6000, 0, '晚餐', '晚餐要吃少', '纵享丝滑', 8, 'cate06.png');

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite`  (
  `id` int(11) NOT NULL,
  `u_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `food_id` int(11) NOT NULL,
  `food_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `food_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `food_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of favorite
-- ----------------------------
INSERT INTO `favorite` VALUES (1, 'admin@mail.com', 1001, '食物1', '纵享丝滑', 'coffee.png');

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
  `food_skus` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '属性规格json格式',
  `isLike` int(255) NULL DEFAULT 0 COMMENT '1-是收藏的商品 0-不是收藏的商品',
  `food_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` tinyint(255) NULL DEFAULT 1 COMMENT '1:正常 0 下架',
  PRIMARY KEY (`id`, `food_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of foods
-- ----------------------------
INSERT INTO `foods` VALUES (1, 1001, '抹茶瑞纳冰', '纵享丝滑', 1010, 30.00, 5, 50, '抹茶瑞纳冰很美味', '{“温度”:[\"冰\"],\"奶油\":[\"无奶油\"]}', 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (2, 1002, '拿铁', '纵享丝滑', 1020, 31.00, 3, 51, '拿铁很美味', '{“温度”:[\"冰\",\"热\"],\"糖\":[\"无糖\",\"半分糖\",\"单份糖\"]}', 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (3, 1003, '陨石拿铁', '纵享丝滑', 1010, 32.00, 4, 52, '陨石拿铁很美味', '{“温度”:[\"冰\"],\"糖\":[\"全糖\",\"半糖\"],\"奶油\":[\"无奶油\"]}', 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (4, 1004, '厚乳拿铁', '纵享丝滑', 1020, 33.00, 5, 53, '厚乳拿铁很美味', '{“温度”:[\"冰\",\"热\"],\"糖\":[\"无糖\",\"半分糖\",\"单份糖\"]}', 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (5, 1005, '醉心黑摩卡', '纵享丝滑', 1010, 34.00, 4, 54, '醉心黑摩卡很美味', '{“温度”:[\"冰\",\"热\"],\"奶油\":[\"无奶油\"]}', 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (6, 1006, '精粹奥瑞白', '纵享丝滑', 1020, 35.00, 3, 55, '精粹奥瑞白很美味', '{“温度”:[\"热\"],\"糖\":[\"无糖\",\"半分糖\",\"单份糖\"]}', 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (7, 1007, '食物7', '纵享丝滑', 2000, 36.00, 5, 56, '食物7很美味', NULL, 0, 'breakfast.png', 1);
INSERT INTO `foods` VALUES (8, 1008, '食物8', '纵享丝滑', 2000, 37.00, 5, 57, '食物8很美味', NULL, 0, 'breakfast.png', 1);
INSERT INTO `foods` VALUES (9, 1009, '食物9', '纵享丝滑', 2000, 38.00, 5, 58, '食物9很美味', NULL, 0, 'breakfast.png', 1);
INSERT INTO `foods` VALUES (10, 1010, '食物10', '纵享丝滑', 2000, 39.00, 5, 59, '食物10很美味', NULL, 0, 'breakfast.png', 1);
INSERT INTO `foods` VALUES (11, 1011, '食物11', '纵享丝滑', 3000, 40.00, 5, 60, '食物11很美味', NULL, 0, 'Munch.png', 1);
INSERT INTO `foods` VALUES (12, 1012, '食物12', '纵享丝滑', 3000, 41.00, 4, 61, '食物12很美味', NULL, 0, 'Munch.png', 1);
INSERT INTO `foods` VALUES (13, 1013, '食物13', '纵享丝滑', 3000, 42.00, 4, 62, '食物13很美味', NULL, 0, 'Munch.png', 1);
INSERT INTO `foods` VALUES (14, 1014, '食物14', '纵享丝滑', 3000, 43.00, 4, 63, '食物14很美味', NULL, 0, 'Munch.png', 1);
INSERT INTO `foods` VALUES (15, 1015, '食物15', '纵享丝滑', 4000, 44.00, 4, 64, '食物15很美味', NULL, 0, 'lunch.png', 1);
INSERT INTO `foods` VALUES (16, 1016, '食物16', '纵享丝滑', 4000, 45.00, 4, 65, '食物16很美味', NULL, 0, 'lunch.png', 1);
INSERT INTO `foods` VALUES (17, 1017, '食物17', '纵享丝滑', 4000, 46.00, 3, 66, '食物17很美味', NULL, 0, 'lunch.png', 1);
INSERT INTO `foods` VALUES (18, 1018, '食物18', '纵享丝滑', 4000, 47.00, 3, 67, '食物18很美味', NULL, 0, 'lunch.png', 1);
INSERT INTO `foods` VALUES (19, 1019, '食物19', '纵享丝滑', 5000, 48.00, 3, 68, '食物19很美味', NULL, 0, 'fries.png', 1);
INSERT INTO `foods` VALUES (20, 1020, '食物20', '纵享丝滑', 5000, 49.00, 4, 69, '食物20很美味', NULL, 0, 'fries.png', 1);
INSERT INTO `foods` VALUES (21, 1021, '食物21', '纵享丝滑', 5000, 50.00, 4, 70, '食物21很美味', NULL, 0, 'fries.png', 1);
INSERT INTO `foods` VALUES (22, 1022, '食物22', '纵享丝滑', 5000, 51.00, 5, 71, '食物22很美味', NULL, 0, 'fries.png', 1);
INSERT INTO `foods` VALUES (23, 1023, '食物23', '纵享丝滑', 6000, 52.00, 5, 72, '食物23很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (24, 1024, '食物24', '纵享丝滑', 6000, 53.00, 5, 73, '食物24很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (25, 1025, '食物25', '纵享丝滑', 6000, 54.00, 5, 74, '食物25很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (26, 1026, '食物26', '纵享丝滑', 6000, 55.00, 5, 75, '食物26很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (27, 1027, '食物27', '纵享丝滑', 6000, 56.00, 5, 76, '食物27很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (28, 1028, '食物28', '纵享丝滑', 6000, 57.00, 3, 77, '食物28很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (29, 1029, '食物29', '纵享丝滑', 6000, 58.00, 5, 78, '食物29很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (30, 1030, '食物30', '纵享丝滑', 6000, 59.00, 4, 79, '食物30很美味', NULL, 0, 'dinner.png', 1);
INSERT INTO `foods` VALUES (31, 1001, '食物1', '纵享丝滑', 1000, 30.00, 5, 50, '食物1很美味', NULL, 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (32, 1002, '食物2', '纵享丝滑', 1000, 31.00, 6, 51, '食物2很美味', NULL, 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (33, 1003, '食物3', '纵享丝滑', 1000, 32.00, 7, 52, '食物3很美味', NULL, 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (34, 1004, '食物4', '纵享丝滑', 1000, 33.00, 8, 53, '食物4很美味', NULL, 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (35, 1005, '食物5', '纵享丝滑', 1000, 34.00, 9, 54, '食物5很美味', NULL, 0, 'coffee.png', 1);
INSERT INTO `foods` VALUES (36, 1006, '食物6', '纵享丝滑', 1000, 35.00, 10, 55, '食物6很美味', NULL, 0, 'coffee.png', 1);

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
-- Table structure for skus
-- ----------------------------
DROP TABLE IF EXISTS `skus`;
CREATE TABLE `skus`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键自增id',
  `food_id` int(10) NOT NULL COMMENT '食物id',
  `food_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '名称',
  `food_c&h` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '食物的温度',
  `food_sugar` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否糖度',
  `food_cream` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '是否奶油',
  `food_count` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '1' COMMENT '数量',
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '状态 0为下架 1为上架',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of skus
-- ----------------------------
INSERT INTO `skus` VALUES (1, 1001, '食物1 加冰 加糖 加奶油', '1', '1', '1', '1', 1);
INSERT INTO `skus` VALUES (2, 1001, '食物1 不加冰 加糖 加奶油', '0', '1', '1', '1', 1);
INSERT INTO `skus` VALUES (3, 1001, '食物1 不加冰 不加糖 加奶油', '0', '0', '1', '1', 1);
INSERT INTO `skus` VALUES (4, 1001, '食物1 不加冰 不加糖 不加奶油', '0', '0', '0', '0', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(4) NOT NULL,
  `u_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin@mail.com', 'admin', '000000', 'my.png');
INSERT INTO `user` VALUES (2, 'lisi@mail.com', '李四', '000000', 'my.png');
INSERT INTO `user` VALUES (3, 'zhang@mail.com', '张三', '000000', 'my.png');

SET FOREIGN_KEY_CHECKS = 1;
