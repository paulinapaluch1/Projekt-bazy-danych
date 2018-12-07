-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 06 Lis 2018, 17:22
-- Wersja serwera: 10.1.35-MariaDB
-- Wersja PHP: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `ciastkarnia`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `dekoracje`
--

CREATE TABLE `dekoracje` (
  `id_dekoracji` int(11) NOT NULL,
  `okazja` varchar(35) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `dekoracje`
--

INSERT INTO `dekoracje` (`id_dekoracji`, `okazja`) VALUES
(1, 'Komunia Święta'),
(2, 'Ślub'),
(3, 'Urodziny'),
(4, 'Imieniny'),
(5, 'Klasyczny'),
(6, 'Na życzenie');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

CREATE TABLE `klienci` (
  `id_klienta` int(11) NOT NULL,
  `imie` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nazwisko` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `telefon` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `ulica` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `nr_lokalu` varchar(8) COLLATE utf8_polish_ci NOT NULL,
  `kod_pocztowy` varchar(6) COLLATE utf8_polish_ci NOT NULL,
  `miejscowosc` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `klienci`
--

INSERT INTO `klienci` (`id_klienta`, `imie`, `nazwisko`, `telefon`, `ulica`, `nr_lokalu`, `kod_pocztowy`, `miejscowosc`) VALUES
(1, 'Jan', 'Nowak', '123456789', 'Jana Pawła II ', '9/58', '20-535', 'Lublin'),
(2, 'Paulina', 'Paluch', '987654321', 'Bursztynowa ', '1', '20-345', 'Lublin'),
(3, 'Dorota', 'Paluch', '609336478', 'Ruda Solska', '72', '23-400', 'Biłgoraj'),
(4, 'Ewita ', 'Broda', '785867785', 'Graniczna', '75', '23-400', 'Biłgoraj'),
(5, 'Emilia', 'Płudowska', '791601458', 'Skłodowskiej', '14', '21-200', 'Parczew'),
(6, 'Jan', 'Kowalski', '333444555', 'Watykańska', '11', '20-709', 'Lublin'),
(7, 'Ewelina', 'Kwiatek', '111222333', 'Diamentowa', '45/56', '12-400', 'Lublin');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pozycjetransakcji`
--

CREATE TABLE `pozycjetransakcji` (
  `id_transakcji` int(11) NOT NULL,
  `id_zamowienia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `pozycjetransakcji`
--

INSERT INTO `pozycjetransakcji` (`id_transakcji`, `id_zamowienia`) VALUES
(1, 1),
(1, 20),
(2, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 19),
(4, 6),
(5, 7),
(5, 18),
(6, 17),
(7, 16);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rodzajewypiekow`
--

CREATE TABLE `rodzajewypiekow` (
  `id_rodzaju` int(11) NOT NULL,
  `nazwa` varchar(20) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `rodzajewypiekow`
--

INSERT INTO `rodzajewypiekow` (`id_rodzaju`, `nazwa`) VALUES
(1, 'tort'),
(2, 'ciasto'),
(3, 'ciastka'),
(4, 'babeczki');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `smaki`
--

CREATE TABLE `smaki` (
  `id_smaku` int(11) NOT NULL,
  `smak` varchar(30) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `smaki`
--

INSERT INTO `smaki` (`id_smaku`, `smak`) VALUES
(1, 'czekoladowy'),
(2, 'orzechowy'),
(3, 'jagodowy'),
(4, 'truskawkowy'),
(5, 'wiśniowy'),
(6, 'cytrynowy'),
(7, 'jabłkowy'),
(8, 'owocowy'),
(9, 'śmietankowy'),
(10, 'waniliowy'),
(11, 'miętowy'),
(12, 'kawowy'),
(13, 'bezowy'),
(14, 'gruszkowy'),
(15, 'toffi'),
(16, 'tiramisu'),
(17, 'malinowy');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `statusy`
--

CREATE TABLE `statusy` (
  `id_statusu` int(11) NOT NULL,
  `status` varchar(25) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `statusy`
--

INSERT INTO `statusy` (`id_statusu`, `status`) VALUES
(1, 'w trakcie realizacji'),
(2, 'zrealizowano'),
(3, 'do realizacji'),
(4, 'nie zrealizowano');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `transakcje`
--

CREATE TABLE `transakcje` (
  `id_transakcji` int(11) NOT NULL,
  `id_klienta` int(11) NOT NULL,
  `data` date NOT NULL,
  `id_statusu` int(11) NOT NULL,
  `termin_realizacji` date NOT NULL,
  `uwagi_klienta` varchar(50) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `transakcje`
--

INSERT INTO `transakcje` (`id_transakcji`, `id_klienta`, `data`, `id_statusu`, `termin_realizacji`, `uwagi_klienta`) VALUES
(1, 1, '2018-10-01', 4, '2018-10-06', ''),
(2, 2, '2018-10-02', 1, '2018-10-12', ''),
(3, 3, '2018-10-02', 2, '2018-10-02', ''),
(4, 4, '2018-10-01', 3, '2018-10-31', ''),
(5, 5, '2018-10-23', 3, '2018-10-30', ''),
(6, 6, '2018-10-25', 3, '2018-10-29', ''),
(7, 6, '2018-10-18', 2, '2018-10-24', '');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienia`
--

CREATE TABLE `zamowienia` (
  `id_zamowienia` int(11) NOT NULL,
  `id_rodzaju` int(11) NOT NULL,
  `id_smaku` int(11) NOT NULL,
  `id_dekoracji` int(11) NOT NULL,
  `ilosc_kg` float NOT NULL,
  `cena_za_kg` float NOT NULL,
  `koszt` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `zamowienia`
--

INSERT INTO `zamowienia` (`id_zamowienia`, `id_rodzaju`, `id_smaku`, `id_dekoracji`, `ilosc_kg`, `cena_za_kg`, `koszt`) VALUES
(1, 1, 6, 3, 3, 50, 150),
(2, 4, 10, 5, 2, 38, 76),
(3, 3, 12, 4, 4, 45, 180),
(4, 2, 16, 5, 2, 35, 87),
(5, 2, 4, 3, 3, 50, 150),
(6, 4, 1, 1, 10, 40, 400),
(7, 1, 15, 2, 8, 80, 640),
(8, 3, 5, 3, 2, 60, 120),
(9, 1, 8, 3, 6, 55, 330),
(10, 1, 4, 4, 4, 70, 280),
(11, 2, 3, 6, 6, 40, 240),
(12, 1, 3, 3, 5, 20, 100),
(13, 1, 2, 4, 6, 30, 180),
(14, 4, 5, 5, 4, 25, 100),
(15, 1, 2, 2, 12, 100, 1200),
(16, 2, 10, 4, 4, 50, 200),
(17, 1, 1, 1, 10, 70, 700),
(18, 1, 7, 2, 8, 100, 800),
(19, 3, 8, 4, 5, 50, 250),
(20, 4, 13, 3, 6, 25, 150);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `dekoracje`
--
ALTER TABLE `dekoracje`
  ADD PRIMARY KEY (`id_dekoracji`);

--
-- Indeksy dla tabeli `klienci`
--
ALTER TABLE `klienci`
  ADD PRIMARY KEY (`id_klienta`);

--
-- Indeksy dla tabeli `rodzajewypiekow`
--
ALTER TABLE `rodzajewypiekow`
  ADD PRIMARY KEY (`id_rodzaju`);

--
-- Indeksy dla tabeli `smaki`
--
ALTER TABLE `smaki`
  ADD PRIMARY KEY (`id_smaku`);

--
-- Indeksy dla tabeli `statusy`
--
ALTER TABLE `statusy`
  ADD PRIMARY KEY (`id_statusu`);

--
-- Indeksy dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  ADD PRIMARY KEY (`id_transakcji`);

--
-- Indeksy dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  ADD PRIMARY KEY (`id_zamowienia`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `dekoracje`
--
ALTER TABLE `dekoracje`
  MODIFY `id_dekoracji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT dla tabeli `klienci`
--
ALTER TABLE `klienci`
  MODIFY `id_klienta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `rodzajewypiekow`
--
ALTER TABLE `rodzajewypiekow`
  MODIFY `id_rodzaju` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `smaki`
--
ALTER TABLE `smaki`
  MODIFY `id_smaku` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT dla tabeli `statusy`
--
ALTER TABLE `statusy`
  MODIFY `id_statusu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `transakcje`
--
ALTER TABLE `transakcje`
  MODIFY `id_transakcji` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT dla tabeli `zamowienia`
--
ALTER TABLE `zamowienia`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
