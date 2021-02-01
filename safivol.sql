-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 01 fév. 2021 à 23:37
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `safivol`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_c` int(11) NOT NULL,
  `nom` varchar(250) DEFAULT NULL,
  `prenom` varchar(250) DEFAULT NULL,
  `tele` int(11) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `pass` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_c`, `nom`, `prenom`, `tele`, `email`, `pass`) VALUES
(1, 'EZZAHI', 'Salah eddine', 665664406, 'ezzahisalah5@gmail.com', '76589'),
(103, 'EZZAHI', 'Salah Eddine', 665664406, 'sma@viaje.com', 'kjglk'),
(104, NULL, NULL, NULL, NULL, NULL),
(105, NULL, NULL, NULL, NULL, NULL),
(106, 'salah', 'hossam', 6542389, 'Qualbal.fish@gmail.com', 'hjghlbk'),
(107, NULL, NULL, NULL, NULL, NULL),
(108, 'Travel', 'Salah eddine', 665664406, 'Qualbal.fish@gmail.com', 'kln'),
(109, NULL, NULL, NULL, NULL, NULL),
(110, NULL, NULL, NULL, NULL, NULL),
(111, 'EZZAHI', 'Salah Eddine', 665664406, 'ezzahisalah5@gmail.com', 'k,'),
(112, NULL, NULL, NULL, NULL, NULL),
(113, 'salah', 'Salah Eddine', 6542389, 'Qualbal.fish@gmail.com', 'lk,lm'),
(114, NULL, NULL, NULL, NULL, NULL),
(115, 'abrouk', 'saloua', 2147483647, 'elabyadsaloua@gmail.com', 'azerty'),
(116, 'Elabyad', 'admin', 614075409, 'elabyadsaloua@gmail.com', 'aze'),
(117, 'ily', 'hii', 77777, 'elabyadsaloua@gmail.com', 'ZD'),
(118, 'mohamed', 'elhachimi', 77777, 'salouaelabyad@gmail.com', 'jzhvhad'),
(119, 'Elabyad', 'saloua', 9090909, 'salouaelabyad@gmail.com', 'sjkg'),
(120, 'Elabyad', 'rtg', 614075409, 'salouaelabyad@gmail.com', 'rgh');

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

CREATE TABLE `payment` (
  `id_p` int(11) NOT NULL,
  `ncart` int(11) DEFAULT NULL,
  `datcart` date DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `nacart` varchar(200) DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `id_v` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`id_p`, `ncart`, `datcart`, `cvv`, `nacart`, `prix`, `id_v`) VALUES
(1, 333, '2021-01-28', 888, 'OPKDFL', 750, 1),
(2, 12345, '2021-02-08', 111, 'saloua-elabyad', 750, 1),
(3, 12345, '2021-02-02', 2222, 'saloua-elabyad', 750, 1),
(4, 12345, '2021-02-02', 3333, 'saloua-elabyaddfs', 750, 1),
(5, 12345, '2021-02-25', 444, 'ily_hii', 750, 1),
(7, 12345, '2021-02-03', 111, 'saloua-elabyad', 750, NULL),
(9, 12345, '2021-02-17', 444, 'saloua-elabyad', 750, 1),
(10, 1111, '2021-02-11', 444, 'saloua-elabyad', 750, 1),
(11, 12345, '2021-02-03', 111, 'saloua-elabyad', 750, 1),
(12, 12345, '2021-02-10', 2222, 'saloua-elabyad', 750, 1),
(18, 12345, '2021-02-19', 68876, 'saloua-elabyad', 750, 2),
(19, 2147483647, '2021-02-10', 68876, 'saloua-elabyad', 750, 1),
(20, 2147483647, '2021-02-11', 444, 'saloua-elabyad', 750, 2),
(21, 12345, '2021-02-10', 111, 'saloua-elabyad', 750, 1),
(22, 12345, '2021-02-10', 68876, 'saloua-elabyad', 750, 1),
(23, 12345, '2021-02-17', 68876, 'saloua-elabyad', 750, 2),
(24, 12345, '2021-02-09', 68876, 'saloua-elabyad', 750, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE `reservation` (
  `id_r` int(11) NOT NULL,
  `nom` varchar(200) DEFAULT NULL,
  `prenom` varchar(200) DEFAULT NULL,
  `tele` int(11) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `person` int(11) DEFAULT NULL,
  `id_v` int(11) NOT NULL,
  `nombre` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_r`, `nom`, `prenom`, `tele`, `email`, `person`, `id_v`, `nombre`) VALUES
(39, 'Elabyad', 'wissal', 77777, 'salouaelabyad@gmail.com', 3, 1, 17),
(40, 'Elabyad', 'hicham', 77777, 'salouaelabyad@gmail.com', 3, 1, 17),
(41, 'mohamed', 'elhachimi', 614075409, 'ikram.lave@outlook.fr', 1, 1, 5),
(42, 'Elabyad', 'admin', 614075409, 'ikram.elabyed@gmail.com', 2, 1, 5),
(43, 'hachimii', 'fati', 614075409, 'salouaelabyad@gmail.com', 2, 1, 5),
(44, 'mohamed', 'ily', 614075409, 'salouaelabyad@gmail.com', 2, 1, 5),
(45, 'hello', 'hello', 614075409, 'salouaelabyad@gmail.com', 5, 1, 15);

-- --------------------------------------------------------

--
-- Structure de la table `vol`
--

CREATE TABLE `vol` (
  `id_v` int(11) NOT NULL,
  `villedep` varchar(200) DEFAULT NULL,
  `villearr` varchar(200) DEFAULT NULL,
  `timedep` time DEFAULT NULL,
  `timearr` time DEFAULT NULL,
  `datedep` date DEFAULT NULL,
  `datearr` date DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `person` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `vol`
--

INSERT INTO `vol` (`id_v`, `villedep`, `villearr`, `timedep`, `timearr`, `datedep`, `datearr`, `prix`, `person`) VALUES
(1, 'safi', 'marakech', '17:39:48', '21:39:48', '2021-01-13', '2021-01-13', 750, 20),
(2, 'tit', 'jnds', '08:40:44', '08:40:44', '2021-01-06', '2021-01-06', 750, 20);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_c`);

--
-- Index pour la table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_p`),
  ADD KEY `id_r` (`id_v`);

--
-- Index pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`id_r`),
  ADD KEY `vol` (`id_v`);

--
-- Index pour la table `vol`
--
ALTER TABLE `vol`
  ADD PRIMARY KEY (`id_v`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_c` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_r` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `vol`
--
ALTER TABLE `vol`
  MODIFY `id_v` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_v`) REFERENCES `vol` (`id_v`);

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_v`) REFERENCES `vol` (`id_v`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
