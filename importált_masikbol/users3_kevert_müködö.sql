-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 02. 13:08
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
-- Tábla szerkezet ehhez a táblához `users3_kevert`
--

CREATE TABLE `users3_kevert` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `users3_kevert`
--

INSERT INTO `users3_kevert` (`id`, `username`, `email`, `password`) VALUES
(1, 'test', 'test@test.com', '$2y$10$kIa/HfpPw3ChzvTA1h2Ca.TWBeBn./tSoz6avfVkSIygcMXZ2kyDS'),
(2, 'test1', 'test1@test.com', '$2y$10$S5Ucxeze566p5UhStMHmH.TsS0mEPxmPR0v2W2X8UhMUGc3EZ4RAS'),
(3, 'Pöffu', 'poffpoff@poff.hu', '$2y$10$9owNYnlyqRbnR9jdHwGWB.K5STX7YJGO/UaW2xHICDAdnvtCpyahG'),
(4, 'GenericTestAccount', 'GenericTestAccount@test.hu', '$2y$13$kymCYF3CoE6qCnFd9.4wk.TM2ruY7UQla95oc5tpshULOgnXrysRK');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `users3_kevert`
--
ALTER TABLE `users3_kevert`
  ADD PRIMARY KEY (`id`,`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `users3_kevert`
--
ALTER TABLE `users3_kevert`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
