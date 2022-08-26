-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 26 2022 г., 17:13
-- Версия сервера: 5.7.29
-- Версия PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `computer-assembly-rest`
--

-- --------------------------------------------------------

--
-- Структура таблицы `brand`
--

CREATE TABLE `brand` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Intel'),
(2, 'AMD'),
(3, 'ASUS'),
(4, 'Nvidia'),
(5, 'Corsair'),
(6, 'Kingston'),
(7, 'HyperX'),
(8, 'Gigabyte'),
(9, 'ASRock'),
(10, 'MSi'),
(11, 'XPG'),
(12, 'Samsung'),
(13, 'Western Digital'),
(14, 'Seagate'),
(15, 'EVGA'),
(16, 'Galax'),
(17, 'XFX'),
(18, 'Sapphire'),
(19, 'PowerColor');

-- --------------------------------------------------------

--
-- Структура таблицы `graphiccard`
--

CREATE TABLE `graphiccard` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL,
  `imageUrl` varchar(512) NOT NULL,
  `brandId` int(11) NOT NULL,
  `memorySize` int(11) NOT NULL,
  `memoryType` enum('gddr5','gddr6') NOT NULL,
  `minimumPowerSupply` int(11) NOT NULL,
  `supportMultiGpu` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `graphiccard`
--

