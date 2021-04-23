-- MySQL Script generated by MySQL Workbench
-- Thu Apr 22 14:44:21 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Locadora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Locadora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Locadora` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema localori
-- -----------------------------------------------------
USE `Locadora` ;

-- -----------------------------------------------------
-- Table `Locadora`.`Pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locadora`.`Pessoa` (
  `Nome` VARCHAR(45) NOT NULL,
  `CPF` VARCHAR(45) NOT NULL,
  `Telefone` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locadora`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locadora`.`endereco` (
  `numero` INT NOT NULL,
  `rua` VARCHAR(45) NULL,
  `complemento` VARCHAR(45) NULL,
  `bairro` VARCHAR(45) NULL,
  `cidade` VARCHAR(45) NULL,
  `cep` VARCHAR(45) NULL,
  `estado` VARCHAR(45) NULL,
  PRIMARY KEY (`numero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locadora`.`Data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locadora`.`Data` (
  `dia` INT NOT NULL,
  `mes` INT NOT NULL,
  `ano` INT NOT NULL,
  PRIMARY KEY (`dia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locadora`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locadora`.`cliente` (
  `saldo` DOUBLE NOT NULL,
  `desconto` DOUBLE NULL,
  `Pessoa_CPF` VARCHAR(45) NOT NULL,
  `endereco_numero` INT NOT NULL,
  `Data_dia` INT NOT NULL,
  `Midia_issn` INT NOT NULL,
  `Pessoa_CPF1` VARCHAR(45) NOT NULL,
  INDEX `fk_cliente_endereco1_idx` (`endereco_numero` ASC),
  INDEX `fk_cliente_Data1_idx` (`Data_dia` ASC),
  INDEX `fk_cliente_Midia1_idx` (`Midia_issn` ASC),
  PRIMARY KEY (`Pessoa_CPF`),
  INDEX `fk_cliente_Pessoa1_idx` (`Pessoa_CPF1` ASC),
  CONSTRAINT `fk_cliente_endereco1`
    FOREIGN KEY (`endereco_numero`)
    REFERENCES `Locadora`.`endereco` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_Data1`
    FOREIGN KEY (`Data_dia`)
    REFERENCES `Locadora`.`Data` (`dia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_Midia1`
    FOREIGN KEY (`Midia_issn`)
    REFERENCES `Locadora`.`Midia` (`issn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_Pessoa1`
    FOREIGN KEY (`Pessoa_CPF1`)
    REFERENCES `Locadora`.`Pessoa` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locadora`.`Midia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locadora`.`Midia` (
  `counter` INT NOT NULL,
  `issn` INT NOT NULL,
  `Titulo` VARCHAR(45) NULL,
  `Classificacao` VARCHAR(45) NULL,
  `categoria` VARCHAR(45) NULL,
  `duracao` INT NULL,
  `quantidade` INT NULL,
  `real` DOUBLE NULL,
  `locado` INT NULL,
  `cliente_Pessoa_CPF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`issn`),
  INDEX `fk_Midia_cliente1_idx` (`cliente_Pessoa_CPF` ASC),
  CONSTRAINT `fk_Midia_cliente1`
    FOREIGN KEY (`cliente_Pessoa_CPF`)
    REFERENCES `Locadora`.`cliente` (`Pessoa_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locadora`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locadora`.`funcionario` (
  `salario` DOUBLE NOT NULL,
  `cargo` VARCHAR(45) NULL,
  `endereco_numero` INT NOT NULL,
  `Data_dia` INT NOT NULL,
  `Pessoa_CPF` VARCHAR(45) NOT NULL,
  INDEX `fk_funcionario_endereco1_idx` (`endereco_numero` ASC),
  INDEX `fk_funcionario_Data1_idx` (`Data_dia` ASC),
  PRIMARY KEY (`Pessoa_CPF`),
  CONSTRAINT `fk_funcionario_endereco1`
    FOREIGN KEY (`endereco_numero`)
    REFERENCES `Locadora`.`endereco` (`numero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_funcionario_Data1`
    FOREIGN KEY (`Data_dia`)
    REFERENCES `Locadora`.`Data` (`dia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Locadora`.`locacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Locadora`.`locacao` (
  `Midia_issn` INT NOT NULL,
  `funcionario_Pessoa_CPF` VARCHAR(45) NOT NULL,
  `cliente_Pessoa_CPF` VARCHAR(45) NOT NULL,
  INDEX `fk_locacao_Midia1_idx` (`Midia_issn` ASC),
  INDEX `fk_locacao_funcionario1_idx` (`funcionario_Pessoa_CPF` ASC),
  CONSTRAINT `fk_locacao_Midia1`
    FOREIGN KEY (`Midia_issn`)
    REFERENCES `Locadora`.`Midia` (`issn`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_locacao_funcionario1`
    FOREIGN KEY (`funcionario_Pessoa_CPF`)
    REFERENCES `Locadora`.`funcionario` (`Pessoa_CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
