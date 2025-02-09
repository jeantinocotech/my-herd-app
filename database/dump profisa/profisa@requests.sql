-- MySQLShell dump 2.0.1  Distrib Ver 9.1.0 for macos14 on arm64 - for MySQL 9.1.0 (MySQL Community Server (GPL)), for macos14 (arm64)
--
-- Host: localhost    Database: profisa    Table: requests
-- ------------------------------------------------------
-- Server version	8.0.40

--
-- Table structure for table `requests`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` enum('pending','approved','declined') DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_profiles_advisor` int DEFAULT NULL,
  `id_profiles_finder` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_requests_advisor_idx` (`id_profiles_advisor`),
  KEY `FK_requests_finder_idx` (`id_profiles_finder`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
