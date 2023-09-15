-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Сен 15 2023 г., 13:44
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
CREATE DATABASE IF NOT EXISTS `Dol` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `Dol`;

-- --------------------------------------------------------

--
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `number_of_tickets` int NOT NULL DEFAULT '1',
  `fio` varchar(250) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `camp_id` int NOT NULL,
  `representative_id` int NOT NULL,
  `shift_id` int NOT NULL,
  `booking_number` text NOT NULL,
  `date_booking` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `confirmed` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `number_of_tickets`, `fio`, `telephone`, `email`, `camp_id`, `representative_id`, `shift_id`, `booking_number`, `date_booking`, `confirmed`) VALUES
(40, 1, 'dfgdfgdf', '45353', 'demo@ya.ru', 142, 20, 23, 'В-2508233744-672', '2023-09-04 11:21:42', 0),
(41, 1, 'dfgdfgdf', '45353', 'demo@ya.ru', 142, 20, 23, 'В-2508233744-672', '2023-09-04 11:21:42', 0),
(42, 1, 'dfgdfgdf', '45353', 'demo@ya.ru', 142, 20, 23, 'В-2508233744-672', '2023-09-04 11:21:42', 0),
(44, 1, 'dfgdfgdf', '45353', 'demo@ya.ru', 142, 20, 23, 'В-2508233744-672', '2023-09-04 11:21:42', 0),
(46, 1, 'Горбунов В.В', '+7 (999) 999-99-99', 'demo@ya.ru', 142, 20, 23, 'Б-2808234256-67', '2023-09-04 11:21:42', 0),
(47, 3, 'Горбунов В.А', '+7 (432) 342-34-23', 'demo@ya.ru', 142, 20, 23, 'Б-2808234712-769', '2023-09-04 11:21:42', 0),
(49, 3, 'gdfgdfgdfgdfgdf', '+7 (534) 534-53-45', 'demo@ya.ru', 142, 20, 23, 'В-0409232914-627', '2023-09-04 11:29:14', 0),
(50, 2, 'Горбунов Владислав Владимирович', '+7 (444) 444-44-44', 'demo@ya.ru', 142, 20, 23, 'К-0409233005-790', '2023-09-04 11:30:05', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `camps`
--

CREATE TABLE `camps` (
  `camps_id` int NOT NULL,
  `representatives_id` int NOT NULL,
  `cities_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `camp_base` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `placement` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `advantages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_schedule` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_age` int NOT NULL,
  `max_age` int NOT NULL,
  `free_transfer` int NOT NULL DEFAULT '0',
  `security` int NOT NULL,
  `vk_link` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_link` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video_link` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coords` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `camps`
--

INSERT INTO `camps` (`camps_id`, `representatives_id`, `cities_id`, `title`, `camp_base`, `slug`, `adress`, `year`, `description`, `placement`, `advantages`, `daily_schedule`, `min_age`, `max_age`, `free_transfer`, `security`, `vk_link`, `site_link`, `video_link`, `coords`, `views`) VALUES
(141, 20, 1, 'Финский лагерь на берегу', 'ДОЛ Зелёный лес Выборг', 'finskiy-lager-na-beregu', 'Москва, Новослободская улица, 62к20', 1995, '<p>sdfsdf</p>', '<p>sdfsdf</p>', '<p>sdfsdf</p>', '<p>sdfsdf</p>', 5, 18, 1, 1, 'https://vk.com/public6634563', 'https://fin-camp.ru', 'https://youtu.be/dL3Nlj4ee3E', '55.790691,37.59259', 15),
(142, 17, 1, 'Cool Kids', '', 'cool-kids', 'Москва, Большая Семёновская улица, 20', 1990, '<p>Программа Cool Kids - уникальная программа: изучение английского языка в игровой форме, в течение всей смены видео и разговорный клуб с русскими и иностранными преподавателями. Опытные педагоги и носители языка языкового центра Cool School помогут маленьким лингвистам проникнуть в тайны английского языка, поближе познакомиться с культурой и традициями англоговорящих стран и улучшить свой английский!</p><p><strong>Насыщенный веселый досуг</strong> придаст ребятам волшебное настроение, ведь мы при деле целый день:</p><ul><li>Спортивные мероприятия.</li><li>Мастер классы.</li><li>Подвижные и настольные игры, игры на развитие логики и мышления.</li><li>Квесты.</li><li>Дискотеки.</li><li>Концерты, выступления, песни под гитару.</li><li>Итоговые спектакли и съемки видео-проектов.</li><li>Бассейн.</li><li>Веревочный парк.</li></ul><p>Интересное времяпровождение непременно надолго запомнится ребенку и он захочет приехать снова.</p>', '', '<p>Мы гарантируем Вам абсолютную сохранность жизни и здоровья Вашего ребенка в детском лагере.<br>И вот благодаря чему:</p><ul><li>Внимательное отношение к Вашему ребенку. Вожатый всегда рядом и всегда знает чем занимается ребенок.</li><li>Круглосуточная телефонная связь с администрацией лагеря. Вы всегда в курсе дела.</li><li>Все помещения лагеря соответствуют санитарно-гигиеническим нормам и технике безопасности (СанПин).</li><li>Постоянное присутствие на территории лагеря медицинских работников и наличие медпункта со всеми необходимыми лекарствами для оказания первой медицинской помощи.</li><li>Медицинская страховка на период заезда.</li><li>Круглосуточно охраняемая территория лагеря с видеонаблюдением.</li></ul><p>Безопасность – наш главный приоритет!</p>', '<ul><li>08:00 подъем</li><li>08:15 бодрячок</li><li>08:35 водные процедуры</li><li>09:00 завтрак</li><li>09:30 отрядное время</li><li>10:00–11:30 английский 1 / приключения 2</li><li>11:30–13:00 английский 2 / приключения 1</li><li>13:10 обед</li><li>13:40–15:00 тихий час / общение с родителями</li><li>15:15 полдник</li><li>15:30 отрядное время</li><li>16:00–17:30 английский 1 / приключения 2</li><li>17:30–19:00 английский 2 / приключения 1</li><li>19:10 ужин</li><li>19:40 общие вечерние мероприятия</li><li>21:20 свечка / второй ужин</li><li>21:50 водные процедуры</li><li>22:30 отбой / сказка на ночь</li></ul><p>Каждые 5 дней в лагере дети посещают бассейн и веревочный городок.<br>В первый день – тестирование на уровень английского языка.</p><ul><li>14.30–15.00 выдача телефонов детям</li><li>14.00–14.30 и 21.50 – 22.20 чаепитие, сладости</li></ul>', 0, 10, 1, 0, '', '', 'https://youtu.be/dL3Nlj4ee3E', '55.78186474291037,37.70517710644531', 0),
(147, 20, 1, 'ДОЛ Карелия старс', '', 'dol-kareliya-stars', 'Республика Карелия, Лахденпохский район, Куркиёкское сельское поселение', 1990, '<p>аыавыаыва</p>', '', '<p>ываываы</p>', '<p>ываыва</p>', 5, 15, 0, 0, '', '', '', '61.35656340921557,29.755922962751118', 0),
(158, 20, 1, 'ggggg', '', 'ggggg', 'Москва, Селезнёвская улица, 34к2', 1990, '<p>dfgdfgdf</p>', '', '<p>dfgdfgdfg</p>', '<p>dfgdfgdg</p>', 0, 10, 0, 0, '', '', '', '55.780703861433146,37.61316660839844', 0),
(159, 20, 2, 'Восход', 'ДОЛ \"Морская волна\"', 'voshod', 'Санкт-Петербург, Курортный район, государственный природный заказник регионального значения Озеро Щучье', 1990, '<p>оуанпопнопо</p>', '', '<p>нопнопнопнопп</p>', '<p>апрапрпарапрапр</p>', 0, 10, 0, 0, '', '', '', '60.199286607564424,29.76273265624995', 0);

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
(172, 141, '1688388651_dcf7f3b616c6c7992a31.jpg', 1),
(173, 141, '1688388651_dbd14157b1732dcd7f11.jpeg', 0),
(174, 141, '1688388651_623a4cf49d15c89fcbe7.jpg', 0),
(175, 141, '1688388652_8d0044cdaa492a7a886f.jpg', 0),
(176, 141, '1688388653_07f4bb5a22cf84b54d8e.jpg', 0),
(177, 141, '1688388653_9d0a57fe8de05f9091ca.jpg', 0),
(178, 141, '1688388654_2fddc3d1cb66342d6eae.jpg', 0),
(179, 141, '1688388654_1dc79aa9488a79c87b64.jpg', 0),
(180, 141, '1688388655_8e224857a2e68739b42d.jpg', 0),
(181, 141, '1688388655_f77009a630e5b6e238d5.jpg', 0),
(182, 141, '1688388656_d30d103e2b74909d188d.jpg', 0),
(183, 141, '1688388656_196ff16e0838d8d15df0.jpg', 0),
(184, 141, '1688388657_5db899ddb3cbdf8fd229.jpg', 0),
(185, 142, '1688454651_8649453fb231a073e67b.jpg', 1),
(186, 142, '1688454652_5c291295917d41d6ef40.jpeg', 0),
(187, 142, '1688454652_714d3ab55f9c76e3d3af.jpg', 0),
(188, 142, '1688454653_eaa638f7297a7f9fa734.jpg', 0),
(189, 142, '1688454653_f4195e9b5c57dad41944.jpg', 0),
(190, 142, '1688454654_6c6ea2971d26d9f687f0.jpg', 0),
(191, 142, '1688454654_d7b019078c0e59ddd7d7.jpg', 0),
(192, 142, '1688454655_2bdd79041960ab5f68a3.jpg', 0),
(193, 142, '1688454655_a835a096ebb2dc8a7e8a.jpg', 0),
(194, 142, '1688454656_ae13ac9e86d43017531c.jpg', 0),
(195, 142, '1688454656_52db1c7c98adb4353685.jpg', 0),
(196, 142, '1688454657_ac5a4901b417c2836ba3.jpg', 0),
(197, 142, '1688454657_94110a7f306528a110e4.jpg', 0),
(213, 147, '1689851928_9d12aa80b095afac7b2b.jpg', 1),
(214, 147, '1689851929_f506f16da0b450b114f4.jpeg', 0),
(215, 147, '1689851929_13c5302b097a8249407e.jpg', 0),
(216, 147, '1689851929_106491df420c6087ef01.jpg', 0),
(217, 147, '1689851929_e28b7de90713d89ebd1b.jpg', 0),
(218, 147, '1689851930_b9cccbc90a1f876a7ea7.jpg', 0),
(219, 147, '1689851930_3ff33f637311cdaaf14c.jpg', 0),
(220, 147, '1689851930_f5be9594307e65337e7e.jpg', 0),
(221, 147, '1689851930_7fe49a73e5fcb2029051.jpg', 0),
(222, 147, '1689851931_7c281375f571f5bc6218.jpg', 0),
(223, 147, '1689851931_da265d918084f20774e0.jpg', 0),
(224, 147, '1689851931_cf600d6526a99577f69d.jpg', 0),
(225, 147, '1689851931_c2f0eb82a86d0695b4ca.jpg', 0),
(265, 158, '1693977688_56a11833ccfbeb39fbb2.jpg', 1),
(266, 158, '1693977688_45387a65326b6a689807.jpg', 0),
(267, 159, '1694067719_7d092255aeb099083ca4.jpg', 1),
(268, 159, '1694067719_1c5848099352b052de4e.jpg', 0),
(269, 159, '1694067719_1ef281b176e6118d0acc.jpg', 0),
(270, 159, '1694067719_e671cd20e35e6bf305aa.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `camps_seasons`
--

CREATE TABLE `camps_seasons` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `seasons_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `camps_seasons`
--

INSERT INTO `camps_seasons` (`id`, `camps_id`, `seasons_id`) VALUES
(35, 142, 2),
(38, 147, 2),
(39, 147, 4),
(48, 158, 2),
(50, 159, 2),
(68, 141, 2),
(69, 141, 3);

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
(134, 142, 10),
(135, 142, 11),
(136, 142, 15),
(137, 142, 27),
(141, 147, 1),
(142, 147, 5),
(143, 147, 25),
(144, 147, 42),
(145, 147, 45),
(171, 158, 18),
(172, 158, 22),
(173, 159, 14),
(174, 159, 22),
(175, 159, 34),
(176, 159, 38),
(195, 141, 1),
(196, 141, 2),
(197, 141, 3),
(198, 141, 15),
(199, 141, 18),
(200, 141, 27);

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `cities_id` int NOT NULL,
  `title` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_in` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `header-text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`cities_id`, `title`, `title_in`, `header-text`, `slug`) VALUES
(1, 'Москва и область', 'в Москве и области', '', 'moskva-i-oblast'),
(2, 'Санкт-Петербург и область', 'в Санкт-Петербурге и области', '', 'sankt-peterburg-i-oblast'),
(3, 'Краснодарский край', 'в Краснодарском крае', '', 'krasnodarskiy-kray'),
(4, 'Крым', 'в Крыму', '', 'crimea'),
(5, 'Адыгея', 'в Адыгее', '', 'adyigeya'),
(6, 'Алтай', 'в Алтае', '', 'altay'),
(7, 'Алтайский край', 'в Алтайском крае', '', 'altayskiy-kray'),
(8, 'Амурская область', 'в Амурской области', '', 'amurskaya-oblast'),
(9, 'Астраханская область', 'в Астраханской области', '', 'astrahanskaya-oblast'),
(10, 'Башкортостан', 'в Башкортостане', '', 'bashkortostan'),
(11, 'Балгородская область', 'в Белгородской области', '', 'belgorodskaya-oblast'),
(12, 'Брянская область', 'в Брянской области', '', 'bryanskaya-oblast'),
(13, 'Бурятия', 'в Бурятии', '', 'buryatiya'),
(14, 'Владимирская область', 'во Владимирской области', '', 'vladimirskaya-oblast'),
(15, 'Вологодская область', 'в Вологодской области', '', 'volgogradskaya-oblast'),
(16, 'Воронежская область', 'в Воронежской области', '', 'voronezhskaya-oblast'),
(17, 'Дагестан', 'в Дагестане', '', 'dagestan'),
(18, 'Забайкальский край', '', '', 'zabaykalskiy-kray'),
(19, 'Ивановская область', '', '', 'ivanovskaya-oblast'),
(20, 'Ингушетия', '', '', 'ingushetia'),
(21, 'Иркутская область', '', '', 'irkutskaya-oblast'),
(22, 'Кабардино-Балкария', '', '', 'kabardino-balkaria'),
(23, 'Калининградская область', '', '', 'kaliningradskaya-oblast'),
(24, 'Калужская область', '', '', 'kaluzhskaya-oblast'),
(25, 'Камчатский край', '', '', 'kamchatskiy-kray'),
(26, 'Карачаево-Черкессия', '', '', 'karachaevo-cherkessiya'),
(27, 'Карелия', '', '', 'kareliya'),
(28, 'Кемеровская область', '', '', 'kemerovskaya-oblast'),
(29, 'Кировская область', '', '', 'kirov'),
(30, 'Коми', '', '', 'komi'),
(31, 'Костромская область', '', '', 'kostromskaya-oblast'),
(32, 'Красноярский край', '', '', 'krasnoyarskiy-kray'),
(33, 'Курганская область', '', '', 'kurganskaya-oblast'),
(34, 'Курская область', '', '', 'kurskaya-oblast'),
(35, 'Липецкая область', '', '', 'lipetskaya-oblast'),
(36, 'Марий Эл', '', '', 'mariy-yel'),
(37, 'Мордовия', '', '', 'mordoviya'),
(38, 'Мурманская область', '', '', 'murmanskaya-oblast'),
(39, 'Нижегородская область', '', '', 'nizhegorodskaya-oblast'),
(40, 'Новгородская область', '', '', 'novgorodskaya-oblast'),
(41, 'Новосибирская область', '', '', 'novosibirskaya-oblast'),
(42, 'Омская область', '', '', 'omskaya-oblast'),
(43, 'Оренбургская область', '', '', 'orenburgskaya-oblast'),
(44, 'Орловская область', '', '', 'orlovskaya-oblast'),
(45, 'Пензенская область', '', '', 'penzenskaya-oblast');

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
  `token` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activated` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `representatives`
--

INSERT INTO `representatives` (`user_id`, `cities_id`, `organization`, `inn`, `director`, `director_phone`, `firstname_manager`, `lastname_manager`, `post`, `email_manager`, `phone_manager`, `password`, `token`, `created_at`, `activated`) VALUES
(17, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$0aQKMdWdMVkgeXY.s92ENu1SHY2JnTR9b.JJkT1KZkei1TNFNE00e', '', '2023-05-17 17:46:18', 0),
(18, 2, 'ООО \"Северная волна\" ', '7823437625645', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfghhfd@ya.ru', '434234234234', '$2y$10$2QjjtGR01gDx5xmMpvLqgeSEPCuQaEY4q4Vw618L/IrIyE64HhNHe', '', '2023-05-17 19:14:47', 0),
(19, 1, 'ИП Горбунов В.В.', '463654', 'ррва', 'р5463634634', '4646', '346', '6346456', 'fghfghhf4646d@ya.ru', '66346346', '$2y$10$bURtZX7KYLgskMAlUupAs.ga5jnZXJYq/uMaNuoecMlYoIyVAL91.', '', '2023-05-17 19:27:11', 0),
(20, 2, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'limitorg2016@yandex.ru', '434234234234', '$2y$10$weryQYmCJGcYMvMQgMsZjOxWS9/6s915F127Zy9QFqq1QELLSlGRO', '$2y$10$kkqjuCiRiOxASC8aQmS3A.JFnZsx5Srn/q82.7v5S9JX0kRA7/tAy', '2023-05-18 08:17:05', 1),
(21, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'limitorg201643@yandex.ru', '56756756', '$2y$10$qRkDC2VrC3b6rR7pMH8GSOmerVmYzb9ef1AJRK1k85iJKOkf.N9vC', '', '2023-05-18 08:18:46', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `name` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `booking_number` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `advantages` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `disadvantages` text NOT NULL,
  `rating` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `camps_id`, `name`, `booking_number`, `advantages`, `disadvantages`, `rating`) VALUES
(2, 1, 'Виктор', 'Иванов', 'Хороший лагерь', '', 4),
(4, 1, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', '', 4),
(5, 142, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', '', 4),
(7, 2, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', '', 4),
(9, 142, 'Илья', 'Ивановg', 'Хороший лагерь gdf', '', 5),
(12, 142, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', '', 4),
(13, 142, '23123', 'Ивановg', 'Хороший лагерь gdf', '', 2),
(14, 141, 'Ольга', '452423423', 'Хороший лагерь, детям понравилось. Отношение вожатых хорошее. Порадовало наличии охраны.', 'Нет.', 4),
(15, 142, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', '', 4),
(16, 141, 'Анна', '452423423', 'Хороший лагерь, детям понравилось. Отношение вожатых хорошее. Порадовало наличии охраны.', 'Нет.', 5),
(17, 142, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', '', 4);

-- --------------------------------------------------------

--
-- Структура таблицы `seasons`
--

CREATE TABLE `seasons` (
  `seasons_id` int NOT NULL,
  `title` varchar(80) NOT NULL,
  `title_in` varchar(200) NOT NULL,
  `slug` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `seasons`
--

INSERT INTO `seasons` (`seasons_id`, `title`, `title_in`, `slug`) VALUES
(1, 'Весна', 'Весенние', 'spring'),
(2, 'Лето', 'Летние', 'summer'),
(3, 'Осень', 'Осенние', 'autumn'),
(4, 'Зима', 'Зимние', 'winter');

-- --------------------------------------------------------

--
-- Структура таблицы `shifts`
--

CREATE TABLE `shifts` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `title` varchar(250) NOT NULL,
  `price` int NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `shifts`
--

INSERT INTO `shifts` (`id`, `camps_id`, `title`, `price`, `start_date`, `end_date`) VALUES
(31, 141, 'Осень 2', 125000, '2023-10-01', '2023-10-31');

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
(1, 'Языковой лагерь', 'языковые лагеря', 'language'),
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
-- Индексы таблицы `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`),
  ADD KEY `camps_id` (`camps_id`);

--
-- Индексы таблицы `camps_types`
--
ALTER TABLE `camps_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camps_id` (`camps_id`);

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
-- Индексы таблицы `shifts`
--
ALTER TABLE `shifts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camps_id` (`camps_id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`types_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT для таблицы `camps`
--
ALTER TABLE `camps`
  MODIFY `camps_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT для таблицы `camps_images`
--
ALTER TABLE `camps_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=271;

--
-- AUTO_INCREMENT для таблицы `camps_seasons`
--
ALTER TABLE `camps_seasons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT для таблицы `camps_types`
--
ALTER TABLE `camps_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT для таблицы `seasons`
--
ALTER TABLE `seasons`
  MODIFY `seasons_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

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

--
-- Ограничения внешнего ключа таблицы `camps_seasons`
--
ALTER TABLE `camps_seasons`
  ADD CONSTRAINT `camps_seasons_ibfk_1` FOREIGN KEY (`camps_id`) REFERENCES `camps` (`camps_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `camps_types`
--
ALTER TABLE `camps_types`
  ADD CONSTRAINT `camps_types_ibfk_1` FOREIGN KEY (`camps_id`) REFERENCES `camps` (`camps_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `shifts`
--
ALTER TABLE `shifts`
  ADD CONSTRAINT `shifts_ibfk_1` FOREIGN KEY (`camps_id`) REFERENCES `camps` (`camps_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- База данных: `Dol1`
--
CREATE DATABASE IF NOT EXISTS `Dol1` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `Dol1`;

-- --------------------------------------------------------

--
-- Структура таблицы `camps`
--

CREATE TABLE `camps` (
  `camps_id` int NOT NULL,
  `cities_id` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `camps`
--

INSERT INTO `camps` (`camps_id`, `cities_id`, `title`, `description`) VALUES
(1, 2, 'ДОЛ \"Морская волна\"', 'ДОЛ \"Морская волна\"'),
(2, 1, 'Летний лагерь', 'Летний лагерь');

-- --------------------------------------------------------

--
-- Структура таблицы `camps_types`
--

CREATE TABLE `camps_types` (
  `id` int NOT NULL,
  `camps_id` int NOT NULL,
  `types_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `camps_types`
--

INSERT INTO `camps_types` (`id`, `camps_id`, `types_id`) VALUES
(1, 2, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `cities_id` int NOT NULL,
  `title` varchar(80) NOT NULL,
  `slug` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
  `user_id` int NOT NULL,
  `cities_id` int NOT NULL,
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
  `activated` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `representatives`
--

INSERT INTO `representatives` (`user_id`, `cities_id`, `organization`, `inn`, `director`, `director_phone`, `firstname_manager`, `lastname_manager`, `post`, `email_manager`, `phone_manager`, `password`, `created_at`, `activated`) VALUES
(17, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfgh@ya.ru', '434234234234', '$2y$10$0aQKMdWdMVkgeXY.s92ENu1SHY2JnTR9b.JJkT1KZkei1TNFNE00e', '2023-05-17 17:46:18', 0),
(18, 2, 'ООО \"Северная волна\" ', '7823437625645', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfghhfd@ya.ru', '434234234234', '$2y$10$2QjjtGR01gDx5xmMpvLqgeSEPCuQaEY4q4Vw618L/IrIyE64HhNHe', '2023-05-17 19:14:47', 0),
(19, 1, 'ИП Горбунов В.В.', '463654', 'ррва', 'р5463634634', '4646', '346', '6346456', 'fghfghhf4646d@ya.ru', '66346346', '$2y$10$bURtZX7KYLgskMAlUupAs.ga5jnZXJYq/uMaNuoecMlYoIyVAL91.', '2023-05-17 19:27:11', 0),
(20, 2, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'limitorg2016@yandex.ru', '434234234234', '$2y$10$weryQYmCJGcYMvMQgMsZjOxWS9/6s915F127Zy9QFqq1QELLSlGRO', '2023-05-18 08:17:05', 0),
(21, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'limitorg201643@yandex.ru', '56756756', '$2y$10$qRkDC2VrC3b6rR7pMH8GSOmerVmYzb9ef1AJRK1k85iJKOkf.N9vC', '2023-05-18 08:18:46', 0),
(22, 1, 'ООО \"Северная волна\" , ! =  ', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'fghfghhfd4432423@ya.ru', '434234234234', '$2y$10$88uoHAjgxNlVPaeYU7MvSugWbEhR9I9Zpid4Y9UPT0rKOeUky9mWK', '2023-05-21 10:16:02', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `types_id` int NOT NULL,
  `title` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`types_id`, `title`) VALUES
(1, 'Спортивный'),
(2, 'Оздоровительный');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `camps`
--
ALTER TABLE `camps`
  ADD PRIMARY KEY (`camps_id`);

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
  MODIFY `camps_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `camps_types`
--
ALTER TABLE `camps_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `cities_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `representatives`
--
ALTER TABLE `representatives`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `types_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- База данных: `hookah`
--
CREATE DATABASE IF NOT EXISTS `hookah` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `hookah`;

-- --------------------------------------------------------

--
-- Структура таблицы `cities`
--

CREATE TABLE `cities` (
  `id_city` int NOT NULL,
  `title` varchar(30) NOT NULL,
  `phrase` varchar(25) NOT NULL,
  `slug` varchar(20) NOT NULL,
  `url` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `cities`
--

INSERT INTO `cities` (`id_city`, `title`, `phrase`, `slug`, `url`) VALUES
(1, 'Санкт-Петербург', 'в Санкт-Петербурге', 'spb', '/'),
(3, 'Колпино', 'в Колпино', 'kolpino', ''),
(4, 'Москва', 'в Москве', 'moskva', ''),
(5, 'Новосибирск', 'в Новосибирске', 'novosibirsk', ''),
(6, 'Екатеринбург', 'в Екатеринбурге', 'ekaterinburg', ''),
(7, 'Казань', 'в Казани', 'kazan', ''),
(8, 'Нижний Новгород', 'в Нижнем Новгороде', 'nizhniy-novgorod', '');

-- --------------------------------------------------------

--
-- Структура таблицы `hookahs`
--

CREATE TABLE `hookahs` (
  `id` int NOT NULL,
  `city_id` int NOT NULL,
  `metro_id` int NOT NULL,
  `id_user` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `min_price` int NOT NULL,
  `image` varchar(40) NOT NULL,
  `description` text NOT NULL,
  `opening_time` varchar(10) NOT NULL,
  `closing_time` varchar(10) NOT NULL,
  `premium` int NOT NULL,
  `active` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hookahs`
--

INSERT INTO `hookahs` (`id`, `city_id`, `metro_id`, `id_user`, `title`, `slug`, `min_price`, `image`, `description`, `opening_time`, `closing_time`, `premium`, `active`) VALUES
(89, 1, 1, 0, 'Hop & Goose', 'hop-and-goose-hookah', 800, 'BJXSomgn4L.jpeg', 'Кальянная в Санкт-Петербурге Hop & Goose - мы изменились, все для того чтобы радовать Вас!  Теперь у нас Вы сможете попробовать не только множество сортов пенного, а также оценить лучшее гриль меню в квартале и насладиться миксом из премиальных табаков на самых современных кальянах. Мы задрали планку, локальный бар должен выглядеть именно так!', '12:49', '17:00', 0, 0),
(94, 4, 16, 0, 'Перестройка', 'perestroyka-hookah', 1500, 'rJxaWdMG-F.jpeg', 'Перестройка — это бар, меняющий формат ровно в полночь. Днем это чилаут-пространство с облегченным дневным меню и непринужденной обстановкой. Ночью это вечеринка в большом городе!', '18:00', '04:00', 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `hookah_images`
--

CREATE TABLE `hookah_images` (
  `id` int NOT NULL,
  `id_hookah` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `cover` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `hookah_images`
--

INSERT INTO `hookah_images` (`id`, `id_hookah`, `name`, `cover`) VALUES
(40, 87, 'HJFhzINVwM.jpeg', 0),
(41, 87, 'HJkldds6hrU.jpeg', 0),
(42, 87, 'HyZeOOs6nBU.jpeg', 0),
(43, 87, 'r1B_uipnSL.jpeg', 1),
(44, 87, 'rkdOsp3BU.jpeg', 0),
(45, 87, 'rkldOipnHL.jpeg', 0),
(46, 87, 'S1fu_iThHL.jpeg', 0),
(50, 89, 'BkGSoXg3VL.jpeg', 0),
(51, 89, 'HybSjmx2NL.jpeg', 0),
(52, 89, 'rylro7lhEI.jpeg', 0),
(53, 94, 'B1QpWuMzZF.jpeg', 0),
(54, 94, 'HJWSLuGGZt.jpeg', 0),
(55, 94, 'HygSIuGGZY.jpeg', 0),
(56, 94, 'SkHIdMf-Y.jpeg', 0),
(57, 95, 'HJkldds6hrU.jpeg', 0),
(58, 95, 'HJWSLuGGZt.jpeg', 0),
(59, 95, 'HybSjmx2NL.jpeg', 0),
(60, 96, 'HJkldds6hrU.jpeg', 0),
(61, 96, 'HJWSLuGGZt.jpeg', 0),
(62, 96, 'HybSjmx2NL.jpeg', 0),
(63, 97, 'HJkldds6hrU.jpeg', 0),
(64, 97, 'HJWSLuGGZt.jpeg', 0),
(65, 97, 'HybSjmx2NL.jpeg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `metro`
--

CREATE TABLE `metro` (
  `id_metro` int NOT NULL,
  `id_city` int NOT NULL,
  `title` varchar(100) NOT NULL,
  `slug_metro` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `metro`
--

INSERT INTO `metro` (`id_metro`, `id_city`, `title`, `slug_metro`) VALUES
(1, 1, 'Автово', 'avtovo'),
(2, 1, 'Адмиралтейская', ''),
(3, 1, 'Академическая', ''),
(4, 1, 'Балтийская', ''),
(5, 1, 'Боровая', ''),
(6, 1, 'Броневая', ''),
(7, 1, 'Бухарестская', ''),
(8, 1, 'Василеостровская', ''),
(9, 1, 'Владимирская', ''),
(10, 1, 'Волковская', ''),
(11, 1, 'Выборгская', ''),
(12, 1, 'Горьковская', ''),
(13, 1, 'Гражданский проспект', ''),
(14, 1, 'Гостиный двор', ''),
(15, 1, 'Девяткино', ''),
(16, 1, 'Достоевская', ''),
(17, 1, 'Дунайская', ''),
(18, 1, 'Елизаровская', ''),
(19, 1, 'Звёздная', ''),
(20, 1, 'Звенигородская', ''),
(21, 1, 'Кировский завод\r\n', ''),
(22, 1, 'Комендантский проспект\r\n', ''),
(23, 1, 'Крестовский остров\r\n', ''),
(24, 1, 'Купчино', ''),
(25, 1, 'Ладожская', ''),
(26, 1, 'Ленинский проспект\r\n', ''),
(27, 1, 'Лесная', ''),
(28, 1, 'Лиговский проспект\r\n', ''),
(29, 1, 'Ломоносовская', ''),
(30, 1, 'Маяковская', ''),
(31, 1, 'Международная', ''),
(32, 1, 'Московская', ''),
(33, 1, 'Московские ворота', ''),
(34, 1, 'Нарвская', ''),
(35, 1, 'Невский проспект', ''),
(36, 1, 'Новочеркасская', ''),
(37, 1, 'Обводный канал', ''),
(38, 1, 'Обухово', ''),
(39, 1, 'Озерки', ''),
(40, 1, 'Парк Победы', ''),
(41, 1, 'Парнас', ''),
(42, 1, 'Петроградская', ''),
(43, 1, 'Пионерская', ''),
(44, 1, 'Площадь Александра Невского', ''),
(45, 1, 'Площадь Восстания', ''),
(46, 1, 'Площадь Ленина', ''),
(47, 1, 'Площадь Мужества', ''),
(48, 1, 'Политехническая', ''),
(49, 1, 'Приморская', ''),
(50, 1, 'Пролетарская', ''),
(51, 1, 'Проспект Большевиков', ''),
(52, 1, 'Проспект Ветеранов', ''),
(53, 1, 'Проспект Просвещения', ''),
(54, 1, 'Пушкинская', ''),
(55, 1, 'Рыбацкое', ''),
(56, 1, 'Садовая', ''),
(57, 1, 'Сенная площадь', ''),
(58, 1, 'Спасская', ''),
(59, 1, 'Спортивная', ''),
(60, 1, 'Старая деревня', ''),
(61, 1, 'Технологический институт', ''),
(62, 1, 'Удельная', ''),
(63, 1, 'Улица Дыбенко', ''),
(64, 1, 'Фрунзенская', ''),
(65, 1, 'Черная речка', ''),
(66, 1, 'Чернышевская', ''),
(67, 1, 'Чкаловская', ''),
(68, 1, 'Электросила', ''),
(69, 2, 'Авиамоторная', '');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `id_hookah` int NOT NULL,
  `email` varchar(15) NOT NULL,
  `firstname` varchar(15) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `rating` int NOT NULL,
  `text` text NOT NULL,
  `active` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `id_hookah`, `email`, `firstname`, `lastname`, `rating`, `text`, `active`) VALUES
(1, 1, '', 'Евгений', 'Иванов', 5, 'Лучшая кальянная в городе!', 0),
(2, 89, '', 'Игорь', 'Степанов', 4, 'Отличная кальянная! ', 0),
(3, 2, '', 'Виктор', 'Травников', 5, 'Замечательное место для отдыха.', 0),
(5, 0, '', 'Qiang', '', 0, '', 0),
(16, 89, 'ggggg@ya.ru', 'ggggg', 'gggggg', 5, 'dfgdfgdfgdfgdfg', 0),
(17, 89, 'ggggg@ya.ru', 'ggggg', 'gggggg', 3, 'dfgdfgdfgdfgdfg', 0),
(18, 87, 'ffghfgh@yandex.', 'Валерий', 'аываываа', 5, 'ываываываыв', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `id_city` int NOT NULL,
  `email` varchar(30) NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `orgname` varchar(25) NOT NULL,
  `post` varchar(20) NOT NULL,
  `inn` varchar(15) NOT NULL,
  `ogrn` varchar(20) NOT NULL,
  `premium` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id_user`, `id_city`, `email`, `firstname`, `lastname`, `phone`, `password`, `orgname`, `post`, `inn`, `ogrn`, `premium`) VALUES
(6, 1, 'limitorg2016@yandex.ru', 'Владислав', 'Горбунов', '+79119204952', '$2y$10$zVd1xbyfO4aToVLtXbjkruGtn2mSpxvdyfpUi4gvQHx57RukmbVcu', 'ИП Горбунов В.В.', 'Руководитель', '6537812546', '7734632356', 0);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id_city`);

--
-- Индексы таблицы `hookahs`
--
ALTER TABLE `hookahs`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `hookah_images`
--
ALTER TABLE `hookah_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hookah` (`id_hookah`);

--
-- Индексы таблицы `metro`
--
ALTER TABLE `metro`
  ADD PRIMARY KEY (`id_metro`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cities`
--
ALTER TABLE `cities`
  MODIFY `id_city` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `hookahs`
--
ALTER TABLE `hookahs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT для таблицы `hookah_images`
--
ALTER TABLE `hookah_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT для таблицы `metro`
--
ALTER TABLE `metro`
  MODIFY `id_metro` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- База данных: `site`
--
CREATE DATABASE IF NOT EXISTS `site` DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci;
USE `site`;

-- --------------------------------------------------------

--
-- Структура таблицы `camp`
--

CREATE TABLE `camp` (
  `id_camp` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `camp`
--

INSERT INTO `camp` (`id_camp`, `title`, `description`) VALUES
(2, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(3, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(4, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(5, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(6, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(7, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(8, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(9, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(10, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(11, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(12, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(13, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(14, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(15, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(16, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(17, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(18, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(19, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(20, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(21, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(22, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(23, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(24, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(25, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(26, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(27, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(28, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(29, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(30, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(31, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(32, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(33, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(34, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(35, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(36, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(37, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(38, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(39, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(40, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(41, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(42, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(43, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(44, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(45, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(46, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(47, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(48, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(49, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(50, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(51, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(52, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(53, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(54, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(55, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(56, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(57, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(58, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(59, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(60, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(61, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(62, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(63, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(64, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(65, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(66, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(67, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(68, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(69, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(70, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(71, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(72, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(73, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(74, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(75, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(76, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(77, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(78, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(79, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(80, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(81, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(82, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(83, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(84, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(85, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(86, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(87, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(88, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(89, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(90, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(91, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg');
INSERT INTO `camp` (`id_camp`, `title`, `description`) VALUES
(92, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(93, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(94, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(95, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(96, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(97, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(98, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(99, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(100, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(101, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(102, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(103, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(104, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(105, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(106, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(107, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(108, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(109, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(110, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(111, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(112, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(113, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(114, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(115, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(116, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(117, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(118, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(119, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(120, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(121, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(122, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(123, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(124, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(125, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(126, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(127, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(128, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(129, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(130, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(131, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(132, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(133, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(134, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(135, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(136, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(137, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(138, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(139, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(140, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(141, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(142, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(143, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(144, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(145, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(146, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(147, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(148, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(149, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(150, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(151, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(152, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(153, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(154, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(155, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(156, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(157, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(158, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(159, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(160, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(161, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(162, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(163, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(164, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(165, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(166, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(167, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(168, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(169, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(170, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(171, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(172, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(173, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(174, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(175, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(176, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(177, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(178, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(179, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(180, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(181, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg');
INSERT INTO `camp` (`id_camp`, `title`, `description`) VALUES
(182, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(183, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(184, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(185, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(186, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(187, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(188, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(189, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(190, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(191, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(192, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(193, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(194, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(195, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(196, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(197, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(198, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(199, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(200, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(201, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(202, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(203, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(204, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(205, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(206, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(207, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(208, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(209, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(210, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(211, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(212, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(213, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(214, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(215, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(216, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(217, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(218, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(219, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(220, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(221, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(222, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(223, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(224, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(225, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(226, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(227, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(228, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(229, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(230, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(231, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(232, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(233, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(234, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(235, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(236, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(237, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(238, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(239, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(240, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(241, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(242, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(243, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(244, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(245, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(246, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(247, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(248, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(249, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(250, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', ''),
(251, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(252, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(253, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(254, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(255, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(256, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(257, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(258, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(259, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(260, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(261, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(262, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(263, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(264, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(265, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(266, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(267, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(268, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(269, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(270, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(271, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(272, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg');
INSERT INTO `camp` (`id_camp`, `title`, `description`) VALUES
(273, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(274, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(275, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(276, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(277, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(278, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(279, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(280, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(281, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(282, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(283, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(284, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(285, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(286, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(287, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(288, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(289, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(290, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(291, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(292, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(293, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(294, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(295, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(296, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(297, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(298, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(299, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(300, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(301, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(302, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(303, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(304, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(305, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(306, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(307, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(308, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(309, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(310, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(311, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(312, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(313, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(314, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(315, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(316, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(317, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(318, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(319, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(320, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', 'gfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsggfggsghfgfsgdsfgdfsgdsfgdsgdsg'),
(321, 'gfggsghfgfsgdsfgdfsgdsfgdsgdsg', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id_user` int NOT NULL,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `login` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `camp`
--
ALTER TABLE `camp`
  ADD PRIMARY KEY (`id_camp`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `camp`
--
ALTER TABLE `camp`
  MODIFY `id_camp` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=322;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
