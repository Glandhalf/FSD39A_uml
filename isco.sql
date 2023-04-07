-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 07 avr. 2023 à 14:55
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `isco`
--

-- --------------------------------------------------------

--
-- Structure de la table `affaires`
--

CREATE TABLE `affaires` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `raison_sociale` varchar(30) NOT NULL,
  `siret` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

CREATE TABLE `devis` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `statut` enum('creation','vie de solution','En-cours signature','refus signature','signe','commande') NOT NULL DEFAULT 'creation',
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `offer` varchar(30) NOT NULL,
  `id_affaire` int(11) NOT NULL,
  `id_itc` int(11) NOT NULL,
  `id_client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `devis_prestations`
--

CREATE TABLE `devis_prestations` (
  `id_devis` int(11) NOT NULL,
  `id_prestation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `devis_products`
--

CREATE TABLE `devis_products` (
  `id_devis` int(11) NOT NULL,
  `id_product` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `interlocuteurs`
--

CREATE TABLE `interlocuteurs` (
  `id` int(11) NOT NULL,
  `civilite` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `tel_fixe` varchar(30) NOT NULL,
  `tel_mobile` varchar(30) NOT NULL,
  `id_client` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `itcs`
--

CREATE TABLE `itcs` (
  `id` int(11) NOT NULL,
  `id_responsable` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `prestations`
--

CREATE TABLE `prestations` (
  `id` int(11) NOT NULL,
  `intitule` varchar(30) NOT NULL,
  `ref_catalogue` int(30) NOT NULL,
  `code_ean` int(30) NOT NULL,
  `ref_constructeur` varchar(30) NOT NULL,
  `prestataire` varchar(30) NOT NULL,
  `coef` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `ref_catalogue` int(30) NOT NULL,
  `code_ean` int(30) NOT NULL,
  `ref_constructeur` varchar(30) NOT NULL,
  `fournisseur` varchar(30) NOT NULL,
  `coef` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `responsables`
--

CREATE TABLE `responsables` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `mail` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `affaires`
--
ALTER TABLE `affaires`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `devis`
--
ALTER TABLE `devis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_affaire` (`id_affaire`),
  ADD KEY `id_itc` (`id_itc`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `devis_prestations`
--
ALTER TABLE `devis_prestations`
  ADD KEY `id_devis` (`id_devis`),
  ADD KEY `id_prestation` (`id_prestation`);

--
-- Index pour la table `devis_products`
--
ALTER TABLE `devis_products`
  ADD KEY `id_devis` (`id_devis`),
  ADD KEY `id_product` (`id_product`);

--
-- Index pour la table `interlocuteurs`
--
ALTER TABLE `interlocuteurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_client` (`id_client`);

--
-- Index pour la table `itcs`
--
ALTER TABLE `itcs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_responsable` (`id_responsable`);

--
-- Index pour la table `prestations`
--
ALTER TABLE `prestations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `responsables`
--
ALTER TABLE `responsables`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `affaires`
--
ALTER TABLE `affaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `devis`
--
ALTER TABLE `devis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `interlocuteurs`
--
ALTER TABLE `interlocuteurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `itcs`
--
ALTER TABLE `itcs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `prestations`
--
ALTER TABLE `prestations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `responsables`
--
ALTER TABLE `responsables`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `affaires`
--
ALTER TABLE `affaires`
  ADD CONSTRAINT `affaires_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devis` (`id_affaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devis` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`id`) REFERENCES `interlocuteurs` (`id_client`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `devis`
--
ALTER TABLE `devis`
  ADD CONSTRAINT `devis_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devis_prestations` (`id_devis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `devis_ibfk_2` FOREIGN KEY (`id`) REFERENCES `devis_products` (`id_devis`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `itcs`
--
ALTER TABLE `itcs`
  ADD CONSTRAINT `itcs_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devis` (`id_itc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `prestations`
--
ALTER TABLE `prestations`
  ADD CONSTRAINT `prestations_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devis_prestations` (`id_prestation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id`) REFERENCES `devis_products` (`id_product`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `responsables`
--
ALTER TABLE `responsables`
  ADD CONSTRAINT `responsables_ibfk_1` FOREIGN KEY (`id`) REFERENCES `itcs` (`id_responsable`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
