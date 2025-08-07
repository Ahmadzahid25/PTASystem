-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2025 at 09:25 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tvetikmb_cmspro`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `AdminName` varchar(200) NOT NULL,
  `EmailId` varchar(150) NOT NULL,
  `ContactNumber` bigint(12) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `AdminName`, `EmailId`, `ContactNumber`, `password`, `updationDate`) VALUES
(1, 'admin', 'Admin', 'admin@gmail.com', 1234567890, 'f925916e2754e5e03f75dd58a5733251', '18-10-2016 04:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'LAPORAN KEROSAKAN PELANGGAN', 'JENIS KEROSAKAN', '2020-06-21 07:06:04', '2025-02-15 08:18:32'),
(2, 'Other', 'Other', '2020-06-22 18:30:00', '2020-06-27 18:59:53'),
(4, 'SERVIS AIRCOND', '', '2025-02-15 08:21:42', NULL),
(5, 'SERVIS CUCIAN', '', '2025-02-15 08:21:59', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `notetransport` mediumtext DEFAULT NULL,
  `checking` mediumtext DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `remarkDate` timestamp NULL DEFAULT current_timestamp(),
  `remarkBy` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `notetransport`, `checking`, `remark`, `remarkDate`, `remarkBy`) VALUES
(11, 13, 'in process', 'transport cas rm50', 'baik', 'item ordered', '2025-03-06 06:51:40', NULL),
(12, 13, 'in process', 'up rm200', 'good', 'baik', '2025-03-06 06:53:12', NULL),
(13, 13, 'in process', '', '123', '123', '2025-03-06 08:17:44', NULL),
(14, 3, 'in process', 'fghfgh', 'gfhfggf', 'ghfhfgh', '2025-03-18 14:05:30', NULL),
(15, 3, 'in process', 'bfcghfthtr', 'tghfthfghfgh', 'fghfghfghfgh', '2025-03-18 14:26:45', NULL),
(16, 3, 'in process', 'hghjghj', 'ghjghjghjgh', 'ghjghjghjghjgh', '2025-03-18 14:31:28', NULL),
(17, 3, 'in process', 'hghjghj', 'ghjghjghjgh', 'ghjghjghjghjgh', '2025-03-18 14:31:28', 3),
(18, 3, 'in process', 'nvnvn', 'gfhfghfghfg', 'hfghfghfgh', '2025-03-18 14:34:46', 3),
(19, 3, 'in process', 'cnbgfchbfg', 'fhfghgfhfg', 'hfghfghfghfghfg', '2025-03-18 14:39:04', 3),
(20, 3, 'in process', 'fgdfgdfg', 'dfgdfgdfg', 'dgdfgdfg', '2025-03-18 14:43:42', 3),
(21, 3, 'in process', 'hgjghj', 'hjgrtyd', 'dhyfhbdf', '2025-03-18 14:47:41', 3),
(22, 3, 'in process', 'fcdvxcv', 'cxvcvxcvxc', 'vcxvxcvxc', '2025-03-18 14:53:52', 3),
(23, 3, 'in process', 'vcxvcxvxc', 'xvcxcvxcvcxv', 'cxvxcvcxv', '2025-03-18 14:55:23', 3),
(24, 3, 'in process', 'bcvnbvn', 'vbnbnmbm', 'bmnbmnbmb', '2025-03-18 15:00:39', 3),
(25, 3, 'in process', 'bcfbnb', 'nbvnvbnvbn', 'vbnvbnvbn', '2025-03-18 15:03:05', 3),
(26, 3, 'in process', 'bcvbvcbc', 'vbcvbcvbc', 'bvcbcvbvc', '2025-03-18 15:05:16', 3),
(27, 3, 'in process', 'bcvbcvb', 'bvcbvc', 'vbcvbcv', '2025-03-18 15:06:19', 3),
(28, 3, 'in process', 'hfghfgh', 'fghfghfg', 'fghfghfg', '2025-03-18 15:10:42', 3),
(29, 3, 'in process', 'm,nm,', 'nm,nm,', 'gdgfgdf', '2025-03-18 15:13:39', 3),
(30, 3, 'in process', 'hfgh', 'gfhfgh', 'hgfhfgh', '2025-03-18 15:16:36', 3),
(31, 14, 'in process', 'rm50', 'semak', 'motor belum sampai', '2025-03-25 17:57:15', NULL),
(32, 14, 'in process', 'rm50 note by afnan', 'check by afnan', 'remark by afnan', '2025-03-25 18:10:40', 3),
(33, 14, 'in process', 'sds', 'sds', 'sds', '2025-03-25 18:29:31', 3),
(34, 14, 'in process', 'scsd', 'sdsd', 'sds', '2025-03-25 18:42:33', 3),
(35, 14, 'in process', 'dfsdf', 'sfs', 'sf2134', '2025-03-25 18:48:39', 3),
(36, 14, 'in process', 'sdsadmin', 'admin', 'admin', '2025-03-25 18:58:45', NULL),
(37, 14, 'in process', 'zxczcadmin', 'zczcadmin', 'zczadmin', '2025-03-25 19:00:24', NULL),
(38, 14, 'in process', 'asa', 'asa', 'asas', '2025-03-25 19:51:34', NULL),
(39, 14, 'in process', 'note admin', 'admin', 'admin', '2025-03-25 19:52:19', NULL),
(40, 14, 'in process', 'admin', 'admin', 'admin', '2025-03-25 19:53:15', NULL),
(41, 14, 'in process', 'rm 100', 'tengh test peti sejuk ', 'belum sampai', '2025-03-25 19:59:43', NULL),
(42, 15, 'in process', 'rm 100 minyak van ', 'check battery', 'oda battery', '2025-03-25 20:19:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(1, 'KAMPUNG RAJA', 'BESUT', '2020-06-27 19:18:02', '2025-02-15 08:24:40'),
(5, 'SETIU', 'TERENGGANU', '2025-02-15 08:25:01', NULL),
(7, 'JERTEH', 'TERENGGANU', '2025-02-15 08:25:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(3, 2, 'other', '2020-06-24 07:06:44', '2020-06-24 07:21:38'),
(5, 1, 'Mesin Basuh', '2025-02-15 08:19:30', NULL),
(6, 1, 'PETI', '2025-02-15 08:19:39', NULL),
(7, 1, 'DRYER', '2025-02-15 08:19:51', NULL),
(8, 1, 'FREEZER', '2025-02-15 08:19:59', NULL),
(9, 1, 'JAM AZAN MASJID', '2025-02-15 08:20:10', NULL),
(10, 1, 'WATER ( HEATER )', '2025-02-15 08:20:27', NULL),
(11, 1, 'TV (UNTUK 50\" KE ATAS SAHAJA)', '2025-02-15 08:20:45', NULL),
(12, 1, 'AIRCOND', '2025-02-15 08:20:54', NULL),
(13, 1, 'KIPAS SILING / DINDING', '2025-02-15 08:21:08', NULL),
(14, 4, 'AIRCOND SILING CASSETE', '2025-02-15 08:22:35', NULL),
(15, 4, 'AIRCOND WALL MOUNTED (BIASA)', '2025-02-15 08:22:47', NULL),
(16, 5, 'MESIN BASUH', '2025-02-15 08:23:44', NULL),
(17, 5, 'MESIN PENGERING', '2025-02-15 08:24:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext DEFAULT NULL,
  `warrantyFile` varchar(255) DEFAULT NULL,
  `receiptFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `warrantyFile`, `receiptFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(3, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'xcxcxc', 'Ahmad Zahid.png', NULL, '2025-02-24 19:22:09', 'in process', '2025-03-18 14:05:30'),
(4, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'zxzx', 'zxzxzxzx', 'GitHub_Actions_Featured_Image_2024-removebg-preview-removebg-preview.png', NULL, '2025-02-24 19:24:59', NULL, NULL),
(5, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'xcxcxc', 'receipt.jpg', NULL, '2025-02-24 19:26:34', NULL, NULL),
(6, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'czczc', 'xcxc', 'receipt.jpg', NULL, '2025-02-24 19:28:03', NULL, NULL),
(7, 2, 1, 'PETI', ' Under Warranty', 'KAMPUNG RAJA', 'ccvc', 'vcbcvb', 'receipt.jpg', NULL, '2025-02-24 19:31:47', NULL, NULL),
(8, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'fdgdv', 'cvcv', 'Ahmad Zahid.png', NULL, '2025-02-24 19:33:39', NULL, NULL),
(9, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'dfdf', 'Ahmad Zahid.png', 'warranty.jpg', '2025-02-25 05:32:58', NULL, NULL),
(10, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'BAJU X KERING', 'warranty.jpg', 'receipt.jpg', '2025-02-25 09:56:33', NULL, NULL),
(11, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'baju x kering', 'warranty.jpg', 'receipt.jpg', '2025-02-25 10:19:42', NULL, NULL),
(12, 2, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'dsfsdfsd', 'warranty.jpg', 'receipt.jpg', '2025-02-25 10:21:12', NULL, NULL),
(13, 4, 1, 'PETI', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'x sejuk', 'photo_6134156997948457775_y (1).jpg', 'photo_6133980234274425944_y__1_-removebg-preview.png', '2025-03-06 06:40:48', 'in process', '2025-03-06 06:51:40'),
(14, 7, 1, 'Mesin Basuh', ' Under Warranty', 'KAMPUNG RAJA', 'daikin', 'rosak motor', 'asdas.jpg', 'photo_2025-02-12_09-51-16.jpg', '2025-03-25 17:55:44', 'in process', '2025-03-25 17:57:15'),
(15, 7, 1, 'JAM AZAN MASJID', ' Under Warranty', 'KAMPUNG RAJA', '5 waktu', 'lampu x nyala', 'asdas.jpg', 'WhatsApp Image 2025-03-13 at 07.56.34_428ff54c.jpg', '2025-03-25 20:18:10', 'in process', '2025-03-25 20:19:03');

-- --------------------------------------------------------

--
-- Table structure for table `tblforwardhistory`
--

CREATE TABLE `tblforwardhistory` (
  `id` int(11) NOT NULL,
  `ComplaintNumber` bigint(12) DEFAULT NULL,
  `ForwardFrom` int(6) DEFAULT NULL,
  `ForwardTo` int(6) DEFAULT NULL,
  `ForwadDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblforwardhistory`
--

INSERT INTO `tblforwardhistory` (`id`, `ComplaintNumber`, `ForwardFrom`, `ForwardTo`, `ForwadDate`) VALUES
(1, 1, 1, 2, '2020-06-28 13:22:58'),
(2, 2, 1, 3, '2025-02-15 08:30:26'),
(3, 13, 1, 3, '2025-03-06 06:52:34'),
(4, 3, 1, 3, '2025-03-18 14:09:26'),
(5, 14, 1, 3, '2025-03-25 18:01:17'),
(6, 15, 1, 3, '2025-03-25 20:19:24');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadmin`
--

