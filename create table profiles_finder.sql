CREATE TABLE `profiles_finder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `full_name` varchar(45) NOT NULL,
  `profile_picture` varchar(45) DEFAULT NULL,
  `linkedin_url` varchar(45) DEFAULT NULL,
  `instagram_url` varchar(45) DEFAULT NULL,
  `overview` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `profile_completed` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_user_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `courses_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `Institution_name` varchar(45) DEFAULT NULL,
  `id_courses` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_couses` (`id_courses`),
  CONSTRAINT `FK_Courses_Id_course` FOREIGN KEY (`id_courses`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
