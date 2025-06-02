-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 02 juin 2025 à 19:18
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
(33, 'Can add produit', 9, 'add_produit'),
(34, 'Can change produit', 9, 'change_produit'),
(35, 'Can delete produit', 9, 'delete_produit'),
(36, 'Can view produit', 9, 'view_produit'),
(37, 'Can add users', 10, 'add_users'),
(38, 'Can change users', 10, 'change_users'),
(39, 'Can delete users', 10, 'delete_users'),
(40, 'Can view users', 10, 'view_users'),
(41, 'Can add fournisseur', 11, 'add_fournisseur'),
(42, 'Can change fournisseur', 11, 'change_fournisseur'),
(43, 'Can delete fournisseur', 11, 'delete_fournisseur'),
(44, 'Can view fournisseur', 11, 'view_fournisseur'),
(45, 'Can add transaction', 12, 'add_transaction'),
(46, 'Can change transaction', 12, 'change_transaction'),
(47, 'Can delete transaction', 12, 'delete_transaction'),
(48, 'Can view transaction', 12, 'view_transaction'),
(49, 'Can add ligne transaction', 13, 'add_lignetransaction'),
(50, 'Can change ligne transaction', 13, 'change_lignetransaction'),
(51, 'Can delete ligne transaction', 13, 'delete_lignetransaction'),
(52, 'Can view ligne transaction', 13, 'view_lignetransaction'),
(53, 'Can add client', 14, 'add_client'),
(54, 'Can change client', 14, 'change_client'),
(55, 'Can delete client', 14, 'delete_client'),
(56, 'Can view client', 14, 'view_client'),
(57, 'Can add commande', 15, 'add_commande'),
(58, 'Can change commande', 15, 'change_commande'),
(59, 'Can delete commande', 15, 'delete_commande'),
(60, 'Can view commande', 15, 'view_commande'),
(61, 'Can add client model', 14, 'add_clientmodel'),
(62, 'Can change client model', 14, 'change_clientmodel'),
(63, 'Can delete client model', 14, 'delete_clientmodel'),
(64, 'Can view client model', 14, 'view_clientmodel'),
(65, 'Can add commande model', 15, 'add_commandemodel'),
(66, 'Can change commande model', 15, 'change_commandemodel'),
(67, 'Can delete commande model', 15, 'delete_commandemodel'),
(68, 'Can view commande model', 15, 'view_commandemodel');

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

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id`, `nom`, `prenom`, `email`, `telephone`, `adresse`, `code_postal`, `ville`) VALUES
(1, 'hasbi', 'ilias', '', '', '', NULL, NULL),
(2, 'hasbi', 'ilias', 'ilias.hasbi@somfy.com', '0650378032', '3 rue du pont cluses', NULL, NULL),
(3, 'hasbi', 'ilias', 'dd@gmail.com', '0650378032', '', NULL, NULL),
(4, 'hasbi', 'ilias', 'ff@hh.fr', '0650378032', '', NULL, NULL),
(5, 'hasbi', 'ilias', 'toto@tto.fr', '0650378032', '', NULL, NULL),
(6, 'hasbi', 'ilias', 'toto@kk.fr', '0650378032', '', NULL, NULL),
(7, 'hasbi', 'ilias', 'toto@km.fr', '0650378032', '', NULL, NULL),
(8, 'hasbi', 'ilias', 'toto@mml.fr', '0650378032', '', NULL, NULL),
(9, 'hasbi', 'ilias', 'toto@fre.fr', '0650378032', '', NULL, NULL),
(10, 'hasbi', 'ilias', 'toto@eeee.fr', '0650378032', '', NULL, NULL),
(11, 'hasbi', 'ilias', 'toto@ddded.fr', '0650378032', '', NULL, NULL),
(12, 'hasbi', 'ilias', 'toto@popo.fr', '0650378032', '', NULL, NULL),
(13, 'hasbi', 'ilias', 'toto@jojo.fr', '0650378032', '', NULL, NULL),
(14, 'hasbi', 'ilias', 'toto@nono.fr', '0650378032', '', NULL, NULL),
(15, 'hasbi', 'ilias', 'toto@drte.fr', '0650378032', '3 rue du pont cluses', NULL, NULL),
(16, 'hasbi', 'ilias', 'toto@nbnb.fr', '0650378032', '3 rue du pont cluses', NULL, NULL),
(17, 'hasbi', 'ilias', 'toto@lp.fr', '0650378032', '3 rue du pont cluses', NULL, NULL),
(18, 'hasbi', 'ilias', 'toto@vf.fr', '0650378032', '3 rue du pont cluses', NULL, NULL),
(19, '', '', 'toto@ss.fr', '', '', NULL, NULL),
(20, '', '', 'toto@nnn.fr', '', '', NULL, NULL),
(21, 'hasbi', 'ilias', 'toto@cd.fr', '0650378032', 's', NULL, NULL),
(22, '', '', 'toto@dfffg.fr', '', '', NULL, NULL),
(24, 'ilias', 'artisavon', 'ggt@gmail.com', '0650378032', 'c.canada ,46,cruz de humilladero,29006 malaga espana', NULL, NULL),
(25, 'ilias', 'artisavon', 'fff@gmail.com', '0650378032', '', NULL, NULL),
(26, 'ilias', 'artisavon', 'eee@gmail.com', '0650378032', '', NULL, NULL),
(27, 'ilias', 'artisavon', 'mp@gmail.com', '0650378032', '', NULL, NULL),
(28, 'ilias', 'artisavon', 'hj@gmail.com', '0650378032', '', NULL, NULL),
(29, 'ilias', 'artisavon', 'ukyu@gmail.com', '0650378032', '', NULL, NULL),
(30, 'ilias', 'artisavon', 'ddd@gmail.com', '0650378032', '', NULL, NULL),
(31, 'ilias', 'artisavon', 'mll@gmail.com', '0650378032', '', NULL, NULL),
(32, 'ilias', 'artisavon', 'ghg@gmail.com', '0650378032', '', NULL, NULL),
(33, 'ilias', 'artisavon', 'fgez@gmail.com', '0650378032', '3 rue du pont cluses', NULL, NULL),
(34, 'hasbi', 'ilias', 'iliadedzefdasbi@somfy.com', '0650378032', '3 rue du pont cluses', NULL, NULL),
(35, 'hasbi', 'ilias', 'joiojjo@somfy.com', '0650378032', '', NULL, NULL),
(36, 'hasbi', 'ilias', 'ddz@somfy.com', '0650378032', 'dd', NULL, NULL),
(37, 'hasbi', 'ilias', 'dzefefe@somfy.com', '0650378032', '', NULL, NULL),
(38, 'hasbi', 'ilias', 'frefrfe@somfy.com', '0650378032', '', NULL, NULL),
(39, 'hasbi', 'ilias', 'fff@somfy.com', '0650378032', '', NULL, NULL),
(40, 'hasbi', 'ilias', 'frfrfav@somfy.com', '0650378032', '', NULL, NULL),
(41, 'hasbi', 'ilias', 'ccer@somfy.com', '0650378032', '', NULL, NULL),
(42, 'hasbi', 'ilias', 'r@somfy.com', '0650378032', '', NULL, NULL),
(43, 'hasbi', 'ilias', 'eer@somfy.com', '0650378032', '', NULL, NULL),
(44, 'hasbi', 'ilias', 'dedede@somfy.com', '0650378032', '3 rue du pont cluses', NULL, NULL),
(45, 'hasbi', 'ilias', 'cccccc@somfy.com', '0650378032', '', NULL, NULL),
(46, 'hasbi', 'ilias', 'frgfer@somfy.com', '0650378032', '', NULL, NULL),
(47, 'hasbi', 'ilias', 'ffrggv@somfy.com', '0650378032', '', NULL, NULL),
(48, 'hasbi', 'ilias', 'dez@somfy.com', '0650378032', '', NULL, NULL),
(49, 'hasbi', 'ilias', 'htyu@somfy.com', '0650378032', '', NULL, NULL),
(50, 'hasbi', 'ilias', 'dd@somfy.com', '0650378032', '', NULL, NULL),
(51, 'hasbi', 'ilias', 'fgh@somfy.com', '0650378032', '3 rue du pont cluses 74300', NULL, NULL),
(52, 'ilias', 'hasbi', 'iliashasbi@gmail.com', '0650378032', 'rue du pont', NULL, NULL),
(53, 'jean', 'bernard', 'jean.bernard@gmail.com', '0650378032', '3 rue du pont', NULL, NULL),
(54, 'jean', 'bernard', 'jean.francis@gmail.com', '0650378032', '3 rue du pont', NULL, NULL),
(55, 'jean', 'bernard', 'jean.cc@gmail.com', '0650378032', '3 rue du pont', NULL, NULL),
(56, 'jean', 'bernard', 'jean.nhyj@gmail.com', '0650378032', '3 rue du pont', NULL, NULL),
(57, 'jean', 'bernard', 'jean.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(58, 'jean', 'bernard', 'jeanr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(59, 'jean', 'bernard', 'rjeanr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(60, 'jean', 'bernard', 'rjrreanr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(61, 'jean', 'bernard', 'rjeeanr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(62, 'jean', 'bernard', 'rjeeaenr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(63, 'jean', 'bernard', 'rjeceaenr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(64, 'jean', 'bernard', 'rjeceddaenr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(65, 'jean', 'bernard', 'rjeeaddnr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(66, 'jean', 'bernard', 'rjeeadddddnr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(67, 'jean', 'bernard', 'dnr.dddcc@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(68, 'jean', 'bernard', 'dnr.d\'\'@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(69, 'jean', 'bernard', 'dnrfd\'\'@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(70, 'jean', 'bernard', 'dnkirfd\'\'@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(71, 'jean', 'bernard', 'dnkcirfd\'\'@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(72, 'jean', 'bernard', 'lo@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(73, 'jean', 'bernard', 'leo@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(74, 'jean', 'bernard', 'leeo@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(75, 'jean', 'bernard', 'leefo@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(76, 'jean', 'bernard', 'leemfo@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(77, 'jean', 'bernard', 'mm@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(78, 'jean', 'bernard', 'mme@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(79, 'jean', 'bernard', 'e@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(80, 'jean', 'bernard', 'el@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(81, 'jean', 'bernard', 'sel@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(82, 'jean', 'bernard', 'fsel@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(83, 'jean', 'bernard', 'fsesl@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(84, 'jean', 'bernard', 'fscesl@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(85, 'jean', 'bernard', 'dea@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(86, 'jean', 'bernard', 'ddea@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(87, 'jean', 'bernard', 'dfv@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(88, 'jean', 'bernard', 'de@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(89, 'jean', 'bernard', 'dme@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(90, 'jean', 'bernard', 'dmfse@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(91, 'jean', 'bernard', 'mfse@gmail.com', '0650378032', '3 rue du pont', '74300', 'cluses'),
(92, '', '', 'meryem.soda@gmail.com', '', '', '', ''),
(93, '', '', 'meryegda@gmail.com', '', '', '', ''),
(94, '', '', 'rr@gmail.com', '', '', '', '');

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

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `date_commande`, `montant_total`, `numero_suivi`, `commentaire`, `facture`, `client_id`, `statut`, `type_expedition`, `numero_expediteur`, `bordereau`) VALUES
(44, '2025-05-20 14:41:12.021702', 5.00, 'CMD-000-UN9IT0', '', 'factures/facture_44.pdf', 45, 'En préparation', 'MondialRelay', NULL, ''),
(45, '2025-05-20 14:43:53.061136', 5.00, 'CMD-000-0JUVA8', '', 'factures/facture_45.pdf', 46, 'En préparation', 'Chronoposte', NULL, ''),
(46, '2025-05-20 14:47:09.332326', 6.00, 'CMD-000-6T2L1X', '', 'factures/facture_46.pdf', 47, 'En préparation', 'Chronoposte', NULL, ''),
(47, '2025-05-20 14:48:17.781455', 6.00, 'CMD-000-Q9LMIZ', '', 'factures/facture_47.pdf', 47, 'En préparation', 'Chronoposte', NULL, ''),
(48, '2025-05-20 14:50:19.741731', 6.00, 'CMD-000-A7EF7A', '', 'factures/facture_48.pdf', 47, 'En préparation', 'Chronoposte', NULL, ''),
(49, '2025-05-20 14:56:06.612724', 5.00, 'CMD-000-VAP2MW', 'd', 'factures/facture_49.pdf', 48, 'En préparation', 'MondialRelay', NULL, ''),
(50, '2025-05-20 16:33:43.779238', 6.00, 'CMD-000-P55DHJ', '', 'factures/facture_50.pdf', 49, 'En préparation', 'Chronoposte', NULL, ''),
(51, '2025-05-20 18:00:03.981122', 6.00, 'CMD-000-1F3PRA', '', 'factures/facture_51.pdf', 50, 'En préparation', 'Chronoposte', NULL, ''),
(52, '2025-05-20 18:03:58.742608', 5.00, 'CMD-000-JB6UPT', '', 'factures/facture_52.pdf', 51, 'En préparation', 'Chronoposte', NULL, '');

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
(14, 'transcript', 'clientmodel'),
(15, 'transcript', 'commandemodel'),
(11, 'transcript', 'fournisseur'),
(13, 'transcript', 'lignetransaction'),
(9, 'transcript', 'produit'),
(12, 'transcript', 'transaction'),
(10, 'transcript', 'users');

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
(1, 'contenttypes', '0001_initial', '2024-11-17 15:52:31.281217'),
(2, 'auth', '0001_initial', '2024-11-17 15:52:31.601044'),
(3, 'admin', '0001_initial', '2024-11-17 15:52:31.687053'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-11-17 15:52:31.692040'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-11-17 15:52:31.698024'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-11-17 15:52:31.745079'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-11-17 15:52:31.756188'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-11-17 15:52:31.765164'),
(9, 'auth', '0004_alter_user_username_opts', '2024-11-17 15:52:31.771148'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-11-17 15:52:31.807157'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-11-17 15:52:31.808154'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-11-17 15:52:31.813262'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-11-17 15:52:31.823236'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-11-17 15:52:31.832350'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-11-17 15:52:31.842324'),
(16, 'auth', '0011_update_proxy_permissions', '2024-11-17 15:52:31.848308'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-11-17 15:52:31.858281'),
(18, 'authtoken', '0001_initial', '2024-11-17 15:52:31.917569'),
(19, 'authtoken', '0002_auto_20160226_1747', '2024-11-17 15:52:31.935614'),
(20, 'authtoken', '0003_tokenproxy', '2024-11-17 15:52:31.937608'),
(21, 'authtoken', '0004_alter_tokenproxy_options', '2024-11-17 15:52:31.940600'),
(22, 'sessions', '0001_initial', '2024-11-17 15:52:31.969523'),
(23, 'transcript', '0001_initial', '2024-11-17 15:52:31.983569'),
(24, 'transcript', '0002_alter_produit_prixachat_alter_produit_prixvente_and_more', '2024-11-17 15:52:32.048582'),
(25, 'transcript', '0003_users_prenom_users_tel', '2024-11-17 15:52:32.064539'),
(26, 'transcript', '0004_rename_qté_produit_qte', '2024-11-17 15:52:32.070524'),
(27, 'transcript', '0005_fournisseur_rename_adrfournisseur_produit_codebarre_and_more', '2024-11-17 15:52:32.094569'),
(28, 'transcript', '0006_produit_fournisseur', '2024-11-17 15:52:32.140763'),
(29, 'transcript', '0007_transaction', '2024-11-17 15:52:32.181539'),
(30, 'transcript', '0008_lignetransaction', '2024-11-17 15:52:32.256476'),
(31, 'transcript', '0009_alter_produit_fournisseur', '2024-11-17 15:52:32.538903'),
(32, 'transcript', '0010_produit_qtemin', '2024-11-17 15:52:32.547879'),
(33, 'transcript', '0011_alter_transaction_date_heure_alter_transaction_total_and_more', '2025-04-07 09:19:18.211076'),
(34, 'transcript', '0012_alter_fournisseur_adresse_alter_fournisseur_email_and_more', '2025-04-07 09:20:30.399188'),
(35, 'transcript', '0013_alter_lignetransaction_prix_unitaire_and_more', '2025-04-13 12:05:46.097529'),
(36, 'transcript', '0014_client_commande', '2025-05-13 09:18:32.706314'),
(37, 'transcript', '0015_rename_client_clientmodel_and_more', '2025-05-13 12:58:31.006586'),
(38, 'transcript', '0002_auto_20250513_1542', '2025-05-13 13:42:48.459821'),
(39, 'transcript', '0003_initial', '2025-05-13 13:43:28.456396'),
(40, 'transcript', '0004_auto_20250513_1543', '2025-05-13 13:43:28.466337'),
(41, 'transcript', '0005_commandemodel_test', '2025-05-13 13:46:57.671070'),
(42, 'transcript', '0006_remove_commandemodel_test_commandemodel_statut_and_more', '2025-05-13 13:47:37.945873'),
(43, 'transcript', '0007_alter_commandemodel_client_and_more', '2025-05-15 09:30:46.543515'),
(44, 'transcript', '0008_alter_commandemodel_statut', '2025-05-19 14:00:39.647291'),
(45, 'transcript', '0009_commandemodel_numero_expéditeur_and_more', '2025-05-19 18:14:47.792385'),
(46, 'transcript', '0010_rename_numero_expéditeur_commandemodel_numero_expediteur', '2025-05-19 18:22:31.670670'),
(47, 'transcript', '0011_commandemodel_bordereau', '2025-05-20 13:20:00.892248'),
(48, 'transcript', '0012_commandemodel_adresse_commandemodel_code_postal_and_more', '2025-05-20 18:19:02.599390'),
(49, 'transcript', '0013_remove_commandemodel_adresse_and_more', '2025-05-20 18:37:17.873060');

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
('05smheh9k268rk1umukbpuxds709iwhk', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTc4fQ:1uHR62:KP82Selx7ewiXtBmrA0OC0O0I3CPMT10tePw6g81A6g', '2025-06-03 17:49:46.222071'),
('075o4vpt7draa43noc59s8rzjhxi9rbd', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTd9:1uCJ6l:XvUI7N6vILRz2i4TV6sYQKY4Ex_oOVHqpheTRa7Txw0', '2025-05-20 14:17:19.827048'),
('0nsxx0cgsf762bwcqbttqxltfrnfvgyg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTMwfQ:1uFFjy:XYvcGULWFmb9X1KixS3WBHC_ZM-po2_2WimQpL0CGcs', '2025-05-28 17:17:58.809683'),
('0tayrin999cx8snzoa1uak5nhww7wuf5', 'eyJ0cmFuc2FjdGlvbl9pZCI6NzV9:1uByvs:6sgcL_mrVnDZq2DkKOdW2YvyskjWOdThJ3rJLqZRT3c', '2025-05-19 16:44:44.876737'),
('195qugixliwhxto507fxod7rpi58arxj', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQ4fQ:1uFFqj:A-4uHdYj0Pd-Rh0u23pNyjqEyQ3w5tIuInfkCULTVyI', '2025-05-28 17:24:57.872765'),
('1s6z23clmt6srfc4k6qxp7skmqqazmwk', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTV9:1u1n6R:qhurBCZE-sfzlsPouyDM_RPYy10-bR0QM_j4-de8KY0', '2025-04-21 14:05:31.430723'),
('1wjbvldfval7c4kak0agk6g7npjj5a1p', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTEzfQ:1uETy1:U9R-zj851W2xzYW3SyVp_9cx1aUuDZqjIaOl9ggHVjc', '2025-05-26 14:17:17.006225'),
('1xhoh4eofwavpiluxgzztytw0sdldchc', 'eyJ0cmFuc2FjdGlvbl9pZCI6MzF9:1u1nXw:9PTl0--0w8D0wThkhO1OdeKosvDyawNvEYIm2Wh7IjE', '2025-04-21 14:33:56.321674'),
('23zp12oiwlj1yttpjoznsgr65h7rt3sm', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTA3fQ:1uChA5:BhehcqcZKyhXN2N0WsjD15pA3eb52XZ6juuIBjVawk8', '2025-05-21 15:58:21.140411'),
('2aipeeiz1tx7o7m6es8jnyzbv9di8ucq', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTYwfQ:1uFGDB:uchBGWMMpUkOKQnwSJ5ivrGK9iKPgfMGvbxkR1SgRTM', '2025-05-28 17:48:09.873379'),
('2d0ve9t7nyip6wdprrrn2ooysl03jvzc', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTh9:1uCJEX:clcQnVqK663ZtW5xGakdchb702273qxKkgTTSihrGPM', '2025-05-20 14:25:21.602787'),
('2mm3ftidsfgr6n4ezchdyk3nn40nqw7w', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTM2fQ:1uFFlL:gVxDn_a7kSz3M5TGWzezCXY1Qqw6hkABM4usNUtDQJo', '2025-05-28 17:19:23.108951'),
('2qtblf7a21jdcu1652z150bjqphlo71p', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODR9:1uBz3N:BAR1eE63firW-f4I9vPBd0HC9eca3ilwOgv0IfWFJ2M', '2025-05-19 16:52:29.051550'),
('2s6dpkructisplmwckkj8n9uap4z9fsw', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTI2fQ:1uFFiW:9NWmeBesl_4HTqExJK4T2uLjRsA_TMVuw3xsutBrWKc', '2025-05-28 17:16:28.655827'),
('2sjtcoholdeow7j6o5svvt5enoagh7ji', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTkwfQ:1uKIBR:ArQ0f7xKk0Zej5HVh0L1X-H9C_PvEuCdSoOCsEAcEcg', '2025-06-11 14:55:09.111849'),
('2x0efqi0p2yqi564yuten9o0oyvgbg5j', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDV9:1uBcj4:tX4ZiIo0Xbp5qabxB3DRwfshs6PoslzjoBMArVPmapM', '2025-05-18 17:02:02.742205'),
('3aibnd23makkokvef77pfjvsu819whl3', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTk0fQ:1uM5aX:CD3Siez3iMLYQTj8M0lFGDKrRWR2pYgTvgUNGlV0Zqg', '2025-06-16 13:52:29.144433'),
('3dqz5sd6iyms6ye692fdwhm2hh6wy749', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTg2fQ:1uJyuu:qPtGqFYwgSmllbzV-XRi-BE_uKUscN-6eklJXEfOfGE', '2025-06-10 18:20:48.844422'),
('3nkvx8dzv9lxk70pq65pqcwu6r03sgpr', 'eyJ0cmFuc2FjdGlvbl9pZCI6Nzl9:1uBywM:39Jf_ZvtxPA9oNQIZ7FJKS90t-ee-IdB8dalD1FF0BQ', '2025-05-19 16:45:14.938138'),
('3szxzk2j1ff6nmdf7kmo17fh8wjnew0j', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTgzfQ:1uJytf:-Bddw7ro53KqGS4UkV8NAnCbenGv4Cq6UNH-3FjVXlk', '2025-06-10 18:19:31.784329'),
('3uxhip19vtg03dzupmh96qiwt2hu0ahk', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTY3fQ:1uFGEp:k6w27af_D9WICVfpZ80lFJna8RK_Qy1FK0hTwilqXzU', '2025-05-28 17:49:51.910806'),
('3wtwh75kk6qnlbo7saqym3g80yiobu9h', 'eyJ0cmFuc2FjdGlvbl9pZCI6NzN9:1uByvS:NqxZgdNu8UnSwpIkQherZRnaWnZmz0LKVV6jeGVqV4k', '2025-05-19 16:44:18.534240'),
('3zry1ginarfiz6mzllgf3iekbcw63gse', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODJ9:1uBz32:wUHn4A5eTfYwL8C31YpYgmTCuR1PIPH8SpJxXDLXGeo', '2025-05-19 16:52:08.420058'),
('47n88pgoxspglqpyy7s54c03tyb577ga', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTY4fQ:1uFGEq:3K5RMSN-G_jkI7QvMyonIJ2a-mYlh9AyHZo-9aQoqkY', '2025-05-28 17:49:52.307652'),
('48xp5j3vsyibtzhxoe5dk0y4zhejt9pe', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTIwfQ:1uElsH:QHJNOTjgJy28n_nkMd_MVuDD6YLE4lra6CQvuqx9pW4', '2025-05-27 09:24:33.992234'),
('4tyn3it45dwr9l92fla61ma9g73ym4p5', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTJ9:1u1n3A:sP07ksIw9_WQdl6x52XNnkZDI0UmvJ_YuSQlQx-Pidw', '2025-04-21 14:02:08.579010'),
('4ztyo9hu2fvp1ywbtvbim8yo9dpxx9xo', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTZ9:1u1n77:ydcahtZyYfr3Tb04MxeNOncq5FNW9laf1OmrU5_l9_Q', '2025-04-21 14:06:13.541587'),
('52teooph0k62gnojnohc45575crc5mr7', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTM4fQ:1uFFoZ:8QrkwQ_NOzwB_jqJ0q9myQtAEdmzKUF_lrljKDqMT_M', '2025-05-28 17:22:43.054277'),
('55pjti70dtvr0e3khkyrzu6vmcoylvg6', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTM0fQ:1uFFky:AHIKasw-Drv3lLDP3iweNg1thonW_aT566YdGnV3Rac', '2025-05-28 17:19:00.056072'),
('5978odtyg92rnqmo0tlvaem35kbj3kb8', 'eyJ0cmFuc2FjdGlvbl9pZCI6NzR9:1uByvh:jCGKqKDuN02_s88tY7cEwk1vujrdsB53yf0mifbfcsU', '2025-05-19 16:44:33.601994'),
('5b9xmwb6uqspoiht9a3ky6nqy7xbomll', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTN9:1u1n54:a5FsXDLJG9Og1L3Yv5WamqSlUL4dWQ4uTghQFlWscgA', '2025-04-21 14:04:06.804807'),
('5g3q7iiwj7vq8234anqm8om5yz0easdr', 'eyJ0cmFuc2FjdGlvbl9pZCI6NzF9:1uBxbT:zG3wzvQSCt808U2XPr9o6DVD37nC-tlPT_LA-Cl9fas', '2025-05-19 15:19:35.529803'),
('5nud7bo1vhq4v6bf98knirsnuw8qq905', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTV9:1uBpHh:VfFvl7og2P-GJ2bKcuII5H7d2FcXVIWuQSngjhpi0gI', '2025-05-19 06:26:37.008011'),
('5zkjxoonix9on34idst20hx08bnv4dxy', 'eyJ0cmFuc2FjdGlvbl9pZCI6OH0:1u1lS9:AfWYEtOcqDDyjPwwLJNCS1CegZoIq-7TlowRp1hrIBE', '2025-04-21 12:19:49.363023'),
('5zy2a28l16p1jdwx6kt8o0zvrzzia26q', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODB9:1uBz1o:HVXx0muHffzBsA45xlEYR0PjVfb-Yl-tVVQbA9rl9Hw', '2025-05-19 16:50:52.374799'),
('61vkityxd04v2k73kt5yxjoowrp47ie8', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTU3fQ:1uFFtB:5dvldt5lci7rOjbShTMnE_CFUJrf8FzCDY2K5e_mQB4', '2025-05-28 17:27:29.685978'),
('63pz708k7gufps717mwc9lwdmi548soe', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTd9:1u1n8q:2i6yE4pHwqUtch5CfqmF38JhylkWonoM8cQ-1BmoWeY', '2025-04-21 14:08:00.409268'),
('64huqi1csum8txktaoo87y5h4ns70xxe', 'eyJ0cmFuc2FjdGlvbl9pZCI6NjZ9:1uBsFV:LIDzioygWJXqvoC8QrE7F0TQqUuvzvQqoXrJ0LOgbLA', '2025-05-19 09:36:33.985906'),
('77z4r20lf25tvk0c5bmr1glnj0zthanw', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTU2fQ:1uFFtB:J0kB5DJ3mF9crqKCg0b76NJ22aTmggNDtYqBU1alDG0', '2025-05-28 17:27:29.333879'),
('7bvbx2m4igkyfgls9me9erw9wom7qdgq', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTM1fQ:1uFFl6:qH5fLpXFzV-94GjeyWu90f3X3cc8Wk5bsq0FbQ76VXM', '2025-05-28 17:19:08.489404'),
('7dpdp1ougp0464x12yf2plbvyssepb10', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTI0fQ:1uFFh3:gARqrgHNgZG8af23xKet44chxVqBJeOHfzBXRN4OUkQ', '2025-05-28 17:14:57.417283'),
('7euxvk2lw6nz2fiwqokzlxgtyow7f0yo', 'eyJ0cmFuc2FjdGlvbl9pZCI6MjF9:1u1nFB:Wh2H6_FGJydZ_6dD1F46g5Oe6KmoGvLXj1t9pwvJhn8', '2025-04-21 14:14:33.377866'),
('7luvsf55oj6a1i61749i8oqpmpbtr95v', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTc3fQ:1uHR61:xilTzhh6W6k9gTqYsWDAow34rSeTW0_Q0BKUSx-rh_0', '2025-06-03 17:49:45.780703'),
('7p0kr9siwqwkq9qhfgxs5fm44fpornbk', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTc2fQ:1uHR5l:5IxTdVxNVMT_Frq1WvzSzUYEqMTF6L54LST5NWk2Vsk', '2025-06-03 17:49:29.879045'),
('7pfbdcgb0orcj38rsgjmqz8dych31myx', 'eyJ0cmFuc2FjdGlvbl9pZCI6OX0:1u1mme:x73o5Er9US1zLh-FW-6DD6M5J0PAGeK34vUfe_tNKWc', '2025-04-21 13:45:04.096358'),
('8c5hryy0e0y5c4277isv4d4p1vfwnrym', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDl9:1uBcur:EV0N9IrMFrcPHeqOT4HGPCh3S7YZpja7I2jGBBoFaf8', '2025-05-18 17:14:13.784001'),
('8lhkcfd97u0e1cteouzmnszt4170ybyx', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODd9:1uBz3i:CX_W0KlSfArNlQejT7BgMQ1DRODcWGIvz150P-DGfNY', '2025-05-19 16:52:50.631163'),
('8lpd5groofx909gmk8rnhwm281o7u2ee', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTd9:1uBpJK:UhOZGrx1VudDbS6VaRQaIEx_bmSsvOXDVE5RS588Ipk', '2025-05-19 06:28:18.956163'),
('8max38ewx23vyibg07mhtqe22e35b72w', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTYxfQ:1uFGDO:IYtqMDmUCh7jzijp06b8GWrLYaFYYod0guWx_KMMHvY', '2025-05-28 17:48:22.370651'),
('8miwoqmn2vbu503z63jmzmn0rd7fs5vx', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTR9:1uCItB:Kn0v3rIg42jGxio04wxj9hvbgmtBt8_lID2Eky_Yers', '2025-05-20 14:03:17.778649'),
('8ova66y72siw7pvo63bkl58nu7h2ji5j', 'eyJ0cmFuc2FjdGlvbl9pZCI6M30:1u03Q8:YD6Fp6wIDSnvAGHVsNArJeaisecqKxgvoqT4S3VwOKA', '2025-04-16 19:06:40.967068'),
('8rtygq8us8sfltv5kcp9t530zclkronl', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTcwfQ:1uFGIP:jKEwjJt7ymPTIKzEUhOrIbIGbkXgX_3xYO73TGS--4Q', '2025-05-28 17:53:33.730394'),
('9264dmsa39kdcctrddp5tl429ev8kvza', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTY1fQ:1uFGDP:VsKliBjYkmchfNt9vz1Dt7okPReuV44xvzEMFs1Azb8', '2025-05-28 17:48:23.966290'),
('99opbfsubrmdupyv8molhwulms4s0o2j', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTIzfQ:1uFFh2:ab7hIpb3uDSjLp_1stSZuYXod3kx5h3CW-MHMHo8-SA', '2025-05-28 17:14:56.059544'),
('9eddrvgmorqs4gsczi9btjsjjoullkq8', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTc0fQ:1uFGRt:2Oo6mi63ilH9wwUD5jTVKvHnQ9GUp1cfEMJXZarXU6U', '2025-05-28 18:03:21.088715'),
('9eiawfx7n4om4uoqw772hkk56zspjlxi', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODN9:1uBz3L:LGlausdl_jFHxaGgyKAEvAkjQjXkYcnOyX7Y2E4bB9Y', '2025-05-19 16:52:27.894566'),
('9itgbigsq8c1dn21kcoopjfi6a3ylxqh', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTE3fQ:1uElsC:7gfHUe81lI0tL-zDUXff6KvJHu7cIvTCgLC8_Xr465M', '2025-05-27 09:24:28.597819'),
('9r7nhkh9jbje9q8i35crs2jrxnu5p39v', 'eyJ0cmFuc2FjdGlvbl9pZCI6MjV9:1u1nPh:QXtM4-2pcrM8adHXjDCnzGlVJzBOI9eZuX6TeNM-8K4', '2025-04-21 14:25:25.640714'),
('9z9502xg9gazxxxqo6k8347u7f3bvrnn', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTIxfQ:1uFFfz:F4sq00gx6EmDYo_00iEMIgPGugZhHZ7eM7SQGyjmdb8', '2025-05-28 17:13:51.857149'),
('aim229poagoet4twyg71nd716dyzc2yf', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDR9:1u41Hx:phKUhWIdbaM62vGx6fT_ihJd-VV-2wMyBQWb92g1FNA', '2025-04-27 17:38:37.104031'),
('anbpj24ey7frprmih0xkmlfozub94zf0', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTczfQ:1uFGIU:7ZE-_HHIm0kbvB0IqSLXVe0kUn8gOjDAUwIGm5eBRHE', '2025-05-28 17:53:38.252635'),
('ap8jophj0zvu9myvzgpym3ey1uz2ypjt', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTc1fQ:1uHR5l:s2U509wYplxYoRwEkR-o63gHxBs1H432NY76B-mV5Oc', '2025-06-03 17:49:29.280506'),
('b0cpfr3audsdmaoox650nkohqrivv5q1', 'eyJ0cmFuc2FjdGlvbl9pZCI6MjZ9:1u1nUC:LLwr1qGSDqDNarF4TMJck-yiTzg8xIqi67KnvQhtKEw', '2025-04-21 14:30:04.326313'),
('b3jwitzn47pkf3rcp1rywd8399jpjk71', 'eyJ0cmFuc2FjdGlvbl9pZCI6NzB9:1uBvWS:JDdlt5ZyfZxCRi7MtTinkCjO57wIxjvgmdRIg_te0ZM', '2025-05-19 13:06:16.468328'),
('b40cjj9fwyiac38s50jzirl6afrfag38', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTI5fQ:1uFFj1:Nt5nJ9VLsVdnAI75NDShxuCM20eoNRRsz_CnzkVMlYM', '2025-05-28 17:16:59.913450'),
('b5pkuw28o845ylr94ih22m2af74flhy1', 'eyJ0cmFuc2FjdGlvbl9pZCI6MjJ9:1u1nJJ:kzSE3hLzpqf5vzXrukuWvtnAj2pIwMLnBX4VOQ_UAtg', '2025-04-21 14:18:49.680761'),
('bhxvqt971nk0viq9x2zjt1p3ft38lyk9', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTA2fQ:1uCh9o:RBAQ6Jv4uoT4iVKXroTIBQ1NBQPrObKNn4VpYjm2-YQ', '2025-05-21 15:58:04.457101'),
('bj8h6x79rrgbr0xtobr0jm9vd4951itc', 'eyJ0cmFuc2FjdGlvbl9pZCI6Njd9:1uBsFe:yPclURJdzyRiMCg3Jf0jEyGuacvIdjxhkt-tnzylh7Q', '2025-05-19 09:36:42.878435'),
('c26110b352cwoyjuticygzqakch8sccj', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTF9:1uCEDl:M23MrsRJxr2193fL4Yo-HLebIogmXXTc2C7ozOeofvI', '2025-05-20 09:04:13.260003'),
('cb8sfffwh5yzqqfxkl44ruj8qwgt9vu6', 'eyJ0cmFuc2FjdGlvbl9pZCI6NjR9:1uBsEz:awv3pfvTbOWzpsy0N3ES_8MosfTK9MloFIT2EK-FxAk', '2025-05-19 09:36:01.995231'),
('clx7itb4wvtlolyppfwlepv7m5l73716', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mjd9:1u1nUi:fsw2S9kNv-BEoEWynZzC26PcgBIMxYwhR0Ve6BKxEv4', '2025-04-21 14:30:36.455484'),
('d198ndabfo49an428cbeo76qs2suivuz', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDJ9:1u23hd:1DQw1Qp8bCvgDnQrHMuIsDHJCbqHeeDkHlkV6slgA6A', '2025-04-22 07:49:01.665639'),
('dg0zavkaphovxlmss31af4tupcd29efq', 'eyJ0cmFuc2FjdGlvbl9pZCI6MjB9:1u1nEO:pDSdCAg7ywC_g0FtJc4rBI5tk3ZKFWi-RkXIf2qbJ-Q', '2025-04-21 14:13:44.741529'),
('dl4k8gwgbfeicgicj36f3il4gzeabfb3', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTE0fQ:1uEUPw:9eKPlz2PKkzrV73XQjuYELFjIxkQTpRIVwgQ5txTvTc', '2025-05-26 14:46:08.126284'),
('dq62x7ak9gmhyqc3g4r7o6vm47z2703x', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTU4fQ:1uFFuW:RlVQIoDCLoQEc8ezsbx1_7lDT29Czmj2ARQnvXJcue0', '2025-05-28 17:28:52.988927'),
('dujj0zz71u9d0es024hjpgvn7ikjbm9q', 'eyJ0cmFuc2FjdGlvbl9pZCI6NH0:1u03QI:Mi-QiYQchYDTDolrNUlsd8bnjEWXo7z6MyedM_Nzxt0', '2025-04-16 19:06:50.675490'),
('eaboh5xappa8uyquxsvg3kg5q7uv0emi', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTM5fQ:1uFFov:5GTVOQX1TyToQTqEReynbseh1Sw5eOBmxcCS13rTeA4', '2025-05-28 17:23:05.375313'),
('ecr5wkckmrjqa6rqyxm6ou190sh13pvs', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODF9:1uBz2q:CchzsWUu8WXSpbswsM1Zy5W4VVvhWNdFZsRe0ikXywo', '2025-05-19 16:51:56.130308'),
('eevyjpwgd1aqku86k3o279en732vot4j', 'eyJ0cmFuc2FjdGlvbl9pZCI6MzZ9:1u23KE:Ky2pxvDVsf8dVYCIBY17yRETpOc7dY4QOHr27wS6Z4o', '2025-04-22 07:24:50.810638'),
('egik1yzv348x0oxhpqlu8vtt3es4m2mx', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTMzfQ:1uFFkq:UIpnetkx8qlvXJbKO3JzcfIEPMmEPHQnT0Bmg4jdiwY', '2025-05-28 17:18:52.537098'),
('ei122evrrnym1gp79ag8ro8qm1e5c8wy', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTc5fQ:1uHR7F:dZcw-dIBDYzYwkA0nJzQSR5ShfthWvPgJAvqnp8g0Aw', '2025-06-03 17:51:01.965865'),
('ep33wv847fnd557gcg8mqcfb6pzpf612', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQyfQ:1uFFpe:WaZJxzd-0i3kgLoynYCEbWJp6amHNevac2BHVUNMoQc', '2025-05-28 17:23:50.979819'),
('es1ix0ijyls33dc10m7acstmjidpzy6r', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mzh9:1u23Lb:ApQpihCaq6BLEJVbfwyIOZIq8IYVwESR5dqQ9pgJloI', '2025-04-22 07:26:15.563015'),
('exbzzop3c4706kzbsq1cmeckpgovbox2', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTR9:1u1n64:JW-wgoveF0iqStEdt9lbm5fDFWrmHJkQWaxPdEN8aGw', '2025-04-21 14:05:08.047499'),
('ezlqg77je7nxg14cnhructw4rmtta2qr', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTA1fQ:1uCh91:MNdywwqgslABFgVBH2SfeEYEk1a_D02EOdRBkuzVj-g', '2025-05-21 15:57:15.426053'),
('fey49byd4e236zlzg10w0yd2xx8sxf3d', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTYzfQ:1uFGDP:cTtK545n8JceyBEuxGQHTzsT7woG6h4nORA4tRkVxPc', '2025-05-28 17:48:23.331512'),
('ff1qbneddc13xcszpkkohsn8btrp36g4', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTAzfQ:1uCgWf:y9rtafNH5jbqfl6FwqOm4f8YAeWCbP7SRghxnJbwihs', '2025-05-21 15:17:37.597858'),
('fg3eqc7b7kd7cgaiqxpg24nz96ldwrm0', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTU5fQ:1uFFvG:AW-aGs7ODx0-ZEegaKtoy3R4v3EUxjSCUQkWW6mi2uU', '2025-05-28 17:29:38.596856'),
('fp41t60b6j1ycdgqonv3zms7ayhxjg4d', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTJ9:1uBp6U:63dDCIrCwcMAeV5YO_kX1vG3VAW1hUmszB1DX4AHgsw', '2025-05-19 06:15:02.749448'),
('gewgpkj5vuq6vgcbk20drqbkkaeyz9lo', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTM3fQ:1uFFlU:yZ_qA11h4J96vKwglpULx9x2p5U9ns_orOSUvuumO7s', '2025-05-28 17:19:32.204709'),
('ggfjs1vfbg8k5ws0r9xluftvlwstymix', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTEwfQ:1uDTsu:gs9pYx4jDX_iOgr6tNv8wdiMdnneRXup1HB5BmkOtq4', '2025-05-23 19:59:52.064816'),
('ghwf5ekoeazujf7subiszvr8tdjh85za', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTgxfQ:1uHnmw:BLXoRkRwlPOI3t-Rp2KvxLxo6WW5Dzh2sVYtS_-FOyE', '2025-06-04 18:03:34.047003'),
('goo9ph606yo9q7kx839o68llnjx1xrpd', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTg4fQ:1uKGW9:2PRDMOLvbFS0mh6SKNmVfHRizgxNZO583cEzkwNO_uc', '2025-06-11 13:08:25.687635'),
('gprnky6mo50t7ickahu9bwatdovpjdwc', 'eyJ0cmFuc2FjdGlvbl9pZCI6NzZ9:1uByw4:Fk3_7QOZIDSmdap4OFFWdk23A7mFToedeuhGP-vdjxI', '2025-05-19 16:44:56.019086'),
('gvu7kifv4dlvc331w6ktj4wx4uldhl15', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTg0fQ:1uJytq:XiMfzHd-m-657v260NiwafBcJSXyc_2vZNlPT9FzYZU', '2025-06-10 18:19:42.363541'),
('gwkobh5yogugy2klm09qmvsvndik7881', 'eyJ0cmFuc2FjdGlvbl9pZCI6Nn0:1u1ikD:Ph_Syi0-u7GgCCNwpdTJtkm8uE52syHQojzZnQyUJIQ', '2025-04-21 09:26:17.058193'),
('gywllslithisz7nm52d1hpllm1xfyolx', 'eyJ0cmFuc2FjdGlvbl9pZCI6NjN9:1uBryr:HX_96Rs88gq9Dl1Y_nBG8EHFji49K7Ukr7VTfhpp9Z4', '2025-05-19 09:19:21.041216'),
('h8l5u740mrjfi5w5k0d3i1b3m1g3mswl', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTZ9:1uCJ6g:0SMWPsL01QgbNDA2UyLVSY-XkuN5eJjUcQ8Ia3a_1og', '2025-05-20 14:17:14.886571'),
('hxihpygzc37rhxm97vx7eycz1fgvd2t0', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTg3fQ:1uKCQk:o7T5xq2D8fDiTVMqr82dOAyUX27cDtsEDjaeDxs0pNM', '2025-06-11 08:46:34.740313'),
('if3ylreuj9ky3vpu11iqkd7cjctmy2b9', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODh9:1uBz4U:_8TljBOlDmDNHwVS-5aUY8qIi9fT8Z0mU8K35UxV7aM', '2025-05-19 16:53:38.770258'),
('ih919b9kn23hctfpt5dgl90kzwus92wp', 'eyJ0cmFuc2FjdGlvbl9pZCI6MzB9:1u1nXZ:WgjWl2yzvQD4tsVHcxw_HHmkLKlnt_QLi2bC461wVDE', '2025-04-21 14:33:33.912722'),
('j8f9txjfjg98yf37jhcicr8u7zs7s1ew', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTA4fQ:1uCwex:DkV8K3gLyi54SIojb_aaR5B-En3tLKtYs-hfVoiCaa8', '2025-05-22 08:31:15.165055'),
('jcy4yoh5wphc4l7s68gk46lqxajen1ve', 'eyJ0cmFuc2FjdGlvbl9pZCI6Njh9:1uBvDv:2ONUPxMGleoHv-CA5mR6gIjys69E-82g86xSUNDZav0', '2025-05-19 12:47:07.017071'),
('jh8unelyl7ose98j3wjf62mjs77axipn', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDN9:1u2451:f1T1_nZyyHwKwqe5sG0WahHZviCZP3gEua7umBshC50', '2025-04-22 08:13:11.524443'),
('jpngku238wmkm9bouaqoobin502nl9yg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MzJ9:1u1nYH:JtTmh9BMlgZpf2J809YgZKtJex-aKJupENTAV5XpFPk', '2025-04-21 14:34:17.906259'),
('ju22et2sbzdkrvu7t2rbf2jkpm476gbl', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQ3fQ:1uFFqb:DOhmPnvJdGLT-HgdiAkgDURGXNcvsWvEC6caAea-dIQ', '2025-05-28 17:24:49.759182'),
('jwa2tt61lo46sa07ti568kryc30ahm9g', 'eyJ0cmFuc2FjdGlvbl9pZCI6Nzd9:1uBywB:9YWyosUpoj53es5Ouzc6atgNWj86DwliNQ9daCNmCKg', '2025-05-19 16:45:03.364407'),
('jxwbo7aksd5gyy8vu67vqnjv00beoh64', 'eyJ0cmFuc2FjdGlvbl9pZCI6MjN9:1u1nMy:axR7kpNw6F0PRq-gokGXVQ5YXoFTjsIOLARq7p_9aaM', '2025-04-21 14:22:36.345020'),
('jyv0gcds3754blouxeyasclhsqergmo3', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTgwfQ:1uHR7i:MrVC95LxoY2hKcdS5bMUiLoIpQhRJCBDOllSYOlXiHY', '2025-06-03 17:51:30.268992'),
('jzmbzpn9k6glgx8fic5nerk4f1wlzfjg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTI1fQ:1uFFi4:2_tmuHEB_Bmdl1k33X0vNHjsnw9wshjBArhGGhmfmMo', '2025-05-28 17:16:00.648145'),
('k5us0sq5nfh41kwz307rmrnaigvuhsxg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTl9:1u1nCn:Y0STsCxLKL5fNuC0GWGORZk7fMd3bbPLJtlyp3GVQ30', '2025-04-21 14:12:05.932721'),
('k6qalzzsu6cxpsbwv315n3vja4bgskue', 'eyJ0cmFuc2FjdGlvbl9pZCI6NjB9:1uBpwk:FGOPASzqG7pR4vu96jJssH_7mqaf3-GUy4Ac2ExaPMc', '2025-05-19 07:09:02.840117'),
('k70hnyb52wc1b153op4nbaemnv5vozta', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTV9:1uCIuK:7nOkEV93uaeTma3sl5r4AvDQNeZj0DrfORckBV9a09c', '2025-05-20 14:04:28.364584'),
('k759xkpk6tc5gakrujttrblmzh7sshs0', 'eyJ0cmFuc2FjdGlvbl9pZCI6MzR9:1u23JI:cwfsYvTIGw9t2jX46E6VUimJSlc-0UTy1o-mjstMxBE', '2025-04-22 07:23:52.675816'),
('k9zny1b4u4reef9k0k4af8hj0xphyxsx', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTU1fQ:1uFFtA:rhd145qY73vsHTqvXyHrWTnYTCzNl1bE38nrIeY5RNY', '2025-05-28 17:27:28.861065'),
('kcrzdav4kycr1zx18nciuxr8kdsbu565', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODV9:1uBz3V:QXF1buryEOPIxPLdZaTTFDF5DDXTL8NOrAYZ3Eho5uk', '2025-05-19 16:52:37.985537'),
('kcs8xltqiszk3hmufgh4joskeacpl3wy', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTE5fQ:1uElsG:2NouJc9wXmw3vN1T_ljy_bBPai3rSw1GFwaH8BowqMU', '2025-05-27 09:24:32.967013'),
('kg67vqvzr1f3xg3fivdfxrlztxw6jmy6', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTE1fQ:1uEUWj:KFcRumXaVN8EFwQegHfa4A7wYeJquuUlCEsCo08JMsw', '2025-05-26 14:53:09.088057'),
('kgkze2lxsjiyr5asi2jekb87lvtekfvg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MX0:1tCjhK:5dqFI5g6NiUEZd6odVUydg4A6el9-o8Olq4gFE9rvzA', '2024-12-01 18:08:34.583159'),
('kjm2kvijb2byyeptbglecdltj6r1qbmd', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTR9:1uBp9n:JGbinQBLlI0nusJ8WMDHMHrkI-YNV0IH-14Wk-S-yd4', '2025-05-19 06:18:27.108332'),
('kk6s2acohf88wbfqkxkbodab7rxidz8a', 'eyJ0cmFuc2FjdGlvbl9pZCI6NzJ9:1uByvC:G9l-ohEkdXWEr_SXQVDGBK84v42cJMHWbGsbXFjgGzA', '2025-05-19 16:44:02.765900'),
('l0qcjf31mo9kujt0n8imu9coyzq7ktiz', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDB9:1u23Ry:_6tRZRJWfeElMGxNl7AUt38QRL5JZ_F6B5D24aSPzLw', '2025-04-22 07:32:50.349242'),
('l8v4a3rce5w0qyz0r55dhh6vos6k1iy9', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTkxfQ:1uKICE:G6xWH-VGvsPu71r4WchII9bZaXOTViBqnqv0YTiHPQI', '2025-06-11 14:55:58.900235'),
('lcvu3bixfbs8k1qzj4gvy18jdkc49i0s', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTB9:1uBp66:fEJWQC__Qf5iiJcHyMTbmn5hzFKVdZxryivyyIn5h6c', '2025-05-19 06:14:38.126129'),
('lfi2xbw6ohjt1p5svzxihuwkyfhl6zyd', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTUwfQ:1uFFrH:8aJnPyeZ_e3qg7JrjtTUkSrIBJhwJcFCiCKzb6Ni1Cg', '2025-05-28 17:25:31.078757'),
('m8k8v6uljlwzyx00g3qx76l8wrckqqff', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTI4fQ:1uFFiy:gO6yFC5-HVprRgBY-FBpZSNmrqtKKOHJn3USpVwdG6I', '2025-05-28 17:16:56.130494'),
('md34efmzwsceo4oum92db0yistaxole5', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTl9:1uBph8:MMyXMi0E92Bw10HO8v1JvoAPBffhQ0AtXynH4-cAMcA', '2025-05-19 06:52:54.660729'),
('mm8ckcti7qjesfp67zzwb1mwl3mssgrb', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTB9:1u1n2Q:CTZf4nCOXyUvmKhWtArNZmnEUwsfMm683AdSv465lzM', '2025-04-21 14:01:22.014319'),
('mnuev1xbvdd7hgjskg82nuv6r6pap9nu', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDZ9:1uBcjG:4XvljkV4V11Lp42U1iAo8ExHK83N-iRHpleL7BioTfg', '2025-05-18 17:02:14.464321'),
('mrmahxso2yrp282vsx5tc3k99812q7yr', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTJ9:1uCEDo:AK303EX_NEJLLLsfX9HPOMLFG4kOjpaZX8R_HCtU0as', '2025-05-20 09:04:16.604497'),
('n2obr8eipsy9mou8tp37c6vpl498uhhj', 'eyJ0cmFuc2FjdGlvbl9pZCI6NjV9:1uBsFL:zNluWKooDPGDP-wiCkDkOVnspUk_GapQvL4G7HH5DJM', '2025-05-19 09:36:23.474230'),
('n9lm205f5p76lbvsew7rdn372rmrm9ds', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQxfQ:1uFFpI:R3aC_LR-amrPGEWYu_7KgMbPGpDHCQvDQOWIXw6zHT8', '2025-05-28 17:23:28.210073'),
('nf3h4ciivl7jxf5c95e1p3f963adq3xg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTU0fQ:1uFFtA:qdiJ_l5lZQpbG-LVWzQcOWfVdqk3Yt-guLyNBU75LPQ', '2025-05-28 17:27:28.176884'),
('nrw9mh1r9iwwm729o12e1kff3jgd2218', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTMyfQ:1uFFkF:R84UVt-YXlm3cTzD6t-JLkRwf0Q9c5tyzNfbMpMMFDs', '2025-05-28 17:18:15.318393'),
('nvshofos5jbeuk841x5q40953w9b1tjg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTcxfQ:1uFGIT:mrcVA3daOsNkuDb-9IK8R9LI0dGbmdBIhAUBPEhYhuA', '2025-05-28 17:53:37.396534'),
('o2xhcrobjxlbe0iglmgp9nd91eg21mss', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTkyfQ:1uLmP3:TALdalr8raFsJ1VyENyyMnorxVxLkkMVUhoh0w74kMw', '2025-06-15 17:23:21.983175'),
('o637r2jgh6t1aua48hlf7z83kkktodl3', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTkzfQ:1uM5aW:NWcnjSCVYUoJnz7OC4dwDkssIRJki_hrV1KymHnBxD8', '2025-06-16 13:52:28.549744'),
('o6ubp0fdgbq87mbph22df5g46ziqulgm', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQ5fQ:1uFFqk:lPMGIu-oPoaSf5baOr9mN-Ggopu5E4BER--lYAhrQzs', '2025-05-28 17:24:58.552627'),
('o760b0fug315poz94ivklwrozgv7dien', 'eyJ0cmFuc2FjdGlvbl9pZCI6Nzh9:1uBywJ:Gx3iWFlhRYB54R1xKOoQ_eJ9tEtpXBHuJ4erawgfl2Q', '2025-05-19 16:45:11.283777'),
('p05gfikl8mvfx98846rxe1vtq0e9ziwe', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTh9:1uBpdc:RsO8u-N6je7V5RUpSPoUapCX6KAFoCVQCgqrK_MLL4U', '2025-05-19 06:49:16.164121'),
('p0wwz110um52zbfkdpal25m7wl001nx2', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTAxfQ:1uCgVp:4k7bWW9kAXCgB9ONAZdpjaT5auMTOb2H0U5xQaZebCg', '2025-05-21 15:16:45.935350'),
('p21nqtywtpgna1lm1fguu3oghota2q9f', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDh9:1uBclK:C4K8fdjmbs6ZxNZ4wonryr3Fh7RF5a_EnrdXCVyrvuo', '2025-05-18 17:04:22.139493'),
('p4555t1si4x5hyq9dbyz6yvljv1q60g2', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODZ9:1uBz3c:_GHWUduyj1g1OCt-r0R8o6mBcoN8AZSiXuPbiGYkUXg', '2025-05-19 16:52:44.476889'),
('pmkweud3dh7xhpb6wqx95l9wdj8wt8bt', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTB9:1uCE4N:pmYg12JPI1fjY6TQBM1QBLXXwAeE6APpq8PvS1BIMbE', '2025-05-20 08:54:31.013162'),
('prheqaw1kx72we1e5sdpnl91mciwtrci', 'eyJ0cmFuc2FjdGlvbl9pZCI6Njl9:1uBvSh:sSdKGoFOGK7kLriTANwssEfc7xSyjOKt5xdROqJdcH0', '2025-05-19 13:02:23.155492'),
('pyy0bg37t4yefkdic53ydjm9pqbnljxi', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mjh9:1u1nUy:cXSk_QSMdeXOBgFMlgYmnYQHVUSAXPwUeyGqDFDvkXs', '2025-04-21 14:30:52.403154'),
('pyy2q21pmjcmhv2hhpxelje72ww13r1o', 'eyJ0cmFuc2FjdGlvbl9pZCI6MzV9:1u23Jw:Pg9r4H3NgVL4TllSTUwvN7meVRhtItBexXYXToEA_7Y', '2025-04-22 07:24:32.774507'),
('qbrseg7c6ruwetxjfbxots5ym35uutpw', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDF9:1u23UG:XfmRlIjmkohQilCq6YlzImeAoBfHusoXnARex8eHqiE', '2025-04-22 07:35:12.504071'),
('qofndh5jner1f8lgcqejsl05xkjj84go', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTUyfQ:1uFFrj:pUnhOVcGQnxuu5chzZxy6kinwO7dScbyesZc7w_247Q', '2025-05-28 17:25:59.066526'),
('qvhdx1jzjx20kf6b9lcxwtdmxdc0eag0', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTI3fQ:1uFFiY:aMsMm4WX72M8EXTcEoSulXUFJJPQKV65DakMAx0w5Cw', '2025-05-28 17:16:30.329456'),
('r0qpypbsiirav52xbdihq4eraumiiqgt', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mzd9:1u23L1:zKxXNNvMzF8B0R0o8Oi77Wrj0yubjUNq10WhykJW-Mo', '2025-04-22 07:25:39.108615'),
('rj1p3qu2akab1tc8drxn6gfsfqbhotka', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTAwfQ:1uCL1V:Ty-MVTIEazdKKItcKT1I5ezvGOB1VMhKVKjR9PwUdm0', '2025-05-20 16:20:01.751767'),
('rye2j8m4nlq9t6qnkaspniw3aphvhqf7', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTY0fQ:1uFGDP:51wkJwGrwAcTu9bwJofaidTfJzc3s14E7zakFpKHRsQ', '2025-05-28 17:48:23.645506'),
('s9g3lr9ob2eddzcj6az9lphwef3n0smg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTUzfQ:1uFFsO:lVLSfBDmmaaBZGb9aTvLTWpxIMAO0yqjFlxuYWQQxRs', '2025-05-28 17:26:40.751731'),
('sdod7sg0rqws5c6duhsp26ejzh6s3u90', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQwfQ:1uFFpC:vvY6oGcArkGvUx75dEYBvKTrSEhOV4Say4l_c3_dSLk', '2025-05-28 17:23:22.802701'),
('sfy7e2pweodgqrycrevhw76dbf1gabij', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTAyfQ:1uCgWB:5saeBQpnbuf5dvbU4bArWX3vpZTaiqvdXodi9K08TgE', '2025-05-21 15:17:07.374864'),
('szet7jz8k2xy6lyemzahhv3r903eb7v8', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mzl9:1u23M4:PGKIw2xfLuKYbjif9ySeG14TbjH23TP5Wx-jQPOXFHY', '2025-04-22 07:26:44.998329'),
('t1gbuhxlljtcaxn2ads6hbzq3qk52lp6', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTh9:1u1n8u:d93JNsZwOoWuHYA89RpJt_9NRNtD6_EqZ8ZRRIbzcKI', '2025-04-21 14:08:04.922566'),
('t4rp5vtm7yqr52atz8260e45yrefghxg', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTcyfQ:1uFGIT:t5_31eP2TF0toI1JuD5QmK5wKQ7MPr9Rj7OaEPGcWUs', '2025-05-28 17:53:37.897339'),
('tc0mi8oz4bjji7zr06y6ulws88kd7r84', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTN9:1uBp9g:PXhaBBpM8Q-EHiDe4frqlYo2uTB-3PuqOtx6YnpSx7A', '2025-05-19 06:18:20.444640'),
('tirh3n21rfmuqil3fln62473dtsqa4qt', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTg5fQ:1uKGaA:gcz5stjETcQB2rU_xU01K6QgOdJbj7_uWUNwwFy98qg', '2025-06-11 13:12:34.282912'),
('tvvpx9ehyqrqpaqp8bk78ew9o949gggw', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTgyfQ:1uIsvR:lBbw-l-lACvOq1LLybahrEvoQ8xHnCs-V1TlHlsYGe8', '2025-06-07 17:44:49.674456'),
('twrd0bpv66uz041gq9xhfnaq7f1dw54g', 'eyJ0cmFuc2FjdGlvbl9pZCI6MjR9:1u1nNw:M4gUOu4G5Dgpo52o2j7j5qTm5RDddsX7rtLz1Dtjlgg', '2025-04-21 14:23:36.880474'),
('u4rb2eatigyukvpkqwnl2obamvvvkxot', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mjl9:1u1nVA:IXgIBaZ7rDO73FU0YJBpO9HDgkmPuYu1L9UW3VYRaWY', '2025-04-21 14:31:04.008341'),
('u55ozx93xwr1668riev2rf27n29lvcki', 'eyJ0cmFuc2FjdGlvbl9pZCI6Mn0:1tCjjx:ws5WFLCfIq1eDaFZjTKNqGwMsqFaMX4iHOi55Bzvf0w', '2024-12-01 18:11:17.140958'),
('utgpaj2qptlqatumdr8rtnjcqjzgnssz', 'eyJ0cmFuc2FjdGlvbl9pZCI6N30:1u1ilf:I7MFcQGsBkJdIYXZWctNZHEc5oZ0qBzdSo9oiJd2xz8', '2025-04-21 09:27:47.726870'),
('uwge4oys9w728lnhiw0276478iw2v598', 'eyJ0cmFuc2FjdGlvbl9pZCI6NDd9:1uBcje:2oBAkTpg7JV0khsVevuui8AKSgFgxILbTQh-ZfNH9wU', '2025-05-18 17:02:38.185266'),
('uxn5xu051427avdgi50bxx4kbw6gqhfc', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTMxfQ:1uFFkE:IW_j5rIVJk-j47FEOh6tj8Bk72yV9EWRzVpTV_ieOIQ', '2025-05-28 17:18:14.023662'),
('v8ahayzijoql8xncx3p7f0w4vf1mjlcw', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTZ9:1uBpHk:rPVBlHDbfjumZ3T-f9K9wURxs0eAP37mGzRsnLlJdbI', '2025-05-19 06:26:40.397544'),
('veapgp9m5sih8otoku2a6c6wms81fcnt', 'eyJ0cmFuc2FjdGlvbl9pZCI6NTF9:1uBp6N:a3vgSu-fXZankppSk4k9J-IDP9dOLDeeDpdu_HFlTcc', '2025-05-19 06:14:55.997460'),
('vhdgk38r9043fas0bbrtd8qn118knv2u', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQ0fQ:1uFFpz:_W2EcWRqDFGkxO_QSp0Hpm22vVyodIj55lWNMWcxyqM', '2025-05-28 17:24:11.477549'),
('vidhgdkzfh7nog3toamandjisbkei1b1', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTl9:1uCL1S:qIlyaWzQtzpEbHJScCSLiybhpw4okyd1j3L1FUKjlbI', '2025-05-20 16:19:58.447973'),
('wakwe2m0w51sb13f6d859xwobv91evry', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTEyfQ:1uETxj:p81EH0S7exnpp3tpmS_ywXggBZKBRqpKFa0ZmGunb40', '2025-05-26 14:16:59.328213'),
('wbdk2qly3a7t5jvtjflqc7k3b79jvv8x', 'eyJ0cmFuc2FjdGlvbl9pZCI6NjF9:1uBpwq:PQHNXIiq49o0dfar44zNps05x0Q0DOG-tX6eKAAqeG4', '2025-05-19 07:09:08.555149'),
('wf0s0p58qiacfgt6nvbphfkmh9txr096', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQ2fQ:1uFFqa:588mWLqR6z5XVKjenagJhBGeXu_XiiPsgsXvHyhPa7I', '2025-05-28 17:24:48.094699'),
('wt2qyzovo5rx8jqcvrewia2mr97cmhoh', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQzfQ:1uFFpv:ShF4H4b123DNa77M0EXntMW1G2ELgz-_uazMTQwSQoo', '2025-05-28 17:24:07.291471'),
('wxnc8aplk7wxt6n074n3cn4440vvqudt', 'eyJ0cmFuc2FjdGlvbl9pZCI6NjJ9:1uBryl:kzuyEyHjBRbDownnBb4xGx88Fo99ZeOBgSFWT6N6zeo', '2025-05-19 09:19:15.362524'),
('wzqcu5yew1mbpsb415d93gjfpwfbbq5n', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTE2fQ:1uEVlj:_qgB3GkaqRWoZbkUvInMuKeaKqo11hzgcuUYoxdyXwI', '2025-05-26 16:12:43.492139'),
('x5axpaqdivgmr2m3mciciw87q23xe0fl', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTUxfQ:1uFFrL:iPAvwJF8bcTB9EBBcAlVM9K5XFX97V1h74O9lYzHa-U', '2025-05-28 17:25:35.602986'),
('xafdbflrtrsa0rnpc2oijzcaqqfkgq9n', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTF9:1u1n2q:2cdhidmpJs2Z5GtPEyOn6JxkCczfrMG9L9Gubs_Pb6o', '2025-04-21 14:01:48.301051'),
('xe72db1i705oumz7j4fsv340o7bkpj2q', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTg1fQ:1uJytr:F8WpabVTpg5BAoerAmYSfVu9SYjn95D6PKHwDXorG08', '2025-06-10 18:19:43.008156'),
('xuk4bb2mgo2jb27v2rv55uhj2lrzt67s', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTA0fQ:1uCh81:M8ke9tUHAJdfOESdVJsgWtgKaqgMGfSCWjF9ED36XKQ', '2025-05-21 15:56:13.973434'),
('y3rr8k6o9a89djhhk3kfcwln2v1q14s2', 'eyJ0cmFuc2FjdGlvbl9pZCI6OTN9:1uCIpT:UJnvVnOuWSM_x_05DFNi39VRfh061sXbrLIjnZMqMh8', '2025-05-20 13:59:27.137935'),
('yag8e38g3dstg2of4p82vmtwcr1qdx2z', 'eyJ0cmFuc2FjdGlvbl9pZCI6ODl9:1uCE4J:xANk03Kp-hycqHl8IAil8X8uFeloWTElOT8Ds8kxz8A', '2025-05-20 08:54:27.132598'),
('ycyxugsm1xg5vjubej4q0vdmxzwtswxt', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTY5fQ:1uFGEq:n6iIHOoIFR2VB6dxJuR8su8vcTT3VgQja_AcieVx9e8', '2025-05-28 17:49:52.598343'),
('yfgdy0y77qahilp50uyx6g9pkjytknhm', 'eyJ0cmFuc2FjdGlvbl9pZCI6MzN9:1u23Eq:rTy5C-CwUzjKbiayag_6pnC_qdUJjMzGyE02Fb8EIs4', '2025-04-22 07:19:16.044513'),
('yhwfgttasxyle4m7e3ix30xg2crazuwl', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTA5fQ:1uD43j:ITB5GO9xTdr2zZoYKA4KNVoehdxk1P_Kih9pTBZa7cQ', '2025-05-22 16:25:19.960168'),
('yym8dbzp9nszsbgul3422n5dxbljn9ng', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTIyfQ:1uFFg5:L9_BlZjJWK9461DgdUT4kpyIVj6PtB706jWQjkZb4c0', '2025-05-28 17:13:57.416935'),
('z2id59l5n6cyn2ga5a28b5q0rhhs2hre', 'eyJ0cmFuc2FjdGlvbl9pZCI6NX0:1u1iiW:B3RVo-iqWSLNgtgsUfqrxmJQDsLmhd3DxomujIPfwgI', '2025-04-21 09:24:32.365423'),
('z5yzqxqnlxuhvjbmuni2zy44xn0ltvg5', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTE4fQ:1uElsG:Ul_9dj5OzdN0RYyfxE4ocaI3_l7i1-GVTsFDAPkQBSs', '2025-05-27 09:24:32.505751'),
('zfetz57y6azuondmtomexxxwuvi2fl9f', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTYyfQ:1uFGDO:eXC9IZJoiGvkRtxgDEWU3hxufIbMW2Zh6be3ikBM7ZI', '2025-05-28 17:48:22.761118'),
('zp779amh6fkkpdqgsmwv5jinccuf407b', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTY2fQ:1uFGEp:M4A7SwOtrWYZT3l1ZtfbZU_WLGEiM2qp0XVPeED1HG8', '2025-05-28 17:49:51.396977'),
('zqdqo0seqa2qutu6t0w99cgpnzgwcaaq', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTExfQ:1uEEJl:MyBO4QOTtn0G5nOWzzOnSsM-968T71sCDcUHEnmV-qc', '2025-05-25 21:34:41.988384'),
('zx78o0bt4p5zy0idya2ow6cedbor8cpj', 'eyJ0cmFuc2FjdGlvbl9pZCI6MTQ1fQ:1uFFqN:4NOMqbRxvnzj-UFze_nwfxclDluylCivmFG43oGpp8I', '2025-05-28 17:24:35.834323');

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
(1, 'metro', '0', '3 rue elpes cluses', '@'),
(2, 'ab piece', '0', 'eeee', 'eeee'),
(3, 'kamel usta turc pneu', '0670425026', '', ''),
(4, 'moahmed polonais', '0641804621', '136 rue léon jouhaux sartrouville', '');

-- --------------------------------------------------------

--
-- Structure de la table `ligne_transactions`
--

CREATE TABLE `ligne_transactions` (
  `id` bigint(20) NOT NULL,
  `quantite` int(10) UNSIGNED DEFAULT NULL,
  `prix_unitaire` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `produit_id` bigint(20) DEFAULT NULL,
  `transaction_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `ligne_transactions`
