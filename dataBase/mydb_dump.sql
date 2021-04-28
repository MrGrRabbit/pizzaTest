-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 26 2021 г., 07:36
-- Версия сервера: 8.0.15
-- Версия PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mydb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE `customer` (
  `ID` int(11) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `streetnumber` varchar(45) DEFAULT NULL,
  `zip` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `phone` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `extras`
--

CREATE TABLE `extras` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `isChoosable` tinyint(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `extras`
--

INSERT INTO `extras` (`ID`, `name`, `price`, `isChoosable`) VALUES
(1, 'Tomaten', 1, 0),
(2, 'Käse', 1, 0),
(3, 'Sardellen', 1, 1),
(4, 'Oliven', 1, 1),
(5, 'Salami', 0.5, 1),
(6, 'Schinken', 0.5, 1),
(7, 'Champignons', 0.75, 1),
(8, 'Paprika', 0.5, 1),
(9, 'Mozzarella', 1, 1),
(10, 'Basilikum', 0.75, 1),
(11, 'Peperoniwurst', 1, 1),
(12, 'Zwiebeln', 0.5, 1),
(13, 'Knoblauch', 0.5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE `order` (
  `ID` int(11) NOT NULL,
  `timestamp` timestamp NULL DEFAULT NULL,
  `Customer_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `orderitems`
--

CREATE TABLE `orderitems` (
  `ID` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `Order_ID` int(11) NOT NULL,
  `Pizzas_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `orderitem_has_extra`
--

CREATE TABLE `orderitem_has_extra` (
  `ID` int(11) NOT NULL,
  `OrderItems_ID` int(11) NOT NULL,
  `Extras_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pizzas`
--

CREATE TABLE `pizzas` (
  `ID` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pizzas`
--

INSERT INTO `pizzas` (`ID`, `name`, `price`, `description`) VALUES
(4, 'Magherita', 4, 'Eine leckere Käsepizza.'),
(5, 'Napoli', 5.5, 'Ein Mix aus Sardellen und Oliven bieten den ultimativen Flair.'),
(6, 'Salami', 4.7, 'Der Klassiker unter den Pizzen.'),
(7, 'Prosciutto', 4.7, 'Der im Volksmund auch als Schinkenpizza bekannte Klassiker.'),
(8, 'Funghi', 4.7, 'Die beste Wahl für alle Pilzliebhaber.'),
(9, 'Salami-Paprika', 5.5, 'Die beste Kombination zwischen deftig und frisch!'),
(10, 'Tricolore', 5.5, '100% vegetarisch - 100% lecker!'),
(11, 'Diavolo', 5.5, 'Teuflisch scharf!'),
(12, 'Roma', 5.5, 'Schinken und Champignons, köstlich im Steinofen zubereitet.');

-- --------------------------------------------------------

--
-- Структура таблицы `pizza_has_extra`
--

CREATE TABLE `pizza_has_extra` (
  `ID` int(11) NOT NULL,
  `Pizzas_ID` int(11) DEFAULT NULL,
  `Extras_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `extras`
--
ALTER TABLE `extras`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_Order_Customer1_idx` (`Customer_ID`);

--
-- Индексы таблицы `orderitems`
--
ALTER TABLE `orderitems`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_OrderItems_Order1_idx` (`Order_ID`),
  ADD KEY `fk_OrderItems_Pizzas1_idx` (`Pizzas_ID`) USING BTREE;

--
-- Индексы таблицы `orderitem_has_extra`
--
ALTER TABLE `orderitem_has_extra`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_OrderItem_has_Extra_OrderItems1_idx` (`OrderItems_ID`),
  ADD KEY `fk_OrderItem_has_Extra_Extras1_idx` (`Extras_ID`);

--
-- Индексы таблицы `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`ID`) USING BTREE;

--
-- Индексы таблицы `pizza_has_extra`
--
ALTER TABLE `pizza_has_extra`
  ADD PRIMARY KEY (`ID`) USING BTREE,
  ADD KEY `fk_Pizza_has_Extra_Pizzas_idx` (`Pizzas_ID`) USING BTREE,
  ADD KEY `fk_Pizza_has_Extra_Extras1_idx` (`Extras_ID`,`Pizzas_ID`) USING BTREE;

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `extras`
--
ALTER TABLE `extras`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `order`
--
ALTER TABLE `order`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orderitems`
--
ALTER TABLE `orderitems`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `orderitem_has_extra`
--
ALTER TABLE `orderitem_has_extra`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `pizza_has_extra`
--
ALTER TABLE `pizza_has_extra`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_Order_Customer1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`ID`);

--
-- Ограничения внешнего ключа таблицы `orderitems`
--
ALTER TABLE `orderitems`
  ADD CONSTRAINT `fk_OrderItems_Order1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`ID`),
  ADD CONSTRAINT `fk_OrderItems_Pizzen1` FOREIGN KEY (`Pizzas_ID`) REFERENCES `pizzen` (`ID`);

--
-- Ограничения внешнего ключа таблицы `orderitem_has_extra`
--
ALTER TABLE `orderitem_has_extra`
  ADD CONSTRAINT `fk_OrderItem_has_Extra_Extras1` FOREIGN KEY (`Extras_ID`) REFERENCES `extras` (`ID`),
  ADD CONSTRAINT `fk_OrderItem_has_Extra_OrderItems1` FOREIGN KEY (`OrderItems_ID`) REFERENCES `orderitems` (`ID`);

--
-- Ограничения внешнего ключа таблицы `pizza_has_extra`
--
ALTER TABLE `pizza_has_extra`
  ADD CONSTRAINT `fk_Pizza_has_Extra_Extras1` FOREIGN KEY (`Extras_ID`) REFERENCES `extras` (`ID`),
  ADD CONSTRAINT `fk_Pizza_has_Extra_Pizzen` FOREIGN KEY (`Pizzas_ID`) REFERENCES `pizzen` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
