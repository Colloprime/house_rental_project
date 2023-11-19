-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2023 at 09:36 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rental_house`
--

-- --------------------------------------------------------

--
-- Table structure for table `contract`
--

CREATE TABLE `contract` (
  `contract_id` int(3) NOT NULL,
  `tenant_id` int(3) NOT NULL,
  `house_id` int(3) NOT NULL,
  `duration_month` int(2) NOT NULL,
  `total_rent` int(7) NOT NULL,
  `terms` int(2) NOT NULL,
  `rent_per_term` int(7) NOT NULL,
  `start_day` date NOT NULL,
  `end_day` date NOT NULL,
  `date_contract_sign` datetime NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `contract`
--

INSERT INTO `contract` (`contract_id`, `tenant_id`, `house_id`, `duration_month`, `total_rent`, `terms`, `rent_per_term`, `start_day`, `end_day`, `date_contract_sign`, `status`) VALUES
(1, 1, 2, 12, 432000, 2, 36000, '2022-08-01', '2024-07-31', '2022-08-07 20:40:22', 'Active'),
(4, 5, 1, 3, 270000, 1, 90000, '2023-08-01', '2023-10-31', '2023-08-07 00:18:18', 'Active'),
(5, 6, 4, 12, 960000, 4, 80000, '2023-08-01', '2024-07-31', '2023-08-07 00:25:47', 'Active'),
(8, 9, 6, 6, 420000, 2, 70000, '2023-07-01', '2023-12-31', '2023-07-15 02:52:34', 'Active'),
(9, 4, 2, 3, 120000, 1, 40000, '2023-08-01', '2023-07-20', '2023-07-19 03:12:17', 'Inactive'),
(12, 10, 2, 12, 600000, 4, 50000, '2023-07-01', '2025-06-30', '2023-07-23 12:20:10', 'Inactive'),
(15, 4, 7, 3, 60000, 1, 20000, '2023-08-01', '2023-10-31', '2023-08-04 00:18:11', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `house`
--

CREATE TABLE `house` (
  `house_id` int(3) NOT NULL,
  `house_name` varchar(10) NOT NULL,
  `compartment` text NOT NULL,
  `rent_per_month` int(6) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `house`
--

INSERT INTO `house` (`house_id`, `house_name`, `compartment`, `rent_per_month`, `status`) VALUES
(1, 'A10', 'Yes', 80000, 'Occupied'),
(2, 'A20', 'No', 60000, 'Occupied'),
(3, 'D30', 'No', 60000, 'Empty'),
(4, 'C40', 'Yes', 70000, 'Occupied'),
(6, 'A30', 'Yes', 80000, 'Occupied'),
(7, 'A40', 'No', 60000, 'Empty'),
(8, 'B30', 'Yes', 70000, 'Empty'),
(9, 'G56', 'Yes', 80000, 'Empty');

-- --------------------------------------------------------

--
-- Table structure for table `house1`
--

CREATE TABLE `house1` (
  `id` int(11) NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `rooms` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `pics` blob DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `Msg_id` int(11) NOT NULL,
  `sender` int(11) NOT NULL,
  `msg content` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(3) NOT NULL,
  `tenant_id` int(7) NOT NULL,
  `ref_no` varchar(11) NOT NULL,
  `amount` int(7) NOT NULL,
  `pay_from` text NOT NULL,
  `pay_to` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `tenant_id`, `ref_no`, `amount`, `pay_from`, `pay_to`, `date`) VALUES
(2, 4, '2147483647', 18000, 'August 2023', 'October 2023', '2023-08-08 11:11:19'),
(4, 4, '8654712358', 40000, 'February 2023', 'April 2023', '2023-08-08 12:56:45'),
(5, 6, '784156978', 50000, 'August 2023', 'October 2023', '2023-08-08 13:10:15'),
(6, 6, '7456257832', 60000, 'November 2023', 'January 2023', '2023-08-08 13:40:31'),
(7, 6, '39222962841', 80000, 'February 2023', 'April 2023', '2023-08-08 14:15:58'),
(8, 5, '1551327804', 90000, 'August 2023', 'October 2023', '2023-08-09 14:24:29'),
(9, 6, '71308220851', 60000, 'May 2023', 'June 2023', '2023-08-14 11:06:25'),
(10, 6, '72912660562', 70000, 'June 2023', 'July 2023', '2023-08-14 11:22:13'),
(11, 6, '36480604749', 30000, 'July 2023', 'August 2023', '2023-08-14 11:30:35'),
(12, 9, '2099451721', 15000, 'August 2023', 'October 2023', '2023-08-15 10:45:04');

-- --------------------------------------------------------

--
-- Table structure for table `tenant`
--

CREATE TABLE `tenant` (
  `tenant_id` int(3) NOT NULL,
  `fname` text NOT NULL,
  `lname` text NOT NULL,
  `programme` varchar(30) NOT NULL,
  `reg_no` varchar(20) NOT NULL,
  `occupation` text NOT NULL,
  `p_no` varchar(15) NOT NULL,
  `pno1` varchar(15) NOT NULL,
  `e_address` varchar(30) NOT NULL,
  `p_address` varchar(40) NOT NULL,
  `city` varchar(15) NOT NULL,
  `region` varchar(15) NOT NULL,
  `u_name` text NOT NULL,
  `p_word` text NOT NULL,
  `day_reg` date NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tenant`
