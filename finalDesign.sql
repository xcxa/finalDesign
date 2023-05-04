/*
 Navicat Premium Data Transfer

 Source Server         : 47.120.6.85
 Source Server Type    : MySQL
 Source Server Version : 80032 (8.0.32)
 Source Host           : 47.120.6.85:3306
 Source Schema         : coursedesign

 Target Server Type    : MySQL
 Target Server Version : 80032 (8.0.32)
 File Encoding         : 65001

 Date: 23/04/2023 19:24:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category_goods
-- ----------------------------
DROP TABLE IF EXISTS `category_goods`;
CREATE TABLE `category_goods`  (
                                   `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户ID',
                                   `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品ID（主键，随机码）',
                                   `dscrip` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品介绍信息',
                                   `price` double NULL DEFAULT NULL COMMENT '商品价格',
                                   `goods_level` double NULL DEFAULT NULL COMMENT '商品新旧程度',
                                   `up_status` int NULL DEFAULT NULL COMMENT '上架状态',
                                   `use_status` int NULL DEFAULT NULL COMMENT '可用状态',
                                   `hot` double NULL DEFAULT NULL COMMENT '热度信息',
                                   `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
                                   `category` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '类别',
                                   PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category_goods
-- ----------------------------
INSERT INTO `category_goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '4c8d328b-a32d-40af-8170-cdac85c5c6b2', 'se2', 1111, 99, 1, 1, 0, 'se', '数码产品');
INSERT INTO `category_goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '54c10c53-9cba-44c3-80a5-39db42beb9b7', '12312312', 11111, 99, 1, 1, 0, '生活百货tset', '3');
INSERT INTO `category_goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'a8576931-efe8-4dc1-97b5-6dfec2a5fd65', '更多商品 test', 99, 99, 1, 1, 0, '更多商品 test', '7');
INSERT INTO `category_goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'bb9f7349-8af8-405f-9df9-a1f87561dc07', '二手图书test', 999, 99, 1, 1, 0, '二手图书test', '2');
INSERT INTO `category_goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'e469b799-d42e-48d1-9925-265b7230bf77', '1', 1, 1, 1, 1, 0, '1', '1');
INSERT INTO `category_goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'ee472ffc-b93f-4065-b9c7-bd3a35407c4b', '12312', 1231, 99, 1, 1, 0, 'test', '1');

-- ----------------------------
-- Table structure for feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `feedbacks`;
CREATE TABLE `feedbacks`  (
                              `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户ID',
                              `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品ID',
                              `pay_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付ID',
                              `value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '文字信息',
                              `feedbacks_time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '时间',
                              `feedbacks_status` int NULL DEFAULT NULL COMMENT '类型（1投诉、0建议、-1反馈）',
                              `orders_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单ID',
                              `feedbacks_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '投诉、建议、反馈信息ID（主键、随机码）',
                              `solve_status` int NULL DEFAULT NULL COMMENT '管理员处理状态（1已处理、0未处理、-1不予处理）',
                              `solve_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '管理员处理结果信息',
                              `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
                              PRIMARY KEY (`feedbacks_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of feedbacks
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
                          `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户ID',
                          `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品ID（主键，随机码）',
                          `dscrip` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品介绍信息',
                          `price` double NULL DEFAULT NULL COMMENT '商品价格',
                          `goods_level` double NULL DEFAULT NULL COMMENT '商品新旧程度',
                          `up_status` int NULL DEFAULT NULL COMMENT '上架状态',
                          `use_status` int NULL DEFAULT NULL COMMENT '可用状态',
                          `hot` double NULL DEFAULT NULL COMMENT '热度信息',
                          `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品名称',
                          PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (NULL, '0791023b-7c50-4d67-a663-462c690d39de', '1', 1, 1, 1, 1, 0, '1');
INSERT INTO `goods` VALUES (NULL, '0a3b092e-6c84-49bf-a55d-3db4f69af460', '12321312', 123321, 99, 1, 1, 0, '笔记本');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '54c10c53-9cba-44c3-80a5-39db42beb9b7', '12312312', 11111, 99, 1, 1, 0, '生活百货tset');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '70d8856c-2da5-4f5e-b904-68c05790bee3', '黄色64g vx：123321', 1300, 95, 1, 1, 0, 'iphone xr');
INSERT INTO `goods` VALUES (NULL, '8242cc71-64bb-4432-9338-074745fe7276', '1', 1, 1, 1, 1, 0, '1');
INSERT INTO `goods` VALUES (NULL, '87e1a521-6768-48e8-a17a-c488e8d898d1', '1', 1, 1, 1, 1, 0, '1');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '9288612c-6ad4-4725-8d3d-f784bfa02dca', '1', 1, 1, 1, 1, 0, '1');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'a8576931-efe8-4dc1-97b5-6dfec2a5fd65', '更多商品 test', 99, 99, 1, 1, 0, '更多商品 test');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'b0f61160-7571-4811-8388-d962929d6b78', '白色125g', 999, 99, 1, 1, 0, 'iphone se2');
INSERT INTO `goods` VALUES (NULL, 'b3689660-4ca2-465b-96ed-66294c7683fe', 'se', 1313, 99, 1, 1, 0, 'se');
INSERT INTO `goods` VALUES (NULL, 'b9ef4438-9ca8-4969-9420-2a323b8e481b', '1', 1, 1, 1, 1, 0, '1');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'bb9f7349-8af8-405f-9df9-a1f87561dc07', '二手图书test', 999, 99, 1, 1, 0, '二手图书test');
INSERT INTO `goods` VALUES (NULL, 'ced4fb78-4f42-4841-a82d-0b0bc54c0cab', '1', 1, 1, 1, 1, 0, '1');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'e469b799-d42e-48d1-9925-265b7230bf77', '1', 1, 1, 1, 1, 0, '1');
INSERT INTO `goods` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'ee472ffc-b93f-4065-b9c7-bd3a35407c4b', '12312', 1231, 99, 1, 1, 0, 'test');
INSERT INTO `goods` VALUES (NULL, 'fbe28e40-65fd-46ec-8bbe-98b0ee41709f', '1', 1, 1, 1, 1, 0, '1');

-- ----------------------------
-- Table structure for goodsurl
-- ----------------------------
DROP TABLE IF EXISTS `goodsurl`;
CREATE TABLE `goodsurl`  (
                             `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品ID',
                             `img_url` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品图片URL信息',
                             `img_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                             PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goodsurl
-- ----------------------------
INSERT INTO `goodsurl` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/b7bd8211-f006-400e-ad4b-c618b383f848.jpg', '22157240-0edb-4fe1-8f8a-6449037e7fc9');
INSERT INTO `goodsurl` VALUES ('b0f61160-7571-4811-8388-d962929d6b78', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/a80a5be7-3c1f-4532-b327-2d10b6c64367.jpg', '268b6ab6-9b6e-4c69-977c-3d45fbfbf36f');
INSERT INTO `goodsurl` VALUES ('e60edc2d-fd28-4735-bd86-ce16e77e81b4', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/e0303766-c93f-463d-9b20-e79763b2ce1a.jpg', '276cdf8f-aee6-472f-9172-67e405f5dbdf');
INSERT INTO `goodsurl` VALUES ('c6e8d355-4b0f-4163-9346-98bfe9ce9c2a', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/f50def1c-88af-4e5b-8e2f-eee51e245ef9.jpg', '328d3240-1f09-40a5-9a68-6ae710d114ea');
INSERT INTO `goodsurl` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/8db82311-4c0b-48e8-a3dc-6ec90b69fb69.png', '32bb20c6-8c3f-4d31-9838-2b671cfe643f');
INSERT INTO `goodsurl` VALUES ('3e9ee5bd-2f58-4b20-8bc0-d0baeda130b3', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/2ff4cc89-0c8d-4f33-89a7-b82d6116b0be.jpg', '3533f637-2351-4529-a08b-c082f2bb0dda');
INSERT INTO `goodsurl` VALUES ('a8576931-efe8-4dc1-97b5-6dfec2a5fd65', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/0e32df49-3114-4a7a-a119-cb23923e5506.jpg', '358364de-1bb3-47af-899a-b43645c9649b');
INSERT INTO `goodsurl` VALUES ('e469b799-d42e-48d1-9925-265b7230bf77', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/5caebbf1-b239-4b31-801b-3b7848d3af80.png', '3e1a96f5-6f07-4c53-91b5-490dcc3c1d2e');
INSERT INTO `goodsurl` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/1648eb0c-ca67-4f2f-b44d-8f2a6869119f.jpg', '474f1f69-f351-4404-b26c-7ece2b9cd938');
INSERT INTO `goodsurl` VALUES ('9288612c-6ad4-4725-8d3d-f784bfa02dca', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/b53b5a66-1f9f-473f-ae44-257fcd952e39.jpg', '500f067b-be6b-4dbd-8691-3dd95ad3816d');
INSERT INTO `goodsurl` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/0aa8c188-4f80-46a3-8b1d-b51abdd66508.jpg', '9026699a-850a-4238-9b8e-c347139fae22');
INSERT INTO `goodsurl` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/21515eb1-06a3-4937-814c-2fd325499a28.jpg', '998f8734-9e18-43dc-8426-abb1b088cc35');
INSERT INTO `goodsurl` VALUES ('bb9f7349-8af8-405f-9df9-a1f87561dc07', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/2610ccbe-7ce9-4a91-a108-14fdb0fd1e93.jpg', '9a405021-653f-4dab-a4d1-1856b215a9d8');
INSERT INTO `goodsurl` VALUES ('8e800437-bf95-4e28-8bed-4245febe78bf', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/02a93d5b-0dc6-4058-b5f3-b7bc6cd38637.jpg', 'a2dd4245-96db-4ee7-840e-e84fc1cadc41');
INSERT INTO `goodsurl` VALUES ('54c10c53-9cba-44c3-80a5-39db42beb9b7', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/1a9233c6-2abd-4ea4-8da4-ddd47b8d2d5b.jpg', 'a3b75634-80cf-4e32-851e-36645515fbbf');
INSERT INTO `goodsurl` VALUES ('0791023b-7c50-4d67-a663-462c690d39de', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/4673bfc4-8ce6-4459-9d05-6ba24067993d.jpg', 'b0d08d04-b5c5-4639-a694-eeb9f80cedd1');
INSERT INTO `goodsurl` VALUES ('fbe28e40-65fd-46ec-8bbe-98b0ee41709f', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/851b8155-2ccb-41fd-b740-8c0b423bb647.jpg', 'b1256019-c428-44af-8ccc-9c90792d8002');
INSERT INTO `goodsurl` VALUES ('a8576931-efe8-4dc1-97b5-6dfec2a5fd65', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/98613a72-b767-4071-aa50-dab728e9d986.jpg', 'b3020e7d-7886-4b7c-b71f-20bd3022ed5a');
INSERT INTO `goodsurl` VALUES ('ee472ffc-b93f-4065-b9c7-bd3a35407c4b', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/2d7cec7b-af7a-4595-9161-478ee3abac78.png', 'b4473b39-c80c-4aaa-b241-a61db1986d53');
INSERT INTO `goodsurl` VALUES ('b3689660-4ca2-465b-96ed-66294c7683fe', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/f04fced8-a59a-45f8-bad4-a362ed49496e.jpg', 'bb43bd31-6d18-46a3-8504-fe87bccc07a3');
INSERT INTO `goodsurl` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/72a6f6c4-5adf-4912-9b19-49839437f47e.jpg', 'be143396-5b9e-4d55-b812-397c027b3415');
INSERT INTO `goodsurl` VALUES ('ced4fb78-4f42-4841-a82d-0b0bc54c0cab', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/34b86c70-348b-475a-ae4b-790668a711d2.jpg', 'c0947833-55cf-4e9c-9357-54df919c44bd');
INSERT INTO `goodsurl` VALUES ('87e1a521-6768-48e8-a17a-c488e8d898d1', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/bb59c1bb-2aba-44a4-8a93-cd09b365128f.jpg', 'd34f2d06-aa9c-48b6-ad97-0e01ffea5322');
INSERT INTO `goodsurl` VALUES ('8242cc71-64bb-4432-9338-074745fe7276', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/0144600c-2c6d-419c-a108-d330f7830ab5.jpg', 'dcbf78be-52f6-4ee9-80f0-092fa507caf2');
INSERT INTO `goodsurl` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/941a0498-bd33-4f7b-8b08-27ae8704bf7d.jpg', 'de1d9950-8593-4278-99cf-f27aba06e084');
INSERT INTO `goodsurl` VALUES ('70d8856c-2da5-4f5e-b904-68c05790bee3', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/77040528-cb1c-410b-8a40-9390861fc7a7.jpg', 'e0b810a8-ad7a-4b60-a549-a289c67ed0fa');
INSERT INTO `goodsurl` VALUES ('b9ef4438-9ca8-4969-9420-2a323b8e481b', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/7748df4a-0118-46d7-b99f-5dff7d959936.jpg', 'f16a7745-dda1-4493-a2c4-90316cdf06af');
INSERT INTO `goodsurl` VALUES ('0a3b092e-6c84-49bf-a55d-3db4f69af460', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/edb27c5d-c7ef-4a60-884f-34dea78aadaf.jpg', 'f9795c6f-92cf-4df2-9966-edf005c31f1a');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
                            `message_id` int NOT NULL AUTO_INCREMENT,
                            `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
                            `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '消息',
                            `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '商品id',
                            `sender_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '发送人id',
                            `recipient_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '接收者id',
                            `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '消息时间',
                            PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (16, 'xcx', '可以便宜吗', 'b0f61160-7571-4811-8388-d962929d6b78', 'a40be144-4fb9-4289-b039-2b59dfca738e', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '2023-03-24 13:40:47');
INSERT INTO `message` VALUES (17, 'xcx', '可以便宜吗', 'b0f61160-7571-4811-8388-d962929d6b78', 'a40be144-4fb9-4289-b039-2b59dfca738e', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '2023-03-24 13:40:57');
INSERT INTO `message` VALUES (18, 'xcx', '可以便宜吗', 'b0f61160-7571-4811-8388-d962929d6b78', 'a40be144-4fb9-4289-b039-2b59dfca738e', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '2023-03-24 13:41:35');
INSERT INTO `message` VALUES (19, 'microphone', '很不错', 'a8576931-efe8-4dc1-97b5-6dfec2a5fd65', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '2023-04-19 23:51:19');
INSERT INTO `message` VALUES (20, 'microphone', '还可以', 'a8576931-efe8-4dc1-97b5-6dfec2a5fd65', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '2023-04-20 19:38:30');
INSERT INTO `message` VALUES (21, 'microphone', '消息测试', 'a8576931-efe8-4dc1-97b5-6dfec2a5fd65', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '2023-04-22 19:03:34');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
                           `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户ID',
                           `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品ID',
                           `orders_status` int NULL DEFAULT NULL COMMENT '订单状态（1已完成、0未完成、-1有异议）',
                           `price` double NULL DEFAULT NULL COMMENT '商品价格',
                           `pay_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付ID',
                           `orders_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '订单ID（主键、随机码）',
                           `admin_status` int NULL DEFAULT NULL COMMENT '处理状态（1已处理、0未处理）',
                           `time` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`orders_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'b0f61160-7571-4811-8388-d962929d6b78', 0, 999, '6ca0200d-cfba-4a46-b68c-52cbfb158085', '34aacc61-92a8-414c-ae28-2cf92fa3cdba', 0, '2023年04月15日');
INSERT INTO `orders` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'b0f61160-7571-4811-8388-d962929d6b78', 0, 999, '913501ba-0a76-4329-bf57-03ddbb045493', '47ab82de-7204-4cf3-b432-a7296172b920', 0, '2023年03月24日');

-- ----------------------------
-- Table structure for ordersback
-- ----------------------------
DROP TABLE IF EXISTS `ordersback`;
CREATE TABLE `ordersback`  (
                               `orders_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '订单ID',
                               `feedbacks_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '投诉、建议、反馈信息ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordersback
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments`  (
                             `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户ID',
                             `pay_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '支付ID（主键，随机码）',
                             `price` double NULL DEFAULT NULL COMMENT '费用',
                             `status` int NULL DEFAULT NULL COMMENT '费用状态（已经转给卖家1，费用在平台0，已经退回给买家-1）',
                             `pay_time` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '支付时间',
                             `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '商品ID',
                             `pay_status` int NULL DEFAULT NULL COMMENT '支付状态（已完成1、未完成0、有异议-1）',
                             PRIMARY KEY (`pay_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for shopcar
-- ----------------------------
DROP TABLE IF EXISTS `shopcar`;
CREATE TABLE `shopcar`  (
                            `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
                            `goods_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopcar
-- ----------------------------
INSERT INTO `shopcar` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '54c10c53-9cba-44c3-80a5-39db42beb9b7');
INSERT INTO `shopcar` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '0791023b-7c50-4d67-a663-462c690d39de');
INSERT INTO `shopcar` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '0791023b-7c50-4d67-a663-462c690d39de');
INSERT INTO `shopcar` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', 'a8576931-efe8-4dc1-97b5-6dfec2a5fd65');

-- ----------------------------
-- Table structure for student_verification
-- ----------------------------
DROP TABLE IF EXISTS `student_verification`;
CREATE TABLE `student_verification`  (
                                         `userid` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户id',
                                         `isStudent` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否是学生',
                                         `verificationPicUrl` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '认证图',
                                         `applying` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '申请中',
                                         PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_verification
-- ----------------------------
INSERT INTO `student_verification` VALUES ('a40be144-4fb9-4289-b039-2b59dfca738e', '1', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/e7049c28-fd08-4f82-bf6f-4825c5f99f79.jpg', '0');
INSERT INTO `student_verification` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '0', 'https://finaldesign-xcx.oss-cn-hangzhou.aliyuncs.com/4ca10a1e-78c2-44bd-98cc-91ebd79cb406.jpg', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
                          `user_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户ID，主键（随机码）',
                          `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
                          `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户名',
                          `password` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '密码',
                          `sex` int NULL DEFAULT NULL COMMENT '性别（1男，2女）',
                          `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
                          `status` int NULL DEFAULT NULL COMMENT '账户启用状态',
                          `admin` int NULL DEFAULT NULL COMMENT '是否管理员账户',
                          PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('4058304b-7ce4-4224-8021-7c646958d443', 'micropho', '麦克风', 'xcx666...', 0, '123', 1, 0);
INSERT INTO `users` VALUES ('a40be144-4fb9-4289-b039-2b59dfca738e', 'xcx1', 'xcx', 'xcx666...', 0, '123', 1, 0);
INSERT INTO `users` VALUES ('b4e17f27-dfde-464c-828a-f2bfb2b4e72c', '麦克风1', 'microphone', 'xcx666...', 1, '123', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
