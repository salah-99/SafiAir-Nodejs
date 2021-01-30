-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 31 jan. 2021 à 00:02
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.4

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
(113, 'salah', 'Salah Eddine', 6542389, 'Qualbal.fish@gmail.com', 'lk,lm');

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
(1, 333, '2021-01-28', 888, 'OPKDFL', 750, 1);

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
  `id_v` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `reservation`
--

INSERT INTO `reservation` (`id_r`, `nom`, `prenom`, `tele`, `email`, `person`, `id_v`) VALUES
(5, 'EZZAHI', 'Salah eddine', 2147483647, 'salaheddineezzahi5@gmail.com', 2, 1),
(6, 'EZZAHI', 'hossam', 6542389, 'salaheddineezzahi5@gmail.com', 4, 1),
(7, 'Travel', 'Salah eddine', 665664406, 'salaheddineezzahi5@gmail.com', 3, 1),
(8, 'EZZAHI', 'Salah Eddine', 6142567, 'sandak.fruit@gmail.com', 4, 1),
(9, 'salah', 'naji', 6542389, 'ezzahisalah5@gmail.com', 4, 1),
(10, 'salah', 'haya', 665664406, 'salaheddineezzahi5@gmail.com', 2, 1),
(11, 'Travel', 'hossam', 2147483647, 'Qualbal.fish@gmail.com', 2, 1);

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
  MODIFY `id_c` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT pour la table `payment`
--
ALTER TABLE `payment`
  MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `id_r` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

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
