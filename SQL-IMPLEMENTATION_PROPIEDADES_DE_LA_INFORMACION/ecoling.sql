-- MySQL dump 10.11
--
-- Host: localhost    Database: ecoling
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt

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
-- Table structure for table `epreuves`
--

DROP TABLE IF EXISTS `epreuves`;
CREATE TABLE `epreuves` (
  `NEP` int(11) NOT NULL auto_increment,
  `salle` int(11) default NULL,
  `dateHeure` datetime default NULL,
  `NEX` int(11) NOT NULL,
  `NGR` int(11) default NULL,
  PRIMARY KEY  (`NEP`),
  UNIQUE KEY `Unique_EP_ngr_dateheure` (`NGR`,`dateHeure`),
  KEY `NEX` (`NEX`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `epreuves`
--

LOCK TABLES `epreuves` WRITE;
/*!40000 ALTER TABLE `epreuves` DISABLE KEYS */;
INSERT INTO `epreuves` VALUES (1,301,'2006-10-17 17:30:00',1,1),(2,302,'2006-10-17 17:30:00',1,2),(3,302,'2006-10-21 09:00:00',2,1),(4,302,'2006-10-21 14:00:00',2,2),(5,101,'2006-11-10 09:00:00',3,1),(6,101,'2006-11-10 14:00:00',3,2),(7,106,'2006-11-20 09:00:00',4,1),(8,107,'2006-11-21 09:00:00',4,2),(9,302,'2007-01-12 09:00:00',6,1),(10,301,'2007-01-12 09:00:00',6,2),(11,302,'2007-01-25 15:00:00',5,1),(12,303,'2007-01-25 15:00:00',5,2);
/*!40000 ALTER TABLE `epreuves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etudiants`
--

DROP TABLE IF EXISTS `etudiants`;
CREATE TABLE `etudiants` (
  `NET` int(11) NOT NULL auto_increment,
  `nom` varchar(50) default NULL,
  `prenom` varchar(50) default NULL,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`NET`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `etudiants`
--

LOCK TABLES `etudiants` WRITE;
/*!40000 ALTER TABLE `etudiants` DISABLE KEYS */;
INSERT INTO `etudiants` VALUES (1,'Dupont','Jean','jeandupont@yahoo.fr'),(2,'Durand','Marie','maried@hotmail.com'),(3,'Dupont','Pierre','dupontp@caramail.com'),(4,'David','Marc','marcdavid@yahoo.com'),(5,'Dupuis','Vanessa','vaness632@caramail.com'),(6,'Carlier','Stephane','steph@carlier.com'),(7,'Merlot','Stephane','merlot@yahoo.fr'),(8,'Chenu','Caroline','carochenu@laposte.net'),(9,'Michelin','Baptiste','bap@mymail.com'),(10,'Nerval','Marie-Ange','man@email.com'),(11,'Janset','Nicole','nicolejanset@yahoo.fr'),(12,'Brulard','Nicolas','nico@brulard.com'),(13,'Jordan','Jacques','jak@myemail.com'),(14,'Chamblard','Philippe',NULL),(15,'d\'Estienne','Paul','paulot@today.com'),(16,'Decroix','Johann','johann2x@yahoo.com'),(17,'Lutece','Stephanie',NULL),(18,'Tourette','Carmen','carmenita@yahoo.fr'),(19,'Leonin','Jean-Sebastien','jsl@mydomain.com'),(20,'Vassal','Helene','helene_vassal@hotmail.com'),(21,'Dumont','Xavier',NULL),(22,'Williot','Claire','claire_w@caramail.com'),(23,'Cremant','Gregory','greg@cremant.fr'),(24,'Mauroit','Sandra',NULL),(25,'Guyard','Bertrand','tranber18@caramail.com'),(26,'Dupret','Jean-Francois','jfdupret@hotmail.com'),(27,'Allard','Severine','sevallard@hotmail.com'),(28,'Chetty','Stanislas','stan@chetty.com'),(29,'Laury','Etienne','etiennelaury@yahoo.com'),(30,'Mironton','Claude','claudemironton@yahoo.fr'),(31,'Ghilain','Sophie',NULL),(32,'Genty','Aurore','auroregenty@laposte.net'),(33,'Thibault','Jeremy','jerem45@yahoo.fr'),(34,'Lorrain','Michel','mlorrain@aol.com'),(35,'Parclos','Celine','celineparclos@hotmail.com'),(36,'Cadet','Alexandre',NULL);
/*!40000 ALTER TABLE `etudiants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evaluer`
--

DROP TABLE IF EXISTS `evaluer`;
CREATE TABLE `evaluer` (
  `NET` int(11) NOT NULL default '0',
  `NEP` int(11) NOT NULL default '0',
  `note` int(11) NOT NULL,
  PRIMARY KEY  (`NET`,`NEP`),
  KEY `NEP` (`NEP`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `evaluer`
--

LOCK TABLES `evaluer` WRITE;
/*!40000 ALTER TABLE `evaluer` DISABLE KEYS */;
INSERT INTO `evaluer` VALUES (1,1,14),(1,5,11),(1,7,7),(1,9,12),(1,11,13),(2,1,6),(2,3,10),(2,5,14),(2,7,12),(2,11,15),(3,1,17),(3,5,5),(3,7,7),(3,9,9),(3,11,10),(4,1,8),(4,3,13),(4,5,9),(4,7,10),(4,9,12),(4,11,12),(5,1,10),(5,5,12),(5,7,13),(5,11,18),(6,1,6),(6,3,10),(6,5,8),(6,7,11),(6,9,10),(6,11,10),(7,4,13),(7,6,9),(7,8,11),(7,12,14),(8,2,13),(8,6,13),(8,8,13),(8,12,13),(9,2,6),(9,4,8),(9,6,4),(9,8,5),(9,10,5),(9,12,7),(10,2,4),(10,4,9),(10,6,10),(10,8,11),(10,12,11),(11,2,14),(11,6,4),(11,8,8),(11,10,5),(11,12,9),(12,2,9),(12,4,11),(12,6,3),(12,10,7),(12,12,10),(13,2,11),(13,6,11),(13,8,12),(13,12,16);
/*!40000 ALTER TABLE `evaluer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examens`
--

DROP TABLE IF EXISTS `examens`;
CREATE TABLE `examens` (
  `NEX` int(11) NOT NULL auto_increment,
  `matiere` varchar(50) default '',
  `professeur` varchar(50) default NULL,
  `session` enum('juin','septembre') default NULL,
  `annee` year(4) default NULL,
  `niveau` tinyint(4) default NULL,
  `type` enum('ecrit','oral') default NULL,
  `duree` float default NULL,
  PRIMARY KEY  (`NEX`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examens`
--

LOCK TABLES `examens` WRITE;
/*!40000 ALTER TABLE `examens` DISABLE KEYS */;
INSERT INTO `examens` VALUES (1,'mathematiques','Martin','juin',2006,1,'ecrit',3),(2,'mathematiques','Martin','septembre',2006,1,'oral',1),(3,'anglais','Jones','juin',2006,1,'ecrit',2),(4,'anglais','Jones','septembre',2006,1,'oral',0.5),(5,'culture generale','Dupuis','juin',2006,1,'ecrit',1),(6,'culture generale','Dupuis','septembre',2006,1,'oral',0.5),(7,'mathematiques','Martin','juin',2006,2,'ecrit',1),(8,'mathematiques','Martin','septembre',2006,2,'ecrit',1),(9,'mathematiques','Martin','juin',2006,3,'ecrit',1),(10,'mathematiques','Martin','septembre',2006,3,'ecrit',1),(11,'anglais','Jones','juin',2006,2,'ecrit',1),(12,'anglais','Jones','septembre',2006,2,'ecrit',1),(13,'anglais','Jones','juin',2006,3,'ecrit',1),(14,'anglais','Jones','septembre',2008,3,'ecrit',1);
/*!40000 ALTER TABLE `examens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupes`
--

DROP TABLE IF EXISTS `groupes`;
CREATE TABLE `groupes` (
  `NGR` int(11) NOT NULL auto_increment,
  `promo` int(11) default NULL,
  `annee` tinyint(1) default NULL,
  `groupe` varchar(10) default NULL,
  PRIMARY KEY  (`NGR`),
  UNIQUE KEY `promo` (`promo`,`annee`,`groupe`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `groupes`
--

LOCK TABLES `groupes` WRITE;
/*!40000 ALTER TABLE `groupes` DISABLE KEYS */;
INSERT INTO `groupes` VALUES (1,2011,1,'A'),(2,2011,1,'B'),(3,2010,2,'SIGL'),(4,2010,2,'SRT'),(5,2009,3,'SIGL'),(6,2009,3,'SRT'),(7,2010,1,'A'),(8,2010,1,'B'),(9,2009,1,'A'),(10,2009,1,'B'),(11,2009,2,'SIGL'),(12,2009,2,'SRT');
/*!40000 ALTER TABLE `groupes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participer`
--

DROP TABLE IF EXISTS `participer`;
CREATE TABLE `participer` (
  `NGR` int(11) NOT NULL default '0',
  `NET` int(11) NOT NULL default '0',
  PRIMARY KEY  (`NGR`,`NET`),
  KEY `participer_net_pk` (`NET`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `participer`
--

LOCK TABLES `participer` WRITE;
/*!40000 ALTER TABLE `participer` DISABLE KEYS */;
INSERT INTO `participer` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(1,6),(2,7),(2,8),(2,9),(2,10),(2,11),(2,12),(2,13),(3,14),(3,15),(3,16),(3,17),(3,18),(3,19),(3,20),(4,21),(4,22),(4,23),(4,24),(4,25),(4,26),(4,27),(5,30),(5,31),(5,32),(5,33),(5,34),(5,35),(5,36),(7,14),(7,16),(7,18),(7,20),(7,22),(7,24),(7,26),(7,28),(8,15),(8,17),(8,19),(8,21),(8,23),(8,25),(8,27),(9,29),(9,30),(9,31),(9,32),(10,33),(10,34),(10,35),(10,36),(11,29),(11,30),(11,31),(11,32),(11,33),(11,34),(11,35),(11,36);
/*!40000 ALTER TABLE `participer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-03-12  7:31:02
