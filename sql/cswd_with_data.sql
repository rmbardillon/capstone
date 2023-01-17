-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2023 at 02:31 AM
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
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `image_location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `username`, `image_location`) VALUES
(1, 'adminrbardillon', '634f5eb3b17e40.28957659.jpg');

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

--
-- Dumping data for table `senior_citizen_data`
--

INSERT INTO `senior_citizen_data` (`id`, `username`, `registration_type`, `lost_number`, `sr_citizen_num`, `sr_citizen_first_name`, `sr_citizen_middle_name`, `sr_citizen_last_name`, `sr_citizen_suffix`, `barangay`, `tirahan`, `sex`, `marital_status`, `edad`, `date_of_birth`, `lugar_ng_kapanganakan`, `telepono`, `relihiyon`, `hanapbuhay`, `pensyon`, `saan`, `magkano`, `pangalan_ng_asawa`, `edad_asawa`, `ilan_ang_anak`, `kasama`, `status`, `application_date`, `expiration_date`) VALUES
(1, 'rmbardillon', 'Lumipat', NULL, NULL, 'ROMEO JR', '', 'BARDILLON', '', 'Balibago', 'BLOCK 10 LOT 11 ROSAFLOR SUBD.', 'Male', 'Single', '60', '1963-01-09', 'SANTA ROSA LAGUNA', '09760657071', 'KATOLIKO', 'WALA', 'Wala', NULL, NULL, 'VERGILIO MONTEALEGRE', '70', '0', '0', 'Pending', '2023-01-14 00:44:13', NULL);

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
(1, 'rmbardillon', 'SDA', '56', 'SANTA ROSA', '09456558987', '2023-01-14 00:44:13');

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
(1, 'rmbardillon', 'ROMEO JR BARDILLON', '21', 'Male', '2001-07-30', 'SANTA ROSA LAGUNA', 'SANTA ROSA LAGUNA', 'Tagapo', 'COLLEGE', 'STUDENT', '0.00', '0.00', '2', 'CATHOLIC', '09760657071', 'Single', 'INAWAY', 'JULY 23, 2022', 'IDK', 'IDK', '2022-10-22', 'Pending', '2022-10-22 06:22:32', NULL);

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
(1, 'rmbardillon', 'TINTIN', 'COUSIN', '20', 'Single', 'COLLEGE', 'N/A', '0.00', '2022-10-22 06:22:32');

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
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `last_name`, `suffix`, `first_name`, `middle_name`, `email`, `barangay`, `is_verified`, `vkey`, `password`, `is_pwd`, `is_sr_citizen`, `is_solo_parent`, `date`) VALUES
(1, 'rmbardillon', 'Bardillon', '', 'Romeo Jr', 'Montealegre', 'romsky.bardillon@gmail.com', 'Tagapo', 1, '938b02cba67943a09ff4c0553017deb5', '$2y$10$lnB4W7.UvPIxx689Fy1lc.31UI9qrYXfAgI5223QuQcNzlavdNE3e', 'No', 'Yes', 'No', '2022-11-20 12:53:35');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `announcement`
--
ALTER TABLE `announcement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `senior_citizen_family_composition`
--
ALTER TABLE `senior_citizen_family_composition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `solo_parent_data`
--
ALTER TABLE `solo_parent_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `solo_parent_family_composition`
--
ALTER TABLE `solo_parent_family_composition`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
