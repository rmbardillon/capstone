-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2023 at 04:20 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cswd`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `ADDRESS_ID` varchar(16) NOT NULL,
  `BARANGAY` varchar(32) NOT NULL,
  `ADDRESS` varchar(300) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ADDRESS_ID`, `BARANGAY`, `ADDRESS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('2510ec0afb2a4181', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('2fd02d3401b3476d', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon'),
('586b0b67bf3c4502', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('606226180d024602', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('9b7e253519fb4431', 'Aplaya', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday'),
('c3c487d1a456473b', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` varchar(16) NOT NULL,
  `admin_type` enum('Main Administrator','Solo Parent Administrator','Senior Citizen Administrator','PWD Administrator') NOT NULL,
  `barangay` enum('City Hall','Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `username` varchar(128) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `LOGIN_ATTEMPTS` int(2) NOT NULL DEFAULT 0,
  `IS_LOCKED` tinyint(1) NOT NULL DEFAULT 0,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `admin_type`, `barangay`, `username`, `first_name`, `last_name`, `email`, `password`, `LOGIN_ATTEMPTS`, `IS_LOCKED`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('2d88e3dfc20e11ed', 'Senior Citizen Administrator', 'City Hall', 'adminjulanday', 'JULES JACOB', 'ULANDAY', 'aivee@luddo.me', '$2y$10$I6ShG/yokUgwwnPEysTHX.UcEskZFyDatPMJsNcr2E0EWoSUJMdt.', 0, 0, '2023-03-14 10:16:06', '2023-03-14 10:16:06', 'N', 'adminrbardillon'),
('97d54118c20d11ed', 'Solo Parent Administrator', 'City Hall', 'adminaporlares', 'AARON', 'PORLARES', 'amberinseattle@gmailvn.net', '$2y$10$I6ShG/yokUgwwnPEysTHX.UcEskZFyDatPMJsNcr2E0EWoSUJMdt.', 0, 0, '2023-03-14 10:11:55', '2023-03-14 10:11:55', 'N', 'adminrbardillon'),
('efb11061c20c11ed', 'Main Administrator', 'City Hall', 'adminrbardillon', 'ROMEO JR', 'BARDILLON', 'romsky.bardillon@gmail.com', '$2y$10$uB7DHqLbvnsibZ/jZpNUjeeq6O4w3Sn8H23QV4TW88aJyyxFX52JC', 0, 0, '2023-03-14 10:07:13', '2023-03-14 10:07:13', 'N', 'SUPERADMIN');

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `ANNOUNCEMENT_ID` varchar(16) NOT NULL,
  `TITLE` varchar(128) NOT NULL,
  `ANNOUNCEMENT_FOR` enum('All','Administrator','PWD','Senior Citizen','Solo Parent') NOT NULL,
  `BARANGAY` enum('All','City Hall','Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `MESSAGE` varchar(1024) NOT NULL,
  `DATE_FROM` varchar(8) DEFAULT NULL,
  `DATE` date NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ANNOUNCEMENT_ID`, `TITLE`, `ANNOUNCEMENT_FOR`, `BARANGAY`, `MESSAGE`, `DATE_FROM`, `DATE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f13a8396c33711ed', 'CASH OUT', 'All', 'All', 'SDF', NULL, '2023-03-16', '2023-03-15 21:47:35', '2023-03-15 21:47:35', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `APPLICANT_ID` varchar(16) NOT NULL,
  `FORM_CONTROL_NUMBER` varchar(64) NOT NULL,
  `APPLICANT_TYPE` varchar(64) NOT NULL,
  `CITIZEN_ID` varchar(64) NOT NULL,
  `PLACE_OF_BIRTH` varchar(300) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`APPLICANT_ID`, `FORM_CONTROL_NUMBER`, `APPLICANT_TYPE`, `CITIZEN_ID`, `PLACE_OF_BIRTH`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('4a6f860461ba48d8', 'PWDF-043-3', 'PWD', '043428023-2228', NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', ''),
('6b1b708352e74978', 'PWDF-043-2', 'PWD', '043428023-3323', NULL, '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', ''),
('6c67033c363145e2', 'SCF-043-1', 'Senior Citizen', 'SC-688120', 'SANTA ROSA, LAGUNA', '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', ''),
('8dd9933bd99f4cb6', 'PWDF-043-3', 'PWD', '043428023-4060', NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', ''),
('bf7dcf506ca14f8f', 'SPF-043-2', 'Solo Parent', '2023-82156', 'SANTA ROSA, LAGUNA', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', ''),
('dc52bbbed2f1418b', 'SPF-043-2', 'Solo Parent', '2023-91882', 'SANTA ROSA, LAGUNA', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `blood_type`
--

CREATE TABLE `blood_type` (
  `BLOOD_TYPE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `BLOOD_TYPE` varchar(16) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_type`
--

INSERT INTO `blood_type` (`BLOOD_TYPE_ID`, `PERSON_ID`, `BLOOD_TYPE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e92d5fc34111ed', '8dd9933bd99f4cb6', 'A+', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82df61cac33411ed', '4a6f860461ba48d8', 'A+', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `claimed_benefits`
--

CREATE TABLE `claimed_benefits` (
  `CLAIMED_BENEFITS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `EVENT_ID` varchar(16) NOT NULL,
  `APPLICATION_TYPE` varchar(32) NOT NULL,
  `STATUS_OF_CLAIMS` varchar(16) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `COMPANY_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `COMPANY` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`COMPANY_ID`, `PERSON_ID`, `COMPANY`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('ad009fb7c34211ed', 'dc52bbbed2f1418b', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ecee82dfc26b11ed', 'bf7dcf506ca14f8f', NULL, '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `DOCUMENT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `LOCATION` varchar(64) NOT NULL,
  `NAME` varchar(128) NOT NULL,
  `TYPE` varchar(128) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`DOCUMENT_ID`, `PERSON_ID`, `LOCATION`, `NAME`, `TYPE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('ad043f83c34211ed', 'dc52bbbed2f1418b', '../documents/Applicant Signature6411de799ad436.86251661.png', '6411de799ad436.86251661.png', 'image/png', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', ''),
('ad0456b1c34211ed', 'dc52bbbed2f1418b', '../documents/Applicant ID6411de799afed8.99845630.jpg', '6411de799afed8.99845630.jpg', 'image/jpeg', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', ''),
('ad047018c34211ed', 'dc52bbbed2f1418b', '../documents/Applicant Valid ID6411de799b2478.73621258.jpg', '6411de799b2478.73621258.jpg', 'image/jpeg', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', ''),
('ad04fa05c34211ed', 'dc52bbbed2f1418b', '../documents/Applicant Barangay Residency6411de799c01c3.91759734', '6411de799c01c3.91759734.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `draft`
--

CREATE TABLE `draft` (
  `DRAFT_ID` varchar(16) NOT NULL,
  `APPLICATION_TYPE` varchar(32) NOT NULL,
  `APPLICANT_NAME` varchar(128) NOT NULL,
  `APPLICANT_BARANGAY` varchar(64) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `educational_attainment`
--

CREATE TABLE `educational_attainment` (
  `EDUCATIONAL_ATTAINMENT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `EDUCATIONAL_ATTAINMENT` varchar(128) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `educational_attainment`
--

INSERT INTO `educational_attainment` (`EDUCATIONAL_ATTAINMENT_ID`, `PERSON_ID`, `EDUCATIONAL_ATTAINMENT`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e93de6c34111ed', '8dd9933bd99f4cb6', 'None', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82dfe624c33411ed', '4a6f860461ba48d8', 'None', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('ad007c6bc34211ed', 'dc52bbbed2f1418b', 'None', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ad0268aec34211ed', '988819305b3b4028', 'None', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ecee61bcc26b11ed', 'bf7dcf506ca14f8f', 'College', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon'),
('ecef7512c26b11ed', '3bc3638e22384b3b', 'None', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `employment_status`
--

CREATE TABLE `employment_status` (
  `EMPLOYMENT_STATUS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `EMPLOYMENT_STATUS` varchar(64) NOT NULL,
  `CATEGORY_OF_EMPLOYMENT` varchar(64) DEFAULT NULL,
  `NATURE_OF_EMPLOYMENT` varchar(64) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employment_status`
--

INSERT INTO `employment_status` (`EMPLOYMENT_STATUS_ID`, `PERSON_ID`, `EMPLOYMENT_STATUS`, `CATEGORY_OF_EMPLOYMENT`, `NATURE_OF_EMPLOYMENT`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e9ca39c34111ed', '8dd9933bd99f4cb6', 'Student', NULL, NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82dffaadc33411ed', '4a6f860461ba48d8', 'Unemployed', NULL, NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `GENDER_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `GENDER` varchar(16) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`GENDER_ID`, `PERSON_ID`, `GENDER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e80f71c34111ed', '8dd9933bd99f4cb6', 'Male', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82debb40c33411ed', '4a6f860461ba48d8', '', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('acffedcbc34211ed', 'dc52bbbed2f1418b', 'Male', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ce6da661c33211ed', '6c67033c363145e2', 'Male', '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday'),
('ecedbf6dc26b11ed', 'bf7dcf506ca14f8f', 'Male', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `government_membership`
--

CREATE TABLE `government_membership` (
  `GOVERNMENT_MEMBERSHIP_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `IS_ACTIVE_VOTER` varchar(16) NOT NULL,
  `IS_4PS_MEMBER` varchar(16) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `government_membership`
--

INSERT INTO `government_membership` (`GOVERNMENT_MEMBERSHIP_ID`, `PERSON_ID`, `IS_ACTIVE_VOTER`, `IS_4PS_MEMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e943d5c34111ed', '8dd9933bd99f4cb6', 'Yes', 'Yes', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82dfebf5c33411ed', '4a6f860461ba48d8', 'Yes', 'Yes', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `id_reference_number`
--

CREATE TABLE `id_reference_number` (
  `ID_REFERENCE_NUMBER_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `SSS_NUMBER` varchar(64) DEFAULT NULL,
  `GSIS_NUMBER` varchar(64) DEFAULT NULL,
  `PSN_NUMBER` varchar(64) DEFAULT NULL,
  `IS_PHILHEALTH_MEMBER` varchar(64) DEFAULT NULL,
  `PHILHEALTH_NUMBER` varchar(64) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `id_reference_number`
--

INSERT INTO `id_reference_number` (`ID_REFERENCE_NUMBER_ID`, `PERSON_ID`, `SSS_NUMBER`, `GSIS_NUMBER`, `PSN_NUMBER`, `IS_PHILHEALTH_MEMBER`, `PHILHEALTH_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40eb78f0c34111ed', '8dd9933bd99f4cb6', '', '', '', 'No', '', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82e0ac0bc33411ed', '4a6f860461ba48d8', '', '', '', 'No', NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `INCOME_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `MONTHLY_INCOME` varchar(128) DEFAULT NULL,
  `TOTAL_FAMILY_INCOME` decimal(19,2) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`INCOME_ID`, `PERSON_ID`, `MONTHLY_INCOME`, `TOTAL_FAMILY_INCOME`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40eaeaf6c34111ed', '8dd9933bd99f4cb6', NULL, NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82e00fd8c33411ed', '4a6f860461ba48d8', NULL, NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('ad00c304c34211ed', 'dc52bbbed2f1418b', NULL, '0.00', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ad030546c34211ed', '988819305b3b4028', '0', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('eceea420c26b11ed', 'bf7dcf506ca14f8f', NULL, '0.00', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon'),
('ecef7ebbc26b11ed', '3bc3638e22384b3b', '0', NULL, '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `issued_id`
--

CREATE TABLE `issued_id` (
  `ISSUED_ID_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `APPLICANT_TYPE` varchar(64) NOT NULL,
  `DATE_ISSUED` datetime NOT NULL DEFAULT current_timestamp(),
  `EXPIRATION_DATE` date DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issued_id`
--

INSERT INTO `issued_id` (`ISSUED_ID_ID`, `PERSON_ID`, `APPLICANT_TYPE`, `DATE_ISSUED`, `EXPIRATION_DATE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('9f1e0888c27011ed', 'bf7dcf506ca14f8f', 'Solo Parent', '2023-03-14 00:00:00', '2024-03-14', '2023-03-14 22:00:48', '2023-03-14 22:00:48', 'N', 'adminrbardillon'),
('b96c8b62c33111ed', 'bf7dcf506ca14f8f', 'Solo Parent', '2023-03-15 00:00:00', '2024-03-15', '2023-03-15 21:03:05', '2023-03-15 21:03:05', 'N', 'adminrbardillon'),
('bdb044bcc33311ed', 'bf7dcf506ca14f8f', 'Solo Parent', '2023-03-15 00:00:00', '2024-03-15', '2023-03-15 21:17:31', '2023-03-15 21:17:31', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `JOB_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `JOB` varchar(300) DEFAULT NULL,
  `OTHER_JOB` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`JOB_ID`, `PERSON_ID`, `JOB`, `OTHER_JOB`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40ea4f24c34111ed', '8dd9933bd99f4cb6', NULL, NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82e009b4c33411ed', '4a6f860461ba48d8', NULL, NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('ad011280c34211ed', 'dc52bbbed2f1418b', 'Unemployed', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ad02ff12c34211ed', '988819305b3b4028', 'Armed Forces Occupations', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ce6dd163c33211ed', '6c67033c363145e2', 'Unemployed', NULL, '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday'),
('eceecfddc26b11ed', 'bf7dcf506ca14f8f', 'Unemployed', NULL, '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon'),
('ecef7a13c26b11ed', '3bc3638e22384b3b', 'Unemployed', NULL, '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `landline`
--

CREATE TABLE `landline` (
  `LANDLINE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `LANDLINE_NUMBER` varchar(32) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `landline`
--

INSERT INTO `landline` (`LANDLINE_ID`, `PERSON_ID`, `LANDLINE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e76061c34111ed', '8dd9933bd99f4cb6', '0256985633', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82de2f11c33411ed', '4a6f860461ba48d8', '', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `marital_status`
--

CREATE TABLE `marital_status` (
  `MARITAL_STATUS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `MARITAL_STATUS` varchar(64) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marital_status`
--

INSERT INTO `marital_status` (`MARITAL_STATUS_ID`, `PERSON_ID`, `MARITAL_STATUS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e893fdc34111ed', '8dd9933bd99f4cb6', 'Single', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82df5af2c33411ed', '4a6f860461ba48d8', 'Single', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('ad0244fdc34211ed', '988819305b3b4028', 'Single', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ce6dab60c33211ed', '6c67033c363145e2', 'Single', '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday'),
('ecef5441c26b11ed', '3bc3638e22384b3b', 'Single', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `MEDIA_ID` int(11) NOT NULL,
  `USERNAME` varchar(128) NOT NULL,
  `IMAGE_LOCATION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`MEDIA_ID`, `USERNAME`, `IMAGE_LOCATION`) VALUES
(1, '2023-82156', '6411ba39378b98.73188298.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `name`
--

CREATE TABLE `name` (
  `NAME_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `FIRST_NAME` varchar(128) NOT NULL,
  `MIDDLE_NAME` varchar(128) DEFAULT NULL,
  `LAST_NAME` varchar(128) NOT NULL,
  `SUFFIX` varchar(12) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `name`
--

INSERT INTO `name` (`NAME_ID`, `PERSON_ID`, `FIRST_NAME`, `MIDDLE_NAME`, `LAST_NAME`, `SUFFIX`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e6bf4fc34111ed', '8dd9933bd99f4cb6', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('40ec24d4c34111ed', '0a278516f22149d9', 'ROMEO JR', '', 'BARDILLON', NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('40ecd46dc34111ed', '25f10fa0e8a944e3', 'ROMEO JR', '', 'BARDILLON', NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('40ece3bac34111ed', '996d825f23f54113', 'ROMEO JR', '', 'BARDILLON', NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82dd7d49c33411ed', '4a6f860461ba48d8', 'ROMEO JR', '', 'MONTEALEGRE', '', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('82e0c13cc33411ed', 'ae9ec33a66954bd0', 'ROMEO JR', '', 'BARDILLON', '', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('82e0d089c33411ed', 'a1604c1331824a1d', 'MILA ROSA', '', 'MONTEALEGRE', NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('82e0e014c33411ed', '626dba73aa20435d', 'LEBRON', '', 'JAMES', '', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('94f942b6c26611ed', '6b1b708352e74978', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', '', '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('94fb1b56c26611ed', '16e0e15623b34fa2', 'ROMEO SR', 'UY', 'BARDILLON', '', '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('94fbec2dc26611ed', '40af5f68c7e8473b', 'MILA ROSA', 'SABANDAL', 'MONTEALEGRE', NULL, '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('94fbfc1bc26611ed', 'cd220d6aa9964e12', 'DON KENNETH', 'MONTEALEGRE', 'BARDILLON', '', '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('acff315ec34211ed', 'dc52bbbed2f1418b', 'ROMEO JR', '', 'BARDILLON', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ad01d009c34211ed', '988819305b3b4028', 'ASD', '', 'ASD', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ce6d96dcc33211ed', '6c67033c363145e2', 'ROMEO JR', '', 'BARDILLON', NULL, '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday'),
('ecec84b5c26b11ed', 'bf7dcf506ca14f8f', 'ROMEO JR', NULL, 'BARDILLON', '', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon'),
('eceee623c26b11ed', '3bc3638e22384b3b', 'ROM', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `organization`
--

CREATE TABLE `organization` (
  `ORGANIZATION_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `ORGANIZATION_AFFILIATED` varchar(128) DEFAULT NULL,
  `CONTACT_PERSON` varchar(128) DEFAULT NULL,
  `OFFICE_ADDRESS` varchar(256) DEFAULT NULL,
  `TELEPHONE_NUMBER` varchar(32) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`ORGANIZATION_ID`, `PERSON_ID`, `ORGANIZATION_AFFILIATED`, `CONTACT_PERSON`, `OFFICE_ADDRESS`, `TELEPHONE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40eaf389c34111ed', '8dd9933bd99f4cb6', '', '', '', '', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82e015afc33411ed', '4a6f860461ba48d8', '', '', '', '', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `pension`
--

CREATE TABLE `pension` (
  `PENSION_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `HAS_PENSION` char(1) NOT NULL DEFAULT 'N',
  `TYPE` varchar(300) DEFAULT NULL,
  `AMOUNT` decimal(19,6) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pension`
--

INSERT INTO `pension` (`PENSION_ID`, `PERSON_ID`, `HAS_PENSION`, `TYPE`, `AMOUNT`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('ce6dd749c33211ed', '6c67033c363145e2', 'N', NULL, NULL, '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PERSON_ID` varchar(16) NOT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`PERSON_ID`, `DATE_OF_BIRTH`, `EMAIL`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('0a278516f22149d9', NULL, NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('16e0e15623b34fa2', NULL, NULL, '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('25f10fa0e8a944e3', NULL, NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('3bc3638e22384b3b', '2023-03-01', NULL, '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon'),
('40af5f68c7e8473b', NULL, NULL, '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('4a6f860461ba48d8', '2001-08-14', 'bodebog381@galcake.com', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('626dba73aa20435d', NULL, NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('6b1b708352e74978', NULL, NULL, '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('6c67033c363145e2', '1963-02-28', 'aivee@luddo.me', '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday'),
('8dd9933bd99f4cb6', '2022-03-02', 'romsky.bardillon@gmail.com1', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('988819305b3b4028', '2023-03-13', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('996d825f23f54113', NULL, NULL, '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('a1604c1331824a1d', NULL, NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('ae9ec33a66954bd0', NULL, NULL, '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('bf7dcf506ca14f8f', '2001-07-30', 'romsky.bardillon@gmail.com', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon'),
('cd220d6aa9964e12', NULL, NULL, '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('dc52bbbed2f1418b', '2007-02-14', 'romsky.bardillon@gmail.comh', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `person_address`
--

CREATE TABLE `person_address` (
  `PERSON_ADDRESS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `ADDRESS_ID` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person_address`
--

INSERT INTO `person_address` (`PERSON_ADDRESS_ID`, `PERSON_ID`, `ADDRESS_ID`) VALUES
('40e6cc22c34111ed', '8dd9933bd99f4cb6', '2510ec0afb2a4181'),
('82dd888ac33411ed', '4a6f860461ba48d8', 'c3c487d1a456473b'),
('94f97b6cc26611ed', '6b1b708352e74978', '586b0b67bf3c4502'),
('acff3c1ec34211ed', 'dc52bbbed2f1418b', '606226180d024602'),
('ce6da0dac33211ed', '6c67033c363145e2', '9b7e253519fb4431'),
('eced30a8c26b11ed', 'bf7dcf506ca14f8f', '2fd02d3401b3476d');

-- --------------------------------------------------------

--
-- Table structure for table `previous_address`
--

CREATE TABLE `previous_address` (
  `PREVIOUS_ADDRESS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `REGION` varchar(128) DEFAULT NULL,
  `PROVINCE` varchar(128) DEFAULT NULL,
  `CITY` varchar(128) DEFAULT NULL,
  `BARANGAY` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `previous_address`
--

INSERT INTO `previous_address` (`PREVIOUS_ADDRESS_ID`, `PERSON_ID`, `REGION`, `PROVINCE`, `CITY`, `BARANGAY`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e62180c34111ed', '8dd9933bd99f4cb6', '', '', '', '', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82dcf634c33411ed', '4a6f860461ba48d8', '', '', '', '', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `pwdreset`
--

CREATE TABLE `pwdreset` (
  `id` int(11) NOT NULL,
  `pwdResetEmail` text NOT NULL,
  `pwdResetSelector` text NOT NULL,
  `pwdResetToken` longtext NOT NULL,
  `pwdResetExpires` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `pwd_application_accomplisher`
--

CREATE TABLE `pwd_application_accomplisher` (
  `PWD_APLICATION_ACCOMPLISHER_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `ACCOMPLISHED_BY` varchar(128) NOT NULL,
  `ACCOMPLISHER_NAME` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pwd_application_accomplisher`
--

INSERT INTO `pwd_application_accomplisher` (`PWD_APLICATION_ACCOMPLISHER_ID`, `PERSON_ID`, `ACCOMPLISHED_BY`, `ACCOMPLISHER_NAME`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40eec4c4c34111ed', '8dd9933bd99f4cb6', 'Representative', 'ASDASD', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82e20940c33411ed', '4a6f860461ba48d8', 'Applicant', 'ROMEO JR  MONTEALEGRE ', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `pwd_disease`
--

CREATE TABLE `pwd_disease` (
  `PWD_DISEASE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TYPE_OF_DISABILITY` set('Deaf/Hard of Hearing','Intellectual Disability','Learning Disability','Mental Disability','Physical Disability','Psychosocial Disability','Speech & Language Impairment','Visual Disability','Cancer (RA11215)','Rare Disease (RA10747)') DEFAULT NULL,
  `MEDICAL_CONDITION` varchar(128) DEFAULT NULL,
  `CAUSE_OF_DISABILITY` enum('CONGENITAL/INBORN','ACQUIRED') NOT NULL,
  `CONGENITAL_INBORN` set('Autism','ADHD','Cerebral Palsy','Down Syndrome') DEFAULT NULL,
  `ACQUIRED` set('Chronic Illness','Cerebral Palsy','Injury') DEFAULT NULL,
  `STATUS_OF_DISABILITY` enum('Permanent','Temporary') DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pwd_disease`
--

INSERT INTO `pwd_disease` (`PWD_DISEASE_ID`, `PERSON_ID`, `TYPE_OF_DISABILITY`, `MEDICAL_CONDITION`, `CAUSE_OF_DISABILITY`, `CONGENITAL_INBORN`, `ACQUIRED`, `STATUS_OF_DISABILITY`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40ee02e7c34111ed', '8dd9933bd99f4cb6', 'Physical Disability', NULL, 'CONGENITAL/INBORN', 'ADHD,Cerebral Palsy', NULL, 'Temporary', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82e1eaf1c33411ed', '4a6f860461ba48d8', 'Physical Disability', NULL, 'ACQUIRED', NULL, 'Injury', 'Temporary', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `pwd_physician`
--

CREATE TABLE `pwd_physician` (
  `PWD_PHYSICIAN_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `PWD_PHYSICIAN_NAME` varchar(128) NOT NULL,
  `PHYSICIAN_LICENSE_NUMBER` varchar(128) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pwd_physician`
--

INSERT INTO `pwd_physician` (`PWD_PHYSICIAN_ID`, `PERSON_ID`, `PWD_PHYSICIAN_NAME`, `PHYSICIAN_LICENSE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40ee282ec34111ed', '8dd9933bd99f4cb6', 'ROMEO JR BARDILLON', 'MD8299-885', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82e1f9e1c33411ed', '4a6f860461ba48d8', 'ROMEO JR BARDILLON', 'MD8299-885', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `relationship`
--

CREATE TABLE `relationship` (
  `RELATIONSHIP_ID` varchar(16) NOT NULL,
  `APPLICANT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `RELATIONSHIP_TYPE` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `relationship`
--

INSERT INTO `relationship` (`RELATIONSHIP_ID`, `APPLICANT_ID`, `PERSON_ID`, `RELATIONSHIP_TYPE`) VALUES
('40eca2e9c34111ed', '8dd9933bd99f4cb6', '0a278516f22149d9', 'Father'),
('40ecd929c34111ed', '8dd9933bd99f4cb6', '25f10fa0e8a944e3', 'Mother'),
('40ed7d1fc34111ed', '8dd9933bd99f4cb6', '996d825f23f54113', 'Guardian'),
('82e0c62bc33411ed', '4a6f860461ba48d8', 'ae9ec33a66954bd0', 'Father'),
('82e0d4e9c33411ed', '4a6f860461ba48d8', 'a1604c1331824a1d', 'Mother'),
('82e15fb8c33411ed', '4a6f860461ba48d8', '626dba73aa20435d', 'Guardian'),
('94fb2455c26611ed', '6b1b708352e74978', '16e0e15623b34fa2', 'Father'),
('94fbf1fdc26611ed', '6b1b708352e74978', '40af5f68c7e8473b', 'Mother'),
('94fc021dc26611ed', '6b1b708352e74978', 'cd220d6aa9964e12', 'Guardian'),
('ad038dccc34211ed', 'dc52bbbed2f1418b', '988819305b3b4028', 'Son'),
('ecef8472c26b11ed', 'bf7dcf506ca14f8f', '3bc3638e22384b3b', 'Son');

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `RELIGION_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `RELIGION` varchar(64) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `religion`
--

INSERT INTO `religion` (`RELIGION_ID`, `PERSON_ID`, `RELIGION`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e88dc4c34111ed', '8dd9933bd99f4cb6', 'CATHOLIC', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82dec13bc33411ed', '4a6f860461ba48d8', 'CATHOLIC', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('ce6dbbc7c33211ed', '6c67033c363145e2', '', '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday');

-- --------------------------------------------------------

--
-- Table structure for table `security_questions`
--

CREATE TABLE `security_questions` (
  `SECURITY_QUESTIONS_ID` varchar(16) NOT NULL,
  `ADMINISTRATOR_ID` varchar(16) DEFAULT NULL,
  `PERSON_ID` varchar(16) DEFAULT NULL,
  `SECURITY_QUESTION_1` varchar(64) NOT NULL,
  `SECURITY_ANSWER_1` varchar(128) NOT NULL,
  `SECURITY_QUESTION_2` varchar(64) NOT NULL,
  `SECURITY_ANSWER_2` varchar(128) NOT NULL,
  `SECURITY_QUESTION_3` varchar(64) NOT NULL,
  `SECURITY_ANSWER_3` varchar(128) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `security_questions`
--

INSERT INTO `security_questions` (`SECURITY_QUESTIONS_ID`, `ADMINISTRATOR_ID`, `PERSON_ID`, `SECURITY_QUESTION_1`, `SECURITY_ANSWER_1`, `SECURITY_QUESTION_2`, `SECURITY_ANSWER_2`, `SECURITY_QUESTION_3`, `SECURITY_ANSWER_3`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('075e97dec33011ed', 'efb11061c20c11ed', NULL, 'What was your childhood nickname?', 'ROMSKY', 'What is your favorite color?', 'BLUE', 'What is your mother\'s maiden name?', 'MONTEALEGRE', '2023-03-15 20:50:56', '2023-03-15 20:50:56', 'N', ''),
('fbd1ee9fc32c11ed', NULL, 'bf7dcf506ca14f8f', 'What was your childhood nickname?', 'ROMSKY', 'What is your favorite color?', 'BLUE', 'What is your mother\'s maiden name?', 'MONTEALEGRE', '2023-03-15 20:29:08', '2023-03-15 20:29:08', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `solo_parent_long_text`
--

CREATE TABLE `solo_parent_long_text` (
  `SOLO_PARENT_LONG_TEXT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `CLASSIFICATION_CIRCUMSTANCES` set('Death of Spouse','Abandonment','Disappearance of Parents','Imprisonment of Spouse/Detention','Physical and Mental Incapacity','Annulment/Legal Separation','Unmarried/unwed','Foster Parent of DSWD','Spouse of OFW','Pregnant Women','Rape Case') NOT NULL,
  `NEEDS_PROBLEMS` varchar(1024) NOT NULL,
  `FAMILY_RESOURCES` varchar(1024) NOT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `solo_parent_long_text`
--

INSERT INTO `solo_parent_long_text` (`SOLO_PARENT_LONG_TEXT_ID`, `PERSON_ID`, `CLASSIFICATION_CIRCUMSTANCES`, `NEEDS_PROBLEMS`, `FAMILY_RESOURCES`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('ad03950fc34211ed', 'dc52bbbed2f1418b', 'Death of Spouse,Imprisonment of Spouse/Detention', 'N', 'N', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ecf03117c26b11ed', 'bf7dcf506ca14f8f', 'Abandonment', 'N', 'N', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE `telephone` (
  `TELEPHONE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TELEPHONE_NUMBER` varchar(32) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `telephone`
--

INSERT INTO `telephone` (`TELEPHONE_ID`, `PERSON_ID`, `TELEPHONE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e7709cc34111ed', '8dd9933bd99f4cb6', '09760657071', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('40ed839fc34111ed', '996d825f23f54113', '09760657071', '2023-03-15 22:54:14', '2023-03-15 22:54:14', 'N', 'adminrbardillon'),
('82deb573c33411ed', '4a6f860461ba48d8', '09760657071', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('82e1661dc33411ed', '626dba73aa20435d', '23659854685', '2023-03-15 21:23:01', '2023-03-15 21:23:01', 'N', 'adminrbardillon'),
('94fc7ac0c26611ed', 'cd220d6aa9964e12', '09091072865', '2023-03-14 20:48:56', '2023-03-14 20:48:56', 'N', 'adminrbardillon'),
('ad00f167c34211ed', 'dc52bbbed2f1418b', '09760657071', '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ce6db113c33211ed', '6c67033c363145e2', '09760657071', '2023-03-15 21:10:49', '2023-03-15 21:10:49', 'N', 'adminjulanday'),
('eceeab4bc26b11ed', 'bf7dcf506ca14f8f', '09760657071', '2023-03-14 21:27:11', '2023-03-14 21:27:11', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `TRANSACTION_TYPE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TRANSACTION_TYPE` varchar(128) NOT NULL,
  `ID_NUMBER` varchar(64) DEFAULT NULL,
  `STATUS` varchar(64) NOT NULL,
  `REMARKS` varchar(256) DEFAULT NULL,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`TRANSACTION_TYPE_ID`, `PERSON_ID`, `TRANSACTION_TYPE`, `ID_NUMBER`, `STATUS`, `REMARKS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('40e61581c34111ed', '8dd9933bd99f4cb6', 'NEW ID', '043428023-4060', 'APPROVED', NULL, '2023-03-15 22:54:14', '2023-03-15 23:05:45', 'N', 'adminrbardillon'),
('82dc60a7c33411ed', '4a6f860461ba48d8', 'Renewal', '043428023-2228', 'APPROVED', NULL, '2023-03-15 21:23:01', '2023-03-15 21:45:50', 'N', 'adminrbardillon'),
('94f9145ec26611ed', '6b1b708352e74978', 'Renewal', '043428023-3323', 'REJECTED', 'TESTING', '2023-03-14 20:48:56', '2023-03-14 21:16:13', 'N', 'adminrbardillon'),
('acff1029c34211ed', 'dc52bbbed2f1418b', 'New Application', '2023-91882', 'PENDING', NULL, '2023-03-15 23:04:25', '2023-03-15 23:04:25', 'N', 'adminrbardillon'),
('ce6d90ccc33211ed', '6c67033c363145e2', 'BAGO', 'SC-688120', 'APPROVED', NULL, '2023-03-15 21:10:49', '2023-03-15 21:39:17', 'N', 'adminrbardillon'),
('ecec007ac26b11ed', 'bf7dcf506ca14f8f', 'Renewal', '2023-82156', 'APPROVED', NULL, '2023-03-14 21:27:11', '2023-03-15 21:13:52', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `USER_ACCOUNT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `USERNAME` varchar(128) NOT NULL,
  `PASSWORD` varchar(128) NOT NULL,
  `LOGIN_ATTEMPTS` int(2) NOT NULL DEFAULT 0,
  `IS_LOCKED` tinyint(1) NOT NULL DEFAULT 0,
  `DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
  `DATE_UPDATED` datetime NOT NULL DEFAULT current_timestamp(),
  `IS_DELETED` char(1) NOT NULL DEFAULT 'N',
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`USER_ACCOUNT_ID`, `PERSON_ID`, `USERNAME`, `PASSWORD`, `LOGIN_ATTEMPTS`, `IS_LOCKED`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('043428023-2228', '4a6f860461ba48d8', '043428023-2228', '$2y$10$kM8zoKdOGbxfp0h0rcmut.YpuaC4MGuKKumlpHVix3ysJ9lxxaoI.', 0, 0, '2023-03-15 21:44:07', '2023-03-15 21:44:07', 'N', ''),
('043428023-4060', '8dd9933bd99f4cb6', '043428023-4060', '$2y$10$QRxa8oWqUyg7tqifoJFy5O5dtPaQb4SwqeAIkPMRpGKS/vlJ6xBWa', 0, 0, '2023-03-15 23:05:45', '2023-03-15 23:05:45', 'N', ''),
('2023-82156', 'bf7dcf506ca14f8f', '2023-82156', '$2y$10$vNxXk1T7JcDP5YjcZeNKlun85ARlTYfZd9Z1DxuxF3RGyxSDauUIy', 0, 0, '2023-03-14 21:46:48', '2023-03-14 21:46:48', 'N', ''),
('SC-688120', '6c67033c363145e2', 'SC-688120', '$2y$10$Keb/lBWoyiH7P3hgLn8RTOhqSC00Nt6J1za3G3hUNIEKi5UulwPoG', 0, 0, '2023-03-15 21:39:17', '2023-03-15 21:39:17', 'N', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ADDRESS_ID`);

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`ANNOUNCEMENT_ID`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`APPLICANT_ID`),
  ADD KEY `FK_PERSON_APPLICANT` (`APPLICANT_ID`);

--
-- Indexes for table `blood_type`
--
ALTER TABLE `blood_type`
  ADD PRIMARY KEY (`BLOOD_TYPE_ID`),
  ADD KEY `FK_PERSON_BLOOD_TYPE_idx` (`PERSON_ID`);

--
-- Indexes for table `claimed_benefits`
--
ALTER TABLE `claimed_benefits`
  ADD PRIMARY KEY (`CLAIMED_BENEFITS_ID`),
  ADD KEY `FK_PERSON_CLAIMED_BENEFITS` (`PERSON_ID`),
  ADD KEY `FK_CLAIMED_EVENT` (`EVENT_ID`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`COMPANY_ID`),
  ADD KEY `FK_PERSON_COMPANY_idx` (`PERSON_ID`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`DOCUMENT_ID`),
  ADD KEY `FK_PERSON_DOCUMENT` (`PERSON_ID`);

--
-- Indexes for table `draft`
--
ALTER TABLE `draft`
  ADD PRIMARY KEY (`DRAFT_ID`);

--
-- Indexes for table `educational_attainment`
--
ALTER TABLE `educational_attainment`
  ADD PRIMARY KEY (`EDUCATIONAL_ATTAINMENT_ID`),
  ADD KEY `FK_PERSON_EDUCATIONAL_ATTAINMENT_idx` (`PERSON_ID`);

--
-- Indexes for table `employment_status`
--
ALTER TABLE `employment_status`
  ADD PRIMARY KEY (`EMPLOYMENT_STATUS_ID`),
  ADD KEY `FK_PERSON_EMPLOYMENT_STATUS_idx` (`PERSON_ID`);

--
-- Indexes for table `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`GENDER_ID`),
  ADD KEY `FK_PERSON_GENDER_HISTORY` (`PERSON_ID`);

--
-- Indexes for table `government_membership`
--
ALTER TABLE `government_membership`
  ADD PRIMARY KEY (`GOVERNMENT_MEMBERSHIP_ID`),
  ADD KEY `FK_PERSON_GOVERNMENT_MEMBERSHIP_idx` (`PERSON_ID`);

--
-- Indexes for table `id_reference_number`
--
ALTER TABLE `id_reference_number`
  ADD PRIMARY KEY (`ID_REFERENCE_NUMBER_ID`),
  ADD KEY `FK_PERSON_ID_REFERENCE_NUMBER_idx` (`PERSON_ID`);

--
-- Indexes for table `income`
--
ALTER TABLE `income`
  ADD PRIMARY KEY (`INCOME_ID`),
  ADD KEY `FK_PERSON_INCOME_idx` (`PERSON_ID`);

--
-- Indexes for table `issued_id`
--
ALTER TABLE `issued_id`
  ADD PRIMARY KEY (`ISSUED_ID_ID`),
  ADD KEY `FK_PERSON_ID_EXPIRATION` (`PERSON_ID`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`JOB_ID`),
  ADD KEY `FK_PERSON_JOB` (`PERSON_ID`);

--
-- Indexes for table `landline`
--
ALTER TABLE `landline`
  ADD PRIMARY KEY (`LANDLINE_ID`),
  ADD KEY `FK_PERSON_LANDLINE` (`PERSON_ID`);

--
-- Indexes for table `marital_status`
--
ALTER TABLE `marital_status`
  ADD PRIMARY KEY (`MARITAL_STATUS_ID`),
  ADD KEY `FK_PERSON_MARITAL_STATUS` (`PERSON_ID`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`MEDIA_ID`);

--
-- Indexes for table `name`
--
ALTER TABLE `name`
  ADD PRIMARY KEY (`NAME_ID`),
  ADD KEY `FK_PERSON_NAME_HISTORY` (`PERSON_ID`);

--
-- Indexes for table `organization`
--
ALTER TABLE `organization`
  ADD PRIMARY KEY (`ORGANIZATION_ID`),
  ADD KEY `FK_PERSON_ORGANIZATION_idx` (`PERSON_ID`);

--
-- Indexes for table `pension`
--
ALTER TABLE `pension`
  ADD PRIMARY KEY (`PENSION_ID`),
  ADD KEY `FK_PERSON_PENSION` (`PERSON_ID`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`PERSON_ID`),
  ADD UNIQUE KEY `EMAIL` (`EMAIL`);

--
-- Indexes for table `person_address`
--
ALTER TABLE `person_address`
  ADD PRIMARY KEY (`PERSON_ADDRESS_ID`),
  ADD KEY `FK_ADDRESS_PERSON_ADDRESS` (`ADDRESS_ID`),
  ADD KEY `FK_PERSON_PERSON_ADDRESS` (`PERSON_ID`);

--
-- Indexes for table `previous_address`
--
ALTER TABLE `previous_address`
  ADD PRIMARY KEY (`PREVIOUS_ADDRESS_ID`),
  ADD KEY `FK_PERSON_PREVIOUS_ADDRESS_idx` (`PERSON_ID`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pwd_application_accomplisher`
--
ALTER TABLE `pwd_application_accomplisher`
  ADD PRIMARY KEY (`PWD_APLICATION_ACCOMPLISHER_ID`),
  ADD KEY `FK_PERSON_PWD_APLICATION_ACCOMPLISHER` (`PERSON_ID`);

--
-- Indexes for table `pwd_disease`
--
ALTER TABLE `pwd_disease`
  ADD PRIMARY KEY (`PWD_DISEASE_ID`),
  ADD KEY `FK_PERSON_DISEASE_idx` (`PERSON_ID`);

--
-- Indexes for table `pwd_physician`
--
ALTER TABLE `pwd_physician`
  ADD PRIMARY KEY (`PWD_PHYSICIAN_ID`),
  ADD KEY `FK_PERSON_PHYSICIAN_idx` (`PERSON_ID`);

--
-- Indexes for table `relationship`
--
ALTER TABLE `relationship`
  ADD PRIMARY KEY (`RELATIONSHIP_ID`),
  ADD KEY `FK_PERSON_RELATIONSHIP` (`PERSON_ID`),
  ADD KEY `FK_APPLICANT_RELATIONSHIP` (`APPLICANT_ID`);

--
-- Indexes for table `religion`
--
ALTER TABLE `religion`
  ADD PRIMARY KEY (`RELIGION_ID`),
  ADD KEY `FK_PERSON_RELIGION` (`PERSON_ID`);

--
-- Indexes for table `security_questions`
--
ALTER TABLE `security_questions`
  ADD PRIMARY KEY (`SECURITY_QUESTIONS_ID`),
  ADD KEY `FK_ADMINISTRATOR_SEC_QUESTIONS` (`ADMINISTRATOR_ID`),
  ADD KEY `FK_PERSON_SECURITY_QUESTIONS` (`PERSON_ID`);

--
-- Indexes for table `solo_parent_long_text`
--
ALTER TABLE `solo_parent_long_text`
  ADD PRIMARY KEY (`SOLO_PARENT_LONG_TEXT_ID`),
  ADD KEY `FK_PERSON_SOLO_PARENT_LONG_TEXT_idx` (`PERSON_ID`);

--
-- Indexes for table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`TELEPHONE_ID`),
  ADD KEY `FK_PERSON_TELEPHONE` (`PERSON_ID`);

--
-- Indexes for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD PRIMARY KEY (`TRANSACTION_TYPE_ID`),
  ADD KEY `FK_PERSON_TRANSACTION_TYPE_idx` (`PERSON_ID`);

--
-- Indexes for table `user_account`
--
ALTER TABLE `user_account`
  ADD PRIMARY KEY (`USER_ACCOUNT_ID`),
  ADD KEY `FK_PERSON_ACCOUNT_idx` (`PERSON_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `MEDIA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicant`
--
ALTER TABLE `applicant`
  ADD CONSTRAINT `FK_PERSON_APPLICANT` FOREIGN KEY (`APPLICANT_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `blood_type`
--
ALTER TABLE `blood_type`
  ADD CONSTRAINT `FK_PERSON_BLOOD_TYPE` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `claimed_benefits`
--
ALTER TABLE `claimed_benefits`
  ADD CONSTRAINT `FK_CLAIMED_EVENT` FOREIGN KEY (`EVENT_ID`) REFERENCES `announcement` (`ANNOUNCEMENT_ID`),
  ADD CONSTRAINT `FK_PERSON_CLAIMED_BENEFITS` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `FK_PERSON_COMPANY` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `document`
--
ALTER TABLE `document`
  ADD CONSTRAINT `FK_PERSON_DOCUMENT` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `educational_attainment`
--
ALTER TABLE `educational_attainment`
  ADD CONSTRAINT `FK_PERSON_EDUCATIONAL_ATTAINMENT` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `employment_status`
--
ALTER TABLE `employment_status`
  ADD CONSTRAINT `FK_PERSON_EMPLOYMENT_STATUS` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `gender`
--
ALTER TABLE `gender`
  ADD CONSTRAINT `FK_PERSON_GENDER_HISTORY` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `government_membership`
--
ALTER TABLE `government_membership`
  ADD CONSTRAINT `FK_PERSON_GOVERNMENT_MEMBERSHIP` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `id_reference_number`
--
ALTER TABLE `id_reference_number`
  ADD CONSTRAINT `FK_PERSON_ID_REFERENCE_NUMBER` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `income`
--
ALTER TABLE `income`
  ADD CONSTRAINT `FK_PERSON_INCOME` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `issued_id`
--
ALTER TABLE `issued_id`
  ADD CONSTRAINT `FK_PERSON_ID_EXPIRATION` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_PERSON_JOB` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `landline`
--
ALTER TABLE `landline`
  ADD CONSTRAINT `FK_PERSON_LANDLINE` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `marital_status`
--
ALTER TABLE `marital_status`
  ADD CONSTRAINT `FK_PERSON_MARITAL_STATUS` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `name`
--
ALTER TABLE `name`
  ADD CONSTRAINT `FK_PERSON_NAME_HISTORY` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `organization`
--
ALTER TABLE `organization`
  ADD CONSTRAINT `FK_PERSON_ORGANIZATION` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `pension`
--
ALTER TABLE `pension`
  ADD CONSTRAINT `FK_PERSON_PENSION` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `person_address`
--
ALTER TABLE `person_address`
  ADD CONSTRAINT `FK_ADDRESS_PERSON_ADDRESS` FOREIGN KEY (`ADDRESS_ID`) REFERENCES `address` (`ADDRESS_ID`),
  ADD CONSTRAINT `FK_PERSON_PERSON_ADDRESS` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `previous_address`
--
ALTER TABLE `previous_address`
  ADD CONSTRAINT `FK_PERSON_PREVIOUS_ADDRESS` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `pwd_application_accomplisher`
--
ALTER TABLE `pwd_application_accomplisher`
  ADD CONSTRAINT `FK_PERSON_PWD_APLICATION_ACCOMPLISHER` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `pwd_disease`
--
ALTER TABLE `pwd_disease`
  ADD CONSTRAINT `FK_PERSON_DISEASE` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `pwd_physician`
--
ALTER TABLE `pwd_physician`
  ADD CONSTRAINT `FK_PERSON_PHYSICIAN` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `relationship`
--
ALTER TABLE `relationship`
  ADD CONSTRAINT `FK_APPLICANT_RELATIONSHIP` FOREIGN KEY (`APPLICANT_ID`) REFERENCES `applicant` (`APPLICANT_ID`),
  ADD CONSTRAINT `FK_PERSON_RELATIONSHIP` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `religion`
--
ALTER TABLE `religion`
  ADD CONSTRAINT `FK_PERSON_RELIGION` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `security_questions`
--
ALTER TABLE `security_questions`
  ADD CONSTRAINT `FK_ADMINISTRATOR_SECURITY_QUESTIONS` FOREIGN KEY (`ADMINISTRATOR_ID`) REFERENCES `administrator` (`id`),
  ADD CONSTRAINT `FK_PERSON_SECURITY_QUESTIONS` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `solo_parent_long_text`
--
ALTER TABLE `solo_parent_long_text`
  ADD CONSTRAINT `FK_PERSON_SOLO_PARENT_LONG_TEXT` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `telephone`
--
ALTER TABLE `telephone`
  ADD CONSTRAINT `FK_PERSON_TELEPHONE` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `transaction_type`
--
ALTER TABLE `transaction_type`
  ADD CONSTRAINT `FK_PERSON_TRANSACTION_TYPE` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);

--
-- Constraints for table `user_account`
--
ALTER TABLE `user_account`
  ADD CONSTRAINT `FK_PERSON_ACCOUNT` FOREIGN KEY (`PERSON_ID`) REFERENCES `person` (`PERSON_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
