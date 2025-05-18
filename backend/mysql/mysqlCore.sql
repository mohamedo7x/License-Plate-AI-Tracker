-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 18, 2025 at 10:15 PM
-- Server version: 9.3.0
-- PHP Version: 8.2.28

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
(1, 'Oliver Weston', 'mohamedo7x@hotmail.com', '$2b$10$4fRXoIfJ43mmnuqullqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'superadmin', 'active', 'default.png', '2025-05-18 14:42:33', '2023-04-18 15:05:43', '2025-04-06 02:31:14'),
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
(1, '2025-05-18 21:38:35', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 00:38:35:3835\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"54ms\"}', '2025-05-18 21:38:35'),
(2, '2025-05-18 21:38:47', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/1c00923a11e44\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 00:38:47:3847\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"29ms\", \"requestParams\": {\"id\": \"1c00923a11e44\"}}', '2025-05-18 21:38:47'),
(3, '2025-05-18 21:39:05', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/ec2e9eef2c1f4b\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 00:39:05:395\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"20ms\", \"requestParams\": {\"id\": \"ec2e9eef2c1f4b\"}}', '2025-05-18 21:39:05'),
(4, '2025-05-18 21:40:34', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/reports/types/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 00:40:34:4034\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"59ms\"}', '2025-05-18 21:40:34'),
(5, '2025-05-18 21:47:48', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-19 00:47:48:4748\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"requestBody\": {\"name\": \"\"}, \"responseTime\": \"116ms\"}', '2025-05-18 21:47:48'),
(6, '2025-05-18 21:50:01', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/reports\", \"stack\": \"ValidationError: Name of reprots is required, Name of reports must be between 5 and 50 characters, Point of reprots is required, Point of reports must be an integer, Point of reports must be between 1 and 10\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"POST\", \"userId\": null, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-19 00:50:01:501\", \"statusCode\": 400, \"requestBody\": {\"name\": \"\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-18 21:50:01'),
(7, '2025-05-18 21:50:01', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/reports\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-19 00:50:01:501\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"requestBody\": {\"name\": \"\"}, \"responseTime\": \"181ms\"}', '2025-05-18 21:50:01'),
(8, '2025-05-18 21:53:33', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/types\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 00:53:33:5333\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"63ms\"}', '2025-05-18 21:53:33'),
(9, '2025-05-18 22:01:31', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 01:01:31:131\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"63ms\"}', '2025-05-18 22:01:31'),
(10, '2025-05-18 22:13:48', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 01:13:48:1348\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"64ms\"}', '2025-05-18 22:13:48'),
(11, '2025-05-18 22:14:22', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 01:14:22:1422\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"64ms\"}', '2025-05-18 22:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `police_reports`
--

CREATE TABLE `police_reports` (
  `id` int NOT NULL,
  `police_id` int NOT NULL,
  `report_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `police_reports`
--

INSERT INTO `police_reports` (`id`, `police_id`, `report_id`) VALUES
(1, 1, 'ec2e9eef2c1f4bf9a1950d64947a30ec'),
(2, 1, '770cf126b2914a5889045152499dbf9d'),
(3, 2, '1c00923a11e44a6cb77f375105890f6f');

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
(1, 'MIL654321', 'Abdullah Al-Ghamdi', 'First Lieutenant', 'Jeddah Traffic Department', 'Zagazig', '2025-05-18 23:54:33', 1, 'medo', 0, '$2b$10$BD7UTDr7QuhNmQkvoDdER.Ar1MNXR2Rt7EtxDl5EWvyCjSrzkiyEG', '0569876543', 'ac9c37a5e457387f45c7.png', '2025-04-07 01:51:25', '2025-05-18 20:54:32'),
(2, 'MIL654300', 'Mohamed Dama Fc', 'Second Lieutenant', 'Giza Traffic Department', 'cairo', '2025-05-19 00:05:19', 1, 'mohamedo7x', 0, '$2b$10$doIVrgYqd6WSnXNnCS5c9O30gcD1RXH9IF.6dCHwTRVo0jGKUS4cm', '0569876543', '242a262657ef48b751d9.jpg', '2025-05-18 21:03:37', '2025-05-18 21:05:18');

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int NOT NULL,
  `description` text NOT NULL,
  `status` enum('close','complete','processing') NOT NULL DEFAULT 'processing',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reports`
--

INSERT INTO `reports` (`id`, `title`, `type`, `description`, `status`, `date`) VALUES
('1c00923a11e44a6cb77f375105890f6f', 'تقرير تصادم مركبات', 4, 'تقرير حول حادث تصادم بين مركبتين في شارع الملك فهد، يتضمن التفاصيل الأولية عن الأضرار والإصابات والإجراءات المتخذة من قبل الجهات المعنية.', 'processing', '2025-05-18 21:06:47'),
('770cf126b2914a5889045152499dbf9d', 'تحليل حركة المرور في المنطقة التجارية', 1, 'تحليل لحركة المرور في المنطقة التجارية خلال ساعات الذروة، مع رصد لأكثر التقاطعات ازدحاماً وتوصيات لتحسين تدفق المركبات وتقليل الاختناقات.', 'processing', '2024-01-22 14:18:36'),
('ec2e9eef2c1f4bf9a1950d64947a30ec', 'تحليل حركة المرور في المنطقة التجارية', 10, 'تحليل لحركة المرور في المنطقة التجارية خلال ساعات الذروة، مع رصد لأكثر التقاطعات ازدحاماً وتوصيات لتحسين تدفق المركبات وتقليل الاختناقات.', 'processing', '2015-02-11 07:53:55');

-- --------------------------------------------------------

--
-- Table structure for table `report_type`
--

CREATE TABLE `report_type` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `point` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `report_type`
--

INSERT INTO `report_type` (`id`, `name`, `point`) VALUES
(1, 'تقرير حادث مروري', 10),
(2, 'تقرير إشارة حمراء', 8),
(3, 'تقرير وقوف غير نظامي', 3),
(4, 'تقرير تصادم مركبات', 9),
(5, 'تقرير عدم ارتداء حزام الأمان', 4),
(6, 'تقرير قيادة متهورة', 7),
(7, 'تقرير القيادة تحت التأثير', 10),
(8, 'تقرير انتهاء صلاحية الرخصة', 5),
(9, 'تقرير انعطاف غير قانوني', 6),
(10, 'تقرير عدم وجود تأمين', 7);

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
  ADD KEY `police_id` (`police_id`),
  ADD KEY `report_id` (`report_id`);

--
-- Indexes for table `police_users`
--
ALTER TABLE `police_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `military_id` (`military_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `police_reports`
--
ALTER TABLE `police_reports`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `police_users`
--
ALTER TABLE `police_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `report_type`
--
ALTER TABLE `report_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `police_reports`
--
ALTER TABLE `police_reports`
  ADD CONSTRAINT `police_reports_ibfk_1` FOREIGN KEY (`police_id`) REFERENCES `police_users` (`id`),
  ADD CONSTRAINT `police_reports_ibfk_2` FOREIGN KEY (`report_id`) REFERENCES `reports` (`id`);

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`type`) REFERENCES `report_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
