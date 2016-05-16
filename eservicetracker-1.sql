/*
Navicat MySQL Data Transfer

Source Server         : dipen
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : eservicetracker

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-03-05 23:24:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `advisors`
-- ----------------------------
DROP TABLE IF EXISTS `advisors`;
CREATE TABLE `advisors` (
  `adv_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adv_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adv_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adv_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adv_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of advisors
-- ----------------------------
INSERT INTO `advisors` VALUES ('1', 'Dipen', 'Dipen', 'Dipen', 'Dipen', '0', '0', '2016-02-06 16:59:53', '2016-02-06 16:59:53');
INSERT INTO `advisors` VALUES ('7', 'Soon', 'Test', 'sson@yahoo.com', '$2y$10$cCD3cRMhliKazhI3W.jij.5x166fkTTmWqqed9qkfGeaiQwC9gjtO', '0', '1', '2016-03-01 00:02:44', '2016-03-01 00:26:39');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2016_02_04_164028_create_advisors_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164148_create_settings_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164218_create_service_types_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164249_create_organizations_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164314_create_supervisors_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164327_create_service_statuses_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164340_create_services_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164410_create_volunteer_hours_table', '1');
INSERT INTO `migrations` VALUES ('2016_02_04_164500_create_students_table', '1');

-- ----------------------------
-- Table structure for `organizations`
-- ----------------------------
DROP TABLE IF EXISTS `organizations`;
CREATE TABLE `organizations` (
  `org_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `org_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of organizations
-- ----------------------------
INSERT INTO `organizations` VALUES ('1', 'Oracle', 'Tx', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `services`
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `ser_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ser_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ser_desc` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ser_date` datetime NOT NULL,
  `std_id` int(11) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `org_id` int(11) NOT NULL,
  `sers_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ser_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES ('1', 'Teaching', 'Teaching primary class', '0000-00-00 00:00:00', '1', '1', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `service_statuses`
-- ----------------------------
DROP TABLE IF EXISTS `service_statuses`;
CREATE TABLE `service_statuses` (
  `sers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ser_stat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sers_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of service_statuses
-- ----------------------------

-- ----------------------------
-- Table structure for `service_types`
-- ----------------------------
DROP TABLE IF EXISTS `service_types`;
CREATE TABLE `service_types` (
  `serty_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serty_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`serty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of service_types
-- ----------------------------
INSERT INTO `service_types` VALUES ('1', 'Cleaning', '2016-02-12 17:44:23', '2016-02-12 17:44:23');
INSERT INTO `service_types` VALUES ('2', 'Community', '2016-02-12 17:45:07', '2016-03-01 00:41:57');
INSERT INTO `service_types` VALUES ('4', 'Poverty', '2016-03-01 00:34:14', '2016-03-01 00:34:14');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `sett_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serty_id` int(11) NOT NULL,
  `sett_hour` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sett_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('2', '4', '5', '2016-02-12 18:12:50', '2016-03-04 16:10:04');
INSERT INTO `settings` VALUES ('3', '1', '2', '2016-02-12 18:14:54', '2016-02-12 18:14:54');

-- ----------------------------
-- Table structure for `students`
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `std_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `std_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_gradYear` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_isActive` tinyint(1) NOT NULL,
  `std_isPassedOut` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`std_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('1', 'Dipen', 'Lama', 'lamadipen@gmail.com', 'nepal123', '2014', '1', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `students` VALUES ('2', 'Ram', 'Thapa', 'lamadipen@yahoo.com', '12345', '2012', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `supervisors`
-- ----------------------------
DROP TABLE IF EXISTS `supervisors`;
CREATE TABLE `supervisors` (
  `sup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sup_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of supervisors
-- ----------------------------
INSERT INTO `supervisors` VALUES ('1', 'wangel', 'lama', 'wangel@test.com', '980104021', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for `volunteer_hours`
-- ----------------------------
DROP TABLE IF EXISTS `volunteer_hours`;
CREATE TABLE `volunteer_hours` (
  `vh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vh_done` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `ser_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`vh_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of volunteer_hours
-- ----------------------------
INSERT INTO `volunteer_hours` VALUES ('1', '10', '1', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `volunteer_hours` VALUES ('2', '30', '2', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
