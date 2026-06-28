-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2026 at 11:50 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ya`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Memperbarui proyek: Renovasi Gedung Juang', '2026-04-21 00:33:54', '2026-04-21 00:33:54'),
(2, 1, 'Membuat proyek baru: pembuatan hotel', '2026-04-21 00:34:36', '2026-04-21 00:34:36'),
(3, 1, 'Memperbarui proyek: Renovasi Gedung olahraga', '2026-04-21 02:17:53', '2026-04-21 02:17:53'),
(4, 1, 'Membuat proyek baru: pembuatan hotel di cirebon', '2026-04-22 05:19:15', '2026-04-22 05:19:15'),
(5, 1, 'Menambahkan Supplier: perusahaan cobaan', '2026-04-24 23:42:26', '2026-04-24 23:42:26'),
(6, 4, 'Menambahkan Master Material: Semen Tiga Roda', '2026-04-24 23:56:46', '2026-04-24 23:56:46'),
(7, 4, 'Menambahkan Supplier: PT Semen Indonesia', '2026-04-24 23:58:04', '2026-04-24 23:58:04'),
(8, 1, 'Menambahkan Master Material: besi', '2026-04-25 00:05:41', '2026-04-25 00:05:41'),
(9, 3, 'Menambahkan Master Material: besi', '2026-04-25 00:10:33', '2026-04-25 00:10:33'),
(10, 1, 'Menambah material batu ke proyek Pembangunan Jembatan Merdeka', '2026-04-26 19:39:55', '2026-04-26 19:39:55'),
(11, 1, 'Menambah material semen ke proyek Pembangunan Jembatan Merdeka', '2026-04-26 19:40:38', '2026-04-26 19:40:38'),
(12, 1, 'Memperbarui Master Material: Semen (Sak)', '2026-04-26 19:42:44', '2026-04-26 19:42:44'),
(13, 1, 'Mengajukan Permintaan Material MR-20260427-3B0C', '2026-04-26 20:34:11', '2026-04-26 20:34:11'),
(14, 1, 'Menambah material Semen Tiga Roda ke proyek Pembangunan Jembatan Merdeka', '2026-04-26 20:34:36', '2026-04-26 20:34:36'),
(15, 2, 'Mengajukan Permintaan Material MR-20260427-8EC8', '2026-04-26 23:06:09', '2026-04-26 23:06:09'),
(16, 3, 'Membuat Purchase Order PO-20260427-3A0C', '2026-04-26 23:08:51', '2026-04-26 23:08:51'),
(17, 3, 'Membuat draft Stock Opname tanggal 2026-04-27', '2026-04-26 23:09:19', '2026-04-26 23:09:19'),
(18, 1, 'Menyetujui permintaan material MR-20260427-8EC8', '2026-04-26 23:11:02', '2026-04-26 23:11:02'),
(19, 1, 'Menambah material semen ke proyek Renovasi Gedung olahraga', '2026-04-26 23:14:16', '2026-04-26 23:14:16'),
(20, 1, 'Memperbarui material semen pada proyek Pembangunan Jembatan Merdeka', '2026-04-27 00:17:07', '2026-04-27 00:17:07'),
(21, 1, 'Menghapus material semen dari proyek Pembangunan Jembatan Merdeka', '2026-04-27 00:21:26', '2026-04-27 00:21:26'),
(22, 1, 'Memperbarui material Semen Tiga Roda pada proyek Pembangunan Jembatan Merdeka', '2026-04-27 00:34:45', '2026-04-27 00:34:45'),
(23, 1, 'Memperbarui material semen pada proyek Pembangunan Jembatan Merdeka', '2026-06-17 03:19:26', '2026-06-17 03:19:26'),
(24, 1, 'Memperbarui Master Material: besi', '2026-06-17 03:23:10', '2026-06-17 03:23:10'),
(25, 1, 'Memperbarui Master Material: besi', '2026-06-17 03:23:39', '2026-06-17 03:23:39'),
(26, 1, 'Memperbarui Master Material: besi', '2026-06-17 03:24:03', '2026-06-17 03:24:03'),
(27, 1, 'Memperbarui Supplier: PT Semen Indonesia', '2026-06-17 03:24:33', '2026-06-17 03:24:33'),
(28, 1, 'Menambahkan Master Material: Besi beton 8 mm', '2026-06-17 07:01:22', '2026-06-17 07:01:22'),
(29, 1, 'Menambahkan Master Material: Batu Bata', '2026-06-18 03:22:25', '2026-06-18 03:22:25'),
(30, 1, 'Membuat Purchase Order PO-20260620-C995', '2026-06-19 22:08:32', '2026-06-19 22:08:32'),
(31, 1, 'Menerima barang PO PO-20260620-C995. Stok bertambah.', '2026-06-19 22:52:07', '2026-06-19 22:52:07'),
(32, 3, 'Menerima barang PO PO-20260427-3A0C. Stok bertambah.', '2026-06-23 00:23:14', '2026-06-23 00:23:14'),
(33, 3, 'Memperbarui Master Material: semen', '2026-06-23 03:16:52', '2026-06-23 03:16:52'),
(34, 3, 'Membuat Purchase Order PO-20260623-35E2', '2026-06-23 03:18:35', '2026-06-23 03:18:35'),
(35, 3, 'Menerima barang PO PO-20260623-35E2. Stok bertambah.', '2026-06-23 03:18:46', '2026-06-23 03:18:46'),
(36, 3, 'Menyetujui permintaan material MR-20260427-3B0C', '2026-06-23 03:19:51', '2026-06-23 03:19:51'),
(37, 3, 'Mengirim barang untuk permintaan MR-20260427-8EC8', '2026-06-23 03:20:03', '2026-06-23 03:20:03'),
(38, 1, 'Memperbarui material semen pada proyek Pembangunan Jembatan Merdeka', '2026-06-23 03:23:28', '2026-06-23 03:23:28'),
(39, 1, 'Update progres proyek Pembangunan Jembatan Merdeka menjadi 25% serta mencatat pemakaian material.', '2026-06-23 03:25:18', '2026-06-23 03:25:18'),
(40, 1, 'Membuat proyek baru: pembuatan gedung olahraga2', '2026-06-24 01:25:10', '2026-06-24 01:25:10'),
(41, 1, 'Membuat proyek baru: bangunan kantor', '2026-06-26 22:33:11', '2026-06-26 22:33:11'),
(42, 3, 'Menambahkan Supplier: PT  besi Indonesia', '2026-06-26 23:06:51', '2026-06-26 23:06:51'),
(43, 3, 'Menghapus Supplier: PT  besi Indonesia', '2026-06-26 23:07:09', '2026-06-26 23:07:09'),
(44, 3, 'Membuat Purchase Order PO-20260627-CD8F', '2026-06-26 23:07:47', '2026-06-26 23:07:47'),
(45, 1, 'Menerima barang PO PO-20260627-CD8F. Stok bertambah.', '2026-06-26 23:08:31', '2026-06-26 23:08:31'),
(46, 2, 'Mengajukan Permintaan Material MR-20260627-2E6F', '2026-06-26 23:16:26', '2026-06-26 23:16:26'),
(47, 3, 'Menyetujui permintaan material MR-20260627-2E6F', '2026-06-26 23:16:51', '2026-06-26 23:16:51'),
(48, 2, 'Mengonfirmasi penerimaan barang untuk permintaan MR-20260427-8EC8', '2026-06-26 23:40:56', '2026-06-26 23:40:56'),
(49, 2, 'Menambah material Thinner / minyak cat ke proyek Pembangunan Jembatan Merdeka', '2026-06-26 23:41:33', '2026-06-26 23:41:33'),
(50, 2, 'Mengajukan Permintaan Material MR-20260627-406C', '2026-06-26 23:42:42', '2026-06-26 23:42:42'),
(51, 1, 'Menyetujui permintaan material MR-20260627-406C', '2026-06-26 23:43:24', '2026-06-26 23:43:24'),
(52, 3, 'Membuat Purchase Order PO-20260627-CE7F', '2026-06-26 23:47:21', '2026-06-26 23:47:21'),
(53, 3, 'Menerima barang PO PO-20260627-CE7F. Stok bertambah.', '2026-06-26 23:47:30', '2026-06-26 23:47:30'),
(54, 2, 'Mengajukan Permintaan Material MR-20260627-BAE3', '2026-06-26 23:48:50', '2026-06-26 23:48:50'),
(55, 3, 'Menyetujui permintaan material MR-20260627-BAE3', '2026-06-26 23:49:28', '2026-06-26 23:49:28'),
(56, 3, 'Mengirim barang untuk permintaan MR-20260627-BAE3', '2026-06-26 23:52:21', '2026-06-26 23:52:21'),
(57, 2, 'Mengonfirmasi penerimaan barang untuk permintaan MR-20260627-BAE3', '2026-06-26 23:53:15', '2026-06-26 23:53:15'),
(58, 3, 'Membuat Purchase Order PO-20260627-B74E', '2026-06-27 00:01:10', '2026-06-27 00:01:10'),
(59, 1, 'Menerima barang PO PO-20260627-B74E. Stok bertambah.', '2026-06-27 00:01:34', '2026-06-27 00:01:34'),
(60, 2, 'Mengajukan Permintaan Material MR-20260627-A131', '2026-06-27 00:07:26', '2026-06-27 00:07:26'),
(61, 1, 'Membuat Purchase Order PO-20260627-1142', '2026-06-27 00:59:46', '2026-06-27 00:59:46'),
(62, 3, 'Menerima barang PO PO-20260627-1142. Stok bertambah.', '2026-06-27 01:00:18', '2026-06-27 01:00:18'),
(63, 1, 'Membuat proyek baru: pembuatan hotel cirebon', '2026-06-27 01:12:05', '2026-06-27 01:12:05'),
(64, 1, 'Memperbarui proyek: pembuatan hotel cirebon', '2026-06-27 01:39:20', '2026-06-27 01:39:20'),
(65, 1, 'Update log harian proyek pembuatan hotel cirebon tanggal 2026-06-27 - Status: libur', '2026-06-27 01:44:23', '2026-06-27 01:44:23'),
(66, 1, 'Menghapus proyek: pembuatan hotel cirebon', '2026-06-27 02:03:57', '2026-06-27 02:03:57'),
(67, 1, 'Menghapus proyek: pembuatan hotel cirebon', '2026-06-27 02:04:03', '2026-06-27 02:04:03'),
(68, 1, 'Menghapus proyek: pembuatan gedung olahraga2', '2026-06-27 02:04:09', '2026-06-27 02:04:09'),
(69, 1, 'Menghapus proyek: bangunan kantor', '2026-06-27 02:04:16', '2026-06-27 02:04:16'),
(70, 1, 'Menghapus proyek: pembuatan hotel cirebon', '2026-06-27 02:04:23', '2026-06-27 02:04:23'),
(71, 1, 'Menghapus proyek: pembuatan hotel cirebon', '2026-06-27 02:04:29', '2026-06-27 02:04:29'),
(72, 1, 'Menghapus proyek: pembuatan hotel cirebon', '2026-06-27 02:04:35', '2026-06-27 02:04:35'),
(73, 1, 'Membuat proyek baru: pembuatan gedung olahraga2', '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(74, 1, 'Membuat proyek baru: pembuatan gedung olahraga2', '2026-06-27 02:05:18', '2026-06-27 02:05:18'),
(75, 1, 'Menghapus proyek: pembuatan gedung olahraga2', '2026-06-27 02:05:28', '2026-06-27 02:05:28'),
(76, 3, 'Memperbarui kebutuhan material Besi hollow pada proyek pembuatan gedung olahraga2', '2026-06-27 02:10:41', '2026-06-27 02:10:41'),
(77, 1, 'Membuat proyek baru: pembuatan gedung olahraga3', '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(78, 1, 'Membuat proyek baru: pembuatan gedung olahraga4', '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(79, 1, 'Membuat proyek baru dengan detail pekerjaan terpilih: pembuatan gedung olahraga5', '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(80, 1, 'Update log harian proyek pembuatan gedung olahraga5 tanggal 2026-06-28 - Status: libur', '2026-06-28 00:35:44', '2026-06-28 00:35:44'),
(81, 1, 'Memperbarui kebutuhan material Baja ringan profil C / stud 70x70 mm pada proyek pembuatan gedung olahraga5', '2026-06-28 00:37:11', '2026-06-28 00:37:11'),
(82, 3, 'Mengajukan/memperbarui kebutuhan material Cat road line warna kuning pada proyek pembuatan gedung olahraga2', '2026-06-28 00:51:16', '2026-06-28 00:51:16'),
(83, 1, 'Menyetujui perubahan kebutuhan material Cat road line warna kuning pada proyek pembuatan gedung olahraga2', '2026-06-28 00:51:58', '2026-06-28 00:51:58'),
(84, 3, 'Membuat Purchase Order PO-20260628-2F24', '2026-06-28 01:38:07', '2026-06-28 01:38:07'),
(85, 3, 'Menerima barang PO PO-20260628-2F24. Stok bertambah.', '2026-06-28 01:38:16', '2026-06-28 01:38:16'),
(86, 1, 'Update log harian proyek pembuatan gedung olahraga5 tanggal 2026-06-28 - Status: libur', '2026-06-28 02:14:02', '2026-06-28 02:14:02'),
(87, 1, 'Update log harian proyek pembuatan gedung olahraga5 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:14:46', '2026-06-28 02:14:46'),
(88, 1, 'Update log harian proyek pembuatan gedung olahraga4 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:15:45', '2026-06-28 02:15:45'),
(89, 1, 'Membuat proyek baru dengan detail pekerjaan terpilih: pembuatan gedung olahraga6', '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(90, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:20:10', '2026-06-28 02:20:10'),
(91, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-29 - Status: berjalan', '2026-06-28 02:20:39', '2026-06-28 02:20:39'),
(92, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-30 - Status: berjalan', '2026-06-28 02:21:43', '2026-06-28 02:21:43'),
(93, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:22:37', '2026-06-28 02:22:37'),
(94, 1, 'Update log harian proyek pembuatan hotel cirebon tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:23:55', '2026-06-28 02:23:55'),
(95, 1, 'Update log harian proyek pembuatan hotel cirebon tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:23:56', '2026-06-28 02:23:56'),
(96, 1, 'Update log harian proyek pembuatan hotel cirebon tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:24:08', '2026-06-28 02:24:08'),
(97, 1, 'Update log harian proyek pembuatan gedung olahraga2 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:30:15', '2026-06-28 02:30:15'),
(98, 1, 'Update log harian proyek pembuatan gedung olahraga2 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:31:54', '2026-06-28 02:31:54'),
(99, 1, 'Update log harian proyek pembuatan gedung olahraga2 tanggal 2026-06-29 - Status: berjalan', '2026-06-28 02:33:52', '2026-06-28 02:33:52'),
(100, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-07-01 - Status: berjalan', '2026-06-28 02:41:26', '2026-06-28 02:41:26'),
(101, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-07-01 - Status: berjalan', '2026-06-28 02:41:26', '2026-06-28 02:41:26'),
(102, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:42:16', '2026-06-28 02:42:16'),
(103, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-28 - Status: libur', '2026-06-28 02:42:37', '2026-06-28 02:42:37'),
(104, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-28 - Status: libur', '2026-06-28 02:44:47', '2026-06-28 02:44:47'),
(105, 1, 'Update log harian proyek pembuatan gedung olahraga6 tanggal 2026-06-28 - Status: berjalan', '2026-06-28 02:44:59', '2026-06-28 02:44:59');

-- --------------------------------------------------------

--
-- Table structure for table `daily_log_detail_pekerjaans`
--

CREATE TABLE `daily_log_detail_pekerjaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_daily_log_id` bigint(20) UNSIGNED NOT NULL,
  `detail_pekerjaan_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_log_detail_pekerjaans`
--

INSERT INTO `daily_log_detail_pekerjaans` (`id`, `project_daily_log_id`, `detail_pekerjaan_id`, `created_at`, `updated_at`) VALUES
(1, 2, 7, NULL, NULL),
(2, 2, 8, NULL, NULL),
(3, 3, 27, NULL, NULL),
(4, 3, 1, NULL, NULL),
(9, 5, 6, NULL, NULL),
(10, 5, 7, NULL, NULL),
(11, 6, 11, NULL, NULL),
(12, 6, 12, NULL, NULL),
(13, 13, 6, NULL, NULL),
(14, 13, 13, NULL, NULL),
(15, 4, 6, NULL, NULL),
(18, 4, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `daily_log_materials`
--

CREATE TABLE `daily_log_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_daily_log_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_used` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_log_materials`
--

