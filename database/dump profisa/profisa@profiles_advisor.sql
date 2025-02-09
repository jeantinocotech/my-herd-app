-- MySQLShell dump 2.0.1  Distrib Ver 9.1.0 for macos14 on arm64 - for MySQL 9.1.0 (MySQL Community Server (GPL)), for macos14 (arm64)
--
-- Host: localhost    Database: profisa    Table: profiles_advisor
-- ------------------------------------------------------
-- Server version	8.0.40

--
-- Table structure for table `profiles_advisor`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `profiles_advisor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(45) DEFAULT NULL,
  `instagram_url` varchar(45) DEFAULT NULL,
  `overview` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `profile_completed` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `FK_profile_user_idx` (`user_id`),
  CONSTRAINT `FK_profile_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
