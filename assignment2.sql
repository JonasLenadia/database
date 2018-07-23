-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema assignment2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assignment2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignment2` DEFAULT CHARACTER SET utf8 ;
USE `assignment2` ;

-- -----------------------------------------------------
-- Table `assignment2`.`Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`Course` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`Course` (
  `idCourse` INT NOT NULL AUTO_INCREMENT,
  `courseName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCourse`),
  UNIQUE INDEX `idCourse_UNIQUE` (`idCourse` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`Student` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`Student` (
  `idStudent` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `idNumber` VARCHAR(13) NULL,
  `gender` ENUM('F', 'M') NULL,
  `contact` VARCHAR(15) NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `idStudent_UNIQUE` (`idStudent` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`Enrollment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`Enrollment` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`Enrollment` (
  `idEnrollment` INT NOT NULL AUTO_INCREMENT,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `idCourse` INT NOT NULL,
  `idStudent` INT NOT NULL,
  PRIMARY KEY (`idEnrollment`),
  UNIQUE INDEX `idStudentCourse_UNIQUE` (`idEnrollment` ASC),
  INDEX `idStud_idx` (`idStudent` ASC),
  INDEX `idCourses_idx` (`idCourse` ASC),
  CONSTRAINT `idSt`
    FOREIGN KEY (`idStudent`)
    REFERENCES `assignment2`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idCours`
    FOREIGN KEY (`idCourse`)
    REFERENCES `assignment2`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`Module`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`Module` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`Module` (
  `idModule` INT NOT NULL AUTO_INCREMENT,
  `moduleName` VARCHAR(45) NOT NULL,
  `passMark` INT NULL,
  `idCourse` INT NULL,
  PRIMARY KEY (`idModule`),
  UNIQUE INDEX `idModule_UNIQUE` (`idModule` ASC),
  INDEX `idCou_idx` (`idCourse` ASC),
  CONSTRAINT `idCou`
    FOREIGN KEY (`idCourse`)
    REFERENCES `assignment2`.`Course` (`idCourse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`Teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`Teacher` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`Teacher` (
  `idTeacher` INT NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `idNumber` VARCHAR(13) NULL,
  `gender` ENUM('F', 'M') NULL,
  `contact` VARCHAR(15) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idTeacher`),
  UNIQUE INDEX `idTeacher_UNIQUE` (`idTeacher` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`TeacherModule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`TeacherModule` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`TeacherModule` (
  `idTeacherCourse` INT NOT NULL AUTO_INCREMENT,
  `idTeacher` INT NOT NULL,
  `idModule` INT NULL,
  PRIMARY KEY (`idTeacherCourse`),
  UNIQUE INDEX `idTeacherCourse_UNIQUE` (`idTeacherCourse` ASC),
  INDEX `idMo_idx` (`idModule` ASC),
  INDEX `idTeacher_idx` (`idTeacher` ASC),
  CONSTRAINT `idMo`
    FOREIGN KEY (`idModule`)
    REFERENCES `assignment2`.`Module` (`idModule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTeacher`
    FOREIGN KEY (`idTeacher`)
    REFERENCES `assignment2`.`Teacher` (`idTeacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`Results`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`Results` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`Results` (
  `idResults` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `mark` DOUBLE NULL,
  `idModule` INT NOT NULL,
  PRIMARY KEY (`idResults`),
  UNIQUE INDEX `idMark_UNIQUE` (`idResults` ASC),
  INDEX `idModule_idx` (`idModule` ASC),
  CONSTRAINT `idMod`
    FOREIGN KEY (`idModule`)
    REFERENCES `assignment2`.`Module` (`idModule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `assignment2`.`Address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `assignment2`.`Address` ;

CREATE TABLE IF NOT EXISTS `assignment2`.`Address` (
  `idAddress` INT NOT NULL AUTO_INCREMENT,
  `streetNumber` INT NOT NULL,
  `streetName` VARCHAR(45) NOT NULL,
  `suburb` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `zipCode` INT NOT NULL,
  `idStudent` INT NULL,
  `idTeacher` INT NULL,
  PRIMARY KEY (`idAddress`),
  UNIQUE INDEX `idAddress_UNIQUE` (`idAddress` ASC),
  INDEX `idStudent_idx` (`idStudent` ASC),
  INDEX `idTeacher_idx` (`idTeacher` ASC),
  CONSTRAINT `idStudent`
    FOREIGN KEY (`idStudent`)
    REFERENCES `assignment2`.`Student` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idTea`
    FOREIGN KEY (`idTeacher`)
    REFERENCES `assignment2`.`Teacher` (`idTeacher`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
