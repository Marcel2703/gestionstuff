-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 15 Octobre 2015 à 13:17
-- Version du serveur :  5.6.16
-- Version de PHP :  5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gest_employe`
--

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE IF NOT EXISTS `employe` (
  `numEmploye` varchar(5) NOT NULL,
  `nomEmploye` varchar(20) NOT NULL,
  `adrEmploye` varchar(20) NOT NULL,
  PRIMARY KEY (`numEmploye`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `employe`
--

INSERT INTO `employe` (`numEmploye`, `nomEmploye`, `adrEmploye`) VALUES
('E1', 'Mbola', 'Tanambao'),
('E2', 'Herizo', 'Ivory'),
('E3', 'Annicet', 'Ampitakely'),
('E4', 'Edouard', 'Amponenana');

-- --------------------------------------------------------

--
-- Structure de la table `entreprise`
--

CREATE TABLE IF NOT EXISTS `entreprise` (
  `numEntreprise` varchar(5) NOT NULL,
  `designEntreprise` varchar(15) NOT NULL,
  `localEntreprise` varchar(15) NOT NULL,
  PRIMARY KEY (`numEntreprise`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `entreprise`
--

INSERT INTO `entreprise` (`numEntreprise`, `designEntreprise`, `localEntreprise`) VALUES
('ENT1', 'Air Mad', 'Analakely'),
('ENT2', 'Apple Store', 'tsaralalana'),
('ENT3', 'Orange', 'Ankorondrano'),
('ENT4', 'ASECNA', 'Ivato');

-- --------------------------------------------------------

--
-- Structure de la table `travail`
--

CREATE TABLE IF NOT EXISTS `travail` (
  `numTravail` varchar(6) NOT NULL,
  `numEmploye` varchar(6) NOT NULL,
  `numEntreprise` varchar(6) NOT NULL,
  `nbHeures` int(11) NOT NULL,
  `tauxHoraires` float NOT NULL,
  `salaire` int(11) NOT NULL,
  `dateEmbauche` date NOT NULL,
  PRIMARY KEY (`numTravail`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `travail`
--

INSERT INTO `travail` (`numTravail`, `numEmploye`, `numEntreprise`, `nbHeures`, `tauxHoraires`, `salaire`, `dateEmbauche`) VALUES
('TR1', 'E3', 'ENT3', 8, 20.4, 163, '2015-07-16'),
('TR2', 'E2', 'ENT1', 10, 10, 100, '2015-09-16'),
('TR3', 'E2', 'ENT3', 4, 17, 68, '2015-08-07'),
('TR4', 'E3', 'ENT2', 9, 55, 495, '2015-09-19'),
('TR5', 'E1', 'ENT1', 14, 25, 350, '2015-10-13');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
