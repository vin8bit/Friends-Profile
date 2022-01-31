-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 09, 2022 at 07:31 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `profiledb`
--

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `profile_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `about` varchar(500) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`profile_id`, `name`, `email`, `mobile`, `about`, `file_name`) VALUES
(13, 'Kamal Singh', 'kamalsingh123@gmail.com', '9999999999', 'Innocent Boy', 'kamal.jpg'),
(17, 'Kiran Jha', 'kiranjha123@gmail.com', '9999999999', 'Smart Girl', 'kiran.jpg'),
(14, 'Vineet Kumar', 'vineetkumar8bit@gmail.com', '8510800127', 'He is a totally GENIUS...', 'vineet.jpg'),
(12, 'Nikhil Kumar', 'nikhilkumar123@gmail.com', '8888888888', 'He is so Boring', 'nikhil.jpg'),
(15, 'Aryan Rai', 'aryanrai8bit@gmail.com', '8510800127', 'He is an Awesome Guy..', 'aryan.jpg'),
(16, 'Sonu Ram Viswash', 'sonuranviswash123@gmail.com', '8888888888', 'Smart Boy', 'sonu.jpg'),
(22, 'Unknown', 'unknown123@gmail.com', '9999999999', 'Totally Awesome', 'unknown.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `FirstName` varchar(30) NOT NULL,
  `LastName` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`FirstName`, `LastName`, `username`, `password`) VALUES
('vineet', 'kumar', 'vin8bit', '1234');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
