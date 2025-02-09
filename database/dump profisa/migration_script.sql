-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: profisa
-- Source Schemata: profisa
-- Created: Thu Jan 23 17:03:12 2025
-- Workbench Version: 8.0.40
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema profisa
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `profisa` ;
CREATE SCHEMA IF NOT EXISTS `profisa` ;

-- ----------------------------------------------------------------------------
-- Table profisa.courses
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`courses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `courses_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `idcourses_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 31
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table profisa.education
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`education` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `Institution_name` VARCHAR(45) NULL DEFAULT NULL,
  `id_courses` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `FK_id_courses_education_idx` (`id_courses` ASC) VISIBLE,
  CONSTRAINT `FK_id_courses_education`
    FOREIGN KEY (`id_courses`)
    REFERENCES `profisa`.`courses` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table profisa.logs
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`logs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `action` VARCHAR(255) NOT NULL,
  `timestamp` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table profisa.profile_education
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`profile_education` (
  `id_profiles_education` INT NOT NULL AUTO_INCREMENT,
  `id_profiles_advisor` INT NULL DEFAULT NULL,
  `id_profiles_finder` INT NULL DEFAULT NULL,
  `id_education` INT NULL DEFAULT NULL,
  `Certification` VARCHAR(45) NULL DEFAULT NULL,
  `dt_start` DATETIME NULL DEFAULT NULL,
  `dt_end` DATETIME NULL DEFAULT NULL,
  `comments` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id_profiles_education`),
  INDEX `FK_educaiton_idx` (`id_education` ASC) VISIBLE,
  INDEX `FK_profile_idx` (`id_profiles_advisor` ASC) VISIBLE,
  INDEX `FK_profiles_finder_idx` (`id_profiles_finder` ASC) VISIBLE,
  CONSTRAINT `FK_educaiton`
    FOREIGN KEY (`id_education`)
    REFERENCES `profisa`.`education` (`id`),
  CONSTRAINT `FK_profile_advisor`
    FOREIGN KEY (`id_profiles_advisor`)
    REFERENCES `profisa`.`profiles_advisor` (`id`),
  CONSTRAINT `FK_profiles_finder`
    FOREIGN KEY (`id_profiles_finder`)
    REFERENCES `profisa`.`profiles_finder` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 37
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table profisa.profiles_advisor
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`profiles_advisor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `full_name` VARCHAR(45) NOT NULL,
  `profile_picture` VARCHAR(255) NULL DEFAULT NULL,
  `linkedin_url` VARCHAR(45) NULL DEFAULT NULL,
  `instagram_url` VARCHAR(45) NULL DEFAULT NULL,
  `overview` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `profile_completed` TINYINT(1) NULL DEFAULT NULL,
  `is_active` TINYINT(1) NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  INDEX `FK_profile_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_profile_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `profisa`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table profisa.profiles_finder
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`profiles_finder` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `full_name` VARCHAR(45) NOT NULL,
  `profile_picture` VARCHAR(45) NULL DEFAULT NULL,
  `linkedin_url` VARCHAR(45) NULL DEFAULT NULL,
  `instagram_url` VARCHAR(45) NULL DEFAULT NULL,
  `overview` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `profile_completed` TINYINT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_profile_user_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_profile_user2`
    FOREIGN KEY (`user_id`)
    REFERENCES `profisa`.`users` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table profisa.requests
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`requests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` ENUM('pending', 'approved', 'declined') NULL DEFAULT 'pending',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_profiles_advisor` INT NULL DEFAULT NULL,
  `id_profiles_finder` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_requests_advisor_idx` (`id_profiles_advisor` ASC) VISIBLE,
  INDEX `FK_requests_finder_idx` (`id_profiles_finder` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

-- ----------------------------------------------------------------------------
-- Table profisa.users
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `profisa`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 67
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;
SET FOREIGN_KEY_CHECKS = 1;
