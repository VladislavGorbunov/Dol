-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 12 2023 г., 21:31
-- Версия сервера: 8.0.19
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dol`
--

-- --------------------------------------------------------

--
-- Структура таблицы `camps`
--

CREATE TABLE `camps` (
  `camps_id` int NOT NULL,
  `cities_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_age` int NOT NULL,
  `max_age` int NOT NULL,
  `free_transfer` int NOT NULL DEFAULT '0',
  `vk_link` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_link` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coords` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `camps`
--

INSERT INTO `camps` (`camps_id`, `cities_id`, `title`, `adress`, `year`, `description`, `min_age`, `max_age`, `free_transfer`, `vk_link`, `site_link`, `coords`) VALUES
(1, 1, 'Москва, Сорт и оздоров, от 4 до 14 лет, весна и лето', '', 0, 'ДОЛ \"Морская волна\"', 4, 14, 0, '', '', ''),
(2, 1, 'Летний лагерь', '', 0, 'Летний лагерь', 0, 0, 0, '', '', ''),
(3, 1, 'РобоЛагерь', '', 0, 'РобоЛагерь', 0, 0, 0, '', '', ''),
(4, 1, 'Москва, Сорт и оздоров, от 3 до 14 лет, весна и лето 2', '', 0, 'ДОЛ \"Морская волна\"', 3, 14, 0, '', '', ''),
(5, 2, 'Москва, Сорт и оздоров, от 3 до 14 лет, весна и лето 3', '', 0, 'ДОЛ \"Морская волна\"', 3, 14, 0, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `camps_seasons`
--

CREATE TABLE `camps_seasons` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `seasons_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `camps_seasons`
--

INSERT INTO `camps_seasons` (`id`, `camps_id`, `seasons_id`) VALUES
(1, 1, 2),
(2, 1, 1),
(3, 4, 1),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `camps_types`
--

CREATE TABLE `camps_types` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `types_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `camps_types`
--

INSERT INTO `camps_types` (`id`, `camps_id`, `types_id`) VALUES
(2, 1, 1),
(8, 1, 2),
(9, 4, 1),
(10, 4, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `cities_id` int NOT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`cities_id`, `title`, `slug`) VALUES
(1, 'Москва', 'moscow'),
(2, 'Московская область', 'podmoskove'),
(3, 'Санкт-Петербург', 'sankt-peterburg'),
(4, 'Ленинградская область', 'leningradskaya-oblast');

-- --------------------------------------------------------

--
-- Структура таблицы `representatives`
--

CREATE TABLE `representatives` (
  `user_id` int NOT NULL,
  `cities_id` int NOT NULL,
  `organization` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `inn` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `director` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `director_phone` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname_manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname_manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `post` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_manager` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `representatives`
--

INSERT INTO `representatives` (`user_id`, `cities_id`, `organization`, `inn`, `director`, `director_phone`, `firstname_manager`, `lastname_manager`, `post`, `email_manager`, `phone_manager`, `password`, `created_at`, `activated`) VALUES
(17, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$0aQKMdWdMVkgeXY.s92ENu1SHY2JnTR9b.JJkT1KZkei1TNFNE00e', '2023-05-17 17:46:18', 0),
(18, 2, 'ООО \"Северная волна\" ', '7823437625645', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfghhfd@ya.ru', '434234234234', '$2y$10$2QjjtGR01gDx5xmMpvLqgeSEPCuQaEY4q4Vw618L/IrIyE64HhNHe', '2023-05-17 19:14:47', 0),
(19, 1, 'ИП Горбунов В.В.', '463654', 'ррва', 'р5463634634', '4646', '346', '6346456', 'fghfghhf4646d@ya.ru', '66346346', '$2y$10$bURtZX7KYLgskMAlUupAs.ga5jnZXJYq/uMaNuoecMlYoIyVAL91.', '2023-05-17 19:27:11', 0),
(20, 2, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'limitorg2016@yandex.ru', '434234234234', '$2y$10$weryQYmCJGcYMvMQgMsZjOxWS9/6s915F127Zy9QFqq1QELLSlGRO', '2023-05-18 08:17:05', 1),
(21, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'limitorg201643@yandex.ru', '56756756', '$2y$10$qRkDC2VrC3b6rR7pMH8GSOmerVmYzb9ef1AJRK1k85iJKOkf.N9vC', '2023-05-18 08:18:46', 0),
(22, 1, 'ООО \"Северная волна\" , ! =  ', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfghhfd4432423@ya.ru', '434234234234', '$2y$10$88uoHAjgxNlVPaeYU7MvSugWbEhR9I9Zpid4Y9UPT0rKOeUky9mWK', '2023-05-21 10:16:02', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `lastname` varchar(60) NOT NULL,
  `text` text NOT NULL,
  `rating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `camps_id`, `firstname`, `lastname`, `text`, `rating`) VALUES
(1, 1, 'Виктор', 'Иванов', 'Хороший лагерь', 5),
(2, 1, 'Виктор', 'Иванов', 'Хороший лагерь', 4),
(4, 1, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', 4),
(5, 1, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', 4),
(7, 2, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', 4),
(8, 4, 'Илья', 'Ивановg', 'Хороший лагерь gdf', 5),
(9, 4, 'Илья', 'Ивановg', 'Хороший лагерь gdf', 5);

-- --------------------------------------------------------

--
-- Структура таблицы `seasons`
--

CREATE TABLE `seasons` (
  `seasons_id` int NOT NULL,
  `title` varchar(80) NOT NULL,
  `slug` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `seasons`
--

INSERT INTO `seasons` (`seasons_id`, `title`, `slug`) VALUES
(1, 'Весна', 'spring'),
(2, 'Лето', 'summer'),
(3, 'Осень', 'autumn'),
(4, 'Зима', 'winter');

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `types_id` int NOT NULL,
  `title` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag_tite` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`types_id`, `title`, `tag_tite`, `slug`) VALUES
(1, 'Спортивный', '', 'sport'),
(2, 'Оздоровительный', '', 'recreation'),
(3, 'Робототехника и IT', '', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `camps`
--
ALTER TABLE `camps`
  ADD PRIMARY KEY (`camps_id`);

--
-- Индексы таблицы `camps_seasons`
--
ALTER TABLE `camps_seasons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `camps_types`
--
ALTER TABLE `camps_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`cities_id`);

--
-- Индексы таблицы `representatives`
--
ALTER TABLE `representatives`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `seasons`
--
ALTER TABLE `seasons`
  ADD PRIMARY KEY (`seasons_id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`types_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `camps`
--
ALTER TABLE `camps`
  MODIFY `camps_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `camps_seasons`
--
ALTER TABLE `camps_seasons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `camps_types`
--
ALTER TABLE `camps_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `cities_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `representatives`
--
ALTER TABLE `representatives`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `seasons`
--
ALTER TABLE `seasons`
  MODIFY `seasons_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `types_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
