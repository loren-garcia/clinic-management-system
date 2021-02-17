-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema odonto
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema odonto
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `odonto` DEFAULT CHARACTER SET utf8 ;
USE `odonto` ;

-- -----------------------------------------------------
-- Table `odonto`.`DENTISTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `odonto`.`DENTISTA` (
  `den_cro` INT NOT NULL,
  `den_nome` VARCHAR(100) NOT NULL,
  `den_telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`den_cro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `odonto`.`PACIENTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `odonto`.`PACIENTE` (
  `pac_cpf` BIGINT(20) NOT NULL,
  `pac_nome` VARCHAR(100) NOT NULL,
  `pac_endereco` VARCHAR(100) NOT NULL,
  `pac_telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`pac_cpf`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `odonto`.`FUNCIONARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `odonto`.`FUNCIONARIO` (
  `fun_codigo` INT NOT NULL,
  `fun_nome` VARCHAR(100) NOT NULL,
  `fun_telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`fun_codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `odonto`.`CONSULTA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `odonto`.`CONSULTA` (
  `con_codigo` INT NOT NULL AUTO_INCREMENT,
  `con_valor` DOUBLE NOT NULL,
  `con_estado_pagamento` VARCHAR(45) NOT NULL,
  `pac_cpf` BIGINT(20) NOT NULL,
  `fun_codigo` INT NOT NULL,
  `den_cro` INT NOT NULL,
  PRIMARY KEY (`con_codigo`),
  INDEX `fk_CONSULTA_PACIENTE2_idx` (`pac_cpf` ASC) VISIBLE,
  INDEX `fk_CONSULTA_FUNCIONARIO1_idx` (`fun_codigo` ASC) VISIBLE,
  INDEX `fk_CONSULTA_DENTISTA2_idx` (`den_cro` ASC) VISIBLE,
  CONSTRAINT `fk_CONSULTA_PACIENTE2`
    FOREIGN KEY (`pac_cpf`)
    REFERENCES `odonto`.`PACIENTE` (`pac_cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_FUNCIONARIO1`
    FOREIGN KEY (`fun_codigo`)
    REFERENCES `odonto`.`FUNCIONARIO` (`fun_codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONSULTA_DENTISTA2`
    FOREIGN KEY (`den_cro`)
    REFERENCES `odonto`.`DENTISTA` (`den_cro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
