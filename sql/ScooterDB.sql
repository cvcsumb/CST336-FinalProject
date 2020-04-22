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
(1, 'Administration Building', 4, 'Sunny'),
(2, 'Alumni & Visitors Center', 8, 'Rain'),
(3, 'Beach Hall', 13, 'Sunny'),
(4, 'Black Box Cabaret', 18, 'Cloudy'),
(5, 'Chapman Science Academic Center', 16, 'Cloudy'),
(6, 'College of Arts, Humanities, and Social Sciences', 4, 'Rain'),
(7, 'Cinematic Arts & Technology', 9, 'Sunny'),
(8, 'Coast Hall', 2, 'Cloudy'),
(9, 'Del Mar', 20, 'Rain'),
(10, 'Dining Commons', 3, 'Sunny'),
(11, 'Dunes Hall', 5, 'Cloudy'),
(12, 'Facilities Services & Operations', 6, 'Sunny'),
(13, 'Gambord Business Information & Technology', 11, 'Rain'),
(14, 'Gavilan Hall', 1, 'Cloudy'),
(15, 'Green Hall', 5, 'Sunny'),
(16, 'Harbor Hall', 4, 'Rain'),
(17, 'Manzanita Hall', 8, 'Sunny'),
(18, 'Promontory – West', 12, 'Rain'),
(19, 'Promontory – Center', 15, 'Sunny'),
(20, 'Vineyard Suites', 1, 'Cloudy');

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
(1, 'Geoffrey Delgado', 'gdun', 'email@email.com', 42, 'gdpass'),
(2, 'Nick Patterson', 'npun', 'email@email.com', 15, 'nppass'),
(3, 'Simon Ward', 'swun', 'email@email.com', 31, 'swpass'),
(4, 'Kristy Lucas', 'klun', 'email@email.com', 99, 'klpass'),
(5, 'Craig Miller', 'cmun', 'email@email.com', 23, 'cmpass'),
(6, 'Joanne Barton', 'jbun', 'email@email.com', 42, 'jbpass'),
(7, 'Helen Sanders', 'hsun', 'email@email.com', 50, 'hspass'),
(8, 'Jimmy Tucker', 'jtun', 'email@email.com', 18, 'jtpass'),
(9, 'Sara Vega', 'svun', 'email@email.com', 76, 'svpass'),
(10, 'Vincent Rowe', 'vrun', 'email@email.com', 19, 'vrpass'),
(11, 'Madeline Ramsey', 'mrun', 'email@email.com', 34, 'mrpass'),
(12, 'Bradford Moody', 'bmun', 'email@email.com', 46, 'bmpass'),
(13, 'Billie Walker', 'bwun', 'email@email.com', 23, 'bwpass'),
(14, 'Richard Wilkerson', 'rwun', 'email@email.com', 27, 'rwpass'),
(15, 'Stacy Lewis', 'slun', 'email@email.com', 67, 'slpass'),
(16, 'Ginger Mitchell', 'gmun', 'email@email.com', 43, 'gmpass'),
(17, 'Felix Webster', 'fwun', 'email@email.com', 22, 'fwpass'),
(18, 'Miriam Hansen', 'mhun', 'email@email.com', 33, 'mhpass'),
(19, 'June Flores', 'jfun', 'email@email.com', 88, 'jfpass'),
(20, 'Derek Reese', 'drun', 'email@email.com', 17, 'drpass');

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
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `l9_quotes`
--
ALTER TABLE `pricing`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
  
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `users`
  MODIFY `id` mediumint(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-20 14:50:10
