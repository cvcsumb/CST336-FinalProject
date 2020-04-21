-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: scooterdb
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `locations`
--
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `numOfDevices` int(3) NOT NULL,
  `api` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `numOfDevices`, `api`) VALUES
(1, 'Administration Building', '4', 'Sunny'),
(2, 'Agatha', 'Christie', '1890-09-15'),
(3, 'Marie', 'Curie', '1867-11-07'),
(4, 'Abraham', 'Lincoln', '1809-02-12'),
(5, 'Mohandas', 'Gandhi', '1869-10-02'),
(6, 'Helen', 'Keller', '1880-06-27'),
(7, 'Benjamin', 'Franklin', '1706-01-17');

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--
DROP TABLE IF EXISTS `pricing`;
CREATE TABLE `pricing` (
  `id` mediumint(9) NOT NULL,
  `price` float(9) NOT NULL,
  `tax` float(9) NOT NULL,
  `distance` float(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`id`, `price`, `tax`, `distance`) VALUES
(1, 'Albert', 'Einstein', '1879-03-14'),
(2, 'Agatha', 'Christie', '1890-09-15'),
(3, 'Marie', 'Curie', '1867-11-07'),
(4, 'Abraham', 'Lincoln', '1809-02-12'),
(5, 'Mohandas', 'Gandhi', '1869-10-02'),
(6, 'Helen', 'Keller', '1880-06-27'),
(7, 'Benjamin', 'Franklin', '1706-01-17');

LOCK TABLES `pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` mediumint(9) NOT NULL,
  `name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `password` varchar(25) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `age`, `password`) VALUES
(1, 'Albert', 'Einstein', 'email@email.com', 0, 'pass'),
(2, 'Agatha', 'Christie', 'email@email.com', 0, 'pass'),
(3, 'Marie', 'Curie', 'email@email.com', 0, 'pass'),
(4, 'Abraham', 'Lincoln', 'email@email.com', 0, 'pass'),
(5, 'Mohandas', 'Gandhi', 'email@email.com', 0, 'pass'),
(6, 'Helen', 'Keller', 'email@email.com', 0, 'pass'),
(7, 'Benjamin', 'Franklin', 'email@email.com', 0, 'pass');

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`id`);
  
--
-- Indexes for table `pricing`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `l9_quotes`
--
ALTER TABLE `pricing`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
  
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `users`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 14:50:10
