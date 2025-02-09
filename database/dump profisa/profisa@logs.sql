-- MySQLShell dump 2.0.1  Distrib Ver 9.1.0 for macos14 on arm64 - for MySQL 9.1.0 (MySQL Community Server (GPL)), for macos14 (arm64)
--
-- Host: localhost    Database: profisa    Table: logs
-- ------------------------------------------------------
-- Server version	8.0.40

--
-- Table structure for table `logs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
