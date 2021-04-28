-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 04. Jun 2018 um 09:06
-- Server-Version: 10.1.32-MariaDB
-- PHP-Version: 7.2.5

-- --------------------------------------------------------

--
-- Daten für Tabelle `Extras`
--

INSERT INTO `Extras` (`ID`, `name`, `price`, `isChoosable`) VALUES
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
-- Daten für Tabelle `Pizzas`
--

INSERT INTO `Pizzas` (`ID`, `name`, `price`, `description`) VALUES
(4, 'Magherita', 4.00, 'Eine leckere Käsepizza.'),
(5, 'Napoli', 5.50, 'Ein Mix aus Sardellen und Oliven bieten den ultimativen Flair.'),
(6, 'Salami', 4.70, 'Der Klassiker unter den Pizzen.'),
(7, 'Prosciutto', 4.70, 'Der im Volksmund auch als Schinkenpizza bekannte Klassiker.'),
(8, 'Funghi', 4.70, 'Die beste Wahl für alle Pilzliebhaber.'),
(9, 'Salami-Paprika', 5.50, 'Die beste Kombination zwischen deftig und frisch!'),
(10, 'Tricolore', 5.50, '100% vegetarisch - 100% lecker!'),
(11, 'Diavolo', 5.50, 'Teuflisch scharf!'),
(12, 'Roma', 5.50, 'Schinken und Champignons, köstlich im Steinofen zubereitet.');

-- --------------------------------------------------------

--
-- Daten für Tabelle `Pizza_has_Extra`
--

INSERT INTO `Pizza_has_Extra` (`ID`, `Pizzas_ID`, `Extras_ID`) VALUES
(1, 4, 1),
(2, 4, 2),
(3, 5, 1),
(4, 5, 2),
(5, 5, 3),
(6, 5, 4),
(7, 6, 1),
(8, 6, 2),
(9, 6, 5),
(10, 7, 1),
(11, 7, 2),
(12, 7, 6),
(13, 8, 1),
(14, 8, 2),
(15, 8, 7),
(16, 9, 1),
(17, 9, 2),
(18, 9, 5),
(19, 9, 8),
(20, 10, 1),
(21, 10, 2),
(22, 10, 9),
(23, 10, 10),
(24, 11, 1),
(25, 11, 2),
(26, 11, 11),
(27, 11, 12),
(28, 11, 13),
(29, 12, 1),
(30, 12, 2),
(31, 12, 11),
(32, 12, 12),
(33, 12, 13);

