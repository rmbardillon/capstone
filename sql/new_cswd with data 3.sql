-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 19, 2023 at 11:56 PM
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
('74ab7349195f4bd4', 'Kalnuran', 'BLOCK 10 LOT 5 MABUHAY ST. MABATO SUBD.', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('9de09e56e28d4de2', 'Kalnuran', 'BLOCK 10 LOT 5 MABUHAY ST. MABATO SUBD.', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('a464eec7130d4988', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION BARANGAY TAGAPO', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b2600e749d8948c2', 'Tagapo', 'BLOCK 7 LOT 2 OAK STREET ROSE POINTE SUBDIVISION BARANGAY TAGAPO', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
(31, 'Solo Parent Administrator', 'Sinalhan', 'adminjessie', 'Jessie', 'Lazaga', 'jessie@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(32, 'Solo Parent Administrator', 'Sinalhan', 'adminkacy', 'Kacy', 'Maala', 'kacy@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(33, 'Solo Parent Administrator', 'Sinalhan', 'adminlloyd', 'Frencey Lloyd', 'Manipol', 'frenceylloyd@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
(34, 'PWD Administrator', 'Pulong Santa Cruz', 'adminedison', 'Edison', 'Medina', 'edison@gmail.com', '$2y$10$3bQiV6swhl.AMqMxJoh3uOtqTPRlp2PmBK/pMx3hYTIihfZPP0vte'),
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
('3d625eafb15640fd', 'Senior Citizen', 'SC-220772', 'SANTA ROSA, LAGUNA'),
('fbbf404540164285', 'Solo Parent', '2023-67438', 'PASAY CITY'),
('5c356d3a61f540e3', 'PWD', '043428023-0512', NULL),
('0419f925f3dc4dac', 'PWD', '043428023-1319', NULL);

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
('6b98bc7997fc11ed', '5c356d3a61f540e3', 'B+', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9b69b397fc11ed', '0419f925f3dc4dac', 'B+', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('b0f306e397f511ed', 'fbbf404540164285', 'NONE', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('6b99188697fc11ed', '5c356d3a61f540e3', 'College', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9c30d397fc11ed', '0419f925f3dc4dac', 'College', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b0f2c0c797f511ed', 'fbbf404540164285', 'COLLEGE', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('6b9a1f5b97fc11ed', '5c356d3a61f540e3', 'Unemployed', NULL, NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9d3b7e97fc11ed', '0419f925f3dc4dac', 'Unemployed', NULL, NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('45605ba597e811ed', '3d625eafb15640fd', 'Male', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b9769ce97fc11ed', '5c356d3a61f540e3', 'Male', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9a120c97fc11ed', '0419f925f3dc4dac', 'Male', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b0f278cd97f511ed', 'fbbf404540164285', 'Female', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `government_membership`
--

CREATE TABLE `government_membership` (
  `GOVERNMENT_MEMBERSHIP_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `IS_ACTIVE_VOTER` char(1) NOT NULL,
  `IS_4PS_MEMBER` char(1) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `government_membership`
--

INSERT INTO `government_membership` (`GOVERNMENT_MEMBERSHIP_ID`, `PERSON_ID`, `IS_ACTIVE_VOTER`, `IS_4PS_MEMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('6b9976b497fc11ed', '5c356d3a61f540e3', 'Y', 'N', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9cfa4697fc11ed', '0419f925f3dc4dac', 'Y', 'N', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('6b9c1ed797fc11ed', '5c356d3a61f540e3', '', '', '', 'No', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9f589397fc11ed', '0419f925f3dc4dac', '', '', '', 'No', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('6b9ac0ba97fc11ed', '5c356d3a61f540e3', NULL, NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9ebe1497fc11ed', '0419f925f3dc4dac', NULL, NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b0f3519297f511ed', 'fbbf404540164285', '0', '0.000000', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('4561ff8997e811ed', '3d625eafb15640fd', 'NONE', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b9a7b0697fc11ed', '5c356d3a61f540e3', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9deda597fc11ed', '0419f925f3dc4dac', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b0f3dc9597f511ed', 'fbbf404540164285', 'NONE', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `marital_status`
--

CREATE TABLE `marital_status` (
  `MARITAL_STATUS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `MARITAL_STATUS` varchar(32) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `marital_status`
--

INSERT INTO `marital_status` (`MARITAL_STATUS_ID`, `PERSON_ID`, `MARITAL_STATUS`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('4560ced797e811ed', '3d625eafb15640fd', 'Single', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b98641497fc11ed', '5c356d3a61f540e3', 'Single', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9a9fb997fc11ed', '0419f925f3dc4dac', 'Single', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('455f328b97e811ed', '3d625eafb15640fd', 'ROMEO JR', NULL, 'BARDILLON', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('45630f9b97e811ed', '5944136636044220', '', '', '', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b93445897fc11ed', '5c356d3a61f540e3', 'KARL CYRUS', 'DELA ROSA', 'EVANGELISTA', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b9cc04097fc11ed', 'bd6158e05c3543fa', 'CHIZ', '', 'EVANGELISTA', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b9db2fc97fc11ed', '2e9610ff2a684537', 'HEART', '', 'EVANGELISTA', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b9f00db97fc11ed', 'c42866e903c84f30', '', '', '', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d97731097fc11ed', '0419f925f3dc4dac', 'KARL CYRUS', 'DELA ROSA', 'EVANGELISTA', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8da0e16a97fc11ed', '1d89b4c38bcd4d2d', 'CHIZ', '', 'EVANGELISTA', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8da28e4597fc11ed', '6c8e26daa6104bc7', 'HEART', '', 'EVANGELISTA', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8da3b9d097fc11ed', 'b55ae8a3af0843ac', '', '', '', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b0f1821797f511ed', 'fbbf404540164285', 'CHRISTINE', NULL, 'DEL ROSARIO', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('6b9b766697fc11ed', '5c356d3a61f540e3', '', '', '', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9f22bd97fc11ed', '0419f925f3dc4dac', '', '', '', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('4562640297e811ed', '3d625eafb15640fd', 'N', NULL, NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('0419f925f3dc4dac', '2001-01-01 00:00:00.000000', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('1d89b4c38bcd4d2d', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('2e9610ff2a684537', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('3d625eafb15640fd', '1963-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('5944136636044220', '0000-00-00 00:00:00.000000', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('5c356d3a61f540e3', '2001-01-01 00:00:00.000000', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6c8e26daa6104bc7', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b55ae8a3af0843ac', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('bd6158e05c3543fa', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('c42866e903c84f30', NULL, '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('fbbf404540164285', '2002-12-19 00:00:00.000000', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('455fef7897e811ed', '3d625eafb15640fd', 'a464eec7130d4988'),
('6b95495397fc11ed', '5c356d3a61f540e3', '9de09e56e28d4de2'),
('8d989cc497fc11ed', '0419f925f3dc4dac', '74ab7349195f4bd4'),
('b0f21e3a97f511ed', 'fbbf404540164285', 'b2600e749d8948c2');

-- --------------------------------------------------------

--
-- Table structure for table `previous_address`
--

CREATE TABLE `previous_address` (
  `PREVIOUS_ADDRESS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `REGION` varchar(128) NOT NULL,
  `PROVINCE` varchar(128) NOT NULL,
  `CITY` varchar(128) NOT NULL,
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
('6b921a8597fc11ed', '5c356d3a61f540e3', '', '', '', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d97247397fc11ed', '0419f925f3dc4dac', '', '', '', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('6ba0708197fc11ed', '5c356d3a61f540e3', 'Applicant', 'KARL CYRUS DELA ROSA EVANGELISTA ', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8da5052097fc11ed', '0419f925f3dc4dac', 'Applicant', 'KARL CYRUS DELA ROSA EVANGELISTA ', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
-- Table structure for table `pwd_disease`
--

CREATE TABLE `pwd_disease` (
  `PWD_DISEASE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TYPE_OF_DISABILITY` set('Deaf/Hard of Hearing','Intellectual Disability','Learning Disability','Mental Disability','Physical Disablity (Orthopedic)','Psychosocial Disability','Speech & Language Impairment','Visual Disability','Cancer (RA11215)','Rare Disease (RA10747)') DEFAULT NULL,
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
('6b9fc2b197fc11ed', '5c356d3a61f540e3', '', NULL, 'ACQUIRED', NULL, 'Injury', 'Temporary', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8da485ee97fc11ed', '0419f925f3dc4dac', '', NULL, 'ACQUIRED', NULL, 'Injury', 'Temporary', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('6ba0213197fc11ed', '5c356d3a61f540e3', 'LEBRON JAMES', 'MD8299-8854', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8da4c68397fc11ed', '0419f925f3dc4dac', 'LEBRON JAMES', 'MD8299-8854', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('4563ede997e811ed', '3d625eafb15640fd', '5944136636044220', 'Spouse'),
('6b9d05b797fc11ed', '5c356d3a61f540e3', 'bd6158e05c3543fa', 'Father'),
('6b9e750397fc11ed', '5c356d3a61f540e3', '2e9610ff2a684537', 'Mother'),
('6b9f45dc97fc11ed', '5c356d3a61f540e3', 'c42866e903c84f30', ''),
('8da183d997fc11ed', '0419f925f3dc4dac', '1d89b4c38bcd4d2d', 'Father'),
('8da2cdfa97fc11ed', '0419f925f3dc4dac', '6c8e26daa6104bc7', 'Mother'),
('8da3fbd997fc11ed', '0419f925f3dc4dac', 'b55ae8a3af0843ac', '');

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
('45619a0897e811ed', '3d625eafb15640fd', 'CATHOLIC', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b97aeb597fc11ed', '5c356d3a61f540e3', 'CATHOLIC', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d9a589b97fc11ed', '0419f925f3dc4dac', 'CATHOLIC', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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

--
-- Dumping data for table `senior_citizen_data`
--

INSERT INTO `senior_citizen_data` (`id`, `username`, `registration_type`, `lost_number`, `sr_citizen_num`, `sr_citizen_first_name`, `sr_citizen_middle_name`, `sr_citizen_last_name`, `sr_citizen_suffix`, `barangay`, `tirahan`, `sex`, `marital_status`, `edad`, `date_of_birth`, `lugar_ng_kapanganakan`, `telepono`, `relihiyon`, `hanapbuhay`, `pensyon`, `saan`, `magkano`, `pangalan_ng_asawa`, `edad_asawa`, `ilan_ang_anak`, `kasama`, `status`, `application_date`, `expiration_date`) VALUES
(1, 'rmbardillon', 'Lumipat', NULL, NULL, 'ROMEO JR', '', 'BARDILLON', '', 'Balibago', 'BLOCK 10 LOT 11 ROSAFLOR SUBD.', 'Male', 'Single', '60', '1963-01-09', 'SANTA ROSA LAGUNA', '09760657071', 'KATOLIKO', 'WALA', 'Wala', NULL, NULL, 'VERGILIO MONTEALEGRE', '70', '0', '0', 'Pending', '2023-01-13 16:44:13', NULL);

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

--
-- Dumping data for table `senior_citizen_family_composition`
--

INSERT INTO `senior_citizen_family_composition` (`id`, `username`, `name`, `age`, `address`, `contact`, `date`) VALUES
(1, 'rmbardillon', 'SDA', '56', 'SANTA ROSA', '09456558987', '2023-01-13 16:44:13');

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

--
-- Dumping data for table `solo_parent_data`
--

INSERT INTO `solo_parent_data` (`id`, `username`, `solo_parent_name`, `age`, `sex`, `date_of_birth`, `place_of_birth`, `address`, `barangay`, `educ_attainment`, `occupation`, `income`, `fam_income`, `tenurial`, `religion`, `contact_number`, `marital_status`, `classification_incidence`, `classification_when`, `problems`, `family_resources`, `date_applied`, `status`, `application_date`, `expiration_date`) VALUES
(1, 'rmbardillon', 'ROMEO JR BARDILLON', '21', 'Male', '2001-07-30', 'SANTA ROSA LAGUNA', 'SANTA ROSA LAGUNA', 'Tagapo', 'COLLEGE', 'STUDENT', '0.00', '0.00', '2', 'CATHOLIC', '09760657071', 'Single', 'INAWAY', 'JULY 23, 2022', 'IDK', 'IDK', '2022-10-22', 'Pending', '2022-10-21 22:22:32', NULL);

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

--
-- Dumping data for table `solo_parent_family_composition`
--

INSERT INTO `solo_parent_family_composition` (`id`, `username`, `name`, `relationship`, `age`, `civil_status`, `educ_attainment`, `occupation`, `monthly_income`, `date`) VALUES
(1, 'rmbardillon', 'TINTIN', 'COUSIN', '20', 'Single', 'COLLEGE', 'N/A', '0.00', '2022-10-21 22:22:32');

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
('b0f424e897f511ed', 'fbbf404540164285', 'N/A', 'N/A', 'N/A', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `telephone`
--

CREATE TABLE `telephone` (
  `TELEPHONE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TELEPHONE_NUMBER` varchar(32) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `telephone`
--

INSERT INTO `telephone` (`TELEPHONE_ID`, `PERSON_ID`, `TELEPHONE_NUMBER`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('456136d997e811ed', '3d625eafb15640fd', '09760657071', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b95f26997fc11ed', '5c356d3a61f540e3', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b96a90f97fc11ed', '5c356d3a61f540e3', '09760657071', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b9f7c0197fc11ed', 'c42866e903c84f30', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d98ed5797fc11ed', '0419f925f3dc4dac', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d99398397fc11ed', '0419f925f3dc4dac', '09760657071', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8da4492897fc11ed', 'b55ae8a3af0843ac', '', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b0f3964497f511ed', 'fbbf404540164285', '09760657071', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

-- --------------------------------------------------------

--
-- Table structure for table `transaction_type`
--

CREATE TABLE `transaction_type` (
  `TRANSACTION_TYPE_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `TRANSACTION_TYPE` varchar(128) NOT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_type`
--

INSERT INTO `transaction_type` (`TRANSACTION_TYPE_ID`, `PERSON_ID`, `TRANSACTION_TYPE`, `DATE_CREATED`, `DATE_UPDATED`, `IS_DELETED`, `UPDATED_BY`) VALUES
('455ec6d197e811ed', '3d625eafb15640fd', 'BAGO', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('6b91221b97fc11ed', '5c356d3a61f540e3', 'NEW ID', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('8d96ccc097fc11ed', '0419f925f3dc4dac', 'NEW ID', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('b0f12fd197f511ed', 'fbbf404540164285', 'New Application', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

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
('043428023-0512', '5c356d3a61f540e3', 'romsky.bardillon@gmail.com', '043428023-0512', '$2y$10$m3ENWT0SM5EKo3r7F67uW.kxERzvv9SoedybEoGltfm/0u8Cz6NSW', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('043428023-1319', '0419f925f3dc4dac', 'romsky.bardillon@gmail.com', '043428023-1319', '$2y$10$fKfbrIVzV7Sg2Oby2XJjQevG1BcqFiIYLkfByxYwINll.wUMfeHXW', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('2023-67438', 'fbbf404540164285', 'romsky.bardillon@gmail.com', '2023-67438', '$2y$10$wn.KzkBh.jZvbD6OQ9bki.eRyGT.e2qUrnyHDX4YTVvj5ZcCUbKou', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon'),
('SC-220772', '3d625eafb15640fd', 'romsky.bardillon@gmail.com', 'SC-220772', '$2y$10$qpAPBw12gCRkx3dd8wNYOe6F9XokdpqWdQtC85lOVftAqNRnHC76q', '2023-01-19 00:00:00.000000', '2023-01-19 00:00:00.000000', 'N', 'adminrbardillon');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`ADDRESS_ID`);

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
