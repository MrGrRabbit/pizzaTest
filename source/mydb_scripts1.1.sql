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
-- Table `mydb`.`Pizzas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pizzas` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` FLOAT NOT NULL,
  `description` VARCHAR(255) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Extras`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Extras` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `price` FLOAT NULL,
  `isChoosable` TINYINT(2) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pizza_has_Extra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pizza_has_Extra` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Pizzen_ID` INT NOT NULL,
  `Extras_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Pizza_has_Extra_Pizzen_idx` (`Pizzen_ID` ASC) VISIBLE,
  INDEX `fk_Pizza_has_Extra_Extras1_idx` (`Extras_ID` ASC) VISIBLE,
  UNIQUE INDEX `Pizzen_ID_UNIQUE` (`Pizzen_ID` ASC) VISIBLE,
  UNIQUE INDEX `Extras_ID_UNIQUE` (`Extras_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Pizza_has_Extra_Pizzen`
    FOREIGN KEY (`Pizzen_ID`)
    REFERENCES `mydb`.`Pizzas` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pizza_has_Extra_Extras1`
    FOREIGN KEY (`Extras_ID`)
    REFERENCES `mydb`.`Extras` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `ID` INT NOT NULL,
  `firstname` VARCHAR(45) NULL,
  `lastname` VARCHAR(45) NULL,
  `street` VARCHAR(45) NULL,
  `streetnumber` VARCHAR(45) NULL,
  `zip` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `phone` INT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Order` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `timestamp` TIMESTAMP NULL,
  `Customer_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Order_Customer1_idx` (`Customer_ID` ASC) VISIBLE,
  UNIQUE INDEX `Customer_ID_UNIQUE` (`Customer_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Order_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `mydb`.`Customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderItems` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `quantity` INT NULL,
  `Order_ID` INT NOT NULL,
  `Pizzen_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_OrderItems_Order1_idx` (`Order_ID` ASC) VISIBLE,
  INDEX `fk_OrderItems_Pizzen1_idx` (`Pizzen_ID` ASC) VISIBLE,
  UNIQUE INDEX `Pizzen_ID_UNIQUE` (`Pizzen_ID` ASC) VISIBLE,
  UNIQUE INDEX `Order_ID_UNIQUE` (`Order_ID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderItems_Order1`
    FOREIGN KEY (`Order_ID`)
    REFERENCES `mydb`.`Order` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItems_Pizzen1`
    FOREIGN KEY (`Pizzen_ID`)
    REFERENCES `mydb`.`Pizzas` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`OrderItem_has_Extra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OrderItem_has_Extra` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `OrderItems_ID` INT NOT NULL,
  `Extras_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_OrderItem_has_Extra_OrderItems1_idx` (`OrderItems_ID` ASC) VISIBLE,
  INDEX `fk_OrderItem_has_Extra_Extras1_idx` (`Extras_ID` ASC) VISIBLE,
  UNIQUE INDEX `OrderItems_ID_UNIQUE` (`OrderItems_ID` ASC) VISIBLE,
  UNIQUE INDEX `Extras_ID_UNIQUE` (`Extras_ID` ASC) VISIBLE,
  CONSTRAINT `fk_OrderItem_has_Extra_OrderItems1`
    FOREIGN KEY (`OrderItems_ID`)
    REFERENCES `mydb`.`OrderItems` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_OrderItem_has_Extra_Extras1`
    FOREIGN KEY (`Extras_ID`)
    REFERENCES `mydb`.`Extras` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