INSERT INTO `graphiccard` (`id`, `name`, `imageUrl`, `brandId`, `memorySize`, `memoryType`, `minimumPowerSupply`, `supportMultiGpu`) VALUES
(1, 'GeForce RTX 2070 Super XC Ultra + Overclocked', '23', 15, 8192, 'gddr6', 650, 0),
(2, 'GeForce RTX 2080 Super HOF 10th Anniversary Edition Black Teclab', '24', 16, 8192, 'gddr6', 650, 1),
(3, 'GeForce RTX 2080 Ti KINGPIN Gaming', '25', 15, 11264, 'gddr6', 650, 1),
(4, 'Radeon Red Devil RX5700', '26', 19, 8192, 'gddr6', 650, 0),
(5, 'Radeon RX 5700 XT Nitro+', '27', 18, 8192, 'gddr6', 600, 1),
(6, 'GeForce GTX 1070 Gaming ACX 3.0', '41', 15, 8192, 'gddr5', 450, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `machine`
--

CREATE TABLE `machine` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL,
  `description` varchar(512) NOT NULL,
  `imageUrl` varchar(512) NOT NULL,
  `motherboardId` int(11) NOT NULL,
  `processorId` int(11) NOT NULL,
  `ramMemoryId` int(11) NOT NULL,
  `ramMemoryAmount` int(11) NOT NULL,
  `graphicCardId` int(11) NOT NULL,
  `graphicCardAmount` int(11) NOT NULL,
  `powerSupplyId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `machine`
--

INSERT INTO `machine` (`id`, `name`, `description`, `imageUrl`, `motherboardId`, `processorId`, `ramMemoryId`, `ramMemoryAmount`, `graphicCardId`, `graphicCardAmount`, `powerSupplyId`) VALUES
(1, 'Infinity', 'The highest and best you could get from a gamer machine.', '33', 1, 1, 1, 4, 5, 2, 1),
(2, 'Shine', 'Light gives a huge power to someone.', '35', 7, 2, 2, 2, 1, 1, 3),
(3, 'Wave', 'The sequences and perfection of waves bring this machine all the power electrons carry.', '37', 3, 3, 1, 2, 3, 1, 2),
(4, 'Cerberus', 'The unexpected will bring you a lot more than you expected.', '34', 4, 2, 3, 2, 4, 1, 4),
(5, 'Iceberg', 'An ice-solid experience for your gaming days.', '36', 7, 2, 1, 4, 6, 2, 2),
(6, 'Soft', 'The softer version that knows how to play hard.', '40', 9, 6, 5, 4, 6, 1, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `machinehasstoragedevice`
--

CREATE TABLE `machinehasstoragedevice` (
  `machineId` int(11) NOT NULL,
  `storageDeviceId` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `machinehasstoragedevice`
--

INSERT INTO `machinehasstoragedevice` (`machineId`, `storageDeviceId`, `amount`) VALUES
(1, 1, 1),
(1, 5, 1),
(2, 2, 1),
(3, 3, 1),
(3, 4, 1),
(4, 2, 1),
(5, 2, 1),
(6, 3, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `motherboard`
--

CREATE TABLE `motherboard` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL,
  `imageUrl` varchar(512) NOT NULL,
  `brandId` int(11) NOT NULL,
  `socketTypeId` int(11) NOT NULL,
  `ramMemoryTypeId` int(11) NOT NULL,
  `ramMemorySlots` int(11) NOT NULL,
  `maxTdp` int(11) NOT NULL,
  `sataSlots` int(11) NOT NULL,
  `m2Slots` int(11) NOT NULL,
  `pciSlots` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `motherboard`
--

INSERT INTO `motherboard` (`id`, `name`, `imageUrl`, `brandId`, `socketTypeId`, `ramMemoryTypeId`, `ramMemorySlots`, `maxTdp`, `sataSlots`, `m2Slots`, `pciSlots`) VALUES
(1, 'X299X Aorus Xtreme Waterforce', '1', 8, 3, 2, 8, 165, 8, 2, 3),
(2, 'X570 AQUA', '2', 9, 1, 2, 4, 105, 8, 2, 3),
(3, 'MEG X570 Godlike', '3', 10, 5, 2, 4, 100, 6, 3, 4),
(4, 'X570 Aorus Xtreme', '4', 8, 5, 2, 4, 100, 6, 3, 3),
(5, 'Z390 Aorus Xtreme', '5', 8, 2, 2, 4, 100, 6, 3, 3),
(6, 'X399 Aorus Xtreme', '8', 8, 4, 2, 8, 250, 6, 3, 4),
(7, 'ROG Strix TRX40-E Gaming', '10', 3, 5, 2, 8, 280, 8, 3, 3),
(8, 'GA-H170-GAMING 3', '38', 8, 2, 1, 4, 120, 8, 2, 2),
(9, 'GA-H170M-D3H', '39', 8, 2, 1, 4, 105, 8, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `powersupply`
--

CREATE TABLE `powersupply` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL,
  `imageUrl` varchar(512) NOT NULL,
  `brandId` int(11) NOT NULL,
  `potency` int(11) NOT NULL,
  `badge80Plus` enum('none','white','bronze','silver','gold','platinum','titanium') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `powersupply`
--

INSERT INTO `powersupply` (`id`, `name`, `imageUrl`, `brandId`, `potency`, `badge80Plus`) VALUES
(1, 'AX1200i', '28', 5, 1200, 'platinum'),
(2, 'AX1000', '29', 5, 1000, 'titanium'),
(3, 'HX750i', '30', 5, 750, 'platinum'),
(4, 'RMx', '31', 5, 750, 'gold'),
(5, 'SF Series 450W', '32', 5, 450, 'platinum');

-- --------------------------------------------------------

--
-- Структура таблицы `processor`
--

CREATE TABLE `processor` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL,
  `imageUrl` varchar(512) NOT NULL,
  `brandId` int(11) NOT NULL,
  `socketTypeId` int(11) NOT NULL,
  `cores` int(11) NOT NULL,
  `baseFrequency` float NOT NULL,
  `maxFrequency` float NOT NULL,
  `cacheMemory` float NOT NULL,
  `tdp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `processor`
--

INSERT INTO `processor` (`id`, `name`, `imageUrl`, `brandId`, `socketTypeId`, `cores`, `baseFrequency`, `maxFrequency`, `cacheMemory`, `tdp`) VALUES
(1, 'i9-9980XE Skylake', '6', 1, 3, 18, 3000, 4400, 25344, 165),
(2, 'Ryzen Threadripper 2990WX', '7', 2, 5, 32, 3000, 4200, 65536, 250),
(3, 'Ryzen Threadripper 3960X', '9', 2, 5, 24, 3800, 4500, 131072, 280),
(4, 'i9-7920X Skylake', '11', 1, 3, 12, 2900, 4200, 16896, 140),
(5, 'i9-10920X Cascade Lake', '12', 1, 3, 12, 3500, 4600, 19712, 165),
(6, 'i9-9900KS Coffee Lake Refresh', '42', 1, 2, 8, 4000, 5000, 16384, 127);

-- --------------------------------------------------------

--
-- Структура таблицы `rammemory`
--

CREATE TABLE `rammemory` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL,
  `imageUrl` varchar(512) NOT NULL,
  `brandId` int(11) NOT NULL,
  `size` int(11) NOT NULL,
  `ramMemoryTypeId` int(11) NOT NULL,
  `frequency` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rammemory`
--

INSERT INTO `rammemory` (`id`, `name`, `imageUrl`, `brandId`, `size`, `ramMemoryTypeId`, `frequency`) VALUES
(1, 'HyperX Fury 32GB 3000MHz', '13', 7, 32768, 2, 3000),
(2, 'HyperX Fury 32GB 2666MHz', '14', 7, 32768, 2, 2666),
(3, 'HyperX Fury 32GB 2400MHz', '15', 7, 32768, 2, 2400),
(4, 'Corsair Vengeance 8GB 1600Mhz', '16', 5, 8192, 1, 1600),
(5, 'HyperX Fury 8GB 1600MHz', '17', 7, 8192, 1, 1600);

-- --------------------------------------------------------

--
-- Структура таблицы `rammemorytype`
--

CREATE TABLE `rammemorytype` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rammemorytype`
--

INSERT INTO `rammemorytype` (`id`, `name`) VALUES
(1, 'DDR3'),
(2, 'DDR4');

-- --------------------------------------------------------

--
-- Структура таблицы `sockettype`
--

CREATE TABLE `sockettype` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `sockettype`
--

INSERT INTO `sockettype` (`id`, `name`) VALUES
(1, 'AM4'),
(2, 'LGA 1151'),
(3, 'LGA 2066'),
(4, 'TR4'),
(5, 'sTRX4');

-- --------------------------------------------------------

--
-- Структура таблицы `storagedevice`
--

CREATE TABLE `storagedevice` (
  `id` int(11) NOT NULL,
  `name` varchar(96) NOT NULL,
  `imageUrl` varchar(512) NOT NULL,
  `brandId` int(11) NOT NULL,
  `storageDeviceType` enum('hdd','ssd') NOT NULL,
  `size` int(11) NOT NULL,
  `storageDeviceInterface` enum('sata','m2') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `storagedevice`
--

INSERT INTO `storagedevice` (`id`, `name`, `imageUrl`, `brandId`, `storageDeviceType`, `size`, `storageDeviceInterface`) VALUES
(1, 'XPG Gammix S50', '18', 11, 'ssd', 2048, 'm2'),
(2, 'Corsair Force Series MP600', '19', 5, 'ssd', 2048, 'm2'),
(3, 'Samsung 970 EVO Plus', '20', 12, 'ssd', 1024, 'm2'),
(4, 'WD Purple Surveillance 3.5\'', '21', 13, 'hdd', 12288, 'sata'),
(5, 'Seagate BarraCuda Pro', '22', 14, 'hdd', 10240, 'sata');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(512) NOT NULL,
  `accessToken` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `accessToken`) VALUES
(1, 'joaomartinscoube', 'senai_701', '$2y$10$kvSX.Vvv/FeDb9pAl.zr6OKdhIFlTcHcjgY5hbSzkbfyUDOna36BK'),
(2, 'robertosimonsen', 'senai_101', 'dadfa'),
(3, 'franciscomatarazzo', 'senai_107', 'fsdfdsf');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `graphiccard`
--
ALTER TABLE `graphiccard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brandId` (`brandId`);

--
-- Индексы таблицы `machine`
--
ALTER TABLE `machine`
  ADD PRIMARY KEY (`id`),
  ADD KEY `motherboardId` (`motherboardId`),
  ADD KEY `processorId` (`processorId`),
  ADD KEY `ramMemoryId` (`ramMemoryId`),
  ADD KEY `graphicCardId` (`graphicCardId`),
  ADD KEY `powerSupplyId` (`powerSupplyId`);

--
-- Индексы таблицы `machinehasstoragedevice`
--
ALTER TABLE `machinehasstoragedevice`
  ADD PRIMARY KEY (`machineId`,`storageDeviceId`),
  ADD KEY `storageDeviceId` (`storageDeviceId`);

--
-- Индексы таблицы `motherboard`
--
ALTER TABLE `motherboard`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ramMemoryTypeId` (`ramMemoryTypeId`),
  ADD KEY `socketTypeId` (`socketTypeId`),
  ADD KEY `brandId` (`brandId`);

--
-- Индексы таблицы `powersupply`
--
ALTER TABLE `powersupply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brandId` (`brandId`);

--
-- Индексы таблицы `processor`
--
ALTER TABLE `processor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `socketTypeId` (`socketTypeId`),
  ADD KEY `brandId` (`brandId`);

--
-- Индексы таблицы `rammemory`
--
ALTER TABLE `rammemory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ramMemoryTypeId` (`ramMemoryTypeId`),
  ADD KEY `brandId` (`brandId`);

--
-- Индексы таблицы `rammemorytype`
--
ALTER TABLE `rammemorytype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `sockettype`
--
ALTER TABLE `sockettype`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `storagedevice`
--
ALTER TABLE `storagedevice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brandId` (`brandId`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `brand`
--
ALTER TABLE `brand`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `graphiccard`
--
ALTER TABLE `graphiccard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `machine`
--
ALTER TABLE `machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `motherboard`
--
ALTER TABLE `motherboard`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `powersupply`
--
ALTER TABLE `powersupply`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `processor`
--
ALTER TABLE `processor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `rammemory`
--
ALTER TABLE `rammemory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `rammemorytype`
--
ALTER TABLE `rammemorytype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `sockettype`
--
ALTER TABLE `sockettype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `storagedevice`
--
ALTER TABLE `storagedevice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `graphiccard`
--
ALTER TABLE `graphiccard`
  ADD CONSTRAINT `graphiccard_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`);

