-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 02:32 AM
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
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `admin_type` enum('Main Administrator','Solo Parent Administrator','Senior Citizen Administrator','PWD Administrator') NOT NULL,
  `barangay` enum('City Hall','Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `username` varchar(128) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `announcement`
--

CREATE TABLE `announcement` (
  `id` int(11) NOT NULL,
  `title` varchar(128) NOT NULL,
  `announcement_for` enum('Administrator','PWD','Senior Citizen','Solo Parent') NOT NULL,
  `barangay` enum('City Hall','Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `image_location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- Table structure for table `pwd_data`
--

CREATE TABLE `pwd_data` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `registration_type` enum('New ID','Renewal ID','Lost ID','Transfer','Change Information') NOT NULL,
  `transfer_id` varchar(15) DEFAULT NULL,
  `change_info_id` varchar(15) DEFAULT NULL,
  `pwd_number` varchar(20) DEFAULT NULL,
  `date_applied` date NOT NULL,
  `pwd_last_name` varchar(128) NOT NULL,
  `pwd_first_name` varchar(128) NOT NULL,
  `pwd_middle_name` varchar(128) DEFAULT NULL,
  `pwd_suffix` varchar(20) DEFAULT NULL,
  `type_of_disability` set('Deaf/Hard of Hearing','Intellectual Disability','Learning Disability','Mental Disability','Physical Disablity (Orthopedic)','Psychosocial Disability','Speech and Language Impairment','Visual Disability','Cancer (RA11215)','Rare Disease (RA10747)') DEFAULT NULL,
  `medical_condition` varchar(1000) DEFAULT NULL,
  `cause_of_disability` set('Congenital/Inborn','Acquired') DEFAULT NULL,
  `congenital_inborn` set('Autism','ADHD','Cerebral Palsy','Down Syndrome') DEFAULT NULL,
  `acquired` set('Chronic Illness','Cerebral Palsy','Injury') DEFAULT NULL,
  `status_of_disability` enum('Permanent','Temporary') NOT NULL,
  `houseno_street_subdivision_address` varchar(200) DEFAULT NULL,
  `barangay` enum('Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `city_municipality` varchar(128) NOT NULL DEFAULT 'CITY OF SANTA ROSA',
  `province` varchar(128) NOT NULL DEFAULT 'LAGUNA',
  `region` varchar(128) NOT NULL DEFAULT 'IV-A (CALABARZON)',
  `landline` varchar(15) DEFAULT NULL,
  `mobile_number` varchar(15) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `date_of_birth` date NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `religion` varchar(128) NOT NULL,
  `civil_status` enum('Single','Separated','Cohabitation','Married','Widow') NOT NULL,
  `educational_attainment` enum('None','Kindergarten','Elementary','Junior High School','Senior High School','College','Vocational','Post Graduate Program') NOT NULL,
  `is_voter` enum('Yes','No','17 Below') NOT NULL,
  `employment_status` enum('Employed','Unemployed','Self-employed','Student') NOT NULL,
  `income` enum('0.00','Less than 10,000','10,000 - 20, 000','21,000 - 40,000','41,000 - 100,000','More than 100,000') NOT NULL DEFAULT '0.00',
  `category_of_employment` enum('Government','Private') DEFAULT NULL,
  `nature_of_employment` enum('Permanent/Regular','Emergency','Seasonal','Casual') DEFAULT NULL,
  `occupation` enum('Managers','Professionals','Technician & Associate Professionals','Clerical Support Workers','Service & Sales Workers','Skilled Agricultural, Forestry & Fishery Workers','Craft & Related Trade Workers','Plant & Machine Operators & Assemblers','Elementary Occupations','Others') DEFAULT NULL,
  `other_occupation` varchar(128) DEFAULT NULL,
  `is_4ps_beneficiary` enum('Yes','No') NOT NULL,
  `blood_type` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  `organization_affiliated` varchar(128) DEFAULT NULL,
  `contact_person` varchar(128) DEFAULT NULL,
  `office_address` varchar(128) DEFAULT NULL,
  `office_telephone_number` varchar(128) DEFAULT NULL,
  `sss_number` varchar(128) DEFAULT NULL,
  `gsis_number` varchar(128) DEFAULT NULL,
  `psn_number` varchar(128) DEFAULT NULL,
  `philhealth_number` varchar(128) DEFAULT NULL,
  `philhealth_member_type` enum('PhilHealth Member',' PhilHealth Member-Dependent') DEFAULT NULL,
  `father_last_name` varchar(128) DEFAULT NULL,
  `father_first_name` varchar(128) DEFAULT NULL,
  `father_middle_name` varchar(128) DEFAULT NULL,
  `mother_last_name` varchar(128) DEFAULT NULL,
  `mother_first_name` varchar(128) DEFAULT NULL,
  `mother_middle_name` varchar(128) DEFAULT NULL,
  `guardian_last_name` varchar(128) DEFAULT NULL,
  `guardian_first_name` varchar(128) DEFAULT NULL,
  `guardian_middle_name` varchar(128) DEFAULT NULL,
  `guardian_relationship` varchar(128) DEFAULT NULL,
  `guardian_contact_number` varchar(128) DEFAULT NULL,
  `accomplished_by` enum('Applicant','Guardian','Representative') NOT NULL,
  `name_of_accomplisher` varchar(128) NOT NULL,
  `name_of_physician` varchar(128) NOT NULL,
  `license_number` varchar(128) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `senior_citizen_data`
--

CREATE TABLE `senior_citizen_data` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `registration_type` enum('Bago','Lumipat','Magpapalit','Nawala') NOT NULL,
  `lost_number` varchar(128) DEFAULT NULL,
  `sr_citizen_num` varchar(128) DEFAULT NULL,
  `sr_citizen_first_name` varchar(128) NOT NULL,
  `sr_citizen_middle_name` varchar(128) DEFAULT NULL,
  `sr_citizen_last_name` varchar(128) NOT NULL,
  `sr_citizen_suffix` varchar(20) DEFAULT NULL,
  `barangay` enum('Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `tirahan` varchar(128) NOT NULL,
  `sex` enum('Male','Female') NOT NULL,
  `marital_status` enum('Single','Married','Widowed','Separated','Divorced') NOT NULL,
  `edad` varchar(128) NOT NULL,
  `date_of_birth` date NOT NULL,
  `lugar_ng_kapanganakan` varchar(128) NOT NULL,
  `telepono` varchar(15) DEFAULT NULL,
  `relihiyon` varchar(128) NOT NULL,
  `hanapbuhay` varchar(128) NOT NULL,
  `pensyon` enum('Oo','Wala') NOT NULL,
  `saan` varchar(128) DEFAULT NULL,
  `magkano` decimal(10,2) DEFAULT NULL,
  `pangalan_ng_asawa` varchar(128) NOT NULL,
  `edad_asawa` varchar(128) NOT NULL,
  `ilan_ang_anak` varchar(128) NOT NULL,
  `kasama` varchar(128) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `senior_citizen_family_composition`
--

CREATE TABLE `senior_citizen_family_composition` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `age` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `contact` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `solo_parent_data`
--

CREATE TABLE `solo_parent_data` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `solo_parent_name` varchar(128) NOT NULL,
  `age` varchar(128) NOT NULL,
  `sex` varchar(128) NOT NULL,
  `date_of_birth` date NOT NULL,
  `place_of_birth` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `barangay` enum('Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `educ_attainment` varchar(128) NOT NULL,
  `occupation` varchar(128) NOT NULL,
  `income` decimal(10,2) NOT NULL,
  `fam_income` decimal(10,2) NOT NULL,
  `tenurial` varchar(128) NOT NULL,
  `religion` varchar(128) NOT NULL,
  `contact_number` varchar(128) NOT NULL,
  `marital_status` enum('Single','Annulled','Widow','Married','Separated') NOT NULL,
  `classification_incidence` longtext NOT NULL,
  `classification_when` longtext NOT NULL,
  `problems` longtext NOT NULL,
  `family_resources` longtext NOT NULL,
  `date_applied` date NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `application_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `expiration_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `solo_parent_family_composition`
--

CREATE TABLE `solo_parent_family_composition` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `relationship` varchar(128) NOT NULL,
  `age` varchar(128) NOT NULL,
  `civil_status` enum('Single','Annulled','Widow','Married','Separated') NOT NULL,
  `educ_attainment` varchar(128) NOT NULL,
  `occupation` varchar(128) NOT NULL,
  `monthly_income` decimal(10,2) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sr-citizen-birthday-cash-gift`
--

CREATE TABLE `sr-citizen-birthday-cash-gift` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `middle_name` varchar(128) NOT NULL,
  `osca_id_number` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `barangay` enum('Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_number` varchar(128) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sr-citizen-birthday-cash-incentive`
--

CREATE TABLE `sr-citizen-birthday-cash-incentive` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `first_name` varchar(128) NOT NULL,
  `middle_name` varchar(128) NOT NULL,
  `osca_id_number` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `barangay` enum('Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `date_of_birth` date NOT NULL,
  `contact_number` varchar(128) NOT NULL,
  `status` enum('Pending','Approved','Rejected') NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `last_name` varchar(128) NOT NULL,
  `suffix` varchar(20) DEFAULT NULL,
  `first_name` varchar(128) NOT NULL,
  `middle_name` varchar(128) DEFAULT NULL,
  `email` varchar(128) NOT NULL,
  `barangay` enum('Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `is_verified` int(11) NOT NULL DEFAULT 0,
  `vkey` text NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_pwd` enum('Yes','No') NOT NULL DEFAULT 'No',
  `is_sr_citizen` enum('Yes','No') NOT NULL DEFAULT 'No',
  `is_solo_parent` enum('Yes','No') NOT NULL DEFAULT 'No',
  `date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `announcement`
--
ALTER TABLE `announcement`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pwd_data`
--
ALTER TABLE `pwd_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `senior_citizen_data`
--
ALTER TABLE `senior_citizen_data`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `senior_citizen_family_composition`
--
ALTER TABLE `senior_citizen_family_composition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solo_parent_data`
--
ALTER TABLE `solo_parent_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solo_parent_family_composition`
--
ALTER TABLE `solo_parent_family_composition`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sr-citizen-birthday-cash-gift`
--
ALTER TABLE `sr-citizen-birthday-cash-gift`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sr-citizen-birthday-cash-incentive`
--
ALTER TABLE `sr-citizen-birthday-cash-incentive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pwdreset`
--
ALTER TABLE `pwdreset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pwd_data`
--
ALTER TABLE `pwd_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `senior_citizen_data`
--
ALTER TABLE `senior_citizen_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `senior_citizen_family_composition`
--
ALTER TABLE `senior_citizen_family_composition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solo_parent_data`
--
ALTER TABLE `solo_parent_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `solo_parent_family_composition`
--
ALTER TABLE `solo_parent_family_composition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sr-citizen-birthday-cash-gift`
--
ALTER TABLE `sr-citizen-birthday-cash-gift`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sr-citizen-birthday-cash-incentive`
--
ALTER TABLE `sr-citizen-birthday-cash-incentive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