--

INSERT INTO `tenant` (`tenant_id`, `fname`, `lname`, `programme`, `reg_no`, `occupation`, `p_no`, `pno1`, `e_address`, `p_address`, `city`, `region`, `u_name`, `p_word`, `day_reg`, `status`) VALUES
(1, 'Harriet', 'Mogiti', 'BTIT', 'BTIT/454J/2019', 'Student', '0717812676', '0746553132', 'harriet@gmail.com', '254, Mombasa', 'Mombasa', 'Diani', 'Harriet', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-14', 0),
(4, 'Georvine', 'Aluso', '', '', 'Doctor', '', '0746553132', 'georvine@gmail.com', '2544, Mombasa', 'Mombasa', 'Tononoka', 'Aluso', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-14', 1),
(5, 'Agape', 'Chris', '', '', 'Lecturer', '0717812676', '0746553132', 'agape@yahoo.com', '2554, Mombasa', 'Mombasa', 'SabaSaba', 'Agape', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-14', 1),
(6, 'Evans', 'Charo', 'BSIT', 'BSIT/444J/2019', 'Student', '0717812676', '0746553132', 'evans@gmail.com', '254, Mombasa', 'Mombasa', 'Makupa', 'Evans', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-15', 1),
(9, 'Andrew', 'Takeem', '', '', 'Manager', '0717812676', '0746553132', 'andrew@hotmail.com', '266, Mombasa', 'Mombasa', 'Mbaraki', 'Takeem', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-15', 1),
(10, 'Laura', 'Mean', '', '', 'Assistant Manager', '0717812676', '0746553132', 'laura@google.com', '267, Mombasa', 'Mombasa', 'Mtopanga', 'Laura', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-07-23', 2),
(11, 'Bob', 'Kirkman', '', '', 'Plumber', '0784565656', '0784565656', 'bob@gmail.com', '345, Mombasa', 'Mombasa', 'Tudor', 'Bob', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-08-04', 3),
(19, 'Mike', 'New', '', '', 'staff', '0734515151', '0732424242', 'mike22@gmail.com', '24', 'Mombasa', 'Mombasa', 'New', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-10-21', 0),
(20, 'Brian', 'Ian', 'BTIT', 'bbbit', '', '0721201506', '0721201701', 'prm@gmail.com', '50300', 'Mombasa', 'Kenya', 'prm', '5f4dcc3b5aa765d61d8327deb882cf99', '2023-11-04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tenant_contacts`
--

CREATE TABLE `tenant_contacts` (
  `contact_id` int(3) NOT NULL,
  `tenant_id` int(3) NOT NULL,
  `fname1` text NOT NULL,
  `lname1` text NOT NULL,
  `occupation1` text NOT NULL,
  `nature1` text NOT NULL,
  `pno1` varchar(15) NOT NULL,
  `pno2` varchar(15) NOT NULL,
  `e_address1` varchar(30) NOT NULL,
  `p_address1` varchar(40) NOT NULL,
  `city1` varchar(15) NOT NULL,
  `region1` varchar(15) NOT NULL,
  `fname2` text NOT NULL,
  `lname2` text NOT NULL,
  `occupation2` text NOT NULL,
  `nature2` text NOT NULL,
  `pno3` varchar(15) NOT NULL,
  `pno4` varchar(15) NOT NULL,
  `e_address2` varchar(30) NOT NULL,
  `p_address2` varchar(40) NOT NULL,
  `city2` varchar(15) NOT NULL,
  `region2` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tenant_contacts`
--

INSERT INTO `tenant_contacts` (`contact_id`, `tenant_id`, `fname1`, `lname1`, `occupation1`, `nature1`, `pno1`, `pno2`, `e_address1`, `p_address1`, `city1`, `region1`, `fname2`, `lname2`, `occupation2`, `nature2`, `pno3`, `pno4`, `e_address2`, `p_address2`, `city2`, `region2`) VALUES
(1, 1, 'Brian ', 'Maingi', 'Webdeveloper', 'Husband', '0756525252', '0735355082', 'brian@gmail.com', '2522, Mombasa', 'Mombasa', 'Nyali', 'Joyce', 'Mwagangi', 'TourGuide', 'Wife', '0754693389', '0758698589', 'joyce@gmail.com', '2522, Mombasa', 'Mombasa', 'Nyali'),
(4, 4, 'Evans', 'Manuni', 'Architect', 'Husband', '0721202212', '0724356356', 'evans@gmail.com', '254 Mombasa', 'Mombasa', 'Mbakarani', 'Grace', 'Swift', 'Nurse', 'Wife', '0742323332', '0754151515', 'grace@gmail.com', '255, Mombasa', 'Mombasa', 'Mbakarani'),
(5, 5, 'Tunje', 'Munene', 'Lecturer', 'Husband', '0756235676', '0745121212', 'tunje@gmail.com', '256, Mombasa', 'Mombasa', 'Kizingo', 'Gloria', 'Muliro', 'Lecturer', 'Wife', '0776347632', '0754151515', 'gloria@gmail.com', '255, Mombasa', 'Mombasa', 'Kizingo'),
(6, 6, 'Ricky', 'Ogalo', 'Engineer', 'Father', '0734463463', '0742356235', 'ricky@gmail.com', '256, Mombasa', 'Mombasa', 'Bamburi', 'Joan', 'Jecinta', 'Banker', 'Wife', '0794634533', '0753535355', 'joan@gmail.com', '256, Mombasa', 'Mombasa', 'Bamburi'),
(9, 9, 'Victor', 'Mula', 'Actor', 'Uncle', '0725623563', '078945y442', 'victor@gmail.com', '257, Mombasa', 'Mombasa', 'Changamwe', 'Riziki', 'Peace', 'Doctor', 'Wife', '0722356325', '0737345356', 'riziki@gmail.com', '257, Mombasa', 'Mombasa', 'Changamwe'),
(11, 10, 'Hillary', 'Cage', 'lawyer', 'Father', '0721202212', '078945y442', 'hillary@gmail.com', '258, Mombasa', 'Mombasa', 'Mtwapa', 'Irene', 'Adhiambo', 'Doctor', 'Wife', '0722356325', '0753535355', 'irene@gmail.com', '258, Mombasa', 'Mombasa', 'Mtwapa'),
(12, 11, 'David', 'Mkuu', 'Teacher', 'Husband', '0756525252', '0735355082', 'david@gmail.com', '2254, Mombasa', 'Mombasa', 'Kilifi', 'Tasha', 'Flow', 'Nurse', 'Wife', '0742323332', '0753535355', 'tasha@gmail.com', '2554, Mombasa', 'Mombasa', 'Kilifi'),
(18, 17, 'Kigen', 'Blue', 'Staff', 'Sister', '0713131215', '0713131215', 'kigen@gmail.com', '221', 'Mombasa', 'Kenya', 'Kigen', 'Blue', 'Staff', 'Sister', '0713131215', '0713131215', 'kigen@gmail.com', '221', 'Mombasa', 'Kenya'),
(19, 18, 'Kigen', 'Blue', 'Staff', 'Sister', '0713131215', '0713131215', 'kigen@gmail.com', '221', 'Mombasa', 'Kenya', 'Kigen', 'Blue', 'Staff', 'Sister', '0713131215', '0713131215', 'kigen@gmail.com', '221', 'Mombasa', 'Kenya'),
(20, 19, 'Kigen', 'Blue', 'Staff', 'Sister', '0713131215', '0713131215', 'kigen@gmail.com', '221', 'Mombasa', 'Kenya', 'Kigen', 'Blue', 'Staff', 'Sister', '0713131215', '0713131215', 'kigen@gmail.com', '221', 'Mombasa', 'Kenya'),
(21, 20, 'grace', 'prm', 'Staff', 'Sister', '0721201506', '0721201506', 'collinceprm@gmail.com', '50300', 'Mombasa', 'Kenya', 'paul', 'prm', 'Staff', 'Sister', '0721201701', '0721201702', 'collinceprm@gmail.com', 'Garwan Apartment RM 002', 'Mombasa', 'Kenya');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_in`
--

CREATE TABLE `tenant_in` (
  `in_id` int(3) NOT NULL,
  `contract_id` int(3) NOT NULL,
  `stat_keyholder` text NOT NULL,
  `stat_electricityRemote` text NOT NULL,
  `no_bulbs` int(2) NOT NULL,
  `stat_bulbs` text NOT NULL,
  `stat_paint` text NOT NULL,
  `stat_Windows` text NOT NULL,
  `stat_toiletSink` text NOT NULL,
  `stat_washingSink` text NOT NULL,
  `stat_doorLock` text NOT NULL,
  `stat_toiletDoorLock` text NOT NULL,
  `water_units` int(5) NOT NULL,
  `comments` text NOT NULL,
  `date_reg` date NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci COMMENT='"stat" represents the status/condition of an item';

--
-- Dumping data for table `tenant_in`
--

INSERT INTO `tenant_in` (`in_id`, `contract_id`, `stat_keyholder`, `stat_electricityRemote`, `no_bulbs`, `stat_bulbs`, `stat_paint`, `stat_Windows`, `stat_toiletSink`, `stat_washingSink`, `stat_doorLock`, `stat_toiletDoorLock`, `water_units`, `comments`, `date_reg`, `status`) VALUES
(1, 5, 'Good', 'Average', 2, 'Good', 'Average', 'Average', 'Broken', 'Average', 'Average', 'Average', 123, 'Please fix', '2023-08-08', 'Checked');

-- --------------------------------------------------------

--
-- Table structure for table `tenant_out`
--

CREATE TABLE `tenant_out` (
  `out_id` int(3) NOT NULL,
  `contract_id` int(3) NOT NULL,
  `stat_keyholder` text NOT NULL,
  `stat_electricityRemote` text NOT NULL,
  `no_bulbs` int(2) NOT NULL,
  `stat_bulbs` text NOT NULL,
  `stat_paint` text NOT NULL,
  `stat_Windows` text NOT NULL,
  `stat_toiletSink` text NOT NULL,
  `stat_washingSink` text NOT NULL,
  `stat_doorLock` text NOT NULL,
  `stat_toiletDoorLock` text NOT NULL,
  `comments` text NOT NULL,
  `date_reg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tenant_out`
--

INSERT INTO `tenant_out` (`out_id`, `contract_id`, `stat_keyholder`, `stat_electricityRemote`, `no_bulbs`, `stat_bulbs`, `stat_paint`, `stat_Windows`, `stat_toiletSink`, `stat_washingSink`, `stat_doorLock`, `stat_toiletDoorLock`, `comments`, `date_reg`) VALUES
(1, 9, 'Good', 'Good', 2, 'Average', 'Good', 'Good', 'Good', 'Good', 'Average', 'Average', 'Fine to be paid', '2023-08-08'),
(2, 12, 'No key holder', 'Bad', 1, 'two broken', 'Average', 'Good', 'Average', 'Good', 'Good', 'Average', 'Fine to be paid', '2023-08-12'),
(3, 15, 'Good', 'Good', 1, 'Good', 'Average', 'Good', 'Good', 'Good', 'Good', 'Bad', 'djsdjsdjsd', '2023-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(3) NOT NULL,
  `name` text NOT NULL,
  `role` text NOT NULL,
  `pno` varchar(15) NOT NULL,
  `u_name` varchar(10) NOT NULL,
  `pword` text NOT NULL,
  `date_reg` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `name`, `role`, `pno`, `u_name`, `pword`, `date_reg`) VALUES
(1, 'Prime', 'Administrator', '255717812676', 'Admin', '42f749ade7f9e195bf475f37a44cafcb', '2023-07-15'),
(2, 'Collins Ominde', 'Manager', '255787966996', 'Collins', '42f749ade7f9e195bf475f37a44cafcb', '2023-08-09');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contract`
--
ALTER TABLE `contract`
  ADD PRIMARY KEY (`contract_id`),
  ADD KEY `house_id` (`house_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `house`
--
ALTER TABLE `house`
  ADD PRIMARY KEY (`house_id`),
  ADD UNIQUE KEY `house_name` (`house_name`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `tenant_id` (`tenant_id`),
  ADD KEY `ref_no` (`ref_no`);

--
-- Indexes for table `tenant`
--
ALTER TABLE `tenant`
  ADD PRIMARY KEY (`tenant_id`);

--
-- Indexes for table `tenant_contacts`
--
ALTER TABLE `tenant_contacts`
  ADD PRIMARY KEY (`contact_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `tenant_in`
--
ALTER TABLE `tenant_in`
  ADD PRIMARY KEY (`in_id`),
  ADD KEY `contract_id` (`contract_id`);

--
-- Indexes for table `tenant_out`
--
ALTER TABLE `tenant_out`
  ADD PRIMARY KEY (`out_id`),
  ADD KEY `contract_id` (`contract_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contract`
--
ALTER TABLE `contract`
  MODIFY `contract_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `house`
--
ALTER TABLE `house`
  MODIFY `house_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tenant`
--
ALTER TABLE `tenant`
  MODIFY `tenant_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tenant_contacts`
--
ALTER TABLE `tenant_contacts`
  MODIFY `contact_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tenant_in`
--
ALTER TABLE `tenant_in`
  MODIFY `in_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tenant_out`
--
ALTER TABLE `tenant_out`
  MODIFY `out_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contract`
--
ALTER TABLE `contract`
  ADD CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`house_id`) REFERENCES `house` (`house_id`),
  ADD CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`tenant_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
