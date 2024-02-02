-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: dentalexperience
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add contact',7,'add_contact'),(26,'Can change contact',7,'change_contact'),(27,'Can delete contact',7,'delete_contact'),(28,'Can view contact',7,'view_contact'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add category',9,'add_category'),(34,'Can change category',9,'change_category'),(35,'Can delete category',9,'delete_category'),(36,'Can view category',9,'view_category'),(37,'Can add page',10,'add_page'),(38,'Can change page',10,'change_page'),(39,'Can delete page',10,'delete_page'),(40,'Can view page',10,'view_page'),(41,'Can add tag',11,'add_tag'),(42,'Can change tag',11,'change_tag'),(43,'Can delete tag',11,'delete_tag'),(44,'Can view tag',11,'view_tag'),(45,'Can add post',12,'add_post'),(46,'Can change post',12,'change_post'),(47,'Can delete post',12,'delete_post'),(48,'Can view post',12,'view_post'),(49,'Can add comment',13,'add_comment'),(50,'Can change comment',13,'change_comment'),(51,'Can delete comment',13,'delete_comment'),(52,'Can view comment',13,'view_comment'),(53,'Can add category',14,'add_category'),(54,'Can change category',14,'change_category'),(55,'Can delete category',14,'delete_category'),(56,'Can view category',14,'view_category'),(57,'Can add page',15,'add_page'),(58,'Can change page',15,'change_page'),(59,'Can delete page',15,'delete_page'),(60,'Can view page',15,'view_page'),(61,'Can add tag',16,'add_tag'),(62,'Can change tag',16,'change_tag'),(63,'Can delete tag',16,'delete_tag'),(64,'Can view tag',16,'view_tag'),(65,'Can add post',17,'add_post'),(66,'Can change post',17,'change_post'),(67,'Can delete post',17,'delete_post'),(68,'Can view post',17,'view_post'),(69,'Can add comment',18,'add_comment'),(70,'Can change comment',18,'change_comment'),(71,'Can delete comment',18,'delete_comment'),(72,'Can view comment',18,'view_comment'),(73,'Can add call to action',19,'add_calltoaction'),(74,'Can change call to action',19,'change_calltoaction'),(75,'Can delete call to action',19,'delete_calltoaction'),(76,'Can view call to action',19,'view_calltoaction'),(77,'Can add page enabled',20,'add_pageenabled'),(78,'Can change page enabled',20,'change_pageenabled'),(79,'Can delete page enabled',20,'delete_pageenabled'),(80,'Can view page enabled',20,'view_pageenabled'),(81,'Can add section enabled',21,'add_sectionenabled'),(82,'Can change section enabled',21,'change_sectionenabled'),(83,'Can delete section enabled',21,'delete_sectionenabled'),(84,'Can view section enabled',21,'view_sectionenabled'),(85,'Can add section selection',22,'add_sectionselection'),(86,'Can change section selection',22,'change_sectionselection'),(87,'Can delete section selection',22,'delete_sectionselection'),(88,'Can view section selection',22,'view_sectionselection'),(89,'Can add hero',23,'add_hero'),(90,'Can change hero',23,'change_hero'),(91,'Can delete hero',23,'delete_hero'),(92,'Can view hero',23,'view_hero'),(93,'Can add header',24,'add_header'),(94,'Can change header',24,'change_header'),(95,'Can delete header',24,'delete_header'),(96,'Can view header',24,'view_header');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$1a4qxPJSukGvH1Ve5YNCs2$FBPgmafpqvHI59FsnQbM4iP2AiDIqVet3gdUzbdbNSE=','2024-01-14 01:11:47.955420',1,'martin','','','martinpolicichio@yahoo.com.ar',1,1,'2024-01-12 17:31:21.363112'),(2,'pbkdf2_sha256$600000$oir3XPbzsZQyqD9PtiLNcf$eAVXZZU9p6ufokrI86h/G6A/JR27R65MHZ11BHeHN40=','2024-01-12 21:06:05.659945',1,'mateo','','','mateopolicichio@gmail.com',1,1,'2024-01-12 17:32:11.313434');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_contact`
--

DROP TABLE IF EXISTS `base_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_contact` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `mensaje` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_contact`
--

LOCK TABLES `base_contact` WRITE;
/*!40000 ALTER TABLE `base_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `base_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_header`
--

DROP TABLE IF EXISTS `base_header`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_header` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logo_image` varchar(100) DEFAULT NULL,
  `logo_text` varchar(255) NOT NULL,
  `is_getstarted_enabled` tinyint(1) NOT NULL,
  `getstarted_link2section` varchar(255) NOT NULL,
  `getstarted_text` varchar(255) NOT NULL,
  `is_whatsapp_enabled` tinyint(1) NOT NULL,
  `whats_number` varchar(20) DEFAULT NULL,
  `whats_message` varchar(255) NOT NULL,
  `whats_btn_text` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_header`
--

LOCK TABLES `base_header` WRITE;
/*!40000 ALTER TABLE `base_header` DISABLE KEYS */;
INSERT INTO `base_header` VALUES (1,'images/header/logo_solo.png','<div class=\"d-flex flex-column\"><h1 class=\"no-margin\">Dental</h1><h2 class=\"no-margin\">EXPERIENCE</h2></div>',0,'nosotros','Comenzar',1,'529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','Contáctanos');
/*!40000 ALTER TABLE `base_header` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calltoaction_calltoaction`
--

DROP TABLE IF EXISTS `calltoaction_calltoaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calltoaction_calltoaction` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `whatsapp_number` varchar(20) DEFAULT NULL,
  `whatsapp_message` longtext,
  `btn_text` varchar(50) NOT NULL,
  `background_image` varchar(100) DEFAULT NULL,
  `is_mainpage_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calltoaction_calltoaction`
--

