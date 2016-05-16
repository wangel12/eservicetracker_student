-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 25, 2016 at 02:17 PM
-- Server version: 5.5.45-cll-lve
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `eservicetracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE IF NOT EXISTS `activity` (
  `act_id` int(9) NOT NULL AUTO_INCREMENT,
  `std_id` int(3) NOT NULL,
  `spc_act_id` int(9) NOT NULL,
  `act_tab` varchar(11) NOT NULL,
  `act_time` varchar(10) NOT NULL,
  `act_date` varchar(10) NOT NULL,
  `act_name` varchar(10) NOT NULL,
  PRIMARY KEY (`act_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`act_id`, `std_id`, `spc_act_id`, `act_tab`, `act_time`, `act_date`, `act_name`) VALUES
(1, 34, 74, 'services', '02:11:pm', '03.12.16', 'insertForm'),
(2, 34, 75, 'services', '01:12:pm', '03.13.16', 'deleteForm'),
(3, 4, 76, 'services', '03:43:am', '2016-03-22', 'insertForm'),
(4, 4, 77, 'services', '10:23:am', '2016-03-16', 'insertForm'),
(5, 4, 78, 'services', '10:26:am', '2016-03-29', 'insertForm'),
(6, 4, 78, 'services', '11:00:am', '03.14.16', 'deleteForm'),
(7, 4, 78, 'services', '02:24:pm', '03.14.16', 'deleteForm'),
(8, 4, 78, 'services', '02:25:pm', '03.14.16', 'deleteForm'),
(9, 4, 78, 'services', '03:54:pm', '03.14.16', 'deleteForm'),
(10, 4, 78, 'services', '04:06:pm', '03.14.16', 'deleteForm'),
(11, 4, 78, 'services', '04:06:pm', '03.14.16', 'deleteForm'),
(12, 4, 77, 'services', '04:06:pm', '03.14.16', 'deleteForm'),
(13, 4, 77, 'services', '04:07:pm', '03.14.16', 'deleteForm'),
(14, 4, 77, 'services', '04:07:pm', '03.14.16', 'deleteForm'),
(15, 4, 77, 'services', '04:08:pm', '03.14.16', 'deleteForm'),
(16, 4, 78, 'services', '04:08:pm', '03.14.16', 'deleteForm'),
(17, 4, 78, 'services', '04:10:pm', '03.14.16', 'deleteForm'),
(18, 4, 79, 'services', '04:15:pm', '2016-03-17', 'insertForm'),
(19, 4, 79, 'services', '04:18:pm', '03.14.16', 'deleteForm'),
(20, 4, 80, 'services', '04:26:pm', '2016-03-17', 'insertForm'),
(21, 4, 81, 'services', '04:28:pm', '2016-03-17', 'insertForm'),
(22, 4, 80, 'services', '01:04:pm', '03.15.16', 'deleteForm'),
(23, 4, 81, 'services', '04:13:pm', '03.15.16', 'deleteForm'),
(24, 4, 82, 'services', '05:31:pm', '2016-03-23', 'insertForm'),
(25, 0, 83, 'services', '02:08:am', '', 'insertForm'),
(26, 0, 84, 'services', '02:19:am', '', 'insertForm'),
(27, 4, 85, 'services', '02:50:am', '2016-03-17', 'insertForm'),
(28, 0, 86, 'services', '02:58:am', '', 'insertForm'),
(29, 0, 87, 'services', '02:58:am', '', 'insertForm'),
(30, 4, 88, 'services', '02:58:am', '2016-03-26', 'insertForm'),
(31, 4, 89, 'services', '02:58:am', '2016-03-26', 'insertForm'),
(32, 4, 90, 'services', '02:58:am', '2016-03-26', 'insertForm'),
(33, 4, 91, 'services', '03:00:am', '2016-03-26', 'insertForm'),
(34, 4, 91, 'services', '03:02:am', '03.23.16', 'deleteForm'),
(35, 42, 92, 'services', '10:00:am', '2016-03-11', 'insertForm'),
(36, 42, 93, 'services', '10:09:am', '2016-03-11', 'insertForm'),
(37, 42, 94, 'services', '09:12:am', '2016-03-11', 'insertForm');

-- --------------------------------------------------------

--
-- Table structure for table `advisors`
--

CREATE TABLE IF NOT EXISTS `advisors` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `advisors`
--

