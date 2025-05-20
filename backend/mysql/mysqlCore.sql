-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 20, 2025 at 06:14 PM
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
(1, 'Oliver Weston', 'mohamedo7x@hotmail.com', '$2b$10$4fRXoIfJ43mmnuqullqSreMuOS9/0x2fZTwsgQ8/E.itSjRCwn7qm', 'superadmin', 'active', 'default.png', '2025-05-20 03:06:52', '2023-04-18 15:05:43', '2025-04-06 02:31:14'),
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
(1, '2025-05-20 16:04:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 19:04:27:427\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"233ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 16:04:27'),
(2, '2025-05-20 16:06:51', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 19:06:51:651\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"89ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 16:06:51'),
(3, '2025-05-20 16:07:25', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 19:07:25:725\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"65ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 16:07:25'),
(4, '2025-05-20 16:10:21', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-20 19:10:21:1021\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"228ms\"}', '2025-05-20 16:10:21'),
(5, '2025-05-20 17:47:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 20:47:52:4752\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"61ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 17:47:52'),
(6, '2025-05-20 17:47:52', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/license/29503212568912\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:54:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 1, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 20:47:52:4752\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 17:47:52'),
(7, '2025-05-20 17:49:50', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 20:49:50:4950\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"108ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-20 17:49:50'),
(8, '2025-05-20 17:50:16', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R45678901\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 20:50:16:5016\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"14ms\", \"requestParams\": {\"id\": \"R45678901\"}}', '2025-05-20 17:50:16'),
(9, '2025-05-20 17:50:16', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/license/R45678901\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:54:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 1, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 20:50:16:5016\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 17:50:16'),
(10, '2025-05-20 17:50:25', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R34567890\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 20:50:25:5025\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"12ms\", \"requestParams\": {\"id\": \"R34567890\"}}', '2025-05-20 17:50:25'),
(11, '2025-05-20 17:50:25', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/license/R34567890\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:54:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 1, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 20:50:25:5025\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 17:50:25'),
(12, '2025-05-20 17:50:30', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R12345678\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 20:50:30:5030\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"9ms\", \"requestParams\": {\"id\": \"R12345678\"}}', '2025-05-20 17:50:30'),
(13, '2025-05-20 18:04:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R12345678\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:04:52:452\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"86ms\", \"requestParams\": {\"id\": \"R12345678\"}}', '2025-05-20 18:04:52'),
(14, '2025-05-20 18:07:25', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R12345678\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:07:25:725\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"44ms\", \"requestParams\": {\"id\": \"R12345678\"}}', '2025-05-20 18:07:25'),
(15, '2025-05-20 18:08:35', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/R12345678\", \"stack\": \"UnauthorizedError: Authorization header is missing. Please provide a valid token.\\n    at extractJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:30:11)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:67:34)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:365:14)\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:376:14)\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:421:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-20 21:08:35:835\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:08:35'),
(16, '2025-05-20 18:08:35', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/R12345678\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-20 21:08:35:835\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"29ms\"}', '2025-05-20 18:08:35'),
(17, '2025-05-20 18:08:42', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-20 21:08:42:842\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"172ms\"}', '2025-05-20 18:08:42'),
(18, '2025-05-20 18:08:50', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/R12345678\", \"stack\": \"UnauthorizedError: Authorization header is missing. Please provide a valid token.\\n    at extractJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:30:11)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:67:34)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:365:14)\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:376:14)\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:421:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-20 21:08:50:850\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:08:50'),
(19, '2025-05-20 18:08:50', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/R12345678\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-20 21:08:50:850\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"7ms\"}', '2025-05-20 18:08:50'),
(20, '2025-05-20 18:09:01', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/R12345678\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:09:01:91\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"17ms\"}', '2025-05-20 18:09:01'),
(21, '2025-05-20 18:09:01', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/R12345678\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:26:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 21:09:01:91\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:09:01'),
(22, '2025-05-20 18:09:13', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/R12345678\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:09:13:913\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"9ms\"}', '2025-05-20 18:09:13'),
(23, '2025-05-20 18:09:13', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/R12345678\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:26:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 1, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 21:09:13:913\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:09:13'),
(24, '2025-05-20 18:09:24', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:09:24:924\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"12ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 18:09:24'),
(25, '2025-05-20 18:09:54', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/R01234567\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:09:54:954\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"14ms\"}', '2025-05-20 18:09:54'),
(26, '2025-05-20 18:09:54', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/R01234567\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:26:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 21:09:54:954\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:09:54'),
(27, '2025-05-20 18:10:02', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/R10111213\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:10:02:102\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"10ms\"}', '2025-05-20 18:10:02'),
(28, '2025-05-20 18:10:02', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/R10111213\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:26:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 21:10:02:102\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:10:02'),
(29, '2025-05-20 18:10:14', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/R11223344\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:10:14:1014\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"9ms\"}', '2025-05-20 18:10:14'),
(30, '2025-05-20 18:10:14', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/R11223344\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:26:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 21:10:14:1014\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:10:14'),
(31, '2025-05-20 18:10:30', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R11223344\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:10:30:1030\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"9ms\", \"requestParams\": {\"id\": \"R11223344\"}}', '2025-05-20 18:10:30'),
(32, '2025-05-20 18:10:46', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R45678901\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:10:46:1046\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"13ms\", \"requestParams\": {\"id\": \"R45678901\"}}', '2025-05-20 18:10:46'),
(33, '2025-05-20 18:10:46', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/license/R45678901\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:79:21\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 21:10:46:1046\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 18:10:46'),
(34, '2025-05-20 18:11:11', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:11:11:1111\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"14ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-20 18:11:11'),
(35, '2025-05-20 18:13:05', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:13:04:134\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"60ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-20 18:13:05');

-- --------------------------------------------------------

--
-- Table structure for table `driving_license`
--

CREATE TABLE `driving_license` (
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
-- Dumping data for table `driving_license`
--

INSERT INTO `driving_license` (`number`, `driver_id`, `type`, `education`, `nationality`, `issue_date`, `expiry_date`, `traffic_department`, `traffic_office`) VALUES
('R01234567', '29503212568912', 'T', 'دبلوم', 'مصري', '2023-06-05', '2027-06-05', 'الإسماعيلية', 'شرق الإسماعيلية'),
('R10111213', '29611282579365', 'E', 'دبلوم', 'بحرينية', '2021-12-15', '2025-12-15', 'حدائق القبة', 'كوبرى القبة'),
('R11223344', '29707182759612', 'A', 'بكالوريوس', 'سعودي', '2020-03-12', '2024-03-12', 'القاهرة الجديدة', 'التجمع الثالث'),
('R12345678', '29802142563984', 'B', 'بكالوريوس', 'مصري', '2018-05-10', '2022-05-10', 'مدينة نصر', 'الحي الأول'),
('R22334455', '29808072548691', 'B', 'ماجستير', 'أردنية', '2019-07-25', '2023-07-25', 'الهرم', 'المنطقة الصناعية'),
('R23456789', '29905112578938', 'E', 'ثانوية عامة', 'مصري', '2019-03-22', '2023-03-22', 'السادس من أكتوبر', 'الإدارة المركزية'),
('R33445566', '29905122578934', 'C', 'ثانوية عامة', 'إماراتي', '2021-11-05', '2025-11-05', 'العجوزة', 'شارع السودان'),
('R34567890', '29909012258931', 'B', 'ماجستير', 'مصري', '2020-01-15', '2024-01-15', 'مصر الجديدة', 'النزهة'),
('R44556677', '30010162547893', 'E', 'دكتوراه', 'سوري', '2018-02-18', '2022-02-18', 'العباسية', 'ميدان العباسية'),
('R45678901', '30106052398174', 'B', 'بكالوريوس', 'مصري', '2021-07-30', '2025-07-30', 'القاهرة الجديدة', 'التجمع الخامس');

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
(2, 'MIL654300', 'Mohamed Dama Fc', 'Second Lieutenant', 'Giza Traffic Department', 'cairo', '2025-05-20 21:08:42', 1, 'mohamedo7x', 1, '$2b$10$doIVrgYqd6WSnXNnCS5c9O30gcD1RXH9IF.6dCHwTRVo0jGKUS4cm', '0569876543', '242a262657ef48b751d9.jpg', '2025-05-18 21:03:37', '2025-05-20 18:08:42');

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
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `plate` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `brand` varchar(20) DEFAULT NULL,
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

INSERT INTO `vehicle` (`plate`, `brand`, `type`, `chassis_number`, `engine_number`, `glass_type`, `classification`, `model`) VALUES
('CA02BNM', 'فيات', 'فان', 'ZFA26300006123456', 'ENG4455667788', 'زجاج أكريليك', 'مركبة', '2003'),
('CA04PLK', 'بيجو', 'دفع رباعي', 'VF3XHNPZZFE012345', 'ENG7788990011', 'زجاج مصفح', 'مركبة', '2020'),
('CA05LKO', 'دوكاتي', 'دراجة نارية', 'ZDM1RB5T9DB012345', 'ENG2233557799', 'زجاج مقسى', 'دراجة نارية', '2019'),
('CA06YUI', 'إيسوزو', 'شاحنة نقل', 'JAANLT149E7101234', 'ENG6644221100', 'زجاج أكريليك', 'شاحنة نقل', '2025'),
('CA07TRE', 'سيتروين', 'هاتشباك', 'VF7NC9HP0DY012345', 'ENG7770001112', 'زجاج مصفح', 'مركبة', '2022'),
('CA09XCV', 'كيا', 'بيك أب', 'KNAFX5A82E5123456', 'ENG1029384756', 'زجاج أكريليك', 'مركبة', '2000'),
('CA10UYT', 'ألفا روميو', 'سيدان', 'ZARFAMAN7J7612345', 'ENG5566771234', 'زجاج مصفح', 'مركبة', '1999'),
('CA11MNO', 'هيونداي', 'دفع رباعي', 'KMHCT41GP7U012345', 'ENG3344556677', 'زجاج مصفح', 'مركبة', '1980'),
('CA12NWR', 'نيسان', 'دفع رباعي', 'JN8AS5MT5CW123456', 'ENG1112131415', 'زجاج مصفح', 'مركبة', '2013'),
('CA12XYZ', 'تويوتا', 'سيدان', 'JTMBFREV3DJ123456', 'ENG1234567890', 'زجاج مقسى', 'مركبة', '2011'),
('CA24TYU', 'هوندا', 'دراجة نارية', 'JH2SC59027M012345', 'ENG1234567890', 'زجاج مصفح', 'دراجة نارية', '2015'),
('CA33SYR', 'كاواساكي', 'دراجة نارية', 'JKBZXJE13MA123456', 'ENG2233445566', 'زجاج مقسى', 'دراجة نارية', '2014'),
('CA34ABC', 'هوندا', 'هاتشباك', 'JHMGE8H55DC012345', 'ENG0987654321', 'زجاج أكريليك', 'مركبة', '2017'),
('CA38KIA', 'بي إم دبليو', 'سيدان', 'WBA3A5C55CF123456', 'ENG2468013579', 'زجاج مقسى', 'مركبة', '1999'),
('CA46DKL', 'هيونداي', 'هاتشباك', 'KMHHT6KD5DU123456', 'ENG5566778899', 'زجاج أكريليك', 'مركبة', '2007'),
('CA55HJN', 'شيفروليه', 'بيك أب', '1GCHK23U83F123456', 'ENG9988776655', 'زجاج أكريليك', 'شاحنة نقل', '2005'),
('CA56DEF', 'سوزوكي', 'دراجة نارية', 'JS1GR7MA0D2101234', 'ENG1122334455', 'زجاج مصفح', 'دراجة نارية', '2004'),
('CA67VTR', 'فورد', 'شاحنة نقل', '1FTFW1EF1EKE12345', 'ENG1357924680', 'زجاج أكريليك', 'شاحنة نقل', '2019'),
('CA78GHI', 'مرسيدس', 'شاحنة نقل', 'WDB93012345678901', 'ENG6677889900', 'زجاج أكريليك', 'شاحنة نقل', '2022'),
('CA78ROZ', 'مرسيدس', 'فان', 'WD3PE8CC1E1234567', 'ENG1122334455', 'زجاج مصفح', 'مركبة', '2012'),
('CA80BRQ', 'فولفو', 'شاحنة نقل', 'YV4A22PK6G1234567', 'ENG6677889900', 'زجاج مقسى', 'شاحنة نقل', '1984'),
('CA90JKL', 'نيسان', 'بيك أب', 'JN1AZ34E47M012345', 'ENG2233445566', 'زجاج مقسى', 'مركبة', '1980'),
('CA91REG', 'تويوتا', 'دفع رباعي', 'JTDBR32E720123456', 'ENG9876543210', 'زجاج مقسى', 'مركبة', '2000');

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
(1, '2024-05-01', '2025-05-01', '2022-05-04', 'CA02BNM', 'R10111213', 'نقل', 'أحمر'),
(2, '2023-09-06', '2025-05-31', '2022-05-04', 'CA04PLK', 'R12345678', 'ملاكي', 'أسود'),
(3, '2017-08-16', '2022-01-15', '2020-02-19', 'CA05LKO', 'R22334455', 'ملاكي', 'أخضر'),
(4, '2023-09-06', '2025-05-31', '2022-05-04', 'CA55HJN', 'R11223344', 'نقل', 'أسود'),
(6, '2018-05-23', '2025-05-22', '2015-05-13', 'CA34ABC', 'R22334455', 'أجرة', 'أسود'),
(7, '2019-05-12', '2022-05-12', '2010-01-01', 'CA38KIA', 'R44556677', 'دبلوماسي', 'أسود');

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
-- Indexes for table `driving_license`
--
ALTER TABLE `driving_license`
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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `driving_license`
--
ALTER TABLE `driving_license`
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
-- Constraints for table `vehicle_license`
--
ALTER TABLE `vehicle_license`
  ADD CONSTRAINT `pks_name` FOREIGN KEY (`vehicle_plate`) REFERENCES `vehicle` (`plate`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pks_types` FOREIGN KEY (`driving_license_id`) REFERENCES `driving_license` (`number`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
