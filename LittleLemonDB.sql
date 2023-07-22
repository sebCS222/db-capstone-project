-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`bookings` (
  `booking_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `table_no` INT NULL,
  PRIMARY KEY (`booking_id`),
  UNIQUE INDEX `booking_id_UNIQUE` (`booking_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`customer` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(120) NOT NULL,
  `contact_no` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`staff` (
  `staff_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL,
  `salary` INT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`menu` (
  `menu_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cuisine` VARCHAR(45) NULL,
  `type` VARCHAR(45) NULL,
  `item` VARCHAR(45) NULL,
  `item_cost` FLOAT NULL,
  PRIMARY KEY (`menu_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`delivery` (
  `delivery_id` INT NOT NULL,
  `delivery_date` DATE NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE INDEX `order_id_UNIQUE` (`delivery_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_date` DATE NULL,
  `quantity` INT NULL,
  `total_cost` FLOAT NULL,
  `customer_customer_id` INT UNSIGNED NOT NULL,
  `bookings_booking_id` INT UNSIGNED NOT NULL,
  `staff_staff_id` INT UNSIGNED NOT NULL,
  `menu_menu_id` INT UNSIGNED NOT NULL,
  `delivery_order_id` INT NOT NULL,
  PRIMARY KEY (`order_id`),
  INDEX `fk_orders_customer_idx` (`customer_customer_id` ASC) VISIBLE,
  INDEX `fk_orders_bookings1_idx` (`bookings_booking_id` ASC) VISIBLE,
  INDEX `fk_orders_staff1_idx` (`staff_staff_id` ASC) VISIBLE,
  INDEX `fk_orders_menu1_idx` (`menu_menu_id` ASC) VISIBLE,
  INDEX `fk_orders_delivery1_idx` (`delivery_order_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_customer`
    FOREIGN KEY (`customer_customer_id`)
    REFERENCES `LittleLemonDB`.`customer` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_bookings1`
    FOREIGN KEY (`bookings_booking_id`)
    REFERENCES `LittleLemonDB`.`bookings` (`booking_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_staff1`
    FOREIGN KEY (`staff_staff_id`)
    REFERENCES `LittleLemonDB`.`staff` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_menu1`
    FOREIGN KEY (`menu_menu_id`)
    REFERENCES `LittleLemonDB`.`menu` (`menu_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_delivery1`
    FOREIGN KEY (`delivery_order_id`)
    REFERENCES `LittleLemonDB`.`delivery` (`delivery_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
