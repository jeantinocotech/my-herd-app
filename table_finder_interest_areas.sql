-- -----------------------------------------------------
-- Table `my_herd_app`.`finder_interest_areas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my_herd_app`.`finder_interest_areas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_courses` INT NULL,
  `id_profiles_finder` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_courses_idx` (`id_courses` ASC) VISIBLE,
  INDEX `FK_finder_idx` (`id_profiles_finder` ASC) VISIBLE,
  CONSTRAINT `FK_courses_finder_areas`
    FOREIGN KEY (`id_courses`)
    REFERENCES `my_herd_app`.`courses` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_finder_areas`
    FOREIGN KEY (`id_profiles_finder`)
    REFERENCES `my_herd_app`.`profiles_finder` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
