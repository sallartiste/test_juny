-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema prepatestjuin
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `prepatestjuin` ;

-- -----------------------------------------------------
-- Schema prepatestjuin
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `prepatestjuin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `prepatestjuin` ;

-- -----------------------------------------------------
-- Table `prepatestjuin`.`droit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prepatestjuin`.`droit` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lenom` VARCHAR(45) NULL,
  `ladesc` VARCHAR(255) NULL,
  `laperm` TINYINT UNSIGNED NULL DEFAULT 2,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prepatestjuin`.`utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prepatestjuin`.`utilisateur` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lelogin` VARCHAR(45) NULL,
  `lemdp` VARCHAR(45) NULL,
  `lemail` VARCHAR(150) NULL,
  `lenom` VARCHAR(160) NULL,
  `lactif` TINYINT(1) NULL DEFAULT 0,
  `ladate` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `laclef` VARCHAR(32) NULL,
  `droit_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `lelogin_UNIQUE` (`lelogin` ASC),
  INDEX `fk_utilisateur_droit_idx` (`droit_id` ASC),
  CONSTRAINT `fk_utilisateur_droit`
    FOREIGN KEY (`droit_id`)
    REFERENCES `prepatestjuin`.`droit` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `prepatestjuin`.`photo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prepatestjuin`.`photo` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lenom` CHAR(25) NULL,
  `letype` CHAR(3) NULL,
  `lepoids` INT UNSIGNED NULL,
  `lahauteur` SMALLINT UNSIGNED NULL,
  `lalargeur` SMALLINT UNSIGNED NULL,
  `letitre` VARCHAR(60) NULL,
  `ladesc` VARCHAR(255) NULL,
  `utilisateur_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `lenom_UNIQUE` (`lenom` ASC),
  INDEX `fk_photo_utilisateur1_idx` (`utilisateur_id` ASC),
  CONSTRAINT `fk_photo_utilisateur1`
    FOREIGN KEY (`utilisateur_id`)
    REFERENCES `prepatestjuin`.`utilisateur` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