--

INSERT INTO `ligne_transactions` (`id`, `quantite`, `prix_unitaire`, `total`, `produit_id`, `transaction_id`) VALUES
(80, 1, 7.00, 7.00, 10, 80),
(81, 1, 2.50, 2.50, 14, 81),
(82, 1, 23.00, 23.00, 16, 82),
(83, 1, 5.00, 5.00, 21, 83),
(84, 1, 5.00, 5.00, 21, 84),
(85, 1, 2.00, 2.00, 23, 85),
(86, 1, 10.00, 10.00, 26, 86),
(87, 1, 8.00, 8.00, 25, 87),
(88, 1, 3.00, 3.00, 62, 88),
(121, 1, 5.00, 5.00, 21, 121),
(122, 1, 5.00, 5.00, 59, 122),
(123, 1, 13.00, 13.00, 36, 123),
(124, 1, 13.00, 13.00, 36, 124),
(125, 1, 10.00, 10.00, 55, 125),
(126, 1, 2.00, 2.00, 23, 126),
(127, 1, 2.00, 2.00, 23, 127),
(128, 1, 6.00, 6.00, 18, 128),
(129, 1, 6.00, 6.00, 18, 129),
(130, 1, 8.00, 8.00, 25, 130),
(131, 1, 5.00, 5.00, 21, 131),
(132, 1, 5.00, 5.00, 21, 132),
(133, 1, 8.00, 8.00, 25, 133),
(134, 1, 2.50, 2.50, 14, 134),
(135, 1, 5.00, 5.00, 10, 135),
(136, 1, 2.00, 2.00, 23, 136),
(137, 1, 10.00, 10.00, 26, 137),
(138, 1, 10.00, 10.00, 15, 138),
(139, 1, 5.00, 5.00, 57, 139),
(140, 1, 2.50, 2.50, 14, 140),
(141, 1, 8.00, 8.00, 25, 141),
(142, 1, 5.00, 5.00, 21, 142),
(143, 1, 5.00, 5.00, 57, 143),
(144, 1, 10.00, 10.00, 26, 144),
(145, 1, 5.00, 5.00, 57, 145),
(146, 1, 3.50, 3.50, 13, 146),
(147, 1, 3.50, 3.50, 13, 147),
(148, 1, 3.00, 3.00, 29, 148),
(149, 1, 3.00, 3.00, 29, 149),
(150, 1, 5.00, 5.00, 21, 150),
(151, 1, 5.00, 5.00, 21, 151),
(152, 1, 23.00, 23.00, 16, 152),
(153, 1, 5.00, 5.00, 57, 153),
(154, 1, 3.00, 3.00, 65, 154),
(155, 1, 3.00, 3.00, 65, 155),
(156, 1, 3.00, 3.00, 65, 156),
(157, 1, 3.00, 3.00, 65, 157),
(158, 1, 3.00, 3.00, 65, 158),
(159, 1, 15.00, 15.00, 40, 159),
(160, 1, 25.00, 25.00, 70, 160),
(161, 1, 25.00, 25.00, 70, 161),
(162, 1, 25.00, 25.00, 70, 162),
(163, 1, 25.00, 25.00, 70, 163),
(164, 1, 25.00, 25.00, 70, 164),
(165, 1, 25.00, 25.00, 70, 165),
(166, 1, 25.00, 25.00, 70, 166),
(167, 1, 25.00, 25.00, 70, 167),
(168, 1, 25.00, 25.00, 70, 168),
(169, 1, 25.00, 25.00, 70, 169),
(170, 1, 25.00, 25.00, 70, 170),
(171, 1, 25.00, 25.00, 70, 171),
(172, 1, 25.00, 25.00, 70, 172),
(173, 1, 25.00, 25.00, 70, 173),
(174, 1, 6.50, 6.50, 45, 174),
(175, 1, 5.00, 5.00, 21, 175),
(176, 1, 5.00, 5.00, 21, 176),
(177, 1, 3.00, 3.00, 64, 177),
(178, 1, 3.00, 3.00, 64, 178),
(179, 1, 5.00, 5.00, 61, 179),
(180, 1, 5.00, 5.00, 61, 180),
(181, 1, 2.00, 2.00, 67, 181),
(182, 1, 2.00, 2.00, 67, 182),
(183, 1, 2.00, 2.00, 23, 183),
(184, 1, 2.00, 2.00, 23, 184),
(185, 1, 2.00, 2.00, 23, 185),
(186, 1, 3.00, 3.00, 66, 186),
(190, 1, 10.00, 10.00, 26, 190),
(191, 1, 3.00, 3.00, 66, 191),
(193, 1, 6.00, 6.00, 94, 193),
(194, 1, 6.00, 6.00, 94, 194);

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
  `codeBarre` varchar(100) DEFAULT NULL,
  `fournisseur_id` bigint(20) DEFAULT NULL,
  `qteMin` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nomProd`, `prixAchat`, `prixVente`, `qte`, `codeBarre`, `fournisseur_id`, `qteMin`) VALUES
(9, 'collection platinium mademoiselle', 0.90, 3.00, 5.00, '301', 4, 2.00),
(10, 'parfum voiture el nabil 85 ml', 1.80, 5.00, 10.00, '340', 4, 2.00),
(12, 'mpf my perfumes', 3.50, 7.00, 13.00, '477', 4, 2.00),
(13, 'air freshener maison arabyat rouge', 1.70, 3.50, 10.00, '785', 4, 2.00),
(14, 'lingette pure musk 30 lingettes', 0.90, 2.50, 12.00, '876', 4, 2.00),
(15, 'brume emerat el arab', 4.00, 10.00, 4.00, '038', 4, 2.00),
(16, 'parfums bakarat 100ml', 10.50, 23.00, 0.00, '230', 4, 2.00),
(17, 'parfums enfant el nabil', 3.00, 8.00, 11.00, '052', 4, 2.00),
(18, 'spray yara 250ml', 3.00, 6.00, 4.00, '113', 4, 2.00),
(20, 'extrait de parfums intense peach orange', 10.80, 23.00, 2.00, '235', 4, 2.00),
(21, 'parums marque 25ml', 1.50, 5.00, 12.00, '634', 4, 2.00),
(22, 'parfums qaed al fursan 50ml', 2.20, 5.00, 3.00, '724', 4, 2.00),
(23, 'misswak dentifrice', 0.70, 2.00, 11.00, '726', 4, 2.00),
(24, 'huile parfumée my perfumes', 3.50, 5.00, 9.00, '048', 4, 2.00),
(25, 'volaré my dreams 30ml', 2.50, 8.00, 6.00, '163', 4, 2.00),
(26, 'cp yara 50ml', 3.75, 10.00, 1.00, '620', 4, 2.00),
(28, 'v.v love senteur diffuseur battonnet', 3.00, 6.00, 6.00, '614', 4, 2.00),
(29, 'Air freshener maison', 1.50, 3.00, 10.00, '927', 4, 2.00),
(30, 'artisavon de chammel', 2.00, 4.00, 3.00, '111', 4, 2.00),
(31, 'stick king kong', 13.00, 26.00, 1.00, '604', 4, 2.00),
(32, '7 guerisons', 13.00, 26.00, 1.00, '222', 4, 2.00),
(34, 'artimiel pomme/cannelé', 7.50, 13.00, 5.00, '333', 4, 2.00),
(35, 'arti cerise d\'or miélé', 7.50, 13.00, 5.00, '444', 4, 2.00),
(36, 'artimiel coco ananas', 7.50, 13.00, 3.00, '555', 4, 2.00),
(37, 'artimiel elixir de kiwi', 7.50, 13.00, 5.00, '777', 4, 2.00),
(38, 'miel fleur de nigelle', 8.00, 14.00, 8.00, '888', 4, 2.00),
(39, 'prohaire btx tanin', 8.00, 15.00, 3.00, '006', 4, 2.00),
(40, 'prohaire botox capilhaire', 8.00, 15.00, 2.00, '158', 4, 2.00),
(41, 'produit botox argan', 8.00, 15.00, 2.00, '529', 4, 2.00),
(42, 'botox by birracci keratine', 8.00, 15.00, 3.00, '920', 4, 2.00),
(43, 'déodorant vanille menthe', 4.90, 6.50, 4.00, '999', 4, 2.00),
(44, 'déodorant peche', 4.90, 6.50, 4.00, '100', 4, 2.00),
(45, 'deodorant fruit rouge', 4.90, 6.50, 3.00, '101', 4, 2.00),
(46, 'deodorant rose', 4.90, 6.50, 4.00, '102', 4, 2.00),
(47, 'artisavon nila', 2.00, 4.00, 6.00, '103', 4, 2.00),
(48, 'artisavon nigelle moringha', 2.00, 4.00, 3.00, '104', 4, 2.00),
(49, 'artisavon avocat curcumin', 2.00, 4.00, 2.00, '105', 4, 2.00),
(50, 'artisavon nigelle lorier', 2.00, 4.00, 5.00, '106', 4, 2.00),
(51, 'artisavon avocat karité', 2.00, 4.00, 5.00, '107', 4, 2.00),
(52, 'savon d\'alep citron', 1.00, 2.50, 4.00, '902', 4, 2.00),
(53, 'savon d\'alep olive', 1.00, 2.50, 5.00, '605', 4, 2.00),
(54, 'savon d\'alep fleur d\'oranger', 1.00, 2.50, 5.00, '995', 4, 2.00),
(55, 'gélulle de nigelle', 4.50, 10.00, 3.00, '200', 4, 2.00),
(56, 'Parfums oud mood by ard al zafran', 2.50, 5.00, 4.00, '239', 4, 2.00),
(57, 'parfums amirat al arab 50ml', 2.50, 5.00, 0.00, '232', 4, 2.00),
(59, 'parfums yara 50ml', 2.50, 5.00, 4.00, '925', 4, 2.00),
(60, 'parfums qayd al fursan 50ml', 2.50, 5.00, 5.00, '724', 4, 2.00),
(61, 'parfums mousuf wardi 50ml', 2.50, 5.00, 3.00, '454', 4, 2.00),
(62, 'collection platinium hypnose sacré', 0.90, 3.00, 5.00, '257', 4, 2.00),
(63, 'parfum pochefakhar latafa 35ml', 1.25, 3.00, 5.00, '419', 4, 2.00),
(64, 'parfum poche ameerat al arab 35ml', 1.25, 3.00, 3.00, '433', 4, 2.00),
(65, 'parfum poche asad 35ml', 1.25, 3.00, 0.00, '426', 4, 2.00),
(66, 'parfum poche yara 35ml', 1.25, 3.00, 3.00, '396', 4, 2.00),
(67, 'test', 1.00, 2.00, 4.00, '000', NULL, 2.00),
(69, 'test2', 1.00, 2.00, 1.00, '001', 4, 2.00),
(70, 'pneu', 15.00, 25.00, 16.00, '123', NULL, 5.00),
(71, 'cp diva - divine de jean paul ghautier', 5.00, 15.00, 5.00, '001', 4, 3.00),
(72, 'cp princesse - lady million', 5.00, 15.00, 5.00, '002', 4, 3.00),
(73, 'cp berabera - erba pura sospiro', 5.00, 15.00, 5.00, '003', 4, 3.00),
(74, 'cp sabre noir - aventus creed', 5.00, 15.00, 5.00, '004', 4, 3.00),
(75, 'cp odas - interdit de givenchy', 5.00, 15.00, 5.00, '005', 4, 3.00),
(77, 'cp oud maraja - oud maracuja', 5.00, 15.00, 5.00, '005', 4, 3.00),
(78, 'cp sultan vanille - supreme bouquet', 5.00, 15.00, 5.00, '006', 4, 3.00),
(79, 'cp gentleman - sauvage dior', 5.00, 15.00, 5.00, '007', 4, 3.00),
(80, 'cp lady bloom - libre YSL', 5.00, 15.00, 5.00, '008', 4, 3.00),
(81, 'cp les zomme - my self', 5.00, 15.00, 5.00, '009', 4, 3.00),
(82, 'cp vini vidi vicci - invectus pacco raban', 5.00, 15.00, 5.00, '010', 4, 3.00),
(83, 'l\'homme blue - sauvage', 2.50, 6.00, 12.00, '685', 4, 3.00),
(84, 'senate volaré', 2.50, 6.00, 12.00, '784', 4, 4.00),
(85, 'enamor cento volaré 30ml 30ml', 2.50, 8.00, 12.00, '040', 4, 4.00),
(86, 'Ameerat al arab - 50ml', 2.20, 5.00, 12.00, '232', 4, 4.00),
(87, 'barakkat amber night - 100ml', 10.00, 23.00, 1.00, '231', 4, NULL),
(88, 'venezia pistachio - 80ml', 10.50, 23.00, 2.00, '233', 4, NULL),
(89, 'neroli gulf fragrance', 10.50, 23.00, 2.00, '234', 4, NULL),
(90, 'oud holidays  pendora scents - 100ml', 7.50, 15.00, 2.00, '988', 4, NULL),
(91, 'yara roll on - 10ml', 1.25, 3.00, 12.00, '178', 4, 4.00),
(92, 'musc tahara intime  - abiyad', 1.50, 5.00, 2.00, '936', 4, NULL),
(93, 'musc bonbon rose - intime', 1.50, 5.00, 2.00, '275', 4, NULL),
(94, 'spray maison marque - de marque 250ml', 3.50, 6.00, 16.00, '011', 4, 4.00),
(95, 'Tonka - 100ml', 17.00, 35.00, 2.00, '210', 4, NULL),
(96, 'qamra - gulf frgrange', 17.00, 35.00, 2.00, '211', 4, NULL),
(97, 'musc mongo - gulf fragrance', 12.00, 24.00, 1.00, '621', 4, NULL),
(98, 'miswak grand - 170g', 1.15, 3.00, 6.00, '686', 4, 3.00);

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
(80, '2025-05-05 16:50:52.366630', 7.00, NULL),
(81, '2025-05-05 16:51:56.113248', 2.50, NULL),
(82, '2025-05-05 16:52:08.412057', 23.00, NULL),
(83, '2025-05-05 16:52:27.886566', 5.00, NULL),
(84, '2025-05-05 16:52:29.043454', 5.00, NULL),
(85, '2025-05-05 16:52:37.972399', 2.00, NULL),
(86, '2025-05-05 16:52:44.468888', 10.00, NULL),
(87, '2025-05-05 16:52:50.623162', 8.00, NULL),
(88, '2025-05-05 16:53:38.754261', 3.00, NULL),
(121, '2025-05-14 17:13:51.849143', 5.00, NULL),
(122, '2025-05-14 17:13:57.397222', 5.00, NULL),
(123, '2025-05-14 17:14:56.047518', 13.00, NULL),
(124, '2025-05-14 17:14:57.406284', 13.00, NULL),
(125, '2025-05-14 17:16:00.629792', 10.00, NULL),
(126, '2025-05-14 17:16:28.646697', 2.00, NULL),
(127, '2025-05-14 17:16:30.321448', 2.00, NULL),
(128, '2025-05-14 17:16:56.111465', 6.00, NULL),
(129, '2025-05-14 17:16:59.899403', 6.00, NULL),
(130, '2025-05-14 17:17:58.798662', 8.00, NULL),
(131, '2025-05-14 17:18:14.016476', 5.00, NULL),
(132, '2025-05-14 17:18:15.310393', 5.00, NULL),
(133, '2025-05-14 17:18:52.524563', 8.00, NULL),
(134, '2025-05-14 17:19:00.044072', 2.50, NULL),
(135, '2025-05-14 17:19:08.470304', 5.00, NULL),
(136, '2025-05-14 17:19:23.095909', 2.00, NULL),
(137, '2025-05-14 17:19:32.194710', 10.00, NULL),
(138, '2025-05-14 17:22:43.046277', 10.00, NULL),
(139, '2025-05-14 17:23:05.358117', 5.00, NULL),
(140, '2025-05-14 17:23:22.786910', 2.50, NULL),
(141, '2025-05-14 17:23:28.190484', 8.00, NULL),
(142, '2025-05-14 17:23:50.972732', 5.00, NULL),
(143, '2025-05-14 17:24:07.285153', 5.00, NULL),
(144, '2025-05-14 17:24:11.469469', 10.00, NULL),
(145, '2025-05-14 17:24:35.817289', 5.00, NULL),
(146, '2025-05-14 17:24:48.075749', 3.50, NULL),
(147, '2025-05-14 17:24:49.748157', 3.50, NULL),
(148, '2025-05-14 17:24:57.863765', 3.00, NULL),
(149, '2025-05-14 17:24:58.534053', 3.00, NULL),
(150, '2025-05-14 17:25:31.061898', 5.00, NULL),
(151, '2025-05-14 17:25:35.589055', 5.00, NULL),
(152, '2025-05-14 17:25:59.042566', 23.00, NULL),
(153, '2025-05-14 17:26:40.735820', 5.00, NULL),
(154, '2025-05-14 17:27:28.166885', 3.00, NULL),
(155, '2025-05-14 17:27:28.843710', 3.00, NULL),
(156, '2025-05-14 17:27:29.323878', 3.00, NULL),
(157, '2025-05-14 17:27:29.665937', 3.00, NULL),
(158, '2025-05-14 17:28:52.972990', 3.00, NULL),
(159, '2025-05-14 17:29:38.564930', 15.00, NULL),
(160, '2025-05-14 17:48:09.849736', 25.00, NULL),
(161, '2025-05-14 17:48:22.361114', 25.00, NULL),
(162, '2025-05-14 17:48:22.744908', 25.00, NULL),
(163, '2025-05-14 17:48:23.310877', 25.00, NULL),
(164, '2025-05-14 17:48:23.629099', 25.00, NULL),
(165, '2025-05-14 17:48:23.942540', 25.00, NULL),
(166, '2025-05-14 17:49:51.370973', 25.00, NULL),
(167, '2025-05-14 17:49:51.894572', 25.00, NULL),
(168, '2025-05-14 17:49:52.283459', 25.00, NULL),
(169, '2025-05-14 17:49:52.574545', 25.00, NULL),
(170, '2025-05-14 17:53:33.707712', 25.00, NULL),
(171, '2025-05-14 17:53:37.380285', 25.00, NULL),
(172, '2025-05-14 17:53:37.880965', 25.00, NULL),
(173, '2025-05-14 17:53:38.233788', 25.00, NULL),
(174, '2025-05-14 18:03:21.064284', 6.50, NULL),
(175, '2025-05-20 17:49:29.250509', 5.00, NULL),
(176, '2025-05-20 17:49:29.856666', 5.00, NULL),
(177, '2025-05-20 17:49:45.757408', 3.00, NULL),
(178, '2025-05-20 17:49:46.198003', 3.00, NULL),
(179, '2025-05-20 17:51:01.929484', 5.00, NULL),
(180, '2025-05-20 17:51:30.253985', 5.00, NULL),
(181, '2025-05-21 18:03:34.025928', 2.00, NULL),
(182, '2025-05-24 17:44:49.626455', 2.00, NULL),
(183, '2025-05-27 18:19:31.774969', 2.00, NULL),
(184, '2025-05-27 18:19:42.363541', 2.00, NULL),
(185, '2025-05-27 18:19:42.999134', 2.00, NULL),
(186, '2025-05-27 18:20:48.833648', 3.00, NULL),
(190, '2025-05-28 14:55:09.076478', 10.00, NULL),
(191, '2025-05-28 14:55:58.891228', 3.00, NULL),
(193, '2025-06-02 13:52:28.535745', 6.00, NULL),
(194, '2025-06-02 13:52:29.134433', 6.00, NULL);

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
(1, 'hasbi', 'ilias', '0650378032'),
(2, 'moussa', 'mousa', '06502878'),
(3, 'malik', 'embraiki', '0650378033'),
(4, 'braikia', 'mahira', '0');

--
-- Index pour les tables déchargées
--

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT pour la table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `ligne_transactions`
--
ALTER TABLE `ligne_transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT pour la table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_fournisseur_id_ce4cba9d_fk_fournisseurs_id` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`);

--
-- Contraintes pour la table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_employe_id_c83635fb_fk_users_id` FOREIGN KEY (`employe_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
