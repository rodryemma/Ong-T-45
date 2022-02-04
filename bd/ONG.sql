-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: ong
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `created_date_time` date DEFAULT NULL,
  `edited` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'desierto','arido, seco, comida lejo',NULL,NULL,NULL,0),(2,'selva','arboles, masa, animales, peligro',NULL,NULL,NULL,0),(3,'campo','paisajes,animales, arado',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imageslide`
--

DROP TABLE IF EXISTS `imageslide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imageslide` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `imageurl` varchar(500) NOT NULL,
  `text` varchar(500) DEFAULT NULL,
  `ordered` bigint NOT NULL,
  `createdat` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `organizationid` bigint DEFAULT NULL,
  `organization_id` bigint NOT NULL,
  PRIMARY KEY (`id`,`organization_id`),
  KEY `fk_imageslide_organization1_idx` (`organization_id`),
  CONSTRAINT `fk_imageslide_organization1` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imageslide`
--

LOCK TABLES `imageslide` WRITE;
/*!40000 ALTER TABLE `imageslide` DISABLE KEYS */;
INSERT INTO `imageslide` VALUES (1,'/Documents/images/logo.jpg','Logo de la empresa',1,NULL,0,NULL,1),(2,'/Documents/images/ong','Logo de la Ong mostrando lo que mas lo destaca',1,NULL,0,NULL,2);
/*!40000 ALTER TABLE `imageslide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `facebookurl` varchar(155) DEFAULT NULL,
  `instagramurl` varchar(155) DEFAULT NULL,
  `linkedinurl` varchar(155) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `edit_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'Diego','Instagram/Diego','Instagram/Casere','Linkedin/Casere','Documents/img/Casere','Es una persona feliz',NULL,'2021-07-13',0);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `content` varchar(500) NOT NULL,
  `image` varchar(100) NOT NULL,
  `deleted` tinyint DEFAULT NULL,
  `created_date_time` date DEFAULT NULL,
  `edited` date DEFAULT NULL,
  `category` int NOT NULL,
  PRIMARY KEY (`id`,`category`),
  KEY `fk_news_categories1_idx1` (`category`),
  CONSTRAINT `fk_news_categories1` FOREIGN KEY (`category`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Pidgy22','pokemon22','Documents/Img/pika.jps223',0,NULL,'2021-07-03',2),(2,'Hulk','marvels','Documents/Img/hulk.jps',0,NULL,'2021-07-03',1);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organization`
--

DROP TABLE IF EXISTS `organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organization` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(55) NOT NULL,
  `image` varchar(500) NOT NULL,
  `address` varchar(55) DEFAULT NULL,
  `phone` varchar(55) DEFAULT NULL,
  `email` varchar(55) NOT NULL,
  `welcometext` varchar(55) NOT NULL,
  `aboutustext` varchar(45) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `edited_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organization`
--

LOCK TABLES `organization` WRITE;
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` VALUES (1,'Lepe','/Documents/images/lepe.jpg','perito123','26154','lepe@gmail.com','Bienvenido',NULL,0,NULL,NULL),(2,'Envi','/Documents/images/envi.jpg','sanch 546','26154','envi@gmail.com','Bienvenido',NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `created_date` date DEFAULT NULL,
  `edited_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `roleName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'ROLE_USER',NULL,NULL,NULL,0,'ROLE_USER'),(2,'ROLE_ADMIN',NULL,NULL,NULL,0,'ROLE_ADMIN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` varchar(500) NOT NULL,
  `deleted` tinyint DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `date_edited` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'apolo','http://www.apolo.com.png','habia una ves un apolo en march47',1,NULL,NULL),(3,'apolo','http://www.apolo.com.png','habia una ves un apolo en march47',1,NULL,NULL),(4,'apolo','http://www.apolo.com.png','habia una ves un apolo en march47',1,NULL,NULL),(5,'apolo','http://www.apolo.com.png','habia una ves un apolo en march47',1,NULL,NULL),(6,'leo','/Documents/image/ale.jpg','Buen jugador',0,NULL,NULL),(7,'batman','http://www.batman.com.png','habia una ves un batman en march47',0,NULL,NULL),(8,'batman','http://www.batman.com.png','habia una ves un batman en march47',0,NULL,NULL),(9,'batman','http://www.batman.com.png','habia una ves un batman en march47',0,NULL,NULL),(10,'Navidad','http://www.papanoel.com.png','Papa Noes paseo por todo el reino',0,NULL,NULL),(11,'','http://www.papanoel.com.png','Papa Noes paseo por todo el reino',0,NULL,NULL),(12,'null','http://www.papanoel.com.png','Papa Noes paseo por todo el reino',0,NULL,NULL),(13,'','http://www.papanoel.com.png','Papa Noes paseo por todo el reino',0,NULL,NULL),(14,'','http://www.papanoel.com.png','Papa Noes paseo por todo el reino',0,NULL,NULL),(15,'','http://www.papanoel.com.png','Papa Noes paseo por todo el reino',0,NULL,NULL),(16,'','','',0,NULL,NULL),(17,'oscar','/Documents/image/oscar.jpg','una gran persona',NULL,'2021-07-09',NULL),(18,'oscar','/Documents/image/oscar.jpg','una gran persona',0,NULL,NULL),(19,'oscar','/Documents/image/oscar.jpg','una gran persona',0,'2021-07-09',NULL),(20,'oscar','/Documents/image/oscar.jpg','una gran persona',0,'2021-07-09',NULL),(21,'oscar','/Documents/image/oscar.jpg','una gran persona',0,'2021-07-09',NULL),(22,'oscar','/Documents/image/oscar.jpg','una gran persona',0,'2021-07-09',NULL),(23,'oscar','/Documents/image/oscar.jpg','una gran persona',0,NULL,NULL),(24,'oscar','/Documents/image/oscar.jpg','una gran persona',0,'2021-07-09',NULL),(25,'oscar','/Documents/image/oscar.jpg','una gran persona',0,'2021-07-09',NULL),(26,'raul','/Documents/image/oscar.jpg','una gran persona',0,'2021-07-09',NULL),(27,'ale','/Documents/image/ale.jpg','una gran persona',0,'2021-07-09',NULL),(28,'ale','/Documents/image/ale.jpg','una gran persona',0,'2021-07-09',NULL),(29,'ale','/Documents/image/ale.jpg','una gran persona',0,'2021-07-09',NULL),(30,'ale','/Documents/image/ale.jpg','una gran persona',0,'2021-07-09',NULL),(31,'marce','/Documents/image/ale.jpg','una gran persona',0,'2021-07-09',NULL),(32,'12','/Documents/image/ale.jpg','una gran persona',0,'2021-07-09',NULL),(33,'river','/Documents/image/ale.jpg','una gran persona',0,'2021-07-09',NULL),(34,'leo','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(35,'leo','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(36,'leo','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(37,'leo','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(38,'leo','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(39,'leo','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(40,'fede','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(41,'mart','/Documents/image/ale.jpg','Buen jugador',0,'2021-07-09',NULL),(42,'Martin','/Documents/image/ale.jpg','Contenido de MArtin',0,'2021-07-09',NULL),(43,'Changuito','/Documents/image/ale.jpg','Contenido de Changuito',0,'2021-07-09',NULL),(44,'Changuito','/Documents/image/ale.jpg','Contenido de Changuito',NULL,'2021-07-09',NULL),(45,'Matias','/Documents/image/Matias.jpg','Contenido de Matias',NULL,'2021-07-09',NULL),(46,'Matias','/Documents/image/Matias.jpg','Contenido de Matias',0,'2021-07-09',NULL),(47,'Fabry','/Documents/image/Matias.jpg','Contenido de Matias',NULL,'2021-07-09',NULL),(48,'Ignacio','/Documents/image/Matias.jpg','Contenido de Matias',NULL,'2021-07-09',NULL),(49,'flor','/Documents/image/Matias.jpg','Contenido de Matias',NULL,'2021-07-09',NULL),(50,'flor','/Documents/image/Matias.jpg','Contenido de Matias',NULL,'2021-07-09',NULL),(51,'flor','/Documents/image/Matias.jpg','Contenido de Matias',NULL,'2021-07-09',NULL),(52,'flor','/Documents/image/Matias.jpg','Contenido de Matias',0,'2021-07-09',NULL),(53,'fdfdf','','fghfghg',0,'2021-07-09',NULL);
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `fk_users_has_roles_roles1_idx` (`role_id`),
  KEY `fk_users_has_roles_users_idx` (`user_id`),
  CONSTRAINT `fk_users_has_roles_roles1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `fk_users_has_roles_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,1),(3,1),(4,1),(8,1),(9,1),(10,1),(11,1),(33,1),(34,1),(35,1),(1,2),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(500) NOT NULL,
  `photo` varchar(45) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `edited_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'rody','emma','r@gmai.com','{noop}15039022',NULL,NULL,NULL,0),(2,'Juan','emma22','ro@gmai.com','15039022',NULL,NULL,NULL,0),(3,'maxi','emma22s','rodsd@gmai.com','15039022',NULL,NULL,NULL,0),(4,'maxidsds','emma22dsdss','rods@gmai.com','$2a$10$pyih47UKcH3p3Ho4a2sooeFlVrTbF1p/nF5WJqeAWba9m16bj7YQi',NULL,NULL,NULL,0),(8,'administrador','sdss','admins@gmai.com','$2a$10$KN5dS4UnA1h0e8iDv.ZNKe1MAeDQZ.HxXrKg6RL2SC7iIhpJNysLy',NULL,NULL,NULL,0),(9,'adminadmin','sdssdsd','admintelecom@gmai.com','$2a$10$lt9/J9tBo6f4Md/Rn3v9eeTmyGp2H8Ua3dqkGpZEKh4GTLTwjAbDC',NULL,NULL,NULL,0),(10,'debecambiar','sdssdsd','admintelm@gmai.com','$2a$10$im7CsH/dxVKVO324fmAyCe0.3lR..uOwfCZOPf8epHnugy24BcyCu',NULL,NULL,NULL,0),(11,'debefdfdcamar','sdssdsd','admidftelm@gmai.com','$2a$10$OmTg2ptaWuPDuEJ0beexfeBEUXC9vvLrvw3/otBM/kcHgFU8/UZAW',NULL,NULL,NULL,0),(12,'gfdgdf','sdssdsd','rfdfd@gmai.com','$2a$10$s9q7kku7Lqgt/4nfb3URW.NXHC5nzr/.iOV6KeR2JTupFNu8XkXgy',NULL,NULL,NULL,0),(13,'fdfd','sdssdsd','rfdfdfdfd@gmai.com','$2a$10$gb6x1TwCqM8PrBE/ytZii.YTvnaLcdr3S25wDgSLc5YUzybdkOLnq',NULL,NULL,NULL,0),(14,'fssddsdfd','sdssdsd','rfdfdfdfdffdfd@gmai.com','$2a$10$5GXIKUb5fe98Qb4YfNITtOqfvg6y9hb.Z/itwo7j6G1CQF0oG39FK',NULL,NULL,NULL,0),(15,'vcvcv ','sdssdsd','rfdfdfdfdfghghgfdfd@gmai.com','$2a$10$RKdTXe0gQ4ueQlAiLyzpG.UUxTQIKj/ZpXz0OtzPmQIvX5KrPzxw.',NULL,NULL,NULL,0),(16,'rerer','sdssdsd','rfdfdfdfdfsdsdsdghghgfdfd@gmai.com','$2a$10$hEclAQ.oKzuZq8pHbkm.fujyg.1zsQrWHnBUsZf7Wo1kFJgal2Lmu',NULL,NULL,NULL,0),(17,'gfgf','sdssdsd','gfgfgfg@fd','$2a$10$IQ3mukGsqn.Kw/MbqStd9ueYxLYZiCmhmdIKDbddl9euRhhiB2PCi',NULL,NULL,NULL,0),(18,'fdfd','sdssdsd','rfdfdfdfdfsdsdsdgdasahghgfdfd@gmai.com','$2a$10$ssiHMIqLgdcAH8HvV6NSfuHlFvrZR3cosSWFL8fmxeO5dPgWhM35.',NULL,NULL,NULL,0),(19,'hghghg','sdssdsd','rfdfdfdfdfdfdfdfsdsdsdgdasahghgfdfd@gmai.com','$2a$10$u/yZtpOcvT09O6Ag9jvreu/ozAHThB/EI8KtlmLpw2.aq/HX0WQKa',NULL,NULL,NULL,0),(20,'','','rlklklkld@gmai.com','$2a$10$QI5OFM9gJxMTaCPUYexArOsJM93Ku.gneHZUPjV6kNm6549qI.7ee',NULL,NULL,NULL,0),(21,'','','rlklklkld@gmai.com','$2a$10$1SjlbyC6t.7gR/g45WxuXO2xZbR93/tVlXpCfRbUEyG1AzByjzIZK',NULL,NULL,NULL,0),(22,'fdf','dfdf','rld@gmai.com','$2a$10$u1vQUdxt1uYRTbsxfdUkYOqIoEbyog0eQbiDy3HBJmliKLeVGSOFO',NULL,'2021-06-28',NULL,0),(23,'dfd','fd','rlksslklkld@gmai.com','$2a$10$7jFcLNpknu4WPQtLid9vnephUdW4MKAiFdynydIFYCA7MLxcqElDq',NULL,'2021-06-28',NULL,0),(24,'comprobatr','ahora','andakld@gmai.com','$2a$10$oqL3RNPnXsoxuaj6cG3iD.CYgsEyZw34Fh92wTVh/w/N6IM/sAgqq',NULL,'2021-06-28',NULL,0),(25,'comprobghgatr','ahora','andghakld@gmai.com','$2a$10$DaqFaNlmcxJXldXhITH36umPBUW6578jxGAHeMV5.R.Q7GVoc.Q6q',NULL,'2021-06-28',NULL,0),(26,'comhgr','ahorga','anfkld@gmai.com','$2a$10$p1lHl9iMOxiogZy05aXFZ.0CxICXAONUuGlRXWEnFbS455t7uKQie',NULL,'2021-06-28',NULL,0),(30,'dsdsfdffd','dfdffd','rlkfdsfdslklkld@gmai.com','$2a$10$HenpdzY6H54LrDc0tTL8a.OO.M0SV0Q6hD61ranKoe2/NbMgEbvw.',NULL,'2021-06-28',NULL,0),(33,'otra maasd','dfdffd','rlhaaaaakld@gmai.com','$2a$10$zgG.4/0uedhcFHqN8sBawO0oLGQJ0fnmxCSTj36XC1Lc0NDuR69PS',NULL,'2021-06-28',NULL,0),(34,'defnitivo','sdsfgfds','vamosnoma@gmai.com','$2a$10$ifxiZHqcCUrzk4cMK//.TOWhv17KjhmbmYEz4xG.RKQ6CHuJCpd6O',NULL,'2021-06-30',NULL,0),(35,'json ','jsonds','vamossonma@gmai.com','$2a$10$ZBoPwJyQQiDnywhakFB0kOTHI4FpgKDprNxy4o8lTkc5Jwobvbf/.',NULL,'2021-07-02',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-04  0:54:19
