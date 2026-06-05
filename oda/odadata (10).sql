-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2026 at 08:30 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `odadata`
--

-- --------------------------------------------------------

--
-- Table structure for table `abroads`
--

CREATE TABLE `abroads` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `country` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `abroads`
--

INSERT INTO `abroads` (`id`, `first_name`, `middle_name`, `last_name`, `gender`, `age`, `country`, `address`, `contact_number`, `email`, `position`, `membership_type`, `membership_fee`, `created_at`, `updated_at`) VALUES
(1, 'Ayansa', 'Mulisa', 'Milkessa', 'Male', 24, 'Sao Tome and Principe', 'AAdd', '0955637971', 'admin@adminshkl.com', 'City/Town Resident', 'Regular', 120, '2023-03-16 15:39:46', '2023-03-16 15:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `abroad_member_pays`
--

CREATE TABLE `abroad_member_pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `abroad_member_pays`
--

INSERT INTO `abroad_member_pays` (`id`, `country`, `member_id`, `name`, `position`, `amount`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Sao Tome and Principe', '1', 'Ayansa Mulisa Milkessa', 'City/Town Resident', 120, '2023-03-13', '2023-03-20 11:14:18', '2023-03-20 11:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int(11) NOT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `description` text NOT NULL,
  `subject_type` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `subject_id` bigint(20) UNSIGNED DEFAULT NULL,
  `causer_type` varchar(255) DEFAULT NULL,
  `causer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `batch_uuid` varchar(36) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB AVG_ROW_LENGTH=413 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `log_name`, `description`, `subject_type`, `event`, `subject_id`, `causer_type`, `causer_id`, `properties`, `batch_uuid`, `created_at`, `updated_at`, `seen`) VALUES
(177, 'Department', 'user has created user tsifet', 'App\\Models\\Department', 'created', 6, 'App\\Models\\User', 1, '{\"attributes\":{\"id\":6,\"name\":\"tsifet\",\"branch_id\":null,\"description\":null,\"directorate_id\":2,\"code\":\"df\",\"created_at\":\"2026-05-26T19:19:14.000000Z\",\"updated_at\":\"2026-05-26T19:19:14.000000Z\"}}', NULL, '2026-05-26 19:19:15', '2026-05-27 18:00:57', 1),
(178, 'User', 'Admin has updated user Admin', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"Admin\",\"email\":\"ecc@admin.com\",\"email_verified_at\":\"2026-02-23T19:47:19.000000Z\",\"password\":\"$2y$10$BfMngNpmeEuRNlce.8r51exrHPOZljS8TRzfcqIkXoLIScH5xtEbq\",\"two_factor_secret\":null,\"two_factor_recovery_codes\":null,\"two_factor_confirmed_at\":null,\"zone\":null,\"remember_token\":\"uDG8hd5JgFlgVNSfp0uh4A2EkI0li0cDBpgLYvs2Nuy3DzJlzhljWpDQs6hU\",\"current_team_id\":null,\"profile_photo_path\":\"..\\/assets\\/img\\/avatars\\/image.jpg\",\"created_at\":\"2023-03-16T15:29:37.000000Z\",\"updated_at\":\"2026-05-16T19:51:10.000000Z\",\"fayda_fin\":\"701643173984\"},\"old\":{\"id\":1,\"name\":\"Admin\",\"email\":\"ecc@admin.com\",\"email_verified_at\":\"2026-02-23T19:47:19.000000Z\",\"password\":\"$2y$10$BfMngNpmeEuRNlce.8r51exrHPOZljS8TRzfcqIkXoLIScH5xtEbq\",\"two_factor_secret\":null,\"two_factor_recovery_codes\":null,\"two_factor_confirmed_at\":null,\"zone\":null,\"remember_token\":\"jmV8lQhz6fEppauAgBFOezZZhQqq9KqNzOudFnkUNszJ0Goyeewtt3pkrJt7\",\"current_team_id\":null,\"profile_photo_path\":\"..\\/assets\\/img\\/avatars\\/image.jpg\",\"created_at\":\"2023-03-16T15:29:37.000000Z\",\"updated_at\":\"2026-05-16T19:51:10.000000Z\",\"fayda_fin\":\"701643173984\"}}', NULL, '2026-05-26 19:56:16', '2026-05-27 18:00:57', 1),
(179, 'Department', 'user has deleted user tsifet', 'App\\Models\\Department', 'deleted', 6, 'App\\Models\\User', 1, '{\"old\":{\"id\":6,\"name\":\"tsifet\",\"branch_id\":null,\"description\":null,\"directorate_id\":2,\"code\":\"df\",\"created_at\":\"2026-05-26T19:19:14.000000Z\",\"updated_at\":\"2026-05-26T19:19:14.000000Z\"}}', NULL, '2026-05-27 17:36:02', '2026-05-27 18:00:57', 1),
(180, 'User', 'Admin has updated user Admin', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"Admin\",\"email\":\"ecc@admin.com\",\"email_verified_at\":\"2026-02-23T19:47:19.000000Z\",\"password\":\"$2y$10$BfMngNpmeEuRNlce.8r51exrHPOZljS8TRzfcqIkXoLIScH5xtEbq\",\"two_factor_secret\":null,\"two_factor_recovery_codes\":null,\"two_factor_confirmed_at\":null,\"zone\":null,\"remember_token\":\"WDWGwljnzIwBL8p7U829DM8dgQTeNKmjgPAtOT5pyuMiJg6mmHLT2xio4csa\",\"current_team_id\":null,\"profile_photo_path\":\"..\\/assets\\/img\\/avatars\\/image.jpg\",\"created_at\":\"2023-03-16T15:29:37.000000Z\",\"updated_at\":\"2026-05-16T19:51:10.000000Z\",\"fayda_fin\":\"701643173984\"},\"old\":{\"id\":1,\"name\":\"Admin\",\"email\":\"ecc@admin.com\",\"email_verified_at\":\"2026-02-23T19:47:19.000000Z\",\"password\":\"$2y$10$BfMngNpmeEuRNlce.8r51exrHPOZljS8TRzfcqIkXoLIScH5xtEbq\",\"two_factor_secret\":null,\"two_factor_recovery_codes\":null,\"two_factor_confirmed_at\":null,\"zone\":null,\"remember_token\":\"uDG8hd5JgFlgVNSfp0uh4A2EkI0li0cDBpgLYvs2Nuy3DzJlzhljWpDQs6hU\",\"current_team_id\":null,\"profile_photo_path\":\"..\\/assets\\/img\\/avatars\\/image.jpg\",\"created_at\":\"2023-03-16T15:29:37.000000Z\",\"updated_at\":\"2026-05-16T19:51:10.000000Z\",\"fayda_fin\":\"701643173984\"}}', NULL, '2026-05-27 17:58:26', '2026-05-27 18:00:57', 1),
(181, 'User', 'Admin has updated user Admin', 'App\\Models\\User', 'updated', 1, 'App\\Models\\User', 1, '{\"attributes\":{\"id\":1,\"name\":\"Admin\",\"email\":\"ecc@admin.com\",\"email_verified_at\":\"2026-02-23T19:47:19.000000Z\",\"password\":\"$2y$10$BfMngNpmeEuRNlce.8r51exrHPOZljS8TRzfcqIkXoLIScH5xtEbq\",\"two_factor_secret\":null,\"two_factor_recovery_codes\":null,\"two_factor_confirmed_at\":null,\"zone\":null,\"remember_token\":\"1TsHraNIqzv7k93BEN0Sh2xh8S5AUcVXcANLvROwGaXms9SQa4xpSc7X9TBF\",\"current_team_id\":null,\"profile_photo_path\":\"..\\/assets\\/img\\/avatars\\/image.jpg\",\"created_at\":\"2023-03-16T15:29:37.000000Z\",\"updated_at\":\"2026-05-16T19:51:10.000000Z\",\"fayda_fin\":\"701643173984\"},\"old\":{\"id\":1,\"name\":\"Admin\",\"email\":\"ecc@admin.com\",\"email_verified_at\":\"2026-02-23T19:47:19.000000Z\",\"password\":\"$2y$10$BfMngNpmeEuRNlce.8r51exrHPOZljS8TRzfcqIkXoLIScH5xtEbq\",\"two_factor_secret\":null,\"two_factor_recovery_codes\":null,\"two_factor_confirmed_at\":null,\"zone\":null,\"remember_token\":\"WDWGwljnzIwBL8p7U829DM8dgQTeNKmjgPAtOT5pyuMiJg6mmHLT2xio4csa\",\"current_team_id\":null,\"profile_photo_path\":\"..\\/assets\\/img\\/avatars\\/image.jpg\",\"created_at\":\"2023-03-16T15:29:37.000000Z\",\"updated_at\":\"2026-05-16T19:51:10.000000Z\",\"fayda_fin\":\"701643173984\"}}', NULL, '2026-05-27 17:58:33', '2026-05-27 18:00:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`id`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Hello', 'How do you doing?', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `arsii`
--

CREATE TABLE `arsii` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `paymemt` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arsii`
--

INSERT INTO `arsii` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `paymemt`, `created_at`, `updated_at`) VALUES
(1, '10004400', 'Ethiotel', 'Dhaabbataa Mootummaa', 'Shanan Kooluu', '968292069', 'adem@gmail.com', 'yearly', '2025-11-20', 1000000, '2025-11-22 11:45:00', '2025-11-22 17:07:05'),
(2, '10004401', 'Sinqe Bank', 'Dhaabbataa Mootummaa', 'Gololchaa', '968292069', 'ademahmedbkr@gmail.com', 'yearly', '2025-11-19', 200000, '2025-11-22 11:54:31', '2025-11-22 17:08:11'),
(26, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'Aminyaa', '945454546', 'ademahmed@gmail.com', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(27, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Collee', '945454547', 'ademgaaa@gmail.com', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(28, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'sirkaa', '945454548', 'ademgaaa@gmail.sim', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(29, '10004406', 'Awaash valley', 'Dhaabbataa Miti-Mootummaa', 'Gololchaa', '945454549', 'ademgaa@gmail.gom', 'waggaan', '2025-11-17', 30000, '2025-11-22 13:51:14', '2025-11-22 17:10:47'),
(30, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454550', 'ademahmed@gmail.dam', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(31, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454551', 'ademahmed@gmail.dam', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(32, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454552', 'ademahmed@gmail.dam', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(33, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454553', 'ademahmed@gmail.dam', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(34, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454554', 'ademahmed@gmail.dam', 'waggaan', '0000-00-00 00:00:00.000000', 10000000, '2025-11-22 13:51:14', '2025-11-22 13:51:14'),
(45, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454545', 'ademahmed@gmail.com', 'waggaan', '44114', 10000000, '2025-11-22 14:05:28', '2025-11-22 14:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `arsii_lixaa`
--

CREATE TABLE `arsii_lixaa` (
  `id` int(10) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `arsii_lixaa`
--

INSERT INTO `arsii_lixaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(21, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(22, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(23, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(24, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(25, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(26, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(27, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(28, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-22 15:49:42', '2025-11-22 15:49:42'),
(29, '10004410', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'H/Arsii', '945454545', 'ascende@gmail.com', 'waggaan', '2025-11-10', 10000000, '2025-11-22 15:49:42', '2025-11-22 16:57:31'),
(30, '10004411', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Adaabba', '945454545', 'kens@gmail.com', 'waggaan', '2025-11-21', 10000000, '2025-11-22 15:49:42', '2025-11-22 16:56:20'),
(31, '10004401', 'Sinqe Bank', 'Dhaabbataa Mootummaa', 'M/Dodolaa', '0968292069', 'ademahedb@gmail.com', 'yearly', '2025-11-22', 120000, '2025-11-22 16:02:42', '2025-11-22 16:02:42'),
(32, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'Aminyaa', '945454546', 'ademahmed@gmail.com', 'waggaan', '44115', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(33, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Collee', '945454547', 'ademgaaa@gmail.com', 'waggaan', '44116', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(34, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'sirkaa', '945454548', 'ademgaaa@gmail.sim', 'waggaan', '44117', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(35, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'gololcha', '945454549', 'ademgaaa@gmail.gom', 'waggaan', '44118', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(36, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454550', 'ademahmed@gmail.dam', 'waggaan', '44119', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(37, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454551', 'ademahmed@gmail.dam', 'waggaan', '44120', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(38, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454552', 'ademahmed@gmail.dam', 'waggaan', '44121', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(39, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454553', 'ademahmed@gmail.dam', 'waggaan', '44122', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42'),
(40, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454554', 'ademahmed@gmail.dam', 'waggaan', '44123', NULL, '2025-11-22 20:27:42', '2025-11-22 20:27:42');

-- --------------------------------------------------------

--
-- Table structure for table `baalee`
--

CREATE TABLE `baalee` (
  `id` int(10) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booranaa`
--

CREATE TABLE `booranaa` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booranaa`
--

INSERT INTO `booranaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(22, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(23, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(24, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(25, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(26, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(27, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(28, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(29, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(30, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(31, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-22 20:42:41', '2025-11-22 20:42:41'),
(32, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(33, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(34, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(35, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(36, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(37, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(38, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(39, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(40, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59'),
(41, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-22 20:42:59', '2025-11-22 20:42:59');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `address` varchar(100) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `city` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `name`, `code`, `created_at`, `address`, `is_active`, `city`, `updated_at`) VALUES
(1, 'Head Quarter', 'HQ', '2026-05-23 10:16:44', NULL, 1, 'AddisAbaba', '2026-05-23 10:16:44'),
(2, 'Jigjiga', 'JJ', '2026-05-23 12:39:56', 'Jigjiba', 1, 'JIGJIGA', '2026-05-23 12:39:56');

-- --------------------------------------------------------

--
-- Table structure for table `b_baddalle`
--

CREATE TABLE `b_baddalle` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `b_baddalle`
--

INSERT INTO `b_baddalle` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbataa Miti-Mootummaa', 'A-Beddeellee', '945454545', 'ga@gmail.com', 'waggaan', '2025-11-23', 1000000, '2025-11-23 11:54:59', '2025-11-23 15:25:32'),
(2, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'Boorrachaa', '945454545', 'adu@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:54:59', '2025-11-23 15:26:19'),
(3, '10004404', 'CBE', 'Dhaabbataa Miti-Mootummaa', 'Cooraa', '945454545', 'ha@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:54:59', '2025-11-23 15:27:56'),
(4, '10004405', 'Awaash Bank', 'Dhaabbataa Miti-Mootummaa', 'Makkoo', '945454545', 'Ali@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:54:59', '2025-11-23 15:29:06'),
(5, '10004406', 'Awaash valley', 'Dhaabbataa Miti-Mootummaa', 'Gachii', '945454545', 'aryastark@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:54:59', '2025-11-30 11:55:38'),
(6, '10004407', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Dhidheessa', '945454545', 'revan@gmailcom', 'waggaan', '2025-11-15', 10000000, '2025-11-23 11:54:59', '2025-11-23 15:31:08'),
(7, '10004408', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Deeggaa', '945454545', 'nasha@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:54:59', '2025-11-23 15:31:47'),
(8, '10004409', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Cawwaaqaa', '945454545', 'gal@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:54:59', '2025-11-23 15:24:39'),
(9, '10004410', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'DaabHaan', '945454545', 'clarke@gmail.com', 'waggaan', NULL, 10000000, '2025-11-23 11:54:59', '2025-11-23 15:32:45'),
(10, '10004411', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'M-Beddeellee', '945454545', 'arya@gmail.com', 'waggaan', NULL, 10000000, '2025-11-23 11:54:59', '2025-11-23 15:36:03'),
(11, '10004402', 'Warshaa Daakuu', 'Dhaabbataa Miti-Mootummaa', 'Boorrachaa', '945454545', 'belamy@gmailcom', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:57:57', '2025-11-23 15:33:55'),
(12, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'Boorrachaa', '945454545', 'abd@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:57:57', '2025-11-23 15:38:12'),
(13, '10004404', 'CBE', 'Dhaabbataa Miti-Mootummaa', 'Deeggaa', '945454545', 'samwel@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:57:57', '2025-11-23 15:37:20'),
(14, '10004405', 'Awaash Bank', 'Dhaabbataa Miti-Mootummaa', 'M-Beddeellee', '945454545', 'sansa@gmail.com', 'waggaan', NULL, 10000000, '2025-11-23 11:57:57', '2025-11-23 15:39:23'),
(15, '10004406', 'Awaash valley', 'Dhaabbataa Miti-Mootummaa', 'Cooraa', '945454545', 'murfy@gmail.com', 'waggaan', NULL, 10000000, '2025-11-23 11:57:57', '2025-11-23 15:41:13'),
(16, '10004407', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Dhidheessa', '945454545', 'tyrion@gmailcom', 'waggaan', NULL, 10000000, '2025-11-23 11:57:57', '2025-11-23 15:42:04'),
(17, '10004408', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Cawwaaqaa', '945454545', 'varys@gmail.com', 'waggaan', NULL, 10000000, '2025-11-23 11:57:57', '2025-11-23 15:42:58'),
(18, '10004409', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Dhidheessa', '945454545', 'snow@gmail.com', 'waggaan', '2025-11-23', 10000000, '2025-11-23 11:57:57', '2025-11-23 15:35:02'),
(19, '10004410', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'Boorrachaa', '945454545', 'denareas@gmail.com', 'waggaan', NULL, 10000000, '2025-11-23 11:57:57', '2025-11-23 15:43:32'),
(20, '10004411', 'Dangote', 'Dhaabbataa Miti-Mootummaa', 'A-Beddeellee', '945454545', 'ke@gmail.com', 'waggaan', NULL, 10000000, '2025-11-23 11:57:57', '2025-11-23 15:40:04');

-- --------------------------------------------------------

--
-- Table structure for table `b_bahaa`
--

CREATE TABLE `b_bahaa` (
  `id` int(10) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `b_bahaa`
--

INSERT INTO `b_bahaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbataa Miti-Mootummaa', 'M/Gindhiir', '945454545', 'gad@gmailcom', 'waggaan', '2025-11-11', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:24:05'),
(2, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(3, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(4, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(5, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(6, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(7, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(8, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(9, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(10, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-22 19:14:41', '2025-11-22 19:14:41'),
(11, '10004402', 'Warshaa Daakuu', 'Dhaabbataa Miti-Mootummaa', 'M/Gindhiir', '945454545', 'baaleebahaa@gmail.com', 'waggaan', '2025-11-11', 10000000, '2025-11-22 19:26:56', '2025-11-22 19:26:56');

-- --------------------------------------------------------

--
-- Table structure for table `city_member_pays`
--

CREATE TABLE `city_member_pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(2, 'Åland Islands', 'AX', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(3, 'Albania', 'AL', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(4, 'Algeria', 'DZ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(5, 'American Samoa', 'AS', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(6, 'Andorra', 'AD', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(7, 'Angola', 'AO', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(8, 'Anguilla', 'AI', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(9, 'Antarctica', 'AQ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(10, 'Antigua and Barbuda', 'AG', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(11, 'Argentina', 'AR', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(12, 'Armenia', 'AM', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(13, 'Aruba', 'AW', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(14, 'Australia', 'AU', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(15, 'Austria', 'AT', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(16, 'Azerbaijan', 'AZ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(17, 'Bahamas', 'BS', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(18, 'Bahrain', 'BH', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(19, 'Bangladesh', 'BD', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(20, 'Barbados', 'BB', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(21, 'Belarus', 'BY', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(22, 'Belgium', 'BE', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(23, 'Belize', 'BZ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(24, 'Benin', 'BJ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(25, 'Bermuda', 'BM', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(26, 'Bhutan', 'BT', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(27, 'Bolivia, Plurinational State of', 'BO', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(28, 'Bonaire, Sint Eustatius and Saba', 'BQ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(29, 'Bosnia and Herzegovina', 'BA', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(30, 'Botswana', 'BW', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(31, 'Bouvet Island', 'BV', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(32, 'Brazil', 'BR', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(33, 'British Indian Ocean Territory', 'IO', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(34, 'Brunei Darussalam', 'BN', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(35, 'Bulgaria', 'BG', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(36, 'Burkina Faso', 'BF', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(37, 'Burundi', 'BI', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(38, 'Cambodia', 'KH', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(39, 'Cameroon', 'CM', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(40, 'Canada', 'CA', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(41, 'Cape Verde', 'CV', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(42, 'Cayman Islands', 'KY', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(43, 'Central African Republic', 'CF', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(44, 'Chad', 'TD', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(45, 'Chile', 'CL', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(46, 'China', 'CN', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(47, 'Christmas Island', 'CX', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(48, 'Cocos (Keeling) Islands', 'CC', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(49, 'Colombia', 'CO', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(50, 'Comoros', 'KM', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(51, 'Congo', 'CG', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(52, 'Congo, the Democratic Republic of the', 'CD', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(53, 'Cook Islands', 'CK', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(54, 'Costa Rica', 'CR', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(55, 'Côte d\'Ivoire', 'CI', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(56, 'Croatia', 'HR', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(57, 'Cuba', 'CU', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(58, 'Curaçao', 'CW', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(59, 'Cyprus', 'CY', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(60, 'Czech Republic', 'CZ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(61, 'Denmark', 'DK', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(62, 'Djibouti', 'DJ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(63, 'Dominica', 'DM', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(64, 'Dominican Republic', 'DO', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(65, 'Ecuador', 'EC', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(66, 'Egypt', 'EG', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(67, 'El Salvador', 'SV', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(68, 'Equatorial Guinea', 'GQ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(69, 'Eritrea', 'ER', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(70, 'Estonia', 'EE', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(71, 'Ethiopia', 'ET', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(72, 'Falkland Islands (Malvinas)', 'FK', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(73, 'Faroe Islands', 'FO', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(74, 'Fiji', 'FJ', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(75, 'Finland', 'FI', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(76, 'France', 'FR', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(77, 'French Guiana', 'GF', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(78, 'French Polynesia', 'PF', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(79, 'French Southern Territories', 'TF', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(80, 'Gabon', 'GA', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(81, 'Gambia', 'GM', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(82, 'Georgia', 'GE', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(83, 'Germany', 'DE', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(84, 'Ghana', 'GH', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(85, 'Gibraltar', 'GI', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(86, 'Greece', 'GR', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(87, 'Greenland', 'GL', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(88, 'Grenada', 'GD', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(89, 'Guadeloupe', 'GP', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(90, 'Guam', 'GU', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(91, 'Guatemala', 'GT', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(92, 'Guernsey', 'GG', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(93, 'Guinea', 'GN', '2023-03-16 15:29:37', '2023-03-16 15:29:37'),
(94, 'Guinea-Bissau', 'GW', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(95, 'Guyana', 'GY', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(96, 'Haiti', 'HT', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(97, 'Heard Island and McDonald Mcdonald Islands', 'HM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(98, 'Holy See (Vatican City State)', 'VA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(99, 'Honduras', 'HN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(100, 'Hong Kong', 'HK', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(101, 'Hungary', 'HU', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(102, 'Iceland', 'IS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(103, 'India', 'IN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(104, 'Indonesia', 'ID', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(105, 'Iran, Islamic Republic of', 'IR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(106, 'Iraq', 'IQ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(107, 'Ireland', 'IE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(108, 'Isle of Man', 'IM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(109, 'Israel', 'IL', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(110, 'Italy', 'IT', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(111, 'Jamaica', 'JM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(112, 'Japan', 'JP', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(113, 'Jersey', 'JE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(114, 'Jordan', 'JO', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(115, 'Kazakhstan', 'KZ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(116, 'Kenya', 'KE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(117, 'Kiribati', 'KI', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(118, 'Korea, Democratic People\'s Republic of', 'KP', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(119, 'Korea, Republic of', 'KR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(120, 'Kuwait', 'KW', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(121, 'Kyrgyzstan', 'KG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(122, 'Lao People\'s Democratic Republic', 'LA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(123, 'Latvia', 'LV', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(124, 'Lebanon', 'LB', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(125, 'Lesotho', 'LS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(126, 'Liberia', 'LR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(127, 'Libya', 'LY', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(128, 'Liechtenstein', 'LI', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(129, 'Lithuania', 'LT', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(130, 'Luxembourg', 'LU', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(131, 'Macao', 'MO', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(132, 'Macedonia, the Former Yugoslav Republic of', 'MK', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(133, 'Madagascar', 'MG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(134, 'Malawi', 'MW', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(135, 'Malaysia', 'MY', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(136, 'Maldives', 'MV', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(137, 'Mali', 'ML', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(138, 'Malta', 'MT', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(139, 'Marshall Islands', 'MH', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(140, 'Martinique', 'MQ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(141, 'Mauritania', 'MR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(142, 'Mauritius', 'MU', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(143, 'Mayotte', 'YT', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(144, 'Mexico', 'MX', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(145, 'Micronesia, Federated States of', 'FM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(146, 'Moldova, Republic of', 'MD', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(147, 'Monaco', 'MC', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(148, 'Mongolia', 'MN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(149, 'Montenegro', 'ME', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(150, 'Montserrat', 'MS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(151, 'Morocco', 'MA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(152, 'Mozambique', 'MZ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(153, 'Myanmar', 'MM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(154, 'Namibia', 'NA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(155, 'Nauru', 'NR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(156, 'Nepal', 'NP', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(157, 'Netherlands', 'NL', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(158, 'New Caledonia', 'NC', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(159, 'New Zealand', 'NZ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(160, 'Nicaragua', 'NI', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(161, 'Niger', 'NE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(162, 'Nigeria', 'NG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(163, 'Niue', 'NU', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(164, 'Norfolk Island', 'NF', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(165, 'Northern Mariana Islands', 'MP', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(166, 'Norway', 'NO', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(167, 'Oman', 'OM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(168, 'Pakistan', 'PK', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(169, 'Palau', 'PW', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(170, 'Palestine, State of', 'PS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(171, 'Panama', 'PA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(172, 'Papua New Guinea', 'PG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(173, 'Paraguay', 'PY', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(174, 'Peru', 'PE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(175, 'Philippines', 'PH', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(176, 'Pitcairn', 'PN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(177, 'Poland', 'PL', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(178, 'Portugal', 'PT', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(179, 'Puerto Rico', 'PR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(180, 'Qatar', 'QA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(181, 'Réunion', 'RE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(182, 'Romania', 'RO', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(183, 'Russian Federation', 'RU', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(184, 'Rwanda', 'RW', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(185, 'Saint Barthélemy', 'BL', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(186, 'Saint Helena, Ascension and Tristan da Cunha', 'SH', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(187, 'Saint Kitts and Nevis', 'KN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(188, 'Saint Lucia', 'LC', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(189, 'Saint Martin (French part)', 'MF', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(190, 'Saint Pierre and Miquelon', 'PM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(191, 'Saint Vincent and the Grenadines', 'VC', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(192, 'Samoa', 'WS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(193, 'San Marino', 'SM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(194, 'Sao Tome and Principe', 'ST', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(195, 'Saudi Arabia', 'SA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(196, 'Senegal', 'SN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(197, 'Serbia', 'RS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(198, 'Seychelles', 'SC', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(199, 'Sierra Leone', 'SL', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(200, 'Singapore', 'SG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(201, 'Sint Maarten (Dutch part)', 'SX', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(202, 'Slovakia', 'SK', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(203, 'Slovenia', 'SI', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(204, 'Solomon Islands', 'SB', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(205, 'Somalia', 'SO', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(206, 'South Africa', 'ZA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(207, 'South Georgia and the South Sandwich Islands', 'GS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(208, 'South Sudan', 'SS', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(209, 'Spain', 'ES', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(210, 'Sri Lanka', 'LK', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(211, 'Sudan', 'SD', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(212, 'Suriname', 'SR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(213, 'Svalbard and Jan Mayen', 'SJ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(214, 'Swaziland', 'SZ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(215, 'Sweden', 'SE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(216, 'Switzerland', 'CH', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(217, 'Syrian Arab Republic', 'SY', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(218, 'Taiwan', 'TW', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(219, 'Tajikistan', 'TJ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(220, 'Tanzania, United Republic of', 'TZ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(221, 'Thailand', 'TH', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(222, 'Timor-Leste', 'TL', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(223, 'Togo', 'TG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(224, 'Tokelau', 'TK', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(225, 'Tonga', 'TO', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(226, 'Trinidad and Tobago', 'TT', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(227, 'Tunisia', 'TN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(228, 'Turkey', 'TR', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(229, 'Turkmenistan', 'TM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(230, 'Turks and Caicos Islands', 'TC', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(231, 'Tuvalu', 'TV', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(232, 'Uganda', 'UG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(233, 'Ukraine', 'UA', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(234, 'United Arab Emirates', 'AE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(235, 'United Kingdom', 'GB', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(236, 'United States', 'US', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(237, 'United States Minor Outlying Islands', 'UM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(238, 'Uruguay', 'UY', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(239, 'Uzbekistan', 'UZ', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(240, 'Vanuatu', 'VU', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(241, 'Venezuela, Bolivarian Republic of', 'VE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(242, 'Viet Nam', 'VN', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(243, 'Virgin Islands, British', 'VG', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(244, 'Virgin Islands, U.S.', 'VI', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(245, 'Wallis and Futuna', 'WF', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(246, 'Western Sahara', 'EH', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(247, 'Yemen', 'YE', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(248, 'Zambia', 'ZM', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(249, 'Zimbabwe', 'ZW', '2023-03-16 15:29:38', '2023-03-16 15:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `description` text DEFAULT NULL,
  `directorate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `name`, `branch_id`, `description`, `directorate_id`, `code`, `created_at`, `updated_at`) VALUES
(1, 'Secretary Officer', NULL, 'Hello', 1, 'dont', '2026-05-24 20:21:23', '2026-05-24 20:21:23'),
(2, 'Executive Secretary', NULL, 'gfh', 1, 'ECC', '2026-05-24 20:12:45', '2026-05-24 20:12:45'),
(3, 'Senior Secretary', NULL, 'ghjhhhhh', 1, 'Adem', '2026-05-24 20:50:33', '2026-05-24 20:50:33'),
(4, 'Commission Commissioner', NULL, 'Hello', 1, 'CC', '2026-05-24 14:02:54', '2026-05-24 14:02:54'),
(5, 'Human Resource Management Director', NULL, 'H', 34, 'HRD', '2026-05-25 11:54:03', '2026-05-25 11:54:03');

-- --------------------------------------------------------

--
-- Table structure for table `directorates`
--

CREATE TABLE `directorates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `manager_id` bigint(20) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL,
  `code` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `head_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `directorates`
--

INSERT INTO `directorates` (`id`, `name`, `manager_id`, `branch_id`, `code`, `description`, `head_id`, `created_at`, `updated_at`) VALUES
(1, 'Commission Commissioner', 3, 1, 'COMMISSIONER', NULL, NULL, '2026-05-03 19:38:05', '2026-05-23 12:36:26'),
(2, 'Head of the Commissioner\'s Office', 4, 1, 'HCO', NULL, NULL, '2026-05-03 19:38:45', '2026-05-23 12:47:12'),
(3, 'Customs Advisor to the Commission', 5, 1, 'CAC', NULL, NULL, '2026-05-03 19:39:25', '2026-05-23 17:48:03'),
(4, 'Communications Directorate', 6, 1, 'CD', NULL, NULL, '2026-05-03 19:39:55', '2026-05-23 17:48:15'),
(5, 'Director Customs Complaint Investigation Directorate', 7, 1, 'DCCID', NULL, NULL, '2026-05-03 19:40:30', '2026-05-24 10:06:23'),
(6, 'Director Planning and Budget Administration Directorate', 8, 1, 'DPBAD', NULL, NULL, '2026-05-03 19:41:34', '2026-05-24 10:06:35'),
(7, 'Strategic Partnership Director', 9, 1, 'SPD', NULL, NULL, '2026-05-03 19:42:05', '2026-05-24 10:06:53'),
(8, 'Women Children and Youth Affairs Director', 10, 1, 'WCYAD', NULL, NULL, '2026-05-03 19:43:11', '2026-05-24 10:07:35'),
(9, 'Institutional Risk Management and Ethics Director', 11, 1, 'IRMED', NULL, NULL, '2026-05-03 19:47:14', '2026-05-24 10:07:53'),
(10, 'Internal Audit Director', 12, NULL, 'IAD', NULL, NULL, '2026-05-03 19:47:40', '2026-05-16 22:13:37'),
(11, 'Software Development and Administration Directorate', NULL, NULL, 'SDAD', NULL, NULL, '2026-05-03 19:48:43', '2026-05-03 19:48:43'),
(12, 'Customs Technology Infrastructure Directorate', NULL, NULL, 'CTID', NULL, NULL, '2026-05-03 19:49:56', '2026-05-03 19:49:56'),
(13, 'Construction Project Management Directorate', NULL, NULL, 'CPMD', NULL, NULL, '2026-05-03 19:51:23', '2026-05-03 19:51:23'),
(14, 'Director Customs Procedure Development Directorate', NULL, NULL, 'DCPDD', NULL, NULL, '2026-05-03 19:52:30', '2026-05-03 19:52:30'),
(15, 'Legal Advisor to the Commission', NULL, NULL, 'LAC', NULL, NULL, '2026-05-03 20:54:54', '2026-05-03 20:54:54'),
(16, 'Deputy Commissioner Operations Sector', NULL, NULL, 'DCOS', NULL, NULL, '2026-05-03 20:55:25', '2026-05-03 20:55:25'),
(17, 'Head of Customs Operations Sector Office', NULL, NULL, 'HCOSO', NULL, NULL, '2026-05-03 20:56:06', '2026-05-03 20:56:06'),
(18, 'Director Manufacturing and Export Procedure Support Directorate', NULL, NULL, 'DMEPSD', NULL, NULL, '2026-05-03 20:56:54', '2026-05-03 20:56:54'),
(19, 'Valuation and Development Directorate', NULL, NULL, 'VDD', NULL, NULL, '2026-05-03 20:57:29', '2026-05-03 20:57:29'),
(20, 'Tariff and Origin Determination Directorate', NULL, NULL, 'TODD', NULL, NULL, '2026-05-03 20:58:04', '2026-05-03 20:58:04'),
(21, 'Deputy Commissioner Law Compliance Sector', NULL, NULL, 'DCLCS', NULL, NULL, '2026-05-03 20:58:53', '2026-05-03 20:58:53'),
(22, 'Transit Director', NULL, NULL, 'TD', NULL, NULL, '2026-05-03 20:59:14', '2026-05-03 20:59:14'),
(23, 'Director Customs Clearance Directorate', NULL, NULL, 'DCCD', NULL, NULL, '2026-05-03 20:59:38', '2026-05-03 20:59:38'),
(24, 'Warehouse Management Directorate', NULL, NULL, 'WMD', NULL, NULL, '2026-05-03 21:02:20', '2026-05-03 21:02:20'),
(25, 'Head of Law Compliance Risk Management', NULL, NULL, 'HLCRM', NULL, NULL, '2026-05-03 21:02:54', '2026-05-03 21:02:54'),
(26, 'Head of Post-Clearance Audit Center', NULL, NULL, 'HPCAC', NULL, NULL, '2026-05-03 21:03:29', '2026-05-03 21:03:29'),
(27, 'Director Post-Clearance Audit Quality Assurance', NULL, NULL, 'DPCACA', NULL, NULL, '2026-05-03 21:04:03', '2026-05-03 21:04:03'),
(28, 'Director Post-Clearance Audit Directorate', NULL, NULL, 'DPCAD', NULL, NULL, '2026-05-03 21:04:33', '2026-05-03 21:04:33'),
(29, 'Customs Intelligence Directorate', NULL, NULL, 'CID', NULL, NULL, '2026-05-03 21:04:53', '2026-05-03 21:04:53'),
(30, 'Contraband Prevention and Border Control Directorate', NULL, NULL, 'CPBCD', NULL, NULL, '2026-05-03 21:05:22', '2026-05-03 21:05:22'),
(31, 'Customer Education and Support Directorate', NULL, NULL, 'CESD', NULL, NULL, '2026-05-03 21:05:48', '2026-05-03 21:05:48'),
(32, 'Institutional Capacity and Support Sector', NULL, NULL, 'ICSS', NULL, NULL, '2026-05-03 21:06:10', '2026-05-03 21:06:10'),
(33, 'Head of Deputy Commissioner\'s Office', NULL, NULL, 'HDCO', NULL, NULL, '2026-05-03 21:06:39', '2026-05-03 21:06:39'),
(34, 'Human Resource Management Director', 36, 1, 'HRMD', NULL, NULL, '2026-05-03 21:07:07', '2026-05-25 12:02:58'),
(35, 'Procurement and Finance Administration Director', NULL, NULL, 'PFAD', NULL, NULL, '2026-05-03 21:07:37', '2026-05-03 21:07:37'),
(36, 'Property Administration Directorate', NULL, NULL, 'PAD', NULL, NULL, '2026-05-03 21:08:01', '2026-05-03 21:08:01'),
(37, 'Director General Services Directorate', NULL, NULL, 'DGSD', NULL, NULL, '2026-05-03 21:08:24', '2026-05-03 21:08:24');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `doctype` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) NOT NULL,
  `file` varchar(1000) DEFAULT NULL,
  `employeeid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `document_types`
--

CREATE TABLE `document_types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `has_expiry` tinyint(1) NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_types`
--

INSERT INTO `document_types` (`id`, `name`, `slug`, `description`, `is_required`, `has_expiry`, `display_order`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Educational Document', 'educational', 'Academic certificates, diplomas, degrees, transcripts', 1, 0, 1, 1, '2026-04-26 22:30:40', '2026-04-26 22:30:40'),
(2, 'Hire History Document', 'hire-history', 'Appointment letters, promotion letters, transfer letters', 1, 0, 2, 1, '2026-04-26 22:30:40', '2026-04-26 22:30:40'),
(3, 'National ID Document', 'national-id', 'National ID, Passport, Driving License', 1, 1, 3, 1, '2026-04-26 22:30:40', '2026-04-26 22:30:40'),
(4, 'Contract Document', 'contract', 'Employment contracts, agreements', 1, 1, 4, 1, '2026-04-26 22:30:40', '2026-04-26 22:30:40'),
(5, 'Medical Document', 'medical', 'Medical reports, fitness certificates', 0, 1, 5, 1, '2026-04-26 22:30:40', '2026-04-26 22:30:40'),
(6, 'Training Certificate', 'training', 'Training completion certificates', 0, 0, 6, 1, '2026-04-26 22:30:40', '2026-04-26 22:30:40'),
(7, 'Other Document', 'other', 'Other miscellaneous documents', 0, 0, 7, 1, '2026-04-26 22:30:40', '2026-04-26 22:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_number` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `gender` enum('ወ','ሴ') DEFAULT NULL,
  `job_level` varchar(50) DEFAULT NULL,
  `ethnicity` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `allowance` decimal(12,2) DEFAULT NULL,
  `assignment_date` date DEFAULT NULL,
  `housing_allowance` decimal(12,2) DEFAULT NULL,
  `pension_id` varchar(50) DEFAULT NULL,
  `marital_status` enum('Single','Married','Divorced','Widowed') DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `zone` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `specific_location` varchar(255) DEFAULT NULL,
  `house_number` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `education_type` varchar(100) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `cgpa` decimal(3,2) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `graduation_date` date DEFAULT NULL,
  `coc_certificate` tinyint(1) DEFAULT 0,
  `higher_ed_verified` tinyint(1) DEFAULT 0,
  `current_job_title` varchar(255) DEFAULT NULL,
  `level_dup` varchar(50) DEFAULT NULL,
  `current_institution` varchar(255) DEFAULT NULL,
  `experience_from` date DEFAULT NULL,
  `experience_to` date DEFAULT NULL,
  `previous_job_title` varchar(255) DEFAULT NULL,
  `previous_institution` varchar(255) DEFAULT NULL,
  `previous_from` date DEFAULT NULL,
  `previous_to` date DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `disability_type` varchar(255) DEFAULT NULL,
  `column_40` varchar(1000) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `years_of_service` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `photo` varchar(10000) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `fan_number` varchar(150) DEFAULT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `fayda` varchar(255) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `file_number`, `employee_name`, `job_title`, `gender`, `job_level`, `ethnicity`, `religion`, `date_of_birth`, `hire_date`, `step`, `salary`, `allowance`, `assignment_date`, `housing_allowance`, `pension_id`, `marital_status`, `region`, `zone`, `district`, `specific_location`, `house_number`, `phone_number`, `email`, `education_type`, `education_level`, `cgpa`, `institution`, `graduation_date`, `coc_certificate`, `higher_ed_verified`, `current_job_title`, `level_dup`, `current_institution`, `experience_from`, `experience_to`, `previous_job_title`, `previous_institution`, `previous_from`, `previous_to`, `diagnosis`, `disability_type`, `column_40`, `deleted_at`, `created_at`, `updated_at`, `years_of_service`, `age`, `photo`, `document`, `fan_number`, `department_id`, `fayda`, `branch_id`) VALUES
(6, 'ED-271', 'ደበሌ ቃበታ ሁርሳ', 'ኮሚሽነር', 'ወ', '17', 'ኦሮሞ', 'ኘሮቴስታንት', '1960-06-17', NULL, NULL, 77100.00, 42660.00, NULL, NULL, NULL, 'Married', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '911108676', 'abebaeth@gmail.com', 'ሊደርሽኘ እና ማኔጅመንት', 'ማስተርስ ዲግሪ', 3.63, 'ኢንተርናሽናል ሊደርሽኘ ኢንስቲትዮት', '2010-09-29', 0, 0, 'የአ/አ ንግድ ዕቃዎች ማስተናገጃ ቅ/ጽ/ቤት ሥራ አስኪያጅ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'ER-490', 'ሩት ለገሰ አድነው', 'ኤክስክዩቲቭ ሴክሬታሪ', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1977-02-05', '2017-09-01', NULL, 21580.00, 7000.00, '2017-09-01', 14860.00, '7020749', 'Married', NULL, NULL, NULL, NULL, NULL, '09-11-42-23-18', NULL, 'የጽህፈትና ቢሮ አስተዳደር', 'ዲኘሎማ', NULL, 'ቅድስተማሪያም ካቶሊክ ኮሌጅ', '1999-10-30', 0, 0, 'ኤክስክዩቲቭ ሴክሬታሪ', NULL, 'ፌደራል ጠቅላይ ፍ/ቤት', '2017-09-01', NULL, 'ሴክሬታሪ I', 'ፌደራል ጠቅላይ ፍ/ቤት', '2007-10-02', '2010-12-30', NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 'ED-1224', 'ደሜ ደንጊያ ረፌራ', 'ሴክሬታሪ III', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ', '1993-09-05', '2016-03-01', 1, 14245.00, NULL, '2016-03-01', 11110.00, NULL, 'Single', 'አዲስ አበባ', 'ለሚ ኩራ', 'ኮተቤ', '2', NULL, '977335180', NULL, 'Hardware & Network Servicing', 'ደረጃ 4', NULL, 'ሪፍት ቫሊ ዩኒቨርስቲ', '2019-04-09', 1, 0, 'ሴክሬታሪ III', NULL, NULL, '2016-03-01', NULL, 'ሴክሬታሪ II', 'ሲቪል ሰርቪስ ዩኒቨርሲቲ', '2012-12-05', '2015-07-26', 'የለም', NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'EM-450', 'መንግስቱ ተፈራ አያና', 'የኮሚሽኑ ጽ/ቤት ኃላፊ', 'ወ', '15', 'ኦሮሞ', 'ክርስቲያን', '1975-07-19', '1996-03-01', 2, 74829.00, 27300.00, '2016-04-01', 28000.00, NULL, 'Single', 'አዲስ አበባ', 'ቦሌ', 'አራብሳ', 'አዲስ', NULL, '9114404949', NULL, 'ሴክሬታሪ ሳይንስ እና ኦፊሰር ማኔጅመንት', 'ዲኘሎማ', 3.53, 'ጐንደር ኮሌጅ', '2003-07-12', 0, 1, 'የኮሚሽኑ ጽ/ቤት ኃላፊ', NULL, NULL, '2016-04-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'EB-2026', 'ብርቱካን ዳባ ጎሾል', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', NULL, NULL, NULL, NULL, 4760.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 'EM-446', 'መንግስቱ ግዛው ለማ', 'የኮሚሽን ጽ/ቤት ዋና መሪ ባለሙያ', 'ወ', '10', 'Amhara', 'ኦርቶዶክስ', '1971-08-09', '1992-11-15', 2, 47468.00, 10600.00, '2011-12-24', 22370.00, 'ሰ/1778374', 'Single', 'Addis Ababa', 'የካ', 'yeka', 'ቀበሌ 41፣ ጌጃ ሰፈር፣', '242', '0911689718', 'mangistu@gmail.com', 'የንድፍ ትምህርት', 'Master', 3.25, 'አዲስ አበባ ተግባራዕድ ትምህርት ቤት', '1989-07-12', 1, 1, 'በጉ/ኮሚሽነር ጽ/ቤት - ዋና መሪ ባለሙያ', NULL, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', '2017-10-05', NULL, 'ድራፍትስ ማን', 'የኢትዮጵያ መንገዶች ባለስልጣን', '1990-01-01', '1991-03-01', NULL, 'None', NULL, NULL, '2026-03-19 22:49:29', '2026-04-25 20:40:22', NULL, NULL, 'uploads/employees/photos/1863476441355424.jpg', NULL, '58640000000000000033', 2, 'uploads/employees/fayda/1776627483_Fayda_Letter.pdf', NULL),
(12, 'EA-852', 'አብዱልከሪም አደም የሱፍ', 'የኮሚሽን ጽ/ቤት ዋና መሪ ባለሙያ', 'ወ', '10', 'አማራ', 'ሙስልም', '1980-01-25', '2003-05-01', 2, 47468.00, 10600.00, '2011-04-24', 22370.00, 'ሰ/1782899', 'Married', 'አዲስ አበባ', 'ለሚ ኩራ', '4', NULL, '323/25', '913409342', 'abdukerimadem2014@gmail.com', 'public Adminstration &Dev\'t mgt.', 'ዲግሪ', 3.50, 'ወለጋ ዩኒቨርስቲ', '2002-10-30', 0, 1, 'የኮሚሽን ጽ/ቤት ዋና መሪ ባለሙያ', NULL, NULL, '2011-04-24', NULL, 'የሰዉ ሀይል አስተዳደር ኦፊሰር', 'አ.አ ሲቪል ሰርቪስ ኤጀንስ', '2003-05-01', NULL, NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 'EW-9', 'ወጋየሁ አዳሙ ሽብሩ', 'የኮሚሽኑ የጉምሩክ አማካሪ', 'ወ', '14', 'ኦሮሞ', 'ኦርቶዶክስ', '1967-12-30', '1990-10-09', NULL, 73538.00, 27300.00, '2006-04-11', 28000.00, 'ሰ/747285', NULL, 'አ.አ', 'ጉለሌ', '3', 'የለም', '166 ሀ', '911141275', NULL, 'አማረኛ', 'ዲፕሎማ', 2.23, 'አዲስ አበባ ዩኒቨርስቲ', NULL, 0, 0, 'የኮሚሽነሩ የጉምሩክ ጉዳዮች አማካሪ', NULL, NULL, '2016-04-11', NULL, NULL, NULL, NULL, NULL, 'የኮምፒውተር ስልጠና', NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(14, 'EZ-49', 'ዘሪሁን አሰፋ ዘሎ', 'የኮሙኒኬሽን ዳይሬክቶሬት', 'ወ', '14', 'ከንባታ', 'ፕሮቴስታንት', '1978-04-19', '2001-04-01', NULL, 73538.00, 27300.00, '2016-01-01', 28000.00, NULL, 'Single', 'አዲስ አበባ', 'የካ', 'ኮተቤ', NULL, NULL, '911738325', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 3.16, 'ሀረማያ ዩኒቨርስቲ', '2008-07-12', 0, 1, 'የኮሚኒኬሽን ዳይሬከቶሬት ዳይሬክተር', NULL, NULL, '2016-01-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'ET-2875', 'ትዕግስት አብርሃም ማሩ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ጉራጌ', 'ኦርቶዶክስ', '1993-10-12', '2016-06-18', 4, 5866.00, NULL, '2016-06-18', NULL, NULL, 'Single', 'አዲስ አበባ', 'ንፋስ ስልክ', '1', 'ወደገነት ገፈርሳ', NULL, '928682055', NULL, 'ደረጃ 4', 'አካውንቲግ እና በጀት ሰርቪስ', NULL, 'አድማስ ዩኒቨርቲ', '2017-01-01', 1, 1, 'የመልዕክት ሠራተኛ', NULL, NULL, '2016-06-18', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(16, 'ET-2631', 'ቴዎድሮስ ተሻለ ረታ', 'የኮሙኒኬሽን እና ኩነት ዝግጅት ቡድን አስተባባሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '1978-01-01', '2013-05-01', 2, 47468.00, 10600.00, '2017-04-16', 22370.00, 'C-7022136', 'Married', 'አዲስ አበባ', 'ጉለሌ', '3', 'የለም', '128/07', '0920198775', 'tewoeneko1978@gmail.com', 'ቋንቋ ትምህርት', 'ዲግሪ', 2.90, 'አዲስ አበባ ዩኒቨርስቲ', '2008-07-31', 0, 1, 'የኮሚኒኬሽን መሪ ባለሙያ', NULL, NULL, '2013-01-11', NULL, 'የኘሬስ ስራዎች ዜናና ኘሮግራም', 'አማራ ብ/ክ/መ/', '2001-08-01', '2013-02-03', NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(17, 'EA-4239', 'አየለ ዳምጠው አጥናፋ', 'ከፍተኛ የፎቶግራፍና ቪዲዮ ባለሙያ I', 'ወ', '8', 'አማራ', 'ኦርቶዶክስ', '1975-11-16', '2013-05-12', 1, 33240.00, 8000.00, '2016-02-20', 18620.00, 'ሰ/1125854', 'Married', 'አዲስ አበባ', 'የካ', '1', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '0912051798', NULL, 'ሃርድ ዋየር እና ኔትወርክ ሰርቪስ', 'ደረጃ 4', NULL, 'ጌጅ', '2017-09-15', 1, 0, 'ከፍተኛ የፎቶግራፍና ቪዲዮ ባለሙያ I', NULL, NULL, '2016-02-20', NULL, 'ኦዲቪዥዋል ባለሙያ', 'አ/አ ከተማ አ/ ር መ/ቤት', '2012-04-01', '2012-04-30', NULL, NULL, NULL, NULL, '2026-03-19 22:49:29', '2026-03-19 22:49:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(18, 'EE-97', 'እንዳሻው ተመስገን በየነ', 'የጉምሩክ አቤቱታ አጣሪ ዳይሬክቶሬት ዳይሬክተር', 'ወ', '14', 'ጉራጌ', 'ኦርቶዶክስ', '1978-02-16', '2001-04-01', NULL, 73538.00, 27300.00, '2016-04-01', 28000.00, 'ሰ/1775990', '', 'አዲስ አበባ', 'ላፍቶ ክፍለ ከተማ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '0912343165', 'endashawsome@yahoo.com', 'ቢዝነስ ማኔጅመንት', 'ዲግሪ', 3.19, 'ጅማ ዩኒቨርሲቲ', '2008-06-11', 0, 0, 'የጉምሩክ አቤቱታ አጣሪ ዳይሬክቶሬት ዳይሬክተር', NULL, NULL, '2016-01-01', NULL, 'የንግድ ገቢ ዕቃ አወጣጥ አሰራርና ድጋፍ ዳይሬክተር', NULL, '2012-08-01', '2015-12-30', 'የለም', NULL, NULL, NULL, '2026-03-19 23:04:27', '2026-03-19 23:04:27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'EK-1089', 'ቅድስት ብርሃኑ መንገሻ', 'ሴክሬታሪ III', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ', '1989-03-12', '2015-12-01', 4, 10062.00, NULL, '2015-12-01', NULL, NULL, '', 'አዲስ አበባ', 'ቂርቆስ', 'ደንባል', NULL, '85', '962984565', NULL, 'ዳታ ቤዝ አድምንስትሬሽን', 'ደረጃ 4', NULL, 'ንፋስ ስልክ ፖሊቴክኒክ ኮሌጅ', '2010-10-22', 1, 0, 'ሰክሬተሪ III', NULL, NULL, '2015-12-01', NULL, 'የጽህፈና ቢሮ አስተዳደር ኦፊሰር', 'በአ/አ/ቅርቆስ/ከ/ከ/ወረዳ 09', '2010-08-15', '2011-02-28', 'የለም', NULL, NULL, NULL, '2026-03-19 23:08:29', '2026-03-19 23:08:29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 'ES-2006', 'ሸምሱ ሁሴን ሲጃ', 'የአቤቱታ የጥናትና ትንተና ዋና መሪ ባለሙያ', 'ወ', '11', 'ጉራጌ', 'ሙስሊም', '1976-01-01', '2006-01-11', 2, 56471.00, 16200.00, '2013-07-13', 24250.00, 'ሰ/1788925', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '945139103', NULL, 'ማርኬቲንግ ማኔጅመንት', 'ዲግሪ', 2.88, 'መቀሌ ዩኒቨርስቲ', NULL, 0, 1, 'የጉምሩክ አቤቱታ አጣሪ የአቤቱታ የጥናትና ትንተና ዋና መሪ ባለሙያ', NULL, NULL, '2013-07-13', NULL, 'ጊዜያዊ የፍተሻ ከ/ኦፊሰር', 'በስልጤ ዞን ሳንኩራ ወረዳ', '2000-01-01', '2001-12-30', 'የለም', NULL, NULL, NULL, '2026-03-19 23:09:38', '2026-03-19 23:09:38', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 'EE-74', 'እመቤት ኩምሳ ሰቦቃ', 'የአቤቱታ የጉምሩክ አሰራር ዋና መሪ ባለሙያ', 'ሴ', '11', 'ኦሮሞ', 'ኦርቶዶክስ', '1974-07-16', '1996-10-17', 2, 56471.00, 16200.00, NULL, 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '911669223', NULL, 'ማኔጅመንት', 'ዲግሪ', 2.60, 'ጅማ ዩኒቨርሲቲ', '2001-01-01', 0, 1, 'የአቤቱታ የጉምሩክ አሰራር ዋና መሪ ባለሙያ', NULL, NULL, '2013-11-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-19 23:10:01', '2026-03-19 23:10:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 'EA-268', 'አክሊሉ መብራቱ ገ/ጊዮርጊስ', 'የአቤቱታ የታሪፍ ምደባ ዋና መሪ ባለሙያ', 'ወ', '11', 'ትግራይ', 'ኦርቶዶክስ', '1974-09-21', '1999-01-02', 2, 56471.00, 16200.00, '2015-01-05', 24250.00, NULL, '', 'አዲስ አበባ', NULL, NULL, 'ወርቁ ሰፈር አካባቢ', NULL, '920738898', NULL, 'የመጀመሪያ ዲግሪ', 'ኢኮኖሚክስ', 2.66, 'ጎንደር ዩኒቨርስቲ', '2006-07-22', 0, 1, 'የአቤቱታ የታሪፍ ምደባ ዋና መሪ ባለሙያ', NULL, NULL, '2015-05-01', NULL, NULL, NULL, NULL, NULL, 'የለም', NULL, NULL, NULL, '2026-03-19 23:10:32', '2026-03-19 23:10:32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 'EA-4224', 'አየለች ወርቁ ላቀው', 'መልዕክት ሠራተኛ', 'ሴ', '1', 'አማራ', 'ኦርቶዶክስ', '1983-02-20', '2013-04-01', 4, 5866.00, NULL, '2016-10-25', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, '913788395', NULL, 'ቀለም', '8ኛ', NULL, NULL, NULL, 0, 0, 'ፅዳት ሠራተኛ', NULL, NULL, '2013-04-01', NULL, NULL, NULL, NULL, NULL, 'የለም', NULL, NULL, NULL, '2026-03-19 23:13:48', '2026-03-19 23:13:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 'EB-1063', 'በለጠ አርጋው ያዳሳ', 'የስትራቴጂክ ዕቅድ አፈፃፀም ክትትልና ግምገማ የስራ ሂደት አስተባበሪ', 'ወ', '11', 'ኦሮሞ', 'ኘሮቴስታንት', '1980-05-27', '2007-10-01', 2, 56471.00, 16200.00, '2016-03-20', 24250.00, NULL, '', 'ኦሮሚያ ልዩ ዞን', 'ሱልልታ', NULL, NULL, NULL, '910369571', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 2.72, 'አዲስ አበባ ዩኒቨርስቲ', '2002-11-15', 0, 1, 'የስትራቴጅክ ዕቅድ አፈፃፀም ክትትል የስራ ሂደት አስተባባሪ', NULL, NULL, '2016-03-20', NULL, 'እቅድ ክትትልና ግምገማ ባለሞያ', 'ዶደታ ወረዳ መንገዶች ጽ/ቤት', '2003-02-01', '2007-09-30', 'የለም', NULL, NULL, '2026-03-22 13:43:54', '2026-03-19 23:14:00', '2026-03-22 13:43:54', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'EA-560', 'መታሰቢያ ለገሰ ሲሳይ', 'የዕቅድ አፈጻጸም ክትትል ከፍተኛ ባለሙያ', 'ሴ', '8', 'አማራ', 'ኦርቶዶክስ', '1977-09-29', '2007-12-08', NULL, 21478.00, NULL, '2016-03-10', 1100.00, NULL, '', 'አዲስ አበባ', 'ኮልፌ ቀራኒዮ', '9', NULL, '1641', '913512310', 'metasebialegesse@gmail.com', 'ሴክሬታሪያል ሳይንስና ኦፊስ ማኔጅመንት', 'ዲፕሎማ', 2.09, 'ቅድስተ ማሪያም ኮሌጅ', '1997-11-30', 0, 1, 'የዕቅድ አፈጻጸም ክትትል ከፍተኛ ባለሙያ', NULL, NULL, '2016-03-10', NULL, 'ዳታ ኢንኮደር', 'ቅድስት ማሪያም ኦፕን የርቀት ትምህርት ኮሌጅ', '1999-12-22', '2004-06-25', NULL, 'አንድ እግር ላይ ጉዳት', NULL, NULL, '2026-03-19 23:14:33', '2026-03-19 23:14:33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 'EA-1564', 'አንተነህ ከበደ ታደሰ', 'የበጀት ዝግጅትና አስተዳደር የስራ ሂደት አስተባባሪ', 'ወ', '11', 'ኦሮሞ', 'ኦርቶዶክስ', '1976-12-26', '2005-06-20', 2, 56471.00, 16200.00, '2005-06-20', 24250.00, 'ሰ-177902', '', 'አርሲ', NULL, NULL, NULL, NULL, '910767893', NULL, 'ቢዝነስ ማኔጅመንት', 'ዲግሪ', 2.98, 'ጎንደር ዩኒቨርስቲ', '2000-11-18', 0, 1, 'የበጀት ዝግጅትና አስተዳደር የስራ ሂደት አስተባባሪ', NULL, NULL, '2012-08-01', NULL, 'ዕቅድ ክትትልና አገልግሎት ሪፖርት ከፍተኛ ኦፊሰር', 'በምስራቅ ሸዋ ዞን የሉሜ ወረዳ ገንዘብና ኢኮኖሚ ልማት ጽ/ቤት', '2001-02-25', '2005-06-19', 'የለም', NULL, NULL, NULL, '2026-03-19 23:15:00', '2026-03-19 23:15:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 'ET-1839', 'ትዕግስት አለሙ ደሴ', 'የበጀት ዝግጅትና አስተዳደር ከፍተኛ ባለሙያ', 'ሴ', '8', 'አማራ', 'ኦርቶዶክስ', '1974-04-22', '2009-01-04', NULL, 35116.00, 8000.00, '2013-11-15', 18620.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '0911786574', NULL, 'ፐብሊክ ፋይናንሺያል ማኔጅመንት', 'ዲግሪ', 2.28, 'የኢትዮጵያ ሲቪል ሰርቪስ ዩኒቨርስቲ', '2007-09-11', 1, 1, 'የበጀት ዝግጅትና አስተዳደር ከፍተኛ ባለሙያ', NULL, NULL, '2013-03-15', NULL, 'የቢሮ አገልግሎት አስተባባሪ', 'ወሊሶ ኢትዮጵያ ሆቴል', '2009-04-01', '2010-07-26', 'የለም', NULL, NULL, NULL, '2026-03-19 23:16:39', '2026-03-19 23:16:39', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 'EA-3449', 'አብዲሳ ዱፌራ ድቢ', 'የስትራቴጂ ፕላንና ፕሮጄክት አስተዳደር ዳይሬክተር', 'ወ', '14', 'ኦሮሞ', 'ፕሮቴስታንት', '1965-04-15', '2011-07-01', NULL, 73538.00, 27300.00, '2011-07-01', 28000.00, 'ሰ/7005482', '', 'ኦሮሚያ ልዩ ዞን', 'ሸገር ሲቲ', 'ሰበታ ቀበሌ 02', 'ቀበሌ08', NULL, '911868562', NULL, 'በንግድ ስራ ትምህርት መምህርነት', 'ዲግሪ', 2.78, 'አዲስ አበባ ዩኒቨርስቲ', '1988-05-11', 0, 0, 'የስትራቴጂ ፕላንና ፕሮጄክት አስተዳደር ዳይሬክቶሬት ዳይሬክተር', NULL, NULL, '2011-07-15', NULL, 'የታክስ አወሳሰን አሰባሰብ ክትትል ዳይሬክቶሬት ዳይሬክተር', 'የኦሮሚያ ገቢዎች ባለስልጣን', '2006-11-01', '2006-10-30', 'የለም', NULL, NULL, NULL, '2026-03-19 23:49:14', '2026-03-19 23:49:14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 'EA-58', 'አበባ ኪሮስ ፈቃደ', 'የስትራቴጂክ አጋርነት ዳይሬክተር', 'ሴ', '14', 'ትግሬ', 'ኦርቶዶክስ', '1962-10-30', '1987-07-01', NULL, 73538.00, 27300.00, '2012-10-01', 28000.00, 'ሰ/1774372', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '0911119975', 'abebaeh@gmail.com', 'አካውንቲንግ', 'ዲግሪ', 2.81, 'አስመራ ዩኒቨርሲቲ', '1982-07-11', 0, 1, 'የስትራቴጂክ አጋርነት ዳይሬክቶሬት ዳይሬክተር', NULL, NULL, '2012-10-01', NULL, 'የግዥና ፋይናንስ አስተዳደር ዳይሬክቶሬት', NULL, '2011-03-18', '2012-09-30', 'የለም', NULL, NULL, NULL, '2026-03-19 23:54:43', '2026-03-19 23:54:43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 'ES-1964', 'ሰብለ አቦነህ ፈለቀ', 'ሴክሬታሪ III', 'ሴ', '5', 'አማራ', 'ፕሮቴስታንት', '1982-03-27', '2011-11-01', NULL, 13148.00, NULL, '2011-11-01', NULL, NULL, '', 'አዲስ አበባ', 'የካ ክ/ከተማ', '5', NULL, '126', '0910519298', NULL, 'ሴክሬታሪ', 'ደረጃ 2', NULL, 'አድማስ ዩኒቨርሲቲ', '2017-03-26', 1, 0, 'ሴክሬታሪ III', NULL, NULL, '2011-07-01', NULL, 'ፀሐፊ', 'አሞለይታ አክሲዮን ማህበር', '2005-12-27', '2008-11-10', 'የለም', NULL, NULL, NULL, '2026-03-19 23:58:13', '2026-03-19 23:58:13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 'EA-4658', 'አልሀም መሀመድ ኢብራሂም', 'የመልዕክት ሠራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ሙስሊም', '1993-01-23', '2016-12-30', 1, 7375.00, NULL, '2016-12-30', 3600.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '983049810', NULL, 'ማርኬቲንግ ኦፕሬሽንስ ኮርዲኔሽን', 'ደረጃ 4', NULL, 'አድማስ ዩኒቨርሲቲ', '2013-04-10', 1, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, '2016-12-30', NULL, NULL, NULL, NULL, NULL, 'የለም', NULL, NULL, NULL, '2026-03-19 23:58:30', '2026-03-19 23:58:30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'EA-754', 'አብርሃም ጉደታ ሸዋቀና', 'የውጭ አገር አጋርነት የስራ ሂደት አስተባባሪ', 'ወ', '11', 'አማራ', 'ኦርቶዶክስ', '1982-06-02', '2003-06-01', 2, 56471.00, 16200.00, '2013-09-18', 24250.00, '1772479', '', 'አዲስ አበባ', 'ለሚ ኩራ ክ/ከተማ', '14', NULL, '59/44', '0913406966', 'abrishminjar@gmail.com', 'Governance & Development Studies', 'ዲግሪ', 3.20, NULL, '2010-06-10', 0, 1, 'የውጭ አገር አጋርነት የስራ ሂደት አስተባባሪ', NULL, NULL, '2013-09-18', NULL, 'የኮንትሮባንድ መከላከል ጀማሪ ኦፊሰር', NULL, '2003-06-01', '2004-06-02', 'የለም', NULL, NULL, NULL, '2026-03-19 23:58:44', '2026-03-19 23:58:44', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'EB-136', 'ብርሀኑ ኪዳኔ ገ/ሄር', 'የውጭ አገር አጋርነት መሪ ባለሙያ', 'ወ', '9', 'ትግራይ', 'ኦርቶዶክስ', '1979-09-01', '2002-03-16', 2, 40620.00, 9000.00, '2011-05-01', 20490.00, '1772711', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '920429537', NULL, 'ቢዝነስ ማኔጅመንት', 'ዲግሪ', 3.12, 'መቐሌ ዩኒቨርስቲ', '2001-11-11', 0, 1, 'የውጭ አገር አጋርነት መሪ ባለሙያ', NULL, NULL, '2011-05-01', NULL, 'የፍተሻ ጀማሪ ኦፊሰር', NULL, '2002-03-16', '2003-09-18', 'የለም', NULL, NULL, NULL, '2026-03-19 23:59:02', '2026-03-19 23:59:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'ES-1757', 'ሳምራዊት ሉሉ ዓለምነህ', 'የፕሮቶኮል ጉዳዮች ቡድን አስተባባሪ', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '1979-11-18', '2009-07-25', 3, 44780.00, 10600.00, '2011-05-01', 22370.00, '1826814', '', 'አዲስ አበባ', NULL, NULL, 'ሰሚት ኮንዶሚኒየም', '333/21', '0911859682', NULL, 'Ethiopian Language & Literature', 'ዲግሪ', 2.20, NULL, '2014-09-12', 0, 1, 'የፕሮቶኮል ጉዳዮች ቡድን አስተባባሪ', NULL, NULL, '2016-07-25', NULL, 'የፕሮቶኮል ከፍተኛ ባለሙያ', NULL, '2011-01-23', '2011-04-30', 'የለም', NULL, NULL, NULL, '2026-03-19 23:59:22', '2026-03-19 23:59:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'EE-1644', 'እታፈራው ተሾመ አለሙ', 'የፕሮቶኮል ከፍተኛ ባለሙያ', 'ሴ', '8', 'ኦሮሞ', 'ኦርቶዶክስ', '1985-02-10', '2015-09-19', 1, 33240.00, 8000.00, '2015-09-19', 18620.00, NULL, '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ', NULL, NULL, NULL, '920612701', NULL, 'ፖለቲካል ሳይንስና አለም አቀፍ ግንኙነት', 'ዲግሪ', 3.35, 'ድሬዳዋ ዩኒቨርሲቲ', '2018-07-12', 0, 1, 'ከፍተኛ የፕሮቶኮል ባለሙያ', NULL, NULL, '2015-09-19', NULL, 'የህዝብ ግንኙነት ኤክስፐርት', 'ንፋስ ስልክ ላፍቶ ክ/ከ/ወረዳ 12 አስተዳደር', '2009-06-01', '2011-10-30', 'የለም', NULL, NULL, NULL, '2026-03-19 23:59:36', '2026-03-19 23:59:36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'ET-41', 'ታምራት ኡባራ ዶሬ', 'የሀገር ውስጥ የጉምሩክ ስትራቴጂክ አጋርነት የስራ ሂደት', 'ወ', '11', 'ጋሞ', 'ፕሮቴስታንት', '1973-02-21', '2001-02-01', 2, 56471.00, 16200.00, '2015-09-01', 24250.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '0913155933', 'kaltu1973@gmail.com', 'ባይሎጂ', 'ዲግሪ', 2.79, 'ጅማ ዩኒቨርስቲ', '2013-07-04', 0, 1, 'የሀገር ውስጥ የጉምሩክ ስትራቴጂክ አጋርነት የስራ ሂደት አስተባባሪ', NULL, NULL, '2016-01-01', NULL, 'የህዝብ ግንኙነት ከፍተኛ ኦፊሰር', NULL, '2001-02-01', '2004-05-14', 'የለም', NULL, NULL, NULL, '2026-03-19 23:59:52', '2026-03-19 23:59:52', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'EM-1276', 'ምኒሊክ ጥላሁን ዓለሙ', 'መንግስታዊና መንግስታዊ ያልሆኑ ባለድርሻ አካላት አጋርነት መሪ ባለሙያ', 'ወ', '9', 'ጉራጌ', 'ኦርቶዶክስ', '1974-06-23', '2005-04-01', 2, 40620.00, 9000.00, '2011-05-01', 20490.00, 'ሰ/1771186', '', 'አዲስ አበባ', 'ልደታ', '5', 'ሰሚት ኮንዶሚኒየም', '17/B/15', '0912494540', 'meneliktilahun@gmail.com', 'ማናጅመንት', 'ዲግሪ', 3.33, 'ሀሮማያ ዩኒቨርሲቲ', '2008-07-12', 0, 1, 'መንግስታዊና መንግስታዊ ያልሆኑ ባለድርሻ አካላት አጋርነት መሪ ባለሙያ', NULL, NULL, '2011-05-01', NULL, 'የኤክስፐርት ድጋፍና ክትትል ከፍተኛ ኦፊሰር', NULL, '2005-04-01', '2010-07-26', 'የለም', NULL, NULL, NULL, '2026-03-20 00:00:11', '2026-03-20 00:00:11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'EM-22', 'ማንጠግቦሽ ከበደ አየለ', 'የሴቶች ህፃናትና ወጣቶች ጉዳይ ዳይሬክተር', 'ሴ', '14', 'ሽናሻ', 'ኦርቶዶክስ', '1967-08-23', '1995-01-24', 7, 73538.00, NULL, '2011-03-18', 28000.00, NULL, '', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሺገር ሲቲ', 'ኮዮፈጮ ኮንዶሚኒየም', '911860594', 'አማረኛ', NULL, 'ዲግሪ', '2.48', 0.00, '1989-10-28', '0000-00-00', 0, 0, '2011-03-18', NULL, NULL, NULL, '0000-00-00', 'የቤንሻንጉል ጉምዝ ክ/መ//የንግድ ትራንስፖርት ኢንዱስትሪና ኢንቨስትመንት ቢሮ', '1995-01-24', '1996-03-30', '0000-00-00', NULL, NULL, NULL, '2026-03-19 21:22:48', '2026-03-20 00:11:04', '2026-03-19 21:22:48', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'EM-3025', 'መብራት ናራሞ ጌታ', 'ሴክሬታሪ III', 'ሴ', '5', 'ወላይታ', 'ፕሮቴስታንት', '1984-01-15', '2011-10-27', 6, 11024.00, NULL, '2011-10-27', NULL, NULL, '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ', 'ሀና ማሪያም', '11', '951077704', 'ሴክሬታሪ ሳይንስ እና ኦፊስ ማኔ', NULL, 'ደረጃ 4', 'ባህርዳር ፖሊ ቴክኒክ ኮሌጅ', NULL, '2007-11-15', '0000-00-00', 0, 0, '2011-10-27', NULL, NULL, NULL, '0000-00-00', 'የቤንሻንጉል ጉምዝ ክ/መ/የንግድ ትራንስፖርት ኢንዱስትሪና ኢንቨስትመንት ቢሮ', '2008-06-04', '2010-05-20', '0000-00-00', NULL, NULL, NULL, '2026-03-19 21:20:22', '2026-03-20 00:16:15', '2026-03-19 21:20:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'EA-4766', 'አየለ አሰፋ ነጋሽ', 'የሰው ሀብት ስልጠናምልመላ ከፍተኛ ባለሙያ', 'ወ', NULL, NULL, 'Waaqeeffannaa', '1988-12-16', '2013-01-11', 1, 31900.00, 8000.00, '2018-02-27', 18620.00, '930003292', 'Single', 'Oromia', 'አርሲ ሮቤ', 'ሮቤ', NULL, NULL, '911753992', NULL, 'ሁማን ርሶርስ ሱፐርቪዥንብዝነስ አድምንስትሬሽን', 'Bachelor', 3.45, 'TVET አገንሲሰላሌ ዩኒቨርሲቲ', '2015-11-11', 1, 1, NULL, NULL, NULL, '2021-11-02', '2022-02-01', '1.ማጅመንት ት/ት/ ክፍል እና ማኔጂንግ ካውንስለር2.የጸረ ሙስና እና የስልጠና ክፍል ሃላፊ', NULL, '2023-01-01', '2025-12-10', NULL, NULL, NULL, NULL, '2026-03-21 13:41:31', '2026-04-17 22:48:45', NULL, NULL, 'uploads/employees/photos/1862759163557343.jpg', 'uploads/employees/documents/1776465612_employee-profile-EM-446.pdf', NULL, NULL, 'uploads/employees/fayda/1776466125_S050004 (1).pdf', NULL),
(49, 'ET-2633', 'አደም አህመድ በከር', 'የሶፍትዌር መሐንዲስ', 'ወ', '7', 'Oromo', 'ሙስሊም', '2002-04-04', '2025-09-10', 1, 20000.00, 100000.00, '2026-03-16', 14000.00, 'C-7022137', 'Married', 'Oromia', 'ምዕራብ ሃራርገ', 'ሸነን ዱጎ', 'ራሃ', '09670-8', '+251968292069', 'ademahmedbekr@gmail.com', 'የሶፍትዌር ምህንድስና', 'Bachelor', 3.17, 'Haramaya University', '2017-05-14', 1, 1, 'IT-Officer', NULL, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', '2018-04-01', NULL, 'IT-Officer', 'Oromia Development Association', '2018-09-01', '2018-03-30', 'nothing', 'None', NULL, NULL, '2026-03-23 17:37:09', '2026-05-16 20:47:11', NULL, NULL, 'uploads/employees/photos/1865373503265683.JPG', 'uploads/employees/documents/1778964431_11zon_merged-Files.pdf', '58640000000000000005', NULL, 'uploads/employees/fayda/1776464594_Fayda_Letter.pdf', NULL),
(50, 'EM-22', 'ማንጠግቦሽ ከበደ አየለ', 'የሴቶች ህፃናትና ወጣቶች ጉዳይ ዳይሬክተር', 'ሴ', '14', 'ሽናሻ', 'ኦርቶዶክስ', '1967-08-23', '1995-01-24', 7, 73538.00, 27300.00, '2011-03-18', 28000.00, NULL, 'Married', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሺገር ሲቲ', 'ኮዮፈጮ ኮንደሚኒየም', 'አዲስ', '911860594', 'ኢሜል', 'አማረኛ\r\nPsychology', 'ዲግሪ \r\nማስተርስ', 2.48, 'ኮተቤ መምህራን ትምህርት ኮሌጅ፣     \r\nአዲስ አበባ ዩኒቨርስቲ', '1989-10-28', 0, 0, 'በሴቶች ህጻናት ጉዳይ ዳይሬክቶሬት ዳይሬክተር', NULL, 'የቤ/ጌ/ክ/መ//የንግግድ ትራንስፖርት ኢንዱስቴና ኢንቨስትመንት ቢሮ\r\nቦና ፋልዱራ የመጀመሪያ ደ/ት/ቤት', NULL, NULL, '1. የህዝብ ግንኙነት ኦፊሰር \r\n2. የህዝብ ግንኙነት ኦፊሰር III\r\n3. በመምህርነት', '1.UNAIDS Ethiopia;        2.HIV/AIDS prevention and control office', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 'EM-22', 'ማንጠግቦሽ ከበደ አየለ', 'የሴቶች ህፃናትና ወጣቶች ጉዳይ ዳይሬክተር', 'ሴ', '14', 'ሽናሻ', 'ኦርቶዶክስ', '1967-08-23', '1995-01-24', 7, 73538.00, 27300.00, '2011-03-18', 28000.00, NULL, 'Married', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሺገር ሲቲ', 'ኮዮፈጮ ኮንደሚኒየም', 'አዲስ', '911860594', NULL, 'አማረኛ\r\nPsychology', 'ዲግሪ \r\nማስተርስ', 2.48, 'ኮተቤ መምህራን ትምህርት ኮሌጅ፣     \r\nአዲስ አበባ ዩኒቨርስቲ', '1989-10-28', 0, 0, 'በሴቶች ህጻናት ጉዳይ ዳይሬክቶሬት ዳይሬክተር', NULL, 'የቤ/ጌ/ክ/መ//የንግግድ ትራንስፖርት ኢንዱስቴና ኢንቨስትመንት ቢሮ\r\nቦና ፋልዱራ የመጀመሪያ ደ/ት/ቤት', '1995-01-24', NULL, '1. የህዝብ ግንኙነት ኦፊሰር \r\n2. የህዝብ ግንኙነት ኦፊሰር III\r\n3. በመምህርነት', '1.UNAIDS Ethiopia;        2.HIV/AIDS prevention and control office', '1993-10-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 'EM-3025', 'መብራት ናራሞ ጌታ', 'ሴክሬታሪ III', 'ሴ', '5', 'ወላይታ', 'ፕሮቴስታንት', '1984-01-15', '2011-10-27', 6, 11024.00, NULL, '2011-10-27', NULL, NULL, 'Married', 'አዲስ አበባ', 'ን/ስ/ላፍቶ', 'ሀና ማሪያም', '11', NULL, '951077704', NULL, 'ሴክሬታሪ ሳይንስ እና ኦፊስ ማኔጅመንት', 'ደረጃ 4', NULL, 'ባህርዳር ፖሊ ቴክኒክ ኮሌጅ', '2007-11-15', 1, 0, 'ሴክሬታሪ III', NULL, 'የቤ/ጌ/ክ/መ//የንግግድ ትራንስፖርት ኢንዱስቴና ኢንቨስትመንት ቢሮ\r\nቦና ፋልዱራ የመጀመሪያ ደ/ት/ቤትር', '2011-10-27', NULL, 'በፀሐፊነት\r\nበፀሐፊነት', '20/05/2010\r\n25/10/2011', '2008-06-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 'EG-1398', 'ገነት አስፋ ኃ/ስላሴ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'አማራ', 'ኦርቶዶክስ', '1987-07-14', '2013-02-07', NULL, 4760.00, NULL, NULL, NULL, NULL, 'Single', 'አዲስ አበባ', 'ጉለሌ', '1', NULL, NULL, '09 39 18 95 24', NULL, '1.P', 'ቀለም', 8.00, '30.77', NULL, 0, 0, 'የመልዕክት ሠራኛ', NULL, '1. እስከ አሁን ድረስ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 'ES- 1027', 'ሰብለ ከበደ በላይ', 'የሴቶችና ህፃናት ጉዳይ ድጋፍና ክትትል ቡድን አስተባባሪ', 'ሴ', '10', 'አማራ', 'ክርስቲያን', '1980-12-12', '2006-07-01', 2, 47468.00, 10600.00, '2012-08-01', 22370.00, 'ሰ/1786166', 'Single', 'አዲስ አበባ', 'የካ', 'ኮተቤ', '12', NULL, '913124967', NULL, 'ኘሮኪውርመንት እና ሰኘላይ ማኔጅመንት\r\nቢዝነስ አድሚኒስትሬሽን', 'ዲግሪ\r\nማስተርስ', 2.60, 'ጅግጅጋ ዩኒቨርስቲ\r\nሌድስታርስ', '2003-10-25', 0, 0, 'የሴቶችና  ህፃናት ጉዳይ  ድጋፍና ክትትል   ቡድን አስተባባሪ', NULL, NULL, '2006-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 'EF-448', 'ፌቨን ዮናስ ተሬሳ', 'የሴቶች ጉዳይ ድጋፍና ክትትል ከፍተኛ ባለሙያ', 'ሴ', '8', 'ኦሮሞ', 'ኦርቶዶክስ', '1983-05-05', '2006-08-20', 2, 35116.00, 8000.00, '2014-02-01', 18620.00, NULL, NULL, 'አ.አ', 'ን/ስ/ላፍቶ', '6', 'ቄራ መብራት\r\n ሀይል', NULL, '912632556', NULL, 'ስርዓተ-ፃታና ልማት', 'ዲግሪ', 3.21, 'ሀረማያ ዩኒቨርስቲ', '2005-10-29', 0, 0, 'የሴቶች ጉዳይ ድጋፍና ክትትል  ከ/ባለሙያ', NULL, NULL, '2006-08-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 'EA-1585', 'አየሉ ደምስ አዘነ', 'የሴቶች ጉዳይ ድጋፍና ክትትል ከፍተኛ ባለሙያ', 'ሴ', '8', 'አማራ', 'ኦርቶዶክስ', '1976-05-02', '2005-04-23', 1, 33240.00, 8000.00, '2013-03-28', 18620.00, NULL, 'Married', 'አ.አ', 'የካ ክ/ከ', 'ወ፡ 09', 'ኮተቤ መጠለያ ሰፈር', 'የቤ.ቁጥር፡ 1009', '0912 41 37 83', NULL, '1. Secretarial Science and office mgt\r\n2. አካዉንቲንግ\r\n3.', '1. Diploma\r\n\r\n2. ዲግሪ\r\n3.', 1.00, '1. ደሴ ቢዝነስና ስራ አመራር ኮሌጅ\r\n2. ሪፍት ቫሊ ዩኒቨርሲቲ', NULL, 1, 1, 'የሴቶች ጉዳይ ድጋፍና ክትትል ከፍተኛ ባለሙያ', NULL, '1.የኦሮሞ ዞን ንግድና ኢንዱስትሪ መም\r\nማህበራዊ ጉዳይ ጽ/ቤት', NULL, '2007-04-21', 'ሴክሬታሪ \r\nሴክሬታሪ ታየፒስት\r\nየፅህፈትና ቢሮ አስተዳደር ኦፊሰር\r\n\r\nየጽህፈና ቢሮ አስተዳደር ኦፊሰር\r\nኢክስኪዩቲቭ ሴክሬታሪ', '1. 30/10/1999\r\n2. 22/2/2001\r\n3. 26/5/2004\r\n4. 30/4/2005\r\n5. 22/4/2005', '1999-02-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 'EM-3599', 'መና ገነነ መንገስቱ', 'የጤና ባለሙያ', 'ሴ', '8', 'አማራ', 'ኦርቶዶክስ', '1982-10-05', '2013-10-25', 2, 35116.00, 8000.00, '2013-10-25', 18620.00, 'ሰ/45866231', 'Married', 'አዲስ አበባ', 'ን/ስ/ላፍቶ', '9', 'ሳሪስ', '570', '913218415', NULL, 'ፐብሊክ ሄልዝ\r\nፐብሊክ ሄልዝ', 'ዲግሪ\r\nማስተርስ', 2.65, 'ጎንደር ዩኒቨርስቲ\r\nዳግማዊ ሚኒሊክ ህክምናና ጤና ሳይንስ ኮሌጅ', '2006-10-25', 1, 0, 'የጤና ባለሙያ', NULL, 'በጋሞ ጎፋ ዞን የምዕራብ አባያ ወረዳ ጤና ጥ/ጽ/ቤት \r\nአማኑኤል የልማት ድርጅት\r\nቅዱስ ገብርኤል ካቶሊክ ጤና ጣቢያ', '2013-10-25', NULL, 'የጤና መኮንን ባለሙያ\r\nየጤና መኮንን\r\nየጤና መኮንን', '03/02/2010\r\n20/03/2012\r\n23/10/2013', '2007-03-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 'EN-492', 'ነፃነት አየለ ዋቆ', 'የሴቶች ጉዳይ ድጋፍና ክትትል ባለሙያ', 'ሴ', '7', 'ኦሮሞ', 'ፕሮቴስታንት', '1980-12-25', '2011-09-12', 1, 22845.00, 7000.00, '2015-09-17', 14860.00, NULL, 'Single', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሰንዳፋ', 'ሰንዳፋ በኬ 44 ማዞርያ', NULL, '904992363\r\n/091212..', NULL, 'ቢዝነስ ማኔጅመንት', 'ዲግሪ', 2.86, 'ሪፍት ቫሊ ዩኒቨርሲቲ', NULL, 1, 0, 'የሴቶች ጉዳይ ድጋፍና ክትትል ባለሙያ', NULL, '1.ሸነን ጊቤ ሆስፒታል፣               2.ኢትዮጵያ ጤና መድህን', '2011-12-09', NULL, '1.ሴክሬታሪ፣       \r\n2.ሴክሬታሪ፣          \r\n3.ኤክስክዩቲቭ ሴክሬታሪ', '1.30/05/2008፣ \r\n2.30/12/2010፣ \r\n3.11/09/2011', '2005-01-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 'EF-891', 'ፋጡማ ሙሀመድ በሽር', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ሙስሊም', '1967-04-12', '2012-02-03', 5, 10535.00, NULL, '2012-02-03', NULL, NULL, 'Married', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ወይኒቤት አካባቢ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '947381010', NULL, 'ሆም ሳይንስና ቴክኖሎጂ\r\n/የባልትና ሳይንስ', 'ዲኘሎማ', 1.92, 'አዲስ አበባ ዩኒቨርስቲ', '1984-11-23', 1, 0, 'የህፃናት ተንከባካቢ', NULL, 'በደቡብ ብ/ብ/ሕ/ክ/መ/ግ/ተ/ሀ/ል/ቢሮ\r\nንፋስ ስልክ ቴክኒክና ስልጠና ኤጀንሲ\r\nንፍስ ስልክ ላፍቶ ክለከተማ', '2012-03-02', NULL, 'በገጠር ሴቶች ጉዳይ ኤክስፐርትነት\r\nዲፖርትመንቶች፣በሾኘ \r\nአቴንዳንት የስራ መደብ', '30/06/1993\r\n17/08/2004', '1984-10-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 'EA-4222', 'አሰገደች ፍቃዱ ይመር', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1972-01-11', '2013-04-01', 1, 8758.00, NULL, '2015-11-01', NULL, '7020819', 'Single', 'አዲስ አበባ', 'ኮልፌ ቀራንዮ', '11', 'ኮልፌ', 'ኮልፌ', '910431769', NULL, 'አካውንቲግ እና በጀት ሰርቪስ', 'ደረጃ 4', NULL, 'ጌጅ ኮሌጅ', NULL, 1, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, '2013-01-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 'ES-1749', 'ሳባ ጥበበ የማነብርሃን/ጊ/ጽዳት', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1974-01-09', '2009-01-07', 1, 8758.00, NULL, '2014-10-18', NULL, '1823411', 'Single', 'አዲስ አበባ', 'ቦሌ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '912634643', NULL, 'ሂዉማን ሪሰርስ ሱፐርቪዥን', 'ደረጃ 4', NULL, 'ጌጂ ዩኒቨርሲቲ ኮሌጅ', '2014-12-21', 1, 0, 'የህፃነት ተንከበካቢ', NULL, 'የአዲስ አበባ ከተማ አስተዳደር ፖሊስ ኮሚሽን', '2009-01-07', NULL, 'የፅዳት ሠራተኛ', '01/08/2009 ዓ.ም', '2006-01-04', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 'EL-241', 'ለወግነሽ  ተስፋዬ ነጋ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1985-03-14', '2008-02-25', 1, 8758.00, NULL, '2014-10-18', NULL, '1809023', 'Single', 'አዲስ አበባ', 'የካ', 'ኮቶቤ', '10', NULL, '939596645', NULL, 'ሃርድዌር ኤንደ ኔትዉርክ ሰርቪሲንግ', 'ደረጃ 4', NULL, 'ጌጂ ዩኒቨርሲቲ ኮሌጅ', NULL, 1, 0, 'የህፃነት ተንከበካቢ', NULL, 'አዲስ አበባ ፖሊስ ኮሚሽን ምንድነው', '2008-02-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 'EM-3302', 'መአዛ ፀጋዬ ወ/ማሪያም', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦሮቴዶክስ', '1979-06-23', '2012-02-12', 1, 8758.00, NULL, '2014-10-18', NULL, NULL, 'Married', 'አዲስ አበባ', 'ቂርቆስ', '9', NULL, NULL, '910912813', NULL, 'ቢዝነስ እና ፋይናንስ', 'ደረጃ 3', NULL, 'ጌጅ ኮሌጅ', '2012-12-08', 1, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, 'ኔክሰስ ማታወቂያና ህትመት ስራ', '2012-12-02', NULL, 'በጥራዝ ክፍልና በፀሐፊነት', '40603', '2009-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 'EA-3447', 'አልማዝ ሽፈራው አብዶ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ ተዋህዶ', '1989-01-29', '2011-07-17', 1, 14245.00, NULL, '2016-05-13', 11110.00, NULL, 'Single', 'አዲስ አበባ', 'ቦሌ', '11', NULL, NULL, '913322806', NULL, '1.ኮንስትራክሽን ማኔጅመንት፤', '1.ዲፕሎማ፤', NULL, '39570', NULL, 1, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, '2014-02-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 'EM-2228', 'መሠረት በቀለ ሀ/ወልድ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1978-04-27', '2008-02-29', NULL, 8341.00, NULL, '2016-05-13', NULL, '1809035', 'Married', 'አዲስ አበባ', 'የካ', '16', 'ላምበረት', '399', '913191864', NULL, 'ቀለም', '12ኛ', NULL, 'ትም/ቢሮ', '1987-10-30', 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, '2008-02-29', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(67, 'EB-1351', 'ብርቄ መኮንን ዳዲ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ', '1983-10-19', '2009-07-01', NULL, 8341.00, NULL, '2016-05-13', NULL, NULL, 'Married', 'አዲስ አበባ', 'ቱሉዲምቱ', 'አርሲማ', 'ፎርም የማስሞላው', 'ፎርም የማስሞላው', '0911873242\r\n092443..', NULL, 'አይቲ ሳፖርት ሰርቪስ', 'ደረጃ 2', NULL, NULL, NULL, 1, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, 'ስልጡን ባለሙያ ኩባንያ/ኃ/የተ/የግል/', '2007-11-17', NULL, 'የጽዳት ሠራተኛ', '39993', '2007-11-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(68, 'EN-488', 'ነብያት ሀጂ ዋዶ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ', '1989-10-04', '2011-07-17', NULL, 8341.00, NULL, '2016-06-01', NULL, NULL, 'Married', 'አ.አ', 'ለገዳዲ ለገጣፎ', 'የካ ጣፎ', NULL, NULL, '926686611', NULL, 'ደረጃ 4', 'አካውንቲግ እና በጀት ሰርቪስ', NULL, 'ሪፍት ቫሊ ዩኒቨርስቲ', '2009-10-30', 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, '2011-07-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(69, 'EY- 1063', 'የላስታወርቅ ሙሉጌታ አለማየሁ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1983-04-01', '2011-08-02', 1, 14245.00, NULL, '2017-01-30', 11110.00, NULL, NULL, 'አዲስ አበባ', 'የካ ክ/ከተማ', '11', NULL, NULL, '09 55 99 37 36', NULL, '1.ቀለም\r\n2. አካውንቲንግ', '2. 10 \r\n3. ደረጃ 2', NULL, 'ጌጅ ዩኒቨርሲቲ ኮሌጅ', NULL, 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, 'ዮሴፍ መኮንን ፈርኒቸር፤ኮምፒውተር፤የፅህፈት መሳሪያና አደጋ መከላከያ ዕቃዎች ጅምላ ንግድ፤', '2011-02-08', '2014-07-17', 'ጉዳይ አስፈፃሚነት፤', 'እስከ የካቲት 20/2011 ዓ.ም', NULL, NULL, 'የደንበኞች አያያዝ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(70, 'ES-2136', 'ሰላማዊት ጌታቸው ገ/ኪዳን', 'የህፃናት ተቀባይ ሠራተኛ', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ', '1984-06-24', '2012-02-12', 1, 8758.00, NULL, '2014-10-18', NULL, NULL, 'Single', 'አዲስ አበባ', 'ቦሌ', 'ቦሌ', 'ቦሌ', 'ቦሌ', '917063563', NULL, 'አካውንቲንግ', 'ደረጃ 4', NULL, 'ሪፍት ቫሊ ኮሌጅ', NULL, 1, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, 'ቁልቢ መካከለኛ ኪሊንክ', '2012-12-02', NULL, 'በህሙማን አስተናጋጅነት እና በገንዘብ ያዥነት', '40529', '2010-06-01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(71, 'EE-1008', 'እመቤት ስዩም ገ/ህይወት', 'የምግብ ዝግጅትና ስርጭት', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1964-02-11', '2008-03-03', 1, 8758.00, NULL, '2014-03-10', NULL, NULL, NULL, 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '13', NULL, '333/12', '913573573', NULL, 'የምግብ ዝግጅት', 'ደረጃ 3', NULL, 'Catering &\r\n Tourism Trainig InsTitute', NULL, 1, 0, 'የህፃናት  ማቆያና  የምግብ  ዝግጅት', NULL, NULL, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(72, 'EH-1204', 'ሄርሜላ ዱባለ አስናቀ', 'የህፃናት  ማቆያ ማእከል ፅዳት  ሠራተኛ', 'ሴ', '2', 'አማራ', 'ኦርቶዶክስ', '1992-04-29', '2001-04-08', 1, 8875.00, NULL, '2015-12-08', 5480.00, NULL, 'Married', 'አዲስ አበባ', 'ጉለሌ', '4', NULL, NULL, '901/952298', NULL, 'ሃርድዌር ኤንደ ኔትዉርክ ሰርቪሲንግ', 'ደረጃ 4', NULL, 'ኢንጦጦ ፖሊ ቴክኒክ ኮሌጅ', NULL, 0, 0, 'የህፃነት ማቆያ ማዕከል ጽዳት ሠራተኛ', NULL, NULL, '2011-04-08', '2015-11-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(73, 'ET-2650', 'ጽጌረዳ ፈቃዱ ቢራቱ', 'የህፃናት  ማቆያ ማእከል ፅዳት  ሠራተኛ', 'ሴ', '2', 'ኦሮሞ', 'ኦርቶዶክስ', '1975-08-07', '2013-05-08', 1, 8875.00, NULL, '2015-12-08', 5480.00, NULL, 'Married', 'አዲስ አበባ', 'ቦሌ', '9', NULL, NULL, '939097029', NULL, 'ቀለም', '10ኛ', NULL, 'ትም/ቢሮ', NULL, 0, 0, 'የህፃነት ማቆያ ማዕከል ጽዳት ሠራተኛ', NULL, 'ጄቢ ኮንስትራክሽን ኃላ/የተ/የግ/ማህበር', '2013-05-08', '2015-11-08', 'ጽዳት ሠራተኛ', '14/03/2003 ዓ.ም', '2000-02-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(74, 'EM-1636', 'መቅደስ ዘውዱ ገብሬ', 'የህፃናት  ማቆያ ማእከል ፅዳት  ሠራተኛ', 'ሴ', '2', 'አማራ', 'ኦርቶዶክስ', '1968-03-12', '2006-07-26', NULL, 5295.00, NULL, '2013-08-01', NULL, 'ሰ/17638519', NULL, 'አዲስ አበባ', 'የካ', '2', NULL, '195', '901050930', NULL, 'ቀለም', '8ኛ', NULL, 'ትም/ቢሮ', '2006-10-30', 0, 0, 'የህፃናት ማቆያ ማዕከል ፅዳት ሠራተኛ', NULL, 'የመንግስት የልማት ድርጅቶች ባለአደራ ቦርድ', '2006-07-26', NULL, 'የጽዳት ሠራተኛ', '38713', '2001-05-19', NULL, 'በስራ ፈጠራ ዙሪያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(75, 'ED-216', 'ዳዊት ላቀው ታደሰ', 'የወጣቶች ጉዳይ ድጋፍና ክትትል ቡድን አስተባባሪ', 'ወ', '10', 'ኦሮሞ', 'ኦርቶዶክስ', '1979-03-06', '2003-06-01', 2, 47468.00, 10600.00, NULL, 22370.00, NULL, 'Married', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሸገር ሲቲ', 'ኮዬፈጨ ኮንዶሚኒየም', 'ኘሮጀክት 16', '913364263', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 2.81, 'ጅማ ዩኒቨርስቲ', '2002-10-10', 0, 0, 'የወጣቶች ጉዳይ  ድጋፍና  ክትትል  ቡድን  አስተባባሪ', NULL, NULL, '2003-01-06', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(76, 'EA-3921', 'አይናለም ልደቱ አያኖ', 'የወጣቶች ጉዳይ ክትትል ባለሙያ', 'ሴ', '7', 'ጉራጌ', 'ኦርቶዶክስ', '1989-09-02', '2012-02-03', 1, 22845.00, 7000.00, '2016-07-10', 22845.00, NULL, 'Single', 'አዲስ አበባ', 'የካ', '8', NULL, '310', '934464214', NULL, 'የህፃናት እንክብካቤ', 'ዲግሪ', 2.84, 'አምቦ ዩኒቨርስቲ', '2008-01-24', 0, 0, 'የወጣቶች ጉዳይ ክትትል ባለሙያ', NULL, NULL, '2012-03-02', '2014-09-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(77, 'ES-1921', 'ሰርካለም አበበ ዲጋ', 'ተቋማዊ ስጋት ሥራ አመራርና የሥነ-ምግባር ዳይሬክተር', 'ሴ', '14', 'የም', 'ኦርቶዶክስ', '1969-09-06', '0000-00-00', 7, 73538.00, 27300.00, '2012-09-15', 2800.00, '1372258', '', 'አዲስ አበባ', 'የካ ክ/ከተማ', 'ለሚ ኩራ', NULL, '33/10', '09 11 03 37 16', 'serk 3716@gmail.com', 'በህዝብ ተቋማት ፋይናንስ እና ሒሳብ አያያዝ \r\nፐብሊክ አድሜኒስትሬሽንና ዴቨሎፕመንት ማኔጅመንት', 'ዲፕሎማ \r\n ድግሪ', 2.85, 'ሲቪል ሰርቪስ ኮሌጁ \r\nዲላ ዩኒቨርሲቲ', '0000-00-00', 0, 1, 'የተቋማዊ ስጋት ስራ አመራርና የስነ-ምግባር ዳይሬክተፐሬት', NULL, 'የኮሚሽን የለውጥ አማካሪ\r\nየተቋማዊ ስጋት ስራ አመራርና የስነ-ምግባር ዳይሬክተር', '0000-00-00', '0000-00-00', '1. በየም ልዩ ወረዳ መስተዳድር ም/ቤት፤\r\n2. የም ልዩ ወረዳ ጤና ጥበቃ ጽ/ቤት፤ \r\n3.  በየም ልዩ ወረዳ ጤና ጥበቃ ጽ/ቤት፤\r\n4. በ የም ልዩ ወረዳ አቅም ግንባታ ጽ/ቤት፤\r\n5.  በየም ልዩ ወረዳ በፋ/ኢ/ል/ ጽ/ቤት፤\r\n6.  በየም ልዩ ወረዳ በፋ/ኢ/ል/ ጽ/ቤት፤\r\n7.  በየም ልዩ ወረዳ በፋ/ኢ/ል/ ጽ/ቤት፤\r\n8. በደቡብ ክልል ምክር ቤት፤\r\n9. ዲላ ዩኒቨርሲቲ፤\r\n10. በደቡብ ክልል ', '1. ፋይናንስ ስራና የሬድዮ ኦፕሬተር፤\r\n2. ገንዘብ ያዥ፤ \r\n3. የሒሳብ ሰራኛ፤ \r\n4. የሒሳብና በጀት ሰራተኛ፤\r\n 5. ክፍያ ሰራኛ፤ \r\n6. በፋ/ኢ/ል/ጽ/ቤት በሹመት በምክትል ኃላፊነት፤\r\n7. በፋ/ኢ/ል/ጽ/ቤት በኃላፊነት፤\r\n8. የግዢና ፋይ/ንብ/አስ/ደጋፊ የስራ ሂደት ባለቤትነት(በሹመት)፤\r\n9. ትምህርት ላይ፤\r\n10. በሰው ሀብት ስራ አመራር ደጋፊ የስራ ሂደት ፤\r\n11. በኦዲት ዳይሬክተ', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(78, 'ES-1916', 'ስመኝ አያል ምንውየለት', 'ሴክሬታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 6, 11024.00, NULL, '0000-00-00', NULL, '4188100', '', 'አዲስ አበባ', 'ጉለሌ ክ/ከ፣', 'ወረዳ 06፣', NULL, NULL, '0913 3616 94 /0945 5', 'simegn41@gmail.com', '1. Administration Office & Secretarial Technology', '1. Level IV', 1.00, '1.  ኒዉማን ኮሌጅ ደብረማርቆስ \r\n(Newman College)', '0000-00-00', 1, 0, 'ሴክሬተሪ III', NULL, '1. ሴክሬተሪ III -', '0000-00-00', '0000-00-00', '1. በደ/ብ/ብ/ሕ/ክ/መ በጉራጌ ዞን የገታ ወረዳ ፋይናንስና ኢኮኖሚ ል/ጽ/ቤት\r\n2. አ.አ ከተማ አስተዳደር የገቢዎች ማለስልጣን አ.አ ቁ-2 መካከለኛ ግ/ከ/ቅ/ጽ/ቤት\r\n3. የፌዴራል የከተሞች የሥራ ዕድል ፈጠራ እና የምግብ ዋስትና ኤጄንሲ', '1. ሴክሬተሪ /ታይፕስት\r\n\r\n2. ሴክሬተሪ I \r\n\r\n3. ኤክስዩቲቭ ሴክሬተሪ I', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(79, 'EA-4543', 'አክሱምጽዮን ደረጄ እሸቱ', 'የመልዕክት ሠራተኛ', 'ሴ', '1', 'አማራ', 'ኦርቶዶክስ', '1995-10-30', '2016-09-14', 1, 7375.00, NULL, '2015-09-14', 3600.00, NULL, '', 'አዲስ አበባ', 'የካ ክ/ከተማ', '12', 'የካ', 'የካ', '948293132', NULL, 'ቀለም', '8ኛ', NULL, 'ትም/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, 'የመልዕክት ሠራተኛ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(80, 'EG-667', 'ገለታ ማሞ ፈይሳ', 'ተቋማዊ ስጋት ሥራ አመራር ቡድን አስተባባሪ', 'ወ', '10', 'ኦሮሞ', 'ፐሮቴስታንት', '0000-00-00', '2006-08-20', 2, 44780.00, 10600.00, '2015-12-24', 22370.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, 'ፎርም የማስሞ', '909448549', NULL, 'ሶሾሎጅ እና ሶሻል አንትሮፖሎጅ', 'ዲግሪ', 3.25, 'ወለጋ ዩኒቨርስቲ', '0000-00-00', 0, 1, 'ተቋማዊ ስጋት ሥራ አመራር ቡድን አስተባባሪ', NULL, 'በፈታሽ ጀ/ኦፊሰር \r\nየመጋዘን ጀ/ኢንስፔክተር \r\nየመጋዘን ኢንስፔክተር \r\nየኮንትሮባንድ ክትትልና ፈታሽ ኦፊሰር \r\nበጉምሩክ ኦፊሰር /ፈታሽ/ \r\nየቀረጥና ታክስ ማጭበርበር ክትትል ባለሙያ \r\n\r\nበኩርሙክ መቆጣጠሪያ ጣቢያ የፍተሻ ባለሙያ \r\nየዕቃ ምርመራ ከ/ባለሙያ \r\nየኢንተለጀንስ ከፍተኛ ባለሙያ\r\n\r\nየሰነድ ምርመራ ከፍተኛ /ባለሙያ \r\nየድንገተኛ ፈታሽ ከፍተኛ ባለሙያ \r\nተቋማዊ  የስጋት ስራ አመ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(81, 'EE- 486', 'እየሩሳሌም ዘነበ ጉግሳ', 'ተቋማዊ ስጋት ሥራ አመራር መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '1977-01-29', '2004-08-01', 2, 40620.00, 9000.00, '2013-03-15', 20490.00, 'ሰ/1769955', '', 'አዲስ አበባ', 'የካ', '12', NULL, '688', '911724656', NULL, 'የጽህፈትና ቢሮ አያያዝ\r\nቢዝነስ ኢንፎርሜሽን ሲስተም\r\nከስተምስ አድሚኒስትሬሽን', 'ዲፕሎማ\r\nዲግሪ\r\nማስተርስ', 2.69, 'ቅድስተ  ማርያም ኮሌጅ\r\nአልፋ  ዩኒቨርስቲ ኮሌጅ\r\n ሲቪል  ሰርቪስ  ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የተቋማዊ ሥጋት ሥራ  አመራር መሪ ባለሙያ', NULL, 'የጽ/ቤት ረዳት\r\nየጉምሩክ ስጋት ትንተና ጀማሪ ኦፊሰር\r\nየጉምሩክ ስጋት ትንተና ኦፊሰር  \r\nበትምህርት ላይ\r\n\r\nየተቋማዊ ስጋት ስራ አመራር ከፍተኛ ባለሙያ\r\nየተቋማዊ ስጋት ስራ አመራር መሪ ባለሙያ', '0000-00-00', '0000-00-00', 'የፌደራል ከፍተኛ ፍርድ ቤት\r\nየፕራይቬታይዜሽንና የመንግስት የልማት ድርጅቶች \r\nተቆጣጣሪ  ኤጀንሲ', 'በኤሌክትሮኒክስ  ሪከርድ ክለርክነት /ፀሀፊነት/\r\nበሴክሬታሪ I', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(82, 'ET-1612', 'ተሊላ በቀለ ፈንታሌ', 'ተቋማዊ ስጋት ሥራ አመራር ከፍተኛ ባለሙያ', 'ወ', '8', 'ኦሮሞ', 'ኦርቶዶክስ', '1982-10-05', '2007-07-18', 2, 40620.00, 9000.00, '2016-03-01', 20490.00, NULL, '', 'ደብረ ዘይት', NULL, NULL, NULL, NULL, '932198827', NULL, 'ቢዝነስ \r\nማኔጅመንት', 'ዲግሪ', 3.10, 'ሪፍት ቫሊ ዩኒቨርስቲ', '2007-07-18', 0, 0, 'ተቋማዊ ስጋት ሥራ አመራር ከፍተኛ ባለሙያ', NULL, 'a ጊዜያዊ የጉምሩክ ረዳት ኦፊሰር I\r\na የስነ ምግባር መከታተያ ተጠ/ከፍ/ኦፊሰር\r\naጊ/የድንገተኛ ፍተሻ ኦፊሰር \r\naየኮንትሮባንድ ክትትል እና ፍተሻ ኦፊሰር\r\naየኮንትሮባንድ ክትትል እና ፍተሻ ከ/ኦፊሰር\r\naየትራንዚት ቁጥጥርና ፍተሻ ኦፊሰር\r\naየትራንዚት ክትትልና ቁጥጥር ከ/ኦፊሰር ጊዚያዊ \r\naየስነ ምግባር መከታተያ ቡድን አስተባባሪ                   \r\n aየትራንዚት ኢንስፔክተር\r\n', '0000-00-00', '0000-00-00', 'የኦሮሚያ የገጠር ልማት እና የአካባቢ ጥበቃ ቢሮ', 'aregisrrar survey(መዝጋቢ) ሠራተኛ\r\na land registration clerk', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(83, 'EM-3483', 'መኪያ አድነው ሸገሬ', 'ተቋማዊ ስጋት ሥራ አመራር ከፍተኛ ባለሙያ', 'ሴ', '8', 'ጉራጌ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, '2017-10-02', 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮፕሬቲቪቭ ቢዝነስ ማነጅመንት', 'ዲግሪ', NULL, 'ሀዋሳ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'ተቋማዊ ስጋት ሥራ አመራር ከፍተኛ ባለሙያ', NULL, 'የጉምሩክ ጀማሪ ባለሙያ (ፈታሽ)\r\nተቋማዊ ስጋት ስራ አመራርና የስነ-ምግባር መከታተያ ባለሙያ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(84, 'ET-264', 'ተወልደ ብርሃን ደሰታ', 'የሥነ-ምግባር ትምህርትና ሃብት ምዝገባ ቡድን አስተባባሪ', 'ወ', '10', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', '1. አ.አ\r\n\r\n2. አ.አ \r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n3. አ.አ', '1. አ.አ ን/ስ/ላፍቶ ክፍለ ከተማ\r\n\r\n2. አ.አ የካ ክፍለ ከተማ \r\n(ከእረፍት ቅጽ)\r\n3. ለመ ኩራ፣', '1. ….\r\n\r\n\r\n2. ….\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n3. 08', '1. …\r\n\r\n\r\n2. ….\r\n\r\n\r\n\r\n\r\n\r\n\r\n3. …', '1. …\r\n\r\n\r\n2. ….\r\n\r\n\r\n\r\n\r\n\r\n\r\n3. ….', '0914 72 19 22 (ከቅጽ ጡ', 'Tewoldebirhane00@gmail.com', '1. ኢኮኖሚክስ', 'ዲግሪ', 2.78, 'መቐለ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'ሥነ-ምግባር ትምህርትና ሀብት ምዝገባ ቡድን አስተባባሪ', NULL, '-የሰነድ ምርመራ ኦፊሰር\r\n-በጊዜያነት - የወጪ ዕቃዎች የሰነድ መረከቢያና ማረጋገጫ ጀ/ኦፊሰር፤ \r\n-የሰነድ መረከቢያና ማረጋገጫ ጀ/ኦፊሰር፤ \r\n-በጊዜያዊነት የሥነ-ምግባር መከታተያ ከ/ኦፊሰር -  /\r\n-የሥነ-ምግባር መከታተያ ከ/ኦፊሰር \r\n-የሥነ-ምግባር መከታተያ ቡድን አስተባባሪ \r\n-የሀብት ምዝገባና የሙስና ተጋላጭነት ጥናትና ክትትል ቡድን አስተባባሪ \r\n-የሥነ-ምግባር ትም/ትና ሀብት ምዝገባ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(85, 'EH-201', 'ሁሴን አህመድ አራጋው', 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ሙስሊም', '1974-10-06', '1999-02-01', 2, 40620.00, 9000.00, '2011-05-01', 20490.00, 'ሰ/1772021', '', 'አ.አ', NULL, NULL, NULL, NULL, '912186123', NULL, NULL, 'ዲግሪ', 2.23, 'ጎንደር ዩኒቨርስቲ', NULL, 0, 0, 'የሥነ-ምግባር  ትምህርትና የሃብት ምዝገባ  መሪ ባለሙያ', NULL, 'በኢንተለጀንስ  ሙያ\r\nየንግድ ማጭበርበር መረጃ ኦፊሰር III\r\nበኢንፎርስመንት\r\nየድንገተኛ ፍተሻ የስራ ሂደት አስተባባሪ\r\nየኢንተለጀንስ መረጃ ሰብሳቢ ከፍተኛ ኦፊሰር\r\nበጊዜያዊነት የሥነ-ምግባር መከታተያ ቡድን አስተባባሪ\r\nየሥነ-ምግባር መከታተያ ቡድነ አስተባባሪ\r\nየሥነ-ምግባር ግንዛቤ ሥርፀትና  የሃብት ምዝገባ ክትትል ከ/ኦፊሰር\r\nበጊዜያዊነት  የሥነ-ምግባር ትምህርትና ሥርፀት  መሪ ባለሙያ\r\nየሥ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(86, 'EG-1402', 'ጌታሁን ኃ/ማርያም ጆቴ', 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ መሪ  ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '1970-07-07', '2013-09-09', 1, 17374.00, NULL, '2017-02-18', 700.00, NULL, '', 'አዲስ አበባ', 'የካ', '11', 'ሉቄ', '12', '09 11 40 13 00', 'agetahun03@gmail.com', NULL, '1. ICT\r\n2. ኢንፎርሜሽን ሳይንስ\r\n3. በስነ- ሕዝብ ጥናት (ስነ-አካባቢ ልማት)', 1.00, '2.01', '0000-00-00', 0, 0, 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ መሪ  ባለሙያ', NULL, 'ጉዳይ አስፈፃሚ፤\r\nየትራንስፖርት ስምሪት ባለሙያ\r\nየሥነ-ምግባር ትምህርትና የሃብት ምዝገባ መሪ ባለሙያ', '0000-00-00', '0000-00-00', '1. አዲስ አበባ ፖሊስ\r\n 2. ፋርማሲዎች ማህበር\r\n3. አዲስ አበባ ዩኒቨርሲቲ', '1. የተለያዩ፤\r\n2. ሾፌር / ጉዳይ አስፈፃ፤\r\n3. ስልጠና ማማከር፤', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(87, 'EM-3697', 'መገርሳ አለማየሁ ብሩ', 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ ከፍተኛ ባለሙያ', 'ወ', '8', 'ኦሮሞ', 'ፕሮቴስታንት', '1986-09-21', '2012-11-15', 1, 33240.00, 8000.00, '2017-10-02', 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '936930020', NULL, 'Business MGT', 'ድግሪ', 9.99, 'wallega unv', '0000-00-00', 0, 1, 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ ከፍተኛ ባለሙያ', NULL, 'የፋይናንስ ጀ/ባለሙያ\r\nየጉምሩክ ጀ/ኦፊሰር/ፈታሽ/\r\nየፋይናንስ ጀ/ባለሙያ/ጀ/አካውንታት/', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(88, 'EB-1720', 'ብሩክታይት ደሳለኝ ጌታቸው', 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ ከፍተኛ ባለሙያ', 'ሴ', '8', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', NULL, 14872.00, NULL, '2017-10-02', 18620.00, 'ሰ/7011220', '', 'አዲስ አበባ', 'ቦሌ', 'ሀያት', 'ፀበል', '18', '09 31 68 11 38', NULL, 'አካውንቲንግ', 'ድግሪ', 3.41, 'ኦሮሚያ እስቴት ዩኒቨርሲቲ', '0000-00-00', 0, 1, 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ ከፍተኛ ባለሙያ', NULL, '1. የመልዕክት ሰራተኛ፤\r\n2. ጀማሪ አካውንታንት፤\r\n3. አካውንታት\r\n4. የስነ ምግባር ትምህርትና ሀብት ምዝገባ ከፍተኛ ባለሙያ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(89, 'ET-2724', 'ጤናዬ ተካልኝ ጎበና', 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ ባለሙያ', 'ሴ', '7', 'ሀድያ', 'ኦርቶዶክስ', '1905-06-12', '2015-06-04', 1, 22845.00, 7000.00, '2017-10-02', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'INTERNATIONAL TRADE &INVESTMENT MANAGEMENT', 'BA', 3.54, 'ARSI UNIVRSITY', '0000-00-00', 0, 0, 'የሥነ-ምግባር ትምህርትና የሃብት ምዝገባ ባለሙያ', NULL, 'የኮንትሮባንድ መከላከልና ፍተሻ ጀ/ባለሙያ\r\nየስነ ምግባር ትምህርትናሀብት ምዝገባ ባለሙያ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(90, 'ET-976', 'ተገኘ ፈንቴ ንጋት', 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ ቡድን አስተባባሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '1982-11-21', '2006-01-23', 2, 47468.00, 10600.00, '2013-03-15', 22370.00, 'ሰ/1785531', '', 'አ.አ', 'የካ', '9', NULL, NULL, '921281571', NULL, 'ዲግሪ', '3.26', NULL, NULL, NULL, 0, 1, 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ ቡድን አስተባባሪ', NULL, 'የፍተሻ ጀ/ኦፊሰር\r\nጊ/የፋይናንስ ጀ/አካውንታንት\r\nየስነ-ምግባር መከታተያ ተጠባባቂ ከ/ኦፊሰር\r\nየስነ-ምግባር መከታተያ ከ/ኦፊሰር\r\nየስነ-ምግባር ጉዳዮች ምርመራና ጥቆማ ከ/ባለሙያ\r\nየስነ-ምግባር ጉዳዮች ምርመራና ጥቆማ መሪ ባለሙያ\r\nየሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ ቡድን አስተባባሪ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, 'በመንግስት ፖሊሲዎችና ስትራቴጂዎች፣በተቋሙ የማቋቋሚያ\r\nአዋጆች፣ በታክስና በቀረጥ ህጎች፣ደንቦችና መመሪያዎች፣በመሠረታዊ\r\nየሥራ ሂደት ለውጥ ጥናት ውጤቶች፣በተቋሙ ሠራተኛ አስተዳደር ደንብ እና በሥነ-ምግባር መመሪያ\r\nበሙስና መከላከል ስትራቴጂዎች\r\nክንፈ የብሄራዊ ደህንነት ጥናት ኢንስቲትዩት\r\nበተቋም አቀፍ ስጋት ስራ አመራር ዙሪያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(91, 'EA-3626', 'አበባየሁ ጫሊ አያና', 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ፕሮቴስታንት', '1987-02-08', '2011-01-10', NULL, 38660.00, 9000.00, '2017-10-02', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accounting & Fainance', 'ድግሪ', 2.46, 'ጂግጂጋ ዩኒቨርሲቲ', '0000-00-00', 0, 1, 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ መሪ ባለሙያ', NULL, '1.የፋይናስ ጀማሪ ኦፊሰር\r\n2.የውርስ መጋዘን አስተዳደር ጀ/ባለሙያ     \r\n3.የጉምሩክ ጀማሪ ኦፊሰር(ፈታሽ)          \r\n4.የውርስ መጋዘን አስተዳደር ጀማረ ባለሙያ\r\n5.የውርስ መጋዘን አስተዳደር ከ/ባለሙያ', '0000-00-00', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(92, 'ET-2370', 'ተመስገን ቶሎሳ እዳአ', 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', NULL, '1987-04-04', NULL, 1, 38660.00, 9000.00, '2017-10-02', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ሎጀስቲክስ እና ሰፕላይ ቸይን ማኔጅመንት', 'ድግሪ', 3.44, 'አምቦ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ መሪ ባለሙያ', NULL, 'የድህረ-ዕቃ አወጣጥ ኦዲትና ምስል ትንተና ጀ/ባለሙያ የጉምሩክ ጀማሪ ኦፊሰር/ፈታሽ/\r\nየጉምሩክ ኦፊሰር/ፈታሽ/\r\nየሰነድ ምርመራ ባለሙያ \r\nየኮንትሮባንድ መከላከልና ፍተሻ ባለሙያ \r\nየዕቃ ምርመራ ባለሙያ \r\nየዕቃ ምርመራ ከፍተኛ ባለሙያ\r\nየሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ መሪ ባለሙያ', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(93, 'EE-1696', 'ኢብራሂም ተሰማ ቡካ', 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ መሪ ባለሙያ', 'ወ', '9', 'ጉራጌ', 'ሙስሊም', '1984-06-23', '2007-02-21', 1, 38660.00, 9000.00, '2017-10-02', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'cooperatives (business management)', 'ድግሪ', 2.76, 'ሃረማያ ዩኒቨርሲቲ', '2006-03-11', 0, 0, 'የሥነ-ምግባር ጉዳዮች ጥቆማና ምርመራ መሪ ባለሙያ', NULL, 'ጀማሪ እንስፔክተር\r\n የመጋዘን እንስፔክተር\r\nየጉምሩክ ፈታሽ \r\nየእቃ ምርመራ ባለሙያ\r\n የሰነድ ምርመራ ባለሙያ\r\nየተባባሪዎች ምልመላና ስልጠና ባለሙያ\r\nየኢንተለጀንስ ከ/ኦፊሰር\r\nየኢንተለጀንስ መረጃ አሰባሰብና ትንተና ከፍተኛ ባለሙያ', '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(95, 'EY-135', 'ዮሐንስ መለሰ ወ/የሱስ', 'የውስጥ ኦዲት ዳይሬክተር', 'ወ', '14', 'ትግሬ', 'ኦርቶዶክስ', '1959-04-21', '1996-11-19', 7, 73538.00, 27300.00, '2011-03-18', 28000.00, 'ሰ/290000', '', 'አዲስ አበባ', 'ቂርቆስ', '7', NULL, NULL, '947342547', 'yohmeles@yahoo.com', 'ህግ\r\nፖለቲካል ሳይንስና አለም አቀፍ ግንኙነት\r\nEconomics & International Finance', 'ዲፕሎማ\r\nዲግሪ\r\nማስተርስ', 3.55, 'መቀሌ ዩኒቨርስቲ ኮሌጅ\r\nአዲስ አበባ ዩኒቨርስቲ\r\nuniveristy Of Rome Tor Vergata', '0000-00-00', 0, 0, 'የውስጥ ኦዲት ዳይሬክቶሬት ዳይሬክተር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(96, 'EG-1505', 'ገላኔ አለማየሁ ረጋሳ', 'ሴክሬታሪ III', 'ሴ', '5', 'ኦሮሞ', NULL, NULL, '1996-12-29', 0, 8341.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(97, 'ET-2896', 'ትዕግስት ቶሌራ አጅራ', 'መልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1997-05-14', '2016-06-25', 0, 4760.00, NULL, '2016-06-25', NULL, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '925496222', NULL, 'አግሪካልቸር ኢኮኖሚክስ', 'ዲግሪ', 2.59, 'ቦንጋ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'መልዕክት ሰራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(98, 'EA-689', 'አሰራት ቢተው ይመር', 'የፋይናንስና የክዋኔ የውስጥ ኦዲት ቡድን', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '1980-01-18', '2003-06-01', 8, 47468.00, 10600.00, '2011-04-24', 22370.00, '1770655', '', 'አዲስ አበባ', 'ን/ስ/ላፍቶ', '6', NULL, '853/ሀ', '913365135', NULL, 'አካውንቲንግ', 'ዲግሪ', 3.30, 'አዳማ  ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የፋይናንስና የክዋኔ የውስጥ ኦዲት ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(99, 'EA-2928', 'አይናለም ግርማ ተፈራ', 'የፋይናንስና የክዋኔ የውስጥ ኦዲት ቡድን', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '2016-07-10', 22370.00, '1818911', '', 'አዲስ አበባ', 'ለሚ ኩራ', '3', NULL, 'B121601', '916073335', 'አልተሞላም', 'ዲፕሎማ   ዲግሪ', 'ሂሳብ አያየዝ                        አካዉንቲንግና ፋይናንስ', 2.00, 'አልፋ የርቀት ከፍተኛ ት/ተቋም               ሀዋሳ ዩንቨርሲቲ', '0000-00-00', NULL, NULL, 'የፋይናንስና የክዋኔ የውስጥ ኦዲት ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(100, 'ES-1203', 'ሲፈን ዳዲ አበበ', 'የውስጥ ኦዲት ከፍተኛ ኦዲተር II', 'ሴ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '1983-12-12', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አ.አ', 'ን/ስ/ላፍቶ', '12', NULL, NULL, '922459502', 'Sifandadii@gmail.com', 'ማኔጅመንት', 'ዲግሪ', 2.73, 'መደወላቡ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'ከፍተኛ ኦዲተር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` (`id`, `file_number`, `employee_name`, `job_title`, `gender`, `job_level`, `ethnicity`, `religion`, `date_of_birth`, `hire_date`, `step`, `salary`, `allowance`, `assignment_date`, `housing_allowance`, `pension_id`, `marital_status`, `region`, `zone`, `district`, `specific_location`, `house_number`, `phone_number`, `email`, `education_type`, `education_level`, `cgpa`, `institution`, `graduation_date`, `coc_certificate`, `higher_ed_verified`, `current_job_title`, `level_dup`, `current_institution`, `experience_from`, `experience_to`, `previous_job_title`, `previous_institution`, `previous_from`, `previous_to`, `diagnosis`, `disability_type`, `column_40`, `deleted_at`, `created_at`, `updated_at`, `years_of_service`, `age`, `photo`, `document`, `fan_number`, `department_id`, `fayda`, `branch_id`) VALUES
(101, 'EE-634', 'እከንየለሽ አበራ ሞላ', 'የውስጥ ኦዲት ከፍተኛ ኦዲተር II', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '1983-04-05', '2006-01-23', 1, 38660.00, 9000.00, '2010-06-01', 20490.00, '1786640', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '0970948681\r\n09203195', NULL, 'አካውንቲንግ\r\nዲቨሎኘመንት ማኔጅመንት', 'ዲግሪ\r\n2ኛ ዲግሪ', 3.16, 'መደወላቦ ዩኒቨርስቲ\r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የውስጥ ኦዲት ከፍተኛ ኦዲተር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(102, 'ET-405', 'ትርሃስ ተ/ሃይማኖት ሕሉፍ', 'የውስጥ ኦዲት ከፍተኛ ኦዲተር II', 'ሴ', '9', 'ትግራይ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '0910 18 46 27', 'Tirhastek2020@gmail.com', '1. ኢኮኖሚክስ\r\n\r\n2. Business Administration', '1. ቢ.ኤ ዲግሪ\r\n\r\n2. ማስተርስ', 1.00, '1. መቀሌ ዩኒቨርሲቲ\r\n\r\n2. አድማስ ዩኒቨርሲቲ', '0000-00-00', 0, 1, 'የዉስጥ ኦዲት ከ/ኦዲተር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(103, 'EM-165', 'መንግስትአብ ተክሉ በላይ', 'የመረጃ ቴክኖሎጂ  ኦዲት ቡድን አስተባባሪ', 'ወ', '11', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 56471.00, 28200.00, NULL, 24250.00, 'ሰ/780807', '', '1. ክልል 14 (ከስራ ማመልከቻ)\r\n\r\n2. አ.አ', '1. አ.አ\r\n\r\n2. ን/ስልክ ላፍቶ', '1. ወረዳ 4፣ \r\n\r\n2. 01', '1. ዞን 1፣  ቀበሌ፡ 40\r\n2.  …', '1. 118\r\n\r\n2. B049/29', '1. 75 31 65\r\n\r\n2. 09', 'meng_teklu@yahoo.com', 'ኢስታቲክስ', 'ቢ.ኤ ዲግሪ', 2.76, 'አ.አ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የመረጃ ቴክኖሎጂ ኦዲት ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(104, 'EB-1430', 'ባንቺየሁ ተናኘ ገደፋው', 'የመረጃ ቴክኖሎጂ ከፍተኛ ኦዲተር II', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '1976-03-24', '0000-00-00', 2, 40620.00, 9000.00, '2013-03-15', 20490.00, 'ሰ/1777179', '', 'ኦሮሚያ', 'ቢሾፍቱ', 'አደዳ', '02 ቀበሌ', NULL, '09 11 78 19 38\r\n09 1', 'banchayehut@gmail.com', '1. ኢንፎርሜሽን ቴክኖሎጂ\r\n2. Computer Science', '1. ዲፕሎማ\r\n2. ድግሪ', 3.04, '1. ባህር ዳር ቴክኒክና ሙያ \r\n2. ሪፍት ቫሊ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የመረጃ ቴክኖሎጂ ከ/ኦዲተርII', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(105, 'EW-704', 'ወርቄ ያቤልነህ ተገኝ', 'የኦዲት ግኝት ክትትልና ሪፖርት ዝግጅት ቡድን አስተባባሪ', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '1961-12-12', '2011-10-03', 2, 47468.00, 10600.00, '2015-09-28', 22370.00, 'ሰ/735915', '', 'አዲስ አበባ', 'ጉለሌ', NULL, NULL, NULL, '911914756', 'tenetwy@gmail.com', 'አካውንቲግን እና ፋይናንስ', 'ማስተርስ', NULL, 'July 16,1990', '0000-00-00', 0, 0, 'የኦዲት ግኝት ክትትልና ሪፖርት ዝግጅት ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(106, 'EF-47', 'ፍቅረስላሴ ዝናቡ ታደሰ', 'የኦዲት ግኝት ክትትልና ሪፖርት ዝግጅት ከፍተኛ ኦዲተር II', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '2015-05-01', 20490.00, NULL, '', 'አዲስ አበባ', 'ቂሊንጦ', 'ኮንዶሚኒየም', 'ቂሊንጦ ኮንዶሚኒየም', 'ቂሊንጦ', '911481799', NULL, 'ከስተምስ አድሚኒስትሬሽን \r\nቢዝነስ ማኔጅመንት\r\nሶፍትዌር ኢንጅነሪንግ\r\n.', 'ማስተርስ\r\nዲግሪ\r\nዲፕሎማ', 3.65, 'ሲቪል ሰርቪስ\r\nሪፍት ባሊ\r\nሜትሮሊንክ ቴክኖሎጀ ኮሌጅ', '0000-00-00', 0, 0, 'የኦዲት ግኝት ክትትልና ሪፖርት ዝግጅት ከፍተኛ ኦዲተር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(107, 'ED-891', 'ደረጀ ጉልላት ኃይሉ', 'የኦዲት ግኝት ክትትልና ሪፖርት ዝግጅት ከፍተኛ ኦዲተር II', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '2011-08-28', 20490.00, 'ሰ/1703684', '', 'አዲስ አበባ', NULL, NULL, 'ፈረንሳይ ለጋሲዮን', NULL, '09 09 58 23 49\r\n09 1', 'derejehailu 1975@gmail.com', 'Accounting', 'ድግሪ', 2.64, 'አልፋ ዩኒቨርሲቲ ኮሌጅ', '0000-00-00', NULL, NULL, 'ከፍተኛ የውስጥ ኦዲት II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(108, 'ET-2897', 'ትዕግስት ጉርሙ ቢፋ', 'ከፍተኛ ሴክሬታሪ', 'ሴ', '6', 'ኦሮሞ', '***', '0000-00-00', '2017-06-06', NULL, 16780.00, 6000.00, '2017-06-06', 12990.00, '***', '', '****', '****', '****', '****', '****', '09 11 03 99 36', '***', 'ቢሮ አስተዳደርና የፅህፈት ሙያ\r\nከፍተኛ ሴክሬታሪ', 'ዲፕሎማ', 2.70, 'ሮያል ኮሌጅ', '0000-00-00', 0, 0, 'ከፍተኛ ሴክሬታሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(109, 'EZ-800', 'ዝናሽ ተከተል ተናኜ', 'የመልዕክት ሠራተኛ', 'ሴ', '2', 'አማራ', NULL, NULL, '2017-01-06', 1, 8875.00, NULL, '2017-01-06', 5480.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(110, 'EH-1559', 'ሄርሜላ አለማየሁ ተሾመ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1997-08-12', '2016-06-26', 0, 4760.00, NULL, '2016-06-26', 0.00, '……', '', 'አዲስ አበባ', NULL, NULL, NULL, '596/17', '968134154', NULL, 'ቀለም', '8ኛ', 0.00, '…', '0000-00-00', 0, 0, 'የመልዕክት ሰራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(111, 'ES-693', 'ሰውአገኝ  ጤናው ወንድም', 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', 'ወ', '14', 'አማራ', 'ኦርቶዶክስ', '1964-03-15', '2004-12-17', 2, 73122.00, 40300.00, '2016-04-18', 28000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግ\r\nኮምፒውተር ሳይንስ\r\nኢንፎርሜሽን ሳይንስ', 'ዲኘሎማ\r\nዲግሪ\r\nማስተርስ', 0.00, 'አዲስ አበባ ንግድ ስራ ኮሌጅ \r\nኔው ጀነሬሽን ዩኒቨርስቲ\r\nአዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(112, 'EF-809', 'ፈንታዬ ሀይሉ ዳምጤ', 'ሴክረታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1987-04-12', '0000-00-00', 2, 15428.00, NULL, '0000-00-00', 11110.00, 'C-7014399', '', 'አዲ አበባ', NULL, NULL, 'ቀጨኔ መድሃኒያለም', NULL, '09 63 57 70 14', NULL, '1. የቢሮ አስተዳደርና ሴክሬተሪያል  ቴክኖሎጂ', '1. ደረጃ 4', NULL, NULL, '0000-00-00', NULL, NULL, 'ሴክሬተሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(113, 'EE-1697', 'ኤደን ጌቱ ሀይሉ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-11-19', '2016-06-15', 1, 7375.00, NULL, '2016-06-15', 3600.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ወረዳ 05', NULL, NULL, '947389180', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(114, 'ED-1242', 'ድሪባ ቀነዓ ቱፋ', 'የሶፍትዌር ልማት ቡድን', 'ወ', '11', 'ኦሮሞ', '………', '1980-04-02', '0000-00-00', 0, 20784.00, NULL, '2017-06-06', 24250.00, '…….', '', 'አኦሮሞ', 'ም/ወለጋ', '………', '………..', '………..', '910312209', '………..', 'ኮምፒውተ ሳይንስ\r\nፕሮጀክት ማናጅመንት', 'ዲግሪ\r\nማስተርስ', 2.55, 'ጅማ ዩኒቨርሲቲ\r\nሉናር ኢንተርናሽናል ኮሌጅ', '0000-00-00', NULL, 0, 'የሶፍትዌር ልማት ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(115, 'ES-1526', 'ሽብሬ ግርማ ወርቅነህ', 'የሶፍትዌር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'አማራ', NULL, '1986-06-20', '2008-03-15', 1, 44780.00, 21600.00, '2017-05-01', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.94, NULL, NULL, NULL, NULL, 'የሶፍትዌር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(118, 'EM-3848', 'ሙባይን አንዴግባ ሽክረቶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ስልጤ', 'ሙስሊም', '1992-01-02', '2016-05-02', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ፎርም የማስሞላ', NULL, NULL, NULL, NULL, '939209096', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.13, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(119, 'EM-3849', 'መሀመድ ከድር አብዶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '1993-07-29', '2016-05-08', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ኦሮሚያ ክልል', 'ሰበታ', NULL, NULL, NULL, '985212534', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.36, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(120, 'EE-1693', 'ኤልያስ ደጀኔ አለሙ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ክርስቲያን', NULL, '2016-05-02', 1, 22845.00, 8000.00, '2016-05-02', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '9016686987', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.73, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(121, 'EY-588', 'ያሬድ ተ/ዮሐንስ አርጋው', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ጉራጌ', 'ኘሮቴስታንት', '0000-00-00', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ጦርሀይሎች', '6', 'ጎመን ሰፈር', '1068', '09 43 10 24 82', NULL, 'Computer Science', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(122, 'EA-4624', 'አንዱአለም ሰብስቤ ወንድአፍራሽ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1994-08-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '972396668', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.61, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(123, 'EB-2010', 'በፀሎት ታደለ አባተ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1993-08-05', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', '***', '***', '***', '***', '***', '09 16 89 30 00', NULL, 'Computer Science', 'ድግሪ', 2.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(124, 'ED-1228', 'ዳግማዊ ደጀኔ ደንበል', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ጉራጌ', 'ኦርቶዶክስ', '1993-03-14', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', '***', '***', '***', '***', '09 19 36 37 50', NULL, 'Computer Science', 'ድግሪ', 3.75, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(125, 'EC-129', 'ጫላ ጌታ ተፈረ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1990-11-01', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, NULL, NULL, 'ቡራዩ', 'ሆሮጉድሩ', 'ሆሮ', NULL, NULL, '95535010', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.86, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(126, 'EM-3842', 'ሚካኤል ገ/ጊዮርጊስ መርጋ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-12-02', '2016-04-01', 1, 24845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ኮልፌ', '***', '***', '***', '09 94 39 8 91', NULL, 'Computer Science', 'ድግሪ', 3.54, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(127, 'EB-2013', 'ብስራት ደረጀ ተስፋዬ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1992-06-21', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', '***', '***', '***', '***', '***', '09 49 71 85 07', NULL, 'Computer Science', 'ድግሪ', 3.10, 'አምቦ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(128, 'ED-1232', 'ድሪባ አድማሱ ቶሎሳ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1991-10-28', '2016-05-07', 1, 22845.00, 8000.00, '2016-05-27', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '930502190', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.54, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(129, 'EZ-753', 'ዘካሪያስ ሰብስብ በላይ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1993-01-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, 'አዲስ አበባ', 'የካ', '2', NULL, NULL, '941246063', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.27, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(130, 'ES-2459', 'ሰለሞን በላይ ባሳዝነው', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1992-06-08', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919608182', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ድግሪ', 3.67, 'ጎንደር ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(131, 'ER-149', 'ሮቢአም ሰለሞን ገብረፃዲቅ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, '158912\r\n1773394', '', 'አዲስ አበባ', 'ቦሌ', '10', '10', '3170', '09 53 42 48 53', 'sRobiam@gmail.com', 'ኮምፒውተር ሳይንስ \r\nቢዝነስ ማናጅመንት', 'ዲፕሎማ\r\nድግሪ', 2.99, '1.የካቲት 13/1996 ዓ.ም\r\n2. መስከረም 20/2012 ዓ.ም', '0000-00-00', 0, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(132, 'ET-2898', 'ትህትና ዻውሎስ በሎታ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ጐፋ', NULL, '0000-00-00', '2017-06-06', NULL, 50540.00, 28200.00, '0000-00-00', 24250.00, 'ሰ/1971449', '', 'ደቡብ', 'በጋሞ ጎፋ', NULL, NULL, NULL, '916135906', NULL, 'በኮምፒዩተር ሳይንስ እና ኢንፎ. ቴክኖሎጂ', 'ዲግሪ', 2.60, 'አርባምንጭ ዩኒሸርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማት ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(133, 'EJ-114', 'ጅሬኛ ሶሪ ደሳ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', NULL, '0000-00-00', '2020-04-12', 2, 53011.00, 280200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.99, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(134, 'EA-284', 'አለም አማን ማሞ', 'የሶፍትዌር አስተዳደር ቡድን', 'ሴ', '11', 'ከንባታ', 'ኦርቶዶክስ', '0000-00-00', '2035-06-07', 6, 56471.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.73, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(135, 'ET-206', 'ጸደንያ ተካ በርሀ', 'የሶፍትዌር አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አድሚኒስትሬቲቭ ሰርቪስ ማነጅመንት እና ቴክኖሎጂ ሲስተም', 'ዲግሪ', 2.37, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(136, 'EF-1227', 'ደቻሳ ፍቃዱ ጀና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'ኦሮሚያ ክልል', 'ቡራዩ', '***', '***', '***', '09 20 13 23 84', NULL, 'Computer Engineering Focus', 'ዲግሪ', 3.55, 'ሀረማያ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(137, 'EJ-210', 'ጀማል ወልዬ ዋቆ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የለውም', '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '937306164', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.55, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(138, 'EK-1101', 'ቃለአብ  ሽፈራው ግርማ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '973142596', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(139, 'ET-1231', 'ዳዊት መኮንን ተርፋሳ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '917644890', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(140, 'EA-4623', 'አብርሃም ዮሐንስ ገነቱ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '904136689', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.30, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(141, 'EM-3839', 'መስፍን ሎዳሞ ባፈና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ሃድያ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ን/ስልክ', 'ጀሞ', '***', '***', '09 73 52 34 69', NULL, 'Computer Science', 'ዲግሪ', 3.25, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(142, 'EG-1492', 'ገመቹ  ሹጌ ቃበቶ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '966448035', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.82, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(143, 'ED-1241', 'ደረሰ ታሪኩ ተኩማ', 'የዳታ ቤዝ አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 50540.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.60, 'ባህርዳር ዩኒቨርስቲ', NULL, 0, 0, 'የዳታ ቤዝ አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(144, 'EA-44665', 'አቤል ፊታሞ ሰዴቦ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'ሀዲያ', 'ኘሮቴስታንት', NULL, '0000-00-00', 0, 42860.00, 11000.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'BA', 2.66, 'አዳማ', '0000-00-00', NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(145, 'EU-987', 'የማታ ይገዙ ውቤ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ጉራጌ', NULL, '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ\r\nኮምፒውተር ሳይንስ', 'ዲግሪ\r\nማስተርስ', 2.29, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(146, 'ED-1230', 'ዲቦራ ሀብታሙ ሞሲሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', NULL, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '918689957', NULL, 'የኮምፒውተር ሳይንስ', 'ዲግሪ', 3.81, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(147, 'EB-2015', 'ቦንቱ ብርሃኑ ተረፈ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '989053817', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር \r\nኢንጂነሪንግ/Communication Engineering', 'ዲግሪ', 3.10, 'ሠመራ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(148, 'ES-2458', 'ሰላም በላይነህ ገረመው', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '930416808', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.37, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(149, 'EM-3844', 'መታሰቢያ ጥላሁን ማንዱሪ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', '***', '***', '***', '***', '***', '***', NULL, 'Information Systems', 'ዲግሪ', 3.26, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(150, 'EA-4626', 'አብዲ ፍርዲሳ ቶለሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '925833201', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(151, 'EM-3851', 'መገርሳ ሽብሩ አያና', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '954560572', NULL, 'በኤሌክትሪካል ምህንድስና/ኤሌክትሮኒክስ ኮሙኒኬሽን', 'ዲግሪ', 3.18, 'አዲስ አበባ ሳይንስና ቴክኖሎጂ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(152, 'EM-3840', 'መሠረት ደስታ መርጋ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '2033-02-08', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', '***', '***', '***', '***', '***', '09 42 05 18 77', NULL, 'Electronics&Communication Engineering', 'ዲግሪ', 3.23, 'አዳማ ሳይንስና ቴክኖሎጂ  ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(153, 'EC-130', 'ጫላ በቀለ ያደታ', 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', 'ወ', '9', 'ኦሮሞ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 1, 38660.00, 10000.00, '0000-00-00', 20490.00, NULL, '', 'ኦሮሚያ', 'ቄለም ወለጋ ዳሌ ሠዲ', 'ዳሌ ሠዲ', NULL, NULL, '912384124', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር ምህንድስና', 'ድግሪ', 2.38, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(154, 'EG-211', 'ጌቱ ለገሰ አልማው', 'የቴክኖሎጂ መሠረተ ልማት ዳይሬክቶሬት', 'ወ', '14', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 73538.00, 40300.00, '0000-00-00', 28000.00, 'ሰ/1772839', '', 'አዲስ አባ', 'አዲስ ከተማ', '8', 'ቀበሌ 05 (12) (አዉቶቢስ ተራ)', '669', '911135757', 'getu28@gmail.com', '1. አካዉንቲንግ\r\n2. አካዉንቲንግ\r\n3. ፐብሊክ ፋይናንስ ማኔጅመንት', '1. ዲፕሎማ\r\n2. ዲግሪ\r\n3. ማስተርስ', 1.00, '1. አ.አ ንግድ ሥ/ኮሌጅ \r\n2. አ.አ ዩኒቨርሲቲ \r\n3. ሲቪል ሰርቪስ ዩኒቨርሲቲ\r\n4.', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረተ ልማት ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(155, 'EW-883', 'ውብአለም ሙሉጌታ ቡልቡላ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '7', NULL, NULL, '943175603', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(156, 'EW-888', 'ውለታው አየለ መኮንን', 'የቴክኖሎጂ መሠረተ ልማት ቡድን', 'ወ', '11', 'አማራ', NULL, '0000-00-00', '0000-00-00', 0, 50540.00, 40300.00, '0000-00-00', 28000.00, 'ሰ-1895340', '', 'አማራ', '……….', '………', '………..', '……..', '………..', '………', 'ኮምፒውተ ሳይንስ\r\nፕሮጀክት ማናጅመንት', 'ማስተርስማስተርስ', 3.43, 'ባህር ዳር ዩኒቨርሲቲ አ.አ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረተ ልማት ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(157, 'EG-1496', 'ጋዲሳ ረታ በቀለ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኣሮሚያ ክልል', NULL, NULL, NULL, NULL, '915877955', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.27, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(158, 'ET-2897', 'ትዕግስት ጉርሙ ቢፋ', 'ከፍተኛ ሴክሬታሪ', 'ሴ', '6', 'ኦሮሞ', NULL, '0000-00-00', '2017-06-06', NULL, 16780.00, 6000.00, '2017-06-06', 12990.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09 11 03 99 36', NULL, 'ቢሮ አስተዳደርና የፅህፈት ሙያ\r\nከፍተኛ ሴክሬታሪ', 'ዲፕሎማ', 2.70, 'ሮያል ኮሌጅ', '0000-00-00', NULL, NULL, 'ከፍተኛ ሴክሬታሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(159, 'EZ-800', 'ዝናሽ ተከተል ተናኜ', 'የመልዕክት ሠራተኛ', 'ሴ', '2', 'አማራ', NULL, NULL, '2017-01-06', 1, 8875.00, NULL, '2017-01-06', 5480.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(160, 'EH-1559', 'ሄርሜላ አለማየሁ ተሾመ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1997-08-12', '2016-06-26', 0, 4760.00, NULL, '2016-06-26', 0.00, '……', '', 'አዲስ አበባ', NULL, NULL, NULL, '596/17', '968134154', NULL, 'ቀለም', '8ኛ', 0.00, '…', '0000-00-00', 0, 0, 'የመልዕክት ሰራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(161, 'ES-693', 'ሰውአገኝ  ጤናው ወንድም', 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', 'ወ', '14', 'አማራ', 'ኦርቶዶክስ', '1964-03-15', '2004-12-17', 2, 73122.00, 40300.00, '2016-04-18', 28000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግ\r\nኮምፒውተር ሳይንስ\r\nኢንፎርሜሽን ሳይንስ', 'ዲኘሎማ\r\nዲግሪ\r\nማስተርስ', 0.00, 'አዲስ አበባ ንግድ ስራ ኮሌጅ \r\nኔው ጀነሬሽን ዩኒቨርስቲ\r\nአዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(162, 'EF-809', 'ፈንታዬ ሀይሉ ዳምጤ', 'ሴክረታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1987-04-12', '0000-00-00', 2, 15428.00, NULL, '0000-00-00', 11110.00, 'C-7014399', '', 'አዲ አበባ', NULL, NULL, 'ቀጨኔ መድሃኒያለም', NULL, '09 63 57 70 14', NULL, '1. የቢሮ አስተዳደርና ሴክሬተሪያል  ቴክኖሎጂ', '1. ደረጃ 4', NULL, NULL, '0000-00-00', NULL, NULL, 'ሴክሬተሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(163, 'EE-1697', 'ኤደን ጌቱ ሀይሉ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-11-19', '2016-06-15', 1, 7375.00, NULL, '2016-06-15', 3600.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ወረዳ 05', NULL, NULL, '947389180', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(165, 'ES-1526', 'ሽብሬ ግርማ ወርቅነህ', 'የሶፍትዌር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'አማራ', NULL, '1986-06-20', '2008-03-15', 1, 44780.00, 21600.00, '2017-05-01', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.94, NULL, NULL, NULL, NULL, 'የሶፍትዌር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(166, 'ES-2456', 'ሴና ስዩም ኩዩ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-05-23', '2016-04-15', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, 'ሱሉልታ', NULL, 'አሸዋ ሜዳ', NULL, '09 32 30 08 31', NULL, 'Electrical and Computer Engineering', 'ዲግሪ', 2.85, 'ደብረ ታቦር ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(167, 'ES-2405', 'ሳሙኤል ኃይሉ ሀጥያ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ሲዳማ', 'ኘሮቴስታንት', '1991-07-01', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 37 21 04 19', NULL, 'Information Systems', 'ዲግሪ', 3.43, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(168, 'EM-3848', 'ሙባይን አንዴግባ ሽክረቶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ስልጤ', 'ሙስሊም', '1992-01-02', '2016-05-02', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ፎርም የማስሞላ', NULL, NULL, NULL, NULL, '939209096', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.13, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(169, 'EM-3849', 'መሀመድ ከድር አብዶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '1993-07-29', '2016-05-08', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ኦሮሚያ ክልል', 'ሰበታ', NULL, NULL, NULL, '985212534', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.36, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(170, 'EE-1693', 'ኤልያስ ደጀኔ አለሙ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ክርስቲያን', NULL, '2016-05-02', 1, 22845.00, 8000.00, '2016-05-02', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '9016686987', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.73, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(171, 'EY-588', 'ያሬድ ተ/ዮሐንስ አርጋው', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ጉራጌ', 'ኘሮቴስታንት', '0000-00-00', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ጦርሀይሎች', '6', 'ጎመን ሰፈር', '1068', '09 43 10 24 82', NULL, 'Computer Science', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(172, 'EA-4624', 'አንዱአለም ሰብስቤ ወንድአፍራሽ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1994-08-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '972396668', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.61, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(173, 'EB-2010', 'በፀሎት ታደለ አባተ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1993-08-05', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 16 89 30 00', NULL, 'Computer Science', 'ድግሪ', 2.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(174, 'ED-1228', 'ዳግማዊ ደጀኔ ደንበል', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ጉራጌ', 'ኦርቶዶክስ', '1993-03-14', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '09 19 36 37 50', NULL, 'Computer Science', 'ድግሪ', 3.75, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(175, 'EC-129', 'ጫላ ጌታ ተፈረ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1990-11-01', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, NULL, NULL, 'ቡራዩ', 'ሆሮጉድሩ', 'ሆሮ', NULL, NULL, '95535010', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.86, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(176, 'EM-3842', 'ሚካኤል ገ/ጊዮርጊስ መርጋ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-12-02', '2016-04-01', 1, 24845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ኮልፌ', NULL, NULL, NULL, '09 94 39 8 91', NULL, 'Computer Science', 'ድግሪ', 3.54, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(177, 'EB-2013', 'ብስራት ደረጀ ተስፋዬ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1992-06-21', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 49 71 85 07', NULL, 'Computer Science', 'ድግሪ', 3.10, 'አምቦ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(178, 'ED-1232', 'ድሪባ አድማሱ ቶሎሳ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1991-10-28', '2016-05-07', 1, 22845.00, 8000.00, '2016-05-27', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '930502190', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.54, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(179, 'EZ-753', 'ዘካሪያስ ሰብስብ በላይ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1993-01-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, 'አዲስ አበባ', 'የካ', '2', NULL, NULL, '941246063', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.27, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(180, 'ES-2459', 'ሰለሞን በላይ ባሳዝነው', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1992-06-08', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919608182', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ድግሪ', 3.67, 'ጎንደር ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(182, 'ET-2898', 'ትህትና ዻውሎስ በሎታ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ጐፋ', NULL, '0000-00-00', '2017-06-06', NULL, 50540.00, 28200.00, '0000-00-00', 24250.00, 'ሰ/1971449', '', 'ደቡብ', 'በጋሞ ጎፋ', NULL, NULL, NULL, '916135906', NULL, 'በኮምፒዩተር ሳይንስ እና ኢንፎ. ቴክኖሎጂ', 'ዲግሪ', 2.60, 'አርባምንጭ ዩኒሸርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማት ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(183, 'EJ-114', 'ጅሬኛ ሶሪ ደሳ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', NULL, '0000-00-00', '2020-04-12', 2, 53011.00, 280200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.99, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(184, 'EA-284', 'አለም አማን ማሞ', 'የሶፍትዌር አስተዳደር ቡድን', 'ሴ', '11', 'ከንባታ', 'ኦርቶዶክስ', '0000-00-00', '2035-06-07', 6, 56471.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.73, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(185, 'ET-206', 'ጸደንያ ተካ በርሀ', 'የሶፍትዌር አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አድሚኒስትሬቲቭ ሰርቪስ ማነጅመንት እና ቴክኖሎጂ ሲስተም', 'ዲግሪ', 2.37, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(186, 'EF-1227', 'ደቻሳ ፍቃዱ ጀና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'ኦሮሚያ ክልል', 'ቡራዩ', NULL, NULL, NULL, '09 20 13 23 84', NULL, 'Computer Engineering Focus', 'ዲግሪ', 3.55, 'ሀረማያ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(187, 'EJ-210', 'ጀማል ወልዬ ዋቆ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የለውም', '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '937306164', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.55, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(188, 'EK-1101', 'ቃለአብ  ሽፈራው ግርማ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '973142596', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(189, 'ET-1231', 'ዳዊት መኮንን ተርፋሳ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '917644890', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(190, 'EA-4623', 'አብርሃም ዮሐንስ ገነቱ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '904136689', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.30, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(191, 'EM-3839', 'መስፍን ሎዳሞ ባፈና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ሃድያ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ን/ስልክ', 'ጀሞ', NULL, NULL, '09 73 52 34 69', NULL, 'Computer Science', 'ዲግሪ', 3.25, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(192, 'EG-1492', 'ገመቹ  ሹጌ ቃበቶ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '966448035', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.82, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(193, 'ED-1241', 'ደረሰ ታሪኩ ተኩማ', 'የዳታ ቤዝ አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 50540.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.60, 'ባህርዳር ዩኒቨርስቲ', NULL, 0, 0, 'የዳታ ቤዝ አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(194, 'EA-44665', 'አቤል ፊታሞ ሰዴቦ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'ሀዲያ', 'ኘሮቴስታንት', NULL, '0000-00-00', 0, 42860.00, 11000.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'BA', 2.66, 'አዳማ', '0000-00-00', NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(195, 'EU-987', 'የማታ ይገዙ ውቤ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ጉራጌ', NULL, '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ\r\nኮምፒውተር ሳይንስ', 'ዲግሪ\r\nማስተርስ', 2.29, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(196, 'ED-1230', 'ዲቦራ ሀብታሙ ሞሲሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', NULL, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '918689957', NULL, 'የኮምፒውተር ሳይንስ', 'ዲግሪ', 3.81, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(197, 'EB-2015', 'ቦንቱ ብርሃኑ ተረፈ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '989053817', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር \r\nኢንጂነሪንግ/Communication Engineering', 'ዲግሪ', 3.10, 'ሠመራ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(198, 'ES-2458', 'ሰላም በላይነህ ገረመው', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '930416808', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.37, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(199, 'EM-3844', 'መታሰቢያ ጥላሁን ማንዱሪ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Information Systems', 'ዲግሪ', 3.26, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(200, 'EA-4626', 'አብዲ ፍርዲሳ ቶለሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '925833201', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(201, 'EM-3851', 'መገርሳ ሽብሩ አያና', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '954560572', NULL, 'በኤሌክትሪካል ምህንድስና/ኤሌክትሮኒክስ ኮሙኒኬሽን', 'ዲግሪ', 3.18, 'አዲስ አበባ ሳይንስና ቴክኖሎጂ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(202, 'EM-3840', 'መሠረት ደስታ መርጋ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '2033-02-08', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 42 05 18 77', NULL, 'Electronics&Communication Engineering', 'ዲግሪ', 3.23, 'አዳማ ሳይንስና ቴክኖሎጂ  ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(203, 'EC-130', 'ጫላ በቀለ ያደታ', 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', 'ወ', '9', 'ኦሮሞ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 1, 38660.00, 10000.00, '0000-00-00', 20490.00, NULL, '', 'ኦሮሚያ', 'ቄለም ወለጋ ዳሌ ሠዲ', 'ዳሌ ሠዲ', NULL, NULL, '912384124', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር ምህንድስና', 'ድግሪ', 2.38, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(205, 'EW-883', 'ውብአለም ሙሉጌታ ቡልቡላ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '7', NULL, NULL, '943175603', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(207, 'EG-1496', 'ጋዲሳ ረታ በቀለ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኣሮሚያ ክልል', NULL, NULL, NULL, NULL, '915877955', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.27, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(208, 'ET-2897', 'ትዕግስት ጉርሙ ቢፋ', 'ከፍተኛ ሴክሬታሪ', 'ሴ', '6', 'ኦሮሞ', NULL, '0000-00-00', '2017-06-06', NULL, 16780.00, 6000.00, '2017-06-06', 12990.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09 11 03 99 36', NULL, 'ቢሮ አስተዳደርና የፅህፈት ሙያ\r\nከፍተኛ ሴክሬታሪ', 'ዲፕሎማ', 2.70, 'ሮያል ኮሌጅ', '0000-00-00', NULL, NULL, 'ከፍተኛ ሴክሬታሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(209, 'EZ-800', 'ዝናሽ ተከተል ተናኜ', 'የመልዕክት ሠራተኛ', 'ሴ', '2', 'አማራ', NULL, NULL, '2017-01-06', 1, 8875.00, NULL, '2017-01-06', 5480.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(210, 'EH-1559', 'ሄርሜላ አለማየሁ ተሾመ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1997-08-12', '2016-06-26', 0, 4760.00, NULL, '2016-06-26', 0.00, '……', '', 'አዲስ አበባ', NULL, NULL, NULL, '596/17', '968134154', NULL, 'ቀለም', '8ኛ', 0.00, '…', '0000-00-00', 0, 0, 'የመልዕክት ሰራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(211, 'ES-693', 'ሰውአገኝ  ጤናው ወንድም', 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', 'ወ', '14', 'አማራ', 'ኦርቶዶክስ', '1964-03-15', '2004-12-17', 2, 73122.00, 40300.00, '2016-04-18', 28000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግ\r\nኮምፒውተር ሳይንስ\r\nኢንፎርሜሽን ሳይንስ', 'ዲኘሎማ\r\nዲግሪ\r\nማስተርስ', 0.00, 'አዲስ አበባ ንግድ ስራ ኮሌጅ \r\nኔው ጀነሬሽን ዩኒቨርስቲ\r\nአዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(212, 'EF-809', 'ፈንታዬ ሀይሉ ዳምጤ', 'ሴክረታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1987-04-12', '0000-00-00', 2, 15428.00, NULL, '0000-00-00', 11110.00, 'C-7014399', '', 'አዲ አበባ', NULL, NULL, 'ቀጨኔ መድሃኒያለም', NULL, '09 63 57 70 14', NULL, '1. የቢሮ አስተዳደርና ሴክሬተሪያል  ቴክኖሎጂ', '1. ደረጃ 4', NULL, NULL, '0000-00-00', NULL, NULL, 'ሴክሬተሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(213, 'EE-1697', 'ኤደን ጌቱ ሀይሉ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-11-19', '2016-06-15', 1, 7375.00, NULL, '2016-06-15', 3600.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ወረዳ 05', NULL, NULL, '947389180', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` (`id`, `file_number`, `employee_name`, `job_title`, `gender`, `job_level`, `ethnicity`, `religion`, `date_of_birth`, `hire_date`, `step`, `salary`, `allowance`, `assignment_date`, `housing_allowance`, `pension_id`, `marital_status`, `region`, `zone`, `district`, `specific_location`, `house_number`, `phone_number`, `email`, `education_type`, `education_level`, `cgpa`, `institution`, `graduation_date`, `coc_certificate`, `higher_ed_verified`, `current_job_title`, `level_dup`, `current_institution`, `experience_from`, `experience_to`, `previous_job_title`, `previous_institution`, `previous_from`, `previous_to`, `diagnosis`, `disability_type`, `column_40`, `deleted_at`, `created_at`, `updated_at`, `years_of_service`, `age`, `photo`, `document`, `fan_number`, `department_id`, `fayda`, `branch_id`) VALUES
(215, 'ES-1526', 'ሽብሬ ግርማ ወርቅነህ', 'የሶፍትዌር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'አማራ', NULL, '1986-06-20', '2008-03-15', 1, 44780.00, 21600.00, '2017-05-01', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.94, NULL, NULL, NULL, NULL, 'የሶፍትዌር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(216, 'ES-2456', 'ሴና ስዩም ኩዩ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-05-23', '2016-04-15', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, 'ሱሉልታ', NULL, 'አሸዋ ሜዳ', NULL, '09 32 30 08 31', NULL, 'Electrical and Computer Engineering', 'ዲግሪ', 2.85, 'ደብረ ታቦር ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(217, 'ES-2405', 'ሳሙኤል ኃይሉ ሀጥያ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ሲዳማ', 'ኘሮቴስታንት', '1991-07-01', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 37 21 04 19', NULL, 'Information Systems', 'ዲግሪ', 3.43, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(218, 'EM-3848', 'ሙባይን አንዴግባ ሽክረቶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ስልጤ', 'ሙስሊም', '1992-01-02', '2016-05-02', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ፎርም የማስሞላ', NULL, NULL, NULL, NULL, '939209096', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.13, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(219, 'EM-3849', 'መሀመድ ከድር አብዶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '1993-07-29', '2016-05-08', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ኦሮሚያ ክልል', 'ሰበታ', NULL, NULL, NULL, '985212534', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.36, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(220, 'EE-1693', 'ኤልያስ ደጀኔ አለሙ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ክርስቲያን', NULL, '2016-05-02', 1, 22845.00, 8000.00, '2016-05-02', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '9016686987', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.73, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(221, 'EY-588', 'ያሬድ ተ/ዮሐንስ አርጋው', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ጉራጌ', 'ኘሮቴስታንት', '0000-00-00', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ጦርሀይሎች', '6', 'ጎመን ሰፈር', '1068', '09 43 10 24 82', NULL, 'Computer Science', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(222, 'EA-4624', 'አንዱአለም ሰብስቤ ወንድአፍራሽ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1994-08-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '972396668', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.61, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(223, 'EB-2010', 'በፀሎት ታደለ አባተ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1993-08-05', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 16 89 30 00', NULL, 'Computer Science', 'ድግሪ', 2.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(224, 'ED-1228', 'ዳግማዊ ደጀኔ ደንበል', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ጉራጌ', 'ኦርቶዶክስ', '1993-03-14', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '09 19 36 37 50', NULL, 'Computer Science', 'ድግሪ', 3.75, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(225, 'EC-129', 'ጫላ ጌታ ተፈረ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1990-11-01', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, NULL, NULL, 'ቡራዩ', 'ሆሮጉድሩ', 'ሆሮ', NULL, NULL, '95535010', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.86, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(226, 'EM-3842', 'ሚካኤል ገ/ጊዮርጊስ መርጋ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-12-02', '2016-04-01', 1, 24845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ኮልፌ', NULL, NULL, NULL, '09 94 39 8 91', NULL, 'Computer Science', 'ድግሪ', 3.54, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(227, 'EB-2013', 'ብስራት ደረጀ ተስፋዬ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1992-06-21', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 49 71 85 07', NULL, 'Computer Science', 'ድግሪ', 3.10, 'አምቦ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(228, 'ED-1232', 'ድሪባ አድማሱ ቶሎሳ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1991-10-28', '2016-05-07', 1, 22845.00, 8000.00, '2016-05-27', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '930502190', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.54, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(229, 'EZ-753', 'ዘካሪያስ ሰብስብ በላይ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1993-01-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, 'አዲስ አበባ', 'የካ', '2', NULL, NULL, '941246063', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.27, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(230, 'ES-2459', 'ሰለሞን በላይ ባሳዝነው', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1992-06-08', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919608182', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ድግሪ', 3.67, 'ጎንደር ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(232, 'ET-2898', 'ትህትና ዻውሎስ በሎታ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ጐፋ', NULL, '0000-00-00', '2017-06-06', NULL, 50540.00, 28200.00, '0000-00-00', 24250.00, 'ሰ/1971449', '', 'ደቡብ', 'በጋሞ ጎፋ', NULL, NULL, NULL, '916135906', NULL, 'በኮምፒዩተር ሳይንስ እና ኢንፎ. ቴክኖሎጂ', 'ዲግሪ', 2.60, 'አርባምንጭ ዩኒሸርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማት ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(233, 'EJ-114', 'ጅሬኛ ሶሪ ደሳ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', NULL, '0000-00-00', '2020-04-12', 2, 53011.00, 280200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.99, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(234, 'EA-284', 'አለም አማን ማሞ', 'የሶፍትዌር አስተዳደር ቡድን', 'ሴ', '11', 'ከንባታ', 'ኦርቶዶክስ', '0000-00-00', '2035-06-07', 6, 56471.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.73, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(235, 'ET-206', 'ጸደንያ ተካ በርሀ', 'የሶፍትዌር አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አድሚኒስትሬቲቭ ሰርቪስ ማነጅመንት እና ቴክኖሎጂ ሲስተም', 'ዲግሪ', 2.37, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(236, 'EF-1227', 'ደቻሳ ፍቃዱ ጀና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'ኦሮሚያ ክልል', 'ቡራዩ', NULL, NULL, NULL, '09 20 13 23 84', NULL, 'Computer Engineering Focus', 'ዲግሪ', 3.55, 'ሀረማያ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(237, 'EJ-210', 'ጀማል ወልዬ ዋቆ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የለውም', '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '937306164', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.55, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(238, 'EK-1101', 'ቃለአብ  ሽፈራው ግርማ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '973142596', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(239, 'ET-1231', 'ዳዊት መኮንን ተርፋሳ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '917644890', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(240, 'EA-4623', 'አብርሃም ዮሐንስ ገነቱ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '904136689', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.30, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(241, 'EM-3839', 'መስፍን ሎዳሞ ባፈና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ሃድያ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ን/ስልክ', 'ጀሞ', NULL, NULL, '09 73 52 34 69', NULL, 'Computer Science', 'ዲግሪ', 3.25, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(242, 'EG-1492', 'ገመቹ  ሹጌ ቃበቶ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '966448035', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.82, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(243, 'ED-1241', 'ደረሰ ታሪኩ ተኩማ', 'የዳታ ቤዝ አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 50540.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.60, 'ባህርዳር ዩኒቨርስቲ', NULL, 0, 0, 'የዳታ ቤዝ አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(244, 'EA-44665', 'አቤል ፊታሞ ሰዴቦ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'ሀዲያ', 'ኘሮቴስታንት', NULL, '0000-00-00', 0, 42860.00, 11000.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'BA', 2.66, 'አዳማ', '0000-00-00', NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(245, 'EU-987', 'የማታ ይገዙ ውቤ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ጉራጌ', NULL, '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ\r\nኮምፒውተር ሳይንስ', 'ዲግሪ\r\nማስተርስ', 2.29, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(246, 'ED-1230', 'ዲቦራ ሀብታሙ ሞሲሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', NULL, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '918689957', NULL, 'የኮምፒውተር ሳይንስ', 'ዲግሪ', 3.81, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(247, 'EB-2015', 'ቦንቱ ብርሃኑ ተረፈ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '989053817', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር \r\nኢንጂነሪንግ/Communication Engineering', 'ዲግሪ', 3.10, 'ሠመራ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(248, 'ES-2458', 'ሰላም በላይነህ ገረመው', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '930416808', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.37, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(249, 'EM-3844', 'መታሰቢያ ጥላሁን ማንዱሪ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Information Systems', 'ዲግሪ', 3.26, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(250, 'EA-4626', 'አብዲ ፍርዲሳ ቶለሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '925833201', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(251, 'EM-3851', 'መገርሳ ሽብሩ አያና', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '954560572', NULL, 'በኤሌክትሪካል ምህንድስና/ኤሌክትሮኒክስ ኮሙኒኬሽን', 'ዲግሪ', 3.18, 'አዲስ አበባ ሳይንስና ቴክኖሎጂ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(252, 'EM-3840', 'መሠረት ደስታ መርጋ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '2033-02-08', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 42 05 18 77', NULL, 'Electronics&Communication Engineering', 'ዲግሪ', 3.23, 'አዳማ ሳይንስና ቴክኖሎጂ  ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(253, 'EC-130', 'ጫላ በቀለ ያደታ', 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', 'ወ', '9', 'ኦሮሞ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 1, 38660.00, 10000.00, '0000-00-00', 20490.00, NULL, '', 'ኦሮሚያ', 'ቄለም ወለጋ ዳሌ ሠዲ', 'ዳሌ ሠዲ', NULL, NULL, '912384124', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር ምህንድስና', 'ድግሪ', 2.38, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(255, 'EW-883', 'ውብአለም ሙሉጌታ ቡልቡላ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '7', NULL, NULL, '943175603', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(257, 'EG-1496', 'ጋዲሳ ረታ በቀለ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኣሮሚያ ክልል', NULL, NULL, NULL, NULL, '915877955', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.27, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(258, 'ET-2897', 'ትዕግስት ጉርሙ ቢፋ', 'ከፍተኛ ሴክሬታሪ', 'ሴ', '6', 'ኦሮሞ', NULL, '0000-00-00', '2017-06-06', NULL, 16780.00, 6000.00, '2017-06-06', 12990.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09 11 03 99 36', NULL, 'ቢሮ አስተዳደርና የፅህፈት ሙያ\r\nከፍተኛ ሴክሬታሪ', 'ዲፕሎማ', 2.70, 'ሮያል ኮሌጅ', '0000-00-00', NULL, NULL, 'ከፍተኛ ሴክሬታሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(259, 'EZ-800', 'ዝናሽ ተከተል ተናኜ', 'የመልዕክት ሠራተኛ', 'ሴ', '2', 'አማራ', NULL, NULL, '2017-01-06', 1, 8875.00, NULL, '2017-01-06', 5480.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(260, 'EH-1559', 'ሄርሜላ አለማየሁ ተሾመ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1997-08-12', '2016-06-26', 0, 4760.00, NULL, '2016-06-26', 0.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, '596/17', '968134154', NULL, 'ቀለም', '8ኛ', NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሰራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(261, 'ES-693', 'ሰውአገኝ  ጤናው ወንድም', 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', 'ወ', '14', 'አማራ', 'ኦርቶዶክስ', '1964-03-15', '2004-12-17', 2, 73122.00, 40300.00, '2016-04-18', 28000.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግ\r\nኮምፒውተር ሳይንስ\r\nኢንፎርሜሽን ሳይንስ', 'ዲኘሎማ\r\nዲግሪ\r\nማስተርስ', 0.00, 'አዲስ አበባ ንግድ ስራ ኮሌጅ \r\nኔው ጀነሬሽን ዩኒቨርስቲ\r\nአዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማትና አስተዳደር ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(262, 'EF-809', 'ፈንታዬ ሀይሉ ዳምጤ', 'ሴክረታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '1987-04-12', '0000-00-00', 2, 15428.00, NULL, '0000-00-00', 11110.00, 'C-7014399', '', 'አዲ አበባ', NULL, NULL, 'ቀጨኔ መድሃኒያለም', NULL, '09 63 57 70 14', NULL, '1. የቢሮ አስተዳደርና ሴክሬተሪያል  ቴክኖሎጂ', '1. ደረጃ 4', NULL, NULL, '0000-00-00', NULL, NULL, 'ሴክሬተሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(263, 'EE-1697', 'ኤደን ጌቱ ሀይሉ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-11-19', '2016-06-15', 1, 7375.00, NULL, '2016-06-15', 3600.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ወረዳ 05', NULL, NULL, '947389180', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(264, 'ED-1242', 'ድሪባ ቀነዓ ቱፋ', 'የሶፍትዌር ልማት ቡድን', 'ወ', '11', 'ኦሮሞ', NULL, '1980-04-02', '0000-00-00', 0, 20784.00, NULL, '2017-06-06', 24250.00, NULL, '', 'አኦሮሞ', 'ም/ወለጋ', NULL, NULL, NULL, '910312209', NULL, 'ኮምፒውተ ሳይንስ\r\nፕሮጀክት ማናጅመንት', 'ዲግሪ\r\nማስተርስ', 2.55, 'ጅማ ዩኒቨርሲቲ\r\nሉናር ኢንተርናሽናል ኮሌጅ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማት ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(265, 'ES-1526', 'ሽብሬ ግርማ ወርቅነህ', 'የሶፍትዌር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'አማራ', NULL, '1986-06-20', '2008-03-15', 1, 44780.00, 21600.00, '2017-05-01', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.94, NULL, NULL, NULL, NULL, 'የሶፍትዌር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(266, 'ES-2456', 'ሴና ስዩም ኩዩ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-05-23', '2016-04-15', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, 'ሱሉልታ', NULL, 'አሸዋ ሜዳ', NULL, '09 32 30 08 31', NULL, 'Electrical and Computer Engineering', 'ዲግሪ', 2.85, 'ደብረ ታቦር ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(267, 'ES-2405', 'ሳሙኤል ኃይሉ ሀጥያ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ሲዳማ', 'ኘሮቴስታንት', '1991-07-01', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 37 21 04 19', NULL, 'Information Systems', 'ዲግሪ', 3.43, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(268, 'EM-3848', 'ሙባይን አንዴግባ ሽክረቶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ስልጤ', 'ሙስሊም', '1992-01-02', '2016-05-02', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ፎርም የማስሞላ', NULL, NULL, NULL, NULL, '939209096', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.13, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(269, 'EM-3849', 'መሀመድ ከድር አብዶ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '1993-07-29', '2016-05-08', 1, 22845.00, 8000.00, '2016-06-01', 14860.00, NULL, '', 'ኦሮሚያ ክልል', 'ሰበታ', NULL, NULL, NULL, '985212534', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.36, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(270, 'EE-1693', 'ኤልያስ ደጀኔ አለሙ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ክርስቲያን', NULL, '2016-05-02', 1, 22845.00, 8000.00, '2016-05-02', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '9016686987', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.73, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(271, 'EY-588', 'ያሬድ ተ/ዮሐንስ አርጋው', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ጉራጌ', 'ኘሮቴስታንት', '0000-00-00', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ጦርሀይሎች', '6', 'ጎመን ሰፈር', '1068', '09 43 10 24 82', NULL, 'Computer Science', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(272, 'EA-4624', 'አንዱአለም ሰብስቤ ወንድአፍራሽ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1994-08-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '972396668', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.61, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(273, 'EB-2010', 'በፀሎት ታደለ አባተ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1993-08-05', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 16 89 30 00', NULL, 'Computer Science', 'ድግሪ', 2.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(274, 'ED-1228', 'ዳግማዊ ደጀኔ ደንበል', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ጉራጌ', 'ኦርቶዶክስ', '1993-03-14', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '09 19 36 37 50', NULL, 'Computer Science', 'ድግሪ', 3.75, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(275, 'EC-129', 'ጫላ ጌታ ተፈረ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1990-11-01', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, NULL, NULL, 'ቡራዩ', 'ሆሮጉድሩ', 'ሆሮ', NULL, NULL, '95535010', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.86, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(276, 'EM-3842', 'ሚካኤል ገ/ጊዮርጊስ መርጋ', 'የሶፍትዌር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1992-12-02', '2016-04-01', 1, 24845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ኮልፌ', NULL, NULL, NULL, '09 94 39 8 91', NULL, 'Computer Science', 'ድግሪ', 3.54, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(277, 'EB-2013', 'ብስራት ደረጀ ተስፋዬ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '1992-06-21', '2016-04-01', 1, 22845.00, 8000.00, '2016-04-01', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 49 71 85 07', NULL, 'Computer Science', 'ድግሪ', 3.10, 'አምቦ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(278, 'ED-1232', 'ድሪባ አድማሱ ቶሎሳ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '1991-10-28', '2016-05-07', 1, 22845.00, 8000.00, '2016-05-27', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '930502190', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ዲግሪ', 3.54, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(279, 'EZ-753', 'ዘካሪያስ ሰብስብ በላይ', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1993-01-07', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, 'አዲስ አበባ', 'የካ', '2', NULL, NULL, '941246063', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.27, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(280, 'ES-2459', 'ሰለሞን በላይ ባሳዝነው', 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '1992-06-08', '2016-04-16', 1, 22845.00, 8000.00, '2016-04-16', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919608182', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ', 'ድግሪ', 3.67, 'ጎንደር ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር ጥራት ማረጋገጫ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(282, 'ET-2898', 'ትህትና ዻውሎስ በሎታ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ጐፋ', NULL, '0000-00-00', '2017-06-06', NULL, 50540.00, 28200.00, '0000-00-00', 24250.00, 'ሰ/1971449', '', 'ደቡብ', 'በጋሞ ጎፋ', NULL, NULL, NULL, '916135906', NULL, 'በኮምፒዩተር ሳይንስ እና ኢንፎ. ቴክኖሎጂ', 'ዲግሪ', 2.60, 'አርባምንጭ ዩኒሸርሲቲ', '0000-00-00', NULL, NULL, 'የሶፍትዌር ልማት ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(283, 'EJ-114', 'ጅሬኛ ሶሪ ደሳ', 'የሶፍትዌር አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', NULL, '0000-00-00', '2020-04-12', 2, 53011.00, 280200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.99, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(284, 'EA-284', 'አለም አማን ማሞ', 'የሶፍትዌር አስተዳደር ቡድን', 'ሴ', '11', 'ከንባታ', 'ኦርቶዶክስ', '0000-00-00', '2035-06-07', 6, 56471.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.73, NULL, NULL, NULL, NULL, 'የሶፍትዌር አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(285, 'ET-206', 'ጸደንያ ተካ በርሀ', 'የሶፍትዌር አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አድሚኒስትሬቲቭ ሰርቪስ ማነጅመንት እና ቴክኖሎጂ ሲስተም', 'ዲግሪ', 2.37, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(286, 'EF-1227', 'ደቻሳ ፍቃዱ ጀና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'ኦሮሚያ ክልል', 'ቡራዩ', NULL, NULL, NULL, '09 20 13 23 84', NULL, 'Computer Engineering Focus', 'ዲግሪ', 3.55, 'ሀረማያ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(287, 'EJ-210', 'ጀማል ወልዬ ዋቆ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የለውም', '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '937306164', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.55, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(288, 'EK-1101', 'ቃለአብ  ሽፈራው ግርማ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '973142596', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.72, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(289, 'ET-1231', 'ዳዊት መኮንን ተርፋሳ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '917644890', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(290, 'EA-4623', 'አብርሃም ዮሐንስ ገነቱ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '904136689', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.30, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(291, 'EM-3839', 'መስፍን ሎዳሞ ባፈና', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ሃድያ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', 'አዲስ አበባ', 'ን/ስልክ', 'ጀሞ', NULL, NULL, '09 73 52 34 69', NULL, 'Computer Science', 'ዲግሪ', 3.25, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(292, 'EG-1492', 'ገመቹ  ሹጌ ቃበቶ', 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '966448035', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.82, 'አምቦ ዮኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሶፍትዌር አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(293, 'ED-1241', 'ደረሰ ታሪኩ ተኩማ', 'የዳታ ቤዝ አስተዳደር ቡድን', 'ወ', '11', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 50540.00, 28200.00, '0000-00-00', 24250.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 2.60, 'ባህርዳር ዩኒቨርስቲ', NULL, 0, 0, 'የዳታ ቤዝ አስተዳደር ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(294, 'EA-44665', 'አቤል ፊታሞ ሰዴቦ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ወ', '10', 'ሀዲያ', 'ኘሮቴስታንት', NULL, '0000-00-00', 0, 42860.00, 11000.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ', 'BA', 2.66, 'አዳማ', '0000-00-00', NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(295, 'EU-987', 'የማታ ይገዙ ውቤ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'ጉራጌ', NULL, '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተር ሳይንስ\r\nኮምፒውተር ሳይንስ', 'ዲግሪ\r\nማስተርስ', 2.29, NULL, NULL, NULL, NULL, 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(296, '', 'መሬማ መሀመድ አሊ', 'የዳታ ቤዝ አስተዳደር ከፍተኛ ኢንጂነር II', 'ሴ', '10', 'አማራ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, 'አማራ', 'ባህርዳር', NULL, NULL, NULL, '929179992', NULL, 'ኮምፒውተ ሳይንስ\r\nኮምፒውተ ሳይንስ', 'ዲግሪ\r\nማስተርስ', 3.44, 'ባህርዳር ዩኒቨርሲቲ\r\nአ.አ\r\n ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የመረጃ ቴክኖሎጂ መሰረት \r\nልማት ከፍተኛ ኦፊሰር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(297, 'ED-1230', 'ዲቦራ ሀብታሙ ሞሲሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', NULL, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '918689957', NULL, 'የኮምፒውተር ሳይንስ', 'ዲግሪ', 3.81, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(298, 'EB-2015', 'ቦንቱ ብርሃኑ ተረፈ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '989053817', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር \r\nኢንጂነሪንግ/Communication Engineering', 'ዲግሪ', 3.10, 'ሠመራ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(299, 'ES-2458', 'ሰላም በላይነህ ገረመው', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '930416808', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.37, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(300, 'EM-3844', 'መታሰቢያ ጥላሁን ማንዱሪ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Information Systems', 'ዲግሪ', 3.26, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(301, 'EA-4626', 'አብዲ ፍርዲሳ ቶለሳ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '925833201', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.49, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(302, 'EM-3851', 'መገርሳ ሽብሩ አያና', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '954560572', NULL, 'በኤሌክትሪካል ምህንድስና/ኤሌክትሮኒክስ ኮሙኒኬሽን', 'ዲግሪ', 3.18, 'አዲስ አበባ ሳይንስና ቴክኖሎጂ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(303, 'EM-3840', 'መሠረት ደስታ መርጋ', 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '2033-02-08', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 42 05 18 77', NULL, 'Electronics&Communication Engineering', 'ዲግሪ', 3.23, 'አዳማ ሳይንስና ቴክኖሎጂ  ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዳታ ቤዝ አስተዳደር ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(304, 'EC-130', 'ጫላ በቀለ ያደታ', 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', 'ወ', '9', 'ኦሮሞ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 1, 38660.00, 10000.00, '0000-00-00', 20490.00, NULL, NULL, 'ኦሮሚያ', 'ቄለም ወለጋ ዳሌ ሠዲ', 'ዳሌ ሠዲ', NULL, NULL, '912384124', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር ምህንድስና', 'ድግሪ', 2.38, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'ካርጎ ስካኒንግ አስተዳደር ከፍተኛ ባለሙያ I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(306, 'EW-883', 'ውብአለም ሙሉጌታ ቡልቡላ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '7', NULL, NULL, '943175603', NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(307, 'EW-888', 'ውለታው አየለ መኮንን', 'የቴክኖሎጂ መሠረተ ልማት ቡድን', 'ወ', '11', 'አማራ', NULL, '0000-00-00', '0000-00-00', 0, 50540.00, 40300.00, '0000-00-00', 28000.00, 'ሰ-1895340', NULL, 'አማራ', NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተ ሳይንስ\r\nፕሮጀክት ማናጅመንት', 'ማስተርስማስተርስ', 3.43, 'ባህር ዳር ዩኒቨርሲቲ አ.አ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የቴክኖሎጂ መሠረተ ልማት ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(308, 'EG-1496', 'ጋዲሳ ረታ በቀለ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኣሮሚያ ክልል', NULL, NULL, NULL, NULL, '915877955', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.27, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(309, 'ET-2873', 'ቶሉ አያና እጄታ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 700.00, '14860', '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '917508727', NULL, 'ኤሌክትሪካል እና  ኮምፒውተር \r\nኢንጂነሪንግ/Communication Stream', 'ዲግሪ', 3.65, 'መቱ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(310, 'ET-2863', 'ቶሎሳ ፍቃዱ በቀለ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 700.00, '14860', NULL, NULL, NULL, NULL, NULL, NULL, '931656703', NULL, 'ኮምፒውተር ኢንጂነሪንግ', 'ድግሪ', 3.31, 'ሐረማያ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(311, 'EY-1346', 'ዮናታን ዘውዱ መኮንን', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኘሮቴስታንት', '2034-04-01', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '934255415', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.50, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(312, 'ES-2457', 'ሳሙኤል ላይችሉህ አባተ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '929270207', NULL, 'ኢንፎርሜሽን ሲስተም', 'ድግሪ', 3.36, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(313, 'ED-1225', 'ዳንኤል ተሾመ ፈይሳ', 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '939942448', NULL, 'ኮምፒውተር ኢንጂነሪንግ', 'ድግሪ', 3.28, 'ወልቂጤ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ መሠረተ ልማት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(314, '', 'ተስፋይ አለም አብርሃ', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ከፍተኛ ኢንጂነር II', 'ወ', '10', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኮምፒውተ ሳይንስ\r\nኮምፒውተር ኒትወርክ', 'ዲግሪ\r\nማስተርስ', 3.24, 'መቀሌ ዩኒቨርሲቲ\r\nደብረብርሃን\r\n ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(315, 'EG-1580', 'ጌታነህ ሙሉዓለም ገላው', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ከፍተኛ ኢንጂነር II', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 42860.00, 21600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'ቂሊንጦ ኮንዳሚኒየም', NULL, NULL, NULL, '09 20 25 98 34', NULL, 'Information technology Technicain\r\nInformation technology', 'ዲፕሎማ\r\nድግሪ', 0.00, 'የደብረ ማርቆስ ቴክ/ሙያ ኮሌጅ\r\nደብረ ማርቆስ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ከፍተኛ ኢንጂነር II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(316, 'ES-2460', 'ሲንጊተን ሰቦቃ አዱኛ', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '917161732', NULL, 'በኤሌክትሪካል ምህንድስና/ኤሌክትሮኒክስ ኮሙኒኬሽን', 'ዲግሪ', 3.29, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(317, 'ET-2869', 'ታደሰ  ፀጋ  በዛ', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '919505059', NULL, 'ኮምፒውተር ሳይንስ', 'ድግሪ', 3.52, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(318, 'ES-2461', 'ሰናይት ሀንዴቦ በራሳ', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', 'ፍቼ', NULL, NULL, NULL, '946311414', NULL, 'በኤሌክትሪካልና ኮምፒውተር ምህንድስና/ኤሌክትሮኒክስ ኮምኒኬሽን', 'ዲግሪ', 3.41, 'ጅማ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(319, 'ED-1226', 'ደበላ ባይሳ  በሃ', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '2033-06-06', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '941888390', NULL, 'ኮምፒውተር ኢንጂነሪንግ', 'ድግሪ', 3.37, 'ድሬድዋ ዩኒቨርሲቴ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(320, 'EB-2012', 'ቦንቱ ተስፋዬ ጉዮ', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', 'ሴ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 65 05 22 89', NULL, 'Electrical and Computer Engineering', 'ድግሪ', 2.95, 'ዋቸሞ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(321, 'ET-2868', 'ጽኑኤል ኤፍሬም አለማየሁ', 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', 'ወ', '7', 'አማራ', NULL, '0000-00-00', '0000-00-00', 0, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '932213863', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 3.40, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ መሠረት ልማት ደህንነት ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(322, 'EB-1870', 'ቢሰነብት ይበልጣል አወቀ', 'የቴክኖሎጂ ድጋፍ ሰጪ ከፍተኛ ኢንጂነር I', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 38660.00, 10000.00, '0000-00-00', 20490.00, 'ሰ/1834527', '', 'አዲስ አበባ', 'ጉለሌ', 'ቀበሌ 02', 'ፈረንሳይ', '16-578', '09 31 66 87 87', 'biselove78@gmail.com', '1. ኢንፎርሜሽን ሲስተም', '1. ድግሪ', 3.17, '1. መደ ወላቡ', '0000-00-00', 0, 0, 'የቴክኖሎጂ ድጋፍ ሰጪ ከፍተኛ ኢንጂነር I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(323, 'EM-1696', 'ሙሉወርቅ መስፍን ታደሰ', 'የቴክኖሎጂ ድጋፍ ሰጪ ከፍተኛ ኢንጂነር I', 'ሴ', '9', 'ጉራጌ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 38660.00, 10000.00, NULL, 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የጽህፈት ሙያና የቢሮ አስተዳደር ኢንፎርሜሽን ቴክኖሎጂ፣ ኢንፎርሜሽን ሲስተም', 'ዲፕሎማ ፣  \r\nዲግሪ፣\r\nማስተር', 2.42, NULL, NULL, NULL, NULL, 'የቴክኖሎጂ ድጋፍ ሰጪ ከፍተኛ ኢንጂነር I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(324, 'EB-2014', 'ቦና ማሞ ቦንዳ', 'የቴክኖሎጂ ድጋፍ ሰጪ ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 11024.00, NULL, '0000-00-00', 700.00, 'የሌለው', '', NULL, NULL, NULL, NULL, NULL, '09 41 75 87 62\r\n09 2', NULL, 'Information Systems', 'ዲግሪ', 3.30, 'አምቦ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የቴክኖሎጂ ድጋፍ ሰጪ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(325, 'EJ-211', 'ጃለታ ዲዶ ጨንገሬ', 'የቴክኖሎጂ ድጋፍ ሰጪ ጀማሪ ኢንጂነር', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 8000.00, '0000-00-00', 14860.00, NULL, '', 'ኦሮሚያ ክልል', NULL, NULL, NULL, NULL, '919090242', NULL, 'ኮምፒውተር ሳይንስ', 'ዲግሪ', 3.45, 'መደወላቡ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የቴክኖሎጂ ድጋፍ ሰጪ ጀማሪ ኢንጂነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(326, 'EM-22', 'ማንጠግቦሽ ከበደ አየለ', 'የሴቶች ህፃናትና ወጣቶች ጉዳይ ዳይሬክተር', 'ሴ', '14', 'ሽናሻ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 73538.00, 27300.00, '0000-00-00', 28000.00, NULL, '', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሺገር ሲቲ', 'ኮዮፈጮ ኮንደሚኒየም', 'አዲስ', '911860594', NULL, 'አማረኛ\r\nPsychology', 'ዲግሪ \r\nማስተርስ', 2.48, 'ኮተቤ መምህራን ትምህርት ኮሌጅ፣     \r\nአዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'በሴቶች ህጻናት ጉዳይ ዳይሬክቶሬት ዳይሬክተር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(327, 'EM-3025', 'መብራት ናራሞ ጌታ', 'ሴክሬታሪ III', 'ሴ', '5', 'ወላይታ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 6, 11024.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'ን/ስ/ላፍቶ', 'ሀና ማሪያም', '11', NULL, '951077704', NULL, 'ሴክሬታሪ ሳይንስ እና ኦፊስ ማኔጅመንት', 'ደረጃ 4', NULL, 'ባህርዳር ፖሊ ቴክኒክ ኮሌጅ', '0000-00-00', 0, 0, 'ሴክሬታሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` (`id`, `file_number`, `employee_name`, `job_title`, `gender`, `job_level`, `ethnicity`, `religion`, `date_of_birth`, `hire_date`, `step`, `salary`, `allowance`, `assignment_date`, `housing_allowance`, `pension_id`, `marital_status`, `region`, `zone`, `district`, `specific_location`, `house_number`, `phone_number`, `email`, `education_type`, `education_level`, `cgpa`, `institution`, `graduation_date`, `coc_certificate`, `higher_ed_verified`, `current_job_title`, `level_dup`, `current_institution`, `experience_from`, `experience_to`, `previous_job_title`, `previous_institution`, `previous_from`, `previous_to`, `diagnosis`, `disability_type`, `column_40`, `deleted_at`, `created_at`, `updated_at`, `years_of_service`, `age`, `photo`, `document`, `fan_number`, `department_id`, `fayda`, `branch_id`) VALUES
(328, 'EG-1398', 'ገነት አስፋ ኃ/ስላሴ', 'የመልዕክት ሰራተኛ', 'ሴ', '1', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'ጉለሌ', '1', NULL, NULL, '09 39 18 95 24', NULL, '1.P', 'ቀለም', 8.00, '30.77', NULL, NULL, NULL, 'የመልዕክት ሠራኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(329, 'ES- 1027', 'ሰብለ ከበደ በላይ', 'የሴቶችና ህፃናት ጉዳይ ድጋፍና ክትትል ቡድን አስተባባሪ', 'ሴ', '10', 'አማራ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '2041-12-02', 22370.00, 'ሰ/1786166', '', 'አዲስ አበባ', 'የካ', 'ኮተቤ', '12', NULL, '913124967', NULL, 'ኘሮኪውርመንት እና ሰኘላይ ማኔጅመንት\r\nቢዝነስ አድሚኒስትሬሽን', 'ዲግሪ\r\nማስተርስ', 2.60, 'ጅግጅጋ ዩኒቨርስቲ\r\nሌድስታርስ', '0000-00-00', 0, 0, 'የሴቶችና  ህፃናት ጉዳይ  ድጋፍና ክትትል   ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(330, 'EF-448', 'ፌቨን ዮናስ ተሬሳ', 'የሴቶች ጉዳይ ድጋፍና ክትትል ከፍተኛ ባለሙያ', 'ሴ', '8', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 35116.00, 8000.00, '0000-00-00', 18620.00, NULL, NULL, 'አ.አ', 'ን/ስ/ላፍቶ', '6', 'ቄራ መብራት\r\n ሀይል', NULL, '912632556', NULL, 'ስርዓተ-ፃታና ልማት', 'ዲግሪ', 3.21, 'ሀረማያ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የሴቶች ጉዳይ ድጋፍና ክትትል  ከ/ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(331, 'EA-1585', 'አየሉ ደምስ አዘነ', 'የሴቶች ጉዳይ ድጋፍና ክትትል ከፍተኛ ባለሙያ', 'ሴ', '8', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, '0000-00-00', 18620.00, NULL, '', 'አ.አ', 'የካ ክ/ከ', 'ወ፡ 09', 'ኮተቤ መጠለያ ሰፈር', 'የቤ.ቁጥር፡ 1009', '0912 41 37 83', NULL, '1. Secretarial Science and office mgt\r\n2. አካዉንቲንግ\r\n3.', '1. Diploma\r\n\r\n2. ዲግሪ\r\n3.', 1.00, '1. ደሴ ቢዝነስና ስራ አመራር ኮሌጅ\r\n2. ሪፍት ቫሊ ዩኒቨርሲቲ', '0000-00-00', 1, 1, 'የሴቶች ጉዳይ ድጋፍና ክትትል ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(332, 'EM-3599', 'መና ገነነ መንገስቱ', 'የጤና ባለሙያ', 'ሴ', '8', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 35116.00, 8000.00, '0000-00-00', 18620.00, 'ሰ/45866231', '', 'አዲስ አበባ', 'ን/ስ/ላፍቶ', '9', 'ሳሪስ', '570', '913218415', NULL, 'ፐብሊክ ሄልዝ\r\nፐብሊክ ሄልዝ', 'ዲግሪ\r\nማስተርስ', 2.65, 'ጎንደር ዩኒቨርስቲ\r\nዳግማዊ ሚኒሊክ ህክምናና ጤና ሳይንስ ኮሌጅ', '2039-01-05', 0, 0, 'የጤና ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(333, 'EN-492', 'ነፃነት አየለ ዋቆ', 'የሴቶች ጉዳይ ድጋፍና ክትትል ባለሙያ', 'ሴ', '7', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 1, 22845.00, 7000.00, '0000-00-00', 14860.00, NULL, '', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሰንዳፋ', 'ሰንዳፋ በኬ 44 ማዞርያ', NULL, '904992363\r\n/09121292', NULL, 'ቢዝነስ ማኔጅመንት', 'ዲግሪ', 2.86, 'ሪፍት ቫሊ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የሴቶች ጉዳይ ድጋፍና ክትትል ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(334, 'EF-891', 'ፋጡማ ሙሀመድ በሽር', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ሙስሊም', '0000-00-00', '0000-00-00', 5, 10535.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ወይኒቤት አካባቢ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '947381010', NULL, 'ሆም ሳይንስና ቴክኖሎጂ\r\n/የባልትና ሳይንስ', 'ዲኘሎማ', 1.92, 'አዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የህፃናት ተንከባካቢ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(335, 'EA-4222', 'አሰገደች ፍቃዱ ይመር', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 8758.00, NULL, '0000-00-00', NULL, '7020819', '', 'አዲስ አበባ', 'ኮልፌ ቀራንዮ', '11', 'ኮልፌ', 'ኮልፌ', '910431769', NULL, 'አካውንቲግ እና በጀት ሰርቪስ', 'ደረጃ 4', NULL, 'ጌጅ ኮሌጅ', '0000-00-00', 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(336, 'ES-1749', 'ሳባ ጥበበ የማነብርሃን/ጊ/ጽዳት', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '2027-03-08', '0000-00-00', 1, 8758.00, NULL, '0000-00-00', 0.00, '1823411', '', 'አዲስ አበባ', 'ቦሌ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '912634643', NULL, 'ሂዉማን ሪሰርስ ሱፐርቪዥን', 'ደረጃ 4', NULL, 'ጌጂ ዩኒቨርሲቲ ኮሌጅ', '0000-00-00', 0, 0, 'የህፃነት ተንከበካቢ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(337, 'EL-241', 'ለወግነሽ  ተስፋዬ ነጋ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 8758.00, NULL, '0000-00-00', NULL, '1809023', '', 'አዲስ አበባ', 'የካ', 'ኮቶቤ', '10', NULL, '939596645', NULL, 'ሃርድዌር ኤንደ ኔትዉርክ ሰርቪሲንግ', 'ደረጃ 4', NULL, 'ጌጂ ዩኒቨርሲቲ ኮሌጅ', '0000-00-00', 0, 0, 'የህፃነት ተንከበካቢ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(338, 'EM-3302', 'መአዛ ፀጋዬ ወ/ማሪያም', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦሮቴዶክስ', '2029-02-09', '0000-00-00', 1, 8758.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'ቂርቆስ', '9', NULL, NULL, '910912813', NULL, 'ቢዝነስ እና ፋይናንስ', 'ደረጃ 3', NULL, 'ጌጅ ኮሌጅ', '0000-00-00', 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(339, 'EA-3447', 'አልማዝ ሽፈራው አብዶ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ ተዋህዶ', '0000-00-00', '0000-00-00', 1, 14245.00, NULL, '0000-00-00', 11110.00, NULL, '', 'አዲስ አበባ', 'ቦሌ', '11', NULL, NULL, '913322806', NULL, '1.ኮንስትራክሽን ማኔጅመንት፤', '1.ዲፕሎማ፤', NULL, '39570', NULL, 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(340, 'EM-2228', 'መሠረት በቀለ ሀ/ወልድ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 8341.00, NULL, '0000-00-00', NULL, '1809035', '', 'አዲስ አበባ', 'የካ', '16', 'ላምበረት', '399', '913191864', NULL, 'ቀለም', '12ኛ', NULL, 'ትም/ቢሮ', '0000-00-00', 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(341, 'EB-1351', 'ብርቄ መኮንን ዳዲ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 8341.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'ቱሉዲምቱ', 'አርሲማ', 'ፎርም የማስሞላው', 'ፎርም የማስሞላው', '0911873242\r\n09244316', NULL, 'አይቲ ሳፖርት ሰርቪስ', 'ደረጃ 2', NULL, NULL, '0000-00-00', 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(343, 'EY- 1063', 'የላስታወርቅ ሙሉጌታ አለማየሁ', 'የህፃናት ተንከባካቢ ሠራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 14245.00, NULL, '0000-00-00', 11110.00, NULL, NULL, 'አዲስ አበባ', 'የካ ክ/ከተማ', '11', NULL, NULL, '09 55 99 37 36', NULL, '1.ቀለም\r\n2. አካውንቲንግ', '2. 10 \r\n3. ደረጃ 2', NULL, 'ጌጅ ዩኒቨርሲቲ ኮሌጅ', '0000-00-00', 0, NULL, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(344, 'ES-2136', 'ሰላማዊት ጌታቸው ገ/ኪዳን', 'የህፃናት ተቀባይ ሠራተኛ', 'ሴ', '5', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 8758.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'ቦሌ', 'ቦሌ', 'ቦሌ', 'ቦሌ', '917063563', NULL, 'አካውንቲንግ', 'ደረጃ 4', NULL, 'ሪፍት ቫሊ ኮሌጅ', '0000-00-00', 0, 0, 'የህፃናት ተንከባካቢ ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(345, 'EE-1008', 'እመቤት ስዩም ገ/ህይወት', 'የምግብ ዝግጅትና ስርጭት', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 8758.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '13', NULL, '333/12', '913573573', NULL, 'የምግብ ዝግጅት', 'ደረጃ 3', NULL, 'Catering &\r\n Tourism Trainig InsTitute', '0000-00-00', 0, 0, 'የህፃናት  ማቆያና  የምግብ  ዝግጅት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(346, 'EH-1204', 'ሄርሜላ ዱባለ አስናቀ', 'የህፃናት  ማቆያ ማእከል ፅዳት  ሠራተኛ', 'ሴ', '2', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 8875.00, NULL, '0000-00-00', 5480.00, NULL, '', 'አዲስ አበባ', 'ጉለሌ', '4', NULL, NULL, '901/952298', NULL, 'ሃርድዌር ኤንደ ኔትዉርክ ሰርቪሲንግ', 'ደረጃ 4', NULL, 'ኢንጦጦ ፖሊ ቴክኒክ ኮሌጅ', '0000-00-00', 0, 0, 'የህፃነት ማቆያ ማዕከል ጽዳት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(347, 'ET-2650', 'ጽጌረዳ ፈቃዱ ቢራቱ', 'የህፃናት  ማቆያ ማእከል ፅዳት  ሠራተኛ', 'ሴ', '2', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 8875.00, NULL, '0000-00-00', 5480.00, NULL, '', 'አዲስ አበባ', 'ቦሌ', '9', NULL, NULL, '939097029', NULL, 'ቀለም', '10ኛ', NULL, 'ትም/ቢሮ', NULL, 0, 0, 'የህፃነት ማቆያ ማዕከል ጽዳት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(348, 'EM-1636', 'መቅደስ ዘውዱ ገብሬ', 'የህፃናት  ማቆያ ማእከል ፅዳት  ሠራተኛ', 'ሴ', '2', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 5295.00, NULL, '0000-00-00', NULL, 'ሰ/17638519', '', 'አዲስ አበባ', 'የካ', '2', NULL, '195', '901050930', NULL, 'ቀለም', '8ኛ', NULL, 'ትም/ቢሮ', '0000-00-00', 0, 0, 'የህፃናት ማቆያ ማዕከል ፅዳት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(349, 'ED-216', 'ዳዊት ላቀው ታደሰ', 'የወጣቶች ጉዳይ ድጋፍና ክትትል ቡድን አስተባባሪ', 'ወ', '10', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'ኦሮሚያ ልዩ ዞን', 'ሸገር ሲቲ', 'ኮዬፈጨ ኮንዶሚኒየም', 'ኘሮጀክት 16', '913364263', NULL, 'ኢንፎርሜሽን ሲስተም', 'ዲግሪ', 2.81, 'ጅማ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የወጣቶች ጉዳይ  ድጋፍና  ክትትል  ቡድን  አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(350, 'EA-3921', 'አይናለም ልደቱ አያኖ', 'የወጣቶች ጉዳይ ክትትል ባለሙያ', 'ሴ', '7', 'ጉራጌ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 22845.00, 7000.00, '0000-00-00', 22845.00, NULL, '', 'አዲስ አበባ', 'የካ', '8', NULL, '310', '934464214', NULL, 'የህፃናት እንክብካቤ', 'ዲግሪ', 2.84, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የወጣቶች ጉዳይ ክትትል ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(352, 'ES-2465', 'ሳራ ምትኩ ረፋ', 'ሴክረታሪ III', NULL, '5', 'ኦሮሞ', 'ኦርቶዶክስ', '2032-09-02', '0000-00-00', 0, 8341.00, NULL, '0000-00-00', 0.00, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '926715340', NULL, 'Hardware and network servicing', 'level 3', NULL, 'ወሊሶ ቴክኒክና ሙያ ት/ስ/ኮሌጅ.', '0000-00-00', 0, NULL, 'የጽ/ቤት ረዳት ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(353, 'ER-441', 'ራሄል ደቻሳ ደገፋ', 'የመልዕክት ሠራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', 0.00, 'የሌለው', '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '7', '45240', '502.02', '09 42 17 17 20', 'Raheldechassa0942@gmail.com', 'ቀለም', '10', NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(354, 'EM-344', 'መሀመድ ከድር ሁላላ', 'የጉምሩክ አሠራር ሂደት ትንተና ቡድን', 'ወ', '11', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 6, 56471.00, 28200.00, '0000-00-00', 24250.00, 'ሰ/1760888', '', 'አዲስ አበባ', 'የካ/ለሚ ኩራ', '13/02', 'ቀበሌ 01', 'የቤ.ቁ 18', '913419660', 'mohammederca@gmail.com', '1. ኢኮኖሚክስ \r\n\r\n2. ዴቬሎፕመንት ኢኮኖሚክስ', '1. ዲግሪ\r\n\r\n2. ማስተርስ', 1.00, '1. ጅማ ዩኒቨርሲቲ\r\n\r\n2. አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የጉምሩክ አሠራር ሂደት ትንተና ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(355, 'EA-774', 'አማኑኤል አብዲሳ ዲንካ', 'የጉምሩክ አሠራር ሂደት ትንተና ቡድን', 'ወ', '11', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 3, 53011.00, 28200.00, '0000-00-00', 24250.00, NULL, '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ ክ/ከተማ', 'ጋርመንት', '1', NULL, '09 10 73 33 03', 'bilisoomsaa@gmail.com', '1. International Trade &Investment Mgt \r\n2. Marketing Management', '1. ድግሪ\r\n2. ማስተርስ', 2.85, 'አዳማ ዩኒቨርሲቲ\r\nአዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የጉምሩክ አሠራር ሂደት ትንተና ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(356, 'ED-612', 'ደሳለው ሻምበል በላይ', 'የጉምሩክ አሠራር ሂደት ትንተና ቡድን', 'ወ', '11', 'አዊ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 6, 53011.00, 28200.00, '0000-00-00', 24250.00, 'ሰ/1773800', NULL, NULL, NULL, NULL, NULL, NULL, '09-18-74-10-11', NULL, 'የጉምሩክ አሠራር ሂደት ትንተና ቡድን', 'ዲግሪ\r\nሁለተኛ ዲግሪ', 2.76, 'ጅማ ዩኒቨርሲቲ\r\nአድማስ ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የጉምሩክ አሠራር ሂደት ትንተና ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(357, 'EA-4664', 'አለምሸት በቀለ መሸሻ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ሴ', '10', 'አማራ', NULL, '0000-00-00', '0000-00-00', 0, 42860.00, 21600.00, '0000-00-00', 22370.00, NULL, '', NULL, NULL, NULL, NULL, NULL, '911467042', NULL, 'ሎጂስቲክስ እና ሰፕላይ ማኔጅመንት', 'ማስተርስ', 3.35, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(358, 'ES-463', 'አቶ ሰለሞን አድማሱ አባተ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 44780.00, 21600.00, '0000-00-00', 22370.00, '1779672', NULL, 'አዲስ አበባ', 'ቦሌ', '7', 'ጎሮ', NULL, '920 442325', NULL, 'ዲግሪ', 'Governace development studies', NULL, 'ሃዋሳ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(359, '', 'አምሳለወርቅ ማርቆስ ነደምሴ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '936651715', NULL, 'የጉምሩክና ታክስ አስተዳደር በአመራርና መልካም አስተዳደር', 'ማስተርስ', 3.83, 'ሲቪል ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'በፕሮጀክቱየቢዝነስ ትንተና ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(360, '', 'ቃልኪዳን ጌታቸው ተዘራ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 44780.00, 21600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'በህዝብና  ልማት ስራ አመራር', 'BA', 2.90, 'መቆለ', '0000-00-00', NULL, NULL, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(361, 'EA-229', 'አክሊሉ ማቲዎስ  ፎርስዶ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ወ', '10', 'ሀድያ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 1, 44780.00, 11000.00, '0000-00-00', 22370.00, 'ሰ/1773800', NULL, NULL, NULL, NULL, NULL, NULL, '09 42 18 77 98', 'akedijo@gmail.com', 'Business Economics', 'ድግሪ', 3.70, 'ጎንደር ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(362, 'EY-1363', 'የሻንበል ይሁኔ ካሴ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ወ', '10', 'አማራ', NULL, '0000-00-00', '0000-00-00', 0, 42860.00, 11000.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ፐብሊክ ማኔጅመንት', 'MA', 3.68, 'ሲቨል ሰርቪስ', '0000-00-00', NULL, NULL, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(363, 'EM-79', 'መቅደስ ብርሃኑ አጥናፋ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, 'ሰ/913172', '', 'አዲስ አበባ', 'ቦሌ', '5', '24', '611', '910977212', NULL, 'አካውንቲንግ', 'ዲግሪ', 2.03, 'ቅድስተ ማሪያም ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(364, 'EM-358', 'ሞላ ሰርዋና ሲጃ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ወ', '10', 'ጉራጌ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, 'ሰ/1783071', '', 'አዲስ አበባ', 'ኮልፌ ቀራንዮ', '5', NULL, NULL, '09 12 45 09 69', 'mollasir@gmail.com', 'ማኔጅመንት', 'ድግሪ', 3.09, 'ሀሮማያ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(365, 'EH-464', 'ሀብታሙ  ወ/ሀና ወ/ዮሀንስ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 1300.00, NULL, '', 'አዲስ አበባ', 'ቦሌ', '6', NULL, NULL, '09 12 00 52 97', 'habtishw123@gmail.com', '1. Economics\r\n2. Customs Administration', '1. ድግሪ\r\n2. ማስተርስ', 3.16, '1. ባህር ዳር ዩኒቨርሲቲ\r\n2. ሲቪል ሰርቪስ', '0000-00-00', 0, 0, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(366, 'EM-50', 'መአዛ ግርማ አበበ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ I', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 40620.00, 10000.00, '0000-00-00', 20490.00, 'ሰ/784014', '', 'አዲስ አበባ', 'የካ', '14', '14', 'ፎርም ሲመጣ', '902529575', NULL, 'አካውንቲንግ፣ \r\nአካውንቲንግ', 'ዲኘሎማ\r\nዲግሪ', 2.21, 'ዩኒቲ ዩኒቨርስቲ፣\r\nአድማስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(367, 'EM-3883', 'ማለዳ ቲሳ አዳል', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ I', 'ወ', '9', 'ቤንሻንጉል', 'ኦርቶዶክስ', '0000-00-00', '2043-04-02', 0, 37260.00, 10000.00, '2043-04-02', NULL, '20490', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Development Management', 'ድግሪ', 3.12, 'ኢትዮጲያ ሲቪል ሰርቪስ ኮሌጅ', '0000-00-00', 0, 0, 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(368, 'EB-2037', 'በዛብህ መንገሻ ከፈለ', 'የጉምሩክ አሰራር ሂደት ትንተና ከፍተኛ ባለሙያ I', NULL, '9', NULL, NULL, NULL, NULL, 0, 37260.00, 10000.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(369, 'EB-659', 'ሳሙኤል መብራቱ ወ/መድህን', 'የጉምሩክ መረጃ አስተዳደር ከፍተኛ ባለሙያ II', 'ወ', '10', 'ጉራጌ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 21600.00, '0000-00-00', 22370.00, 'ሰ/1770270', '', 'ኦሮሚያ ልዩ ዞን', 'ሸገር ሲቲ', 'ኮዮ ፈጨ ኮንዶሚኒየም', 'ኘሮጀክት 16', 'የቤት ቁጥር ሲሞላ', '09 12 17 72 46', 'samiti0907@gmail.com', '2. እስታትስቲክስ\r\n3.Cevelopment Stdise\r\n/ የሀገር ልማት ጥናት', '2. ድግሪ\r\n3. ማትርስ/መረጃ', 2.04, 'አዲስ አበባ ዩኒቨርስቲ\r\nአዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የጉምሩክ መረጃ አስተዳደር ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(370, 'ET-753', 'ታምራት አኒሴ ዋዮሬ', 'የጉምሩክ መረጃ ስርጭት  ቡድን አስተባባሪ', 'ወ', '11', 'ሀድያ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 6, 56471.00, 28200.00, '0000-00-00', 24250.00, 'ሰ/17700183', '', 'አዲስ አበባ', 'የካ', 'የካ አባዶ ኮንዶሚኒየም', 'ብሉክ ሲሞላ', 'የቤት ቁጥር ሲሞላ', '911605462', NULL, 'ስታስቲክስ፣    \r\nቢዝነስ አድሚንስትሬሽን', 'ዲግሪ \r\nማስተርስ', 2.99, 'ሀዋሳ\r\nሊድስታር ኮሌጅ', '0000-00-00', 0, 0, 'የጉምሩክ መረጃ ስርጭት  ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(371, 'EK- 407', 'ቅድስት ብርሃኑ ሲማ', 'የጉምሩክ መረጃ ስርጭት ከፍተኛ ባለሙያ II', 'ሴ', '10', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 1, 44780.00, 21600.00, '0000-00-00', 22370.00, 'ሰ/1786041', '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ገላን ኮንዶሚኒየም', 'ገላን ኮንዶሚኒየም', 'ገላን ኮንዶሚኒየም', '913704533', 'kbirhanu5@gmail.com', '1. ስታትስቲክስ\r\n\r\n2. ዴቬሎፕመንት ኢኮኖሚክስ', '1. ቢኤ ዲግሪ\r\n\r\n2. ማስተርስ', 1.00, '1. ጎንደር ዩኒቨርሲቲ\r\n\r\n2. ሪፍት ቫሊ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የጉምሩክ መረጃ ስርጭት ከፍተኛ ባለሙያ II', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(372, 'ETS-98', 'ፀሐይ ቄስ አልቤ', 'የጉምሩክ መረጃ ስርጭት ከፍተኛ ባለሙያ I', 'ሴ', '9', 'ጋሞ', 'ኦሮቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 10000.00, '0000-00-00', 20490.00, 'ሰ/717957', '', 'አዲስ አበባ', 'ሽሮሜዳ', NULL, 'ኪዳነምህረት', '480', '911055859', 'Tsehayka7@gmail.com', 'ኢንፎርሜሽን ቴክኖሎጂ\r\nአካውንቲንግ', 'ዲኘሎማ\r\nዲግሪ', 2.04, 'CPU ኮሌጂ                           ባህርዳር ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የጉምሩክ መረጃ ስርጭት ከፍተኛ ባለሙያ I', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(373, 'ES-1896', 'ስምረት ገዛኸኝ ኢረና', 'የግንባታ ኘሮጀክት አስተዳደር ዳይሬክቶሬት/አዲስ መዋቅር', 'ሴ', '14', 'ኦሮሞ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 6, 73538.00, 27300.00, '0000-00-00', 28000.00, '2240262', '', 'አዲስ አበባ', 'ገላን', NULL, NULL, 'አዲስ', '961069514', 'simretgizahgn@gmail.com', 'ሰሴክረታሪያል ሳይንስ እና ኦፊስ ማኔጅመንት\r\nአካዉንቲንግ እና ፐብሊክ ፋይናንስ \r\nቢዝነስ አድሚኒስትሬሽን', 'ዲፕሎማ\r\nድግሪ\r\nማስተርስ', 9.99, 'ኦሮሚያ አካዳሚ ኮሌጅ\r\nኦሮሚያ ፐብሊክ ሰርቪስ ኮሌጅ\r\nሊድስታርስ ኮሌጅ', '0000-00-00', 0, NULL, 'የኮሚሽን ጽ/ቤት ኃላፊ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(374, 'ET- 2686', 'ተክሌ ተሰማ ባራሞ', 'የፕሮጀክት ሥራ አመራር የስራ ሂደት አስተባበሪ', 'ወ', '11', 'ከምባታ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 2, 56471.00, 16200.00, '0000-00-00', 24250.00, '284987', '', 'አዲስ አበባ', 'ቦሌ', '13', 'በድሮ 10', '3687', '09 11 82 23 65', 'tekletesema@yahoo.com', '1. Organizational LeaderShip\r\n2. ጂኦግራፊ', '1. ማስርስ\r\n2. ዲግሪ', 0.00, 'AZUSA PACIRIC Unibersity\r\nአዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የፕሮጀክት ስራ አመራር የስራ ሂደት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(375, 'ES-1296', 'ሰላማዊት ታሪኩ ድልነሳው', 'የፕሮጀክት ሥራ አመራር መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1803959', '', 'አዲስ አበባ', 'ለመ ኩራ', '11', 'ሰሚት', NULL, '0911 398057', 'selamawittariku@gmail.com', '1. Rular Dev\'t & Family Science\r\n2. ማኔጅመንት\r\n3. ጉምሩክ አስተዳደር', '1. ዲፕሎማ \r\n2. ቢኤ ዲግሪ \r\n3. ማስተርስ', 1.00, '1. ደቡብ ዩኒቨርሲቲ\r\n2. አርባ ምንጭ ዩኒቨርሲቲ\r\n3. ሲቪል ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የፕሮጀክት ሥራ አመራር ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(376, 'EG-468', 'ገዛኸኝ ዘውዴ ሀይሌ', 'የፕሮጀክት ሥራ አመራር መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦሮቶዶክስ', '0000-00-00', '0000-00-00', 8, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1825473', '', 'አዲስ አበባ', 'ለሚ ኩራ', 'ቦሌ አራብሳ ኮንዶሚኒየም', '45061', '15/5', '911757104', 'gezeetu@gmail.com', 'ፕሮጀክት ማኔጅመንት\r\nቢዝነስ አድሜኒስትሬሽን\r\nህግ\r\nአውቶሜካኒክ ቴክኒሽያን', 'ማስተር \r\nዲግሪ\r\nዲኘሎማ\r\nዲኘሎማ', 3.28, 'አዲስ አበባ ዩኒቨርስቲ  አዳማ ሳይንስና ቴክሎጅ ዩኒቨርሰቲ\r\nአልፋ ዩኒቨርስቲ\r\nአዳማ TVT ኮሌጅ', '0000-00-00', 0, 0, 'የኘሮጀክት ስራ አመራር  ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(377, 'EH-1015', 'ሀብቱ በላይ ኢብራሂም', 'የፕሮጀክት ሥራ አመራር ከፍተኛ ባለሙያ', 'ወ', '8', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, '0000-00-00', 18620.00, '1818919', '', 'አዲስ አበባ', '1. ላፍቶ\r\n\r\n\r\n2. ቦሌ', '1. 12 \r\n \r\n\r\n2. 4', '1. ላፍቶ መሰስቀለኛ\r\n\r\n2. ቀበሌ 14', '1. ….\r\n\r\n\r\n2. B1/13', '1. 0914 165842\r\n0943', 'belayeberahim14@gmail.com', 'ማኔጅመንት\r\nሊደርሽኘ እና ጉድ ገቨርንመንት', 'ዲግሪ\r\nማስተርስ', 2.83, '4. አልፋ ዩኒቨርሲቲ\r\n5. ሲቪል ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የፕሮጀክት ስራ አመራር ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(378, 'ES-1616', 'ሳሙኤል ግዛው ክብረት', 'የፕሮጀክት መሀንዲስ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1030009094 (የግል ማ/ዋ/ኤ)', '', 'አዲስ አበባ', 'ልደታ', '05', 'ቀበሌ 09/10', '1247', '0911 515281', 'samizman@gmail.com', '1. የቢልዲንግ ትሬድ\r\n\r\n2. አድቫንስድ የህንፃ ግንባታ ቴክንሺያን\r\n3. Civil Engineering (in Continuing Education Program)', '1. ዲፕሎማ\r\n\r\n2. ዲፕሎማ 10+3\r\n\r\n3. ዲግሪ', 1.00, '1. ጄኔራል ዊንጌት የኮንስትራክሽንና ሙያ ት/ቤት - \r\n2. አ.አ ተግባራዕድ ቴክኒክና ሙያ ት/ትና ሥልጠና ኮሌጅ \r\n3. ድሬደዋ ዩኒቨርሲቲ', '0000-00-00', 1, 0, 'የፕሮጀክት መሃንዲስ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(379, 'EE-1012', 'እልፍነሽ ለማ አኑሎ', 'የፕሮጀክት መሀንዲስ መሪ ባለሙያ', 'ሴ', '9', 'ሀድያ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1815504', '', 'አዲስ አበባ', 'ቂርቆስ', '11', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '913838749', NULL, 'ሲቪል ኢንጂነሪንግ', 'ዲግሪ', 2.94, 'አርባ ምንጭ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የፕሮጀክት መሐንዲስ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(380, 'EG-1160', 'ጌታሁን አባተ አሸብር', 'የፕሮጀክት መሀንዲስ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'አራዳ', '9', NULL, '154', '921685401', NULL, 'ሲቪል ምህንድስና', 'ዲግሪ', 3.19, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የፕሮጀክት መሀንዲስ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(381, 'EA-4650', 'አባይነሽ ግርማ አበራ', 'የግንባታ ኘሮጀክት ክትትልና ቁጥጥር ጀማሪ ማሀንዲስ', 'ሴ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 21580.00, 7000.00, '2043-07-09', 14860.00, '4612201', '', 'ኦሮሚያ ክልል', 'ሸገር ሲቲ', 'ሊገዳዲ', 'ጣፎ አደባባይ', NULL, '984507969', NULL, 'Electrical and Computer Engineering\r\nኘሮጀክት ማኔጅመንት', 'ዲግሪ\r\nሁለተኛ ዲግሪ', 3.73, 'Akmonlink College', '0000-00-00', 0, 0, 'የግንባታ ኘሮጀክት ክትትልና ቁጥጥር ጀማሪ ማሀንዲስ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(382, 'ED-1244', 'ደበላ ሆረታ አቤራ', 'የግንባታ ኘሮጀክቶች የአዋጭነት ጥናትና ውል አስተዳደር ጀማሪ ባለሙያ', 'ወ', '7', NULL, NULL, NULL, '2043-04-06', 0, 21580.00, 7000.00, '2043-04-06', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የግንባታ ኘሮጀክቶች የአዋጭነት ጥናትና ውል አስተዳደር ጀማሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(389, 'EE-1012', 'እልፍነሽ ለማ አኑሎ', 'የፕሮጀክት መሀንዲስ መሪ ባለሙያ', 'ሴ', '9', 'ሀድያ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1815504', '', 'አዲስ አበባ', 'ቂርቆስ', '11', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '913838749', NULL, 'ሲቪል ኢንጂነሪንግ', 'ዲግሪ', 2.94, 'አርባ ምንጭ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የፕሮጀክት መሐንዲስ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(390, 'EG-1160', 'ጌታሁን አባተ አሸብር', 'የፕሮጀክት መሀንዲስ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'አራዳ', '9', NULL, '154', '921685401', NULL, 'ሲቪል ምህንድስና', 'ዲግሪ', 3.19, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የፕሮጀክት መሀንዲስ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(391, 'EA-4650', 'አባይነሽ ግርማ አበራ', 'የግንባታ ኘሮጀክት ክትትልና ቁጥጥር ጀማሪ ማሀንዲስ', 'ሴ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 21580.00, 7000.00, '2043-07-09', 14860.00, '4612201', '', 'ኦሮሚያ ክልል', 'ሸገር ሲቲ', 'ሊገዳዲ', 'ጣፎ አደባባይ', NULL, '984507969', NULL, 'Electrical and Computer Engineering\r\nኘሮጀክት ማኔጅመንት', 'ዲግሪ\r\nሁለተኛ ዲግሪ', 3.73, 'Akmonlink College', '0000-00-00', 0, 0, 'የግንባታ ኘሮጀክት ክትትልና ቁጥጥር ጀማሪ ማሀንዲስ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(392, 'ED-1244', 'ደበላ ሆረታ አቤራ', 'የግንባታ ኘሮጀክቶች የአዋጭነት ጥናትና ውል አስተዳደር ጀማሪ ባለሙያ', 'ወ', '7', NULL, NULL, NULL, '2043-04-06', 0, 21580.00, 7000.00, '2043-04-06', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የግንባታ ኘሮጀክቶች የአዋጭነት ጥናትና ውል አስተዳደር ጀማሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(393, 'EF-1017', 'ፋናዬ ፋንታ ዋና', 'ሴክሬታሪ III', 'ሴ', '5', 'ጋሞ', NULL, NULL, NULL, 0, 8341.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ሴክሬታሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(394, 'ES-372', 'ሸለማ ታደሰ ከበደ', 'የትራንዚት አሰራርና ድጋፍ ቡድን አስተባባሪ', 'ወ', '10', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 2, 44468.00, 10600.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግ እና ፋይናንስ', 'ዲግሪ', 0.00, 'ጂጂጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የትራንዚት አሰራርና ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(395, 'EB-816', 'ብሩክ ሽፈራው ዳምጤ', 'የትራንዚት አሰራርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '921156167', 'biruk5199@gmail.com', 'Cooperative \r\n(Business Management)', 'ዲግሪ', 2.89, 'ጅማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የትራንዚት አሰራርና ድጋፍ መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(396, 'EA-857', 'አንተነህ ታደሰ እንደመሆኔ', 'የትራንዚት አሰራርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1772660', '', 'አዲስ አበባ', 'ቦሌ', '2', NULL, 'JEB3/2-04', '913067784', NULL, 'ማርኬቲንግ ማኔጅመንት', 'ዲግሪ', 2.84, 'አምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የትራንዚት አሠራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(397, 'EZ-603', 'ዘይኑ መሀመድ አደም', 'የትራንዚት አሰራርና ድጋፍ ከፍተኛ ባለሙያ', 'ወ', '8', 'ስልጤ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, '0000-00-00', 18620.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '961516995', NULL, 'አካውንቲንግ እና ፋይናንስ', 'ዲግሪ', 3.59, 'ዲላ ዪኒቨርስቲ', '0000-00-00', 0, 0, 'የትራንዚት አሰራርና ድጋፍ ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(398, 'EE-795', 'ኢትቻ ጉቱ ገለታ', 'የትራንዚት አሰራርና ድጋፍ ከፍተኛ ባለሙያ', 'ወ', '8', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 2, 35116.00, 8000.00, '0000-00-00', 18620.00, '1802336', NULL, NULL, NULL, NULL, NULL, NULL, '09-23-59-17-45', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 3.53, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የትራንዚት አሰራርና ድጋፍ ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(399, 'ET-391', 'ታከለ ጉተማ ቶሌራ', 'የመጋዘን አስተዳደርና ድጋፍ ቡድን አስተባባሪ', 'ወ', '10', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 8, 24278.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accounting & Finance', 'ዲግሪ', NULL, 'ጅግጅጋ ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የመጋዘን አስተዳደርና ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(400, 'EM-1802', 'ሙሉጌታ ገቲሶ ዲደሮ', 'የመጋዘን አስተዳደርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ማረቆ', NULL, '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመጋዘን አስተዳደር ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(401, 'ER-211', 'ረሺድ ዲነካ ሰይድ', 'የመጋዘን አስተዳደርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ጉራጌ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1791341', '', '1. አ.አ (ከፈቃድ ቅጽ)\r\n\r\n2. ….', '1. ቦሌ\r\n\r\n2. …', '1. 09\r\n\r\n2. …', '1. ...\r\n\r\n2. …', '1. ….\r\n\r\n2. …', '1. 0910 34 0587 (ከስራ', 'dinekareshid@gmail.com', 'ሳይኮሎጂ', 'ዲግሪ', 2.86, 'ጅማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የመጋዘን አስተዳደርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(402, 'EF-303', 'ፈለቁ ጋሻው በቀለ', 'የመጋዘን አስተዳደርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 5, 20091.00, NULL, '0000-00-00', 1200.00, 'C-7025816', '', 'አ.አ', 'የካ', '10', NULL, NULL, '912484166', NULL, 'ደረጃ 3\r\nዲግሪ', '2.32', 0.00, NULL, NULL, 0, 0, 'የመጋዘን አስተዳደርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(403, 'ES-1944', 'ሲዲሴ ዳባ ለሚ', 'የመጋዘን አስተዳደርና ድጋፍ ከፍተኛ ባለሙያ', 'ሴ', '8', 'ኦሮሞ', NULL, '0000-00-00', '0000-00-00', 0, 14872.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመጋዘን አስተዳደርና ድጋፍ ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(404, 'EB-110', 'ብርሃን ካህሳይ ካሳ', 'የካርጎ ትራኪንግ ክትትል ቡድን', 'ሴ', '10', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 4, 21478.00, NULL, '0000-00-00', 1200.00, 'ወ/725428', '', 'አዲስ አባ', 'ንፋስ ስልክ ላፍቶ', 'ጀሞ 3', 'ቀበሌ 01', '4. ጀሞ 3 /24/14', '09-11-68-47-07', 'kberhank@gmail.com', '1. ኮምቲዉተር ሳይንስ\r\n2. ንግድ ሙያ ት/ት /Comparising Academic  and Commerce)\r\n3. PC Diploma\r\n4. Information & ', '1. ዲፕሎማ\r\n\r\n2. ዲፕሎማ\r\n\r\n3. ዲፕሎማ\r\n\r\n4. BSc Degree', 1.00, 'ጅማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የካርጎ ትራኪንግ ክትትል ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(405, 'ED-895', 'ደገለ ኤርሞሎ ዋቺሶ', 'የካርጎ ትራኪንግ ክትትል ከፍተኛ ባለሙያ', 'ወ', '8', 'ሀድያ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 4, 33240.00, 8000.00, '0000-00-00', 18620.00, 'ሰ/4554434\r\n(1838053)', NULL, NULL, NULL, NULL, NULL, NULL, '913079807', NULL, 'አካዎንቲንግ እና ፋይናንስ\r\nአካዎንቲንግ እና ፋይናንስ', 'ዲግሪ\r\nማስተርስ', 3.39, 'ዋቻሞ ዩኒቨርሲቲ\r\nኒው ግሎባል ቨዥን ኮሌጅ', '0000-00-00', NULL, NULL, 'የካርጎ ትራኪንግ ክትትል ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(406, 'EJ-120', 'ጆሞ ኡኩሞ ፋጫ', 'የካርጎ ትራኪንግ ክትትል ከፍተኛ ባለሙያ', 'ወ', '8', 'ወላይታ', 'ኦርቶዶክስ', '2031-01-09', '0000-00-00', 2, 33240.00, 8000.00, '0000-00-00', 18620.00, '1810846', NULL, NULL, NULL, NULL, NULL, NULL, '917232079', NULL, 'ፐብሊክ አድምንስትሬሽን አና ዲቨሎፕመንት ማኔጅመንት\r\nቢዝነስ አድሚንስትሬሽን', 'ዲግሪ\r\nማስተርስ', 2.80, 'ወላይታ ሶዶ\r\nሰሌክት ኮሌጅ', '0000-00-00', NULL, NULL, 'የካርጎ ትራኪንግ ክትትል ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(407, 'EH-4031', 'አስራት በዶ ደበለ', 'የካርጎ ትራኪንግ ክትትል ባለሙያ', 'ወ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '2041-07-01', 1, 22845.00, 7000.00, '0000-00-00', 14860.00, '14860', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ስታቲክስ', 'ዲግሪ', 3.34, '2011', '0000-00-00', 0, 0, 'የካርጎ ትራኪንግ ክትትል ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(408, 'EA-3695', 'አበራ ታደሰ ይመኑ', 'የካርጎ ትራኪንግ ክትትል ጀማሪ ባለሙያ', 'ወ', '6', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 19660.00, 6000.00, '0000-00-00', 12990.00, 'ሰ/7013039', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የካርጎ ትራኪንግ ክትትል ጀማሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(409, 'EK-1469', 'ጌቱ ብሩህ አስማረ', 'የካርጎ ትራኪንግ ክትትል ጀማሪ ባለሙያ', 'ወ', '6', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 17980.00, 6000.00, '0000-00-00', 12990.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '918801402', NULL, 'ኬሚካል ምህንድስና', 'ዲግሪ', 3.57, 'አዲስ አበባ ሳይንስና ቴክኖሎጂ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የካርጎ ትራኪንግ ክትትል ጀማሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(410, 'EA-3657', 'አለማየሁ የተራ ካማ', 'የካርጎ ትራኪንግ ዎርክ ሾፕ ጥገና ባለሙያ', 'ወ', '7', 'ሲዳማ', 'አድቬንቲስት', '0000-00-00', '0000-00-00', 5, 24616.00, 7000.00, '2043-01-09', 14860.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ፋይናንስ እና ድቨሎፕመንት ኢኮኖሚክስ', 'የመጀመሪያ ዲግሪ', 3.01, 'አርባ ምንጭ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የካርጎ ትራኪንግ ዎርክ ሾፕ ጥገና ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(411, 'EA-492', 'አሸናፊ ግርማ አድማሱ', 'የስካኒንግ ማሽን ድጋፍና ክትትል ቡድን', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '2041-12-02', 22370.00, '1767140', '', 'አዲስ አበባ', 'ቂርቆስ', '11', NULL, '492', '911984687', NULL, 'ማትስ\r\nComputer Science\r\nInformation Science', 'ዲግሪ\r\nዲግሪ\r\nማስተርስ', 2.20, 'አዲስ አበባ ዩኒቨርስቲ\r\nሀረማያ ዩኒቨርስቲ\r\nአዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የስካኒንግ ማሽን ድጋፍና ክትትል ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(412, 'EH-802', 'ሀብታሙ አለማየሁ አዋስ', 'የስካኒንግ ማሽን ድጋፍና ክትትል መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኤሌክትሪካ ኢንጅነሪንግ', 'ዲግሪ', NULL, 'አዳማ ሳይንስ እና ቴክኔሎጂ  ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የስካኒንግ ማሽን ድጋፍና ክትትል መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(413, 'EW-438', 'ውድነህ ጋሻው ገ/ማርያም', 'የመንግስት የጉምሩክ መጋዘን አሰራርና ድጋፍ ቡድን', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '2039-02-09', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, '1791362', '', 'አዲስ አበባ', '3. ቦሌ', '3. 04', NULL, '3. 206', '3. 0910 123314', 'wudinehgetaw@gmail.com', '1. Education (Physics with Mathematics Minor)\r\n2. Accounting/\r\n3. Customs Administration', '1. ዲግሪ\r\n\r\n2. ዲግሪ\r\n\r\n3. ማስተርስ', 1.00, '1. መቐሌ ዩኒቨርስቲ\r\n\r\n2.አድማስ ዩኒቨርስቲ\r\n\r\n3.ሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የመንግስት የጉምሩክ መጋዘን አሰራርና ድጋፍ ቡድን አስተባባረ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(414, 'EB-1557', 'ብሌን አዱኛ ደግፌ', 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ሲዳማ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 38660.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 2.45, 'ወልድያ ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(415, 'EA-1693', 'አሰን አብዱ እንድሪስ', 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ሙስሊም', '0000-00-00', '0000-00-00', 8, 40620.00, 9000.00, NULL, 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Accounting', 'ዲግሪ', 3.54, 'ሚዛን ቴፒ ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(416, 'EA-2333', 'አሰፋ ደበበ ገረመው', 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 8, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, 'አዲስ አበባ', 'ኮቶቤ', '10', NULL, NULL, '913698694', NULL, 'ማርኬቲንግ ማኔጅመንት', 'ዲግሪ', 2.85, 'አዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(417, 'EW-106', 'ወይንሸት ገብሬ ወ/ስላሴ', 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '2041-12-02', 20490.00, '748913', '', 'አዲስ አበባ', 'አዲስ ከተማ', 'ቀበሌ 30/15', 'ሰሚት', '723', '911947977', NULL, 'ቢዝነስ ማኔጅመንት\r\nበፅህፈት ሙያና ቢሮ አስተዳዳር', 'ዲግሪ\r\nዲፕሎማ', 2.08, 'ሮያል ኮሌጅ\r\nአልፋ ዩኒቨርስቲ ኮሌጅ', '0000-00-00', 0, 0, 'የመንግስት  የጉምሩክ  መጋዘን  አሰራርና  ድጋፍ  መሪ  ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(418, 'EA-2365', 'አየለ ወርቁ ከበደ', 'የመንግስተ የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ጉራጌ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/2009214', '', 'አዲስ አበባ', 'ኮልፌ ቀራኒዮ', 'አየር ጤና', '8', 'ፎርም ሲመጣ', '0913266135 /09168399', 'ayuworku2@gmail.com', '1. Statistics\r\n \r\n2. Development Economics', '1. ዲግሪ\r\n2. ማስተርስ', 1.00, 'ጅማ ዩኒቨርሲቲ\r\n\r\n2. ደብረማርቆስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የመንግስት የጉምሩክ መጋዘን አሰራርና ድጋፍ መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(419, 'EH-1532', 'ሂሩት በቀለ ጊሞሬ', 'ሴክሬታሪ III', 'ሴ', '5', 'ዳውሮ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 14245.00, NULL, '0000-00-00', 11110.00, '49099899', '', 'አዲስ አበባ', 'አየር ጤና', NULL, NULL, NULL, '932484014', NULL, 'Hardware & Network Servicing', 'Level 3', 0.00, 'ቴክኒክና ሙያ', '0000-00-00', 0, 0, 'ሴክሬታሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(420, 'EH-1560', 'ሄርሜላ ደረጄ አስረሳኸኝ', 'መልዕክት ሠራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 7375.00, NULL, '0000-00-00', 3600.00, NULL, '', 'አዲስ አበባ', 'ጉለሌ', '1', '749', NULL, '901929087', NULL, 'ቀለም', NULL, NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(421, 'EA-158', 'ከበርኩ ድሪባ ፈሪሳ', 'የዕቃ አወጣጥ አሰራር ቡድን አስተባባሪ', 'ወ', '10', 'ኦሮሞ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 1, 44780.00, 10600.00, '0000-00-00', 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '09-17-50-07-86', NULL, 'ፓፕሊክ አድሚኒስትሬሽን\r\n\r\nሊደርሺፕ ኤንድ ቼንጅ ማኔጅመንት', 'ዲግሪ\r\nሁለተኛ ዲግሪ', 3.30, 'ወለጋ ዩኒቨርሲቲ\r\n\r\n\r\nኦሮሚያ ስቴት ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የዕቃ አወጣጥ አሰራር ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(422, 'ET- 351', 'ጥሩወርቅ አጎናፍር ወ/መድህን', 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 8, 22176.00, NULL, '0000-00-00', 1200.00, '1782722', '', 'አዲስ አበባ', 'ለሚ ኩራ', '5', NULL, NULL, '911157849', NULL, 'አካውንቲንግ\r\nአካውንቲንግ', 'ዲፕሎማ\r\nዲግሪ', 2.05, 'አልፋ ዩኒቨርስቲ\r\nባህርዳር ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዕቃ  አወጣጥ ድጋፍና ክትትል መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(423, 'EK-621', 'ቅድስት አስማማው ምህረቱ', 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 38660.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ቢዝነስ ማኔጅመንት', 'ዲግሪ', 2.93, 'ወልድያ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(424, 'EF-580', 'ፋናዬ ታደሰ ጥምቀቴ', 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40629.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኢኮኖሚክስ\r\nቢዝነስ አድምንስትሬሽን', 'ዲግሪ\r\nማስተርስ', 2.89, 'ሪፍት ቫሊ ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(425, 'EG-334', 'ወ/ሮ ገነት ዓለሙ ሰቦቃ', 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 21478.00, NULL, '0000-00-00', 20490.00, 'ሰ/1776010', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ማርኬቴንግ ኤንድ ሴልስ ማኔጅመንት\r\n\r\nሊደርሺኘ ኤንድ ቼንጅ ማኔጅመንት', 'ዲግሪ\r\nማስተርስ', 2.71, 'አዳማ ዩኒቨርስቲ\r\n\r\nኦሮሚያ ስቴት ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(426, 'EM-203', 'መሳይ መልኬ እንየው', 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', NULL, '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, NULL, 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(427, 'ES-535', 'ሲሳይነሽ ዓለሙ ሀብተማርያም', 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ጉራጌ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 8, 22176.00, NULL, '0000-00-00', 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0912638196\r\n09113997', NULL, 'ቢዝነስ ማኔጅመንት\r\n\r\nቢዝነስ አድመንስትሬሽን', 'የመጀመሪያ ዲግሪ\r\n\r\nሁለተኛ ዲግሪ', 2.78, 'ሪፍት ቫሊ ዩኒቨርስቲ\r\n\r\nሪፍት ቫሊ ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'የዕቃ አወጣጥ አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(428, 'EM-816', 'ሞገስ አበራ ተገኝ', 'የዕቃ አወጣጥ ድጋፍና ክትትል ቡድን', 'ወ', '10', 'አማራ', 'ኦርቶዳክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, '1771897', '', 'አዲስ አበባ', 'ቦሌ ክ/ከተማ', '5', NULL, NULL, '922904760', 'mogesabera303@gmail.com', 'ኢኮኖሚክስ\r\nዴቨሎፕመንት ኢኮኖሚክስ', 'ድግሪ\r\nማስተርስ', 3.41, 'ደብረ ብርሃን ዩኒቨርሲቲ\r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዕቃ አወጣጥ ድጋፍና ክትትል ቡድን', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(429, 'ET-472', 'ታለማ አየለ አበበ', 'የተመረጡ የኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም አዲት ቡድን አስተባበሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '5', 'ውሃ ልማት', '826', '912759655', NULL, 'Public Procurement &Asset Manangement\r\nማኔጅመንት', 'ሁለተኛ ዲግሪ\r\nዲግሪ', 3.48, 'ሲቪል ሰቪስ ዩኒቨርስቲ\r\nደብረማርቆስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የተመረጡ የኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም አዲት ቡድን አስተባበሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(430, 'EZ-259', 'ዘውዲቱ የኔአባት በላይ', 'የተመረጡ ኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም ኦዲት መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1775547', '', '1. አ.አ (ከስራ ማመልከቻ)\r\n2. ጎጃም (ከሕ/ታሪክ)\r\n3. አ.አ (ቅጽ)', '1. …\r\n\r\n2.\r\n\r\n3. የካ', '1. …\r\n\r\n2. ...\r\n\r\n3. 09', '1. …\r\n\r\n2. …\r\n\r\n3. …', '1. …\r\n\r\n2. …\r\n\r\n3. …', '1. 0920 76 3300 (ከስራ', 'zewdituy21@gmail.com', '1. ኢኮኖሚክስ\r\n\r\n\r\n\r\n2. ጉምሩክ አስተዳደር', '1. ዲግሪ\r\n\r\n\r\n\r\n\r\n2. ማስተርስ', 1.00, '1. ጅማ ዩኒቨርሲቲ\r\n\r\n\r\n\r\n\r\n2. ሲቪል ሰርቪስ ዩኒቨረሲቲ', '0000-00-00', 1, 1, 'የተመረጡ ኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም ኦዲት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(431, 'ED-48', 'ዳዊት አለማየሁ ማሞ', 'የተመረጡ ኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም ኦዲት መሪ ባለሙያ', 'ወ', '9', 'አማራ', NULL, '0000-00-00', '2035-07-04', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ቦሌ', '8', NULL, 'አዲስ', '911454284', 'elfalatda2011@gmail.com', 'ታክስና ጉምሩክ አስተዳደር\r\nቢዝነስ ኤዱኬሽን\r\nእንግሊዝኛ ቋንቋ', 'ማስተርስ\r\nዲግሪ\r\nዲፕሎማ', NULL, 'ሲቪል ሰርቪስ ዩኒቨርስቲ\r\nኢዲስ አበባ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የተመረጡ የኢኮኖሚ ተንቀሳቃሽ ሲስተም ኦዲት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(432, 'EB-303', 'ባይሳ ቡልቶ ጉተማ', 'የተመረጡ ኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም ኦዲት መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1772178', '', 'ሸገር ሲቲ', 'ገፈርሳ ጉጂ', 'ገፈርሳ ጉጂ', NULL, NULL, '923146495', 'ኦሮምኛ\r\nእንግሊዘኛ\r\nአማርኛ', 'ኢኮኖሚክስ\r\nከስተምስ አድሚኒስትሬሽን', 'ዲግሪ\r\nማስተርስ', 2.93, 'ሀረማያ ዩኒቨርስቲ\r\nየኢትዮጵያ ሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የተመረጡ  ኢኮኖሚ አንቀሳቃሽ ሲስተም ኦዲት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(433, 'EM-3193', 'ሙሉጌታ በቀለ ማራሶ', 'የተመረጡ ኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም ኦዲት ከፍተኛ ባለሙያ', 'ወ', '8', 'ሲዳማ', NULL, NULL, NULL, 1, 33240.00, 8000.00, NULL, 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(434, 'EB-1735', 'ቢሊሴ አብደታ ኢቲሳ', 'የተመረጡ ኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም ኦዲት ከፍተኛ ባለሙያ', 'ሴ', '8', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, '0000-00-00', 18620.00, 'ሰ/4216861', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግና ፋይናንስ', 'ዲግሪ', 9.99, 'መደ ወላቡ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የተመረጡ ኢኮኖሚ አንቀሳቃሾች አሰራርና ሲሰተም ኦዲት ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` (`id`, `file_number`, `employee_name`, `job_title`, `gender`, `job_level`, `ethnicity`, `religion`, `date_of_birth`, `hire_date`, `step`, `salary`, `allowance`, `assignment_date`, `housing_allowance`, `pension_id`, `marital_status`, `region`, `zone`, `district`, `specific_location`, `house_number`, `phone_number`, `email`, `education_type`, `education_level`, `cgpa`, `institution`, `graduation_date`, `coc_certificate`, `higher_ed_verified`, `current_job_title`, `level_dup`, `current_institution`, `experience_from`, `experience_to`, `previous_job_title`, `previous_institution`, `previous_from`, `previous_to`, `diagnosis`, `disability_type`, `column_40`, `deleted_at`, `created_at`, `updated_at`, `years_of_service`, `age`, `photo`, `document`, `fan_number`, `department_id`, `fayda`, `branch_id`) VALUES
(435, 'EW-100', 'ወሰኔ አበበ በየነ', 'የገቢ አሰባሰብና ክትትል የስራ ሂደት', 'ሴ', '11', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 56471.00, 16200.00, '0000-00-00', 24250.00, 'ድ/543086', '', 'አዲስ አበባ', 'የካ', '11', NULL, NULL, '911652470', NULL, 'አካውንቲንግ\r\nአካውንቲንግ', 'ዲፕሎማ\r\nዲግሪ', 2.67, 'ዩኒቲ ዩኒቨርስቲ\r\nዩኒቲ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የገቢ አሰባሰብና ክትትል  የሥራ ሂደት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(436, 'ET-102', 'ትዕግስት በላቸው ብሩ', 'የገቢ ሂሳቦች ማጠቃለያ ቡድን አስተባባሪ', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/784140', '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ ክ/ከተማ', '2', NULL, 'ልዩ 202', '09 11 15 51 89', 'Tigistb94@gmail.com', '1.P\r\n2.P', '1. Accounting\r\n2. Tax Administration\r\n3. Accounting', 1.00, '2.18\r\n2.76', '0000-00-00', 1, NULL, 'የገቢ ሂሳቦች ማጠቃለያ ቡድን\r\n አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(437, 'EB-208', 'ብሩክታይት አምዴ ጎርፌ', 'የገቢ ሂሳቦች ማጠቃለያ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 8, 22176.00, NULL, '0000-00-00', 1200.00, 'ሰ/737412', '', '1. አ.አ \r\n\r\n\r\n2. አ.አ', '1. አ.አ ቂ/ክ/ከተማ\r\n\r\n2. አራዳ', 'ወረዳ 19፣ ቀበሌ 50/04፣\r\n2. 04', 'በቅሎ ቤት\r\n\r\n2. ቀበሌ 04', '1. የቤ/ቁ፡ 1003\r\n\r\n2. 041', '921782847', 'Biruktaiyta@gmail.com', '1. Accounting CLERK\r\n /ደረጃ 2/\r\n2. Accounting\r\n\r\n3. Accounting', '1. ሰርተፍኬት\r\n\r\n2. Diploms\r\n\r\n3. ዲግሪ', 0.00, '1. Nifas Silik Technical & Vocational Training Institution\r\n2. ሪፍት ቫሊ ኮሌጅ\r\n3. አድማስ ዩኒቨርሲቲ\r\n4.', '0000-00-00', 1, 0, 'የገቢና ዋስትና ሂሳቦች አስተዳደር ክትትልና ትልልፍ መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(438, 'EM-2958', 'መስከረም ወርቁ አለሙ', 'የገቢ ሂሳቦች ማጠቃለያ ባለሙያ', 'ሴ', '7', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 4, 13146.00, NULL, '0000-00-00', 700.00, '4002548', '', 'አዲስ አበባ', 'አዲስ ከተማ', '45050', NULL, NULL, '916925589', NULL, 'የጽህፈት ስራና የቢሮ አስተዳዳር\r\nአካውንቲንግ እና ፋይናንስ', 'ዲኘሎማ\r\nዲግሪ', 2.51, 'ቅድስተ ማሪያም ኮሌጅ\r\nሀዋሳ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የገቢ ሂሳቦች ማጠቃለያ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(439, 'EW-1310', 'ግርማ አንዳርጌ በላይ', 'የተሰብሳቢ ሂሳቦች ክትትልና ትልልፍ ቡድን አስተባበሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 47468.00, 10600.00, '0000-00-00', 22370.00, '269151', '', 'አዲስ አበባ', 'ንፋ/ስ/ላ/ክ/ከተማ', '11', NULL, NULL, '911389653', 'girmandg12@gmail.com', 'የንግድ ስራ እና የገበያ አስተዳደር\r\nአካውንቲግ\r\nማርኬቲንግ ማኔጅመንት', 'ዲግሪ\r\nዲግሪ\r\nማስተር', 3.24, 'አዲስ አበባ ዩኒቨርስቲ\r\nአልፋ ዩኒቨርሲቲ ኮሌጅ\r\nአዲስ አበባ ዩኒቨርስቲ', '0000-00-00', NULL, 0, 'የተሰብሳቢዎች ሂሳቦች ክትትልና ትልልፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(440, 'ED-1031', 'ደሳለኝ መዝገቡ ዲባባ', 'የተሰብሳቢ ሂሳቦች ክትትልና ትልልፍ  መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, 'አዲስ አበባ', 'ን/ስ/ላፍቶ', '2', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '925299520', NULL, 'አካውንቲግ እና ፋይናንስ\r\nአካውንቲግ እና ፋይናንስ', 'ዲግሪ\r\nሁለተኛ ዲግሪ', 3.72, 'አየር ጤና የጤና ሳይንስና ቢዝነስ ኮሌጅ\r\nየኢትዮጵያ ሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የተሰብሳቢ ሂሳቦች ክትትልና ትልልፍ  መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(441, 'ES=396', 'ስንታየሁ አበራ በየነ', 'የተሰብሳቢ ሂሳቦች ክትትልና ትልልፍ  መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ለሚ ኩራ', '14', '1', '58/53', '09 19 18 52 03', NULL, 'አካውንቲንግ', 'ዲፕሎማ\r\nድግሪ', 2.05, 'ደሴ ወ/ሮ ስህነኝ\r\nባህርዳር ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የተሰብሳቢ ሂሳቦች ክትትልና ትልልፍ  መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(442, 'ES-78', 'ሰይፉ መንግስቱ አማረ', 'የተሰብሳቢ ሂሳቦች ክትትልና ትልልፍ ባለሙያ', 'ወ', '7', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 24616.00, 7000.00, '0000-00-00', 14860.00, NULL, '', 'አዲስ አበባ', 'የካ', '13', NULL, NULL, '922115374', 'seifuamare2012@gmail.com', 'በባንክና ፋይናንስ', 'ዲፕሎማ', 2.90, 'ከህደሩ የሚሞላ', '0000-00-00', 0, 0, 'የተሰብሳቢዎች ሂሳቦች ክትትልና ትልልፍ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(443, 'EZ-658', 'ዝናሽ አለማየሁ ካሳ', 'የተሰብሳቢ ሂሳቦች ክትትልና ትልልፍ ባለሙያ', 'ሴ', '7', 'አማራ', 'ኦርቶዶክስ', '2030-10-06', '0000-00-00', 0, 22845.00, 7000.00, '0000-00-00', 14860.00, NULL, '', 'አዲስ አበባ', 'ገጉለሌ ክ/ከተማ', '1', NULL, '637', '923321253', 'zinash1416@gmail.com', 'አካዉንቲንግ እና በጀት ሰርቪስ\r\nአካዉንቲንግ እና ፋይናንስ', 'ዲፕሎማ\r\nድግሪ', 0.00, 'ሲፒዩ የቢዝነስ እና ኢንፎርሜሽን ቴክኖሎጂ ኮሌጅ\r\nሲፒዩ የቢዝነስ እና ኢንፎርሜሽን ቴክኖሎጂ ኮሌጅ', '0000-00-00', 0, 0, 'የገቢ ሂሳቦች ማጠቃለያ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(444, 'EG-115', 'ገነት አብርሃም ክፍሌ', 'የአምራችና ወጪ ንግድ አሰራርና ድጋፍ ዳይሬክቶሬት ዳይሬክተር', 'ሴ', '14', 'ጉራጌ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 7, 73538.00, 27300.00, '0000-00-00', 2800.00, 'ሰ/783028', '', '1. አአ\r\n\r\n2. አ.አ', '1. አቃቂ ቃሊቲ\r\n\r\n2. ቦሌ', '1. ….\r\n\r\n2. ወረዳ 12', '1. ቀበሌ 03\r\n\r\n2. ….', '1. 329\r\n\r\n2. …', '1. 34 32 10\r\n\r\n2. 09', 'geniabreham@gmail.com', '1. Accounting\r\n2. Accounting\r\n3. Public Finance Mgt', '1. Diploma\r\n2. Degree\r\n3. Masters', 1.00, '1. AA Commercial College\r\n2. AA University\r\n3. Eth. Civil Service University', '0000-00-00', 0, 0, 'በዋና መ/ቤት የአምራችና ወጪ ንግድ አሰራርና ድጋፍ ዳ/ሬት ዳ/ር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(445, 'EM=3364', 'መሠረት ታደሰ ካብትይመር', 'ሴክሬታሪ III', 'ሴ', '5', 'አማራ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 6, 11024.00, NULL, '0000-00-00', NULL, 'ሰ-1803994', '', 'አዲስ አበባ', 'የካ', 'ኮተቤ', '10', NULL, '09 88 13 44 28', 'meserettadesse1942@gmail.com', 'Custome contact&secretarial Opereter', 'ዲፕሎማ/ደረጃ 3/', NULL, 'አድማስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'ሴክሬታሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(446, 'EB-2032', 'በፀሎት ስማቸው ታከለ', 'የመልዕክት ሠራተኛ', 'ሴ', '1', 'አማራ', NULL, NULL, NULL, 0, 4760.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(447, 'EM-137', 'መለሰ አለማየሁ ምትኩ', 'የኢንዳስተሪያል ፓርኮች አምራችና ወጪ ንግድ አሰራርና ድጋፍ ቡድን አስተባባሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/1773724', '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ወረዳ 12', 'ቀበሌ 06', NULL, '0913 82 2452', 'melesealemayhu04@mail.com', 'ንግስ ሥራ አመራር /Management', 'Degree', 3.13, 'ጅማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የኢንዱስትሪያል ፓርኮች አምራችና ወጪ ንግድ አሰራርና ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(448, 'EM-1741', 'መስከረም ተክሌ ክፍሌ', 'የኢንዳስተሪያል ፓርክ አምራችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1802046', '', '1. አ.አ', '1. አቃቂ ቃሊቲ', '1. 08', '1. …', '1. 424', '0921 3012 69', 'terumeski@gmail.com', '1. ኢኮኖሚክስ\r\n2. Business Administration', '1. ዲግሪ\r\n2. Masters', 1.00, '1. ደ/ብርሃን ዩኒቨርሲቲ\r\n2. Leadstar College of Management  & Leadership (Ashland University)', '0000-00-00', 0, 0, 'የኢንዱስትሪያል ፓርክ አምራችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(449, 'EA-601', 'አይናለም በቀለ ገመዳ', 'የኢንዳስተሪያል ፓርክ አምራችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '13', NULL, NULL, '0913 86 0191', NULL, '1. ኢኮኖሚክስ\r\n2. Customs Administration', 'ዲግሪ', 1.00, 'ጅማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የኢን. ፓርኮች አምራችና ወጪ ንግድ አሰራና ድጋፍ መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(450, 'EA-766', 'አስቻለው ካሳ ኑዝየ', 'የኢንዳስተሪያል ፓርክ አምራችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ጉራጌ', 'ኦርቶዶክስ', '2030-02-07', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም  የማስሞላ', '09-13-85-44-67', NULL, 'ፐብሊክ ፖሊሲ ስተዲስ.\r\n\r\nገቨርናንስና ልማት ጥናት.', 'ማስተር.\r\n ዲግሪ.', 3.94, 'ሲቪል ሰርቪስ ዩኒቨርሲቲ. ጅማ ዩኒቨርሲቲ.', '0000-00-00', 0, 0, 'የኢንዱስትሪ ፓርኮች አማራችና ወጪ ንግድ አሰራር ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(451, 'ES-34', 'ሳራ ደርቤ መንገሻ', 'የሌሎች አምራችና ወጪ ንግድ ዕቃ አሰራርና ድጋፍ ቡድን አስተባባሪ', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/1770653', '', '1. አ.አ (ከCV)\r\n2. አ.አ (ከሕ/ታሪክ)\r\n\r\n\r\n3. አ.አ (ከፈቃድ ቅጽ)', '1. …\r\n2. ን/ስልክ ላፍቶ (ከፈቃድ ቅጽ)\r\n\r\n3. ን/ስልክ ላፍቶ', '1. 19\r\n\r\n2. \r\n\r\n\r\n\r\n3. 19', '1. ቀበሌ 55\r\n2. ቀበሌ 12/13፣ ሳሪስ አዲሱ ሰፈር፣\r\n\r\n3. ቀበሌ፡ 12/13', '1. 121\r\n2. የቤ.ቁ፡ 0978\r\n3. 121/ሀ978\r\n\r\n4. ላፍቶ 09/12', '1. 43 2386 /55 5298\r', 'saraeluderibe@gmail.com', '1. D.T.P Secretarial Science & Office Mgt\r\n2. ማኔጅመንት\r\n3.', '1. Diploma (12+2)\r\n2. ዲግሪ\r\n3.', 1.00, '1. ማይክሮሊንክ የኢንፎረማቲነ ቴክኖሎጂ ኮሌጅ \r\n2. አድማስ ዩኒቨርሲቲ ኮሌጅ\r\n3.', '0000-00-00', NULL, 0, 'የሌሎች አምራችና ወጪ ንግድ ዕቃ አሰራርና ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(452, 'EM-522', 'መዓዛ ኪሮስ ገሰሰው', 'የሌሎች አምራቾችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1774484', NULL, NULL, NULL, NULL, NULL, NULL, '920704692', NULL, 'ኢኮኖሚክስ\r\n\r\nዴቨሎፕመንት ኢኮኖሚክስ', 'የመጀመሪያ ዲግሪ\r\n\r\nሁለተኛ ዲግሪ', 2.77, 'ሐረማያ ዩኒቨርሲቲ\r\n\r\nሲቪል ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የሌሎች አምራችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(453, 'ET-1873', 'ፅዮን ሳሙኤል በቀለ', 'የሌሎች አምራቾችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ወላይታ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1812096', '', 'አዲስ አበባ', 'ገላን ኮንዶማኒየም', 'ገላን ኮንዶሚኒየም', 'ገላን ኮንዶሚኒየም', 'ገላን ኮንዶሚኒየም', '916274113', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 2.21, 'ደብረብርሃን', '0000-00-00', 0, 0, 'የሌሎች አምራቾችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(454, 'EN-296', 'ንብረት አባተ አለሙ', 'የሌሎች አምራቾችና ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 40620.00, 9000.00, '0000-00-00', 20490.00, '1802333', '', '1. አ.አ\r\n\r\n2. አ.አ', '1. የካ ክ/ከ\r\n\r\n2. ለሚ ኩራ ክ/ከ', '1. ወረዳ 13\r\n2. ወረዳ 02', '1. አያት አዲስ ሰፈር\r\n2. …', '1. የቤ ቁ፡07\r\n\r\n2. 07', '1. 0920 1913 35\r\n\r\n2', 'nibreta71@gmail.com', '1. ኢኮኖሚክስ', '1. ዲግሪ', 1.00, '1. ደ/ብርሃን ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የሌሎች አምራቾች ወጪ ንግድ አሰራርና ድጋፍ መሪ ባለሙያ  - በአምራችና ወጪ ንግድ አሰራርና ድጋፍ ዳ/ሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(455, 'ET-2261', 'ታደለ ጠብቅ አስናቀ', 'የሌሎች አምራቾችና ወጪ ንግድ አሰራርና ድጋፍ ከፍተኛ ባለሙያ', 'ወ', '8', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, NULL, 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የሌሎች አምራቾችና ወጪ ንግድ አሰራርና ድጋፍ ከፍተኛ  ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(456, 'EZ-58', 'ዘመኑ ዘገየ በቀለ', 'የዋጋ ትመና እና ልማት ዳይሬክቶሬት', 'ወ', '14', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 73538.00, 27300.00, '0000-00-00', 2800.00, NULL, '', 'አዲስ አበባ', 'ጉለሌ', '18', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'አልተሞላም', NULL, 'ኢኮኖሚክስ    \r\nታክስ አድሚንስትሬሽን', 'ዲግሪ \r\n    ማስተርስ', 2.46, 'ባህርዳር ዩኒቨርስቲ   \r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የትራንዚትና መጋዘን አስተዳደር ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(457, 'EY-1256', 'የውብዳር ካሴ አባተ', 'ሴክሬታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 15428.00, NULL, '0000-00-00', 11110.00, 'ሰ-5071762', '', 'አዲስ አበባ', 'የካ', '13', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '991173670', NULL, 'ሀርድዌር እና ኔትወርክ ሰርቩስ /HNS/\r\nኮምፒውተር ሳይንስ', 'ደረጃ 4\r\nዲግሪ', 2.55, 'ያዮ ቴክኒክና ሙያ ኮሌጅ\r\nአድማስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'ሴክሬታሪ  III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(458, 'ER-483', 'ረድኤት ተስፋዬ ገ/ማርያምም', 'የመልዕክት ሠራተኛ', 'ሴ', '1', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, 'የሌለው', '', 'አዲስ አበባ', 'ቦሌ', NULL, NULL, NULL, '09 62 16 82 04', NULL, 'ቀለም', '8', NULL, 'ትም/ቢሮ', NULL, 0, NULL, 'መልዕክት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(459, 'EO-10', 'ዑመር ጉጉ ቡና', 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', 'ወ', '10', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 7, 47468.00, 10600.00, '2041-12-02', 22370.00, '1774509', '', 'አዲስ አበባ', 'ቦሌ ክ/ከ', 'ወረዳ 12', 'ቀበሌ 12', 'አዲስ', '0942 1849 19 \r\n/0910', 'kedirbuna@gmail.com', 'ኢኮኖሚክስ', 'ዲግሪ', 3.53, 'አርባ መንጭ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(460, 'EN-90', 'ንጉሴ ተስፋዬ በቀለ', 'የዋጋ ትመና ዋና መሪ ባለሙያ/ በአዲሱ መዋቅር', 'ወ', '10', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 53011.00, 16200.00, '0000-00-00', 24250.00, 'ሰ/1774540', '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ', '5', '51', 'አድስ', '910403306', 'nigust29@gmail.com', 'ኦኮኖሚክስ', 'ዲግሪ', 3.34, 'ሀዋሳ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(461, 'ES-352', 'ሰይፈ ብርሃኑ ዱቤ', 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', 'ወ', '10', 'ጉራጌ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'ልደታ', '7', NULL, '779', '09 13 46 45 43', 'seifebe@gmail.com', '1. ኢኮኖሚክስ\r\n2. ሊደርሺፕ', '1. ድግሪ\r\n2. ማተርስ', 2.80, 'ሀዋሳ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(462, 'EM-1423', 'ሙሀመድ አደም ሶሞ', 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', 'ወ', '10', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(463, 'ED-28', 'ዳንኤል ተክለብርሀን ስዩም', 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', 'ወ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'ንፋስ ስልክ', NULL, NULL, NULL, '09 14 76 10 63', 'danielseyeum07@gmail.com', '1. ኢኮኖሚክስ\r\n2. አካውንቲንግ', '1. ድግሪ\r\n2. ድግሪ', 2.61, '1. መቐለ ዩኒቨርሲቲ \r\n2. አድማስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(464, 'ETS- 21', 'ፀጋዬ ገ/ሕይወት ገ/ኪዳን', 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', 'ሴ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/1773670', NULL, 'አዲስ አበባ', 'የካ', '12', NULL, '20/21', '967296766', NULL, 'ኢኮኖሚክስ\r\nTransport Planning & Management', 'ዲግሪ\r\nማስተርስ', 2.57, 'ሀረማያ ዩኒቨርስቲ\r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዕቃ ዋጋ አደራጅ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(465, 'EA-1751', 'አብራር ኑርታታ ሙክታር', 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', 'ወ', '9', 'ስልጤ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1786489', '', 'አዲስ አበባ', 'ኮልፌ ቀ/ክ/ከ፣ ወረዳ 03፣', 'ወረዳ 03', NULL, NULL, '0921 4614 90\r\n0927 1', 'abrarnurtata@gmail.com', 'ኢኮኖሚክስ', 'ዲግሪ', 3.21, 'ወላይታ ሶዶ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(466, 'ET-1248', 'ጥሩነሽ ደዎ ፊጣ', 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '2039-05-02', 1, 38660.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አ.አ', 'ቦሌ', NULL, NULL, NULL, '917838381', NULL, 'ቢዝነስ  አድሚኒስትሬሽን', 'ዲግሪ', 3.37, 'ኒው ጀነሬሽን  ዩኒቨርስቲ ኮሌጅ', '0000-00-00', 0, NULL, 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(467, 'EE-1021', 'ኦዶሳ ገደፋ ኩምሳ', 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 3, 38660.00, 9000.00, '0000-00-00', 20490.00, 'የሰነድ ምርመራ ከ/ባለሙያ', '', '15/03/2008 ዓ.ም', 'ሠአ--51', 'ወ', 'ኦሮሞ', 'ፕሮቴስታንት', '31183', 'ዲግሪ', 'ኢኮኖሚክስ', '2007', 0.00, '3.62', NULL, NULL, NULL, 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(468, 'ES-289', 'ሱልጣን ኑር አብዱልጅባር', 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', 'ወ', '9', 'ከፊቾ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, NULL, 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '937118153/0913386441', NULL, 'አለም አቀፍ ንግድና ኢንቨስመንት', 'ዲግሪ', 3.46, 'አዳማ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የዕቃ ዋጋ አደራጅ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(469, 'EM-1035', 'መዓዛ ነጋሽ አበረ', 'የዋጋ መረጃ አደራጅ ስራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 6, 11024.00, NULL, '0000-00-00', NULL, 'C-7015065', '', 'አዲስ አበባ', 'ለሚ ኩራ', '3', NULL, NULL, '913040003', NULL, 'ኢንፎርሜሽን ቴክኖሎጂ ሳፖርት.', 'ዲፕሎማ.', 3.60, 'ጀነራል ዊንጌት.', '0000-00-00', 0, 0, 'የዋጋ መረጃ አደራጅ ስራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(470, 'EH-537', 'ሆህተ ቀለምወርቅ ሀይሌ', 'የዋጋ መረጃ አደራጅ ስራተኛ', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 6, 11024.00, NULL, '0000-00-00', NULL, 'ሰ-1779290', '', 'አዲስ አበባ', 'ጉለሌ', '1', NULL, NULL, '961075442', 'hohteke42@gmil.com', 'አካውንቲንግ', 'ደረጃ4', NULL, '41730', '0000-00-00', 0, 0, 'የዋጋ መረጃ አደራጅ \r\nባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(471, 'Ets-40', 'ጽጌ አጽብሀ ጽዋ', 'የዋጋ ትመና ኦፕሬሽን ድጋፍ ቡድን  አስተባባሪ', 'ወ', '11', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 56471.00, 16200.00, '2041-09-01', 24250.00, '1782600', '', 'ሸገር ሲቲ', 'ኮዬፈጨ ኮንዶሚኒየመ', 'ኘሮጀክት 16', NULL, NULL, '913114168', NULL, 'ኢኮኖሚክስ\r\nአካውንቲንግና ፋይናንስ', 'ዲግሪ\r\nማስተርስ', 3.46, '12/11/2000\r\n15/06/2011', '0000-00-00', 0, 0, 'የዋጋ ትመና ኦፕሬሽን ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(472, 'EA-798', 'አበበ አለሙ ባልቻ', 'የዋጋ ትመና ኦፕሬሽን ድጋፍ ቡድን  አስተባባሪ', 'ወ', '11', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 56471.00, 16200.00, '0000-00-00', 24250.00, 'ሰ/1783018', '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', 'ቱሉዲምቱ', 'ኮንዶሚኒየም', 'ኘሮጀክ 12', '09-12-66-26-23', NULL, 'ኢንተርናሽናል ትሬድ ኤንድ ኢንቨስትመንት', 'ዲግሪ', 3.46, 'አዳማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ትመና ኦፕሬሽን ድጋፍ ቡድን  አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(473, 'EZ-117', 'ዝናሽ ሙሉጌታ ጎንፋ', 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', 'ሴ', '10', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 0, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'አራዳ', '2', NULL, '258/ሀ', '951066646', NULL, 'office Adminstration &\r\nTechnology\r\ncustoms Adminstration', 'ዲግሪ\r\nማስተርስ', 2.96, 'አዳማ  ዩኒቨርስቲ\r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(474, 'ES-133', 'ስንዱ ጥሩነህ ገ/ሃና', 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', 'ሴ', '10', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ', '1', NULL, NULL, '913116537', 'dagimnat02@gmail.com', 'ኮኦኘሬቲቭ አካውንቲግ አና ኦዲቲንግ\r\n ከስተምስ አድሚኒስትሬሽን', 'ዲግሪ \r\nማስተር', 2.92, 'መቐሌ ዩኒቨርሲቲ\r\nኢት/ሲቪል ሰርቪስ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(475, 'EG-314', 'ገዛኸኝ ይልማ መኮንን', 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', 'ወ', '10', 'አማራ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 7, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ-1773629', NULL, NULL, NULL, NULL, NULL, NULL, '257752117', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 2.75, 'አ.አ ዩኒቨርሲቲ', '0000-00-00', NULL, 0, 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(476, 'EH-239', 'ሀና ወጂ ቡራቱ', 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', 'ሴ', '10', 'ጉራጌ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/1780923', '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ', '2', NULL, NULL, '913105505', 'hnnwji1@gmail.com', 'ኢኮኖሚክስ', 'ዲግሪ', 2.78, 'ሐረማያ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦኘሬሽን ድጋፍ ዋና መሪ  ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(477, 'EA-964', 'አሸናፊ አድማሱ ጀምበሬ', 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', 'ወ', '10', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '2041-12-02', 22370.00, NULL, '', 'አዲስ አበባ', 'የካ', '9', NULL, NULL, '911975789', NULL, 'ኢኮኖሚክስ\r\nCustoms Administration', 'ዲግሪ\r\nማስተርስ', 2.53, 'ሀረማያ  ዩኒቨርስቲ\r\nየኢትዮጵያ ሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዋጋ ትመና ኦፕሬሽን ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(478, 'EA-150', 'አብረኸት በላይነህ አበራ', 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', 'ሴ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, '1784000', '', 'አዲስ አበባ', 'የካ', '9', NULL, NULL, '920349796', 'belaynehabrenet@gmail.com', 'ማኔጅመንት.\r\nከስተምስ አድሚኒስትሬሽን.', 'ዲግሪ \r\nማስተር', 3.42, 'መቐሌ ዩኒቨርሲቲ\r\n ሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(479, 'ET-1148', 'ተሰማ ወርቁ ታረቀኝ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'አልተጠቀሰም', '0000-00-00', '0000-00-00', 7, 40620.00, 9000.00, '2041-12-02', 20490.00, NULL, '', 'አዲስ አበባ', 'ጉለሌ ክ/ከ', 'ወረዳ 09', NULL, NULL, '0910 1612 70', 'tesemaworku12@gmail.com', '1. ሳይኮሎጂ\r\n\r\n2. Leadership & Good Governance', '1. ዲግሪ\r\n\r\n2. ማስተርስ', 1.00, '1. ደ/ማርቆስ ዩኒቨርሲቲ\r\n\r\n2. ኢት/ሲ/ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(480, 'EK-213', 'ክንዴነው ዋለልኝ ምህረት', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1771354', '', 'አዲስ አበባ', 'የካ ክ/ከተማ፣', 'ወረዳ 09፣', 'ቀበሌ 10', NULL, '0917 6962 41', 'kindeneww12@gmail.com', 'ቢዝነስ ማናጅመንት', 'ዲግሪ', 3.78, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(481, 'ET-1247', 'ተሾመ አሰፋ ሰፊሳ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1725660', '', '2. አ.አ', '2. የካ', '2. ወረዳ 10', '2. …', '2.', '2. 0919 38 4891', 'teshomeassefa120@gmail.com', '1. እፅዋት ሳይንስ\r\n\r\n2. አካዉንቲንግ', '1. ዲፕሎማ\r\n\r\n2. ዲግሪ', 1.00, '1. የቦቀጂ ግብርና ቴክኒክ ሙያ ት/ትና ሥልጠና  ኮሌጅ \r\n2. ሪፍት ቫሊ ዩኒቨርሲቲ ኮሌጅ', '0000-00-00', 0, 0, 'የዋጋ ጥናትና ትንተና መሪ ባለሙያ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(482, 'EM-1835', 'መሀመድ ኤሊያስ ዲጋ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ጉራጌ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ኮልፌ ቀራኒዮ', '4', NULL, NULL, '911149914', 'mohammed2018seat gmail.com', 'ማናጅመንት', 'ዲግሪ', 2.81, 'ጅማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(483, 'EA-2172', 'አበራሽ ሽፈራ አስፋ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 6, 40620.00, 9000.00, '0000-00-00', 20490.00, '1801000', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '920422540', NULL, 'አካውንቲግ', 'ዲግሪ', 3.44, 'ሪፍት ቫሊ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(484, 'EB-535', 'ብርትካን ኪሮስ ጌታሁን', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, 'አዲስ አበባ', 'ልደታ', NULL, NULL, NULL, '922939805', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 2.52, 'ደብረ ብርሃን ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(485, 'EN-384', 'ነጋሳ ገረሙ ዱጋሳ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1815847', '', 'አዲስ አበባ', 'ቱሉዲምቱ', 'ኘሮጀክት 12 ኮንዶሚኒየም', 'ቱሉ ዲምቱ ኮንዶሚኒየም', NULL, '913111758', NULL, 'ማኔጅመንት', 'የመጀመያ ዲግሪ', 2.91, 'ቡሌ ሆራ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(486, 'EM-1203', 'ምስጋና ሮሮ በካ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '7030218', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '913926391', NULL, 'International Trade and Investement Management\r\nዲቭሎፕመንት ኢኮኖሚክስ', 'ዲግሪ\r\nማስተርስ', 3.39, 'አዳማ ሳይንስና ቴክኖሎጂ ዩኒቨርሲቲ\r\nአምቦ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(487, 'EH-1379', 'ሀና መሳይ አበበ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሲ/7025748', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '921801453', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 3.15, 'ቡሌሆራ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(488, 'EA-832', 'አቡሽ ፀጋዬ ወ/ትንሳኤ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, NULL, 'አዲስ አበባ', 'አራዳ', '1', NULL, '1614', '913672598', NULL, 'ህዝብና ልማት ሥራ አመራር', 'ዲግሪ', 3.17, 'መቐሌ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የዋጋ  ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(489, 'EZ-251', 'ዘቢባ አስፋው መኮንን', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 38660.00, 9000.00, '0000-00-00', 20490.00, '1775192', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '920207300', NULL, 'ማኔጅመንት', 'ዲግሪ', 3.06, 'ደብረብርሃን ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(490, 'EE-762', 'እያሱ አዛናው ገዳሙ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 1, 38660.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1790730', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '09-18-33-46-27', NULL, 'አንትሮፖሎጂ', 'ዲግሪ', 3.04, 'አ.አ. ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦኘሮሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(491, 'EJ-23', 'ጀማል አብድሮ ሰርባ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '913774949', NULL, 'ቢዝነስ አድምንስትሬሽን', 'ዲግሪ', 3.43, 'አዳማ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦኘሮሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(492, 'EF-138', 'ፍቃዱ ፈዬ ነገዎ', 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', 'ወ', '9', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '912865493', NULL, 'በህዝብ ና ልማት አስተዳደር', 'ዲግሪ', 2.80, 'ወለጋ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦኘሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(493, 'ES-81', 'ሰላማዊት አሰፋ ይግለጡ', 'የዋጋ ጥናትና ትንተና ቡድን አስተባባሪ', 'ሴ', '11', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 56471.00, 16200.00, '0000-00-00', 24250.00, NULL, '', 'አዲስ አበባ', 'አ/ቃሊቲ ክ/ከ', 'ወረዳ 06', NULL, NULL, '09 53 41 83 06 /09 1', 'selamassefa@gmail.com', '1. Management\r\n2. Public Financial Management', '1. ዲግሪ\r\n\r\n2. ማስተርስ', 1.00, '1. አ/አ ዩኒቨርሲቲ\r\n\r\n2. ኢት/ሲ/ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ጥናትና ትንተና ቡድን አስተባባሪ -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(494, 'ET-197', 'ሸዋዮ ታከለ ወልዴ', 'የዋጋ ጥናትና ትንተና ዋና መሪ ባለሙያ', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '2024-10-08', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/783015', '', 'አዲስ አበባ', 'ንፋ/ስ/ላ/ክ/ከተማ', '1', NULL, 'አዲስ', '913308547', 'Shewethang@gmail.com', 'የጽህፈትና ሙያ እና የቢሮ አስተዳደር\r\n\r\nማኔጅመንት\r\n\r\nጉምሩክ አስተዳደር', 'ዲፕሎማ\r\n\r\nዲግሪ\r\n\r\nማስተርስ', 2.14, 'አዲስ አበባ ንግድ ስራ  ኮሌጅ\r\nሴንቲሜሪ ዩኒቨርሲቲ ኮሌጅ\r\nየኢትዮጵያ ሲቪል ሰርቪስዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ጥናትና ትንተና ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(495, 'EZ=157', 'ዘነበች መላኩ ወልዴ', 'የዋጋ ጥናትና ትንተና ዋና መሪ ባለሙያ', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '2038-07-08', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ-1770870', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞ', '09 27 42 46 10', 'zenimelaku2006@gmail.com', '1. አካውንቲንግ', '1. ድግሪ', 3.04, 'ደብረ ብርሃን ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(496, 'EA-1999', 'አደም ከድር ኤቡ', 'የዋጋ ጥናትና ትንተና ዋና መሪ ባለሙያ', 'ወ', '10', 'አማራ', 'ሙስሊም', '2030-08-01', '0000-00-00', 5, 47468.00, 10600.00, NULL, 22370.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የዋጋ ጥናትና ትንተና ዋና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(497, 'EA-1726', 'አሊ አንዶ ንዳ', 'የዋጋ ጥናትና ትንተና መሪ ባለሙያ', 'ወ', '9', 'ጉራጌ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1787670', '', 'አዲስ አበባ', 'ኮልፌ ቀራኒዮ', '4', NULL, NULL, '915964816', 'Aliman4816@gmail.com', 'ማኔጅመንት', 'ድግሪ', 3.39, 'ደብረ ብርሃን ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የዋጋ ኦፕሬሽን ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(498, 'ET-1933', 'ትሁን ፀሐይ መኩሪያ', 'የዋጋ ጥናትና ትንተና መሪ ባለሙያ', 'ሴ', '9', 'አላባ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 38660.00, 9000.00, NULL, 20490.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የዋጋ ጥናትና ትንተና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(499, 'EK-31', 'ካሳዬ አየለ ሞላ', 'የታሪፍና ስሪት አገር አወሳሰን ዳይሬክቶሬት', 'ወ', '14', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 73122.00, 27300.00, '0000-00-00', 28000.00, 'ሰ-1767150', '', 'አዲስ አበባ', 'ቦሌ', '12', NULL, NULL, '09 11 60 53 51', 'Kassayele2002@gmail.com', '1. ቢዝነስ ማኔጅመንት\r\n2. Public Finance Management', '1. ድግሪ\r\n2.ማስተርስ', 2.84, '1. አዲስ አበባ ዩኒቨርሲቲ\r\n2.ኢትዮጲያ ሲቪል ሰርቪስ', '0000-00-00', 0, 0, 'የታሪፍና ስሪት አገር አወሳሰን ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(500, 'ET-2209', 'ተዋበች አስራት  ይመኑ', 'ሴክሬታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 3, 9610.00, NULL, '0000-00-00', NULL, NULL, NULL, 'አዲስ አበባ', 'ቦሌ', NULL, NULL, '628/13', '900469141', NULL, 'ከስተመር ኮንታክትና ሴክሬታሪያል ኦፕሬሽን ኮርድኔሽን\r\nአካውንቲንግና  ፋይናንስ', 'ደረጃ 4\r\nዲግሪ', 2.39, 'ሰላም ዴቪድ ሮሸሊ ቴክኒክና ሙያ\r\nሪፍት-ቫሊ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'ሴክሬታሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(501, 'ET-1527', 'ሂሩት በለጠ እንዳለ', 'የመልዕክት ሠራተኛ', 'ሴ', '1', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 7375.00, NULL, '0000-00-00', 3600.00, NULL, '', 'አዲስ አበባ', 'ቂርቆስ', '39', NULL, NULL, '90143197', NULL, 'የምግብ ዝግጅት', 'ደረጃ 2', 0.00, NULL, '0000-00-00', NULL, 0, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(502, 'EY-197', 'የኑስ ጦቢያው እጅጉ', 'የታሪፍ ፖሊሲ ጥናትና ትንተና ቡድን', 'ወ', '11', 'አማራ', 'ሙስሊም', '0000-00-00', '0000-00-00', 1, 53011.00, 16200.00, '0000-00-00', 24250.00, 'ሰ/1772627', NULL, 'አ.አ', 'ኮልፌ ቀራኒዮ', '3', NULL, NULL, '912777773', NULL, 'ኢኮኖሚክስ\r\nCustoms Administration', 'ዲግሪ\r\nማስተርስ', 2.80, 'ድሬዳዋ ዩኒቨርስቲ\r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የታሪፍ ፖሊስ ትንተና ቡድን አስተባባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(503, 'ET-1274', 'ትርንጎ ተስፋ ቢሰጠኝ', 'የታሪፍ ፖሊሲ ጥናትና ትንተና መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1803070', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', NULL, NULL, 'ኢክኖሚክስ', 'ዲግሪ', 0.00, '3.29', '2039-01-04', 0, 0, 'የታሪፍ ፖሊሲ ጥናትና ትንተና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(504, 'EA-1623', 'አንድነት ካህሱ አማረ', 'የታሪፍ ፖሊሲ ጥናትና ትንተና መሪ ባለሙያ', 'ሴ', '9', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 7, 21478.00, NULL, '0000-00-00', 1200.00, 'ሰ/975856', '', 'አዲስ አበባ', 'አራዳ ክ/ከተማ', '8', NULL, '0/64', '913641538', 'andnetk64@gmail.com', 'ሴክሬታሪያል ሳይንስና ኦፊስ ማኔጅመንት\r\n\r\nፐብሊክ ማኔጅመንት', 'ዲፕሎማ \r\n\r\nዲግሪ', 2.87, 'ብሉሚኒስ ኮሌጅ\r\nኢትዮጵያ ሲቪል ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የታሪፍ ፖሊሲ ጥናትና ትንተና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(505, 'EA-712', 'አቤል ሀሰን ሙሄ', 'የታሪፍ ፖሊሲ ጥናትና ትንተና ከፍተኛ ባለሙያ', 'ወ', '8', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, NULL, 18620.00, '1779587', '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ', '1', 'አያት ጣፎ', 'አዲስ', '09-10-00-07-68', NULL, 'በህዝብና ልማት አስተዳደር', 'ዲግሪ', 9.99, 'ድሬደዋ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የታሪፍ ፖሊሲ ጥናትና ትንተና ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(506, 'EK-847', 'ቅድስት ገለቱ ኡርቃቶ', 'የታሪፍ ፖሊሲ ጥናትና ትንተና ከፍተኛ ባለሙያ', 'ሴ', '8', 'ከምባታ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 33240.00, 8000.00, NULL, 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የታሪፍ ፖሊሲ ጥናትና ትንተና ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(507, 'EE-89', 'እንዳለ ይመር ኑርዬ', 'የታሪፍ ምደባና አሰራር ቡድን', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '2029-09-09', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', NULL, 'ለሚኩራ', '14', NULL, '181/02', '916583819', 'Yimear endale@gmil.com', 'ኢኮኖሚክስ\r\nቢዝነስ አድሚንስትሬሽን', 'BA\r\nማስተርስ', 3.89, 'ሊድስትር ኮሌጅ\r\n\r\nሀዋሳ ዩኒቨርስቲ', '0000-00-00', NULL, 0, 'የታሪፍ አሰራርና ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(508, 'EK-416', 'ቃለአብ በላይ አባዲ', 'የታሪፍ ምደባና አሰራር  መሪ ባለሙያ', 'ወ', '9', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'መቀሌ', 'ለሚኩራ', '2', NULL, 'B11/14', '913122460', 'new auk2013@ gmail.com', 'ኢኮኖሚክስ\r\nበጉምሩክ አስተዳደር \r\nየፈረንሳይ ቋንቋ  \r\nእና አለም አቀፍ ንግድ', 'BA\r\nማስተርስ አልተያያዘም', 2.57, 'ባህርዳር ዩኒቨርስቲ', '0000-00-00', NULL, 0, 'የታሪፍ ምደባና አሰራር መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(509, 'ES-1329', 'ሰለሞን አለሙ ጎበዜ', 'የታሪፍ ምደባና አሰራር መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '2031-01-08', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ-1794917', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '910269847', NULL, 'ማኔጅመንት', 'ዲግሪ', 2.67, 'ጅማ ዩንቨርስቲ', '0000-00-00', 0, 0, 'የታሪፍ ምደባና አሰራር መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(510, 'EF-342', 'ፋንታዬ ወ/ደሰንበት ኃይሌ', 'አስገዳጅ የታሪፍ መረጃ ስጪ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '2040-04-07', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ኮተቤ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '983358989', 'kokiweldesenbet B21@gmail', 'ማኔጅመንት', 'ዲግሪ', 3.03, 'ደብረ ማርቆስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'አስገዳጅ የታሪፍ መረጃ ሰጪ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(511, 'ES-190', 'ሺሻይ ሃለፎም ተካ', 'አስገዳጅ የታሪፍ መረጃ ስጪ መሪ ባለሙያ', 'ሴ', '9', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 8, 22176.00, NULL, '0000-00-00', 1200.00, NULL, '', 'አዲስ አበባ', 'ለሚ ኩራ ክ/ከተማ', NULL, 'ሰሚት ኮንዶሚኒየም', '267/11', '0961146444 /09140367', 'yayayayayayaya2001@gmail.com', 'አካዉንቲንግ\r\nአካዉንቲንግ  እና ፋይናንስ\r\nከስተምስ አድሚኒስትሬሽን', 'ዲፕሎማ\r\nድግሪ \r\nማስተርስ', 3.35, 'መቀሌ ዩኒቨርሲቲ\r\nመቀሌ ዩኒቨርሲቴ\r\nየኢትዮጵያ ሲቪል ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'አስገዳጅ የታሪፍ መረጃ ሰጪ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(512, 'EG-1184', 'ጎሳ ጉታ ቢቂላ', 'የታሪፍ ምደባና ድጋፍ  ከፍተኛ ባለሙያ', 'ወ', '8', 'ኦሮሞ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, NULL, 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የታሪፍ ምደባና ድጋፍ  ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(513, 'EH-1167', 'ሁሴን ሞላ ገዳ', 'የታሪፍ ምደባና ድጋፍ  ከፍተኛ ባለሙያ', 'ወ', '8', 'ጉራጌ', 'ሙስሊም', '2031-01-08', '0000-00-00', 2, 35116.00, 8000.00, '0000-00-00', 18620.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '916688833', NULL, 'ኢኮኖሚክስ', 'ዲግሪ', 2.51, 'ወላይታ ሶዶ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የታሪፍ ምደባና ድጋፍ ከ/ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(514, 'EB-188', 'ብርነሽ ሐጎስ ካሕሳይ', 'የስሪት አገር አወሳሰን፣ ጥናትና ትንተና ቡድን አስተባባሪ', 'ሴ', '10', 'ትግሬ', 'ኦርቶዳክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አ.አ', NULL, NULL, NULL, NULL, '914725682', NULL, 'ማኔጅመንት', 'ዲግሪ', 3.00, 'መቀሌ ዩኒቨርስቲ', '2036-10-08', 0, 0, 'የስሪት አገር አወሳሰን፣ ጥናትና ትንተና ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(515, 'EA-738', 'አመለወርቅ ስማቸው አለሙ', 'የስሪት አገር አወሳሰን፣ ጥናትና ትንተና መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ጉለሌ ክ/ከተማ', '8', NULL, 'ሰሜን ማዛጋጃ', '900023464', NULL, 'Economics\r\nማስተር ኘብሊክ ሄልዝ /MPH/', 'ዲግሪ\r\nማስተርስ', 3.45, 'ባህርዳር  ዩኒቨርስቲ\r\nባህርዳር ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የስሪት ሀገር አወሳሰን ፣ ጥናትና ትንተና መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(516, 'ET-307', 'ጥጋቡ ድራር እኑን', 'የጉምሩክ ላቦራቶሪ አስተዳደር ቡድን አስተባባሪ', 'ወ', '10', 'ትግሬ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 53011.00, 16200.00, '2041-12-02', 24250.00, NULL, NULL, 'አ.አ', 'ቦሌ', NULL, NULL, NULL, '961158659', 'አማረኛ\r\nእንግሊዘኛ', 'ኢኮኖሚክስ\r\nአካውንቲንግ\r\nከስተምስ አድሚኒስትስን', 'ዲግሪ\r\nዲግሪ\r\nማስተርስ', 3.00, 'ጎንደር  ዩኒቨርስቲ\r\nቅድስተ ማርያም ዩኒቨርስቲ\r\nየኢትዮጵያ ሲቪል ሰርቪስ ዩኒቨርስቲ', NULL, 0, 0, 'የጉምሩክ ላቦራቶሪ አስተዳደር ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(517, 'EA-616', 'አዘዘው ጫኔ አበበ', 'የህግ ተገዥነት ዘርፍ ም/ኮሚሽነር', 'ወ', '16', 'አማራ', 'ኦረቶዶክስ', '0000-00-00', '0000-00-00', 0, 75372.00, 34125.00, '0000-00-00', NULL, 'ያገባ', NULL, 'አዲስ አበባ', NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግ\r\nኢኮኖምክስ\r\nበሴክሩቲይ ሴክተር ማኔጅመንት', 'ዲኘሎማ\r\nዲግሪ\r\nሁለተኛ ዲግሪ', 3.40, 'ባህርዳር ዩኒቨርስቲ\r\nባህርዳር ዩኒቨርስቲ. CranField University(UK)', '0000-00-00', 0, 0, 'የጉምሩክ ህግ ተገዥነት ዘርፍ ምክትል ኮሚሽነር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(518, 'ES-84', 'ሰላማዊት ግርማ አመኑ', 'ከፍተኛ ሴክሬታሪ', 'ሴ', '6', 'አማራ', 'ክርስቲያን', '0000-00-00', '0000-00-00', 2, 19660.00, 6000.00, '2041-06-01', 12990.00, 'ሰ/7472250', '', 'አዲስ አበባ', NULL, 'ወ፡ 20', 'ቀበሌ 45', 'የቤ.ቁጥር 477', '915572465', NULL, 'Secretarial Science & Office Mgt', 'ዲፐሎማ', 2.59, '1. Africa Beza College', '0000-00-00', 0, 0, 'ከፍተኛ ሴክሬተሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(519, 'ET-2647', 'ትግስት እሱባለሁ አስረስ', 'የመልዕክት ሠራተኛ', 'ሴ', '2', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 5295.00, NULL, '0000-00-00', NULL, NULL, NULL, 'አዲስ አበባ', 'ኮልፌ ቀራኒዮ', '5', NULL, NULL, '913706624', NULL, 'ቀለም', '10ኛ', NULL, 'ት/ቢሮ', NULL, 0, 0, 'መልዕክት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(520, 'EB-1976', 'በሪሃ ፈረደ ታጀበ', 'የመልዕክት ሠራተኛ', 'ሴ', '2', 'ትግራይ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 5295.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, NULL, NULL, 'ቀለም', '8ኛ', NULL, 'ት/ቢሮ', '0000-00-00', 0, 0, 'መልዕክት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(521, 'EH-1195', 'ሀይሉ ድሪባ ደገላ', 'የጽ/ቤት ኃላፊ', 'ወ', '14', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 1, 73122.00, 27300.00, '0000-00-00', 28000.00, 'ሰ/1773208', '', 'አዲስ አበባ', 'ን/ስ/ላፍቶ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '1. 0911 31 61 85\r\n\r\n', 'hailudr20@gmail.com', '1. ህግ\r\n2. ህግ \r\n3. ማኔጅመንት\r\n4. ቢዝነስ አድሚኒስትሬሽን', '1. ዲፕሎማ\r\n2. ዲግሪ (L.L.B) Degree\r\n3. ዲግሪ\r\n4. ማስተርስ', 1.00, '1. ሮያል ዩኒቨርሲቲ ኮሌጅ\r\n2. ሀረማያ ዩኒቨርሲቲ\r\n3. አርባምንጭ ዩኒቨርሲቲ\r\n4. ሊድስታር', '0000-00-00', 0, 0, 'የጽ/ቤት ኃላፊ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(522, 'EF-472', 'ፍላጐት በዳኔ ጎዳና', 'የህግ ተገዥነት ዘርፍ አማካሪ', 'ወ', '10', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '2039-08-03', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/1801601', '', 'አዲስ አበባ', 'የካባዶ', 'ኮንዶሚኒየም', NULL, NULL, '916127438', NULL, '1. Cooperatives Under Accounting & Auditing Stream\r\n2. Customs Administration', '1.  ዲግሪ\r\n2. ማስተርስ', 1.00, '1. መቀሌ ዩኒቨርሲቲ\r\n2. ኢት. ሲቪል ሰርቪስ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የህግ ተገዢነት ዘርፍ አማካሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(523, 'EG-4', 'ገ/የሱስ ገ/ሂወት ሀጎስ', 'የህግ ተገዥነት ስጋት ስራ አመራር ዳይሬክቶሬት', 'ወ', '14', 'ትግሬ', 'ክርስትና', '0000-00-00', '0000-00-00', 7, 73538.00, 27300.00, '0000-00-00', 28000.00, '1767096', '', 'አዲስ አበባ', 'ን/ስ/ላፍቶ ክ/ከ', '10', '2. ቀ፡10/18', '2. የቤ.ቁ፡ 1924', '2. 0913 2360 45', 'gereeco@gmail.com', '1. ኢኮኖሚክስ\r\n2. የንግድ ፖሊሲ /Trade Policy Analysis/', '1. ዲግሪ\r\n2. ማስተርስ', 1.00, '1. ጅማ ዩኒቨርሰቲ\r\n2. አ.አ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የህግ ተገዥነት ስጋት ስራ አመራር ዳይሬክቶሬት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(524, 'EH-1217', 'ሀገር ደምሴ ሀይሉ', 'ሴክሬታሪ III', 'ሴ', '5', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 15428.00, NULL, '0000-00-00', 11110.00, 'ሰ/7005243', '', 'አዲስ አበባ', 'የካ ክ/ከ', 'ወ፡ 11', 'ቀበሌ 19', NULL, '0921 2222 60 /0942 5', 'demissehager85@gmail.com', '1. Secretarial Science & Office Mgt', 'ደረጃ 4 /ዲፕሎማ/', 9.99, 'Queens\' College', '0000-00-00', 1, 0, 'ሴክሬተሪ III -', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(525, 'EM-3876', 'መቅደስ ፈለቀ ተቀባይ', 'የመልዕክት ሠራተኛ', 'ሴ', '1', 'ጉራጌ', NULL, NULL, '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'የመልዕክት ሠራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(526, 'EG-45', 'ገ/ስላሴ ወ/ገብረኤል ይህደጎ', 'የህግ ተገዥነት ስትራቴጂ ጥናት የስራ ሂደት አስተባበሪ', 'ወ', '11', 'ትግራይ', 'ኦርቶዶክስ', '2026-12-05', '0000-00-00', 2, 56471.00, 16200.00, '0000-00-00', 24250.00, NULL, '', 'አዲስ አበባ/ሸገር ሲቲ', 'ኮየፈጨ', 'ኮየፈጨ ኮንዶሚኒየም', NULL, NULL, '912082743', 'gwpenceman@gmil. Com', 'ቢዝነስ ማኔጅመንት\r\nፖሊሲ አናላይስስ', 'ዲግሪ\r\nማስተርስ', 2.78, 'ጅማ ዩኒቨርሲቲ\r\nአዲስ አበባ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'ህግ ተገዥነት ስትራቴጂ ጥናት የስራ ሂደት', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(527, 'EZ-280', 'ዚያዳ ጣሂር ማማ', 'የህግ ተገዥነት ስትራቴጂ ጥናት መሪ ባለሙያ', 'ሴ', '9', 'ኦሮሞ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, '1786089', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '09-19067243', NULL, 'ህዝብና ልማት ስራ  አመራር', 'ዲግሪ', 2.82, 'መቀሌ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የህግ ተገዥነት ስትራቴጂ ጥናት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(528, 'EH-528', 'ሃናን ሀሚድ ገበየሁ', 'የህግ ተገዥነት ስትራቴጂ ጥናት መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ሙስሊም', '0000-00-00', '0000-00-00', 6, 40620.00, 9000.00, '0000-00-00', 20490.00, '1775186', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '910035490', NULL, 'አካዎንቲንግ ኤንድ ፋይናንስ\r\nኢኮኖሚክስ', 'ማስተርስ\r\nዲግሪ', 3.00, 'የኢትዮጲያ ሲቪል ሰርቪስ ዩኒቨርሲቲ\r\nጎንደር ዩንቨርስቲ', '0000-00-00', 0, 0, 'የህግ ተገዥነት ስትራቴጂ ጥናት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(529, 'EM=498', 'መንግስቱ ባወቀ ጥሩዬ', 'የስጋት ሥራ አመራር ልማት ቡድን አስተባባሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'ቦሌ', '7', NULL, NULL, '09 66 02 73 95', 'mbawoke4@gmail.com', '1.P\r\n2.P', '1. Governance & Dvelopment,\r\n2. Public Management', 1.00, '3.00\r\n3.87', '0000-00-00', 1, NULL, 'የስጋት ሥራ አመራር ልማት ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(530, 'EA-2883', 'አዱኛ  አዳሙ ስመኝ', 'የጉምሩክ ስጋት ሥራ አመራር መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 5, 40620.00, 9000.00, '0000-00-00', 20490.00, '181889', '', 'አዲስ አበባ', 'ንፋስ ስልክ ላፍቶ ክ/ከተማ', '11', 'ሀና ማሪያም', NULL, '911881795', 'adero951788@gmail.com', 'ዲፕሎማ\r\nዲፕሎማ\r\nድግሪ', 'አካዉንቲንግ\r\nቢዝነስ አድሚንስትሬሽን', 2.25, 'አድማስ ኮሌጅ\r\nአዳማ ሳይንስ እና ቴክኖሊጂ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የጉምሩክ ስጋት ስራ አመራር መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `employees` (`id`, `file_number`, `employee_name`, `job_title`, `gender`, `job_level`, `ethnicity`, `religion`, `date_of_birth`, `hire_date`, `step`, `salary`, `allowance`, `assignment_date`, `housing_allowance`, `pension_id`, `marital_status`, `region`, `zone`, `district`, `specific_location`, `house_number`, `phone_number`, `email`, `education_type`, `education_level`, `cgpa`, `institution`, `graduation_date`, `coc_certificate`, `higher_ed_verified`, `current_job_title`, `level_dup`, `current_institution`, `experience_from`, `experience_to`, `previous_job_title`, `previous_institution`, `previous_from`, `previous_to`, `diagnosis`, `disability_type`, `column_40`, `deleted_at`, `created_at`, `updated_at`, `years_of_service`, `age`, `photo`, `document`, `fan_number`, `department_id`, `fayda`, `branch_id`) VALUES
(531, 'EH-1273', 'ሀና መሃመድ ሀሰን', 'የጉምሩክ ስጋት ሥራ አመራር ከፍተኛ ባለሙያ', 'ሴ', '8', 'ጉራጌ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 33240.00, 8000.00, '0000-00-00', 18620.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ ወረዳ 01', '1', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '936990037', 'Liyatmoon@gmail.com', 'ማኔጅመንት ኢንፎርሜሽን ሲስተም', 'ድግሪ', 2.99, 'አርሲ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የህግ ተገዥነት ስጋት ስራ አመራር ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(532, 'EN-190', 'ናርዶስ መንገሻ ብሩ', 'የስጋት ስራ አመራር ክትትልና ግምገማ  ቡድን', 'ሴ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 5, 47468.00, 10600.00, '0000-00-00', 22370.00, '1751027', '', 'አዲስ አበባ', 'የካ ክ/ከተማ', '14', 'የካ አባዶ', '589/04', '911855189', 'nardyee@gmail.com', 'ሴክረታሪ\r\nማኔጅመንት', 'ዲፕሎማ\r\nድግሪ', 9.99, 'አድማስ ዩኒቨርሲቲ\r\nየመከላከያ ሪሶርስ ማኔጅመንት ኮሌጅ', '0000-00-00', 0, 0, 'የስጋት ስራ አመራር ክትትልና ግምገማ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(533, 'ET-361', 'ቶሎሳ ጅሬኛ ዳቃ', 'የትራንዚት መጋዘን አሰተዳደር ዳይሬክቶሬት ዳይርክተር', 'ወ', '14', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 73122.00, 27300.00, '2042-06-04', 28000.00, 'ሰ/1776060', '', 'አዲስ አበባ', NULL, NULL, NULL, NULL, '915470071', NULL, 'ማነጅመንት \r\nCustoms  Administriation', 'ዲግሪ\r\nማስተርስ ዲግሪ', 3.40, 'ጅማ ዩኒቨርስቲ\r\nሲቪል ሰርቪስ ዩኒበርስቲ', '0000-00-00', 0, 0, 'የትራንዚት መጋዘን አሰተዳደር ዳይሬክቶሬት ዳይርክተር', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(534, 'EA-4659', 'አስቴር ሞገስ ሳህሌ', 'ሴክሬታሪ III', 'ሴ', '5', 'አማራ', NULL, NULL, '0000-00-00', 0, 8341.00, NULL, '0000-00-00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ሴክሬታሪ III', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(535, 'EE-1600', 'እታገኘሁ ሰብስቤ ደመቀ', 'የመልእክት ሠራተኛ', 'ሴ', '1', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 0, 4760.00, NULL, '0000-00-00', NULL, NULL, '', 'አዲስ አበባ', 'ቂርቆስ', '4', '40', NULL, '09 25 91 32 52', NULL, 'ቀለም', '8ኛ', 9.99, 'ትም/ቢሮ', '0000-00-00', 0, 0, 'የመልዕክት ሠራኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(536, 'ET-743', 'ታደለ አሰፋው አየን', 'የደንበኞች ትምህርት ቡድን አስተባባሪ', 'ወ', '10', 'አገው', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/1586502', '', 'አዲስ አበባ', 'የካ ክ/ከተማ', '8', NULL, '1/945', '09 13 69 68 63', 'taddeasfaw@gmail.com', '1. Economics\r\n2. Customs Administration', '1. ድግሪ\r\n2. ማስተርስ', 2.89, '1. ሀዋሳ ዩኒቨርሲቲ\r\n2. ሲቪል ሰርቪስ', '0000-00-00', 0, 0, 'የደንበኞች ትምህርት ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(537, 'EH-816', 'ሀብታሙ ደምሴ አወቀ', 'የደንበኞች ትምህርት መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 8, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ቦሌ', '12', NULL, '134/72', '941383825', NULL, 'ፊዚክስ\r\nEnvironmental Science\r\nኢኮኖሚክስ\r\nኢኮኖሚከስ', 'ዲግሪ\r\nማስተርስ\r\nዲግሪ\r\nማስተርስ', 3.38, 'ባህርዳር  ዩኒቨርስቲ\r\nአዲስ አበባ ዩኒቨርስቲ\r\nዩኒቲ ዩኒቨርስቲ\r\nኮተቤ ትሮፖሊታን ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የደንበኞች ትምህርት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(538, 'EN=473', 'ንፁህ ቢያድግልኝ አሰፋ', 'የደንበኞች ትምህርት መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ቦሌ', NULL, 'አራብሳ', 'B605/06', '09 13 88 72 41', NULL, '1. Secretarial Science & Management \r\n2. Sociology', '1. ዲፕሎማ\r\n2. ድግሪ', 3.15, '1. ባህር ዳር ዩኒቨርሲቲ\r\n2. ሀዋሳ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የደንበኞች ትምህርት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(539, 'ES-2141', 'ሰሎሜ ለማ ለገሰ', 'የደንበኞች ትምህርት መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 5, 20091.00, NULL, '0000-00-00', 1200.00, 'ድ/667183', '', 'አዲስ አበባ', 'ቂርቆስ', 'ወ፡08', 'ካዛንቺስ ቀበሌ 17/18', 'የቤ.ቁጥር፡ 508', '0912 11 86 14 (0920 ', 'selomelemma22@gmail.com', '1. አካዉንቲንግ\r\n3. ቲዎሎጂ\r\n2. አካዉንቲንግ', '1. ዲፕሎማ\r\n3. ዲፕሎማ\r\n2. ዲግሪ', 1.00, '1. ዩኒቲ ዩኒቨርሲቲ ኮሌጅ\r\n3. ቅድስት ስላሴ መንፈሳዊ ኮሌጅ\r\n2. አድማስ ዩኒቨርሲቲ ኮሌጅ', '0000-00-00', NULL, 0, 'የደንበኞች ትምህርት መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(540, 'EE-1236', 'ኢብሳ አደም ሁሴን', 'የደንበኞች ትምህርት ከፍተኛ ባለሙያ', 'ወ', '8', 'ኦሮሞ', 'ሙስሊም', '2032-02-01', '0000-00-00', 1, 33240.00, 8000.00, '0000-00-00', 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ኢኮኖሚክስ\r\nዲቭሎፕመንት ኢኮኖሚክስ', 'ዲግሪ\r\nማስተርስ', 3.31, 'አዳማ ሳይንስና ቴክኖሎጅ ዩኒቨርሲቲ\r\nሪፍት ቫሊ ዩኒቨርሲቲ', '0000-00-00', NULL, NULL, 'የደንበኞች ትምህርት ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(541, 'EZ-346', 'ዘውዱ ፀሐይ ተስፋው', 'የደንበኞች ፈቃድ አሰጣጥና ክትትል ቡድን አስተባባሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ ተዋህዶ', '0000-00-00', '2039-02-05', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, 'ሰ/1699936', '', 'አዲስ አበባ', 'የካ', '13', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '920767414', NULL, 'ናቹራል ሪሶርስ ኢኮኖሚክስ እና ማኔጅመንት \r\nካስተም አድምኒስትሬሽን', 'ዲግሪ\r\n\r\nማስተርስ', 3.75, '02/11/2003 \r\nJuly 04,2019', '0000-00-00', 0, 0, 'የደንበኞች ፈቃድ አሰጣጥና ክትትል ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(542, 'EA-1923', 'አዜብ ጌታቸው ኃ/ማሪያም', 'የደንበኞች ፈቃድ አሰጣጥና ክትትል መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 6, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/1774248', '', 'አዲስ አበባ', 'የካ', 'ወረዳ 13', NULL, NULL, '0911 91 1972', 'azebget76@gmail.com', '1. ሒሳብ አያያዝ (Accounting)\r\n\r\n2. Accounting', '1. ዲፕሎማ\r\n\r\n2. B.A Degree', 1.00, '1. Alpha Uni. College\r\n\r\n2. Alpha Uni. College', '0000-00-00', NULL, 0, 'የደንበኞች ፈቃድ አሰጣጥና ክትትል መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(543, 'EM-2295', 'ምህረት እንዳለ የና', 'የደንበኞች ፈቃድ አሰጣጥና ክትትል መሪ ባለሙያ', 'ሴ', '9', 'ሲዳማ', 'ኘሮቴስታንት', '0000-00-00', '0000-00-00', 1, 38660.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/7025416', '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '916413636', NULL, 'ከስተምስ አድሚኒስትሬሽን\r\n\r\nፐብሊክ አድሚንስትሬሽንና ዴቨሎፕመንት ማነጅመንት', 'ማስተርስ\r\n\r\nዲግሪ', 3.66, 'ሲቪል ሰርቪስ ዩኒቨርስቲ\r\nድሬደዋ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የደንበኞች ፈቃድ አሰጣጥና ክትትል መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(544, 'EN-347', 'ኑር ሁሴን አሊ', 'የደንበኞች ፈቃድ አሰጣጥና ክትትል መሪ ባለሙያ', 'ወ', '9', 'አማራ', 'ሙስሊም', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'አቃቂ ቃሊቲ', '2', NULL, '1390', '920137283', 'nurhussen527@gmail.com', 'ኢኮኖሚክስ\r\nፐብሊክ ፋይናንሻል ማኔጅመንት', 'ድግሪ\r\nሁለተኛ ዲግሪ', 2.54, 'ጅግጅጋ ዩኒቨርሲቲ\r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', NULL, 0, 'የደንበኞች ፈቃድ አሰጠጥና ክትትል መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(545, 'EA-4069', 'አማረች ሞሲሳ አለማየሁ', 'የደንበኞች ፈቃድ አሰጣጥና ክትትል ክፍተኛ ባለሙያ', 'ወ', '8', 'ሽናሻ', 'ፕሮቴስታንት', '2032-11-08', '0000-00-00', 1, 33240.00, 8000.00, '2043-01-09', 18620.00, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'አካውንቲንግና ፋይናንስ', 'የመጀመሪያ ዲግሪ', 2.64, 'አሶሳ ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የደንበኞች ፈቃድ አሰጣጥና ክትትል ክፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(546, 'ES-277', 'ሰለሞን ተመስገን አዲስ', 'የደንበኞች አገልግሎትና ድጋፍ ቡድን አሰተባባሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 47468.00, 10600.00, '0000-00-00', 22370.00, NULL, '', 'አዲስ አበባ', 'ቦሌ አራብሳ', 'ኮንዶሚኒየም', NULL, NULL, 'ስልክ ቁጥር', NULL, 'ከስተም አድሚኒስትሬሽን \r\nአካውንቲንግ', 'ማስተር\r\n ዲግሪ', 2.83, 'ሲቪል ሰርቪስ ዩኒቨርስቲ.                                  አድማስ ዩኒቨርስቲ.', '0000-00-00', NULL, NULL, 'የደንበኞች አገልግሎትና ድጋፍ ቡድን አስተባባሪ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(547, 'EA-393', 'አመለወርቅ ፈለቀ አበበ', 'የደንበኞች አገልግሎትና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, 'ሰ/783718', '', 'አዲስ አበባ', 'ጉለሌ', '7', '1318', 'ጉለሌ', '991126054', NULL, 'አካውንቲንግ', 'ዲግሪ', 2.25, 'ባህርዳር ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የደንበኞች አገልግሎትና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(548, 'EE-363', 'እታፈራሁ አበበ ደግፌ', 'የደንበኞች አገልግሎትና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 2, 40620.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '912954348', NULL, 'ከስተም አድሚኒስትሬሽን\r\nቢዝነስ ማኔጀመንት', 'ማስተርስ\r\nዲግሪ', 3.61, 'ሲቪል ሰርቪስ ዩኒቨርስቲ\r\nደብረብርሃን  ዩኒቨርሲቲ', '0000-00-00', 0, 0, 'የደንበኞች አገልግሎትና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(549, 'ES-339', 'ስንታየሁ ለማ ብርሃን', 'የደንበኞች አገልግሎትና ድጋፍ መሪ ባለሙያ', 'ሴ', '9', 'አማራ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 1, 38660.00, 9000.00, '0000-00-00', 20490.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '913763492', NULL, NULL, 'ቢዝነስ ማኔጅመንት', 2.54, 'ደብረ ብርሃን', '0000-00-00', NULL, 0, 'የደንበኞች አገልግሎትና ድጋፍ መሪ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(550, 'ED-226', 'ደበበ ንጉሴ በቃና', 'የደንበኞች አገልግሎትና ድጋፍ ከፍተኛ ባለሙያ', 'ወ', '8', 'ኦሮሞ', 'ኦርቶዶክስ', '0000-00-00', '0000-00-00', 8, 35116.00, 8000.00, '0000-00-00', 18620.00, NULL, '', 'አዲስ አበባ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', 'ፎርም የማስሞላ', '912858596', NULL, 'ኢኮኖሚስክ\r\nከስተምስ አድሚኒስትሬሽን እና ኢንተርናሽናል ትሬድ', 'ዲግሪ\r\nማስተርስ', 3.07, 'ሀዋሳ ዩኒቨርስቲ\r\nሲቪል ሰርቪስ ዩኒቨርስቲ', '0000-00-00', 0, 0, 'የደንበኞች አገልግሎትና ድጋፍ ከፍተኛ ባለሙያ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(551, '', 'ወ/ሪት ኡርጂ ከበደ ሰንበታ', 'የተሸከርካሪዎች አስተናባሪ/ጊዜያዊ የመረጃ ዴስክ ሠራተኛ', 'ሴ', '3', 'ኦሮሞ', 'ፕሮቴስታንት', '0000-00-00', '0000-00-00', 1, 10400.00, NULL, NULL, 7360.00, 'ሰ-7002558', NULL, NULL, NULL, NULL, NULL, NULL, '925695964', NULL, 'አካውንቲንግና ፋይናንስ', 'የመጀመሪያ ዲግሪ', 2.53, 'ሪፍትቫሊ ዩኒቨርስቲ', '0000-00-00', NULL, NULL, 'ጊዜያዊ የመረጃ ዴስክ ሰራተኛ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(571, 'EH-365', 'ሄለን ነጋሽ ክፍሌ', 'የሰው ሀብት ሙሌት መሪ ባለሙያ', 'ሴ', '9', 'Amhara', 'ኦርቶዶክስ', '1981-10-14', '2012-01-25', 1, 40620.00, 9000.00, '2012-01-25', 20490.00, '1767511', 'Single', 'Addis Ababa', 'Addis Ababa', 'Saris', '04', '089', '0913616664', 'natifeker99@gmail.com', 'Secretarial scince and office management  Marketing and sales Management', 'Bachelor', 3.65, 'ኪዊንስ ኮሌጅ አዲስ አበባ ዩኒቨርሲቲ', '2016-07-02', 1, 1, 'የሰው ሀብት ሙሌት መሪ ባለሙያ', NULL, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', '2012-11-20', NULL, NULL, NULL, NULL, NULL, NULL, 'None', NULL, NULL, '2026-04-28 07:14:51', '2026-04-28 07:40:05', NULL, NULL, NULL, 'uploads/employees/documents/1777362005_doc00659420260418065847.pdf', '58640000000000000099', NULL, NULL, NULL),
(572, 'ET-2483', 'ትዕግስት ዳንኤል ዳንታም', 'የሰው ሀብት ሪከርድና አገልግሎት ባለሙያ', 'ሴ', '7', 'Other', 'ፕሮቴስታንት', '1995-07-02', '2020-02-23', 2, 13146.00, 7000.00, NULL, 14860.00, NULL, 'Married', 'Sidama', 'Sidama', NULL, NULL, NULL, '0932545627', 'tita.dan24@gmail.com', 'IT', 'Bachelor', 2.19, 'ዋቸሞ ዩኒቨርስቲ', '2019-06-01', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'None', NULL, NULL, '2026-04-28 07:49:46', '2026-04-28 08:12:01', NULL, NULL, NULL, 'uploads/employees/documents/1777362586_doc03179420260418075206.pdf', NULL, NULL, 'uploads/employees/fayda/1777362586_doc03179720260418075612.pdf', NULL),
(573, 'ET-453', 'ተሰማ ኢዳኤ ምትኩ', 'የኮሚሽን ጽ/ቤት ኃላፊ', 'ወ', '14', 'Oromo', 'ኦርቶዶክስ', '1988-01-01', '2011-03-01', 2, 73122.00, 40300.00, '2026-03-16', 28000.00, 'C-70221387', 'Married', 'Oromia', 'ኦሮሚያ ልዩ ዞን', NULL, NULL, '09670-8', '0913014923', 'ademahmedbekar@gmail.com', 'ስታስቲክስ፣     ዲቨሎፕምንት ኢኮኖሚክስ', 'Master', 3.94, 'ዲላ ዩኒቨርስቲ ፣  ሪፍትቫሊ ዩኒቨርስቲ', '2017-06-28', 1, 1, 'የኮሚሽን ጽ/ቤት ኃላፊ', NULL, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', '2018-04-01', NULL, 'SPSS Data', 'የኢትዮጵያ ጉምሩክ ኮሚሽን', '2018-09-01', '2018-03-30', NULL, 'None', NULL, NULL, '2026-04-28 08:31:23', '2026-05-19 08:07:13', NULL, NULL, NULL, 'uploads/employees/documents/1778822257_doc03169020260417132759.pdf', '5864000000000000000', NULL, 'uploads/employees/fayda/1778822289_doc03169020260417132759.pdf', NULL),
(574, 'EM-2955', 'ሙሉጌጥ ተስፋ አሻግሬ', 'የሰው ሀብት ሪከርድና አገልግሎት ባለሙያ', 'ሴ', '7', 'Amhara', 'ፕሮቴስታንት', '1987-06-12', '2019-08-09', 1, 22845.00, 7000.00, NULL, 14860.00, NULL, 'Married', 'Amhara', NULL, NULL, NULL, NULL, '0934095542', NULL, 'ሴክሬተሪያል ኦኘሬሽን ማኔጅመንት ማኔጅመንት', 'Bachelor', 3.60, 'ሪፍት ቫሊ ዩኒቨርሲቲ', '2017-10-29', 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'None', NULL, NULL, '2026-04-28 09:08:10', '2026-05-24 15:22:55', NULL, NULL, NULL, 'uploads/employees/documents/1777367532_doc03176120260418065910.pdf', NULL, NULL, 'uploads/employees/fayda/1777367597_doc03176420260418070307.pdf', NULL),
(575, 'EMP20262956', 'J', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-15 17:05:22', '2026-05-15 17:04:54', '2026-05-15 17:05:22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employeeid` bigint(20) UNSIGNED NOT NULL,
  `document_type_id` bigint(20) UNSIGNED NOT NULL,
  `document_name` varchar(255) NOT NULL,
  `document_number` varchar(255) DEFAULT NULL,
  `issuing_authority` varchar(255) DEFAULT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `renewal_date` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `verified_by` varchar(255) DEFAULT NULL,
  `verified_at` timestamp NULL DEFAULT NULL,
  `description` text DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `tags` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`tags`)),
  `display_order` int(11) NOT NULL DEFAULT 0,
  `uploaded_by` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_documents`
--

INSERT INTO `employee_documents` (`id`, `employeeid`, `document_type_id`, `document_name`, `document_number`, `issuing_authority`, `file_path`, `file_name`, `file_type`, `file_size`, `issue_date`, `expiry_date`, `renewal_date`, `is_active`, `is_verified`, `verified_by`, `verified_at`, `description`, `remarks`, `tags`, `display_order`, `uploaded_by`, `updated_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 49, 2, 'Document', NULL, NULL, 'documents/49/hire-history/1777246341_NamootaLakkHerregabankWMOAanaalesochoosaUntitled1.pdf', 'Namoota Lakk Herrega bank WMO Aanaale sochoosa Untitled (1).pdf', 'pdf', 3099222, NULL, NULL, NULL, 1, 0, NULL, '2026-04-28 06:51:03', NULL, NULL, NULL, 1, 'Gemechu Kenea Tufa', NULL, '2026-04-26 23:32:21', '2026-04-26 23:32:21', NULL),
(2, 49, 1, 'fd', NULL, NULL, 'documents/49/educational/1777246907_DocScanner8Apr20262-33am.pdf', 'DocScanner 8 Apr 2026 2-33 am.pdf', 'pdf', 398892, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Gemechu Kenea Tufa', NULL, '2026-04-26 23:41:47', '2026-04-26 23:41:47', NULL),
(3, 49, 3, 'fdvd', NULL, NULL, 'documents/49/national-id/1777247165_employee-profile-EE-97.pdf', 'employee-profile-EE-97.pdf', 'pdf', 354966, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Gemechu Kenea Tufa', NULL, '2026-04-26 23:46:05', '2026-04-26 23:46:05', NULL),
(4, 49, 4, 'contract', NULL, NULL, 'documents/49/contract/1777247216_worker-EMP012-2026-03-10.pdf', 'worker-EMP012-2026-03-10.pdf', 'pdf', 10564, NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, 1, 'Gemechu Kenea Tufa', NULL, '2026-04-26 23:46:56', '2026-04-26 23:46:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `employee_experiences`
--

CREATE TABLE `employee_experiences` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `employee_id` bigint(20) UNSIGNED NOT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `from_date` date DEFAULT NULL,
  `to_date` date DEFAULT NULL,
  `experience_type` enum('current','previous') NOT NULL DEFAULT 'previous',
  `is_current` tinyint(1) NOT NULL DEFAULT 0,
  `display_order` int(11) NOT NULL DEFAULT 0,
  `description` text DEFAULT NULL,
  `responsibilities` text DEFAULT NULL,
  `achievements` text DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `employment_type` enum('full-time','part-time','contract','temporary','internship','volunteer') DEFAULT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `currency` varchar(3) DEFAULT 'ETB',
  `supervisor_name` varchar(255) DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`metadata`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `in_outside` enum('inside','outside') NOT NULL DEFAULT 'inside'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee_experiences`
--

INSERT INTO `employee_experiences` (`id`, `employee_id`, `institution`, `job_title`, `from_date`, `to_date`, `experience_type`, `is_current`, `display_order`, `description`, `responsibilities`, `achievements`, `location`, `employment_type`, `salary`, `currency`, `supervisor_name`, `metadata`, `created_at`, `updated_at`, `deleted_at`, `in_outside`) VALUES
(27, 18, 'የጉምሩክ አቤቱታ አጣሪ ዳይሬክቶሬት', 'የጉምሩክ አቤቱታ አጣሪ ዳይሬክቶሬት ዳይሬክተር', '2016-01-01', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'outside'),
(28, 18, NULL, 'የንግድ ገቢ ዕቃ አወጣጥ አሰራርና ድጋፍ ዳይሬክተር', '2012-08-01', '2015-12-30', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(29, 18, NULL, 'የተቋማዊ ስጋት ስራ አመራርና ስነ ምግባር ዳይሬክቶሬት ዳይሬክተር', '2012-05-13', '2012-07-30', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(30, 18, NULL, 'የጉሩክ ኦኘሬሽን ም/ስራ አስኪያጅ', '2011-05-13', '2012-05-12', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(31, 18, NULL, 'የጉምሩክ አቤቱታ አጣሪ ከፍተኛ ባለሙያ III', '2011-03-18', '2011-05-12', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(32, 18, NULL, 'የኤሌክትሮኒክስ ጨርቃ ጨርቅ አልባሳትና ጫማዎች ዕቃ አወጣጥ ንዑስ ቡድን አስተባባሪ', '2007-10-22', '2011-03-17', 'previous', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(33, 18, NULL, 'በኤሌክትሮኒክስ የኤሌክትሪክ ጨርቃ ጨርቅ አልባሳትና ጫማዎች ዕቃ አወጣጥ ጊዜያዊ ቡድን አስተባባሪ', '2006-08-01', '2007-10-21', 'previous', 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(34, 18, NULL, 'የሰነድ ምርመራ ከፍተኛ ኦፊሰር', '2005-10-25', '2006-07-31', 'previous', 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(35, 18, NULL, 'ጊዜያዊ ከፍተኛ የሰነድ ምርመራ ኦፊሰር', '2004-12-01', '2005-10-24', 'previous', 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(36, 18, NULL, 'የፍተሻ ኦፊሰር', '2004-04-01', '2004-11-30', 'previous', 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(37, 18, NULL, 'ጊዜያዊ የፍተሻ ኦፊሰር', '2003-04-22', '2004-03-30', 'previous', 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(38, 18, NULL, 'የፍተሻ ጀማሪ ኦፊሰር', '2001-11-15', '2003-04-21', 'previous', 0, 11, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(39, 18, NULL, 'የሰነድ ምርመራ ኦፊሰር', '2001-04-01', '2001-11-14', 'previous', 0, 12, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 20:50:59', '2026-03-28 20:50:59', NULL, 'inside'),
(40, 49, 'Oromia Development Association', 'IT-Officer', '2025-09-10', '2026-04-10', 'previous', 0, 6, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-03-28 18:09:35', '2026-05-16 20:58:00', NULL, 'outside'),
(50, 46, 'የጉምሩክ ኮሚሽን', 'የሰው ሀብት ስልጠናምልመላ ከፍተኛ ባለሙያ', '2018-02-27', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:04:33', '2026-03-28 22:04:33', NULL, 'inside'),
(51, 46, 'ሐራምቤ ዩኒቨርሲቲ', 'የጸረ ሙስና እና የስልጠና ክፍል ሃላፊ', '2015-04-05', '2018-10-01', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:04:33', '2026-03-28 22:04:33', NULL, 'inside'),
(52, 46, 'ሐራምቤ ዩኒቨርሲቲ', 'ማጅመንት ት/ት/ ክፍል እና ማኔጂንግ ካውንስለር', '2013-11-01', '2015-01-01', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:04:33', '2026-03-28 22:04:33', NULL, 'inside'),
(53, 46, 'TVET ኤጀንሲ', 'ተማሪ/ስልጠና', '2022-07-01', NULL, 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:04:33', '2026-03-28 22:04:33', NULL, 'inside'),
(54, 46, 'ሰላሌ ዩኒቨርሲቲ', 'Bachelor Degree - Business Administration', '2015-11-11', '2018-01-01', '', 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:04:33', '2026-03-28 22:04:33', NULL, 'inside'),
(55, 46, 'TVET Agency', 'Master Degree - Human Resource Supervision', '2022-07-01', '2024-06-30', '', 0, 11, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:04:33', '2026-03-28 22:04:33', NULL, 'inside'),
(56, 46, 'TVET Agency', 'Level IV Certificate', '2022-07-01', NULL, '', 0, 12, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:04:33', '2026-03-28 22:04:33', NULL, 'inside'),
(57, 6, 'የጉምሩክ ኮሚሽን', 'የአ/አ ንግድ ዕቃዎች ማስተናገጃ ቅ/ጽ/ቤት ሥራ አስኪያጅ', '2004-05-01', '2008-02-05', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(58, 6, 'የጉምሩክ ኮሚሽን', 'የጉምሩክ ጉዳይ ቅ/ጽ/ቤቶች ድጋፍና ክትትል ዳይሬክቶሬት ዳይሬክተር', '2008-02-06', '2010-08-19', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(59, 6, NULL, 'ለPhd ትምህርት ያለደመወዝ ፈቃድ', '2010-05-01', NULL, 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(60, 6, 'የጉምሩክ ኮሚሽን', 'የጉምሩክ ኮሚሽን ኮሚሽነር', '2011-02-16', '2026-05-01', 'previous', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-05-01 19:50:02', NULL, 'inside'),
(61, 7, 'ፌደራል ጠቅላይ ፍ/ቤት', 'ኤክስክዩቲቭ ሴክሬታሪ', '2017-09-01', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(62, 7, 'ፌደራል ጠቅላይ ፍ/ቤት', 'ሴክሬታሪ I', '2007-10-02', '2010-12-30', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(63, 7, 'ፌደራል ጠቅላይ ፍ/ቤት', 'ሴክሬታሪ II', '2009-04-01', '2010-12-30', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(64, 7, 'ፌደራል ጠቅላይ ፍ/ቤት', 'ኤክስክዩቲቭ ሴክሬታሪ I', '2011-01-01', '2017-04-30', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(65, 7, 'ፌደራል ጠቅላይ ፍ/ቤት', 'የደንበኞች አገልግሎት ባለሙያ IV', '2017-05-01', '2017-08-30', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(66, 8, 'ሲቪል ሰርቪስ ዩኒቨርሲቲ', 'ሴክሬታሪ III', '2016-03-01', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(67, 8, 'ሲቪል ሰርቪስ ዩኒቨርሲቲ', 'ሴክሬታሪ II', '2012-12-05', '2015-07-26', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(68, 9, 'የጉምሩክ ኮሚሽን', 'የኮሚሽን ጽ/ቤት ኃላፊ', '2016-04-01', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(69, 9, 'የጉምሩክ ኮሚሽን', 'የዋጋ ትመናና ልማት ዳይሬክቶሬት ዳይሬክተር', '2011-03-18', '2016-03-30', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(70, 9, 'የጉምሩክ ኮሚሽን', 'የኮሚሽኑ የለውጥ አማካሪ', '2013-08-01', '2016-03-30', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(71, 9, NULL, 'በትምህርት ላይ /የውጭ የትምህርት ዕድል', '2012-07-01', '2013-09-30', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(72, 9, 'የጉምሩክ ኮሚሽን', 'የዕቃ አወጣጥ አሰራር ዳይሬክቶርት ዳይሬክተር', '2011-09-01', '2012-06-30', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(73, 9, 'የጉምሩክ ኮሚሽን', 'የደንበኞች ትምህርትና ድጋፍ ዳይሬክቶሬት ዳይሬክተር', '2007-07-10', '2011-03-17', 'previous', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(74, 9, 'የጉምሩክ ኮሚሽን', 'ስራ አስኪያጅ', '2005-07-30', '2007-06-09', 'previous', 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(75, 9, 'የጉምሩክ ኮሚሽን', 'የሌሎች ዕቃዎች ዕቃ አወጣጥ ቡድን አስተባባሪ', '2004-04-01', '2005-07-29', 'previous', 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(76, 9, 'የጉምሩክ ኮሚሽን', 'የድንገተኛ ፍተሻ ቡድን አስተባባሪ', '2003-04-20', '2004-03-30', 'previous', 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(77, 9, 'የጉምሩክ ኮሚሽን', 'ጊ/የሰነድ ምርመራ ከፍተኛ ኦፊሰር', '2001-11-01', '2003-04-19', 'previous', 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(78, 9, 'የጉምሩክ ኮሚሽን', 'መለስተኛ የዕቃ ፍተሻ አፊሰር', '1998-10-06', '2001-10-30', 'previous', 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(79, 9, 'የጉምሩክ ኮሚሽን', 'ሴክሬታሪ ታየፒስት', '1996-03-01', '1998-10-05', 'previous', 0, 11, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:04', '2026-03-28 22:32:04', NULL, 'inside'),
(80, 11, 'የጉምሩክ ኮሚሽን', 'የኮሚሽን ጽ/ቤት ዋና መሪ ባለሙያ', '2017-10-05', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(81, 11, 'የጉምሩክ ኮሚሽን', 'በጉ/ኮሚሽነር ጽ/ቤት - ዋና መሪ ባለሙያ', '2011-04-24', '2017-10-04', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(82, 11, 'የጉምሩክ ኮሚሽን', 'የአምራችና የወጮ ንግድ ድጋፍ ቡድን አስተባባሪ', '2010-07-27', '2011-04-23', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(83, 11, 'የጉምሩክ ኮሚሽን', 'የኤክስፖርት ድጋፍና ክትትል ቡድን አስተባባሪ', '2004-05-15', '2010-07-26', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(84, 11, 'የጉምሩክ ኮሚሽን', 'የቀረጥ ነፃ ጉዳዮች ክትትል ከ/ኦፊሰር', '2001-10-01', '2004-05-14', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(85, 11, 'የጉምሩክ ኮሚሽን', 'የዶክመንቶች አደራጅና ጠባቂ', '1996-04-01', '2001-09-30', 'previous', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(86, 11, 'የጉምሩክ ኮሚሽን', 'ድራፍትስ ማን', '1992-11-15', '1996-03-30', 'previous', 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(87, 11, 'የኢትዮጵያ መንገዶች ባለስልጣን', 'ድራፍቲንግ /ንድፍ ሰራተኛነት/ - በኮንትራት', '1991-04-01', '1992-03-30', 'previous', 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'outside'),
(88, 11, 'የኦሮሚያ ሥራና ከተማ ልማት ቢሮ', '2ኛ ደረጃ ረዳት (በንድፍ ሥራ ክፍል)', '1990-01-01', '1991-03-01', 'previous', 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'outside'),
(89, 12, 'የጉምሩክ ኮሚሽን', 'የኮሚሽን ጽ/ቤት ዋና መሪ ባለሙያ', '2011-04-24', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(90, 12, 'የጉምሩክ ኮሚሽን', 'የክሊራንስና መጋዘን ድጋፍ ክትትል ከ/ኦፊሰር', '2010-07-29', '2011-04-23', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(91, 12, 'የጉምሩክ ኮሚሽን', 'የጉምሩክ ጉዳዩች ድጋፍና ክትትል ከ/ኦፊሰር', '2008-12-01', '2010-07-28', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(92, 12, NULL, 'ትምህርት ላይ', '2007-01-21', '2008-11-30', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(93, 12, 'የጉምሩክ ኮሚሽን', 'የወንጀል ምርመራ ኦፊሰር', '2006-04-01', '2007-01-20', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(94, 12, 'የጉምሩክ ኮሚሽን', 'የእግዚቢት አያያዝና ቁጥጥር ጀ/ኦፊሰር', '2003-06-01', '2006-03-30', 'previous', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(95, 13, 'የጉምሩክ ኮሚሽን', 'የኮሚሽነሩ የጉምሩክ ጉዳዮች አማካሪ', '2016-04-11', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(96, 13, 'የጉምሩክ ኮሚሽን', 'የትራንዚትና መጋዘን አስተዳደር ዳይሬክቶሬት ዳይሬክተር', '2012-09-15', '2016-04-10', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(97, 13, 'የጉምሩክ ኮሚሽን', 'የሞጆ ጉምሩክ ቅ/ጽ/ቤት ሥራ አስኪያጅ', '2011-09-01', '2012-09-14', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(98, 13, 'የጉምሩክ ኮሚሽን', 'የዕቃ አወጣጥ አሰራር ዳይሬክቶሬት ዳይሬክተር', '2011-03-18', '2011-08-30', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(99, 13, 'የጉምሩክ ኮሚሽን', 'የጉምሩክ ዘርፍ ምክትል ዋና ዳይሬክተር የጽ/ቤት ኃላፊ', '2010-05-24', '2011-03-17', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(100, 13, 'የጉምሩክ ኮሚሽን', 'የጉምሩክ ዕቃ አወጣጥ የመጋዘን አሠራርና ፕሮግራም ልማት ቡድን', '2004-12-01', '2010-05-23', 'previous', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(101, 13, 'የጉምሩክ ኮሚሽን', 'የጉምሩክ-ስነ-ስርዓት አፈፃፀም የስራ ሂደት አስተባባሪ', '2004-05-15', '2004-11-30', 'previous', 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(102, 13, 'የጉምሩክ ኮሚሽን', 'የቀረጥና ታክስ ተመላሽ ቡድን አስተባባሪ', '2001-10-01', '2004-05-14', 'previous', 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(103, 13, 'የጉምሩክ ኮሚሽን', 'ጊዜያዊ የሰነድ ምርመራና ቁጥጥር ኦፊሰር', '1997-06-21', '2001-09-30', 'previous', 0, 8, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(104, 13, 'የጉምሩክ ኮሚሽን', 'የቀረጥ ነፃ ኢንቨስትመንት ክትትል ኦፊሰር', '1996-04-01', '1997-06-20', 'previous', 0, 9, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(105, 13, 'የጉምሩክ ኮሚሽን', 'ጊዜያዊ የታሪፍ ምደባና ዋጋ ትመና ኦፊሰር', '1996-02-05', '1996-03-30', 'previous', 0, 10, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(106, 13, 'የጉምሩክ ኮሚሽን', 'ጊዜያዊ የፌስ ቬት ኦፊሰር', '1996-01-15', '1996-02-04', 'previous', 0, 11, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(107, 13, 'የጉምሩክ ኮሚሽን', 'ጊዜያዊ የሰነድ ቁጥጥር ሠራተኛ', '1995-04-22', '1996-01-14', 'previous', 0, 12, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(108, 13, 'የጉምሩክ ኮሚሽን', 'በአዲስ አበባ ላር ጉምሩክ ጊዜያዊ የዋጋ ትመና ኦፊሰር', '1995-03-23', '1995-04-21', 'previous', 0, 13, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(109, 13, 'የጉምሩክ ኮሚሽን', 'የዕቃ ፍተሻ ኦፊሰር', '1990-10-09', '1995-03-22', 'previous', 0, 14, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(110, 14, 'የጉምሩክ ኮሚሽን', 'የኮሙኒኬሽን ዳይሬክቶሬት ዳይሬክተር', '2016-01-01', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(111, 14, 'የጉምሩክ ኮሚሽን', 'የህግ ተገዥ ዘርፍ የጽ/ቤት ኃላፊ', '2013-11-05', '2015-12-30', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(112, 14, 'የጉምሩክ ኮሚሽን', 'የአቤቱታ የጥናትና ትንተና ዋና መሪ ባለሙያ', '2012-09-01', '2013-11-04', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(113, 14, NULL, 'ትምህርት ላይ', '2010-09-25', '2011-08-30', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(114, 14, 'የጉምሩክ ኮሚሽን', 'የጉምሩክ ጉዳዮች ፕግራም ልማትና ድጋፍ ሥራዎች ዘርፍ አማካሪ', '2008-10-24', '2010-09-24', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(115, 14, 'የጉምሩክ ኮሚሽን', 'የስነ-ምግባር መከታተያ ቡድን አስተባባሪ', '2006-02-13', '2008-10-23', 'previous', 0, 5, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(116, 14, 'የጉምሩክ ኮሚሽን', 'የግዢ ኦፊሰር', '2004-12-01', '2006-02-12', 'previous', 0, 6, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(117, 14, 'የጉምሩክ ኮሚሽን', 'ጀማሪ ድንገተኛ ፈታሽ', '2001-12-01', '2004-11-30', 'previous', 0, 7, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(118, 15, 'የጉምሩክ ኮሚሽን', 'የመልዕክት ሠራተኛ', '2016-06-18', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(119, 16, 'የጉምሩክ ኮሚሽን', 'የኮሚኒኬሽንና ኩነት ዝግጅት ቡድን አስተባባሪ', '2017-04-16', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(120, 16, 'የጉምሩክ ኮሚሽን', 'የኮሚኒኬሽን ጉዳዮች መሪ ባለሙያ', '2013-01-01', '2017-04-15', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(121, 16, 'አዲስ ብርድና ቁጠባ ተቋም አክስዮን ማህበር', 'የህዳሴ ጋዜጣ ከፍተኛ ሪፖርተር', '2011-10-13', '2012-10-11', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(122, 16, 'አዲስ ብርድና ቁጠባ ተቋም አክስዮን ማህበር', 'የህዝብ ግንኙነት ጉዳዬች ኃላፊ', '2009-05-01', '2011-10-12', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(123, 16, 'አማራ ብ/ክ/መ/ የደቡብ ወሎ መስ/የአምባስል መረጃ ቢቪል ሰርቪስ', 'የኘሬስ ስራዎች ዜናና ኘሮግራም', '2001-08-01', '2013-02-03', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(124, 17, 'የጉምሩክ ኮሚሽን', 'ከፍተኛ የፎቶግራፍና ቪዲዮ ባለሙያ I', '2016-02-20', NULL, 'current', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(125, 17, 'የጉምሩክ ኮሚሽን', 'የካሜራ ባለሙያ II', '2013-05-12', '2016-02-19', 'previous', 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(126, 17, 'አ/አ ከተማ አ/ ር መ/ቤትልማት እና አስተዳደር', 'ካሜራማን', '2013-10-04', '2014-01-11', 'previous', 0, 2, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(127, 17, 'አ/አ ከተማ አ/ ር መ/ቤትልማት እና አስተዳደር', 'ኦዲቪዥዋል ባለሙያ ደረጃX', '2012-05-01', '2013-10-03', 'previous', 0, 3, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(128, 17, 'አ/አ ከተማ አ/ ር መ/ቤትልማት እና አስተዳደር', 'ኦዲቪዥዋል ባለሙያ', '2012-04-01', '2012-04-30', 'previous', 0, 4, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-03-28 22:32:05', '2026-03-28 22:32:05', NULL, 'inside'),
(129, 49, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የሰው ሀብት ስልጠናምልመላ ከፍተኛ ባለሙያ', '2026-04-01', NULL, 'current', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-04-18 20:59:04', '2026-05-19 07:54:02', NULL, 'inside'),
(130, 571, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የሰው ሀብት ስልጠናምልመላ ከፍተኛ ባለሙያ', '2012-11-25', NULL, 'current', 1, 1, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 07:18:10', '2026-04-28 07:18:10', NULL, 'inside'),
(131, 572, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የፅዳት ሠራተኛ', '2020-02-25', '2021-10-02', 'previous', 0, 1, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 07:58:44', '2026-04-28 07:58:44', NULL, 'inside'),
(132, 572, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የመልዕክት ሠራተኛ', '2021-02-01', '2021-03-01', 'previous', 0, 2, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 08:03:14', '2026-04-28 08:03:14', NULL, 'inside'),
(133, 572, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የሰው ሀብት ሪከርድና አገልግሎት ጀማሪ ባለሙያ', '2021-03-02', '2023-03-01', 'previous', 0, 3, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 08:06:27', '2026-04-28 08:06:27', NULL, 'inside'),
(134, 572, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የሰው ሃብት ሪከርድና አገልግሎት ባለሙያ', '2023-03-02', NULL, 'current', 1, 4, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 08:07:55', '2026-04-28 08:07:55', NULL, 'inside'),
(135, 573, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'በዕውድና አፈፃፀም ክትትል ጀማሪ ኦፊሰር', '2011-03-02', '2012-03-06', 'previous', 0, 1, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 08:40:41', '2026-04-28 08:40:41', NULL, 'inside'),
(136, 573, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የዕቅድና ጥናት ጀማሪ ኦፊሰር', '2012-04-06', '2014-02-01', 'previous', 0, 2, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 08:42:15', '2026-04-28 08:42:15', NULL, 'inside'),
(137, 573, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የዕቅድ አፈፃፀም ክትትል ኦፊሰር', '2014-01-02', '2017-03-02', 'previous', 0, 3, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 08:47:33', '2026-04-28 08:47:33', NULL, 'inside'),
(138, 573, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የዕቅድ አፈፃፀም ክትትል ቡድን አስተባባሪ', '2017-03-01', '2019-12-02', 'previous', 0, 4, NULL, NULL, NULL, 'Addis Ababa', NULL, NULL, 'ETB', NULL, NULL, '2026-04-28 08:49:30', '2026-04-28 08:49:30', NULL, 'inside'),
(139, 573, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የስትራቴጅክ ዕቅድ አፈፃፀም ክትትልና ግምገማ የስራ ሂደት አስተባባሪ', '2019-12-24', '2020-12-24', 'previous', 0, 5, NULL, NULL, NULL, 'Addis Ababa', NULL, NULL, 'ETB', NULL, NULL, '2026-04-28 08:52:11', '2026-04-28 08:52:11', NULL, 'inside'),
(140, 573, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የጉምሩክ መረጃ አስተዳደር ዳይሬክቶሬት', '2020-12-30', '2025-12-30', 'previous', 0, 6, NULL, NULL, NULL, 'Addis Ababa', 'full-time', NULL, 'ETB', NULL, NULL, '2026-04-28 08:54:32', '2026-04-28 08:54:32', NULL, 'inside'),
(142, 574, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የሰው ሃብት ሪከርድና አገልግሎት ባለሙያ', '2023-05-30', NULL, 'current', 1, 6, NULL, NULL, NULL, '30/05/2023', NULL, NULL, 'ETB', NULL, NULL, '2026-04-28 09:11:37', '2026-05-23 10:31:48', NULL, 'inside'),
(143, 6, 'የኢትዮጵያ ጉምሩክ ኮሚሽን', 'የሰው ሃብት ሪከርድና አገልግሎት ባለሙያ', '2023-05-30', NULL, 'current', 1, 6, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-05-01 19:50:02', '2026-05-11 07:19:40', NULL, 'inside'),
(144, 573, 'ጉምሩክ ኮምሽን', 'የኮሚሽን ጽ/ቤት ኃላፊ', '2025-12-12', NULL, 'current', 1, 7, NULL, NULL, NULL, NULL, NULL, NULL, 'ETB', NULL, NULL, '2026-05-11 12:37:51', '2026-05-11 12:37:51', NULL, 'inside');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `finfinnee`
--

CREATE TABLE `finfinnee` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `finfinnee`
--

INSERT INTO `finfinnee` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004411', 'Boole-airlines', 'Dhaabbataa Mootummaa', 'Mag/ L/xaafoo', '0968292069', 'ademahmedbkr@gmail.com', 'waggaan', '2025-11-24', 200000, '2025-11-24 04:54:25', '2025-11-24 04:54:25'),
(2, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(3, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'Aanaa Aqaaqii', '945454545', 'abd@gmail.com', 'waggaan', NULL, 10000000, '2025-11-24 04:54:44', '2025-11-24 04:55:09'),
(4, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(5, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(6, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(7, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(8, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(9, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(10, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44'),
(11, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-24 04:54:44', '2025-11-24 04:54:44');

-- --------------------------------------------------------

--
-- Table structure for table `gujii`
--

CREATE TABLE `gujii` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` date DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gujii`
--

INSERT INTO `gujii` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '2044-11-04', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(2, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '2044-11-05', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(3, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '2044-11-06', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(4, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '2044-11-07', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(5, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '2044-11-08', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(6, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '2044-11-09', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(7, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '0000-00-00', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(8, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '2044-12-01', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(9, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '2044-12-02', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(10, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '2044-12-03', 10000000, '2025-11-24 05:32:21', '2025-11-24 05:32:21'),
(11, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '2044-11-04', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(12, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '2044-11-05', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(13, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '2044-11-06', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(14, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '2044-11-07', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(15, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '2044-11-08', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(16, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '2044-11-09', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(17, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '0000-00-00', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(18, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '2044-12-01', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(19, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '2044-12-02', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(20, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '2044-12-03', 10000000, '2025-11-24 05:43:16', '2025-11-24 05:43:16'),
(21, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '2044-11-04', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(22, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '2044-11-05', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(23, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '2044-11-06', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(24, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '2044-11-07', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(25, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '2044-11-08', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(26, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '2044-11-09', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(27, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '0000-00-00', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(28, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '2044-12-01', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(29, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '2044-12-02', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06'),
(30, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '2044-12-03', 10000000, '2025-11-24 06:08:06', '2025-11-24 06:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `g_lixaa`
--

CREATE TABLE `g_lixaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `g_lixaa`
--

INSERT INTO `g_lixaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'Siirkaa', '945454545', 'ademahmedbekr@gmail.com', 'waggaan', '2025-11-26', NULL, '2025-11-26 08:02:08', '2025-11-26 08:02:08'),
(2, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'Aminyaa', '945454546', 'ademahmed@gmail.com', 'waggaan', '44115', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(3, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Collee', '945454547', 'ademgaaa@gmail.com', 'waggaan', '44116', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(4, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'sirkaa', '945454548', 'ademgaaa@gmail.sim', 'waggaan', '44117', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(5, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'gololcha', '945454549', 'ademgaaa@gmail.gom', 'waggaan', '44118', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(6, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454550', 'ademahmed@gmail.dam', 'waggaan', '44119', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(7, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454551', 'ademahmed@gmail.dam', 'waggaan', '44120', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(8, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454552', 'ademahmed@gmail.dam', 'waggaan', '44121', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(9, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454553', 'ademahmed@gmail.dam', 'waggaan', '44122', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34'),
(10, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454554', 'ademahmed@gmail.dam', 'waggaan', '44123', 10000000, '2025-11-26 08:18:34', '2025-11-26 08:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `honorables`
--

CREATE TABLE `honorables` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) NOT NULL DEFAULT 'Honorable',
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `honorables`
--

INSERT INTO `honorables` (`id`, `first_name`, `middle_name`, `last_name`, `gender`, `age`, `address`, `contact_number`, `woreda`, `email`, `position`, `membership_type`, `membership_fee`, `created_at`, `updated_at`) VALUES
(1, 'Ayansa', 'Mulisa', 'Milkessa', 'Male', 26, 'AA', '0988188439', NULL, 'ayyuu2493@gmail.com', 'Government Workers', 'Honorable', 120, '2023-03-20 11:13:26', '2023-03-20 11:13:26'),
(2, 'Badhasoo', 'abdisa', 'Milkessa', 'Male', 26, 'Jimmaa', '0955637971', NULL, 'admin@admins31.com', 'Government Workers', 'Honorable', 120, '2023-03-22 12:04:16', '2023-03-22 12:04:16'),
(3, 'Cooperative', 'Bank', 'Oromia', 'Male', 100, 'AA', '0955637971', NULL, 'admin@cboadmin.com', 'City/Town Resident', 'Honorable', 120, '2023-03-27 10:12:34', '2025-04-01 11:21:02'),
(4, 'Adem', 'Ahmed', 'Bekar', 'Female', 23, 'Addis Ababa, Bole', '0968292069', NULL, 'ademahmedbekr@gmail.com', 'Merchant', 'Honorable', 600, '2026-01-29 14:10:56', '2026-01-29 14:10:56');

-- --------------------------------------------------------

--
-- Table structure for table `honorables_member_pays`
--

CREATE TABLE `honorables_member_pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `honorables_member_pays`
--

INSERT INTO `honorables_member_pays` (`id`, `member_id`, `name`, `position`, `amount`, `date`, `created_at`, `updated_at`) VALUES
(1, '1', 'Ayansa Mulisa Milkessa', 'Government Workers', 120, '2023-02-27', '2023-03-20 11:13:47', '2023-03-20 11:13:47'),
(2, '1', 'Ayansa Mulisa Milkessa', 'Government Workers', 120, '2026-02-10', '2026-02-08 11:11:53', '2026-02-08 11:11:53');

-- --------------------------------------------------------

--
-- Table structure for table `h_bahaa`
--

CREATE TABLE `h_bahaa` (
  `id` int(10) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `h_bahaa`
--

INSERT INTO `h_bahaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'Aminyaa', '945454546', 'ademahmed@gmail.com', 'waggaan', '44115', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(2, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Collee', '945454547', 'ademgaaa@gmail.com', 'waggaan', '44116', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(3, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'sirkaa', '945454548', 'ademgaaa@gmail.sim', 'waggaan', '44117', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(4, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'gololcha', '945454549', 'ademgaaa@gmail.gom', 'waggaan', '44118', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(5, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454550', 'ademahmed@gmail.dam', 'waggaan', '44119', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(6, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454551', 'ademahmed@gmail.dam', 'waggaan', '44120', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(7, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454552', 'ademahmed@gmail.dam', 'waggaan', '44121', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(8, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454553', 'ademahmed@gmail.dam', 'waggaan', '44122', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(9, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454554', 'ademahmed@gmail.dam', 'waggaan', '44123', 10000000, '2025-11-26 09:26:08', '2025-11-26 09:26:08'),
(10, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(11, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(12, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(13, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(14, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(15, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(16, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(17, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(18, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02'),
(19, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-12-01 07:28:02', '2025-12-01 07:28:02');

-- --------------------------------------------------------

--
-- Table structure for table `h_g_wallaga`
--

CREATE TABLE `h_g_wallaga` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `h_g_wallaga`
--

INSERT INTO `h_g_wallaga` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'Aminyaa', '945454546', 'ademahmed@gmail.com', 'waggaan', '44115', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(2, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Collee', '945454547', 'ademgaaa@gmail.com', 'waggaan', '44116', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(3, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'sirkaa', '945454548', 'ademgaaa@gmail.sim', 'waggaan', '44117', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(4, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'gololcha', '945454549', 'ademgaaa@gmail.gom', 'waggaan', '44118', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(5, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454550', 'ademahmed@gmail.dam', 'waggaan', '44119', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(6, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454551', 'ademahmed@gmail.dam', 'waggaan', '44120', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(7, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454552', 'ademahmed@gmail.dam', 'waggaan', '44121', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(8, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454553', 'ademahmed@gmail.dam', 'waggaan', '44122', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54'),
(9, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454554', 'ademahmed@gmail.dam', 'waggaan', '44123', NULL, '2025-11-26 10:04:54', '2025-11-26 10:04:54');

-- --------------------------------------------------------

--
-- Table structure for table `h_lixaa`
--

CREATE TABLE `h_lixaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `h_lixaa`
--

INSERT INTO `h_lixaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'M/Gindhiir', '945454546', 'adem@gmail.com', 'waggaan', '2025-11-26', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:42:32'),
(2, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Collee', '945454547', 'ademgaaa@gmail.com', 'waggaan', '44116', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(3, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'sirkaa', '945454548', 'ademgaaa@gmail.sim', 'waggaan', '44117', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(4, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'gololcha', '945454549', 'ademgaaa@gmail.gom', 'waggaan', '44118', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(5, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454550', 'ademahmed@gmail.dam', 'waggaan', '44119', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(6, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454551', 'ademahmed@gmail.dam', 'waggaan', '44120', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(7, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454552', 'ademahmed@gmail.dam', 'waggaan', '44121', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(8, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454553', 'ademahmed@gmail.dam', 'waggaan', '44122', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(9, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Asallaa', '945454554', 'ademahmed@gmail.dam', 'waggaan', '44123', 10000000, '2025-11-26 09:38:14', '2025-11-26 09:38:14'),
(10, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'M/Gindhiir', '945454546', 'ademahmedbekr@gmail.com', 'waggaan', '2025-11-26', 10000000, '2025-11-26 09:42:55', '2025-11-26 09:42:55');

-- --------------------------------------------------------

--
-- Table structure for table `i_a_booraa`
--

CREATE TABLE `i_a_booraa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `i_a_booraa`
--

INSERT INTO `i_a_booraa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'Teltele', '945454546', 'ademahmedbekar@gmail.com', 'waggaan', '2025-11-26', 10000000, '2025-11-27 06:28:58', '2025-11-27 06:29:13'),
(2, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(3, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(4, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(5, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(6, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(7, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(8, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(9, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(10, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46'),
(11, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', NULL, '2025-11-27 06:30:46', '2025-11-27 06:30:46');

-- --------------------------------------------------------

--
-- Table structure for table `jigjiga`
--

CREATE TABLE `jigjiga` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `file_number` varchar(255) NOT NULL,
  `employee_name` varchar(255) NOT NULL,
  `job_title` varchar(255) DEFAULT NULL,
  `gender` enum('ወ','ሴ') DEFAULT NULL,
  `job_level` varchar(50) DEFAULT NULL,
  `ethnicity` varchar(100) DEFAULT NULL,
  `religion` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `salary` decimal(12,2) DEFAULT NULL,
  `allowance` decimal(12,2) DEFAULT NULL,
  `assignment_date` date DEFAULT NULL,
  `housing_allowance` decimal(12,2) DEFAULT NULL,
  `pension_id` varchar(50) DEFAULT NULL,
  `marital_status` enum('Single','Married','Divorced','Widowed') DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `zone` varchar(100) DEFAULT NULL,
  `district` varchar(100) DEFAULT NULL,
  `specific_location` varchar(255) DEFAULT NULL,
  `house_number` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `education_type` varchar(100) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `cgpa` decimal(3,2) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `graduation_date` date DEFAULT NULL,
  `coc_certificate` tinyint(1) DEFAULT 0,
  `higher_ed_verified` tinyint(1) DEFAULT 0,
  `current_job_title` varchar(255) DEFAULT NULL,
  `current_institution` varchar(255) DEFAULT NULL,
  `experience_from` date DEFAULT NULL,
  `experience_to` date DEFAULT NULL,
  `previous_job_title` varchar(255) DEFAULT NULL,
  `previous_institution` varchar(255) DEFAULT NULL,
  `previous_from` date DEFAULT NULL,
  `previous_to` date DEFAULT NULL,
  `diagnosis` text DEFAULT NULL,
  `disability_type` varchar(255) DEFAULT NULL,
  `column_40` varchar(1000) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `years_of_service` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jigjiga`
--

INSERT INTO `jigjiga` (`id`, `file_number`, `employee_name`, `job_title`, `gender`, `job_level`, `ethnicity`, `religion`, `date_of_birth`, `hire_date`, `step`, `salary`, `allowance`, `assignment_date`, `housing_allowance`, `pension_id`, `marital_status`, `region`, `zone`, `district`, `specific_location`, `house_number`, `phone_number`, `email`, `education_type`, `education_level`, `cgpa`, `institution`, `graduation_date`, `coc_certificate`, `higher_ed_verified`, `current_job_title`, `current_institution`, `experience_from`, `experience_to`, `previous_job_title`, `previous_institution`, `previous_from`, `previous_to`, `diagnosis`, `disability_type`, `column_40`, `deleted_at`, `created_at`, `updated_at`, `years_of_service`, `age`, `photo`, `document`, `branch_name`) VALUES
(47, 'ET-2631', 'ቴዎድሮስ ተሻሌ ሬታ', 'የኮሙኒኬሽን እና ኩነት ዝግጅት ቡድን አስተባባሪ', 'ወ', '10', 'አማራ', 'ኦርቶዶክስ', '1978-01-01', '2013-01-05', 2, 47468.00, 10600.00, '2017-04-16', 22370.00, 'C-7022136', 'Married', 'አዲ አበባ', 'ጉለሌ', '3', 'የለም', '128/07\n420/ለ', '0920198775', 'tewoeneko1978@gmail.com', 'ቋንቋ ትምህርት\n\nየቪዲዮግራፊና ፎቶግራፊ    \n', 'ዲግሪ\n\nሰርተፍኬት', 2.90, 'አዲስ አበባ ዩኒቨርስቲ \n\nአ/አ ከተማ አስ/ቴክኒክና ሙያ ትም/ስልጠና ኤጀንሲ', '2008-07-31', 1, 1, '\nየኮሚኒኬሽን ጉዳዮች መሪ ባለሙያ\nየኮሚኒኬሽንና ኩነት ዝግጅት ቡድን አስተባባሪ1', 'የኢትዮጵያ ጉምሩክ ኮሚሽን ', '2013-01-11', '2026-03-15', 'አማራ ብ/ክ/መ/ የደቡብ ወሎ መስ/የአምባስል መረጃ ቢቪል ሰርቪስ\n\nአዲስ ብርድና ቁጠባ ተቋም አክስዮን ማህበር\n\nአዲስ አበባ ብልጽግና ፖርቲ ጽ/ቤት\n', 'የኘሬስ ስራዎች ዜናና ኘሮግራም\n\nየህዝብ ግንኙነት ጉዳዬች ኃላፊ\nኦዲዮ ቪዥዋል ኦፊሰር\n\nየህዳሴ ጋዜጣ ከፍተኛ ሪፖርት\nየአውደ ለውጥ መጽሄት አዘጋጅ', '2001-01-08', '2013-03-02', 'የለም', NULL, 'የለም', NULL, '2026-03-21 13:59:10', '2026-03-21 13:59:10', NULL, NULL, NULL, NULL, 'jigjiga'),
(48, 'EA-4766', 'አየለ አሰፋ ነጋሽ', 'የሰው ሀብት ስልጠናምልመላ ከፍተኛ ባለሙያ', 'ወ', '8', 'ኦሮሞ', 'ኦረቶዶክስ', '1988-12-16', '2013-01-11', 1, 31900.00, 8000.00, '2018-02-27', 18620.00, '930003292', NULL, 'ኦሮምያ', 'አርሲ ሮቤ', 'ሮቤ', NULL, NULL, '911753992', NULL, 'ሁማን ርሶርስ ሱፐርቪዥን\nብዝነስ አድምንስትሬሽን\n', 'ሌቨል\nማሰትረ', 3.45, 'TVET አገንሲ\nሰላሌ ዩኒቨርሲቲ', '2015-11-11', 1, 1, NULL, NULL, '2021-11-02', '2022-02-01', '1.ማጅመንት ት/ት/ ክፍል እና ማኔጂንግ ካውንስለር\n2.የጸረ ሙስና እና የስልጠና ክፍል ሃላፊ', NULL, '2023-01-01', '2025-12-10', NULL, NULL, NULL, NULL, '2026-03-21 13:59:10', '2026-03-21 13:59:10', NULL, NULL, NULL, NULL, 'jigjiga');

-- --------------------------------------------------------

--
-- Table structure for table `jimmaa`
--

CREATE TABLE `jimmaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jimmaa`
--

INSERT INTO `jimmaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004403', 'Coop', 'Dhaabbataa Miti-Mootummaa', 'M-Beddeellee', '945454546', 'ademahmedbeker@gmail.com', 'waggaan', '2025-11-27', 10000000, '2025-11-27 08:22:51', '2025-11-27 08:23:10'),
(2, '10004402', 'Warshaa Daakuu', 'Dhaabbataa Miti-Mootummaa', 'M-Beddeellee', '945454545', 'gadaa@gmailcom', 'waggaan', '2025-11-28', 10000000, '2025-11-27 08:23:31', '2025-11-28 03:06:50'),
(3, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(4, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(5, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(6, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(7, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(8, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(9, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(10, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(11, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', NULL, '2025-11-27 08:23:31', '2025-11-27 08:23:31'),
(12, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(13, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(14, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(15, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(16, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(17, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(18, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(19, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(20, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07'),
(21, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', NULL, '2025-11-28 03:43:07', '2025-11-28 03:43:07');

-- --------------------------------------------------------

--
-- Table structure for table `maintainance_texts`
--

CREATE TABLE `maintainance_texts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` int(10) NOT NULL DEFAULT 0,
  `image` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `maintainance_texts`
--

INSERT INTO `maintainance_texts` (`id`, `status`, `image`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 'uploads/maintainance/maintainance-mode-2026-05-23-03-36-33-8513.png', 'We are upgrading our site.  We will come back soon.  \r\nPlease stay with us. \r\nThank you.', NULL, '2026-05-23 10:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `managers`
--

CREATE TABLE `managers` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `department_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `managers`
--

INSERT INTO `managers` (`id`, `name`, `department_id`, `created_at`, `updated_at`) VALUES
(3, 'Debele Kabeta Hursa(PhD)', 1, '2026-05-14 17:35:31', '2026-05-14 17:35:31'),
(4, 'Tesema Idae Mitiku', 2, '2026-05-14 07:55:04', '2026-05-14 07:55:04'),
(5, 'Wegayehu Adamu Shibru', 3, '2026-05-14 07:55:41', '2026-05-14 07:55:41'),
(6, 'Sadiq Desse Nur', 4, '2026-05-14 07:56:25', '2026-05-14 07:56:25'),
(7, 'Angesom Tekle Kidane', 5, '2026-05-14 07:57:01', '2026-05-14 07:57:01'),
(8, 'Abdisa Dufera Dibi', 6, '2026-05-14 07:58:07', '2026-05-14 07:58:07'),
(9, 'Abeba Kiros Fekade', 7, '2026-05-14 07:59:47', '2026-05-14 07:59:47'),
(10, 'Mantegbosh Kebede Ayele', 8, '2026-05-14 08:00:47', '2026-05-14 08:00:47'),
(11, 'Sirkalem Abebe Diga', 9, '2026-05-14 08:01:39', '2026-05-14 08:01:39'),
(12, 'Yohannes Melese W/Yesus', 10, '2026-05-14 08:02:28', '2026-05-14 08:02:28'),
(13, 'Sewagen Tegnaw Wondim', 11, '2026-05-14 08:06:07', '2026-05-14 08:06:07'),
(14, 'Wuletaw Ayele Mekonnen', 12, '2026-05-14 08:07:32', '2026-05-14 08:07:32'),
(15, 'Simret Gezahegn Irena', 13, '2026-05-14 08:10:45', '2026-05-14 08:10:45'),
(16, 'Endashaw Temesgen Beyene', 14, '2026-05-14 08:15:54', '2026-05-14 08:15:54'),
(17, 'Hailu Diriba Gobena', 15, '2026-05-14 08:16:22', '2026-05-14 08:16:22'),
(18, 'Muluwork Derese Degsew', 16, '2026-05-14 08:17:48', '2026-05-14 08:17:48'),
(19, 'Wondwosen Degefa Kassa', 17, '2026-05-14 08:20:44', '2026-05-14 08:20:44'),
(20, 'Genet Abraham Kifle', 18, '2026-05-14 08:21:17', '2026-05-14 08:21:17'),
(21, 'Zemenu Zegeye Bekele', 19, '2026-05-14 08:21:58', '2026-05-14 08:21:58'),
(22, 'Kasaye Ayele Molla', 20, '2026-05-14 08:22:38', '2026-05-14 08:22:38'),
(23, 'Azezew Chane Abebe', 21, '2026-05-14 08:23:34', '2026-05-14 08:23:34'),
(24, 'Fekadu Amare G/Yesus', 22, '2026-05-14 08:24:18', '2026-05-14 08:24:18'),
(25, 'Tolosa Jirenya Daqa', 23, '2026-05-14 08:37:16', '2026-05-14 08:37:16'),
(26, 'Ashenafi Basa Lagebo', 24, '2026-05-14 08:38:12', '2026-05-14 08:38:12'),
(27, 'G/Yesus G/Hiwot Hagos', 25, '2026-05-14 08:39:16', '2026-05-14 08:39:16'),
(28, 'Mengistu Tefera Ayana', 26, '2026-05-14 08:39:52', '2026-05-14 08:39:52'),
(29, 'Alemtsahay Hailu Abera', 27, '2026-05-14 08:40:36', '2026-05-14 08:40:36'),
(30, 'Yonas Teklewoled Belayneh', 28, '2026-05-14 08:41:12', '2026-05-14 08:41:12'),
(31, 'Merga Tolera Negewo', 29, '2026-05-14 08:42:57', '2026-05-14 08:42:57'),
(32, 'Yasin Mohammed Abdurahman', 30, '2026-05-14 08:48:46', '2026-05-14 08:48:46'),
(33, 'Segni Assefa Urgessa', 31, '2026-05-14 08:49:30', '2026-05-14 08:49:30'),
(34, 'Misrak Mamo Terefe', 32, '2026-05-14 08:50:38', '2026-05-14 08:50:38'),
(35, 'Zerihun Asfa Zelo', 33, '2026-05-14 08:52:44', '2026-05-14 08:52:44'),
(36, 'Gemechu Kenea Tufa', 34, '2026-05-14 08:57:33', '2026-05-14 08:57:33'),
(37, 'Tegene Derese Degefa', 35, '2026-05-14 08:58:19', '2026-05-14 08:58:19'),
(38, 'Adunya Andualem', 36, '2026-05-14 08:58:54', '2026-05-14 08:58:54'),
(39, 'Amelework Olana Deksisa', 37, '2026-05-14 08:59:23', '2026-05-14 08:59:23');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `workplace` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 2),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 3),
(4, '2019_08_19_000000_create_failed_jobs_table', 4),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 5),
(6, '2022_04_11_073124_create_students_table', 6),
(7, '2022_04_11_073831_create_sessions_table', 7),
(8, '2022_04_13_023809_create_permission_tables', 8),
(9, '2022_08_19_030542_create_activity_log_table', 9),
(10, '2022_08_19_030543_add_event_column_to_activity_log_table', 10),
(11, '2022_08_19_030544_add_batch_uuid_column_to_activity_log_table', 11),
(12, '2022_10_15_075955_create_members_table', 12),
(13, '2022_12_09_064648_create_zone10s_table', 13),
(14, '2022_12_09_064648_create_zone11s_table', 14),
(15, '2022_12_09_064648_create_zone12s_table', 15),
(16, '2022_12_09_064648_create_zone13s_table', 16),
(17, '2022_12_09_064648_create_zone14s_table', 17),
(18, '2022_12_09_064648_create_zone15s_table', 18),
(19, '2022_12_09_064648_create_zone16s_table', 19),
(20, '2022_12_09_064648_create_zone17s_table', 20),
(21, '2022_12_09_064648_create_zone18s_table', 21),
(22, '2022_12_09_064648_create_zone19s_table', 22),
(23, '2022_12_09_064648_create_zone1s_table', 23),
(24, '2022_12_09_064648_create_zone20s_table', 24),
(25, '2022_12_09_064648_create_zone21s_table', 25),
(26, '2022_12_09_064648_create_zone2s_table', 26),
(27, '2022_12_09_064648_create_zone3s_table', 27),
(28, '2022_12_09_064648_create_zone4s_table', 28),
(29, '2022_12_09_064648_create_zone5s_table', 29),
(30, '2022_12_09_064648_create_zone6s_table', 30),
(31, '2022_12_09_064648_create_zone7s_table', 31),
(32, '2022_12_09_064648_create_zone8s_table', 32),
(33, '2022_12_09_064648_create_zone9s_table', 33),
(34, '2022_12_12_064648_create_city10s_table', 34),
(35, '2022_12_12_064648_create_city11s_table', 35),
(36, '2022_12_12_064648_create_city12s_table', 36),
(37, '2022_12_12_064648_create_city13s_table', 37),
(38, '2022_12_12_064648_create_city14s_table', 38),
(39, '2022_12_12_064648_create_city15s_table', 39),
(40, '2022_12_12_064648_create_city16s_table', 40),
(41, '2022_12_12_064648_create_city17s_table', 41),
(42, '2022_12_12_064648_create_city18s_table', 42),
(43, '2022_12_12_064648_create_city19s_table', 43),
(44, '2022_12_12_064648_create_city1s_table', 44),
(45, '2022_12_12_064648_create_city2s_table', 45),
(46, '2022_12_12_064648_create_city3s_table', 46),
(47, '2022_12_12_064648_create_city4s_table', 47),
(48, '2022_12_12_064648_create_city5s_table', 48),
(49, '2022_12_12_064648_create_city6s_table', 49),
(50, '2022_12_12_064648_create_city7s_table', 50),
(51, '2022_12_12_064648_create_city8s_table', 51),
(52, '2022_12_12_064648_create_city9s_table', 52),
(53, '2022_12_13_055533_create_news_table', 53),
(54, '2022_12_13_060309_create_announcements_table', 54),
(55, '2022_12_13_064648_create_abroads_table', 55),
(56, '2022_12_13_064648_create_regionals_table', 56),
(57, '2022_12_16_083022_create_honorables_table', 57),
(58, '2023_02_25_045404_create_countries_table', 58),
(59, '2023_02_25_052748_create_regions_table', 59),
(60, '2023_03_02_144708_create_abroad_member_pays_table', 60),
(61, '2023_03_02_144708_create_city_member_pays_table', 61),
(62, '2023_03_02_144708_create_honorables_member_pays_table', 62),
(63, '2023_03_02_144708_create_region_member_pays_table', 63),
(64, '2023_03_02_144708_create_zone_member_pays_table', 64);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 31),
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 32),
(2, 'App\\Models\\User', 33);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `document` varchar(255) DEFAULT NULL,
  `video` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('d8298862-4746-11f1-bf5e-b41c6fdaf749', 'ttr', 'fgf', 5, 'rtrgfhgf', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL,
  `zone` varchar(100) NOT NULL,
  `woreda_or_city` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `org_type` varchar(50) DEFAULT NULL,
  `time_of_payment` datetime DEFAULT NULL,
  `payment_amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `zone`, `woreda_or_city`, `name`, `email`, `phone`, `org_type`, `time_of_payment`, `payment_amount`) VALUES
(1, 'Arsii', 'Asallaa', 'Ethio-tel', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'user-edit', 'web', '2026-04-11 17:41:20', '2026-04-11 17:41:45'),
(2, 'user-create', 'web', '2026-04-11 17:42:15', '2026-04-11 17:42:15'),
(3, 'user-list', 'web', '2026-04-11 17:42:51', '2026-04-11 17:42:51'),
(4, 'user-delete', 'web', '2026-04-11 17:43:18', '2026-04-11 17:43:18'),
(5, 'permission-create', 'web', '2026-04-11 17:43:54', '2026-04-11 17:43:54'),
(6, 'permission-edit', 'web', '2026-04-11 17:44:19', '2026-04-11 17:44:19'),
(7, 'permission-list', 'web', '2026-04-11 17:44:40', '2026-04-11 17:44:40'),
(8, 'role-create', 'web', '2026-04-11 17:45:07', '2026-04-11 17:45:07'),
(9, 'role-list', 'web', '2026-04-11 17:46:03', '2026-04-11 17:46:03'),
(10, 'role-edit', 'web', '2026-04-11 17:46:59', '2026-04-11 17:46:59'),
(11, 'role-delete', 'web', '2026-04-11 17:47:15', '2026-04-11 17:47:15'),
(12, 'permission-delete', 'web', '2026-04-11 17:48:00', '2026-04-11 17:48:00'),
(13, 'profile-list', 'web', '2026-04-11 17:51:56', '2026-04-11 17:51:56'),
(14, 'profile-create', 'web', '2026-04-11 17:54:36', '2026-04-11 17:54:36'),
(15, 'profile-edit', 'web', '2026-04-11 17:54:53', '2026-04-11 17:54:53'),
(16, 'profile-delete', 'web', '2026-04-11 17:55:22', '2026-04-11 17:55:22'),
(17, 'notification-list', 'web', '2026-05-19 11:23:22', '2026-05-19 11:23:22'),
(18, 'directorate-list', 'web', '2026-05-25 10:58:21', '2026-05-25 10:58:21'),
(19, 'directorate-create', 'web', '2026-05-25 10:59:17', '2026-05-25 10:59:17'),
(20, 'directorate-edit', 'web', '2026-05-25 10:59:34', '2026-05-25 10:59:34'),
(21, 'directorate-update', 'web', '2026-05-25 10:59:46', '2026-05-25 10:59:46'),
(22, 'directorate-delete', 'web', '2026-05-25 10:59:59', '2026-05-25 10:59:59'),
(23, 'position-list', 'web', '2026-05-25 11:00:20', '2026-05-25 11:00:20'),
(24, 'position-create', 'web', '2026-05-25 11:00:36', '2026-05-25 11:00:36'),
(25, 'position-edit', 'web', '2026-05-25 11:00:50', '2026-05-25 11:00:50'),
(26, 'position-delete', 'web', '2026-05-25 11:01:04', '2026-05-25 11:01:04'),
(28, 'managers-list', 'web', '2026-05-25 11:37:52', '2026-05-25 11:37:52'),
(29, 'managers-create', 'web', '2026-05-25 11:38:11', '2026-05-25 11:38:11'),
(30, 'managers-edit', 'web', '2026-05-25 11:38:26', '2026-05-25 11:38:26'),
(31, 'managers-delete', 'web', '2026-05-25 11:38:37', '2026-05-25 11:38:37'),
(32, 'experience-list', 'web', '2026-05-25 11:39:03', '2026-05-25 11:39:03'),
(33, 'experience-create', 'web', '2026-05-25 11:39:55', '2026-05-25 11:39:55'),
(34, 'experience-edit', 'web', '2026-05-25 11:40:12', '2026-05-25 11:40:12'),
(35, 'experience-delete', 'web', '2026-05-25 11:40:24', '2026-05-25 11:40:24');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `woreda_or_city` varchar(100) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `numbers` int(11) DEFAULT NULL,
  `started_year` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `progression` varchar(255) DEFAULT NULL,
  `budget` bigint(20) DEFAULT NULL,
  `community_participation` bigint(20) DEFAULT NULL,
  `deployed_budget` bigint(20) DEFAULT NULL,
  `total_budget` bigint(20) DEFAULT NULL,
  `benefitiary` int(11) DEFAULT NULL,
  `how_many_get_job` int(11) DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `zone`, `woreda_or_city`, `name`, `woreda`, `type`, `site`, `numbers`, `started_year`, `address`, `progression`, `budget`, `community_participation`, `deployed_budget`, `total_budget`, `benefitiary`, `how_many_get_job`, `created_at`, `updated_at`) VALUES
(1, 'Arsii', 'Asalla', 'water', 'Asella', 'Donor', 'ganda-06', 2, '2024', 'asella', '70%', 2000000, 100000, 20000, 20000000, 20000, 50, NULL, NULL),
(2, 'Arsii', 'Aanaa1', 'Water Supply Project', NULL, 'Infrastructure', 'Site A', 3, '2023', 'Address 1', 'Ongoing', 5000000, 1000000, 2000000, 7000000, 1200, 300, NULL, NULL),
(3, 'Arsii', 'Aanaa2', 'School Renovation', NULL, 'Education', 'Site B', 2, '2022', 'Address 2', 'Completed', 2000000, 500000, 1500000, 3500000, 800, 200, NULL, NULL),
(4, 'Baalee', 'B/C1', 'Health Center Expansion', NULL, 'Health', 'Site C', 1, '2023', 'Address 3', 'Ongoing', 3000000, 700000, 1000000, 4700000, 900, 150, NULL, NULL),
(5, 'Baalee', 'B/C2', 'Road Construction', NULL, 'Infrastructure', 'Site D', 4, '2021', 'Address 4', 'Completed', 8000000, 2000000, 4000000, 14000000, 1500, 500, NULL, NULL),
(6, 'Booranaa', 'Bo/C1', 'Community Hall', NULL, 'Social', 'Site E', 1, '2024', 'Address 5', 'Ongoing', 1000000, 300000, 500000, 1800000, 400, 50, NULL, NULL),
(7, 'Gujii', 'GJ1', 'Irrigation System', NULL, 'Agriculture', 'Site F', 2, '2023', 'Address 6', 'Ongoing', 4500000, 900000, 1200000, 6600000, 1100, 250, NULL, NULL),
(8, 'Finfinnee', 'FF1', 'Metro Expansion', NULL, 'Infrastructure', 'Site G', 5, '2022', 'Address 7', 'Ongoing', 15000000, 5000000, 7000000, 27000000, 5000, 1000, NULL, NULL),
(9, 'Arsii', 'Aminyaa', 'Water Supply Project', NULL, 'Infrastructure', 'Site A', 3, '2023', 'Aminyaa Town', '50%', 5000000, 200000, 1000000, 6000000, 1500, 300, NULL, NULL),
(10, 'Arsii', 'Asakoo', 'Community Health Center', NULL, 'Health', 'Site B', 2, '2022', 'Asakoo Village', '80%', 3000000, 150000, 500000, 3500000, 800, 120, NULL, NULL),
(11, 'Arsii Lixaa', 'Adaabba', 'Primary School Construction', NULL, 'Education', 'Site C', 1, '2024', 'Adaabba Village', '30%', 4000000, 100000, 800000, 4800000, 600, 150, NULL, NULL),
(12, 'Arsii Lixaa', 'A/A/Nagelle', 'Road Rehabilitation', NULL, 'Infrastructure', 'Site D', 4, '2023', 'A/Nagellee', '45%', 7000000, 300000, 1500000, 7500000, 2000, 400, NULL, NULL),
(13, 'Baalee', 'Agaarfaa', 'Health Center Renovation', NULL, 'Health', 'Site E', 2, '2025', 'Agaarfaa Town', '70%', 2000000, 100000, 500000, 2500000, 500, 120, NULL, NULL),
(14, 'Baalee', 'Barbaree', 'Community Library', NULL, 'Education', 'Site F', 1, '2023', 'Barbaree Village', '60%', 1500000, 50000, 200000, 1700000, 300, 50, NULL, NULL),
(15, 'Baalee', 'Diinshoo', 'Irrigation System', NULL, 'Agriculture', 'Site G', 3, '2022', 'Diinshoo Farmland', '40%', 3500000, 120000, 600000, 4000000, 700, 80, NULL, NULL),
(16, 'Booranaa', 'Yabello', 'Market Construction', NULL, 'Commerce', 'Site H', 2, '2024', 'Yabello Town', '20%', 5000000, 200000, 1000000, 5500000, 1000, 250, NULL, NULL),
(17, 'Gujii', 'Bule Hora', 'Electricity Network', NULL, 'Infrastructure', 'Site I', 1, '2023', 'Bule Hora', '55%', 6000000, 250000, 1200000, 6500000, 1200, 300, NULL, NULL),
(18, 'Jimmaa', 'Jimma Town', 'Hospital Upgrade', NULL, 'Health', 'Site J', 4, '2022', 'Jimma City', '75%', 8000000, 400000, 2000000, 8500000, 1800, 500, NULL, NULL),
(19, 'Arsi Lixaa', 'Amigna', 'Barecha Ashenafi Bira', NULL, 'Water', 'chole', 1, '2024', 'Addis Ababa, Bole', '75%', 1000000, 1000000, 100000000, 12000000000, 23000, 2000, '2025-11-30 15:04:48.000000', '2025-11-30 15:04:48.000000'),
(20, 'Bole', 'Woreda 04', 'School', NULL, 'Water', 'chole', 1, '2024', 'Addis Ababa, Bole', '75%', 1000000, 1000000, 100000000, 12000000000, 23000, 2000, '2025-11-30 15:06:39.000000', '2025-11-30 15:06:39.000000');

-- --------------------------------------------------------

--
-- Table structure for table `q_wallaga`
--

CREATE TABLE `q_wallaga` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `q_wallaga`
--

INSERT INTO `q_wallaga` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(2, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(3, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(4, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(5, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(6, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(7, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(8, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(9, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(10, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', NULL, '2025-11-28 04:05:23', '2025-11-28 04:05:23'),
(11, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', NULL, '2025-11-28 13:14:00', '2025-11-28 13:14:00'),
(12, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(13, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(14, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(15, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(16, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(17, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(18, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(19, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(20, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', NULL, '2025-11-28 13:14:01', '2025-11-28 13:14:01'),
(21, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-28 13:16:25', '2025-11-28 13:16:25'),
(22, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-28 13:16:25', '2025-11-28 13:16:25'),
(23, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-28 13:16:25', '2025-11-28 13:16:25'),
(24, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-28 13:16:25', '2025-11-28 13:16:25'),
(25, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-28 13:16:26', '2025-11-28 13:16:26'),
(26, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-28 13:16:26', '2025-11-28 13:16:26'),
(27, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-28 13:16:26', '2025-11-28 13:16:26'),
(28, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-28 13:16:26', '2025-11-28 13:16:26'),
(29, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-28 13:16:26', '2025-11-28 13:16:26'),
(30, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-28 13:16:26', '2025-11-28 13:16:26');

-- --------------------------------------------------------

--
-- Table structure for table `regionals`
--

CREATE TABLE `regionals` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `region` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=8192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `regionals`
--

INSERT INTO `regionals` (`id`, `first_name`, `middle_name`, `last_name`, `gender`, `age`, `region`, `address`, `contact_number`, `email`, `position`, `membership_type`, `membership_fee`, `created_at`, `updated_at`) VALUES
(1, 'Ayansa', 'Mulisa', 'Milkessa', 'Male', 25, 'SNNP', 'Adaamaa', '0947432493', 'ayyuu24931@gmail.com', 'City/Town Resident', 'Associate', 120, '2023-03-20 11:15:29', '2023-03-20 11:15:29'),
(2, 'tola', 'abdi', 'kuma', 'Male', 30, 'Amhara', 'bahardar health Bureau', '0912131415', 'tola@gmail.com', 'Government Workers', 'Associate', 120, '2023-04-04 10:46:23', '2023-04-04 10:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=1489 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Tigray', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(2, 'Afar', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(3, 'Amhara', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(4, 'Benishangul-Gumuz', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(5, 'Dire Dawa', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(6, 'Gambela', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(7, 'Harari', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(8, 'Somali', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(9, 'SNNP', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(10, 'Addis Ababa', '2023-03-16 15:29:38', '2023-03-16 15:29:38'),
(11, 'Sidama', '2023-03-16 15:29:38', '2023-03-16 15:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `region_member_pays`
--

CREATE TABLE `region_member_pays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `region` varchar(255) NOT NULL,
  `member_id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `position` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `region_member_pays`
--

INSERT INTO `region_member_pays` (`id`, `region`, `member_id`, `name`, `position`, `amount`, `date`, `created_at`, `updated_at`) VALUES
(1, 'SNNP', '1', 'Ayansa Mulisa Milkessa', 'City/Town Resident', 120, '2023-03-19', '2023-03-20 11:15:44', '2023-03-20 11:15:44');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=399 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2026-04-11 18:18:38', NULL),
(2, 'head-office', 'web', '2026-04-18 08:45:29', '2026-04-18 08:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(45, 7),
(46, 7),
(47, 7),
(48, 7),
(251, 7),
(248, 7),
(250, 7),
(249, 7),
(97, 41),
(98, 41),
(99, 41),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` text NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=1638 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('C6MjGxTylEtYLhC1XcOHGzdSReoK0ABkXrbiRAS0', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiUkhFTUJYN0txTjZ2S1ROcVc3amo5eTVES1U3dEFmYUhHMllRVll2UiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM3OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZW1wbG95ZWVzL3BkZi84Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFl5RkhJZTJNdnBJcVdWSThINDVYTU84cWZzUmxnQXc0RG1oRFA5V2FmTnpQNGtheTdWczhtIjt9', 1773464261),
('aTcHN1SXNKccnpHTmXSmctQcWnbK0iwBmqrqltEz', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36 Edg/145.0.0.0', 'YTo2OntzOjY6Il90b2tlbiI7czo0MDoiRTExTzdGYzhNSkdQYVhQSTcxSThCbFJmeEdsem9BVlFaWmw3MGlNSSI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjY2OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZW1wbG95ZWVzP3BhZ2U9MSZyZWdpb25fZmlsdGVyPUFkZGlzJTIwQWJhYmEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjE3OiJwYXNzd29yZF9oYXNoX3dlYiI7czo2MDoiJDJ5JDEwJFl5RkhJZTJNdnBJcVdWSThINDVYTU84cWZzUmxnQXc0RG1oRFA5V2FmTnpQNGtheTdWczhtIjtzOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1773519680);

-- --------------------------------------------------------

--
-- Table structure for table `sh_bahaa`
--

CREATE TABLE `sh_bahaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sh_bahaa`
--

INSERT INTO `sh_bahaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(2, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(3, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(4, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(5, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(6, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(7, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(8, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(9, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52'),
(10, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-28 13:44:52', '2025-11-28 13:44:52');

-- --------------------------------------------------------

--
-- Table structure for table `sh_kaabaa`
--

CREATE TABLE `sh_kaabaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sh_kaabaa`
--

INSERT INTO `sh_kaabaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(153, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(154, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(155, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(156, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(157, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(158, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(159, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(160, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(161, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00'),
(162, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-28 17:48:00', '2025-11-28 17:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `sh_k_lixaa`
--

CREATE TABLE `sh_k_lixaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sh_k_lixaa`
--

INSERT INTO `sh_k_lixaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbataa Miti-Mootummaa', 'Agaarfaa', '945454545', 'gadaa@gmailcom', 'waggaan', '2025-11-28', NULL, '2025-11-28 18:00:57', '2025-11-28 18:00:57'),
(2, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(3, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(4, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(5, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(6, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(7, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(8, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(9, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(10, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26'),
(11, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-28 18:04:26', '2025-11-28 18:04:26');

-- --------------------------------------------------------

--
-- Table structure for table `sh_lixaa`
--

CREATE TABLE `sh_lixaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sh_lixaa`
--

INSERT INTO `sh_lixaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(2, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(3, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(4, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(5, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(6, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(7, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(8, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(9, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24'),
(10, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-28 18:22:24', '2025-11-28 18:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `two_factor_secret` text DEFAULT NULL,
  `two_factor_recovery_codes` text DEFAULT NULL,
  `two_factor_confirmed_at` timestamp NULL DEFAULT NULL,
  `zone` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `fayda_fin` varchar(100) DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=4096 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `two_factor_confirmed_at`, `zone`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `fayda_fin`) VALUES
(1, 'Admin', 'ecc@admin.com', '2026-02-23 19:47:19', '$2y$10$BfMngNpmeEuRNlce.8r51exrHPOZljS8TRzfcqIkXoLIScH5xtEbq', NULL, NULL, NULL, NULL, '1TsHraNIqzv7k93BEN0Sh2xh8S5AUcVXcANLvROwGaXms9SQa4xpSc7X9TBF', NULL, '../assets/img/avatars/image.jpg', '2023-03-16 15:29:37', '2026-05-16 19:51:10', '701643173984'),
(31, 'Adem Ahmed', 'ademahmedbekar@gmail.com', NULL, '$2y$10$n6h/mixLHrHCGhQ/PpKTEePDXDZ.1RUErkmYT1/xBDXl/3YL8Bw9q', NULL, NULL, NULL, 'zone 1', NULL, NULL, NULL, '2026-05-16 19:52:15', '2026-05-16 19:52:15', NULL),
(33, 'Admin2', 'ecc2@admin.com', NULL, '$2y$10$yx69fmPT3bnIpQJNF2zMt.FjsJCoXFi9Ov9P7UkmvMsJGOIgPeOy.', NULL, NULL, NULL, 'zone 1', NULL, NULL, NULL, '2026-05-19 11:35:23', '2026-05-19 11:35:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wahaa`
--

CREATE TABLE `wahaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wahaa`
--

INSERT INTO `wahaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(1, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(2, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(3, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(4, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(5, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(6, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(7, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(8, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(9, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02'),
(10, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-28 18:46:02', '2025-11-28 18:46:02');

-- --------------------------------------------------------

--
-- Table structure for table `weekly_report`
--

CREATE TABLE `weekly_report` (
  `id` int(11) NOT NULL,
  `zone` varchar(100) DEFAULT NULL,
  `category` varchar(100) DEFAULT NULL,
  `qonnaa_bulaa` int(11) DEFAULT NULL,
  `H_Mootummaa` int(11) DEFAULT NULL,
  `J_magaalaa` int(11) DEFAULT NULL,
  `daldalaa_a_c` int(11) DEFAULT NULL,
  `geejjiba` int(11) DEFAULT NULL,
  `sector` int(11) DEFAULT NULL,
  `total_plan` int(11) DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `created_at` timestamp(6) NULL DEFAULT NULL,
  `total_achieve` int(11) GENERATED ALWAYS AS (ifnull(`qonnaa_bulaa`,0) + ifnull(`H_Mootummaa`,0) + ifnull(`J_magaalaa`,0) + ifnull(`daldalaa_a_c`,0) + ifnull(`geejjiba`,0) + ifnull(`sector`,0)) STORED,
  `percent` decimal(6,2) GENERATED ALWAYS AS (case when `total_plan` > 0 then `total_achieve` / `total_plan` * 100 else 0 end) STORED,
  `week` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `weekly_report`
--

INSERT INTO `weekly_report` (`id`, `zone`, `category`, `qonnaa_bulaa`, `H_Mootummaa`, `J_magaalaa`, `daldalaa_a_c`, `geejjiba`, `sector`, `total_plan`, `updated_at`, `created_at`, `week`) VALUES
(6, 'Shawaa Lixaa', 'zone', 67851132, 1323401, 2918285, 20472000, 1089380, 8990491, 50083702, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(7, 'Baalee', 'zone', 22804840, 46400, 70000, 2605229, 4141080, 1069345, 20283440, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(8, 'Shawaa Bahaa', 'zone', 24170378, 1264293, 2054104, 4784765, 7121247, 6436726, 30497944, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(9, 'Harargee Lixaa', 'zone', 25134500, 3411970, 2205252, 5533600, 330906, 6045462, 31194277, '2025-12-19 19:21:44.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(10, 'Arsii', 'zone', 32898952, 1897728, 6774730, 27906333, 1037679, 11688976, 69343787, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(11, 'Jimma', 'zone', 48860497, 1072907, 851683, 6114951, 1102000, 5510076, 54316412, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(12, 'Wallagga Bahaa', 'zone', 16391547, 2377607, 1151340, 2470475, 1136510, 6932275, 29410537, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(13, 'Harargee Bahaa', 'zone', 38905138, 6090814, 659000, 5178500, 13426, 6563721, 59667375, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(14, 'Gujii Lixaa', 'zone', 7959657, 1720513, 847270, 1301799, 0, 0, 17786051, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(15, 'Shawaa Kaabaa', 'zone', 11523485, 204292, 3377386, 5216750, 88700, 2837879, 36504459, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(16, 'Buno Beddellee', 'zone', 5300090, 35000, 29200, 2437100, 620630, 990000, 15958415, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(17, 'Horo Guduruu Wallaggaa', 'zone', 1047000, 430020, 695583, 1990672, 299240, 5070680, 17738051, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(18, 'Arsii Lixaa', 'zone', 13100858, 412548, 2104277, 3358900, 54600, 4336800, 38450252, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(19, 'Shawaa Kibba Lixaa', 'zone', 1799799, 435018, 2105823, 3976450, 486990, 2226472, 23592353, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(20, 'Baalee Bahaa', 'zone', 2229080, 263431, 45200, 2182234, 38820, 0, 12398510, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(21, 'Wallagga Lixaa', 'zone', 2642900, 1698469, 143262, 3398018, 74570, 3623000, 32135895, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(22, 'Gujii', 'zone', 971800, 841742, 72710, 1105220, 0, 215000, 14657149, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(23, 'Illuu Abbaa Boraa', 'zone', 549780, 598178, 28800, 1227100, 139570, 1008983, 16555683, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(24, 'Qellem Wallaggaa', 'zone', 178680, 433784, 149100, 2018692, 178898, 86071, 20928402, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(25, 'Borana', 'zone', 300000, 49545, 0, 0, 0, 0, 1267235, '2025-12-19 17:42:10.000000', '2025-12-19 17:42:10.000000', '2025-W51'),
(26, 'B/M Adaamaa', 'city', 1808861, 327088, 0, 10328754, 4062800, 5976633, 27388420, '2026-01-30 12:43:33.000000', '2026-01-30 12:27:06.000000', '2025-W51'),
(27, 'B/M/Holotaa', 'city', 526350, 0, 0, 2169390, 120400, 4408147, 4841919, '2026-01-30 13:08:02.000000', '2026-01-30 12:59:41.000000', '2025-W51'),
(28, 'B/M/Amboo', 'city', 3143800, 8890, 0, 1952400, 1815060, 768400, 6924982, '2026-01-30 13:14:32.000000', '2026-01-30 13:12:51.000000', '2025-W51'),
(29, 'Shager', 'city', 11082280, 0, 0, 54733613, 2019241, 0, 62877378, '2026-01-30 13:19:12.000000', '2026-01-30 13:17:58.000000', '2025-W51'),
(30, 'B/M/Walisoo', 'city', 2136800, 43900, 0, 2134200, 187400, 0, 4378442, '2026-01-30 13:23:17.000000', '2026-01-30 13:23:17.000000', '2025-W51'),
(31, 'B/M/Bishooftuu', 'city', 4320276, 27923, 0, 6092499, 426837, 4731753, 16478274, '2026-01-30 13:29:10.000000', '2026-01-30 13:29:10.000000', '2025-W51'),
(32, 'B/M Asallaa', 'city', 39022, 193314, 0, 2410947, 876280, 1342395, 5535053, '2026-01-30 13:47:35.000000', '2026-01-30 13:41:24.000000', '2025-W51'),
(33, 'B/M/Shaashamannee', 'city', 616100, 350118, 0, 2878300, 3714958, 0, 9175220, '2026-01-30 13:55:15.000000', '2026-01-30 13:54:40.000000', '2025-W51'),
(34, 'M/Mattuu', 'city', 221600, 28990, NULL, 1307639, 141990, 139040, 2274746, '2026-01-30 16:28:08.000000', '2026-01-30 16:28:08.000000', '2025-W51'),
(35, 'B/Federaalaa', 'city', NULL, 201122, NULL, NULL, NULL, NULL, 251460, '2026-01-30 16:29:30.000000', '2026-01-30 16:29:30.000000', '2025-W51');

-- --------------------------------------------------------

--
-- Table structure for table `woreda`
--

CREATE TABLE `woreda` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `zone` varchar(100) DEFAULT NULL,
  `updated_at` timestamp(6) NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `woreda`
--

INSERT INTO `woreda` (`id`, `name`, `zone`, `updated_at`) VALUES
(1, 'Aseko', 'Arsii', NULL),
(2, 'Bale Gasegar', 'Arsi', NULL),
(3, 'Bekoji', 'Arsi', NULL),
(4, 'Chole', 'Arsi', NULL),
(5, 'Diksis', 'Arsi', NULL),
(6, 'Dodota', 'Arsi', NULL),
(7, 'Hetosa', 'Arsi', NULL),
(8, 'Enkelo Wabe', 'Arsi', NULL),
(9, 'Guna', 'Arsi', NULL),
(10, 'Ginchi', 'Arsi', NULL),
(11, 'Hitosa', 'Arsi', NULL),
(12, 'Jeju', 'Arsi', NULL),
(13, 'Lemu Bilbilo', 'Arsi', NULL),
(14, 'Merti', 'Arsi', NULL),
(15, 'Munessa', 'Arsi', NULL),
(16, 'Robe', 'Arsi', NULL),
(17, 'Sire', 'Arsi', NULL),
(18, 'Shirka', 'Arsi', NULL),
(19, 'Tena', 'Arsi', NULL),
(20, 'Ticho', 'Arsi', NULL),
(21, 'Abomsa', 'Arsi Lixaa', NULL),
(22, 'Adele', 'Arsi Lixaa', NULL),
(23, 'Amigna', 'Arsi Lixaa', NULL),
(24, 'Asebot', 'Arsi Lixaa', NULL),
(25, 'Bale', 'Arsi Lixaa', NULL),
(26, 'Dheebiti', 'Arsi Lixaa', NULL),
(27, 'Dengora', 'Arsi Lixaa', NULL),
(28, 'Gololcha', 'Arsi Lixaa', NULL),
(29, 'Jara', 'Arsi Lixaa', NULL),
(30, 'Kofele', 'Arsi Lixaa', NULL),
(31, 'Munesa', 'Arsi Lixaa', NULL),
(32, 'Seru', 'Arsi Lixaa', NULL),
(33, 'Sherka', 'Arsi Lixaa', NULL),
(34, 'Ziway Dugda', 'Arsi Lixaa', NULL),
(35, 'Siraro', 'Arsi Lixaa', NULL),
(36, 'Agarfa', 'Bale', NULL),
(37, 'Berbere', 'Bale', NULL),
(38, 'Delo Mena', 'Bale', NULL),
(39, 'Dinsho', 'Bale', NULL),
(40, 'Dawe Kechen', 'Bale', NULL),
(41, 'Dawe Serer', 'Bale', NULL),
(42, 'Goro', 'Bale', NULL),
(43, 'Goba', 'Bale', NULL),
(44, 'Guradamole', 'Bale', NULL),
(45, 'Gasera', 'Bale', NULL),
(46, 'Mada Walabu', 'Bale', NULL),
(47, 'Raytu', 'Bale', NULL),
(48, 'Sinana', 'Bale', NULL),
(49, 'Seweyna', 'Bale', NULL),
(50, 'Delomena Town', 'Bale', NULL),
(51, 'Robe Town', 'Bale', NULL),
(52, 'Goba Town', 'Bale', NULL),
(53, 'Wabera', 'Bale', NULL),
(54, 'Laga Hida', 'Bale', NULL),
(55, 'Beltu', 'Bale', NULL),
(56, 'Beltu', 'Bale Bahaa', NULL),
(57, 'Bokko', 'Bale Bahaa', NULL),
(58, 'Burka Dhintu', 'Bale Bahaa', NULL),
(59, 'Guradhamole', 'Bale Bahaa', NULL),
(60, 'Harena Buluk', 'Bale Bahaa', NULL),
(61, 'Laga Hidha', 'Bale Bahaa', NULL),
(62, 'Sawana', 'Bale Bahaa', NULL),
(63, 'Wabera', 'Bale Bahaa', NULL),
(64, 'Dawe Kechen', 'Bale Bahaa', NULL),
(65, 'Delo', 'Bale Bahaa', NULL),
(66, 'Kufa', 'Bale Bahaa', NULL),
(67, 'Harge Arsi', 'Bale Bahaa', NULL),
(68, 'Hibirna', 'Bale Bahaa', NULL),
(69, 'Gololcha', 'Bale Bahaa', NULL),
(70, 'Gindhir', 'Bale Bahaa', NULL),
(71, 'Arero', 'Borena', NULL),
(72, 'Dire', 'Borena', NULL),
(73, 'Dillo', 'Borena', NULL),
(74, 'Dida Yabello', 'Borena', NULL),
(75, 'Elwaya', 'Borena', NULL),
(76, 'Guchi', 'Borena', NULL),
(77, 'Moyale', 'Borena', NULL),
(78, 'Miyo', 'Borena', NULL),
(79, 'Teltelle', 'Borena', NULL),
(80, 'Wadara', 'Borena', NULL),
(81, 'Yabello', 'Borena', NULL),
(82, 'Dugda Dawa', 'Borena', NULL),
(83, 'Gelana', 'Borena', NULL),
(84, 'Meda Welabu', 'Borena', NULL),
(85, 'Yayu', 'Borena', NULL),
(86, 'Adola', 'Guji', NULL),
(87, 'Dama', 'Guji', NULL),
(88, 'Dugda Dawa', 'Guji', NULL),
(89, 'Goro Dola', 'Guji', NULL),
(90, 'Haro Dumal', 'Guji', NULL),
(91, 'Liban', 'Guji', NULL),
(92, 'Malka Soda', 'Guji', NULL),
(93, 'Saba Boru', 'Guji', NULL),
(94, 'Uba Debretsehay', 'Guji', NULL),
(95, 'Girja', 'Guji', NULL),
(96, 'Bule Hora', 'Guji', NULL),
(97, 'Birbirsa Kojowa', 'West Guji', NULL),
(98, 'Dugda Dawa', 'West Guji', NULL),
(99, 'Gelana', 'West Guji', NULL),
(100, 'Hambela Wamena', 'West Guji', NULL),
(101, 'Karcha', 'West Guji', NULL),
(102, 'Melka Soda', 'West Guji', NULL),
(103, 'Suro Berguda', 'West Guji', NULL),
(104, 'Abaya', 'West Guji', NULL),
(105, 'Bule Hora Town', 'West Guji', NULL),
(106, 'Babille', 'East Hararghe', NULL),
(107, 'Boke', 'East Hararghe', NULL),
(108, 'Chinaksen', 'East Hararghe', NULL),
(109, 'Dadar', 'East Hararghe', NULL),
(110, 'Fedis', 'East Hararghe', NULL),
(111, 'Gola Oda', 'East Hararghe', NULL),
(112, 'Goro Gutu', 'East Hararghe', NULL),
(113, 'Gursum', 'East Hararghe', NULL),
(114, 'Haramaya', 'East Hararghe', NULL),
(115, 'Jarso', 'East Hararghe', NULL),
(116, 'Kombolcha', 'East Hararghe', NULL),
(117, 'Kumbi', 'East Hararghe', NULL),
(118, 'Malka Balo', 'East Hararghe', NULL),
(119, 'Meyu', 'East Hararghe', NULL),
(120, 'Meta', 'East Hararghe', NULL),
(121, 'Midega Tola', 'East Hararghe', NULL),
(122, 'Qumbi', 'East Hararghe', NULL),
(123, 'Bedeno', 'East Hararghe', NULL),
(124, 'Badessa', 'West Hararghe', NULL),
(125, 'Boke', 'West Hararghe', NULL),
(126, 'Charlie', 'West Hararghe', NULL),
(127, 'Chiro', 'West Hararghe', NULL),
(128, 'Daro Lebu', 'West Hararghe', NULL),
(129, 'Doba', 'West Hararghe', NULL),
(130, 'Gemechis', 'West Hararghe', NULL),
(131, 'Gumbi-Bordode', 'West Hararghe', NULL),
(132, 'Habro', 'West Hararghe', NULL),
(133, 'Masela', 'West Hararghe', NULL),
(134, 'Meiso', 'West Hararghe', NULL),
(135, 'Nanno', 'West Hararghe', NULL),
(136, 'Tulo', 'West Hararghe', NULL),
(137, 'Anchar', 'West Hararghe', NULL),
(138, 'Daro Dhibu', 'West Hararghe', NULL),
(139, 'Ada’a', 'East Shewa', NULL),
(140, 'Akaki', 'East Shewa', NULL),
(141, 'Boset', 'East Shewa', NULL),
(142, 'Fentale', 'East Shewa', NULL),
(143, 'Gimbichu', 'East Shewa', NULL),
(144, 'Liben', 'East Shewa', NULL),
(145, 'Lume', 'East Shewa', NULL),
(146, 'Merti', 'East Shewa', NULL),
(147, 'Adama City', 'East Shewa', NULL),
(148, 'Bishoftu City', 'East Shewa', NULL),
(149, 'Modjo', 'East Shewa', NULL),
(150, 'Shashamane Town', 'East Shewa', NULL),
(151, 'Abuna Ginde Beret', 'West Shewa', NULL),
(152, 'Ambo', 'West Shewa', NULL),
(153, 'Bako Tibe', 'West Shewa', NULL),
(154, 'Cheliya', 'West Shewa', NULL),
(155, 'Dendi', 'West Shewa', NULL),
(156, 'Ejere', 'West Shewa', NULL),
(157, 'Ginde Beret', 'West Shewa', NULL),
(158, 'Gobu Seyo', 'West Shewa', NULL),
(159, 'Haro Limmu', 'West Shewa', NULL),
(160, 'Jibat', 'West Shewa', NULL),
(161, 'Jeldu', 'West Shewa', NULL),
(162, 'Liban Jawi', 'West Shewa', NULL),
(163, 'Mida Kegn', 'West Shewa', NULL),
(164, 'Meta Robi', 'West Shewa', NULL),
(165, 'Nono', 'West Shewa', NULL),
(166, 'Tikur', 'West Shewa', NULL),
(167, 'Wolmera', 'West Shewa', NULL),
(168, 'Toke Kutaye', 'West Shewa', NULL),
(169, 'Ambo Town', 'West Shewa', NULL),
(170, 'Berehna Aleltu', 'North Shewa', NULL),
(171, 'Degem', 'North Shewa', NULL),
(172, 'Girar Jarso', 'North Shewa', NULL),
(173, 'Hidhabu Abote', 'North Shewa', NULL),
(174, 'Jida', 'North Shewa', NULL),
(175, 'Kuyu', 'North Shewa', NULL),
(176, 'Muke Turi', 'North Shewa', NULL),
(177, 'Wara Jarso', 'North Shewa', NULL),
(178, 'Fiche Town', 'North Shewa', NULL),
(179, 'Sendafa Town', 'North Shewa', NULL),
(180, 'Bacho', 'Southwest Shewa', NULL),
(181, 'Becho', 'Southwest Shewa', NULL),
(182, 'Dawo', 'Southwest Shewa', NULL),
(183, 'Goro', 'Southwest Shewa', NULL),
(184, 'Illu', 'Southwest Shewa', NULL),
(185, 'Kersana Malima', 'Southwest Shewa', NULL),
(186, 'Saden Sodo', 'Southwest Shewa', NULL),
(187, 'Sebeta Hawas', 'Southwest Shewa', NULL),
(188, 'Tulu Bolo Town', 'Southwest Shewa', NULL),
(189, 'Woliso Town', 'Southwest Shewa', NULL),
(190, 'Agaro', 'Jimma', NULL),
(191, 'Chora Botor', 'Jimma', NULL),
(192, 'Dedo', 'Jimma', NULL),
(193, 'Gera', 'Jimma', NULL),
(194, 'Gomma', 'Jimma', NULL),
(195, 'Kersa', 'Jimma', NULL),
(196, 'Limu Kosa', 'Jimma', NULL),
(197, 'Mana', 'Jimma', NULL),
(198, 'Omo Nada', 'Jimma', NULL),
(199, 'Seka Chekorsa', 'Jimma', NULL),
(200, 'Shebe Sombo', 'Jimma', NULL),
(201, 'Sigmo', 'Jimma', NULL),
(202, 'Tiro Afeta', 'Jimma', NULL),
(203, 'Arjo', 'East Wollega', NULL),
(204, 'Boneya Boshe', 'East Wollega', NULL),
(205, 'Digga', 'East Wollega', NULL),
(206, 'Gida Ayana', 'East Wollega', NULL),
(207, 'Guto Gida', 'East Wollega', NULL),
(208, 'Jimma Arjo', 'East Wollega', NULL),
(209, 'Leka Dulecha', 'East Wollega', NULL),
(210, 'Sasiga', 'East Wollega', NULL),
(211, 'Sibu Sire', 'East Wollega', NULL),
(212, 'Wayu Tuka', 'East Wollega', NULL),
(213, 'Nekemte Town', 'East Wollega', NULL),
(214, 'Ayira', 'West Wollega', NULL),
(215, 'Boji Dirmaji', 'West Wollega', NULL),
(216, 'Boji Chekorsa', 'West Wollega', NULL),
(217, 'Gimbi', 'West Wollega', NULL),
(218, 'Gulisso', 'West Wollega', NULL),
(219, 'Haroo Limmu', 'West Wollega', NULL),
(220, 'Hawa Welle', 'West Wollega', NULL),
(221, 'Jarso', 'West Wollega', NULL),
(222, 'Kondala', 'West Wollega', NULL),
(223, 'Lalo Asabi', 'West Wollega', NULL),
(224, 'Nejo', 'West Wollega', NULL),
(225, 'Nekemte Town', 'West Wollega', NULL),
(226, 'Abay Chomen', 'Horo Guduru Wollega', NULL),
(227, 'Hababo Guduru', 'Horo Guduru Wollega', NULL),
(228, 'Haro Wenchi', 'Horo Guduru Wollega', NULL),
(229, 'Horo', 'Horo Guduru Wollega', NULL),
(230, 'Jardega Jarte', 'Horo Guduru Wollega', NULL),
(231, 'Jimma Genete', 'Horo Guduru Wollega', NULL),
(232, 'Guduru', 'Horo Guduru Wollega', NULL),
(233, 'Shambu Town', 'Horo Guduru Wollega', NULL),
(234, 'Anfillo', 'Kellem Wollega', NULL),
(235, 'Dale Sedi', 'Kellem Wollega', NULL),
(236, 'Dembi Dollo', 'Kellem Wollega', NULL),
(237, 'Gidami', 'Kellem Wollega', NULL),
(238, 'Hawa Galan', 'Kellem Wollega', NULL),
(239, 'Sayyo', 'Kellem Wollega', NULL),
(240, 'Yemalogi Welele', 'Kellem Wollega', NULL),
(241, 'Alge Sachi', 'Illubabor', NULL),
(242, 'Bacho', 'Illubabor', NULL),
(243, 'Bilo Nopha', 'Illubabor', NULL),
(244, 'Bure', 'Illubabor', NULL),
(245, 'Darimu', 'Illubabor', NULL),
(246, 'Doraani', 'Illubabor', NULL),
(247, 'Gechi', 'Illubabor', NULL),
(248, 'Gore Town', 'Illubabor', NULL),
(249, 'Hurumu', 'Illubabor', NULL),
(250, 'Metu Town', 'Illubabor', NULL),
(251, 'Yayu', 'Illubabor', NULL),
(252, 'Supena Sodo', 'Illubabor', NULL),
(253, 'Burayu', 'Shaggar', NULL),
(254, 'Gelan', 'Shaggar', NULL),
(255, 'Dukem', 'Shaggar', NULL),
(256, 'Sebeta', 'Shaggar', NULL),
(257, 'Legetafo', 'Shaggar', NULL),
(258, 'Sululta', 'Shaggar', NULL),
(259, 'Sendafa', 'Shaggar', NULL),
(260, 'Holeta', 'Shaggar', NULL),
(261, 'Laga Tafo-Laga Dadi', 'Shaggar', NULL),
(262, 'Bishoftu', 'Shaggar', NULL),
(263, 'Woreda 01', 'Addis Ketema', NULL),
(264, 'Woreda 02', 'Addis Ketema', NULL),
(265, 'Woreda 03', 'Addis Ketema', NULL),
(266, 'Woreda 04', 'Addis Ketema', NULL),
(267, 'Woreda 05', 'Addis Ketema', NULL),
(268, 'Woreda 06', 'Addis Ketema', NULL),
(269, 'Woreda 07', 'Addis Ketema', NULL),
(270, 'Woreda 08', 'Addis Ketema', NULL),
(271, 'Woreda 09', 'Addis Ketema', NULL),
(272, 'Woreda 10', 'Addis Ketema', NULL),
(273, 'Woreda 01', 'Akaki Kality', NULL),
(274, 'Woreda 02', 'Akaki Kality', NULL),
(275, 'Woreda 03', 'Akaki Kality', NULL),
(276, 'Woreda 04', 'Akaki Kality', NULL),
(277, 'Woreda 05', 'Akaki Kality', NULL),
(278, 'Woreda 06', 'Akaki Kality', NULL),
(279, 'Woreda 07', 'Akaki Kality', NULL),
(280, 'Woreda 08', 'Akaki Kality', NULL),
(281, 'Woreda 09', 'Akaki Kality', NULL),
(282, 'Woreda 10', 'Akaki Kality', NULL),
(283, 'Woreda 01', 'Arada', NULL),
(284, 'Woreda 02', 'Arada', NULL),
(285, 'Woreda 03', 'Arada', NULL),
(286, 'Woreda 04', 'Arada', NULL),
(287, 'Woreda 05', 'Arada', NULL),
(288, 'Woreda 06', 'Arada', NULL),
(289, 'Woreda 07', 'Arada', NULL),
(290, 'Woreda 08', 'Arada', NULL),
(291, 'Woreda 09', 'Arada', NULL),
(292, 'Woreda 01', 'Bole', NULL),
(293, 'Woreda 02', 'Bole', NULL),
(294, 'Woreda 03', 'Bole', NULL),
(295, 'Woreda 04', 'Bole', NULL),
(296, 'Woreda 05', 'Bole', NULL),
(297, 'Woreda 06', 'Bole', NULL),
(298, 'Woreda 07', 'Bole', NULL),
(299, 'Woreda 08', 'Bole', NULL),
(300, 'Woreda 09', 'Bole', NULL),
(301, 'Woreda 10', 'Bole', NULL),
(302, 'Woreda 01', 'Gullele', NULL),
(303, 'Woreda 02', 'Gullele', NULL),
(304, 'Woreda 03', 'Gullele', NULL),
(305, 'Woreda 04', 'Gullele', NULL),
(306, 'Woreda 05', 'Gullele', NULL),
(307, 'Woreda 06', 'Gullele', NULL),
(308, 'Woreda 07', 'Gullele', NULL),
(309, 'Woreda 08', 'Gullele', NULL),
(310, 'Woreda 09', 'Gullele', NULL),
(311, 'Woreda 01', 'Kirkos', NULL),
(312, 'Woreda 02', 'Kirkos', NULL),
(313, 'Woreda 03', 'Kirkos', NULL),
(314, 'Woreda 04', 'Kirkos', NULL),
(315, 'Woreda 05', 'Kirkos', NULL),
(316, 'Woreda 06', 'Kirkos', NULL),
(317, 'Woreda 07', 'Kirkos', NULL),
(318, 'Woreda 08', 'Kirkos', NULL),
(319, 'Woreda 09', 'Kirkos', NULL),
(320, 'Woreda 01', 'Kolfe Keranyo', NULL),
(321, 'Woreda 02', 'Kolfe Keranyo', NULL),
(322, 'Woreda 03', 'Kolfe Keranyo', NULL),
(323, 'Woreda 04', 'Kolfe Keranyo', NULL),
(324, 'Woreda 05', 'Kolfe Keranyo', NULL),
(325, 'Woreda 06', 'Kolfe Keranyo', NULL),
(326, 'Woreda 07', 'Kolfe Keranyo', NULL),
(327, 'Woreda 08', 'Kolfe Keranyo', NULL),
(328, 'Woreda 09', 'Kolfe Keranyo', NULL),
(329, 'Woreda 01', 'Lideta', NULL),
(330, 'Woreda 02', 'Lideta', NULL),
(331, 'Woreda 03', 'Lideta', NULL),
(332, 'Woreda 04', 'Lideta', NULL),
(333, 'Woreda 05', 'Lideta', NULL),
(334, 'Woreda 06', 'Lideta', NULL),
(335, 'Woreda 07', 'Lideta', NULL),
(336, 'Woreda 08', 'Lideta', NULL),
(337, 'Woreda 01', 'Nifas Silk-Lafto', NULL),
(338, 'Woreda 02', 'Nifas Silk-Lafto', NULL),
(339, 'Woreda 03', 'Nifas Silk-Lafto', NULL),
(340, 'Woreda 04', 'Nifas Silk-Lafto', NULL),
(341, 'Woreda 05', 'Nifas Silk-Lafto', NULL),
(342, 'Woreda 06', 'Nifas Silk-Lafto', NULL),
(343, 'Woreda 07', 'Nifas Silk-Lafto', NULL),
(344, 'Woreda 08', 'Nifas Silk-Lafto', NULL),
(345, 'Woreda 01', 'Yeka', NULL),
(346, 'Woreda 02', 'Yeka', NULL),
(347, 'Woreda 03', 'Yeka', NULL),
(348, 'Woreda 04', 'Yeka', NULL),
(349, 'Woreda 05', 'Yeka', NULL),
(350, 'Woreda 06', 'Yeka', NULL),
(351, 'Woreda 07', 'Yeka', NULL),
(352, 'Woreda 08', 'Yeka', NULL),
(353, 'Woreda 01', 'Akaki Kaliti', NULL),
(354, 'Woreda 02', 'Akaki Kaliti', NULL),
(355, 'Woreda 03', 'Akaki Kaliti', NULL),
(356, 'Woreda 04', 'Akaki Kaliti', NULL),
(357, 'Woreda 05', 'Akaki Kaliti', NULL),
(358, 'Woreda 06', 'Akaki Kaliti', NULL),
(359, 'Woreda 07', 'Akaki Kaliti', NULL),
(360, 'Woreda 08', 'Akaki Kaliti', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `w_lixaa`
--

CREATE TABLE `w_lixaa` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `organization_name` varchar(150) NOT NULL,
  `organization_type` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `payment_period` varchar(50) DEFAULT NULL,
  `member_started` varchar(100) DEFAULT NULL,
  `payment` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `w_lixaa`
--

INSERT INTO `w_lixaa` (`id`, `member_id`, `organization_name`, `organization_type`, `woreda`, `phone_number`, `email`, `payment_period`, `member_started`, `payment`, `created_at`, `updated_at`) VALUES
(11, '10004402', 'Warshaa Daakuu', 'Dhaabbata Miti-Mootummaa', 'Adaabbaa', '945454545', 'gad@gmailcom', 'waggaan', '44114', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(12, '10004403', 'Coop', 'Dhaabbata Miti-Mootummaa', 'A/A/Nagellee', '945454545', 'abdu@gmail.com', 'waggaan', '44115', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(13, '10004404', 'CBE', 'Dhaabbata Miti-Mootummaa', 'Siraaroo', '945454545', 'has@gmail.com', 'waggaan', '44116', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(14, '10004405', 'Awaash Bank', 'Dhaabbata Miti-Mootummaa', 'G/Hasaasaa', '945454545', 'Aliy@gmail.com', 'waggaan', '44117', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(15, '10004406', 'Awaash valley', 'Dhaabbata Miti-Mootummaa', 'Kofalee', '945454545', 'girl@gmail.com', 'waggaan', '44118', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(16, '10004407', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Dodolaa', '945454545', 'wasser@gmailcom', 'waggaan', '44119', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(17, '10004408', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Kokkosaa', '945454545', 'nashas@gmail.com', 'waggaan', '44120', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(18, '10004409', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Nansaboo', '945454545', 'goal@gmail.com', 'waggaan', '44121', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(19, '10004410', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Qoree', '945454545', 'mars@gmail.com', 'waggaan', '44122', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47'),
(20, '10004411', 'Dangote', 'Dhaabbata Miti-Mootummaa', 'Shallaa', '945454545', 'ken@gmail.com', 'waggaan', '44123', 10000000, '2025-11-28 19:01:47', '2025-11-28 19:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `w_officers`
--

CREATE TABLE `w_officers` (
  `id` int(11) NOT NULL,
  `zone` varchar(100) DEFAULT NULL,
  `woreda` varchar(100) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `w_officers`
--

INSERT INTO `w_officers` (`id`, `zone`, `woreda`, `name`) VALUES
(1, 'Sh/Kaaabaa', 'Darraa', 'Habtamuu Indalee'),
(2, 'Sh/Kaaabaa', 'H/Abootee', 'Ashanaafi Suyyum'),
(3, 'Sh/Kaaabaa', 'W/Jaarsoo', 'Mangistuu Birruu'),
(4, 'Sh/Kaaabaa', 'Kuyyuu', 'Obsee Tacanaa'),
(5, 'Sh/Kaaabaa', 'Dagam', 'Asmaraa Mootummaa'),
(6, 'Sh/Kaaabaa', 'G/Jaarsoo', 'Mulee Geetuu'),
(7, 'Sh/Kaaabaa', 'D/Libaanoos', 'Shifaraa Takluu'),
(8, 'Sh/Kaaabaa', 'Waacaalee', 'Abaraa Tolchaa'),
(9, 'Sh/Kaaabaa', 'Sulultaa', 'Asmaraa Dammuu'),
(10, 'Sh/Kaaabaa', 'Qimbiibit', 'Kee\'olii Dheeressaa'),
(11, 'Shaggar', 'Furii', 'Waaggaarii Qalbeessaa'),
(12, 'Shaggar', 'Sulultaa', 'Masarat Zawudee'),
(13, 'Shaggar', 'Sabbataa', 'Olaanaa Galaayee'),
(14, 'Shaggar', 'Galaan Guddaa', 'Akkawaaq Girmaa'),
(15, 'Shaggar', 'Malkaa Noonnoo', 'Firii Dachaasaa'),
(16, 'Shaggar', 'Gafarsaa Gujee', 'Obsaa Tasammaa'),
(17, 'Shaggar', 'Mana Abbichuu', 'Seenaa Tasammaa'),
(18, 'Shaggar', 'Galaan', 'Hundee Imaanaa'),
(19, 'Shaggar', 'Koyyee Faccee', 'Warqinash Baalchaa'),
(20, 'Holota', 'B/M Hoolotaa', 'Veenus Daammasaa'),
(21, 'Finfinnee', 'Boolee', 'Musxafaa Eda\'oo'),
(22, 'Finfinnee', 'Boolee', 'Tasfaayee Ejjataa'),
(23, 'Finfinnee', 'Nifaas Silki Laaftoo', 'Miimaa Jamaal'),
(24, 'Finfinnee', 'Nifaas Silki Laaftoo', 'Caalii Baqqalaa'),
(25, 'Finfinnee', 'Eekkaa', 'Alfiyaa Qaasim'),
(26, 'Finfinnee', 'Eekkaa', 'Dabalaa Nagaash'),
(27, 'Finfinnee', 'Araadaa', 'Fiqaaduu Itichaa'),
(28, 'Finfinnee', 'Lidataa', 'Firoomsaa Dajuu'),
(29, 'Finfinnee', 'Gullallee', 'Eeliyaas Tuujubaa'),
(30, 'Finfinnee', 'Aqaaqii', 'Haqaa Dassaalenyi'),
(31, 'Finfinnee', 'Aqaaqii', 'Nuuriyaa Bashiir'),
(32, 'Finfinnee', 'Lammii Kuraa', 'Xilahun Laggasa'),
(33, 'Finfinnee', 'Gullallee', 'Addisuu Camadaa'),
(34, 'Finfinnee', 'Lammii Kuraa', 'Gurmuu Birhanuu'),
(35, 'Baalee', 'Sinaanaa', 'Charuu Fiqaaduu Asaffa'),
(36, 'Baalee', 'Goobbaa', 'Huseen Muhaammad Aliyyii'),
(37, 'Baalee', 'Diinshoo', 'Fooziyaa Kadiir Sheekkoo'),
(38, 'Baalee', 'Gooroo', 'Abdurahmaan Ahmad Huseen'),
(39, 'Baalee', 'Agaarfaa', 'Malikaa Awwal Ahmad'),
(40, 'Baalee', 'Roobee', 'Tsion H/Maariyam Shumi'),
(41, 'W/Bahaa', 'W/Hagaloo', 'Gamachuu Bulii'),
(42, 'W/Bahaa', 'G/Biilaa', 'Dassaleny Fiqqadu'),
(43, 'W/Bahaa', 'J/Arjoo', 'Lalisee Beekumaa'),
(44, 'W/Bahaa', 'N/Qumbaa', 'Bontuu Bulii'),
(45, 'W/Bahaa', 'G/Gidaa', 'Margaa Qajeelaa'),
(46, 'W/Bahaa', 'M/Naqamtee', 'Jamara Gufulii'),
(47, 'W/Bahaa', 'Diggaa', 'Addunyaa Taayee'),
(48, 'W/Bahaa', 'L/Dulachaa', 'Mitikuu Ejetaa'),
(49, 'W/Bahaa', 'G/Sayyoo', 'Iddosaa Ganati'),
(50, 'W/Bahaa', 'B/Boshee', 'Tigist Yitagesuu'),
(51, 'W/Bahaa', 'Sasiggaa', 'Idosaa Dinqaa'),
(52, 'W/Bahaa', 'W/Tuqaa', 'Eshetuu Dufera'),
(53, 'W/Bahaa', 'Giddaa Ayyaanaa', 'Misgaanee Mosee Dhugumaa'),
(54, 'W/Bahaa', 'S/Siree', 'Bayuu Teshomee'),
(55, 'Harargee Lixaa', 'Chiro', 'Ahmed Mumed Siraj'),
(56, 'Harargee Lixaa', 'Gemmechis', 'Adanech Damise Hordofa'),
(57, 'Harargee Lixaa', 'O/Bultum', 'Abdo Ahmad Aliyi'),
(58, 'Harargee Lixaa', 'Habroo', 'Ramadan MAHAMMAD Ahmed'),
(59, 'Harargee Lixaa', 'H/Gudina', 'Kalbeesa Kalifa Yonis'),
(60, 'Harargee Lixaa', 'Xulloo', 'Muraad Abbaas Usmaan'),
(61, 'Harargee Lixaa', 'Doobaa', 'Muhee Abrishoo'),
(62, 'Harargee Lixaa', 'Mi\'esoo', 'Tajuu Hamiid Musaa'),
(63, 'Harargee Lixaa', 'B/Dhintu', 'Nasrii Shamiil'),
(64, 'Harargee Lixaa', 'SH/dhuugoo', 'Xasaw Zamade'),
(65, 'Harargee Lixaa', 'G/Qoricha', 'Abdusalaam Muhammad'),
(66, 'Harargee Lixaa', 'BMC', 'Meyram Aliyyi'),
(67, 'Harargee Lixaa', 'bokee', 'Ibsaa Juhar Nure'),
(68, 'Harargee Lixaa', 'G/Bordoode', 'Badruu Mamad Ahmed'),
(69, 'Harargee Lixaa', 'Ancaar', 'Badhaasa Suufii'),
(70, 'Harargee Lixaa', 'BMM', 'Abrahim Siraj'),
(71, 'I/A/Booraa', 'Hurrumu', 'Firaa\'ol Fiqaaduu'),
(72, 'I/A/Booraa', 'Allee', 'Gannet H/maariyam'),
(73, 'I/A/Booraa', 'Nopha', 'Bruk Tsegaye'),
(74, 'I/A/Booraa', 'Dorani', 'Dosha Adunya'),
(75, 'I/A/Booraa', 'Daarimu', 'Almaz Asfachew'),
(76, 'I/A/Booraa', 'Algee saachii', 'Amanuel Tamana'),
(77, 'I/A/Booraa', 'A/Mattuu', 'Muluqeen Girma'),
(78, 'I/A/Booraa', 'Bachoo', 'Zarihun Adino'),
(79, 'I/A/Booraa', 'Yaayyoo', 'Mihratu Oljirra'),
(80, 'I/A/Booraa', 'Diiduu', 'Natsanet Girma'),
(81, 'I/A/Booraa', 'Buree', 'Edilu Tammiru'),
(82, 'I/A/Booraa', 'S/Nonno', 'Sinishaw Takka'),
(83, 'I/A/Booraa', 'M/Mattuu', 'Birasa Teshome'),
(84, 'I/A/Booraa', 'Halu', 'Likelesh Gizaw'),
(85, 'H/G/Wallaggaa', 'A/Dongoroo', 'Tsagaayee Amsaluu'),
(86, 'H/G/Wallaggaa', 'Amuruu', 'Zamzam Usmaan Hasen'),
(87, 'H/G/Wallaggaa', 'A/Comman', 'Mastuu Mokonnin Abaatee'),
(88, 'H/G/Wallaggaa', 'J/Gannaatti', 'Hirkisaa Balaay Fufaa'),
(89, 'H/G/Wallaggaa', 'J/Raaree', 'Dassaaleny Giddumaa Dekkee'),
(90, 'H/G/Wallaggaa', 'J/Jaartee', 'Gammaachuu Baqqaanaa Toleeraa'),
(91, 'H/G/Wallaggaa', 'H/Guduruu', 'Darassaa Birihaanuu Wakjiraa'),
(92, 'H/G/Wallaggaa', 'Horroo', 'Baay\'isaa Dirribaa Baqqaalaa'),
(93, 'H/G/Wallaggaa', 'H/Bulluq', 'Galataa Fiqaaduu Fayisaa'),
(94, 'H/G/Wallaggaa', 'Guduruu', 'Gammaachuu Shaammaa Tulluu'),
(95, 'H/G/Wallaggaa', 'C/Guduruu', 'Alamayyoo Deessaa Urgeessaa'),
(96, 'H/G/Wallaggaa', 'B/M/Shaambuu', 'Amsaaluu Hoffolaa Fayisaa'),
(97, 'H/G/Wallaggaa', 'Sul/fincaa\'aa', 'Eebbisaa Dhugummaa Oliiqaa'),
(98, 'Sh/K/Lixaa', 'Walisoo', 'Dirribii Hirphasaa Naggasaa'),
(99, 'Sh/K/Lixaa', 'Q/Maallimaa', 'Caaltuu Baqqalaa Gammachuu'),
(100, 'Sh/K/Lixaa', 'Bachoo', 'Katamaa Tasammaa Kafanii'),
(101, 'Sh/K/Lixaa', 'Amayyaa', 'Nabsoo Yirgaa Waldee'),
(102, 'Sh/K/Lixaa', 'Gooroo', 'Jamaal Fadiiloo Abdoo'),
(103, 'Sh/K/Lixaa', 'S/Sooddoo', 'Jiidhaa Adaanaa Garbaa'),
(104, 'Sh/K/Lixaa', 'Daawoo', 'Gurmeessaa Hundee Baay\'isaa'),
(105, 'Sh/K/Lixaa', 'Iluu', 'Geetuu Hayiluu Lammaa'),
(106, 'Sh/K/Lixaa', 'Tolee', 'Seenaa Dammaraa Baqqalaa'),
(107, 'Sh/K/Lixaa', 'S/Daacii', 'Sisaay Korraa Badhaanee'),
(108, 'Sh/K/Lixaa', 'Wancii', 'Shifarraa Ayyaansaa Nadhaa'),
(109, 'Shawaa Lixaa', 'Abunaa Gindabarat', 'Masarat Amoosaa Waaqoo'),
(110, 'Shawaa Lixaa', 'Ada\'aa bargaa', 'Gazzahanyi Taaddasaa Makonnin'),
(111, 'Shawaa Lixaa', 'Amboo', 'Dhaabasaa Guutamaa Jabeessaa'),
(112, 'Shawaa Lixaa', 'Baakkoo Tibbee', 'Alamaayyoo Kuttaayee Birrisaa'),
(113, 'Shawaa Lixaa', 'Calliyaa', 'Baayisaa Camadaa Caalchisaa'),
(114, 'Shawaa Lixaa', 'Cobii', 'Daani\'eel Qajeelaa'),
(115, 'Shawaa Lixaa', 'Daannoo', 'Hinsarmuu Qixxaataa Raajii'),
(116, 'Shawaa Lixaa', 'Dandii', 'Rabbirraa Mul\'isaa Dinqaa'),
(117, 'Shawaa Lixaa', 'Dirree Incinni', 'Mootummaa Dhaabasaa Useen'),
(118, 'Shawaa Lixaa', 'Ejeree', 'Guutuu Deebisaa Dibaa'),
(119, 'Shawaa Lixaa', 'Ejersa Lafoo', 'Lataa Baayyee Lataa'),
(120, 'Shawaa Lixaa', 'Gindabarat', 'Xilayee Wayyumaa Kabbabaa'),
(121, 'Shawaa Lixaa', 'Ilfataa', 'Taaddaluu Goree Araarsoo'),
(122, 'Shawaa Lixaa', 'Iluu galaan', 'Dajanee Galataa Barbaadaa'),
(123, 'Shawaa Lixaa', 'Jalduu', 'Nattaanii Badhaadhaa Amanaa'),
(124, 'Shawaa Lixaa', 'Jibaat', 'Darajjee Asaffaa'),
(125, 'Shawaa Lixaa', 'Liiban Jaawwii', 'Giddiisaa Guddataa Fufaa'),
(126, 'Shawaa Lixaa', 'Meettaa Roobii', 'Dirrisaa Birruu Reebaa'),
(127, 'Shawaa Lixaa', 'Meettaa Walqixxee', 'Mitikkuu Ida\'ee Biqilaa'),
(128, 'Shawaa Lixaa', 'Midaa Qanyii', 'Namoomsaa Abdiisaa Baay\'isaa'),
(129, 'Shawaa Lixaa', 'Noonnoo', 'Kennaaa Mirreessaa Caalaa'),
(130, 'Shawaa Lixaa', 'Tokkee Kuttaye', 'Biraanuu Toleeraa Damisee'),
(131, 'Shawaa Lixaa', 'Walmaraa', 'Taarikuu Bayyanaa Beenya'),
(132, 'Shawaa Lixaa', 'B/M/Amboo', 'Milkii Toleeraa Wayyeessaa'),
(133, 'Harargee Bahaa', 'Malkaabal\'oo', 'Natna\'eel Balay Damee'),
(134, 'Harargee Bahaa', 'Gooroo Guutuu', 'Dursaa Jamal Umar'),
(135, 'Harargee Bahaa', 'Meettaa', 'Mahammad Usmaan Yuyaa'),
(136, 'Harargee Bahaa', 'Gooroo Muxii', 'Hindiyaa Abrahim Muummee'),
(137, 'Harargee Bahaa', 'Qarsa', 'Mulukaa Abibakar Umaar'),
(138, 'Harargee Bahaa', 'Mayyuu Muluqqee', 'Misbay Abrahim Adaam'),
(139, 'Harargee Bahaa', 'Gurawaa', 'Mahammad kalif Yuuyyaa'),
(140, 'Harargee Bahaa', 'Kurfaa Callee', 'Mustariyaa Aliyii Shafii'),
(141, 'Harargee Bahaa', 'Gursum', 'Hamdiyaa Abubakar Abdoosh'),
(142, 'Harargee Bahaa', 'Kombolchaa', 'Kadir Yasiin Musaa'),
(143, 'Arsii Lixaa', 'G/Hasaasa', 'Alewuya Hamiid'),
(144, 'Arsii Lixaa', 'Adaabbaa', 'Taamiruu tulluu'),
(145, 'Arsii Lixaa', 'Nansaboo', 'Geetacho Abdiisaa'),
(146, 'Arsii Lixaa', 'Kokkossaa', 'Galatoo Anshaa'),
(147, 'Arsii Lixaa', 'A/Dodolaa', 'Mariyama Dube'),
(148, 'Arsii Lixaa', 'A/Shaashamannee', 'Foziya Haji'),
(149, 'Arsii Lixaa', 'A/Kofale', 'Burtukan Ganaa'),
(150, 'Arsii Lixaa', 'M/Kofale', 'Abdisa Gudina'),
(151, 'Arsii Lixaa', 'A/N/Arsii', 'Dire Majido'),
(152, 'Arsii Lixaa', 'M/N/Arsii', 'Dibora Tamam'),
(153, 'Arsii Lixaa', 'A/Wondo', 'Lammaa Faajii'),
(154, 'Arsii Lixaa', 'M/Shaashamannee', 'Bashiir Imaam'),
(155, 'Arsii Lixaa', 'Siraaroo', 'Kadir Baqqalaa'),
(156, 'Arsii Lixaa', 'M/Dodolaa', 'Badiriyaa Barisoo'),
(157, 'Arsii Lixaa', 'H/Arsii', 'Mallasaa Dotii'),
(158, 'Arsii Lixaa', 'Qoree', 'Usmaan Tashoomaa'),
(159, 'Arsii Lixaa', 'Shaallaa', 'Abakiya Sa\'id'),
(160, 'B/Beddellee', 'A/Cooraa', 'Margaa Baayyisaa Galataa'),
(161, 'B/Beddellee', 'A/Beddellee', 'Almaaz Ayyalaa'),
(162, 'B/Beddellee', 'A/Boorrachaa', 'Buzunesh Geetuu Awaash'),
(163, 'B/Beddellee', 'A/Cawwaaqaa', 'Adam mohammad Hassanee'),
(164, 'Shawaa Bahaa', 'A/Adaamaa', 'Tafarraa Cuqqaalaa Boruu'),
(165, 'Shawaa Bahaa', 'A/Boosat', 'Baqqalaa Badhaadhaa Barruu'),
(166, 'Shawaa Bahaa', 'A/Dugdaa', 'Lammacha Bulaa Badhaasoo'),
(167, 'Shawaa Bahaa', 'A/Gumbichuu', 'Tibabuu Abarra Guutaa'),
(168, 'Shawaa Bahaa', 'A/L/Cuqqaalaa', 'Alamaayyoo Faxanaa Goshuu'),
(169, 'Shawaa Bahaa', 'A/Lumee', 'Darajjee Tamasgeen Baay\'isaa'),
(170, 'Shawaa Bahaa', 'A/Ada\'aa', 'Dhaabaa Makkonniin Tasfaye'),
(171, 'Shawaa Bahaa', 'M/Mojoo', 'Burtukan Damxoo Nagaash'),
(172, 'Shawaa Bahaa', 'M/Adaamaa', 'Caaltuu Tuggee Dheeressaa'),
(173, 'Shawaa Bahaa', 'M/Bishooftuu', 'Ababaa Abbooyyee Jimaa'),
(174, 'Shawaa Bahaa', 'M/Dukam', 'Waggaarii Baanjuree Gaaddisaa'),
(175, 'Shawaa Bahaa', 'M/Adaamaa', 'Waganee Nagaash Gabriyyee'),
(176, 'Jimmaa', 'Saqqaa Coqorsa', 'Kahitaat Mahammad'),
(177, 'Jimmaa', 'Mannaa', 'Kaliifaa Jihaad'),
(178, 'Jimmaa', 'Dedoo', 'Naziif Sulxaan'),
(179, 'Jimmaa', 'Manchoo', 'Gennee A/Jihaad'),
(180, 'Jimmaa', 'M/Jimmaa', 'Anuwaar Mahammad'),
(181, 'Jimmaa', 'Limmu Saqqaa', 'Damisee Hundeessaa'),
(182, 'Walaggaa Lixaa', 'Gulliso', 'Saamsoon Mangistuu Xannaa'),
(183, 'Walaggaa Lixaa', 'Qondala', 'Fedhesa Addino Dhibbisa'),
(184, 'Arsii', 'Amiinyaa', 'Sisaay Mogas'),
(185, 'Arsii', 'Amiinyaa', 'Balaay Taayyuu'),
(186, 'Arsii', 'Asakoo', 'Sulayman Elamoo Boruu'),
(187, 'Arsii', 'Asakoo', 'Aliyyii Hamdaa'),
(188, 'Arsii', 'Asallaa', 'Marshuu Geetachoo Baqqalaa'),
(189, 'Arsii', 'Asallaa', 'Miliyoon'),
(190, 'Arsii', 'B/G', 'Wiliiyaam Lammaa Gamadaa'),
(191, 'Arsii', 'B/G', 'Naggassa Fiqaaduu'),
(192, 'Arsii', 'Boqojjii', 'Darajja Tankoluu'),
(193, 'Arsii', 'Collee', 'Fireehiwoot Tamiru'),
(194, 'Arsii', 'Collee', 'Maa\'irag Buzaayahu Argaaw'),
(195, 'Arsii', 'D/X', 'Caaltuu Adunyaa'),
(196, 'Arsii', 'Dheeraa', 'Abdissaa Shambal'),
(197, 'Arsii', 'Diksiis', 'Siraaj Muhammad'),
(198, 'Arsii', 'Doddotaa', 'Fayyoo Amaan'),
(199, 'Arsii', 'Gololchaa', 'Jamaal Badhaasoo'),
(200, 'Arsii', 'Gunaa', 'Leencoo Mohammad'),
(201, 'Arsii', 'Gunaa', 'Mishaa Abdallaa'),
(202, 'Arsii', 'H/W', 'Habeebee Turaa'),
(203, 'Arsii', 'Heexosaa', 'Damme Alamaayahu'),
(204, 'Arsii', 'Hurutaa', 'Limaat getuu'),
(205, 'Arsii', 'Jajuu', 'Mu\'az Huseeynaa'),
(206, 'Arsii', 'Jajuu', 'Izaddiin Abaadir'),
(207, 'Arsii', 'L/B', 'Abbabba Girma'),
(208, 'Arsii', 'L/B', 'Daddafoo Hirphoo'),
(209, 'Arsii', 'L/H', 'Abiyoot Taliilaa'),
(210, 'Arsii', 'L/H', 'Gabii Roobaa'),
(211, 'Arsii', 'Martii', 'Musxaafa Siraaj Maammoo'),
(212, 'Arsii', 'Martii', 'Amiinaa Jamaal'),
(213, 'Arsii', 'Muunessaa', 'Wanjjii Galgaloo'),
(214, 'Arsii', 'Muunessaa', 'Kadiir Shaanii'),
(215, 'Arsii', 'Roobee', 'Milkeessaa Taadassa'),
(216, 'Arsii', 'Roobee', 'Usmaan Umar'),
(217, 'Arsii', 'Seeruu', 'Asnakech Bekele'),
(218, 'Arsii', 'Sh/K', 'Biqilaa Nasha'),
(219, 'Arsii', 'Siree', 'Darajja Taamiruu'),
(220, 'Arsii', 'Siree', 'Jamaanash Abbaaynah'),
(221, 'Arsii', 'Sirkaa', 'Mussaa Aloo'),
(222, 'Arsii', 'Suudee', 'Jibriil Hammuu'),
(223, 'Arsii', 'Xichoo', 'Mahammad Bashiir'),
(224, 'Arsii', 'Xiyoo', 'Katamaa Gabbiisaa'),
(225, 'Arsii', 'Z/D', 'Sadaat Hussein'),
(226, 'Arsii', 'Z/D', 'Amaanee Jamaal');

-- --------------------------------------------------------

--
-- Table structure for table `zone1s`
--

CREATE TABLE `zone1s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `org_name` varchar(100) DEFAULT NULL,
  `org_type` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=5461 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone2s`
--

CREATE TABLE `zone2s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone3s`
--

CREATE TABLE `zone3s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone4s`
--

CREATE TABLE `zone4s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone5s`
--

CREATE TABLE `zone5s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone6s`
--

CREATE TABLE `zone6s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone7s`
--

CREATE TABLE `zone7s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone8s`
--

CREATE TABLE `zone8s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone9s`
--

CREATE TABLE `zone9s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone10s`
--

CREATE TABLE `zone10s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone11s`
--

CREATE TABLE `zone11s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone12s`
--

CREATE TABLE `zone12s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone13s`
--

CREATE TABLE `zone13s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB AVG_ROW_LENGTH=16384 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone14s`
--

CREATE TABLE `zone14s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone15s`
--

CREATE TABLE `zone15s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone16s`
--

CREATE TABLE `zone16s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone17s`
--

CREATE TABLE `zone17s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone18s`
--

CREATE TABLE `zone18s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone19s`
--

CREATE TABLE `zone19s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone20s`
--

CREATE TABLE `zone20s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `zone21s`
--

CREATE TABLE `zone21s` (
  `id` int(10) UNSIGNED NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `contact_number` varchar(255) DEFAULT NULL,
  `woreda` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `membership_type` varchar(255) DEFAULT NULL,
  `membership_fee` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joined_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_log_log_name_index` (`log_name`(191)),
  ADD KEY `causer` (`causer_type`(191),`causer_id`),
  ADD KEY `subject` (`subject_type`(191),`subject_id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `branch_name` (`branch_id`);

--
-- Indexes for table `directorates`
--
ALTER TABLE `directorates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `departments_head_id_foreign` (`head_id`),
  ADD KEY `manager_id` (`manager_id`) USING BTREE,
  ADD KEY `directorates_branch_id_foreign` (`branch_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_types`
--
ALTER TABLE `document_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `document_types_slug_unique` (`slug`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_job_title` (`job_title`),
  ADD KEY `idx_gender` (`gender`),
  ADD KEY `idx_hire_date` (`hire_date`),
  ADD KEY `idx_email` (`email`),
  ADD KEY `department` (`department_id`),
  ADD KEY `branch_ID` (`branch_id`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_documents_employee_id_foreign` (`employeeid`),
  ADD KEY `employee_documents_document_type_id_foreign` (`document_type_id`),
  ADD KEY `employee_documents_employee_id_document_type_id_index` (`employeeid`,`document_type_id`),
  ADD KEY `employee_documents_expiry_date_index` (`expiry_date`),
  ADD KEY `employee_documents_is_active_index` (`is_active`);

--
-- Indexes for table `employee_experiences`
--
ALTER TABLE `employee_experiences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_employee_experiences_employee_id` (`employee_id`),
  ADD KEY `idx_experience_type` (`experience_type`),
  ADD KEY `idx_is_current` (`is_current`),
  ADD KEY `idx_display_order` (`display_order`),
  ADD KEY `idx_from_date` (`from_date`),
  ADD KEY `idx_to_date` (`to_date`);

--
-- Indexes for table `jigjiga`
--
ALTER TABLE `jigjiga`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_job_title` (`job_title`),
  ADD KEY `idx_gender` (`gender`),
  ADD KEY `idx_hire_date` (`hire_date`),
  ADD KEY `idx_email` (`email`);

--
-- Indexes for table `maintainance_texts`
--
ALTER TABLE `maintainance_texts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `managers`
--
ALTER TABLE `managers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=182;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `directorates`
--
ALTER TABLE `directorates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `document_types`
--
ALTER TABLE `document_types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=576;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `employee_experiences`
--
ALTER TABLE `employee_experiences`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `jigjiga`
--
ALTER TABLE `jigjiga`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `maintainance_texts`
--
ALTER TABLE `maintainance_texts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `managers`
--
ALTER TABLE `managers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `directorates`
--
ALTER TABLE `directorates`
  ADD CONSTRAINT `directorates_branch_id_foreign` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `manager_id` FOREIGN KEY (`manager_id`) REFERENCES `managers` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `branch_ID` FOREIGN KEY (`branch_id`) REFERENCES `branches` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `department` FOREIGN KEY (`department_id`) REFERENCES `directorates` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD CONSTRAINT `employee_documents_document_type_id_foreign` FOREIGN KEY (`document_type_id`) REFERENCES `document_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `employee_documents_employee_id_foreign` FOREIGN KEY (`employeeid`) REFERENCES `employees` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `employee_experiences`
--
ALTER TABLE `employee_experiences`
  ADD CONSTRAINT `fk_employee_experiences_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
