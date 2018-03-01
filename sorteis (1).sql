-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-03-2018 a las 05:34:39
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sorteis`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable_id` int(10) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL,
  `valor` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medidas`
--

CREATE TABLE `medidas` (
  `id` int(10) UNSIGNED NOT NULL,
  `taladro_id` int(10) UNSIGNED NOT NULL,
  `variable_id` int(10) UNSIGNED NOT NULL,
  `fecha_medida` datetime NOT NULL,
  `profundidad` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `medidas`
--

INSERT INTO `medidas` (`id`, `taladro_id`, `variable_id`, `fecha_medida`, `profundidad`, `valor`, `created_at`, `updated_at`) VALUES
(1, 1, 5, '2018-02-28 00:00:00', 123, 111, NULL, NULL),
(2, 1, 5, '2018-02-28 02:00:00', 124, 1442, NULL, NULL),
(3, 1, 5, '2018-02-28 04:00:00', 124, 1442, NULL, NULL),
(4, 1, 5, '2018-02-28 05:00:00', 125, 42, NULL, NULL),
(5, 1, 5, '2018-02-28 06:00:00', 129, 142, NULL, NULL),
(6, 1, 5, '2018-02-28 08:00:00', 159, 842, NULL, NULL),
(7, 1, 5, '2018-02-28 10:00:00', 194, 942, NULL, NULL),
(8, 1, 5, '2018-02-28 11:00:00', 195, 242, NULL, NULL),
(9, 1, 5, '2018-02-28 12:00:00', 200, 1042, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2018_02_17_234722_create_variables_table', 1),
(9, '2018_02_17_235132_create_historial_table', 1),
(10, '2018_02_20_021418_create_positions_table', 1),
(11, '2018_02_28_042845_create_taladro_table', 1),
(12, '2018_02_28_042947_create_medida_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('07c8000068dadc01bf4f548bf15bad5bafb7820335dfc21e57c45f9bedadc48aa7b7e58452c508dd', 1, 2, NULL, '[]', 0, '2018-03-01 11:05:19', '2018-03-01 11:05:19', '2019-03-01 03:05:19'),
('13338a39a89cab149bc1812e28905dbdef793489cd28bf5ffac82aedf8489d2e323a0d5cc7540958', 1, 2, NULL, '[]', 0, '2018-03-01 11:16:44', '2018-03-01 11:16:44', '2019-03-01 03:16:44'),
('4cae39dd736a519a89f47c1c136cdf43517be5a0530a3c7e6ee8f1ce3faeea76c7fae6c74d23b1aa', 1, 2, NULL, '[]', 0, '2018-02-28 13:03:06', '2018-02-28 13:03:06', '2019-02-28 05:03:06'),
('6d8f473060f80c4a5c8b6099e5cb90b8747246769422a90e6df19c0b0264d93439414c0d5b8b827d', 1, 2, NULL, '[]', 0, '2018-03-01 01:10:18', '2018-03-01 01:10:18', '2019-02-28 17:10:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'vGgAvHCgLAJ7QFfTJm9TMwKYSJafCBuQQjuREi4u', 'http://localhost', 1, 0, 0, '2018-02-28 12:53:18', '2018-02-28 12:53:18'),
(2, NULL, 'Laravel Password Grant Client', 'hrlBBDaRt8RXx7MWTMzuHpiCf143nbxEcsuYelsJ', 'http://localhost', 0, 1, 0, '2018-02-28 12:53:18', '2018-02-28 12:53:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `oauth_refresh_tokens`
--

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
('39a086add9a762aa0d079e4b0cd49225b6715ab306a3480ca5654f9b8deb79da87fb3bd7be2f2158', '13338a39a89cab149bc1812e28905dbdef793489cd28bf5ffac82aedf8489d2e323a0d5cc7540958', 0, '2019-03-01 03:16:45'),
('7b74a3240333b9e366e029c0586b936329a1b4bb4f953830f31cde8699d5209f4fbaa61f822c0efc', '4cae39dd736a519a89f47c1c136cdf43517be5a0530a3c7e6ee8f1ce3faeea76c7fae6c74d23b1aa', 0, '2019-02-28 05:03:06'),
('7e6510f043068e68a6fc2495d301c581c08c54da31ed3932e055dcec84c33d0131a7c5068c70404e', '07c8000068dadc01bf4f548bf15bad5bafb7820335dfc21e57c45f9bedadc48aa7b7e58452c508dd', 0, '2019-03-01 03:05:20'),
('a5769d4d4d1cb829703bd99a9835f0a1f58f016f8934d6ad67b142673f627e1c5c133ed796b50001', '6d8f473060f80c4a5c8b6099e5cb90b8747246769422a90e6df19c0b0264d93439414c0d5b8b827d', 0, '2019-02-28 17:10:18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `positions`
--

CREATE TABLE `positions` (
  `id` int(10) UNSIGNED NOT NULL,
  `variable_id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posicion` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `positions`
--

INSERT INTO `positions` (`id`, `variable_id`, `tipo`, `posicion`, `created_at`, `updated_at`) VALUES
(1, 5, 'graph', 1, NULL, '2018-03-01 02:44:00'),
(2, 4, 'graph', 2, NULL, '2018-03-01 02:46:38'),
(3, 5, 'graph', 3, NULL, '2018-03-01 02:38:13'),
(4, 4, 'graph', 4, NULL, '2018-03-01 02:26:32'),
(5, 5, 'main', 1, NULL, '2018-03-01 11:41:14'),
(6, 4, 'main', 2, NULL, '2018-03-01 02:17:46'),
(7, 6, 'main', 3, NULL, '2018-03-01 01:11:34'),
(8, 4, 'main', 4, NULL, '2018-03-01 01:19:13'),
(9, 4, 'main', 5, NULL, '2018-03-01 02:18:06'),
(10, 4, 'main', 6, NULL, NULL),
(11, 6, 'main', 7, NULL, '2018-03-01 01:11:43'),
(12, 5, 'graph', 5, NULL, '2018-03-01 02:38:42'),
(13, 5, 'graph', 6, NULL, '2018-03-01 02:38:34'),
(14, 5, 'graph', 7, NULL, '2018-03-01 08:29:47'),
(15, 4, 'graph', 8, NULL, '2018-03-01 02:47:06'),
(16, 5, 'graph', 9, NULL, NULL),
(17, 4, 'graph', 10, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `taladros`
--

CREATE TABLE `taladros` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `taladros`
--

INSERT INTO `taladros` (`id`, `nombre`, `descripcion`, `created_at`, `updated_at`) VALUES
(1, 'Taladro 239182', 'Taladro bueno', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Juanita Weissnat DDS', 'cierra.wolf@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'itrsfadL4i', '2018-02-28 13:02:01', '2018-02-28 13:02:01'),
(2, 'Lucius Gerlach', 'hettinger.candida@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'e5ekFHkbnV', '2018-02-28 13:02:01', '2018-02-28 13:02:01'),
(3, 'Brayan Ortiz', 'lorna.wilderman@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'i9wwkqVOxk', '2018-02-28 13:02:02', '2018-02-28 13:02:02'),
(4, 'Name Maggio', 'osbaldo.johns@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'zoab7VcNYh', '2018-02-28 13:02:02', '2018-02-28 13:02:02'),
(5, 'Mrs. Brigitte Marquardt III', 'frederic.homenick@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'f6P304oniy', '2018-02-28 13:02:02', '2018-02-28 13:02:02'),
(6, 'Reba Klocko', 'carey09@example.com', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'A6T04XMQDp', '2018-02-28 13:02:02', '2018-02-28 13:02:02'),
(7, 'Sigurd Skiles', 'briana.barrows@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'K3KIXWpLG1', '2018-02-28 13:02:02', '2018-02-28 13:02:02'),
(8, 'Lauren Pfannerstill DVM', 'gorczany.ewald@example.net', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'I4Qc9JsQ0A', '2018-02-28 13:02:02', '2018-02-28 13:02:02'),
(9, 'Stacey Erdman', 'hayes.danyka@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', 'hKD5Z9vVoo', '2018-02-28 13:02:02', '2018-02-28 13:02:02'),
(10, 'Lesley Kemmer', 'langosh.dewayne@example.org', '$2y$10$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', '9WBoGLVXbX', '2018-02-28 13:02:02', '2018-02-28 13:02:02');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `variables`
--

CREATE TABLE `variables` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidad_medida` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `variables`
--

