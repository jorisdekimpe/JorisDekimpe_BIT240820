-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `Gene_ID` INT UNSIGNED NOT NULL,
  `Gene_Name` VARCHAR(45) NOT NULL,
  `Gene_location` VARCHAR(45) NOT NULL,
  `Gene_decription` VARCHAR(45) NULL,
  PRIMARY KEY (`Gene_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `Mutation_ID` INT UNSIGNED NOT NULL,
  `Chromosomal_location` VARCHAR(45) NOT NULL,
  `Gene_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Mutation_ID`),
  INDEX `Gene_fk_idx` (`Gene_ID` ASC) VISIBLE,
  CONSTRAINT `Gene_fk`
    FOREIGN KEY (`Gene_ID`)
    REFERENCES `mydb`.`Gene` (`Gene_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `Patient_ID` INT UNSIGNED NOT NULL,
  `Patient_Name` VARCHAR(45) NOT NULL,
  `Sex` ENUM("M", "V") NOT NULL,
  `age_diagnose` INT NOT NULL,
  `Mutation_ID` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  INDEX `mutation_pk_idx` (`Mutation_ID` ASC) VISIBLE,
  CONSTRAINT `mutation_pk`
    FOREIGN KEY (`Mutation_ID`)
    REFERENCES `mydb`.`Mutation` (`Mutation_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
