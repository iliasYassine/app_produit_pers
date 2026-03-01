-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 01 mars 2026 à 08:18
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `test`
--

-- --------------------------------------------------------

--
-- Structure de la table `associes`
--

CREATE TABLE `associes` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `solde` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `associes`
--

INSERT INTO `associes` (`id`, `nom`, `solde`) VALUES
(1, 'malik', 2775.00),
(2, 'ilias', 350.00);

-- --------------------------------------------------------

--
-- Structure de la table `authtoken_token`
--

CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Token', 7, 'add_token'),
(26, 'Can change Token', 7, 'change_token'),
(27, 'Can delete Token', 7, 'delete_token'),
(28, 'Can view Token', 7, 'view_token'),
(29, 'Can add Token', 8, 'add_tokenproxy'),
(30, 'Can change Token', 8, 'change_tokenproxy'),
(31, 'Can delete Token', 8, 'delete_tokenproxy'),
(32, 'Can view Token', 8, 'view_tokenproxy'),
(33, 'Can add client model', 9, 'add_clientmodel'),
(34, 'Can change client model', 9, 'change_clientmodel'),
(35, 'Can delete client model', 9, 'delete_clientmodel'),
(36, 'Can view client model', 9, 'view_clientmodel'),
(37, 'Can add fournisseur', 10, 'add_fournisseur'),
(38, 'Can change fournisseur', 10, 'change_fournisseur'),
(39, 'Can delete fournisseur', 10, 'delete_fournisseur'),
(40, 'Can view fournisseur', 10, 'view_fournisseur'),
(41, 'Can add transaction', 11, 'add_transaction'),
(42, 'Can change transaction', 11, 'change_transaction'),
(43, 'Can delete transaction', 11, 'delete_transaction'),
(44, 'Can view transaction', 11, 'view_transaction'),
(45, 'Can add users', 12, 'add_users'),
(46, 'Can change users', 12, 'change_users'),
(47, 'Can delete users', 12, 'delete_users'),
(48, 'Can view users', 12, 'view_users'),
(49, 'Can add commande model', 13, 'add_commandemodel'),
(50, 'Can change commande model', 13, 'change_commandemodel'),
(51, 'Can delete commande model', 13, 'delete_commandemodel'),
(52, 'Can view commande model', 13, 'view_commandemodel'),
(53, 'Can add produit', 14, 'add_produit'),
(54, 'Can change produit', 14, 'change_produit'),
(55, 'Can delete produit', 14, 'delete_produit'),
(56, 'Can view produit', 14, 'view_produit'),
(57, 'Can add ligne transaction', 15, 'add_lignetransaction'),
(58, 'Can change ligne transaction', 15, 'change_lignetransaction'),
(59, 'Can delete ligne transaction', 15, 'delete_lignetransaction'),
(60, 'Can view ligne transaction', 15, 'view_lignetransaction'),
(61, 'Can add associe', 16, 'add_associe'),
(62, 'Can change associe', 16, 'change_associe'),
(63, 'Can delete associe', 16, 'delete_associe'),
(64, 'Can view associe', 16, 'view_associe'),
(65, 'Can add mouvement capital', 17, 'add_mouvementcapital'),
(66, 'Can change mouvement capital', 17, 'change_mouvementcapital'),
(67, 'Can delete mouvement capital', 17, 'delete_mouvementcapital'),
(68, 'Can view mouvement capital', 17, 'view_mouvementcapital');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `adresse` longtext DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` bigint(20) NOT NULL,
  `date_commande` datetime(6) DEFAULT NULL,
  `montant_total` decimal(10,2) DEFAULT NULL,
  `numero_suivi` varchar(100) DEFAULT NULL,
  `commentaire` longtext DEFAULT NULL,
  `facture` varchar(100) DEFAULT NULL,
  `client_id` bigint(20) DEFAULT NULL,
  `statut` varchar(20) DEFAULT NULL,
  `type_expedition` varchar(20) DEFAULT NULL,
  `numero_expediteur` varchar(100) DEFAULT NULL,
  `bordereau` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(7, 'authtoken', 'token'),
(8, 'authtoken', 'tokenproxy'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(16, 'transcript', 'associe'),
(9, 'transcript', 'clientmodel'),
(13, 'transcript', 'commandemodel'),
(10, 'transcript', 'fournisseur'),
(15, 'transcript', 'lignetransaction'),
(17, 'transcript', 'mouvementcapital'),
(14, 'transcript', 'produit'),
(11, 'transcript', 'transaction'),
(12, 'transcript', 'users');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2026-02-28 21:58:10.330578'),
(2, 'auth', '0001_initial', '2026-02-28 21:58:11.185619'),
(3, 'admin', '0001_initial', '2026-02-28 21:58:11.415150'),
(4, 'admin', '0002_logentry_remove_auto_add', '2026-02-28 21:58:11.431126'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2026-02-28 21:58:11.446988'),
(6, 'contenttypes', '0002_remove_content_type_name', '2026-02-28 21:58:11.548416'),
(7, 'auth', '0002_alter_permission_name_max_length', '2026-02-28 21:58:11.569793'),
(8, 'auth', '0003_alter_user_email_max_length', '2026-02-28 21:58:11.600890'),
(9, 'auth', '0004_alter_user_username_opts', '2026-02-28 21:58:11.610116'),
(10, 'auth', '0005_alter_user_last_login_null', '2026-02-28 21:58:11.672415'),
(11, 'auth', '0006_require_contenttypes_0002', '2026-02-28 21:58:11.680751'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2026-02-28 21:58:11.689122'),
(13, 'auth', '0008_alter_user_username_max_length', '2026-02-28 21:58:11.718461'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2026-02-28 21:58:11.745559'),
(15, 'auth', '0010_alter_group_name_max_length', '2026-02-28 21:58:11.764062'),
(16, 'auth', '0011_update_proxy_permissions', '2026-02-28 21:58:11.770490'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2026-02-28 21:58:11.786668'),
(18, 'authtoken', '0001_initial', '2026-02-28 21:58:11.888946'),
(19, 'authtoken', '0002_auto_20160226_1747', '2026-02-28 21:58:11.920472'),
(20, 'authtoken', '0003_tokenproxy', '2026-02-28 21:58:11.920472'),
(21, 'authtoken', '0004_alter_tokenproxy_options', '2026-02-28 21:58:11.937601'),
(22, 'sessions', '0001_initial', '2026-02-28 21:58:11.983666'),
(23, 'transcript', '0001_initial', '2026-02-28 21:58:11.983666'),
(24, 'transcript', '0002_auto_20250513_1542', '2026-02-28 21:58:11.999650'),
(25, 'transcript', '0003_initial', '2026-02-28 21:58:12.588725'),
(26, 'transcript', '0004_auto_20250513_1543', '2026-02-28 21:58:12.597961'),
(27, 'transcript', '0005_commandemodel_test', '2026-02-28 21:58:12.621503'),
(28, 'transcript', '0006_remove_commandemodel_test_commandemodel_statut_and_more', '2026-02-28 21:58:12.668795'),
(29, 'transcript', '0007_alter_commandemodel_client_and_more', '2026-02-28 21:58:13.314674'),
(30, 'transcript', '0008_alter_commandemodel_statut', '2026-02-28 21:58:13.320786'),
(31, 'transcript', '0009_commandemodel_numero_expéditeur_and_more', '2026-02-28 21:58:13.337171'),
(32, 'transcript', '0010_rename_numero_expéditeur_commandemodel_numero_expediteur', '2026-02-28 21:58:13.352777'),
(33, 'transcript', '0011_commandemodel_bordereau', '2026-02-28 21:58:13.370198'),
(34, 'transcript', '0012_commandemodel_adresse_commandemodel_code_postal_and_more', '2026-02-28 21:58:13.400876'),
(35, 'transcript', '0013_remove_commandemodel_adresse_and_more', '2026-02-28 21:58:13.480863'),
(36, 'transcript', '0014_produit_photo', '2026-02-28 21:58:13.496848'),
(37, 'transcript', '0015_alter_produit_fournisseur', '2026-03-01 05:51:14.769640'),
(38, 'transcript', '0016_alter_produit_fournisseur', '2026-03-01 06:18:38.367339'),
(39, 'transcript', '0017_associe_mouvementcapital', '2026-03-01 06:43:31.932041');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('pww7gt2effk1jmen93mberr7qcvy61ir', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mn0:1vwaNl:uu75ebKrQIK12pMsOflsjDxZBO8jpy0tLNfJPg1t8B4', '2026-03-15 06:34:25.095432'),
('rkushtihwnnjkd7cfy69ff6xedu1blno', 'eyJ0cmFuc2FjdGlvbl9pZCI6MX0:1vwaJ1:HydQR7Aaqt52t00A1-gTN3h85K2FXaqDfYmTPOmnCc8', '2026-03-15 06:29:31.756081');

-- --------------------------------------------------------

--
-- Structure de la table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` bigint(20) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `nom`, `tel`, `adresse`, `email`) VALUES
(1, 'mohamed polonais', '0', '', '');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_transactions`
--

CREATE TABLE `ligne_transactions` (
  `id` bigint(20) NOT NULL,
  `quantite` int(10) UNSIGNED DEFAULT NULL CHECK (`quantite` >= 0),
  `prix_unitaire` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `produit_id` bigint(20) DEFAULT NULL,
  `transaction_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `ligne_transactions`
