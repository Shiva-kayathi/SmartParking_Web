-- MySQL Script generated by MySQL Workbench
-- 02/18/15 12:57:20
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema parking
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parking
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parking` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `parking` ;

-- -----------------------------------------------------
-- Table `parking`.`plot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking`.`plot` (
  `idplot` INT NOT NULL,
  `capacity` INT NULL,
  `plotname` VARCHAR(45) NULL,
  PRIMARY KEY (`idplot`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking`.`slot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking`.`slot` (
  `idslot` INT NOT NULL,
  `slotname` VARCHAR(45) NULL,
  PRIMARY KEY (`idslot`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking`.`plot_has_slot`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking`.`plot_has_slot` (
  `plot_idplot` INT NOT NULL,
  `slot_idslot` INT NOT NULL,
  `status` TINYINT(1) NULL,
  PRIMARY KEY (`plot_idplot`, `slot_idslot`),
  INDEX `fk_plot_has_slot_slot1_idx` (`slot_idslot` ASC),
  INDEX `fk_plot_has_slot_plot_idx` (`plot_idplot` ASC),
  CONSTRAINT `fk_plot_has_slot_plot`
    FOREIGN KEY (`plot_idplot`)
    REFERENCES `parking`.`plot` (`idplot`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_plot_has_slot_slot1`
    FOREIGN KEY (`slot_idslot`)
    REFERENCES `parking`.`slot` (`idslot`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;