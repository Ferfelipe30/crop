CREATE SCHEMA `crop` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci ;

use crop;

CREATE TABLE `crop`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `fechaNacimiento` DATETIME NOT NULL,
  `numeroCelular` INT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(25) NOT NULL,
  `direccion` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) VISIBLE,
  UNIQUE INDEX `numeroCelular_UNIQUE` (`numeroCelular` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);
  
  