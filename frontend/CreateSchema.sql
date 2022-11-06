-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Fillboard
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Fillboard
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Fillboard` DEFAULT CHARACTER SET utf8 ;
USE `Fillboard` ;

-- -----------------------------------------------------
-- Table `Fillboard`.`fillboard_user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fillboard`.`fillboard_user` (
  `id_fillboard_user` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `birthday` VARCHAR(45) NULL,
  `gender` VARCHAR(45) NULL,
  `biography` VARCHAR(200) NULL,
  PRIMARY KEY (`id_fillboard_user`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fillboard`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fillboard`.`category` (
  `id_category` INT NOT NULL AUTO_INCREMENT,
  `category_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fillboard`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fillboard`.`event` (
  `id_event` INT NOT NULL AUTO_INCREMENT,
  `event_name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NULL,
  `begin_date` VARCHAR(45) NOT NULL,
  `end_date` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id_event`, `category_id`),
  INDEX `fk_event_category1_idx` (`category_id` ASC),
  CONSTRAINT `fk_event_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `Fillboard`.`category` (`id_category`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fillboard`.`participates`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fillboard`.`participates` (
  `user_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `event_id`),
  INDEX `fk_fillboard_user_has_event_event1_idx` (`event_id` ASC),
  INDEX `fk_fillboard_user_has_event_fillboard_user_idx` (`user_id` ASC),
  CONSTRAINT `fk_fillboard_user_has_event_fillboard_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `Fillboard`.`fillboard_user` (`id_fillboard_user`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fillboard_user_has_event_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `Fillboard`.`event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Fillboard`.`posts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Fillboard`.`posts` (
  `idposts` INT NOT NULL AUTO_INCREMENT,
  `heading` VARCHAR(45) NOT NULL,
  `post_text` VARCHAR(200) NOT NULL,
  `event_id` INT NOT NULL,
  PRIMARY KEY (`idposts`, `event_id`),
  INDEX `fk_posts_event1_idx` (`event_id` ASC),
  CONSTRAINT `fk_posts_event1`
    FOREIGN KEY (`event_id`)
    REFERENCES `Fillboard`.`event` (`id_event`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
