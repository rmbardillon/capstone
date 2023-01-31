-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 31, 2023 at 06:29 AM
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
(1, 'Main Administrator', 'City Hall', 'adminrbardillon', 'Romeo Jr', 'Bardillon', 'romsky.bardillon@gmail.com', '$2y$10$b4cqKlJHiJ4s9OOCinta1OHEYIJLbW1dulb6h60Y0j/mUqJySyLhG'),
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
  `ANNOUNCEMENT_ID` int(11) NOT NULL,
  `TITLE` varchar(128) NOT NULL,
  `ANNOUNCEMENT_FOR` enum('Administrator','PWD','Senior Citizen','Solo Parent') NOT NULL,
  `BARANGAY` enum('City Hall','Aplaya','Balibago','Caingin','Dila','Dita','Don Jose','Ibaba','Kanluran','Labas','Macabling','Malitlit','Malusak','Market Area','Pook','Pulong Santa Cruz','Santo Domingo','Sinalhan','Tagapo') NOT NULL,
  `MESSAGE` text NOT NULL
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

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `PERSON_ID` varchar(16) NOT NULL,
  `DATE_OF_BIRTH` date DEFAULT NULL,
  `DATE_CREATED` datetime(6) NOT NULL,
  `DATE_UPDATED` datetime(6) NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `person_address`
--

CREATE TABLE `person_address` (
  `PERSON_ADDRESS_ID` varchar(16) NOT NULL,
  `PERSON_ID` varchar(16) NOT NULL,
  `ADDRESS_ID` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `DATE_UPDATED` date NOT NULL,
  `IS_DELETED` char(1) NOT NULL,
  `UPDATED_BY` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `ANNOUNCEMENT_ID` int(11) NOT NULL AUTO_INCREMENT;

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