--
-- Ограничения внешнего ключа таблицы `machine`
--
ALTER TABLE `machine`
  ADD CONSTRAINT `machine_ibfk_1` FOREIGN KEY (`motherboardId`) REFERENCES `motherboard` (`id`),
  ADD CONSTRAINT `machine_ibfk_2` FOREIGN KEY (`processorId`) REFERENCES `processor` (`id`),
  ADD CONSTRAINT `machine_ibfk_3` FOREIGN KEY (`ramMemoryId`) REFERENCES `rammemory` (`id`),
  ADD CONSTRAINT `machine_ibfk_4` FOREIGN KEY (`graphicCardId`) REFERENCES `graphiccard` (`id`),
  ADD CONSTRAINT `machine_ibfk_5` FOREIGN KEY (`powerSupplyId`) REFERENCES `powersupply` (`id`);

--
-- Ограничения внешнего ключа таблицы `machinehasstoragedevice`
--
ALTER TABLE `machinehasstoragedevice`
  ADD CONSTRAINT `machinehasstoragedevice_ibfk_1` FOREIGN KEY (`machineId`) REFERENCES `machine` (`id`),
  ADD CONSTRAINT `machinehasstoragedevice_ibfk_2` FOREIGN KEY (`storageDeviceId`) REFERENCES `storagedevice` (`id`);

