CREATE TABLE `rol` (
  `id` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `rol_nombre` VARCHAR(45) NOT NULL,
  `rol_valor` INT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `estado` (
  `id` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `estado_nombre` VARCHAR(45) NOT NULL,
  `estado_valor` SMALLINT(6) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `tipo_usuario` (
  `id` SMALLINT(6) NOT NULL AUTO_INCREMENT,
  `tipo_usuario_nombre` VARCHAR(45) NOT NULL,
  `tipo_usuario_valor` INT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `genero` (
  `id` SMALLINT(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `genero_nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `perfil` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nombre` TEXT(60) NULL,
  `apellido` TEXT(60) NULL,
  `fecha_nacimiento` DATE NULL,
  `create_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`));

ALTER TABLE `perfil` 
ADD COLUMN `genero_id` SMALLINT(6) UNSIGNED NOT NULL AFTER `updated_at`,
ADD INDEX `fk_perfil_genero_idx` (`genero_id` ASC);

ALTER TABLE `user` 
ADD COLUMN `perfil_id` INT(10) UNSIGNED NOT NULL AFTER `updated_at`,
ADD COLUMN `rol_id` SMALLINT(6) NOT NULL AFTER `perfil_id`,
ADD COLUMN `estado_id` SMALLINT(6) NOT NULL AFTER `rol_id`,
ADD INDEX `fk_user_perfil1_idx` (`perfil_id` ASC),
ADD INDEX `fk_user_rol1_idx` (`rol_id` ASC),
ADD INDEX `fk_user_estado1_idx` (`estado_id` ASC);

ALTER TABLE `perfil` 
ADD CONSTRAINT `fk_perfil_genero`
  FOREIGN KEY (`genero_id`)
  REFERENCES `blogyii`.`genero` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `user` 
ADD CONSTRAINT `fk_user_perfil1`
  FOREIGN KEY (`perfil_id`)
  REFERENCES `perfil` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_user_rol1`
  FOREIGN KEY (`rol_id`)
  REFERENCES `rol` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_user_estado1`
  FOREIGN KEY (`estado_id`)
  REFERENCES `estado` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

INSERT INTO `estado` (`estado_nombre`, `estado_valor`) VALUES ('Activo', '1');
INSERT INTO `estado` (`estado_nombre`, `estado_valor`) VALUES ('Pendiente', '2');
INSERT INTO `estado` (`estado_nombre`, `estado_valor`) VALUES ('Desactivado', '3');

INSERT INTO `tipo_usuario` (`tipo_usuario_nombre`, `tipo_usuario_valor`) VALUES ('Gratis', '1');
INSERT INTO `tipo_usuario` (`tipo_usuario_nombre`, `tipo_usuario_valor`) VALUES ('Paga','3');

INSERT INTO `genero` (`genero_nombre`) VALUES ('Masculino');
INSERT INTO `genero` (`genero_nombre`) VALUES ('Femenino');


