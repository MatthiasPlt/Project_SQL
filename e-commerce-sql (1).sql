-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : ven. 22 nov. 2024 à 08:03
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce-sql`
--

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

DROP TABLE IF EXISTS `adress`;
CREATE TABLE IF NOT EXISTS `adress` (
  `IDadress` int NOT NULL AUTO_INCREMENT,
  `adress` varchar(125) NOT NULL,
  `IDuser` int NOT NULL,
  PRIMARY KEY (`IDadress`),
  KEY `IDuser` (`IDuser`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `adress`
--

INSERT INTO `adress` (`IDadress`, `adress`, `IDuser`) VALUES
(171, '639, chemin de Bouchet\n79080 Baudry', 174),
(172, '1, impasse Aubert\n81849 Mallet', 175),
(173, '11, place Lambert\n74975 Blondel-la-Forêt', 176),
(174, '97, place de Boulanger\n44590 Julien-sur-Leroux', 177),
(175, '46, place Théophile Lebon\n17656 Pichon', 178),
(176, '5, rue Claire Maillet\n98426 Thierry-sur-Langlois', 179),
(177, '329, chemin Marthe Torres\n03005 ChevallierVille', 180),
(178, '7, impasse Neveu\n23866 Durand', 181),
(179, 'chemin Roland Noel\n91823 Mercier', 182),
(180, 'boulevard de Louis\n73281 Martinnec', 183),
(181, 'rue Guyot\n58863 Girard', 184),
(182, '10, place de Couturier\n25550 Marindan', 185),
(183, '57, chemin de Normand\n55351 Menard', 186),
(184, 'place Jacques Vaillant\n97067 Bonninnec', 187),
(185, 'rue de Michaud\n35166 Riviere', 188);

-- --------------------------------------------------------

--
-- Structure de la table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `IDCart` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `IDUser` int NOT NULL,
  PRIMARY KEY (`IDCart`),
  KEY `userCart` (`IDUser`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `cart`
--

INSERT INTO `cart` (`IDCart`, `quantity`, `IDUser`) VALUES
(138, 3, 176),
(139, 6, 177),
(140, 1, 178),
(141, 8, 179),
(142, 5, 180),
(143, 1, 181),
(144, 10, 182),
(145, 4, 183),
(146, 5, 184),
(147, 8, 185),
(148, 9, 186),
(149, 1, 187),
(150, 3, 188);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `IDCommand` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL,
  `number` int NOT NULL,
  `IDUser` int NOT NULL,
  `IDAdress` int NOT NULL,
  PRIMARY KEY (`IDCommand`),
  KEY `user` (`IDUser`),
  KEY `adress` (`IDAdress`)
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`IDCommand`, `date`, `number`, `IDUser`, `IDAdress`) VALUES
(168, '2007-08-28 22:00:00', 9202, 176, 173),
(169, '1975-09-03 22:00:00', 5000, 177, 174),
(170, '2007-08-17 22:00:00', 9090, 178, 175),
(171, '1995-11-28 23:00:00', 5169, 179, 176),
(172, '2018-12-29 23:00:00', 5299, 180, 177),
(173, '2007-06-07 22:00:00', 8872, 181, 178),
(174, '2004-12-28 23:00:00', 5336, 182, 179),
(175, '2023-12-31 23:00:00', 5455, 183, 180),
(176, '1977-11-27 23:00:00', 8676, 184, 181),
(177, '1996-04-19 22:00:00', 3031, 185, 182),
(178, '1989-09-16 22:00:00', 3771, 186, 183),
(179, '1983-07-03 22:00:00', 8430, 187, 184),
(180, '2004-06-12 22:00:00', 6070, 188, 185);

-- --------------------------------------------------------

--
-- Structure de la table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `IDPayment` int NOT NULL AUTO_INCREMENT,
  `Iban` varchar(34) NOT NULL,
  `carteNumber` int NOT NULL,
  `expiryDate` int NOT NULL,
  `CVC` int NOT NULL,
  `IDUser` int NOT NULL,
  PRIMARY KEY (`IDPayment`),
  KEY `userPayment` (`IDUser`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `payment`
--

INSERT INTO `payment` (`IDPayment`, `Iban`, `carteNumber`, `expiryDate`, `CVC`, `IDUser`) VALUES
(138, 'RO26DIZPV62R2A16R1U00106', 2147483647, 622, 805, 176),
(139, 'TR68632748MB1J2PK6Z18P38E7', 2147483647, 722, 917, 177),
(140, 'SI96821677250850739', 2147483647, 423, 199, 178),
(141, 'TR434173130252494XQ1ZG6CY4', 2147483647, 623, 523, 179),
(142, 'EG892268866216493079536299064', 2147483647, 625, 704, 180),
(143, 'SK8903107916819087021236', 2147483647, 530, 668, 181),
(144, 'PL23809920915492516578036002', 2147483647, 623, 458, 182),
(145, 'MD292908H722V7H0D6DF704Y', 2147483647, 425, 246, 183),
(146, 'BE45866710259329', 2147483647, 730, 107, 184),
(147, 'LI3341571R983PISE0W5X', 2147483647, 1228, 923, 185),
(148, 'IS265990348329716805825728', 2147483647, 1023, 688, 186),
(149, 'GE78BV5570610656612142', 2147483647, 1127, 251, 187),
(150, 'VG12OYMI1335249092937193', 2147483647, 1029, 625, 188);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `IDProduct` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prix` int NOT NULL,
  `description` text NOT NULL,
  `recommendation` tinyint(1) NOT NULL,
  PRIMARY KEY (`IDProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`IDProduct`, `nom`, `prix`, `description`, `recommendation`) VALUES
(116, 'ex', 27, 'Temporibus modi ab libero impedit iure. Possimus quaerat voluptas amet autem. Dolores beatae mollitia voluptates atque.', 0),
(117, 'et', 24, 'Et dicta aut voluptatem rem voluptas ut nobis. Alias voluptates eveniet voluptate quod nostrum architecto. Porro harum et omnis in ea velit. Hic eum est esse cum enim qui.', 0),
(118, 'recusandae', 827, 'Id excepturi voluptatibus corrupti voluptatem et esse fugit. Atque id voluptas et qui numquam temporibus. Consectetur accusamus consectetur sit nostrum.', 0),
(119, 'et', 929, 'Consequatur et itaque exercitationem. Eius nesciunt ratione praesentium quo voluptatem dolorem nam sed. Fugit eligendi ut ducimus. Accusamus et vel sapiente tempore est nesciunt ea quod.', 0),
(120, 'hic', 351, 'Sunt rem tempora modi autem similique. Accusamus sint voluptatem ducimus. Quae odio optio totam repudiandae sit rerum. Sapiente ducimus ea cum.', 0),
(121, 'labore', 135, 'Aut saepe eum quis atque ea accusantium totam. Quia dolor reprehenderit porro exercitationem. Sed non temporibus repudiandae fugit. Modi minima sint neque ipsam quidem amet.', 0),
(122, 'est', 351, 'Accusamus non numquam eaque excepturi sed. Saepe eligendi suscipit dolor corrupti quia soluta et.', 0),
(123, 'tempore', 534, 'In aut quod autem quia veritatis consectetur earum. Quis expedita ut distinctio veniam eum. Quas molestiae alias necessitatibus dolores quaerat eaque dolor. Veniam aperiam blanditiis fugit.', 0),
(124, 'facere', 623, 'Libero pariatur perspiciatis nostrum facilis nobis sed. Maxime iusto a ex cumque dolor dignissimos qui officiis. Dolor dolorum ut voluptatibus. Labore sit nobis quidem dolor iusto.', 0),
(125, 'fuga', 424, 'Debitis natus modi eligendi. Laudantium numquam a enim ratione. Repudiandae magnam perferendis facilis a omnis mollitia et. Saepe enim autem fugiat assumenda.', 0);

-- --------------------------------------------------------

--
-- Structure de la table `productcart`
--

DROP TABLE IF EXISTS `productcart`;
CREATE TABLE IF NOT EXISTS `productcart` (
  `IDProductCart` int NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `IDProduct` int NOT NULL,
  `IDCart` int NOT NULL,
  PRIMARY KEY (`IDProductCart`),
  KEY `cart` (`IDCart`),
  KEY `product` (`IDProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `productcart`
--

INSERT INTO `productcart` (`IDProductCart`, `quantity`, `IDProduct`, `IDCart`) VALUES
(140, 5, 116, 141),
(141, 4, 117, 142),
(142, 3, 118, 143),
(143, 5, 119, 144),
(144, 5, 120, 145),
(145, 3, 121, 146),
(146, 1, 122, 147),
(147, 2, 123, 148),
(148, 10, 124, 149),
(149, 5, 125, 150);

-- --------------------------------------------------------

--
-- Structure de la table `rate`
--

DROP TABLE IF EXISTS `rate`;
CREATE TABLE IF NOT EXISTS `rate` (
  `IDRate` int NOT NULL AUTO_INCREMENT,
  `note` int NOT NULL,
  `description` varchar(1500) NOT NULL,
  `IDUser` int NOT NULL,
  `IDProduct` int NOT NULL,
  PRIMARY KEY (`IDRate`),
  KEY `userRate` (`IDUser`),
  KEY `productRate` (`IDProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `rate`
--

INSERT INTO `rate` (`IDRate`, `note`, `description`, `IDUser`, `IDProduct`) VALUES
(116, 1, 'Est debitis vel et libero ea. Et aut dolorem ab repudiandae adipisci sunt at. Recusandae voluptate ullam soluta error architecto veritatis. Voluptas ut maiores sit.', 179, 116),
(117, 2, 'Libero illo ut voluptatem qui. Pariatur vitae voluptas adipisci voluptas nihil optio sed. Doloremque sint eos dolorem et modi. Rem qui reprehenderit nemo dolor rem. Nostrum saepe laboriosam hic.', 180, 117),
(118, 1, 'Non quos dicta mollitia voluptate. Veniam rerum aut ut ducimus non voluptatum sunt. Sit qui qui ratione quia in illo quia occaecati.', 181, 118),
(119, 3, 'Ipsum omnis fuga ut quis itaque. Et nostrum perspiciatis rerum. Iusto aspernatur aut inventore nesciunt vel molestias adipisci.', 182, 119),
(120, 4, 'Quibusdam unde deleniti expedita repellendus veritatis et mollitia. Voluptatem fuga voluptatem repellat rerum possimus. Iste nesciunt explicabo autem accusamus explicabo.', 183, 120),
(121, 5, 'Aliquam sint tempora sit cumque. Aspernatur atque voluptatibus expedita qui. Ipsam nihil similique sed voluptate.', 184, 121),
(122, 2, 'Iusto inventore rerum cupiditate iste sunt quia hic. Voluptatem vitae voluptatibus et et. Maxime nostrum eius cupiditate quos fugit.', 185, 122),
(123, 5, 'Cupiditate illum quidem excepturi laborum ducimus ea. Id qui inventore illum nemo vero error corrupti voluptatem. Cumque dolorem soluta est beatae.', 186, 123),
(124, 1, 'Voluptates qui commodi quibusdam est. Eum et mollitia nihil ipsa architecto. Veniam ut aliquam iure sunt in dolores.', 187, 124),
(125, 3, 'Corrupti est aspernatur accusantium in iste autem. Dolorem est id voluptas quae voluptas veniam voluptatem. Quaerat libero sit possimus.', 188, 125);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `IDuser` int NOT NULL AUTO_INCREMENT,
  `prenom` varchar(100) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telephone` int NOT NULL,
  PRIMARY KEY (`IDuser`)
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`IDuser`, `prenom`, `nom`, `email`, `telephone`) VALUES
(174, 'Arthur', 'Coulon', 'laure.michel@blondel.org', 33),
(175, 'Adrien', 'Martel', 'marnaud@sfr.fr', 4),
(176, 'Richard', 'Brun', 'iroux@blanc.fr', 33),
(177, 'Anaïs', 'Lefebvre', 'anouk65@renard.fr', 33),
(178, 'Théodore', 'Colin', 'schneider.paul@laposte.net', 218733223),
(179, 'Thibaut', 'Riou', 'mace.auguste@buisson.fr', 33),
(180, 'Richard', 'Leclercq', 'danielle06@noos.fr', 5),
(181, 'Sophie', 'Ribeiro', 'odette39@lacombe.net', 33),
(182, 'Susan', 'Pineau', 'gregoire.charles@gmail.com', 33),
(183, 'Antoine', 'Roux', 'olivier.thomas@gmail.com', 897423855),
(184, 'Georges', 'Perrot', 'vdossantos@nguyen.net', 990325650),
(185, 'Paul', 'Schmitt', 'udenis@tele2.fr', 9),
(186, 'Cécile', 'Dupuy', 'thibaut42@leconte.fr', 33),
(187, 'Aurélie', 'Bouchet', 'simone01@club-internet.fr', 33),
(188, 'Aurore', 'Breton', 'rlebon@hotmail.fr', 33);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `useradress` FOREIGN KEY (`IDuser`) REFERENCES `user` (`IDuser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `userCart` FOREIGN KEY (`IDUser`) REFERENCES `user` (`IDuser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `adress` FOREIGN KEY (`IDAdress`) REFERENCES `adress` (`IDadress`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user` FOREIGN KEY (`IDUser`) REFERENCES `user` (`IDuser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `userPayment` FOREIGN KEY (`IDUser`) REFERENCES `user` (`IDuser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `productcart`
--
ALTER TABLE `productcart`
  ADD CONSTRAINT `cart` FOREIGN KEY (`IDCart`) REFERENCES `cart` (`IDCart`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product` FOREIGN KEY (`IDProduct`) REFERENCES `product` (`IDProduct`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `rate`
--
ALTER TABLE `rate`
  ADD CONSTRAINT `productRate` FOREIGN KEY (`IDProduct`) REFERENCES `product` (`IDProduct`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `userRate` FOREIGN KEY (`IDUser`) REFERENCES `user` (`IDuser`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
