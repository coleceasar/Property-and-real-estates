-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2026 at 08:46 AM
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
-- Database: `property_management_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks`
--

CREATE TABLE `blocks` (
  `blockid` int(20) NOT NULL,
  `property_id` int(20) NOT NULL,
  `blockname` varchar(255) NOT NULL,
  `number_of_floors` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blocks`
--

INSERT INTO `blocks` (`blockid`, `property_id`, `blockname`, `number_of_floors`) VALUES
(1, 1, 'Amaizing', 10),
(2, 1, 'Joyful', 7),
(3, 2, 'Kindness', 9),
(4, 2, 'Wisdom', 6);

-- --------------------------------------------------------

--
-- Table structure for table `floors`
--

CREATE TABLE `floors` (
  `floor_no` int(20) NOT NULL,
  `property_id` int(20) NOT NULL,
  `block_id` int(20) NOT NULL,
  `floor_name` varchar(30) NOT NULL,
  `floor_number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `floors`
--

INSERT INTO `floors` (`floor_no`, `property_id`, `block_id`, `floor_name`, `floor_number`) VALUES
(1, 1, 1, 'jungle', 1),
(2, 1, 1, 'Shark', 2),
(3, 1, 2, 'curious', 1),
(4, 1, 2, 'jingle ', 2),
(5, 1, 3, 'chop', 1),
(6, 1, 3, 'lightpen', 2);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `invoiceid` int(20) NOT NULL,
  `tenant_no` int(20) NOT NULL,
  `invoice_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `description` varchar(255) NOT NULL,
  `due_date` date NOT NULL,
  `phone_number` int(15) NOT NULL,
  `status` enum('very urgent','low urgency','medium urgency','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`invoiceid`, `tenant_no`, `invoice_date`, `description`, `due_date`, `phone_number`, `status`) VALUES
(1, 1, '2026-06-23 10:52:31', 'Good Morning, \r\nI would like to have a repaint on my walls.\r\n', '2026-06-30', 722222222, 'low urgency'),
(2, 2, '2026-06-23 10:53:34', 'Hello dear manager,\r\nI have a broken glass window kindly I need assistance.', '2026-06-24', 798777662, ''),
(3, 3, '2026-06-23 11:51:49', 'hello, \r\nMy sitting room\'s lights are not working', '2026-06-25', 700000000, 'medium urgency');

-- --------------------------------------------------------

--
-- Table structure for table `landlords`
--

CREATE TABLE `landlords` (
  `owner_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `owner_firstname` varchar(255) NOT NULL,
  `owner_lastname` varchar(255) NOT NULL,
  `phone_number` int(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `nationalid/ passport no` varchar(20) NOT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_branch_number` int(20) NOT NULL,
  `bank_account_number` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `landlords`
--

INSERT INTO `landlords` (`owner_id`, `property_id`, `owner_firstname`, `owner_lastname`, `phone_number`, `email`, `nationalid/ passport no`, `bank_name`, `bank_branch_number`, `bank_account_number`) VALUES
(1, 1, 'John', 'Methu', 700000000, 'methodisttowers@gmail.com', '21212121', NULL, 203, 12345678),
(2, 2, 'Dan ', 'Wash', 722222222, 'azultowers@gmail.com', '123456789', NULL, 222, 987654321),
(3, 3, 'Brighton', 'Chester', 798777662, 'brightonchester@gmail.com', '348557175', NULL, 876, 571856195);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `request_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `tenant_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `status` enum('report','in progress','resolved','not resolved') NOT NULL,
  `priority` enum('urgent','low','medium','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`request_id`, `unit_id`, `tenant_id`, `description`, `status`, `priority`) VALUES
(1, 2, 1, 'Hello my sink is not working', '', 'medium'),
(2, 2, 1, 'Hello my bedroom doors have an issue with the lock system', 'not resolved', 'urgent');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payments_id` int(11) NOT NULL,
  `tenant_no` int(11) NOT NULL,
  `invoiceid` int(20) NOT NULL,
  `amount` decimal(8,2) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `payment_method` enum('mpesa','bank transfer','cheque','credit card') NOT NULL,
  `phone_number` int(11) NOT NULL,
  `transaction_reference_number` varchar(11) NOT NULL,
  `status` enum('paid','pending','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
  `property_id` int(20) NOT NULL,
  `owner_id` int(20) NOT NULL,
  `manager_id` int(20) NOT NULL,
  `property_name` varchar(255) NOT NULL,
  `numberofblocks` int(20) NOT NULL,
  `location` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property`
--

INSERT INTO `property` (`property_id`, `owner_id`, `manager_id`, `property_name`, `numberofblocks`, `location`) VALUES
(1, 1, 1, 'Methodist Towers', 4, 'Nairobi'),
(2, 2, 2, 'Hennesy', 5, 'Parklands'),
(3, 3, 3, 'Note pad', 2, 'Westlands');

-- --------------------------------------------------------

--
-- Table structure for table `property_manager`
--

CREATE TABLE `property_manager` (
  `manager_id` int(20) NOT NULL,
  `property_id` int(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `id_number/passportno` varchar(255) NOT NULL,
  `phone_number` text NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `property_manager`
--

INSERT INTO `property_manager` (`manager_id`, `property_id`, `first_name`, `last_name`, `id_number/passportno`, `phone_number`, `email`) VALUES
(1, 1, 'peter', 'doe', '12345678', '0700000000', 'peterdoe@gmail.com'),
(2, 2, 'George', 'shack', '21212121', '0700000111', 'georgeshack@gmail.com'),
(3, 3, 'Shadrack', 'Manton', '3557861058', '07785851895', 'shadrackmanton@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `tenant_no` int(11) NOT NULL,
  `block_id` int(20) NOT NULL,
  `floor_no` int(11) NOT NULL,
  `unit_id` int(20) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `id number/ passport no` varchar(20) NOT NULL,
  `phone_number` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tenants`
--

INSERT INTO `tenants` (`tenant_no`, `block_id`, `floor_no`, `unit_id`, `first_name`, `last_name`, `id number/ passport no`, `phone_number`) VALUES
(1, 1, 1, 1, 'Malebo', 'Shayo', '568916', 73571843),
(2, 1, 2, 1, 'laser', 'Mac', '46785615', 77865756),
(3, 2, 3, 3, 'Rock', 'Paper', '3569651', 77836576);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `unit_id` int(20) NOT NULL,
  `property_id` int(20) NOT NULL,
  `block_id` int(20) NOT NULL,
  `floor_no` int(20) NOT NULL,
  `unit_name` varchar(255) NOT NULL,
  `type` enum('residential','commercial','offices','') NOT NULL,
  `office_size` enum('1900 sq ft','4800 sq ft','10000 sq ft','') NOT NULL,
  `number_of_rooms` int(20) NOT NULL,
  `residential_size` enum('800 sq ft','1400sq ft','2150 sq ft','') NOT NULL,
  `commercial_size` enum('160 sq ft','650 sq ft','2700 sq ft','21, 500 sq ft') NOT NULL,
  `monthly_rent` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`unit_id`, `property_id`, `block_id`, `floor_no`, `unit_name`, `type`, `office_size`, `number_of_rooms`, `residential_size`, `commercial_size`, `monthly_rent`) VALUES
(1, 1, 1, 0, 'AM 1', 'offices', '1900 sq ft', 0, '', '', 5000.00),
(2, 3, 2, 0, 'JL 1', 'residential', '', 2, '1400sq ft', '', 12000.00),
(3, 1, 3, 0, 'KS 1', 'commercial', '', 0, '', '160 sq ft', 3000.00),
(4, 3, 4, 0, 'WM 1', 'residential', '', 3, '2150 sq ft', '', 20000.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`blockid`),
  ADD KEY `propertyid` (`property_id`);

--
-- Indexes for table `floors`
--
ALTER TABLE `floors`
  ADD PRIMARY KEY (`floor_no`),
  ADD KEY `block_id` (`block_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoiceid`),
  ADD KEY `tenant_id` (`tenant_no`),
  ADD KEY `tenant_no` (`tenant_no`);

--
-- Indexes for table `landlords`
--
ALTER TABLE `landlords`
  ADD PRIMARY KEY (`owner_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`request_id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payments_id`),
  ADD KEY `tenantid` (`tenant_no`),
  ADD KEY `tenant_id` (`tenant_no`),
  ADD KEY `invoiceid` (`invoiceid`),
  ADD KEY `tenant_no` (`tenant_no`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
  ADD PRIMARY KEY (`property_id`),
  ADD KEY `owner_id` (`owner_id`),
  ADD KEY `manager_id` (`manager_id`);

--
-- Indexes for table `property_manager`
--
ALTER TABLE `property_manager`
  ADD PRIMARY KEY (`manager_id`),
  ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `tenants`
--
ALTER TABLE `tenants`
  ADD PRIMARY KEY (`tenant_no`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `block_id` (`block_id`),
  ADD KEY `property_id` (`floor_no`),
  ADD KEY `floor_id` (`floor_no`),
  ADD KEY `floor_no` (`floor_no`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `property_id` (`property_id`),
  ADD KEY `block_id` (`block_id`),
  ADD KEY `floor_id` (`floor_no`),
  ADD KEY `floor_no` (`floor_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks`
--
ALTER TABLE `blocks`
  MODIFY `blockid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `floors`
--
ALTER TABLE `floors`
  MODIFY `floor_no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoiceid` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `landlords`
--
ALTER TABLE `landlords`
  MODIFY `owner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `request_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payments_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `property`
--
ALTER TABLE `property`
  MODIFY `property_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `property_manager`
--
ALTER TABLE `property_manager`
  MODIFY `manager_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tenants`
--
ALTER TABLE `tenants`
  MODIFY `tenant_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `unit_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocks`
--
ALTER TABLE `blocks`
  ADD CONSTRAINT `blocks_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `floors`
--
ALTER TABLE `floors`
  ADD CONSTRAINT `floor_block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`blockid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `floor_property` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoice_ tenant` FOREIGN KEY (`tenant_no`) REFERENCES `tenants` (`tenant_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `landlords`
--
ALTER TABLE `landlords`
  ADD CONSTRAINT `landlords_properties` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance _units` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maintenance_ tenants` FOREIGN KEY (`tenant_id`) REFERENCES `tenants` (`tenant_no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payment_invoice` FOREIGN KEY (`tenant_no`) REFERENCES `tenants` (`tenant_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payment_tenant` FOREIGN KEY (`tenant_no`) REFERENCES `tenants` (`tenant_no`);

--
-- Constraints for table `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `property_landlord` FOREIGN KEY (`owner_id`) REFERENCES `landlords` (`owner_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `property_manager` FOREIGN KEY (`manager_id`) REFERENCES `property_manager` (`manager_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenants`
--
ALTER TABLE `tenants`
  ADD CONSTRAINT `floor_tenant` FOREIGN KEY (`floor_no`) REFERENCES `floors` (`floor_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tenant_ units` FOREIGN KEY (`unit_id`) REFERENCES `units` (`unit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tenants_blocks` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`blockid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `unit _ block` FOREIGN KEY (`block_id`) REFERENCES `blocks` (`blockid`),
  ADD CONSTRAINT `unit _ property` FOREIGN KEY (`property_id`) REFERENCES `property` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
