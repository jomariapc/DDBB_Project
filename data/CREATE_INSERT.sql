-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema blockbuster
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `blockbuster` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `blockbuster` ;

-- -----------------------------------------------------
-- Table `blockbuster`.`actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`actor` (
  `actor_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`actor_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci
COMMENT = '	';


-- -----------------------------------------------------
-- Table `blockbuster`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`customer` (
  `customer_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `mobile` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `DNI` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`film` (
  `film_id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `release_year` INT NULL DEFAULT NULL,
  `language_id` INT NULL DEFAULT NULL,
  `original_language_id` INT NULL DEFAULT NULL,
  `rental_duration` INT NULL DEFAULT NULL,
  `rental_rate` FLOAT NULL DEFAULT NULL,
  `length` INT NULL DEFAULT NULL,
  `replacement_cost` FLOAT NULL DEFAULT NULL,
  `rating` VARCHAR(45) NULL DEFAULT NULL,
  `category_id` INT NOT NULL,
  `price` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  INDEX `fk_film_category2_idx` (`category_id` ASC) VISIBLE,
  INDEX `fk_film_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_category2`
    FOREIGN KEY (`category_id`)
    REFERENCES `blockbuster`.`category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`film_has_actor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`film_has_actor` (
  `film_id` INT NOT NULL,
  `actor_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `actor_id`),
  INDEX `fk_film_has_actor_actor1_idx` (`actor_id` ASC) VISIBLE,
  INDEX `fk_film_has_actor_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_has_actor_actor1`
    FOREIGN KEY (`actor_id`)
    REFERENCES `blockbuster`.`actor` (`actor_id`),
  CONSTRAINT `fk_film_has_actor_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`language` (
  `language_id` INT NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`film_has_language`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`film_has_language` (
  `film_id` INT NOT NULL,
  `language_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `language_id`),
  INDEX `fk_film_has_language_language1_idx` (`language_id` ASC) VISIBLE,
  INDEX `fk_film_has_language_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_has_language_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`),
  CONSTRAINT `fk_film_has_language_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `blockbuster`.`language` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`special_features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`special_features` (
  `sp_id` INT NOT NULL,
  `special_feature` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`sp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`film_has_special_features`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`film_has_special_features` (
  `film_id` INT NOT NULL,
  `sp_id` INT NOT NULL,
  PRIMARY KEY (`film_id`, `sp_id`),
  INDEX `fk_film_has_special_features_special_features1_idx` (`sp_id` ASC) VISIBLE,
  INDEX `fk_film_has_special_features_film1_idx` (`film_id` ASC) VISIBLE,
  CONSTRAINT `fk_film_has_special_features_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`),
  CONSTRAINT `fk_film_has_special_features_special_features1`
    FOREIGN KEY (`sp_id`)
    REFERENCES `blockbuster`.`special_features` (`sp_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`language_has_film`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`language_has_film` (
  `language_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  `original_language_id` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`language_id`, `film_id`),
  INDEX `fk_language_has_film_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_language_has_film_language1_idx` (`language_id` ASC) VISIBLE,
  CONSTRAINT `fk_language_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`),
  CONSTRAINT `fk_language_has_film_language1`
    FOREIGN KEY (`language_id`)
    REFERENCES `blockbuster`.`language` (`language_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`staff`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`staff` (
  `staff_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `store_id` VARCHAR(45) NULL DEFAULT NULL,
  `rol` VARCHAR(45) NULL DEFAULT NULL,
  `DNI` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`rental`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`rental` (
  `rental_id` INT NOT NULL,
  `rental_date` VARCHAR(45) NULL DEFAULT NULL,
  `return_date` VARCHAR(45) NULL DEFAULT NULL,
  `total_quantity` VARCHAR(45) NULL DEFAULT NULL,
  `price` VARCHAR(45) NULL DEFAULT NULL,
  `discount` VARCHAR(45) NULL DEFAULT NULL,
  `store_id` VARCHAR(45) NULL DEFAULT NULL,
  `staff_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `staff_id`, `customer_id`),
  INDEX `fk_rental_staff1_idx` (`staff_id` ASC) VISIBLE,
  INDEX `fk_rental_customer1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `blockbuster`.`customer` (`customer_id`),
  CONSTRAINT `fk_rental_staff1`
    FOREIGN KEY (`staff_id`)
    REFERENCES `blockbuster`.`staff` (`staff_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `blockbuster`.`rental_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `blockbuster`.`rental_detail` (
  `rental_id` INT NOT NULL,
  `film_id` INT NOT NULL,
  PRIMARY KEY (`rental_id`, `film_id`),
  INDEX `fk_rental_has_film_film1_idx` (`film_id` ASC) VISIBLE,
  INDEX `fk_rental_has_film_rental1_idx` (`rental_id` ASC) VISIBLE,
  CONSTRAINT `fk_rental_has_film_film1`
    FOREIGN KEY (`film_id`)
    REFERENCES `blockbuster`.`film` (`film_id`),
  CONSTRAINT `fk_rental_has_film_rental1`
    FOREIGN KEY (`rental_id`)
    REFERENCES `blockbuster`.`rental` (`rental_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
