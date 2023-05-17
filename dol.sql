-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Май 17 2023 г., 18:43
-- Версия сервера: 5.5.62
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
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `cities_id` int(11) NOT NULL,
  `title` varchar(80) NOT NULL,
  `slug` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`cities_id`, `title`, `slug`) VALUES
(1, 'Москва и Московская область', 'moscov'),
(2, 'Санкт-Петербург и Ленинградская область', 'spb');

-- --------------------------------------------------------

--
-- Структура таблицы `representatives`
--

CREATE TABLE `representatives` (
  `user_id` int(11) NOT NULL,
  `cities_id` int(11) NOT NULL,
  `organization` varchar(100) NOT NULL,
  `inn` varchar(30) NOT NULL,
  `director` varchar(100) NOT NULL,
  `director_phone` varchar(30) NOT NULL,
  `firstname_manager` varchar(100) NOT NULL,
  `lastname_manager` varchar(100) NOT NULL,
  `post` varchar(100) NOT NULL,
  `email_manager` varchar(100) NOT NULL,
  `phone_manager` varchar(100) NOT NULL,
  `password` varchar(250) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `representatives`
--

INSERT INTO `representatives` (`user_id`, `cities_id`, `organization`, `inn`, `director`, `director_phone`, `firstname_manager`, `lastname_manager`, `post`, `email_manager`, `phone_manager`, `password`, `created_at`, `activated`) VALUES
(2, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$GI0yPsDaWOnv6KJEcoLhGee0jxIL3oNZE1youK93/p2pjwLt20GCW', '2023-05-17 14:54:27', 0),
(3, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$Cw.ijaqHMhsoL9/1P.O8q.OGms0pGA8dzQnxWbopsey/Dmbx0My6C', '2023-05-17 14:55:49', 0),
(6, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$oDFu4O.Zfidb.whqBHKQtexnEz/AxCSfaerjd8LJ5VqmvrRRm5bDC', '2023-05-17 15:17:56', 0),
(7, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$4FD9PgaceMO.//xppxvuEuo4BduGIs8eryit/cK8F/nMpgCQBfaYW', '2023-05-17 15:18:23', 0),
(8, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$fQOFh/vTnlrhjKhOKkbe3OIjajPJ6aFIHskw8x3BIuAo6VGMT1wh2', '2023-05-17 15:19:30', 0),
(9, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$6n78ZUMx7xfOjouyZ.IMEOyaT.LdUskVaQNSyLIpzCSix8SdXk4qO', '2023-05-17 15:20:20', 0),
(10, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '64', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$6heoI.5zWOx/mEGyY1oVxuIPTGoYUTWA5YNSVyGJKgNMSyTby.T3e', '2023-05-17 15:21:05', 0),
(11, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '64', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$Hk61v5LJYVzkDMq8PtzrFO5WQVlmZPx7AZFjk30kvUsr9HDTofafa', '2023-05-17 15:23:04', 0),
(12, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '64', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$e/7F04hj7anyWjs0GOKkb.iQq5/IRie.l8UERAwWRSkjuJB4XOK2K', '2023-05-17 15:24:51', 0),
(13, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$997ycJyjfpDW1OOufoFaZuVYayz2H1TTt9kh.6eDebw4n5YiN0zYu', '2023-05-17 15:25:19', 0),
(14, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '56756756', '$2y$10$CtWwkYcKJkjJMLu62FIQX.T97IGKjgrPdQosooGCcMi3g8CCeFlLq', '2023-05-17 15:26:09', 0),
(15, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$a13CPXAcvxmcjzFDlwhLn.XUcODOLp6.p.YpxxCAe6.LBqVvGndNm', '2023-05-17 15:26:52', 0),
(16, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$q.o.TFStaPD496StgBVx/uTfT.is5i2L6lNeR7bt4eOFX1A6v5gNG', '2023-05-17 15:29:39', 0);

--
-- Индексы сохранённых таблиц
--

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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `cities_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `representatives`
--
ALTER TABLE `representatives`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
