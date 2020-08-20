-- 870116 MUNA PARIDA
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Schema truyum
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `truyum` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `truyum` ;

-- -----------------------------------------------------
-- Table `truyum`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `truyum`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_name` VARCHAR(60) NULL,
  PRIMARY KEY (`user_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `truyum`.`menu_item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `truyum`.`menu_item` (
  `menu_id` INT NOT NULL AUTO_INCREMENT,
  `menu_name` VARCHAR(100) NULL,
  `menu_price` DECIMAL(8,2) NULL,
  `menu_active` BIT NULL,
  `menu_dol` DATE NULL,
  `menu_category` VARCHAR(45) NULL,
  `menu_free_delivery` BIT NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `truyum`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `truyum`.`cart` (
  `cart_id` INT NOT NULL AUTO_INCREMENT,
  `cart_us_id` INT NULL,
  `cart_pr_id` INT NULL,
  PRIMARY KEY (`cart_id`),
  INDEX `cart_us_fk_idx` (`cart_us_id` ASC),
  INDEX `cart_pr_fk_idx` (`cart_pr_id` ASC),
  CONSTRAINT `cart_us_fk`
    FOREIGN KEY (`cart_us_id`)
    REFERENCES `truyum`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cart_pr_fk`
    FOREIGN KEY (`cart_pr_id`)
    REFERENCES `truyum`.`menu_item` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;