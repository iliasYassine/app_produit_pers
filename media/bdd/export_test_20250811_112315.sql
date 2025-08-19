-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add Token',8,'add_tokenproxy'),(30,'Can change Token',8,'change_tokenproxy'),(31,'Can delete Token',8,'delete_tokenproxy'),(32,'Can view Token',8,'view_tokenproxy'),(33,'Can add produit',9,'add_produit'),(34,'Can change produit',9,'change_produit'),(35,'Can delete produit',9,'delete_produit'),(36,'Can view produit',9,'view_produit'),(37,'Can add users',10,'add_users'),(38,'Can change users',10,'change_users'),(39,'Can delete users',10,'delete_users'),(40,'Can view users',10,'view_users'),(41,'Can add fournisseur',11,'add_fournisseur'),(42,'Can change fournisseur',11,'change_fournisseur'),(43,'Can delete fournisseur',11,'delete_fournisseur'),(44,'Can view fournisseur',11,'view_fournisseur'),(45,'Can add transaction',12,'add_transaction'),(46,'Can change transaction',12,'change_transaction'),(47,'Can delete transaction',12,'delete_transaction'),(48,'Can view transaction',12,'view_transaction'),(49,'Can add ligne transaction',13,'add_lignetransaction'),(50,'Can change ligne transaction',13,'change_lignetransaction'),(51,'Can delete ligne transaction',13,'delete_lignetransaction'),(52,'Can view ligne transaction',13,'view_lignetransaction');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(11,'transcript','fournisseur'),(13,'transcript','lignetransaction'),(9,'transcript','produit'),(12,'transcript','transaction'),(10,'transcript','users');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-17 15:52:31.281217'),(2,'auth','0001_initial','2024-11-17 15:52:31.601044'),(3,'admin','0001_initial','2024-11-17 15:52:31.687053'),(4,'admin','0002_logentry_remove_auto_add','2024-11-17 15:52:31.692040'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-17 15:52:31.698024'),(6,'contenttypes','0002_remove_content_type_name','2024-11-17 15:52:31.745079'),(7,'auth','0002_alter_permission_name_max_length','2024-11-17 15:52:31.756188'),(8,'auth','0003_alter_user_email_max_length','2024-11-17 15:52:31.765164'),(9,'auth','0004_alter_user_username_opts','2024-11-17 15:52:31.771148'),(10,'auth','0005_alter_user_last_login_null','2024-11-17 15:52:31.807157'),(11,'auth','0006_require_contenttypes_0002','2024-11-17 15:52:31.808154'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-17 15:52:31.813262'),(13,'auth','0008_alter_user_username_max_length','2024-11-17 15:52:31.823236'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-17 15:52:31.832350'),(15,'auth','0010_alter_group_name_max_length','2024-11-17 15:52:31.842324'),(16,'auth','0011_update_proxy_permissions','2024-11-17 15:52:31.848308'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-17 15:52:31.858281'),(18,'authtoken','0001_initial','2024-11-17 15:52:31.917569'),(19,'authtoken','0002_auto_20160226_1747','2024-11-17 15:52:31.935614'),(20,'authtoken','0003_tokenproxy','2024-11-17 15:52:31.937608'),(21,'authtoken','0004_alter_tokenproxy_options','2024-11-17 15:52:31.940600'),(22,'sessions','0001_initial','2024-11-17 15:52:31.969523'),(23,'transcript','0001_initial','2024-11-17 15:52:31.983569'),(24,'transcript','0002_alter_produit_prixachat_alter_produit_prixvente_and_more','2024-11-17 15:52:32.048582'),(25,'transcript','0003_users_prenom_users_tel','2024-11-17 15:52:32.064539'),(26,'transcript','0004_rename_qté_produit_qte','2024-11-17 15:52:32.070524'),(27,'transcript','0005_fournisseur_rename_adrfournisseur_produit_codebarre_and_more','2024-11-17 15:52:32.094569'),(28,'transcript','0006_produit_fournisseur','2024-11-17 15:52:32.140763'),(29,'transcript','0007_transaction','2024-11-17 15:52:32.181539'),(30,'transcript','0008_lignetransaction','2024-11-17 15:52:32.256476'),(31,'transcript','0009_alter_produit_fournisseur','2024-11-17 15:52:32.538903'),(32,'transcript','0010_produit_qtemin','2024-11-17 15:52:32.547879'),(33,'transcript','0011_alter_transaction_date_heure_alter_transaction_total_and_more','2025-04-07 09:19:18.211076'),(34,'transcript','0012_alter_fournisseur_adresse_alter_fournisseur_email_and_more','2025-04-07 09:20:30.399188'),(35,'transcript','0013_alter_lignetransaction_prix_unitaire_and_more','2025-04-13 12:05:46.097529');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('075o4vpt7draa43noc59s8rzjhxi9rbd','eyJ0cmFuc2FjdGlvbl9pZCI6OTd9:1uCJ6l:XvUI7N6vILRz2i4TV6sYQKY4Ex_oOVHqpheTRa7Txw0','2025-05-20 14:17:19.827048'),('0tayrin999cx8snzoa1uak5nhww7wuf5','eyJ0cmFuc2FjdGlvbl9pZCI6NzV9:1uByvs:6sgcL_mrVnDZq2DkKOdW2YvyskjWOdThJ3rJLqZRT3c','2025-05-19 16:44:44.876737'),('1s6z23clmt6srfc4k6qxp7skmqqazmwk','eyJ0cmFuc2FjdGlvbl9pZCI6MTV9:1u1n6R:qhurBCZE-sfzlsPouyDM_RPYy10-bR0QM_j4-de8KY0','2025-04-21 14:05:31.430723'),('1xhoh4eofwavpiluxgzztytw0sdldchc','eyJ0cmFuc2FjdGlvbl9pZCI6MzF9:1u1nXw:9PTl0--0w8D0wThkhO1OdeKosvDyawNvEYIm2Wh7IjE','2025-04-21 14:33:56.321674'),('23zp12oiwlj1yttpjoznsgr65h7rt3sm','eyJ0cmFuc2FjdGlvbl9pZCI6MTA3fQ:1uChA5:BhehcqcZKyhXN2N0WsjD15pA3eb52XZ6juuIBjVawk8','2025-05-21 15:58:21.140411'),('2d0ve9t7nyip6wdprrrn2ooysl03jvzc','eyJ0cmFuc2FjdGlvbl9pZCI6OTh9:1uCJEX:clcQnVqK663ZtW5xGakdchb702273qxKkgTTSihrGPM','2025-05-20 14:25:21.602787'),('2qtblf7a21jdcu1652z150bjqphlo71p','eyJ0cmFuc2FjdGlvbl9pZCI6ODR9:1uBz3N:BAR1eE63firW-f4I9vPBd0HC9eca3ilwOgv0IfWFJ2M','2025-05-19 16:52:29.051550'),('2x0efqi0p2yqi564yuten9o0oyvgbg5j','eyJ0cmFuc2FjdGlvbl9pZCI6NDV9:1uBcj4:tX4ZiIo0Xbp5qabxB3DRwfshs6PoslzjoBMArVPmapM','2025-05-18 17:02:02.742205'),('3nkvx8dzv9lxk70pq65pqcwu6r03sgpr','eyJ0cmFuc2FjdGlvbl9pZCI6Nzl9:1uBywM:39Jf_ZvtxPA9oNQIZ7FJKS90t-ee-IdB8dalD1FF0BQ','2025-05-19 16:45:14.938138'),('3wtwh75kk6qnlbo7saqym3g80yiobu9h','eyJ0cmFuc2FjdGlvbl9pZCI6NzN9:1uByvS:NqxZgdNu8UnSwpIkQherZRnaWnZmz0LKVV6jeGVqV4k','2025-05-19 16:44:18.534240'),('3zry1ginarfiz6mzllgf3iekbcw63gse','eyJ0cmFuc2FjdGlvbl9pZCI6ODJ9:1uBz32:wUHn4A5eTfYwL8C31YpYgmTCuR1PIPH8SpJxXDLXGeo','2025-05-19 16:52:08.420058'),('4tyn3it45dwr9l92fla61ma9g73ym4p5','eyJ0cmFuc2FjdGlvbl9pZCI6MTJ9:1u1n3A:sP07ksIw9_WQdl6x52XNnkZDI0UmvJ_YuSQlQx-Pidw','2025-04-21 14:02:08.579010'),('4ztyo9hu2fvp1ywbtvbim8yo9dpxx9xo','eyJ0cmFuc2FjdGlvbl9pZCI6MTZ9:1u1n77:ydcahtZyYfr3Tb04MxeNOncq5FNW9laf1OmrU5_l9_Q','2025-04-21 14:06:13.541587'),('5978odtyg92rnqmo0tlvaem35kbj3kb8','eyJ0cmFuc2FjdGlvbl9pZCI6NzR9:1uByvh:jCGKqKDuN02_s88tY7cEwk1vujrdsB53yf0mifbfcsU','2025-05-19 16:44:33.601994'),('5b9xmwb6uqspoiht9a3ky6nqy7xbomll','eyJ0cmFuc2FjdGlvbl9pZCI6MTN9:1u1n54:a5FsXDLJG9Og1L3Yv5WamqSlUL4dWQ4uTghQFlWscgA','2025-04-21 14:04:06.804807'),('5g3q7iiwj7vq8234anqm8om5yz0easdr','eyJ0cmFuc2FjdGlvbl9pZCI6NzF9:1uBxbT:zG3wzvQSCt808U2XPr9o6DVD37nC-tlPT_LA-Cl9fas','2025-05-19 15:19:35.529803'),('5nud7bo1vhq4v6bf98knirsnuw8qq905','eyJ0cmFuc2FjdGlvbl9pZCI6NTV9:1uBpHh:VfFvl7og2P-GJ2bKcuII5H7d2FcXVIWuQSngjhpi0gI','2025-05-19 06:26:37.008011'),('5zkjxoonix9on34idst20hx08bnv4dxy','eyJ0cmFuc2FjdGlvbl9pZCI6OH0:1u1lS9:AfWYEtOcqDDyjPwwLJNCS1CegZoIq-7TlowRp1hrIBE','2025-04-21 12:19:49.363023'),('5zy2a28l16p1jdwx6kt8o0zvrzzia26q','eyJ0cmFuc2FjdGlvbl9pZCI6ODB9:1uBz1o:HVXx0muHffzBsA45xlEYR0PjVfb-Yl-tVVQbA9rl9Hw','2025-05-19 16:50:52.374799'),('63pz708k7gufps717mwc9lwdmi548soe','eyJ0cmFuc2FjdGlvbl9pZCI6MTd9:1u1n8q:2i6yE4pHwqUtch5CfqmF38JhylkWonoM8cQ-1BmoWeY','2025-04-21 14:08:00.409268'),('64huqi1csum8txktaoo87y5h4ns70xxe','eyJ0cmFuc2FjdGlvbl9pZCI6NjZ9:1uBsFV:LIDzioygWJXqvoC8QrE7F0TQqUuvzvQqoXrJ0LOgbLA','2025-05-19 09:36:33.985906'),('7euxvk2lw6nz2fiwqokzlxgtyow7f0yo','eyJ0cmFuc2FjdGlvbl9pZCI6MjF9:1u1nFB:Wh2H6_FGJydZ_6dD1F46g5Oe6KmoGvLXj1t9pwvJhn8','2025-04-21 14:14:33.377866'),('7pfbdcgb0orcj38rsgjmqz8dych31myx','eyJ0cmFuc2FjdGlvbl9pZCI6OX0:1u1mme:x73o5Er9US1zLh-FW-6DD6M5J0PAGeK34vUfe_tNKWc','2025-04-21 13:45:04.096358'),('8c5hryy0e0y5c4277isv4d4p1vfwnrym','eyJ0cmFuc2FjdGlvbl9pZCI6NDl9:1uBcur:EV0N9IrMFrcPHeqOT4HGPCh3S7YZpja7I2jGBBoFaf8','2025-05-18 17:14:13.784001'),('8lhkcfd97u0e1cteouzmnszt4170ybyx','eyJ0cmFuc2FjdGlvbl9pZCI6ODd9:1uBz3i:CX_W0KlSfArNlQejT7BgMQ1DRODcWGIvz150P-DGfNY','2025-05-19 16:52:50.631163'),('8lpd5groofx909gmk8rnhwm281o7u2ee','eyJ0cmFuc2FjdGlvbl9pZCI6NTd9:1uBpJK:UhOZGrx1VudDbS6VaRQaIEx_bmSsvOXDVE5RS588Ipk','2025-05-19 06:28:18.956163'),('8miwoqmn2vbu503z63jmzmn0rd7fs5vx','eyJ0cmFuc2FjdGlvbl9pZCI6OTR9:1uCItB:Kn0v3rIg42jGxio04wxj9hvbgmtBt8_lID2Eky_Yers','2025-05-20 14:03:17.778649'),('8ova66y72siw7pvo63bkl58nu7h2ji5j','eyJ0cmFuc2FjdGlvbl9pZCI6M30:1u03Q8:YD6Fp6wIDSnvAGHVsNArJeaisecqKxgvoqT4S3VwOKA','2025-04-16 19:06:40.967068'),('9eiawfx7n4om4uoqw772hkk56zspjlxi','eyJ0cmFuc2FjdGlvbl9pZCI6ODN9:1uBz3L:LGlausdl_jFHxaGgyKAEvAkjQjXkYcnOyX7Y2E4bB9Y','2025-05-19 16:52:27.894566'),('9r7nhkh9jbje9q8i35crs2jrxnu5p39v','eyJ0cmFuc2FjdGlvbl9pZCI6MjV9:1u1nPh:QXtM4-2pcrM8adHXjDCnzGlVJzBOI9eZuX6TeNM-8K4','2025-04-21 14:25:25.640714'),('aim229poagoet4twyg71nd716dyzc2yf','eyJ0cmFuc2FjdGlvbl9pZCI6NDR9:1u41Hx:phKUhWIdbaM62vGx6fT_ihJd-VV-2wMyBQWb92g1FNA','2025-04-27 17:38:37.104031'),('b0cpfr3audsdmaoox650nkohqrivv5q1','eyJ0cmFuc2FjdGlvbl9pZCI6MjZ9:1u1nUC:LLwr1qGSDqDNarF4TMJck-yiTzg8xIqi67KnvQhtKEw','2025-04-21 14:30:04.326313'),('b3jwitzn47pkf3rcp1rywd8399jpjk71','eyJ0cmFuc2FjdGlvbl9pZCI6NzB9:1uBvWS:JDdlt5ZyfZxCRi7MtTinkCjO57wIxjvgmdRIg_te0ZM','2025-05-19 13:06:16.468328'),('b5pkuw28o845ylr94ih22m2af74flhy1','eyJ0cmFuc2FjdGlvbl9pZCI6MjJ9:1u1nJJ:kzSE3hLzpqf5vzXrukuWvtnAj2pIwMLnBX4VOQ_UAtg','2025-04-21 14:18:49.680761'),('bhxvqt971nk0viq9x2zjt1p3ft38lyk9','eyJ0cmFuc2FjdGlvbl9pZCI6MTA2fQ:1uCh9o:RBAQ6Jv4uoT4iVKXroTIBQ1NBQPrObKNn4VpYjm2-YQ','2025-05-21 15:58:04.457101'),('bj8h6x79rrgbr0xtobr0jm9vd4951itc','eyJ0cmFuc2FjdGlvbl9pZCI6Njd9:1uBsFe:yPclURJdzyRiMCg3Jf0jEyGuacvIdjxhkt-tnzylh7Q','2025-05-19 09:36:42.878435'),('c26110b352cwoyjuticygzqakch8sccj','eyJ0cmFuc2FjdGlvbl9pZCI6OTF9:1uCEDl:M23MrsRJxr2193fL4Yo-HLebIogmXXTc2C7ozOeofvI','2025-05-20 09:04:13.260003'),('cb8sfffwh5yzqqfxkl44ruj8qwgt9vu6','eyJ0cmFuc2FjdGlvbl9pZCI6NjR9:1uBsEz:awv3pfvTbOWzpsy0N3ES_8MosfTK9MloFIT2EK-FxAk','2025-05-19 09:36:01.995231'),('clx7itb4wvtlolyppfwlepv7m5l73716','eyJ0cmFuc2FjdGlvbl9pZCI6Mjd9:1u1nUi:fsw2S9kNv-BEoEWynZzC26PcgBIMxYwhR0Ve6BKxEv4','2025-04-21 14:30:36.455484'),('d198ndabfo49an428cbeo76qs2suivuz','eyJ0cmFuc2FjdGlvbl9pZCI6NDJ9:1u23hd:1DQw1Qp8bCvgDnQrHMuIsDHJCbqHeeDkHlkV6slgA6A','2025-04-22 07:49:01.665639'),('dg0zavkaphovxlmss31af4tupcd29efq','eyJ0cmFuc2FjdGlvbl9pZCI6MjB9:1u1nEO:pDSdCAg7ywC_g0FtJc4rBI5tk3ZKFWi-RkXIf2qbJ-Q','2025-04-21 14:13:44.741529'),('dujj0zz71u9d0es024hjpgvn7ikjbm9q','eyJ0cmFuc2FjdGlvbl9pZCI6NH0:1u03QI:Mi-QiYQchYDTDolrNUlsd8bnjEWXo7z6MyedM_Nzxt0','2025-04-16 19:06:50.675490'),('ecr5wkckmrjqa6rqyxm6ou190sh13pvs','eyJ0cmFuc2FjdGlvbl9pZCI6ODF9:1uBz2q:CchzsWUu8WXSpbswsM1Zy5W4VVvhWNdFZsRe0ikXywo','2025-05-19 16:51:56.130308'),('eevyjpwgd1aqku86k3o279en732vot4j','eyJ0cmFuc2FjdGlvbl9pZCI6MzZ9:1u23KE:Ky2pxvDVsf8dVYCIBY17yRETpOc7dY4QOHr27wS6Z4o','2025-04-22 07:24:50.810638'),('es1ix0ijyls33dc10m7acstmjidpzy6r','eyJ0cmFuc2FjdGlvbl9pZCI6Mzh9:1u23Lb:ApQpihCaq6BLEJVbfwyIOZIq8IYVwESR5dqQ9pgJloI','2025-04-22 07:26:15.563015'),('exbzzop3c4706kzbsq1cmeckpgovbox2','eyJ0cmFuc2FjdGlvbl9pZCI6MTR9:1u1n64:JW-wgoveF0iqStEdt9lbm5fDFWrmHJkQWaxPdEN8aGw','2025-04-21 14:05:08.047499'),('ezlqg77je7nxg14cnhructw4rmtta2qr','eyJ0cmFuc2FjdGlvbl9pZCI6MTA1fQ:1uCh91:MNdywwqgslABFgVBH2SfeEYEk1a_D02EOdRBkuzVj-g','2025-05-21 15:57:15.426053'),('ff1qbneddc13xcszpkkohsn8btrp36g4','eyJ0cmFuc2FjdGlvbl9pZCI6MTAzfQ:1uCgWf:y9rtafNH5jbqfl6FwqOm4f8YAeWCbP7SRghxnJbwihs','2025-05-21 15:17:37.597858'),('fp41t60b6j1ycdgqonv3zms7ayhxjg4d','eyJ0cmFuc2FjdGlvbl9pZCI6NTJ9:1uBp6U:63dDCIrCwcMAeV5YO_kX1vG3VAW1hUmszB1DX4AHgsw','2025-05-19 06:15:02.749448'),('ggfjs1vfbg8k5ws0r9xluftvlwstymix','eyJ0cmFuc2FjdGlvbl9pZCI6MTEwfQ:1uDTsu:gs9pYx4jDX_iOgr6tNv8wdiMdnneRXup1HB5BmkOtq4','2025-05-23 19:59:52.064816'),('gprnky6mo50t7ickahu9bwatdovpjdwc','eyJ0cmFuc2FjdGlvbl9pZCI6NzZ9:1uByw4:Fk3_7QOZIDSmdap4OFFWdk23A7mFToedeuhGP-vdjxI','2025-05-19 16:44:56.019086'),('gwkobh5yogugy2klm09qmvsvndik7881','eyJ0cmFuc2FjdGlvbl9pZCI6Nn0:1u1ikD:Ph_Syi0-u7GgCCNwpdTJtkm8uE52syHQojzZnQyUJIQ','2025-04-21 09:26:17.058193'),('gywllslithisz7nm52d1hpllm1xfyolx','eyJ0cmFuc2FjdGlvbl9pZCI6NjN9:1uBryr:HX_96Rs88gq9Dl1Y_nBG8EHFji49K7Ukr7VTfhpp9Z4','2025-05-19 09:19:21.041216'),('h8l5u740mrjfi5w5k0d3i1b3m1g3mswl','eyJ0cmFuc2FjdGlvbl9pZCI6OTZ9:1uCJ6g:0SMWPsL01QgbNDA2UyLVSY-XkuN5eJjUcQ8Ia3a_1og','2025-05-20 14:17:14.886571'),('if3ylreuj9ky3vpu11iqkd7cjctmy2b9','eyJ0cmFuc2FjdGlvbl9pZCI6ODh9:1uBz4U:_8TljBOlDmDNHwVS-5aUY8qIi9fT8Z0mU8K35UxV7aM','2025-05-19 16:53:38.770258'),('ih919b9kn23hctfpt5dgl90kzwus92wp','eyJ0cmFuc2FjdGlvbl9pZCI6MzB9:1u1nXZ:WgjWl2yzvQD4tsVHcxw_HHmkLKlnt_QLi2bC461wVDE','2025-04-21 14:33:33.912722'),('j8f9txjfjg98yf37jhcicr8u7zs7s1ew','eyJ0cmFuc2FjdGlvbl9pZCI6MTA4fQ:1uCwex:DkV8K3gLyi54SIojb_aaR5B-En3tLKtYs-hfVoiCaa8','2025-05-22 08:31:15.165055'),('jcy4yoh5wphc4l7s68gk46lqxajen1ve','eyJ0cmFuc2FjdGlvbl9pZCI6Njh9:1uBvDv:2ONUPxMGleoHv-CA5mR6gIjys69E-82g86xSUNDZav0','2025-05-19 12:47:07.017071'),('jh8unelyl7ose98j3wjf62mjs77axipn','eyJ0cmFuc2FjdGlvbl9pZCI6NDN9:1u2451:f1T1_nZyyHwKwqe5sG0WahHZviCZP3gEua7umBshC50','2025-04-22 08:13:11.524443'),('jpngku238wmkm9bouaqoobin502nl9yg','eyJ0cmFuc2FjdGlvbl9pZCI6MzJ9:1u1nYH:JtTmh9BMlgZpf2J809YgZKtJex-aKJupENTAV5XpFPk','2025-04-21 14:34:17.906259'),('jwa2tt61lo46sa07ti568kryc30ahm9g','eyJ0cmFuc2FjdGlvbl9pZCI6Nzd9:1uBywB:9YWyosUpoj53es5Ouzc6atgNWj86DwliNQ9daCNmCKg','2025-05-19 16:45:03.364407'),('jxwbo7aksd5gyy8vu67vqnjv00beoh64','eyJ0cmFuc2FjdGlvbl9pZCI6MjN9:1u1nMy:axR7kpNw6F0PRq-gokGXVQ5YXoFTjsIOLARq7p_9aaM','2025-04-21 14:22:36.345020'),('k5us0sq5nfh41kwz307rmrnaigvuhsxg','eyJ0cmFuc2FjdGlvbl9pZCI6MTl9:1u1nCn:Y0STsCxLKL5fNuC0GWGORZk7fMd3bbPLJtlyp3GVQ30','2025-04-21 14:12:05.932721'),('k6qalzzsu6cxpsbwv315n3vja4bgskue','eyJ0cmFuc2FjdGlvbl9pZCI6NjB9:1uBpwk:FGOPASzqG7pR4vu96jJssH_7mqaf3-GUy4Ac2ExaPMc','2025-05-19 07:09:02.840117'),('k70hnyb52wc1b153op4nbaemnv5vozta','eyJ0cmFuc2FjdGlvbl9pZCI6OTV9:1uCIuK:7nOkEV93uaeTma3sl5r4AvDQNeZj0DrfORckBV9a09c','2025-05-20 14:04:28.364584'),('k759xkpk6tc5gakrujttrblmzh7sshs0','eyJ0cmFuc2FjdGlvbl9pZCI6MzR9:1u23JI:cwfsYvTIGw9t2jX46E6VUimJSlc-0UTy1o-mjstMxBE','2025-04-22 07:23:52.675816'),('kcrzdav4kycr1zx18nciuxr8kdsbu565','eyJ0cmFuc2FjdGlvbl9pZCI6ODV9:1uBz3V:QXF1buryEOPIxPLdZaTTFDF5DDXTL8NOrAYZ3Eho5uk','2025-05-19 16:52:37.985537'),('kgkze2lxsjiyr5asi2jekb87lvtekfvg','eyJ0cmFuc2FjdGlvbl9pZCI6MX0:1tCjhK:5dqFI5g6NiUEZd6odVUydg4A6el9-o8Olq4gFE9rvzA','2024-12-01 18:08:34.583159'),('kjm2kvijb2byyeptbglecdltj6r1qbmd','eyJ0cmFuc2FjdGlvbl9pZCI6NTR9:1uBp9n:JGbinQBLlI0nusJ8WMDHMHrkI-YNV0IH-14Wk-S-yd4','2025-05-19 06:18:27.108332'),('kk6s2acohf88wbfqkxkbodab7rxidz8a','eyJ0cmFuc2FjdGlvbl9pZCI6NzJ9:1uByvC:G9l-ohEkdXWEr_SXQVDGBK84v42cJMHWbGsbXFjgGzA','2025-05-19 16:44:02.765900'),('l0qcjf31mo9kujt0n8imu9coyzq7ktiz','eyJ0cmFuc2FjdGlvbl9pZCI6NDB9:1u23Ry:_6tRZRJWfeElMGxNl7AUt38QRL5JZ_F6B5D24aSPzLw','2025-04-22 07:32:50.349242'),('l8lbhqq89l0k7m1rb0ltuw04jwzsf59n','eyJ0cmFuc2FjdGlvbl9pZCI6MTEyfQ:1ukgbd:6cH4uW6UI3TcsY6ju2MB6jzRGRF3fYVJuf5s9hLaulA','2025-08-23 10:15:17.625080'),('lcvu3bixfbs8k1qzj4gvy18jdkc49i0s','eyJ0cmFuc2FjdGlvbl9pZCI6NTB9:1uBp66:fEJWQC__Qf5iiJcHyMTbmn5hzFKVdZxryivyyIn5h6c','2025-05-19 06:14:38.126129'),('md34efmzwsceo4oum92db0yistaxole5','eyJ0cmFuc2FjdGlvbl9pZCI6NTl9:1uBph8:MMyXMi0E92Bw10HO8v1JvoAPBffhQ0AtXynH4-cAMcA','2025-05-19 06:52:54.660729'),('mm8ckcti7qjesfp67zzwb1mwl3mssgrb','eyJ0cmFuc2FjdGlvbl9pZCI6MTB9:1u1n2Q:CTZf4nCOXyUvmKhWtArNZmnEUwsfMm683AdSv465lzM','2025-04-21 14:01:22.014319'),('mnuev1xbvdd7hgjskg82nuv6r6pap9nu','eyJ0cmFuc2FjdGlvbl9pZCI6NDZ9:1uBcjG:4XvljkV4V11Lp42U1iAo8ExHK83N-iRHpleL7BioTfg','2025-05-18 17:02:14.464321'),('mrmahxso2yrp282vsx5tc3k99812q7yr','eyJ0cmFuc2FjdGlvbl9pZCI6OTJ9:1uCEDo:AK303EX_NEJLLLsfX9HPOMLFG4kOjpaZX8R_HCtU0as','2025-05-20 09:04:16.604497'),('n2obr8eipsy9mou8tp37c6vpl498uhhj','eyJ0cmFuc2FjdGlvbl9pZCI6NjV9:1uBsFL:zNluWKooDPGDP-wiCkDkOVnspUk_GapQvL4G7HH5DJM','2025-05-19 09:36:23.474230'),('o760b0fug315poz94ivklwrozgv7dien','eyJ0cmFuc2FjdGlvbl9pZCI6Nzh9:1uBywJ:Gx3iWFlhRYB54R1xKOoQ_eJ9tEtpXBHuJ4erawgfl2Q','2025-05-19 16:45:11.283777'),('p05gfikl8mvfx98846rxe1vtq0e9ziwe','eyJ0cmFuc2FjdGlvbl9pZCI6NTh9:1uBpdc:RsO8u-N6je7V5RUpSPoUapCX6KAFoCVQCgqrK_MLL4U','2025-05-19 06:49:16.164121'),('p0wwz110um52zbfkdpal25m7wl001nx2','eyJ0cmFuc2FjdGlvbl9pZCI6MTAxfQ:1uCgVp:4k7bWW9kAXCgB9ONAZdpjaT5auMTOb2H0U5xQaZebCg','2025-05-21 15:16:45.935350'),('p21nqtywtpgna1lm1fguu3oghota2q9f','eyJ0cmFuc2FjdGlvbl9pZCI6NDh9:1uBclK:C4K8fdjmbs6ZxNZ4wonryr3Fh7RF5a_EnrdXCVyrvuo','2025-05-18 17:04:22.139493'),('p4555t1si4x5hyq9dbyz6yvljv1q60g2','eyJ0cmFuc2FjdGlvbl9pZCI6ODZ9:1uBz3c:_GHWUduyj1g1OCt-r0R8o6mBcoN8AZSiXuPbiGYkUXg','2025-05-19 16:52:44.476889'),('pmkweud3dh7xhpb6wqx95l9wdj8wt8bt','eyJ0cmFuc2FjdGlvbl9pZCI6OTB9:1uCE4N:pmYg12JPI1fjY6TQBM1QBLXXwAeE6APpq8PvS1BIMbE','2025-05-20 08:54:31.013162'),('prheqaw1kx72we1e5sdpnl91mciwtrci','eyJ0cmFuc2FjdGlvbl9pZCI6Njl9:1uBvSh:sSdKGoFOGK7kLriTANwssEfc7xSyjOKt5xdROqJdcH0','2025-05-19 13:02:23.155492'),('pyy0bg37t4yefkdic53ydjm9pqbnljxi','eyJ0cmFuc2FjdGlvbl9pZCI6Mjh9:1u1nUy:cXSk_QSMdeXOBgFMlgYmnYQHVUSAXPwUeyGqDFDvkXs','2025-04-21 14:30:52.403154'),('pyy2q21pmjcmhv2hhpxelje72ww13r1o','eyJ0cmFuc2FjdGlvbl9pZCI6MzV9:1u23Jw:Pg9r4H3NgVL4TllSTUwvN7meVRhtItBexXYXToEA_7Y','2025-04-22 07:24:32.774507'),('qbrseg7c6ruwetxjfbxots5ym35uutpw','eyJ0cmFuc2FjdGlvbl9pZCI6NDF9:1u23UG:XfmRlIjmkohQilCq6YlzImeAoBfHusoXnARex8eHqiE','2025-04-22 07:35:12.504071'),('r0qpypbsiirav52xbdihq4eraumiiqgt','eyJ0cmFuc2FjdGlvbl9pZCI6Mzd9:1u23L1:zKxXNNvMzF8B0R0o8Oi77Wrj0yubjUNq10WhykJW-Mo','2025-04-22 07:25:39.108615'),('rj1p3qu2akab1tc8drxn6gfsfqbhotka','eyJ0cmFuc2FjdGlvbl9pZCI6MTAwfQ:1uCL1V:Ty-MVTIEazdKKItcKT1I5ezvGOB1VMhKVKjR9PwUdm0','2025-05-20 16:20:01.751767'),('sfy7e2pweodgqrycrevhw76dbf1gabij','eyJ0cmFuc2FjdGlvbl9pZCI6MTAyfQ:1uCgWB:5saeBQpnbuf5dvbU4bArWX3vpZTaiqvdXodi9K08TgE','2025-05-21 15:17:07.374864'),('szet7jz8k2xy6lyemzahhv3r903eb7v8','eyJ0cmFuc2FjdGlvbl9pZCI6Mzl9:1u23M4:PGKIw2xfLuKYbjif9ySeG14TbjH23TP5Wx-jQPOXFHY','2025-04-22 07:26:44.998329'),('t1gbuhxlljtcaxn2ads6hbzq3qk52lp6','eyJ0cmFuc2FjdGlvbl9pZCI6MTh9:1u1n8u:d93JNsZwOoWuHYA89RpJt_9NRNtD6_EqZ8ZRRIbzcKI','2025-04-21 14:08:04.922566'),('tc0mi8oz4bjji7zr06y6ulws88kd7r84','eyJ0cmFuc2FjdGlvbl9pZCI6NTN9:1uBp9g:PXhaBBpM8Q-EHiDe4frqlYo2uTB-3PuqOtx6YnpSx7A','2025-05-19 06:18:20.444640'),('twrd0bpv66uz041gq9xhfnaq7f1dw54g','eyJ0cmFuc2FjdGlvbl9pZCI6MjR9:1u1nNw:M4gUOu4G5Dgpo52o2j7j5qTm5RDddsX7rtLz1Dtjlgg','2025-04-21 14:23:36.880474'),('u4rb2eatigyukvpkqwnl2obamvvvkxot','eyJ0cmFuc2FjdGlvbl9pZCI6Mjl9:1u1nVA:IXgIBaZ7rDO73FU0YJBpO9HDgkmPuYu1L9UW3VYRaWY','2025-04-21 14:31:04.008341'),('u55ozx93xwr1668riev2rf27n29lvcki','eyJ0cmFuc2FjdGlvbl9pZCI6Mn0:1tCjjx:ws5WFLCfIq1eDaFZjTKNqGwMsqFaMX4iHOi55Bzvf0w','2024-12-01 18:11:17.140958'),('utgpaj2qptlqatumdr8rtnjcqjzgnssz','eyJ0cmFuc2FjdGlvbl9pZCI6N30:1u1ilf:I7MFcQGsBkJdIYXZWctNZHEc5oZ0qBzdSo9oiJd2xz8','2025-04-21 09:27:47.726870'),('uwge4oys9w728lnhiw0276478iw2v598','eyJ0cmFuc2FjdGlvbl9pZCI6NDd9:1uBcje:2oBAkTpg7JV0khsVevuui8AKSgFgxILbTQh-ZfNH9wU','2025-05-18 17:02:38.185266'),('v8ahayzijoql8xncx3p7f0w4vf1mjlcw','eyJ0cmFuc2FjdGlvbl9pZCI6NTZ9:1uBpHk:rPVBlHDbfjumZ3T-f9K9wURxs0eAP37mGzRsnLlJdbI','2025-05-19 06:26:40.397544'),('veapgp9m5sih8otoku2a6c6wms81fcnt','eyJ0cmFuc2FjdGlvbl9pZCI6NTF9:1uBp6N:a3vgSu-fXZankppSk4k9J-IDP9dOLDeeDpdu_HFlTcc','2025-05-19 06:14:55.997460'),('vidhgdkzfh7nog3toamandjisbkei1b1','eyJ0cmFuc2FjdGlvbl9pZCI6OTl9:1uCL1S:qIlyaWzQtzpEbHJScCSLiybhpw4okyd1j3L1FUKjlbI','2025-05-20 16:19:58.447973'),('wbdk2qly3a7t5jvtjflqc7k3b79jvv8x','eyJ0cmFuc2FjdGlvbl9pZCI6NjF9:1uBpwq:PQHNXIiq49o0dfar44zNps05x0Q0DOG-tX6eKAAqeG4','2025-05-19 07:09:08.555149'),('wxnc8aplk7wxt6n074n3cn4440vvqudt','eyJ0cmFuc2FjdGlvbl9pZCI6NjJ9:1uBryl:kzuyEyHjBRbDownnBb4xGx88Fo99ZeOBgSFWT6N6zeo','2025-05-19 09:19:15.362524'),('xafdbflrtrsa0rnpc2oijzcaqqfkgq9n','eyJ0cmFuc2FjdGlvbl9pZCI6MTF9:1u1n2q:2cdhidmpJs2Z5GtPEyOn6JxkCczfrMG9L9Gubs_Pb6o','2025-04-21 14:01:48.301051'),('xuk4bb2mgo2jb27v2rv55uhj2lrzt67s','eyJ0cmFuc2FjdGlvbl9pZCI6MTA0fQ:1uCh81:M8ke9tUHAJdfOESdVJsgWtgKaqgMGfSCWjF9ED36XKQ','2025-05-21 15:56:13.973434'),('y3rr8k6o9a89djhhk3kfcwln2v1q14s2','eyJ0cmFuc2FjdGlvbl9pZCI6OTN9:1uCIpT:UJnvVnOuWSM_x_05DFNi39VRfh061sXbrLIjnZMqMh8','2025-05-20 13:59:27.137935'),('yag8e38g3dstg2of4p82vmtwcr1qdx2z','eyJ0cmFuc2FjdGlvbl9pZCI6ODl9:1uCE4J:xANk03Kp-hycqHl8IAil8X8uFeloWTElOT8Ds8kxz8A','2025-05-20 08:54:27.132598'),('yfgdy0y77qahilp50uyx6g9pkjytknhm','eyJ0cmFuc2FjdGlvbl9pZCI6MzN9:1u23Eq:rTy5C-CwUzjKbiayag_6pnC_qdUJjMzGyE02Fb8EIs4','2025-04-22 07:19:16.044513'),('yhwfgttasxyle4m7e3ix30xg2crazuwl','eyJ0cmFuc2FjdGlvbl9pZCI6MTA5fQ:1uD43j:ITB5GO9xTdr2zZoYKA4KNVoehdxk1P_Kih9pTBZa7cQ','2025-05-22 16:25:19.960168'),('z2id59l5n6cyn2ga5a28b5q0rhhs2hre','eyJ0cmFuc2FjdGlvbl9pZCI6NX0:1u1iiW:B3RVo-iqWSLNgtgsUfqrxmJQDsLmhd3DxomujIPfwgI','2025-04-21 09:24:32.365423'),('zqdqo0seqa2qutu6t0w99cgpnzgwcaaq','eyJ0cmFuc2FjdGlvbl9pZCI6MTExfQ:1uEEJl:MyBO4QOTtn0G5nOWzzOnSsM-968T71sCDcUHEnmV-qc','2025-05-25 21:34:41.988384');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fournisseurs`
--

DROP TABLE IF EXISTS `fournisseurs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fournisseurs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fournisseurs`
--

LOCK TABLES `fournisseurs` WRITE;
/*!40000 ALTER TABLE `fournisseurs` DISABLE KEYS */;
INSERT INTO `fournisseurs` VALUES (1,'metro','0','3 rue elpes cluses','@'),(2,'ab piece','0','eeee','eeee'),(3,'kamel usta turc pneu','0670425026','',''),(4,'moahmed polonais','0641804621','136 rue léon jouhaux sartrouville','');
/*!40000 ALTER TABLE `fournisseurs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ligne_transactions`
--

DROP TABLE IF EXISTS `ligne_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ligne_transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantite` int(10) unsigned DEFAULT NULL,
  `prix_unitaire` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `produit_id` bigint(20) DEFAULT NULL,
  `transaction_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ligne_transactions_produit_id_20f1dc39_fk_produits_id` (`produit_id`),
  KEY `ligne_transactions_transaction_id_c647e44e_fk_transactions_id` (`transaction_id`),
  CONSTRAINT `ligne_transactions_produit_id_20f1dc39_fk_produits_id` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`),
  CONSTRAINT `ligne_transactions_transaction_id_c647e44e_fk_transactions_id` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ligne_transactions`
--

LOCK TABLES `ligne_transactions` WRITE;
/*!40000 ALTER TABLE `ligne_transactions` DISABLE KEYS */;
INSERT INTO `ligne_transactions` VALUES (80,1,7.00,7.00,10,80),(81,1,2.50,2.50,14,81),(82,1,23.00,23.00,16,82),(83,1,5.00,5.00,21,83),(84,1,5.00,5.00,21,84),(85,1,2.00,2.00,23,85),(86,1,10.00,10.00,26,86),(87,1,8.00,8.00,25,87),(88,1,3.00,3.00,62,88),(112,1,2.00,2.00,67,112);
/*!40000 ALTER TABLE `ligne_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produits`
--

DROP TABLE IF EXISTS `produits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produits` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nomProd` varchar(100) DEFAULT NULL,
  `prixAchat` decimal(6,2) DEFAULT NULL,
  `prixVente` decimal(6,2) DEFAULT NULL,
  `qte` decimal(6,2) DEFAULT NULL,
  `codeBarre` varchar(100) DEFAULT NULL,
  `fournisseur_id` bigint(20) DEFAULT NULL,
  `qteMin` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produits_fournisseur_id_ce4cba9d_fk_fournisseurs_id` (`fournisseur_id`),
  CONSTRAINT `produits_fournisseur_id_ce4cba9d_fk_fournisseurs_id` FOREIGN KEY (`fournisseur_id`) REFERENCES `fournisseurs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produits`
--

LOCK TABLES `produits` WRITE;
/*!40000 ALTER TABLE `produits` DISABLE KEYS */;
INSERT INTO `produits` VALUES (9,'collection platinium mademoiselle',0.90,3.00,5.00,'301',4,NULL),(10,'parfum voiture el nabil 85 ml',1.80,5.00,11.00,'340',4,NULL),(12,'mpf my perfumes',3.50,7.00,13.00,'477',4,NULL),(13,'air freshener maison arabyat rouge',1.70,3.50,12.00,'785',4,NULL),(14,'lingette pure musk 30 lingettes',0.90,2.50,14.00,'876',4,NULL),(15,'brume emerat el arab',4.00,10.00,5.00,'038',4,NULL),(16,'parfums bakarat 100ml',10.50,23.00,1.00,'230',4,NULL),(17,'parfums enfant el nabil',3.00,8.00,11.00,'052',4,NULL),(18,'spray yara 250ml',3.00,6.00,6.00,'113',4,NULL),(20,'extrait de parfums intense peach orange',10.80,23.00,2.00,'235',4,NULL),(21,'parums marque 25ml',1.50,5.00,20.00,'634',4,NULL),(22,'parfums qaed al fursan 50ml',2.20,6.00,3.00,'724',4,NULL),(23,'misswak dentifrice',0.70,2.00,17.00,'726',4,NULL),(24,'huile parfumée my perfumes',3.50,5.00,9.00,'048',4,NULL),(25,'volaré my dreams 30ml',2.50,8.00,9.00,'163',4,NULL),(26,'cp yara 50ml',3.75,10.00,4.00,'620',4,NULL),(28,'v.v love senteur diffuseur battonnet',3.00,6.00,6.00,'614',4,NULL),(29,'Air freshener maison',1.50,3.00,12.00,'927',4,NULL),(30,'artisavon de chammel',2.00,4.00,3.00,'111',4,NULL),(31,'stick king kong',13.00,26.00,1.00,'604',4,NULL),(32,'7 guerisons',13.00,26.00,1.00,'222',4,NULL),(34,'artimiel pomme/cannelé',7.50,13.00,5.00,'333',4,NULL),(35,'arti cerise d\'or miélé',7.50,13.00,5.00,'444',4,NULL),(36,'artimiel coco ananas',7.50,13.00,5.00,'555',4,NULL),(37,'artimiel elixir de kiwi',7.50,13.00,5.00,'777',4,NULL),(38,'miel fleur de nigelle',8.00,14.00,8.00,'888',4,NULL),(39,'prohaire btx tanin',8.00,15.00,3.00,'006',4,NULL),(40,'prohaire botox capilhaire',8.00,15.00,3.00,'158',4,NULL),(41,'produit botox argan',8.00,15.00,2.00,'529',4,NULL),(42,'botox by birracci keratine',8.00,15.00,3.00,'920',4,NULL),(43,'déodorant vanille menthe',4.90,6.50,4.00,'999',4,NULL),(44,'déodorant peche',4.90,6.50,4.00,'100',4,NULL),(45,'deodorant fruit rouge',4.90,6.50,4.00,'101',4,NULL),(46,'deodorant rose',4.90,6.50,4.00,'102',4,NULL),(47,'artisavon nila',2.00,4.00,6.00,'103',4,NULL),(48,'artisavon nigelle moringha',2.00,4.00,3.00,'104',4,NULL),(49,'artisavon avocat curcumin',2.00,4.00,2.00,'105',4,NULL),(50,'artisavon nigelle lorier',2.00,4.00,5.00,'106',4,NULL),(51,'artisavon avocat karité',2.00,4.00,5.00,'107',4,NULL),(52,'savon d\'alep citron',1.00,2.50,4.00,'902',4,NULL),(53,'savon d\'alep olive',1.00,2.50,5.00,'605',4,NULL),(54,'savon d\'alep fleur d\'oranger',1.00,2.50,5.00,'995',4,NULL),(55,'gélulle de nigelle',4.50,10.00,4.00,'200',4,NULL),(56,'Parfums oud mood by ard al zafran',2.50,5.00,4.00,'239',4,NULL),(57,'parfums amirat al arab 50ml',2.50,5.00,4.00,'232',4,NULL),(59,'parfums yara 50ml',2.50,5.00,5.00,'925',4,NULL),(60,'parfums qayd al fursan 50ml',2.50,5.00,5.00,'724',4,NULL),(61,'parfums mousuf wardi 50ml',2.50,5.00,5.00,'454',4,NULL),(62,'collection platinium hypnose sacré',0.90,3.00,5.00,'257',4,NULL),(63,'parfum pochefakhar latafa 35ml',1.25,3.00,5.00,'419',4,NULL),(64,'parfum poche ameerat al arab 35ml',1.25,3.00,5.00,'433',4,NULL),(65,'parfum poche asad 35ml',1.25,3.00,5.00,'426',4,NULL),(66,'parfum poche yara 35ml',1.25,3.00,5.00,'396',4,NULL),(67,'test',1.00,2.00,2.00,'000',NULL,NULL),(69,'coffret el faris',7.00,25.00,2.00,NULL,4,2.00),(70,'Coffet intense musk',7.00,14.00,2.00,NULL,4,2.00),(71,'Creme yara',3.75,7.50,2.00,NULL,4,2.00),(72,'Creme emirat',3.75,7.50,2.00,NULL,4,2.00),(73,'Musk tahera 12ml - pomme grenade',3.80,7.60,4.00,NULL,4,2.00),(74,'Musk tahera 12ml - pink musc',3.80,7.60,4.00,NULL,4,2.00),(75,'Musk tahera 12ml - dan al oud conbodi',3.80,7.60,4.00,NULL,4,2.00),(76,'parfums Kamra',12.50,25.00,3.00,NULL,4,2.00),(77,'parfums Al watani',12.50,25.00,3.00,NULL,4,2.00),(78,'brume emerat el arab',4.50,9.00,3.00,NULL,4,2.00),(79,'spray yara 250ml',5.00,10.00,3.00,NULL,4,2.00),(80,'cp oud maraja - oud maracuja',4.80,15.00,5.00,NULL,4,2.00),(81,'bianco late ayat',8.00,16.00,3.00,NULL,4,2.00),(82,'lichi ayat',8.00,16.00,3.00,NULL,4,2.00),(83,'ayat bab el hlam ayat',8.00,16.00,3.00,NULL,4,2.00),(84,'cp - le havana',4.80,15.00,3.00,NULL,4,2.00),(85,'cp maeva',4.80,15.00,5.00,NULL,4,2.00),(86,'cp falkone',4.80,15.00,5.00,NULL,4,2.00),(87,'cp saphire bleu',4.80,15.00,5.00,NULL,4,2.00),(88,'cp marchamolo',4.80,15.00,3.00,NULL,4,2.00),(89,'cp krimtonite elegant',4.80,15.00,3.00,NULL,4,2.00),(90,'manasik - menage',3.00,10.00,3.00,NULL,4,2.00),(91,'manasik - blue',3.00,10.00,3.00,NULL,4,2.00),(92,'manasik - invictus',3.00,10.00,3.00,NULL,4,2.00),(93,'manasik - eclat',3.00,10.00,3.00,NULL,4,2.00),(94,'manasik - kiara',3.00,10.00,3.00,NULL,4,2.00),(95,'brume my perfumes musk candy',2.50,5.00,3.00,NULL,4,2.00),(96,'brume my perfumes musk tahear peach',2.50,5.00,3.00,NULL,4,2.00),(97,'coffret vv love - midnight',2.80,10.00,2.00,NULL,4,2.00),(98,'coffret vv love - la bella viva',2.80,10.00,2.00,NULL,4,2.00),(99,'dressing parfum',7.00,14.00,3.00,NULL,4,2.00),(100,'spray bloom',2.50,5.00,3.00,NULL,4,2.00),(101,'parfum hamidi jawahir',3.00,6.00,3.00,NULL,4,2.00),(102,'musc tahara rose bonbon',1.10,2.20,4.00,NULL,4,2.00),(103,'coffret tahara',8.00,25.00,2.00,'',4,2.00);
/*!40000 ALTER TABLE `produits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_heure` datetime(6) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `employe_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transactions_employe_id_c83635fb_fk_users_id` (`employe_id`),
  CONSTRAINT `transactions_employe_id_c83635fb_fk_users_id` FOREIGN KEY (`employe_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (80,'2025-05-05 16:50:52.366630',7.00,NULL),(81,'2025-05-05 16:51:56.113248',2.50,NULL),(82,'2025-05-05 16:52:08.412057',23.00,NULL),(83,'2025-05-05 16:52:27.886566',5.00,NULL),(84,'2025-05-05 16:52:29.043454',5.00,NULL),(85,'2025-05-05 16:52:37.972399',2.00,NULL),(86,'2025-05-05 16:52:44.468888',10.00,NULL),(87,'2025-05-05 16:52:50.623162',8.00,NULL),(88,'2025-05-05 16:53:38.754261',3.00,NULL),(111,'2025-05-11 21:34:41.980385',0.00,NULL),(112,'2025-08-09 10:15:17.603426',2.00,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `tel` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'hasbi','ilias','0650378032'),(2,'moussa','mousa','06502878'),(3,'malik','embraiki','0650378033'),(4,'braikia','mahira','0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'test'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-11 11:23:15
