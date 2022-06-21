-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 21, 2022 at 10:57 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uas`
--

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `DEPARTMENT_ID` int(4) NOT NULL,
  `DEPARTMENT_NAME` varchar(30) NOT NULL,
  `MANAGER_ID` int(6) NOT NULL,
  `MANAGER_NAME` varchar(255) NOT NULL,
  `MANAGER_STARTDATE` date NOT NULL COMMENT 'tanggal manager mulai bekerja',
  `DEPARTMENT_REGION` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`DEPARTMENT_ID`, `DEPARTMENT_NAME`, `MANAGER_ID`, `MANAGER_NAME`, `MANAGER_STARTDATE`, `DEPARTMENT_REGION`) VALUES
(10, 'Administrasi', 200, 'JOSEPSH', '2022-06-22', 'ASIA'),
(20, 'MARKETING', 201, 'PETER', '2022-06-01', 'EROPA'),
(50, 'SHIPPING', 124, 'PARKER', '2022-06-01', 'AFRIKA'),
(60, 'IT', 103, 'ROBEN', '2022-06-04', 'AMERIKA'),
(80, 'SALES', 149, 'UWAIS', '2022-06-05', 'AMERIKA'),
(90, 'EXECUTIVE', 100, 'VICTOR', '2022-06-06', '2100'),
(110, 'ACCOUNTING', 100, '1700', '2022-06-23', 'EROPA'),
(190, 'CONTRACTING', 205, 'ALEX', '2022-06-30', 'ASIA');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `EMPLOYEE_ID` int(6) NOT NULL,
  `FIRST_NAME` varchar(20) NOT NULL,
  `LAST_NAME` varchar(25) NOT NULL,
  `EMAIL` varchar(25) NOT NULL,
  `PHONE_NUMBER` varchar(20) NOT NULL,
  `HIRE_DATE` date NOT NULL,
  `JOB_ID` varchar(10) NOT NULL,
  `SALARY` int(10) NOT NULL,
  `COMMISSION` int(10) NOT NULL,
  `MANAGER_ID` int(6) NOT NULL,
  `DEPARTMENT_ID` int(4) NOT NULL,
  `BONUS` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `JOB_ID` varchar(10) NOT NULL,
  `JOB_NAME` varchar(255) NOT NULL,
  `JOB_KATEGORI` varchar(25) NOT NULL,
  `JOB_DESCRIPTION` varchar(300) NOT NULL,
  `MIN_SALARY` int(6) NOT NULL,
  `MAX_SALARY` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`JOB_ID`, `JOB_NAME`, `JOB_KATEGORI`, `JOB_DESCRIPTION`, `MIN_SALARY`, `MAX_SALARY`) VALUES
('AD_ASST', 'Administration Assistant', 'Administration', 'MENCATAT HAL PENTING', 3000, 6000),
('AD_MGR', 'Accounting Manager', 'AKUNTAN', 'MENGATUR KEUANGAN', 20000, 40000),
('AD_VP', 'Administration Vice President', 'Administration', 'MENCATAT HAL PENTING', 15000, 30000),
('IT_PROG', 'Programmer', 'IT', 'MEMBUAT APP', 4000, 6000),
('MK_MAN', 'Marketing Manager', 'SALES', 'MEMPROMOSIKAN PRODUK', 9000, 15000);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`DEPARTMENT_ID`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`EMPLOYEE_ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`),
  ADD KEY `JOB_ID` (`JOB_ID`),
  ADD KEY `DEPARTMENT_ID` (`DEPARTMENT_ID`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`JOB_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`JOB_ID`) REFERENCES `jobs` (`JOB_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`DEPARTMENT_ID`) REFERENCES `departments` (`DEPARTMENT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
