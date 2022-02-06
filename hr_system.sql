/*
 Navicat Premium Data Transfer

 Source Server         : jie
 Source Server Type    : MySQL
 Source Server Version : 50515
 Source Host           : localhost:3306
 Source Schema         : hr_system

 Target Server Type    : MySQL
 Target Server Version : 50515
 File Encoding         : 65001

 Date: 05/01/2022 20:10:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`major_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '计算机科学与技术');
INSERT INTO `major` VALUES (2, '软件工程');
INSERT INTO `major` VALUES (3, '物联网工程');
INSERT INTO `major` VALUES (4, '土木工程');
INSERT INTO `major` VALUES (5, '会计');

-- ----------------------------
-- Table structure for nation
-- ----------------------------
DROP TABLE IF EXISTS `nation`;
CREATE TABLE `nation`  (
  `nation_id` int(11) NOT NULL AUTO_INCREMENT,
  `nation_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nation_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nation
-- ----------------------------
INSERT INTO `nation` VALUES (1, '汉族');
INSERT INTO `nation` VALUES (2, '布依族');
INSERT INTO `nation` VALUES (3, '藏族');
INSERT INTO `nation` VALUES (4, '壮族');
INSERT INTO `nation` VALUES (5, '苗族');

-- ----------------------------
-- Table structure for nationality
-- ----------------------------
DROP TABLE IF EXISTS `nationality`;
CREATE TABLE `nationality`  (
  `nationality_id` int(11) NOT NULL COMMENT '国籍代码',
  `nationality_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '国籍名称',
  PRIMARY KEY (`nationality_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of nationality
-- ----------------------------
INSERT INTO `nationality` VALUES (1, '中国');
INSERT INTO `nationality` VALUES (2, '美国');
INSERT INTO `nationality` VALUES (3, '加拿大');
INSERT INTO `nationality` VALUES (4, '俄罗斯');
INSERT INTO `nationality` VALUES (5, '英国');

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `organization_id` int(11) NOT NULL COMMENT '机构id',
  `organization_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `organization_level` int(11) NULL DEFAULT NULL COMMENT '机构等级',
  `parent_organization_id` int(11) NULL DEFAULT NULL COMMENT '上级机构id（当上级机构id等于0时，则代表当前机构为最顶层机构）',
  PRIMARY KEY (`organization_id`) USING BTREE,
  INDEX `organization_ibfk_1`(`parent_organization_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, '集团1', 1, 0);
INSERT INTO `organization` VALUES (2, '集团2', 1, 0);
INSERT INTO `organization` VALUES (3, '软件公司', 2, 1);
INSERT INTO `organization` VALUES (4, '生物科技公司', 2, 1);
INSERT INTO `organization` VALUES (5, '电子科技公司', 2, 1);
INSERT INTO `organization` VALUES (6, '贸易公司', 2, 1);
INSERT INTO `organization` VALUES (7, '公司5', 2, 2);
INSERT INTO `organization` VALUES (8, '公司6', 2, 2);
INSERT INTO `organization` VALUES (9, '公司7', 3, 2);
INSERT INTO `organization` VALUES (10, '财务部', 3, 6);
INSERT INTO `organization` VALUES (11, '行政部', 3, 6);
INSERT INTO `organization` VALUES (12, '营销部', 3, 6);
INSERT INTO `organization` VALUES (13, '生产部', 3, 5);
INSERT INTO `organization` VALUES (14, '外包组', 3, 3);
INSERT INTO `organization` VALUES (15, '测试组', 3, 3);
INSERT INTO `organization` VALUES (16, '开发组', 3, 3);
INSERT INTO `organization` VALUES (17, '运维组', 3, 3);
INSERT INTO `organization` VALUES (18, '售后服务部', 3, 5);
INSERT INTO `organization` VALUES (19, '策划部', 3, 6);
INSERT INTO `organization` VALUES (20, '技术部', 3, 5);
INSERT INTO `organization` VALUES (21, '研发部', 3, 5);
INSERT INTO `organization` VALUES (22, '人力资源部', 3, 6);
INSERT INTO `organization` VALUES (23, '市场部', 3, 4);
INSERT INTO `organization` VALUES (24, '生物科技研发部', 3, 4);
INSERT INTO `organization` VALUES (25, '生物科技生产部', 3, 4);
INSERT INTO `organization` VALUES (26, '公司5技术部', 3, 7);
INSERT INTO `organization` VALUES (27, '公司6研发部', 3, 8);
INSERT INTO `organization` VALUES (28, '公司7策划部', 3, 9);

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `position_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位主键',
  `position_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `position_category_id` int(11) NULL DEFAULT NULL COMMENT '职位分类外键',
  PRIMARY KEY (`position_id`) USING BTREE,
  INDEX `position_category_id`(`position_category_id`) USING BTREE,
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`position_category_id`) REFERENCES `position_category` (`position_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES (1, '项目经理', 4);
INSERT INTO `position` VALUES (2, '软件工程师', 1);
INSERT INTO `position` VALUES (3, '软件测试师', 5);
INSERT INTO `position` VALUES (4, '软件分析师', 1);
INSERT INTO `position` VALUES (5, '后端工程师', 1);
INSERT INTO `position` VALUES (6, '架构师', 1);
INSERT INTO `position` VALUES (7, '行政总监', 2);
INSERT INTO `position` VALUES (8, '产品经理', 4);
INSERT INTO `position` VALUES (9, '会计', 8);
INSERT INTO `position` VALUES (10, '商业数据分析', 6);
INSERT INTO `position` VALUES (11, '网络安全工程师', 1);
INSERT INTO `position` VALUES (12, '美工', 1);
INSERT INTO `position` VALUES (13, '运维工程师', 9);
INSERT INTO `position` VALUES (14, '数据工程师', 1);
INSERT INTO `position` VALUES (15, '产品助理', 4);
INSERT INTO `position` VALUES (16, '行政助理', 3);
INSERT INTO `position` VALUES (17, '产品运营', 10);
INSERT INTO `position` VALUES (18, '销售经理', 6);
INSERT INTO `position` VALUES (19, '产品销售', 6);
INSERT INTO `position` VALUES (20, '行政经理', 3);
INSERT INTO `position` VALUES (21, '人力资源经理', 7);
INSERT INTO `position` VALUES (22, '财务经理', 8);
INSERT INTO `position` VALUES (23, '商务顾问', 6);

-- ----------------------------
-- Table structure for position_category
-- ----------------------------
DROP TABLE IF EXISTS `position_category`;
CREATE TABLE `position_category`  (
  `position_category_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职位分类主键',
  `position_category_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`position_category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of position_category
-- ----------------------------
INSERT INTO `position_category` VALUES (1, '软件开发');
INSERT INTO `position_category` VALUES (2, '高端职能职位');
INSERT INTO `position_category` VALUES (3, '行政');
INSERT INTO `position_category` VALUES (4, '项目管理');
INSERT INTO `position_category` VALUES (5, '测试');
INSERT INTO `position_category` VALUES (6, '市场/营销');
INSERT INTO `position_category` VALUES (7, '人力资源');
INSERT INTO `position_category` VALUES (8, '财务');
INSERT INTO `position_category` VALUES (9, '运维');
INSERT INTO `position_category` VALUES (10, '运营');

-- ----------------------------
-- Table structure for professional_title
-- ----------------------------
DROP TABLE IF EXISTS `professional_title`;
CREATE TABLE `professional_title`  (
  `professional_title_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '职称主键',
  `professional_title_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`professional_title_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '该表仅提供参考。' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of professional_title
-- ----------------------------
INSERT INTO `professional_title` VALUES (1, '高级开发工程师');
INSERT INTO `professional_title` VALUES (2, '会计师');
INSERT INTO `professional_title` VALUES (3, '技术员');
INSERT INTO `professional_title` VALUES (4, '工程师');
INSERT INTO `professional_title` VALUES (5, '统计师');

-- ----------------------------
-- Table structure for salary_payment
-- ----------------------------
DROP TABLE IF EXISTS `salary_payment`;
CREATE TABLE `salary_payment`  (
  `salary_payment_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '薪酬发放单号',
  `organization_1_id` int(11) NULL DEFAULT NULL,
  `organization_2_id` int(11) NULL DEFAULT NULL,
  `organization_3_id` int(11) NULL DEFAULT NULL,
  `number_of_staff` int(11) NULL DEFAULT NULL COMMENT '人数',
  `total_base_salary` decimal(12, 2) NULL DEFAULT NULL COMMENT '基本薪资总额',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态，1-待复核，2-已审核',
  `registrant` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记人',
  `register_time` datetime NULL DEFAULT NULL COMMENT '登记时间',
  `recheck_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复核人',
  `recheck_time` datetime NULL DEFAULT NULL COMMENT '复核时间',
  `real_pay` decimal(12, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '实际发放',
  PRIMARY KEY (`salary_payment_id`) USING BTREE,
  INDEX `organization_1_id`(`organization_1_id`) USING BTREE,
  INDEX `organization_2_id`(`organization_2_id`) USING BTREE,
  INDEX `organization_3_id`(`organization_3_id`) USING BTREE,
  CONSTRAINT `salary_payment_ibfk_1` FOREIGN KEY (`organization_1_id`) REFERENCES `organization` (`organization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `salary_payment_ibfk_2` FOREIGN KEY (`organization_2_id`) REFERENCES `organization` (`organization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `salary_payment_ibfk_3` FOREIGN KEY (`organization_3_id`) REFERENCES `organization` (`organization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of salary_payment
-- ----------------------------
INSERT INTO `salary_payment` VALUES ('SG2005101030', 2, 9, 28, 1, 4572.00, 0, 'sunburst', '2021-12-30 10:30:49', NULL, NULL, 4695.00);
INSERT INTO `salary_payment` VALUES ('SG2166443283', 1, 3, 14, 4, 21710.50, 0, 'sunburst', '2021-12-24 17:02:45', NULL, NULL, 22202.50);
INSERT INTO `salary_payment` VALUES ('SG3378593630', 1, 3, 16, 1, 7087.00, 1, 'Tobu', '2021-12-30 00:00:32', 'Tobu', '2021-12-30 09:56:51', 8087.00);
INSERT INTO `salary_payment` VALUES ('SG3867776195', 2, 7, 26, 1, 5679.50, 1, 'Tobu', '2021-12-30 11:36:28', 'Tobu', '2021-12-30 11:36:46', 5802.50);

-- ----------------------------
-- Table structure for salary_payment_detail
-- ----------------------------
DROP TABLE IF EXISTS `salary_payment_detail`;
CREATE TABLE `salary_payment_detail`  (
  `salary_payment_detail_id` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `record_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '档案编号',
  `staff_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `base_salary` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '基本工资',
  `travel_allowance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '交通补助',
  `lunch_allowance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '午餐补助',
  `communication_allowance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '通信补助',
  `endowment_insurance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '养老保险',
  `medical_insurance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '医疗保险',
  `unemployment_insurance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '失业保险',
  `housing_fund` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '住房公积金',
  `bonus` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '奖励奖金',
  `deduction_bonus` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '扣除奖金',
  `salary_payment_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属的薪酬发放单',
  PRIMARY KEY (`salary_payment_detail_id`) USING BTREE,
  INDEX `record_id`(`record_id`) USING BTREE,
  INDEX `salary_payment_id`(`salary_payment_id`) USING BTREE,
  CONSTRAINT `salary_payment_detail_ibfk_1` FOREIGN KEY (`record_id`) REFERENCES `staff_record` (`record_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `salary_payment_detail_ibfk_2` FOREIGN KEY (`salary_payment_id`) REFERENCES `salary_payment` (`salary_payment_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of salary_payment_detail
-- ----------------------------
INSERT INTO `salary_payment_detail` VALUES ('1250387f-2ef7-4297-acda-dad96fef0e3c', '2019010316M1', '庄捷丰', 7000.00, 385.00, 500.00, 500.00, 560.00, 143.00, 35.00, 560.00, 1000.00, 0.00, 'SG3378593630');
INSERT INTO `salary_payment_detail` VALUES ('210103b4-6e2b-40ac-bcac-dc85aa0e02e1', '2021020928XT', '庄捷丰', 5000.00, 200.00, 200.00, 100.00, 400.00, 103.00, 25.00, 400.00, 123.00, 0.00, 'SG2005101030');
INSERT INTO `salary_payment_detail` VALUES ('2a949f3c-4044-4ba7-9616-deee5e181d2d', '2019010314Q7', '测试4', 5000.00, 200.00, 200.00, 100.00, 400.00, 103.00, 25.00, 400.00, 123.00, NULL, 'SG2166443283');
INSERT INTO `salary_payment_detail` VALUES ('36a76b3d-005f-4f5e-a582-b9023e138172', '2019010314TL', '张三', 5500.00, 300.00, 600.00, 300.00, 440.00, 113.00, 27.50, 440.00, 123.00, NULL, 'SG2166443283');
INSERT INTO `salary_payment_detail` VALUES ('6718ec4e-b719-4a57-ae8d-d1a12e0f15ff', '20190103141I', '测试', 5000.00, 100.00, 100.00, 100.00, 400.00, 103.00, 25.00, 400.00, 123.00, NULL, 'SG2166443283');
INSERT INTO `salary_payment_detail` VALUES ('cfe024d3-5215-49c3-aedc-9505cf7da640', '20190103144O', '测试3', 7000.00, 385.00, 500.00, 500.00, 560.00, 143.00, 35.00, 560.00, 123.00, NULL, 'SG2166443283');
INSERT INTO `salary_payment_detail` VALUES ('ee98a739-6f6f-47d3-a9d4-b2669e8a63bf', '2021020726DK', '庄捷丰', 5500.00, 300.00, 600.00, 300.00, 440.00, 113.00, 27.50, 440.00, 123.00, 0.00, 'SG3867776195');

-- ----------------------------
-- Table structure for salary_standard
-- ----------------------------
DROP TABLE IF EXISTS `salary_standard`;
CREATE TABLE `salary_standard`  (
  `salary_standard_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '薪资标准编号',
  `salary_standard_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '薪资标准名称',
  `creator` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '制定人',
  `registrant` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记人',
  `register_time` datetime NULL DEFAULT NULL COMMENT '登记时间',
  `base_salary` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '基本工资',
  `travel_allowance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '交通补助',
  `lunch_allowance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '午餐补助',
  `communication_allowance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '通信补助',
  `endowment_insurance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '养老保险',
  `medical_insurance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '医疗保险',
  `unemployment_insurance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '失业保险',
  `housing_fund` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '住房公积金',
  `total_salary` decimal(10, 2) NULL DEFAULT NULL COMMENT '薪资总额',
  `status` int(11) NULL DEFAULT NULL COMMENT '薪酬标准状态，0-删除，1-正常，2-待审核',
  `audit_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `recheck_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复核人',
  `recheck_time` datetime NULL DEFAULT NULL COMMENT '复核事件',
  `update_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '变更时间',
  PRIMARY KEY (`salary_standard_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of salary_standard
-- ----------------------------
INSERT INTO `salary_standard` VALUES ('199435011958', '捷设置2', '庄捷丰', 'sunburst', '2021-12-30 11:34:58', 100.00, 100.00, 100.00, 100.00, 8.00, 12.00, 0.50, 8.00, 371.50, 1, '通过', 'Tobu', '2021-12-30 11:35:41', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('248708882559', 'first', '庄捷丰', 'sunburst', '2021-12-29 23:46:15', 111.00, 111.00, 111.00, 123.00, 8.88, 5.22, 0.56, 8.88, 432.46, 1, '', 'Tobu', '2021-12-29 23:58:09', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('260243707582', '软件分析师', '张三', 'sunburst', '2021-12-24 08:40:46', 6000.00, 12.00, 200.00, 200.00, 480.00, 123.00, 30.00, 480.00, 5299.00, 1, '好的', 'Tobu', '2021-12-03 19:12:06', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('261166786470', 'first', '庄捷丰', 'Tobu', '2021-12-30 00:17:48', 123.00, 123.00, 123.00, 124.00, 9.84, 12.46, 0.61, 9.84, 460.25, 1, '', 'Tobu', '2021-12-30 08:28:13', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('343256651254', '产品经理', '张三', 'sunburst', '2021-12-24 08:40:46', 7000.00, 385.00, 500.00, 500.00, 560.00, 143.00, 35.00, 560.00, 7087.00, 1, '', 'Tobu', '2021-12-03 19:13:02', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('361945534968', '捷设置', '庄捷丰', 'sunburst', '2021-12-29 23:54:15', 100.00, 100.00, 100.00, 100.00, 8.00, 12.00, 0.50, 8.00, 371.50, 1, '', 'Tobu', '2021-12-29 23:59:14', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('380543243066', '会计', '张三', 'sunburst', '2021-12-24 08:40:46', 5000.00, 300.00, 500.00, 500.00, 400.00, 103.00, 25.00, 400.00, 5372.00, 1, '', 'Tobu', '2021-12-09 19:13:25', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('549221093457', '1232131', '庄捷丰', 'Tobu', '2021-12-30 00:11:35', 111.00, 111.00, 100.00, 123.00, 8.88, 12.22, 0.56, 8.88, 414.46, 1, '', 'Tobu', '2021-12-30 08:28:33', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('574814897246', 'first1', '庄捷丰', 'Tobu', '2021-12-29 23:56:55', 213.00, 123.00, 123.00, 123.00, 17.04, 14.26, 1.06, 17.04, 532.60, 1, '', 'Tobu', '2021-12-30 00:11:55', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('659840455023', '123213', '', 'sunburst', '2021-12-24 17:04:24', 111.00, 111.00, 111.00, 11.00, 8.88, 5.22, 0.56, 8.88, 320.46, 2, NULL, NULL, '2021-12-14 17:54:42', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('680524421066', '运营', '张三', 'sunburst', '2021-12-24 08:40:46', 5000.00, 100.00, 100.00, 100.00, 400.00, 103.00, 25.00, 400.00, 4372.00, 1, '通过', NULL, '2021-12-29 23:26:23', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('713012787917', '架构师', '张三', 'sunburst', '2021-12-24 08:40:46', 5000.00, 556.00, 200.00, 1455.00, 400.00, 103.00, 25.00, 400.00, 6283.00, 1, '', 'Tobu', '2021-12-30 00:12:03', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('726025908224', '123213', '庄捷丰', 'sunburst', '2021-12-24 17:02:05', 111.00, 111.00, 111.00, 11.00, 8.88, 5.22, 0.56, 8.88, 320.46, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `salary_standard` VALUES ('764833707960', '捷设置3', '庄捷丰', 'sunburst', '2021-12-30 08:24:26', 100.00, 100.00, 100.00, 100.00, 8.00, 12.00, 0.50, 8.00, 371.50, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `salary_standard` VALUES ('778279867780', '销售经理', '张三', 'Tobu', '2021-12-24 08:40:46', 6000.00, 500.00, 300.00, 200.00, 480.00, 123.00, 30.00, 480.00, 5887.00, 1, '复核通过', 'Tobu', '2021-12-15 18:15:47', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('839971923975', 'first', '庄捷丰', 'sunburst', '2021-12-29 23:37:09', 111.00, 111.00, 123.00, 123.00, 8.88, 5.22, 0.56, 8.88, 444.46, 1, '2', 'Tobu', '2021-12-29 23:58:31', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('846314016426', '测试3', '张三', 'Tobu', '2021-12-24 08:40:46', 6000.00, 300.00, 300.00, 200.00, 480.00, 123.00, 30.00, 480.00, 5687.00, 2, NULL, NULL, '2021-12-29 17:55:24', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('853767867886', '软件开发工程师', '张三', 'sunburst', '2021-12-24 08:40:46', 5500.00, 300.00, 600.00, 300.00, 440.00, 113.00, 27.50, 440.00, 5679.50, 1, '', 'Tobu', '2021-12-24 08:40:46', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('898999238926', '捷设置2', '庄捷丰', 'Tobu', '2021-12-30 00:08:17', 12.00, 123.00, 123.00, 123.00, 0.96, 10.24, 0.06, 0.96, 368.78, 1, '', 'Tobu', '2021-12-30 08:28:17', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('905537310695', '测试3', '张三', 'Tobu', '2021-12-24 08:40:46', 5000.00, 200.00, 200.00, 100.00, 400.00, 103.00, 25.00, 400.00, 4572.00, 1, '通过', 'Tobu', '2021-12-29 23:57:13', NULL, NULL);
INSERT INTO `salary_standard` VALUES ('948408209671', '捷设置', '庄捷丰', 'Tobu', '2021-12-30 00:15:06', 100.00, 100.00, 100.00, 100.00, 8.00, 12.00, 0.50, 8.00, 371.50, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `salary_standard` VALUES ('968833380639', 'qee', '庄捷丰', 'Tobu', '2021-12-30 00:12:14', 100.00, 100.00, 123.00, 123.00, 8.00, 12.00, 0.50, 8.00, 417.50, 2, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `salary_standard` VALUES ('984529580256', '捷设置1', '庄捷丰', 'Tobu', '2021-12-30 00:05:42', 100.00, 100.00, 100.00, 100.00, 8.00, 12.00, 0.50, 8.00, 371.50, 2, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for staff_record
-- ----------------------------
DROP TABLE IF EXISTS `staff_record`;
CREATE TABLE `staff_record`  (
  `record_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案编号',
  `organization_1_id` int(2) NULL DEFAULT NULL COMMENT 'Ⅰ级机构',
  `organization_2_id` int(2) NULL DEFAULT NULL COMMENT 'Ⅱ级机构',
  `organization_3_id` int(2) NULL DEFAULT NULL COMMENT 'Ⅲ级机构',
  `position_category_id` int(11) NULL DEFAULT NULL COMMENT '职位分类',
  `position_id` int(11) NULL DEFAULT NULL COMMENT '职位',
  `professional_title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '职称',
  `staff_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mobilephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zip` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮编',
  `nationality_id` int(11) NULL DEFAULT NULL COMMENT '国籍id',
  `birthplace` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `nation_id` int(11) NULL DEFAULT NULL COMMENT '民族id',
  `faith` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '宗教信仰',
  `politics_status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `id_card` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份者号码',
  `social_security_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '社会保障号码',
  `age` int(11) NULL DEFAULT NULL,
  `education` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学历',
  `major_id` int(11) NULL DEFAULT NULL COMMENT '专业',
  `salary_standard_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT ' 薪资标准id',
  `bank` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开户银行',
  `credit_card` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `speciality` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '特长',
  `hobby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '爱好',
  `personal_resume` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人履历',
  `family_relationship_information` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '家庭关系信息',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `registrant` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '登记人',
  `recheck_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '复核人',
  `register_time` datetime NULL DEFAULT NULL COMMENT '登记时间',
  `recheck_time` datetime NULL DEFAULT NULL COMMENT '复核时间',
  `photo_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '照片路径',
  `status` int(11) NULL DEFAULT 2 COMMENT '档案状态，0-删除，1-正常，2-待审核',
  `update_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变更人',
  `update_time` datetime NULL DEFAULT NULL COMMENT '变更时间',
  PRIMARY KEY (`record_id`) USING BTREE,
  INDEX `nationality_id`(`nationality_id`) USING BTREE,
  INDEX `major_id`(`major_id`) USING BTREE,
  INDEX `position_category_id`(`position_category_id`) USING BTREE,
  INDEX `position_id`(`position_id`) USING BTREE,
  INDEX `organization_1_id`(`organization_1_id`) USING BTREE,
  INDEX `organization_2_id`(`organization_2_id`) USING BTREE,
  INDEX `organization_3_id`(`organization_3_id`) USING BTREE,
  INDEX `nation_id`(`nation_id`) USING BTREE,
  CONSTRAINT `staff_record_ibfk_1` FOREIGN KEY (`nationality_id`) REFERENCES `nationality` (`nationality_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_record_ibfk_10` FOREIGN KEY (`organization_2_id`) REFERENCES `organization` (`organization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_record_ibfk_11` FOREIGN KEY (`organization_3_id`) REFERENCES `organization` (`organization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_record_ibfk_12` FOREIGN KEY (`nation_id`) REFERENCES `nation` (`nation_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_record_ibfk_3` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_record_ibfk_7` FOREIGN KEY (`position_category_id`) REFERENCES `position_category` (`position_category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_record_ibfk_8` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `staff_record_ibfk_9` FOREIGN KEY (`organization_1_id`) REFERENCES `organization` (`organization_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of staff_record
-- ----------------------------
INSERT INTO `staff_record` VALUES ('20190103141I', 1, 3, 14, 1, 2, '技术员', '测试', '男', '', '', '', '', '', '', 1, '', NULL, 1, '其他', '共青团员', '', '', NULL, '小学', 1, '680524421066', '', '', '', '', '测试', '测试', '已修改', '', '庄捷丰', '2021-12-24 08:45:40', '2021-12-24 08:45:40', 'upload/4a94d457769342f4ae6ae955bd747b33.jpg', 0, '张三', '2019-01-11 17:18:43');
INSERT INTO `staff_record` VALUES ('20190103144O', 1, 3, 14, 1, 2, '统计师', '测试3', '男', '', '', '', '', '', '', 1, '', NULL, 1, '其他', '群众', '', '', NULL, '硕士研究生', 1, '343256651254', '', '', '', '', '', '', '复核通过', '', '庄捷丰', '2021-12-24 08:45:40', '2021-12-24 08:45:40', 'img/head.png', 1, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2019010314Q7', 1, 3, 14, 9, 13, '技术员', '测试4', '男', '', '', '', '', '', '', 1, '', NULL, 1, '其他', '群众', '', '', NULL, '小学', 1, '905537310695', '', '', '', '', '', '', '', '', '', '2021-12-24 08:45:40', '2021-12-24 08:45:40', 'img/head.png', 1, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2019010314TL', 1, 3, 14, 1, 2, '高级开发工程师', '张三', '男', '', '', '', '', '', '', 1, '', NULL, 1, '其他', '群众', '', '', NULL, '小学', 1, '853767867886', '', '', '', '', '', '', '', '', '庄捷丰', '2021-12-24 08:45:40', '2021-12-24 08:45:40', 'img/head.png', 1, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2019010314XP', 1, 3, 14, 1, 2, '高级开发工程师', 'Tony', '男', '646722505@qq.com', '123124', '213124328', '12432432', '广东海洋大学', '', 1, '', NULL, 1, '其他', '群众', '', '', NULL, '本科', 1, '853767867886', '', '', '', '', '应届生', '家庭关系信息', '无', '张三', NULL, '2021-12-24 08:45:40', NULL, 'upload/b24d8d77529644d2a54e34dce1fef5b7.jpg', 2, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2019010314ZU', 1, 3, 14, 1, 2, '会计师', '测试1', '男', '', '123', '21312432', '12432432', 'gdou', '123214', 1, 'e', '2019-01-02', 2, '其他', '共青团员', '1234', '324', 20, '本科', 3, '260243707582', '', '', '后端开发', '电影', '无', '无\r\n', '无', '', '', '2021-12-24 08:45:40', '2021-12-24 08:45:40', 'upload/e0e0dd36d5fc45dc9345ee6e45d3e96e.jpg', 0, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2019010316M1', 1, 3, 16, 1, 2, '高级开发工程师', '庄捷丰', '男', '646722505@qq.com', '654321', '646722505', '123456', '广东海洋大学', '123456', 1, '', '1998-06-01', 2, '其他', '共青团员', '', '', NULL, '本科', 1, '343256651254', '', '', '后端开发', '敲代码', '示例', '示例', '复核通过', '张三', '庄捷丰', '2021-12-24 08:45:40', '2021-12-24 08:45:40', 'upload/d410aa23336f4fa18b7c47101e727403.jpg', 1, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2021010314V3', 1, 3, 14, 1, 2, '会计师', '庄捷丰', '男', '554191420@qq.com', '178171723213', '523523535', '12123123123', '广东省', '21421', 1, '广东省', '2021-12-16', 1, '其他', '群众', '24124124124', '412412421', 124124, '本科', 1, '260243707582', '三', '1787777723', '后端开发', '足球', '说答案所大', '萨达', '阿萨德', '张三', '庄捷丰', '2021-12-24 16:54:15', '2021-12-30 10:17:51', 'img/head.png', 0, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2021020726DK', 2, 7, 26, 1, 2, '会计师', '庄捷丰', '男', '554191420@qq.com', '123213', '123213', '123213', '广东省', '12323', 1, '广东省', '2021-12-15', 1, '其他', '群众', '123123', '213213', 12, '本科', 1, '853767867886', '12323', '213', '前端开发', '旅行', '123213', '123123', '123213', '张三', '庄捷丰', '2021-12-30 11:31:40', '2021-12-30 11:32:49', 'img/head.png', 1, NULL, NULL);
INSERT INTO `staff_record` VALUES ('20210208279A', 2, 8, 27, 1, 2, '会计师', '庄捷丰', '男', '213', '12321312', '3213123', '123123', '广东省', '12312', 1, '广东省', NULL, 1, '其他', '群众', '213123123', '123213', 123, '本科', 1, '778279867780', '123123', '123123', '', '', '213', '123', '123', '张三', '庄捷丰', '2021-12-30 10:53:12', '2021-12-30 10:53:32', 'upload/0f3ced201aef4e57855608a88e02a9b6.png', 1, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2021020827AX', 2, 8, 27, 1, 2, '会计师', '庄捷丰', '男', '554191420@qq.com', '178171723213', '55418142', '123123213', '广东省', '21421', 1, '广东省', '2021-12-24', 1, '其他', '群众', '24124124124', '123123', 124124, '本科', 1, '248708882559', '三', '1787777723', '前端开发', '足球', '21312', '123', '123', '张三', '庄捷丰', '2021-12-30 00:20:54', '2021-12-30 10:17:45', 'upload/97193cbb06a94bb09797dc41c7b04ea6.png', 1, NULL, NULL);
INSERT INTO `staff_record` VALUES ('2021020928XT', 2, 9, 28, 1, 2, '会计师', '庄捷丰', '男', '554191420@qq.com', '178171723213', '55418142', '213213', '广东省', '21421', 1, '广东省', '2021-12-15', 1, '其他', '群众', '123123', '123', 123123, '本科', 1, '905537310695', '21312', '213123', '后端开发', '电影', '123', '123', '123', '张三', '庄捷丰', '2021-12-30 10:27:36', '2021-12-30 10:28:54', 'img/head.png', 1, NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户角色',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('sunburst', 'e10adc3949ba59abbe56e057f20f883e', 'ROLE_CB_specialist');
INSERT INTO `user` VALUES ('Tobu', 'e10adc3949ba59abbe56e057f20f883e', 'ROLE_CB_manager');
INSERT INTO `user` VALUES ('庄捷丰', 'e10adc3949ba59abbe56e057f20f883e', 'ROLE_HR_manager');
INSERT INTO `user` VALUES ('张三', 'e10adc3949ba59abbe56e057f20f883e', 'ROLE_HR_specialist');

-- ----------------------------
-- View structure for no_register_payment_view
-- ----------------------------
DROP VIEW IF EXISTS `no_register_payment_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `no_register_payment_view` AS select '10000000001' AS `salary_payment_id`,`staff_record`.`organization_1_id` AS `organization_1_id`,`staff_record`.`organization_2_id` AS `organization_2_id`,`staff_record`.`organization_3_id` AS `organization_3_id`,count(0) AS `number_of_staff`,sum(`salary_standard`.`total_salary`) AS `total_base_salary`,2 AS `status` from (`staff_record` join `salary_standard`) where ((`staff_record`.`status` = 1) and (`staff_record`.`salary_standard_id` = `salary_standard`.`salary_standard_id`)) group by `staff_record`.`organization_1_id`,`staff_record`.`organization_2_id`,`staff_record`.`organization_3_id` ;

SET FOREIGN_KEY_CHECKS = 1;
