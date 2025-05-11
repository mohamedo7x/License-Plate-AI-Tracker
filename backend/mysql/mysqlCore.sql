-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 11, 2025 at 11:26 AM
-- Server version: 9.3.0
-- PHP Version: 8.2.28
-- New mysql client version O7X Created
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `traffic_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `img_profile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT (now()),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`id`, `name`, `email`, `password_hash`, `role`, `status`, `img_profile`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'Oliver Weston', 'mohamedo7x@hotmail.com', '$2b$10$4fRXoIfJ43mmnuqullqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'superadmin', 'active', 'default.png', '2025-05-10 15:56:06', '2023-04-18 15:05:43', '2025-04-06 02:31:14'),
(2, 'Emily Johnson', 'emily.johnson@example.com', '$2b$10$3cRXpIfJ42mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'admin', 'active', 'default.png', '2025-04-07 04:15:20', '2023-05-01 10:05:43', '2025-04-07 03:31:14'),
(3, 'Liam Smith', 'liam.smith@example.com', '$2b$10$5dRXqIfJ41mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'admin', 'inactive', 'default.png', '2025-04-06 02:11:34', '2023-05-12 14:05:43', '2025-04-06 03:31:14'),
(4, 'Sophia Brown', 'sophia.brown@example.com', '$2b$10$6eRXrIfJ40mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'editor', 'active', 'default.png', '2025-04-05 12:08:06', '2023-06-20 18:05:43', '2025-04-06 04:31:14'),
(5, 'Noah Davis', 'noah.davis@example.com', '$2b$10$7fRXsIfJ39mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'editor', 'active', 'default.png', '2025-04-04 09:15:06', '2023-07-15 08:05:43', '2025-04-06 05:31:14'),
(6, 'Isabella Martinez', 'isabella.martinez@example.com', '$2b$10$8gRXtIfJ38mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'admin', 'inactive', 'default.png', '2025-04-03 03:22:06', '2023-08-18 12:05:43', '2025-04-06 06:31:14'),
(7, 'James Wilson', 'james.wilson@example.com', '$2b$10$9hRXuIfJ37mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'admin', 'active', 'default.png', '2025-04-02 02:33:06', '2023-09-10 11:05:43', '2025-04-06 07:31:14'),
(8, 'Mia Lee', 'mia.lee@example.com', '$2b$10$0iRXvIfJ36mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'editor', 'active', 'default.png', '2025-04-01 01:08:06', '2023-10-22 09:05:43', '2025-04-06 08:31:14'),
(9, 'William Walker', 'william.walker@example.com', '$2b$10$1jRXwIfJ35mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'superadmin', 'active', 'default.png', '2025-03-31 08:08:06', '2023-11-03 06:05:43', '2025-04-06 09:31:14'),
(10, 'Ava Harris', 'ava.harris@example.com', '$2b$10$2kRXxIfJ34mmnuqwllqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'editor', 'inactive', 'default.png', '2025-03-30 05:08:06', '2023-12-15 04:05:43', '2025-04-06 10:31:14');

-- --------------------------------------------------------

--
-- Table structure for table `AuditLogs`
--

CREATE TABLE `AuditLogs` (
  `id` int NOT NULL,
  `timestamp` timestamp NULL DEFAULT (now()),
  `level` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `message` text NOT NULL,
  `meta` json NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `AuditLogs`
--

INSERT INTO `AuditLogs` (`id`, `timestamp`, `level`, `message`, `meta`, `created_at`) VALUES
(1, '2025-05-11 11:20:39', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/1\", \"method\": \"PUT\", \"status\": 400, \"timestamp\": \"2025-05-11 14:20:39:2039\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"55ms\", \"requestParams\": {\"id\": \"1\"}}', '2025-05-11 11:20:39'),
(2, '2025-05-11 11:21:23', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/1\", \"method\": \"PUT\", \"status\": 400, \"timestamp\": \"2025-05-11 14:21:23:2123\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"requestBody\": {\"status\": \"xxx\"}, \"responseTime\": \"14ms\", \"requestParams\": {\"id\": \"1\"}}', '2025-05-11 11:21:23'),
(3, '2025-05-11 11:21:51', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/1\", \"method\": \"PUT\", \"status\": 200, \"timestamp\": \"2025-05-11 14:21:51:2151\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"requestBody\": {\"status\": \"complete\"}, \"responseTime\": \"30ms\", \"requestParams\": {\"id\": \"1\"}}', '2025-05-11 11:21:51'),
(4, '2025-05-11 11:22:07', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/1\", \"method\": \"PUT\", \"status\": 200, \"timestamp\": \"2025-05-11 14:22:07:227\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"requestBody\": {\"status\": \"processing\"}, \"responseTime\": \"27ms\", \"requestParams\": {\"id\": \"1\"}}', '2025-05-11 11:22:07');

-- --------------------------------------------------------

--
-- Table structure for table `police_reports`
--

CREATE TABLE `police_reports` (
  `id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `type` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` enum('complete','close','processing') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'processing',
  `police_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `police_reports`
--

INSERT INTO `police_reports` (`id`, `title`, `date`, `type`, `description`, `status`, `police_id`) VALUES
(1, 'تحليل حركة المرور في المنطقة التجارية', '2025-05-11 11:19:42', 'تقرير مروري', 'تحليل لحركة المرور في المنطقة التجارية خلال ساعات الذروة، مع رصد لأكثر التقاطعات ازدحاماً وتوصيات لتحسين تدفق المركبات وتقليل الاختناقات.', 'processing', 1);

-- --------------------------------------------------------

--
-- Table structure for table `police_users`
--

CREATE TABLE `police_users` (
  `id` int NOT NULL,
  `military_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rank` varchar(50) NOT NULL,
  `department` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `username` varchar(100) NOT NULL,
  `online` tinyint(1) NOT NULL DEFAULT '0',
  `password_hash` varchar(255) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `img_profile` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `police_users`
--

INSERT INTO `police_users` (`id`, `military_id`, `name`, `rank`, `department`, `city`, `last_login`, `active`, `username`, `online`, `password_hash`, `phone_number`, `img_profile`, `created_at`, `updated_at`) VALUES
(1, 'MIL654321', 'Abdullah Al-Ghamdi', 'First Lieutenant', 'Jeddah Traffic Department', 'Zagazig', '2025-05-11 13:28:51', 1, 'medo', 0, '$2b$10$BD7UTDr7QuhNmQkvoDdER.Ar1MNXR2Rt7EtxDl5EWvyCjSrzkiyEG', '0569876543', 'ac9c37a5e457387f45c7.png', '2025-04-07 01:51:25', '2025-05-11 10:28:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `AuditLogs`
--
ALTER TABLE `AuditLogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `police_reports`
--
ALTER TABLE `police_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `police_id` (`police_id`);

--
-- Indexes for table `police_users`
--
ALTER TABLE `police_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `military_id` (`military_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `AuditLogs`
--
ALTER TABLE `AuditLogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `police_reports`
--
ALTER TABLE `police_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `police_users`
--
ALTER TABLE `police_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `police_reports`
--
ALTER TABLE `police_reports`
  ADD CONSTRAINT `police_reports_ibfk_1` FOREIGN KEY (`police_id`) REFERENCES `police_users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