INSERT INTO `advisors` (`adv_id`, `adv_fname`, `adv_lname`, `adv_email`, `adv_password`, `is_admin`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Yuen', 'Lin', 'lin001@vma.edu', 'password', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Wangel', 'Tamang', 'wangel001@vma.edu', 'haguwa12', 1, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2016_02_04_164028_create_advisors_table', 1),
('2016_02_04_164148_create_settings_table', 1),
('2016_02_04_164218_create_service_types_table', 1),
('2016_02_04_164249_create_organizations_table', 1),
('2016_02_04_164314_create_supervisors_table', 1),
('2016_02_04_164327_create_service_statuses_table', 1),
('2016_02_04_164340_create_services_table', 1),
('2016_02_04_164410_create_volunteer_hours_table', 1),
('2016_02_04_164500_create_students_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE IF NOT EXISTS `organizations` (
  `org_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ser_id` int(10) NOT NULL,
  `org_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `org_desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `org_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`org_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=92 ;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`org_id`, `ser_id`, `org_name`, `org_desc`, `org_address`, `created_at`, `updated_at`) VALUES
(59, 62, 'gannon uni', 'did nothing', '102 Lovell Palace', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 63, 'Namaste Baini', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 64, 'Hello Nepal', 'dadada', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 65, 'jpt org', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 66, 'dadadadada', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 67, 'dadada', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 68, 'abcdefg', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 69, 'Gannon', 'My responsibility was to manage the students as a ', '210 west 12th street', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 70, 'St Joseph Church BOL', 'Cleanup from CCD', '147 W 24th Street', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 71, 'Gannon', 'My responsibility was to manage the students as a ', '210 west 12th street', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 72, 'Vma', 'Help out', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 73, 'Sumadhur Yatra', 'I cleaned up all the dirty dishes of the unprivili', '109 University Square', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 74, 'Yatra Foundations', 'i went there to help the old age people doing diff', '210 West 8th Street', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 75, 'Safe Life', 'GUARD service', 'Gannon University', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 76, 'Gannon University', 'I did nothing as usual', '210 West 8th Steet', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 77, 'Abcde', 'asdadada', '210 West 9th Street', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 78, 'dasdadadada', 'dasdada', 'sadasdada', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 79, 'Abcde', 'i do this', '201 waest', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 80, 'Norway Flyers', 'i flied kite', '219 west 200 st', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 81, 'Budda Foundations', 'i mediated', '911 Gannon', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 82, 'Progressive', 'Made an insurance', '210 West 8th Street', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 83, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 84, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 85, 'Maiti Nepal Foundations', 'Serious Issues taken for girl trafficking in Nepal', 'Maitighar, Kathmandu', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 86, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 87, '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 88, 'aaaaaa', 'aaaaaaaa', 'aaaaaa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 89, 'aaaaaa', 'aaaaaaaa', 'aaaaaa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 90, 'aaaaaa', 'aaaaaaaa', 'aaaaaa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 91, 'BBBBBBB', 'aaaaaaaa', 'aaaaaa', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 92, 'YMCA camp sherwin', 'Painted faces', 'Camp sherwin', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 93, 'Shanna Fairhurst', 'Donated food', 'Erie, PA', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 94, 'Zoo Boo', 'Handed out candy to children', 'Erie Zoo', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE IF NOT EXISTS `services` (
  `ser_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ser_date` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ser_hr` int(3) NOT NULL,
  `std_id` int(11) NOT NULL,
  `serty_id` int(10) NOT NULL,
  `sers_id` int(10) NOT NULL,
  `school_year` int(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adv_id` int(10) NOT NULL,
  PRIMARY KEY (`ser_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=95 ;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ser_id`, `ser_date`, `ser_hr`, `std_id`, `serty_id`, `sers_id`, `school_year`, `created_at`, `updated_at`, `adv_id`) VALUES
(71, '2016-03-18T04:00:00.000Z', 0, 37, 0, 3, 2015, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(72, '2016-03-12T05:00:00.000Z', 0, 37, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(73, '2016-03-24T04:00:00.000Z', 0, 34, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(74, '2016-02-03T05:00:00.000Z', 24, 34, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(75, '2016-03-30T04:00:00.000Z', 0, 34, 0, 3, 2015, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(82, '2016-03-23T04:00:00.000Z', 2, 4, 0, 3, 2016, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(83, '', 0, 0, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(84, '', 0, 0, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(85, '2016-03-17T04:00:00.000Z', 3, 4, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 2),
(86, '', 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(87, '', 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(88, '2016-03-26T04:00:00.000Z', 3, 4, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(89, '2016-03-26T04:00:00.000Z', 3, 4, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(90, '2016-03-26T04:00:00.000Z', 3, 4, 0, 1, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(92, '2016-03-11T05:00:00.000Z', 6, 42, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(93, '2016-03-11T05:00:00.000Z', 1, 42, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0),
(94, '2016-03-11T05:00:00.000Z', 5, 42, 0, 3, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_statuses`
--

CREATE TABLE IF NOT EXISTS `service_statuses` (
  `sers_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ser_stat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sers_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `service_statuses`
--

INSERT INTO `service_statuses` (`sers_id`, `ser_stat`, `created_at`, `updated_at`) VALUES
(1, 'Accepted', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Rejected', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Pending', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `service_types`
--

CREATE TABLE IF NOT EXISTS `service_types` (
  `serty_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serty_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`serty_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`serty_id`, `serty_name`, `created_at`, `updated_at`) VALUES
(1, 'Community Service', '2016-02-17 10:13:40', '2016-02-17 10:13:40'),
(2, 'Aged/Sick/Dying', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE IF NOT EXISTS `session` (
  `sn_id` int(9) NOT NULL AUTO_INCREMENT,
  `sn_user_id` int(9) NOT NULL,
  `sn_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`sn_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `sett_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `serty_id` int(11) NOT NULL,
  `sett_hour` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`sett_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sett_id`, `serty_id`, `sett_hour`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2016-02-17 10:39:20', '2016-02-17 10:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `std_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `std_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_gradYear` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_isActive` tinyint(1) NOT NULL,
  `std_isPassedOut` tinyint(1) NOT NULL,
  `std_agreement` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`std_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=43 ;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`std_id`, `std_fname`, `std_lname`, `std_email`, `std_password`, `std_gradYear`, `std_isActive`, `std_isPassedOut`, `std_agreement`, `created_at`, `updated_at`) VALUES
(4, 'Wangel', 'Lama', 'wangeltmg@gmail.com', 'haguwa12', '2016', 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Suman', 'Limbu', 'limbu001@vma.edu', 'password', '2016', 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Dipen', 'Lama', 'lama001@knights.gannon.edu', 'pokemon', '2016', 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Joe', 'Bell', 'joebellerie@gmail.com', 'redrider', '2015', 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, '', '', '', '', '', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, '', '', '', '', '', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, '', '', '', '', '', 1, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, '', '', '', '', '', 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Faith', 'Harris', 'faith.harris@prep-villa.com', 'fh10o999', '2017', 1, 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `supervisors`
--

CREATE TABLE IF NOT EXISTS `supervisors` (
  `sup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sup_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ser_id` int(10) NOT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=48 ;

--
-- Dumping data for table `supervisors`
--

INSERT INTO `supervisors` (`sup_id`, `sup_fname`, `sup_lname`, `sup_email`, `sup_phone`, `created_at`, `updated_at`, `ser_id`) VALUES
(15, 'Johan Bell', '', 'john@bell.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 62),
(16, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 63),
(17, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 64),
(18, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 65),
(19, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 66),
(20, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 67),
(21, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 68),
(22, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 69),
(23, 'Margie Frezza', '', 'fullhousefreza@gmail.com', '814-440-7969', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 70),
(24, 'Alicia nelson', '', 'anelson@prep-villa.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 71),
(25, 'Me smith', '', 'smith@smith.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 72),
(26, 'Joe Bell', '', 'joe@gmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 73),
(27, 'Wangel Tamang', '', 'wangpakhrintamang@gmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 74),
(28, 'johan bell', '', 'johan@hotmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 75),
(29, 'Joahn Bell', '', 'johan@belll.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 76),
(30, 'nathan jack', '', 'nathan@gmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 77),
(31, 'dasdadadada', '', 'dasdaa@gmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 78),
(32, 'wadadadada assdadadad', '', 'supervisor@hotmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 79),
(33, 'nick carick', '', 'nick@gmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 80),
(34, 'niicki Minaj', '', 'nikki@hotmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 81),
(35, 'Suman Rana', '', 'suman@hotmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82),
(36, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 83),
(37, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 84),
(38, 'Sumidra Tamang', '', 'sumidra@hotmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 85),
(39, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 86),
(40, '', '', '', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 87),
(41, 'aaaaaaaa', '', 'aaaaa@ghg', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 88),
(42, 'aaaaaaaa', '', 'aaaaa@ghg', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 89),
(43, 'aaaaaaaa', '', 'aaaaa@ghg', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 90),
(44, 'aaaaaaaa', '', 'aaaaa@ghg', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 91),
(45, 'Derick Zimmerman', '', 'zimmerman@gmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 92),
(46, 'Kayla Altadonna', '', 'abs@abs.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 93),
(47, 'Tina Berry', '', 'TinaBerry@yahoo.com', '814-8675-309', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 94);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_hours`
--

CREATE TABLE IF NOT EXISTS `volunteer_hours` (
  `vh_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `vh_done` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `ser_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`vh_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
