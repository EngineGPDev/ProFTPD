SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Структура таблицы `quotalimits`
--

CREATE TABLE `quotalimits` (
  `name` varchar(30) DEFAULT NULL,
  `quota_type` enum('user','group','class','all') NOT NULL,
  `per_session` enum('false','true') NOT NULL,
  `limit_type` enum('soft','hard') NOT NULL,
  `bytes_in_avail` float NOT NULL DEFAULT 0,
  `bytes_out_avail` float NOT NULL DEFAULT 0,
  `bytes_xfer_avail` float NOT NULL DEFAULT 0,
  `files_in_avail` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `files_out_avail` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `files_xfer_avail` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `quotatallies`
--

CREATE TABLE `quotatallies` (
  `name` varchar(30) NOT NULL,
  `quota_type` enum('user','group','class','all') NOT NULL,
  `bytes_in_used` float NOT NULL DEFAULT 0,
  `bytes_out_used` float NOT NULL DEFAULT 0,
  `bytes_xfer_used` float NOT NULL DEFAULT 0,
  `files_in_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `files_out_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `files_xfer_used` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `uid` int(11) NOT NULL,
  `gid` int(11) NOT NULL DEFAULT 1000,
  `homedir` varchar(255) NOT NULL,
  `shell` varchar(255) NOT NULL DEFAULT '/bin/false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
