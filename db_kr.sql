-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Мар 30 2023 г., 06:53
-- Версия сервера: 10.4.24-MariaDB
-- Версия PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `db_kr`
--

-- --------------------------------------------------------

--
-- Структура таблицы `_bookfund`
--

CREATE TABLE `_bookfund` (
  `id` int(11) NOT NULL,
  `is_taken` varchar(100) DEFAULT NULL,
  `library_cod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `_catalog`
--

CREATE TABLE `_catalog` (
  `id` int(11) NOT NULL,
  `library_cod` int(11) DEFAULT NULL,
  `author_book` varchar(100) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `publisher` varchar(100) DEFAULT NULL,
  `year_starts` date DEFAULT NULL,
  `pages` int(11) DEFAULT NULL,
  `theme` varchar(100) DEFAULT NULL,
  `price` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `_extraditionbook`
--

CREATE TABLE `_extraditionbook` (
  `id` int(11) NOT NULL,
  `book_id` int(11) DEFAULT NULL,
  `reader_id` int(11) DEFAULT NULL,
  `date_given` date DEFAULT NULL,
  `date_returned` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `_reader`
--

CREATE TABLE `_reader` (
  `reader_id` int(11) NOT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `home_phone` varchar(100) DEFAULT NULL,
  `work_phone` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `_bookfund`
--
ALTER TABLE `_bookfund`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_cod` (`library_cod`);

--
-- Индексы таблицы `_catalog`
--
ALTER TABLE `_catalog`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `library_cod` (`library_cod`);

--
-- Индексы таблицы `_extraditionbook`
--
ALTER TABLE `_extraditionbook`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `book_id` (`book_id`,`reader_id`),
  ADD KEY `reader_id` (`reader_id`);

--
-- Индексы таблицы `_reader`
--
ALTER TABLE `_reader`
  ADD PRIMARY KEY (`reader_id`);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `_catalog`
--
ALTER TABLE `_catalog`
  ADD CONSTRAINT `_catalog_ibfk_1` FOREIGN KEY (`library_cod`) REFERENCES `_bookfund` (`library_cod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `_extraditionbook`
--
ALTER TABLE `_extraditionbook`
  ADD CONSTRAINT `_extraditionbook_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `_bookfund` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `_extraditionbook_ibfk_2` FOREIGN KEY (`reader_id`) REFERENCES `_reader` (`reader_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
