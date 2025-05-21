-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 21, 2025 at 10:12 PM
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
(35, '2025-05-20 18:13:05', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:13:04:134\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"60ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-20 18:13:05'),
(36, '2025-05-20 18:18:18', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 21:18:18:1818\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"137ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-20 18:18:18'),
(37, '2025-05-21 14:27:27', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/police/license/R44556677\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:365:14)\\n    at param (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:376:14)\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:421:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-21 17:27:26:2726\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 14:27:27'),
(38, '2025-05-21 14:27:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/license/R44556677\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-21 17:27:27:2727\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"172ms\"}', '2025-05-21 14:27:27'),
(39, '2025-05-21 14:27:39', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-21 17:27:39:2739\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"246ms\"}', '2025-05-21 14:27:39'),
(40, '2025-05-21 14:27:56', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:27:56:2756\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"64ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:27:56'),
(41, '2025-05-21 14:34:37', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:34:37:3437\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"62ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:34:37'),
(42, '2025-05-21 14:41:40', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:41:40:4140\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"51ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:41:40'),
(43, '2025-05-21 14:46:24', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:46:24:4624\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"57ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:46:24'),
(44, '2025-05-21 14:46:31', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:46:31:4631\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"18ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:46:31'),
(45, '2025-05-21 14:46:38', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:46:38:4638\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"24ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:46:38'),
(46, '2025-05-21 14:47:15', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:47:15:4715\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"10ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:47:15'),
(47, '2025-05-21 14:48:18', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:48:18:4818\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"409ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:48:18'),
(48, '2025-05-21 14:56:55', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:56:55:5655\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"68ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:56:55'),
(49, '2025-05-21 14:57:10', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:57:10:5710\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"11ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:57:10'),
(50, '2025-05-21 14:57:23', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:57:23:5723\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"12ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:57:23'),
(51, '2025-05-21 14:57:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:57:27:5727\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"8ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:57:27'),
(52, '2025-05-21 14:57:46', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 17:57:46:5746\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"14ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 14:57:46'),
(53, '2025-05-21 15:01:18', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 18:01:18:118\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"56ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 15:01:18'),
(54, '2025-05-21 15:25:15', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 18:25:15:2515\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"53ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 15:25:15'),
(55, '2025-05-21 15:26:22', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/license/R44556677\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 18:26:22:2622\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"54ms\", \"requestParams\": {\"id\": \"R44556677\"}}', '2025-05-21 15:26:22'),
(56, '2025-05-21 20:26:46', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:346:12)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:280:10)\\n    at Function.handle (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:175:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-21 23:26:46:2646\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:26:46'),
(57, '2025-05-21 20:26:46', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-21 23:26:46:2646\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"100ms\"}', '2025-05-21 20:26:46'),
(58, '2025-05-21 20:26:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-21 23:26:52:2652\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"194ms\"}', '2025-05-21 20:26:52'),
(59, '2025-05-21 20:27:00', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 23:27:00:270\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"17ms\"}', '2025-05-21 20:27:00'),
(60, '2025-05-21 20:27:38', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 23:27:38:2738\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"45ms\"}', '2025-05-21 20:27:38'),
(61, '2025-05-21 20:29:53', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation/actions\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-21 23:29:53:2953\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"17ms\"}', '2025-05-21 20:29:53'),
(62, '2025-05-21 20:30:23', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/actions\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-21 23:30:23:3023\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"50ms\"}', '2025-05-21 20:30:23'),
(63, '2025-05-21 20:35:59', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/police/license/R44556677\", \"method\": \"POST\", \"status\": 404, \"timestamp\": \"2025-05-21 23:35:59:3559\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"17ms\"}', '2025-05-21 20:35:59'),
(64, '2025-05-21 20:36:30', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"ValidationError: Vehicle plate is required, Vehicle plate must be a string, Vehicle plate must not be empty, Location is required, Location must be a string, Location must not be empty, Violation type is required, Violation type must be an integer, Violation type must be between 1 and 10, Action taken is required, Action taken must be an integer, Action taken must be between 1 and 7, Description is required, Description must be a string, Description must not be empty\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-21 23:36:30:3630\", \"statusCode\": 400, \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:36:30'),
(65, '2025-05-21 20:36:31', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-21 23:36:30:3630\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"responseTime\": \"59ms\"}', '2025-05-21 20:36:31'),
(66, '2025-05-21 20:37:03', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"ValidationError: Vehicle plate is required, Vehicle plate must be a string, Vehicle plate must not be empty, Location is required, Location must be a string, Location must not be empty, Violation type is required, Violation type must be an integer, Violation type must be between 1 and 10, Action taken is required, Action taken must be an integer, Action taken must be between 1 and 7, Description is required, Description must be a string, Description must not be empty\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-21 23:37:03:373\", \"statusCode\": 400, \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:37:03'),
(67, '2025-05-21 20:37:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-21 23:37:03:373\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"responseTime\": \"18ms\"}', '2025-05-21 20:37:03'),
(68, '2025-05-21 20:37:28', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"ValidationError: Vehicle plate is required, Vehicle plate must be a string, Vehicle plate must not be empty, Location is required, Location must be a string, Location must not be empty, Violation type is required, Violation type must be an integer, Violation type must be between 1 and 10, Action taken is required, Action taken must be an integer, Action taken must be between 1 and 7, Description is required, Description must be a string, Description must not be empty\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-21 23:37:28:3728\", \"statusCode\": 400, \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:37:28'),
(69, '2025-05-21 20:37:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-21 23:37:28:3728\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"responseTime\": \"16ms\"}', '2025-05-21 20:37:28'),
(70, '2025-05-21 20:38:23', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"ValidationError: Vehicle plate is required, Vehicle plate must be a string, Vehicle plate must not be empty, Location is required, Location must be a string, Location must not be empty, Violation type is required, Violation type must be an integer, Violation type must be between 1 and 10, Action taken is required, Action taken must be an integer, Action taken must be between 1 and 7, Description is required, Description must be a string, Description must not be empty\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-21 23:38:23:3823\", \"statusCode\": 400, \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:38:23'),
(71, '2025-05-21 20:38:23', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-21 23:38:23:3823\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"responseTime\": \"127ms\"}', '2025-05-21 20:38:23'),
(72, '2025-05-21 20:40:45', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"ValidationError: Vehicle plate is required, Vehicle plate must be a string, Vehicle plate must not be empty, Location is required, Location must be a string, Location must not be empty, Violation type is required, Violation type must be an integer, Violation type must be between 1 and 10, Action taken is required, Action taken must be an integer, Action taken must be between 1 and 7, Description is required, Description must be a string, Description must not be empty\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-21 23:40:44:4044\", \"statusCode\": 400, \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:40:45'),
(73, '2025-05-21 20:40:45', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-21 23:40:45:4045\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"\", \"description\": \"\", \"vehicle_plate\": \"\"}, \"responseTime\": \"99ms\"}', '2025-05-21 20:40:45'),
(74, '2025-05-21 20:48:22', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"MulterError: File too large\\n    at abortWithCode (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:73:22)\\n    at FileStream.<anonymous> (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:136:11)\\n    at FileStream.emit (node:events:524:28)\\n    at FileStream.emit (node:domain:489:12)\\n    at SBMH.ssCb [as _cb] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:479:32)\\n    at feed (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:248:10)\\n    at SBMH.push (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:104:16)\\n    at Multipart._write (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:567:19)\\n    at writeOrBuffer (node:internal/streams/writable:572:12)\\n    at _write (node:internal/streams/writable:501:10)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"MulterError\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-21 23:48:22:4822\", \"statusCode\": 500, \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:48:22'),
(75, '2025-05-21 20:48:22', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-21 23:48:22:4822\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"851ms\"}', '2025-05-21 20:48:22');
INSERT INTO `AuditLogs` (`id`, `timestamp`, `level`, `message`, `meta`, `created_at`) VALUES
(76, '2025-05-21 20:48:58', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"MulterError: File too large\\n    at abortWithCode (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:73:22)\\n    at FileStream.<anonymous> (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:136:11)\\n    at FileStream.emit (node:events:524:28)\\n    at FileStream.emit (node:domain:489:12)\\n    at SBMH.ssCb [as _cb] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:479:32)\\n    at feed (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:248:10)\\n    at SBMH.push (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:104:16)\\n    at Multipart._write (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:567:19)\\n    at writeOrBuffer (node:internal/streams/writable:572:12)\\n    at _write (node:internal/streams/writable:501:10)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"MulterError\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-21 23:48:58:4858\", \"statusCode\": 500, \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:48:58'),
(77, '2025-05-21 20:48:59', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-21 23:48:58:4858\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"743ms\"}', '2025-05-21 20:48:59'),
(78, '2025-05-21 20:56:01', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"MulterError: File too large\\n    at abortWithCode (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:73:22)\\n    at FileStream.<anonymous> (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:136:11)\\n    at FileStream.emit (node:events:524:28)\\n    at FileStream.emit (node:domain:489:12)\\n    at SBMH.ssCb [as _cb] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:479:32)\\n    at feed (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:248:10)\\n    at SBMH.push (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:104:16)\\n    at Multipart._write (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:567:19)\\n    at writeOrBuffer (node:internal/streams/writable:572:12)\\n    at _write (node:internal/streams/writable:501:10)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"MulterError\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-21 23:56:01:561\", \"statusCode\": 500, \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 20:56:01'),
(79, '2025-05-21 20:56:02', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-21 23:56:01:561\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"852ms\"}', '2025-05-21 20:56:02'),
(80, '2025-05-21 21:02:31', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"Error: No file uploaded\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:48:11\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:8:71\\n    at new Promise (<anonymous>)\\n    at __awaiter (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:4:12)\\n    at saveUploadedFile (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:46:73)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:20:35\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:8:71\\n    at new Promise (<anonymous>)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-22 00:02:31:231\", \"statusCode\": 500, \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:02:31'),
(81, '2025-05-21 21:02:31', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-22 00:02:31:231\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"171ms\"}', '2025-05-21 21:02:31'),
(82, '2025-05-21 21:14:11', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/police/violation\", \"stack\": \"Error: No files uploaded\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:83:11\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:8:71\\n    at new Promise (<anonymous>)\\n    at __awaiter (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:4:12)\\n    at saveUploadedFiles (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:79:76)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:20:35\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:8:71\\n    at new Promise (<anonymous>)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-22 00:14:11:1411\", \"statusCode\": 500, \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:14:11'),
(83, '2025-05-21 21:14:11', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-22 00:14:11:1411\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"64ms\"}', '2025-05-21 21:14:11'),
(84, '2025-05-21 21:30:20', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at validatePoliceToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:72:37)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:284:15\\n    at Function.process_params (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:346:12)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:280:10)\\n    at Function.handle (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\index.js:175:3)\", \"method\": \"POST\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-22 00:30:20:3020\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:30:20'),
(85, '2025-05-21 21:30:20', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation\", \"method\": \"POST\", \"status\": 401, \"timestamp\": \"2025-05-22 00:30:20:3020\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"103ms\"}', '2025-05-21 21:30:20'),
(86, '2025-05-21 21:30:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-22 00:30:28:3028\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"187ms\"}', '2025-05-21 21:30:28'),
(87, '2025-05-21 21:30:34', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:30:33:3033\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"60ms\"}', '2025-05-21 21:30:34'),
(88, '2025-05-21 21:31:54', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:31:54:3154\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"220ms\"}', '2025-05-21 21:31:54'),
(89, '2025-05-21 21:32:20', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation\", \"stack\": \"MulterError: File too large\\n    at abortWithCode (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:73:22)\\n    at FileStream.<anonymous> (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\multer\\\\lib\\\\make-middleware.js:136:11)\\n    at FileStream.emit (node:events:524:28)\\n    at FileStream.emit (node:domain:489:12)\\n    at SBMH.ssCb [as _cb] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:479:32)\\n    at feed (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:248:10)\\n    at SBMH.push (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\streamsearch\\\\lib\\\\sbmh.js:104:16)\\n    at Multipart._write (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\busboy\\\\lib\\\\types\\\\multipart.js:567:19)\\n    at writeOrBuffer (node:internal/streams/writable:572:12)\\n    at _write (node:internal/streams/writable:501:10)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"MulterError\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-22 00:32:20:3220\", \"statusCode\": 500, \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:32:20'),
(90, '2025-05-21 21:32:20', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-22 00:32:20:3220\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"777ms\"}', '2025-05-21 21:32:20'),
(91, '2025-05-21 21:32:32', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:32:32:3232\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"46ms\"}', '2025-05-21 21:32:32'),
(92, '2025-05-21 21:39:48', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation\", \"stack\": \"ValidationError: Status must be either \'paied\', \'unpaied\', or \'\'\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-22 00:39:48:3948\", \"statusCode\": 400, \"requestBody\": {\"status\": \"paid\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:39:48'),
(93, '2025-05-21 21:39:48', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation\", \"method\": \"POST\", \"status\": 400, \"timestamp\": \"2025-05-22 00:39:48:3948\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paid\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"97ms\"}', '2025-05-21 21:39:48'),
(94, '2025-05-21 21:40:08', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:40:08:408\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"66ms\"}', '2025-05-21 21:40:08'),
(95, '2025-05-21 21:41:48', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:41:48:4148\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"286ms\"}', '2025-05-21 21:41:48'),
(96, '2025-05-21 21:42:20', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:42:20:4220\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"234ms\"}', '2025-05-21 21:42:20'),
(97, '2025-05-21 21:43:41', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:43:41:4341\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"168ms\"}', '2025-05-21 21:43:41'),
(98, '2025-05-21 21:44:58', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:44:58:4458\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"166ms\"}', '2025-05-21 21:44:58'),
(99, '2025-05-21 21:45:39', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:45:39:4539\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"64ms\"}', '2025-05-21 21:45:39'),
(100, '2025-05-21 21:47:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:47:27:4727\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"157ms\"}', '2025-05-21 21:47:27'),
(101, '2025-05-21 21:49:05', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:49:05:495\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"68ms\"}', '2025-05-21 21:49:05'),
(102, '2025-05-21 21:51:10', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:51:10:5110\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"166ms\"}', '2025-05-21 21:51:10'),
(103, '2025-05-21 21:51:52', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation\", \"stack\": \"Error: No files uploaded\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:83:11\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:8:71\\n    at new Promise (<anonymous>)\\n    at __awaiter (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:4:12)\\n    at saveUploadedFiles (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:79:76)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:13:49\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:8:71\\n    at new Promise (<anonymous>)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-22 00:51:52:5152\", \"statusCode\": 500, \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:51:52'),
(104, '2025-05-21 21:51:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-22 00:51:52:5152\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"107ms\"}', '2025-05-21 21:51:52'),
(105, '2025-05-21 21:52:12', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation\", \"stack\": \"Error: No files uploaded\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:83:11\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:8:71\\n    at new Promise (<anonymous>)\\n    at __awaiter (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:4:12)\\n    at saveUploadedFiles (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:79:76)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:13:49\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:8:71\\n    at new Promise (<anonymous>)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-22 00:52:12:5212\", \"statusCode\": 500, \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:52:12'),
(106, '2025-05-21 21:52:12', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-22 00:52:12:5212\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"73ms\"}', '2025-05-21 21:52:12'),
(107, '2025-05-21 21:52:57', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation\", \"stack\": \"Error: No files uploaded\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:83:11\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:8:71\\n    at new Promise (<anonymous>)\\n    at __awaiter (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:4:12)\\n    at saveUploadedFiles (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:79:76)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:13:49\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:8:71\\n    at new Promise (<anonymous>)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-22 00:52:57:5257\", \"statusCode\": 500, \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:52:57'),
(108, '2025-05-21 21:52:58', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-22 00:52:57:5257\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"93ms\"}', '2025-05-21 21:52:58'),
(109, '2025-05-21 21:53:01', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/violation\", \"stack\": \"Error: No files uploaded\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:83:11\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:8:71\\n    at new Promise (<anonymous>)\\n    at __awaiter (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:4:12)\\n    at saveUploadedFiles (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\multer.middleware.ts:79:76)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:13:49\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\police.vehcile.controller.ts:8:71\\n    at new Promise (<anonymous>)\", \"method\": \"POST\", \"userId\": 2, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-22 00:53:01:531\", \"statusCode\": 500, \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-21 21:53:01'),
(110, '2025-05-21 21:53:01', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/violation\", \"method\": \"POST\", \"status\": 500, \"timestamp\": \"2025-05-22 00:53:01:531\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"17ms\"}', '2025-05-21 21:53:01'),
(111, '2025-05-21 21:55:17', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:55:17:5517\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"202ms\"}', '2025-05-21 21:55:17'),
(112, '2025-05-21 21:55:34', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:55:34:5534\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"57ms\"}', '2025-05-21 21:55:34'),
(113, '2025-05-21 21:56:18', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/violation\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-22 00:56:18:5618\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"7ms\"}', '2025-05-21 21:56:18'),
(114, '2025-05-21 21:56:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 00:56:28:5628\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"26ms\"}', '2025-05-21 21:56:28'),
(115, '2025-05-21 21:56:40', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/police/actions\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-22 00:56:40:5640\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"3ms\"}', '2025-05-21 21:56:40'),
(116, '2025-05-21 21:56:47', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/actions\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 00:56:47:5647\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"11ms\"}', '2025-05-21 21:56:47'),
(117, '2025-05-21 21:57:29', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:57:29:5729\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"45ms\"}', '2025-05-21 21:57:29'),
(118, '2025-05-21 21:57:31', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"POST\", \"status\": 201, \"timestamp\": \"2025-05-22 00:57:31:5731\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"status\": \"paied\", \"location\": \"Zagazig\", \"description\": \"تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30\", \"action_taken\": \"4\", \"vehicle_plate\": \"CA05LKO\", \"violation_type\": \"1\"}, \"responseTime\": \"40ms\"}', '2025-05-21 21:57:31'),
(119, '2025-05-21 22:06:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA05LKO\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 01:06:27:627\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"51ms\", \"requestParams\": {\"plate_id\": \"CA05LKO\"}}', '2025-05-21 22:06:27'),
(120, '2025-05-21 22:08:42', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA05LKO\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 01:08:42:842\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"83ms\", \"requestParams\": {\"plate_id\": \"CA05LKO\"}}', '2025-05-21 22:08:42'),
(121, '2025-05-21 22:09:13', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/vehicle/CA05LKO\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-22 01:09:13:913\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"85ms\", \"requestParams\": {\"plate_id\": \"CA05LKO\"}}', '2025-05-21 22:09:13');

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
('R44556677', '30010162547893', 'E', 'دكتوراه', 'سوري', '2030-02-18', '2030-02-18', 'العباسية', 'ميدان العباسية'),
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
(2, 'MIL654300', 'Mohamed Dama Fc', 'Second Lieutenant', 'Giza Traffic Department', 'cairo', '2025-05-22 00:30:28', 1, 'mohamedo7x', 1, '$2b$10$doIVrgYqd6WSnXNnCS5c9O30gcD1RXH9IF.6dCHwTRVo0jGKUS4cm', '0569876543', '242a262657ef48b751d9.jpg', '2025-05-18 21:03:37', '2025-05-21 21:30:28');

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
('CA12XYZ', 'تويوتا', 'تويوتا كورولا', 'سيدان', 'JTMBFREV3DJ123456', 'ENG1234567890', 'زجاج مقسى', 'مركبة', '2011'),
('CA24TYU', 'هوندا', 'هوندا CBR', 'دراجة نارية', 'JH2SC59027M012345', 'ENG1234567890', 'زجاج مصفح', 'دراجة نارية', '2015'),
('CA33SYR', 'كاواساكي', 'كاواساكي نينجا', 'دراجة نارية', 'JKBZXJE13MA123456', 'ENG2233445566', 'زجاج مقسى', 'دراجة نارية', '2014'),
('CA34ABC', 'هوندا', 'هوندا جاز', 'هاتشباك', 'JHMGE8H55DC012345', 'ENG0987654321', 'زجاج أكريليك', 'مركبة', '2017'),
('CA38KIA', 'بي إم دبليو', 'بي إم دبليو الفئة الثالثة', 'سيدان', 'WBA3A5C55CF123456', 'ENG2468013579', 'زجاج مقسى', 'مركبة', '1999'),
('CA46DKL', 'هيونداي', 'هيونداي i20', 'هاتشباك', 'KMHHT6KD5DU123456', 'ENG5566778899', 'زجاج أكريليك', 'مركبة', '2007'),
('CA55HJN', 'شيفروليه', 'شيفروليه سيلفرادو', 'بيك أب', '1GCHK23U83F123456', 'ENG9988776655', 'زجاج أكريليك', 'شاحنة نقل', '2005'),
('CA56DEF', 'سوزوكي', 'سوزوكي GSX', 'دراجة نارية', 'JS1GR7MA0D2101234', 'ENG1122334455', 'زجاج مصفح', 'دراجة نارية', '2004'),
('CA67VTR', 'فورد', 'فورد F-150', 'شاحنة نقل', '1FTFW1EF1EKE12345', 'ENG1357924680', 'زجاج أكريليك', 'شاحنة نقل', '2019'),
('CA78GHI', 'مرسيدس', 'مرسيدس أكتروس', 'شاحنة نقل', 'WDB93012345678901', 'ENG6677889900', 'زجاج أكريليك', 'شاحنة نقل', '2022'),
('CA78ROZ', 'مرسيدس', 'مرسيدس فيتو', 'فان', 'WD3PE8CC1E1234567', 'ENG1122334455', 'زجاج مصفح', 'مركبة', '2012'),
('CA80BRQ', 'فولفو', 'فولفو FH12', 'شاحنة نقل', 'YV4A22PK6G1234567', 'ENG6677889900', 'زجاج مقسى', 'شاحنة نقل', '1984'),
('CA90JKL', 'نيسان', 'نيسان فرونتير', 'بيك أب', 'JN1AZ34E47M012345', 'ENG2233445566', 'زجاج مقسى', 'مركبة', '1980'),
('CA91REG', 'تويوتا', 'تويوتا لاندكروزر', 'دفع رباعي', 'JTDBR32E720123456', 'ENG9876543210', 'زجاج مقسى', 'مركبة', '2000');

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
(1, 2, 'CA05LKO', 'Zagazig', 1, 4, 'تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30', 'paied', NULL, '2025-05-21 21:57:29'),
(2, 2, 'CA05LKO', 'Zagazig', 1, 4, 'تسجيل مخالفه بحيث ان الشخص تجاوز السرعه المسموحة في منطقه ممنوع السير بسرعه اكثر من 30', 'paied', NULL, '2025-05-21 21:57:31');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

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
