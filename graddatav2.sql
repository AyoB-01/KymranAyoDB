CREATE DATABASE  IF NOT EXISTS `grad_data_group_1` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `grad_data_group_1`;
-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: localhost    Database: grad_data_group_1
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `cohort`
--

DROP TABLE IF EXISTS `cohort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cohort` (
  `cohortID` int NOT NULL AUTO_INCREMENT,
  `cohort_name` varchar(50) NOT NULL,
  PRIMARY KEY (`cohortID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cohort`
--

LOCK TABLES `cohort` WRITE;
/*!40000 ALTER TABLE `cohort` DISABLE KEYS */;
INSERT INTO `cohort` VALUES (1,'Hybrid Engineering - 1'),(2,'Hybrid Engineering - 2'),(3,'SuperTech');
/*!40000 ALTER TABLE `cohort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeID` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `cohortID` int NOT NULL,
  `locationID` int NOT NULL,
  PRIMARY KEY (`employeeID`),
  KEY `cohortID` (`cohortID`),
  KEY `locationID` (`locationID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`cohortID`) REFERENCES `cohort` (`cohortID`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Zubin','Paul','zubin.paul@sky.uk',3,2),(2,'Ayooluwa','Babalola','ayooluwa.babalola@sky.uk',3,2),(3,'Karishma','Vijay','karishma.vijay@sky.uk',3,1),(4,'Arash','Heydary','arash.heydary@sky.uk',3,1),(5,'Harry','Taylor','harry.taylor3@sky.uk',2,1),(6,'Taran','Che','taran.che@sky.uk',1,2),(7,'Saranya Lakshmi','Arul Jayakumar','saranyalakshmi.aruljayakumar@sky.uk',2,1),(8,'Ben','Lawson','ben.lawson@sky.uk',3,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_funfacts`
--

DROP TABLE IF EXISTS `employee_funfacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_funfacts` (
  `employeeID` int NOT NULL,
  `funfactID` int NOT NULL,
  KEY `employeeID` (`employeeID`),
  KEY `funfactID` (`funfactID`),
  CONSTRAINT `employee_funfacts_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `employee_funfacts_ibfk_2` FOREIGN KEY (`funfactID`) REFERENCES `fun_fact` (`funfactID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_funfacts`
--

LOCK TABLES `employee_funfacts` WRITE;
/*!40000 ALTER TABLE `employee_funfacts` DISABLE KEYS */;
INSERT INTO `employee_funfacts` VALUES (1,1),(2,2),(3,3),(4,4),(4,5),(5,6),(6,7),(7,8),(8,9);
/*!40000 ALTER TABLE `employee_funfacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_hobby`
--

DROP TABLE IF EXISTS `employee_hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_hobby` (
  `employeeID` int NOT NULL,
  `hobbyID` int NOT NULL,
  KEY `employeeID` (`employeeID`),
  KEY `hobbyID` (`hobbyID`),
  CONSTRAINT `employee_hobby_ibfk_1` FOREIGN KEY (`employeeID`) REFERENCES `employee` (`employeeID`),
  CONSTRAINT `employee_hobby_ibfk_2` FOREIGN KEY (`hobbyID`) REFERENCES `hobby` (`hobbyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_hobby`
--

LOCK TABLES `employee_hobby` WRITE;
/*!40000 ALTER TABLE `employee_hobby` DISABLE KEYS */;
INSERT INTO `employee_hobby` VALUES (1,1),(1,2),(1,4),(1,5),(2,1),(2,6),(3,1),(3,17),(3,7),(4,8),(4,6),(4,9),(4,10),(4,7),(5,11),(5,12),(6,15),(6,16),(7,11),(8,13),(8,14);
/*!40000 ALTER TABLE `employee_hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fun_fact`
--

DROP TABLE IF EXISTS `fun_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fun_fact` (
  `funfactID` int NOT NULL AUTO_INCREMENT,
  `fact` text,
  PRIMARY KEY (`funfactID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fun_fact`
--

LOCK TABLES `fun_fact` WRITE;
/*!40000 ALTER TABLE `fun_fact` DISABLE KEYS */;
INSERT INTO `fun_fact` VALUES (1,'Won \'Best Original Score\' award in an international film festival'),(2,'Have piloted a plane'),(3,'skilled at robbing ldn muggers back for my belongings'),(4,'Top 1.03% in Valorant in Europe.'),(5,'Can fit through tight spaces at 70mph.'),(6,'Entered Beauty pageant as a child'),(7,'Have been amongst Top 200 Table tennis players in UK.'),(8,'Amazing Indian classical dancer'),(9,'Bungee jumped off a bridge in Australia');
/*!40000 ALTER TABLE `fun_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hobby`
--

DROP TABLE IF EXISTS `hobby`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hobby` (
  `hobbyID` int NOT NULL AUTO_INCREMENT,
  `hobby_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`hobbyID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hobby`
--

LOCK TABLES `hobby` WRITE;
/*!40000 ALTER TABLE `hobby` DISABLE KEYS */;
INSERT INTO `hobby` VALUES (1,'Music'),(2,'Movies'),(3,'Films'),(4,'Making Music'),(5,'Making Movies'),(6,'Football'),(7,'Travelling'),(8,'Basketball'),(9,'Driving'),(10,'Gaming'),(11,'Coding'),(12,'Sleeping'),(13,'Scuba Diving'),(14,'Golf'),(15,'Freestyle Dancing'),(16,'Gokarting'),(17,'Photography');
/*!40000 ALTER TABLE `hobby` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `locationID` int NOT NULL AUTO_INCREMENT,
  `office_location` varchar(50) NOT NULL,
  PRIMARY KEY (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
INSERT INTO `location` VALUES (1,'Osterley'),(2,'Livingston'),(3,'Leeds'),(4,'Osterley'),(5,'Livingston'),(6,'Leeds');
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-25 11:33:12