--
-- Ограничения внешнего ключа таблицы `motherboard`
--
ALTER TABLE `motherboard`
  ADD CONSTRAINT `motherboard_ibfk_1` FOREIGN KEY (`ramMemoryTypeId`) REFERENCES `rammemorytype` (`id`),
  ADD CONSTRAINT `motherboard_ibfk_2` FOREIGN KEY (`socketTypeId`) REFERENCES `sockettype` (`id`),
  ADD CONSTRAINT `motherboard_ibfk_3` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`);

--
-- Ограничения внешнего ключа таблицы `powersupply`
--
ALTER TABLE `powersupply`
  ADD CONSTRAINT `powersupply_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`);

--
-- Ограничения внешнего ключа таблицы `processor`
--
ALTER TABLE `processor`
  ADD CONSTRAINT `processor_ibfk_1` FOREIGN KEY (`socketTypeId`) REFERENCES `sockettype` (`id`),
  ADD CONSTRAINT `processor_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`);

--
-- Ограничения внешнего ключа таблицы `rammemory`
--
ALTER TABLE `rammemory`
  ADD CONSTRAINT `rammemory_ibfk_1` FOREIGN KEY (`ramMemoryTypeId`) REFERENCES `rammemorytype` (`id`),
  ADD CONSTRAINT `rammemory_ibfk_2` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`);

--
-- Ограничения внешнего ключа таблицы `storagedevice`
--
ALTER TABLE `storagedevice`
  ADD CONSTRAINT `storagedevice_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brand` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
