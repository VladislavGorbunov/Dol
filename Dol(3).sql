-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 21 2023 г., 15:23
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
-- Структура таблицы `bookings`
--

CREATE TABLE `bookings` (
  `id` int NOT NULL,
  `fio` varchar(250) NOT NULL,
  `telephone` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `camp_id` int NOT NULL,
  `shift_id` int NOT NULL,
  `booking_number` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `bookings`
--

INSERT INTO `bookings` (`id`, `fio`, `telephone`, `email`, `camp_id`, `shift_id`, `booking_number`) VALUES
(24, 'Иванов Иван Иванович', '+79119209933', 'demo@ya.ru', 141, 17, ''),
(25, 'Иванов Иван Иванович', '+79119204952', 'demo@ya.ru', 141, 18, ''),
(26, 'Иванов Иван Иванович', '23423423', 'demo@ya.ru', 141, 8, 'З-2107233119-774'),
(27, 'екррарпа', 'пврврар', 'demo@ya.ru', 141, 19, 'В-2107232205-821');

-- --------------------------------------------------------

--
-- Структура таблицы `camps`
--

CREATE TABLE `camps` (
  `camps_id` int NOT NULL,
  `representatives_id` int NOT NULL,
  `cities_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `adress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `advantages` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `daily_schedule` text COLLATE utf8mb4_unicode_ci NOT NULL,
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

INSERT INTO `camps` (`camps_id`, `representatives_id`, `cities_id`, `title`, `slug`, `adress`, `year`, `description`, `advantages`, `daily_schedule`, `min_age`, `max_age`, `free_transfer`, `vk_link`, `site_link`, `coords`) VALUES
(141, 20, 1, 'Финский лагерь на берегу', 'finskiy-lager-na-beregu', 'Москва, Северный административный округ, район Беговой', 1990, '', '', '', 0, 10, 0, '', '', '55.78534717894985,37.54862193066406'),
(142, 20, 1, 'Cool Kids', 'cool-kids', 'Москва, Большая Семёновская улица, 20', 1990, '<p>Программа Cool Kids - уникальная программа: изучение английского языка в игровой форме, в течение всей смены видео и разговорный клуб с русскими и иностранными преподавателями. Опытные педагоги и носители языка языкового центра Cool School помогут маленьким лингвистам проникнуть в тайны английского языка, поближе познакомиться с культурой и традициями англоговорящих стран и улучшить свой английский!</p><p><strong>Насыщенный веселый досуг</strong> придаст ребятам волшебное настроение, ведь мы при деле целый день:</p><ul><li>Спортивные мероприятия.</li><li>Мастер классы.</li><li>Подвижные и настольные игры, игры на развитие логики и мышления.</li><li>Квесты.</li><li>Дискотеки.</li><li>Концерты, выступления, песни под гитару.</li><li>Итоговые спектакли и съемки видео-проектов.</li><li>Бассейн.</li><li>Веревочный парк.</li></ul><p>Интересное времяпровождение непременно надолго запомнится ребенку и он захочет приехать снова.</p>', '<p>Мы гарантируем Вам абсолютную сохранность жизни и здоровья Вашего ребенка в детском лагере.<br>И вот благодаря чему:</p><ul><li>Внимательное отношение к Вашему ребенку. Вожатый всегда рядом и всегда знает чем занимается ребенок.</li><li>Круглосуточная телефонная связь с администрацией лагеря. Вы всегда в курсе дела.</li><li>Все помещения лагеря соответствуют санитарно-гигиеническим нормам и технике безопасности (СанПин).</li><li>Постоянное присутствие на территории лагеря медицинских работников и наличие медпункта со всеми необходимыми лекарствами для оказания первой медицинской помощи.</li><li>Медицинская страховка на период заезда.</li><li>Круглосуточно охраняемая территория лагеря с видеонаблюдением.</li></ul><p>Безопасность – наш главный приоритет!</p>', '<ul><li>08:00 подъем</li><li>08:15 бодрячок</li><li>08:35 водные процедуры</li><li>09:00 завтрак</li><li>09:30 отрядное время</li><li>10:00–11:30 английский 1 / приключения 2</li><li>11:30–13:00 английский 2 / приключения 1</li><li>13:10 обед</li><li>13:40–15:00 тихий час / общение с родителями</li><li>15:15 полдник</li><li>15:30 отрядное время</li><li>16:00–17:30 английский 1 / приключения 2</li><li>17:30–19:00 английский 2 / приключения 1</li><li>19:10 ужин</li><li>19:40 общие вечерние мероприятия</li><li>21:20 свечка / второй ужин</li><li>21:50 водные процедуры</li><li>22:30 отбой / сказка на ночь</li></ul><p>Каждые 5 дней в лагере дети посещают бассейн и веревочный городок.<br>В первый день – тестирование на уровень английского языка.</p><ul><li>14.30–15.00 выдача телефонов детям</li><li>14.00–14.30 и 21.50 – 22.20 чаепитие, сладости</li></ul>', 0, 10, 0, '', '', '55.78186474291037,37.70517710644531'),
(147, 20, 2, 'ДОЛ Карелия старс', 'dol-kareliya-stars', 'Республика Карелия, Лахденпохский район, Куркиёкское сельское поселение', 1990, '<p>аыавыаыва</p>', '<p>ываываы</p>', '<p>ываыва</p>', 5, 15, 0, '', '', '61.35656340921557,29.755922962751118');

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
(225, 147, '1689851931_c2f0eb82a86d0695b4ca.jpg', 0);

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
(34, 141, 2),
(35, 142, 2),
(38, 147, 2),
(39, 147, 4);

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
(130, 141, 2),
(131, 141, 15),
(132, 141, 18),
(133, 141, 27),
(134, 142, 10),
(135, 142, 11),
(136, 142, 15),
(137, 142, 27),
(141, 147, 1),
(142, 147, 5),
(143, 147, 25),
(144, 147, 42),
(145, 147, 45);

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
(1, 'Москва и область', 'в Москве и области', 'moskva-i-oblast'),
(2, 'Санкт-Петербург и область', 'в Санкт-Петербурге и области', 'sankt-peterburg-i-oblast'),
(3, 'Краснодарский край', 'в Краснодарском крае', 'krasnodarskiy-kray'),
(4, 'Крым', 'в Крыму', 'crimea'),
(5, 'Адыгея', 'в Адыгее', 'adyigeya'),
(6, 'Алтай', 'в Алтае', 'altay'),
(7, 'Алтайский край', 'в Алтайском крае', 'altayskiy-kray'),
(8, 'Амурская область', 'в Амурской области', 'amurskaya-oblast'),
(9, 'Астраханская область', 'в Астраханской области', 'astrahanskaya-oblast'),
(10, 'Башкортостан', 'в Башкортостане', 'bashkortostan'),
(11, 'Балгородская область', 'в Белгородской области', 'belgorodskaya-oblast'),
(12, 'Брянская область', 'в Брянской области', 'bryanskaya-oblast'),
(13, 'Бурятия', 'в Бурятии', 'buryatiya'),
(14, 'Владимирская область', 'во Владимирской области', 'vladimirskaya-oblast'),
(15, 'Вологодская область', 'в Вологодской области', 'volgogradskaya-oblast'),
(16, 'Воронежская область', 'в Воронежской области', 'voronezhskaya-oblast'),
(17, 'Дагестан', 'в Дагестане', 'dagestan'),
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
(21, 1, 'ИП Горбунов В.В.', '5345353453', 'Горбунов В.В.', '4234234234', 'Иван', 'Иванов', 'Менеджер', 'limitorg201643@yandex.ru', '56756756', '$2y$10$qRkDC2VrC3b6rR7pMH8GSOmerVmYzb9ef1AJRK1k85iJKOkf.N9vC', '2023-05-18 08:18:46', 0);

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
(5, 142, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', 4),
(7, 2, 'Викторg', 'Ивановg', 'Хороший лагерь gdf', 4),
(8, 4, 'Илья', 'Ивановg', 'Хороший лагерь gdf', 5),
(9, 142, 'Илья', 'Ивановg', 'Хороший лагерь gdf', 5);

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
(8, 141, 'Смена 1', 4234234, '2023-07-01', '2023-07-31'),
(9, 141, 'Смена 2', 47000, '2023-08-01', '2023-08-31'),
(17, 141, 'Смена 3', 12000, '2023-07-14', '2023-07-31'),
(18, 141, 'Смена 4', 45000, '2023-07-12', '2023-07-31'),
(19, 141, 'пввапвап', 56000, '2023-07-12', '2023-07-28'),
(20, 141, 'пвапвап', 5423423, '2023-06-29', '2023-07-31'),
(21, 141, 'впрва', 2423, '2023-07-12', '2023-07-31'),
(22, 141, 'куку', 2323, '2023-06-26', '2023-07-25'),
(23, 142, 'Смена на лето', 45000, '2023-07-01', '2023-08-31');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `camps`
--
ALTER TABLE `camps`
  MODIFY `camps_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;

--
-- AUTO_INCREMENT для таблицы `camps_images`
--
ALTER TABLE `camps_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT для таблицы `camps_seasons`
--
ALTER TABLE `camps_seasons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `camps_types`
--
ALTER TABLE `camps_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

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
-- AUTO_INCREMENT для таблицы `shifts`
--
ALTER TABLE `shifts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