INSERT INTO `daily_log_materials` (`id`, `project_daily_log_id`, `material_id`, `quantity_used`, `created_at`, `updated_at`) VALUES
(1, 2, 71, 1.00, '2026-06-28 02:14:46', '2026-06-28 02:14:46');

-- --------------------------------------------------------

--
-- Table structure for table `detail_materials`
--

CREATE TABLE `detail_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `detail_pekerjaan_id` bigint(20) UNSIGNED NOT NULL,
  `nama_material` varchar(255) NOT NULL,
  `spesifikasi` varchar(255) DEFAULT NULL,
  `qty` decimal(10,2) NOT NULL DEFAULT 0.00,
  `satuan` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_materials`
--

INSERT INTO `detail_materials` (`id`, `detail_pekerjaan_id`, `nama_material`, `spesifikasi`, `qty`, `satuan`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Thinner / minyak cat', NULL, 1.00, 'M3', NULL, '2026-06-23 23:53:53', '2026-06-23 23:53:53'),
(2, 2, 'Kawat las', '10', 1.00, 'roll', NULL, '2026-06-23 23:54:40', '2026-06-23 23:54:40'),
(3, 1, 'Baja CNP 125', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(4, 1, 'Besi hollow', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(5, 1, 'Kawat las', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(6, 2, 'Pipa hitam 3 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(7, 2, 'Baut sambungan rangka baja', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(8, 3, 'Anchor bolt pondasi / base plate', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(9, 3, 'Besi siku 40x40 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(10, 4, 'Cat dasar', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(11, 4, 'Cat Emco Warna Semeru Blue 28', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(12, 4, 'Cat Emco Warna White', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(13, 4, 'Thinner / minyak cat', NULL, 1.00, 'ltr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(14, 4, 'Perlengkapan pengecatan amplas', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(15, 4, 'Cat anti karat Zinc chromate primer', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(16, 5, 'Lembaran zincalume panjang 6 m', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(17, 5, 'Seng talang datar', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(18, 5, 'Pagar BRC Tinggi 1', NULL, 1.00, 'm1', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(19, 5, 'Pipa galvanis 3 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(20, 5, 'Wiremesh M8', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(21, 6, 'Baja ringan profil C / stud 70x70 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(22, 6, 'Papan gypsum 12 mm', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(23, 6, 'Papan gypsum 9 mm', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(24, 6, 'Compound gypsum', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(25, 6, 'Sekrup gypsum', NULL, 1.00, 'box', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(26, 7, 'Baja ringan profil C / stud 70x70 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(27, 7, 'Papan gypsum 9 mm', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(28, 7, 'Compound gypsum', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(29, 7, 'Sekrup gypsum', NULL, 1.00, 'box', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(30, 8, 'Bata', NULL, 1.00, 'bh', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(31, 8, 'Semen', NULL, 1.00, 'zak', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(32, 8, 'Pasir', NULL, 1.00, 'm3', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(33, 8, 'Besi beton diameter 10 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(34, 8, 'Besi beton diameter 8 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(35, 8, 'Kawat bendrat', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(36, 8, 'Papan bekisting', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(37, 8, 'Roster beton 40x19x15 cm', NULL, 1.00, 'bh', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(38, 9, 'Keramik lantai 40x40 cm', NULL, 1.00, 'dus', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(39, 9, 'Keramik lantai 30x30 cm', NULL, 1.00, 'dus', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(40, 9, 'Keramik lantai 20x20 cm', NULL, 1.00, 'dus', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(41, 9, 'Semen', NULL, 1.00, 'zak', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(42, 9, 'Pasir', NULL, 1.00, 'm3', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(43, 10, 'Keramik dinding 20x40 cm', NULL, 1.00, 'dus', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(44, 10, 'Semen', NULL, 1.00, 'zak', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(45, 11, 'Cat interior Dulux Brilliant White', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(46, 11, 'Cat interior', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(47, 11, 'Cat dasar', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(48, 11, 'Thinner / minyak cat', NULL, 1.00, 'ltr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(49, 11, 'Perlengkapan pengecatan amplas', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(50, 12, 'Cat Emco Warna Semeru Blue 28', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(51, 12, 'Cat Emco Warna White', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(52, 12, 'Thinner / minyak cat', NULL, 1.00, 'ltr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(53, 13, 'Cat road line warna kuning', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(54, 13, 'Thinner / minyak cat', NULL, 1.00, 'ltr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(55, 14, 'Cat interior Dulux Brilliant White', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(56, 14, 'Cat dasar', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(57, 14, 'Thinner / minyak cat', NULL, 1.00, 'ltr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(58, 14, 'Perlengkapan pengecatan amplas', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(59, 15, 'Pintu utama aluminium 1900x2500 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(60, 15, 'Pintu aluminium 950x2500 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(61, 15, 'Pintu standard aluminium 950x2100 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(62, 15, 'Pintu swing aluminium 950x2500 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(63, 15, 'Pintu toilet panel aluminium 850x2100 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(64, 15, 'Pintu toilet PVC', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(65, 15, 'Pintu gudang 4', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(66, 16, 'Jendela loket kasir 80x110 cm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(67, 16, 'Jendela kaca mati 750x1200 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(68, 16, 'Jendela kaca mati 1500x1200 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(69, 16, 'Jendela kaca mati 750x1600 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(70, 16, 'Jendela sliding 1500x1600 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(71, 16, 'Jendela sliding 1200x1500 mm', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(72, 17, 'Armatur lampu TL RM 1x36 W', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(73, 17, 'Armatur lampu TL RM 2x36 W', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(74, 17, 'Armatur lampu TKO-TL 1x36 W', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(75, 17, 'Armatur lampu TKO-TL 2x36 W', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(76, 17, 'Lampu emergency 2x14 W', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(77, 17, 'Lampu exit tulisan', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(78, 17, 'Lampu downlight outbow', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(79, 17, 'Lampu floodlight LED 100 W', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(80, 18, 'Saklar tunggal', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(81, 18, 'Saklar ganda', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(82, 18, 'Stop kontak', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(83, 18, 'Stop kontak AC', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(84, 18, 'Kipas angin model MWF-41K', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(85, 18, 'Exhaust fan 8 inch', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(86, 18, 'Grid switch 6 lubang', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(87, 18, 'Kabel NYM 3 x 2', NULL, 1.00, 'roll', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(88, 18, 'Pipa conduit 5/8 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(89, 19, 'Timer listrik', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(90, 19, 'Panel listrik induk', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(91, 19, 'MCB 10 A', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(92, 19, 'MCB 16 A', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(93, 19, 'Kabel power 4 x 25 mm2', NULL, 1.00, 'm1', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(94, 19, 'Kabel BC 50 mm2', NULL, 1.00, 'm1', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(95, 19, 'Grounding genset', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(96, 19, 'Penangkal petir', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(97, 20, 'Pipa PVC 1/2 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(98, 20, 'Pipa PVC 3/4 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(99, 20, 'Pipa PVC 1 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(100, 20, 'Pipa PVC 3 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(101, 20, 'Pipa PVC 4 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(102, 20, 'Lem pipa / fitting PVC', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(103, 21, 'Kran dinding T23B13', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(104, 21, 'Kloset duduk monoblock CW421J / SW42JP', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(105, 21, 'Jet washer TB19CSN N5', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(106, 21, 'Kran wastafel dan basin TX129L + L29V1', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(107, 21, 'Urinal U57M', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(108, 21, 'Partisi urinal AW115J', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(109, 21, 'Tempat tisu TX703AES', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(110, 21, 'Gantungan kamar mandi 704AES', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(111, 21, 'Floor drain TX1AV1', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(112, 21, 'Cermin', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(113, 21, 'Kloset jongkok CE6', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(114, 22, 'Kitchen sink', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(115, 22, 'Kran dapur TX603 KCS', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(116, 23, 'Wiremesh / mesh 25x25x2 mm', NULL, 1.00, 'lbr', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(117, 23, 'Besi hollow 40x40 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(118, 23, 'Kawat las', NULL, 1.00, 'kg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(119, 23, 'Aksesoris partisi wiremesh engsel', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(120, 24, 'Pipa galvanis 2 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(121, 24, 'Besi siku 40x40 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(122, 24, 'Semen', NULL, 1.00, 'zak', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(123, 24, 'Pasir', NULL, 1.00, 'm3', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(124, 25, 'Pagar BRC Tinggi 1', NULL, 1.00, 'm1', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(125, 25, 'Pipa galvanis 2 inch', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(126, 25, 'Besi siku 40x40 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(127, 25, 'Kawat duri', NULL, 1.00, 'roll', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(128, 26, 'Kawat duri', NULL, 1.00, 'roll', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(129, 26, 'Fiber penutup pagar', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(130, 26, 'Besi siku 40x40 mm', NULL, 1.00, 'btg', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(131, 26, 'Aksesoris pengunci / bracket pagar', NULL, 1.00, 'set', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08'),
(132, 27, 'Peralatan kebersihan sapu', NULL, 1.00, 'unit', NULL, '2026-06-24 07:12:08', '2026-06-24 07:12:08');

-- --------------------------------------------------------

--
-- Table structure for table `detail_pekerjaans`
--

CREATE TABLE `detail_pekerjaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `master_pekerjaan_id` bigint(20) UNSIGNED NOT NULL,
  `nama_detail_pekerjaan` varchar(255) NOT NULL,
  `durasi_hari` int(11) NOT NULL DEFAULT 0,
  `satuan` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `detail_pekerjaans`
--

INSERT INTO `detail_pekerjaans` (`id`, `master_pekerjaan_id`, `nama_detail_pekerjaan`, `durasi_hari`, `satuan`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 1, 'Fabrikasi Baja', 1, 'batang', NULL, '2026-06-23 23:52:09', '2026-06-23 23:52:23'),
(2, 1, 'Erection Rangka Baja', 1, 'batang', NULL, '2026-06-23 23:53:03', '2026-06-23 23:53:03'),
(3, 1, 'Pemasangan Baut / Anchor', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-28 00:01:58'),
(4, 1, 'Finishing Anti Karat Baja', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-28 00:02:08'),
(5, 1, 'Pemasangan Zincalume Canopy & Cladding', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-28 00:02:18'),
(6, 2, 'Pemasangan Rangka & Partisi Gypsum', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:09:31'),
(7, 2, 'Pemasangan Plafon Gypsum', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:09:44'),
(8, 2, 'Pekerjaan Dinding Bata', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:09:57'),
(9, 3, 'Pemasangan Keramik Lantai', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(10, 3, 'Pemasangan Keramik Dinding', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(11, 4, 'Pengecatan Interior', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:10:17'),
(12, 4, 'Pengecatan Eksterior', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:10:27'),
(13, 4, 'Pengecatan Road Line', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:10:36'),
(14, 4, 'Touch Up Cat', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:11:29'),
(15, 5, 'Pemasangan Pintu', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(16, 5, 'Pemasangan Jendela', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(17, 6, 'Instalasi Titik Penerangan', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(18, 6, 'Instalasi Titik Stop Kontak & Saklar', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(19, 6, 'Pemasangan Panel & Jaringan Power', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(20, 7, 'Instalasi Plumbing', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(21, 7, 'Pemasangan Aksesoris Toilet', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(22, 7, 'Pemasangan Aksesoris Dapur', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(23, 8, 'Pemasangan Partisi Wiremesh', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(24, 9, 'Pemasangan Tiang Pagar', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(25, 9, 'Pemasangan Panel BRC', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(26, 9, 'Pemasangan Aksesoris Pagar', 0, NULL, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(27, 10, 'Pembersihan Area Akhir', 1, NULL, NULL, '2026-06-24 07:04:55', '2026-06-27 01:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pekerjaans`
--

CREATE TABLE `kategori_pekerjaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `master_pekerjaan_id` bigint(20) UNSIGNED NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `durasi` int(10) UNSIGNED DEFAULT NULL COMMENT 'Estimasi hari',
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `master_pekerjaans`
--

CREATE TABLE `master_pekerjaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_pekerjaan` varchar(255) NOT NULL,
  `nama_pekerjaan` varchar(255) NOT NULL,
  `kategori` varchar(255) DEFAULT NULL,
  `total_durasi_hari` int(11) NOT NULL DEFAULT 0,
  `keterangan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `master_pekerjaans`
--

INSERT INTO `master_pekerjaans` (`id`, `kode_pekerjaan`, `nama_pekerjaan`, `kategori`, `total_durasi_hari`, `keterangan`, `created_at`, `updated_at`) VALUES
(1, 'mp1', 'Pekerjaan Konstruksi Baja', NULL, 5, NULL, '2026-06-23 23:51:41', '2026-06-28 00:02:18'),
(2, 'mp2', 'Pekerjaan Partisi & Plafon', NULL, 3, NULL, '2026-06-24 07:04:55', '2026-06-27 01:09:57'),
(3, 'mp3', 'Pekerjaan Pemasangan Keramik', NULL, 0, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(4, 'mp4', 'Pekerjaan Pengecatan', NULL, 4, NULL, '2026-06-24 07:04:55', '2026-06-27 01:11:29'),
(5, 'mp5', 'Pekerjaan Kusen Aluminium, Pintu & Jendela', NULL, 0, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(6, 'mp6', 'Pekerjaan Listrik', NULL, 0, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(7, 'mp7', 'Pekerjaan Dapur, Toilet & Sanitary', NULL, 0, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(8, 'mp8', 'Pekerjaan Partisi Wiremesh', NULL, 0, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(9, 'mp9', 'Pekerjaan Pagar BRC', NULL, 0, NULL, '2026-06-24 07:04:55', '2026-06-24 07:04:55'),
(10, 'mp10', 'Pekerjaan Inspeksi & Pembersihan Akhir', NULL, 1, NULL, '2026-06-24 07:04:55', '2026-06-27 01:09:11');

-- --------------------------------------------------------

--
-- Table structure for table `materials`
--

CREATE TABLE `materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_material` varchar(255) DEFAULT NULL,
  `nama_material` varchar(255) NOT NULL,
  `satuan` varchar(255) NOT NULL DEFAULT 'pcs',
  `jumlah_tersedia` int(11) NOT NULL DEFAULT 0,
  `min_stock` int(11) NOT NULL DEFAULT 0,
  `max_stock` int(11) NOT NULL DEFAULT 0,
  `reorder_point` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `materials`
--

INSERT INTO `materials` (`id`, `kode_material`, `nama_material`, `satuan`, `jumlah_tersedia`, `min_stock`, `max_stock`, `reorder_point`, `created_at`, `updated_at`) VALUES
(1, 'MAT-001', 'Aksesoris partisi wiremesh engsel', 'set', 20, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-28 01:38:16'),
(2, 'MAT-002', 'Aksesoris pengunci / bracket pagar', 'set', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(3, 'MAT-003', 'Anchor bolt pondasi / base plate', 'set', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(4, 'MAT-004', 'Armatur lampu TKO-TL 1x36 W', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(5, 'MAT-005', 'Armatur lampu TKO-TL 2x36 W', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(6, 'MAT-006', 'Armatur lampu TL RM 1x36 W', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(7, 'MAT-007', 'Armatur lampu TL RM 2x36 W', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(8, 'MAT-008', 'Baja CNP 125', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(9, 'MAT-009', 'Baja ringan profil C / stud 70x70 mm', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(10, 'MAT-010', 'Bata', 'bh', 100, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-27 00:01:34'),
(11, 'MAT-011', 'Baut sambungan rangka baja', 'set', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(12, 'MAT-012', 'Besi beton diameter 10 mm', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(13, 'MAT-013', 'Besi beton diameter 8 mm', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(14, 'MAT-014', 'Besi hollow', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(15, 'MAT-015', 'Besi hollow 40x40 mm', 'btg', 10, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-27 01:00:18'),
(16, 'MAT-016', 'Besi siku 40x40 mm', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(17, 'MAT-017', 'Cat anti karat Zinc chromate primer', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(18, 'MAT-018', 'Cat dasar', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(19, 'MAT-019', 'Cat Emco Warna Semeru Blue 28', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(20, 'MAT-020', 'Cat Emco Warna White', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(21, 'MAT-021', 'Cat interior', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(22, 'MAT-022', 'Cat interior Dulux Brilliant White', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(23, 'MAT-023', 'Cat road line warna kuning', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(24, 'MAT-024', 'Cermin', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(25, 'MAT-025', 'Compound gypsum', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(26, 'MAT-026', 'Exhaust fan 8 inch', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(27, 'MAT-027', 'Fiber penutup pagar', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(28, 'MAT-028', 'Floor drain TX1AV1', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(29, 'MAT-029', 'Gantungan kamar mandi 704AES', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(30, 'MAT-030', 'Grid switch 6 lubang', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(31, 'MAT-031', 'Grounding genset', 'set', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(32, 'MAT-032', 'Jendela kaca mati 1500x1200 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(33, 'MAT-033', 'Jendela kaca mati 750x1200 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(34, 'MAT-034', 'Jendela kaca mati 750x1600 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(35, 'MAT-035', 'Jendela loket kasir 80x110 cm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(36, 'MAT-036', 'Jendela sliding 1200x1500 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(37, 'MAT-037', 'Jendela sliding 1500x1600 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(38, 'MAT-038', 'Jet washer TB19CSN N5', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(39, 'MAT-039', 'Kabel BC 50 mm2', 'm1', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(40, 'MAT-040', 'Kabel NYM 3 x 2', 'roll', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(41, 'MAT-041', 'Kabel power 4 x 25 mm2', 'm1', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(42, 'MAT-042', 'Kawat bendrat', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(43, 'MAT-043', 'Kawat duri', 'roll', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(44, 'MAT-044', 'Kawat las', 'kg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(45, 'MAT-045', 'Kawat las', 'roll', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(46, 'MAT-046', 'Keramik dinding 20x40 cm', 'dus', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(47, 'MAT-047', 'Keramik lantai 20x20 cm', 'dus', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(48, 'MAT-048', 'Keramik lantai 30x30 cm', 'dus', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(49, 'MAT-049', 'Keramik lantai 40x40 cm', 'dus', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(50, 'MAT-050', 'Kipas angin model MWF-41K', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(51, 'MAT-051', 'Kitchen sink', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(52, 'MAT-052', 'Kloset duduk monoblock CW421J / SW42JP', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(53, 'MAT-053', 'Kloset jongkok CE6', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(54, 'MAT-054', 'Kran dapur TX603 KCS', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(55, 'MAT-055', 'Kran dinding T23B13', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(56, 'MAT-056', 'Kran wastafel dan basin TX129L + L29V1', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(57, 'MAT-057', 'Lampu downlight outbow', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(58, 'MAT-058', 'Lampu emergency 2x14 W', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(59, 'MAT-059', 'Lampu exit tulisan', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(60, 'MAT-060', 'Lampu floodlight LED 100 W', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(61, 'MAT-061', 'Lem pipa / fitting PVC', 'set', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(62, 'MAT-062', 'Lembaran zincalume panjang 6 m', 'lbr', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(63, 'MAT-063', 'MCB 10 A', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(64, 'MAT-064', 'MCB 16 A', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(65, 'MAT-065', 'Pagar BRC Tinggi 1', 'm1', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(66, 'MAT-066', 'Panel listrik induk', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(67, 'MAT-067', 'Papan bekisting', 'lbr', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(68, 'MAT-068', 'Papan gypsum 12 mm', 'lbr', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(69, 'MAT-069', 'Papan gypsum 9 mm', 'lbr', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(70, 'MAT-070', 'Partisi urinal AW115J', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(71, 'MAT-071', 'Pasir', 'm3', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(72, 'MAT-072', 'Penangkal petir', 'set', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(73, 'MAT-073', 'Peralatan kebersihan sapu', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(74, 'MAT-074', 'Perlengkapan pengecatan amplas', 'set', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(75, 'MAT-075', 'Pintu aluminium 950x2500 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(76, 'MAT-076', 'Pintu gudang 4', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(77, 'MAT-077', 'Pintu standard aluminium 950x2100 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(78, 'MAT-078', 'Pintu swing aluminium 950x2500 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(79, 'MAT-079', 'Pintu toilet panel aluminium 850x2100 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(80, 'MAT-080', 'Pintu toilet PVC', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(81, 'MAT-081', 'Pintu utama aluminium 1900x2500 mm', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(82, 'MAT-082', 'Pipa conduit 5/8 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(83, 'MAT-083', 'Pipa galvanis 2 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(84, 'MAT-084', 'Pipa galvanis 3 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(85, 'MAT-085', 'Pipa hitam 3 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(86, 'MAT-086', 'Pipa PVC 1 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(87, 'MAT-087', 'Pipa PVC 1/2 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(88, 'MAT-088', 'Pipa PVC 3 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(89, 'MAT-089', 'Pipa PVC 3/4 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(90, 'MAT-090', 'Pipa PVC 4 inch', 'btg', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(91, 'MAT-091', 'Roster beton 40x19x15 cm', 'bh', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(92, 'MAT-092', 'Saklar ganda', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:24', '2026-06-26 23:36:24'),
(93, 'MAT-093', 'Saklar tunggal', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(94, 'MAT-094', 'Sekrup gypsum', 'box', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(95, 'MAT-095', 'Semen', 'zak', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(96, 'MAT-096', 'Seng talang datar', 'lbr', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(97, 'MAT-097', 'Stop kontak', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(98, 'MAT-098', 'Stop kontak AC', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(99, 'MAT-099', 'Tempat tisu TX703AES', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(100, 'MAT-100', 'Thinner / minyak cat', 'ltr', 90, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:52:21'),
(101, 'MAT-101', 'Thinner / minyak cat', 'M3', 90, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:52:21'),
(102, 'MAT-102', 'Timer listrik', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(103, 'MAT-103', 'Urinal U57M', 'unit', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(104, 'MAT-104', 'Wiremesh / mesh 25x25x2 mm', 'lbr', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25'),
(105, 'MAT-105', 'Wiremesh M8', 'lbr', 0, 0, 0, 0, '2026-06-26 23:36:25', '2026-06-26 23:36:25');

-- --------------------------------------------------------

--
-- Table structure for table `material_requests`
--

CREATE TABLE `material_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `request_number` varchar(255) NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `manager_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected','shipped','received') NOT NULL DEFAULT 'pending',
  `request_date` date NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_request_items`
--

CREATE TABLE `material_request_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `material_request_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `priority` enum('low','medium','high') NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `material_transactions`
--

CREATE TABLE `material_transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('order','stock_in','dispatch') NOT NULL,
  `quantity` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `material_transactions`
--

INSERT INTO `material_transactions` (`id`, `user_id`, `material_id`, `type`, `quantity`, `description`, `created_at`, `updated_at`) VALUES
(1, 3, 100, 'stock_in', 100, 'Penerimaan barang dari PO PO-20260627-CE7F (Supplier: PT Semen Indonesia)', '2026-06-26 23:47:30', '2026-06-26 23:47:30'),
(2, 3, 101, 'stock_in', 100, 'Penerimaan barang dari PO PO-20260627-CE7F (Supplier: PT Semen Indonesia)', '2026-06-26 23:47:30', '2026-06-26 23:47:30'),
(3, 3, 100, 'order', 10, 'Pengiriman untuk permintaan MR-20260627-BAE3 (Proyek: Pembangunan Jembatan Merdeka)', '2026-06-26 23:52:21', '2026-06-26 23:52:21'),
(4, 3, 101, 'order', 10, 'Pengiriman untuk permintaan MR-20260627-BAE3 (Proyek: Pembangunan Jembatan Merdeka)', '2026-06-26 23:52:21', '2026-06-26 23:52:21'),
(5, 1, 10, 'stock_in', 100, 'Penerimaan barang dari PO PO-20260627-B74E (Supplier: PT Semen Indonesia)', '2026-06-27 00:01:34', '2026-06-27 00:01:34'),
(6, 1, 1, 'stock_in', 10, 'Penerimaan barang dari PO PO-20260627-B74E (Supplier: PT Semen Indonesia)', '2026-06-27 00:01:34', '2026-06-27 00:01:34'),
(7, 3, 15, 'stock_in', 10, 'Penerimaan barang dari PO PO-20260627-1142 (Supplier: perusahaan cobaan)', '2026-06-27 01:00:18', '2026-06-27 01:00:18'),
(8, 3, 1, 'stock_in', 10, 'Penerimaan barang dari PO PO-20260628-2F24 (Supplier: perusahaan cobaan)', '2026-06-28 01:38:16', '2026-06-28 01:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_04_20_063400_create_projects_table', 1),
(6, '2026_04_20_063550_create_materials_table', 1),
(7, '2026_04_21_042908_add_role_to_users_table', 1),
(8, '2026_04_21_042923_add_user_id_to_projects_table', 1),
(9, '2026_04_21_042951_create_activity_logs_table', 1),
(10, '2026_04_21_054250_add_assigned_project_id_to_users_table', 1),
(11, '2026_04_21_054258_create_material_transactions_table', 1),
(12, '2026_04_21_063037_update_users_and_projects_for_tracking', 1),
(13, '2026_04_25_062143_create_suppliers_table', 2),
(14, '2026_04_25_062204_create_purchase_orders_table', 2),
(15, '2026_04_25_062205_create_purchase_order_items_table', 2),
(16, '2026_04_25_062207_create_material_requests_table', 2),
(17, '2026_04_25_062208_create_material_request_items_table', 2),
(18, '2026_04_25_062210_create_project_progress_updates_table', 2),
(19, '2026_04_25_062211_create_project_material_usages_table', 2),
(20, '2026_04_25_062213_create_stock_opnames_table', 2),
(21, '2026_04_25_062214_create_stock_opname_items_table', 2),
(22, '2026_04_25_062215_create_project_materials_table', 2),
(23, '2026_04_25_062216_update_materials_table_for_global_master', 2),
(24, '2026_04_27_032711_add_stock_fields_to_project_materials_table', 3),
(25, '2026_06_23_091310_rebuild_master_pekerjaan_tables', 4),
(26, '2026_06_23_000001_add_rencana_to_projects_table', 5),
(27, '2026_06_23_000002_create_master_pekerjaans_table', 6),
(28, '2026_06_23_000003_create_kategori_pekerjaans_table', 6),
(29, '2026_06_23_000004_create_detail_pekerjaans_table', 7),
(30, '2026_06_23_000005_create_detail_materials_table', 8),
(31, '2026_06_23_091350_update_projects_for_master_pekerjaan', 8),
(32, '2026_06_25_100808_create_pekerjaans_table', 9),
(33, '2026_06_27_074411_create_project_master_pekerjaans_table', 10),
(34, '2026_06_27_074424_create_project_daily_logs_table', 10),
(35, '2026_06_27_081120_add_jumlah_rencana_to_project_materials_table', 11),
(36, '2026_06_28_072316_create_project_detail_pekerjaans_table', 12),
(37, '2026_06_28_074743_add_jumlah_kebutuhan_pending_to_project_materials_table', 13),
(38, '2026_06_28_091016_create_daily_log_detail_pekerjaans_table', 14),
(39, '2026_06_28_092733_add_detail_pekerjaan_id_to_project_daily_logs_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('admin@gmail.com', '$2y$10$xVaskSJLleWR89U0CV4XJu7G2otPrPuYbCH2uKcm/mAgdw5YZs5rO', '2026-04-24 23:54:29'),
('gudang@gmail.com', '$2y$10$YkiiHSC/eDKVnzTg4Ezhyuarqs/TOvCn4xtNcg.fBcpBozf3DbDJ6', '2026-04-24 23:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `pekerjaans`
--

CREATE TABLE `pekerjaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `master_pekerjaan_id` bigint(20) UNSIGNED NOT NULL,
  `manager_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `durasi_rencana` int(11) NOT NULL DEFAULT 0,
  `status` enum('belum_mulai','berjalan','selesai','tertunda') NOT NULL DEFAULT 'belum_mulai',
  `progres` int(11) NOT NULL DEFAULT 0,
  `catatan` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pekerjaans`
--

INSERT INTO `pekerjaans` (`id`, `project_id`, `master_pekerjaan_id`, `manager_id`, `tanggal_mulai`, `tanggal_selesai`, `durasi_rencana`, `status`, `progres`, `catatan`, `created_at`, `updated_at`) VALUES
(2, 13, 3, 1, '2026-06-29', '2026-07-01', 3, 'belum_mulai', 0, NULL, '2026-06-28 00:18:39', '2026-06-28 00:18:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `kode_proyek` varchar(255) DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED DEFAULT NULL,
  `nama_proyek` varchar(255) NOT NULL,
  `master_pekerjaan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `lokasi` varchar(255) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `tanggal_selesai` date NOT NULL,
  `durasi_hari` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status_proyek` enum('berjalan','selesai') NOT NULL DEFAULT 'berjalan',
  `progres` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `kode_proyek`, `manager_id`, `nama_proyek`, `master_pekerjaan_id`, `lokasi`, `tanggal_mulai`, `tanggal_selesai`, `durasi_hari`, `created_at`, `updated_at`, `status_proyek`, `progres`) VALUES
(10, 'PRJ-JPRIL', 2, 'pembuatan hotel cirebon', NULL, 'cirebon,jabar', '2026-06-27', '2026-06-29', 2, '2026-06-27 01:06:35', '2026-06-28 02:23:55', 'berjalan', 50),
(13, 'PRJ-ZYUW4', 2, 'pembuatan gedung olahraga2', NULL, 'cirebon,jabar', '2026-06-26', '2026-07-03', 7, '2026-06-27 02:05:16', '2026-06-28 02:33:52', 'berjalan', 29),
(15, 'PRJ-V9TKA', 2, 'pembuatan gedung olahraga3', NULL, 'cirebon,jabar', '2026-06-26', '2026-07-06', 10, '2026-06-27 23:40:02', '2026-06-27 23:40:02', 'berjalan', 0),
(16, 'PRJ-KY694', 2, 'pembuatan gedung olahraga4', NULL, 'cirebon,jabar', '2026-06-26', '2026-07-06', 10, '2026-06-28 00:03:37', '2026-06-28 02:15:45', 'berjalan', 10),
(17, 'PRJ-QNOAI', 2, 'pembuatan gedung olahraga5', NULL, 'cirebon,jabar', '2026-06-26', '2026-06-30', 4, '2026-06-28 00:31:04', '2026-06-28 02:14:46', 'berjalan', 25),
(18, 'PRJ-5VBCQ', 2, 'pembuatan gedung olahraga6', NULL, 'cirebon,jabar', '2026-06-26', '2026-07-03', 7, '2026-06-28 02:19:43', '2026-06-28 02:44:59', 'berjalan', 57);

-- --------------------------------------------------------

--
-- Table structure for table `project_daily_logs`
--

CREATE TABLE `project_daily_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `detail_pekerjaan_id` bigint(20) UNSIGNED DEFAULT NULL,
  `manager_id` bigint(20) UNSIGNED NOT NULL,
  `tanggal` date NOT NULL,
  `status` enum('berjalan','libur') NOT NULL DEFAULT 'berjalan',
  `keterangan` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_daily_logs`
--

INSERT INTO `project_daily_logs` (`id`, `project_id`, `detail_pekerjaan_id`, `manager_id`, `tanggal`, `status`, `keterangan`, `description`, `photo_path`, `created_at`, `updated_at`) VALUES
(2, 17, NULL, 1, '2026-06-28', 'berjalan', NULL, NULL, NULL, '2026-06-28 00:35:44', '2026-06-28 02:14:46'),
(3, 16, NULL, 1, '2026-06-28', 'berjalan', NULL, NULL, NULL, '2026-06-28 02:15:45', '2026-06-28 02:15:45'),
(4, 18, NULL, 1, '2026-06-28', 'berjalan', NULL, NULL, NULL, '2026-06-28 02:20:10', '2026-06-28 02:44:59'),
(5, 18, NULL, 1, '2026-06-29', 'berjalan', NULL, NULL, NULL, '2026-06-28 02:20:39', '2026-06-28 02:20:39'),
(6, 18, NULL, 1, '2026-06-30', 'berjalan', NULL, NULL, NULL, '2026-06-28 02:21:43', '2026-06-28 02:21:43'),
(7, 10, NULL, 1, '2026-06-28', 'berjalan', NULL, NULL, 'daily_logs/fWMDb3lSno3BseoFgc68G00Do9sEFvgceOqpjlK7.png', '2026-06-28 02:23:55', '2026-06-28 02:24:08'),
(8, 13, 1, 1, '2026-06-28', 'berjalan', NULL, NULL, NULL, '2026-06-28 02:30:15', '2026-06-28 02:30:15'),
(12, 13, 2, 1, '2026-06-29', 'berjalan', NULL, NULL, NULL, '2026-06-28 02:33:52', '2026-06-28 02:33:52'),
(13, 18, NULL, 1, '2026-07-01', 'berjalan', NULL, NULL, NULL, '2026-06-28 02:41:26', '2026-06-28 02:41:26');

-- --------------------------------------------------------

--
-- Table structure for table `project_detail_pekerjaans`
--

CREATE TABLE `project_detail_pekerjaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `detail_pekerjaan_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_detail_pekerjaans`
--

INSERT INTO `project_detail_pekerjaans` (`id`, `project_id`, `detail_pekerjaan_id`, `created_at`, `updated_at`) VALUES
(1, 10, 20, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(2, 10, 21, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(3, 10, 22, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(4, 10, 1, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(5, 10, 2, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(6, 10, 3, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(7, 10, 4, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(8, 10, 5, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(9, 10, 17, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(10, 10, 18, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(11, 10, 19, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(12, 13, 27, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(13, 13, 1, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(14, 13, 2, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(15, 13, 3, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(16, 13, 4, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(17, 13, 5, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(18, 13, 11, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(19, 13, 12, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(20, 13, 13, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(21, 13, 14, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(22, 15, 27, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(23, 15, 1, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(24, 15, 2, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(25, 15, 3, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(26, 15, 4, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(27, 15, 5, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(28, 15, 6, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(29, 15, 7, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(30, 15, 8, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(31, 15, 11, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(32, 15, 12, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(33, 15, 13, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(34, 15, 14, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(35, 16, 27, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(36, 16, 1, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(37, 16, 2, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(38, 16, 3, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(39, 16, 4, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(40, 16, 5, '2026-06-28 00:23:32', '2026-06-28 00:23:32'),
(41, 16, 11, '2026-06-28 00:23:33', '2026-06-28 00:23:33'),
(42, 16, 12, '2026-06-28 00:23:33', '2026-06-28 00:23:33'),
(43, 16, 13, '2026-06-28 00:23:33', '2026-06-28 00:23:33'),
(44, 16, 14, '2026-06-28 00:23:33', '2026-06-28 00:23:33'),
(45, 17, 7, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(46, 17, 8, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(47, 17, 12, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(48, 17, 13, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(49, 18, 6, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(50, 18, 7, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(51, 18, 8, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(52, 18, 11, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(53, 18, 12, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(54, 18, 13, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(55, 18, 14, '2026-06-28 02:19:43', '2026-06-28 02:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `project_master_pekerjaans`
--

CREATE TABLE `project_master_pekerjaans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `master_pekerjaan_id` bigint(20) UNSIGNED NOT NULL,
  `urutan` int(11) NOT NULL DEFAULT 1,
  `tanggal_mulai_rencana` date DEFAULT NULL,
  `tanggal_selesai_rencana` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_master_pekerjaans`
--

INSERT INTO `project_master_pekerjaans` (`id`, `project_id`, `master_pekerjaan_id`, `urutan`, `tanggal_mulai_rencana`, `tanggal_selesai_rencana`, `created_at`, `updated_at`) VALUES
(12, 10, 7, 1, '2026-06-27', '2026-06-27', '2026-06-27 01:06:35', '2026-06-27 01:06:35'),
(13, 10, 1, 2, '2026-06-27', '2026-06-29', '2026-06-27 01:06:35', '2026-06-27 01:06:35'),
(14, 10, 6, 3, '2026-06-29', '2026-06-29', '2026-06-27 01:06:35', '2026-06-27 01:06:35'),
(19, 13, 10, 1, '2026-06-26', '2026-06-27', '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(20, 13, 1, 2, '2026-06-27', '2026-06-29', '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(21, 13, 4, 3, '2026-06-29', '2026-07-03', '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(25, 15, 10, 1, '2026-06-26', '2026-06-27', '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(26, 15, 1, 2, '2026-06-27', '2026-06-29', '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(27, 15, 2, 3, '2026-06-29', '2026-07-02', '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(28, 15, 4, 4, '2026-07-02', '2026-07-06', '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(29, 16, 10, 1, '2026-06-26', '2026-06-27', '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(30, 16, 1, 2, '2026-06-27', '2026-07-02', '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(31, 16, 4, 3, '2026-07-02', '2026-07-06', '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(32, 17, 2, 1, '2026-06-26', '2026-06-28', '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(33, 17, 4, 2, '2026-06-28', '2026-06-30', '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(34, 18, 2, 1, '2026-06-26', '2026-06-29', '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(35, 18, 4, 2, '2026-06-29', '2026-07-03', '2026-06-28 02:19:43', '2026-06-28 02:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `project_materials`
--

CREATE TABLE `project_materials` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `jumlah_rencana` decimal(10,2) NOT NULL DEFAULT 0.00,
  `jumlah_kebutuhan` int(11) NOT NULL DEFAULT 0,
  `jumlah_kebutuhan_pending` int(11) DEFAULT NULL,
  `jumlah_dialokasikan` int(11) NOT NULL DEFAULT 0,
  `jumlah_tersedia` int(11) NOT NULL DEFAULT 0,
  `total_diterima` int(11) NOT NULL DEFAULT 0,
  `sisa_kebutuhan` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `project_materials`
--

INSERT INTO `project_materials` (`id`, `project_id`, `material_id`, `jumlah_rencana`, `jumlah_kebutuhan`, `jumlah_kebutuhan_pending`, `jumlah_dialokasikan`, `jumlah_tersedia`, `total_diterima`, `sisa_kebutuhan`, `created_at`, `updated_at`) VALUES
(20, 13, 100, 6.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(21, 13, 44, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(22, 13, 8, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(23, 13, 14, 11.00, 11, NULL, 0, 0, 0, 11, '2026-06-27 02:05:16', '2026-06-27 02:10:41'),
(24, 13, 85, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(25, 13, 11, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(26, 13, 3, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(27, 13, 16, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(28, 13, 18, 3.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(29, 13, 19, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(30, 13, 20, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(31, 13, 74, 3.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(32, 13, 17, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(33, 13, 62, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(34, 13, 96, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(35, 13, 65, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(36, 13, 84, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(37, 13, 105, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(38, 13, 22, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(39, 13, 21, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(40, 13, 23, 7.00, 7, NULL, 0, 0, 0, 7, '2026-06-27 02:05:16', '2026-06-28 00:51:58'),
(41, 13, 73, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 02:05:16', '2026-06-27 02:05:16'),
(64, 15, 100, 6.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(65, 15, 44, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(66, 15, 8, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(67, 15, 14, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(68, 15, 85, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(69, 15, 11, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(70, 15, 3, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(71, 15, 16, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(72, 15, 18, 3.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(73, 15, 19, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(74, 15, 20, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(75, 15, 74, 3.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(76, 15, 17, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(77, 15, 62, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(78, 15, 96, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(79, 15, 65, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(80, 15, 84, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(81, 15, 105, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(82, 15, 9, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(83, 15, 68, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(84, 15, 69, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(85, 15, 25, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(86, 15, 94, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(87, 15, 10, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(88, 15, 95, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(89, 15, 71, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(90, 15, 12, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(91, 15, 13, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(92, 15, 42, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(93, 15, 67, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(94, 15, 91, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(95, 15, 22, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(96, 15, 21, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(97, 15, 23, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(98, 15, 73, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-27 23:40:02', '2026-06-27 23:40:02'),
(99, 16, 100, 6.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(100, 16, 44, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(101, 16, 8, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(102, 16, 14, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(103, 16, 85, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(104, 16, 11, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(105, 16, 3, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(106, 16, 16, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(107, 16, 18, 3.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(108, 16, 19, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(109, 16, 20, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(110, 16, 74, 3.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(111, 16, 17, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(112, 16, 62, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(113, 16, 96, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(114, 16, 65, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(115, 16, 84, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(116, 16, 105, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(117, 16, 22, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(118, 16, 21, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(119, 16, 23, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(120, 16, 73, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:03:37', '2026-06-28 00:03:37'),
(121, 17, 9, 7.00, 7, NULL, 0, 0, 0, 7, '2026-06-28 00:31:04', '2026-06-28 00:37:11'),
(122, 17, 69, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(123, 17, 25, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(124, 17, 94, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(125, 17, 10, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(126, 17, 95, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(127, 17, 71, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(128, 17, 12, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(129, 17, 13, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(130, 17, 42, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(131, 17, 67, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(132, 17, 91, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(133, 17, 19, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(134, 17, 20, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(135, 17, 100, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(136, 17, 23, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 00:31:04', '2026-06-28 00:31:04'),
(137, 18, 9, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(138, 18, 68, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(139, 18, 69, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(140, 18, 25, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(141, 18, 94, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(142, 18, 10, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(143, 18, 95, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(144, 18, 71, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(145, 18, 12, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(146, 18, 13, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(147, 18, 42, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(148, 18, 67, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(149, 18, 91, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(150, 18, 22, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(151, 18, 21, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(152, 18, 18, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(153, 18, 100, 4.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(154, 18, 74, 2.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(155, 18, 19, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(156, 18, 20, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43'),
(157, 18, 23, 1.00, 0, NULL, 0, 0, 0, 0, '2026-06-28 02:19:43', '2026-06-28 02:19:43');

-- --------------------------------------------------------

--
-- Table structure for table `project_material_usages`
--

CREATE TABLE `project_material_usages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_progress_update_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `quantity_used` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_progress_updates`
--

CREATE TABLE `project_progress_updates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `project_id` bigint(20) UNSIGNED NOT NULL,
  `manager_id` bigint(20) UNSIGNED NOT NULL,
  `progress_percentage` decimal(5,2) NOT NULL,
  `description` text NOT NULL,
  `photo_path` varchar(255) DEFAULT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `po_number` varchar(255) NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('pending','approved','completed','cancelled') NOT NULL DEFAULT 'pending',
  `expected_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `po_number`, `supplier_id`, `status`, `expected_date`, `notes`, `created_at`, `updated_at`) VALUES
(1, 'PO-20260427-3A0C', 1, 'completed', '2026-04-27', 'beli besi', '2026-04-26 23:08:51', '2026-06-23 00:23:14'),
(2, 'PO-20260620-C995', 2, 'completed', '2026-06-23', 'semen', '2026-06-19 22:08:32', '2026-06-19 22:52:07'),
(3, 'PO-20260623-35E2', 1, 'completed', '2026-06-18', NULL, '2026-06-23 03:18:35', '2026-06-23 03:18:46'),
(4, 'PO-20260627-CD8F', 2, 'completed', '2026-06-26', NULL, '2026-06-26 23:07:47', '2026-06-26 23:08:31'),
(5, 'PO-20260627-CE7F', 2, 'completed', '2026-06-27', NULL, '2026-06-26 23:47:21', '2026-06-26 23:47:30'),
(6, 'PO-20260627-B74E', 2, 'completed', NULL, NULL, '2026-06-27 00:01:10', '2026-06-27 00:01:34'),
(7, 'PO-20260627-1142', 1, 'completed', NULL, NULL, '2026-06-27 00:59:46', '2026-06-27 01:00:18'),
(8, 'PO-20260628-2F24', 1, 'completed', '2026-06-22', NULL, '2026-06-28 01:38:07', '2026-06-28 01:38:16');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_order_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `purchase_order_id`, `material_id`, `quantity`, `price`, `created_at`, `updated_at`) VALUES
(1, 5, 100, 100, 1500.00, '2026-06-26 23:47:21', '2026-06-26 23:47:21'),
(2, 5, 101, 100, 1500.00, '2026-06-26 23:47:21', '2026-06-26 23:47:21'),
(3, 6, 10, 100, 15000.00, '2026-06-27 00:01:10', '2026-06-27 00:01:10'),
(4, 6, 1, 10, 20000.00, '2026-06-27 00:01:10', '2026-06-27 00:01:10'),
(5, 7, 15, 10, 14000.00, '2026-06-27 00:59:46', '2026-06-27 00:59:46'),
(6, 8, 1, 10, 1000.00, '2026-06-28 01:38:07', '2026-06-28 01:38:07');

-- --------------------------------------------------------

--
-- Table structure for table `stock_opnames`
--

CREATE TABLE `stock_opnames` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('draft','completed') NOT NULL DEFAULT 'draft',
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock_opnames`
--

INSERT INTO `stock_opnames` (`id`, `date`, `user_id`, `status`, `notes`, `created_at`, `updated_at`) VALUES
(1, '2026-04-27', 3, 'draft', 'beli bahan', '2026-04-26 23:09:19', '2026-04-26 23:09:19');

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname_items`
--

CREATE TABLE `stock_opname_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `stock_opname_id` bigint(20) UNSIGNED NOT NULL,
  `material_id` bigint(20) UNSIGNED NOT NULL,
  `system_stock` int(11) NOT NULL,
  `physical_stock` int(11) NOT NULL,
  `difference` int(11) NOT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `name`, `contact_person`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'perusahaan cobaan', 'ali', '0893330333', 'cirebon', '2026-04-24 23:42:26', '2026-04-24 23:42:26'),
(2, 'PT Semen Indonesia', 'Budi', '08123456789', 'bandung', '2026-04-24 23:58:04', '2026-06-17 03:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','manajer','gudang') NOT NULL DEFAULT 'gudang',
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `assigned_project_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `remember_token`, `created_at`, `updated_at`, `assigned_project_id`) VALUES
(1, 'Admin User', 'admin@gmail.com', NULL, '$2a$12$ZYRjLpKwWwmQbyiKhJaDwudTAyygPbf/baSNE9mQr/aztJc/8u3we', 'admin', 'GuqwL04sRihaVitvJlH80FLA9VzKmwFcTUrQl9xIBHvLKfSVRllHWBEIgmnX', '2026-04-21 00:29:02', '2026-04-21 00:29:02', NULL),
(2, 'Manager User', 'manager@gmail.com', NULL, '$2a$12$48DCJ6TD3z1iEaHOM6A.5e8k9gijtW2zoO6TqkRlT0yyi1HJyCko2', 'manajer', 'wMQIBHnQUz6u5Hf9Hx4YCSJ5h02gMPl7RzOMQQW2Gk5IuyJPn5NpCMe3pejy', '2026-04-21 00:29:02', '2026-04-25 00:06:16', NULL),
(3, 'Gudang User', 'gudang@gmail.com', NULL, '$2y$10$tW.InTGgjJ3Aid31kuaoieJ5/o4njAscF14YeGFYjbE30nwBjy83y', 'gudang', NULL, '2026-04-21 00:29:02', '2026-06-27 02:06:59', 13),
(4, 'Tester', 'tester@gmail.com', NULL, '$2y$10$CVLQi/zEYdm4oCTIoE/vWeaY1ZJHqn/4DOF1nfOgSZQbB/or9EcIq', 'gudang', NULL, '2026-04-24 23:55:37', '2026-06-27 01:49:53', 10);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `daily_log_detail_pekerjaans`
--
ALTER TABLE `daily_log_detail_pekerjaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_log_detail_pekerjaans_project_daily_log_id_foreign` (`project_daily_log_id`),
  ADD KEY `daily_log_detail_pekerjaans_detail_pekerjaan_id_foreign` (`detail_pekerjaan_id`);

--
-- Indexes for table `daily_log_materials`
--
ALTER TABLE `daily_log_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_log_materials_project_daily_log_id_foreign` (`project_daily_log_id`),
  ADD KEY `daily_log_materials_material_id_foreign` (`material_id`);

--
-- Indexes for table `detail_materials`
--
ALTER TABLE `detail_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_materials_detail_pekerjaan_id_foreign` (`detail_pekerjaan_id`);

--
-- Indexes for table `detail_pekerjaans`
--
ALTER TABLE `detail_pekerjaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detail_pekerjaans_master_pekerjaan_id_foreign` (`master_pekerjaan_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `kategori_pekerjaans`
--
ALTER TABLE `kategori_pekerjaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kategori_pekerjaans_master_pekerjaan_id_foreign` (`master_pekerjaan_id`);

--
-- Indexes for table `master_pekerjaans`
--
ALTER TABLE `master_pekerjaans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `master_pekerjaans_kode_pekerjaan_unique` (`kode_pekerjaan`);

--
-- Indexes for table `materials`
--
ALTER TABLE `materials`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `materials_kode_material_unique` (`kode_material`);

--
-- Indexes for table `material_requests`
--
ALTER TABLE `material_requests`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `material_requests_request_number_unique` (`request_number`),
  ADD KEY `material_requests_project_id_foreign` (`project_id`),
  ADD KEY `material_requests_manager_id_foreign` (`manager_id`);

--
-- Indexes for table `material_request_items`
--
ALTER TABLE `material_request_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_request_items_material_request_id_foreign` (`material_request_id`),
  ADD KEY `material_request_items_material_id_foreign` (`material_id`);

--
-- Indexes for table `material_transactions`
--
ALTER TABLE `material_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `material_transactions_user_id_foreign` (`user_id`),
  ADD KEY `material_transactions_material_id_foreign` (`material_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `pekerjaans`
--
ALTER TABLE `pekerjaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pekerjaans_project_id_foreign` (`project_id`),
  ADD KEY `pekerjaans_master_pekerjaan_id_foreign` (`master_pekerjaan_id`),
  ADD KEY `pekerjaans_manager_id_foreign` (`manager_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_proyek` (`id`),
  ADD KEY `projects_user_id_foreign` (`manager_id`),
  ADD KEY `projects_master_pekerjaan_id_foreign` (`master_pekerjaan_id`);

--
-- Indexes for table `project_daily_logs`
--
ALTER TABLE `project_daily_logs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `project_daily_logs_project_id_tanggal_unique` (`project_id`,`tanggal`),
  ADD KEY `project_daily_logs_manager_id_foreign` (`manager_id`),
  ADD KEY `project_daily_logs_detail_pekerjaan_id_foreign` (`detail_pekerjaan_id`);

--
-- Indexes for table `project_detail_pekerjaans`
--
ALTER TABLE `project_detail_pekerjaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_detail_pekerjaans_project_id_foreign` (`project_id`),
  ADD KEY `project_detail_pekerjaans_detail_pekerjaan_id_foreign` (`detail_pekerjaan_id`);

--
-- Indexes for table `project_master_pekerjaans`
--
ALTER TABLE `project_master_pekerjaans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_master_pekerjaans_project_id_foreign` (`project_id`),
  ADD KEY `project_master_pekerjaans_master_pekerjaan_id_foreign` (`master_pekerjaan_id`);

--
-- Indexes for table `project_materials`
--
ALTER TABLE `project_materials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_materials_project_id_foreign` (`project_id`),
  ADD KEY `project_materials_material_id_foreign` (`material_id`);

--
-- Indexes for table `project_material_usages`
--
ALTER TABLE `project_material_usages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_material_usages_material_id_foreign` (`material_id`);

--
-- Indexes for table `project_progress_updates`
--
ALTER TABLE `project_progress_updates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_progress_updates_project_id_foreign` (`project_id`),
  ADD KEY `project_progress_updates_manager_id_foreign` (`manager_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_orders_po_number_unique` (`po_number`),
  ADD KEY `purchase_orders_supplier_id_foreign` (`supplier_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_items_purchase_order_id_foreign` (`purchase_order_id`),
  ADD KEY `purchase_order_items_material_id_foreign` (`material_id`);

--
-- Indexes for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_opnames_user_id_foreign` (`user_id`);

--
-- Indexes for table `stock_opname_items`
--
ALTER TABLE `stock_opname_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_opname_items_stock_opname_id_foreign` (`stock_opname_id`),
  ADD KEY `stock_opname_items_material_id_foreign` (`material_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `daily_log_detail_pekerjaans`
--
ALTER TABLE `daily_log_detail_pekerjaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `daily_log_materials`
--
ALTER TABLE `daily_log_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detail_materials`
--
ALTER TABLE `detail_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `detail_pekerjaans`
--
ALTER TABLE `detail_pekerjaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori_pekerjaans`
--
ALTER TABLE `kategori_pekerjaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `master_pekerjaans`
--
ALTER TABLE `master_pekerjaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `materials`
--
ALTER TABLE `materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `material_requests`
--
ALTER TABLE `material_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `material_request_items`
--
ALTER TABLE `material_request_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `material_transactions`
--
ALTER TABLE `material_transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `pekerjaans`
--
ALTER TABLE `pekerjaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `project_daily_logs`
--
ALTER TABLE `project_daily_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `project_detail_pekerjaans`
--
ALTER TABLE `project_detail_pekerjaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `project_master_pekerjaans`
--
ALTER TABLE `project_master_pekerjaans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `project_materials`
--
ALTER TABLE `project_materials`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `project_material_usages`
--
ALTER TABLE `project_material_usages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_progress_updates`
--
ALTER TABLE `project_progress_updates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_opname_items`
--
ALTER TABLE `stock_opname_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_log_detail_pekerjaans`
--
ALTER TABLE `daily_log_detail_pekerjaans`
  ADD CONSTRAINT `daily_log_detail_pekerjaans_detail_pekerjaan_id_foreign` FOREIGN KEY (`detail_pekerjaan_id`) REFERENCES `detail_pekerjaans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_log_detail_pekerjaans_project_daily_log_id_foreign` FOREIGN KEY (`project_daily_log_id`) REFERENCES `project_daily_logs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_log_materials`
--
ALTER TABLE `daily_log_materials`
  ADD CONSTRAINT `daily_log_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `daily_log_materials_project_daily_log_id_foreign` FOREIGN KEY (`project_daily_log_id`) REFERENCES `project_daily_logs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_materials`
--
ALTER TABLE `detail_materials`
  ADD CONSTRAINT `detail_materials_detail_pekerjaan_id_foreign` FOREIGN KEY (`detail_pekerjaan_id`) REFERENCES `detail_pekerjaans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `detail_pekerjaans`
--
ALTER TABLE `detail_pekerjaans`
  ADD CONSTRAINT `detail_pekerjaans_master_pekerjaan_id_foreign` FOREIGN KEY (`master_pekerjaan_id`) REFERENCES `master_pekerjaans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kategori_pekerjaans`
--
ALTER TABLE `kategori_pekerjaans`
  ADD CONSTRAINT `kategori_pekerjaans_master_pekerjaan_id_foreign` FOREIGN KEY (`master_pekerjaan_id`) REFERENCES `master_pekerjaans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `material_requests`
--
ALTER TABLE `material_requests`
  ADD CONSTRAINT `material_requests_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `material_requests_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `material_request_items`
--
ALTER TABLE `material_request_items`
  ADD CONSTRAINT `material_request_items_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `material_request_items_material_request_id_foreign` FOREIGN KEY (`material_request_id`) REFERENCES `material_requests` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `material_transactions`
--
ALTER TABLE `material_transactions`
  ADD CONSTRAINT `material_transactions_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `material_transactions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pekerjaans`
--
ALTER TABLE `pekerjaans`
  ADD CONSTRAINT `pekerjaans_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pekerjaans_master_pekerjaan_id_foreign` FOREIGN KEY (`master_pekerjaan_id`) REFERENCES `master_pekerjaans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pekerjaans_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_master_pekerjaan_id_foreign` FOREIGN KEY (`master_pekerjaan_id`) REFERENCES `master_pekerjaans` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `projects_user_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_daily_logs`
--
ALTER TABLE `project_daily_logs`
  ADD CONSTRAINT `project_daily_logs_detail_pekerjaan_id_foreign` FOREIGN KEY (`detail_pekerjaan_id`) REFERENCES `detail_pekerjaans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_daily_logs_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_daily_logs_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_detail_pekerjaans`
--
ALTER TABLE `project_detail_pekerjaans`
  ADD CONSTRAINT `project_detail_pekerjaans_detail_pekerjaan_id_foreign` FOREIGN KEY (`detail_pekerjaan_id`) REFERENCES `detail_pekerjaans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_detail_pekerjaans_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_master_pekerjaans`
--
ALTER TABLE `project_master_pekerjaans`
  ADD CONSTRAINT `project_master_pekerjaans_master_pekerjaan_id_foreign` FOREIGN KEY (`master_pekerjaan_id`) REFERENCES `master_pekerjaans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_master_pekerjaans_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_materials`
--
ALTER TABLE `project_materials`
  ADD CONSTRAINT `project_materials_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_materials_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_material_usages`
--
ALTER TABLE `project_material_usages`
  ADD CONSTRAINT `project_material_usages_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `project_progress_updates`
--
ALTER TABLE `project_progress_updates`
  ADD CONSTRAINT `project_progress_updates_manager_id_foreign` FOREIGN KEY (`manager_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_progress_updates_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_order_items_purchase_order_id_foreign` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_opnames`
--
ALTER TABLE `stock_opnames`
  ADD CONSTRAINT `stock_opnames_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_opname_items`
--
ALTER TABLE `stock_opname_items`
  ADD CONSTRAINT `stock_opname_items_material_id_foreign` FOREIGN KEY (`material_id`) REFERENCES `materials` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_opname_items_stock_opname_id_foreign` FOREIGN KEY (`stock_opname_id`) REFERENCES `stock_opnames` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
