-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: online_voting_system
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `AdminID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`AdminID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'Alice Cooper','alice.cooper@example.com','password123'),(2,'Bob Stevens','bob.stevens@example.com','bobPass2025'),(3,'Charlie Murphy','charlie.murphy@example.com','charlie@2024'),(4,'David King','david.king@example.com','kingPass!23'),(5,'Emily Smith','emily.smith@example.com','emily@admin456'),(6,'Fay Jenkins','fay.jenkins@example.com','fayAdmin2024'),(7,'George Clarke','george.clarke@example.com','george2025!'),(8,'Hannah Brown','hannah.brown@example.com','hannah@admin21'),(9,'Isaac Lee','isaac.lee@example.com','isaac2024pass'),(10,'Jessica White','jessica.white@example.com','jessica@admin123'),(11,'Kevin Taylor','kevin.taylor@example.com','kevinAdmin456'),(12,'Laura Adams','laura.adams@example.com','laura2025pass'),(13,'Michael Harris','michael.harris@example.com','michael@2024admin'),(14,'Nina Walker','nina.walker@example.com','ninaPass2025'),(15,'Olivia Davis','olivia.davis@example.com','olivia@admin2024'),(16,'Paul Scott','paul.scott@example.com','paul!admin456'),(17,'Quinn Jackson','quinn.jackson@example.com','quinnPass2025'),(18,'Rachel Williams','rachel.williams@example.com','rachelAdmin321'),(19,'Samuel Green','samuel.green@example.com','samuelAdmin2025'),(20,'Tina Moore','tina.moore@example.com','tinaPass!admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `CandidateID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Party_Name` varchar(100) DEFAULT NULL,
  `Position` varchar(100) DEFAULT NULL,
  `ElectionID` int DEFAULT NULL,
  `Votes_Received` int DEFAULT '0',
  PRIMARY KEY (`CandidateID`),
  KEY `ElectionID` (`ElectionID`),
  CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`ElectionID`) REFERENCES `election` (`ElectionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (1,'John Doe','Democratic Party','President',1,3500000),(2,'Jane Smith','Republican Party','President',1,3300000),(3,'Emily Johnson','Green Party','Senator',2,1200000),(4,'Michael Davis','Independent','Senator',2,800000),(5,'Sarah Lee','Democratic Party','Governor',3,2500000),(6,'Kevin Turner','Republican Party','Governor',3,2300000),(7,'Thomas Brown','Libertarian Party','Governor',3,500000),(8,'Olivia Walker','Democratic Party','Congresswoman',4,1800000),(9,'David Martinez','Republican Party','Congressman',4,1500000),(10,'Sophie Wilson','Democratic Party','Senator',5,2700000),(11,'Ethan Miller','Republican Party','Senator',5,2200000),(12,'Mason Harris','Green Party','Mayor',6,900000),(13,'Charlotte Scott','Democratic Party','Mayor',6,1300000),(14,'Daniel Green','Republican Party','Mayor',6,1100000),(15,'Ava Thompson','Independent','City Councilor',7,800000),(16,'William Clark','Republican Party','City Councilor',7,950000),(17,'Lucas Young','Democratic Party','City Councilor',7,1200000),(18,'Chloe Adams','Libertarian Party','Governor',8,400000),(19,'Benjamin Harris','Democratic Party','President',9,3600000),(20,'Samantha White','Republican Party','President',9,3400000);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election`
--

DROP TABLE IF EXISTS `election`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `election` (
  `ElectionID` int NOT NULL AUTO_INCREMENT,
  `Election_Name` varchar(100) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date NOT NULL,
  `Status` enum('Upcoming','ongoing','completed') DEFAULT (_utf8mb4'Upcoming'),
  PRIMARY KEY (`ElectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election`
--

LOCK TABLES `election` WRITE;
/*!40000 ALTER TABLE `election` DISABLE KEYS */;
INSERT INTO `election` VALUES (1,'2024 Presidential Election','2024-11-01','2024-11-03','Upcoming'),(2,'2024 Senate Election','2024-09-10','2024-09-12','Upcoming'),(3,'2024 Gubernatorial Election','2024-10-01','2024-10-05','Upcoming'),(4,'2023 Local Elections','2023-05-15','2023-05-16','completed'),(5,'2023 Mayoral Election','2023-11-01','2023-11-02','completed'),(6,'2024 Congressional Elections','2024-06-01','2024-06-03','Upcoming'),(7,'2025 Presidential Election','2025-11-01','2025-11-03','Upcoming'),(8,'2023 State Election','2023-07-01','2023-07-02','completed'),(9,'2024 City Council Elections','2024-02-01','2024-02-02','Upcoming'),(10,'2025 Senate Election','2025-09-10','2025-09-12','Upcoming'),(11,'2024 National Election','2024-12-01','2024-12-03','Upcoming'),(12,'2023 County Election','2023-10-15','2023-10-16','completed'),(13,'2023 Parliamentary Election','2023-04-20','2023-04-22','completed'),(14,'2024 General Election','2024-08-01','2024-08-03','Upcoming'),(15,'2025 Local Elections','2025-05-15','2025-05-16','Upcoming'),(16,'2024 District Election','2024-09-01','2024-09-03','Upcoming'),(17,'2025 Gubernatorial Election','2025-10-01','2025-10-05','Upcoming'),(18,'2023 National Election','2023-11-01','2023-11-03','completed'),(19,'2024 National Assembly Election','2024-04-10','2024-04-12','Upcoming'),(20,'2025 Mayor Election','2025-06-01','2025-06-02','Upcoming');
/*!40000 ALTER TABLE `election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote` (
  `VoteID` int NOT NULL AUTO_INCREMENT,
  `VoterID` int DEFAULT NULL,
  `CandidateID` int DEFAULT NULL,
  `ElectionID` int DEFAULT NULL,
  `Vote_Time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`VoteID`),
  KEY `VoterID` (`VoterID`),
  KEY `CandidateID` (`CandidateID`),
  KEY `ElectionID` (`ElectionID`),
  CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`VoterID`) REFERENCES `voter` (`VoterID`) ON DELETE CASCADE,
  CONSTRAINT `vote_ibfk_2` FOREIGN KEY (`CandidateID`) REFERENCES `candidate` (`CandidateID`) ON DELETE CASCADE,
  CONSTRAINT `vote_ibfk_3` FOREIGN KEY (`ElectionID`) REFERENCES `election` (`ElectionID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES (1,1,1,1,'2024-11-01 15:15:00'),(2,2,2,1,'2024-11-01 16:00:00'),(3,3,3,2,'2024-09-10 17:30:00'),(4,4,4,2,'2024-09-10 18:00:00'),(5,5,5,3,'2024-10-02 19:00:00'),(6,6,6,3,'2024-10-02 19:30:00'),(7,7,7,4,'2024-02-01 17:45:00'),(8,8,8,4,'2024-02-01 18:00:00'),(9,9,9,5,'2024-08-01 21:15:00'),(10,10,10,5,'2024-08-01 21:45:00'),(11,11,11,6,'2023-11-01 22:30:00'),(12,12,12,6,'2023-11-01 23:00:00'),(13,13,13,7,'2023-10-15 16:00:00'),(14,14,14,7,'2023-10-15 16:30:00'),(15,15,15,8,'2024-09-01 19:00:00'),(16,16,16,8,'2024-09-01 19:45:00'),(17,17,17,9,'2024-04-10 17:00:00'),(18,18,18,9,'2024-04-10 17:30:00'),(19,19,19,10,'2024-06-01 20:30:00'),(20,20,20,10,'2024-06-01 21:00:00');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voter`
--

DROP TABLE IF EXISTS `voter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voter` (
  `VoterID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Age` int DEFAULT NULL,
  `Gender` enum('Male','Female','others') DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `HasVoted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`VoterID`),
  UNIQUE KEY `Email` (`Email`),
  CONSTRAINT `voter_chk_1` CHECK ((`Age` >= 18))
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voter`
--

LOCK TABLES `voter` WRITE;
/*!40000 ALTER TABLE `voter` DISABLE KEYS */;
INSERT INTO `voter` VALUES (1,'Alice Johnson',25,'Female','123 Elm St, Springfield','alice.johnson@example.com','password123',0),(2,'Bob Smith',32,'Male','456 Oak Ave, Lincoln','bob.smith@example.com','mypassword321',1),(3,'Charlie Brown',19,'Male','789 Pine Rd, Greenfield','charlie.brown@example.com','password@2025',0),(4,'David Lee',40,'Male','101 Maple Blvd, Rivertown','david.lee@example.com','davidPass123',1),(5,'Emma Williams',28,'Female','202 Birch Ln, Lakeside','emma.williams@example.com','emmapass@321',0),(6,'Fay Patel',22,'Female','303 Cedar Dr, Hillview','fay.patel@example.com','fay1234',1),(7,'George Clark',35,'Male','404 Walnut St, Westwood','george.clark@example.com','georgepass123',1),(8,'Hannah Kim',31,'Female','505 Ash Rd, Oak City','hannah.kim@example.com','han1234',0),(9,'Isaac Stone',26,'Male','606 Pine Ct, Rockdale','isaac.stone@example.com','isaac2025pass',1),(10,'Jessica Martin',30,'Female','707 Maple St, Clearview','jessica.martin@example.com','jessica@456',1),(11,'Kylie Davis',21,'Female','808 Cedar Blvd, Sunnyside','kylie.davis@example.com','kylie21@pass',0),(12,'Liam Taylor',34,'Male','909 Oak Dr, Forest Glen','liam.taylor@example.com','liam2025@123',1),(13,'Mia Thompson',24,'Female','1010 Birch Ave, Riverside','mia.thompson@example.com','mia@1234',0),(14,'Nathan Walker',38,'Male','1111 Maple Rd, Silverlake','nathan.walker@example.com','nathanpass22',1),(15,'Olivia Scott',27,'Female','1212 Pine Ave, Northwood','olivia.scott@example.com','olivia@321',0),(16,'Paul Adams',29,'Male','1313 Oak Ln, Briarwood','paul.adams@example.com','paulpass2025',0),(17,'Quinn Murphy',33,'others','1414 Cedar St, Fairview','quinn.murphy@example.com','quinn1234',1),(18,'Rachel Moore',42,'Female','1515 Ash Blvd, Highland','rachel.moore@example.com','rachel@pass',1),(19,'Samuel Green',23,'Male','1616 Birch Rd, Mountainview','samuel.green@example.com','samuelpass@23',0),(20,'Tina Clark',27,'Female','1717 Pine Blvd, Meadowbrook','tina.clark@example.com','tina@321pass',1);
/*!40000 ALTER TABLE `voter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'online_voting_system'
--
/*!50003 DROP PROCEDURE IF EXISTS `EligibleVotersCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `EligibleVotersCount`()
BEGIN
        SELECT COUNT(*) AS Eligible_Voters
        FROM Voter
        WHERE Age >= 18;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdminDetails` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdminDetails`()
BEGIN
        SELECT Name, Email
        FROM Admin;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCandidatesByParty` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCandidatesByParty`(IN election_id INT, IN party_name VARCHAR(100))
BEGIN
        SELECT Name
        FROM Candidate
        WHERE Party_Name = party_name AND ElectionID = election_id;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompletedElections` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompletedElections`()
BEGIN
        SELECT Election_Name, Start_Date, End_Date
        FROM Election
        WHERE Status = 'Completed';
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOngoingElections` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOngoingElections`()
BEGIN
        SELECT Election_Name, Start_Date, End_Date
        FROM Election
        WHERE Status = 'Ongoing';
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUnderageVoters` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUnderageVoters`()
BEGIN
        SELECT VoterID, Name, Age, Email
        FROM Voter
        WHERE Age < 18;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVotersNotVoted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVotersNotVoted`(IN election_id INT)
BEGIN
        SELECT v.VoterID, v.Name, v.Email
        FROM Voter v
        LEFT JOIN Vote vo ON v.VoterID = vo.VoterID AND vo.ElectionID = election_id
        WHERE v.HasVoted = FALSE OR vo.VoteID IS NULL;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVotersWhoVoted` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVotersWhoVoted`(IN election_id INT)
BEGIN
        SELECT v.VoterID, v.Name, v.Email
        FROM Voter v
        JOIN Vote vo ON v.VoterID = vo.VoterID
        WHERE vo.ElectionID = election_id AND v.HasVoted = TRUE;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVotesPerCandidate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVotesPerCandidate`(IN election_id INT)
BEGIN
        SELECT c.Name AS Candidate_Name, c.votes_received AS Votes_Received
        from candidate c
        WHERE c.ElectionID = election_id;
	
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Top_Candidate_In_Election` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Top_Candidate_In_Election`(IN election_id INT)
BEGIN
        SELECT c.Name, c.Party_Name,c.position, votes_received
        FROM Vote v
        JOIN Candidate c ON v.CandidateID = c.CandidateID
        WHERE v.ElectionID = election_id
        GROUP BY c.CandidateID
        ORDER BY votes_received DESC
        LIMIT 1;
    END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-03 21:48:21
