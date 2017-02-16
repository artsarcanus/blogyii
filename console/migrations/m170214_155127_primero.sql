

CREATE TABLE IF NOT EXISTS `estado` (
  `id` int(11) NOT NULL,
  `estado_nombre` varchar(45) NOT NULL,
  `estado_valor` smallint(6) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `estado` (`id`, `estado_nombre`, `estado_valor`) VALUES
(1, 'Activo', 10),
(2, 'Pendiente', 0);

CREATE TABLE IF NOT EXISTS `genero` (
  `id` int(11) NOT NULL,
  `genero_nombre` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT INTO `genero` (`id`, `genero_nombre`) VALUES
(1, 'Masculino'),
(2, 'Femenino');

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1486705028),
('m130524_201442_init', 1486705033);

CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL,
  `nombre` tinytext,
  `apellido` tinytext,
  `fecha_nacimiento` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `genero_id` int(11) NOT NULL,
  `user_id` int(11) unsigned NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `perfil` (`id`, `nombre`, `apellido`, `fecha_nacimiento`, `created_at`, `updated_at`, `genero_id`, `user_id`) VALUES
(1, 'Edgar', 'Najera', '2014-01-01', '2014-01-01 00:00:00', '2014-01-01 00:00:00', 1, 2),
(2, 'Edgar Lambertho Najera Perez', 'Perez', '2017-02-08', '2017-02-14 10:22:49', '2017-02-14 10:22:49', 1, 1);

CREATE TABLE IF NOT EXISTS `rol` (
  `id` int(11) NOT NULL,
  `rol_nombre` varchar(45) NOT NULL,
  `rol_valor` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `rol` (`id`, `rol_nombre`, `rol_valor`) VALUES
(1, 'Usuario', 10),
(2, '', 20);

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `id` int(11) NOT NULL,
  `tipo_usuario_nombre` varchar(45) NOT NULL,
  `tipo_usuario_valor` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

INSERT INTO `tipo_usuario` (`id`, `tipo_usuario_nombre`, `tipo_usuario_valor`) VALUES
(1, 'Gratuito', 10),
(2, 'Paid', 30);

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `tipo_usuario_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO `user` (`id`, `username`, `auth_key`, `password_hash`, `password_reset_token`, `email`, `status`, `created_at`, `updated_at`, `rol_id`, `estado_id`, `tipo_usuario_id`) VALUES
(1, 'ednajera', 'vDJH33E-dTuJrfn1u-Bf3TGlDUY2kbTX', '$2y$13$wa8TZgIAYkx4xxrYeTiSGe4eH2k53Txoeyss22BBzEaRP92W3Jq4i', NULL, 'dracone12342@gmail.com', 10, 2147483647, 2147483647, 1, 1, 1),
(2, 'ednajera1', 'jPCFQLcWDCDN1e8h6r9DQomSw5VAycSB', '$2y$13$PeR0q30aXPaGCCwjvZBKOe80p26QfyXbjzFpv7ERbuJ2q0yrN82vW', NULL, 'dracone123423@gmail.com', 10, 2147483647, 2147483647, 1, 1, 1);


ALTER TABLE `estado`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `migration`
  ADD PRIMARY KEY (`version`);


ALTER TABLE `perfil`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_perfil_genero_idx` (`genero_id`),
  ADD KEY `fk_perfil_user1_idx` (`user_id`);


ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_rol1_idx` (`rol_id`),
  ADD KEY `fk_user_estado1_idx` (`estado_id`),
  ADD KEY `fk_user_tipo_usuario1_idx` (`tipo_usuario_id`);


ALTER TABLE `estado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

ALTER TABLE `genero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;

ALTER TABLE `perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

ALTER TABLE `rol`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;

ALTER TABLE `user`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;


ALTER TABLE `perfil`
  ADD CONSTRAINT `fk_perfil_genero` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_perfil_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;


ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_estado1` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_rol1` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_tipo_usuario1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
