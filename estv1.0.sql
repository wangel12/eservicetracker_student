-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 23, 2016 at 06:31 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eservicetracker`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `act_id` int(9) NOT NULL,
  `std_id` int(3) NOT NULL,
  `spc_act_id` int(9) NOT NULL,
  `act_tab` varchar(11) NOT NULL,
  `act_time` varchar(10) NOT NULL,
  `act_date` varchar(10) NOT NULL,
  `act_name` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

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
(24, 4, 82, 'services', '05:31:pm', '2016-03-23', 'insertForm');

-- --------------------------------------------------------

--
-- Table structure for table `advisors`
--

CREATE TABLE `advisors` (
  `adv_id` int(10) UNSIGNED NOT NULL,
  `adv_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adv_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adv_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `adv_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `remember_token` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `advisors`
--

INSERT INTO `advisors` (`adv_id`, `adv_fname`, `adv_lname`, `adv_email`, `adv_password`, `is_admin`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'Dipen', 'lama', 'lamadipen@hotmail.com', '$2y$10$cBG4c1LVzWPgFrs97sgj4ut6pyQ75.39alvwvFjCJjfHomMCNtfGS', 1, 1, 'iU7LX9yQc1FEQAg3BT3FmuUKbo7kT695rokApgz2U02xJ6pKyxWs9LzgOTTg', '2016-03-14 02:00:13', '2016-03-17 06:30:02'),
(9, 'Dipen', 'lama', 'lamadipen@gmail.com', '$2y$10$wX0FLUomjNnOQ.vFSlhXF.dSr3jFo/7xyW0JbnwrEjEcbi5QZvvCO', 0, 1, '', '2016-03-15 01:54:48', '2016-03-15 01:54:48');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
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

CREATE TABLE `organizations` (
  `org_id` int(10) UNSIGNED NOT NULL,
  `ser_id` int(10) NOT NULL,
  `org_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `org_desc` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `org_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(79, 82, 'Progressive', 'Made an insurance', '210 West 8th Street', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ser_id` int(10) UNSIGNED NOT NULL,
  `ser_date` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ser_hr` int(3) NOT NULL,
  `std_id` int(11) NOT NULL,
  `serty_id` int(10) NOT NULL,
  `sers_id` int(10) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `adv_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ser_id`, `ser_date`, `ser_hr`, `std_id`, `serty_id`, `sers_id`, `created_at`, `updated_at`, `adv_id`) VALUES
(71, '2016-03-18T04:00:00.000Z', 0, 37, 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(72, '2016-03-12T05:00:00.000Z', 0, 37, 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(73, '2016-03-24T04:00:00.000Z', 0, 34, 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(74, '2016-02-03T05:00:00.000Z', 24, 34, 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(75, '2016-03-30T04:00:00.000Z', 0, 34, 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1),
(82, '2016-03-23T04:00:00.000Z', 2, 4, 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service_statuses`
--

CREATE TABLE `service_statuses` (
  `sers_id` int(10) UNSIGNED NOT NULL,
  `ser_stat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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

CREATE TABLE `service_types` (
  `serty_id` int(10) UNSIGNED NOT NULL,
  `serty_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `service_types`
--

INSERT INTO `service_types` (`serty_id`, `serty_name`, `created_at`, `updated_at`) VALUES
(1, 'dsadasda', '2016-02-17 10:13:40', '2016-02-17 10:13:40');

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `sn_id` int(9) NOT NULL,
  `sn_user_id` int(9) NOT NULL,
  `sn_status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `sett_id` int(10) UNSIGNED NOT NULL,
  `serty_id` int(11) NOT NULL,
  `sett_hour` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`sett_id`, `serty_id`, `sett_hour`, `created_at`, `updated_at`) VALUES
(1, 1, 3, '2016-02-17 10:39:20', '2016-02-17 10:39:20');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `std_id` int(10) UNSIGNED NOT NULL,
  `std_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_gradYear` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `std_isActive` tinyint(1) NOT NULL,
  `std_isPassedOut` tinyint(1) NOT NULL,
  `std_agreement` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`std_id`, `std_fname`, `std_lname`, `std_email`, `std_password`, `std_gradYear`, `std_isActive`, `std_isPassedOut`, `std_agreement`, `created_at`, `updated_at`) VALUES
(4, 'Wangel', 'Lama', 'wangeltmg@gmail.com', 'haguwa12', '2016', 1, 0, 1, '0000-00-00 00:00:00', '2016-03-23 09:28:26'),
(11, 'Suman', 'Limbu', 'limbu001@vma.edu', 'password', '2016', 0, 0, 1, '0000-00-00 00:00:00', '2016-03-23 09:28:20'),
(34, 'Dipen', 'Lama', 'lama001@knights.gannon.edu', 'pokemon', '2016', 0, 0, 1, '0000-00-00 00:00:00', '2016-03-23 09:28:21'),
(37, 'Joe', 'Bell', 'joebellerie@gmail.com', 'redrider', '2015', 0, 0, 1, '0000-00-00 00:00:00', '2016-03-23 09:28:22'),
(38, '', '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '2016-03-23 09:28:23'),
(39, '', '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '2016-03-23 09:28:23'),
(40, '', '', '', '', '', 0, 0, 0, '0000-00-00 00:00:00', '2016-03-23 09:28:24'),
(41, '', '', '', '', '', 0, 0, 1, '0000-00-00 00:00:00', '2016-03-23 09:28:24');

-- --------------------------------------------------------

--
-- Table structure for table `supervisors`
--

CREATE TABLE `supervisors` (
  `sup_id` int(10) UNSIGNED NOT NULL,
  `sup_fname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_lname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sup_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ser_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
(35, 'Suman Rana', '', 'suman@hotmail.com', '', '0000-00-00 00:00:00', '0000-00-00 00:00:00', 82);

-- --------------------------------------------------------

--
-- Table structure for table `volunteer_hours`
--

CREATE TABLE `volunteer_hours` (
  `vh_id` int(10) UNSIGNED NOT NULL,
  `vh_done` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `ser_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`act_id`);

--
-- Indexes for table `advisors`
--
ALTER TABLE `advisors`
  ADD PRIMARY KEY (`adv_id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`org_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ser_id`);

--
-- Indexes for table `service_statuses`
--
ALTER TABLE `service_statuses`
  ADD PRIMARY KEY (`sers_id`);

--
-- Indexes for table `service_types`
--
ALTER TABLE `service_types`
  ADD PRIMARY KEY (`serty_id`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`sn_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`sett_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`std_id`);

--
-- Indexes for table `supervisors`
--
ALTER TABLE `supervisors`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `volunteer_hours`
--
ALTER TABLE `volunteer_hours`
  ADD PRIMARY KEY (`vh_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `act_id` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `advisors`
--
ALTER TABLE `advisors`
  MODIFY `adv_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `org_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ser_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT for table `service_statuses`
--
ALTER TABLE `service_statuses`
  MODIFY `sers_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `service_types`
--
ALTER TABLE `service_types`
  MODIFY `serty_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `sn_id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `sett_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `std_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `supervisors`
--
ALTER TABLE `supervisors`
  MODIFY `sup_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `volunteer_hours`
--
ALTER TABLE `volunteer_hours`
  MODIFY `vh_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
