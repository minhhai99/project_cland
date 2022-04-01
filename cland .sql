-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 01, 2022 at 04:44 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cland`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(10) UNSIGNED NOT NULL,
  `cname` varchar(191) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `cname`) VALUES
(1, 'nhà thuê'),
(2, 'Nhà đất cho Thuê'),
(3, 'Cần thuê'),
(28, 'nhà chung cư'),
(29, 'nhà thuê để ở'),
(36, 'nhà trọ'),
(37, 'nhà nhà');

-- --------------------------------------------------------

--
-- Table structure for table `lands`
--

CREATE TABLE `lands` (
  `lid` int(10) UNSIGNED NOT NULL,
  `lname` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail_text` text COLLATE utf8_unicode_ci NOT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cid` int(10) UNSIGNED NOT NULL,
  `picture` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `address` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `count_views` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lands`
--

INSERT INTO `lands` (`lid`, `lname`, `description`, `detail_text`, `date_create`, `cid`, `picture`, `area`, `address`, `count_views`) VALUES
(1, 'Trung Quốc điều thêm 17 tàu đến khu vực giàn khoan', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước, sẵn sàng đâm va vào tàu Việt Nam.\r\n', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước, sẵn sàng đâm va vào tàu Việt Nam.\r\n', '2022-03-31 17:17:19', 1, 'th (1)-66195297405900.jpg', 105, 'quận Ngũ Hành Sơn, Đà Nẵng, Việt Nam', 127),
(2, 'Trọng tài - vết đen của kỳ World Cup sôi động ', 'World Cup 2014 chưa đi hết lượt đầu vòng bảng nhưng các trọng tài đẳng cấp FIFA đã có tới bốn trận bị chỉ trích dữ dội.\r\n', 'World Cup 2014 chưa đi hết lượt đầu vòng bảng nhưng các trọng tài đẳng cấp FIFA đã có tới bốn trận bị chỉ trích dữ dội.\r\n', '2022-03-31 17:17:31', 1, 'thi-truong-bat-dong-san-ha-nhiet-vi-anh-huong-dich-gia-van-tang-manh-66476752058500.jpg', 500, 'PhÆ°á»ng Má»¹ An - Quáº­n NgÅ© HÃ nh SÆ¡n - ÄÃ  Náºµng', 207),
(3, 'Những mỹ nhân Việt duyên dáng ở tuổi tứ tuần', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước, sẵn sàng đâm va vào tàu Việt Nam.\r\n', 'Chi tiết về gian khoan ', '2022-03-31 17:17:33', 3, 'thi-truong-bat-dong-san-ha-nhiet-vi-anh-huong-dich-gia-van-tang-manh-66052010387699.jpg', 1500, 'Đường võ nguyên giáp, quận ngũ hành sơn, Đà nẵng', 804),
(4, 'Chuyển nhượng 17/6: Arsenal mua Balotelli, tráo hàng Man Utd', 'Đội bóng thành London đang đẩy mạnh việc tuyển lựa những vị trí còn yếu trong đội hình ở cả ba tuyến.\r\n', 'Đội bóng thành London đang đẩy mạnh việc tuyển lựa những vị trí còn yếu trong đội hình ở cả ba tuyến.\r\n', '2022-03-31 17:17:35', 36, 'th-66321898234099.jpg', 90, 'quận ngũ hành sơn, đà nẵng', 505),
(5, 'Chuyên gia Anh tin chắc vị trí MH370 rơi', 'Các chuyên gia thuộc công ty viễn thông Anh Inmarsat cho rằng họ xác định được vị trí chiếc máy bay MH370 đã rơi xuống trên Ấn Độ Dương, tuy nhiên đội.\r\n', '0', '2022-03-31 17:17:36', 1, 'bannerbatdongsan016-66358967948100.jpg', 695, 'ÄÆ°á»ng LÃ¢m HoÃ nh - Quáº­n SÆ¡n TrÃ  - ÄÃ  Náºµng', 647),
(12, 'nhà ở dân cư', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước, sẵn sàng đâm va vào tàu Việt Nam.', 'chi tiết\r\n', '2022-03-31 17:17:38', 2, 'nguon-tin-dung-bds-thu-hep-anh-huong-the-nao-den-bds-hang-sang-1-66393356869100.jpg', 1212312, '123 nguyễn lương bằng, đà nẵng việt Nam', 6),
(13, 'nhà ở cho chủ', 'mô tả cho dự án', 'chi tiết của dự án\r\n\r\n', '2022-03-31 17:37:51', 2, 'toan-canh-bat-dong-san-thiet-ke-san-vuon-dep-1625125788-66092607072100.jpg', 13, '123 nguyễn lương bằng đà nẵng việt nam\r\n', 7),
(18, 'dự án mới nhất', 'mô tả về dự án mới nhất', 'mô tả về dự án mới nhất', '2022-03-31 17:37:50', 1, 'cach-chup-anh-bat-dong-san-3-66438747729600.jpg', 13200000, 'dự án ở biên hoà đồng nai', 4),
(19, 'nhà thuê kinh doanh', 'đà nẵng liên chiểu', 'đất để thuê', '2022-03-31 17:40:40', 37, 'nguon-tin-dung-bds-thu-hep-anh-huong-the-nao-den-bds-hang-sang-1-66339298931700.jpg', 142, '123 ngô văn sở đà nẵng liên chiểu', 11),
(22, 'nhà  ở lại', '2432', '214', '2022-03-31 13:45:29', 38, 'bannerbatdongsan016-9141448673300.jpg', 234, '2433333333333333333333333333333', 0),
(23, 'aaaaaaaaaaâ', 'aaaaaaaaaaaaaaaaa', 'â', '2022-03-31 17:37:46', 3, '23', 2342, '234234444444444', 36);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_07_27_184804_create_categories_table', 1),
(4, '2017_07_27_184922_create_lands_table', 1),
(5, '2017_07_27_184938_create_vnecontact_table', 1),
(6, '2017_07_27_205208_update_lands_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `rid` int(11) NOT NULL,
  `roleName` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`rid`, `roleName`) VALUES
(1, 'ADMIN'),
(2, 'USER'),
(3, 'EDITOR');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `full_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `roleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `full_name`, `password`, `roleId`) VALUES
(1, 'admin', 'Nguyễn Văn C', '$2y$10$Cf0gEBK/gRIVEpSa54HOyed9WKUSfJOofgd3l5OuSH80QeKjzq0F6', 1),
(2, 'mod', 'VinaEnter Edu', '$2y$10$GMqRL4w6DQN9ePEHbWsqo.5aSNe1eNCAnqdzTe1lNKusbsspIor6G', 3),
(3, 'user', 'Người dùng', '$2y$10$zfn92kzRbwQsUbScuH82Z.s8VM7r38aApjFaQsO10zQ2AmrkPYwzC', 2),
(4, 'binhluanvien', 'binh luận', '123123', 1),
(10, 'ngango', 'ngaphamthi 1243', '1232', 2),
(14, 'lophocjava', 'trung tam vinaEnter', '12341234', 1);

-- --------------------------------------------------------

--
-- Table structure for table `vnecontact`
--

CREATE TABLE `vnecontact` (
  `vid` int(10) UNSIGNED NOT NULL,
  `fullname` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `vnecontact`
--

INSERT INTO `vnecontact` (`vid`, `fullname`, `email`, `subject`, `content`) VALUES
(1, 'Nguyễn Thị Hạnh', 'hanh@gmail.com', 'Phòng A1', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước,\n		        sẵn sàng đâm va vào tàu Việt Nam.'),
(2, 'Phan Quốc Bảo', 'quocbao@gmail.com', 'Phòng A2', 'World Cup 2014 chưa đi hết lượt đầu vòng bảng nhưng các trọng tài đẳng cấp FIFA đã có tới bốn trận bị chỉ trích dữ dội.'),
(3, 'Nguyễn Văn Hòa', 'hoa@gmail.com', 'Phòng A3', 'Để bảo vệ giàn khoan, Trung Quốc đã điều thêm 17 tàu các loại so với hôm trước,\n		        sẵn sàng đâm va vào tàu Việt Nam.'),
(5, 'Bảo', 'bao@gmail.com', 'Nhà cho thuê', 'Test nhà cho thuê'),
(8, 'Pham thi ngố', 'nga1999@gmail.com', 'liên hệ', 'liên hệ với chúng tôi\r\n'),
(11, 'minh hai', 'anhhaideptrai@gmail.com', 'bất động sản cần bán', 'Khu tái định cư mới cho dân trúng dự án'),
(13, 'vina', 'vinaenter@gmail.com', 'dự án java', 'trung tâm đào tạo VinaEnter'),
(16, 'họ ten của tôi', 'thuyngannga@gmail.com', 'BDS của tập đoàn FLC', 'BDS của FLC đang giảm sát sàn'),
(17, 'Trung tâm vinaenter', 'vinaenter123@gmail.com', 'support bài tập', 'Trung tâm đào tạo lập trình vinaenter'),
(18, 'Trung tâm vinaenter', 'vinaenter123@gmail.com', 'hỗ trợ đào tạo lập trình', 'java'),
(19, 'Trung tâm vinaenter', 'vinaenter123@gmail.com', 'hỗ trợ đào tạo lập trình', 'java');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cid`);

--
-- Indexes for table `lands`
--
ALTER TABLE `lands`
  ADD PRIMARY KEY (`lid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`rid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vnecontact`
--
ALTER TABLE `vnecontact`
  ADD PRIMARY KEY (`vid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `lands`
--
ALTER TABLE `lands`
  MODIFY `lid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `rid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `vnecontact`
--
ALTER TABLE `vnecontact`
  MODIFY `vid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
