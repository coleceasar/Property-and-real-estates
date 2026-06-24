-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2026 at 08:51 AM
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
-- Database: `propertymanagement`
--

-- --------------------------------------------------------

--
-- Table structure for table `blocks table`
--

CREATE TABLE `blocks table` (
  `Block ID` int(20) NOT NULL,
  `Block Name` int(255) NOT NULL,
  `Number of Units` text NOT NULL,
  `Property ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice table`
--

CREATE TABLE `invoice table` (
  `Invoice ID` int(20) NOT NULL,
  `Tenant ID` int(20) NOT NULL,
  `Invoice date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Due date` datetime NOT NULL,
  `Amount` decimal(8,2) NOT NULL,
  `Status` enum('Pending','Paid','Overdue','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `landlordsable`
--

CREATE TABLE `landlordsable` (
  `OwnerID` int(20) NOT NULL,
  `Owner name` varchar(255) NOT NULL,
  `Phone Number` text NOT NULL,
  `Email` varchar(255) NOT NULL,
  `National ID` varchar(20) NOT NULL,
  `Property ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance table`
--

CREATE TABLE `maintenance table` (
  `Request ID` int(20) NOT NULL,
  `Unit ID` int(20) NOT NULL,
  `Tenant ID` int(20) NOT NULL,
  `Description` varchar(255) NOT NULL,
  `Status` enum('Report','In Progress','Resolved','') NOT NULL,
  `Cost` decimal(8,2) NOT NULL,
  `Priority` enum('Urgent','Medium','Low','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments table`
--

CREATE TABLE `payments table` (
  `Payment ID` int(20) NOT NULL,
  `Tenant ID` int(20) NOT NULL,
  `Amount` decimal(8,2) NOT NULL,
  `Payment Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Payment Method` enum('Mpesa','Credit Card','Cheque','Cash') NOT NULL,
  `Transaction Reference Number` int(20) NOT NULL,
  `Status` enum('Pending','Paid','Overdue','') NOT NULL,
  `Manager ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties table`
--

CREATE TABLE `properties table` (
  `Property ID` int(20) NOT NULL,
  `Owner ID` int(20) NOT NULL,
  `Manager ID` int(20) NOT NULL,
  `Property Name` varchar(255) NOT NULL,
  `Location` text NOT NULL,
  `Number of Units` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `propertymangers table`
--

CREATE TABLE `propertymangers table` (
  `Manager ID` int(20) NOT NULL,
  `Full name` varchar(255) NOT NULL,
  `NationalID Number` text NOT NULL,
  `Phone Number` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants table`
--

CREATE TABLE `tenants table` (
  `Tenant ID` int(20) NOT NULL,
  `Full name` varchar(255) NOT NULL,
  `Phone Number` text NOT NULL,
  `ID Number` text NOT NULL,
  `Property ID` int(20) NOT NULL,
  `Unit ID` int(20) NOT NULL,
  `Block ID` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units table`
--

CREATE TABLE `units table` (
  `Unit ID` int(20) NOT NULL,
  `Unit Name` varchar(255) NOT NULL,
  `Property ID` int(20) NOT NULL,
  `Block ID` int(20) NOT NULL,
  `Status` enum('Vaccant','Occupied','Under Maintenance','') NOT NULL,
  `Monthly Rent` decimal(6,2) NOT NULL,
  `Number of rooms` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blocks table`
--
ALTER TABLE `blocks table`
  ADD PRIMARY KEY (`Block ID`),
  ADD KEY `Property ID` (`Property ID`);

--
-- Indexes for table `invoice table`
--
ALTER TABLE `invoice table`
  ADD PRIMARY KEY (`Invoice ID`),
  ADD KEY `Tenant ID` (`Tenant ID`);

--
-- Indexes for table `landlordsable`
--
ALTER TABLE `landlordsable`
  ADD PRIMARY KEY (`OwnerID`),
  ADD KEY `Property ID` (`Property ID`);

--
-- Indexes for table `maintenance table`
--
ALTER TABLE `maintenance table`
  ADD PRIMARY KEY (`Request ID`),
  ADD KEY `Unit ID` (`Unit ID`),
  ADD KEY `Tenant ID` (`Tenant ID`);

--
-- Indexes for table `payments table`
--
ALTER TABLE `payments table`
  ADD PRIMARY KEY (`Payment ID`),
  ADD KEY `Tenant ID` (`Tenant ID`),
  ADD KEY `Manager ID` (`Manager ID`);

--
-- Indexes for table `properties table`
--
ALTER TABLE `properties table`
  ADD PRIMARY KEY (`Property ID`),
  ADD KEY `Owner ID` (`Owner ID`),
  ADD KEY `Manager ID` (`Manager ID`);

--
-- Indexes for table `propertymangers table`
--
ALTER TABLE `propertymangers table`
  ADD PRIMARY KEY (`Manager ID`);

--
-- Indexes for table `tenants table`
--
ALTER TABLE `tenants table`
  ADD PRIMARY KEY (`Tenant ID`),
  ADD KEY `Property ID` (`Property ID`),
  ADD KEY `Unit ID` (`Unit ID`),
  ADD KEY `Block ID` (`Block ID`);

--
-- Indexes for table `units table`
--
ALTER TABLE `units table`
  ADD PRIMARY KEY (`Unit ID`),
  ADD KEY `Property ID` (`Property ID`),
  ADD KEY `Block ID` (`Block ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blocks table`
--
ALTER TABLE `blocks table`
  MODIFY `Block ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice table`
--
ALTER TABLE `invoice table`
  MODIFY `Invoice ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `landlordsable`
--
ALTER TABLE `landlordsable`
  MODIFY `OwnerID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance table`
--
ALTER TABLE `maintenance table`
  MODIFY `Request ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments table`
--
ALTER TABLE `payments table`
  MODIFY `Payment ID` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `properties table`
--
ALTER TABLE `properties table`
  MODIFY `Property ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `propertymangers table`
--
ALTER TABLE `propertymangers table`
  MODIFY `Manager ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tenants table`
--
ALTER TABLE `tenants table`
  MODIFY `Tenant ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units table`
--
ALTER TABLE `units table`
  MODIFY `Unit ID` int(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blocks table`
--
ALTER TABLE `blocks table`
  ADD CONSTRAINT `block_property` FOREIGN KEY (`Property ID`) REFERENCES `properties table` (`Property ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `invoice table`
--
ALTER TABLE `invoice table`
  ADD CONSTRAINT `invoice_ tenant` FOREIGN KEY (`Tenant ID`) REFERENCES `tenants table` (`Tenant ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `maintenance table`
--
ALTER TABLE `maintenance table`
  ADD CONSTRAINT `maintenance _units` FOREIGN KEY (`Unit ID`) REFERENCES `units table` (`Unit ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `maintenance_ tenants` FOREIGN KEY (`Tenant ID`) REFERENCES `tenants table` (`Tenant ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments table`
--
ALTER TABLE `payments table`
  ADD CONSTRAINT `payments table_ibfk_1` FOREIGN KEY (`Tenant ID`) REFERENCES `tenants table` (`Tenant ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `properties table`
--
ALTER TABLE `properties table`
  ADD CONSTRAINT `Property_manager` FOREIGN KEY (`Manager ID`) REFERENCES `propertymangers table` (`Manager ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `property_owner` FOREIGN KEY (`Owner ID`) REFERENCES `landlordsable` (`OwnerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `property_units` FOREIGN KEY (`Property ID`) REFERENCES `units table` (`Unit ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tenants table`
--
ALTER TABLE `tenants table`
  ADD CONSTRAINT `tenant_ units` FOREIGN KEY (`Unit ID`) REFERENCES `units table` (`Unit ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units table`
--
ALTER TABLE `units table`
  ADD CONSTRAINT `unit _ block` FOREIGN KEY (`Block ID`) REFERENCES `blocks table` (`Block ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `unit _ property` FOREIGN KEY (`Property ID`) REFERENCES `properties table` (`Property ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