LOCK TABLES `calltoaction_calltoaction` WRITE;
/*!40000 ALTER TABLE `calltoaction_calltoaction` DISABLE KEYS */;
INSERT INTO `calltoaction_calltoaction` VALUES (1,'¡Sonríe con Confianza!','Tu salud bucal es nuestra prioridad.','529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','¡Háblanos Ahora!','images/promociones/call2action/slider-todos-4-min.jpg',1),(2,'¡Transforma tu Sonrisa Hoy!','Descubre el poder de una transformación dental radiante.','529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','¡Agenda tu cita!','images/promociones/call2action/pexels-anna-shvets-3845548.jpg',1),(3,'¡Descubre la Excelencia Odontológica!','Experimenta la excelencia en cuidado odontológico con nuestro equipo de profesionales.','529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','Agenda tu cita','images/promociones/call2action/cancun-dental-experience-min_QVqjXmc.jpg',1);
/*!40000 ALTER TABLE `calltoaction_calltoaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-01-12 21:09:49.104010','1','hero',1,'[{\"added\": {}}]',21,2),(2,'2024-01-12 21:10:26.121757','2','main - nosotros',1,'[{\"added\": {}}]',21,2),(3,'2024-01-12 21:10:41.753480','3','calltoaction',1,'[{\"added\": {}}]',21,2),(4,'2024-01-12 21:11:13.147500','4','servicios - listado',1,'[{\"added\": {}}]',21,2),(5,'2024-01-12 21:11:42.480354','5','main - contacto',1,'[{\"added\": {}}]',21,2),(6,'2024-01-12 21:12:11.843923','6','main - preguntas frecuentes',1,'[{\"added\": {}}]',21,2),(7,'2024-01-12 21:12:29.488179','7','main - distintivos',1,'[{\"added\": {}}]',21,2),(8,'2024-01-12 21:12:52.549102','8','main - experiencia',1,'[{\"added\": {}}]',21,2),(9,'2024-01-12 21:13:05.831311','9','main - equipo',1,'[{\"added\": {}}]',21,2),(10,'2024-01-12 21:13:26.671231','10','promociones - listado',1,'[{\"added\": {}}]',21,2),(11,'2024-01-12 21:13:37.581105','11','main - testimonios',1,'[{\"added\": {}}]',21,2),(12,'2024-01-12 21:14:26.235604','12','main - estadísticas',1,'[{\"added\": {}}]',21,2),(13,'2024-01-12 21:15:13.500700','1','base - mainpage',1,'[{\"added\": {}}]',20,2),(14,'2024-01-12 21:15:37.164156','2','servicios - listado',1,'[{\"added\": {}}]',20,2),(15,'2024-01-12 21:15:44.291397','3','servicios - detalle',1,'[{\"added\": {}}]',20,2),(16,'2024-01-12 21:15:55.377415','4','promociones - listado',1,'[{\"added\": {}}]',20,2),(17,'2024-01-12 21:16:08.704119','5','promociones - detalle',1,'[{\"added\": {}}]',20,2),(18,'2024-01-12 21:16:42.361877','1','SectionSelection object (1)',1,'[{\"added\": {}}]',22,2),(19,'2024-01-12 21:17:14.565761','2','SectionSelection object (2)',1,'[{\"added\": {}}]',22,2),(20,'2024-01-12 21:17:32.218184','3','SectionSelection object (3)',1,'[{\"added\": {}}]',22,2),(21,'2024-01-12 21:17:52.391090','4','SectionSelection object (4)',1,'[{\"added\": {}}]',22,2),(22,'2024-01-12 21:18:23.640738','5','SectionSelection object (5)',1,'[{\"added\": {}}]',22,2),(23,'2024-01-12 21:20:13.134118','6','SectionSelection object (6)',1,'[{\"added\": {}}]',22,2),(24,'2024-01-12 21:20:24.344059','7','SectionSelection object (7)',1,'[{\"added\": {}}]',22,2),(25,'2024-01-12 21:20:38.459161','8','SectionSelection object (8)',1,'[{\"added\": {}}]',22,2),(26,'2024-01-12 21:23:03.388393','9','SectionSelection object (9)',1,'[{\"added\": {}}]',22,2),(27,'2024-01-12 21:23:32.189860','10','SectionSelection object (10)',1,'[{\"added\": {}}]',22,2),(28,'2024-01-12 21:23:52.321042','11','SectionSelection object (11)',1,'[{\"added\": {}}]',22,2),(29,'2024-01-12 21:26:36.935267','12','SectionSelection object (12)',1,'[{\"added\": {}}]',22,2),(30,'2024-01-12 21:26:53.350532','13','SectionSelection object (13)',1,'[{\"added\": {}}]',22,2),(31,'2024-01-12 21:27:17.417309','14','SectionSelection object (14)',1,'[{\"added\": {}}]',22,2),(32,'2024-01-12 21:27:28.341990','15','SectionSelection object (15)',1,'[{\"added\": {}}]',22,2),(33,'2024-01-12 21:27:44.705792','16','SectionSelection object (16)',1,'[{\"added\": {}}]',22,2),(34,'2024-01-12 21:27:54.872587','17','SectionSelection object (17)',1,'[{\"added\": {}}]',22,2),(35,'2024-01-12 21:47:07.025665','1','La Mejor Opcion para Ti.',1,'[{\"added\": {}}]',23,2),(36,'2024-01-13 20:12:15.732833','1','La Mejor Opcion para Ti.',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',23,2),(37,'2024-01-13 20:16:55.273303','1','La Mejor Opcion para Ti.',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',23,2),(38,'2024-01-13 20:28:55.514324','2','Sonríe con Confianza en Cancún',1,'[{\"added\": {}}]',23,2),(39,'2024-01-13 20:29:11.349224','2','Sonríe con Confianza en Cancún',2,'[{\"changed\": {\"fields\": [\"Is whatsapp enabled\"]}}]',23,2),(40,'2024-01-13 20:34:23.404021','3','Expertos en sonrisas',1,'[{\"added\": {}}]',23,2),(41,'2024-01-13 20:37:38.176205','4','Descubre la Excelencia Odontológica en Cancún',1,'[{\"added\": {}}]',23,2),(42,'2024-01-13 20:38:49.124860','1','La Mejor Opcion para Ti',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\"]}}]',23,2),(43,'2024-01-13 20:43:40.035204','1','La Mejor Opcion para Ti',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',23,2),(44,'2024-01-13 22:31:09.206504','1','La Mejor Opcion para Ti',2,'[{\"changed\": {\"fields\": [\"Whats number\"]}}]',23,2),(45,'2024-01-13 22:32:40.182511','2','Sonríe con Confianza en Cancún',2,'[{\"changed\": {\"fields\": [\"Whats number\"]}}]',23,2),(46,'2024-01-13 22:32:48.534377','3','Expertos en sonrisas',2,'[{\"changed\": {\"fields\": [\"Whats number\"]}}]',23,2),(47,'2024-01-13 22:46:02.292474','4','Descubre la Excelencia Odontológica en Cancún',2,'[{\"changed\": {\"fields\": [\"Whats number\"]}}]',23,2),(48,'2024-01-13 22:54:56.065931','3','SectionSelection object (3)',2,'[{\"changed\": {\"fields\": [\"Nav enabled\"]}}]',22,2),(49,'2024-01-13 22:55:02.622998','4','SectionSelection object (4)',2,'[{\"changed\": {\"fields\": [\"Nav enabled\"]}}]',22,2),(50,'2024-01-13 22:55:27.077550','4','SectionSelection object (4)',2,'[{\"changed\": {\"fields\": [\"Nav enabled\"]}}]',22,2),(51,'2024-01-13 22:55:33.299555','3','SectionSelection object (3)',2,'[]',22,2),(52,'2024-01-13 22:55:38.787517','3','SectionSelection object (3)',2,'[{\"changed\": {\"fields\": [\"Nav enabled\"]}}]',22,2),(53,'2024-01-13 23:07:49.991582','1','Sonríe con Confianza',1,'[{\"added\": {}}]',19,2),(54,'2024-01-13 23:10:43.528720','1','¡Sonríe con Confianza!',2,'[{\"changed\": {\"fields\": [\"Title\", \"Whatsapp message\", \"Background image\"]}}]',19,2),(55,'2024-01-13 23:11:16.850910','1','¡Sonríe con Confianza!',2,'[{\"changed\": {\"fields\": [\"Is mainpage enabled\"]}}]',19,2),(56,'2024-01-13 23:17:57.620808','1','¡Sonríe con Confianza!',2,'[]',19,2),(57,'2024-01-14 15:38:32.556004','1','¡Sonríe con Confianza!',2,'[]',19,2),(58,'2024-01-14 15:43:28.064271','2','Tu Salud Bucal es Nuestra Prioridad',1,'[{\"added\": {}}]',19,2),(59,'2024-01-14 15:44:37.843971','2','¡Transforma tu Sonrisa Hoy!',2,'[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Btn text\", \"Background image\", \"Is mainpage enabled\"]}}]',19,2),(60,'2024-01-14 15:44:57.892344','2','¡Transforma tu Sonrisa Hoy!',2,'[{\"changed\": {\"fields\": [\"Whatsapp number\"]}}]',19,2),(61,'2024-01-14 15:48:47.897019','1','La Mejor Opcion para Ti',2,'[]',23,2),(62,'2024-01-14 15:50:11.074802','2','Sonríe con Confianza en Cancún',2,'[]',23,2),(63,'2024-01-14 15:51:07.276844','1','La Mejor Opción para Ti',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',23,2),(64,'2024-01-14 15:51:09.572536','1','La Mejor Opción para Ti',2,'[]',23,2),(65,'2024-01-14 15:51:18.929398','3','Expertos en Sonrisas',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',23,2),(66,'2024-01-14 15:52:03.883726','3','Expertos en Sonrisas',2,'[]',23,2),(67,'2024-01-14 15:54:50.238416','4','Descubre la Excelencia Odontológica en Cancún',2,'[]',23,2),(68,'2024-01-14 17:34:08.603298','3','¡Descubre la Excelencia Odontológica!',1,'[{\"added\": {}}]',19,2),(69,'2024-01-14 17:34:16.724226','1','¡Sonríe con Confianza!',2,'[]',19,2),(70,'2024-01-14 17:34:24.656991','2','¡Transforma tu Sonrisa Hoy!',2,'[{\"changed\": {\"fields\": [\"Whatsapp message\"]}}]',19,2),(71,'2024-01-14 17:34:33.642270','3','¡Descubre la Excelencia Odontológica!',2,'[{\"changed\": {\"fields\": [\"Whatsapp message\"]}}]',19,2),(72,'2024-01-14 17:34:38.134546','2','¡Transforma tu Sonrisa Hoy!',2,'[]',19,2),(73,'2024-01-14 17:34:57.544546','3','¡Descubre la Excelencia Odontológica!',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',19,2),(74,'2024-01-14 17:36:08.170339','3','¡Descubre la Excelencia Odontológica!',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',19,2),(75,'2024-01-14 17:37:38.119082','2','¡Transforma tu Sonrisa Hoy!',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',19,2),(76,'2024-01-14 17:38:19.672448','2','¡Transforma tu Sonrisa Hoy!',2,'[]',19,2),(77,'2024-01-14 17:42:21.211590','2','¡Transforma tu Sonrisa Hoy!',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',19,2),(78,'2024-01-14 18:07:22.075150','1','Especialidades',1,'[{\"added\": {}}]',15,2),(79,'2024-01-14 18:21:13.236607','1','Ortodoncia | mateo',1,'[{\"added\": {}}]',17,2),(80,'2024-01-14 18:21:51.684956','1','Ortodoncia | mateo',2,'[{\"changed\": {\"fields\": [\"Header image\"]}}]',17,2),(81,'2024-01-14 18:48:44.942804','2','Periodoncia | mateo',1,'[{\"added\": {}}]',17,2),(82,'2024-01-14 18:50:18.735691','3','Endodoncia | mateo',1,'[{\"added\": {}}]',17,2),(83,'2024-01-14 18:52:02.251047','4','Implantología | mateo',1,'[{\"added\": {}}]',17,2),(84,'2024-01-14 18:52:19.130985','4','Implantología | mateo',2,'[]',17,2),(85,'2024-01-14 18:56:31.350514','5','Cirugía Maxilofacial | mateo',1,'[{\"added\": {}}]',17,2),(86,'2024-01-14 18:57:52.517459','6','Prótesis | mateo',1,'[{\"added\": {}}]',17,2),(87,'2024-01-14 18:59:12.199639','7','Odontopediatría | mateo',1,'[{\"added\": {}}]',17,2),(88,'2024-01-14 19:58:59.271876','1','Header',1,'[{\"added\": {}}]',24,2),(89,'2024-01-14 21:08:39.430249','8','SectionSelection object (8)',3,'',22,2),(90,'2024-01-14 21:10:52.752944','6','SectionSelection object (6)',3,'',22,2),(91,'2024-01-14 21:11:59.851486','10','SectionSelection object (10)',3,'',22,2),(92,'2024-01-14 21:25:16.804472','7','SectionSelection object (7)',3,'',22,2),(93,'2024-01-16 17:19:01.406805','3','SectionSelection object (3)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(94,'2024-01-16 17:19:13.732608','2','SectionSelection object (2)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(95,'2024-01-16 17:19:20.472825','5','SectionSelection object (5)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(96,'2024-01-16 17:19:28.757751','4','SectionSelection object (4)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(97,'2024-01-16 17:21:03.790683','4','Descubre la Excelencia Odontológica en Cancún',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',23,2),(98,'2024-01-16 17:22:58.073845','2','¡Transforma tu Sonrisa Hoy!',2,'[{\"changed\": {\"fields\": [\"Background image\"]}}]',19,2),(99,'2024-01-16 18:37:14.948874','1','La Mejor Opción para Ti',2,'[{\"changed\": {\"fields\": [\"Is enabled\"]}}]',23,2),(100,'2024-01-16 18:37:22.804123','4','Descubre la Excelencia Odontológica en Cancún',2,'[{\"changed\": {\"fields\": [\"Is enabled\"]}}]',23,2),(101,'2024-01-16 18:38:54.011154','18','SectionSelection object (18)',1,'[{\"added\": {}}]',22,2),(102,'2024-01-16 18:39:01.513392','9','SectionSelection object (9)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(103,'2024-01-16 18:39:06.361754','18','SectionSelection object (18)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(104,'2024-01-16 18:39:40.759897','18','SectionSelection object (18)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(105,'2024-01-16 18:39:46.293518','9','SectionSelection object (9)',2,'[{\"changed\": {\"fields\": [\"Sort order\"]}}]',22,2),(106,'2024-01-16 18:39:53.578989','18','SectionSelection object (18)',2,'[{\"changed\": {\"fields\": [\"Is visible\"]}}]',22,2),(107,'2024-01-17 18:44:38.094449','2','SectionSelection object (2)',2,'[{\"changed\": {\"fields\": [\"Nav enabled\"]}}]',22,2),(108,'2024-01-17 18:45:29.579002','4','servicios - listado',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(109,'2024-01-17 18:45:55.606332','1','Tratamientos',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',15,2),(110,'2024-01-17 18:46:46.805299','11','SectionSelection object (11)',2,'[{\"changed\": {\"fields\": [\"Nav enabled\"]}}]',22,2),(111,'2024-01-17 19:29:41.438684','1','SectionSelection object (1)',2,'[{\"changed\": {\"fields\": [\"Nav enabled\"]}}]',22,2),(112,'2024-01-17 19:29:56.916015','1','hero',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',21,2),(113,'2024-01-17 20:27:07.054087','2','Tratamientos',1,'[{\"added\": {}}]',15,2),(114,'2024-01-17 20:28:17.070557','1','Tratamientos',2,'[{\"changed\": {\"fields\": [\"Is enabled\"]}}]',15,2),(115,'2024-01-17 20:30:02.172028','1','uasduaofuad | mateo',1,'[{\"added\": {}}]',12,2),(116,'2024-01-17 20:31:01.990947','1','Promociones',1,'[{\"added\": {}}]',10,2),(117,'2024-01-17 20:50:37.735731','2','Tratamientos',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',15,2),(118,'2024-01-17 22:50:09.649948','1','Promociones',2,'[{\"changed\": {\"fields\": [\"Description\"]}}]',10,2),(119,'2024-01-17 22:53:24.633446','1','Sonrisa Radiante | mateo',2,'[{\"changed\": {\"fields\": [\"Title\", \"Header image\", \"Body\", \"Snippet\"]}}]',12,2),(120,'2024-01-25 18:00:17.374991','5','Cirugías | mateo',2,'[{\"changed\": {\"fields\": [\"Title\", \"Title tag\"]}}]',17,2),(121,'2024-01-25 18:00:41.982681','8','Limpiezas | mateo',1,'[{\"added\": {}}]',17,2),(122,'2024-01-25 18:02:10.992266','9','Resinas | mateo',1,'[{\"added\": {}}]',17,2),(123,'2024-01-25 18:02:20.062540','7','Odontopediatría | mateo',2,'[{\"changed\": {\"fields\": [\"Is visible\"]}}]',17,2),(124,'2024-01-25 18:02:32.384435','2','Periodoncia | mateo',2,'[{\"changed\": {\"fields\": [\"Is visible\"]}}]',17,2),(125,'2024-01-25 18:02:51.293446','4','Implantología | mateo',2,'[{\"changed\": {\"fields\": [\"Is visible\"]}}]',17,2),(126,'2024-01-25 18:03:29.627430','6','Prótesis | mateo',2,'[{\"changed\": {\"fields\": [\"Is visible\"]}}]',17,2),(127,'2024-01-25 18:03:57.458353','10','Blanqueamientos | mateo',1,'[{\"added\": {}}]',17,2),(128,'2024-01-25 18:10:53.261461','8','Limpiezas | mateo',2,'[{\"changed\": {\"fields\": [\"Header image\"]}}]',17,2),(129,'2024-01-25 18:14:12.948238','9','Resinas | mateo',2,'[{\"changed\": {\"fields\": [\"Header image\"]}}]',17,2),(130,'2024-01-25 18:20:45.119771','10','Blanqueamientos | mateo',2,'[{\"changed\": {\"fields\": [\"Header image\"]}}]',17,2),(131,'2024-01-25 18:30:58.415992','3','servicios - detalle',2,'[]',20,2),(132,'2024-01-25 18:31:51.821074','5','promociones - detalle',2,'[]',20,2),(133,'2024-01-25 18:32:12.360667','15','SectionSelection object (15)',2,'[]',22,2);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'base','contact'),(24,'base','header'),(19,'calltoaction','calltoaction'),(5,'contenttypes','contenttype'),(23,'hero','hero'),(8,'members','profile'),(9,'promociones','category'),(13,'promociones','comment'),(10,'promociones','page'),(12,'promociones','post'),(11,'promociones','tag'),(20,'sectionselection','pageenabled'),(21,'sectionselection','sectionenabled'),(22,'sectionselection','sectionselection'),(14,'services','category'),(18,'services','comment'),(15,'services','page'),(17,'services','post'),(16,'services','tag'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-01-12 16:55:09.276170'),(2,'auth','0001_initial','2024-01-12 16:55:47.506496'),(3,'admin','0001_initial','2024-01-12 16:55:53.176168'),(4,'admin','0002_logentry_remove_auto_add','2024-01-12 16:55:54.103464'),(5,'admin','0003_logentry_add_action_flag_choices','2024-01-12 16:55:54.230200'),(6,'contenttypes','0002_remove_content_type_name','2024-01-12 16:55:57.155717'),(7,'auth','0002_alter_permission_name_max_length','2024-01-12 16:55:58.959595'),(8,'auth','0003_alter_user_email_max_length','2024-01-12 16:55:59.199234'),(9,'auth','0004_alter_user_username_opts','2024-01-12 16:55:59.300242'),(10,'auth','0005_alter_user_last_login_null','2024-01-12 16:56:01.156291'),(11,'auth','0006_require_contenttypes_0002','2024-01-12 16:56:01.494001'),(12,'auth','0007_alter_validators_add_error_messages','2024-01-12 16:56:02.679620'),(13,'auth','0008_alter_user_username_max_length','2024-01-12 16:56:04.517648'),(14,'auth','0009_alter_user_last_name_max_length','2024-01-12 16:56:06.870953'),(15,'auth','0010_alter_group_name_max_length','2024-01-12 16:56:07.141938'),(16,'auth','0011_update_proxy_permissions','2024-01-12 16:56:07.306246'),(17,'auth','0012_alter_user_first_name_max_length','2024-01-12 16:56:09.730281'),(18,'base','0001_initial','2024-01-12 16:56:10.546110'),(19,'calltoaction','0001_initial','2024-01-12 16:56:11.416259'),(20,'hero','0001_initial','2024-01-12 16:56:13.142841'),(21,'members','0001_initial','2024-01-12 16:56:18.686026'),(22,'promociones','0001_initial','2024-01-12 16:57:03.542065'),(23,'sectionselection','0001_initial','2024-01-12 16:57:16.624008'),(24,'services','0001_initial','2024-01-12 16:57:53.361246'),(25,'sessions','0001_initial','2024-01-12 16:57:55.782734'),(26,'base','0002_header','2024-01-14 01:09:12.593996'),(27,'promociones','0002_alter_page_description','2024-01-17 20:07:53.578353'),(28,'services','0002_alter_page_description','2024-01-17 20:07:55.423761');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('m9azdqcu9xeq93l2ail0qqouhrq0mq8a','.eJxVjDsOwyAQRO9CHaE1yzdlep8BAQvBSYQlY1dR7h5bcpFUI817M2_mw7ZWv_W8-InYlQl2-e1iSM_cDkCP0O4zT3NblynyQ-En7XycKb9up_t3UEOv-1pJJJQSklAW7IBaggZRCmgnYzCk0-DsnkDOKMxgwLlgikVFiRAs-3wBo3s2iw:1rOOj7:PS3wnxvOnB7qP3thFOAuSrPVeiNZFtXIYQWWUR_XtCc','2024-01-26 21:06:05.770030'),('zt9kddumbxoiw9nby8w95qv7pg8uulk5','.eJxVjEEOwiAQRe_C2hBGoIBL9z0DmWGoVA0kpV0Z765NutDtf-_9l4i4rSVuPS9xZnERIE6_G2F65LoDvmO9NZlaXZeZ5K7Ig3Y5Ns7P6-H-HRTs5VurIfCgFPrESVvljfFKO2IA4kSaYbLoFLJzgYDQTyHos2etM1ifyYj3B9ikN8g:1rOp2S:9CthvU4BnoW_0diyZ1Z-SecxPH6dJP37qI6UuD_z1q8','2024-01-28 01:11:48.115321');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hero_hero`
--

DROP TABLE IF EXISTS `hero_hero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hero_hero` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `background_image` varchar(100) DEFAULT NULL,
  `is_form_enabled` tinyint(1) NOT NULL,
  `form_placeholder` varchar(255) NOT NULL,
  `form_value` varchar(255) NOT NULL,
  `is_whatsapp_enabled` tinyint(1) NOT NULL,
  `whats_number` varchar(20) DEFAULT NULL,
  `whats_message` varchar(255) NOT NULL,
  `whats_btn_text` varchar(255) NOT NULL,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hero_hero`
--

LOCK TABLES `hero_hero` WRITE;
/*!40000 ALTER TABLE `hero_hero` DISABLE KEYS */;
INSERT INTO `hero_hero` VALUES (1,'La Mejor Opción para Ti','Haremos que tu experiencia dental en el caribe mexicano sea la mejor.<br>Tu nuevo dentista en Cancún!','images/hero/pexels-cedric-fauntleroy-4269698_ismFt2Q.jpg',0,'Ingrese su email','Suscribirme',1,'529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','Contáctanos',0),(2,'Sonríe con Confianza en Cancún','Donde la belleza de tu sonrisa encuentra su hogar.','images/hero/pexels-cedric-fauntleroy-4269694.jpg',0,'Ingrese su email','Suscribirme',1,'529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','Contáctanos',1),(3,'Expertos en Sonrisas','Mas de 10 años creando risas inolvidables.','images/hero/pexels-polina-zimmerman-4687283.jpg',0,'Ingrese su email','Suscribirme',1,'529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','Contáctanos',1),(4,'Descubre la Excelencia Odontológica en Cancún','Tu salud bucal merece lo mejor,<br>merece Dental Experience.','images/hero/pexels-george-becker-298611.jpg',0,'Ingrese su email','Suscribirme',1,'529984899792','Hola,%20me%20gustaría%20recibir%20más%20información.%0A- Nombre:%0A- Correo:%0AEnviado%20desde%20mi%20página%20web:%20https://dentalexperience.com.mx/','Contáctanos',0);
/*!40000 ALTER TABLE `hero_hero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_profile`
--

DROP TABLE IF EXISTS `members_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `members_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bio` longtext,
  `profile_pic` varchar(100) DEFAULT NULL,
  `website_url` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `members_profile_user_id_f907d594_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members_profile`
--

LOCK TABLES `members_profile` WRITE;
/*!40000 ALTER TABLE `members_profile` DISABLE KEYS */;
/*!40000 ALTER TABLE `members_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_category`
--

DROP TABLE IF EXISTS `promociones_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_category`
--

LOCK TABLES `promociones_category` WRITE;
/*!40000 ALTER TABLE `promociones_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_comment`
--

DROP TABLE IF EXISTS `promociones_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `promociones_comment_post_id_2da3d0df_fk_promociones_post_id` (`post_id`),
  CONSTRAINT `promociones_comment_post_id_2da3d0df_fk_promociones_post_id` FOREIGN KEY (`post_id`) REFERENCES `promociones_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_comment`
--

LOCK TABLES `promociones_comment` WRITE;
/*!40000 ALTER TABLE `promociones_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_page`
--

DROP TABLE IF EXISTS `promociones_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_page`
--

LOCK TABLES `promociones_page` WRITE;
/*!40000 ALTER TABLE `promociones_page` DISABLE KEYS */;
INSERT INTO `promociones_page` VALUES (1,'Promociones','<p>Descubre nuestras <span>ofertas exclusivas</span> para impulsar tu salud bucal</p>',1);
/*!40000 ALTER TABLE `promociones_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_post`
--

DROP TABLE IF EXISTS `promociones_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `header_image` varchar(100) DEFAULT NULL,
  `title_tag` varchar(255) NOT NULL,
  `body` longtext,
  `post_date` date NOT NULL,
  `snippet` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `author_id` int NOT NULL,
  `call2action_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `promociones_post_author_id_310b7b56_fk_auth_user_id` (`author_id`),
  KEY `promociones_post_call2action_id_e66db201_fk_calltoact` (`call2action_id`),
  KEY `promociones_post_category_id_00cb5de4_fk_promociones_category_id` (`category_id`),
  CONSTRAINT `promociones_post_author_id_310b7b56_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `promociones_post_call2action_id_e66db201_fk_calltoact` FOREIGN KEY (`call2action_id`) REFERENCES `calltoaction_calltoaction` (`id`),
  CONSTRAINT `promociones_post_category_id_00cb5de4_fk_promociones_category_id` FOREIGN KEY (`category_id`) REFERENCES `promociones_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_post`
--

LOCK TABLES `promociones_post` WRITE;
/*!40000 ALTER TABLE `promociones_post` DISABLE KEYS */;
INSERT INTO `promociones_post` VALUES (1,'Sonrisa Radiante','images/promociones/img-03.jpg','Promociones','','2024-01-17','Limpieza dental + consulta gratuita.',1,1,2,1,NULL);
/*!40000 ALTER TABLE `promociones_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_post_likes`
--

DROP TABLE IF EXISTS `promociones_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_post_likes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promociones_post_likes_post_id_user_id_d1bc7827_uniq` (`post_id`,`user_id`),
  KEY `promociones_post_likes_user_id_afa38cda_fk_auth_user_id` (`user_id`),
  CONSTRAINT `promociones_post_likes_post_id_8b7cc054_fk_promociones_post_id` FOREIGN KEY (`post_id`) REFERENCES `promociones_post` (`id`),
  CONSTRAINT `promociones_post_likes_user_id_afa38cda_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_post_likes`
--

LOCK TABLES `promociones_post_likes` WRITE;
/*!40000 ALTER TABLE `promociones_post_likes` DISABLE KEYS */;
INSERT INTO `promociones_post_likes` VALUES (1,1,2);
/*!40000 ALTER TABLE `promociones_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_post_tags`
--

DROP TABLE IF EXISTS `promociones_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_post_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `promociones_post_tags_post_id_tag_id_7c25e28c_uniq` (`post_id`,`tag_id`),
  KEY `promociones_post_tags_tag_id_37098098_fk_promociones_tag_id` (`tag_id`),
  CONSTRAINT `promociones_post_tags_post_id_e8c5c587_fk_promociones_post_id` FOREIGN KEY (`post_id`) REFERENCES `promociones_post` (`id`),
  CONSTRAINT `promociones_post_tags_tag_id_37098098_fk_promociones_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `promociones_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_post_tags`
--

LOCK TABLES `promociones_post_tags` WRITE;
/*!40000 ALTER TABLE `promociones_post_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones_tag`
--

DROP TABLE IF EXISTS `promociones_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones_tag`
--

LOCK TABLES `promociones_tag` WRITE;
/*!40000 ALTER TABLE `promociones_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `promociones_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectionselection_pageenabled`
--

DROP TABLE IF EXISTS `sectionselection_pageenabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectionselection_pageenabled` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `template_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_path` (`template_path`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectionselection_pageenabled`
--

LOCK TABLES `sectionselection_pageenabled` WRITE;
/*!40000 ALTER TABLE `sectionselection_pageenabled` DISABLE KEYS */;
INSERT INTO `sectionselection_pageenabled` VALUES (1,'Main Page','base/index.html'),(2,'Servicios Listado','services/home.html'),(3,'Servicios Detalle','services/article_details.html'),(4,'Promociones Listado','promociones/home.html'),(5,'Promociones Detalle','promociones/article_details.html');
/*!40000 ALTER TABLE `sectionselection_pageenabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectionselection_sectionenabled`
--

DROP TABLE IF EXISTS `sectionselection_sectionenabled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectionselection_sectionenabled` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `html_id` varchar(255) NOT NULL,
  `section_path` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `html_id` (`html_id`),
  UNIQUE KEY `section_path` (`section_path`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectionselection_sectionenabled`
--

LOCK TABLES `sectionselection_sectionenabled` WRITE;
/*!40000 ALTER TABLE `sectionselection_sectionenabled` DISABLE KEYS */;
INSERT INTO `sectionselection_sectionenabled` VALUES (1,'Inicio','hero','hero/section/hero.html'),(2,'Nosotros','nosotros','base/section/about.html'),(3,'Calltoaction','calltoaction','calltoaction/section/call2action.html'),(4,'Tratamientos','servicios','services/section/posts.html'),(5,'Contacto','contacto','base/section/contact.html'),(6,'Preguntas Frecuentes','faq','base/section/faq.html'),(7,'Distintivos','distintivos','base/section/features.html'),(8,'Experiencia','experiencia','base/section/portfolio.html'),(9,'Equipo','equipo','base/section/team.html'),(10,'Promociones','promociones','promociones/section/posts.html'),(11,'Testimonios','testimonios','base/section/testimonials.html'),(12,'Estadisticas','estadisticas','base/section/stats.html');
/*!40000 ALTER TABLE `sectionselection_sectionenabled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sectionselection_sectionselection`
--

DROP TABLE IF EXISTS `sectionselection_sectionselection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectionselection_sectionselection` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sort_order` int NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `nav_enabled` tinyint(1) NOT NULL,
  `page_id` bigint NOT NULL,
  `section_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sectionselection_section_page_id_section_id_0a22298b_uniq` (`page_id`,`section_id`),
  KEY `sectionselection_sec_section_id_c466359f_fk_sectionse` (`section_id`),
  CONSTRAINT `sectionselection_sec_page_id_2c07e2b6_fk_sectionse` FOREIGN KEY (`page_id`) REFERENCES `sectionselection_pageenabled` (`id`),
  CONSTRAINT `sectionselection_sec_section_id_c466359f_fk_sectionse` FOREIGN KEY (`section_id`) REFERENCES `sectionselection_sectionenabled` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectionselection_sectionselection`
--

LOCK TABLES `sectionselection_sectionselection` WRITE;
/*!40000 ALTER TABLE `sectionselection_sectionselection` DISABLE KEYS */;
INSERT INTO `sectionselection_sectionselection` VALUES (1,100,1,1,1,1),(2,102,1,0,1,12),(3,101,1,1,1,2),(4,104,1,0,1,3),(5,103,1,1,1,4),(9,106,1,1,1,9),(11,110,1,1,1,5),(12,200,1,0,2,4),(13,201,1,0,2,3),(14,300,1,0,3,3),(15,400,1,0,4,10),(16,401,1,0,4,3),(17,500,1,0,5,3),(18,105,0,0,1,8);
/*!40000 ALTER TABLE `sectionselection_sectionselection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_category`
--

DROP TABLE IF EXISTS `services_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_category`
--

LOCK TABLES `services_category` WRITE;
/*!40000 ALTER TABLE `services_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_comment`
--

DROP TABLE IF EXISTS `services_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `body` longtext NOT NULL,
  `date_added` datetime(6) NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `services_comment_post_id_0682fb6d_fk_services_post_id` (`post_id`),
  CONSTRAINT `services_comment_post_id_0682fb6d_fk_services_post_id` FOREIGN KEY (`post_id`) REFERENCES `services_post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_comment`
--

LOCK TABLES `services_comment` WRITE;
/*!40000 ALTER TABLE `services_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_page`
--

DROP TABLE IF EXISTS `services_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_page` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext,
  `is_enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_page`
--

LOCK TABLES `services_page` WRITE;
/*!40000 ALTER TABLE `services_page` DISABLE KEYS */;
INSERT INTO `services_page` VALUES (1,'Tratamientos','Donde la excelencia odontológica se encuentra con la atención personalizada. Nuestras especialidades están diseñadas para abordar todas las necesidades de tu salud bucal, con un enfoque integral y soluciones personalizadas.',0),(2,'Tratamientos','<p>Donde la <span>excelencia odontológica</span> se encuentra con la <span>atención personalizada.</span></p>',1);
/*!40000 ALTER TABLE `services_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_post`
--

DROP TABLE IF EXISTS `services_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `header_image` varchar(100) DEFAULT NULL,
  `title_tag` varchar(255) NOT NULL,
  `body` longtext,
  `post_date` date NOT NULL,
  `snippet` varchar(255) DEFAULT NULL,
  `sort_order` int NOT NULL,
  `is_visible` tinyint(1) NOT NULL,
  `author_id` int NOT NULL,
  `call2action_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `services_post_author_id_7d605288_fk_auth_user_id` (`author_id`),
  KEY `services_post_call2action_id_77b05897_fk_calltoact` (`call2action_id`),
  KEY `services_post_category_id_42d67396_fk_services_category_id` (`category_id`),
  CONSTRAINT `services_post_author_id_7d605288_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `services_post_call2action_id_77b05897_fk_calltoact` FOREIGN KEY (`call2action_id`) REFERENCES `calltoaction_calltoaction` (`id`),
  CONSTRAINT `services_post_category_id_42d67396_fk_services_category_id` FOREIGN KEY (`category_id`) REFERENCES `services_category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_post`
--

LOCK TABLES `services_post` WRITE;
/*!40000 ALTER TABLE `services_post` DISABLE KEYS */;
INSERT INTO `services_post` VALUES (1,'Ortodoncia','images/services/pexels-diego-romero-19147369.jpg','Ortodoncia','','2024-01-14','Dental Experience utiliza técnicas modernas para alinear los dientes de manera eficiente y cómoda.',1,1,2,1,NULL),(2,'Periodoncia','images/services/pexels-cedric-fauntleroy-4269698.jpg','Periodoncia','<p><span style=\"font-size:18px\"><span style=\"color:#374151\">Nuestros expertos se enfocan en tratamientos preventivos y correctivos, asegurando la salud de tus enc&iacute;as y proporcionando una base s&oacute;lida para tu sonrisa a largo plazo.</span></span></p>','2024-01-14','Nuestros expertos se enfocan en tratamientos preventivos y correctivos, asegurando la salud de tus encías y proporcionando una base sólida para tu sonrisa a largo plazo.',1,0,2,2,NULL),(3,'Endodoncia','images/services/dentistry-668191_1280.jpg','Endodoncia','','2024-01-14','Dedicada a la salud interna de tus dientes. Utilizamos técnicas avanzadas para tratar las raíces dentales, eliminando el dolor y preservando la estructura dental.',1,1,2,3,NULL),(4,'Implantología','images/services/pexels-cottonbro-studio-6502305.jpg','Implantología','','2024-01-14','Restauramos dientes perdidos, garantizamos procedimientos precisos y resultados naturales utilizando tecnologías de vanguardia para la colocación de implantes dentales.',1,0,2,1,NULL),(5,'Cirugías','images/services/pexels-andrea-piacquadio-3779709.jpg','Cirugías','','2024-01-14','Aborda problemas complejos del maxilar y la cara. Con enfoque en la precisión quirúrgica, mejoramos tanto la estética facial como la función oral.',1,1,2,2,NULL),(6,'Prótesis','images/services/protesis-dental-min.jpg','Prótesis','','2024-01-14','Recupera la funcionalidad y estética dental, desde puentes hasta dentaduras, personalizamos soluciones para restaurar la belleza y la función de tu sonrisa.',1,0,2,3,NULL),(7,'Odontopediatría','images/services/odontopediatria.-dental-experience.jpg','Odontopediatría','','2024-01-14','Iniciamos la salud dental desde temprano, cuidamos de las sonrisas jóvenes, fomentando hábitos saludables y asegurando sonrisas radiantes en crecimiento.',1,0,2,1,NULL),(8,'Limpiezas','images/services/pexels-arvind-philomin-12148417.jpg','Limpiezas','','2024-01-25',NULL,1,1,2,NULL,NULL),(9,'Resinas','images/services/pexels-anna-shvets-3845548.jpg','Resinas','','2024-01-25',NULL,1,1,2,NULL,NULL),(10,'Blanqueamientos','images/services/pexels-anna-shvets-3845709.jpg','Blanquemaientos','','2024-01-25',NULL,1,1,2,NULL,NULL);
/*!40000 ALTER TABLE `services_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_post_likes`
--

DROP TABLE IF EXISTS `services_post_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_post_likes` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_post_likes_post_id_user_id_678fbe07_uniq` (`post_id`,`user_id`),
  KEY `services_post_likes_user_id_55029f92_fk_auth_user_id` (`user_id`),
  CONSTRAINT `services_post_likes_post_id_af56300c_fk_services_post_id` FOREIGN KEY (`post_id`) REFERENCES `services_post` (`id`),
  CONSTRAINT `services_post_likes_user_id_55029f92_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_post_likes`
--

LOCK TABLES `services_post_likes` WRITE;
/*!40000 ALTER TABLE `services_post_likes` DISABLE KEYS */;
INSERT INTO `services_post_likes` VALUES (1,1,2),(2,2,2),(3,3,2),(4,4,2),(5,5,2),(6,6,2),(7,7,2),(8,8,2),(9,9,2),(10,10,2);
/*!40000 ALTER TABLE `services_post_likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_post_tags`
--

DROP TABLE IF EXISTS `services_post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_post_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `post_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `services_post_tags_post_id_tag_id_bde00916_uniq` (`post_id`,`tag_id`),
  KEY `services_post_tags_tag_id_7d68747d_fk_services_tag_id` (`tag_id`),
  CONSTRAINT `services_post_tags_post_id_0f70015a_fk_services_post_id` FOREIGN KEY (`post_id`) REFERENCES `services_post` (`id`),
  CONSTRAINT `services_post_tags_tag_id_7d68747d_fk_services_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `services_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_post_tags`
--

LOCK TABLES `services_post_tags` WRITE;
/*!40000 ALTER TABLE `services_post_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_tag`
--

DROP TABLE IF EXISTS `services_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_tag`
--

LOCK TABLES `services_tag` WRITE;
/*!40000 ALTER TABLE `services_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `services_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-02 18:00:36
