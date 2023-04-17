-- phpMyAdmin SQL Dump
-- version 4.9.11
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 13, 2023 at 09:47 PM
-- Server version: 5.7.23-23
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sobkisub_daily_report`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_12_29_235615_create_permission_tables', 1),
(6, '2021_12_30_232734_create_organizations_table', 1),
(7, '2022_01_03_204925_create_products_table', 1),
(8, '2022_01_05_202952_create_tickets_table', 1),
(9, '2022_01_06_184442_create_statuses_table', 1),
(10, '2022_02_17_182451_add_column_device_token', 1),
(11, '2022_02_23_182426_create_notifications_table', 1),
(12, '2022_02_24_230340_create_ticket_images_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(3, 'App\\Models\\User', 2),
(3, 'App\\Models\\User', 3),
(3, 'App\\Models\\User', 4),
(4, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 6),
(5, 'App\\Models\\User', 7),
(6, 'App\\Models\\User', 9),
(7, 'App\\Models\\User', 10),
(6, 'App\\Models\\User', 11),
(6, 'App\\Models\\User', 12),
(8, 'App\\Models\\User', 12),
(6, 'App\\Models\\User', 13),
(11, 'App\\Models\\User', 13),
(12, 'App\\Models\\User', 14),
(4, 'App\\Models\\User', 15),
(13, 'App\\Models\\User', 16);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_seen` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `organizations`
--