INSERT INTO `variables` (`id`, `nombre`, `descripcion`, `unidad_medida`, `tag`, `created_at`, `updated_at`) VALUES
(4, 'VAR_21', 'Variable no configurada, creada automáticamente por el sistema', 'mts', '21', NULL, NULL),
(5, 'Presion', 'No hay descripcion', 'psi', '0012', NULL, NULL),
(6, 'ancho', 'ancho de algo ', 'feet', '0001', NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`id`),
  ADD KEY `historial_variable_id_foreign` (`variable_id`);

--
-- Indices de la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `medidas_variable_id_foreign` (`variable_id`),
  ADD KEY `medidas_taladro_id_foreign` (`taladro_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indices de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_personal_access_clients_client_id_index` (`client_id`);

--
-- Indices de la tabla `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `positions_variable_id_foreign` (`variable_id`);

--
-- Indices de la tabla `taladros`
--
ALTER TABLE `taladros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indices de la tabla `variables`
--
ALTER TABLE `variables`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `medidas`
--
ALTER TABLE `medidas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `taladros`
--
ALTER TABLE `taladros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `variables`
--
ALTER TABLE `variables`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `historial_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `variables` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `medidas`
--
ALTER TABLE `medidas`
  ADD CONSTRAINT `medidas_taladro_id_foreign` FOREIGN KEY (`taladro_id`) REFERENCES `taladros` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `medidas_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `variables` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `positions_variable_id_foreign` FOREIGN KEY (`variable_id`) REFERENCES `variables` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
