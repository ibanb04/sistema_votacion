-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema db_votaciones
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_votaciones
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_votaciones` DEFAULT CHARACTER SET utf8 ;
USE `db_votaciones` ;

-- -----------------------------------------------------
-- Table `db_votaciones`.`mesa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votaciones`.`mesa` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `db_votaciones`.`facultad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votaciones`.`facultad` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `db_votaciones`.`programa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votaciones`.`programa` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) CHARACTER SET 'utf8' NOT NULL,
  `facultad_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_programa_facultad1_idx` (`facultad_id` ASC),
  CONSTRAINT `fk_programa_facultad1`
    FOREIGN KEY (`facultad_id`)
    REFERENCES `db_votaciones`.`facultad` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `db_votaciones`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votaciones`.`rol` (
  `id` VARCHAR(3) CHARACTER SET 'utf8' NOT NULL,
  `rol` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `db_votaciones`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votaciones`.`usuario` (
  `codigo` VARCHAR(12) CHARACTER SET 'utf8' NOT NULL,
  `nombre1` VARCHAR(30) CHARACTER SET 'utf8' NOT NULL,
  `nombre2` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `apellido1` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `apellido2` VARCHAR(30) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `password` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `rol_id` VARCHAR(3) CHARACTER SET 'utf8' NOT NULL,
  `programa_id` INT(11) NOT NULL,
  `mesa_id` INT(11) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `fk_usuario_rol1_idx` (`rol_id` ASC),
  INDEX `fk_usuario_programa1_idx` (`programa_id` ASC),
  INDEX `fk_usuario_mesa1_idx` (`mesa_id` ASC),
  CONSTRAINT `fk_usuario_mesa1`
    FOREIGN KEY (`mesa_id`)
    REFERENCES `db_votaciones`.`mesa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_programa1`
    FOREIGN KEY (`programa_id`)
    REFERENCES `db_votaciones`.`programa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol1`
    FOREIGN KEY (`rol_id`)
    REFERENCES `db_votaciones`.`rol` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `db_votaciones`.`voto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votaciones`.`voto` (
  `certificado_id` INT(11) NOT NULL,
  `fecha` DATE NULL DEFAULT NULL,
  `mesa_id` INT(11) NOT NULL,
  `usuario_codigo` VARCHAR(12) CHARACTER SET 'utf8' NOT NULL,
  `candidato_codigo` VARCHAR(12) CHARACTER SET 'utf8' NOT NULL,
  PRIMARY KEY (`certificado_id`),
  INDEX `fk_voto_mesa1_idx` (`mesa_id` ASC),
  INDEX `fk_voto_usuario1_idx` (`usuario_codigo` ASC),
  INDEX `fk_voto_usuario2_idx` (`candidato_codigo` ASC),
  CONSTRAINT `fk_voto_mesa1`
    FOREIGN KEY (`mesa_id`)
    REFERENCES `db_votaciones`.`mesa` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voto_usuario1`
    FOREIGN KEY (`usuario_codigo`)
    REFERENCES `db_votaciones`.`usuario` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_voto_usuario2`
    FOREIGN KEY (`candidato_codigo`)
    REFERENCES `db_votaciones`.`usuario` (`codigo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


-- -----------------------------------------------------
-- Table `db_votaciones`.`certificado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_votaciones`.`certificado` (
  `id` INT(11) NOT NULL,
  `fecha` VARCHAR(45) CHARACTER SET 'utf8' NULL DEFAULT NULL,
  `voto_certificado_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_certificado_voto1_idx` (`voto_certificado_id` ASC),
  CONSTRAINT `fk_certificado_voto1`
    FOREIGN KEY (`voto_certificado_id`)
    REFERENCES `db_votaciones`.`voto` (`certificado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_spanish_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
