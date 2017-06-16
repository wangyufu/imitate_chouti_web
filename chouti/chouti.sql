-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: chouti
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add group',4,'add_group'),(11,'Can change group',4,'change_group'),(12,'Can delete group',4,'delete_group'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add user info',7,'add_userinfo'),(20,'Can change user info',7,'change_userinfo'),(21,'Can delete user info',7,'delete_userinfo'),(22,'Can add comment',8,'add_comment'),(23,'Can change comment',8,'change_comment'),(24,'Can delete comment',8,'delete_comment'),(25,'Can add news',9,'add_news'),(26,'Can change news',9,'change_news'),(27,'Can delete news',9,'delete_news'),(28,'Can add comment',10,'add_comment'),(29,'Can change comment',10,'change_comment'),(30,'Can delete comment',10,'delete_comment'),(31,'Can add user info',11,'add_userinfo'),(32,'Can change user info',11,'change_userinfo'),(33,'Can delete user info',11,'delete_userinfo'),(34,'Can add news',12,'add_news'),(35,'Can change news',12,'change_news'),(36,'Can delete news',12,'delete_news');
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
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$37W8xLFnHpfO$6gVW/4DdpSzaohrvlrHDlam/dc5NmjsiCI9rILqyxYQ=','2017-06-14 10:52:10.118200',1,'wangyufu','','','',1,1,'2017-06-10 03:06:34.852123');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-06-10 03:21:33.134570','2','wang',1,'[{\"added\": {}}]',11,1),(2,'2017-06-10 03:23:51.981566','42','与陌生人发生7次性关系就能交好运？ 印尼“性爱山”12人染爱滋',1,'[{\"added\": {}}]',12,1),(3,'2017-06-14 10:53:08.997376','1','Comment object',1,'[{\"added\": {}}]',10,1),(4,'2017-06-14 10:53:47.450478','2','Comment object',1,'[{\"added\": {}}]',10,1),(5,'2017-06-14 10:54:23.070245','3','Comment object',1,'[{\"added\": {}}]',10,1),(6,'2017-06-14 10:55:04.377019','4','Comment object',1,'[{\"added\": {}}]',10,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(8,'app01','comment'),(9,'app01','news'),(7,'app01','userinfo'),(4,'auth','group'),(2,'auth','permission'),(3,'auth','user'),(5,'contenttypes','contenttype'),(10,'repository','comment'),(12,'repository','news'),(11,'repository','userinfo'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-06-04 08:43:13.071728'),(2,'auth','0001_initial','2017-06-04 08:43:13.588122'),(3,'admin','0001_initial','2017-06-04 08:43:13.702404'),(4,'admin','0002_logentry_remove_auto_add','2017-06-04 08:43:13.714437'),(5,'app01','0001_initial','2017-06-04 08:43:14.181693'),(6,'contenttypes','0002_remove_content_type_name','2017-06-04 08:43:14.268912'),(7,'auth','0002_alter_permission_name_max_length','2017-06-04 08:43:14.316057'),(8,'auth','0003_alter_user_email_max_length','2017-06-04 08:43:14.370182'),(9,'auth','0004_alter_user_username_opts','2017-06-04 08:43:14.383216'),(10,'auth','0005_alter_user_last_login_null','2017-06-04 08:43:14.456431'),(11,'auth','0006_require_contenttypes_0002','2017-06-04 08:43:14.462427'),(12,'auth','0007_alter_validators_add_error_messages','2017-06-04 08:43:14.474491'),(13,'auth','0008_alter_user_username_max_length','2017-06-04 08:43:14.531612'),(14,'sessions','0001_initial','2017-06-04 08:43:14.573755'),(15,'repository','0001_initial','2017-06-10 02:42:58.487941'),(16,'repository','0002_auto_20170610_1058','2017-06-10 02:58:39.734119'),(17,'repository','0003_auto_20170610_1120','2017-06-10 07:29:44.209292'),(18,'repository','0004_auto_20170610_1529','2017-06-10 07:29:44.503283');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('8czoatlss969mdd660zlsfksqhrmozch','YTc3OGJhODdiNzM4OTYxYTliOGFhZmZlZDgxN2FmYTIyMjViYWQyNjp7InUiOiJyb290In0=','2017-06-18 14:12:22.168105'),('9tdofrdwqfjoz59nhsjyp0tb76ey9vwt','ZjUyZmIzMzIwN2U1ODRhY2Q4YmM2MTM1YTEzNjRkZGU0ZWI2N2RhNDp7ImNoZWNrX2NvZGUiOiJIZ3RGIn0=','2017-06-27 11:09:35.545270'),('bkgay6ss5gadlitmlpx6hxls71sgxd9j','YjhiMjE2MGI4ZmI1MGFhYWMyOTg3ZGMxZDY3YjNmNzY4ZTY5NGY3OTp7ImNoZWNrX2NvZGUiOiJ2VGc1In0=','2017-06-27 11:20:00.719996'),('hxjkbu55peyb69iaug5unslcskaxs6ja','OWRhMDk0N2RmYzhhNTA5M2YxNTQzY2Y4N2JmNWE2MjE0MzkwMzUxZTp7ImNoZWNrX2NvZGUiOiIzNTlwIn0=','2017-06-27 11:34:05.052469'),('spbwjg4pk2ssqrkxr7dbada2u49dqmt4','ZTlhNzdiMjAwYjdjNTI2M2Y3ZDJmNWI4ZTU5MDQ1NTA5YzM5MmQ0MTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwidSI6InJvb3QiLCJfYXV0aF91c2VyX2lkIjoiMSIsImNoZWNrX2NvZGUiOiJNWGViIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjNDQyNzlmNmE1MWY1ZjRlODg1MGIxNGYyNzg4M2RlNmFiZDkxOCJ9','2017-06-28 10:52:10.121216'),('zbyr5wkonpjb0xfmmmaqlxgzr3t7pil5','MzE4MTJhYzRjNjdmYTFkMDVjNDYzZDMzNzQ5MzU1MzgwODI1OGQ1Njp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjBjNDQyNzlmNmE1MWY1ZjRlODg1MGIxNGYyNzg4M2RlNmFiZDkxOCIsInUiOiJyb290IiwiX2F1dGhfdXNlcl9pZCI6IjEifQ==','2017-06-24 03:06:48.778028');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_comment`
--

DROP TABLE IF EXISTS `repository_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(150) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  `new_id` int(11) NOT NULL,
  `parent_id_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `device` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repository_comment_new_id_87e06dac_fk_repository_news_id` (`new_id`),
  KEY `repository_comment_user_id_0f27216e_fk_repository_userinfo_id` (`user_id`),
  KEY `repository_comment_parent_id_id_550743d0_fk_repositor` (`parent_id_id`),
  CONSTRAINT `repository_comment_new_id_87e06dac_fk_repository_news_id` FOREIGN KEY (`new_id`) REFERENCES `repository_news` (`id`),
  CONSTRAINT `repository_comment_parent_id_id_550743d0_fk_repositor` FOREIGN KEY (`parent_id_id`) REFERENCES `repository_comment` (`id`),
  CONSTRAINT `repository_comment_user_id_0f27216e_fk_repository_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `repository_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_comment`
--

LOCK TABLES `repository_comment` WRITE;
/*!40000 ALTER TABLE `repository_comment` DISABLE KEYS */;
INSERT INTO `repository_comment` VALUES (1,'哈哈哈哈','2017-06-14 10:53:08.994393',2,NULL,1,'安卓'),(2,'呵呵呵呵','2017-06-14 10:53:47.448482',2,1,2,'iphone'),(3,'哈哈哈','2017-06-14 10:54:23.068741',2,1,2,'iphone'),(4,'22222222','2017-06-14 10:55:04.375013',2,NULL,1,'安卓');
/*!40000 ALTER TABLE `repository_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_news`
--

DROP TABLE IF EXISTS `repository_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `summary` longtext NOT NULL,
  `href` varchar(50) NOT NULL,
  `nt_id` int(11) NOT NULL,
  `ctime` datetime(6) NOT NULL,
  `author_id` int(11) NOT NULL,
  `comment_num` int(11) NOT NULL,
  `favor_num` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `repository_news_author_id_230d3d59_fk_repository_userinfo_id` (`author_id`),
  CONSTRAINT `repository_news_author_id_230d3d59_fk_repository_userinfo_id` FOREIGN KEY (`author_id`) REFERENCES `repository_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_news`
--

LOCK TABLES `repository_news` WRITE;
/*!40000 ALTER TABLE `repository_news` DISABLE KEYS */;
INSERT INTO `repository_news` VALUES (2,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.744493',1,0,1),(3,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.753017',1,0,1),(4,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.756525',1,0,1),(5,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.761538',1,0,1),(6,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.764547',1,0,1),(7,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.767554',1,0,1),(8,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.770563',1,0,1),(9,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.773570',1,0,1),(10,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.777080',1,0,1),(11,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.780589',1,0,0),(12,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.783096',1,0,0),(13,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.785602',1,0,0),(14,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.788109',1,0,0),(15,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.791123',1,0,0),(16,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.794125',1,0,0),(17,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.797133',1,0,0),(18,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.799138',1,0,0),(19,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.802146',1,0,0),(20,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.805155',1,0,0),(21,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.807661',1,0,0),(22,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.810168',1,0,0),(23,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.812674',1,0,0),(24,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.815181',1,0,0),(25,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.817699',1,0,0),(26,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.820194',1,0,0),(27,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.822701',1,0,0),(28,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.825220',1,0,0),(29,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.828219',1,0,0),(30,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.831224',1,0,0),(31,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.835234',1,0,0),(32,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.837741',1,0,0),(33,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.840247',1,0,0),(34,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.843255',1,0,0),(35,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.846263',1,0,0),(36,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.849271',1,0,0),(37,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.852279',1,0,0),(38,'奥尼尔','1972年3月6日，沙奎尔·奥尼尔出生于新泽西州的纽瓦克。而“沙奎尔”这个名字是他的生父约瑟夫·托尼（Joseph·Toney）为他取的。由于约瑟夫在奥尼尔9个月大时就入狱服刑，奥尼尔不得不跟随他的母亲露茜·奥尼尔嫁给了菲利普·哈里森（Philip Harrison）。奥尼尔的继父菲利浦·哈里森在他两岁时参军，由于要常常调防，因此奥尼尔一家需要经常搬家。小时侯的奥尼尔已经比其他与他同龄的小朋友长得又高又大，也非常顽皮，因此也常被父亲教训。1977年，5岁的奥尼尔在坐车时，他的妈妈就要带着他的出生证明以证实自己的儿子并没有8、9岁那么大','/static/images/picture/aopang.jpg',1,'2017-06-10 02:46:59.855287',1,0,0),(39,'艾弗森','阿伦·艾弗森（Allen Iverson），1975年6月7日出生于美国弗吉尼亚州汉普顿，前美国职业篮球运动员，司职后卫（双能卫），绰号“答案”（The Answer）/AI，曾任美国男篮梦之队队长。阿伦·艾弗森在1996年NBA选秀中于第1轮第1位被费城76人队选中，成为NBA状元秀。在14年的职业生涯中，阿伦·艾弗森曾效力...','/static/images/picture/AI.jpg',1,'2017-06-10 02:46:59.858796',1,0,0),(40,'姚明','姚明（Yao Ming），1980年9月12日出生于上海市徐汇区，祖籍江苏省苏州市吴江区震泽镇，前中国职业篮球运动员，司职中锋，现任中职联公司董事长兼总经理。1998年4月，姚明入选王非执教的国家队，开始篮球生涯。2001夺得CBA常规赛MVP，2002年...','/static/images/picture/yao.jpg',1,'2017-06-10 02:46:59.861806',1,0,0),(41,'艾弗森','特雷西·麦克格雷迪（Tracy McGrady），1979年5月24日出生于美国佛罗里达州巴托，前美国职业篮球运动员，司职得分后卫/小前锋，简称“麦迪”/“麦蒂”或“T-Mac”。在1997年NBA选秀大会中，麦迪以高中生球员的身份，在第1轮第9顺位被多伦多猛龙队选中。职业生涯曾先后效力于多伦多猛龙队、奥兰多魔术队...','/static/images/picture/maidi.jpg',1,'2017-06-10 02:46:59.864813',1,0,0),(42,'与陌生人发生7次性关系就能交好运？ 印尼“性爱山”12人染爱滋','哈哈','/static/images/picture/maidi.jpg',2,'2017-06-10 03:23:51.980570',1,0,0);
/*!40000 ALTER TABLE `repository_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_userinfo`
--

DROP TABLE IF EXISTS `repository_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repository_userinfo_username_0e0aedcd_uniq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_userinfo`
--

LOCK TABLES `repository_userinfo` WRITE;
/*!40000 ALTER TABLE `repository_userinfo` DISABLE KEYS */;
INSERT INTO `repository_userinfo` VALUES (1,'root','123'),(2,'wang','123');
/*!40000 ALTER TABLE `repository_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repository_userinfo_favor`
--

DROP TABLE IF EXISTS `repository_userinfo_favor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repository_userinfo_favor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userinfo_id` int(11) NOT NULL,
  `news_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `repository_userinfo_favor_userinfo_id_news_id_e973eb89_uniq` (`userinfo_id`,`news_id`),
  KEY `repository_userinfo_favor_news_id_be6a62ed_fk_repository_news_id` (`news_id`),
  CONSTRAINT `repository_userinfo__userinfo_id_025a0649_fk_repositor` FOREIGN KEY (`userinfo_id`) REFERENCES `repository_userinfo` (`id`),
  CONSTRAINT `repository_userinfo_favor_news_id_be6a62ed_fk_repository_news_id` FOREIGN KEY (`news_id`) REFERENCES `repository_news` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repository_userinfo_favor`
--

LOCK TABLES `repository_userinfo_favor` WRITE;
/*!40000 ALTER TABLE `repository_userinfo_favor` DISABLE KEYS */;
INSERT INTO `repository_userinfo_favor` VALUES (45,1,2),(40,1,3),(37,1,4),(26,1,5),(41,1,6),(42,1,7),(29,1,8),(43,1,9),(44,1,10),(4,1,42),(3,2,5);
/*!40000 ALTER TABLE `repository_userinfo_favor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 21:36:59
