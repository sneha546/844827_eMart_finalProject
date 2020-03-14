-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2020 at 01:32 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emart_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill_details_table`
--

CREATE TABLE `bill_details_table` (
  `bill_details_id` int(20) NOT NULL,
  `bill_id` int(20) NOT NULL,
  `item_id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_details_table`
--

INSERT INTO `bill_details_table` (`bill_details_id`, `bill_id`, `item_id`) VALUES
(714, 613, 501),
(715, 613, 504),
(716, 614, 501),
(717, 614, 504),
(718, 615, 504),
(719, 615, 505),
(720, 615, 501),
(721, 615, 506),
(722, 616, 511),
(723, 616, 508),
(724, 616, 501),
(725, 616, 504),
(726, 616, 509),
(727, 616, 510),
(728, 616, 506),
(729, 616, 512),
(730, 616, 505),
(731, 617, 511),
(732, 617, 501),
(733, 617, 506),
(734, 617, 510),
(735, 617, 505),
(736, 617, 509),
(737, 617, 512),
(738, 617, 504),
(739, 617, 508),
(740, 618, 504),
(741, 618, 506),
(742, 618, 509),
(743, 618, 508),
(744, 618, 505);

-- --------------------------------------------------------

--
-- Table structure for table `bill_table`
--

CREATE TABLE `bill_table` (
  `bill_id` int(20) NOT NULL,
  `buyer_id` int(20) NOT NULL,
  `bill_type` varchar(50) NOT NULL,
  `bill_date` date NOT NULL,
  `bill_remarks` varchar(200) NOT NULL,
  `bill_amount` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill_table`
--

INSERT INTO `bill_table` (`bill_id`, `buyer_id`, `bill_type`, `bill_date`, `bill_remarks`, `bill_amount`) VALUES
(607, 201, 'Debit', '2020-03-07', 'paid', 139000),
(608, 201, 'Debit', '2020-03-07', 'paid', 15000),
(610, 201, 'Debit', '2020-03-07', 'paid', 3000),
(611, 201, 'credit', '2020-03-12', 'paid', 174000),
(612, 201, 'credit', '2020-03-12', 'paid', 50000),
(613, 201, 'credit', '2020-03-12', 'paid', 52500),
(614, 201, 'credit', '2020-03-13', 'paid', 52500),
(615, 201, 'credit', '2020-03-13', 'paid', 77500),
(616, 201, 'credit', '2020-03-13', 'paid', 118100),
(617, 201, 'credit', '2020-03-13', 'paid', 118100),
(618, 201, 'credit', '2020-03-13', 'paid', 33100);

-- --------------------------------------------------------

--
-- Table structure for table `buyer_signup_table`
--

