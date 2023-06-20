-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июн 20 2023 г., 14:10
-- Версия сервера: 8.0.30
-- Версия PHP: 8.1.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Dol`
--

-- --------------------------------------------------------

--
-- Структура таблицы `camps`
--

CREATE TABLE `camps` (
  `camps_id` int NOT NULL,
  `cities_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cover` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_age` int NOT NULL,
  `max_age` int NOT NULL,
  `free_transfer` int NOT NULL DEFAULT '0',
  `vk_link` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_link` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `coords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `camps`
--

INSERT INTO `camps` (`camps_id`, `cities_id`, `title`, `slug`, `cover`, `adress`, `year`, `description`, `min_age`, `max_age`, `free_transfer`, `vk_link`, `site_link`, `coords`) VALUES
(96, 4, 'Морская волна', 'morskaya-volna', '', 'Ленинградская область, Всеволожский район, Щегловское сельское поселение', 1990, '', 0, 10, 0, '', '', '60.001254399440334,30.811926992187466');

-- --------------------------------------------------------

--
-- Структура таблицы `camps_images`
--

CREATE TABLE `camps_images` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `name_img` varchar(200) NOT NULL,
  `cover` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `camps_images`
--

INSERT INTO `camps_images` (`id`, `camps_id`, `name_img`, `cover`) VALUES
(4, 96, '1686897402_710ca2bdd05d9d834e25.jpg', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `camps_seasons`
--

CREATE TABLE `camps_seasons` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `seasons_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
(11, 96, 1),
(12, 96, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `cities_id` int NOT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_in` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`cities_id`, `title`, `title_in`, `slug`) VALUES
(1, 'Москва и область', '', 'moskva-i-oblast'),
(2, 'Санкт-Петербург и область', '', 'sankt-peterburg-i-oblast'),
(3, 'Краснодарский край', '', 'krasnodarskiy-kray'),
(4, 'Крым', '', 'crimea'),
(5, 'Адыгея', '', 'adyigeya'),
(6, 'Алтай', '', 'altay'),
(7, 'Алтайский край', '', 'altayskiy-kray'),
(8, 'Амурская область', '', 'amurskaya-oblast'),
(9, 'Астраханская область', '', 'astrahanskaya-oblast'),
(10, 'Башкортостан', '', 'bashkortostan'),
(11, 'Балгородская область', '', 'belgorodskaya-oblast'),
(12, 'Брянская область', '', 'bryanskaya-oblast'),
(13, 'Бурятия', '', 'buryatiya'),
(14, 'Владимирская область', '', 'vladimirskaya-oblast'),
(15, 'Вологодская область', '', 'volgogradskaya-oblast'),
(16, 'Воронежская область', '', 'voronezhskaya-oblast'),
(17, 'Дагестан', '', 'dagestan'),
(18, 'Забайкальский край', '', 'zabaykalskiy-kray'),
(19, 'Ивановская область', '', 'ivanovskaya-oblast'),
(20, 'Ингушетия', '', 'ingushetia'),
(21, 'Иркутская область', '', 'irkutskaya-oblast'),
(22, 'Кабардино-Балкария', '', 'kabardino-balkaria'),
(23, 'Калининградская область', '', 'kaliningradskaya-oblast'),
(24, 'Калужская область', '', 'kaluzhskaya-oblast'),
(25, 'Камчатский край', '', 'kamchatskiy-kray'),
(26, 'Карачаево-Черкессия', '', 'karachaevo-cherkessiya'),
(27, 'Карелия', '', 'kareliya'),
(28, 'Кемеровская область', '', 'kemerovskaya-oblast'),
(29, 'Кировская область', '', 'kirov'),
(30, 'Коми', '', 'komi'),
(31, 'Костромская область', '', 'kostromskaya-oblast'),
(32, 'Красноярский край', '', 'krasnoyarskiy-kray'),
(33, 'Курганская область', '', 'kurganskaya-oblast'),
(34, 'Курская область', '', 'kurskaya-oblast'),
(35, 'Липецкая область', '', 'lipetskaya-oblast'),
(36, 'Марий Эл', '', 'mariy-yel'),
(37, 'Мордовия', '', 'mordoviya'),
(38, 'Мурманская область', '', 'murmanskaya-oblast'),
(39, 'Нижегородская область', '', 'nizhegorodskaya-oblast'),
(40, 'Новгородская область', '', 'novgorodskaya-oblast'),
(41, 'Новосибирская область', '', 'novosibirskaya-oblast'),
(42, 'Омская область', '', 'omskaya-oblast'),
(43, 'Оренбургская область', '', 'orenburgskaya-oblast'),
(44, 'Орловская область', '', 'orlovskaya-oblast'),
(45, 'Пензенская область', '', 'penzenskaya-oblast');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

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
  `tag_title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(70) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`types_id`, `title`, `tag_title`, `slug`) VALUES
(1, 'Языковой лагерь', 'Языковые лагеря', 'language'),
(2, 'Лагерь на море', 'Лагеря на море', 'sea'),
(3, 'Онлайн лагерь', 'Онлайн лагеря', 'online'),
(4, 'Лагерь IT и программирования', 'Лагеря IT и программирования', 'it'),
(5, 'Премиум-лагерь', 'Премиум-лагеря', 'vip'),
(6, 'Бизнес лагерь', 'Бизнес лагеря', 'business'),
(7, 'Военно-патриотический лагерь', 'Военно-патриотические лагеря', 'patriotic'),
(8, 'Вокальный лагерь', 'Вокальные лагеря', 'vocal'),
(9, 'Водные виды спорта', 'Детские лагеря с водными видами спорта', 'watersport'),
(10, 'Лагерь выходного дня', 'Детский лагерь выходного дня', 'weekend'),
(11, 'Городской лагерь', 'Городские лагеря', 'city'),
(12, 'Горнолыжный лагерь', 'Горнолыжные детские лагеря', 'mountain'),
(13, 'Для детей с диабетом', 'Лагеря для детей с диабетом', 'diabetes'),
(14, 'Лагерь для взрослых', 'Лагеря для взрослых', 'adults'),
(15, 'Для одаренных детей', 'Детские лагеря для одаренных детей', 'talented'),
(16, 'Для вегетарианцев', 'Лагеря для вегетарианцев', 'vegetarian'),
(17, 'Инклюзивный лагерь', 'Инклюзивные лагеря для детей', 'inclusive'),
(18, 'Кино-лагерь', 'Кино-лагеря', 'cinema'),
(19, 'Кибер-спортивный лагерь', 'Кибер-спортивные лагеря', 'esports'),
(20, 'Компьютерный лагерь', 'Компьютерные лагеря', 'computer'),
(21, 'Конный лагерь', 'Конные лагеря для детей', 'horse'),
(22, 'Математический лагерь', 'Математические лагеря', 'mathematical'),
(23, 'Международный лагерь', 'Международные детские лагеря', 'international'),
(24, 'Музыкальный лагерь', 'Музыкальные лагеря для детей', 'music'),
(25, 'Научный лагерь', 'Научные лагеря', 'science'),
(26, 'Образовательный лагерь', 'Образовательные лагеря для детей', 'education'),
(27, 'Оздоровительный лагерь', 'Детские оздоровительные лагеря', 'recreation'),
(28, 'Палаточный лагерь', 'Палаточные лагеря', 'campgrounds'),
(29, 'Пионерский лагерь', 'Пионерские лагеря для детей', 'pioneer'),
(30, 'Подростковый лагерь', 'Подростковые лагеря для детей', 'teenage'),
(31, 'Православные и христианские', 'Православные и христианские лагеря для детей', 'orthodox'),
(32, 'Профильный лагерь', 'Профильные лагеря для детей', 'profile'),
(33, 'Профориентационный', 'Профориентационные лагеря для детей', 'career'),
(34, 'Психологический лагерь', 'Психологические лагеря', 'psychology'),
(35, 'Робототехнический лагерь', 'Робототехнические лагеря для детей', 'robot'),
(36, 'Санаторный лагерь', 'Санаторные лагеря для детей', 'sanatorium'),
(37, 'Cемейный лагерь', 'Cемейные лагеря', 'family'),
(38, 'Спортивный лагерь', 'Детские спортивные лагеря', 'sport'),
(39, 'Cпорт-сборы', 'Cпорт-сборы', 'sportsbory'),
(40, 'Театральный лагерь', 'Театральные лагеря для детей', 'theater'),
(41, 'Танцевальный лагерь', 'Танцевальные лагеря для детей', 'dance'),
(42, 'Технический лагерь', 'Технические лагеря', 'technical'),
(43, 'Творческий лагерь', 'Творческие детские лагеря', 'creative'),
(44, 'Туристический лагерь', 'Детские туристические лагеря', 'tourist'),
(45, 'Футбольный лагерь', 'Футбольные лагеря для детей', 'football'),
(46, 'Хоккейный лагерь', 'Хоккейные лагеря для детей', 'hockey'),
(47, 'Баскетбольный лагерь', 'Баскетбольные лагеря', 'basketball'),
(48, 'Шахматный лагерь', 'Шахматные лагеря для детей', 'chess'),
(49, 'Экскурсионный лагерь', 'Экскурсионные детские лагеря', 'excursion');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `camps`
--
ALTER TABLE `camps`
  ADD PRIMARY KEY (`camps_id`);

--
-- Индексы таблицы `camps_images`
--
ALTER TABLE `camps_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camps_id` (`camps_id`);

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
  MODIFY `camps_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT для таблицы `camps_images`
--
ALTER TABLE `camps_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `camps_seasons`
--
ALTER TABLE `camps_seasons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `camps_types`
--
ALTER TABLE `camps_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `cities_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

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
  MODIFY `types_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `camps_images`
--
ALTER TABLE `camps_images`
  ADD CONSTRAINT `camps_images_ibfk_1` FOREIGN KEY (`camps_id`) REFERENCES `camps` (`camps_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
