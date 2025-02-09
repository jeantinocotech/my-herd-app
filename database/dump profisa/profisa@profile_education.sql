-- MySQLShell dump 2.0.1  Distrib Ver 9.1.0 for macos14 on arm64 - for MySQL 9.1.0 (MySQL Community Server (GPL)), for macos14 (arm64)
--
-- Host: localhost    Database: profisa    Table: profile_education
-- ------------------------------------------------------
-- Server version	8.0.40

--
-- Table structure for table `profile_education`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `profile_education` (
  `id_profiles_education` int NOT NULL AUTO_INCREMENT,
  `id_profiles_advisor` int DEFAULT NULL,
  `id_profiles_finder` int DEFAULT NULL,
  `id_education` int DEFAULT NULL,
  `Certification` varchar(45) DEFAULT NULL,
  `dt_start` datetime DEFAULT NULL,
  `dt_end` datetime DEFAULT NULL,
  `comments` text,
  PRIMARY KEY (`id_profiles_education`),
  KEY `FK_educaiton_idx` (`id_education`),
  KEY `FK_profile_idx` (`id_profiles_advisor`),
  KEY `FK_profiles_finder_idx` (`id_profiles_finder`),
  CONSTRAINT `FK_educaiton` FOREIGN KEY (`id_education`) REFERENCES `education` (`id`),
  CONSTRAINT `FK_profile_advisor` FOREIGN KEY (`id_profiles_advisor`) REFERENCES `profiles_advisor` (`id`),
  CONSTRAINT `FK_profiles_finder` FOREIGN KEY (`id_profiles_finder`) REFERENCES `profiles_finder` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
