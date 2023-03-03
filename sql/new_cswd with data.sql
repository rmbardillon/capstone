-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 03, 2023 at 03:39 AM
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
('1b783646529d486f', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('2c6c69f41b3e4d4f', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon'),
('8e2a5d6990824956', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `admin_type`, `barangay`, `username`, `first_name`, `last_name`, `email`, `password`) VALUES
('ddbc89bab83611ed', 'Main Administrator', 'City Hall', 'adminrbardillon', 'ROMEO JR', 'BARDILLON', 'romsky.bardillon@gmail.com', '$2y$10$QOduV4nYVIwTGRemuEAeDuBcBkhrp5pcxWt0sQvgcDMdGRDjaG9Zi');

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
  `DATE_FROM` varchar(8) NOT NULL,
  `DATE_TO` varchar(8) NOT NULL,
  `DATE` date NOT NULL,
  `DATE_CREATED` date NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `announcement`
--

INSERT INTO `announcement` (`ANNOUNCEMENT_ID`, `TITLE`, `ANNOUNCEMENT_FOR`, `BARANGAY`, `MESSAGE`, `DATE_FROM`, `DATE_TO`, `DATE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('88fa3302b8fb11ed', 'SENIOR CITIZEN CASH OUT', 'Senior Citizen', 'Tagapo', 'DISTRIBUTION OF BIRTHDAY CASH GIFT', '01', '06', '2023-03-03', '2023-03-02', '2023-03-02', 'N', 'adminrbardillon');

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
('047c96e7ccbb4110', 'SCF-043-1', 'Senior Citizen', 'SC-515934', 'SANTA ROSA, LAGUNA'),
('6ea7e09054d844f2', 'SPF-043-1', 'Solo Parent', '2023-74489', 'SANTA ROSA, LAGUNA'),
('a9ac28bdad9a46b2', 'PWDF-043-1', 'PWD', '043428023-7687', NULL);

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
('10276803b96311ed', 'a9ac28bdad9a46b2', 'Unknown', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('c6075fd8b8fb11ed', '6ea7e09054d844f2', NULL, '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
('102791e9b96311ed', 'a9ac28bdad9a46b2', 'College', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('c6074e78b8fb11ed', '6ea7e09054d844f2', 'College', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon'),
('c607a024b8fb11ed', '7fb8bb7af2db4d31', 'None', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
('1027aa65b96311ed', 'a9ac28bdad9a46b2', 'Student', NULL, NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('10275770b96311ed', 'a9ac28bdad9a46b2', 'Male', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('a8ee5733b83e11ed', '047c96e7ccbb4110', 'Male', '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon'),
('c606cbf7b8fb11ed', '6ea7e09054d844f2', 'Male', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
('10279773b96311ed', 'a9ac28bdad9a46b2', 'Yes', 'No', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('1027da07b96311ed', 'a9ac28bdad9a46b2', '', '', '', 'No', '', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('1027c1deb96311ed', 'a9ac28bdad9a46b2', NULL, NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('c6076a2ab8fb11ed', '6ea7e09054d844f2', '0', '0.000000', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon'),
('c6083d80b8fb11ed', '7fb8bb7af2db4d31', '0', NULL, '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `issued_id`
--

CREATE TABLE `issued_id` (
  `ISSUED_ID_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `APPLICANT_TYPE` varchar(64) NOT NULL,
  `DATE_ISSUED` date NOT NULL,
  `EXPIRATION_DATE` date NOT NULL,
  `DATE_CREATED` date NOT NULL,
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `issued_id`
--

INSERT INTO `issued_id` (`ISSUED_ID_ID`, `PERSON_ID`, `APPLICANT_TYPE`, `DATE_ISSUED`, `EXPIRATION_DATE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('45fbe284b96c11ed', '6ea7e09054d844f2', 'Solo Parent', '2023-03-03', '2028-03-03', '2023-03-03', '2023-03-03', 'N', 'adminrbardillon'),
('63c3b8e0b96c11ed', 'a9ac28bdad9a46b2', 'PWD', '2023-03-03', '2028-03-03', '2023-03-03', '2023-03-03', 'N', 'adminrbardillon'),
('743277f1b96c11ed', '047c96e7ccbb4110', 'Senior Citizen', '2023-03-03', '2028-03-03', '2023-03-03', '2023-03-03', 'N', 'adminrbardillon');

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
('1027bcf0b96311ed', 'a9ac28bdad9a46b2', NULL, NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('a8eebccbb83e11ed', '047c96e7ccbb4110', 'Unemployed', NULL, '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon'),
('c6077fcdb8fb11ed', '6ea7e09054d844f2', 'Unemployed', NULL, '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon'),
('c60838eab8fb11ed', '7fb8bb7af2db4d31', 'Unemployed', NULL, '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
('1027398ab96311ed', 'a9ac28bdad9a46b2', '', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('102760e0b96311ed', 'a9ac28bdad9a46b2', 'Single', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('a8ee770fb83e11ed', '047c96e7ccbb4110', 'Single', '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon'),
('c60799c8b8fb11ed', '7fb8bb7af2db4d31', 'Separated', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
(1, '2023-74489', '6400a1d174dbe7.02565469.jpg');

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
('10272acfb96311ed', 'a9ac28bdad9a46b2', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('1027f1e5b96311ed', '001ce2d1d8654e9a', 'ROMEO SR', '', 'BARDILLON', NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('10289e01b96311ed', '195c35944e144852', 'MILA ROSA', '', 'MONTEALEGRE', NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('1028af49b96311ed', '656da81a9eed4df1', 'DON KENNETH', '', 'BARDILLON', NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('a8edeedab83e11ed', '047c96e7ccbb4110', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon'),
('c606bcabb8fb11ed', '6ea7e09054d844f2', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon'),
('c6079489b8fb11ed', '7fb8bb7af2db4d31', 'ROMEO', '', 'BARDILLON', NULL, '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
('1027c818b96311ed', 'a9ac28bdad9a46b2', '', '', '', '', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('a8eedf02b83e11ed', '047c96e7ccbb4110', 'N', NULL, NULL, '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon');

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
('001ce2d1d8654e9a', NULL, NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('047c96e7ccbb4110', '1963-02-26', 'romsky.bardillon@gmail.com', '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon'),
('195c35944e144852', NULL, NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('656da81a9eed4df1', NULL, NULL, '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('6ea7e09054d844f2', '2001-07-30', 'bardillon.romsky@gmail.com', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon'),
('7fb8bb7af2db4d31', '2021-02-23', NULL, '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon'),
('a9ac28bdad9a46b2', '2001-07-30', 'romeojrbardillon@gmail.com', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('1027347eb96311ed', 'a9ac28bdad9a46b2', '1b783646529d486f'),
('a8ee2b1fb83e11ed', '047c96e7ccbb4110', '2c6c69f41b3e4d4f'),
('c606c67cb8fb11ed', '6ea7e09054d844f2', '8e2a5d6990824956');

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
('102719cdb96311ed', 'a9ac28bdad9a46b2', '', '', '', '', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('1029f70eb96311ed', 'a9ac28bdad9a46b2', 'Applicant', 'ROMEO JR MONTEALEGRE BARDILLON ', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('102957bdb96311ed', 'a9ac28bdad9a46b2', 'Physical Disability', NULL, 'ACQUIRED', NULL, 'Injury', 'Temporary', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('1029e406b96311ed', 'a9ac28bdad9a46b2', 'LEBRON JAMES', 'MD-123456', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon');

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
('1027f655b96311ed', 'a9ac28bdad9a46b2', '001ce2d1d8654e9a', 'Father'),
('1028a333b96311ed', 'a9ac28bdad9a46b2', '195c35944e144852', 'Mother'),
('10294d25b96311ed', 'a9ac28bdad9a46b2', '656da81a9eed4df1', 'BROTHER'),
('c608bef0b8fb11ed', '6ea7e09054d844f2', '7fb8bb7af2db4d31', 'Son');

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
('10275c1db96311ed', 'a9ac28bdad9a46b2', 'CATHOLIC', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('a8ee9d87b83e11ed', '047c96e7ccbb4110', '', '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon');

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
('c6095d07b8fb11ed', '6ea7e09054d844f2', 'Abandonment', 'SUPER HARD', 'NONE', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
('102752b6b96311ed', 'a9ac28bdad9a46b2', '09760657071', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('10295299b96311ed', '656da81a9eed4df1', '09091072865', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', 'adminrbardillon'),
('a8ee9810b83e11ed', '047c96e7ccbb4110', '09760657071', '2023-03-01 00:00:00.000000', '2023-03-01 00:00:00.000000', 'N', 'adminrbardillon'),
('c6077ad9b8fb11ed', '6ea7e09054d844f2', '09760657071', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', 'adminrbardillon');

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
('10270eb8b96311ed', 'a9ac28bdad9a46b2', 'NEW ID', '043428023-7687', 'APPROVED', NULL, '2023-03-03 00:00:00.000000', '2023-03-03', 'N', 'adminrbardillon'),
('a8ede739b83e11ed', '047c96e7ccbb4110', 'BAGO', 'SC-515934', 'APPROVED', NULL, '2023-03-01 00:00:00.000000', '2023-03-02', 'N', 'adminrbardillon'),
('c606b73bb8fb11ed', '6ea7e09054d844f2', 'New Application', '2023-74489', 'APPROVED', NULL, '2023-03-02 00:00:00.000000', '2023-03-02', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `USER_ACCOUNT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `USERNAME` varchar(128) NOT NULL,
  `PASSWORD` varchar(128) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_account`
--

INSERT INTO `user_account` (`USER_ACCOUNT_ID`, `PERSON_ID`, `USERNAME`, `PASSWORD`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('043428023-7687', 'a9ac28bdad9a46b2', '043428023-7687', '$2y$10$yT8RI2HIcTSrI4MX.dJLGOgE2y9S1raMBgY6FthtiX4FigqVtXsXe', '2023-03-03 00:00:00.000000', '2023-03-03 00:00:00.000000', 'N', ''),
('2023-74489', '6ea7e09054d844f2', '2023-74489', '$2y$10$.DtQI78UNIiG2qDRzf9VZ.bcvPAOIUUg3fw8jIMBM9kh4iupVRNzS', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', ''),
('SC-515934', '047c96e7ccbb4110', 'SC-515934', '$2y$10$utRef26NMS4dnxHBLB4f5uO3PdUR3nMjpzLvJE6i.VQi/BLhI8RI6', '2023-03-02 00:00:00.000000', '2023-03-02 00:00:00.000000', 'N', '');

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
  ADD PRIMARY KEY (`id`);

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
