-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Dec 23. 15:40
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
-- Adatbázis: `delve`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `challenges_cle`
--

CREATE TABLE `challenges_cle` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `global_percentage` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `challenges_cle`
--

INSERT INTO `challenges_cle` (`Id`, `name`, `description`, `global_percentage`) VALUES
(1, 'Challenge_1', 'do something', 0),
(2, 'Challenge_2', 'Do something else', 0),
(3, 'Challenge_3', 'Do thing ', 0),
(4, 'Challenge_4', 'Do anything', 0),
(5, 'Challenge_5', 'Do stuff', 0),
(6, 'Challenge_6', 'Make a cake', 0),
(7, 'Challenge_7', 'Have a glass of water', 0),
(8, 'Challenge_8', 'How did you get this?', 0),
(9, 'Challenge_9', 'I like fish', 0),
(10, 'Challenge_10', 'You know the rule and so do I', 0);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `completion_cpn`
--

CREATE TABLE `completion_cpn` (
  `PYR_id` varchar(255) NOT NULL,
  `CLE_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `conditions_cdn`
--

CREATE TABLE `conditions_cdn` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `conditions_cdn`
--

INSERT INTO `conditions_cdn` (`Id`, `name`) VALUES
(5, 'Blinding_gas'),
(4, 'Flammable_gas'),
(7, 'God_mushroom'),
(2, 'Lava'),
(6, 'Nuts'),
(3, 'Poison_gas'),
(1, 'Water');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `groups_grp`
--

CREATE TABLE `groups_grp` (
  `SAE_ROM_id` datetime NOT NULL,
  `PYR_SAE_ROM_id` varchar(255) NOT NULL,
  `ROM_id` varchar(255) NOT NULL,
  `UNT_id` int(11) NOT NULL,
  `number` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `players_pyr`
--

CREATE TABLE `players_pyr` (
  `email` varchar(255) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `playtime` time NOT NULL DEFAULT '00:00:00',
  `games_won` int(9) NOT NULL DEFAULT 0,
  `games_lost` int(9) NOT NULL DEFAULT 0,
  `deactivated` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `players_pyr`
--

INSERT INTO `players_pyr` (`email`, `username`, `password`, `playtime`, `games_won`, `games_lost`, `deactivated`, `remember_token`) VALUES
('emil.emil@emil.emil', 'em1l.em1l', '$2y$10$Ynyd7lB6b.QIJxkBAMC9eepF/x6kDDZpCMpEEY1izmcHE4ykYYFsy', '01:01:01', 1, 2, 1, NULL),
('lime.lime@lime.lime', 'l1me.l1me', '$2y$10$KvadS/MQrqmGUH1H1yXn.Os6.UF3fKrzqfSmrcfx8gpToZOLxF/Tm', '02:02:02', 2, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rooms_rom`
--

CREATE TABLE `rooms_rom` (
  `SAE_id` datetime NOT NULL,
  `PYR_SAE_id` varchar(255) NOT NULL,
  `Coordinate` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `buildable` tinyint(1) NOT NULL,
  `connectedId` varchar(30) NOT NULL,
  `trap` varchar(50) DEFAULT NULL,
  `wall_top` varchar(50) DEFAULT NULL,
  `wall_right` varchar(50) DEFAULT NULL,
  `wall_bottom` varchar(50) DEFAULT NULL,
  `wall_left` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `rooms_rom`
--

INSERT INTO `rooms_rom` (`SAE_id`, `PYR_SAE_id`, `Coordinate`, `name`, `buildable`, `connectedId`, `trap`, `wall_top`, `wall_right`, `wall_bottom`, `wall_left`) VALUES
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_135', 'HIVE_OF_CREATURES', 0, '-170_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_225', 'TRADE_GOOD', 0, '-170_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_315', 'TRADE_GOOD', 0, '-170_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_405', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_45', 'HIVE_OF_CREATURES', 0, '-170_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_495', 'SLUMBERING_WYRM', 0, '-170_495SLU', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_585', 'RESOURCE', 0, '-170_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_675', 'RESOURCE', 0, '-170_675RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_765', 'MONSTER_VILLAGE', 0, '-170_765MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-170_855', 'MONSTER_VILLAGE', 0, '-170_765MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_135', 'TRADE_GOOD', 0, '-40_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_225', 'ABANDONED_MINE', 0, '-40_225ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_315', 'ABANDONED_MINE', 0, '-40_225ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_405', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_45', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '-40_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_495', 'CAVERN', 0, '-40_495CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_585', 'HIVE_OF_CREATURES', 0, '90_585HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_675', 'HIVE_OF_CREATURES', 0, '-40_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_765', 'HIVE_OF_CREATURES', 0, '-40_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '-40_855', 'MONSTER_VILLAGE', 0, '-170_765MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_135', 'GAS-FILLED_CHAMBER', 0, '1000_45GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_225', 'CAVERN_WITH_LARGE_CREATURE', 0, '1000_225CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_315', 'ABANDONED_MINE', 0, '1000_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_405', 'ABANDONED_MINE', 0, '1000_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_45', 'GAS-FILLED_CHAMBER', 0, '1000_45GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_495', 'MONSTER_VILLAGE', 0, '870_495MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_585', 'TRADE_GOOD', 0, '1000_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_675', 'RESOURCE', 0, '1000_675RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_765', 'ABANDONED_ROOM', 0, '1000_765ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '1000_855', 'TRADE_GOOD', 0, '1000_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_135', 'RESOURCE', 0, '220_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_225', 'RESOURCE', 0, '220_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_315', 'TRADE_GOOD', 0, '220_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_405', 'ABANDONED_MINE', 0, '220_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_45', 'CRYSTAL_CAVERN', 0, '220_45CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_495', 'TRADE_GOOD', 0, '220_495TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_585', 'TRADE_GOOD', 0, '220_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_675', 'MONSTER_VILLAGE', 0, '350_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_765', 'TRADE_GOOD', 0, '220_765TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '220_855', 'RESOURCE', 0, '220_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_135', 'TRADE_GOOD', 0, '350_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_225', 'RESOURCE', 0, '350_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_315', 'MONSTER_VILLAGE', 0, '350_495MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_405', 'MONSTER_VILLAGE', 0, '350_495MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_45', 'CRYSTAL_CAVERN', 0, '220_45CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_495', 'MONSTER_VILLAGE', 0, '350_495MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_585', 'TRADE_GOOD', 0, '350_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_675', 'MONSTER_VILLAGE', 0, '350_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_765', 'ANCHIENT_LIBRARY', 0, '480_765ANC', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '350_855', 'RESOURCE', 0, '350_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_135', 'RESOURCE', 0, '480_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_225', 'TRADE_GOOD', 0, '480_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_315', 'LOST_ARTEFACT', 0, '480_315LOS', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_405', 'TRADE_GOOD', 0, '480_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_45', 'NATURAL_MAGIC_CAVE', 0, '480_45NAT', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_495', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '480_495CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_585', 'RESOURCE', 0, '480_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_675', 'ABANDONED_ROOM', 0, '480_675ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_765', 'ANCHIENT_LIBRARY', 0, '480_765ANC', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '480_855', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_135', 'TRADE_GOOD', 0, '610_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_225', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '610_225CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_315', 'GOLEM_FORGE', 0, '610_315GOL', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_405', 'TRADE_GOOD', 0, '610_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_45', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '610_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_495', 'DEMON_PORAL', 0, '610_495DEM', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_585', 'RESOURCE', 0, '610_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_675', 'TRADE_GOOD', 0, '610_675TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_765', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '610_855', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_135', 'RESOURCE', 0, '740_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_225', 'TRADE_GOOD', 0, '740_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_315', 'CAVERN_WITH_BURROWING_BEAST', 0, '740_315CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_405', 'SLUMBERING_WYRM', 0, '740_405SLU', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_45', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '740_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_495', 'TRADE_GOOD', 0, '740_495TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_585', 'RESOURCE', 0, '740_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_675', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_765', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '740_855', 'RESOURCE', 0, '740_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_135', 'CRYSTAL_CAVERN', 0, '870_45CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_225', 'CAVERN_WITH_LARGE_CREATURE', 0, '1000_225CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_315', 'RESOURCE', 0, '870_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_405', 'TRADE_GOOD', 0, '870_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_45', 'CRYSTAL_CAVERN', 0, '870_45CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_495', 'MONSTER_VILLAGE', 0, '870_495MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_585', 'RESOURCE', 0, '870_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_675', 'TRADE_GOOD', 0, '870_675TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_765', 'TRADE_GOOD', 0, '870_765TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '870_855', 'TRADE_GOOD', 0, '870_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_135', 'TRADE_GOOD', 0, '90_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_225', 'TRADE_GOOD', 0, '90_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_315', 'RESOURCE', 0, '90_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_405', 'ABANDONED_MINE', 0, '220_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_45', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '90_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_495', 'CAVERN', 0, '-40_495CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_585', 'HIVE_OF_CREATURES', 0, '90_585HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_675', 'MONSTER_VILLAGE', 0, '350_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_765', 'MONSTER_VILLAGE', 0, '350_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-10 10:11:31', 'lime.lime@lime.lime', '90_855', 'RESOURCE', 0, '90_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_135', 'RESOURCE', 0, '-170_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_225', 'TRADE_GOOD', 0, '-170_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_315', 'RESOURCE', 0, '-170_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_405', 'TRADE_GOOD', 0, '-170_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_45', 'CAVERN', 0, '-170_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_495', 'LOST_ARTEFACT', 0, '-170_495LOS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_585', 'TRADE_GOOD', 0, '-170_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_675', 'TRADE_GOOD', 0, '-170_675TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_765', 'ABANDONED_MINE', 0, '-170_765ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-170_855', 'ABANDONED_MINE', 0, '-170_765ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_135', 'CAVERN', 0, '-170_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_225', 'TRADE_GOOD', 0, '-40_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_315', 'RESOURCE', 0, '-40_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_405', 'ABANDONED_ROOM', 0, '-40_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_45', 'CAVERN', 0, '-170_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_495', 'ABANDONED_MINE', 0, '-40_495ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_585', 'RESOURCE', 0, '-40_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_675', 'RESOURCE', 0, '-40_675RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_765', 'TRADE_GOOD', 0, '-40_765TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '-40_855', 'RESOURCE', 0, '-40_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_135', 'TRADE_GOOD', 0, '1000_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_225', 'FORGOTTEN_CRYPTS', 0, '1000_225FOR', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_315', 'MONSTER_VILLAGE', 0, '1000_405MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_405', 'MONSTER_VILLAGE', 0, '1000_405MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_45', 'UNDERGROUND_FOREST', 0, '1000_45UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_495', 'DEMON_PORAL', 0, '1000_495DEM', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_585', 'TRADE_GOOD', 0, '1000_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_675', 'HALLS_OF_THE_LICH_KING', 0, '1000_765HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_765', 'HALLS_OF_THE_LICH_KING', 0, '1000_765HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '1000_855', 'RESOURCE', 0, '1000_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_135', 'RESOURCE', 0, '220_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_225', 'TRADE_GOOD', 0, '220_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_315', 'TRADE_GOOD', 0, '220_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_405', 'CAVERN_WITH_BURROWING_BEAST', 0, '220_405CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_45', 'UNDERGROUND_LAKE', 0, '220_45UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_495', 'TRADE_GOOD', 0, '220_495TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_585', 'SLUMBERING_WYRM', 0, '220_585SLU', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_675', 'DEMON_PORAL', 0, '220_675DEM', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_765', 'HIVE_OF_CREATURES', 0, '220_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '220_855', 'TRADE_GOOD', 0, '220_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_135', 'HIVE_OF_CREATURES', 0, '350_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_225', 'RESOURCE', 0, '350_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_315', 'TRADE_GOOD', 0, '350_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_405', 'BURRIED_TEMPLE', 0, '350_405BUR', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_45', 'HIVE_OF_CREATURES', 0, '350_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_495', 'FORGOTTEN_CRYPTS', 0, '350_495FOR', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_585', 'TRADE_GOOD', 0, '350_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_675', 'GAS-FILLED_CHAMBER', 0, '350_675GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_765', 'GAS-FILLED_CHAMBER', 0, '350_675GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '350_855', 'GAS-FILLED_CHAMBER', 0, '350_675GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_135', 'HIVE_OF_CREATURES', 0, '480_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_225', 'TRADE_GOOD', 0, '480_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_315', 'RESOURCE', 0, '480_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_405', 'CRYSTAL_CAVERN', 0, '480_405CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_45', 'HIVE_OF_CREATURES', 0, '480_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_495', 'BURRIED_TEMPLE', 0, '480_495BUR', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_585', 'DEMON_PORAL', 0, '480_585DEM', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_675', 'HIVE_OF_CREATURES', 0, '480_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_765', 'HIVE_OF_CREATURES', 0, '480_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '480_855', 'VOLCANIC_SHAFT', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_135', 'CAVERN_WITH_LARGE_CREATURE', 0, '610_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_225', 'RESOURCE', 0, '610_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_315', 'RESOURCE', 0, '610_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_405', 'CRYSTAL_CAVERN', 0, '480_405CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_45', 'CAVERN_WITH_LARGE_CREATURE', 0, '610_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_495', 'LOST_ARTEFACT', 0, '610_495LOS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_585', 'RESOURCE', 0, '610_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_675', 'TRADE_GOOD', 0, '610_675TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_765', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '610_765CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '610_855', 'TRADE_GOOD', 0, '610_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_135', 'GAS-FILLED_CHAMBER', 0, '740_45GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_225', 'GAS-FILLED_CHAMBER', 0, '740_45GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_315', 'RESOURCE', 0, '740_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_405', 'BURRIED_TEMPLE', 0, '740_405BUR', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_45', 'GAS-FILLED_CHAMBER', 0, '740_45GAS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_495', 'RESOURCE', 0, '740_495RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_585', 'TRADE_GOOD', 0, '740_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_675', 'DEMON_PORAL', 0, '740_675DEM', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_765', 'RESOURCE', 0, '740_765RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '740_855', 'TRADE_GOOD', 0, '740_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_135', 'UNDERGROUND_FOREST', 0, '1000_45UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_225', 'TRADE_GOOD', 0, '870_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_315', 'BURRIED_TEMPLE', 0, '870_315BUR', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_405', 'ABANDONED_MINE', 0, '870_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_45', 'UNDERGROUND_FOREST', 0, '1000_45UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_495', 'ABANDONED_MINE', 0, '870_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_585', 'RESOURCE', 0, '870_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_675', 'HIVE_OF_CREATURES', 0, '870_675HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_765', 'HIVE_OF_CREATURES', 0, '870_675HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '870_855', 'RESOURCE', 0, '870_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_135', 'CAVERN', 0, '-170_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_225', 'RESOURCE', 0, '90_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_315', 'TRADE_GOOD', 0, '90_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_405', 'TRADE_GOOD', 0, '90_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_45', 'UNDERGROUND_LAKE', 0, '220_45UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_495', 'ABANDONED_MINE', 0, '-40_495ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_585', 'TRADE_GOOD', 0, '90_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_675', 'LOST_ARTEFACT', 0, '90_675LOS', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_765', 'HIVE_OF_CREATURES', 0, '220_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', '90_855', 'RESOURCE', 0, '90_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_135', 'TRADE_GOOD', 0, '-170_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_225', 'TRADE_GOOD', 0, '-170_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_315', 'SLUMBERING_WYRM', 0, '-170_315SLU', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_405', 'TRADE_GOOD', 0, '-170_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_45', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_495', 'UNDERGROUND_LAKE', 0, '90_585UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_585', 'HIVE_OF_CREATURES', 0, '-170_675HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_675', 'HIVE_OF_CREATURES', 0, '-170_675HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_765', 'ABANDONED_MINE', 0, '-40_765ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-170_855', 'TRADE_GOOD', 0, '-170_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_135', 'RESOURCE', 0, '-40_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_225', 'BURRIED_TEMPLE', 0, '-40_225BUR', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_315', 'RESOURCE', 0, '-40_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_405', 'TRADE_GOOD', 0, '-40_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_45', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_495', 'UNDERGROUND_LAKE', 0, '90_585UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_585', 'RESOURCE', 0, '-40_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_675', 'RESOURCE', 0, '-40_675RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_765', 'ABANDONED_MINE', 0, '-40_765ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '-40_855', 'RESOURCE', 0, '-40_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_135', 'TRADE_GOOD', 0, '1000_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_225', 'TRADE_GOOD', 0, '1000_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_315', 'SEALED_ROOM', 0, '1000_315SEA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_405', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '1000_405CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_45', 'CAVERN_WITH_LARGE_CREATURE', 0, '870_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_495', 'CAVERN_WITH_LARGE_CREATURE', 0, '870_495CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_585', 'RESOURCE', 0, '1000_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_675', 'HIVE_OF_CREATURES', 0, '870_675HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_765', 'HIVE_OF_CREATURES', 0, '1000_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '1000_855', 'HIVE_OF_CREATURES', 0, '1000_765HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_135', 'TRADE_GOOD', 0, '220_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_225', 'TRADE_GOOD', 0, '220_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_315', 'TRADE_GOOD', 0, '220_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_405', 'CAVERN_WITH_BURROWING_BEAST', 0, '220_405CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_45', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_495', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '220_495CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_585', 'RESOURCE', 0, '220_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_675', 'MONSTER_VILLAGE', 0, '90_765MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_765', 'MONSTER_VILLAGE', 0, '90_765MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '220_855', 'RESOURCE', 0, '220_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_135', 'RESOURCE', 0, '350_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_225', 'RESOURCE', 0, '350_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_315', 'DEMON_PORAL', 0, '350_315DEM', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_405', 'TRADE_GOOD', 0, '350_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_45', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_495', 'WISHING_WELL', 0, '350_495WIS', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_585', 'BURRIED_TEMPLE', 0, '350_585BUR', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_675', 'MONSTER_VILLAGE', 0, '480_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_765', 'MONSTER_VILLAGE', 0, '480_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '350_855', 'MONSTER_VILLAGE', 0, '480_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_135', 'TRADE_GOOD', 0, '480_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_225', 'MONSTER_VILLAGE', 0, '480_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_315', 'MONSTER_VILLAGE', 0, '480_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_405', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '480_405CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_45', 'CAVERN_WITH_BURROWING_BEAST', 0, '480_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_495', 'CAVERN_WITH_LARGE_CREATURE', 0, '480_585CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_585', 'CAVERN_WITH_LARGE_CREATURE', 0, '480_585CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_675', 'MONSTER_VILLAGE', 0, '480_675MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_765', 'RESOURCE', 0, '480_765RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '480_855', 'TRADE_GOOD', 0, '480_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_135', 'RESOURCE', 0, '610_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_225', 'MONSTER_VILLAGE', 0, '480_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_315', 'TRADE_GOOD', 0, '610_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_405', 'RESOURCE', 0, '610_405RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_45', 'HIVE_OF_CREATURES', 0, '610_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_495', 'ABANDONED_MINE', 0, '610_585ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_585', 'ABANDONED_MINE', 0, '610_585ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_675', 'UNDERGROUND_LAKE', 0, '870_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_765', 'UNDERGROUND_LAKE', 0, '870_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '610_855', 'RESOURCE', 0, '610_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_135', 'RESOURCE', 0, '740_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_225', 'RESOURCE', 0, '740_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_315', 'RESOURCE', 0, '740_315RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_405', 'RESOURCE', 0, '740_405RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_45', 'HIVE_OF_CREATURES', 0, '610_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_495', 'CAVERN_WITH_BURROWING_BEAST', 0, '740_495CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_585', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_675', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_765', 'UNDERGROUND_LAKE', 0, '870_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '740_855', 'RESOURCE', 0, '740_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_135', 'RESOURCE', 0, '870_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_225', 'LOST_ARTEFACT', 0, '870_225LOS', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_315', 'TRADE_GOOD', 0, '870_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_405', 'WISHING_WELL', 0, '870_405WIS', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_45', 'CAVERN_WITH_LARGE_CREATURE', 0, '870_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_495', 'CAVERN_WITH_LARGE_CREATURE', 0, '870_495CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_585', 'HALLS_OF_THE_LICH_KING', 0, '740_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_675', 'HIVE_OF_CREATURES', 0, '870_675HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_765', 'UNDERGROUND_LAKE', 0, '870_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '870_855', 'TRADE_GOOD', 0, '870_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_135', 'TRADE_GOOD', 0, '90_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_225', 'RESOURCE', 0, '90_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_315', 'TRADE_GOOD', 0, '90_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_405', 'TRADE_GOOD', 0, '90_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_45', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_495', 'UNDERGROUND_LAKE', 0, '90_585UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_585', 'UNDERGROUND_LAKE', 0, '90_585UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_675', 'MONSTER_VILLAGE', 0, '90_765MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_765', 'MONSTER_VILLAGE', 0, '90_765MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', '90_855', 'RESOURCE', 0, '90_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_135', 'TRADE_GOOD', 0, '-170_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_225', 'TRADE_GOOD', 0, '-170_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_315', 'TRADE_GOOD', 0, '-170_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_405', 'WISHING_WELL', 0, '-170_405WIS', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_45', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_495', 'ANCHIENT_LIBRARY', 0, '-40_495ANC', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_585', 'TRADE_GOOD', 0, '-170_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_675', 'RESOURCE', 0, '-170_675RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_765', 'TRADE_GOOD', 0, '-170_765TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-170_855', 'RESOURCE', 0, '-170_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_135', 'RESOURCE', 0, '-40_135RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_225', 'RESOURCE', 0, '-40_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_315', 'MONSTER_VILLAGE', 0, '-40_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_405', 'HIVE_OF_CREATURES', 0, '-40_405HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_45', 'MAGMA_FLOW', 0, 'BLOC', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_495', 'ANCHIENT_LIBRARY', 0, '-40_495ANC', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_585', 'CAVERN_WITH_BURROWING_BEAST', 0, '-40_585CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_675', 'CAVERN', 0, '-40_675CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_765', 'UNDERGROUND_LAKE', 0, '220_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '-40_855', 'UNDERGROUND_LAKE', 0, '220_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_135', 'HIVE_OF_CREATURES', 0, '1000_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_225', 'GOLEM_FORGE', 0, '1000_225GOL', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_315', 'TRADE_GOOD', 0, '1000_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_405', 'LOST_ARTEFACT', 0, '1000_405LOS', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_45', 'HIVE_OF_CREATURES', 0, '1000_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_495', 'RESOURCE', 0, '1000_495RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_585', 'UNDERGROUND_LAKE', 0, '1000_675UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_675', 'UNDERGROUND_LAKE', 0, '1000_675UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_765', 'RESOURCE', 0, '1000_765RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '1000_855', 'TRADE_GOOD', 0, '1000_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_135', 'CAVERN', 0, '220_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_225', 'TRADE_GOOD', 0, '220_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_315', 'TRADE_GOOD', 0, '220_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_405', 'FORGOTTEN_CRYPTS', 0, '220_405FOR', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_45', 'CAVERN', 0, '220_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_495', 'FORGOTTEN_CRYPTS', 0, '220_495FOR', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_585', 'RESOURCE', 0, '220_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_675', 'RESOURCE', 0, '220_675RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_765', 'UNDERGROUND_LAKE', 0, '220_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '220_855', 'TRADE_GOOD', 0, '220_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_135', 'CAVERN', 0, '220_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_225', 'TRADE_GOOD', 0, '350_225TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_315', 'TRADE_GOOD', 0, '350_315TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_405', 'TRADE_GOOD', 0, '350_405TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_45', 'HIVE_OF_CREATURES', 0, '350_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_495', 'RESOURCE', 0, '350_495RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_585', 'RESOURCE', 0, '350_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_675', 'HALLS_OF_THE_LICH_KING', 0, '480_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_765', 'HALLS_OF_THE_LICH_KING', 0, '480_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '350_855', 'TRADE_GOOD', 0, '350_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_135', 'CAVERN', 0, '220_45CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_225', 'RESOURCE', 0, '480_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_315', 'NATURAL_MAGIC_CAVE', 0, '480_315NAT', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_405', 'SEALED_ROOM', 0, '480_405SEA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_45', 'HIVE_OF_CREATURES', 0, '350_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_495', 'FORGOTTEN_CRYPTS', 0, '480_495FOR', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_585', 'TRADE_GOOD', 0, '480_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_675', 'HALLS_OF_THE_LICH_KING', 0, '480_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_765', 'HALLS_OF_THE_LICH_KING', 0, '480_675HAL', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '480_855', 'TRADE_GOOD', 0, '480_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_135', 'TRADE_GOOD', 0, '610_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_225', 'RESOURCE', 0, '610_225RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_315', 'CAVERN_WITH_LARGE_CREATURE', 0, '610_405CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_405', 'CAVERN_WITH_LARGE_CREATURE', 0, '610_405CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_45', 'HIVE_OF_CREATURES', 0, '610_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_495', 'RESOURCE', 0, '610_495RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_585', 'RESOURCE', 0, '610_585RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_675', 'TRADE_GOOD', 0, '610_675TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_765', 'CAVERN_WITH_TAMEABLE_CRATURE', 0, '610_765CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '610_855', 'RESOURCE', 0, '610_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_135', 'TRADE_GOOD', 0, '740_135TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_225', 'MONSTER_VILLAGE', 0, '740_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_315', 'MONSTER_VILLAGE', 0, '740_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_405', 'SEALED_ROOM', 0, '740_405SEA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_45', 'HIVE_OF_CREATURES', 0, '610_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_495', 'TRADE_GOOD', 0, '740_495TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_585', 'TRADE_GOOD', 0, '740_585TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_675', 'UNDERGROUND_LAKE', 0, '740_675UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_765', 'UNDERGROUND_LAKE', 0, '740_675UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '740_855', 'TRADE_GOOD', 0, '740_855TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_135', 'HIVE_OF_CREATURES', 0, '870_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_225', 'MONSTER_VILLAGE', 0, '740_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_315', 'ABANDONED_MINE', 0, '870_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_405', 'ABANDONED_MINE', 0, '870_405ABA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_45', 'HIVE_OF_CREATURES', 0, '870_45HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_495', 'RESOURCE', 0, '870_495RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_585', 'UNDERGROUND_LAKE', 0, '1000_675UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_675', 'TRADE_GOOD', 0, '870_675TRA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_765', 'UNDERGROUND_LAKE', 0, '740_675UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '870_855', 'RESOURCE', 0, '870_855RES', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_135', 'CRYSTAL_CAVERN', 0, '90_45CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_225', 'MONSTER_VILLAGE', 0, '-40_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_315', 'MONSTER_VILLAGE', 0, '-40_315MON', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_405', 'HIVE_OF_CREATURES', 0, '-40_405HIV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_45', 'CRYSTAL_CAVERN', 0, '90_45CRY', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_495', 'SEALED_ROOM', 0, '90_495SEA', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_585', 'WISHING_WELL', 0, '90_585WIS', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_675', 'CAVERN', 0, '-40_675CAV', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_765', 'UNDERGROUND_LAKE', 0, '220_765UND', NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', '90_855', 'TRADE_GOOD', 0, '90_855TRA', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `saves_sae`
--

CREATE TABLE `saves_sae` (
  `Full_start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `PYR_id` varchar(255) NOT NULL,
  `save_name` varchar(255) NOT NULL,
  `save_time` datetime NOT NULL DEFAULT current_timestamp(),
  `current_phase` int(1) NOT NULL,
  `resources` int(3) NOT NULL DEFAULT 25,
  `trade_goods` int(3) NOT NULL DEFAULT 25,
  `game_length` time NOT NULL DEFAULT '00:00:00',
  `RUNE_OF_NIGHTMARES` tinyint(1) DEFAULT NULL,
  `PRIMAL_RUNE` tinyint(1) DEFAULT NULL,
  `GORE-SPLATTERED_RUNE` tinyint(1) DEFAULT NULL,
  `TOMBSTONE_RUNE` tinyint(1) DEFAULT NULL,
  `RUNE_OF_DROUGHT` tinyint(1) DEFAULT NULL,
  `RUNE_OF_GREED` tinyint(1) DEFAULT NULL,
  `RUNE_OF_DOOM` tinyint(1) DEFAULT NULL,
  `WOLF_RUNE` tinyint(1) DEFAULT NULL,
  `RUNE_OF_WAR` tinyint(1) DEFAULT NULL,
  `SHUNNED_RUNE` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `saves_sae`
--

INSERT INTO `saves_sae` (`Full_start_date`, `PYR_id`, `save_name`, `save_time`, `current_phase`, `resources`, `trade_goods`, `game_length`, `RUNE_OF_NIGHTMARES`, `PRIMAL_RUNE`, `GORE-SPLATTERED_RUNE`, `TOMBSTONE_RUNE`, `RUNE_OF_DROUGHT`, `RUNE_OF_GREED`, `RUNE_OF_DOOM`, `WOLF_RUNE`, `RUNE_OF_WAR`, `SHUNNED_RUNE`) VALUES
('2024-11-10 10:11:31', 'lime.lime@lime.lime', 'Lime\'s_hole', '2024-11-15 07:43:11', 1, 30, 20, '01:01:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-11-13 10:50:00', 'emil.emil@emil.emil', 'Emil\'s_cave', '2024-11-15 09:42:01', 1, 30, 20, '01:00:01', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-11-14 12:40:16', 'lime.lime@lime.lime', 'Lime\'s_burrow', '2024-11-15 09:50:24', 1, 30, 20, '01:01:01', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
('2024-11-15 12:51:00', 'emil.emil@emil.emil', 'Emil\'s_mine', '2024-11-15 09:52:16', 1, 30, 20, '00:10:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `statuses_sus`
--

CREATE TABLE `statuses_sus` (
  `SAE_ROM_id` datetime NOT NULL,
  `PYR_SAE_ROM_id` varchar(255) NOT NULL,
  `ROM_id` varchar(255) NOT NULL,
  `CDN_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `units_unt`
--

CREATE TABLE `units_unt` (
  `Id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- A tábla adatainak kiíratása `units_unt`
--

INSERT INTO `units_unt` (`Id`, `name`) VALUES
(7, 'Alchemist'),
(9, 'Cannon'),
(4, 'Cleric'),
(8, 'Golem'),
(2, 'Gunner'),
(3, 'Hound'),
(5, 'Mage'),
(6, 'Prisoner'),
(10, 'Skull_Dwarf'),
(1, 'Soldier');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `challenges_cle`
--
ALTER TABLE `challenges_cle`
  ADD PRIMARY KEY (`Id`);

--
-- A tábla indexei `completion_cpn`
--
ALTER TABLE `completion_cpn`
  ADD PRIMARY KEY (`PYR_id`,`CLE_id`),
  ADD KEY `cpn_cle_pyr` (`CLE_id`);

--
-- A tábla indexei `conditions_cdn`
--
ALTER TABLE `conditions_cdn`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A tábla indexei `groups_grp`
--
ALTER TABLE `groups_grp`
  ADD PRIMARY KEY (`SAE_ROM_id`,`PYR_SAE_ROM_id`,`ROM_id`,`UNT_id`),
  ADD KEY `grp_unt` (`UNT_id`);

--
-- A tábla indexei `players_pyr`
--
ALTER TABLE `players_pyr`
  ADD PRIMARY KEY (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- A tábla indexei `rooms_rom`
--
ALTER TABLE `rooms_rom`
  ADD PRIMARY KEY (`SAE_id`,`PYR_SAE_id`,`Coordinate`),
  ADD KEY `rom_pyr_sae` (`PYR_SAE_id`,`SAE_id`);

--
-- A tábla indexei `saves_sae`
--
ALTER TABLE `saves_sae`
  ADD PRIMARY KEY (`Full_start_date`,`PYR_id`),
  ADD KEY `sae_pyr` (`PYR_id`);

--
-- A tábla indexei `statuses_sus`
--
ALTER TABLE `statuses_sus`
  ADD PRIMARY KEY (`SAE_ROM_id`,`PYR_SAE_ROM_id`,`ROM_id`,`CDN_id`),
  ADD KEY `sus_cnd` (`CDN_id`);

--
-- A tábla indexei `units_unt`
--
ALTER TABLE `units_unt`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `challenges_cle`
--
ALTER TABLE `challenges_cle`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT a táblához `conditions_cdn`
--
ALTER TABLE `conditions_cdn`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT a táblához `units_unt`
--
ALTER TABLE `units_unt`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `completion_cpn`
--
ALTER TABLE `completion_cpn`
  ADD CONSTRAINT `cpn` FOREIGN KEY (`PYR_id`) REFERENCES `players_pyr` (`email`),
  ADD CONSTRAINT `cpn_cle_pyr` FOREIGN KEY (`CLE_id`) REFERENCES `challenges_cle` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `groups_grp`
--
ALTER TABLE `groups_grp`
  ADD CONSTRAINT `grp_pyr_sae_rom` FOREIGN KEY (`SAE_ROM_id`,`PYR_SAE_ROM_id`,`ROM_id`) REFERENCES `rooms_rom` (`SAE_id`, `PYR_SAE_id`, `Coordinate`) ON DELETE CASCADE,
  ADD CONSTRAINT `grp_unt` FOREIGN KEY (`UNT_id`) REFERENCES `units_unt` (`Id`) ON DELETE CASCADE;

--
-- Megkötések a táblához `rooms_rom`
--
ALTER TABLE `rooms_rom`
  ADD CONSTRAINT `rom_pyr_sae` FOREIGN KEY (`PYR_SAE_id`,`SAE_id`) REFERENCES `saves_sae` (`PYR_id`, `Full_start_date`) ON DELETE CASCADE;

--
-- Megkötések a táblához `saves_sae`
--
ALTER TABLE `saves_sae`
  ADD CONSTRAINT `sae_pyr` FOREIGN KEY (`PYR_id`) REFERENCES `players_pyr` (`email`) ON DELETE CASCADE;

--
-- Megkötések a táblához `statuses_sus`
--
ALTER TABLE `statuses_sus`
  ADD CONSTRAINT `sus_cnd` FOREIGN KEY (`CDN_id`) REFERENCES `conditions_cdn` (`Id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sus_pyr_sae_rom_cdn` FOREIGN KEY (`SAE_ROM_id`,`PYR_SAE_ROM_id`,`ROM_id`) REFERENCES `rooms_rom` (`SAE_id`, `PYR_SAE_id`, `Coordinate`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