CREATE TABLE `tblsubadmin` (
  `id` int(11) NOT NULL,
  `SubAdminName` varchar(150) DEFAULT NULL,
  `Department` varchar(150) DEFAULT NULL,
  `EmailId` varchar(150) DEFAULT NULL,
  `ContactNumber` bigint(12) DEFAULT NULL,
  `UserName` varchar(12) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `IsActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubadmin`
--

INSERT INTO `tblsubadmin` (`id`, `SubAdminName`, `Department`, `EmailId`, `ContactNumber`, `UserName`, `Password`, `RegDate`, `LastUpdationDate`, `IsActive`) VALUES
(3, 'Afnan', 'It technician', 'nanibos@gmail.com', 199904162, 'afnan', 'f925916e2754e5e03f75dd58a5733251', '2025-02-15 08:15:22', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadminremark`
--

CREATE TABLE `tblsubadminremark` (
  `id` int(11) NOT NULL,
  `ComplainNumber` bigint(12) DEFAULT NULL,
  `ComplainStatus` varchar(20) DEFAULT NULL,
  `notetransport` mediumtext DEFAULT NULL,
  `checking` mediumtext DEFAULT NULL,
  `ComplainRemark` mediumtext DEFAULT NULL,
  `RemarkBy` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubadminremark`
--

INSERT INTO `tblsubadminremark` (`id`, `ComplainNumber`, `ComplainStatus`, `notetransport`, `checking`, `ComplainRemark`, `RemarkBy`, `PostingDate`) VALUES
(1, 1, 'closed', NULL, NULL, 'Complaint closed.', 2, '2020-06-28 13:27:41'),
(2, 2, 'closed', NULL, NULL, 'siap ', 3, '2025-02-15 08:31:11'),
(3, 13, 'in process', NULL, NULL, 'undone', 3, '2025-03-06 07:24:01'),
(4, 13, 'in process', NULL, NULL, 'unready repair', 3, '2025-03-06 07:38:51'),
(5, 13, 'in process', NULL, NULL, 'x siap lagi', 3, '2025-03-06 07:54:29'),
(6, 14, 'in process', NULL, NULL, 'asdasd', 3, '2025-03-25 18:50:49'),
(7, 14, 'in process', 'sdsd', 'sdsd', 'sdsd', 3, '2025-03-25 19:37:31'),
(8, 14, 'in process', 'rm50', 'checking', 'remark', 3, '2025-03-25 19:44:41'),
(9, 15, 'in process', 'rm 200 tambang minyak 10 km', 'batterry check', 'battery belum sampai', 3, '2025-03-25 20:20:56');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT current_timestamp(),
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 0, 'phpgurukulteam@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-27 19:14:33', '', 0),
(2, 1, 'phpgurukultest@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-27 19:15:08', '28-06-2020 12:47:04 AM', 1),
(3, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 13:19:32', '28-06-2020 06:51:17 PM', 1),
(4, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 14:12:03', '', 1),
(5, 2, 'testuser@gmail.com', 0x31342e312e3235352e32350000000000, '2025-02-15 08:26:23', '', 1),
(6, 2, 'testuser@gmail.com', 0x31342e312e3235352e32350000000000, '2025-02-15 08:28:32', '', 1),
(7, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2025-02-25 04:54:47', '25-02-2025 09:53:37 PM', 1),
(8, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2025-02-25 16:30:18', '', 1),
(9, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2025-02-25 23:05:14', '', 1),
(10, 0, 'hulaimimusaddiq232@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-06 06:32:42', '', 0),
(11, 0, 'hulaimimusaddiq232@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-06 06:32:55', '', 0),
(12, 0, 'hulaimimusaddiq232@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-06 06:33:38', '', 0),
(13, 0, 'HULAIMI MUSADDIQ', 0x3a3a3100000000000000000000000000, '2025-03-06 06:35:50', '', 0),
(14, 4, 'ahmadzahid482@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-06 06:36:35', '06-03-2025 12:10:59 PM', 1),
(15, 4, 'ahmadzahid482@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-06 07:11:27', '06-03-2025 12:44:08 PM', 1),
(16, 4, 'ahmadzahid482@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-06 07:15:47', '06-03-2025 12:52:24 PM', 1),
(17, 4, 'ahmadzahid482@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-06 07:24:37', '06-03-2025 01:00:18 PM', 1),
(18, 0, 'afnan', 0x3a3a3100000000000000000000000000, '2025-03-18 14:08:47', '', 0),
(19, 7, 'zahidhamidi@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-25 17:54:49', '25-03-2025 11:25:47 PM', 1),
(20, 7, 'zahidhamidi@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-25 20:12:46', '26-03-2025 01:45:46 AM', 1),
(21, 0, 'zahidhamidi@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-25 20:17:09', '', 0),
(22, 7, 'zahidhamidi@gmail.com', 0x3a3a3100000000000000000000000000, '2025-03-25 20:17:23', '26-03-2025 01:48:13 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `contactno2` bigint(11) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `icnumber` bigint(12) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactno`, `contactno2`, `address`, `icnumber`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(2, 'Test user', 'testuser@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 1234567899, 1234567899, 'kuala lumpur,senawang\r\n2225,bawah drawbrige', 23569693212, 'KAMPUNG RAJA', 'malaysia', 110091, '1fc8381ccac933612936bb617a5ae906.png', '2020-06-28 13:19:15', NULL, 1),
(3, 'HULAIMI MUSADDIQ', 'hulaimimusaddiq232@gmail.com', '$2y$10$H3yUgaV92EQ1v2W3NgPlLuqrKwuMGsJZuD80nlcPG3TNm83btGaNm', 147963531, 157963632, '2122 blok a208', 20116880352, NULL, NULL, NULL, NULL, '2025-03-06 06:31:54', NULL, 1),
(4, 'AHMAD ZAHID', 'ahmadzahid482@gmail.com', '$2y$10$1ksrnJ7dYG95ZxMyKVpAQ.Ayhhvkpli7wBzfI2tDLAtbfKAX6uili', 199904162, 157963632, 'blok a208', 20116880352, NULL, NULL, NULL, NULL, '2025-03-06 06:36:24', NULL, 1),
(5, 'musaddiq hulaimi', 'musaddiq232@gmail.com', '$2y$10$l8zJg4wFC6CqpHkYfZn/cuo/khAsEvHYevduHLn16UZHuZxPlUM3W', 199904162, 0, 'blok a208', 20116880352, NULL, NULL, NULL, NULL, '2025-03-06 07:15:02', NULL, 1),
(6, 'numan', 'userpublic@gmail.com', '$2y$10$zJySbWeqscsZv2g9vfd8wOlQMzmEZoxWSJngtbibczfJTKbjqj0G2', 1121962781, 123456789, '272A jalan jerat cina', 202029892, NULL, NULL, NULL, NULL, '2025-03-10 14:00:49', NULL, 1),
(7, 'zahidhamidi', 'zahidhamidi@gmail.com', '$2y$10$Gb0CVKD4t3BwBZxw9y.CB.mtj9ZKiE/OtdNH0r3zHkz5mXOY7L6iy', 147963531, 199904162, '16A, Jalan Dato&#39; Isaacs, Kampung Dalam Bata, 20100 Kuala Terengganu, Terengganu\r\n16A, Jalan Dato&#39; Isaacs, Kampung Dalam Bata, 20100 Kuala Terengganu, Terengganu', 202394546, NULL, NULL, NULL, NULL, '2025-03-25 17:54:25', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
