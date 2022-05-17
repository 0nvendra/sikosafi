/*
 Navicat Premium Data Transfer

 Source Server         : .
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : sikosafi

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 15/05/2022 17:30:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admins_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'Admin', 'admin@gmail.com', '$2y$10$AHdBUH6qQbVObM4QiAqX8.vN/.hHvbuNBNM92tP1fZIhY0h.JG62a', NULL, '2022-04-10 23:42:26', '2022-05-07 05:25:25');
INSERT INTO `admins` VALUES (3, '123', '123@gmail.com', '$2y$10$kG478pRYort5mrkchheId.eN9f1hRDUSK10vTsFC68yzG.F06PZZ.', '2022-04-10 23:42:26', '2022-04-10 23:42:26', '2022-05-07 04:12:59');
INSERT INTO `admins` VALUES (4, 'admin1', 'admin1@gmail.com', '$2y$10$VgbajTRDIUtflLP/fWR9hO0gzFsAs2bB5KCdiFFo5pc5fjTtyXspq', NULL, '2022-05-12 14:14:42', '2022-05-12 14:14:42');

-- ----------------------------
-- Table structure for bookings
-- ----------------------------
DROP TABLE IF EXISTS `bookings`;
CREATE TABLE `bookings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `start_at` date NULL DEFAULT NULL,
  `end_at` date NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `bukti_tf` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `status_id` int(11) NULL DEFAULT NULL,
  `admin_id` int(11) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookings
-- ----------------------------
INSERT INTO `bookings` VALUES (8, 'ORDER/22/5/0001', 1, 1, '2022-05-13', '2022-05-18', 1700000.00, 'image/fCGUXQAY4z4m8pcL0lnpwe19e382K6kj5XAmU4ON.jpg', 2, 1, NULL, '2022-05-13 12:24:17', '2022-05-13 12:59:09');
INSERT INTO `bookings` VALUES (9, 'ORDER/22/5/0002', 1, 1, NULL, NULL, 1700000.00, 'image/dUxiv3sLRNMqfYQ5OZ9ZB8r2NSGtpBcBqwJw2Mbj.jpg', 1, NULL, NULL, '2022-05-13 12:34:36', '2022-05-13 12:59:34');
INSERT INTO `bookings` VALUES (10, 'ORDER/22/5/0003', 1, 3, NULL, NULL, 1700000.00, 'image/KlmRZSIxOo8RNhDX9Goeiy2osocnDwXxBl7cA7Z6.jpg', 1, NULL, NULL, '2022-05-13 13:28:04', '2022-05-13 13:28:04');
INSERT INTO `bookings` VALUES (11, 'ORDER/22/5/0004', 2, 4, '2022-05-13', '2022-06-13', 1700000.00, 'image/yMxICnypljKRNIW23xyXmn3G8oEirIzFMBSd8WMi.jpg', 2, 1, NULL, '2022-05-13 13:29:34', '2022-05-13 13:30:13');
INSERT INTO `bookings` VALUES (12, 'ORDER/22/5/0005', 1, 2, NULL, NULL, 1700000.00, 'image/FDKIdScwXPFuLRucOzI6VDYOsswxsvOTJjhR0Q84.jpg', 1, NULL, NULL, '2022-05-14 06:06:54', '2022-05-14 06:06:54');
INSERT INTO `bookings` VALUES (13, 'ORDER/22/5/0006', 1, 3, NULL, NULL, 1700000.00, 'image/H2pqjaZpLMyd9nnZs06djrfvkM6Keucae6rwOFjW.jpg', 1, NULL, NULL, '2022-05-14 06:09:29', '2022-05-14 06:09:29');
INSERT INTO `bookings` VALUES (14, 'ORDER/22/5/0007', 1, 2, NULL, NULL, 1700000.00, 'image/pxKtqNIH4wysQ10AINt48F8hnl5Rcmc21wtwzdP8.jpg', 1, NULL, NULL, '2022-05-14 06:12:14', '2022-05-14 06:12:14');
INSERT INTO `bookings` VALUES (15, 'ORDER/22/5/0008', 1, 2, NULL, NULL, 1700000.00, 'image/tBHaZLVCLbmBEGDipDwq6RkaDYqF5MUi0UQ2nkY2.jpg', 1, NULL, NULL, '2022-05-14 06:12:37', '2022-05-14 06:12:37');
INSERT INTO `bookings` VALUES (16, 'ORDER/22/5/0009', 1, 2, NULL, NULL, 1700000.00, 'image/5wxzZCIKgX5Gliggz3ECPsYSNQtJABwkkle6ASsQ.jpg', 1, NULL, NULL, '2022-05-14 06:14:26', '2022-05-14 06:14:26');
INSERT INTO `bookings` VALUES (17, 'ORDER/22/5/0010', 1, 2, NULL, NULL, 1700000.00, 'image/G0Y0si8NUJGPh8f6qFw0RjZMSIvZAJzXO9QWLW86.jpg', 1, NULL, NULL, '2022-05-14 06:19:02', '2022-05-14 06:19:02');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for fasilitas
-- ----------------------------
DROP TABLE IF EXISTS `fasilitas`;
CREATE TABLE `fasilitas`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fasilitas
-- ----------------------------
INSERT INTO `fasilitas` VALUES (1, 'WIFI,BATHUB,LISTRIK TOKEN,GRATIS PEMBERSIHAN KAMAR,LEMARI', '2022-05-08 02:33:11', '2022-04-10 23:42:26', '2022-05-08 02:33:11');
INSERT INTO `fasilitas` VALUES (2, '-LEMARI\r\n-WIFI\r\n-DOUBLLE BED TIDUR\r\n-KESET\r\n-KAMAR MANDI DALAM', '2022-05-13 08:54:00', '2022-04-10 23:42:26', '2022-05-13 08:54:00');
INSERT INTO `fasilitas` VALUES (3, '-KIPAS\n-BED\n-WIFI', '2022-05-13 08:53:58', '2022-05-12 14:17:00', '2022-05-13 08:53:58');
INSERT INTO `fasilitas` VALUES (4, '-KIPAS\n-WIFI\n-TV KABEL\n-MEJA BELAJAR\n-KURSI\n-MEJA KECIL\n-LEMARI\n-SINGLE BED\n-DAPUR UMUM\n-ALAT PEMBERSIH RUANGAN', NULL, '2022-05-12 14:20:44', '2022-05-13 09:03:06');
INSERT INTO `fasilitas` VALUES (5, '-AIR CONDITIONER (AC)\n-WIFI\n-TV KABEL\n-MEJA BELAJAR\n-KURSI\n-MEJA KECIL\n-LEMARI\n-SINGLE BED\n-DAPUR UMUM\n-ALAT PEMBERSIH RUANGAN', NULL, '2022-05-12 14:23:18', '2022-05-13 09:03:01');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2022_04_21_221822_create_rules_table', 1);
INSERT INTO `migrations` VALUES (6, '2022_04_21_222223_create_tipe_rooms_table', 1);
INSERT INTO `migrations` VALUES (7, '2022_04_21_222759_create_rooms_table', 1);
INSERT INTO `migrations` VALUES (8, '2022_04_21_223034_create_admins_table', 1);
INSERT INTO `migrations` VALUES (9, '2022_04_21_223131_create_bookings_table', 1);
INSERT INTO `migrations` VALUES (10, '2022_04_21_223316_create_deposits_table', 1);
INSERT INTO `migrations` VALUES (11, '2022_04_21_223539_create_balances_table', 1);
INSERT INTO `migrations` VALUES (12, '2022_04_21_224626_create_notif_bookings_table', 2);
INSERT INTO `migrations` VALUES (13, '2022_04_21_225105_create_fasilitas_table', 3);
INSERT INTO `migrations` VALUES (14, '2022_05_12_070554_create_visitors_table', 4);

-- ----------------------------
-- Table structure for notif_bookings
-- ----------------------------
DROP TABLE IF EXISTS `notif_bookings`;
CREATE TABLE `notif_bookings`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pesan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dikirim` int(11) NOT NULL DEFAULT 0,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notif_bookings
-- ----------------------------

-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nomor_room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lantai` int(11) NOT NULL,
  `tipe_room_id` int(11) NOT NULL,
  `fasilitas_id` int(11) NOT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rooms
-- ----------------------------
INSERT INTO `rooms` VALUES (1, '1', 1, 2, 5, 1700000.00, NULL, '2022-04-10 23:42:26', '2022-05-13 08:55:09');
INSERT INTO `rooms` VALUES (2, '2', 1, 2, 5, 1700000.00, NULL, '2022-04-10 23:42:26', '2022-05-13 08:55:26');
INSERT INTO `rooms` VALUES (3, '3', 1, 2, 5, 1700000.00, NULL, '2022-04-10 23:42:26', '2022-05-13 08:55:34');
INSERT INTO `rooms` VALUES (4, '4', 1, 2, 5, 1700000.00, NULL, '2022-04-10 23:42:26', '2022-05-13 08:55:45');
INSERT INTO `rooms` VALUES (5, '5', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (6, '6', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (7, '7', 1, 2, 5, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-13 13:31:49');
INSERT INTO `rooms` VALUES (8, '8', 1, 2, 5, 1700000.00, NULL, '2022-04-10 23:42:26', '2022-05-13 08:54:57');
INSERT INTO `rooms` VALUES (9, '9', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (10, '10', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (11, '11', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (12, '12', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (13, '13', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (14, '14', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (15, '15', 1, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (16, '16', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (17, '17', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (18, '18', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (19, '19', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (20, '20', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (21, '21', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (22, '22', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (23, '23', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (24, '24', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (25, '25', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (26, '26', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (27, '27', 2, 2, 4, 1200000.00, NULL, '2022-04-10 23:42:26', '2022-05-09 04:35:30');
INSERT INTO `rooms` VALUES (28, '28', 2, 2, 4, 1200000.00, NULL, '2022-05-12 14:17:55', '2022-05-12 14:17:55');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `no` int(11) NOT NULL,
  `desc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES (1, 1, 'Dilarang membawa pasangan.', NULL, '2022-04-10 23:42:26', '2022-05-07 01:01:52');
INSERT INTO `rules` VALUES (2, 2, 'Tamu tidak boleh menginap tanpa seizin pengelola kos', NULL, '2022-04-10 23:42:26', '2022-05-07 00:52:23');
INSERT INTO `rules` VALUES (3, 3, 'Batas bertamu sampai pukul 22.30 WITA', NULL, '2022-04-10 23:42:26', '2022-05-07 01:02:14');
INSERT INTO `rules` VALUES (4, 4, 'Jam malam sampai pukul 00.00 WITA', NULL, NULL, NULL);
INSERT INTO `rules` VALUES (5, 5, 'Menjaga kebersihan dapur', NULL, NULL, NULL);
INSERT INTO `rules` VALUES (6, 6, 'Menjaga kebersihan lingkungan kos', NULL, NULL, NULL);
INSERT INTO `rules` VALUES (7, 7, 'Tidak boleh berisik dan membuat kegaduhan', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for tipe_rooms
-- ----------------------------
DROP TABLE IF EXISTS `tipe_rooms`;
CREATE TABLE `tipe_rooms`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tipe_rooms
-- ----------------------------
INSERT INTO `tipe_rooms` VALUES (1, 'DULUXE', '2022-05-08 02:24:22', '2022-04-10 23:42:26', '2022-05-08 01:56:59');
INSERT INTO `tipe_rooms` VALUES (2, 'STANDART', NULL, '2022-04-10 23:42:26', '2022-05-08 01:56:55');
INSERT INTO `tipe_rooms` VALUES (3, 'DOUBLE BED', '2022-05-08 02:24:22', '2022-04-10 23:42:26', '2022-05-08 01:56:46');
INSERT INTO `tipe_rooms` VALUES (4, 'WIFI, BED TIDUR, LEMARI, WIFI (2MB)', '2022-05-08 02:24:22', '2022-04-10 23:42:26', '2022-05-08 02:24:22');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nama` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nik` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` date NULL DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `ktp_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  UNIQUE INDEX `users_nik_unique`(`nik`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Member1', '+6282214241168', 'user@gmail.com', '$2y$10$orMaadw7D2o//Emi7FzCIua5C2q1yJmnVMBgkSuLXoOFIv.PhDKV6', '12345678', '2022-04-21', 2, NULL, NULL, NULL, '2022-04-10 23:42:26', '2022-05-06 21:34:29');
INSERT INTO `users` VALUES (2, 'Member2', '+6282299825920', '1233@gmail.com', '$2y$10$G9psKH.iwnxyjfoiXqjyIOX6vGRud3wc4fU81jRGpCr4gxRhuQ2vW', '123456789', '2022-05-02', 2, NULL, NULL, NULL, '2022-05-14 23:33:39', '2022-05-14 23:33:39');

-- ----------------------------
-- Table structure for visitors
-- ----------------------------
DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 317 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of visitors
-- ----------------------------
INSERT INTO `visitors` VALUES (58, '127.0.0.1', '2022-04-01 00:00:00', NULL);
INSERT INTO `visitors` VALUES (59, '127.0.0.2', '2022-04-02 00:00:00', NULL);
INSERT INTO `visitors` VALUES (60, '127.0.0.3', '2022-04-03 00:00:00', NULL);
INSERT INTO `visitors` VALUES (61, '127.0.0.4', '2022-04-04 00:00:00', NULL);
INSERT INTO `visitors` VALUES (62, '127.0.0.5', '2022-04-05 00:00:00', NULL);
INSERT INTO `visitors` VALUES (63, '127.0.0.6', '2022-04-06 00:00:00', NULL);
INSERT INTO `visitors` VALUES (64, '127.0.0.7', '2022-04-07 00:00:00', NULL);
INSERT INTO `visitors` VALUES (65, '127.0.0.8', '2022-04-08 00:00:00', NULL);
INSERT INTO `visitors` VALUES (66, '127.0.0.9', '2022-04-09 00:00:00', NULL);
INSERT INTO `visitors` VALUES (67, '127.0.0.10', '2022-04-10 00:00:00', NULL);
INSERT INTO `visitors` VALUES (68, '127.0.0.11', '2022-04-11 00:00:00', NULL);
INSERT INTO `visitors` VALUES (69, '127.0.0.12', '2022-04-12 00:00:00', NULL);
INSERT INTO `visitors` VALUES (70, '127.0.0.13', '2022-04-13 00:00:00', NULL);
INSERT INTO `visitors` VALUES (71, '127.0.0.14', '2022-04-14 00:00:00', NULL);
INSERT INTO `visitors` VALUES (72, '127.0.0.15', '2022-04-15 00:00:00', NULL);
INSERT INTO `visitors` VALUES (73, '127.0.0.16', '2022-04-16 00:00:00', NULL);
INSERT INTO `visitors` VALUES (74, '127.0.0.17', '2022-04-17 00:00:00', NULL);
INSERT INTO `visitors` VALUES (75, '127.0.0.18', '2022-04-18 00:00:00', NULL);
INSERT INTO `visitors` VALUES (76, '127.0.0.19', '2022-04-19 00:00:00', NULL);
INSERT INTO `visitors` VALUES (77, '127.0.0.20', '2022-04-20 00:00:00', NULL);
INSERT INTO `visitors` VALUES (78, '127.0.0.21', '2022-04-21 00:00:00', NULL);
INSERT INTO `visitors` VALUES (79, '127.0.0.22', '2022-04-22 00:00:00', NULL);
INSERT INTO `visitors` VALUES (80, '127.0.0.23', '2022-04-23 00:00:00', NULL);
INSERT INTO `visitors` VALUES (81, '127.0.0.24', '2022-04-24 00:00:00', NULL);
INSERT INTO `visitors` VALUES (82, '127.0.0.25', '2022-04-25 00:00:00', NULL);
INSERT INTO `visitors` VALUES (83, '127.0.0.26', '2022-04-26 00:00:00', NULL);
INSERT INTO `visitors` VALUES (84, '127.0.0.27', '2022-04-27 00:00:00', NULL);
INSERT INTO `visitors` VALUES (85, '127.0.0.28', '2022-04-28 00:00:00', NULL);
INSERT INTO `visitors` VALUES (86, '127.0.0.29', '2022-04-29 00:00:00', NULL);
INSERT INTO `visitors` VALUES (87, '127.0.0.30', '2022-04-30 00:00:00', NULL);
INSERT INTO `visitors` VALUES (88, '127.0.0.1', '2022-04-01 00:00:00', NULL);
INSERT INTO `visitors` VALUES (89, '127.0.0.2', '2022-04-02 00:00:00', NULL);
INSERT INTO `visitors` VALUES (90, '127.0.0.3', '2022-04-03 00:00:00', NULL);
INSERT INTO `visitors` VALUES (91, '127.0.0.4', '2022-04-04 00:00:00', NULL);
INSERT INTO `visitors` VALUES (92, '127.0.0.5', '2022-04-05 00:00:00', NULL);
INSERT INTO `visitors` VALUES (93, '127.0.0.6', '2022-04-06 00:00:00', NULL);
INSERT INTO `visitors` VALUES (94, '127.0.0.7', '2022-04-07 00:00:00', NULL);
INSERT INTO `visitors` VALUES (95, '127.0.0.8', '2022-04-08 00:00:00', NULL);
INSERT INTO `visitors` VALUES (96, '127.0.0.9', '2022-04-09 00:00:00', NULL);
INSERT INTO `visitors` VALUES (97, '127.0.0.10', '2022-04-10 00:00:00', NULL);
INSERT INTO `visitors` VALUES (98, '127.0.0.11', '2022-04-11 00:00:00', NULL);
INSERT INTO `visitors` VALUES (99, '127.0.0.12', '2022-04-12 00:00:00', NULL);
INSERT INTO `visitors` VALUES (100, '127.0.0.13', '2022-04-13 00:00:00', NULL);
INSERT INTO `visitors` VALUES (101, '127.0.0.14', '2022-04-14 00:00:00', NULL);
INSERT INTO `visitors` VALUES (102, '127.0.0.15', '2022-04-15 00:00:00', NULL);
INSERT INTO `visitors` VALUES (103, '127.0.0.16', '2022-04-16 00:00:00', NULL);
INSERT INTO `visitors` VALUES (104, '127.0.0.17', '2022-04-17 00:00:00', NULL);
INSERT INTO `visitors` VALUES (105, '127.0.0.18', '2022-04-18 00:00:00', NULL);
INSERT INTO `visitors` VALUES (106, '127.0.0.19', '2022-04-19 00:00:00', NULL);
INSERT INTO `visitors` VALUES (107, '127.0.0.20', '2022-04-20 00:00:00', NULL);
INSERT INTO `visitors` VALUES (108, '127.0.0.21', '2022-04-21 00:00:00', NULL);
INSERT INTO `visitors` VALUES (109, '127.0.0.22', '2022-04-22 00:00:00', NULL);
INSERT INTO `visitors` VALUES (110, '127.0.0.23', '2022-04-23 00:00:00', NULL);
INSERT INTO `visitors` VALUES (111, '127.0.0.24', '2022-04-24 00:00:00', NULL);
INSERT INTO `visitors` VALUES (112, '127.0.0.25', '2022-04-25 00:00:00', NULL);
INSERT INTO `visitors` VALUES (113, '127.0.0.26', '2022-04-26 00:00:00', NULL);
INSERT INTO `visitors` VALUES (114, '127.0.0.27', '2022-04-27 00:00:00', NULL);
INSERT INTO `visitors` VALUES (115, '127.0.0.28', '2022-04-28 00:00:00', NULL);
INSERT INTO `visitors` VALUES (116, '127.0.0.29', '2022-04-29 00:00:00', NULL);
INSERT INTO `visitors` VALUES (117, '127.0.0.30', '2022-04-30 00:00:00', NULL);
INSERT INTO `visitors` VALUES (118, '127.0.0.1', '2022-04-01 00:00:00', NULL);
INSERT INTO `visitors` VALUES (119, '127.0.0.2', '2022-04-02 00:00:00', NULL);
INSERT INTO `visitors` VALUES (120, '127.0.0.3', '2022-04-03 00:00:00', NULL);
INSERT INTO `visitors` VALUES (121, '127.0.0.4', '2022-04-04 00:00:00', NULL);
INSERT INTO `visitors` VALUES (122, '127.0.0.5', '2022-04-05 00:00:00', NULL);
INSERT INTO `visitors` VALUES (123, '127.0.0.6', '2022-04-06 00:00:00', NULL);
INSERT INTO `visitors` VALUES (124, '127.0.0.7', '2022-04-07 00:00:00', NULL);
INSERT INTO `visitors` VALUES (125, '127.0.0.8', '2022-04-08 00:00:00', NULL);
INSERT INTO `visitors` VALUES (126, '127.0.0.9', '2022-04-09 00:00:00', NULL);
INSERT INTO `visitors` VALUES (127, '127.0.0.10', '2022-04-10 00:00:00', NULL);
INSERT INTO `visitors` VALUES (128, '127.0.0.11', '2022-04-11 00:00:00', NULL);
INSERT INTO `visitors` VALUES (129, '127.0.0.12', '2022-04-12 00:00:00', NULL);
INSERT INTO `visitors` VALUES (130, '127.0.0.13', '2022-04-13 00:00:00', NULL);
INSERT INTO `visitors` VALUES (131, '127.0.0.14', '2022-04-14 00:00:00', NULL);
INSERT INTO `visitors` VALUES (132, '127.0.0.15', '2022-04-15 00:00:00', NULL);
INSERT INTO `visitors` VALUES (133, '127.0.0.16', '2022-04-16 00:00:00', NULL);
INSERT INTO `visitors` VALUES (134, '127.0.0.17', '2022-04-17 00:00:00', NULL);
INSERT INTO `visitors` VALUES (135, '127.0.0.18', '2022-04-18 00:00:00', NULL);
INSERT INTO `visitors` VALUES (136, '127.0.0.19', '2022-04-19 00:00:00', NULL);
INSERT INTO `visitors` VALUES (137, '127.0.0.20', '2022-04-20 00:00:00', NULL);
INSERT INTO `visitors` VALUES (138, '127.0.0.21', '2022-04-21 00:00:00', NULL);
INSERT INTO `visitors` VALUES (139, '127.0.0.22', '2022-04-22 00:00:00', NULL);
INSERT INTO `visitors` VALUES (140, '127.0.0.23', '2022-04-23 00:00:00', NULL);
INSERT INTO `visitors` VALUES (141, '127.0.0.24', '2022-04-24 00:00:00', NULL);
INSERT INTO `visitors` VALUES (142, '127.0.0.25', '2022-04-25 00:00:00', NULL);
INSERT INTO `visitors` VALUES (143, '127.0.0.26', '2022-04-26 00:00:00', NULL);
INSERT INTO `visitors` VALUES (144, '127.0.0.27', '2022-04-27 00:00:00', NULL);
INSERT INTO `visitors` VALUES (145, '127.0.0.28', '2022-04-28 00:00:00', NULL);
INSERT INTO `visitors` VALUES (146, '127.0.0.29', '2022-04-29 00:00:00', NULL);
INSERT INTO `visitors` VALUES (147, '127.0.0.1', '2022-04-01 00:00:00', NULL);
INSERT INTO `visitors` VALUES (148, '127.0.0.2', '2022-04-02 00:00:00', NULL);
INSERT INTO `visitors` VALUES (149, '127.0.0.3', '2022-04-03 00:00:00', NULL);
INSERT INTO `visitors` VALUES (150, '127.0.0.4', '2022-04-04 00:00:00', NULL);
INSERT INTO `visitors` VALUES (151, '127.0.0.5', '2022-04-05 00:00:00', NULL);
INSERT INTO `visitors` VALUES (152, '127.0.0.6', '2022-04-06 00:00:00', NULL);
INSERT INTO `visitors` VALUES (153, '127.0.0.7', '2022-04-07 00:00:00', NULL);
INSERT INTO `visitors` VALUES (154, '127.0.0.8', '2022-04-08 00:00:00', NULL);
INSERT INTO `visitors` VALUES (155, '127.0.0.9', '2022-04-09 00:00:00', NULL);
INSERT INTO `visitors` VALUES (156, '127.0.0.10', '2022-04-10 00:00:00', NULL);
INSERT INTO `visitors` VALUES (157, '127.0.0.11', '2022-04-11 00:00:00', NULL);
INSERT INTO `visitors` VALUES (158, '127.0.0.12', '2022-04-12 00:00:00', NULL);
INSERT INTO `visitors` VALUES (159, '127.0.0.13', '2022-04-13 00:00:00', NULL);
INSERT INTO `visitors` VALUES (160, '127.0.0.14', '2022-04-14 00:00:00', NULL);
INSERT INTO `visitors` VALUES (161, '127.0.0.15', '2022-04-15 00:00:00', NULL);
INSERT INTO `visitors` VALUES (162, '127.0.0.16', '2022-04-16 00:00:00', NULL);
INSERT INTO `visitors` VALUES (163, '127.0.0.17', '2022-04-17 00:00:00', NULL);
INSERT INTO `visitors` VALUES (164, '127.0.0.18', '2022-04-18 00:00:00', NULL);
INSERT INTO `visitors` VALUES (165, '127.0.0.19', '2022-04-19 00:00:00', NULL);
INSERT INTO `visitors` VALUES (166, '127.0.0.20', '2022-04-20 00:00:00', NULL);
INSERT INTO `visitors` VALUES (167, '127.0.0.21', '2022-04-21 00:00:00', NULL);
INSERT INTO `visitors` VALUES (168, '127.0.0.22', '2022-04-22 00:00:00', NULL);
INSERT INTO `visitors` VALUES (169, '127.0.0.23', '2022-04-23 00:00:00', NULL);
INSERT INTO `visitors` VALUES (170, '127.0.0.24', '2022-04-24 00:00:00', NULL);
INSERT INTO `visitors` VALUES (171, '127.0.0.25', '2022-04-25 00:00:00', NULL);
INSERT INTO `visitors` VALUES (172, '127.0.0.26', '2022-04-26 00:00:00', NULL);
INSERT INTO `visitors` VALUES (173, '127.0.0.27', '2022-04-27 00:00:00', NULL);
INSERT INTO `visitors` VALUES (174, '127.0.0.28', '2022-04-28 00:00:00', NULL);
INSERT INTO `visitors` VALUES (175, '127.0.0.29', '2022-04-29 00:00:00', NULL);
INSERT INTO `visitors` VALUES (176, '127.0.0.30', '2022-04-30 00:00:00', NULL);
INSERT INTO `visitors` VALUES (177, '127.0.0.1', '2022-05-12 07:42:39', '2022-05-12 07:42:39');
INSERT INTO `visitors` VALUES (178, '127.0.0.1', '2022-05-12 08:27:54', '2022-05-12 08:27:54');
INSERT INTO `visitors` VALUES (179, '127.0.0.1', '2022-05-12 08:32:48', '2022-05-12 08:32:48');
INSERT INTO `visitors` VALUES (180, '127.0.0.1', '2022-05-12 08:33:30', '2022-05-12 08:33:30');
INSERT INTO `visitors` VALUES (181, '127.0.0.1', '2022-05-12 08:34:09', '2022-05-12 08:34:09');
INSERT INTO `visitors` VALUES (182, '127.0.0.1', '2022-05-12 08:34:45', '2022-05-12 08:34:45');
INSERT INTO `visitors` VALUES (183, '127.0.0.1', '2022-05-12 08:38:07', '2022-05-12 08:38:07');
INSERT INTO `visitors` VALUES (184, '127.0.0.1', '2022-05-12 08:38:11', '2022-05-12 08:38:11');
INSERT INTO `visitors` VALUES (185, '127.0.0.1', '2022-05-12 08:56:36', '2022-05-12 08:56:36');
INSERT INTO `visitors` VALUES (186, '127.0.0.1', '2022-05-12 13:13:27', '2022-05-12 13:13:27');
INSERT INTO `visitors` VALUES (187, '127.0.0.1', '2022-05-12 13:29:44', '2022-05-12 13:29:44');
INSERT INTO `visitors` VALUES (188, '127.0.0.1', '2022-05-12 13:30:10', '2022-05-12 13:30:10');
INSERT INTO `visitors` VALUES (189, '127.0.0.1', '2022-05-12 13:47:58', '2022-05-12 13:47:58');
INSERT INTO `visitors` VALUES (190, '127.0.0.1', '2022-05-12 13:48:23', '2022-05-12 13:48:23');
INSERT INTO `visitors` VALUES (191, '127.0.0.1', '2022-05-12 13:48:49', '2022-05-12 13:48:49');
INSERT INTO `visitors` VALUES (192, '127.0.0.1', '2022-05-12 13:49:24', '2022-05-12 13:49:24');
INSERT INTO `visitors` VALUES (193, '127.0.0.1', '2022-05-12 13:52:56', '2022-05-12 13:52:56');
INSERT INTO `visitors` VALUES (194, '127.0.0.1', '2022-05-12 13:54:50', '2022-05-12 13:54:50');
INSERT INTO `visitors` VALUES (195, '127.0.0.1', '2022-05-12 13:54:57', '2022-05-12 13:54:57');
INSERT INTO `visitors` VALUES (196, '127.0.0.1', '2022-05-12 13:55:28', '2022-05-12 13:55:28');
INSERT INTO `visitors` VALUES (197, '127.0.0.1', '2022-05-12 13:57:53', '2022-05-12 13:57:53');
INSERT INTO `visitors` VALUES (198, '127.0.0.1', '2022-05-12 13:57:53', '2022-05-12 13:57:53');
INSERT INTO `visitors` VALUES (199, '127.0.0.1', '2022-05-12 13:59:16', '2022-05-12 13:59:16');
INSERT INTO `visitors` VALUES (200, '127.0.0.1', '2022-05-12 14:06:29', '2022-05-12 14:06:29');
INSERT INTO `visitors` VALUES (201, '127.0.0.1', '2022-05-12 14:06:31', '2022-05-12 14:06:31');
INSERT INTO `visitors` VALUES (202, '127.0.0.1', '2022-05-12 14:11:19', '2022-05-12 14:11:19');
INSERT INTO `visitors` VALUES (203, '127.0.0.1', '2022-05-12 14:11:23', '2022-05-12 14:11:23');
INSERT INTO `visitors` VALUES (204, '127.0.0.1', '2022-05-12 14:11:31', '2022-05-12 14:11:31');
INSERT INTO `visitors` VALUES (205, '127.0.0.1', '2022-05-12 14:11:35', '2022-05-12 14:11:35');
INSERT INTO `visitors` VALUES (206, '127.0.0.1', '2022-05-12 14:12:19', '2022-05-12 14:12:19');
INSERT INTO `visitors` VALUES (207, '127.0.0.1', '2022-05-12 14:14:51', '2022-05-12 14:14:51');
INSERT INTO `visitors` VALUES (208, '127.0.0.1', '2022-05-12 14:24:23', '2022-05-12 14:24:23');
INSERT INTO `visitors` VALUES (209, '127.0.0.1', '2022-05-12 14:32:31', '2022-05-12 14:32:31');
INSERT INTO `visitors` VALUES (210, '127.0.0.1', '2022-05-12 14:32:32', '2022-05-12 14:32:32');
INSERT INTO `visitors` VALUES (211, '127.0.0.1', '2022-05-12 14:32:32', '2022-05-12 14:32:32');
INSERT INTO `visitors` VALUES (212, '127.0.0.1', '2022-05-12 14:34:10', '2022-05-12 14:34:10');
INSERT INTO `visitors` VALUES (213, '127.0.0.1', '2022-05-13 08:12:41', '2022-05-13 08:12:41');
INSERT INTO `visitors` VALUES (214, '127.0.0.1', '2022-05-13 08:23:35', '2022-05-13 08:23:35');
INSERT INTO `visitors` VALUES (215, '127.0.0.1', '2022-05-13 08:32:44', '2022-05-13 08:32:44');
INSERT INTO `visitors` VALUES (216, '127.0.0.1', '2022-05-13 08:32:52', '2022-05-13 08:32:52');
INSERT INTO `visitors` VALUES (217, '127.0.0.1', '2022-05-13 08:33:31', '2022-05-13 08:33:31');
INSERT INTO `visitors` VALUES (218, '127.0.0.1', '2022-05-13 08:33:46', '2022-05-13 08:33:46');
INSERT INTO `visitors` VALUES (219, '127.0.0.1', '2022-05-13 08:33:52', '2022-05-13 08:33:52');
INSERT INTO `visitors` VALUES (220, '127.0.0.1', '2022-05-13 08:34:05', '2022-05-13 08:34:05');
INSERT INTO `visitors` VALUES (221, '127.0.0.1', '2022-05-13 08:34:30', '2022-05-13 08:34:30');
INSERT INTO `visitors` VALUES (222, '127.0.0.1', '2022-05-13 08:34:55', '2022-05-13 08:34:55');
INSERT INTO `visitors` VALUES (223, '127.0.0.1', '2022-05-13 08:35:19', '2022-05-13 08:35:19');
INSERT INTO `visitors` VALUES (224, '127.0.0.1', '2022-05-13 08:36:40', '2022-05-13 08:36:40');
INSERT INTO `visitors` VALUES (225, '127.0.0.1', '2022-05-13 08:51:25', '2022-05-13 08:51:25');
INSERT INTO `visitors` VALUES (226, '127.0.0.1', '2022-05-13 08:51:36', '2022-05-13 08:51:36');
INSERT INTO `visitors` VALUES (227, '127.0.0.1', '2022-05-13 08:52:06', '2022-05-13 08:52:06');
INSERT INTO `visitors` VALUES (228, '127.0.0.1', '2022-05-13 08:52:49', '2022-05-13 08:52:49');
INSERT INTO `visitors` VALUES (229, '127.0.0.1', '2022-05-13 09:02:29', '2022-05-13 09:02:29');
INSERT INTO `visitors` VALUES (230, '127.0.0.1', '2022-05-13 11:00:11', '2022-05-13 11:00:11');
INSERT INTO `visitors` VALUES (231, '127.0.0.1', '2022-05-13 11:03:30', '2022-05-13 11:03:30');
INSERT INTO `visitors` VALUES (232, '127.0.0.1', '2022-05-13 11:03:33', '2022-05-13 11:03:33');
INSERT INTO `visitors` VALUES (233, '127.0.0.1', '2022-05-13 11:14:03', '2022-05-13 11:14:03');
INSERT INTO `visitors` VALUES (234, '127.0.0.1', '2022-05-13 11:15:37', '2022-05-13 11:15:37');
INSERT INTO `visitors` VALUES (235, '127.0.0.1', '2022-05-13 11:16:25', '2022-05-13 11:16:25');
INSERT INTO `visitors` VALUES (236, '127.0.0.1', '2022-05-13 11:22:50', '2022-05-13 11:22:50');
INSERT INTO `visitors` VALUES (237, '127.0.0.1', '2022-05-13 11:23:08', '2022-05-13 11:23:08');
INSERT INTO `visitors` VALUES (238, '127.0.0.1', '2022-05-13 11:51:05', '2022-05-13 11:51:05');
INSERT INTO `visitors` VALUES (239, '127.0.0.1', '2022-05-13 11:51:54', '2022-05-13 11:51:54');
INSERT INTO `visitors` VALUES (240, '127.0.0.1', '2022-05-13 11:52:27', '2022-05-13 11:52:27');
INSERT INTO `visitors` VALUES (241, '127.0.0.1', '2022-05-13 11:55:48', '2022-05-13 11:55:48');
INSERT INTO `visitors` VALUES (242, '127.0.0.1', '2022-05-13 11:56:06', '2022-05-13 11:56:06');
INSERT INTO `visitors` VALUES (243, '127.0.0.1', '2022-05-13 11:56:27', '2022-05-13 11:56:27');
INSERT INTO `visitors` VALUES (244, '127.0.0.1', '2022-05-13 11:57:31', '2022-05-13 11:57:31');
INSERT INTO `visitors` VALUES (245, '127.0.0.1', '2022-05-13 12:03:31', '2022-05-13 12:03:31');
INSERT INTO `visitors` VALUES (246, '127.0.0.1', '2022-05-13 12:03:40', '2022-05-13 12:03:40');
INSERT INTO `visitors` VALUES (247, '127.0.0.1', '2022-05-13 12:03:50', '2022-05-13 12:03:50');
INSERT INTO `visitors` VALUES (248, '127.0.0.1', '2022-05-13 12:08:57', '2022-05-13 12:08:57');
INSERT INTO `visitors` VALUES (249, '127.0.0.1', '2022-05-13 12:24:17', '2022-05-13 12:24:17');
INSERT INTO `visitors` VALUES (250, '127.0.0.1', '2022-05-13 12:28:04', '2022-05-13 12:28:04');
INSERT INTO `visitors` VALUES (251, '127.0.0.1', '2022-05-13 12:28:23', '2022-05-13 12:28:23');
INSERT INTO `visitors` VALUES (252, '127.0.0.1', '2022-05-13 12:28:31', '2022-05-13 12:28:31');
INSERT INTO `visitors` VALUES (253, '127.0.0.1', '2022-05-13 12:33:18', '2022-05-13 12:33:18');
INSERT INTO `visitors` VALUES (254, '127.0.0.1', '2022-05-13 12:33:47', '2022-05-13 12:33:47');
INSERT INTO `visitors` VALUES (255, '127.0.0.1', '2022-05-13 12:33:54', '2022-05-13 12:33:54');
INSERT INTO `visitors` VALUES (256, '127.0.0.1', '2022-05-13 12:33:59', '2022-05-13 12:33:59');
INSERT INTO `visitors` VALUES (257, '127.0.0.1', '2022-05-13 12:34:00', '2022-05-13 12:34:00');
INSERT INTO `visitors` VALUES (258, '127.0.0.1', '2022-05-13 12:34:37', '2022-05-13 12:34:37');
INSERT INTO `visitors` VALUES (259, '127.0.0.1', '2022-05-13 12:40:06', '2022-05-13 12:40:06');
INSERT INTO `visitors` VALUES (260, '127.0.0.1', '2022-05-13 13:26:58', '2022-05-13 13:26:58');
INSERT INTO `visitors` VALUES (261, '127.0.0.1', '2022-05-13 13:28:04', '2022-05-13 13:28:04');
INSERT INTO `visitors` VALUES (262, '127.0.0.1', '2022-05-13 13:28:14', '2022-05-13 13:28:14');
INSERT INTO `visitors` VALUES (263, '127.0.0.1', '2022-05-13 13:29:34', '2022-05-13 13:29:34');
INSERT INTO `visitors` VALUES (264, '127.0.0.1', '2022-05-13 13:30:59', '2022-05-13 13:30:59');
INSERT INTO `visitors` VALUES (265, '127.0.0.1', '2022-05-14 05:54:59', '2022-05-14 05:54:59');
INSERT INTO `visitors` VALUES (266, '127.0.0.1', '2022-05-14 05:55:05', '2022-05-14 05:55:05');
INSERT INTO `visitors` VALUES (267, '127.0.0.1', '2022-05-14 05:56:06', '2022-05-14 05:56:06');
INSERT INTO `visitors` VALUES (268, '127.0.0.1', '2022-05-14 06:00:14', '2022-05-14 06:00:14');
INSERT INTO `visitors` VALUES (269, '127.0.0.1', '2022-05-14 06:00:22', '2022-05-14 06:00:22');
INSERT INTO `visitors` VALUES (270, '127.0.0.1', '2022-05-14 06:00:29', '2022-05-14 06:00:29');
INSERT INTO `visitors` VALUES (271, '127.0.0.1', '2022-05-14 06:00:35', '2022-05-14 06:00:35');
INSERT INTO `visitors` VALUES (272, '127.0.0.1', '2022-05-14 06:00:36', '2022-05-14 06:00:36');
INSERT INTO `visitors` VALUES (273, '127.0.0.1', '2022-05-14 06:01:57', '2022-05-14 06:01:57');
INSERT INTO `visitors` VALUES (274, '127.0.0.1', '2022-05-14 06:02:04', '2022-05-14 06:02:04');
INSERT INTO `visitors` VALUES (275, '127.0.0.1', '2022-05-14 06:02:04', '2022-05-14 06:02:04');
INSERT INTO `visitors` VALUES (276, '127.0.0.1', '2022-05-14 06:05:10', '2022-05-14 06:05:10');
INSERT INTO `visitors` VALUES (277, '127.0.0.1', '2022-05-14 06:05:35', '2022-05-14 06:05:35');
INSERT INTO `visitors` VALUES (278, '127.0.0.1', '2022-05-14 06:05:37', '2022-05-14 06:05:37');
INSERT INTO `visitors` VALUES (279, '127.0.0.1', '2022-05-14 06:05:54', '2022-05-14 06:05:54');
INSERT INTO `visitors` VALUES (280, '127.0.0.1', '2022-05-14 06:05:54', '2022-05-14 06:05:54');
INSERT INTO `visitors` VALUES (281, '127.0.0.1', '2022-05-14 06:05:57', '2022-05-14 06:05:57');
INSERT INTO `visitors` VALUES (282, '127.0.0.1', '2022-05-14 06:05:59', '2022-05-14 06:05:59');
INSERT INTO `visitors` VALUES (283, '127.0.0.1', '2022-05-14 06:06:06', '2022-05-14 06:06:06');
INSERT INTO `visitors` VALUES (284, '127.0.0.1', '2022-05-14 06:06:06', '2022-05-14 06:06:06');
INSERT INTO `visitors` VALUES (285, '127.0.0.1', '2022-05-14 06:06:54', '2022-05-14 06:06:54');
INSERT INTO `visitors` VALUES (286, '127.0.0.1', '2022-05-14 06:06:58', '2022-05-14 06:06:58');
INSERT INTO `visitors` VALUES (287, '127.0.0.1', '2022-05-14 06:07:46', '2022-05-14 06:07:46');
INSERT INTO `visitors` VALUES (288, '127.0.0.1', '2022-05-14 06:08:27', '2022-05-14 06:08:27');
INSERT INTO `visitors` VALUES (289, '127.0.0.1', '2022-05-14 06:08:54', '2022-05-14 06:08:54');
INSERT INTO `visitors` VALUES (290, '127.0.0.1', '2022-05-14 06:08:55', '2022-05-14 06:08:55');
INSERT INTO `visitors` VALUES (291, '127.0.0.1', '2022-05-14 06:09:15', '2022-05-14 06:09:15');
INSERT INTO `visitors` VALUES (292, '127.0.0.1', '2022-05-14 06:09:29', '2022-05-14 06:09:29');
INSERT INTO `visitors` VALUES (293, '127.0.0.1', '2022-05-14 06:11:09', '2022-05-14 06:11:09');
INSERT INTO `visitors` VALUES (294, '127.0.0.1', '2022-05-14 06:11:21', '2022-05-14 06:11:21');
INSERT INTO `visitors` VALUES (295, '127.0.0.1', '2022-05-14 06:12:04', '2022-05-14 06:12:04');
INSERT INTO `visitors` VALUES (296, '127.0.0.1', '2022-05-14 06:12:14', '2022-05-14 06:12:14');
INSERT INTO `visitors` VALUES (297, '127.0.0.1', '2022-05-14 06:12:37', '2022-05-14 06:12:37');
INSERT INTO `visitors` VALUES (298, '127.0.0.1', '2022-05-14 06:14:26', '2022-05-14 06:14:26');
INSERT INTO `visitors` VALUES (299, '127.0.0.1', '2022-05-14 06:14:28', '2022-05-14 06:14:28');
INSERT INTO `visitors` VALUES (300, '127.0.0.1', '2022-05-14 06:18:09', '2022-05-14 06:18:09');
INSERT INTO `visitors` VALUES (301, '127.0.0.1', '2022-05-14 06:18:10', '2022-05-14 06:18:10');
INSERT INTO `visitors` VALUES (302, '127.0.0.1', '2022-05-14 06:18:25', '2022-05-14 06:18:25');
INSERT INTO `visitors` VALUES (303, '127.0.0.1', '2022-05-14 06:18:44', '2022-05-14 06:18:44');
INSERT INTO `visitors` VALUES (304, '127.0.0.1', '2022-05-14 06:18:55', '2022-05-14 06:18:55');
INSERT INTO `visitors` VALUES (305, '127.0.0.1', '2022-05-14 06:19:03', '2022-05-14 06:19:03');
INSERT INTO `visitors` VALUES (306, '127.0.0.1', '2022-05-14 06:19:06', '2022-05-14 06:19:06');
INSERT INTO `visitors` VALUES (307, '127.0.0.1', '2022-05-14 06:19:08', '2022-05-14 06:19:08');
INSERT INTO `visitors` VALUES (308, '127.0.0.1', '2022-05-14 06:20:51', '2022-05-14 06:20:51');
INSERT INTO `visitors` VALUES (309, '127.0.0.1', '2022-05-14 06:20:52', '2022-05-14 06:20:52');
INSERT INTO `visitors` VALUES (310, '127.0.0.1', '2022-05-14 06:21:04', '2022-05-14 06:21:04');
INSERT INTO `visitors` VALUES (311, '127.0.0.1', '2022-05-14 06:21:04', '2022-05-14 06:21:04');
INSERT INTO `visitors` VALUES (312, '127.0.0.1', '2022-05-14 23:25:38', '2022-05-14 23:25:38');
INSERT INTO `visitors` VALUES (313, '127.0.0.1', '2022-05-14 23:36:35', '2022-05-14 23:36:35');
INSERT INTO `visitors` VALUES (314, '127.0.0.1', '2022-05-14 23:37:33', '2022-05-14 23:37:33');
INSERT INTO `visitors` VALUES (315, '127.0.0.1', '2022-05-14 23:37:46', '2022-05-14 23:37:46');
INSERT INTO `visitors` VALUES (316, '127.0.0.1', '2022-05-15 09:06:26', '2022-05-15 09:06:26');

SET FOREIGN_KEY_CHECKS = 1;
