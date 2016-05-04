-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2016 at 08:29 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `gsbv2`
--

-- --------------------------------------------------------

--
-- Table structure for table `etat`
--

CREATE TABLE IF NOT EXISTS `etat` (
  `id` char(2) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etat`
--

INSERT INTO `etat` (`id`, `libelle`) VALUES
('CL', 'Saisie clôturée'),
('CR', 'Fiche créée, saisie en cours'),
('RB', 'Remboursée'),
('VA', 'Validée et mise en paiement');

-- --------------------------------------------------------

--
-- Table structure for table `fichefrais`
--

CREATE TABLE IF NOT EXISTS `fichefrais` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `nbJustificatifs` int(11) DEFAULT NULL,
  `montantValide` decimal(10,2) DEFAULT NULL,
  `dateModif` date DEFAULT NULL,
  `idEtat` char(2) DEFAULT 'CR',
  PRIMARY KEY (`idVisiteur`,`mois`),
  KEY `idEtat` (`idEtat`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fichefrais`
--

INSERT INTO `fichefrais` (`idVisiteur`, `mois`, `nbJustificatifs`, `montantValide`, `dateModif`, `idEtat`) VALUES
('A00', '201604', 0, '0.00', '2016-04-15', 'CR'),
('a17', '201604', 0, '0.00', '2016-04-15', 'CR'),
('F01', '201604', 0, '0.00', '2016-04-19', 'CR');

-- --------------------------------------------------------

--
-- Table structure for table `fraisforfait`
--

CREATE TABLE IF NOT EXISTS `fraisforfait` (
  `id` char(3) NOT NULL,
  `libelle` char(20) DEFAULT NULL,
  `montant` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fraisforfait`
--

INSERT INTO `fraisforfait` (`id`, `libelle`, `montant`) VALUES
('ETP', 'Forfait Etape', '110.00'),
('KM', 'Frais Kilométrique', '0.62'),
('NUI', 'Nuitée Hôtel', '80.00'),
('REP', 'Repas Restaurant', '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `lignefraisforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraisforfait` (
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `idFraisForfait` char(3) NOT NULL,
  `quantite` int(11) DEFAULT NULL,
  PRIMARY KEY (`idVisiteur`,`mois`,`idFraisForfait`),
  KEY `idFraisForfait` (`idFraisForfait`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lignefraisforfait`
--

INSERT INTO `lignefraisforfait` (`idVisiteur`, `mois`, `idFraisForfait`, `quantite`) VALUES
('A00', '201604', 'ETP', 1),
('A00', '201604', 'KM', 2),
('A00', '201604', 'NUI', 3),
('A00', '201604', 'REP', 4),
('a17', '201604', 'ETP', 6),
('a17', '201604', 'KM', 0),
('a17', '201604', 'NUI', 7),
('a17', '201604', 'REP', 12),
('F01', '201604', 'ETP', 6),
('F01', '201604', 'KM', 500),
('F01', '201604', 'NUI', 8),
('F01', '201604', 'REP', 5);

-- --------------------------------------------------------

--
-- Table structure for table `lignefraishorsforfait`
--

CREATE TABLE IF NOT EXISTS `lignefraishorsforfait` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idVisiteur` char(4) NOT NULL,
  `mois` char(6) NOT NULL,
  `libelle` varchar(100) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `montant` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idVisiteur` (`idVisiteur`,`mois`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `lignefraishorsforfait`
--

INSERT INTO `lignefraishorsforfait` (`id`, `idVisiteur`, `mois`, `libelle`, `date`, `montant`) VALUES
(2, 'A00', '201604', 'Champagne pour mon chat', '2016-04-12', '5000.00'),
(3, 'A00', '201604', 'Call girl pour client', '2016-04-12', '75000.00'),
(4, 'F01', '201604', 'Bonbons pour fils client', '2016-04-12', '150.00');

-- --------------------------------------------------------

--
-- Table structure for table `visiteur`
--

CREATE TABLE IF NOT EXISTS `visiteur` (
  `id` char(4) NOT NULL,
  `nom` char(30) DEFAULT NULL,
  `prenom` char(30) DEFAULT NULL,
  `ville` char(30) DEFAULT NULL,
  `adresse` char(30) DEFAULT NULL,
  `cp` char(5) DEFAULT NULL,
  `dateEmbauche` date DEFAULT NULL,
  `mdp` char(20) DEFAULT NULL,
  `login` char(20) DEFAULT NULL,
  `token` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `visiteur`
--

INSERT INTO `visiteur` (`id`, `nom`, `prenom`, `ville`, `adresse`, `cp`, `dateEmbauche`, `mdp`, `login`, `token`) VALUES
('A00', 'Admin', 'Robert', 'Paris', '1 allée de la chèvre', '75015', '2016-04-15', 'lol', 'admin', 1),
('a131', 'Villechalane', 'Louis', 'Cahors', '8 rue des Charmes', '46000', '2005-12-21', 'jux7g', 'lvillachane', 1),
('a17', 'Andre', 'David', 'Lalbenque', '1 rue Petit', '46200', '1998-11-23', 'oppg5', 'dandre', 1),
('a55', 'Bedos', 'Christian', 'Montcuq', '1 rue Peranud', '46250', '1995-01-12', 'gmhxd', 'cbedos', 1),
('a93', 'Tusseau', 'Louis', 'Gramat', '22 rue des Ternes', '46123', '2000-05-01', 'ktp3s', 'ltusseau', 1),
('b13', 'Bentot', 'Pascal', 'Bessines', '11 allée des Cerises', '46512', '1992-07-09', 'doyw1', 'pbentot', 1),
('b16', 'Bioret', 'Luc', 'Cahors', '1 Avenue gambetta', '46000', '1998-05-11', 'hrjfs', 'lbioret', 1),
('b19', 'Bunisset', 'Francis', 'Montreuil', '10 rue des Perles', '93100', '1987-10-21', '4vbnd', 'fbunisset', 1),
('b25', 'Bunisset', 'Denise', 'Paris', '23 rue Manin', '75019', '2010-12-05', 's1y1r', 'dbunisset', 1),
('b28', 'Cacheux', 'Bernard', 'Paris', '114 rue Blanche', '75017', '2009-11-12', 'uf7r3', 'bcacheux', 1),
('b34', 'Cadic', 'Eric', 'Paris', '123 avenue de la République', '75011', '2008-09-23', '6u8dc', 'ecadic', 1),
('b4', 'Charoze', 'Catherine', 'Paris', '100 rue Petit', '75019', '2005-11-12', 'u817o', 'ccharoze', 1),
('b50', 'Clepkens', 'Christophe', 'Romainville', '12 allée des Anges', '93230', '2003-08-11', 'bw1us', 'cclepkens', 1),
('b59', 'Cottin', 'Vincenne', 'Monteuil', '36 rue Des Roches', '93100', '2001-11-18', '2hoh9', 'vcottin', 1),
('c14', 'Daburon', 'François', 'Créteil', '13 rue de Chanzy', '94000', '2002-02-11', '7oqpv', 'fdaburon', 1),
('c3', 'De', 'Philippe', 'Créteil', '13 rue Barthes', '94000', '2010-12-14', 'gk9kx', 'pde', 1),
('c54', 'Debelle', 'Michel', 'Rosny', '181 avenue Barbusse', '93210', '2006-11-23', 'od5rt', 'mdebelle', 1),
('d13', 'Debelle', 'Jeanne', 'Nantes', '134 allée des Joncs', '44000', '2000-05-11', 'nvwqq', 'jdebelle', 1),
('d51', 'Debroise', 'Michel', 'Nantes', '2 Bld Jourdain', '44000', '2001-04-17', 'sghkb', 'mdebroise', 1),
('e22', 'Desmarquest', 'Nathalie', 'Orléans', '14 Place d Arc', '45000', '2005-11-12', 'f1fob', 'ndesmarquest', 1),
('e24', 'Desnost', 'Pierre', 'Guéret', '16 avenue des Cèdres', '23200', '2001-02-05', '4k2o5', 'pdesnost', 1),
('e39', 'Dudouit', 'Frédéric', 'GrandBourg', '18 rue de l église', '23120', '2000-08-01', '44im8', 'fdudouit', 1),
('e49', 'Duncombe', 'Claude', 'La souteraine', '19 rue de la tour', '23100', '1987-10-10', 'qf77j', 'cduncombe', 1),
('e5', 'Enault-Pascreau', 'Céline', 'Gueret', '25 place de la gare', '23200', '1995-09-01', 'y2qdu', 'cenault', 1),
('e52', 'Eynde', 'Valérie', 'Marseille', '3 Grand Place', '13015', '1999-11-01', 'i7sn3', 'veynde', 1),
('F01', 'Roberto', 'Didier', 'Paris', '1 allée de la petite banane', '77015', '2016-04-19', '123', 'comptable', 2),
('f21', 'Finck', 'Jacques', 'Marseille', '10 avenue du Prado', '13002', '2001-11-10', 'mpb3t', 'jfinck', 1),
('f39', 'Frémont', 'Fernande', 'Allauh', '4 route de la mer', '13012', '1998-10-01', 'xs5tq', 'ffremont', 1),
('f4', 'Gest', 'Alain', 'Berre', '30 avenue de la mer', '13025', '1985-11-01', 'dywvt', 'agest', 1);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fichefrais`
--
ALTER TABLE `fichefrais`
  ADD CONSTRAINT `fichefrais_ibfk_1` FOREIGN KEY (`idEtat`) REFERENCES `etat` (`id`),
  ADD CONSTRAINT `fichefrais_ibfk_2` FOREIGN KEY (`idVisiteur`) REFERENCES `visiteur` (`id`);

--
-- Constraints for table `lignefraisforfait`
--
ALTER TABLE `lignefraisforfait`
  ADD CONSTRAINT `lignefraisforfait_ibfk_1` FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`),
  ADD CONSTRAINT `lignefraisforfait_ibfk_2` FOREIGN KEY (`idFraisForfait`) REFERENCES `fraisforfait` (`id`);

--
-- Constraints for table `lignefraishorsforfait`
--
ALTER TABLE `lignefraishorsforfait`
  ADD CONSTRAINT `lignefraishorsforfait_ibfk_1` FOREIGN KEY (`idVisiteur`, `mois`) REFERENCES `fichefrais` (`idVisiteur`, `mois`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
