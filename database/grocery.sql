-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2021 at 04:26 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grocery`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_admin`
--

CREATE TABLE `t_admin` (
  `admin_id` int(11) NOT NULL,
  `admin_fName` varchar(20) NOT NULL,
  `admin_lName` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_password` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `t_brands`
--

CREATE TABLE `t_brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(255) NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_brands`
--

INSERT INTO `t_brands` (`brand_id`, `brand_name`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_active`) VALUES
(1, 'loose vegetable', 'System', '2021-04-30 19:23:13', NULL, NULL, 1),
(2, 'TRS', 'System', '2021-05-02 11:38:05', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_category`
--

CREATE TABLE `t_category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(20) NOT NULL,
  `created_by` varchar(20) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(20) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_category`
--

INSERT INTO `t_category` (`category_id`, `category_name`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_active`) VALUES
(1, 'vegetable', 'System', '2021-04-30 19:23:34', NULL, NULL, 1),
(2, 'Pulses', 'System', '2021-05-02 11:36:45', NULL, NULL, 1),
(3, 'Spices', 'System', '2021-05-02 11:36:45', NULL, NULL, 1),
(4, 'Snacks', 'System', '2021-05-02 11:36:59', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_orders`
--

CREATE TABLE `t_orders` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(4) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_orders`
--

INSERT INTO `t_orders` (`order_id`, `product_id`, `quantity`, `price`, `user_id`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_active`) VALUES
(1, 1, 2, '4', 1, 'System', '2021-05-02 20:57:04', NULL, NULL, 1),
(2, 2, 3, '5', 2, 'System', '2021-05-02 20:57:04', NULL, NULL, 1),
(3, 2, 1, '4', 5, 'System', '2021-05-04 14:06:45', NULL, NULL, 1),
(4, 1, 1, '2', 5, 'System', '2021-05-04 14:42:50', NULL, NULL, 1),
(5, 2, 1, '4', 7, 'System', '2021-05-07 11:57:00', NULL, NULL, 1),
(6, 2, 1, '4', 7, 'System', '2021-05-07 11:57:00', NULL, NULL, 1),
(7, 2, 1, '4', 7, 'System', '2021-05-07 15:13:48', NULL, NULL, 1),
(8, 2, 1, '4', 7, 'System', '2021-05-07 15:13:48', NULL, NULL, 1),
(9, 2, 1, '4', 8, 'System', '2021-05-07 15:26:28', NULL, NULL, 1),
(10, 1, 1, '2', 8, 'System', '2021-05-07 15:27:16', NULL, NULL, 1),
(11, 2, 1, '4', 8, 'System', '2021-05-07 15:27:16', NULL, NULL, 1),
(12, 1, 1, '2', 8, 'System', '2021-05-07 15:29:41', NULL, NULL, 1),
(13, 2, 1, '4', 8, 'System', '2021-05-07 15:29:41', NULL, NULL, 1),
(14, 2, 1, '4', 12, 'System', '2021-05-07 20:06:37', NULL, NULL, 1),
(15, 2, 1, '4', 12, 'System', '2021-05-07 20:06:38', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_products`
--

CREATE TABLE `t_products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `expiry_date` date NOT NULL,
  `weight` int(11) NOT NULL,
  `unit` varchar(5) NOT NULL,
  `price` float NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `product_img` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_products`
--

INSERT INTO `t_products` (`product_id`, `product_name`, `brand_id`, `category_id`, `expiry_date`, `weight`, `unit`, `price`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_active`, `product_img`, `quantity`, `total`) VALUES
(1, 'Chillies', 1, 1, '2021-05-25', 100, 'grams', 2, 'System', '2021-04-30 19:24:18', NULL, NULL, 1, '../../../assets/chillies.png', 1, 0),
(2, 'Potato', 1, 1, '2021-05-26', 500, 'grams', 4, 'System', '2021-04-30 19:25:03', NULL, NULL, 1, '../../../assets/potato.png', 1, 0),
(3, 'carrots', 1, 1, '2021-05-25', 500, 'grams', 3, 'System', '2021-04-30 19:27:23', NULL, NULL, 1, '../../../assets/carrots.png', 1, 0),
(4, 'Spinach', 1, 1, '2021-05-26', 500, 'grams', 4, 'System', '2021-04-30 19:25:03', NULL, NULL, 1, '../../../assets/Spinach.png', 1, 0),
(5, 'Onion', 1, 1, '2021-05-20', 500, 'grams', 2, 'System', '2021-04-30 21:15:53', NULL, NULL, 1, '../../../assets/onion.png', 1, 0),
(6, 'Bell pepper', 1, 1, '2021-05-20', 500, 'grams', 1.5, 'System', '2021-04-30 21:16:57', NULL, NULL, 1, '../../../assets/bellpepper.jpg', 1, 0),
(7, 'Broccoli', 1, 1, '2021-05-26', 500, 'grams', 0.8, 'System', '2021-04-30 21:18:11', NULL, NULL, 1, '../../../assets/broccoli.png', 1, 0),
(8, 'Cauliflower', 1, 1, '2021-05-29', 500, 'grams', 1.4, 'System', '2021-04-30 21:19:04', NULL, NULL, 1, '../../../assets/cauli.png', 1, 0),
(9, 'Corn', 1, 1, '2021-05-28', 200, 'grams', 0.6, 'System', '2021-04-30 21:20:23', NULL, NULL, 1, '../../../assets/corn.png', 1, 0),
(10, 'Basil ', 1, 1, '2021-05-29', 100, 'grams', 0.9, 'System', '2021-04-30 21:56:55', NULL, NULL, 1, '../../../assets/basil.jpg', 1, 0),
(11, 'Cucumber', 1, 1, '2021-05-20', 500, 'grams', 2, 'System', '2021-04-30 21:57:58', NULL, NULL, 1, '../../../assets/cucumber.jpg', 1, 0),
(12, 'Lemon', 1, 1, '2021-05-31', 100, 'grams', 0.6, 'System', '2021-04-30 21:59:41', NULL, NULL, 1, '../../../assets/lemon.jpg', 1, 0),
(13, 'Mint leaves', 1, 1, '2021-05-28', 100, 'grams', 0.9, 'System', '2021-04-30 21:59:41', NULL, NULL, 1, '../../../assets/mint.jpg', 1, 0),
(14, 'Tomatoes', 1, 1, '2021-06-12', 500, 'grams', 0.7, 'System', '2021-04-30 22:00:35', NULL, NULL, 1, '../../../assets/tomato.jpg', 1, 0),
(15, 'Brown Chickpeas', 2, 2, '2021-06-25', 600, 'grams', 2.2, 'System', '2021-05-02 11:40:04', NULL, NULL, 1, NULL, 1, 0),
(16, 'Red Chilli powder', 2, 3, '2021-07-15', 150, 'grams', 1.5, 'System', '2021-05-02 11:42:55', NULL, NULL, 1, NULL, 1, 0),
(17, 'Pistachio ', 2, 4, '2021-06-26', 200, 'grams', 3.2, 'System', '2021-05-02 11:42:55', NULL, NULL, 1, NULL, 1, 0),
(18, 'Turmeric powder', 2, 3, '0000-00-00', 100, 'grams', 1.09, 'System', '2021-05-02 17:07:23', NULL, NULL, 1, ' undefined', 1, 0),
(19, 'Salt', 2, 3, '0000-00-00', 500, 'grams', 2, 'System', '2021-05-02 17:09:42', NULL, NULL, 1, ' ../../../assets/salt.jpg', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `t_users`
--

CREATE TABLE `t_users` (
  `user_id` int(11) NOT NULL,
  `user_fname` varchar(20) NOT NULL,
  `user_lname` varchar(30) NOT NULL,
  `user_contact` varchar(15) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_users`
--

INSERT INTO `t_users` (`user_id`, `user_fname`, `user_lname`, `user_contact`, `user_email`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_active`) VALUES
(1, 'Sayli', 'Pednekar', '4756748374', 's@gmail.com', 'System', '2021-05-02 20:52:36', NULL, NULL, 1),
(2, 'Tejarani', 'Kulkarni', '9857465746', 't@gmail.com', 'System', '2021-05-02 20:52:36', NULL, NULL, 1),
(3, 'qwerty', 'lop', '123456795', 'mod@123.com', 'System', '2021-05-03 21:35:29', NULL, NULL, 1),
(4, 'sdsadasd', 'sdad', 'sadsd', 'sadfd', 'System', '2021-05-03 21:37:30', NULL, NULL, 1),
(5, 'abc', 'kbc', '12123', 'qwerty@abc.com', 'System', '2021-05-04 14:05:56', NULL, NULL, 1),
(6, 'Stephanie', 'Nickel', '9862', 'abc@klgd.com', 'System', '2021-05-07 10:37:25', NULL, NULL, 1),
(7, 'Zen', 'Villa', '2313213', 'abc@g.com', 'System', '2021-05-07 11:55:43', NULL, NULL, 1),
(8, 'abc', 'kbc', '6789756', 'a@a.com', 'System', '2021-05-07 15:22:30', NULL, NULL, 1),
(9, 'Reza', 'Liz', '879879', 'ab@g.com', 'System', '2021-05-07 16:01:42', NULL, NULL, 1),
(10, 'Fire', 'Blood', '09787897', 'abec@klgd.com', 'System', '2021-05-07 18:52:44', NULL, NULL, 1),
(11, 'lenovo', 'dell', '0123456789', 'abc@qwerty.com', 'System', '2021-05-07 19:50:31', NULL, NULL, 1),
(12, 'HPL', 'qwe', '0123456789', 'ab@mn.com', 'System', '2021-05-07 20:05:40', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_user_address`
--

CREATE TABLE `t_user_address` (
  `user_address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `short_address` varchar(250) NOT NULL,
  `city` varchar(50) NOT NULL,
  `pin_code` int(11) NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_user_address`
--

INSERT INTO `t_user_address` (`user_address_id`, `user_id`, `short_address`, `city`, `pin_code`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_active`) VALUES
(1, 1, 'wasengrud sekenheim', 'Mannheim', 87654, 'System', '2021-05-02 20:53:48', NULL, NULL, 1),
(2, 2, 'new panvel', 'Navi mumbai', 67465, 'System', '2021-05-02 20:53:48', NULL, NULL, 1),
(3, 3, 'qwerty', 'qwerty', 54656, 'System', '2021-05-03 21:35:30', NULL, NULL, 1),
(4, 4, 'dsfdds', 'sdsas', 1212, 'System', '2021-05-03 21:37:30', NULL, NULL, 1),
(5, 5, 'we', 'skdl', 11221, 'System', '2021-05-04 14:05:56', NULL, NULL, 1),
(6, 6, 'lkdsf', 'dfmsdk', 98456, 'System', '2021-05-07 10:37:26', NULL, NULL, 1),
(7, 7, 'djskfn', 'nksldn', 12321, 'System', '2021-05-07 11:55:44', NULL, NULL, 1),
(8, 8, 'jefkwf', 'kjsdn', 321312, 'System', '2021-05-07 15:22:30', NULL, NULL, 1),
(9, 9, 'sdad', 'sddas', 21321, 'System', '2021-05-07 16:01:42', NULL, NULL, 1),
(10, 10, 'hjgdh', 'sadhj', 23789, 'System', '2021-05-07 18:52:45', NULL, NULL, 1),
(11, 11, 'adfhlk', 'djskf', 213, 'System', '2021-05-07 19:50:31', NULL, NULL, 1),
(12, 12, 'sdkj', 'sjbdka', 121, 'System', '2021-05-07 20:05:40', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_user_login`
--

CREATE TABLE `t_user_login` (
  `user_login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `created_by` varchar(50) NOT NULL DEFAULT 'System',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL,
  `modified_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `t_user_login`
--

INSERT INTO `t_user_login` (`user_login_id`, `user_id`, `user_email`, `user_password`, `created_by`, `created_at`, `modified_by`, `modified_at`, `is_active`) VALUES
(1, 1, 's@gmail.com', '123456', 'System', '2021-05-02 20:54:21', NULL, NULL, 1),
(2, 2, 't@gmail.com', '67890', 'System', '2021-05-02 20:54:21', NULL, NULL, 1),
(3, 3, 'mod@123.com', 'eaa3540201c8a80696bc68280f99a9da', 'System', '2021-05-03 21:35:30', NULL, NULL, 1),
(4, 4, 'sadfd', '1c2c4b0b41485ec4e8d51bdc530c8572', 'System', '2021-05-03 21:37:31', NULL, NULL, 1),
(5, 5, 'qwerty@abc.com', '202cb962ac59075b964b07152d234b70', 'System', '2021-05-04 14:05:57', NULL, NULL, 1),
(6, 6, 'abc@klgd.com', 'e2fc714c4727ee9395f324cd2e7f331f', 'System', '2021-05-07 10:37:26', NULL, NULL, 1),
(7, 7, 'abc@g.com', '202cb962ac59075b964b07152d234b70', 'System', '2021-05-07 11:55:44', NULL, NULL, 1),
(8, 8, 'a@a.com', '202cb962ac59075b964b07152d234b70', 'System', '2021-05-07 15:22:31', NULL, NULL, 1),
(9, 9, 'ab@g.com', '202cb962ac59075b964b07152d234b70', 'System', '2021-05-07 16:01:42', NULL, NULL, 1),
(10, 10, 'abec@klgd.com', '202cb962ac59075b964b07152d234b70', 'System', '2021-05-07 18:52:45', NULL, NULL, 1),
(11, 11, 'abc@qwerty.com', '202cb962ac59075b964b07152d234b70', 'System', '2021-05-07 19:50:32', NULL, NULL, 1),
(12, 12, 'ab@mn.com', '202cb962ac59075b964b07152d234b70', 'System', '2021-05-07 20:05:40', NULL, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_admin`
--
ALTER TABLE `t_admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `t_brands`
--
ALTER TABLE `t_brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `t_category`
--
ALTER TABLE `t_category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `t_orders`
--
ALTER TABLE `t_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `t_product_id_fk1` (`product_id`),
  ADD KEY `t_user_id_fk2` (`user_id`);

--
-- Indexes for table `t_products`
--
ALTER TABLE `t_products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `t_brand_id_fk` (`brand_id`),
  ADD KEY `t_product_id_fk` (`category_id`);

--
-- Indexes for table `t_users`
--
ALTER TABLE `t_users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `t_user_address`
--
ALTER TABLE `t_user_address`
  ADD PRIMARY KEY (`user_address_id`),
  ADD KEY `t_user_id_fk` (`user_id`);

--
-- Indexes for table `t_user_login`
--
ALTER TABLE `t_user_login`
  ADD PRIMARY KEY (`user_login_id`),
  ADD KEY `t_user_id_fk1` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_admin`
--
ALTER TABLE `t_admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_brands`
--
ALTER TABLE `t_brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `t_category`
--
ALTER TABLE `t_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_orders`
--
ALTER TABLE `t_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `t_products`
--
ALTER TABLE `t_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `t_users`
--
ALTER TABLE `t_users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_user_address`
--
ALTER TABLE `t_user_address`
  MODIFY `user_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `t_user_login`
--
ALTER TABLE `t_user_login`
  MODIFY `user_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `t_orders`
--
ALTER TABLE `t_orders`
  ADD CONSTRAINT `t_product_id_fk1` FOREIGN KEY (`product_id`) REFERENCES `t_products` (`product_id`),
  ADD CONSTRAINT `t_user_id_fk2` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`user_id`);

--
-- Constraints for table `t_products`
--
ALTER TABLE `t_products`
  ADD CONSTRAINT `t_brand_id_fk` FOREIGN KEY (`brand_id`) REFERENCES `t_brands` (`brand_id`),
  ADD CONSTRAINT `t_product_id_fk` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`category_id`);

--
-- Constraints for table `t_user_address`
--
ALTER TABLE `t_user_address`
  ADD CONSTRAINT `t_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`user_id`);

--
-- Constraints for table `t_user_login`
--
ALTER TABLE `t_user_login`
  ADD CONSTRAINT `t_user_id_fk1` FOREIGN KEY (`user_id`) REFERENCES `t_users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
