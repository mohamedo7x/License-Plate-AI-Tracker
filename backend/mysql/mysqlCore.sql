-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 25, 2025 at 02:19 AM
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
(1, 'Oliver Weston', 'mohamedo7x@hotmail.com', '$2b$10$4fRXoIfJ43mmnuqullqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'superadmin', 'active', 'default.png', '2025-05-23 18:07:57', '2023-04-18 15:05:43', '2025-04-06 02:31:14');

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
(1, '2025-05-24 19:29:20', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/urgent\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:346:12)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:280:10)\\n    at Function.handle (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:175:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-24 22:29:20:2920\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-24 19:29:20'),
(2, '2025-05-24 19:29:20', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/urgent\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-24 22:29:20:2920\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"75ms\"}', '2025-05-24 19:29:20'),
(3, '2025-05-24 19:29:33', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/generate-otp\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-24 22:29:33:2933\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"phone_number\": \"0569876543\"}, \"responseTime\": \"200ms\"}', '2025-05-24 19:29:33'),
(4, '2025-05-24 19:29:44', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-24 22:29:44:2944\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"sms_otp\": \"0023\", \"password\": \"123123\", \"username\": \"mohamedo7x\", \"phone_number\": \"0569876543\"}, \"responseTime\": \"199ms\"}', '2025-05-24 19:29:44'),
(5, '2025-05-24 19:29:49', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/urgent\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-24 22:29:49:2949\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"18ms\"}', '2025-05-24 19:29:49'),
(6, '2025-05-24 20:39:54', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/urgent\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-24 23:39:53:3953\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"66ms\"}', '2025-05-24 20:39:54'),
(7, '2025-05-24 20:42:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/urgent\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-24 23:42:03:423\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"57ms\"}', '2025-05-24 20:42:03'),
(8, '2025-05-24 20:49:26', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/urgent\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-24 23:49:26:4926\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"69ms\"}', '2025-05-24 20:49:26'),
(9, '2025-05-24 21:00:36', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/urgent\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 00:00:36:036\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"104ms\"}', '2025-05-24 21:00:36'),
(10, '2025-05-25 00:35:41', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/activites\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:346:12)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:280:10)\\n    at Function.handle (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:175:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-25 03:35:41:3541\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-25 00:35:41'),
(11, '2025-05-25 00:35:41', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/activites\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-25 03:35:41:3541\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"72ms\"}', '2025-05-25 00:35:41'),
(12, '2025-05-25 00:35:51', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/generate-otp\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-25 03:35:51:3551\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"phone_number\": \"0569876543\"}, \"responseTime\": \"124ms\"}', '2025-05-25 00:35:51'),
(13, '2025-05-25 00:36:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-25 03:36:03:363\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"sms_otp\": \"3100\", \"password\": \"123123\", \"username\": \"mohamedo7x\", \"phone_number\": \"0569876543\"}, \"responseTime\": \"445ms\"}', '2025-05-25 00:36:03'),
(14, '2025-05-25 00:46:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 03:46:28:4628\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"6082ms\"}', '2025-05-25 00:46:28'),
(15, '2025-05-25 00:54:06', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 03:54:06:546\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"53ms\"}', '2025-05-25 00:54:06'),
(16, '2025-05-25 02:07:06', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:07:06:76\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"93ms\"}', '2025-05-25 02:07:06'),
(17, '2025-05-25 02:08:14', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:08:14:814\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"60ms\"}', '2025-05-25 02:08:14'),
(18, '2025-05-25 02:09:04', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:09:04:94\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"58ms\"}', '2025-05-25 02:09:04'),
(19, '2025-05-25 02:10:43', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:10:43:1043\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"54ms\"}', '2025-05-25 02:10:43'),
(20, '2025-05-25 02:11:05', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/activites\", \"stack\": \"TypeError: Cannot read properties of undefined (reading \'name\')\\n    at generateActivitesCard (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\utils\\\\response.ts:86:26)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.controller.ts:264:39\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"TypeError\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-25 05:11:05:115\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-25 02:11:05'),
(21, '2025-05-25 02:11:05', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/activites\", \"method\": \"GET\", \"status\": 500, \"timestamp\": \"2025-05-25 05:11:05:115\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"61ms\"}', '2025-05-25 02:11:05'),
(22, '2025-05-25 02:12:30', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/activites\", \"stack\": \"TypeError: Cannot read properties of undefined (reading \'name\')\\n    at generateActivitesCard (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\utils\\\\response.ts:86:26)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.controller.ts:264:39\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"TypeError\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-25 05:12:30:1230\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-25 02:12:30'),
(23, '2025-05-25 02:12:30', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/activites\", \"method\": \"GET\", \"status\": 500, \"timestamp\": \"2025-05-25 05:12:30:1230\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"95ms\"}', '2025-05-25 02:12:30'),
(24, '2025-05-25 02:13:29', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/activites\", \"stack\": \"TypeError: Cannot read properties of undefined (reading \'name\')\\n    at generateActivitesCard (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\utils\\\\response.ts:86:26)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.controller.ts:264:39\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"TypeError\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-25 05:13:29:1329\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-25 02:13:29'),
(25, '2025-05-25 02:13:29', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/activites\", \"method\": \"GET\", \"status\": 500, \"timestamp\": \"2025-05-25 05:13:29:1329\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"96ms\"}', '2025-05-25 02:13:29'),
(26, '2025-05-25 02:14:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:14:52:1452\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"48ms\"}', '2025-05-25 02:14:52'),
(27, '2025-05-25 02:15:55', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:15:55:1555\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"47ms\"}', '2025-05-25 02:15:55'),
(28, '2025-05-25 02:18:29', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/activites\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:18:29:1829\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"54ms\"}', '2025-05-25 02:18:29'),
(29, '2025-05-25 02:18:34', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/urgent\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-25 05:18:34:1834\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"20ms\"}', '2025-05-25 02:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `driver_license`
--

CREATE TABLE `driver_license` (
  `number` varchar(50) NOT NULL,
  `driver_id` varchar(14) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `education` varchar(100) DEFAULT NULL,
  `nationality` varchar(50) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `traffic_department` varchar(100) DEFAULT NULL,
  `traffic_office` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `driver_license`
--

INSERT INTO `driver_license` (`number`, `driver_id`, `type`, `education`, `nationality`, `issue_date`, `expiry_date`, `traffic_department`, `traffic_office`) VALUES
('BF35WOKTLA', '29905112578938', 'A', 'ثانوية عامة', 'عراقي', '2020-04-12', '2025-04-12', 'مرور أسيوط', 'مكتب الوليدية'),
('EP61ZGQXMC', '29503212568912', 'B', 'دبلوم', 'فلسطيني', '2018-11-30', '2023-11-30', 'مرور طنطا', 'مرور طنطا'),
('GV52AXJLKT', '29808072548691', 'A', 'بكالوريوس', 'سعودي', '2021-12-18', '2026-12-18', 'مرور 6 أكتوبر', 'مكتب الحصري'),
('HY60NEPQWR', '29909012258931', 'T', 'دبلوم', 'يمني', '2016-08-05', '2021-08-05', 'مرور قنا', 'مكتب وسط البلد'),
('KR29DHJVLE', '29802142563984', 'C', 'دكتوراه', 'لبناني', '2022-01-10', '2027-01-10', 'مرور المنصورة', 'مكتب الجامعة'),
('MU47CEXYQN', '30010162547893', 'B', 'بكالوريوس', 'أردني', '2017-07-19', '2022-07-19', 'مرور بني سويف', 'مكتب شرق النيل'),
('QN72VCEKJD', '29707182759612', 'E', 'ثانوية عامة', 'سوري', '2019-03-21', '2024-03-21', 'مرور الجيزة', 'مكتب فيصل'),
('WD84RTYUIO', '30106052398174', 'B', 'ماجستير', 'مصري', '2021-09-01', '2026-09-01', 'مرور الإسكندرية', 'مكتب سموحة'),
('XA93LMBTZQ', '29905122578934', 'B', 'بكالوريوس', 'أردني', '2020-06-15', '2025-06-15', 'مرور القاهرة', 'مكتب عبود'),
('ZT18MRLVCB', '29611282579365', 'E', 'ماجستير', 'سوداني', '2023-02-28', '2028-02-28', 'مرور الزقازيق', 'مكتب أول الزقازيق');

-- --------------------------------------------------------

--
-- Table structure for table `inspected_vehicles`
--

CREATE TABLE `inspected_vehicles` (
  `id` int NOT NULL,
  `plate` varchar(10) DEFAULT NULL,
  `police_id` int DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `license_types`
--

CREATE TABLE `license_types` (
  `code` char(1) NOT NULL,
  `type_name` varchar(100) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `license_types`
--

INSERT INTO `license_types` (`code`, `type_name`, `description`) VALUES
('A', 'دراجة نارية', 'مخصصة للموتوسيكلات والسكوتر'),
('B', 'درجة ثالثة (ملاكي)', 'مخصصة للسيارات الخاصة فقط'),
('C', 'درجة ثانية', 'للأجرة والنقل الخفيف'),
('D', 'درجة أولى', 'للشاحنات الثقيلة والأتوبيسات'),
('E', 'مهنية', 'مزاولة مهنة القيادة'),
('T', 'تحت التدريب', 'رخصة مؤقتة لتعلم القيادة');

-- --------------------------------------------------------

--
-- Table structure for table `notification_police`
--

CREATE TABLE `notification_police` (
  `id` int NOT NULL,
  `type` varchar(100) DEFAULT NULL,
  `police_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `notification_police`
--

INSERT INTO `notification_police` (`id`, `type`, `police_id`, `created_at`) VALUES
(1, 'password change', 2, '2025-05-24 14:28:52'),
(2, 'report', 2, '2025-05-24 15:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `national_id` varchar(14) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `gender` enum('ذكر','انثى') DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `social_status` enum('عازب','مطلق','متزوج','ارملة') DEFAULT NULL,
  `religion` varchar(40) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `issue_date` date DEFAULT NULL,
  `expired_date` date DEFAULT NULL,
  `criminal_status` tinyint(1) DEFAULT '0',
  `changed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`national_id`, `full_name`, `gender`, `date_of_birth`, `social_status`, `religion`, `address`, `issue_date`, `expired_date`, `criminal_status`, `changed`) VALUES
('29503212568912', 'بسمة مجدي عوض عبدالله', 'انثى', '1986-04-05', 'عازب', 'مسلم', '٢٢ شارع مصطفى النحاس، مدينة نصر، القاهرة', '2011-06-25', '2021-06-25', 1, '2025-05-24 19:23:04'),
('29611282579365', 'علي عبدالفتاح حسين عبدالعزيز', 'ذكر', '1972-11-28', 'ارملة', 'مسيحي', '٤٤ شارع النزهة، مصر الجديدة، القاهرة', '1995-01-01', '2005-01-01', 1, '2025-05-24 19:22:50'),
('29707182759612', 'سارة فتحي عبدالله سالم', 'انثى', '1993-12-12', 'ارملة', 'بدون', '١١ شارع رمسيس، وسط البلد، القاهرة', '2017-09-10', '2027-09-10', 0, '2025-05-24 19:22:50'),
('29802142563984', 'فاطمة عبدالحليم زكريا عوض', 'انثى', '1990-08-22', 'عازب', 'مسلم', '٢٥ شارع النيل، المعادي، القاهرة', '2015-05-01', '2025-05-01', 0, '2025-05-24 19:22:50'),
('29808072548691', 'خالد حسن الزهار سالم', 'ذكر', '1980-08-07', 'متزوج', 'يهودي', '٦٥ شارع الهرم، العمرانية، الجيزة', '2010-01-01', '2020-01-01', 0, '2025-05-24 19:22:50'),
('29905112578938', 'سعيد عثمان سليمان زكريا', 'ذكر', '1975-02-28', 'مطلق', 'بدون', '٣٧ شارع القصر العيني، وسط البلد، القاهرة', '2003-03-15', '2013-03-15', 1, '2025-05-24 19:22:50'),
('29905122578934', 'أحمد عبدالحليم سالم الزهار', 'ذكر', '1985-03-15', 'متزوج', 'مسلم', '١٠ شارع التحرير، الدقي، الجيزة', '2010-04-10', '2020-04-10', 0, '2025-05-24 19:22:50'),
('29909012258931', 'مصطفى فاروق عبدالعزيز عوض', 'ذكر', '1988-06-18', 'متزوج', 'مسلم', '٥٧ شارع الملك فيصل، الهرم، الجيزة', '2012-03-15', '2022-03-15', 0, '2025-05-24 19:22:50'),
('30010162547893', 'محمد سامي حسين عبدالرحمن', 'ذكر', '1978-01-01', 'مطلق', 'مسيحي', '٣٣ شارع سوريا، المهندسين، الجيزة', '2005-07-20', '2015-07-20', 1, '2025-05-24 19:22:50'),
('30106052398174', 'إيمان نبيل سليمان الزهار', 'انثى', '1981-10-30', 'مطلق', 'مسلم', '١٨ شارع الطيران، مدينة نصر، القاهرة', '2009-11-01', '2019-11-01', 0, '2025-05-24 19:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `police_reports`
--

CREATE TABLE `police_reports` (
  `id` int NOT NULL,
  `police_id` int NOT NULL,
  `report_id` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `police_reports`
--

INSERT INTO `police_reports` (`id`, `police_id`, `report_id`, `created_at`) VALUES
(1, 1, 'ec2e9eef2c1f4bf9a1950d64947a30ec', '2025-05-24 16:39:25'),
(2, 1, '770cf126b2914a5889045152499dbf9d', '2025-05-24 16:39:25'),
(3, 2, '1c00923a11e44a6cb77f375105890f6f', '2025-05-24 16:39:25');

-- --------------------------------------------------------

--
-- Table structure for table `police_users`
--

CREATE TABLE `police_users` (
  `id` int NOT NULL,
  `military_id` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `rank_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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

INSERT INTO `police_users` (`id`, `military_id`, `name`, `rank_id`, `department`, `city`, `last_login`, `active`, `username`, `online`, `password_hash`, `phone_number`, `img_profile`, `created_at`, `updated_at`) VALUES
(1, 'MIL654321', 'Abdullah Al-Ghamdi', 'First Lieutenant', 'Jeddah Traffic Department', 'Zagazig', '2025-05-18 23:54:33', 1, 'medo', 0, '$2b$10$BD7UTDr7QuhNmQkvoDdER.Ar1MNXR2Rt7EtxDl5EWvyCjSrzkiyEG', '0569876541', 'ac9c37a5e457387f45c7.png', '2025-04-07 01:51:25', '2025-05-23 14:18:54'),
(2, 'MIL654300', 'أحمد سامي عبد الرحمن', 'نقيب', 'إدارة مرور الإسكندرية', 'الإسكندرية', '2025-05-25 03:36:04', 1, 'mohamedo7x', 1, '$2b$10$4njLSXLZD47kn6LOBubIKuodxQ1ls1MQ3cOKtkMgRPkTapByGrHWG', '0569876543', '242a262657ef48b751d9.jpg', '2025-05-18 21:03:37', '2025-05-25 00:36:03');

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
('1c00923a11e44a6cb77f375105890f6f', 'تقرير تصادم مركبات', 4, 'تقرير حول حادث تصادم بين مركبتين في شارع الملك فهد، يتضمن التفاصيل الأولية عن الأضرار والإصابات والإجراءات المتخذة من قبل الجهات المعنية.', 'complete', '2025-05-18 21:06:47'),
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

-- --------------------------------------------------------

--
-- Table structure for table `sms_otp`
--

CREATE TABLE `sms_otp` (
  `otp` varchar(4) DEFAULT NULL,
  `police_id` int DEFAULT NULL,
  `type` enum('login','password') NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `plate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `chassis_number` varchar(30) DEFAULT NULL,
  `engine_number` varchar(20) DEFAULT NULL,
  `glass_type` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `classification` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `model` year NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`plate`, `brand`, `name`, `type`, `chassis_number`, `engine_number`, `glass_type`, `classification`, `model`) VALUES
('CA02BNM', 'فيات', 'فيات دوكاتو فان', 'فان', 'ZFA26300006123456', 'ENG4455667788', 'زجاج أكريليك', 'مركبة', '2003'),
('CA04PLK', 'بيجو', 'بيجو 3008', 'دفع رباعي', 'VF3XHNPZZFE012345', 'ENG7788990011', 'زجاج مصفح', 'مركبة', '2020'),
('CA05LKO', 'دوكاتي', 'دوكاتي مونستر', 'دراجة نارية', 'ZDM1RB5T9DB012345', 'ENG2233557799', 'زجاج مقسى', 'دراجة نارية', '2019'),
('CA06YUI', 'إيسوزو', 'إيسوزو NPR', 'شاحنة نقل', 'JAANLT149E7101234', 'ENG6644221100', 'زجاج أكريليك', 'شاحنة نقل', '2025'),
('CA07TRE', 'سيتروين', 'سيتروين C3', 'هاتشباك', 'VF7NC9HP0DY012345', 'ENG7770001112', 'زجاج مصفح', 'مركبة', '2022'),
('CA09XCV', 'كيا', 'كيا بيك أب', 'بيك أب', 'KNAFX5A82E5123456', 'ENG1029384756', 'زجاج أكريليك', 'مركبة', '2000'),
('CA10UYT', 'ألفا روميو', 'ألفا روميو 156', 'سيدان', 'ZARFAMAN7J7612345', 'ENG5566771234', 'زجاج مصفح', 'مركبة', '1999'),
('CA11MNO', 'هيونداي', 'هيونداي سانتافي', 'دفع رباعي', 'KMHCT41GP7U012345', 'ENG3344556677', 'زجاج مصفح', 'مركبة', '1980'),
('CA12NWR', 'نيسان', 'نيسان إكس-تريل', 'دفع رباعي', 'JN8AS5MT5CW123456', 'ENG1112131415', 'زجاج مصفح', 'مركبة', '2013'),
('CA12XYZ', 'تويوتا', 'تويوتا كورولا', 'سيدان', 'JTMBFREV3DJ123456', 'ENG1234567890', 'زجاج مقسى', 'مركبة', '2011');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_license`
--

CREATE TABLE `vehicle_license` (
  `id` int NOT NULL,
  `issue_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `inspection_date` date DEFAULT NULL,
  `vehicle_plate` varchar(10) DEFAULT NULL,
  `driving_license_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `type` varchar(200) NOT NULL,
  `color` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vehicle_license`
--

INSERT INTO `vehicle_license` (`id`, `issue_date`, `expiry_date`, `inspection_date`, `vehicle_plate`, `driving_license_id`, `type`, `color`) VALUES
(1, '2020-05-10', '2025-05-10', '2023-05-10', 'CA10UYT', 'EP61ZGQXMC', 'ملاكي', 'أحمر'),
(2, '2019-07-22', '2024-07-22', '2022-07-22', 'CA06YUI', 'ZT18MRLVCB', 'نقل', 'أبيض'),
(3, '2021-01-15', '2026-01-15', '2024-01-15', 'CA04PLK', 'QN72VCEKJD', 'أجرة', 'أسود'),
(4, '2018-11-30', '2023-11-30', '2021-11-30', 'CA12XYZ', 'KR29DHJVLE', 'دبلوماسي', 'أسود'),
(5, '2022-03-08', '2027-03-08', '2023-03-08', 'CA05LKO', 'GV52AXJLKT', 'ملاكي', 'أزرق'),
(6, '2019-02-25', '2024-02-25', '2022-02-25', 'CA11MNO', 'WD84RTYUIO', 'نقل', 'كحلي'),
(7, '2021-12-01', '2026-12-01', '2023-12-01', 'CA12NWR', 'MU47CEXYQN', 'دبلوماسي', 'ذهبي'),
(8, '2023-06-12', '2028-06-12', '2024-06-12', 'CA09XCV', 'HY60NEPQWR', 'ملاكي', 'فضي'),
(9, '2017-04-04', '2022-04-04', '2021-04-04', 'CA02BNM', 'XA93LMBTZQ', 'أجرة', 'أخضر'),
(10, '2020-09-19', '2025-09-19', '2022-09-19', 'CA07TRE', 'BF35WOKTLA', 'نقل', 'رمادي');

-- --------------------------------------------------------

--
-- Table structure for table `violations`
--

CREATE TABLE `violations` (
  `id` int NOT NULL,
  `police_id` int NOT NULL,
  `plate_id` varchar(10) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `action` int DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` enum('paied','unpaied','') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'unpaied',
  `attachments` json DEFAULT NULL,
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `violations`
--

INSERT INTO `violations` (`id`, `police_id`, `plate_id`, `location`, `type`, `action`, `description`, `status`, `attachments`, `create_at`) VALUES
(1, 1, 'CA02BNM', 'Zagazig', 1, 5, 'قطع اشاره مرور', 'paied', NULL, '2025-05-23 00:30:07'),
(2, 2, 'CA02BNM', 'cairo', 2, 1, 'None', 'unpaied', NULL, '2025-05-23 00:38:01');

-- --------------------------------------------------------

--
-- Table structure for table `violation_action`
--

CREATE TABLE `violation_action` (
  `id` int NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `violation_action`
--

INSERT INTO `violation_action` (`id`, `code`, `name`, `description`) VALUES
(1, 'FINE_ONLY', 'غرامة مالية فقط', 'تم فرض غرامة مالية بدون اتخاذ إجراءات إضافية'),
(2, 'FINE_AND_POINTS', 'غرامة مع خصم نقاط', 'تم فرض غرامة مالية مع خصم نقاط من سجل السائق'),
(3, 'VEHICLE_IMPOUND', 'حجز المركبة', 'تم حجز المركبة بسبب جسامة المخالفة'),
(4, 'LICENSE_SUSPENSION', 'سحب الرخصة مؤقتًا', 'تم سحب رخصة القيادة لمدة محددة'),
(5, 'WARNING', 'إنذار فقط', 'تم تسجيل مخالفة دون غرامة كتحذير أول'),
(6, 'COURT_REFERRAL', 'إحالة إلى المحكمة', 'تمت إحالة المخالفة إلى الجهات القضائية للبت فيها'),
(7, 'VEHICLE_CONFISCATION', 'مصادرة المركبة', 'تمت مصادرة المركبة نهائيًا حسب الأنظمة');

-- --------------------------------------------------------

--
-- Table structure for table `violation_type`
--

CREATE TABLE `violation_type` (
  `ID` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desctiption` text,
  `score` tinyint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `violation_type`
--

INSERT INTO `violation_type` (`ID`, `name`, `desctiption`, `score`) VALUES
(1, 'تجاوز السرعة', 'القيادة بسرعة تفوق الحد المسموح به', 6),
(2, 'قطع الإشارة الحمراء', 'عدم التوقف عند الإشارة الحمراء', 8),
(3, 'الوقوف في مكان ممنوع', 'إيقاف المركبة في منطقة محظورة', 3),
(4, 'عدم ربط حزام الأمان', 'القيادة دون ارتداء حزام الأمان', 2),
(5, 'استخدام الهاتف أثناء القيادة', 'الانشغال بالهاتف خلال القيادة', 4),
(6, 'القيادة بدون رخصة', 'قيادة المركبة بدون رخصة سارية', 10),
(7, 'القيادة تحت تأثير الكحول', 'القيادة بعد تناول الكحول أو المخدرات', 12),
(8, 'الانعطاف غير القانوني', 'القيام بانعطاف غير مسموح به', 3),
(9, 'عدم الالتزام بخط السير', 'تغيير المسار بشكل مخالف', 4),
(10, 'عدم إعطاء أفضلية المرور', 'عدم إعطاء الأولوية للمشاة أو المركبات الأخرى', 5);

-- --------------------------------------------------------

--
-- Table structure for table `wanted_vehicle`
--

CREATE TABLE `wanted_vehicle` (
  `plate` varchar(10) DEFAULT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `wanted_vehicle`
--

INSERT INTO `wanted_vehicle` (`plate`, `description`, `created_at`) VALUES
('CA02BNM', 'هذه السيارة مطلوبة لكونها مسروقة، وتم التبليغ عنها من قبل مالكها بتاريخ 11/11/2001، وتحمل لوحة رقم CA02BNM. يرجى اتخاذ الحيطة والإبلاغ فور رؤيتها.', '2025-05-24 16:19:36');

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
-- Indexes for table `driver_license`
--
ALTER TABLE `driver_license`
  ADD PRIMARY KEY (`number`),
  ADD KEY `pk_name` (`driver_id`),
  ADD KEY `pk_types` (`type`);

--
-- Indexes for table `inspected_vehicles`
--
ALTER TABLE `inspected_vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate` (`plate`),
  ADD KEY `police_id` (`police_id`);

--
-- Indexes for table `license_types`
--
ALTER TABLE `license_types`
  ADD PRIMARY KEY (`code`);

--
-- Indexes for table `notification_police`
--
ALTER TABLE `notification_police`
  ADD PRIMARY KEY (`id`),
  ADD KEY `police_id` (`police_id`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`national_id`);

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
-- Indexes for table `sms_otp`
--
ALTER TABLE `sms_otp`
  ADD KEY `police_id` (`police_id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`plate`);

--
-- Indexes for table `vehicle_license`
--
ALTER TABLE `vehicle_license`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pks_name` (`vehicle_plate`),
  ADD KEY `pks_types` (`driving_license_id`);

--
-- Indexes for table `violations`
--
ALTER TABLE `violations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plate_id` (`plate_id`),
  ADD KEY `type` (`type`),
  ADD KEY `violations_ibfk_3` (`action`),
  ADD KEY `police_ibfk_4` (`police_id`);

--
-- Indexes for table `violation_action`
--
ALTER TABLE `violation_action`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Indexes for table `violation_type`
--
ALTER TABLE `violation_type`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `wanted_vehicle`
--
ALTER TABLE `wanted_vehicle`
  ADD KEY `plate` (`plate`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `inspected_vehicles`
--
ALTER TABLE `inspected_vehicles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notification_police`
--
ALTER TABLE `notification_police`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT for table `vehicle_license`
--
ALTER TABLE `vehicle_license`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `violations`
--
ALTER TABLE `violations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `violation_action`
--
ALTER TABLE `violation_action`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `violation_type`
--
ALTER TABLE `violation_type`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `driver_license`
--
ALTER TABLE `driver_license`
  ADD CONSTRAINT `pk_name` FOREIGN KEY (`driver_id`) REFERENCES `person` (`national_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `pk_types` FOREIGN KEY (`type`) REFERENCES `license_types` (`code`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `inspected_vehicles`
--
ALTER TABLE `inspected_vehicles`
  ADD CONSTRAINT `inspected_vehicles_ibfk_1` FOREIGN KEY (`plate`) REFERENCES `vehicle` (`plate`),
  ADD CONSTRAINT `inspected_vehicles_ibfk_2` FOREIGN KEY (`police_id`) REFERENCES `police_users` (`id`);

--
-- Constraints for table `notification_police`
--
ALTER TABLE `notification_police`
  ADD CONSTRAINT `notification_police_ibfk_1` FOREIGN KEY (`police_id`) REFERENCES `police_users` (`id`);

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

--
-- Constraints for table `sms_otp`
--
ALTER TABLE `sms_otp`
  ADD CONSTRAINT `sms_otp_ibfk_1` FOREIGN KEY (`police_id`) REFERENCES `police_users` (`id`);

--
-- Constraints for table `vehicle_license`
--
ALTER TABLE `vehicle_license`
  ADD CONSTRAINT `pks_name` FOREIGN KEY (`vehicle_plate`) REFERENCES `vehicle` (`plate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pks_types` FOREIGN KEY (`driving_license_id`) REFERENCES `driver_license` (`number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `violations`
--
ALTER TABLE `violations`
  ADD CONSTRAINT `police_ibfk_4` FOREIGN KEY (`police_id`) REFERENCES `police_users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `violations_ibfk_1` FOREIGN KEY (`plate_id`) REFERENCES `vehicle` (`plate`),
  ADD CONSTRAINT `violations_ibfk_2` FOREIGN KEY (`type`) REFERENCES `violation_type` (`ID`),
  ADD CONSTRAINT `violations_ibfk_3` FOREIGN KEY (`action`) REFERENCES `violation_action` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wanted_vehicle`
--
ALTER TABLE `wanted_vehicle`
  ADD CONSTRAINT `wanted_vehicle_ibfk_1` FOREIGN KEY (`plate`) REFERENCES `vehicle` (`plate`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
