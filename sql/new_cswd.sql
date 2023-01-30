-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2023 at 07:17 AM
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
('5803786ab66f4e13', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION BARANGAY TAGAPO', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('5e14e63a49ea4c54', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION BARANGAY TAGAPO', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('b15654bf7df64272', 'Tagapo', 'BLOCK 7 LOT 2 ROSE POINTE SUBD', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('b3ac17d690d740aa', 'Pulong Santa Cruz', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`id`, `admin_type`, `barangay`, `username`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Main Administrator', 'City Hall', 'adminrbardillon', 'Romeo Jr', 'Bardillon', 'romsky.bardillon@gmail.com', '$2y$10$3NBm2BfwL2U8nrWowsm.we9H1j8nvKndVh45fIBSrCG5nMN.S4qkm'),
(2, 'Main Administrator', 'City Hall', 'adminaporlares', 'Aaron', 'Porlares', 'aaron.porlares@gmail.com', '$2y$10$J0YEkKEtOAWm2gJoxixNOeKfr.9ZxglapxKHiFiYGpdg3M9AXmgY.'),
(3, 'Main Administrator', 'City Hall', 'adminrrivera', 'Rhodemil Zeth', 'Rivera', 'zeth@gmail.com', '$2y$10$OTYHIuEJrgLRZ3dXv07eGe9f3qos8MzMEGPFWMPa42DVVgLfLDl4y'),
(4, 'Main Administrator', 'City Hall', 'admintocampo', 'Tresha', 'Ocampo', 'tresha@gmail.com', '$2y$10$RkNRS/OcLJktAxIw2DK27eky8HsbJJmGRg0nWlY8JdxGLah0YznKi'),
(5, 'Main Administrator', 'City Hall', 'adminjulanday', 'Jules Jacob', 'Ulanday', 'jules.ulanday@gmail.com', '$2y$10$w1BdpAXZY/USfvDu2fdwc.nOeU/MdmTpsy3JIlQnKqe7K3g0VjWSm'),
(6, 'Main Administrator', 'City Hall', 'admincurmatam', 'Clarence', 'Urmatam', 'clarence@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(7, 'Main Administrator', 'City Hall', 'adminlebron', 'Lebron', 'James', 'lebron@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(8, 'Main Administrator', 'City Hall', 'adminalibudbud', 'Tracie Mariz', 'Alibudbud', 'tracie@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(9, 'Main Administrator', 'City Hall', 'adminlian', 'Lian', 'Añonuevo', 'lian@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(10, 'Main Administrator', 'City Hall', 'adminmica', 'Micalyn Rose', 'Apolonia', 'mica@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(11, 'Main Administrator', 'City Hall', 'adminvienne', 'Vienne Johara', 'Aquino', 'vienne@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(12, 'Main Administrator', 'City Hall', 'adminreinier', 'Reinier', 'Balabala', 'reinier@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(13, 'Main Administrator', 'City Hall', 'adminjoshua', 'Joshua Ivan Mari', 'Basa', 'joshua@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(14, 'Main Administrator', 'City Hall', 'adminivan', 'Ivan Isaac', 'Bautista', 'ivanisaac@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(15, 'Main Administrator', 'City Hall', 'adminefhraim', 'Efhraim Jemini', 'Beato', 'efhraim@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(16, 'Main Administrator', 'City Hall', 'adminluigi', 'John Luigi', 'Billardo', 'luigi@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(17, 'Main Administrator', 'City Hall', 'adminsean', 'Sean Ren', 'Caldit', 'sean@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(18, 'Main Administrator', 'City Hall', 'admineugene', 'Eugene Rey', 'Carta', 'eugene@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(19, 'Main Administrator', 'City Hall', 'adminclarencekaye', 'Clarence Kaye', 'Catangay', 'clarencekaye@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(20, 'Main Administrator', 'City Hall', 'adminpatrick', 'Patrick', 'Clemente', 'patrick@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(21, 'Main Administrator', 'City Hall', 'adminpeter', 'John Peter', 'De Leon', 'johnpeter@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(22, 'Main Administrator', 'City Hall', 'adminalessandra', 'Alessandra Joy', 'Del Rosario', 'alessandra@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(23, 'Main Administrator', 'City Hall', 'adminlanz', 'Lanz Ezekiel', 'Dela Cruz', 'lanzezekiel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(24, 'Main Administrator', 'City Hall', 'adminjonathan', 'Jonathan', 'Evangelio', 'jonathan@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(25, 'Main Administrator', 'City Hall', 'admincyrus', 'Cyrus Karl', 'Evangelista', 'cyruskarl@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(26, 'Main Administrator', 'City Hall', 'admindanica', 'Danica Mae', 'Evangelista', 'danica@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(27, 'Main Administrator', 'City Hall', 'adminroi', 'Roi John', 'Garcia', 'roijohn@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(28, 'Main Administrator', 'City Hall', 'adminarjohn', 'Arjohn', 'Gomez', 'arjohn@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(29, 'Main Administrator', 'City Hall', 'adminjimrossel', 'Jim Rossel', 'Heredia', 'jimrossel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(30, 'Main Administrator', 'City Hall', 'adminmarwin', 'Marwin', 'Imperial', 'marwin@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(31, 'Solo Parent Administrator', 'Tagapo', 'adminjessie', 'Jessie', 'Lazaga', 'jessie@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(32, 'Solo Parent Administrator', 'Sinalhan', 'adminkacy', 'Kacy', 'Maala', 'kacy@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(33, 'Solo Parent Administrator', 'Sinalhan', 'adminlloyd', 'Frencey Lloyd', 'Manipol', 'frenceylloyd@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(34, 'PWD Administrator', 'Tagapo', 'adminedison', 'Edison', 'Medina', 'edison@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(35, 'Solo Parent Administrator', 'Pulong Santa Cruz', 'adminphilip', 'John Philip', 'Mindanao', 'philip@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(36, 'Solo Parent Administrator', 'Pulong Santa Cruz', 'adminsamuel', 'Samuel', 'Norte', 'samuel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(37, 'Solo Parent Administrator', 'Pulong Santa Cruz', 'adminkenneth', 'Kenneth', 'Pace', 'kenneth@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(38, 'Solo Parent Administrator', 'Pulong Santa Cruz', 'adminirish', 'Irish Trixie', 'Pandonggan', 'irishtrixie@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(39, 'Solo Parent Administrator', 'Pulong Santa Cruz', 'admindaniel', 'John Daniel', 'Policarpio', 'daniel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(40, 'Solo Parent Administrator', 'Pulong Santa Cruz', 'adminharold', 'John Harold', 'Quijano', 'harold@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(41, 'Solo Parent Administrator', 'Pulong Santa Cruz', 'adminkobe', 'Kobe', 'Raymundo', 'kobe@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(42, 'PWD Administrator', 'Pulong Santa Cruz', 'adminjonjon', 'John Ivan', 'Respende', 'jonjon@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(43, 'PWD Administrator', 'Pulong Santa Cruz', 'adminalyssa', 'Allysa Mae', 'Rivera', 'allysa@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(44, 'PWD Administrator', 'Pulong Santa Cruz', 'adminrovic', 'John Rovic', 'Sabalboro', 'rovic@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(45, 'PWD Administrator', 'Pulong Santa Cruz', 'adminezra', 'Ezra Lou', 'Salongga', 'ezralou@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(46, 'PWD Administrator', 'Pulong Santa Cruz', 'adminron', 'Ron Daniel', 'Sison', 'rondaniel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(47, 'PWD Administrator', 'Pulong Santa Cruz', 'adminarianne', 'Arianne Joyce', 'Susano', 'arianne@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(48, 'PWD Administrator', 'Pulong Santa Cruz', 'adminnikko', 'Nikko', 'Trinidad', 'nikko@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(49, 'PWD Administrator', 'Pulong Santa Cruz', 'adminkristen', 'Andrea Kristen', 'Villaluz', 'andreakristen@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(50, 'PWD Administrator', 'Pulong Santa Cruz', 'adminangeli', 'Angeli Claudette', 'Villar', 'angeliclaudette@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(51, 'PWD Administrator', 'Malusak', 'adminvonjoseph', 'Von Joseph', 'Yatco', 'vonjoseph@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(52, 'PWD Administrator', 'Malusak', 'adminchristine', 'Christine Danille', 'Zamonte', 'crhistine@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(53, 'PWD Administrator', 'Malusak', 'adminjohnrick', 'John Rick', 'Cansino', 'johnrick@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(54, 'PWD Administrator', 'Malusak', 'adminhoward', 'Howard', 'Tipay', 'howard@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(55, 'PWD Administrator', 'Malusak', 'adminraymart', 'Raymart', 'Damayo', 'raymart@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(56, 'PWD Administrator', 'Malusak', 'adminleo', 'Leo', 'Agne', 'leo@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(57, 'PWD Administrator', 'Malusak', 'adminwigbert', 'Wigbert Jovie', 'Parada', 'wigbert@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(58, 'PWD Administrator', 'Malusak', 'adminaurel', 'Aurel Maurice', 'Marcelo', 'aurelmaurice@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(59, 'PWD Administrator', 'Malusak', 'admingelo', 'Gelo', 'Mariano', 'gelo@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(60, 'PWD Administrator', 'Malusak', 'adminpiolo', 'Piolo', 'Mangampo', 'piolo@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(61, 'PWD Administrator', 'Malusak', 'adminjayson', 'Jayson', 'Protacio', 'jayson@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(62, 'PWD Administrator', 'Malusak', 'adminmatt', 'Matt Salem', 'Dorado', 'mattsalem@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(63, 'PWD Administrator', 'Malusak', 'adminjethro', 'Daniel Jethro', 'Crisostomo', 'jethro@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(64, 'PWD Administrator', 'Malusak', 'adminmark', 'John Mark', 'Malate', 'johnmark@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(65, 'PWD Administrator', 'Malusak', 'adminkhristel', 'Khristel', 'Tagros', 'khristel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(66, 'PWD Administrator', 'Balibago', 'adminjembert', 'Jembert', 'Penaloga', 'jembert@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(67, 'Solo Parent Administrator', 'Balibago', 'adminklariza', 'Klariza', 'Hernandez', 'klariza@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(68, 'Solo Parent Administrator', 'Balibago', 'adminalbert', 'Albert', 'Layug', 'albert@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(69, 'Solo Parent Administrator', 'Balibago', 'admincarl', 'Carl', 'Quirante', 'carl@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(70, 'Solo Parent Administrator', 'Balibago', 'adminhazel', 'Hazel', 'Alinsunurin', 'hazel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(71, 'Solo Parent Administrator', 'Balibago', 'adminrenz', 'Renz', 'Mercado', 'renz@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(72, 'Solo Parent Administrator', 'Balibago', 'adminmichaela', 'Michaela', 'Guanzon', 'michaela@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(73, 'Solo Parent Administrator', 'Balibago', 'adminrebecca', 'Rebecca', 'Ramos', 'rebecca@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(74, 'Solo Parent Administrator', 'Balibago', 'admincarlos', 'Carlos', 'Librada', 'carlos@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(75, 'Solo Parent Administrator', 'Balibago', 'admindaniel', 'Daniel', 'Comiso', 'daniel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(76, 'Solo Parent Administrator', 'Balibago', 'adminsteph', 'Stephen', 'Curry', 'curry@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(77, 'Solo Parent Administrator', 'Balibago', 'adminkyrie', 'Kyrie', 'Irving', 'irving@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(78, 'Solo Parent Administrator', 'Balibago', 'adminamir', 'Amir', 'Ezrael', 'amirezrael@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(79, 'Senior Citizen Administrator', 'Balibago', 'adminsealtiel', 'Sealtiel', 'Bueno', 'sealtiel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(80, 'Senior Citizen Administrator', 'Aplaya', 'adminjanzen', 'Janzen', 'Caponpon', 'janzen@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(81, 'Senior Citizen Administrator', 'Aplaya', 'adminlealyn', 'Lealyn', 'Lucas', 'lealyn@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(82, 'Senior Citizen Administrator', 'Aplaya', 'adminericson', 'Ericson', 'Tabion', 'ericson@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(83, 'Senior Citizen Administrator', 'Aplaya', 'adminfaith', 'Faith Honeywell', 'Austria', 'faithhoneywell@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(84, 'Senior Citizen Administrator', 'Aplaya', 'adminrex', 'Rex', 'Tarranco', 'rex@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(85, 'Senior Citizen Administrator', 'Aplaya', 'adminaubrey', 'Aubrey Rose', 'Castanares', 'aubreyrose@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(86, 'Senior Citizen Administrator', 'Aplaya', 'adminfaye', 'Faye', 'Cancisio', 'faye@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(87, 'Senior Citizen Administrator', 'Aplaya', 'admingillian', 'Gillian Cristel', 'Samiano', 'gilliancristel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(88, 'Senior Citizen Administrator', 'Aplaya', 'admincarlo', 'Carlo', 'Alcabasa', 'carlo@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(89, 'Senior Citizen Administrator', 'Aplaya', 'adminyvonne', 'Yvonne', 'Barrera', 'yvonne@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(90, 'Senior Citizen Administrator', 'Aplaya', 'adminneiljohn', 'Neiljohn', 'Prudente', 'neiljohn@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(91, 'Senior Citizen Administrator', 'Aplaya', 'adminnhoel', 'Nhoel', 'Castro', 'nhoel@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(92, 'Senior Citizen Administrator', 'Aplaya', 'adminjeiger', 'Jeiger James', 'Huizo', 'jeigerjames@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(93, 'Senior Citizen Administrator', 'Aplaya', 'adminxheanttle', 'Xheanttle', 'Mirasol', 'xheanttle@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(94, 'Senior Citizen Administrator', 'Aplaya', 'adminfrancisdon', 'Francis Don', 'Sadili', 'francisdon@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(95, 'Senior Citizen Administrator', 'Tagapo', 'adminlorraine', 'Lorraine', 'Castro', 'lorraine@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(96, 'Senior Citizen Administrator', 'Tagapo', 'adminthomasneo', 'Thomas Neo', 'Gatdula', 'thomasneo@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(97, 'Senior Citizen Administrator', 'Tagapo', 'adminlaverne', 'Laverne', 'Regodon', 'laverne@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(98, 'Senior Citizen Administrator', 'Tagapo', 'adminjohncurt', 'John Curt', 'Rencio', 'johncurt@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(99, 'Senior Citizen Administrator', 'Tagapo', 'adminrodolfo', 'Rodolfo', 'Lofamia', 'gelo@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(100, 'Senior Citizen Administrator', 'Tagapo', 'adminchelleallen', 'Chelle Allen', 'Tolentino', 'chelleallen@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte');

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
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `APPLICANT_ID` varchar(16) NOT NULL,
  `APPLICANT_TYPE` varchar(64) NOT NULL,
  `CITIZEN_ID` varchar(64) NOT NULL,
  `PLACE_OF_BIRTH` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applicant`
--

INSERT INTO `applicant` (`APPLICANT_ID`, `APPLICANT_TYPE`, `CITIZEN_ID`, `PLACE_OF_BIRTH`) VALUES
('d5f1a621c21540f7', 'PWD', '043428023-8820', NULL),
('22056c0f3d9947ff', 'Solo Parent', '2023-24226', 'PASAY CITY'),
('7339f1ca49cb44dc', 'Senior Citizen', 'SC-928858', 'PANDACAN MANILA');

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
('88e8b0119af011ed', 'd5f1a621c21540f7', 'Unknown', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `COMPANY_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `COMPANY` varchar(128) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`COMPANY_ID`, `PERSON_ID`, `COMPANY`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('041ef2089b2511ed', '22056c0f3d9947ff', 'NONE', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('041ea1d69b2511ed', '22056c0f3d9947ff', 'COLLEGE', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('04221c289b2511ed', 'dd1d284cce34412c', 'COLLEGE', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88e901689af011ed', 'd5f1a621c21540f7', 'College', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88e9a39c9af011ed', 'd5f1a621c21540f7', 'Unemployed', NULL, NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('041e512f9b2511ed', '22056c0f3d9947ff', 'Female', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88e7b8219af011ed', 'd5f1a621c21540f7', 'Male', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbb9b1009b2511ed', '7339f1ca49cb44dc', 'Female', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88e9501c9af011ed', 'd5f1a621c21540f7', 'Yes', 'No', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88eb0a7a9af011ed', 'd5f1a621c21540f7', '', '', '', 'No', '', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('041f695b9b2511ed', '22056c0f3d9947ff', '0', '0.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('042261079b2511ed', 'dd1d284cce34412c', '0', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88ea55d69af011ed', 'd5f1a621c21540f7', NULL, NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `JOB_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `JOB` varchar(300) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`JOB_ID`, `PERSON_ID`, `JOB`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('04200aae9b2511ed', '22056c0f3d9947ff', 'NONE', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88e9fabc9af011ed', 'd5f1a621c21540f7', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbbca8fe9b2511ed', '7339f1ca49cb44dc', 'NONE', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88e71a7f9af011ed', 'd5f1a621c21540f7', '', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('0421645d9b2511ed', 'dd1d284cce34412c', 'Single', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88e856569af011ed', 'd5f1a621c21540f7', 'Single', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbba79739b2511ed', '7339f1ca49cb44dc', 'Widowed', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('041cf2b69b2511ed', '22056c0f3d9947ff', 'CHRISTINE', 'MONTEALEGRE', 'DEL ROSARIO', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('0420abdd9b2511ed', 'dd1d284cce34412c', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88e611869af011ed', 'd5f1a621c21540f7', 'ROMEO JR', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88ebc0289af011ed', 'ed551e693976491a', 'ROMEO SR', 'UY', 'BARDILLON', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88eda6449af011ed', 'bf78d87c8eaa4988', 'MILA ROSA', 'SABANDAL', 'MONTEALEGRE', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88ef04379af011ed', '1d84311327d14e2b', 'DON KENNETH', 'MONTEALEGRE', 'BARDILLON', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbb7f1da9b2511ed', '7339f1ca49cb44dc', 'ASUNCION', 'SABANDAL', 'MONTEALEGRE', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbbe069d9b2511ed', '40a2e0becda944b0', 'VERGILIO', 'DESTREZA', 'MONTEALEGRE', '', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbc031179b2511ed', 'ede8e472aecd402e', 'MILA ROSA', 'SABANDAL', 'MONTEALEGRE', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88eab24f9af011ed', 'd5f1a621c21540f7', '', '', '', '', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('fbbceee79b2511ed', '7339f1ca49cb44dc', 'Y', 'SSS', '4000.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PERSON_ID` varchar(16) NOT NULL,
  `DATE_OF_BIRTH` datetime(6) DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`PERSON_ID`, `DATE_OF_BIRTH`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('1d84311327d14e2b', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('22056c0f3d9947ff', '2002-12-19 00:00:00.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('40a2e0becda944b0', '1942-08-07 00:00:00.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('7339f1ca49cb44dc', '1942-01-12 00:00:00.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('bf78d87c8eaa4988', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('d5f1a621c21540f7', '2001-07-30 00:00:00.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('dd1d284cce34412c', '2001-07-30 00:00:00.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('ed551e693976491a', NULL, '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('ede8e472aecd402e', '1965-07-20 00:00:00.000000', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('041df7ab9b2511ed', '22056c0f3d9947ff', 'b3ac17d690d740aa'),
('88e6b6ef9af011ed', 'd5f1a621c21540f7', '5e14e63a49ea4c54'),
('fbb9039b9b2511ed', '7339f1ca49cb44dc', '5803786ab66f4e13'),
('fbc0fc359b2511ed', 'ede8e472aecd402e', 'b15654bf7df64272');

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
('88e5b8d59af011ed', 'd5f1a621c21540f7', '', '', '', '', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88f07a119af011ed', 'd5f1a621c21540f7', 'Guardian', 'DON KENNETH MONTEALEGRE BARDILLON ', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88efc7659af011ed', 'd5f1a621c21540f7', 'Physical Disability', NULL, 'ACQUIRED', NULL, 'Injury', 'Temporary', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('88f020bd9af011ed', 'd5f1a621c21540f7', 'LEBRON JAMES', 'MD8299-8854', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('04232be49b2511ed', '22056c0f3d9947ff', 'dd1d284cce34412c', 'Family Member'),
('88eca9639af011ed', 'd5f1a621c21540f7', 'ed551e693976491a', 'Father'),
('88eded3a9af011ed', 'd5f1a621c21540f7', 'bf78d87c8eaa4988', 'Mother'),
('88ef48f09af011ed', 'd5f1a621c21540f7', '1d84311327d14e2b', 'BROTHER'),
('fbbeae629b2511ed', '7339f1ca49cb44dc', '40a2e0becda944b0', 'Spouse'),
('fbc14b0d9b2511ed', '7339f1ca49cb44dc', 'ede8e472aecd402e', 'Child');

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
('88e808149af011ed', 'd5f1a621c21540f7', 'CATHOLIC', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbbbef629b2511ed', '7339f1ca49cb44dc', 'CATHOLIC', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `solo_parent_long_text`
--

CREATE TABLE `solo_parent_long_text` (
  `SOLO_PARENT_LONG_TEXT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `CLASSIFICATION_CIRCUMSTANCES` varchar(1024) NOT NULL,
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
('0423eeb99b2511ed', '22056c0f3d9947ff', 'LONGTEXT', 'LONGTEXT', 'LONGTEXT', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
('041fbae59b2511ed', '22056c0f3d9947ff', '09760657071', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88e75f219af011ed', 'd5f1a621c21540f7', '09760657071', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88ef8c619af011ed', '1d84311327d14e2b', '09091072865', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbbb267b9b2511ed', '7339f1ca49cb44dc', '09760657071', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbc0771c9b2511ed', 'ede8e472aecd402e', '09550171148', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `TRANSACTION_TYPE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TRANSACTION_TYPE` varchar(128) NOT NULL,
  `STATUS` varchar(64) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`TRANSACTION_TYPE_ID`, `PERSON_ID`, `TRANSACTION_TYPE`, `STATUS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('041cabb69b2511ed', '22056c0f3d9947ff', 'New Application', 'PENDING', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('88e558379af011ed', 'd5f1a621c21540f7', 'NEW ID', 'PENDING', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('fbb70bf99b2511ed', '7339f1ca49cb44dc', 'BAGO', 'PENDING', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `user_account`
--

CREATE TABLE `user_account` (
  `USER_ACCOUNT_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `EMAIL` varchar(128) NOT NULL,
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

INSERT INTO `user_account` (`USER_ACCOUNT_ID`, `PERSON_ID`, `EMAIL`, `USERNAME`, `PASSWORD`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('043428023-8820', 'd5f1a621c21540f7', 'romsky.bardillon@gmail.com', '043428023-8820', '$2y$10$VituYqs19gwWI2Gd084Yhe1gkm71sPYiz3WvIqbVvdLV24XlWYNWu', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('2023-24226', '22056c0f3d9947ff', 'romsky.bardillon@gmail.com', '2023-24226', '$2y$10$TmHH3qClmGbU8oroapKN0OSY.F3Rqa7zq9E5LeDA2nBmDasVg7w1m', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon'),
('SC-928858', '7339f1ca49cb44dc', 'romsky.bardillon@gmail.com', 'SC-928858', '$2y$10$.bMp8kFMx7qInmwVpvyoVOaBTwU8Kgg7MOy6WhA6Vgddfrp2Gh/d6', '2023-01-23 00:00:00.000000', '2023-01-23 00:00:00.000000', 'N', 'adminrbardillon');

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
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
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
  ADD PRIMARY KEY (`PERSON_ID`);

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
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
