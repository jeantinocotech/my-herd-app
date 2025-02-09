-- MySQLShell dump 2.0.1  Distrib Ver 9.1.0 for macos14 on arm64 - for MySQL 9.1.0 (MySQL Community Server (GPL)), for macos14 (arm64)
--
-- Host: localhost    Database: profisa    Table: education
-- ------------------------------------------------------
-- Server version	8.0.40

--
-- Table structure for table `education`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE IF NOT EXISTS `education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Institution_name` varchar(45) DEFAULT NULL,
  `id_courses` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `FK_id_courses_education_idx` (`id_courses`),
  CONSTRAINT `FK_id_courses_education` FOREIGN KEY (`id_courses`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
