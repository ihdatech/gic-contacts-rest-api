-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: contacts
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `contacts_phone_uindex` (`phone`),
  UNIQUE KEY `contacts_token_uindex` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Insomina','Kong Inc','0855157112113','insomina@insomnia.rest','d760509584dc24e89e157dd3b2b97d71794f148f0a865e060ba97051dd8b7c94','2021-10-02 15:28:56','2021-10-02 16:01:12'),(2,'Ihda','Kong Inc','0855157112114','insomina@insomnia.rest','1c93fbc5b2a328949d1fff1cf0224ccef93964ded24f76c8460eeb8386d37e73','2021-10-02 16:14:05','2021-10-02 16:15:14'),(5,'Mukhoyar','Company Inc','085777888999','mukhoyar@','e658b7cd76550075cf1c2e1053ffbb4025c8ed018abf09b6f1868aee8bbe8b1e','2021-10-02 21:39:56','2021-10-02 21:40:40'),(6,'Sulis','Zid Inc','089765342','sulis@',NULL,'2021-10-02 21:41:27','2021-10-02 21:41:27'),(7,'Malindah',NULL,'087698778331','indeh@exam.jp','ee3eab2983433ba152e7899c6df54c6b2ed3965536149285fbf6e70bd7fc7d02','2021-10-02 21:44:14','2021-10-02 22:21:15'),(8,'Ryhan',NULL,'085727111222','null','73950318edda8ebdb3f9a6215c1a6b65498b1d7abc2ae21d4683165b7cb0b3b0','2021-10-02 21:44:58','2021-10-02 22:16:18'),(18,'mukhoyar',NULL,'085515711211','',NULL,'2021-10-02 22:36:48','2021-10-02 22:36:48');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keys`
--

DROP TABLE IF EXISTS `keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0',
  `hits` int(11) NOT NULL DEFAULT '0',
  `package` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keys_key_uindex` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keys`
--

LOCK TABLES `keys` WRITE;
/*!40000 ALTER TABLE `keys` DISABLE KEYS */;
INSERT INTO `keys` VALUES (1,'bc745a913a6ee839880ec9fd13057bf25f2e5fbf927a8eb8972966074cfecb40','1.0.0+1',25,'insomnia','2021-10-02 22:38:01','2021-10-02 15:21:23'),(2,'bc745a913a6eClientKasir057bf25f2e5fbf927a8eb8972966074cfecb40','1.0.0+1',307,'io.github.ihdatech.contacs','2021-10-02 22:21:15','2021-10-02 15:21:23');
/*!40000 ALTER TABLE `keys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'contacts'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-03  5:40:05