CREATE TABLE `buyer_signup_table` (
  `buyer_id` int(20) NOT NULL,
  `buyer_username` varchar(50) NOT NULL,
  `buyer_password` varchar(40) NOT NULL,
  `buyer_email` varchar(150) NOT NULL,
  `buyer_mobile` bigint(250) NOT NULL,
  `buyer_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `buyer_signup_table`
--

INSERT INTO `buyer_signup_table` (`buyer_id`, `buyer_username`, `buyer_password`, `buyer_email`, `buyer_mobile`, `buyer_date`) VALUES
(201, 'sneha', 'sneha', 'sneha@gmail.com', 345678, '2020-03-02'),
(203, 'macharloju', 'sne', 'sne@gmail.com', 1876386, '2020-02-02'),
(211, 'machar', 'machar', 'machar@gmail.com', 21345, '2019-12-31'),
(212, 'aksh', 'aksh', 'machar@gmail.com', 21345, '2019-12-31'),
(213, 'abc', 'aksh', 'machar@gmail.com', 21345, '2019-12-31'),
(214, 'ab', 'ab', 'ab@gmail.com', 12, '2020-03-16'),
(215, 'ab', 'ab', 'abc@gmail.com', 123, '2020-03-23');

-- --------------------------------------------------------

--
-- Table structure for table `category_table`
--

CREATE TABLE `category_table` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(50) NOT NULL,
  `category_brief` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_table`
--

INSERT INTO `category_table` (`category_id`, `category_name`, `category_brief`) VALUES
(301, 'Fashion', 'fashion is everything'),
(302, 'Electronics', 'electronics is nothing'),
(303, 'Sports', 'sports for all'),
(306, 'house holds', 'house holds like utensils, sofa other furniture');

-- --------------------------------------------------------

--
-- Table structure for table `item_table`
--

CREATE TABLE `item_table` (
  `item_id` int(20) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_image` varchar(200) NOT NULL,
  `item_price` int(40) NOT NULL,
  `item_stock` int(20) NOT NULL,
  `item_description` varchar(200) NOT NULL,
  `subcategory_id` int(10) NOT NULL,
  `item_remarks` varchar(400) NOT NULL,
  `seller_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item_table`
--

INSERT INTO `item_table` (`item_id`, `item_name`, `item_image`, `item_price`, `item_stock`, `item_description`, `subcategory_id`, `item_remarks`, `seller_id`) VALUES
(501, 'MicroSoft Laptop', 'https://images.unsplash.com/photo-1504707748692-419802cf939d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1030&q=80', 50000, 4, 'MicroSoft Surface Laptop3 15 inches black colour with 32Gb RAM', 403, 'Size-M', 103),
(504, 'iphone', 'https://9to5mac.com/wp-content/uploads/sites/6/2019/11/iPhone-11-Which-iPhone-Should-I-Buy.jpg?quality=82&strip=all&w=1600', 2500, 10, 'Apple iPhone 11 Pro smartphone Silver, 64 Gb, 4 Gb RAM', 402, 'Good for running', 106),
(505, 'Samsung Phone', 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRuflUch5cdF79MGV6f1re0KOgYE0bETr0mUUd22Zaf5HwOydTg', 20000, 4, '6.2 inches screen, Facial Recognition, Iris Scanner, Fingerprint Scanner', 402, '6.2 inches screen, Facial Recognition, Iris Scanner, Fingerprint Scanner', 103),
(506, 'Titan', 'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/8481615/2020/1/30/7a5b4069-a5a7-4083-8207-0ec72a03133f1580384763087-French-Connection-Women-Black-Analogue-Watch-FCN0001D-157158-1.jpg', 5000, 2, 'Black braided, stainless steel strap with a foldover closure', 402, 'Black braided, stainless steel strap with a foldover closure', 103),
(508, 'Mast & Harbour watch', 'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/2330735/2018/2/12/11518431205668-Mast--Harbour-Women-Watches-2451518431205553-1.jpg', 4000, 7, ' Rose Gold-Toned bracelet style, stainless steel strap with a foldover closure', 408, ' Rose Gold-Toned bracelet style, stainless steel strap with a foldover closure', 106),
(509, 'Fastrack', 'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2020/2/12/2977f36c-5de3-427d-9ee5-cbf0287b9fe31581467405810-1.jpg', 1600, 8, 'Silver-Toned bracelet style, stainless steel strap with a button closure', 405, 'Silver-Toned bracelet style, stainless steel strap with a button closure', 101),
(510, '3 seater tuffed sofa', 'https://images.unsplash.com/photo-1493663284031-b7e3aefcae8e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80', 0, 0, '1.40 x 2.10 metres (width x length)', 401, '1.40 x 2.10 metres (width x length)', 103),
(511, 'Yellow sofa', 'https://images.unsplash.com/photo-1558211583-d26f610c1eb1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=995&q=80', 15000, 1, ' 140 cm x 210 cm, Yellow colour', 410, ' 140 cm x 210 cm, Yellow colour', 103),
(512, 'Royal Sofa', 'https://images.unsplash.com/photo-1519961655809-34fa156820ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60', 20000, 3, '2 seated royal sofa white  and blue colour', 410, '2 seated royal sofa white  and blue colour', 106);

-- --------------------------------------------------------

--
-- Table structure for table `seller_signup_table`
--

CREATE TABLE `seller_signup_table` (
  `seller_id` int(20) NOT NULL,
  `seller_username` varchar(50) NOT NULL,
  `seller_password` varchar(20) NOT NULL,
  `seller_company` varchar(100) NOT NULL,
  `seller_brief` varchar(200) NOT NULL,
  `seller_gst` int(20) NOT NULL,
  `seller_address` varchar(100) NOT NULL,
  `seller_email` varchar(60) NOT NULL,
  `seller_contact` bigint(100) NOT NULL,
  `seller_website` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seller_signup_table`
--

INSERT INTO `seller_signup_table` (`seller_id`, `seller_username`, `seller_password`, `seller_company`, `seller_brief`, `seller_gst`, `seller_address`, `seller_email`, `seller_contact`, `seller_website`) VALUES
(101, 'mallesh', '12345', 'cts', 'mnc company', 2, 'koti', 'cts@gmail.com', 888653, 'cts.com'),
(103, 'sneha ', ' sneha ', 'cognizant ', ' ', 0, ' ', '', 0, ' '),
(106, 'macharloju ', ' macharloju', 'cognizant ', ' ', 0, ' ', '', 0, ' '),
(107, 'abc', 'aksh', 'cognizant', 'ewgtwt', 4, 'sadfs', 'machar@gmail.com', 12345, 'http://localhost2020'),
(108, 'abc', 'aksh', 'cognizant', 'ewgtwt', 5, 'sadfs', 'machar@gmail.com', 12345, 'http://localhost2020');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category_table`
--

CREATE TABLE `sub_category_table` (
  `subcategory_id` int(20) NOT NULL,
  `subcategory_name` varchar(50) NOT NULL,
  `category_id` int(200) NOT NULL,
  `subcategory_brief` varchar(200) NOT NULL,
  `subcategory_gst` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sub_category_table`
--

INSERT INTO `sub_category_table` (`subcategory_id`, `subcategory_name`, `category_id`, `subcategory_brief`, `subcategory_gst`) VALUES
(401, 'clothes', 301, 'i love clothes', 3),
(402, 'mobiles', 302, 'hate mobiles', 4),
(403, 'Laptop', 302, 'Laptops Tabs etc', 6),
(404, 'Footwear', 301, 'Footwear is good', 5),
(405, 'Jwellery', 301, 'Jewellery is for all', 5),
(406, 'Television', 302, 'Television', 5),
(407, 'Cameras', 302, 'Cameras', 2),
(408, 'Cycling', 303, 'cycling', 6),
(409, 'Tennis', 303, 'Tennis', 7),
(410, 'sofa', 306, 'sofa of different designs', 6);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD PRIMARY KEY (`bill_details_id`),
  ADD KEY `bill_id` (`bill_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD PRIMARY KEY (`bill_id`),
  ADD KEY `buyer_id` (`buyer_id`);

--
-- Indexes for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  ADD PRIMARY KEY (`buyer_id`);

--
-- Indexes for table `category_table`
--
ALTER TABLE `category_table`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `item_table`
--
ALTER TABLE `item_table`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `subcategory_id` (`subcategory_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Indexes for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  ADD PRIMARY KEY (`seller_id`);

--
-- Indexes for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD PRIMARY KEY (`subcategory_id`),
  ADD KEY `sub_category_table_ibfk_1` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  MODIFY `bill_details_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=745;
--
-- AUTO_INCREMENT for table `bill_table`
--
ALTER TABLE `bill_table`
  MODIFY `bill_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=619;
--
-- AUTO_INCREMENT for table `buyer_signup_table`
--
ALTER TABLE `buyer_signup_table`
  MODIFY `buyer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=216;
--
-- AUTO_INCREMENT for table `category_table`
--
ALTER TABLE `category_table`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;
--
-- AUTO_INCREMENT for table `item_table`
--
ALTER TABLE `item_table`
  MODIFY `item_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=513;
--
-- AUTO_INCREMENT for table `seller_signup_table`
--
ALTER TABLE `seller_signup_table`
  MODIFY `seller_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;
--
-- AUTO_INCREMENT for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  MODIFY `subcategory_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=411;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bill_details_table`
--
ALTER TABLE `bill_details_table`
  ADD CONSTRAINT `bill_details_table_ibfk_1` FOREIGN KEY (`bill_id`) REFERENCES `bill_table` (`bill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bill_details_table_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `item_table` (`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bill_table`
--
ALTER TABLE `bill_table`
  ADD CONSTRAINT `bill_table_ibfk_1` FOREIGN KEY (`buyer_id`) REFERENCES `buyer_signup_table` (`buyer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `item_table`
--
ALTER TABLE `item_table`
  ADD CONSTRAINT `item_table_ibfk_1` FOREIGN KEY (`subcategory_id`) REFERENCES `sub_category_table` (`subcategory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `item_table_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `seller_signup_table` (`seller_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sub_category_table`
--
ALTER TABLE `sub_category_table`
  ADD CONSTRAINT `sub_category_table_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category_table` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
