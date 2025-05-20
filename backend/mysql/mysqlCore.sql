-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql_db
-- Generation Time: May 20, 2025 at 02:51 AM
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
(11, '2025-05-18 22:14:22', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 01:14:22:1422\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"64ms\"}', '2025-05-18 22:14:22'),
(12, '2025-05-18 22:40:07', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 01:40:07:407\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"94ms\"}', '2025-05-18 22:40:07'),
(13, '2025-05-18 22:43:54', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 01:43:54:4354\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"31ms\"}', '2025-05-18 22:43:54'),
(14, '2025-05-18 23:10:33', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:10:33:1033\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"17ms\"}', '2025-05-18 23:10:33'),
(15, '2025-05-18 23:11:42', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:11:42:1142\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"3ms\"}', '2025-05-18 23:11:42'),
(16, '2025-05-18 23:17:35', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:17:34:1734\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"17ms\"}', '2025-05-18 23:17:35'),
(17, '2025-05-18 23:18:33', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:18:33:1833\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"28ms\"}', '2025-05-18 23:18:33'),
(18, '2025-05-18 23:18:43', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:18:43:1843\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"6ms\"}', '2025-05-18 23:18:43'),
(19, '2025-05-18 23:19:56', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:19:56:1956\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"24ms\"}', '2025-05-18 23:19:56'),
(20, '2025-05-18 23:20:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:20:27:2027\", \"responseTime\": \"3ms\"}', '2025-05-18 23:20:27'),
(21, '2025-05-18 23:20:30', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:20:30:2030\", \"responseTime\": \"2ms\"}', '2025-05-18 23:20:30'),
(22, '2025-05-18 23:25:01', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:25:00:250\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"47ms\"}', '2025-05-18 23:25:01'),
(23, '2025-05-18 23:25:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::ffff:127.0.0.1\", \"url\": \"/socket.io/?EIO=4&transport=websocket\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-19 02:25:52:2552\", \"requestQuery\": {\"EIO\": \"4\", \"transport\": \"websocket\"}, \"responseTime\": \"18ms\"}', '2025-05-18 23:25:52'),
(24, '2025-05-18 23:27:10', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 02:27:10:2710\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"132ms\"}', '2025-05-18 23:27:10'),
(25, '2025-05-19 00:08:04', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-19 03:08:04:84\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"requestBody\": {\"password\": \"123123\", \"username\": \"mohamedo7x\"}, \"responseTime\": \"372ms\"}', '2025-05-19 00:08:04'),
(26, '2025-05-19 00:16:54', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 03:16:54:1654\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"66ms\"}', '2025-05-19 00:16:54'),
(27, '2025-05-19 00:18:45', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 03:18:45:1845\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"59ms\"}', '2025-05-19 00:18:45'),
(28, '2025-05-19 00:19:42', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 03:19:41:1941\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"64ms\"}', '2025-05-19 00:19:42'),
(29, '2025-05-19 00:21:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-19 03:21:52:2152\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"67ms\"}', '2025-05-19 00:21:52'),
(30, '2025-05-20 00:06:43', '[32mhttp[39m', '[32mUnauthorized Error[39m', '{\"ip\": \"::1\", \"path\": \"/reports\", \"stack\": \"UnauthorizedError: Token has expired. Please login again.\\n    at validateJWTToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\auth\\\\police_user.access.ts:50:13)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\admin.middleware.ts:33:37\\n    at Generator.next (<anonymous>)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\admin.middleware.ts:8:71\\n    at new Promise (<anonymous>)\\n    at __awaiter (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\admin.middleware.ts:4:12)\\n    at validateAdminToken (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\admin.middleware.ts:26:20)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at Route.dispatch (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:119:3)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"UnauthorizedError\", \"errorType\": \"UnauthorizedError\", \"timestamp\": \"2025-05-20 03:06:43:643\", \"statusCode\": 401, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 00:06:43'),
(31, '2025-05-20 00:06:44', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/reports\", \"method\": \"GET\", \"status\": 401, \"timestamp\": \"2025-05-20 03:06:43:643\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"100ms\"}', '2025-05-20 00:06:44'),
(32, '2025-05-20 00:06:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/login\", \"method\": \"POST\", \"status\": 200, \"timestamp\": \"2025-05-20 03:06:52:652\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"requestBody\": {\"email\": \"mohamedo7x@hotmail.com\", \"password\": \"test@2003\"}, \"responseTime\": \"243ms\"}', '2025-05-20 00:06:52'),
(33, '2025-05-20 00:06:58', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 03:06:58:658\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"31ms\"}', '2025-05-20 00:06:58'),
(34, '2025-05-20 00:19:40', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/admin/29503212568912\", \"method\": \"GET\", \"status\": 404, \"timestamp\": \"2025-05-20 03:19:40:1940\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"61ms\"}', '2025-05-20 00:19:40'),
(35, '2025-05-20 00:21:33', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 03:21:33:2133\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"86ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 00:21:33'),
(36, '2025-05-20 00:22:21', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 03:22:21:2221\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"56ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 00:22:21'),
(37, '2025-05-20 00:23:04', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/2950321256891\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 03:23:04:234\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"22ms\", \"requestParams\": {\"id\": \"2950321256891\"}}', '2025-05-20 00:23:04'),
(38, '2025-05-20 00:23:04', '[32mhttp[39m', '[32mInternal Server Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/admin/2950321256891\", \"stack\": \"Error: Cannot set headers after they are sent to the client\\n    at ServerResponse.setHeader (node:_http_outgoing:699:11)\\n    at ServerResponse.header (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:794:10)\\n    at ServerResponse.send (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:174:12)\\n    at ServerResponse.json (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\response.js:278:15)\\n    at C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:13:22\\n    at Generator.next (<anonymous>)\\n    at fulfilled (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\controller\\\\admin.person.controller.ts:5:58)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"Error\", \"errorType\": \"InternalServerError\", \"timestamp\": \"2025-05-20 03:23:04:234\", \"statusCode\": 500, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 00:23:04'),
(39, '2025-05-20 00:24:28', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/admin/2950321256891\", \"stack\": \"ValidationError: ID must be 14 characters long\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"GET\", \"userId\": null, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-20 03:24:28:2428\", \"statusCode\": 400, \"requestBody\": {}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 00:24:28'),
(40, '2025-05-20 00:24:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/admin/2950321256891\", \"method\": \"GET\", \"status\": 400, \"timestamp\": \"2025-05-20 03:24:28:2428\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"87ms\"}', '2025-05-20 00:24:28'),
(41, '2025-05-20 00:24:38', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 03:24:38:2438\", \"userAgent\": \"PostmanRuntime/7.43.4\", \"responseTime\": \"69ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 00:24:38'),
(42, '2025-05-20 01:52:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 04:52:03:523\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"883ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 01:52:03'),
(43, '2025-05-20 02:22:48', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:22:48:2248\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"178ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:22:48'),
(44, '2025-05-20 02:29:24', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:29:24:2924\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"61ms\"}', '2025-05-20 02:29:24'),
(45, '2025-05-20 02:29:36', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29909012258931\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:29:36:2936\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"34ms\", \"requestParams\": {\"id\": \"29909012258931\"}}', '2025-05-20 02:29:36'),
(46, '2025-05-20 02:30:36', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:30:36:3036\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"134ms\"}', '2025-05-20 02:30:36'),
(47, '2025-05-20 02:31:01', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:31:01:311\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"37ms\"}', '2025-05-20 02:31:01'),
(48, '2025-05-20 02:31:28', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/?page=1&limit=10\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:31:28:3128\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestQuery\": {\"page\": \"1\", \"limit\": \"10\"}, \"responseTime\": \"20ms\"}', '2025-05-20 02:31:28'),
(49, '2025-05-20 02:31:35', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/?page=1&limit=1\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:31:35:3135\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestQuery\": {\"page\": \"1\", \"limit\": \"1\"}, \"responseTime\": \"18ms\"}', '2025-05-20 02:31:35'),
(50, '2025-05-20 02:32:14', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/?page=1&limit=1\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:32:14:3214\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestQuery\": {\"page\": \"1\", \"limit\": \"1\"}, \"responseTime\": \"76ms\"}', '2025-05-20 02:32:14'),
(51, '2025-05-20 02:32:24', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/?page=1&limit=10\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:32:24:3224\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestQuery\": {\"page\": \"1\", \"limit\": \"10\"}, \"responseTime\": \"24ms\"}', '2025-05-20 02:32:24'),
(52, '2025-05-20 02:40:13', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912/criminal-status\", \"method\": \"PUT\", \"status\": 200, \"timestamp\": \"2025-05-20 05:40:13:4013\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"170ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:40:13'),
(53, '2025-05-20 02:40:37', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:40:37:4037\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"39ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:40:37'),
(54, '2025-05-20 02:42:45', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:42:45:4245\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"102ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:42:45'),
(55, '2025-05-20 02:42:49', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912/criminal-status\", \"method\": \"PUT\", \"status\": 200, \"timestamp\": \"2025-05-20 05:42:49:4249\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"criminal_status\": \"1\"}, \"responseTime\": \"37ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:42:49'),
(56, '2025-05-20 02:42:52', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:42:52:4252\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"24ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:42:52'),
(57, '2025-05-20 02:42:59', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912/criminal-status\", \"method\": \"PUT\", \"status\": 200, \"timestamp\": \"2025-05-20 05:42:59:4259\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"criminal_status\": \"0\"}, \"responseTime\": \"48ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:42:59'),
(58, '2025-05-20 02:43:03', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:43:03:433\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"19ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:43:03'),
(59, '2025-05-20 02:43:10', '[32mhttp[39m', '[32mValidation Error[39m', '{\"ip\": \"::1\", \"path\": \"/person/admin/29503212568912/criminal-status\", \"stack\": \"ValidationError: Criminal status is required, Criminal status must be either 0 or 1\\n    at validateRequest (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\src\\\\middleware\\\\validateRequest.ts:13:11)\\n    at Layer.handle [as handle_request] (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\layer.js:95:5)\\n    at next (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express\\\\lib\\\\router\\\\route.js:149:13)\\n    at middleware (C:\\\\Users\\\\alcaptin\\\\Desktop\\\\Traffic\\\\backend\\\\node_modules\\\\express-validator\\\\lib\\\\middlewares\\\\check.js:16:13)\\n    at processTicksAndRejections (node:internal/process/task_queues:105:5)\", \"method\": \"PUT\", \"userId\": null, \"errorName\": \"ValidationError\", \"errorType\": \"ValidationError\", \"timestamp\": \"2025-05-20 05:43:10:4310\", \"statusCode\": 400, \"requestBody\": {\"criminal_status\": \"\"}, \"requestQuery\": {}, \"requestParams\": {}}', '2025-05-20 02:43:10'),
(60, '2025-05-20 02:43:10', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/person/admin/29503212568912/criminal-status\", \"method\": \"PUT\", \"status\": 400, \"timestamp\": \"2025-05-20 05:43:10:4310\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"criminal_status\": \"\"}, \"responseTime\": \"62ms\"}', '2025-05-20 02:43:10'),
(61, '2025-05-20 02:43:19', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912/criminal-status\", \"method\": \"PUT\", \"status\": 200, \"timestamp\": \"2025-05-20 05:43:19:4319\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestBody\": {\"criminal_status\": \"0\"}, \"responseTime\": \"16ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:43:19'),
(62, '2025-05-20 02:43:23', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:43:23:4323\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"15ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:43:23'),
(63, '2025-05-20 02:47:27', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:47:27:4727\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"82ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:47:27'),
(64, '2025-05-20 02:48:19', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/29503212568912\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:48:19:4819\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"responseTime\": \"103ms\", \"requestParams\": {\"id\": \"29503212568912\"}}', '2025-05-20 02:48:19'),
(65, '2025-05-20 02:48:46', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/?page=1&limit=10\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:48:46:4846\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestQuery\": {\"page\": \"1\", \"limit\": \"10\"}, \"responseTime\": \"33ms\"}', '2025-05-20 02:48:46'),
(66, '2025-05-20 02:49:24', '[32mhttp[39m', '[32mHTTP Request[39m', '{\"ip\": \"::1\", \"url\": \"/?page=1&limit=10\", \"method\": \"GET\", \"status\": 200, \"timestamp\": \"2025-05-20 05:49:24:4924\", \"userAgent\": \"PostmanRuntime/7.44.0\", \"requestQuery\": {\"page\": \"1\", \"limit\": \"10\"}, \"responseTime\": \"71ms\"}', '2025-05-20 02:49:24');

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
(2, 'MIL654300', 'Mohamed Dama Fc', 'Second Lieutenant', 'Giza Traffic Department', 'cairo', '2025-05-19 03:08:04', 1, 'mohamedo7x', 0, '$2b$10$doIVrgYqd6WSnXNnCS5c9O30gcD1RXH9IF.6dCHwTRVo0jGKUS4cm', '0569876543', '242a262657ef48b751d9.jpg', '2025-05-18 21:03:37', '2025-05-19 00:08:04');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
