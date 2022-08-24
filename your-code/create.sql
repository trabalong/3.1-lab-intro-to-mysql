-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`cars` (
  `id` INT NOT NULL,
  `vin` VARCHAR(255) NULL DEFAULT NULL,
  `manufacturer` VARCHAR(50) NULL DEFAULT NULL,
  `model` VARCHAR(50) NULL DEFAULT NULL,
  `year` INT NULL DEFAULT NULL,
  `colour` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`customers` (
  `id` INT NOT NULL,
  `c_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  `phone` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `address` VARCHAR(25) NULL DEFAULT NULL,
  `city` VARCHAR(25) NULL DEFAULT NULL,
  `state` VARCHAR(25) NULL DEFAULT NULL,
  `country` VARCHAR(25) NULL DEFAULT NULL,
  `postal` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salespersons` (
  `id` INT NOT NULL,
  `s_id` VARCHAR(25) NULL DEFAULT NULL,
  `name` VARCHAR(25) NULL DEFAULT NULL,
  `store` VARCHAR(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoices` (
  `id` INT NOT NULL,
  `i_id` INT NULL DEFAULT NULL,
  `date` VARCHAR(25) NULL DEFAULT NULL,
  `car` INT NOT NULL,
  `customer` INT NOT NULL,
  `salesperson` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `customer` (`customer` ASC) VISIBLE,
  INDEX `salesperson` (`salesperson` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`car` ASC) VISIBLE,
  CONSTRAINT `invoices_ibfk_1`
    FOREIGN KEY (`customer`)
    REFERENCES `lab_mysql`.`customers` (`id`),
  CONSTRAINT `invoices_ibfk_2`
    FOREIGN KEY (`salesperson`)
    REFERENCES `lab_mysql`.`salespersons` (`id`),
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`car`)
    REFERENCES `lab_mysql`.`cars` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
