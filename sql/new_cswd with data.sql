-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2023 at 12:29 PM
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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ADDRESS_ID`, `BARANGAY`, `ADDRESS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('3931a308d4054c8e', 'Ibaba', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('53affca5d8b04f1c', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('68037ce2c98641a2', 'Malitlit', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('e0358278d5a1467e', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `IS_LOCKED` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `admin_type`, `barangay`, `username`, `first_name`, `last_name`, `email`, `password`, `LOGIN_ATTEMPTS`, `IS_LOCKED`) VALUES
('3afc5d2bbc2a11ed', 'Solo Parent Administrator', 'City Hall', 'adminzrivera', 'ZETH', 'RIVERA', 'zeth@gmail.com', '$2y$10$SVFhnwPpfq9dw01dI2a0x.Ve.OlUWakRab3EsIu6z4Q9ybpbdNSnK', 0, 0),
('61beba19bc2a11ed', 'Main Administrator', 'City Hall', 'admintocampo', 'TRESHA', 'OCAMPO', 'tresha@gmail.com', '$2y$10$Op9/oxsRfBWHYqTaM/c7ceG3tpTx4R2QfLpyvihQosncJGb/Kft4m', 0, 0),
('6d330dd8bb6911ed', 'Main Administrator', 'City Hall', 'adminrbardillon', 'ROMEO JR', 'BARDILLON', 'romsky.bardillon@gmail.com', '$2y$10$LPHkt95tvN4o1DqKyfq3Wen.yb6AdNY23qxNS6Yp53Pp.Gk923kAa', 0, 0),
('d9a6ec66bc2911ed', 'Main Administrator', 'City Hall', 'admincurmatam', 'CLARENCE', 'URMATAM', 'clarence@gmail.com', '$2y$10$FLe.kDk17L1zN7JK8Npv.u377StUBdLjHMHbNt3p0jnKsYQLodxTS', 0, 0);

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
  `DATE_CREATED` date NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ANNOUNCEMENT_ID`, `TITLE`, `ANNOUNCEMENT_FOR`, `BARANGAY`, `MESSAGE`, `DATE_FROM`, `DATE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('2a36b1dfbcb011ed', 'SENIOR CITIZEN CASH OUT', 'Solo Parent', 'Tagapo', 'ASD', NULL, '2023-03-10', '2023-03-07', '2023-03-07', 'N', 'admincurmatam'),
('2fe0ec29bcb011ed', 'CASH OUT', 'All', 'All', 'JKHKASJHDLIHGKUAWHSEFBLSIDJFHNLSKDJFHSKDJHFGSDUIHYFGIAWEFHNMWCEUICFYHWEIYCHNFWIEUYRFGHWUERNF;KLSEFMPWIOEUHRP123948723984723658967234T5RIAUJN;SDLTKJWEPRUITJRWETERTE2345345634', NULL, '2023-03-08', '2023-03-07', '2023-03-07', 'N', 'admincurmatam'),
('a77a8b9cbcf811ed', 'SENIOR CITIZEN CASH OUT', 'PWD', 'Malitlit', 'ASD', NULL, '2023-03-10', '2023-03-07', '2023-03-07', 'N', 'admincurmatam'),
('d850f5eebcb511ed', 'CASH OUT', 'Senior Citizen', 'Tagapo', 'DF', '01', '2023-03-09', '2023-03-07', '2023-03-07', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `APPLICANT_ID` varchar(16) NOT NULL,
  `FORM_CONTROL_NUMBER` varchar(64) NOT NULL,
  `APPLICANT_TYPE` varchar(64) NOT NULL,
  `CITIZEN_ID` varchar(64) NOT NULL,
  `PLACE_OF_BIRTH` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`APPLICANT_ID`, `FORM_CONTROL_NUMBER`, `APPLICANT_TYPE`, `CITIZEN_ID`, `PLACE_OF_BIRTH`) VALUES
('096ae9ac4ebb415e', 'PWDF-043-2', 'PWD', '043428023-37', NULL),
('21b15cd579a347ed', 'SPF-043-1', 'Solo Parent', '2023-69088', 'SANTA ROSA, LAGUNA'),
('8b250dbf088545fd', 'SCF-043-1', 'Senior Citizen', 'SC-297500', 'SANTA ROSA, LAGUNA'),
('afcae1c7c47d4fdb', 'PWDF-043-1', 'PWD', '043428023-8783', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blood_type`
--

CREATE TABLE `blood_type` (
  `BLOOD_TYPE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `BLOOD_TYPE` varchar(16) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blood_type`
--

INSERT INTO `blood_type` (`BLOOD_TYPE_ID`, `PERSON_ID`, `BLOOD_TYPE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d11185bc2b11ed', 'afcae1c7c47d4fdb', 'A+', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `claimed_benefits`
--

CREATE TABLE `claimed_benefits` (
  `CLAIMED_BENEFITS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `APPLICATION_TYPE` varchar(32) NOT NULL,
  `STATUS_OF_CLAIMS` varchar(16) NOT NULL,
  `DATE_CREATED` date NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `claimed_benefits`
--

INSERT INTO `claimed_benefits` (`CLAIMED_BENEFITS_ID`, `PERSON_ID`, `APPLICATION_TYPE`, `STATUS_OF_CLAIMS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('305bced7bcfe11ed', '8b250dbf088545fd', 'Senior Citizen', 'CLAIMED', '2023-03-07', '2023-03-07', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `COMPANY_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `COMPANY` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`COMPANY_ID`, `PERSON_ID`, `COMPANY`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720afcb2bcfa11ed', '21b15cd579a347ed', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `DOCUMENT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `NAME` varchar(128) NOT NULL,
  `TYPE` varchar(128) NOT NULL,
  `CONTENT` varchar(128) NOT NULL,
  `DATE_CREATED` date NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `draft`
--

CREATE TABLE `draft` (
  `DRAFT_ID` varchar(16) NOT NULL,
  `APPLICATION_TYPE` varchar(32) NOT NULL,
  `APPLICANT_NAME` varchar(128) NOT NULL,
  `DATE_CREATED` date NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `draft`
--

INSERT INTO `draft` (`DRAFT_ID`, `APPLICATION_TYPE`, `APPLICANT_NAME`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('2d62ad591b464b30', 'PWD', 'ROMEO BARDILLON', '2023-03-06', '2023-03-06', 'N', ''),
('33fcd11c675c3139', 'Senior Citizen', 'ROMEO BARDILLON', '2023-03-06', '2023-03-06', 'N', ''),
('e6071d5c0967d225', 'Solo Parent', 'ROMEO BARDILLON', '2023-03-06', '2023-03-06', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `educational_attainment`
--

CREATE TABLE `educational_attainment` (
  `EDUCATIONAL_ATTAINMENT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `EDUCATIONAL_ATTAINMENT` varchar(128) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `educational_attainment`
--

INSERT INTO `educational_attainment` (`EDUCATIONAL_ATTAINMENT_ID`, `PERSON_ID`, `EDUCATIONAL_ATTAINMENT`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720a58bdbcfa11ed', '21b15cd579a347ed', 'None', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('720bf9c2bcfa11ed', '6b478091a0844a35', 'None', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('f8d13d5abc2b11ed', 'afcae1c7c47d4fdb', 'College', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employment_status`
--

INSERT INTO `employment_status` (`EMPLOYMENT_STATUS_ID`, `PERSON_ID`, `EMPLOYMENT_STATUS`, `CATEGORY_OF_EMPLOYMENT`, `NATURE_OF_EMPLOYMENT`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d1989ebc2b11ed', 'afcae1c7c47d4fdb', 'Student', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `gender`
--

CREATE TABLE `gender` (
  `GENDER_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `GENDER` varchar(16) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `gender`
--

INSERT INTO `gender` (`GENDER_ID`, `PERSON_ID`, `GENDER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720a534fbcfa11ed', '21b15cd579a347ed', 'Male', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('abb22298bcf711ed', '8b250dbf088545fd', 'Male', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('f8d091d1bc2b11ed', 'afcae1c7c47d4fdb', 'Male', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `government_membership`
--

CREATE TABLE `government_membership` (
  `GOVERNMENT_MEMBERSHIP_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `IS_ACTIVE_VOTER` varchar(16) NOT NULL,
  `IS_4PS_MEMBER` varchar(16) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `government_membership`
--

INSERT INTO `government_membership` (`GOVERNMENT_MEMBERSHIP_ID`, `PERSON_ID`, `IS_ACTIVE_VOTER`, `IS_4PS_MEMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d16b38bc2b11ed', 'afcae1c7c47d4fdb', 'Yes', 'No', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `id_reference_number`
--

INSERT INTO `id_reference_number` (`ID_REFERENCE_NUMBER_ID`, `PERSON_ID`, `SSS_NUMBER`, `GSIS_NUMBER`, `PSN_NUMBER`, `IS_PHILHEALTH_MEMBER`, `PHILHEALTH_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d24570bc2b11ed', 'afcae1c7c47d4fdb', '', '', '', 'No', '', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `income`
--

CREATE TABLE `income` (
  `INCOME_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `MONTHLY_INCOME` varchar(128) DEFAULT NULL,
  `TOTAL_FAMILY_INCOME` decimal(19,6) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income`
--

INSERT INTO `income` (`INCOME_ID`, `PERSON_ID`, `MONTHLY_INCOME`, `TOTAL_FAMILY_INCOME`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720b2291bcfa11ed', '21b15cd579a347ed', NULL, '0.000000', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('720c9c81bcfa11ed', '6b478091a0844a35', '0', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('f8d1ee81bc2b11ed', 'afcae1c7c47d4fdb', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `issued_id`
--

CREATE TABLE `issued_id` (
  `ISSUED_ID_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `APPLICANT_TYPE` varchar(64) NOT NULL,
  `DATE_ISSUED` date NOT NULL,
  `EXPIRATION_DATE` date DEFAULT NULL,
  `DATE_CREATED` date NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issued_id`
--

INSERT INTO `issued_id` (`ISSUED_ID_ID`, `PERSON_ID`, `APPLICANT_TYPE`, `DATE_ISSUED`, `EXPIRATION_DATE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('031cdfadbc2e11ed', 'afcae1c7c47d4fdb', 'PWD', '2023-03-06', '2028-03-06', '2023-03-06', '2023-03-06', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `JOB_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `JOB` varchar(300) DEFAULT NULL,
  `OTHER_JOB` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`JOB_ID`, `PERSON_ID`, `JOB`, `OTHER_JOB`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720b4299bcfa11ed', '21b15cd579a347ed', 'Unemployed', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('720bff75bcfa11ed', '6b478091a0844a35', 'Unemployed', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('abb23798bcf711ed', '8b250dbf088545fd', 'Unemployed', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('f8d1c6babc2b11ed', 'afcae1c7c47d4fdb', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `landline`
--

CREATE TABLE `landline` (
  `LANDLINE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `LANDLINE_NUMBER` varchar(32) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `landline`
--

INSERT INTO `landline` (`LANDLINE_ID`, `PERSON_ID`, `LANDLINE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d044f9bc2b11ed', 'afcae1c7c47d4fdb', '', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `marital_status`
--

CREATE TABLE `marital_status` (
  `MARITAL_STATUS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `MARITAL_STATUS` varchar(64) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marital_status`
--

INSERT INTO `marital_status` (`MARITAL_STATUS_ID`, `PERSON_ID`, `MARITAL_STATUS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720bf338bcfa11ed', '6b478091a0844a35', 'Single', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('abb22898bcf711ed', '8b250dbf088545fd', 'Single', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('f8d0e4fbbc2b11ed', 'afcae1c7c47d4fdb', 'Single', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `MEDIA_ID` int(11) NOT NULL,
  `USERNAME` varchar(128) NOT NULL,
  `IMAGE_LOCATION` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `name`
--

INSERT INTO `name` (`NAME_ID`, `PERSON_ID`, `FIRST_NAME`, `MIDDLE_NAME`, `LAST_NAME`, `SUFFIX`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('72092dcabcfa11ed', '21b15cd579a347ed', 'ROMEO JR', '', 'BARDILLON', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('720becaabcfa11ed', '6b478091a0844a35', 'ROMEO JR', '', 'BARDILLON', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('abb0ad8cbcf711ed', '8b250dbf088545fd', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('d3c24dc5bc2c11ed', '096ae9ac4ebb415e', 'F', NULL, 'S', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('d3c634eebc2c11ed', 'af33987e9f1f40db', 'D', NULL, 'D', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('d3c6c086bc2c11ed', '6a49d2636d164010', 'D', NULL, 'D', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('d3c6cfefbc2c11ed', 'c8e60f048aaf4406', 'D', NULL, 'D', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('f8cfd16fbc2b11ed', 'afcae1c7c47d4fdb', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('f8d26d16bc2b11ed', 'df006aa59d9a40f9', 'ROMEO SR', NULL, 'BARDILLON', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('f8d31c53bc2b11ed', 'e8f331e097e14843', 'MILA ROSA', NULL, 'MONTEALEGRE', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('f8d32e10bc2b11ed', '02aae62a8fb84afc', 'DON KENNETH', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `organization`
--

INSERT INTO `organization` (`ORGANIZATION_ID`, `PERSON_ID`, `ORGANIZATION_AFFILIATED`, `CONTACT_PERSON`, `OFFICE_ADDRESS`, `TELEPHONE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d21a42bc2b11ed', 'afcae1c7c47d4fdb', '', '', '', '', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pension`
--

INSERT INTO `pension` (`PENSION_ID`, `PERSON_ID`, `HAS_PENSION`, `TYPE`, `AMOUNT`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('abb23d58bcf711ed', '8b250dbf088545fd', 'Y', 'SSS', '5000.000000', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PERSON_ID` varchar(16) NOT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`PERSON_ID`, `DATE_OF_BIRTH`, `EMAIL`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('02aae62a8fb84afc', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('096ae9ac4ebb415e', '2022-03-02', 'random@gmail.com', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('21b15cd579a347ed', '2008-03-13', 'romky.bardillon@gmail.com', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('6a49d2636d164010', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('6b478091a0844a35', '2023-02-27', NULL, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('8b250dbf088545fd', '1963-03-02', 'romsky.bardilloan@gmail.com', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('af33987e9f1f40db', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('afcae1c7c47d4fdb', '2001-07-30', 'romsky.bardillon@gmail.com', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('c8e60f048aaf4406', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('df006aa59d9a40f9', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('e8f331e097e14843', NULL, NULL, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
('7209c24cbcfa11ed', '21b15cd579a347ed', '3931a308d4054c8e'),
('abb17001bcf711ed', '8b250dbf088545fd', '53affca5d8b04f1c'),
('d3c257b1bc2c11ed', '096ae9ac4ebb415e', '68037ce2c98641a2'),
('f8d0112abc2b11ed', 'afcae1c7c47d4fdb', 'e0358278d5a1467e');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `previous_address`
--

INSERT INTO `previous_address` (`PREVIOUS_ADDRESS_ID`, `PERSON_ID`, `REGION`, `PROVINCE`, `CITY`, `BARANGAY`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8cfa8c4bc2b11ed', 'afcae1c7c47d4fdb', '', '', '', '', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pwd_application_accomplisher`
--

INSERT INTO `pwd_application_accomplisher` (`PWD_APLICATION_ACCOMPLISHER_ID`, `PERSON_ID`, `ACCOMPLISHED_BY`, `ACCOMPLISHER_NAME`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d4a81dbc2b11ed', 'afcae1c7c47d4fdb', 'Applicant', 'ROMEO JR MONTEALEGRE BARDILLON ', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pwd_disease`
--

INSERT INTO `pwd_disease` (`PWD_DISEASE_ID`, `PERSON_ID`, `TYPE_OF_DISABILITY`, `MEDICAL_CONDITION`, `CAUSE_OF_DISABILITY`, `CONGENITAL_INBORN`, `ACQUIRED`, `STATUS_OF_DISABILITY`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d3cfb2bc2b11ed', 'afcae1c7c47d4fdb', 'Physical Disability', NULL, 'ACQUIRED', NULL, 'Injury', 'Temporary', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `pwd_physician`
--

CREATE TABLE `pwd_physician` (
  `PWD_PHYSICIAN_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `PWD_PHYSICIAN_NAME` varchar(128) NOT NULL,
  `PHYSICIAN_LICENSE_NUMBER` varchar(128) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pwd_physician`
--

INSERT INTO `pwd_physician` (`PWD_PHYSICIAN_ID`, `PERSON_ID`, `PWD_PHYSICIAN_NAME`, `PHYSICIAN_LICENSE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('f8d47c83bc2b11ed', 'afcae1c7c47d4fdb', 'LEBRON JAMES', 'MD8299-885', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
('720ca1b2bcfa11ed', '21b15cd579a347ed', '6b478091a0844a35', 'Son'),
('d3c6b62cbc2c11ed', '096ae9ac4ebb415e', 'af33987e9f1f40db', 'Father'),
('d3c6c5efbc2c11ed', '096ae9ac4ebb415e', '6a49d2636d164010', 'Mother'),
('d3c75a7abc2c11ed', '096ae9ac4ebb415e', 'c8e60f048aaf4406', 'Guardian'),
('f8d2e6b4bc2b11ed', 'afcae1c7c47d4fdb', 'df006aa59d9a40f9', 'Father'),
('f8d321c5bc2b11ed', 'afcae1c7c47d4fdb', 'e8f331e097e14843', 'Mother'),
('f8d3bc98bc2b11ed', 'afcae1c7c47d4fdb', '02aae62a8fb84afc', 'Guardian');

-- --------------------------------------------------------

--
-- Table structure for table `religion`
--

CREATE TABLE `religion` (
  `RELIGION_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `RELIGION` varchar(64) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `religion`
--

INSERT INTO `religion` (`RELIGION_ID`, `PERSON_ID`, `RELIGION`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('abb232e3bcf711ed', '8b250dbf088545fd', '', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('f8d0be2ebc2b11ed', 'afcae1c7c47d4fdb', 'CATHOLIC', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `security_questions`
--

CREATE TABLE `security_questions` (
  `SECURITY_QUESTIONS_ID` varchar(16) NOT NULL,
  `ADMINISTRATOR_ID` varchar(16) NOT NULL,
  `SECURITY_QUESTION_1` varchar(64) NOT NULL,
  `SECURITY_ANSWER_1` varchar(128) NOT NULL,
  `SECURITY_QUESTION_2` varchar(64) NOT NULL,
  `SECURITY_ANSWER_2` varchar(128) NOT NULL,
  `SECURITY_QUESTION_3` varchar(64) NOT NULL,
  `SECURITY_ANSWER_3` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `security_questions`
--

INSERT INTO `security_questions` (`SECURITY_QUESTIONS_ID`, `ADMINISTRATOR_ID`, `SECURITY_QUESTION_1`, `SECURITY_ANSWER_1`, `SECURITY_QUESTION_2`, `SECURITY_ANSWER_2`, `SECURITY_QUESTION_3`, `SECURITY_ANSWER_3`) VALUES
('3afd2f7bbc2a11ed', '3afc5d2bbc2a11ed', 'childhood_nickname', 'ROMSKY', 'childhood_nickname', 'BLUE', 'childhood_nickname', 'MONTEALEGRE'),
('61bf1399bc2a11ed', '61beba19bc2a11ed', 'childhood_nickname', 'ROMSKY', 'childhood_nickname', 'BLUE', 'childhood_nickname', 'MONTEALEGRE'),
('6d337430bb6911ed', '6d330dd8bb6911ed', 'childhood_nickname', 'ROMSKY', 'mother_maiden_name', 'MONTEALEGRE', 'favorite_color', 'BLUE'),
('d9a74fc2bc2911ed', 'd9a6ec66bc2911ed', 'childhood_nickname', 'ROMSKY', 'favorite_teacher', 'BLUE', 'childhood_nickname', 'MONTEALEGRE');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `solo_parent_long_text`
--

INSERT INTO `solo_parent_long_text` (`SOLO_PARENT_LONG_TEXT_ID`, `PERSON_ID`, `CLASSIFICATION_CIRCUMSTANCES`, `NEEDS_PROBLEMS`, `FAMILY_RESOURCES`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720ca8b7bcfa11ed', '21b15cd579a347ed', 'Disappearance of Parents', '1', '1', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam');

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE `telephone` (
  `TELEPHONE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TELEPHONE_NUMBER` varchar(32) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `telephone`
--

INSERT INTO `telephone` (`TELEPHONE_ID`, `PERSON_ID`, `TELEPHONE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('720b330fbcfa11ed', '21b15cd579a347ed', '09760657071', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('abb22da8bcf711ed', '8b250dbf088545fd', '09760657071', '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', 'admincurmatam'),
('d3c76057bc2c11ed', 'c8e60f048aaf4406', '2323322323', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('f8d06595bc2b11ed', 'afcae1c7c47d4fdb', '09760657071', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam'),
('f8d3c1b0bc2b11ed', '02aae62a8fb84afc', '09760657071', '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`TRANSACTION_TYPE_ID`, `PERSON_ID`, `TRANSACTION_TYPE`, `ID_NUMBER`, `STATUS`, `REMARKS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('72091df1bcfa11ed', '21b15cd579a347ed', 'New Application', '2023-69088', 'APPROVED', NULL, '2023-03-07 00:00:00.000000', '2023-03-07', 'N', 'admincurmatam'),
('abb0a574bcf711ed', '8b250dbf088545fd', 'BAGO', 'SC-297500', 'APPROVED', NULL, '2023-03-07 00:00:00.000000', '2023-03-07', 'N', 'admincurmatam'),
('d3c1ab7cbc2c11ed', '096ae9ac4ebb415e', 'NEW ID', '043428023-37', 'REJECTED', 'REJECTED', '2023-03-06 00:00:00.000000', '2023-03-08', 'N', 'admincurmatam'),
('f8cf8461bc2b11ed', 'afcae1c7c47d4fdb', 'NEW ID', '043428023-8783', 'APPROVED', NULL, '2023-03-06 00:00:00.000000', '2023-03-06', 'N', 'admincurmatam');

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
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`USER_ACCOUNT_ID`, `PERSON_ID`, `USERNAME`, `PASSWORD`, `LOGIN_ATTEMPTS`, `IS_LOCKED`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('043428023-8783', 'afcae1c7c47d4fdb', '043428023-8783', '$2y$10$2EmsM0CPoGFhLM2XsR/61eSFe66GkdCHjtZiN/B3R978dd7KT5Mim', 0, 0, '2023-03-06 00:00:00.000000', '2023-03-06 00:00:00.000000', 'N', ''),
('2023-69088', '21b15cd579a347ed', '2023-69088', '$2y$10$F5Cz1zM9DajQJDW20ASJpOdXct6OVJEGVKhEmuKbnEbTcZRlqL.AG', 0, 0, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', ''),
('SC-297500', '8b250dbf088545fd', 'SC-297500', '$2y$10$njRnYzgW1PuRlWpzKRKcee3bh7CPhtHnm3EUJwasAX8.OorWOZqbm', 0, 0, '2023-03-07 00:00:00.000000', '2023-03-07 00:00:00.000000', 'N', '');

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
  ADD KEY `FK_PERSON_CLAIMED_BENEFITS` (`PERSON_ID`);

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
  ADD KEY `FK_ADMINISTRATOR_SEC_QUESTIONS` (`ADMINISTRATOR_ID`);

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
  MODIFY `MEDIA_ID` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `FK_ADMINISTRATOR_SEC_QUESTIONS` FOREIGN KEY (`ADMINISTRATOR_ID`) REFERENCES `administrator` (`id`);

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
