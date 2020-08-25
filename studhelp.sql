-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  mar. 25 août 2020 à 07:52
-- Version du serveur :  10.4.10-MariaDB
-- Version de PHP :  7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `studhelp`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories_posting`
--

DROP TABLE IF EXISTS `categories_posting`;
CREATE TABLE IF NOT EXISTS `categories_posting` (
  `ID_categories` int(11) NOT NULL AUTO_INCREMENT,
  `posting_cat_type` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `categories_posting`
--

INSERT INTO `categories_posting` (`ID_categories`, `posting_cat_type`) VALUES
(1, 'Événement'),
(2, 'Bon Plan'),
(3, 'Offre d\'emploi');

-- --------------------------------------------------------

--
-- Structure de la table `class_moderator`
--

DROP TABLE IF EXISTS `class_moderator`;
CREATE TABLE IF NOT EXISTS `class_moderator` (
  `ID_Moderator` int(11) NOT NULL AUTO_INCREMENT,
  `user_acess` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_Moderator`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `class_moderator`
--

INSERT INTO `class_moderator` (`ID_Moderator`, `user_acess`) VALUES
(1, 'Utilisateur'),
(2, 'Modérateur');

-- --------------------------------------------------------

--
-- Structure de la table `edit_post`
--

DROP TABLE IF EXISTS `edit_post`;
CREATE TABLE IF NOT EXISTS `edit_post` (
  `ID_posting` int(11) NOT NULL,
  `ID_register` int(11) NOT NULL,
  PRIMARY KEY (`ID_posting`,`ID_register`),
  KEY `ID_register` (`ID_register`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `have_favorite`
--

DROP TABLE IF EXISTS `have_favorite`;
CREATE TABLE IF NOT EXISTS `have_favorite` (
  `ID_posting` int(11) NOT NULL,
  `ID_register` int(11) NOT NULL,
  PRIMARY KEY (`ID_posting`,`ID_register`),
  KEY `ID_register` (`ID_register`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `posting`
--

DROP TABLE IF EXISTS `posting`;
CREATE TABLE IF NOT EXISTS `posting` (
  `ID_posting` int(11) NOT NULL AUTO_INCREMENT,
  `posting_title` varchar(50) NOT NULL,
  `posting_mail` varchar(50) NOT NULL,
  `posting_numberphone` int(11) NOT NULL,
  `posting_img` varchar(50) NOT NULL,
  `posting_description` varchar(255) NOT NULL,
  `posting_datestartevent` date DEFAULT NULL,
  `posting_dateendevent` date DEFAULT NULL,
  `posting_startevent` time DEFAULT NULL,
  `posting_endevent` time DEFAULT NULL,
  `posting_date` date NOT NULL,
  `posting_minidescription` varchar(50) DEFAULT NULL,
  `posting_validate` tinyint(4) NOT NULL,
  `loca_cities` varchar(50) NOT NULL,
  `loca_postal_code` int(11) NOT NULL,
  `ID_categories` int(11) NOT NULL,
  PRIMARY KEY (`ID_posting`),
  KEY `Posting_Categories_posting_FK` (`ID_categories`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `posting`
--

INSERT INTO `posting` (`ID_posting`, `posting_title`, `posting_mail`, `posting_numberphone`, `posting_img`, `posting_description`, `posting_datestartevent`, `posting_dateendevent`, `posting_startevent`, `posting_endevent`, `posting_date`, `posting_minidescription`, `posting_validate`, `loca_cities`, `loca_postal_code`, `ID_categories`) VALUES
(1, 'TITRE-1', 'test.test@gmail.com', 605171717, 'gqsknosngds.jpg', 'azertyuiopazertyuiop^zertyuiopazertyuiopazertyuiop', NULL, NULL, NULL, NULL, '2020-07-30', 'azertyuiopazertyuiop', 0, 'Le Havre', 76600, 3),
(2, 'TITRE-2', 'test2.test2gmail.com', 605175023, 'azeazeaeazeazea.png', 'azertyuiopazertyuiop^zertyuiopazertyuiopazertyuio', '2020-08-21', '2020-09-17', '14:00:00', '14:00:00', '2020-07-30', 'azertyuioplkjhgfdsqwxcvbnmlkjhgfdsq', 1, 'Rouen', 76100, 1);

-- --------------------------------------------------------

--
-- Structure de la table `register_type`
--

DROP TABLE IF EXISTS `register_type`;
CREATE TABLE IF NOT EXISTS `register_type` (
  `ID_registertype` int(11) NOT NULL AUTO_INCREMENT,
  `register_type` varchar(50) NOT NULL,
  PRIMARY KEY (`ID_registertype`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `register_type`
--

INSERT INTO `register_type` (`ID_registertype`, `register_type`) VALUES
(1, 'Étudiant'),
(2, 'Professionnel'),
(3, 'Administrateur');

-- --------------------------------------------------------

--
-- Structure de la table `register_user`
--

DROP TABLE IF EXISTS `register_user`;
CREATE TABLE IF NOT EXISTS `register_user` (
  `ID_register` int(11) NOT NULL AUTO_INCREMENT,
  `reg_lastname` varchar(50) NOT NULL,
  `reg_firstname` varchar(50) NOT NULL,
  `reg_mail` varchar(50) NOT NULL,
  `reg_birthdate` date DEFAULT NULL,
  `reg_password` varchar(255) NOT NULL,
  `reg_studentnumber` varchar(8) DEFAULT NULL,
  `reg_namesociety` varchar(50) DEFAULT NULL,
  `reg_siretnumber` varchar(14) DEFAULT NULL,
  `reg_validate` tinyint(1) NOT NULL DEFAULT 0,
  `ID_registertype` int(11) NOT NULL,
  `ID_Moderator` int(11) NOT NULL,
  PRIMARY KEY (`ID_register`),
  KEY `Register_user_Class_Moderator0_FK` (`ID_Moderator`),
  KEY `Register_user_Register_type_FK` (`ID_registertype`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `register_user`
--

INSERT INTO `register_user` (`ID_register`, `reg_lastname`, `reg_firstname`, `reg_mail`, `reg_birthdate`, `reg_password`, `reg_studentnumber`, `reg_namesociety`, `reg_siretnumber`, `reg_validate`, `ID_registertype`, `ID_Moderator`) VALUES
(60, 'Félix', 'Noël', 'felix.noel3@orange.fr', '1998-11-05', '$2y$10$F6yKx10e8vj2im5Uvo9pjOqzjnvG8TpK.97Wq7UCr3SAssGIyb8u2', '78945612', '', '', 1, 1, 2),
(61, 'Félix', 'Felix', 'felix.noel3@onge.fr', '1998-11-05', '$2y$10$mn9GadIw6Lw9iKMsyj4XiOfOD27KipeDa9Pmv40/bfv7vFybNPIa6', '12354678', '', '', 0, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `write_message`
--

DROP TABLE IF EXISTS `write_message`;
CREATE TABLE IF NOT EXISTS `write_message` (
  `ID_posting` int(11) NOT NULL,
  `ID_register` int(11) NOT NULL,
  PRIMARY KEY (`ID_posting`,`ID_register`),
  KEY `ID_register` (`ID_register`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `edit_post`
--
ALTER TABLE `edit_post`
  ADD CONSTRAINT `Edit_Post_Posting_FK` FOREIGN KEY (`ID_posting`) REFERENCES `posting` (`ID_posting`),
  ADD CONSTRAINT `edit_post_ibfk_1` FOREIGN KEY (`ID_register`) REFERENCES `register_user` (`ID_register`) ON DELETE CASCADE;

--
-- Contraintes pour la table `have_favorite`
--
ALTER TABLE `have_favorite`
  ADD CONSTRAINT `Have_favorite_Posting_FK` FOREIGN KEY (`ID_posting`) REFERENCES `posting` (`ID_posting`),
  ADD CONSTRAINT `have_favorite_ibfk_1` FOREIGN KEY (`ID_register`) REFERENCES `register_user` (`ID_register`) ON DELETE CASCADE;

--
-- Contraintes pour la table `posting`
--
ALTER TABLE `posting`
  ADD CONSTRAINT `Posting_Categories_posting_FK` FOREIGN KEY (`ID_categories`) REFERENCES `categories_posting` (`ID_categories`);

--
-- Contraintes pour la table `register_user`
--
ALTER TABLE `register_user`
  ADD CONSTRAINT `Register_user_Class_Moderator0_FK` FOREIGN KEY (`ID_Moderator`) REFERENCES `class_moderator` (`ID_Moderator`),
  ADD CONSTRAINT `Register_user_Register_type_FK` FOREIGN KEY (`ID_registertype`) REFERENCES `register_type` (`ID_registertype`);

--
-- Contraintes pour la table `write_message`
--
ALTER TABLE `write_message`
  ADD CONSTRAINT `Write_message_Posting_FK` FOREIGN KEY (`ID_posting`) REFERENCES `posting` (`ID_posting`),
  ADD CONSTRAINT `write_message_ibfk_1` FOREIGN KEY (`ID_register`) REFERENCES `register_user` (`ID_register`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