--

INSERT INTO `ligne_transactions` (`id`, `quantite`, `prix_unitaire`, `total`, `produit_id`, `transaction_id`) VALUES
(1, 1, 3.00, 3.00, 28, 1),
(2, 1, 3.00, 3.00, 28, 2);

-- --------------------------------------------------------

--
-- Structure de la table `mouvements_capital`
--

CREATE TABLE `mouvements_capital` (
  `id` bigint(20) NOT NULL,
  `montant` decimal(10,2) NOT NULL,
  `type_mvt` varchar(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_mvt` datetime(6) NOT NULL,
  `associe_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `mouvements_capital`
--

INSERT INTO `mouvements_capital` (`id`, `montant`, `type_mvt`, `description`, `date_mvt`, `associe_id`) VALUES
(1, 1800.00, 'injection', 'injecter au debut parfums ect', '2026-03-01 06:57:43.190403', 1),
(2, 500.00, 'injection', 'vehicule modus', '2026-03-01 06:58:54.389253', 1),
(3, 350.00, 'injection', 'pneu turc', '2026-03-01 07:01:34.968345', 1),
(4, 350.00, 'injection', 'pneus', '2026-03-01 07:01:52.286663', 2),
(5, 110.00, 'injection', 'ants carte grise', '2026-03-01 07:06:22.386277', 1),
(6, 15.00, 'injection', 'essence', '2026-03-01 07:06:33.418561', 1);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` bigint(20) NOT NULL,
  `nomProd` varchar(100) DEFAULT NULL,
  `prixAchat` decimal(6,2) DEFAULT NULL,
  `prixVente` decimal(6,2) DEFAULT NULL,
  `qte` decimal(6,2) DEFAULT NULL,
  `qteMin` decimal(6,2) DEFAULT NULL,
  `codeBarre` varchar(100) DEFAULT NULL,
  `fournisseur_id` bigint(20) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nomProd`, `prixAchat`, `prixVente`, `qte`, `qteMin`, `codeBarre`, `fournisseur_id`, `photo`) VALUES
(28, 'parfums', 2.00, 3.00, 0.00, 1.00, '111', 1, 'produits/parfums_MdGV2mI.png');

-- --------------------------------------------------------

--
-- Structure de la table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL,
  `date_heure` datetime(6) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `employe_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `transactions`
--

INSERT INTO `transactions` (`id`, `date_heure`, `total`, `employe_id`) VALUES
(1, '2026-03-01 06:29:31.724450', 3.00, NULL),
(2, '2026-03-01 06:34:25.063289', 3.00, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `prenom`, `tel`) VALUES
(1, 'braikia', 'malik', ''),
(2, 'hasbi', 'ilias', '');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `associes`
--
ALTER TABLE `associes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD PRIMARY KEY (`key`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commandes_client_id_347950d9_fk_clients_id` (`client_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `ligne_transactions`
--
ALTER TABLE `ligne_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ligne_transactions_produit_id_20f1dc39_fk_produits_id` (`produit_id`),
  ADD KEY `ligne_transactions_transaction_id_c647e44e_fk_transactions_id` (`transaction_id`);

--
-- Index pour la table `mouvements_capital`
--
ALTER TABLE `mouvements_capital`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mouvements_capital_associe_id_e163df6f_fk_associes_id` (`associe_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produits_fournisseur_id_ce4cba9d_fk_fournisseurs_id` (`fournisseur_id`);

--
-- Index pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_employe_id_c83635fb_fk_users_id` (`employe_id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `associes`
--
ALTER TABLE `associes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `ligne_transactions`
--
ALTER TABLE `ligne_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `mouvements_capital`
--
ALTER TABLE `mouvements_capital`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `authtoken_token`
--
ALTER TABLE `authtoken_token`
  ADD CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_client_id_347950d9_fk_clients_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `ligne_transactions`
--
ALTER TABLE `ligne_transactions`
  ADD CONSTRAINT `ligne_transactions_produit_id_20f1dc39_fk_produits_id` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`),
  ADD CONSTRAINT `ligne_transactions_transaction_id_c647e44e_fk_transactions_id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`);

--
-- Contraintes pour la table `mouvements_capital`
--
ALTER TABLE `mouvements_capital`
  ADD CONSTRAINT `mouvements_capital_associe_id_e163df6f_fk_associes_id` FOREIGN KEY (`associe_id`) REFERENCES `associes` (`id`);

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_employe_id_c83635fb_fk_users_id` FOREIGN KEY (`employe_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
