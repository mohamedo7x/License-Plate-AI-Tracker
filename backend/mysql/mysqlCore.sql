-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 23, 2025 at 02:36 AM
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
(1, 'Oliver Weston', 'mohamedo7x@hotmail.com', '$2b$10$4fRXoIfJ43mmnuqullqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'superadmin', 'active', 'default.png', '2025-05-20 03:06:52', '2023-04-18 15:05:43', '2025-04-06 02:31:14');

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
(1, '2025-05-22 02:01:55', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/license/R44556677\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:365:14)\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:376:14)\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:421:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-22 05:01:55:155\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-22 02:01:55'),
(2, '2025-05-22 02:01:55', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/license/R44556677\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-22 05:01:55:155\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"164ms\"}', '2025-05-22 02:01:55'),
(3, '2025-05-22 02:02:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-22 05:02:03:23\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"272ms\"}', '2025-05-22 02:02:03'),
(4, '2025-05-22 02:02:06', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 05:02:06:26\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"30ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-22 02:02:06'),
(5, '2025-05-22 02:03:47', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/WD84RTYUIO\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 05:03:47:347\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"13ms\", \"requestParams\": {\"id\": \"WD84RTYUIO\"}}', '2025-05-22 02:03:47'),
(6, '2025-05-22 02:03:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/WD84RTYUIO\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 05:03:52:352\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"13ms\", \"requestParams\": {\"id\": \"WD84RTYUIO\"}}', '2025-05-22 02:03:52'),
(7, '2025-05-23 00:21:53', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/license/EP61ZGQXMC\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:365:14)\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:376:14)\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:421:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-23 03:21:52:2152\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-23 00:21:53'),
(8, '2025-05-23 00:21:53', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/license/EP61ZGQXMC\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-23 03:21:53:2153\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"236ms\"}', '2025-05-23 00:21:53'),
(9, '2025-05-23 00:22:06', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 03:22:06:226\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"222ms\"}', '2025-05-23 00:22:06'),
(10, '2025-05-23 00:22:13', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/EP61ZGQXMC\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:22:13:2213\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"21ms\", \"requestParams\": {\"id\": \"EP61ZGQXMC\"}}', '2025-05-23 00:22:13'),
(11, '2025-05-23 00:23:29', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/BF35WOKTLA\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:23:29:2329\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"17ms\", \"requestParams\": {\"id\": \"BF35WOKTLA\"}}', '2025-05-23 00:23:29'),
(12, '2025-05-23 00:27:31', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA56DEF\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:27:31:2731\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"23ms\", \"requestParams\": {\"plate_id\": \"CA56DEF\"}}', '2025-05-23 00:27:31'),
(13, '2025-05-23 00:30:30', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:30:30:3030\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"32ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:30:30'),
(14, '2025-05-23 00:36:44', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:36:44:3644\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"61ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:36:44'),
(15, '2025-05-23 00:37:04', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA11MNO\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:37:04:374\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"13ms\", \"requestParams\": {\"plate_id\": \"CA11MNO\"}}', '2025-05-23 00:37:04'),
(16, '2025-05-23 00:38:09', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:38:09:389\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"27ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:38:09'),
(17, '2025-05-23 00:44:16', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:44:16:4416\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"46ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:44:16'),
(18, '2025-05-23 00:48:14', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:48:14:4814\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"92ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:48:14'),
(19, '2025-05-23 00:49:12', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:49:12:4912\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"90ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:49:12'),
(20, '2025-05-23 00:53:13', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:53:13:5313\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"63ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:53:13'),
(21, '2025-05-23 00:55:57', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 03:55:57:5557\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"51ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 00:55:57'),
(22, '2025-05-23 01:00:53', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 04:00:53:053\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"75ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 01:00:53'),
(23, '2025-05-23 01:15:57', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA02BNM\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 04:15:57:1557\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"74ms\", \"requestParams\": {\"plate_id\": \"CA02BNM\"}}', '2025-05-23 01:15:57'),
(24, '2025-05-23 01:16:37', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA10UYT\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 04:16:37:1637\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"31ms\", \"requestParams\": {\"plate_id\": \"CA10UYT\"}}', '2025-05-23 01:16:37'),
(25, '2025-05-23 01:16:49', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA12XYZ\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 04:16:49:1649\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"29ms\", \"requestParams\": {\"plate_id\": \"CA12XYZ\"}}', '2025-05-23 01:16:49'),
(26, '2025-05-23 01:27:58', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation/vehicle/CA12XYZ\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:365:14)\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:376:14)\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:421:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-23 04:27:58:2758\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-23 01:27:58'),
(27, '2025-05-23 01:27:58', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation/vehicle/CA12XYZ\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-23 04:27:58:2758\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"28ms\"}', '2025-05-23 01:27:58'),
(28, '2025-05-23 01:28:07', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 04:28:07:287\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"224ms\"}', '2025-05-23 01:28:07'),
(29, '2025-05-23 01:28:11', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA12XYZ\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-23 04:28:11:2811\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"27ms\", \"requestParams\": {\"plate_id\": \"CA12XYZ\"}}', '2025-05-23 01:28:11'),
(30, '2025-05-23 01:41:22', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 04:41:22:4122\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"219ms\"}', '2025-05-23 01:41:22'),
(31, '2025-05-23 01:57:23', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 04:57:23:5723\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"310ms\"}', '2025-05-23 01:57:23'),
(32, '2025-05-23 01:58:24', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 04:58:24:5824\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"186ms\"}', '2025-05-23 01:58:24'),
(33, '2025-05-23 01:59:32', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 04:59:32:5932\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"227ms\"}', '2025-05-23 01:59:32'),
(34, '2025-05-23 01:59:44', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 04:59:44:5944\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"188ms\"}', '2025-05-23 01:59:44'),
(35, '2025-05-23 01:59:49', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 04:59:49:5949\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"305ms\"}', '2025-05-23 01:59:49'),
(36, '2025-05-23 02:04:23', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:04:22:422\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"264ms\"}', '2025-05-23 02:04:23'),
(37, '2025-05-23 02:04:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:04:28:428\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"165ms\"}', '2025-05-23 02:04:28'),
(38, '2025-05-23 02:06:39', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:06:39:639\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"266ms\"}', '2025-05-23 02:06:39'),
(39, '2025-05-23 02:09:53', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:09:53:953\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"210ms\"}', '2025-05-23 02:09:53'),
(40, '2025-05-23 02:09:56', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:09:56:956\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"223ms\"}', '2025-05-23 02:09:56'),
(41, '2025-05-23 02:10:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:10:03:103\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"140ms\"}', '2025-05-23 02:10:03'),
(42, '2025-05-23 02:11:16', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:11:16:1116\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"313ms\"}', '2025-05-23 02:11:16'),
(43, '2025-05-23 02:11:21', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:11:21:1121\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"165ms\"}', '2025-05-23 02:11:21'),
(44, '2025-05-23 02:15:19', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:15:19:1519\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"205ms\"}', '2025-05-23 02:15:19'),
(45, '2025-05-23 02:15:22', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:15:22:1522\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"155ms\"}', '2025-05-23 02:15:22'),
(46, '2025-05-23 02:15:54', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:15:54:1554\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"159ms\"}', '2025-05-23 02:15:54'),
(47, '2025-05-23 02:15:58', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:15:58:1558\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"188ms\"}', '2025-05-23 02:15:58'),
(48, '2025-05-23 02:16:16', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:16:16:1616\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"144ms\"}', '2025-05-23 02:16:16'),
(49, '2025-05-23 02:18:16', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:18:16:1816\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"168ms\"}', '2025-05-23 02:18:16'),
(50, '2025-05-23 02:18:36', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:18:36:1836\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"152ms\"}', '2025-05-23 02:18:36'),
(51, '2025-05-23 02:20:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:20:03:203\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"150ms\"}', '2025-05-23 02:20:03'),
(52, '2025-05-23 02:20:25', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:20:25:2025\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"152ms\"}', '2025-05-23 02:20:25'),
(53, '2025-05-23 02:21:10', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:21:10:2110\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"142ms\"}', '2025-05-23 02:21:10'),
(54, '2025-05-23 02:29:09', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:29:09:299\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"232ms\"}', '2025-05-23 02:29:09'),
(55, '2025-05-23 02:29:44', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:29:44:2944\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"149ms\"}', '2025-05-23 02:29:44'),
(56, '2025-05-23 02:30:04', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:30:03:303\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"155ms\"}', '2025-05-23 02:30:04'),
(57, '2025-05-23 02:30:07', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:30:07:307\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"172ms\"}', '2025-05-23 02:30:07'),
(58, '2025-05-23 02:31:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:31:28:3128\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"219ms\"}', '2025-05-23 02:31:28'),
(59, '2025-05-23 02:32:02', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:32:01:321\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"342ms\"}', '2025-05-23 02:32:02'),
(60, '2025-05-23 02:32:44', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:32:44:3244\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"267ms\"}', '2025-05-23 02:32:44'),
(61, '2025-05-23 02:32:50', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:32:50:3250\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"184ms\"}', '2025-05-23 02:32:50'),
(62, '2025-05-23 02:33:56', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:33:56:3356\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"207ms\"}', '2025-05-23 02:33:56'),
(63, '2025-05-23 02:34:01', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:34:01:341\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"162ms\"}', '2025-05-23 02:34:01'),
(64, '2025-05-23 02:34:04', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:34:04:344\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"143ms\"}', '2025-05-23 02:34:04'),
(65, '2025-05-23 02:34:58', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:34:58:3458\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"244ms\"}', '2025-05-23 02:34:58'),
(66, '2025-05-23 02:35:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:35:27:3527\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"396ms\"}', '2025-05-23 02:35:27'),
(67, '2025-05-23 02:35:32', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:35:32:3532\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"157ms\"}', '2025-05-23 02:35:32'),
(68, '2025-05-23 02:35:34', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:35:34:3534\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"159ms\"}', '2025-05-23 02:35:34'),
(69, '2025-05-23 02:35:38', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:35:38:3538\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"185ms\"}', '2025-05-23 02:35:38'),
(70, '2025-05-23 02:35:43', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-23 05:35:43:3543\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"156ms\"}', '2025-05-23 02:35:43');

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
  `criminal_status` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`national_id`, `full_name`, `gender`, `date_of_birth`, `social_status`, `religion`, `address`, `issue_date`, `expired_date`, `criminal_status`) VALUES
('29503212568912', 'بسمة مجدي عوض عبدالله', 'انثى', '1986-04-05', 'عازب', 'مسلم', '٢٢ شارع مصطفى النحاس، مدينة نصر، القاهرة', '2011-06-25', '2021-06-25', 0),
('29611282579365', 'علي عبدالفتاح حسين عبدالعزيز', 'ذكر', '1972-11-28', 'ارملة', 'مسيحي', '٤٤ شارع النزهة، مصر الجديدة، القاهرة', '1995-01-01', '2005-01-01', 1),
('29707182759612', 'سارة فتحي عبدالله سالم', 'انثى', '1993-12-12', 'ارملة', 'بدون', '١١ شارع رمسيس، وسط البلد، القاهرة', '2017-09-10', '2027-09-10', 0),
('29802142563984', 'فاطمة عبدالحليم زكريا عوض', 'انثى', '1990-08-22', 'عازب', 'مسلم', '٢٥ شارع النيل، المعادي، القاهرة', '2015-05-01', '2025-05-01', 0),
('29808072548691', 'خالد حسن الزهار سالم', 'ذكر', '1980-08-07', 'متزوج', 'يهودي', '٦٥ شارع الهرم، العمرانية، الجيزة', '2010-01-01', '2020-01-01', 0),
('29905112578938', 'سعيد عثمان سليمان زكريا', 'ذكر', '1975-02-28', 'مطلق', 'بدون', '٣٧ شارع القصر العيني، وسط البلد، القاهرة', '2003-03-15', '2013-03-15', 1),
('29905122578934', 'أحمد عبدالحليم سالم الزهار', 'ذكر', '1985-03-15', 'متزوج', 'مسلم', '١٠ شارع التحرير، الدقي، الجيزة', '2010-04-10', '2020-04-10', 0),
('29909012258931', 'مصطفى فاروق عبدالعزيز عوض', 'ذكر', '1988-06-18', 'متزوج', 'مسلم', '٥٧ شارع الملك فيصل، الهرم، الجيزة', '2012-03-15', '2022-03-15', 0),
('30010162547893', 'محمد سامي حسين عبدالرحمن', 'ذكر', '1978-01-01', 'مطلق', 'مسيحي', '٣٣ شارع سوريا، المهندسين، الجيزة', '2005-07-20', '2015-07-20', 1),
('30106052398174', 'إيمان نبيل سليمان الزهار', 'انثى', '1981-10-30', 'مطلق', 'مسلم', '١٨ شارع الطيران، مدينة نصر، القاهرة', '2009-11-01', '2019-11-01', 0);

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
(2, 'MIL654300', 'Mohamed Dama Fc', 'Second Lieutenant', 'Giza Traffic Department', 'cairo', '2025-05-23 05:35:43', 1, 'mohamedo7x', 1, '$2b$10$doIVrgYqd6WSnXNnCS5c9O30gcD1RXH9IF.6dCHwTRVo0jGKUS4cm', '0569876543', '242a262657ef48b751d9.jpg', '2025-05-18 21:03:37', '2025-05-23 02:35:43');

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

-- --------------------------------------------------------

--
-- Table structure for table `sms_otp`
--

CREATE TABLE `sms_otp` (
  `otp` varchar(4) DEFAULT NULL,
  `police_id` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sms_otp`
--

INSERT INTO `sms_otp` (`otp`, `police_id`, `created_at`) VALUES
('0370', 2, '2025-05-23 02:35:27');

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
-- Indexes for table `license_types`
--
ALTER TABLE `license_types`
  ADD PRIMARY KEY (`code`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