CREATE TABLE `organizations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `organizations`
--

INSERT INTO `organizations` (`id`, `name`, `short_name`, `address`, `created_at`, `updated_at`) VALUES
(2, 'Sobkisu Bazar', 'SB', 'Bangla motor , 1207', '2023-04-01 07:03:10', '2023-04-01 07:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `created_at`, `updated_at`) VALUES
(1, 'admin-dashboard.view', 'web', 'admin-dashboard', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(2, 'client-dashboard.view', 'web', 'client-dashboard', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(3, 'users.list', 'web', 'users', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(4, 'users.create', 'web', 'users', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(5, 'users.show', 'web', 'users', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(6, 'users.edit', 'web', 'users', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(7, 'users.update', 'web', 'users', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(8, 'users.destroy', 'web', 'users', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(9, 'roles.list', 'web', 'roles', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(10, 'roles.create', 'web', 'roles', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(11, 'roles.edit', 'web', 'roles', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(12, 'roles.update', 'web', 'roles', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(13, 'roles.destroy', 'web', 'roles', '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(14, 'permissions.list', 'web', 'permissions', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(15, 'permissions.create', 'web', 'permissions', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(16, 'permissions.edit', 'web', 'permissions', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(17, 'permissions.update', 'web', 'permissions', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(18, 'permissions.destroy', 'web', 'permissions', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(19, 'admin-tickets.list', 'web', 'admin-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(20, 'admin-tickets.create', 'web', 'admin-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(21, 'admin-tickets.edit', 'web', 'admin-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(22, 'admin-tickets.update', 'web', 'admin-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(23, 'admin-tickets.show', 'web', 'admin-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(24, 'admin-tickets.destroy', 'web', 'admin-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(25, 'client-tickets.list', 'web', 'client-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(26, 'client-tickets.create', 'web', 'client-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(27, 'client-tickets.edit', 'web', 'client-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(28, 'client-tickets.update', 'web', 'client-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(29, 'client-tickets.show', 'web', 'client-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(30, 'client-tickets.destroy', 'web', 'client-ticket', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(31, 'report.list', 'web', 'report', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(32, 'menu.show', 'web', 'menu', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(33, 'organization.list', 'web', 'organization', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(34, 'organization.create', 'web', 'organization', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(35, 'organization.edit', 'web', 'organization', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(36, 'organization.update', 'web', 'organization', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(37, 'organization.destroy', 'web', 'organization', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(38, 'product.list', 'web', 'product', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(39, 'product.create', 'web', 'product', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(40, 'product.edit', 'web', 'product', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(41, 'product.update', 'web', 'product', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(42, 'product.destroy', 'web', 'product', '2023-02-02 03:27:26', '2023-02-02 03:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `organization_id` tinyint(4) NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `organization_id`, `user_id`, `name`, `short_name`, `description`, `url`, `email_cc`, `image`, `created_at`, `updated_at`) VALUES
(2, 2, 5, 'Sobkisu Bazar', 'SB', NULL, 'https://sobkisubazar.com/', NULL, '1680339848.png', '2023-04-01 07:04:08', '2023-04-01 07:04:08');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_internal` tinyint(4) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `is_internal`, `description`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'web', 0, NULL, '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(2, 'Client', 'web', 0, NULL, '2023-02-02 03:27:25', '2023-02-02 03:27:25'),
(3, 'Designer', 'web', 1, 'Graphics, Motion & 3D, Video', '2023-02-02 03:31:05', '2023-04-04 13:51:20'),
(4, 'Web Developer', 'web', 1, 'Web Development (Backend & Frontend)', '2023-02-02 03:35:48', '2023-04-04 13:50:25'),
(5, 'Digital Marketer', 'web', 1, 'Digital marketer', '2023-02-02 03:42:36', '2023-02-02 03:42:36'),
(6, 'Admin', 'web', 1, 'Hello there !!!', '2023-02-02 09:43:42', '2023-02-02 09:43:42'),
(7, 'Customer Relation Manager', 'web', 1, 'handling  all  inbound and outbound call  to customer and seller', '2023-04-01 06:37:15', '2023-04-04 13:49:05'),
(8, 'Marketing Officer', 'web', 1, 'target  seller on board', '2023-04-01 07:28:16', '2023-04-04 13:50:42'),
(11, 'Head of IT', 'web', 1, 'Head of IT Department', '2023-04-02 03:59:07', '2023-04-04 13:48:07'),
(12, 'Brand Promoter', 'web', 1, 'target seller on board', '2023-04-04 14:07:41', '2023-04-04 14:08:01'),
(13, 'Photographer', 'web', 1, NULL, '2023-04-10 13:44:04', '2023-04-10 13:44:04');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
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
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(2, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(30, 2),
(1, 3),
(19, 3),
(21, 3),
(22, 3),
(23, 3),
(24, 3),
(1, 4),
(19, 4),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(1, 5),
(19, 5),
(21, 5),
(22, 5),
(23, 5),
(24, 5),
(1, 6),
(2, 6),
(3, 6),
(4, 6),
(5, 6),
(6, 6),
(7, 6),
(8, 6),
(9, 6),
(10, 6),
(11, 6),
(12, 6),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(17, 6),
(18, 6),
(19, 6),
(20, 6),
(21, 6),
(22, 6),
(23, 6),
(24, 6),
(25, 6),
(26, 6),
(27, 6),
(28, 6),
(29, 6),
(30, 6),
(32, 6),
(33, 6),
(34, 6),
(35, 6),
(36, 6),
(37, 6),
(38, 6),
(39, 6),
(40, 6),
(41, 6),
(42, 6),
(1, 7),
(19, 7),
(21, 7),
(22, 7),
(23, 7),
(24, 7),
(1, 8),
(19, 8),
(21, 8),
(22, 8),
(23, 8),
(24, 8),
(1, 11),
(2, 11),
(3, 11),
(4, 11),
(5, 11),
(6, 11),
(7, 11),
(8, 11),
(9, 11),
(10, 11),
(11, 11),
(12, 11),
(13, 11),
(14, 11),
(15, 11),
(16, 11),
(17, 11),
(18, 11),
(19, 11),
(20, 11),
(21, 11),
(22, 11),
(23, 11),
(24, 11),
(25, 11),
(26, 11),
(27, 11),
(28, 11),
(29, 11),
(30, 11),
(31, 11),
(32, 11),
(33, 11),
(34, 11),
(35, 11),
(36, 11),
(37, 11),
(38, 11),
(39, 11),
(40, 11),
(41, 11),
(42, 11),
(1, 12),
(19, 12),
(21, 12),
(22, 12),
(23, 12),
(24, 12),
(1, 13),
(19, 13),
(21, 13),
(22, 13),
(23, 13);

-- --------------------------------------------------------

--
-- Table structure for table `statuses`
--

CREATE TABLE `statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `statuses`
--

INSERT INTO `statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Closed', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(2, 'Created', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(3, 'Resolved', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(4, 'Inprogress', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(5, 'Postponed', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(6, 'Rejected', '2023-02-02 03:27:26', '2023-02-02 03:27:26'),
(7, 'Feedback', '2023-02-02 03:27:26', '2023-02-02 03:27:26');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` tinyint(4) NOT NULL,
  `raised_by` tinyint(4) DEFAULT NULL,
  `product_id` tinyint(4) NOT NULL,
  `organization_id` tinyint(4) DEFAULT NULL,
  `approved` tinyint(4) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ticket_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` char(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `priority` char(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` tinyint(4) NOT NULL,
  `inprogress_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raising_date` date DEFAULT NULL,
  `ticket_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `related_ticket_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `root_cause` text COLLATE utf8mb4_unicode_ci,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tickets`
--

INSERT INTO `tickets` (`id`, `user_id`, `raised_by`, `product_id`, `organization_id`, `approved`, `title`, `details`, `ticket_code`, `type`, `priority`, `status_id`, `inprogress_type`, `url`, `raising_date`, `ticket_number`, `related_ticket_id`, `comment`, `root_cause`, `start_date`, `end_date`, `time`, `created_at`, `updated_at`) VALUES
(10, 5, 9, 2, NULL, 1, 'makeingg some  API', '<p>SELLER API GLOBAL MARKET API DAILY&nbsp; REPORT SOFTWARE MAKING AND BACKEND FINAL REPORT&nbsp;</p>', 'SP-SB-5', 'E', 'U', 1, NULL, NULL, '2023-04-02', NULL, NULL, NULL, NULL, '2023-04-02', '2023-04-02', 'THREE HOURS', '2023-04-02 07:05:19', '2023-04-09 14:45:51'),
(11, 13, 9, 2, NULL, 1, 'LIVE  AND ENTERTAINMENT', '<p>LIVE BUTTON ACTIVATION ENTERTAINMENT BUTTON ACTIVATION</p>', 'SP-SB-6', 'E', 'U', 1, NULL, NULL, '2023-04-02', 'Reviewed', NULL, NULL, NULL, '2023-04-02', '2023-04-02', 'FIVE HOURS', '2023-04-02 07:20:59', '2023-04-09 13:46:43'),
(12, 6, 9, 2, NULL, 1, 'WEB SITE FINAL REPORT', 'WEBSITE FRONTEND FINAL REPORT (Home Page)', 'SP-SB-7', 'E', 'U', 1, NULL, NULL, '2023-04-02', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-02', '2023-04-02', 'FIVE HOURS', '2023-04-02 07:24:22', '2023-04-09 14:46:41'),
(13, 7, 9, 2, NULL, 1, 'Report Submission: SEO', '<p>ALL SEO REPORT FROM THE BEGINNING TILL NOW</p>', 'SP-SB-8', 'E', 'U', 1, NULL, NULL, '2023-04-02', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-02', '2023-04-02', 'FIVE HOURS', '2023-04-02 07:59:46', '2023-04-09 13:17:00'),
(14, 4, 9, 2, NULL, 1, 'Eid offer motion shop base product base', 'motion development for all of the product and shop base', 'SP-SB-9', 'E', 'U', 1, NULL, 'https://drive.google.com/drive/folders/1mPBNzGP3iiz5czgYHpu6lyH1hLBmSLwR', '2023-04-02', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-02', '2023-04-02', '6 hours', '2023-04-02 08:08:49', '2023-04-09 14:26:46'),
(15, 3, 9, 2, NULL, 1, 'EID OFFER MOTION  ON PRODUCT AND  SHOP BASE', 'motion development for all of the product and shop base', 'SP-SB-10', 'E', 'U', 1, NULL, NULL, '2023-04-02', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-02', '2023-04-02', '7 hours', '2023-04-02 08:20:38', '2023-04-09 14:37:00'),
(16, 2, 9, 2, NULL, 1, 'PRODUCT EDITING FOR SUPREME', '<p>PRODUCT EDITING FOR SUPREME</p><p><br></p><p><br></p>', 'SP-SB-11', 'E', 'N', 1, NULL, NULL, '2023-04-02', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-02', '2023-04-02', '7 hours', '2023-04-02 08:27:52', '2023-04-13 09:46:33'),
(17, 13, 9, 2, NULL, 1, 'Web Development - Live & Entertainment Section', '<p>you will work on these two option live and entertainment complete it today and deliver it to me&nbsp;</p>', 'SP-SB-12', 'E', 'U', 1, NULL, NULL, '2023-04-03', 'Reviewed', NULL, NULL, NULL, '2023-04-03', '2023-04-03', 'two hours', '2023-04-03 04:09:37', '2023-04-09 13:46:34'),
(18, 12, 9, 2, NULL, 1, 'marketing', '<p>all the sellers who are on board with us have to go there a showroom today and download the apps on their mobiles and you must complete this task today</p>', 'SP-SB-13', 'E', 'U', 4, NULL, NULL, '2023-04-03', NULL, NULL, NULL, NULL, '2023-04-03', '2023-04-03', 'six hours', '2023-04-03 04:42:02', '2023-04-09 11:19:11'),
(19, 6, 9, 2, NULL, 1, 'website reporting', '<p>&nbsp;the website frontend report&nbsp; you have to be must complete this task today</p>', 'SP-SB-14', 'E', 'U', 1, NULL, NULL, '2023-04-03', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-03', '2023-04-03', '0ne hours', '2023-04-03 05:26:47', '2023-04-09 14:46:47'),
(20, 7, 9, 2, NULL, 1, 'reports digital marketing', '<p>you will provide me with all of the digital marketing reports about the Sobkisu Bazar marketplace.<br></p><p><br></p><p><br></p>', 'SP-SB-15', 'E', 'U', 1, NULL, NULL, '2023-04-03', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-03', '2023-04-03', 'one hours', '2023-04-03 06:23:14', '2023-04-09 13:17:11'),
(22, 5, 9, 2, NULL, 1, 'Report (Backend Part of Sobkisu Bazar)', '<p>All function checking (including logistics, Payment Gateway, API, &amp; Others) from the backend.&nbsp;</p><p>today i am discuss about new web developer with logistic&nbsp;</p><p>and tomorrow make api&nbsp;</p><p><br></p>', 'SP-SB-17', 'E', 'U', 1, NULL, NULL, '2023-04-04', 'Reviewed', NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-04 07:44:26', '2023-04-13 09:46:18'),
(23, 5, 9, 2, NULL, 1, 'Notification & Email Checking (Purchasing Products)', '<p>Email &amp; Notification Checking from the account of the Seller, Customer, Logistics, and Marketplace.</p>', 'SP-SB-18', 'E', 'N', 1, NULL, NULL, '2023-04-04', 'Reviewed', NULL, NULL, NULL, '2023-04-05', '2023-04-05', '1 day', '2023-04-04 07:55:06', '2023-04-13 09:46:13'),
(24, 5, 9, 2, NULL, 1, 'Mobile App', '<p>1. Completing the Language API task</p><p>2. Submitting the last update of our mobile app</p><p>3. Mobile App other API</p>', 'SP-SB-19', 'E', 'N', 1, NULL, NULL, '2023-04-04', 'Reviewed', NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-04 07:59:08', '2023-04-13 09:46:05'),
(25, 6, 9, 2, NULL, 1, 'Bug Fixing', '<p>Fixing all bugs which will be assigned by the head of IT.<span style=\"font-size: 0.875em;\">&nbsp;Daily 2-3 hours for this task.&nbsp;</span></p>', 'SP-SB-20', 'E', 'N', 4, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-04', NULL, NULL, '2023-04-04 08:01:25', '2023-04-08 23:26:44'),
(26, 6, 9, 2, NULL, 1, 'Adstore Development', '<p>Develop the subdomain every day. Daily 3-4 hours for this task.&nbsp;</p>', 'SP-SB-21', 'E', 'N', 4, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-04', NULL, NULL, '2023-04-04 08:03:40', '2023-04-04 08:17:35'),
(27, 2, 9, 2, NULL, 1, '15p Hero Banner (New)', '<p>Queue: 3</p><p>It will create 15 categories. It will be a Seller and Customer attractive banner.&nbsp;</p><p>Content &amp; Image Choosing: Yourself</p>', 'SP-SB-22', 'E', 'N', 1, NULL, NULL, '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-12', '3 days', '2023-04-04 08:09:29', '2023-04-13 14:10:23'),
(28, 5, 9, 2, NULL, 1, 'Adstore Development', '<p>&nbsp; work with filtering</p>', 'SP-SB-23', 'E', 'N', 4, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-04', NULL, NULL, '2023-04-04 08:13:21', '2023-04-13 09:45:58'),
(29, 2, 9, 2, NULL, 1, 'New Banner Design for Platinum Section - 5-6p', '<p>Queue: 2</p><p>The previous Design will be changed and the Content will not be changed.&nbsp;</p><p>Image Choosing: Yourself</p>', 'SP-SB-24', 'E', 'N', 2, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-05', '2023-04-12', '3 days', '2023-04-04 08:25:00', '2023-04-09 14:18:04'),
(30, 2, 9, 2, NULL, 1, 'Icon for Global Market', '<p>- 1p (colourful)</p><p>Queue: 1</p>', 'SP-SB-25', 'E', 'U', 1, NULL, NULL, '2023-04-04', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-05', '2023-04-05', '1 day', '2023-04-04 08:26:32', '2023-04-09 14:16:08'),
(31, 2, 9, 2, NULL, 1, 'Corporate Banner - 6p', '<p>Content Writing: Mr Arif</p><p>Content Related:&nbsp;Bluebell Tex, Blue Ex, Rony Fabrics,&nbsp;<span style=\"font-size: 0.875em;\">Hamza Trading, Wafi Trading, Enrich IT Solution</span></p><p>Queue: 4</p>', 'SP-SB-26', 'E', 'N', 2, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-05', '2023-04-12', '3 days', '2023-04-04 08:30:33', '2023-04-09 14:13:51'),
(33, 7, 9, 2, NULL, 1, 'Content Writting - 12p', '<p>Content Provide to Mr Imran &amp; Mr Sourave.<br></p><p>Content Related to</p><p>(6p) Bluebell Tex, Blue Ex, Rony Fabrics, Hamza Trading, Wafi Trading, Enrich IT Solution</p><p>(6p) for Adstore</p><p>-----------------------------------------------------------------------------------------------------------<br></p><p>Please check the Content-<br></p><p>Hamza Trading------</p><p>*Connect with Globel Buyers &amp; Seller<br></p><p>*Get the Support you need to connect Globally</p><p><br></p><p>Bluebell Tex------------</p><p>*A Leader in the Garment Manufacturing Industry</p><p>*Your Partner for Success in the Garment Industry</p><p>*The Garment Manufacturer &amp; Exporter Globally You Can Trust</p><p>*A Commitment to Quality and Excellence in Garment Manufacturing</p><p><br></p><p>Rony Febrics--</p><p>*Good looking Bedsheets Made to Your Specifications</p><p>*The Best Bedsheets for a Good Night\'s Sleep</p><p>*High-Quality Bedsheets at Competitive Prices</p><p>*Our Bedsheets Are the Secret to a Good Night\'s Sleep</p><p>*Dream in Style with Our Bedsheets</p><p>*Make Your Bedtime a Luxurious Experience</p><p>*Our Bedsheets Will Make You Sleep Like a Baby</p><p>*Wake Up Feeling Refreshed and Rejuvenated</p><p>*Treat Yourself to the Best Bedsheets You\'ll Ever Own</p><p>*Invest in Your Sleep and Feel the Difference</p><p><br></p><p>Enrich IT-------------------<br></p><p>*We will do for your Future</p><p>*A Dedicated IT Service Provider</p><p>*We Make your Business Ready</p><p>&nbsp;</p><p>Ad Store-------(ALL)</p><p>*Reach your targeted audience with SkB ADStore</p><p><br></p><p>Ad Store---------------(Seller)</p><p>*Advertise your Product and increase sales with SKB ADStore&nbsp;</p><p><br></p><p>Ad Store---------------(Corporate)</p><p>*Grow your Business with SkB ADStore</p><p>*Advertise your Business to Reach more with SKB ADStore</p><p>*Boost your Business on SKB ADStore</p><p><br></p><p>Buy &amp; Sell-----------------<br></p><p>*Sell your Second-Hand Product faster</p>', 'SP-SB-28', 'E', 'N', 1, NULL, NULL, '2023-04-04', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-05', '2023-04-05', '3 hours', '2023-04-04 08:33:49', '2023-04-09 13:18:02'),
(34, 3, 9, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.&nbsp;</p><p>Content: Offer based</p>', 'SP-SB-29', 'E', 'N', 1, NULL, NULL, '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-05', '1 day', '2023-04-04 08:37:41', '2023-04-09 14:42:39'),
(35, 4, 9, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.</p>', 'SP-SB-30', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/1mPBNzGP3iiz5czgYHpu6lyH1hLBmSLwR', '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-05', '1 day', '2023-04-04 08:38:25', '2023-04-09 14:26:54'),
(37, 2, 9, 2, NULL, 1, 'Sub-Cat Icon (everyday)', '<p>Collection &amp; Resizing</p>', 'SP-SB-32', 'E', 'N', 4, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-05', NULL, NULL, '2023-04-04 08:41:15', '2023-04-09 14:11:05'),
(38, 2, 9, 2, NULL, 1, 'Banner for Adstore Section - 6p', '<p>According to our business policy, merchants will be interested to provide their ads.&nbsp;</p><p>Content: Arif</p><p>Queue: 5</p>', 'SP-SB-33', 'E', 'N', 2, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-05', '2023-04-11', '3 days', '2023-04-04 08:43:19', '2023-04-09 14:10:17'),
(39, 7, 9, 2, NULL, 1, 'Paid marketing', '<p>&nbsp;Search Ads, Social Media Marketing</p><p>(q3)</p>', 'SP-SB-34', 'E', 'N', 4, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-04 08:44:52', '2023-04-05 06:55:19'),
(40, 7, 9, 2, NULL, 1, 'SEO with Collecting Backlinks (Daily)', '<p>(q2)</p><p><br></p><p>Here are all Data of Backlinks that I created after researching and updating daily.</p><p>https://docs.google.com/spreadsheets/d/1X5hw40TdDuHrFycoNVjc6LTUn3tlXpMS6UnN3lsYPgc/edit?usp=sharing<br></p><p><br></p>', 'SP-SB-35', 'E', 'N', 1, NULL, NULL, '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-10', '6 days', '2023-04-04 08:45:59', '2023-04-13 09:49:10'),
(41, 7, 9, 2, NULL, 1, 'Report Submission: Social Media Marketing', '<p>&nbsp;last 6 Months\' overall report will be included.&nbsp;</p><p><br></p><p>All the Reports for Social Media-</p><p><a href=\"https://drive.google.com/drive/folders/1ik_8v7aG3s5eSv5DNPC7eCMQ8uP8XFVE?usp=share_link\" target=\"_blank\">https://drive.google.com/drive/folders/1ik_8v7aG3s5eSv5DNPC7eCMQ8uP8XFVE?usp=share_link</a></p><p><br></p><p>Youtube-&nbsp; Reach- 30,500</p><p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Clicks- 2500</p><p>Tiktok- Reach- 3000+ Reach</p>', 'SP-SB-36', 'E', 'U', 1, NULL, NULL, '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-04 08:48:28', '2023-04-09 13:17:16'),
(42, 7, 9, 2, NULL, 1, 'Report Submission: Content Writing', '<p>last 6 Months\' overall report will be included. The file will be attached here.</p><p>-------------------------------------------------------------------------------------------------------------------</p><p>It is Not Possible that I will provide the last 6-month articles&nbsp; (Content Writing)</p><p>Here are some ideas about my Content Writing-</p><p>Write at least 15 Mother Category Meta Title and Description after keyword research</p><p>Up to 120 Sub-category&nbsp;<span style=\"font-size: 0.875em;\"><b>Meta Title and Description after keyword research</b></span></p><p><span style=\"font-size: 0.875em;\"><b>Product Meta title and Description (Help product lister)</b></span></p><p>And Daily Provide content to Designer and also feel another job <span style=\"font-size: 12.25px;\">content need</span></p><p><br></p><p><br></p><p><br></p>', 'SP-SB-37', 'E', 'U', 1, NULL, NULL, '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-04 08:49:50', '2023-04-09 13:17:22'),
(44, 7, 9, 2, NULL, 1, 'Report Submission: Paid Marketing', '<p>&nbsp;last 6 Months\' overall report will be included.</p><p><br></p><p>No task has been completed.&nbsp;</p><p><br></p><p><br></p>', 'SP-SB-39', 'E', 'U', 6, NULL, NULL, '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-05', '2 days', '2023-04-04 08:52:20', '2023-04-09 13:17:26'),
(45, 7, 9, 2, NULL, 1, 'Report Submission: Email Research & Marketing', '<p>&nbsp;last 6 Months overall report will be included</p><p>----------------------------------------------------------</p><p>Almost 30k Email has been collected</p>', 'SP-SB-40', 'E', 'U', 1, NULL, NULL, '2023-04-04', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-04 08:53:36', '2023-04-09 13:17:32'),
(46, 13, 9, 2, NULL, 1, 'Report - DBID', '<p>&nbsp;Submitted. They are not responded yet.&nbsp;</p>', 'SP-SB-41', 'E', 'U', 1, NULL, NULL, '2023-04-04', 'Reviewed', NULL, NULL, NULL, '2023-04-05', '2023-04-05', '1 hour', '2023-04-04 08:54:54', '2023-04-09 13:42:15'),
(47, 13, 9, 2, NULL, 1, 'eCab Necessary documents Collection', '<p></p><p><span style=\"text-align: justify; background-color: transparent; font-size: 11pt; font-family: Merriweather, serif; color: rgb(68, 68, 68); font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\">All papers are collected except<br></span></p><span id=\"docs-internal-guid-a513eb0a-7fff-8174-96e7-9ab27b231f58\"><span style=\"font-size: 11pt; font-family: Merriweather, serif; color: rgb(68, 68, 68); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\">1. </span><span style=\"font-size: 11pt; font-family: Merriweather, serif; color: rgb(255, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\">*</span><span style=\"font-size: 11pt; font-family: Merriweather, serif; color: rgb(68, 68, 68); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"> Any e-CAB Member Reference</span></span><p></p><p><span id=\"docs-internal-guid-a513eb0a-7fff-8174-96e7-9ab27b231f58\"><span style=\"font-family: Merriweather, serif; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><span id=\"docs-internal-guid-99b455c2-7fff-d4dd-d9dc-780fd8fb518b\" style=\"\"><span style=\"background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\"><font color=\"#000000\">2</font></span><span style=\"color: rgb(68, 68, 68); font-size: 11pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">. Passport Copy 1p - </span><span style=\"color: rgb(68, 68, 68); font-size: 9pt; background-color: transparent; font-style: italic; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Scan copy of a colour image</span></span></span></span></p><p><span style=\"background-color: transparent; font-size: 11pt; color: rgb(68, 68, 68); font-family: Merriweather, serif; white-space: pre-wrap;\">3. </span><span id=\"docs-internal-guid-e80c66a1-7fff-dacc-82e7-b20a7e4a5359\" style=\"background-color: transparent; font-size: 11pt; color: rgb(68, 68, 68); font-family: Merriweather, serif; white-space: pre-wrap;\"><span style=\"font-size: 11pt; background-color: transparent; font-weight: 700; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Partnership -  </span><span style=\"font-size: 11pt; color: rgb(255, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Board Resolution</span></span><br></p>', 'SP-SB-42', 'E', 'U', 1, NULL, NULL, '2023-04-04', 'Reviewed', NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-04 08:55:39', '2023-04-11 12:58:15'),
(48, 13, 9, 2, NULL, 1, 'Bug Fixing', '<p>The combined task with Ms Nitu</p>', 'PR-SB-43', 'P', 'N', 4, NULL, NULL, '2023-04-04', NULL, NULL, NULL, NULL, '2023-04-05', NULL, NULL, '2023-04-04 08:57:06', '2023-04-04 08:57:06'),
(49, 13, 9, 2, NULL, 1, 'Report on Sobkisubazar (Overall)', '<p>with Bug finding</p>', 'SP-SB-44', 'E', 'U', 5, NULL, NULL, '2023-04-04', 'Postponed', NULL, NULL, NULL, '2023-04-05', '2023-04-08', '3 days', '2023-04-04 08:58:29', '2023-04-09 13:40:52'),
(50, 4, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-45', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/1mPBNzGP3iiz5czgYHpu6lyH1hLBmSLwR', '2023-04-06', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-06', '2023-04-06', '1 day', '2023-04-06 02:04:25', '2023-04-09 14:27:43'),
(51, 3, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-46', 'E', 'N', 1, NULL, NULL, '2023-04-06', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-06', '2023-04-06', '1 day', '2023-04-06 02:08:04', '2023-04-09 14:44:12'),
(52, 2, 13, 2, NULL, 1, 'Marketing Profile', '<p>&nbsp;Got a revision</p>', 'CR-SB-47', 'P', 'U', 1, NULL, NULL, '2023-04-06', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-05', '2023-04-09', '3 days', '2023-04-06 02:12:08', '2023-04-13 09:52:40'),
(53, 13, 13, 2, NULL, 1, 'MRT (Banglalink, Email Creation, Presentation, Task Allocation, Approval, CV Collect, Mail Monitoring, Appointment Letter)', '<p>1. Banglalink - All done</p><p>2. Email Creation - Mrs Sazia &amp; Mr Al Jaber Sumon have received the official mail</p><p>3. Presentation: Described our business to Marketing Team</p><p>4.&nbsp;Task Allocation: Done</p><p>5. Approval: Done (19p)</p><p>6. CV Collect: 2 new CVs have been received</p><p>7.&nbsp;Mail Monitoring: Done</p><p>8.&nbsp;Appointment Letter: 4 persons (Mrs Sazia, Mr&nbsp; Al Jaber, Mr Rakan, Mr Jahid</p>', 'SP-SB-48', 'E', 'N', 1, NULL, NULL, '2023-04-06', 'Reviewed', NULL, NULL, NULL, '2023-04-05', '2023-04-06', '2 days', '2023-04-06 02:52:39', '2023-04-09 13:39:49'),
(54, 6, 13, 2, NULL, 1, 'Frontend Task', '<p><span id=\"docs-internal-guid-980f4572-7fff-90c6-8291-6309b1400523\"><span style=\"font-size: 11pt; font-family: Merriweather, serif; color: rgb(68, 68, 68); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\">Our Trade License copy must be shown on the website.</span></span><br></p>', 'SP-SB-49', 'E', 'U', 1, NULL, NULL, '2023-04-06', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-06', '2023-04-06', '1 hour', '2023-04-06 02:57:51', '2023-04-09 14:46:52'),
(56, 13, 13, 2, NULL, 1, 'MRT (Mutual Trust Registration, Email Creation, Task Allocation, Approval, CV Collect, Mail Monitoring, Appointment Letter)', '<p>1. Mutual Trust Registration: Submitted to HR Admin</p><p>2 Task Allocation: Yes</p><p>3. Approval: Done (4p)</p><p>4. CV Collect: 1 new CV has been received</p><p>5.&nbsp;Mail Monitoring: Yes</p><p>6.&nbsp;Appointment Letter: 1 person (Mr Zia). Not Forwarded yet for lacking info from HR Admin</p>', 'SP-SB-51', 'E', 'N', 1, NULL, NULL, '2023-04-08', 'Reviewed', NULL, NULL, NULL, '2023-04-08', '2023-04-08', '1 day', '2023-04-08 03:35:45', '2023-04-09 13:36:01'),
(57, 4, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-52', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/1mPBNzGP3iiz5czgYHpu6lyH1hLBmSLwR', '2023-04-08', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-08', '2023-04-08', '1 day', '2023-04-08 05:03:03', '2023-04-09 14:27:48'),
(58, 3, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.</p><p><br></p><p>------------------------------</p><p>08/09/2023 </p><p>today Offer motion&nbsp; templet make&nbsp;</p>', 'SP-SB-53', 'E', 'N', 1, NULL, NULL, '2023-04-08', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-08', '2023-04-08', '1 day', '2023-04-08 05:03:39', '2023-04-13 09:53:12'),
(59, 13, 13, 2, NULL, 1, 'Report on Android Mobile App', '<p>Submitted</p>', 'SP-SB-54', 'E', 'N', 1, NULL, NULL, '2023-04-08', 'Reviewed', NULL, NULL, NULL, '2023-04-08', '2023-04-08', '30min', '2023-04-08 14:48:07', '2023-04-09 13:35:25'),
(60, 4, 13, 2, NULL, 1, 'Motion - Pahela Baishakh - 1p', '<p>Motion Video according to the instruction of Mosiul Alam Sohag</p><p>20-30 seconds</p>', 'SP-SB-55', 'E', 'U', 1, NULL, NULL, '2023-04-08', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-09', '2023-04-11', '3 days', '2023-04-08 14:56:27', '2023-04-13 09:53:20'),
(61, 5, 13, 2, NULL, 1, 'Logistic API Checking', '<p>&nbsp;</p>', 'PR-SB-56', 'P', 'U', 1, NULL, NULL, '2023-04-08', 'Reviewed', NULL, NULL, NULL, '2023-04-08', '2023-04-08', '1 day', '2023-04-08 14:57:40', '2023-04-13 09:53:25'),
(62, 13, 13, 2, NULL, 1, 'Admin access to sobkisubazar website', '<p>Admin access to Sobkisubazar website -&nbsp; list<br></p>', 'SP-SB-57', 'E', 'N', 5, NULL, NULL, '2023-04-08', 'Pending for the approval of HRA', NULL, NULL, NULL, '2023-04-08', '2023-04-09', '2 days', '2023-04-08 16:12:52', '2023-04-09 13:47:10'),
(63, 13, 13, 2, NULL, 1, 'Email Creation, iMap-Pop3 Mapping', '<p>&nbsp;Done</p>', 'SP-SB-58', 'E', 'U', 1, NULL, NULL, '2023-04-08', 'Reviewed', NULL, NULL, NULL, '2023-04-08', '2023-04-09', '3 hours', '2023-04-08 16:16:57', '2023-04-09 13:24:41'),
(64, 13, 13, 2, NULL, 1, 'MRT (Email Creation, Approval, Mail Monitoring, Web Training, Appointment Letter, Documents Submission)', '<p>1. Email Creation -&nbsp; Mr Zia has received the official mail.<br></p><p>2. Approval: Done (2p)</p><p>3.&nbsp;Mail Monitoring: Yes</p><p>4. Web Training: Mrs Sazia has received her account using instructions</p><p>5.&nbsp;Appointment Letter: 1 (Mr Zia)</p><p>6. Documents Submission: Mr Zia &amp; Mrs Sazia have submitted their documents.</p><p><br></p>', 'SP-SB-59', 'E', 'N', 1, NULL, NULL, '2023-04-09', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-09', '2 hours', '2023-04-09 11:13:51', '2023-04-09 13:24:16'),
(65, 7, 13, 2, NULL, 1, 'Social Media Manage (Regular)', '<p>Manage: Facebook, Youtube, Instagram, Twitter, Pinterest, Linkedin, Tiktok</p>', 'SP-SB-56', 'E', 'N', 1, NULL, NULL, '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-01', '2023-04-10', '10 days', '2023-04-09 11:23:29', '2023-04-10 11:18:48'),
(66, 13, 13, 2, NULL, 1, 'MRT (Task Allocation, Task Review)', '<p>Task Allocation: Newly 13 tasks assigned</p><p>Task Review: last 9 days, all task (<span style=\"font-size: 0.875em;\">50+ tasks)</span>&nbsp;has been reviewed</p>', 'SP-SB-56', 'E', 'N', 1, NULL, NULL, '2023-04-09', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-09', '2 hours', '2023-04-09 13:22:19', '2023-04-09 14:53:16'),
(67, 10, 13, 2, NULL, 1, 'Contact with Customers', '<p>Update: A meeting has been fixed with 13 customers.&nbsp;</p>', 'SP-SB-57', 'E', 'U', 4, NULL, NULL, '2023-04-09', NULL, NULL, NULL, NULL, '2023-04-04', '2023-04-08', '4 days', '2023-04-09 13:51:22', '2023-04-13 15:19:07'),
(68, 10, 13, 2, NULL, 1, 'Content Writing - 4p', '<p>Submitted to HRA</p>', 'SP-SB-58', 'E', 'U', 1, NULL, NULL, '2023-04-09', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-08', '2023-04-09', '2 days', '2023-04-09 13:52:23', '2023-04-13 09:54:39'),
(69, 4, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-58', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/1EIcOm5s8wkiRs7iYjEB_retMLhYDom57', '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-09', '2023-04-09', '1 day', '2023-04-09 14:29:04', '2023-04-13 09:41:40'),
(70, 4, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-59', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/1k11JZ15uTzic3WI2iT3IV5SIp2zS3v8R', '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '1 day', '2023-04-09 14:29:40', '2023-04-13 09:41:29'),
(71, 4, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-60', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/1-DKTf54nKFTGeuJ6iU9CcZhiPTlQVliH', '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-13', '2023-04-13', '1 day', '2023-04-09 14:30:06', '2023-04-13 15:43:19'),
(72, 2, 13, 2, NULL, 1, 'Content Writing 1p & Pahela Baishakh Banner 1p', '<p>&nbsp;</p>', 'SP-SB-61', 'E', 'U', 1, NULL, NULL, '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-09', '2023-04-10', '2 days', '2023-04-09 14:32:45', '2023-04-13 09:40:43'),
(73, 3, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.</p><p><br></p><p>--------------------------------</p><p>1 motion&nbsp; complete Today 09/04/2023&nbsp;</p>', 'SP-SB-62', 'E', 'N', 1, NULL, NULL, '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-09', '2023-04-09', '1 day', '2023-04-09 14:34:02', '2023-04-13 09:40:54'),
(74, 3, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-63', 'E', 'N', 1, NULL, 'https://drive.google.com/file/d/19jWvVgOwlk3mv4hpVftMyD9u7gRD711N/view?usp=sharing', '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-10', '2023-04-10', '1 day', '2023-04-09 14:34:29', '2023-04-13 09:41:02'),
(75, 3, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.</p><p><br></p><p>11/04/2023</p><p>&nbsp;Lenovo QT81 TWS Bluetooth Headset (Component Design &amp; Motion Complete )</p>', 'SP-SB-64', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/1yWlzoHWWapqfBT14rRYl7cEg0kYFQTmt?usp=sharing', '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-11', '2023-04-11', '1 day', '2023-04-09 14:34:55', '2023-04-13 09:41:13'),
(76, 3, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.</p><p><br></p><p>12-04-2023</p><p><b style=\"\"><font color=\"#0000ff\" style=\"background-color: rgb(255, 255, 255);\">Today 2 motions complete&nbsp;</font></b></p>', 'SP-SB-65', 'E', 'N', 1, NULL, 'https://drive.google.com/drive/folders/14nZ9bG2a6GfKP74XyiMiu5utJNU1Y1_v?usp=sharing', '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '1 day', '2023-04-09 14:35:19', '2023-04-13 09:41:21'),
(77, 3, 13, 2, NULL, 1, 'Motion Video - 2-5p daily', '<p>As prior Target, you will make 2-5p motions every day.<br></p>', 'SP-SB-66', 'E', 'N', 2, NULL, NULL, '2023-04-09', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-13', '2023-04-13', '1 day', '2023-04-09 14:35:45', '2023-04-13 09:55:16'),
(78, 3, 13, 2, NULL, 1, 'Web Development  - enrichitsolutions.com & endesk.net', '<p>&nbsp;&nbsp;</p>', 'SP-SB-66', 'E', 'N', 1, NULL, NULL, '2023-04-09', 'Reviewed', NULL, NULL, NULL, '2023-04-04', NULL, 'Everyday up to 3h', '2023-04-09 14:41:37', '2023-04-13 09:39:45'),
(79, 7, 13, 2, NULL, 1, 'SEMRUSH - Daily 4-5 hours', '<p>&nbsp;&nbsp;</p>', 'SP-SB-66', 'E', 'U', 4, NULL, NULL, '2023-04-09', NULL, NULL, NULL, NULL, '2023-04-09', '2023-05-08', '30 days', '2023-04-09 15:10:52', '2023-04-10 12:35:06'),
(80, 13, 13, 2, NULL, 1, 'DBID Resubmission', '<p>Done&nbsp;</p>', 'SP-SB-67', 'E', 'U', 3, NULL, NULL, '2023-04-09', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-09', '1 hour', '2023-04-09 15:56:31', '2023-04-10 13:01:48'),
(81, 3, 13, 2, NULL, 1, 'Management Work (Petty Cash Memo, Account & Salary Sheet)', '<p>All Done</p>', 'SP-SB-68', 'S', 'U', 1, NULL, NULL, '2023-04-10', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-05', '2023-04-08', '3 days', '2023-04-10 11:10:57', '2023-04-10 11:10:57'),
(82, 2, 13, 2, NULL, 1, 'Tap sticker design', '<p>Done</p>', 'SP-SB-69', 'E', 'U', 1, NULL, NULL, '2023-04-10', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-08', '2023-04-08', '1 day', '2023-04-10 11:13:37', '2023-04-10 11:13:37'),
(83, 2, 13, 2, NULL, 1, 'Design for Pahela Baishakh', '<p>Done</p>', 'SP-SB-70', 'E', 'U', 1, NULL, NULL, '2023-04-10', 'Reviewed by Finance & Marketing', NULL, NULL, NULL, '2023-04-08', '2023-04-08', '1 day', '2023-04-10 11:15:35', '2023-04-10 11:15:35'),
(84, 7, 13, 2, NULL, 1, 'Social Media Manage (Regular)', '<p>Manage: Facebook, Youtube, Instagram, Twitter, Pinterest, Linkedin, Tiktok<br></p>', 'SP-SB-71', 'E', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-11', '2023-04-13', '3 days', '2023-04-10 11:18:44', '2023-04-13 09:55:42'),
(85, 13, 13, 2, NULL, 1, 'MRT (Account for iPhone App)', '<p>Created &amp; Waiting for $99 Payment</p>', 'SP-SB-72', 'E', 'U', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-10', '2023-04-10', '20 min', '2023-04-10 12:07:05', '2023-04-13 09:38:06'),
(86, 13, 13, 2, NULL, 1, 'MRT (Play Store Task, Approval, Task Allocation, Email Creation & iMapping)', '<p>1.&nbsp;Playstore Task: Android App name changed to \'\'Sobkisubazar - Seller App\'\'. It will show within 48 hours on Play Store.&nbsp;</p><p>2. Approval: 4p motion</p><p>3.&nbsp;Task Allocation: Done</p><p>4. Email Creation &amp; iMapping: Zia got a mail</p><p><br></p>', 'SP-SB-73', 'E', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-10', '2023-04-10', '2 hours', '2023-04-10 12:11:28', '2023-04-13 09:38:00'),
(87, 14, 13, 2, NULL, 1, 'Product Upload (RM Trading)', '<p>&nbsp;- 230 products</p><p>Product upload</p><p><br></p>', 'SP-SB-74', 'E', 'N', 4, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:36:02', '2023-04-12 15:56:19'),
(88, 14, 13, 2, NULL, 1, 'Product Upload - FR Telecom', '<p>Infinix &amp; Redme Brands</p>', 'SP-SB-75', 'E', 'N', 2, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:36:47', '2023-04-10 13:36:47'),
(89, 14, 13, 2, NULL, 1, 'Product Upload - Supreme', '<p>Shirt, Polo Shirt</p>', 'SP-SB-76', 'E', 'N', 2, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:37:22', '2023-04-10 13:37:22'),
(90, 10, 13, 2, NULL, 1, 'Onboard Seller - New Product & new offer update', '<p>&nbsp;<span style=\"font-size: 0.875em;\">Update ;Real&nbsp; Shop&nbsp; 11&nbsp; on board&nbsp; Seller phone call s and&nbsp; feed Back Collection .</span><br><span style=\"font-size: 0.875em;\">2 seller has been </span><span style=\"font-size: 12.25px;\">positive</span><span style=\"font-size: 0.875em;\">&nbsp;</span><span style=\"font-size: 12.25px;\">response</span><span style=\"font-size: 0.875em;\">&nbsp;. </span><span style=\"font-size: 12.25px;\">providing</span><span style=\"font-size: 0.875em;\">&nbsp;Mail&nbsp;</span><br><span style=\"font-size: 12.25px;\">product</span><span style=\"font-size: 0.875em;\">&nbsp;Sourcing working on it.</span></p>', 'SP-SB-77', 'E', 'N', 4, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:40:20', '2023-04-13 16:02:51'),
(91, 10, 13, 2, NULL, 1, 'Data Collection, Phone Call, Meeting, Mailing - 64 Tradition', 'Mailed to 340 seller s in 64 districts who were on the list . Phone number of 160 people in 64 districts are listed and will be Messaged on Saturday 15th', 'SP-SB-78', 'E', 'N', 4, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:41:24', '2023-04-13 15:24:51'),
(92, 10, 13, 2, NULL, 1, 'Top brand collection, mail & sending proposal', '<p>&nbsp;</p>', 'SP-SB-79', 'E', 'N', 2, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:42:10', '2023-04-10 13:42:10'),
(93, 16, 13, 2, NULL, 1, 'Sourcing, Editing & Uploading - Laboni Cosmetics', '<p>&nbsp;Sourced 85 products picture from the internet after that edited that files as our website requirement&nbsp;</p>', 'SP-SB-80', 'E', 'N', 4, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:49:52', '2023-04-10 15:48:31'),
(94, 16, 13, 2, NULL, 1, 'Editing, Uploading - ZAS Nutrition', '<p>&nbsp;</p>', 'SP-SB-81', 'E', 'N', 2, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:50:34', '2023-04-10 13:50:34'),
(95, 16, 13, 2, NULL, 1, 'Uploading 50+ items - Craftsman Fashion', '<p>&nbsp;Sourced 25 items with picture &amp; Listed on excel file which are ready to upload on website</p><p>30 Products has been uploaded on website with proper information &amp; description</p>', 'SP-SB-82', 'E', 'N', 4, NULL, NULL, '2023-04-10', NULL, NULL, NULL, NULL, '2023-04-10', NULL, NULL, '2023-04-10 13:51:14', '2023-04-12 15:12:25'),
(96, 15, 13, 2, NULL, 1, 'Combined Task - Redirection: aamarpay, card', '<p>&nbsp;</p>', 'SP-SB-83', 'E', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-10', '2 days', '2023-04-10 15:11:13', '2023-04-10 15:11:13'),
(97, 5, 13, 2, NULL, 1, 'Combined Task - Redirection: aamarpay, card', '<p>&nbsp;</p>', 'SP-SB-84', 'E', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-10', '2 day', '2023-04-10 15:11:21', '2023-04-10 15:11:21'),
(98, 15, 13, 2, NULL, 1, 'Combined Task - Customer Login to Order completely', '<p>&nbsp;</p>', 'PR-SB-85', 'P', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-10', '2 days', '2023-04-10 15:12:26', '2023-04-10 15:12:26'),
(99, 5, 13, 2, NULL, 1, 'Combined Task - Customer Login to Order completely', '<p>&nbsp;&nbsp;</p>', 'PR-SB-86', 'P', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-10', '2 days', '2023-04-10 15:12:51', '2023-04-10 15:12:51'),
(100, 15, 13, 2, NULL, 1, 'Combined Task - Seller Panel without product uploading', '<p>&nbsp;</p>', 'PR-SB-87', 'P', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-10', '2 days', '2023-04-10 15:13:40', '2023-04-10 15:13:40'),
(101, 5, 13, 2, NULL, 1, 'Combined Task - Seller Panel without product uploading', '<p>&nbsp;</p>', 'PR-SB-88', 'P', 'N', 1, NULL, NULL, '2023-04-10', 'Reviewed', NULL, NULL, NULL, '2023-04-09', '2023-04-10', '2 days', '2023-04-10 15:14:03', '2023-04-10 15:14:03'),
(102, 13, 13, 2, NULL, 1, 'Company Profile', '<p>&nbsp;</p>', 'SP-SB-89', 'E', 'U', 1, NULL, NULL, '2023-04-11', 'Reviewed', NULL, NULL, NULL, '2023-04-11', '2023-04-12', '2 days', '2023-04-11 14:36:44', '2023-04-11 15:05:14'),
(103, 2, 13, 2, NULL, 1, 'Design, Content for Promotion', '<p>&nbsp;</p>', 'SP-SB-90', 'E', 'U', 1, NULL, NULL, '2023-04-11', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-11', '2023-04-11', '1 day', '2023-04-11 15:04:57', '2023-04-11 15:05:24'),
(104, 2, 13, 2, NULL, 1, 'Music research for Pahela Baishakh', '<p>&nbsp;</p>', 'SP-SB-91', 'S', 'U', 1, NULL, NULL, '2023-04-11', 'Reviewed by Sohag Sir', NULL, NULL, NULL, '2023-04-11', '2023-04-11', '1 hour', '2023-04-11 15:06:37', '2023-04-12 10:16:53'),
(105, 2, 13, 2, NULL, 1, 'Design Revision - Tape, shop & package sticker', '<p>&nbsp;</p>', 'CR-SB-92', 'C', 'U', 3, NULL, NULL, '2023-04-11', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-11', '2023-04-11', '1 day', '2023-04-11 15:08:27', '2023-04-12 10:17:08'),
(106, 3, 13, 2, NULL, 1, 'Personal Task of Ab. Hannan', '<p>&nbsp;2 paper edit &amp; print</p>', 'SP-SB-93', 'S', 'U', 1, NULL, NULL, '2023-04-11', 'Reviewed', NULL, NULL, NULL, '2023-04-11', '2023-04-11', '1 hour', '2023-04-11 15:12:03', '2023-04-12 10:17:18'),
(107, 3, 13, 2, NULL, 1, 'MRT (Office Deed Photocopy, passport scan)', '<p>New Office</p><p>for eCab</p>', 'SP-SB-94', 'S', 'U', 1, NULL, NULL, '2023-04-11', 'Reviewed by HR Admin', NULL, NULL, NULL, '2023-04-11', '2023-04-11', '20 min', '2023-04-11 15:14:33', '2023-04-11 15:15:09'),
(108, 13, 13, 2, NULL, 1, 'Updated Report: DBID', '<p>&nbsp;&nbsp;</p>', 'SP-SB-95', 'E', 'N', 1, NULL, NULL, '2023-04-12', 'Reviewed', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '10 min', '2023-04-12 09:10:17', '2023-04-12 10:16:10'),
(109, 13, 13, 2, NULL, 1, 'Updated Report on Mobile App: Google Play store', '<p>&nbsp;&nbsp;</p>', 'SP-SB-96', 'E', 'N', 1, NULL, NULL, '2023-04-12', 'Reviewed', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '10 min', '2023-04-12 10:15:59', '2023-04-12 10:15:59'),
(110, 2, 13, 2, NULL, 1, 'Android App Review', '<p>Please check the problem which was identified by you whether solved or not</p>', 'SP-SB-97', 'S', 'U', 1, NULL, NULL, '2023-04-12', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '2 hours', '2023-04-12 11:38:14', '2023-04-13 09:38:54'),
(111, 6, 13, 2, NULL, 1, 'Android App Review', '<p>Please check the problem which was identified by you whether solved or not</p><p><br></p><ol style=\"color: rgb(34, 34, 34); font-family: Arial, Helvetica, sans-serif; font-size: small; margin-bottom: 0px;\"><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Search option: invalid search করলে not found page আসবে</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Add to Cart করলে notification আসবে। এপস এ বুঝা যাচ্ছে না কার্টে প্রোডাক্ট এড হচ্ছে কি না</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Be a seller is not working</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Needs a button ‘be a customer’</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Language is not working properly</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Terms &amp; Condition, privacy policy, return policy -&gt; text font should be small and&nbsp;</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">This term is not working with bangla language</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Customer Care is not working</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Offer section এ অফারের প্রোডাক্ট না থাকলে not found দেখাতে হবে</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Account: Support ticket is not working properly</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">Go to payment: Address is not working as city wise</span></p></li><li dir=\"ltr\" style=\"margin-left: 15px; list-style-type: decimal; font-size: 15pt; font-family: &quot;Times New Roman&quot;; color: rgb(0, 0, 0); background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline; white-space: pre-wrap;\"><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">&nbsp;About us button is not working</span></p><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">13. Address not remove</span></p><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\">14. Product Order not working (Server error)</span></p><p dir=\"ltr\" role=\"presentation\" style=\"line-height: 1.8; text-align: justify; margin-top: 0pt; margin-bottom: 0pt;\"><span style=\"font-size: 15pt; background-color: transparent; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; vertical-align: baseline;\"><br></span></p></li></ol><p><b>Working:</b></p><p>1, 2, 3, 8,9</p><p><b>Not Working:</b></p><p>5, 6, 7,10,11, 12, 13, 14</p>', 'SP-SB-98', 'S', 'U', 1, NULL, NULL, '2023-04-12', 'Reviewed by Head of IT', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '1 hour', '2023-04-12 11:38:51', '2023-04-13 09:37:16'),
(112, 7, 13, 2, NULL, 1, 'Android App Review', '<p>Please check the problem which was identified by you whether solved or not<br></p>', 'SP-SB-99', 'S', 'U', 2, NULL, NULL, '2023-04-12', NULL, NULL, NULL, NULL, '2023-04-12', '2023-04-12', '10 min', '2023-04-12 11:39:24', '2023-04-12 11:39:24'),
(113, 13, 13, 2, NULL, 1, 'Android App Review', '<p>Please check the problem which was identified by you whether solved or not<br></p>', 'SP-SB-100', 'S', 'U', 6, NULL, NULL, '2023-04-12', 'Reviewed', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '2 hours', '2023-04-12 11:40:03', '2023-04-13 14:06:55'),
(114, 13, 13, 2, NULL, 1, 'Website: Attribute Update', '<p>&nbsp;done</p>', 'SP-SB-101', 'E', 'U', 1, NULL, NULL, '2023-04-12', 'Reviewed', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '10 min', '2023-04-12 13:46:10', '2023-04-12 13:46:10'),
(115, 4, 13, 2, NULL, 1, 'Motion for Sohag Sir - 1p', '<p>&nbsp;done</p>', 'SP-SB-102', 'E', 'U', 1, NULL, NULL, '2023-04-12', 'Reviewed', NULL, NULL, NULL, '2023-04-12', '2023-04-12', '3 hours', '2023-04-12 15:18:55', '2023-04-12 15:18:55'),
(116, 3, 13, 2, NULL, 1, 'Sub-Cat Icon (everyday)', '<p>Collection &amp; Resizing<br></p>', 'SP-SB-103', 'E', 'U', 4, NULL, NULL, '2023-04-13', NULL, NULL, NULL, NULL, '2023-04-13', NULL, NULL, '2023-04-13 09:50:05', '2023-04-13 09:50:05');
INSERT INTO `tickets` (`id`, `user_id`, `raised_by`, `product_id`, `organization_id`, `approved`, `title`, `details`, `ticket_code`, `type`, `priority`, `status_id`, `inprogress_type`, `url`, `raising_date`, `ticket_number`, `related_ticket_id`, `comment`, `root_cause`, `start_date`, `end_date`, `time`, `created_at`, `updated_at`) VALUES
(117, 4, 13, 2, NULL, 1, 'Facebook Ads Promotion Video with real-time vocal', '<p>Motion Video with real-time vocal&nbsp;</p><p>Facebook Ads Promotion</p><p><br></p>', 'SP-SB-103', 'E', 'U', 4, NULL, NULL, '2023-04-13', 'Postponed for Vocal (HR Admin)', NULL, NULL, NULL, '2023-04-11', NULL, NULL, '2023-04-13 09:59:28', '2023-04-13 14:57:03');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_images`
--

CREATE TABLE `ticket_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_images`
--

INSERT INTO `ticket_images` (`id`, `ticket_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '16753349810.png', '2023-02-02 09:49:41', '2023-02-02 09:49:41'),
(2, 2, '16756766100.png', '2023-02-06 08:43:30', '2023-02-06 08:43:30'),
(3, 8, '16803431890.pdf', '2023-04-01 07:59:49', '2023-04-01 07:59:49'),
(6, 10, '16804277280.pdf', '2023-04-02 07:28:48', '2023-04-02 07:28:48'),
(9, 6, '16804293160.png', '2023-04-02 07:55:16', '2023-04-02 07:55:16'),
(12, 16, '16805105530.png', '2023-04-03 06:29:13', '2023-04-03 06:29:13'),
(13, 13, '16805139270.docx', '2023-04-03 07:25:27', '2023-04-03 07:25:27'),
(14, 20, '16805139420.docx', '2023-04-03 07:25:42', '2023-04-03 07:25:42'),
(15, 22, '16806637920.png', '2023-04-05 01:03:12', '2023-04-05 01:03:12'),
(16, 28, '16806640340.png', '2023-04-05 01:07:14', '2023-04-05 01:07:14'),
(17, 46, '16806659450.jpg', '2023-04-05 01:39:05', '2023-04-05 01:39:05'),
(19, 33, '16806837230.txt', '2023-04-05 06:35:23', '2023-04-05 06:35:23'),
(20, 24, '16806843050.png', '2023-04-05 06:45:05', '2023-04-05 06:45:05'),
(21, 15, '16807560880.docx', '2023-04-06 02:41:28', '2023-04-06 02:41:28'),
(23, 34, '16807568660.docx', '2023-04-06 02:54:26', '2023-04-06 02:54:26'),
(25, 32, '16807572560.docx', '2023-04-06 03:00:56', '2023-04-06 03:00:56'),
(26, 54, '16807572620.jpg', '2023-04-06 03:01:02', '2023-04-06 03:01:02'),
(27, 52, '16807641320.pdf', '2023-04-06 04:55:33', '2023-04-06 04:55:33'),
(28, 37, '16807676030.zip', '2023-04-06 05:53:23', '2023-04-06 05:53:23'),
(29, 59, '16809436870.jpg', '2023-04-08 14:48:07', '2023-04-08 14:48:07'),
(30, 72, '16810316660.ai', '2023-04-09 15:14:27', '2023-04-09 15:14:27'),
(31, 80, '16810341910.jpg', '2023-04-09 15:56:31', '2023-04-09 15:56:31'),
(33, 108, '16812690310.jpg', '2023-04-12 09:10:31', '2023-04-12 09:10:31'),
(34, 109, '16812729590.jpg', '2023-04-12 10:15:59', '2023-04-12 10:15:59');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` tinyint(4) DEFAULT NULL,
  `organization_id` tinyint(4) DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `registration_date` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_superadmin` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fcm_token` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `product_id`, `organization_id`, `username`, `email`, `registration_date`, `email_verified_at`, `password`, `is_superadmin`, `status`, `remember_token`, `fcm_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', NULL, NULL, 'super admin', 'superadmin@gmail.com', '2023-03-12', NULL, '$2y$10$DjerohiMYYOumkQvgst/AOezr4LEn.zfdcPI74LTBKBq1F/0vrEIu', 1, 0, NULL, 'f46Cb6K8cE9uRfivYKLpc8:APA91bFAro0Ivm2CqMratk43xQyW9M1SiOSvAoN-prNflMAJfOn7iJ6SgJ6_sSv5EynXMOl9M7PuWSl1-ztJVdIRbWCbYBZL95NJLu01w6HHASXt7Bt3KzQ7hfI0o3cWqAgpMCjW7FZD', '2023-02-02 03:27:26', '2023-04-08 14:42:25'),
(2, 'Sourave - Graphic Designer', NULL, NULL, 'sg', 'mgd2@sobkisubazar.com', '2023-03-12', NULL, '$2y$10$rZ5a09YRGRf7SeNSGpWxpO4oqXvCPi4tU6MxN9x3TDuJmi/Kqajya', 0, 1, NULL, NULL, '2023-02-02 03:31:44', '2023-04-04 13:54:13'),
(3, 'Imran - Motion Graphic Designer', NULL, NULL, 'imran999', 'mgd1@sobkisubazar.com', '2023-03-12', NULL, '$2y$10$QhODa/WzU0WJgzQtpC8C8eCdzuEI7lXZeiWeyG0/1Ni5lH00d6sIi', 0, 1, NULL, 'eXhBy46TuI2_2jG1NqqdXR:APA91bGad8M-JaVqwcDjiPkHQVd-06NK0uVxhthU4d9QPnpxbsTyJGruNSSi8YDPsAnXr6HCB8f7ID_DdDKMp4WrSFxDD5BZeKb3G7ASdwq4xEN8auaSFDMT0zOuIX2YQvKqI550JMmQ', '2023-02-02 03:32:20', '2023-04-05 01:15:44'),
(4, 'Ittehaz - Motion Graphic Designer', NULL, NULL, 'Ittehaz', 'mgd3@sobkisubazar.com', '2023-03-12', NULL, '$2y$10$wOKcxzQUd4ZvdJitj8jxOe4ox58qoAePRnvfuYnC2q32J068W3Gl2', 0, 1, NULL, NULL, '2023-02-02 03:33:36', '2023-04-08 15:55:58'),
(5, 'Haider - Web Developer', NULL, NULL, 'haidercse', 'wdd1@sobkisubazar.com', '2023-03-12', NULL, '$2y$10$saEvG9FrqR0cVk70EEC6mObdDw.hb5P7lMFw3dSW3mF0vIKB/tdze', 0, 1, NULL, 'f46Cb6K8cE9uRfivYKLpc8:APA91bFAro0Ivm2CqMratk43xQyW9M1SiOSvAoN-prNflMAJfOn7iJ6SgJ6_sSv5EynXMOl9M7PuWSl1-ztJVdIRbWCbYBZL95NJLu01w6HHASXt7Bt3KzQ7hfI0o3cWqAgpMCjW7FZD', '2023-02-02 03:36:28', '2023-04-08 14:34:56'),
(6, 'Nitu - Web Developer', NULL, NULL, 'nafisa', 'wdd2@sobkisubazar.com', '2023-03-12', NULL, '$2y$10$Ey/BRVZCguwuMVmAxCmiW.SzgZFqtwv5NT21slwNmdv8efgyJKOve', 0, 1, NULL, 'dAqPkvwG7rj0w0KXmFMKrg:APA91bGnC2pLUlNT0heafXRue6yENsldEEp_3ZoHmS8_cFU1bIu5juYMmAglHehwFcas5dzwfjq1w-eYfcwzIfOcxsw6-1nLxqVDbWCWR9ZMQX25PuNGjZJd7ggGXGQOsk00vTEfAQzH', '2023-02-02 03:37:07', '2023-04-09 11:23:31'),
(7, 'Arif - Digital Marketer', NULL, NULL, 'arif', 'dm2@sobkisubazar.com', '2023-03-12', NULL, '$2y$10$iruluEvDeHQrGLlFQqbr.ezXxy/4WWOcWtmyejYmeV4upGpOelNwK', 0, 1, NULL, NULL, '2023-02-02 03:47:34', '2023-04-08 15:11:25'),
(9, 'Sabid Alauddin - HR Admin', NULL, NULL, 'sabid', 'alauddin@sobkisubazar.com', '0000-00-00', NULL, '$2y$10$4crFPc9Qes/SLH3mw9GA7OBMOpJF/FPpTlPLPzh56a2iBeOf7XG1O', 0, 1, NULL, 'fD2qXX7InsB8G61sXsFki3:APA91bH3SmmAhu08bw4kSjdS8ZiDUsX8eg5-tyuSvcTw1_EKESlVIwoI0f0vSgT80w-AEORSIj9BBvQ2nenKw0mU9xN0-_pe4A_0jsOcZb45p9eK91V8Z_eXMVj3I0xBw2gIIFwKQjmP', '2023-04-01 06:15:07', '2023-04-09 15:11:40'),
(10, 'Sazia - Customer Relationship Manager', NULL, NULL, 'Sazia kabir', 'sazia@sobkisubazar.com', '0000-00-00', NULL, '$2y$10$u6PYKhNX3.PdF/dl5gd71esyyq3ra4cTu6QRi14MzvrNK24Ff8k2O', 0, 1, NULL, 'dN1LrVXoKgfsB9T9wKs2dM:APA91bHQOVYzTQFqUWTEZ-tqgau83IbZndpiARtWvS4xDeUAZBspBMZQGTqvmKVRLK7c-H4VFaggaNfa0AtT-LnMKKLl9CF8qX-k66PLsY6XotCbCmborDKjm2DLV2G4KTVKAnobohF3', '2023-04-01 06:39:39', '2023-04-12 09:56:55'),
(11, 'ASM Khairul Ghani - Director', NULL, NULL, 'Liton', 'ghani@sobkisubazar.com', '0000-00-00', NULL, '$2y$10$kMmiienxCdZfu5hxM.diLOyi7rcKlLwMpgPyxspWjlDu..vXH5uAS', 0, 1, NULL, 'ctKFWFIQUqRgNxioELcqI8:APA91bEh72gGk_w_Ea10a5sVV_ZEML-iCPiTi4q98xC2VknG-tw4njYfkav357Kx4BzVRrTViZdEABfe_4nCF-mX-o6OUVxcyrnjWS6Q9bVT4PCi_lSkqqyoPzY0jHLWkZ8OMQ077YTi', '2023-04-01 06:48:05', '2023-04-04 14:02:30'),
(12, 'Rakan - Sr Marketing Officer', NULL, NULL, 'rakan roy', 'rajon@sobkisubazar.com', '0000-00-00', NULL, '$2y$10$7WUuLmNKay2J567VtRgfJes36VpAIYEBlx.uO1u3DdZ/jS2O0d.Ii', 0, 1, NULL, 'dtRuJtjUDF-LyArSWu85Gv:APA91bG9gBEEk_tHVdtDN7yX_u862ncHok3f81N3FeavmBK92my_zDxh8dwmyf5gaBg0i8zCw35H2IiwxV5zSYIYz3ekZJhnIslOSI1T7y7ro-UT8CpTEly-D9DTXIocTEAZevndSUVM', '2023-04-01 07:31:54', '2023-04-08 04:08:57'),
(13, 'Rashed - Head of IT', NULL, NULL, 'abc', 'rashed@sobkisubazar.com', '0000-00-00', NULL, '1944151312', 0, 1, NULL, 'ek7hSt5VkSoVdF5uY69xDS:APA91bGyhxujcIt-BEZSiAQ2W9SpIGxfJbPSJMjhstTnIpwB8qPznHRZaDQVUBAy05DJbshaa-MSOBv6G6AtMP7oGocCVR_Y6ptjUSA6yM44o7m7mRej4Uj7AcUkg8udA1EVt9wuRQxq', '2023-04-02 04:01:46', '2023-04-13 14:09:11'),
(14, 'Sumon - Brand Promoter', NULL, NULL, 'sumon', 'sumon@sobkisubazar.com', '0000-00-00', NULL, '$2y$10$Yy9BBdGfrvO..9xA1RFXx.NRyiFU4iI5sMqZZYbBg.U3WmtuZrCqa', 0, 1, NULL, 'fxff9HWe4XayJS0xtZgckZ:APA91bHaQKR9JjjMGn6bL4hsArDV7bdXV3xLQF95Vd_Yj50j4N2Ljp_gh_T9JdtuVMeZjBAHAHLsyYAhB5dUUijqDM3aw_WBnk1x_23xTT8g18C8UE0ozizU-WIXd12ArLf_mp2GoenU', '2023-04-04 14:09:14', '2023-04-10 12:33:54'),
(15, 'Md. Ziaur Rahman', NULL, NULL, 'Zia', 'zia@sobkisubazar.com', '0000-00-00', NULL, '$2y$10$adcSDkTtSUtGmELuimPFouxLH1KOip5KMVO2R2qDjhSIozP59Gbha', 0, 1, NULL, 'eNyd_drMniS516yfdlEHkr:APA91bF3RxWph-MOUiEkAp3LeB7_bGmqLHQXKjz_1eMWc3i7JKCl_DrKC45b5q7wF_Z_KUjlYzZDMQf0s1C3JDdLdyRDfbneE3t-HFerSVyEAPPrZT6YJKFuYjFfzVMAIF522RrZCTBO', '2023-04-10 12:30:28', '2023-04-10 13:43:27'),
(16, 'Jahid - Photographer', NULL, NULL, 'jahid', 'jahid@sobkisubazar.com', '0000-00-00', NULL, '$2y$10$mQhRzhuepl8J.SVE/E5xRuoXtjhaGzXhkcqlQPW3tdnPjBlBJXBke', 0, 1, NULL, 'ea9Z17U5fcJ8nhPBV76_Qc:APA91bFtDe8cQK2qiAslXGGUJRDGAXLsTaXWylk-iCf7DybrDK5zfB86abrqzS6ZR10qDL0z6hPG-FZKffGNDlMZo2IfJ2g_d4bDp-KPHYOvrs2dwYjw0l3w6IAFimg3v9x5Bf9l7395', '2023-04-10 13:45:41', '2023-04-10 13:48:53');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `organizations`
--
ALTER TABLE `organizations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `statuses`
--
ALTER TABLE `statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_images`
--
ALTER TABLE `ticket_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `organizations`
--
ALTER TABLE `organizations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `statuses`
--
ALTER TABLE `statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `ticket_images`
--
ALTER TABLE `ticket_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
