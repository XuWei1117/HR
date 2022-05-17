/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : hr

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 02/10/2021 09:48:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for candidate
-- ----------------------------
DROP TABLE IF EXISTS `candidate`;
CREATE TABLE `candidate`  (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_age` int(11) NOT NULL,
  `c_gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_departId` int(11) NOT NULL,
  `c_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `c_salary` double(11, 2) NOT NULL,
  `c_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`c_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of candidate
-- ----------------------------
INSERT INTO `candidate` VALUES (2, '张晓', 25, '男', '本科生', '齐鲁理工学院', 3, '371425199309091234', 4500.00, '13023455678');
INSERT INTO `candidate` VALUES (3, '安安', 25, '男', '本科生', '齐鲁理工学院', 4, '371425199309091234', 4500.00, '13023455678');
INSERT INTO `candidate` VALUES (4, '小安', 22, '女', '本科生', '齐鲁理工学院', 5, '371427200112124923', 4500.00, '13345990897');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `d_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '销售部', '0534-99994555');
INSERT INTO `department` VALUES (2, '策划部', '0534-33331111');
INSERT INTO `department` VALUES (3, '财务部', '0534-90902233');
INSERT INTO `department` VALUES (4, '开发部', '0534-88889999');
INSERT INTO `department` VALUES (5, '测试部', '0534-22223333');
INSERT INTO `department` VALUES (6, '运维部', '0534-66660000');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `e_id` int(11) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_age` int(11) NOT NULL,
  `e_gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_start` date NULL DEFAULT NULL,
  `e_departId` int(11) NOT NULL,
  `e_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_card` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `e_identity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `e_salary` double(11, 2) NOT NULL,
  PRIMARY KEY (`e_id`) USING BTREE,
  INDEX `fk`(`e_departId`) USING BTREE,
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`e_departId`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES (1, 'Anna', 22, '女', '本科生', '齐鲁理工学院', '2019-01-01', 1, '17306371234', '371427200111214923', '正式员工', 3000.00);
INSERT INTO `employee` VALUES (2, 'Bill', 23, '男', '本科生', '齐鲁理工学院', '2020-05-28', 3, '15678905678', '371427200011174923', '正式员工', 3000.00);
INSERT INTO `employee` VALUES (3, 'Clark', 24, '男', '本科生', '齐鲁理工学院', '2021-08-24', 1, '13023456789', '371427200012345678', '实习生', 3000.00);
INSERT INTO `employee` VALUES (4, 'Dell', 26, '男', '本科生', '山西大学', '2019-06-28', 2, '13345119031', '372423199212341234', '实习生', 3500.00);
INSERT INTO `employee` VALUES (5, 'Eward', 24, '男', '本科生', '青岛大学', '2021-09-06', 3, '13345992345', '373424199012072345', '实习生', 4000.00);
INSERT INTO `employee` VALUES (6, 'Frank', 30, '男', '研究生', '中国海洋大学', '2021-09-01', 1, '13323456789', '372423197701011234', '正式员工', 8000.00);
INSERT INTO `employee` VALUES (7, 'Green', 31, '男', '研究生', '山东大学', '2021-01-04', 2, '17306376030', '372423200011122345', '正式员工', 8000.00);
INSERT INTO `employee` VALUES (9, '李四', 22, '男', '本科生', '齐鲁理工学院', NULL, 1, '13345112345', '371427200011174923', '实习生', 3000.00);
INSERT INTO `employee` VALUES (10, '张三', 22, '男', '本科生', '齐鲁理工学院', NULL, 5, '13345990897', '371427200112124923', '实习生', 4500.00);
INSERT INTO `employee` VALUES (11, '王五', 25, '男', '本科生', '齐鲁理工学院', NULL, 1, '13023455678', '371425199309091234', '实习生', 4500.00);
INSERT INTO `employee` VALUES (12, 'Shally', 25, '男', '本科生', '齐鲁理工学院', NULL, 1, '13023455678', '371425199309091234', '实习生', 4500.00);
INSERT INTO `employee` VALUES (13, '赵六', 25, '男', '本科生', '齐鲁理工学院', NULL, 3, '13023455678', '371425199309091234', '实习生', 4500.00);
INSERT INTO `employee` VALUES (14, '田七', 25, '男', '本科生', '齐鲁理工学院', NULL, 3, '13023455678', '371425199309091234', '实习生', 4500.00);

-- ----------------------------
-- Table structure for recruit
-- ----------------------------
DROP TABLE IF EXISTS `recruit`;
CREATE TABLE `recruit`  (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_position` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_count` int(11) NOT NULL,
  `r_departId` int(11) NOT NULL,
  `r_experience` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `r_gender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `min_age` int(11) NOT NULL,
  `max_age` int(11) NOT NULL,
  `min_salary` decimal(10, 2) NOT NULL,
  `max_salary` decimal(10, 2) NOT NULL,
  `r_empId` int(11) NOT NULL,
  PRIMARY KEY (`r_id`) USING BTREE,
  INDEX `fk_application_depart`(`r_departId`) USING BTREE,
  INDEX `fk_application_empId`(`r_empId`) USING BTREE,
  CONSTRAINT `fk_application_depart` FOREIGN KEY (`r_departId`) REFERENCES `department` (`d_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_application_empId` FOREIGN KEY (`r_empId`) REFERENCES `employee` (`e_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recruit
-- ----------------------------
INSERT INTO `recruit` VALUES (1, 'java实习生', 10, 1, '1年', '男', 20, 30, 3000.00, 4000.00, 7);
INSERT INTO `recruit` VALUES (2, 'c语言开发', 2, 1, '无', '男', 20, 30, 3000.00, 4000.00, 7);
INSERT INTO `recruit` VALUES (3, '测试岗', 2, 5, '无', '女', 20, 30, 3000.00, 4000.00, 6);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `u_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `u_identity` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1);
INSERT INTO `user` VALUES (2, 'Anna', '123456', NULL);
INSERT INTO `user` VALUES (3, 'Bill', '123456', NULL);
INSERT INTO `user` VALUES (4, 'Clark', '123456', NULL);

SET FOREIGN_KEY_CHECKS = 1;
