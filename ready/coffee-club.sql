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

 Date: 14/10/2020 20:42:19
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
  `skus` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '食物属性',
  `num` int(11) NULL DEFAULT 1 COMMENT '食物数量',
  `sysdate` datetime(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`u_id`, `food_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of carts
-- ----------------------------

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
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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
INSERT INTO `dict` VALUES ('order_status', '订单状态', '6', NULL);
INSERT INTO `dict` VALUES ('size', '大小', '4', 2000);
INSERT INTO `dict` VALUES ('sugar', '糖', '2', 1000);
INSERT INTO `dict` VALUES ('temp', '温度', '1', 1000);

-- ----------------------------
-- Table structure for dict_son
-- ----------------------------
DROP TABLE IF EXISTS `dict_son`;
CREATE TABLE `dict_son`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `dictid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Cname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dict_son
-- ----------------------------
INSERT INTO `dict_son` VALUES ('1', 'order_status', 'order_status1', '支付完成');
INSERT INTO `dict_son` VALUES ('2', 'order_status', 'order_status2', '待取餐');
INSERT INTO `dict_son` VALUES ('3', 'order_status', 'order_status3', '取餐完成');
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
INSERT INTO `foods` VALUES (1, 1001, '抹茶瑞纳冰', '纵享丝滑', 1010, 15.99, 5, 50, '抹茶瑞纳冰口感独特', '1001.jpg');
INSERT INTO `foods` VALUES (2, 1002, '拿铁', '纵享丝滑', 1020, 16.70, 3, 51, '拿铁味道鲜美浓郁，回味无穷', '1002.jpg');
INSERT INTO `foods` VALUES (3, 1003, '陨石拿铁', '纵享丝滑', 1010, 18.00, 4, 52, '陨石拿铁不同于原味拿铁，更加的厚重', '1003.jpg');
INSERT INTO `foods` VALUES (4, 1004, '厚乳拿铁', '纵享丝滑', 1020, 16.77, 5, 53, '厚乳拿铁在常规拿铁上加入更多的原乳，味道更加鲜美', '1004.jpg');
INSERT INTO `foods` VALUES (5, 1005, '醉心黑摩卡', '纵享丝滑', 1010, 21.00, 4, 54, 'espresso（浓缩）+热水  ', '1005.jpg');
INSERT INTO `foods` VALUES (6, 1006, '精粹奥瑞白', '纵享丝滑', 1020, 18.50, 3, 55, 'espresso+牛奶+一勺奶泡 ', '1006.jpg');
INSERT INTO `foods` VALUES (7, 1007, '法式闪电泡芙', '甜蜜丝滑', 2000, 23.80, 5, 56, '巧克力酱+espresso+牛奶+奶油 ', '1007.jpg');
INSERT INTO `foods` VALUES (8, 1008, '心意浓情巧克力蛋糕', '纵享丝滑', 2000, 33.40, 5, 57, '纯滑扎实的奶油与浓郁稠密的巧克力', '1008.jpg');
INSERT INTO `foods` VALUES (9, 1009, '红莓慕斯杯蛋糕', '纵享丝滑', 2000, 26.70, 5, 58, '夹层中媚红的果酱配合红莓芬香', '1009.jpg');
INSERT INTO `foods` VALUES (10, 1010, '幸运美杏果蛋糕热巧克力', '纵享丝滑', 2000, 31.50, 5, 59, '外层是轻轻的冰霜，冰唇滑舌', '1010.jpg');
INSERT INTO `foods` VALUES (11, 1011, '抹茶蛋糕', '纵享丝滑', 3000, 25.70, 5, 60, '口感绵密，色彩艳丽。在炎热的夏天给人带来一股小清新。', '1011.jpg');
INSERT INTO `foods` VALUES (12, 1012, '高达芝士火腿三明治', '纵享丝滑', 3000, 17.80, 4, 61, '芝士与火腿的搭配，味觉的盛宴', '1012.jpg');
INSERT INTO `foods` VALUES (13, 1013, '蜂蜜提子司康', '纵享丝滑', 3000, 25.50, 4, 62, '甜蜜的天然蜂蜜与奶油的碰撞', '1013.jpg');
INSERT INTO `foods` VALUES (14, 1014, '火腿芝士可颂', '纵享丝滑', 3000, 30.70, 4, 63, '组织非常松软，火腿的绝美味道', '1014.jpg');
INSERT INTO `foods` VALUES (15, 1015, '法式马卡龙', '纵享丝滑', 4000, 18.80, 4, 64, '蛋液经过搅打后产生的松软的泡沫，清爽酥人', '1015.jpg');
INSERT INTO `foods` VALUES (16, 1016, '层层牛肉法棍', '纵享丝滑', 4000, 35.50, 4, 65, '口味非常香醇，重油牛肉满口浓香', '1016.jpg');
INSERT INTO `foods` VALUES (17, 1017, '培根蛋可颂堡', '纵享丝滑', 4000, 25.70, 3, 66, '多量的乳酪做成的蛋糕，一般奶酪蛋糕中加入的都是奶油奶酪', '1017.jpg');
INSERT INTO `foods` VALUES (18, 1018, '杏仁蝴蝶酥', '纵享丝滑', 4000, 19.00, 3, 67, '用打发的蛋清来增加蛋糕的松软度，粉类也会加得很少，蛋糕吃起来的口感会非常绵软，入口即化', '1018.jpg');
INSERT INTO `foods` VALUES (19, 1019, '法式薯条', '纵享丝滑', 5000, 15.00, 3, 68, '法式炸薯条，味道鲜美', '1019.jpg');
INSERT INTO `foods` VALUES (20, 1020, '原味薯条', '纵享丝滑', 5000, 13.50, 4, 69, '原味薯条，最纯美的马铃薯口感', '1020.jpg');
INSERT INTO `foods` VALUES (21, 1021, '英国炸鱼薯条', '纵享丝滑', 5000, 21.99, 4, 70, '英国炸鱼炸薯条，味道口感独特。', '1021.jpg');
INSERT INTO `foods` VALUES (22, 1022, '芝士薯条', '纵享丝滑', 5000, 18.00, 5, 71, '芝士炸薯条，唯美的芝士与浓香薯条的搭配。', '1022.jpg');
INSERT INTO `foods` VALUES (23, 1023, '法式三明治', '纵享丝滑', 6000, 17.80, 5, 72, '法式三明治的最佳味道让人回味', '1023.jpg');
INSERT INTO `foods` VALUES (24, 1024, '沙拉', '纵享丝滑', 6000, 22.50, 5, 73, '蔬菜的绝美搭配', '1024.jpg');
INSERT INTO `foods` VALUES (25, 1025, '小块切片', '纵享丝滑', 6000, 22.70, 5, 74, '适宜儿童的蛋糕', '1025.jpg');
INSERT INTO `foods` VALUES (26, 1026, '蓝莓蛋糕', '纵享丝滑', 6000, 18.80, 5, 75, '蓝莓味道浓香，芝士甜郁', '1026.jpg');
INSERT INTO `foods` VALUES (27, 1027, '红果蛋糕', '纵享丝滑', 6000, 23.90, 5, 76, '美味的奶香搭配', '1027.jpg');
INSERT INTO `foods` VALUES (28, 1028, '面包蛋糕', '纵享丝滑', 6000, 25.00, 3, 77, '浓香的全麦面包蛋糕，低脂肪', '1028.jpg');
INSERT INTO `foods` VALUES (29, 1029, '奇异果芝士蛋糕', '纵享丝滑', 6000, 33.80, 5, 78, '黄金奇异果和绿色奇异果为主料', '1029.jpg');
INSERT INTO `foods` VALUES (30, 1030, '红色麦芬蛋糕', '纵享丝滑', 6000, 19.90, 4, 79, '黄桃杨梅等鲜果都是爽脆的，配上软滑慕思，发不同脆味', '1030.jpg');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '用户id',
  `status` int(11) NULL DEFAULT NULL COMMENT '支付状态 0提交订单 1支付完成等待取餐 2表示已取餐 3表示订单完成',
  `countsum` int(255) NULL DEFAULT NULL,
  `pricesum` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `sysdate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `u_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('35f4a8d465e6e1edc05f3d8ab658c551', 'admin@mail.com', 1, 1, '15.99', '2020-10-14 20:29:47');
INSERT INTO `order` VALUES ('4f4adcbf8c6f66dcfc8a3282ac2bf10a', 'admin@mail.com', 1, 2, '53.4', '2020-10-14 20:35:11');
INSERT INTO `order` VALUES ('9cfdf10e8fc047a44b08ed031e1f0ed1', 'admin@mail.com', 1, 1, '15.99', '2020-10-14 20:36:09');
INSERT INTO `order` VALUES ('e5841df2166dd424a57127423d276bbe', 'admin@mail.com', 1, 4, '79.6', '2020-10-14 20:38:31');
INSERT INTO `order` VALUES ('eae27d77ca20db309e056e3d2dcd7d69', 'admin@mail.com', 1, 2, '38.8', '2020-10-14 17:21:49');
INSERT INTO `order` VALUES ('fccb60fb512d13df5083790d64c4d5dd', 'admin@mail.com', 1, 5, '103.39', '2020-10-14 16:59:33');

-- ----------------------------
-- Table structure for order_list
-- ----------------------------
DROP TABLE IF EXISTS `order_list`;
CREATE TABLE `order_list`  (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `food_id` int(20) NULL DEFAULT NULL,
  `countbuy` int(255) NULL DEFAULT NULL,
  `food_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `skus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `food_pic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_list
-- ----------------------------
INSERT INTO `order_list` VALUES (9, 'fccb60fb512d13df5083790d64c4d5dd', 1007, 2, '法式闪电泡芙', 23.80, '小份', 'http://127.0.0.1:3002/imgs/1007.jpg');
INSERT INTO `order_list` VALUES (10, 'fccb60fb512d13df5083790d64c4d5dd', 1030, 2, '红色麦芬蛋糕', 19.90, '', 'http://127.0.0.1:3002/imgs/1030.jpg');
INSERT INTO `order_list` VALUES (11, 'fccb60fb512d13df5083790d64c4d5dd', 1001, 1, '抹茶瑞纳冰', 15.99, '冷_半糖_有奶油', 'http://127.0.0.1:3002/imgs/1001.jpg');
INSERT INTO `order_list` VALUES (12, 'eae27d77ca20db309e056e3d2dcd7d69', 1019, 1, '法式薯条', 15.00, '', 'http://127.0.0.1:3002/imgs/1019.jpg');
INSERT INTO `order_list` VALUES (13, 'eae27d77ca20db309e056e3d2dcd7d69', 1007, 1, '法式闪电泡芙', 23.80, '小份', 'http://127.0.0.1:3002/imgs/1007.jpg');
INSERT INTO `order_list` VALUES (14, '35f4a8d465e6e1edc05f3d8ab658c551', 1001, 1, '抹茶瑞纳冰', 15.99, '冷_无糖_有奶油', 'http://127.0.0.1:3002/imgs/1001.jpg');
INSERT INTO `order_list` VALUES (15, '4f4adcbf8c6f66dcfc8a3282ac2bf10a', 1009, 2, '红莓慕斯杯蛋糕', 26.70, '小份', 'http://127.0.0.1:3002/imgs/1009.jpg');
INSERT INTO `order_list` VALUES (16, '9cfdf10e8fc047a44b08ed031e1f0ed1', 1001, 1, '抹茶瑞纳冰', 15.99, '冷_无糖_无奶油', 'http://127.0.0.1:3002/imgs/1001.jpg');
INSERT INTO `order_list` VALUES (17, 'e5841df2166dd424a57127423d276bbe', 1030, 4, '红色麦芬蛋糕', 19.90, '', 'http://127.0.0.1:3002/imgs/1030.jpg');

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
