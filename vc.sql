-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 26, 2020 lúc 04:35 PM
-- Phiên bản máy phục vụ: 10.4.14-MariaDB
-- Phiên bản PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `vc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_published` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `user_id`, `thumbnail`, `name`, `slug`, `is_published`, `created_at`, `updated_at`) VALUES
(15, 6, 'http://localhost/VC/public/storage/galleries/THONGBAO_1603723863.jpg', 'THÔNG BÁO', 'thong-bao', '1', '2020-10-26 07:51:24', '2020-10-26 07:51:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_posts`
--

CREATE TABLE `category_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_posts`
--

INSERT INTO `category_posts` (`id`, `category_id`, `post_id`, `created_at`, `updated_at`) VALUES
(106, 15, 104, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `galleries`
--

CREATE TABLE `galleries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `galleries`
--

INSERT INTO `galleries` (`id`, `user_id`, `image_url`, `created_at`, `updated_at`) VALUES
(2, 6, 'THONGBAO_1603723863.jpg', '2020-10-26 07:51:03', '2020-10-26 07:51:03'),
(3, 6, 'TTTT_1603723926.jpg', '2020-10-26 07:52:06', '2020-10-26 07:52:06');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_10_24_034243_create_categories_table', 1),
(5, '2020_10_24_034254_create_posts_table', 1),
(6, '2020_10_24_034316_create_galleries_table', 1),
(7, '2020_10_24_034354_create_category_posts_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `thumbnail` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_published` enum('1','0') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `thumbnail`, `title`, `slug`, `sub_title`, `details`, `post_type`, `is_published`, `created_at`, `updated_at`) VALUES
(104, 6, 'http://localhost/VC/public/storage/galleries/TTTT_1603723926.jpg', 'LỊCH THỰC HÀNH TIẾP THỊ TRỰC TUYẾN', 'lich-thuc-hanh-tiep-thi-truc-tuyen', 'THÔNG BÁO LỊCH THỰC HÀNH HỌC PHẦN TIẾP THỊ TRỰC TUYẾN | PHẠM NGỌC DUY', '<ol>\r\n	<li>\r\n	<p><em>Thời gian thực h&agrave;nh</em>:&nbsp;<strong>02.11.2020 - 12.12.2020</strong><br />\r\n	<strong>(NG&Agrave;Y MAI CHƯA THỰC H&Agrave;NH)</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><em>Thời lượng thực h&agrave;nh:&nbsp;</em><strong>5 tiết/buổi x 1 buổi/tuần x 6 tuần (30 tiết)</strong></p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Lịch thực h&agrave;nh chi tiết được n&ecirc;u trong b&agrave;i đăng thăm d&ograve; &yacute; kiến của thầy Duy ở trong c&aacute;c Group ri&ecirc;ng, anh em v&agrave;o đ&oacute; để check lại lịch ch&iacute;nh x&aacute;c</strong></p>\r\n	</li>\r\n</ol>\r\n\r\n<p><strong>PEACEE !</strong></p>', 'post', '1', '2020-10-26 08:07:06', '2020-10-26 08:10:30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Miss Mariana Dare', 'aokuneva@example.org', '2020-10-24 03:17:01', '$2y$10$b/HV.VH/u90uswYbgmhrD.CfsSCCLA.qzrEGz2JPUFTy6cHOyHK26', 'FqMiBcTFMI3TQgKzWrfYz6wTcDSSFUrXc3UpTI9v8LBhBtuAGroHiFiitAt4', '2020-10-24 03:17:01', '2020-10-24 03:17:01'),
(2, 'Miss Lou Parisian', 'wisozk.maudie@example.org', '2020-10-24 03:17:01', '$2y$10$YpmTWA7evfJ9XxS3kBou5OLSy1kfKqKT4BQIIe56kiwzZd6yvMI62', 'awqrHrgXQk', '2020-10-24 03:17:01', '2020-10-24 03:17:01'),
(3, 'Mr. Tyson Ernser DDS', 'coty.aufderhar@example.com', '2020-10-24 03:17:01', '$2y$10$voXvrhOtgoxHoHPgo3Kkze8MIrk5tj3pwF109QsBru9WVK3UjRmM2', 'dmIYbTK84E', '2020-10-24 03:17:01', '2020-10-24 03:17:01'),
(4, 'Prof. Nicholaus Kemmer', 'wdurgan@example.com', '2020-10-24 03:17:01', '$2y$10$2/VAsBWDL7GXzqt9RMvUf.tVPhZgBylXXynIasGxKAEPl4vP8SwES', 'VRvPrTuXkg', '2020-10-24 03:17:01', '2020-10-24 03:17:01'),
(5, 'Quincy Hickle', 'claudie55@example.com', '2020-10-24 03:17:01', '$2y$10$ioOlmU7dbWztfRnxzNnX.edc35WB2xQITSjXM7xpjwIqmoEMC.SUK', '7sQrT48BbB', '2020-10-24 03:17:01', '2020-10-24 03:17:01'),
(6, 'kienhp1hp', 'kienhp1hp@gmail.com', NULL, '$2y$10$T31UmjR56FoNY1GVymW/k.uwy2AmX4UxGTxETf26aUXTB/fJ4Qt.y', 'lqQUJyQPfj65gz4NHXP6MNEL1s3LVCNaxvmK1CJLUX5jgqN3RNcZKMI7Ou8g', '2020-10-26 04:23:47', '2020-10-26 04:23:47');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `category_posts`
--
ALTER TABLE `category_posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_posts_category_id_foreign` (`category_id`),
  ADD KEY `category_posts_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `galleries`
--
ALTER TABLE `galleries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `galleries_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_title_unique` (`title`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `category_posts`
--
ALTER TABLE `category_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `galleries`
--
ALTER TABLE `galleries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `category_posts`
--
ALTER TABLE `category_posts`
  ADD CONSTRAINT `category_posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_posts_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `galleries`
--
ALTER TABLE `galleries`
  ADD CONSTRAINT `galleries_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
