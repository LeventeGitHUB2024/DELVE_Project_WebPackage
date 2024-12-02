-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 02. 13:50
-- Kiszolgáló verziója: 10.4.32-MariaDB
-- PHP verzió: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `auth`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users1`
--

CREATE TABLE `users1` (
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users1`
--

INSERT INTO `users1` (`username`, `email`, `password`) VALUES
('GenericTestAccount', 'GenericTestAccount@test.hu', '$2y$13$kymCYF3CoE6qCnFd9.4wk.TM2ruY7UQla95oc5tpshULOgnXrysRK'),
('Pöffu', 'poffpoff@poff.hu', '$2y$10$9owNYnlyqRbnR9jdHwGWB.K5STX7YJGO/UaW2xHICDAdnvtCpyahG'),
('test1', 'test1@test.com', '$2y$10$S5Ucxeze566p5UhStMHmH.TsS0mEPxmPR0v2W2X8UhMUGc3EZ4RAS'),
('test', 'test@test.com', '$2y$10$kIa/HfpPw3ChzvTA1h2Ca.TWBeBn./tSoz6avfVkSIygcMXZ2kyDS');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `users1`
--
ALTER TABLE `users1`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `username` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
