-- MySQL dump 10.13  Distrib 5.7.26, for Win64 (x86_64)
--
-- Host: localhost    Database: recopilatorios
-- ------------------------------------------------------
-- Server version	5.7.26

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
-- Table structure for table `agrupados`
--

DROP TABLE IF EXISTS `agrupados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agrupados` (
  `id_estilo` tinyint(3) unsigned NOT NULL,
  `id_subestilo` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_subestilo`,`id_estilo`),
  KEY `fk_agrupados_2` (`id_estilo`),
  CONSTRAINT `fk_agrupados_1` FOREIGN KEY (`id_subestilo`) REFERENCES `subestilos` (`id_subestilo`),
  CONSTRAINT `fk_agrupados_2` FOREIGN KEY (`id_estilo`) REFERENCES `estilos` (`id_estilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agrupados`
--

LOCK TABLES `agrupados` WRITE;
/*!40000 ALTER TABLE `agrupados` DISABLE KEYS */;
INSERT INTO `agrupados` VALUES (1,17),(1,96),(2,1),(2,60),(2,81),(2,119),(2,120),(2,135),(3,2),(3,8),(3,10),(3,34),(3,38),(3,41),(3,58),(3,63),(3,68),(3,69),(3,94),(3,95),(3,98),(3,100),(3,101),(3,109),(3,110),(3,134),(3,139),(3,140),(3,148),(3,150),(4,12),(4,27),(4,31),(4,37),(4,38),(4,44),(4,46),(4,51),(4,56),(4,77),(4,104),(4,135),(5,6),(5,16),(5,24),(5,42),(5,47),(5,49),(5,50),(5,52),(5,53),(5,57),(5,59),(5,62),(5,76),(5,99),(5,128),(5,129),(5,130),(5,159),(6,4),(6,7),(6,9),(6,10),(6,13),(6,15),(6,18),(6,19),(6,25),(6,28),(6,30),(6,33),(6,34),(6,35),(6,37),(6,39),(6,55),(6,61),(6,68),(6,69),(6,71),(6,79),(6,82),(6,86),(6,105),(6,106),(6,107),(6,114),(6,117),(6,132),(6,133),(6,138),(6,139),(6,140),(6,142),(6,143),(6,152),(6,154),(7,8),(7,21),(7,22),(7,32),(7,44),(7,45),(7,52),(7,54),(7,57),(7,75),(7,76),(7,78),(7,83),(7,86),(7,87),(7,97),(7,108),(7,116),(7,119),(7,124),(7,126),(7,133),(7,134),(7,151),(7,153),(7,156),(7,158),(8,20),(8,32),(8,73),(8,74),(8,102),(8,104),(8,120),(8,141),(8,155),(8,160),(9,3),(9,5),(9,11),(9,14),(9,18),(9,21),(9,22),(9,23),(9,26),(9,29),(9,30),(9,33),(9,36),(9,40),(9,43),(9,48),(9,54),(9,55),(9,56),(9,61),(9,64),(9,65),(9,66),(9,67),(9,70),(9,71),(9,72),(9,78),(9,80),(9,82),(9,83),(9,84),(9,85),(9,87),(9,88),(9,89),(9,90),(9,91),(9,97),(9,103),(9,108),(9,111),(9,112),(9,113),(9,115),(9,116),(9,118),(9,119),(9,121),(9,124),(9,126),(9,127),(9,131),(9,135),(9,137),(9,141),(9,142),(9,147),(9,149),(9,151),(9,152),(9,153),(9,154),(9,156),(9,157),(9,158),(10,75),(10,90),(11,80),(11,81),(11,91),(11,92),(11,93),(11,106),(11,122),(11,129),(11,138),(11,144),(11,145),(11,160),(12,88),(12,132),(13,123),(13,130),(13,136),(13,137),(14,125),(14,146);
/*!40000 ALTER TABLE `agrupados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `autor_numero_discos`
--

DROP TABLE IF EXISTS `autor_numero_discos`;
/*!50001 DROP VIEW IF EXISTS `autor_numero_discos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `autor_numero_discos` AS SELECT 
 1 AS `nombre_autor`,
 1 AS `numero_discos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `autores` (
  `id_autor` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_autor` varchar(100) NOT NULL,
  `ano_debut` year(4) DEFAULT NULL,
  `ano_retirada` year(4) DEFAULT NULL,
  `enlace_rym` varchar(100) DEFAULT NULL,
  `foto_autor` varchar(50) DEFAULT NULL,
  `id_ciudad` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_autor`),
  UNIQUE KEY `nombre_autor` (`nombre_autor`),
  KEY `fk_autores_1` (`id_ciudad`),
  CONSTRAINT `fk_autores_1` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudades` (`id_ciudad`)
) ENGINE=InnoDB AUTO_INCREMENT=305 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'...And You Will Know Us By The Trail Of Dead',1994,NULL,'https://rateyourmusic.com/artist/___and_you_will_know_us_by_the_trail_of_dead',NULL,1),(2,'Antlers, The',2006,NULL,'https://rateyourmusic.com/artist/the_antlers',NULL,2),(3,'Grizzly Bear',2002,NULL,'https://rateyourmusic.com/artist/grizzly_bear',NULL,2),(4,'Pains Of Being Pure At Heart, The',2002,NULL,'https://rateyourmusic.com/artist/the-pains-of-being-pure-at-heart',NULL,2),(5,'Yeah Yeah Yeahs',2000,NULL,'https://rateyourmusic.com/artist/yeah-yeah-yeahs',NULL,2),(6,'Eilen Jewell',2005,NULL,'https://rateyourmusic.com/artist/eilen_jewell',NULL,3),(7,'RX Bandits',1995,NULL,'https://rateyourmusic.com/artist/rx_bandits',NULL,4),(8,'Benjamin Biolay',1997,NULL,'https://rateyourmusic.com/artist/benjamin-biolay','https://bit.ly/3o7W9R5',5),(9,'Florence + The Machine',2007,NULL,'https://rateyourmusic.com/artist/florence-the-machine',NULL,6),(10,'Horrors, The',2005,NULL,'https://rateyourmusic.com/artist/the_horrors_f1',NULL,7),(11,'Ghost Brigade',2005,2015,'https://rateyourmusic.com/artist/ghost_brigade',NULL,8),(12,'Metric',1998,NULL,'https://rateyourmusic.com/artist/metric','https://kcrw.co/2OychMZ',9),(13,'Sunset Rubdown',2005,2009,'https://rateyourmusic.com/artist/sunset_rubdown',NULL,10),(14,'Mew',1995,NULL,'https://rateyourmusic.com/artist/mew',NULL,11),(15,'Mono',1999,NULL,'https://rateyourmusic.com/artist/mono-3',NULL,12),(16,'Averkiou',NULL,NULL,'https://rateyourmusic.com/artist/averkiou',NULL,13),(17,'Deerhunter',2001,NULL,'https://rateyourmusic.com/artist/deerhunter',NULL,14),(18,'Fleet Foxes',2006,NULL,'https://rateyourmusic.com/artist/fleet-foxes',NULL,15),(19,'Frightened Rabbit',2003,NULL,'https://rateyourmusic.com/artist/frightened-rabbit',NULL,23),(20,'Goldfrapp',1998,NULL,'https://rateyourmusic.com/artist/goldfrapp','https://bit.ly/3o50tAi',19),(21,'Last Shadow Puppets, The',2007,NULL,'https://rateyourmusic.com/artist/the_last_shadow_puppets','https://bit.ly/33oUKgW',20),(22,'Love Is All',2003,NULL,'https://rateyourmusic.com/artist/love-is-all-1','https://bit.ly/2M9KroJ',24),(23,'Maybeshewill',2005,2016,'https://rateyourmusic.com/artist/maybeshewill',NULL,21),(24,'MGMT',2002,NULL,'https://rateyourmusic.com/artist/mgmt','http://bit.ly/34fsxXy',16),(25,'Russian Circles',2004,NULL,'https://rateyourmusic.com/artist/russian_circles',NULL,17),(26,'Sigur Rós',1994,NULL,'https://rateyourmusic.com/artist/sigur-ros',NULL,25),(27,'Titus Andronicus',2005,NULL,'https://rateyourmusic.com/artist/titus_andronicus',NULL,18),(28,'Vampire Weekend',2006,NULL,'https://rateyourmusic.com/artist/vampire-weekend','http://bit.ly/2q31Yqn',2),(29,'Wave Pictures, The',1998,NULL,'https://rateyourmusic.com/artist/the-wave-pictures-1',NULL,22),(30,'Alcest',2000,NULL,'https://rateyourmusic.com/artist/alcest',NULL,33),(31,'Arcade Fire',2001,NULL,'https://rateyourmusic.com/artist/arcade_fire',NULL,36),(32,'Baroness',2003,NULL,'https://rateyourmusic.com/artist/baroness',NULL,26),(33,'Bon Iver',2006,NULL,'https://rateyourmusic.com/artist/bon-iver-1',NULL,27),(34,'Dear Hunter, The',2005,NULL,'https://rateyourmusic.com/artist/the_dear_hunter',NULL,28),(35,'Dillinger Escape Plan, The',1997,2017,'https://rateyourmusic.com/artist/the-dillinger-escape-plan','https://bit.ly/2Jk8iU1',29),(36,'Gravenhurst',1999,2014,'https://rateyourmusic.com/artist/gravenhurst',NULL,34),(37,'Explosions In The Sky',1999,NULL,'https://rateyourmusic.com/artist/explosions_in_the_sky',NULL,1),(38,'Moving Mountains',2005,NULL,'https://rateyourmusic.com/artist/moving_mountains',NULL,30),(39,'National, The',1999,NULL,'https://rateyourmusic.com/artist/the-national-1','https://bit.ly/3o7oQxc',31),(40,'Ocean, The',2000,NULL,'https://rateyourmusic.com/artist/the-ocean',NULL,38),(41,'Of Montreal',1996,NULL,'https://rateyourmusic.com/artist/of-montreal',NULL,32),(42,'Radiohead',1991,NULL,'https://rateyourmusic.com/artist/radiohead','https://bit.ly/2ntSfrI',35),(43,'Super Furry Animals',1993,NULL,'https://rateyourmusic.com/artist/super-furry-animals-1',NULL,39),(44,'Tegan & Sara',1995,NULL,'https://rateyourmusic.com/artist/tegan_and_sara',NULL,37),(45,'Destroyer',1995,NULL,'https://rateyourmusic.com/artist/destroyer',NULL,40),(46,'Envy',1992,NULL,'https://rateyourmusic.com/artist/envy',NULL,12),(47,'God Is An Astronaut',2002,NULL,'https://rateyourmusic.com/artist/god-is-an-astronaut',NULL,41),(48,'Isis',1997,2010,'https://rateyourmusic.com/artist/isis',NULL,28),(49,'Jakob',1998,NULL,'https://rateyourmusic.com/artist/jakob',NULL,42),(50,'Jay Reatard',2006,2010,'https://rateyourmusic.com/artist/jay_reatard',NULL,43),(51,'Katatonia',1987,NULL,'https://rateyourmusic.com/artist/katatonia',NULL,44),(52,'Midlake',1999,NULL,'https://rateyourmusic.com/artist/midlake',NULL,45),(53,'Mogwai',1995,NULL,'https://rateyourmusic.com/artist/mogwai','https://bit.ly/32baqlN',46),(54,'Patrick Watson',2000,NULL,'https://rateyourmusic.com/artist/patrick_watson',NULL,36),(55,'Shearwater',1999,NULL,'https://rateyourmusic.com/artist/shearwater-1',NULL,1),(56,'Silversun Pickups',2002,NULL,'https://rateyourmusic.com/artist/silversun-pickups','https://bit.ly/2Vdzwy0',47),(57,'Year Of No Light',2001,NULL,'https://rateyourmusic.com/artist/year_of_no_light',NULL,48),(58,'65daysofstatic',2001,NULL,'https://rateyourmusic.com/artist/65daysofstatic-1',NULL,20),(59,'Broken Social Scene',1999,NULL,'https://rateyourmusic.com/artist/broken-social-scene',NULL,9),(60,'Clap Your Hands Say Yeah',2003,NULL,'https://rateyourmusic.com/artist/clap_your_hands_say_yeah',NULL,49),(61,'Babyshambles',2004,NULL,'https://rateyourmusic.com/artist/babyshambles',NULL,55),(62,'Foo Fighters',1994,NULL,'https://rateyourmusic.com/artist/foo-fighters-1','https://bit.ly/3q8lCeK',51),(63,'Hood',1990,NULL,'https://rateyourmusic.com/artist/hood','https://bit.ly/3li2hUM',52),(64,'Low',1993,NULL,'https://rateyourmusic.com/artist/low',NULL,53),(65,'M83',1999,NULL,'https://rateyourmusic.com/artist/m83','http://bit.ly/32JeU1U',54),(66,'New Pornographers, The',1999,NULL,'https://rateyourmusic.com/artist/the_new_pornographers',NULL,40),(67,'Okkervil River',1998,NULL,'https://rateyourmusic.com/artist/okkervil-river',NULL,1),(68,'Piano Magic',1996,2016,'https://rateyourmusic.com/artist/piano-magic',NULL,55),(69,'Sleater-Kinney',1994,NULL,'https://rateyourmusic.com/artist/sleater_kinney','https://bit.ly/2MgabzP',56),(70,'Antony & The Johnsons',1998,NULL,'https://rateyourmusic.com/artist/antony-and-the-johnsons',NULL,2),(71,'Cult Of Luna',1998,NULL,'https://rateyourmusic.com/artist/cult-of-luna',NULL,57),(72,'Divine Comedy, The',1989,NULL,'https://rateyourmusic.com/artist/the-divine-comedy','https://bit.ly/33puPWg',58),(73,'Elliott Smith',1994,2003,'https://rateyourmusic.com/artist/elliott-smith','https://bit.ly/31ej9SU',59),(74,'Expérience',2000,NULL,'https://rateyourmusic.com/artist/experience',NULL,60),(75,'Interpol',1998,NULL,'https://rateyourmusic.com/artist/interpol','https://bit.ly/2P6QPPH',2),(76,'Killers, The',2001,NULL,'https://rateyourmusic.com/artist/the_killers','https://bit.ly/3n7m7E8',61),(77,'Kings Of Convenience',1998,NULL,'https://rateyourmusic.com/artist/kings_of_convenience',NULL,62),(78,'Modest Mouse',1993,NULL,'https://rateyourmusic.com/artist/modest_mouse',NULL,63),(79,'Morrissey',1988,NULL,'https://rateyourmusic.com/artist/morrissey','https://bit.ly/2N2ErgW',94),(80,'Nick Cave & The Bad Seeds',1983,NULL,'https://rateyourmusic.com/artist/nick-cave-and-the-bad-seeds','https://bit.ly/2KcFQkE',55),(81,'La Quiete',2000,NULL,'https://rateyourmusic.com/artist/la_quiete',NULL,66),(82,'Wilco',1994,NULL,'https://rateyourmusic.com/artist/wilco',NULL,17),(83,'Adam Green',2002,NULL,'http://rateyourmusic.com/artist/adam_green','https://bit.ly/2KU84DP',67),(84,'American Analog Set, The',1995,NULL,'http://rateyourmusic.com/artist/the_american_analog_set',NULL,68),(85,'Early Day Miners',1996,NULL,'http://rateyourmusic.com/artist/early_day_miners',NULL,69),(86,'Eels',1995,NULL,'http://rateyourmusic.com/artist/eels',NULL,47),(87,'Hidden Cameras, The',2001,NULL,'http://rateyourmusic.com/artist/the_hidden_cameras',NULL,70),(88,'M. Ward',1999,NULL,'http://rateyourmusic.com/artist/m__ward',NULL,71),(89,'Mars Volta, The',2001,2013,'http://rateyourmusic.com/artist/the_mars_volta',NULL,47),(90,'Raveonettes, The',2000,NULL,'http://rateyourmusic.com/artist/the_raveonettes','https://bit.ly/3o7Hkhf',72),(91,'Richard Hawley',2001,NULL,'http://rateyourmusic.com/artist/richard_hawley',NULL,20),(92,'Tindersticks',1992,NULL,'http://rateyourmusic.com/artist/tindersticks','https://bit.ly/2NAoS1A',73),(93,'Wrens, The',1989,NULL,'http://rateyourmusic.com/artist/the_wrens',NULL,74),(94,'Beck',1988,NULL,'http://rateyourmusic.com/artist/beck','https://bit.ly/33qKvXD',47),(95,'Cracker',1991,NULL,'http://rateyourmusic.com/artist/cracker',NULL,75),(96,'Delgados, The',1994,2005,'http://rateyourmusic.com/artist/the_delgados',NULL,46),(97,'Desaparecidos',2000,NULL,'http://rateyourmusic.com/artist/desaparecidos',NULL,59),(98,'Desert Hearts',2000,NULL,'http://rateyourmusic.com/artist/desert_hearts',NULL,76),(99,'Doves',1998,NULL,'http://rateyourmusic.com/artist/doves','https://bit.ly/37f9zUh',64),(100,'Mando Diao',1999,NULL,'http://rateyourmusic.com/artist/mando_diao','https://bit.ly/3mkpmaS',77),(101,'Múm',1997,NULL,'http://rateyourmusic.com/artist/mum','https://bit.ly/3lh8ArF',25),(102,'Nada Surf',1992,NULL,'http://rateyourmusic.com/artist/nada_surf',NULL,2),(103,'Pedro The Lion',1995,NULL,'http://rateyourmusic.com/artist/pedro_the_lion',NULL,51),(104,'Queens Of The Stone Age',1996,NULL,'http://rateyourmusic.com/artist/queens_of_the_stone_age',NULL,78),(105,'Sparta',2001,NULL,'http://rateyourmusic.com/artist/sparta','https://bit.ly/37oTZG2',79),(106,'Ash',1992,NULL,'http://rateyourmusic.com/artist/ash',NULL,80),(107,'Dictators, The',1974,NULL,'http://rateyourmusic.com/artist/the_dictators',NULL,2),(108,'Mercury Rev',1989,NULL,'http://rateyourmusic.com/artist/mercury_rev',NULL,81),(109,'New Order',1980,NULL,'http://rateyourmusic.com/artist/new_order',NULL,64),(110,'Sparklehorse',1995,2010,'http://rateyourmusic.com/artist/sparklehorse',NULL,82),(111,'Strokes, The',1998,NULL,'http://rateyourmusic.com/artist/the_strokes','https://bit.ly/3mlOxJZ',2),(112,'Thee Michelle Gun Elephant',1991,2003,'http://rateyourmusic.com/artist/thee_michelle_gun_elephant',NULL,12),(113,'Tool',1990,NULL,'http://rateyourmusic.com/artist/tool',NULL,47),(114,'Weezer',1992,NULL,'http://rateyourmusic.com/artist/weezer','https://bit.ly/2kywRAs',47),(115,'Aereogramme',1998,2007,'http://rateyourmusic.com/artist/aereogramme',NULL,46),(116,'At The Drive-In',1993,NULL,'https://rateyourmusic.com/artist/at-the-drive-in','https://bit.ly/36fwG1H',79),(117,'Badly Drawn Boy',1997,NULL,'http://rateyourmusic.com/artist/badly_drawn_boy',NULL,83),(118,'Belle & Sebastian',1996,NULL,'http://rateyourmusic.com/artist/belle_and_sebastian',NULL,46),(119,'Hefner',1992,2002,'http://rateyourmusic.com/artist/hefner',NULL,84),(120,'PJ Harvey',1990,NULL,'http://rateyourmusic.com/artist/pj_harvey','https://bit.ly/37l85I7',85),(121,'Phoenix',1995,NULL,'http://rateyourmusic.com/artist/phoenix_f4','https://bit.ly/3qaDvto',86),(122,'Placebo',1994,NULL,'http://rateyourmusic.com/artist/placebo',NULL,55),(123,'Smashing Pumpkins, The',1988,NULL,'https://rateyourmusic.com/artist/the-smashing-pumpkins','http://bit.ly/2Ou40JO',17),(124,'White Stripes, The',1997,2011,'http://rateyourmusic.com/artist/the_white_stripes',NULL,87),(125,'Blur',1989,NULL,'https://rateyourmusic.com/artist/blur','https://bit.ly/2IJbGV2',88),(126,'Chemical Brothers, The',1995,NULL,'https://rateyourmusic.com/artist/the-chemical-brothers','https://bit.ly/2NgzHo7',64),(127,'Deus',1989,NULL,'https://rateyourmusic.com/artist/deus','https://bit.ly/38HcIOS',89),(128,'Flaming Lips, The',1983,NULL,'https://rateyourmusic.com/artist/the-flaming-lips',NULL,90),(129,'Gigolo Aunts',1981,NULL,'https://rateyourmusic.com/artist/gigolo-aunts',NULL,91),(130,'Guided By Voices',1983,NULL,'https://rateyourmusic.com/artist/guided-by-voices','https://bit.ly/33blmzg',92),(131,'Japancakes',1996,NULL,'https://rateyourmusic.com/artist/japancakes',NULL,32),(132,'Le Tigre',1998,NULL,'https://rateyourmusic.com/artist/le_tigre',NULL,2),(133,'Nine Inch Nails',1988,NULL,'https://rateyourmusic.com/artist/nine-inch-nails','https://bit.ly/3qK24Of',93),(134,'Red Hot Chili Peppers',1983,NULL,'https://rateyourmusic.com/artist/red-hot-chili-peppers',NULL,47),(135,'Sheila Divine, The',1997,NULL,'https://rateyourmusic.com/artist/the_sheila_divine',NULL,28),(136,'Travis',1993,NULL,'https://rateyourmusic.com/artist/travis','https://bit.ly/33pLjxS',46),(137,'Manic Street Preachers',1986,NULL,'https://rateyourmusic.com/artist/manic-street-preachers','https://bit.ly/2JnPiUg',95),(138,'Massive Attack',1988,NULL,'https://rateyourmusic.com/artist/massive-attack','http://bit.ly/2EeeSVZ',34),(139,'Neutral Milk Hotel',1989,1998,'https://rateyourmusic.com/artist/neutral-milk-hotel',NULL,96),(140,'Pulp',1978,NULL,'https://rateyourmusic.com/artist/pulp',NULL,20),(141,'R.E.M.',1980,2011,'https://rateyourmusic.com/artist/r_e_m_','https://bit.ly/2OWJuDF',32),(142,'Saint Etienne',1988,NULL,'https://rateyourmusic.com/artist/saint_etienne',NULL,97),(143,'Superdrag',1992,2010,'https://rateyourmusic.com/artist/superdrag',NULL,98),(144,'Turbonegro',1988,NULL,'https://rateyourmusic.com/artist/turbonegro','https://bit.ly/2pprNjE',99),(145,'Built To Spill',1992,NULL,'https://rateyourmusic.com/artist/built-to-spill','https://bit.ly/2IKpONM',100),(146,'Dandy Warhols, The',1992,NULL,'https://rateyourmusic.com/artist/the_dandy_warhols','https://bit.ly/2J5s6aE',50),(147,'Depeche Mode',1980,NULL,'https://rateyourmusic.com/artist/depeche-mode',NULL,101),(148,'Oasis',1991,2009,'https://rateyourmusic.com/artist/oasis','http://bit.ly/37026aU',64),(149,'Pavement',1989,1999,'https://rateyourmusic.com/artist/pavement','',102),(150,'Spiritualized',1989,NULL,'https://rateyourmusic.com/artist/spiritualized',NULL,103),(151,'Verve, The',1989,2009,'https://rateyourmusic.com/artist/the_verve',NULL,104),(152,'Beta Band, The',1996,2004,'https://rateyourmusic.com/artist/the_beta_band',NULL,105),(154,'Cardigans, The',1992,NULL,'https://rateyourmusic.com/artist/the_cardigans','https://bit.ly/32emLVT',106),(155,'Fountains Of Wayne',1995,NULL,'https://rateyourmusic.com/artist/fountains_of_wayne','https://bit.ly/2Jn8ced',2),(156,'Motorpsycho',1989,NULL,'https://rateyourmusic.com/artist/motorpsycho','https://bit.ly/2VKyMzP',107),(157,'Sleeper',1993,NULL,'https://rateyourmusic.com/artist/sleeper','https://bit.ly/2VIhDXM',55),(158,'Soundtrack Of Our Lives, The',1994,2012,'https://rateyourmusic.com/artist/the_soundtrack_of_our_lives',NULL,24),(159,'Stereolab',1990,NULL,'https://rateyourmusic.com/artist/stereolab','https://bit.ly/35D8LXS',55),(160,'Suede',1989,NULL,'https://rateyourmusic.com/artist/suede','https://bit.ly/2nOr37v',55),(161,'Boo Radleys, The',1988,1999,'http://rateyourmusic.com/artist/the_boo_radleys',NULL,108),(162,'Elastica',1992,2001,'https://rateyourmusic.com/artist/elastica',NULL,55),(163,'Garbage',1993,NULL,'https://rateyourmusic.com/artist/garbage',NULL,109),(164,'Hum',1989,2001,'https://rateyourmusic.com/artist/hum',NULL,110),(165,'Red House Painters',1988,2001,'https://rateyourmusic.com/artist/red-house-painters','https://bit.ly/35PyFYD',111),(166,'Supergrass',1993,2010,'https://rateyourmusic.com/artist/supergrass',NULL,35),(167,'Teenage Fanclub',1989,NULL,'https://rateyourmusic.com/artist/teenage-fanclub','https://bit.ly/2N00F2S',112),(168,'Echobelly',1992,NULL,'https://rateyourmusic.com/artist/echobelly','https://bit.ly/32C0ykF',55),(169,'Jeff Buckley',1993,1997,'https://rateyourmusic.com/artist/jeff-buckley',NULL,113),(170,'Lush',1987,2016,'https://rateyourmusic.com/artist/lush',NULL,55),(171,'Sebadoh',1987,NULL,'https://rateyourmusic.com/artist/sebadoh','https://bit.ly/33Q38nx',114),(172,'Soundgarden',1984,2017,'https://rateyourmusic.com/artist/soundgarden',NULL,51),(173,'Supersuckers',1988,NULL,'https://rateyourmusic.com/artist/supersuckers','http://bit.ly/2CHjD9J',115),(174,'American Music Club',1982,2009,'http://rateyourmusic.com/artist/american_music_club','https://bit.ly/36NSFLE',111),(175,'Catherine Wheel',1990,2000,'http://rateyourmusic.com/artist/catherine_wheel','https://bit.ly/3njkJOA',116),(176,'James',1982,NULL,'https://rateyourmusic.com/artist/james','https://bit.ly/36LAhFd',64),(177,'Pearl Jam',1990,NULL,'https://rateyourmusic.com/artist/pearl_jam','https://bit.ly/2CFdZoV',51),(178,'Posies, The',1987,NULL,'https://rateyourmusic.com/artist/the_posies','https://bit.ly/3fKBFux',117),(179,'Redd Kross',1978,NULL,'https://rateyourmusic.com/artist/redd_kross','https://bit.ly/33zxwmj',118),(180,'Slowdive',1989,NULL,'https://rateyourmusic.com/artist/slowdive',NULL,119),(181,'Afghan Whigs, The',1986,NULL,'http://rateyourmusic.com/artist/the_afghan_whigs','http://bit.ly/2Ooojqu',31),(182,'Screaming Trees',1984,2000,'https://rateyourmusic.com/artist/screaming-trees',NULL,120),(183,'Jesus Lizard, The',1987,NULL,'https://rateyourmusic.com/artist/the_jesus_lizard','http://bit.ly/32XoFtn',1),(184,'Lemonheads, The',1986,NULL,'http://rateyourmusic.com/artist/the_lemonheads',NULL,28),(185,'Morphine',1989,1999,'http://rateyourmusic.com/artist/morphine','http://bit.ly/32UFjtJ',3),(186,'Neurosis',1985,NULL,'http://rateyourmusic.com/artist/neurosis','http://bit.ly/2qltMGI',121),(187,'Ride',1988,NULL,'http://rateyourmusic.com/artist/ride',NULL,35),(188,'Sonic Youth',1981,2011,'http://rateyourmusic.com/artist/sonic_youth',NULL,2),(189,'Sugar',1991,1995,'http://rateyourmusic.com/artist/sugar','http://bit.ly/2KsL8s4',147),(190,'Chapterhouse',1987,1994,'https://rateyourmusic.com/artist/chapterhouse','http://bit.ly/34GpA34',119),(191,'Kitchens Of Distinction',1986,NULL,'https://rateyourmusic.com/artist/kitchens_of_distinction','http://bit.ly/2RpANS6',55),(192,'Moose',1990,2000,'https://rateyourmusic.com/artist/moose',NULL,55),(193,'My Bloody Valentine',1983,NULL,'https://rateyourmusic.com/artist/my_bloody_valentine','http://bit.ly/2Y7m1kk',123),(194,'Nirvana',1987,1994,'https://rateyourmusic.com/artist/nirvana','http://bit.ly/2ssO2qu',124),(195,'NoMeansNo',1980,2016,'https://rateyourmusic.com/artist/nomeansno','http://bit.ly/36618Zc',10),(196,'Pixies',1986,NULL,'https://rateyourmusic.com/artist/pixies','http://bit.ly/33ErTlS',28),(197,'Primal Scream',1982,NULL,'https://rateyourmusic.com/artist/primal_scream','http://bit.ly/35PvoHR',46),(198,'Slint',1985,1991,'https://rateyourmusic.com/artist/slint','http://bit.ly/2qhXf4e',125),(199,'Swervedriver',1989,NULL,'https://rateyourmusic.com/artist/swervedriver',NULL,35),(200,'U2',1976,NULL,'https://rateyourmusic.com/artist/u2','http://bit.ly/2RmiWv5',123),(201,'Charlatans, The',1988,NULL,'https://rateyourmusic.com/artist/the_charlatans_f1',NULL,126),(202,'Cramps, The',1976,2009,'https://rateyourmusic.com/artist/the_cramps',NULL,2),(203,'Fugazi',1986,NULL,'https://rateyourmusic.com/artist/fugazi','http://bit.ly/2QkoTXf',127),(204,'Heart Throbs, The',1987,1994,'https://rateyourmusic.com/artist/the_heart_throbs','http://bit.ly/2ZmXpo8',119),(205,'Inspiral Carpets',1983,NULL,'https://rateyourmusic.com/artist/inspiral_carpets',NULL,128),(206,'La\'s, The',1983,2011,'https://rateyourmusic.com/artist/the_las','https://bit.ly/39nLkGj',129),(207,'Lightning Seeds, The',1989,NULL,'https://rateyourmusic.com/artist/the_lightning_seeds',NULL,129),(208,'Pale Saints',1987,1994,'https://rateyourmusic.com/artist/pale_saints','https://ihr.fm/34mqMb7',52),(209,'House Of Love, The',1986,NULL,'https://rateyourmusic.com/artist/the_house_of_love',NULL,130),(210,'Sundays, The',1988,NULL,'https://rateyourmusic.com/artist/the_sundays','http://bit.ly/351kUVb',55),(211,'Alice In Chains',1985,NULL,'https://rateyourmusic.com/artist/alice-in-chains','https://bit.ly/2EfEp50',51),(212,'Bob Mould',1989,NULL,'https://rateyourmusic.com/artist/bob_mould',NULL,132),(213,'Cosmic Psychos',1982,NULL,'https://rateyourmusic.com/artist/cosmic-psychos','https://bit.ly/3o98XXJ',133),(214,'Cure, The',1976,NULL,'https://rateyourmusic.com/artist/the-cure',NULL,134),(215,'Faith No More',1985,NULL,'https://rateyourmusic.com/artist/faith-no-more',NULL,111),(216,'Galaxie 500',1986,1991,'https://rateyourmusic.com/artist/galaxie_500',NULL,28),(217,'Hummingbirds, The',1986,1993,'https://rateyourmusic.com/artist/the_hummingbirds','https://bit.ly/3o8dyJO',135),(218,'Jesus & Mary Chain, The',1983,NULL,'https://rateyourmusic.com/artist/the-jesus-and-mary-chain','https://bit.ly/37HC7Gs',136),(219,'Ramones',1974,1996,'https://rateyourmusic.com/artist/ramones','https://bit.ly/3njCfl4',2),(220,'Stone Roses, The',1983,2017,'https://rateyourmusic.com/artist/the-stone-roses',NULL,64),(221,'The The',1979,NULL,'https://rateyourmusic.com/artist/the-the',NULL,55),(222,'XTC',1972,2006,'https://rateyourmusic.com/artist/xtc',NULL,137),(223,'All About Eve',1985,NULL,'https://rateyourmusic.com/artist/all-about-eve',NULL,55),(224,'Church, The',1980,NULL,'https://rateyourmusic.com/artist/the-church',NULL,135),(225,'Dinosaur Jr.',1984,NULL,'https://rateyourmusic.com/artist/dinosaur-jr',NULL,114),(226,'Go-Betweens, The',1978,2006,'https://rateyourmusic.com/artist/the-go-betweens',NULL,138),(227,'Prefab Sprout',1977,NULL,'https://rateyourmusic.com/artist/prefab-sprout',NULL,139),(228,'Primitives, The',1985,NULL,'https://rateyourmusic.com/artist/the-primitives-2',NULL,140),(229,'Smithereens, The',1980,NULL,'https://rateyourmusic.com/artist/the_smithereens',NULL,141),(230,'They Might Be Giants',1982,NULL,'https://rateyourmusic.com/artist/they-might-be-giants',NULL,28),(231,'Voice Of The Beehive',1986,1996,'https://rateyourmusic.com/artist/voice_of_the_beehive',NULL,55),(232,'Happy Mondays',1980,NULL,'https://rateyourmusic.com/artist/happy-mondays','https://bit.ly/3ncdLeh',142),(233,'Close Lobsters',1984,NULL,'https://rateyourmusic.com/artist/close-lobsters',NULL,143),(234,'David Sylvian',1982,NULL,'https://rateyourmusic.com/artist/david-sylvian',NULL,144),(235,'Housemartins, The',1983,1988,'https://rateyourmusic.com/artist/the_housemartins',NULL,145),(236,'Hüsker Dü',1979,1987,'https://rateyourmusic.com/artist/husker-du',NULL,146),(237,'Replacements, The',1979,2015,'https://rateyourmusic.com/artist/the-replacements',NULL,147),(238,'Smiths, The',1982,1987,'https://rateyourmusic.com/artist/the-smiths',NULL,64),(239,'Beastie Boys',1981,2014,'https://rateyourmusic.com/artist/beastie-boys',NULL,2),(240,'Chameleons, The',1981,2003,'https://rateyourmusic.com/artist/the-chameleons',NULL,148),(241,'Flatmates, The',1985,1989,'https://rateyourmusic.com/artist/the_flatmates',NULL,34),(242,'McCarthy',1985,1990,'https://rateyourmusic.com/artist/mccarthy',NULL,149),(243,'Pet Shop Boys',1981,NULL,'https://rateyourmusic.com/artist/pet_shop_boys',NULL,55),(244,'Siekiera',1983,2011,'https://rateyourmusic.com/artist/siekiera',NULL,150),(245,'A-Ha',1982,NULL,'https://rateyourmusic.com/artist/a_ha',NULL,99),(246,'Dramarama',1982,NULL,'https://rateyourmusic.com/artist/dramarama',NULL,151),(247,'Jacobites',1983,2006,'https://rateyourmusic.com/artist/jacobites',NULL,55),(248,'Killing Joke',1978,NULL,'https://rateyourmusic.com/artist/killing-joke',NULL,55),(249,'Microdisney',1980,1988,'https://rateyourmusic.com/artist/microdisney',NULL,152),(250,'Minor Threat',1980,1983,'https://rateyourmusic.com/artist/minor-threat',NULL,127),(251,'Prince',1978,2016,'https://rateyourmusic.com/artist/prince',NULL,147),(252,'Sielun Veljet',1982,2011,'https://rateyourmusic.com/artist/sielun_veljet',NULL,153),(253,'Talking Heads',1975,1992,'https://rateyourmusic.com/artist/talking_heads',NULL,2),(254,'Tom Waits',1973,NULL,'https://rateyourmusic.com/artist/tom-waits',NULL,154),(255,'Cocteau Twins',1981,1997,'https://rateyourmusic.com/artist/cocteau-twins',NULL,155),(256,'Echo & The Bunnymen',1978,NULL,'https://rateyourmusic.com/artist/echo-and-the-bunnymen','https://bit.ly/3o23ySn',129),(257,'Felt',1979,1989,'https://rateyourmusic.com/artist/felt',NULL,156),(258,'Talk Talk',1981,1991,'https://rateyourmusic.com/artist/talk-talk',NULL,55),(259,'Hoodoo Gurus',1981,NULL,'https://rateyourmusic.com/artist/hoodoo_gurus',NULL,135),(260,'Icicle Works, The',1980,NULL,'https://rateyourmusic.com/artist/the_icicle_works',NULL,129),(261,'Meat Puppets',1980,NULL,'https://rateyourmusic.com/artist/meat-puppets',NULL,157),(262,'Minutemen',1980,1985,'https://rateyourmusic.com/artist/minutemen',NULL,158),(263,'New Model Army',1980,NULL,'https://rateyourmusic.com/artist/new-model-army',NULL,159),(264,'Simple Minds',1977,NULL,'https://rateyourmusic.com/artist/simple-minds',NULL,46),(265,'Aztec Camera',1980,1996,'https://rateyourmusic.com/artist/aztec-camera',NULL,136),(266,'Bauhaus',1978,2008,'https://rateyourmusic.com/artist/bauhaus',NULL,160),(267,'Sad Lovers & Giants',1981,NULL,'https://rateyourmusic.com/artist/sad_lovers_and_giants',NULL,161),(268,'Suicidal Tendencies',1981,NULL,'https://rateyourmusic.com/artist/suicidal-tendencies',NULL,162),(269,'Three O\'Clock, The',1982,1988,'https://rateyourmusic.com/artist/the-three-oclock',NULL,47),(270,'Violent Femmes',1980,NULL,'https://rateyourmusic.com/artist/violent-femmes',NULL,163),(271,'Waterboys, The',1982,NULL,'https://rateyourmusic.com/artist/the-waterboys',NULL,55),(272,'Wipers',1977,1999,'https://rateyourmusic.com/artist/wipers','http://bit.ly/2KKHI48',50),(273,'Barracudas, The',1978,NULL,'https://rateyourmusic.com/artist/the-barracudas',NULL,55),(274,'Clash, The',1976,1986,'https://rateyourmusic.com/artist/the_clash',NULL,55),(275,'dB\'s, The',1977,NULL,'https://rateyourmusic.com/artist/the-dbs',NULL,2),(276,'Dead Kennedys',1978,NULL,'https://rateyourmusic.com/artist/dead_kennedys',NULL,111),(277,'A Flock Of Seagulls',1979,NULL,'https://rateyourmusic.com/artist/a-flock-of-seagulls',NULL,129),(278,'Jam, The',1972,1982,'https://rateyourmusic.com/artist/the_jam','https://bit.ly/3onioCO',164),(279,'Misfits',1977,NULL,'https://rateyourmusic.com/artist/misfits',NULL,165),(280,'Mission Of Burma',1979,2016,'https://rateyourmusic.com/artist/mission_of_burma','https://bit.ly/2OLjCKO',28),(281,'Beat, The',1979,NULL,'https://rateyourmusic.com/artist/the_beat_f1','https://bit.ly/3rKrYCa',111),(282,'Psychedelic Furs, The',1977,NULL,'https://rateyourmusic.com/artist/the_psychedelic_furs','https://bit.ly/385v4bQ',55),(283,'Roxy Music',1971,2011,'https://rateyourmusic.com/artist/roxy-music',NULL,55),(284,'Siouxsie & The Banshees',1976,2002,'https://rateyourmusic.com/artist/siouxsie-and-the-banshees',NULL,55),(285,'Black Flag',1976,NULL,'https://rateyourmusic.com/artist/black-flag',NULL,166),(286,'Durutti Column, The',1978,NULL,'https://rateyourmusic.com/artist/the-durutti-column','https://bit.ly/384gUI5',64),(287,'Franco Battiato',1972,NULL,'https://rateyourmusic.com/artist/franco-battiato','https://bit.ly/358Lmz2',167),(288,'Go-Go\'s',1977,NULL,'https://rateyourmusic.com/artist/go-gos',NULL,47),(289,'Gun Club, The',1980,1996,'https://rateyourmusic.com/artist/the-gun-club','https://bit.ly/3hvVff2',47),(290,'Plimsouls, The',1978,NULL,'https://rateyourmusic.com/artist/the_plimsouls','https://bit.ly/3nakCEa',47),(291,'Robyn Hitchcock',1981,NULL,'https://rateyourmusic.com/artist/robyn_hitchcock','https://bit.ly/2LaJ0IG',55),(292,'Rolling Stones, The',1962,NULL,'https://rateyourmusic.com/artist/the-rolling-stones',NULL,55),(293,'Sunnyboys',1980,1990,'https://rateyourmusic.com/artist/sunnyboys','https://bit.ly/355tkxn',135),(294,'Television Personalities',1977,NULL,'https://rateyourmusic.com/artist/television-personalities','https://bit.ly/3od70cJ',55),(295,'Devo',1972,NULL,'https://rateyourmusic.com/artist/devo',NULL,168),(296,'Feelies, The',1976,NULL,'https://rateyourmusic.com/artist/the_feelies','https://bit.ly/2LtqICp',169),(297,'Joy Division',1977,1980,'https://rateyourmusic.com/artist/joy_division',NULL,142),(298,'Motörhead',1975,2015,'https://rateyourmusic.com/artist/motorhead','https://bit.ly/3bKioJU',55),(299,'Pretenders',1978,NULL,'https://rateyourmusic.com/artist/pretenders',NULL,55),(300,'Soft Boys, The',1976,2003,'https://rateyourmusic.com/artist/the_soft_boys','https://bit.ly/3s1qFyv',170),(301,'Sound, The',1979,1988,'https://rateyourmusic.com/artist/the_sound','https://bit.ly/38ksGy1',55),(302,'Squeeze',1974,NULL,'https://rateyourmusic.com/artist/squeeze',NULL,55),(303,'Stiff Little Fingers',1977,NULL,'https://rateyourmusic.com/artist/stiff_little_fingers','https://bit.ly/2Xfd48X',76),(304,'Ultravox',1973,2018,'https://rateyourmusic.com/artist/ultravox','https://bit.ly/38kwxLJ',55);
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `autores_retirados`
--

DROP TABLE IF EXISTS `autores_retirados`;
/*!50001 DROP VIEW IF EXISTS `autores_retirados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `autores_retirados` AS SELECT 
 1 AS `nombre_autor`,
 1 AS `anos_activo`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `canciones`
--

DROP TABLE IF EXISTS `canciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `canciones` (
  `id_cancion` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `titulo_cancion` varchar(100) DEFAULT NULL,
  `pista` char(2) DEFAULT NULL,
  `votos_facebook` tinyint(3) unsigned DEFAULT NULL,
  `votos_web` smallint(5) unsigned DEFAULT NULL,
  `nota_media` decimal(3,2) DEFAULT NULL,
  `enlace_youtube` varchar(100) DEFAULT NULL,
  `id_lista` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_cancion`),
  KEY `fk_canciones_1` (`id_lista`),
  CONSTRAINT `fk_canciones_1` FOREIGN KEY (`id_lista`) REFERENCES `listas` (`id_lista`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `canciones`
--

LOCK TABLES `canciones` WRITE;
/*!40000 ALTER TABLE `canciones` DISABLE KEYS */;
INSERT INTO `canciones` VALUES (1,'Everlasting light','01',0,0,NULL,'https://www.youtube.com/watch?v=OzqIVxOa5xg',1),(2,'Zero','02',5,0,NULL,'https://www.youtube.com/watch?v=pmGNo8RL5kM',1),(3,'Stadium love','03',3,0,NULL,'https://www.youtube.com/watch?v=6N4a7RX5x7E',1),(4,'Drumming song','04',7,0,NULL,'https://www.youtube.com/watch?v=boo2Zm69fhY',1),(5,'Si tu suis mon regard','05',3,0,NULL,'https://www.youtube.com/watch?v=YRKzYJVcnnQ',1),(6,'Luna park','06',2,0,NULL,'https://www.youtube.com/watch?v=3Rh6xKoAtkI',1),(7,'Sea of tears','07',3,0,NULL,'https://www.youtube.com/watch?v=XtNay2TObgY',1),(8,'Southern point','08',1,0,NULL,'https://www.youtube.com/watch?v=QoLGJRAtoIs',1),(9,'Black swan','09',0,0,NULL,'https://www.youtube.com/watch?v=7c9YDgL5yDA',1),(10,'Beach','10',0,0,NULL,'https://www.youtube.com/watch?v=puhT57jD2KE',1),(11,'Sylvia','11',2,0,NULL,'https://www.youtube.com/watch?v=i9nYI0ezoOQ',1),(12,'Gentle sons','12',2,0,NULL,'https://www.youtube.com/watch?v=GAxXTC-poHs',1),(13,'Sea within a sea','13',4,0,NULL,'https://www.youtube.com/watch?v=v7WAHnZPIX0',1),(14,'Bled to be free (The operation)','14',0,0,NULL,'https://www.youtube.com/watch?v=qN5Piy5sXoU',1),(15,'Architect of new beginnings','15',0,0,NULL,'https://www.youtube.com/watch?v=StPfKmlm5bk',1),(16,'Not for want of trying','01',1,0,NULL,'https://www.youtube.com/watch?v=pfvNWxoKNng',2),(17,'Verses','02',0,0,NULL,'https://www.youtube.com/watch?v=UGsJjogCnCw',2),(18,'Microcastle','03',1,0,NULL,'https://www.youtube.com/watch?v=IGTNPbmAe34',2),(19,'Wishing well','04',0,0,NULL,'https://www.youtube.com/watch?v=wPciRpw3oCg',2),(20,'My time outside the womb','05',0,0,NULL,'https://www.youtube.com/watch?v=rm-oBDBVinA',2),(21,'Kiss me','06',1,0,NULL,'https://www.youtube.com/watch?v=qGfAbS8950o',2),(22,'My mistakes were made for you','07',2,0,NULL,'https://www.youtube.com/watch?v=9cQloro92xA',2),(23,'White winter hymnal','08',7,0,NULL,'https://www.youtube.com/watch?v=DrQRS40OKNE',2),(24,'A & E','09',2,0,NULL,'https://www.youtube.com/watch?v=p7Ptai9I6eo',2),(25,'Sudden death, over time','10',0,0,NULL,'https://www.youtube.com/watch?v=i4VltjR_PzE',2),(26,'Við spilum endalaust','11',2,0,NULL,'https://www.youtube.com/watch?v=5hXgWmjiqms',2),(27,'Festival thyme','12',0,0,NULL,'https://www.youtube.com/watch?v=8OOEnObEhBo',2),(28,'The modern leper','13',0,0,NULL,'https://www.youtube.com/watch?v=A-QSW90vGoY',2),(29,'Mansard roof','14',1,0,NULL,'https://www.youtube.com/watch?v=JlgNFwoApec',2),(30,'Kids','15',8,0,NULL,'https://www.youtube.com/watch?v=fe4EK4HSPkI',2),(31,'Souvenirs d\'un autre monde','01',0,0,NULL,'https://www.youtube.com/watch?v=HWI2j5TqlrQ',3),(32,'No cars go','02',7,0,NULL,'https://www.youtube.com/watch?v=tH8P04nxHss',3),(33,'Rays on pinion','13',3,0,NULL,'https://www.youtube.com/watch?v=W1pwgZy95as',3),(34,'Creature fear','08',5,0,NULL,'https://www.youtube.com/watch?v=0sXwhv0hEBk',3),(35,'Evicted','06',0,0,NULL,'https://www.youtube.com/watch?v=dyVmR3cCoS8',3),(36,'Milk lizard','14',1,0,NULL,'https://www.youtube.com/watch?v=xMEYLlDThZU',3),(37,'Farewell, farewell','07',0,0,NULL,'https://www.youtube.com/watch?v=NT0TaJ7tYLs',3),(38,'Catastrophe and the cure','12',1,0,NULL,'https://www.youtube.com/watch?v=whQcxU5T9qM',3),(39,'Grow on, grow up, grow out','11',0,0,NULL,'https://www.youtube.com/watch?v=AT0HezehE5s',3),(40,'Mistaken for strangers','09',1,0,NULL,'https://www.youtube.com/watch?v=cgRsYkKb1eI',3),(41,'Eoarchaean (The great void)','15',1,0,NULL,'https://www.youtube.com/watch?v=cleCocGsl80',3),(42,'Voltaic crusher','04',1,0,NULL,'https://www.youtube.com/watch?v=CxCjcXfYLSk',3),(43,'Jigsaw falling into place','10',4,0,NULL,'https://www.youtube.com/watch?v=jJD6wXLraEA',3),(44,'Run-away','03',0,0,NULL,'https://www.youtube.com/watch?v=BANdftxuqlM',3),(45,'Hop a plane','05',1,0,NULL,'https://www.youtube.com/watch?v=wKSoP-IG_E4',3),(46,'So divided','03',1,0,NULL,'https://www.youtube.com/watch?v=AXxfXSC-LEI',4),(47,'3000 flowers','04',2,0,NULL,'https://www.youtube.com/watch?v=Ks8BwZDq5z0',4),(48,'Further ahead of warp','10',0,0,NULL,'https://www.youtube.com/watch?v=lEFWSlTsvrs',4),(49,'Frozen twilight','01',3,0,NULL,'https://www.youtube.com/watch?v=plvTaQYAgdI',4),(50,'Dulcinea','13',2,0,NULL,'https://www.youtube.com/watch?v=xZL38kFYs6U',4),(51,'Malachite','09',1,0,NULL,'https://www.youtube.com/watch?v=vdlMJmyuuSY',4),(52,'My shadow','11',2,0,NULL,'https://www.youtube.com/watch?v=7osvMQ-w2EE',4),(53,'Consternation','14',2,0,NULL,'https://www.youtube.com/watch?v=BuAXWODvIuo',4),(54,'Roscoe','05',2,1,3.00,'https://www.youtube.com/watch?v=yTcBhW_M0N8',4),(55,'Glasgow mega-snake','02',2,0,NULL,'https://www.youtube.com/watch?v=ag1Lu5-OkM8',4),(56,'Giver','06',0,0,NULL,'https://www.youtube.com/watch?v=LC97SDkCy8E',4),(57,'Carpe','12',0,0,NULL,'https://www.youtube.com/watch?v=i4SX-8c2N-Y',4),(58,'Johnny Viola','07',0,0,NULL,'https://www.youtube.com/watch?v=ubpMhFK8-SM',4),(59,'Lazy eye','08',1,0,NULL,'https://www.youtube.com/watch?v=z-mxBDuRaZ8',4),(60,'L\'angoisse du veilleur de nuit d\'autoroute les soirs d\'alarme à accident','15',0,0,NULL,'https://www.youtube.com/watch?v=UCpsA_YaC_I',4),(61,'The rest will follow','14',0,0,NULL,'https://www.youtube.com/watch?v=5itgMTaJSo8',5),(62,'23kid','13',0,0,NULL,'https://www.youtube.com/watch?v=VsAvHvSvgzc',5),(63,'It\'s all gonna break','09',0,0,NULL,'https://www.youtube.com/watch?v=1rJ2gxetgm4',5),(64,'The skin of my yellow country teeth','10',6,0,NULL,'https://www.youtube.com/watch?v=pDaykt6o6_w',5),(65,'Fuck forever','04',4,0,NULL,'https://www.youtube.com/watch?v=pOpz_3O5Lho',5),(66,'Best of you','15',6,0,NULL,'https://www.youtube.com/watch?v=h_L4Rixya64',5),(67,'Down river','08',1,0,NULL,'https://www.youtube.com/watch?v=Yw0KnVxwFao',5),(68,'The lost you','12',2,0,NULL,'https://www.youtube.com/watch?v=FxhytokIRL8',5),(69,'California','06',3,0,NULL,'https://www.youtube.com/watch?v=2ox-C4nb6-8',5),(70,'Teen angst','11',3,0,NULL,'https://www.youtube.com/watch?v=rZnJciiFIYI',5),(71,'Star bodies','02',1,0,NULL,'https://www.youtube.com/watch?v=lMi37qMtkmA',5),(72,'The latest toughs','05',0,0,NULL,'https://open.spotify.com/embed/playlist/4WCBk7WJiShaVHeiAc421e',5),(73,'I must leave London','07',0,0,NULL,'https://www.youtube.com/watch?v=TSp5m7aveP8',5),(74,'Glósóli','01',5,0,NULL,'https://www.youtube.com/watch?v=Bz8iEJeh26E',5),(75,'Rollercoaster','03',2,1,5.00,'https://www.youtube.com/watch?v=_uNwYVBO-Gc',5),(76,'Retreat! Retreat!','14',0,0,NULL,'http://www.youtube.com/watch?v=WneDU-K3Sww',6),(77,'The lake','10',1,0,NULL,'https://www.youtube.com/watch?v=Ye1za5I0epo',6),(78,'Neighborhood #1 (Tunnels)','02',8,0,NULL,'https://www.youtube.com/watch?v=b3T6PNEIQW8',6),(79,'Crossing over','01',2,0,NULL,'https://www.youtube.com/watch?v=VwrtWa3kEhw',6),(80,'Come home, Billy Bird','08',7,0,NULL,'https://www.youtube.com/watch?v=dElPrd7qEdo',6),(81,'A passing feeling','09',3,0,NULL,'https://www.youtube.com/watch?v=f0c45X4lnkM',6),(82,'Traquer la fièvre massacrer l\'ennui','13',1,0,NULL,'https://www.youtube.com/watch?v=E9ixq-J4bP0',6),(83,'Evil','04',6,0,NULL,'https://www.youtube.com/watch?v=dkpgz3uQ58U',6),(84,'Mr. Brightside','05',7,0,NULL,'http://www.youtube.com/watch?v=gGdGFtwCNBE',6),(85,'Cayman Islands','11',6,0,NULL,'http://www.youtube.com/watch?v=c-ppARtcQfo',6),(86,'Float on','03',5,0,NULL,'http://www.youtube.com/watch?v=CTAud5O7Qqk',6),(87,'Irish blood, English heart','06',10,0,NULL,'https://www.youtube.com/watch?v=KKoS5X4SMrY',6),(88,'There she goes, my beautiful world','07',5,0,NULL,'https://www.youtube.com/watch?v=Eot0YVc1QU0',6),(89,'Raid aereo sul paese delle farfalle','15',0,0,NULL,'https://www.youtube.com/watch?v=9GsXJhfQK2E',6),(90,'Spiders (Kidsmoke)','12',3,0,NULL,'https://www.youtube.com/watch?v=JxUTKJztzVQ',6),(91,'Mach schau','14',0,0,NULL,'https://www.youtube.com/watch?v=Jsizpv6VCHM',7),(92,'Jessica','08',5,0,NULL,'https://www.youtube.com/watch?v=50hgSfdyCUw',7),(93,'You own me','10',1,1,4.00,'https://www.youtube.com/watch?v=HMcR168JVgY',7),(94,'Wheeling','11',2,0,NULL,'https://www.youtube.com/watch?v=uhofOUE7m2E',7),(95,'Saturday morning','02',7,0,NULL,'http://www.youtube.com/watch?v=x8fj3rQ9vdc',7),(96,'The only moment we were alone','01',2,0,NULL,'https://www.youtube.com/watch?v=7UYfIXFaKm0',7),(97,'Ban marriage','04',0,0,NULL,'https://www.youtube.com/watch?v=ba4fdp8YP7M',7),(98,'Vincent O\'Brien','06',2,0,NULL,'https://www.youtube.com/watch?v=VMMGuky8iQc',7),(99,'Take the veil cerpin taxt','15',4,0,NULL,'https://www.youtube.com/watch?v=riFy6buvidU',7),(100,'2 + 2 = 5','13',6,0,NULL,'https://www.youtube.com/watch?v=X5seBmjHvks',7),(101,'That great love sound','03',9,0,NULL,'http://www.youtube.com/watch?v=Akl3k1kcPvY',7),(102,'Run for me','07',5,0,NULL,'https://www.youtube.com/watch?v=fSI21HqpmkE',7),(103,'Venus & Serena','05',2,0,NULL,'https://www.youtube.com/watch?v=m_PanQbiM7o',7),(104,'My oblivion','09',3,0,NULL,'https://www.youtube.com/watch?v=OFUhGZyorjs',7),(105,'Happy','12',0,0,NULL,'https://www.youtube.com/watch?v=5J4FmU0o70I',7),(106,'Baudelaire','04',2,0,NULL,'https://www.youtube.com/watch?v=5iYU240PP4s',8),(107,'Lost cause','09',5,0,NULL,'http://www.youtube.com/watch?v=qkNa5xzOe5U',8),(108,'Don\'t bring us down','08',2,0,NULL,'https://www.youtube.com/watch?v=DmD9P6B75yE',8),(109,'If this is a plan','02',3,0,NULL,'https://www.youtube.com/watch?v=I3BHJZLX51U',8),(110,'Greater Omaha','13',2,0,NULL,'https://www.youtube.com/watch?v=pEFWgB9OPlA',8),(111,'No more art','06',0,0,NULL,'https://www.youtube.com/watch?v=EC2A-N4Zs-A',8),(112,'Pounding','12',3,0,NULL,'https://www.youtube.com/watch?v=j21WcqsG4Zc',8),(113,'The band','03',8,0,NULL,'https://www.youtube.com/watch?v=_Jmxyjrza5E',8),(114,'Sabbath','11',0,0,NULL,'https://www.youtube.com/watch?v=lbamAg4sw1M',8),(115,'Green grass of tunnel','10',2,0,NULL,'https://www.youtube.com/watch?v=l5hBkQT3-C8',8),(116,'Blizzard of \'77','07',9,0,NULL,'https://www.youtube.com/watch?v=zmuaOWCesDU',8),(117,'Rapture','05',0,0,NULL,'https://www.youtube.com/watch?v=6Fvcbd3By-Q',8),(118,'Gonna leave you','14',5,0,NULL,'https://www.youtube.com/watch?v=H2IsCQxACXc',8),(119,'(Samskeyti)','01',1,0,NULL,'https://www.youtube.com/watch?v=uDHiArTSOMQ',8),(120,'Cut your ribbon','15',0,0,NULL,'http://www.youtube.com/watch?v=Eik6dKEljtE',8),(121,'Pacific palisades','03',1,0,NULL,'https://www.youtube.com/watch?v=3BXNSELJZ5A',9),(122,'Who will save rock and roll?','13',2,0,NULL,'https://www.youtube.com/watch?v=de5QKLICNcA',9),(123,'Aujourd\'hui, maintenant','06',1,0,NULL,'https://www.youtube.com/watch?v=r-w8vDLUCSM',9),(124,'Yasmin the Light','01',0,0,NULL,'https://www.youtube.com/watch?v=hDH0xYa8odw',9),(125,'Like a forest','09',0,0,NULL,'https://www.youtube.com/watch?v=KIyje4TEfcg',9),(126,'Nite and fog','08',2,0,NULL,'https://www.youtube.com/watch?v=nEfa0EnYa8I',9),(127,'You don\'t know Jesus','11',5,0,NULL,'https://www.youtube.com/watch?v=hyV6mGoOA5g',9),(128,'Crystal','05',6,0,NULL,'https://www.youtube.com/watch?v=KVMyXDsadLQ',9),(129,'Pyramid song','10',2,0,NULL,'https://www.youtube.com/watch?v=3M_Gg1xAHE4',9),(130,'Piano fire','07',0,0,NULL,'https://www.youtube.com/watch?v=uRiH33joszQ',9),(131,'Last nite','04',9,0,NULL,'https://www.youtube.com/watch?v=TOypSnKFHrE',9),(132,'(Drawing) Rings around the World','02',3,0,NULL,'https://www.youtube.com/watch?v=-i2Kn-EXh_A',9),(133,'The redhead Kelly','14',0,0,NULL,'http://www.youtube.com/watch?v=eMUYNi2PUfk',9),(134,'Ticks & leeches','15',5,0,NULL,'https://www.youtube.com/watch?v=o5_OoGLKmZ0',9),(135,'Glorious day','12',10,0,NULL,'https://www.youtube.com/watch?v=1M8OCUNixv8',9),(136,'Fuel to burn','14',0,0,NULL,'https://www.youtube.com/watch?v=u3YRUl_MZ9k',10),(137,'One armed scissor','15',4,0,NULL,'https://www.youtube.com/watch?v=7NYbojdoAQE',10),(138,'Everybody\'s stalking','07',0,0,NULL,'https://www.youtube.com/watch?v=YfJYLsMaxUY',10),(139,'Legal man','09',5,0,NULL,'https://www.youtube.com/watch?v=gGJ3f1Z-Yl4',10),(140,'Witness','06',3,0,NULL,'https://www.youtube.com/watch?v=m-weIsCBGd0',10),(141,'Catch the sun','02',4,0,NULL,'https://www.youtube.com/watch?v=NH5mcvT_R4U',10),(142,'Son of Sam','05',1,0,NULL,'http://www.youtube.com/watch?v=afeAUndotas',10),(143,'We love the city','04',4,0,NULL,'https://www.youtube.com/watch?v=_y9j87b8xDY',10),(144,'Letter from an occupant','10',0,0,NULL,'https://www.youtube.com/watch?v=XBAUQaj6EJo',10),(145,'This is love','11',5,0,NULL,'https://www.youtube.com/watch?v=STxXS5lLunE',10),(146,'Too young','03',6,0,NULL,'https://www.youtube.com/watch?v=yIOL5SSjWdw',10),(147,'Black-eyed','13',5,0,NULL,'https://www.youtube.com/watch?v=GFTRii2Rz_o',10),(148,'The national anthem','01',6,0,NULL,'https://www.youtube.com/watch?v=9M1fLH-3T_U',10),(149,'Stand inside your love','12',1,0,NULL,'https://www.youtube.com/watch?v=2nm4xv3firw',10),(150,'You\'re pretty good looking (for a girl)','08',4,0,NULL,'https://www.youtube.com/watch?v=wsz9OFVf72Q',10),(151,'Mistakes & regrets','06',1,0,NULL,'https://www.youtube.com/watch?v=C_nuZ-9dIFw',11),(152,'Sexx laws','13',4,0,NULL,'https://www.youtube.com/watch?v=IQfwgzoiq4c',11),(153,'Coffee & TV','10',10,0,NULL,'https://www.youtube.com/watch?v=6oqXVx3sBOk',11),(154,'Hey boy, hey girl','15',7,0,NULL,'https://www.youtube.com/watch?v=c8-kj1GkbfU',11),(155,'Instant street','08',2,0,NULL,'https://www.youtube.com/watch?v=uyA01nH72NI',11),(156,'What is the light?','12',1,0,NULL,'https://www.youtube.com/watch?v=H1elksDoJB8',11),(157,'The shift to superoverdrive','03',5,0,NULL,'https://www.youtube.com/watch?v=LwqX722hFAQ',11),(158,'Teenage FBI','07',3,1,4.00,'https://www.youtube.com/watch?v=r5nSrO1npVY',11),(159,'Vocode-inn','01',1,1,3.00,'https://www.youtube.com/watch?v=15bMZGymXFw',11),(160,'Deceptacon','14',5,0,NULL,'https://www.youtube.com/watch?v=P-JP5PQSSIk',11),(161,'We\'re in this together','05',1,0,NULL,'https://www.youtube.com/watch?v=P9BfvPjsXXw',11),(162,'Parallel universe','04',1,0,NULL,'https://www.youtube.com/watch?v=zNWGHyPAPhc',11),(163,'Hum','02',2,0,NULL,'https://www.youtube.com/watch?v=l3vVfEEZu-k',11),(164,'Viðrar vel til loftárása','11',3,0,NULL,'https://www.youtube.com/watch?v=akYuy2FMQk4',11),(165,'Turn','09',5,0,NULL,'https://www.youtube.com/watch?v=v3tb-m0Ez4I',11),(166,'Jesus says','03',7,0,NULL,'https://www.youtube.com/watch?v=xsazucpLsCQ',12),(167,'Dirty dream number two','06',7,0,NULL,'https://www.youtube.com/watch?v=zvqhSMAlkhQ',12),(168,'Oh well, okay','09',4,0,NULL,'https://www.youtube.com/watch?v=dJkzRHE8Es8',12),(169,'You stole the sun from my heart','04',5,0,NULL,'https://www.youtube.com/watch?v=YkDaCWXIXCE',12),(170,'Angel','01',7,0,NULL,'https://www.youtube.com/watch?v=hbe3CQamF8k',12),(171,'The king of Carrot Flowers (parts 2 & 3)','11',6,0,NULL,'https://www.youtube.com/watch?v=LjQvCqwxFhA',12),(172,'You don\'t care about us','02',10,0,NULL,'https://www.youtube.com/watch?v=Sv8PZwsRLWs',12),(173,'This is hardcore','10',14,0,NULL,'https://www.youtube.com/watch?v=JXbLyi5wgeg',12),(174,'At my most beautiful','08',4,0,NULL,'https://www.youtube.com/watch?v=UIXs66BPooY',12),(175,'Sylvie','07',7,0,NULL,'https://www.youtube.com/watch?v=gXFYpEn19ig',12),(176,'Perfect','05',8,0,NULL,'https://www.youtube.com/watch?v=VKYY8DxVZHE',12),(177,'Pig','13',2,0,NULL,'https://www.youtube.com/watch?v=BChww2pEZUs',12),(178,'Do the vampire','12',4,0,NULL,'https://www.youtube.com/watch?v=rDxN0GSnIr0',12),(179,'Danny go','14',3,0,NULL,'https://www.youtube.com/watch?v=ZDSWJm_NDqQ',12),(180,'Are you ready (for some darkness)?','15',2,0,NULL,'https://www.youtube.com/watch?v=j6ZehZ-w9KA',12),(181,'Chinese bombs','05',3,0,NULL,'https://www.youtube.com/watch?v=YLaOVWhLgnI',13),(182,'I would hurt a fly','10',4,1,4.00,'https://www.youtube.com/watch?v=e7x20s-Vyn4',13),(183,'Block rockin\' beats','15',3,0,NULL,'https://www.youtube.com/watch?v=iTxOKsyZ0Lw',13),(184,'Every day should be a holiday','03',2,0,NULL,'https://www.youtube.com/watch?v=FuFtfhOipNQ',13),(185,'Home','14',5,0,NULL,'https://www.youtube.com/watch?v=DZHs-SRJbzU',13),(186,'Angeles','11',4,0,NULL,'https://www.youtube.com/watch?v=SznTtnBWMLw',13),(187,'Tracy','01',1,0,NULL,'https://www.youtube.com/watch?v=7rSugFINEWw',13),(188,'Stand by me','07',7,0,NULL,'https://www.youtube.com/watch?v=maTP315XZCQ',13),(189,'Shady lane','09',6,0,NULL,'https://www.youtube.com/watch?v=G-mQxmrZJn8',13),(190,'Let down','13',9,0,NULL,'https://www.youtube.com/watch?v=zR_coyDFDhs',13),(191,'One more hour','04',4,0,NULL,'https://www.youtube.com/watch?v=Q8gOxKv2Wkg',13),(192,'Electricity','06',5,0,NULL,'https://www.youtube.com/watch?v=WYn74HY1KgQ',13),(193,'Let\'s pretend','12',2,0,NULL,'https://www.youtube.com/watch?v=ljsKfJrKK-k',13),(194,'Sonnet','08',8,0,NULL,'https://www.youtube.com/watch?v=r2vGa-yLiso',13),(195,'Dry the rain','02',3,0,NULL,'https://www.youtube.com/watch?v=yXIR-u982uA',13),(196,'Kung fu','03',7,0,NULL,'https://www.youtube.com/watch?v=dWqY8qrBBSI',14),(197,'Like Dylan in the movies','06',11,0,NULL,'https://www.youtube.com/watch?v=RYnEulW6IYk',14),(198,'Great divide','07',1,0,NULL,'https://www.youtube.com/watch?v=vp9lnLLfsK4',14),(199,'Radiation vibe','01',9,0,NULL,'https://www.youtube.com/watch?v=rmqswLKKYyU',14),(200,'A design for life','05',5,0,NULL,'https://www.youtube.com/watch?v=TfEoVxy7VDQ',14),(201,'\'S numbness','13',1,0,NULL,'https://www.youtube.com/watch?v=SO8v_hc8uXc',14),(202,'Popular','11',7,0,NULL,'https://www.youtube.com/watch?v=RNc45FTenhg',14),(203,'Nancy boy','12',8,0,NULL,'https://www.youtube.com/watch?v=PBxuq_eWW94',14),(204,'Statuesque','04',2,0,NULL,'https://www.youtube.com/watch?v=1Jy_cf8Q0IY',14),(205,'Mantra slider','10',2,0,NULL,'https://www.youtube.com/watch?v=gHPQHxDo1qE',14),(206,'Cybele\'s reverie','08',5,0,NULL,'https://www.youtube.com/watch?v=b7sDHQd0hyI',14),(207,'By the sea','09',6,0,NULL,'https://www.youtube.com/watch?v=RlLFNSmL6pQ',14),(208,'Stinkfist','15',6,0,NULL,'https://www.youtube.com/watch?v=6zpvlMp04D0',14),(209,'Bad mongo','14',2,0,NULL,'https://www.youtube.com/watch?v=O1nWm30dm8U',14),(210,'Why bother?','02',6,0,NULL,'https://www.youtube.com/watch?v=ZlUNz9xODUE',14),(211,'Globe alone','13',10,0,NULL,'https://www.youtube.com/watch?v=nC4NXkic4ew',15),(212,'Great things','03',11,0,NULL,'https://www.youtube.com/watch?v=FCHUyISRtcc',15),(213,'Carnival','06',9,0,NULL,'https://www.youtube.com/watch?v=7bK5EPjGri4',15),(214,'Connection','10',26,0,NULL,'https://www.youtube.com/watch?v=ilKcXIFi-Rc',15),(215,'Needle in the hay','07',5,0,NULL,'https://www.youtube.com/watch?v=IGw8xZ_z-pg',15),(216,'Vow','11',8,0,NULL,'https://www.youtube.com/watch?v=qZsVcoWRIkY',15),(217,'Heaven beside you','15',1,0,NULL,'https://www.youtube.com/watch?v=TEAylKJb-to',15),(218,'Stars','14',1,0,NULL,'https://www.youtube.com/watch?v=gMEB4HNNZ2I',15),(219,'Champagne supernova','01',16,0,NULL,'https://www.youtube.com/watch?v=tI-5uv4wryI',15),(220,'Common people','02',19,0,NULL,'https://www.youtube.com/watch?v=yuTMWgOduFM',15),(221,'Sulk','05',7,0,NULL,'https://www.youtube.com/watch?v=gdE8b1JaJaA',15),(222,'Summer dress','08',2,0,NULL,'https://www.youtube.com/watch?v=4fGsFeaH1xg',15),(223,'1979','04',13,0,NULL,'https://www.youtube.com/watch?v=4aeETEoNfOg',15),(224,'Caught by the fuzz','12',8,0,NULL,'https://www.youtube.com/watch?v=GNIMuvbiZcc',15),(225,'Don\'t look back','09',16,0,NULL,'https://www.youtube.com/watch?v=TPDJXjhQQmU',15),(226,'To the end','06',22,0,NULL,'https://www.youtube.com/watch?v=0DjHKqb365A',16),(227,'Sick & tired','05',5,0,NULL,'https://www.youtube.com/watch?v=gxdJqncir4Y',16),(228,'Today tomorrow sometime never','04',5,0,NULL,'https://www.youtube.com/watch?v=7Ep87MzELlY',16),(229,'The goldheart mountaintop queen directory','11',3,0,NULL,'https://www.youtube.com/watch?v=i2Al3fpJJ70',16),(230,'Grace','01',8,0,NULL,'https://www.youtube.com/watch?v=A3adFWKE9JE',16),(231,'Hypocrite','02',4,0,NULL,'https://www.youtube.com/watch?v=qGVzyby5kcU',16),(232,'Why don\'t you find out for yourself','09',1,0,NULL,'https://www.youtube.com/watch?v=4WJsmrnsPus',16),(233,'Whatever','08',12,0,NULL,'https://www.youtube.com/watch?v=EHfx9LXzxpw',16),(234,'Elevate me later','10',12,0,NULL,'https://www.youtube.com/watch?v=g2mruNLMPv0',16),(235,'Babies','03',15,0,NULL,'https://www.youtube.com/watch?v=38by00DGid0',16),(236,'Magnet\'s coil','12',3,0,NULL,'https://www.youtube.com/watch?v=k3abMhqv558',16),(237,'Black hole sun','13',10,0,NULL,'https://www.youtube.com/watch?v=3mbBbFH9fAg',16),(238,'Stay together','07',11,0,NULL,'https://www.youtube.com/watch?v=LPfhAksS28g',16),(239,'Creepy jackalope eye','14',3,0,NULL,'https://www.youtube.com/watch?v=MCh0bLxqtHQ?start=20',16),(240,'My name is Jonas','15',17,0,NULL,'https://www.youtube.com/watch?v=yv8fvKbrC_A',16),(241,'Gratitude walks','09',2,1,4.00,'https://www.youtube.com/watch?v=FDJUDTgu7Xs',17),(242,'Villa Rosie','10',10,0,NULL,'https://www.youtube.com/watch?v=Wl_6h8mTY84',17),(243,'I hang suspended','05',5,1,4.00,'https://www.youtube.com/watch?v=ImatMDcsNL4',17),(244,'The nude','06',1,0,NULL,'https://www.youtube.com/watch?v=tbtenLqYYS4',17),(245,'Walking in my shoes','01',9,0,NULL,'https://www.youtube.com/watch?v=GrC_yuzO-Ss',17),(246,'Laid','04',6,0,NULL,'https://www.youtube.com/watch?v=g_qZ5B-yioU',17),(247,'Rearviewmirror','15',9,0,NULL,'https://www.youtube.com/watch?v=dncsY7Kpw04',17),(248,'Dream all day','12',7,0,NULL,'https://www.youtube.com/watch?v=lM1U78RLChY',17),(249,'Creep','02',11,0,NULL,'https://www.youtube.com/watch?v=XFkzRNyygfk',17),(250,'Katy song','08',2,0,NULL,'https://www.youtube.com/watch?v=HxnoX68w72Q',17),(251,'Monolith','13',6,0,NULL,'https://www.youtube.com/watch?v=lrAD6mJ57T8',17),(252,'When the Sun hits','07',7,0,NULL,'https://www.youtube.com/watch?v=lWd4G5i1_t0',17),(253,'Today','14',12,0,NULL,'https://www.youtube.com/watch?v=xmUZ6nCFNoU',17),(254,'Animal nitrate','03',21,0,NULL,'https://www.youtube.com/watch?v=i7mEB2wnDLQ',17),(255,'The cabbage','11',5,0,NULL,'https://www.youtube.com/watch?v=Xktd8j_khsU',17),(256,'Kiss the floor','12',4,0,NULL,'https://www.youtube.com/watch?v=V3CK81cZgXE',18),(257,'Flower to hide','10',1,0,NULL,'https://www.youtube.com/watch?v=gr2vNGLDBLs',18),(258,'Nearly lost you','13',2,0,NULL,'https://www.youtube.com/watch?v=PE5f561Y1x4',18),(259,'Boilermaker','14',1,0,NULL,'https://www.youtube.com/watch?v=2MlhvFwQv0U',18),(260,'Confetti','06',10,0,NULL,'https://www.youtube.com/watch?v=4s7Fi2QBXqk',18),(261,'Motorcycle emptiness','04',9,0,NULL,'https://www.youtube.com/watch?v=gavcjNniIvk',18),(262,'Good','09',1,0,NULL,'https://www.youtube.com/watch?v=Kz0a55y96a4',18),(263,'The national front disco','05',5,0,NULL,'https://www.youtube.com/watch?v=HgZ1b8ruq5c',18),(264,'To crawl under one\'s skin','15',0,0,NULL,'https://www.youtube.com/watch?v=IpC5-EOmTzc',18),(265,'Papa won\'t leave you, Henry','08',3,0,NULL,'https://www.youtube.com/watch?v=GBv-qUzyhD0',18),(266,'Trigger cut','07',4,0,NULL,'https://www.youtube.com/watch?v=94r_ir77q3g',18),(267,'The sidewinder sleeps tonite','03',7,0,NULL,'https://www.youtube.com/watch?v=mgiCechWNCo',18),(268,'Leave them all behind','01',3,0,NULL,'https://www.youtube.com/watch?v=4Tp0pqNRCOQ',18),(269,'Sugar kane','11',6,0,NULL,'https://www.youtube.com/watch?v=RIIEbrMXs20',18),(270,'The act we act','02',2,0,NULL,'https://www.youtube.com/watch?v=m1vZ5-Iw3Es',18),(271,'Breather','09',5,0,NULL,'https://www.youtube.com/watch?v=IcR3CXDQPN0',19),(272,'Hypnogogic','08',2,0,NULL,'https://www.youtube.com/watch?v=FcMqlTBTiZY',19),(273,'Unfinished sympathy','15',3,0,NULL,'https://www.youtube.com/watch?v=ZWmrfgj0MZI',19),(274,'Suzanne','11',2,0,NULL,'https://www.youtube.com/watch?v=9VewHeOXqu0?start=0&end=197',19),(275,'Sometimes','10',9,1,5.00,'https://www.youtube.com/watch?v=3YKFCtCPoqs',19),(276,'Territorial pissings','03',6,0,NULL,'https://www.youtube.com/watch?v=STNoMbkWGxw',19),(277,'Joyful reunion','04',0,0,NULL,'https://www.youtube.com/watch?v=NcNnaUChcrQ',19),(278,'Alive','06',15,0,NULL,'https://www.youtube.com/watch?v=qM0zINtulhM',19),(279,'Trompe le monde','02',8,0,NULL,'https://www.youtube.com/watch?v=GNhCyxuquuk',19),(280,'Movin\' on up','14',5,0,NULL,'https://www.youtube.com/watch?v=DA07x5HQVOw',19),(281,'The freed pig','12',3,0,NULL,'https://www.youtube.com/watch?v=GC9PhRy5aVA',19),(282,'Don, Aman','01',2,0,NULL,'https://www.youtube.com/watch?v=FnDUFLAy62k',19),(283,'Son of Mustang Ford','05',0,0,NULL,'https://www.youtube.com/watch?v=MHva52tOoeo',19),(284,'What you do to me','13',10,0,NULL,'https://www.youtube.com/watch?v=yl6rghNEd-A',19),(285,'Acrobat','07',1,0,NULL,'https://www.youtube.com/watch?v=JHdwytl2QQs',19),(286,'The only one I know','10',10,0,NULL,'https://www.youtube.com/watch?v=0RJwW77Lsj8',20),(287,'Bikini girls with machine guns','07',3,1,4.00,'https://www.youtube.com/watch?v=iyIoL1cgCsM',20),(288,'Enjoy the silence','15',6,0,NULL,'https://www.youtube.com/watch?v=aGSKrC7dGcY',20),(289,'Merchandise','06',7,0,NULL,'https://www.youtube.com/watch?v=X5wWHqv3oRc',20),(290,'Here I hide','09',1,1,3.00,'https://www.youtube.com/watch?v=RPp2nDSOxec',20),(291,'This is how it feels','11',3,0,NULL,'https://www.youtube.com/watch?v=J-fX0UbpZls',20),(292,'There she goes','13',8,0,NULL,'https://www.youtube.com/watch?v=CZXLLMbJdZ4',20),(293,'Pure','14',14,0,NULL,'https://www.youtube.com/watch?v=HZFJVAaSOrE',20),(294,'Time thief','01',5,0,NULL,'https://www.youtube.com/watch?v=NSgO1rB3gnk',20),(295,'Ana','04',10,0,NULL,'https://www.youtube.com/watch?v=4XUI1QE_DWs',20),(296,'Golden blunders','08',3,0,NULL,'https://www.youtube.com/watch?v=7onIN6IwIeQ',20),(297,'Shine on','03',6,0,NULL,'https://www.youtube.com/watch?v=rxUv79hejRU',20),(298,'Dreams burn down','02',4,0,NULL,'https://www.youtube.com/watch?v=7NTWKLVhdIg',20),(299,'Kool thing','05',8,0,NULL,'https://www.youtube.com/watch?v=SDTSUwIZdMk',20),(300,'You\'re not the only one I know','12',3,0,NULL,'https://www.youtube.com/watch?v=NblFFTPj3U8',20),(301,'Compositions for the young and old','09',2,0,NULL,'https://www.youtube.com/watch?v=-SSLXMoO5Es',21),(302,'Lost cause','13',1,0,NULL,'https://www.youtube.com/watch?v=gyq9pi8QTBw',21),(303,'Fascination street','01',5,0,NULL,'https://www.youtube.com/watch?v=7ZsQdLlvuk4',21),(304,'From out of nowhere','14',2,0,NULL,'https://www.youtube.com/watch?v=j4tsGWdarHc',21),(305,'Decomposing trees','08',4,0,NULL,'https://www.youtube.com/watch?v=bvnDQsAYqkY',21),(306,'Blush','10',3,0,NULL,'https://www.youtube.com/watch?v=_YkLnmTp4jU',21),(307,'Head on','02',4,0,NULL,'https://www.youtube.com/watch?v=eGp47YwDZ48',21),(308,'The last of the famous international playboys','04',3,0,NULL,'https://www.youtube.com/watch?v=Bk1wUKoXL20',21),(309,'About a girl','12',10,0,NULL,'https://www.youtube.com/watch?v=m4tQUUEGfPk',21),(310,'The end of all things','15',0,0,NULL,'https://www.youtube.com/watch?v=Xd69ppeG1DU',21),(311,'Wave of mutilation','03',8,0,NULL,'https://www.youtube.com/watch?v=PdAOZ-8qhyM',21),(312,'Pet sematary','11',7,0,NULL,'https://www.youtube.com/watch?v=HJWFsZ_YUc4',21),(313,'This is the one','05',11,0,NULL,'https://www.youtube.com/watch?v=XKkLCcri_HA',21),(314,'The beat(en) generation','07',3,0,NULL,'https://www.youtube.com/watch?v=ustXRPke9lM',21),(315,'The mayor of Simpleton','06',3,0,NULL,'https://www.youtube.com/watch?v=Ciq0wlhwUVw',21),(316,'Martha\'s harbour','10',0,0,NULL,'https://www.youtube.com/watch?v=mJqsjsybc30?start=2',22),(317,'Under the Milky Way','11',2,0,NULL,'https://www.youtube.com/watch?v=pWxJEIz7sSA',22),(318,'Freak scene','14',8,0,NULL,'https://www.youtube.com/watch?v=5eO6up9Gpv0',22),(319,'Quiet heart','09',4,1,3.00,'https://www.youtube.com/watch?v=ecZlt4ti_mw',22),(320,'Christine','12',4,0,NULL,'https://www.youtube.com/watch?v=OXOgRvj76zI',22),(321,'Everyday is like Sunday','08',5,0,NULL,'https://www.youtube.com/watch?v=d0LeL9BUPtA',22),(322,'Nothing much to lose','13',6,0,NULL,'https://www.youtube.com/watch?v=tdMmwn_QZWs',22),(323,'Waiting room','15',3,0,NULL,'https://www.youtube.com/watch?v=Og7u3sKuegM',22),(324,'Gigantic','01',3,0,NULL,'https://www.youtube.com/watch?v=0k1Fmx3c35Y',22),(325,'Cars and girls','07',5,0,NULL,'https://www.youtube.com/watch?v=jEJdfDD4dVg',22),(326,'Crash','03',3,0,NULL,'https://www.youtube.com/watch?v=1y7NGqfZteg',22),(327,'Stand','02',5,0,NULL,'https://www.youtube.com/watch?v=bLaSXpqp__E',22),(328,'Only a memory','05',3,0,NULL,'https://www.youtube.com/watch?v=DHYkYYikewU',22),(329,'Ana Ng','04',0,0,NULL,'https://www.youtube.com/watch?v=UxxL640CRZY',22),(330,'I say nothing','06',1,0,NULL,'https://www.youtube.com/watch?v=01g5F5gfNoo',22),(331,'24 hour party people','15',6,0,NULL,'https://www.youtube.com/watch?v=0zWpHxfQvtk',23),(332,'In spite of these times','10',2,0,NULL,'https://www.youtube.com/watch?v=sskC2QpUC4w',23),(333,'Just like heaven','03',6,1,4.00,'https://www.youtube.com/watch?v=n3nPiBai66M',23),(334,'Orpheus','11',2,1,4.00,'https://www.youtube.com/watch?v=uY2IEXxEVvM',23),(335,'Never let me down again','13',9,0,NULL,'https://www.youtube.com/watch?v=snILjFUkk_A',23),(336,'Little fury things','06',8,0,NULL,'https://www.youtube.com/watch?v=85hvFafdO5o',23),(337,'The people who grinned themselves to death','01',3,0,NULL,'https://www.youtube.com/watch?v=o7fgCnNnD8o',23),(338,'Could you be the one?','07',4,0,NULL,'https://www.youtube.com/watch?v=xMe15tWC6gc',23),(339,'Happy when it rains','04',10,0,NULL,'https://www.youtube.com/watch?v=G5x1F9ohRa4',23),(340,'True faith','14',3,0,NULL,'https://www.youtube.com/watch?v=mfI1S0PKJR8',23),(341,'Caribou','05',1,0,NULL,'https://www.youtube.com/watch?v=xZXGhf5j4-0',23),(342,'The one I love','09',4,0,NULL,'https://www.youtube.com/watch?v=j7oQEPfe-O8',23),(343,'Alex Chilton','08',1,0,NULL,'https://www.youtube.com/watch?v=ftTOEJfzdq0',23),(344,'Shoplifters of the world, unite','02',3,0,NULL,'https://www.youtube.com/watch?v=lJRN76hxFz0',23),(345,'Where the streets have no name','12',7,0,NULL,'https://www.youtube.com/watch?v=GzZWSrr5wFI',23),(346,'Fight for your right','03',7,0,NULL,'https://www.youtube.com/watch?v=eBShN8qT4lk',24),(347,'Swamp thing','01',2,0,NULL,'https://www.youtube.com/watch?v=a4ZVvNyc6Y4',24),(348,'A question of time','15',8,0,NULL,'https://www.youtube.com/watch?v=9pt7EWFF_T8',24),(349,'I could be in heaven','10',1,0,NULL,'https://www.youtube.com/watch?v=EdnuHmfB-7c',24),(350,'Happy hour','11',7,0,NULL,'https://www.youtube.com/watch?v=lnEwyHd4EeI?start=15&end=152',24),(351,'Don\'t want to know if you are lonely','02',7,1,5.00,'https://www.youtube.com/watch?v=E6PUc3zcp44',24),(352,'Some candy talking','07',7,0,NULL,'https://www.youtube.com/watch?v=oIIdLAQ3nvc',24),(353,'Red sleeping beauty','05',2,0,NULL,'https://www.youtube.com/watch?v=EffifCzI1xo',24),(354,'Bizarre love triangle','14',8,0,NULL,'https://www.youtube.com/watch?v=tkOr12AQpnU',24),(355,'Suburbia','13',5,0,NULL,'https://www.youtube.com/watch?v=-VCqAjYO3NM',24),(356,'Really stupid','04',2,0,NULL,'https://www.youtube.com/watch?v=6nOlt8Cdotg',24),(357,'Begin the begin','08',6,0,NULL,'https://www.youtube.com/watch?v=fQuxSpCij0g',24),(358,'Jest bezpiecznie','06',3,0,NULL,'https://www.youtube.com/watch?v=ofbJHuGdP70',24),(359,'Panic','12',6,0,NULL,'https://www.youtube.com/watch?v=wMykYSQaG_c',24),(360,'Rhythm section want ad','09',1,1,4.00,'https://www.youtube.com/watch?v=0NzZ1uCWw8Q',24),(361,'Take on me','14',8,0,NULL,'https://www.youtube.com/watch?v=djV11Xbc914',25),(362,'Inbetween days','02',11,0,NULL,'https://www.youtube.com/watch?v=scif2vfg1ug',25),(363,'Shake the disease','12',4,0,NULL,'https://www.youtube.com/watch?v=r_0sL_SQYvw',25),(364,'Anything, anything (I\'ll give you)','10',0,0,NULL,'https://www.youtube.com/watch?v=Azj_AjdNWwY',25),(365,'Big store','04',2,0,NULL,'https://www.youtube.com/watch?v=3fmqjOJTX38',25),(366,'Just like honey','07',8,0,NULL,'https://www.youtube.com/watch?v=7EgB__YratE',25),(367,'Eighties','11',3,0,NULL,'https://youtube.com/watch?v=x1U1Ue_5kq8',25),(368,'Birthday girl','03',0,0,NULL,'https://www.youtube.com/watch?v=HPX9iRbAUpM',25),(369,'Salad days','09',3,0,NULL,'https://www.youtube.com/watch?v=o8YUcCPPEXw',25),(370,'The perfect kiss','13',4,0,NULL,'https://www.youtube.com/watch?v=x3XW6NLILqo',25),(371,'Raspberry beret','15',5,0,NULL,'https://www.youtube.com/watch?v=l7vRSu_wsNc',25),(372,'Peltirumpu','08',1,0,NULL,'https://www.youtube.com/watch?v=K0RdKKhcfFU',25),(373,'How soon is now?','06',10,0,NULL,'https://www.youtube.com/watch?v=hnpILIIo9ek',25),(374,'Road to nowhere','01',3,0,NULL,'https://www.youtube.com/watch?v=LQiOA7euaYA',25),(375,'Downtown train','05',3,0,NULL,'https://www.youtube.com/watch?v=rLtZKkCIVmI',25),(376,'Lorelei','05',2,0,NULL,'https://www.youtube.com/watch?v=2ReiSzgN1R8',26),(377,'Somebody','04',7,0,NULL,'https://www.youtube.com/watch?v=jbaKcxTW7A8',26),(378,'The killing moon','02',6,0,NULL,'https://www.youtube.com/watch?v=LWz0JC7afNQ',26),(379,'Sunlight bathed the golden glow','09',2,0,NULL,'https://www.youtube.com/watch?v=Soi-3UuaZwg',26),(380,'Bachelor kisses','10',1,0,NULL,'https://www.youtube.com/watch?v=C_nn90p-tIg',26),(381,'Such a shame','06',1,0,NULL,'https://www.youtube.com/watch?v=1FezKvr5naI',26),(382,'Death ship','13',2,0,NULL,'https://www.youtube.com/watch?v=tTWRYrm5J5w',26),(383,'Chartered trips','15',3,0,NULL,'https://www.youtube.com/watch?v=Ww647RfdkmU',26),(384,'Love is a wonderful colour','08',0,0,NULL,'https://www.youtube.com/watch?v=p1RyvR210m0',26),(385,'Aurora borealis','01',1,0,NULL,'https://www.youtube.com/watch?v=OSFViHeKLOk',26),(386,'Two beads at the end','14',1,0,NULL,'https://www.youtube.com/watch?v=wPHvZj15xd0',26),(387,'Christian militia','12',0,0,NULL,'https://www.youtube.com/watch?v=DOGlIZf78kk',26),(388,'Unsatisfied','11',2,0,NULL,'https://www.youtube.com/watch?v=pqa9rJUMWPs',26),(389,'Up on the catwalk','07',0,0,NULL,'https://www.youtube.com/watch?v=T7b27t7lxCw',26),(390,'Please, please, please, let me get what I want','03',3,0,NULL,'https://www.youtube.com/watch?v=phve-q4H_KU',26),(391,'Oblivious','06',1,0,NULL,'https://www.youtube.com/watch?v=j1gWCF0MPL4',27),(392,'She\'s in parties','11',4,0,NULL,'https://www.youtube.com/watch?v=QXh30qF7D38',27),(393,'In our angelhood','04',2,0,NULL,'https://www.youtube.com/watch?v=hEXL7hheXns',27),(394,'The cutter','05',4,0,NULL,'https://www.youtube.com/watch?v=nMplIrSlg8E',27),(395,'Bob Dylan wrote propaganda songs','14',3,0,NULL,'https://www.youtube.com/watch?v=nHrBThnH8Y4',27),(396,'Blue Monday','01',4,0,NULL,'https://www.youtube.com/watch?v=9GMjH1nR0ds',27),(397,'Laughing','08',2,0,NULL,'https://www.youtube.com/watch?v=2JRnY-S8xCI',27),(398,'Cowboys','10',2,0,NULL,'https://www.youtube.com/watch?v=udTI7DXvrlY',27),(399,'Institutionalized','15',2,0,NULL,'https://www.youtube.com/watch?v=LoF_a0-7xVQ',27),(400,'Burning down the house','02',2,0,NULL,'https://www.youtube.com/watch?v=_3eC35LoF4U',27),(401,'Jet fighter','07',2,0,NULL,'https://www.youtube.com/watch?v=GcpTl5HPupc',27),(402,'New Year\'s Day','03',3,0,NULL,'https://www.youtube.com/watch?v=jeYCyCaK_5k',27),(403,'Blister in the sun','09',7,0,NULL,'https://www.youtube.com/watch?v=hYZkoI1ggEw',27),(404,'A girl called Johnny','12',1,0,NULL,'https://www.youtube.com/watch?v=PUSDeqYYB2Q',27),(405,'Over the edge','13',0,0,NULL,'https://www.youtube.com/watch?v=E7oyO-UvdXE',27),(406,'Summer fun','07',3,0,NULL,'https://www.youtube.com/watch?v=p7aTw2ZTn2Y?t=5',28),(407,'Rock the Casbah','10',4,0,NULL,'https://www.youtube.com/watch?v=bJ9r8LMU9bQ',28),(408,'One hundred years','12',5,0,NULL,'https://www.youtube.com/watch?v=WACX1uSAZeI',28),(409,'Neverland','06',1,1,4.00,'https://www.youtube.com/watch?v=hfpli2VQtZU',28),(410,'Moon over Marin','14',1,0,NULL,'https://www.youtube.com/watch?v=Ea-mooJzs0A',28),(411,'Space age love song','01',1,0,NULL,'https://www.youtube.com/watch?v=gOK3rqVgN2I',28),(412,'Town called Malice','09',2,0,NULL,'https://www.youtube.com/watch?v=YfpRm-p7qlY',28),(413,'Astro zombies','15',5,0,NULL,'https://www.youtube.com/watch?v=5R7Tmg2almA',28),(414,'Secrets','11',1,1,3.00,'https://www.youtube.com/watch?v=WO69kd582vA',28),(415,'Temptation','02',4,1,3.00,'https://www.youtube.com/watch?v=xxDv_RTdLQo',28),(416,'Kids are the same','08',2,0,NULL,'https://www.youtube.com/watch?v=zDACzpbaLJo',28),(417,'Love my way','04',2,0,NULL,'https://www.youtube.com/watch?v=LGD9i718kBU',28),(418,'Gardening at night','05',3,0,NULL,'https://www.youtube.com/watch?v=l33MAmraWno',28),(419,'More than this','03',9,0,NULL,'https://www.youtube.com/watch?v=kOnde5c7OG8',28),(420,'Cascade','13',3,0,NULL,'https://www.youtube.com/watch?v=-aS_8ZyfLL4',28),(421,'TV party','15',4,0,NULL,'https://www.youtube.com/watch?v=a6otjCKg594',29),(422,'Detail for Paul','01',4,0,NULL,'https://www.youtube.com/watch?v=RVEYEZC8abg',29),(423,'Centro di gravità permanente','02',13,0,NULL,'https://www.youtube.com/watch?v=0XW9XN_vDaA',29),(424,'We got the beat','03',2,0,NULL,'http://www.youtube.com/watch?v=CRwR33FLmrI?start=20',29),(425,'Sex beat','14',2,0,NULL,'https://www.youtube.com/watch?v=kSacAWTdyYU',29),(426,'That\'s when I reach for my revolver','12',1,1,4.00,'https://www.youtube.com/watch?v=9XTSdfVl_qw',29),(427,'Hush, hush','06',5,0,NULL,'https://www.youtube.com/watch?v=uIlBlSZFzVI',29),(428,'It goes on','09',2,0,NULL,'https://www.youtube.com/watch?v=QaH44DKzAQ4',29),(429,'The KKK took my baby away','13',6,0,NULL,'https://www.youtube.com/watch?v=Qx0zeMbLOCY',29),(430,'Out of the picture','05',1,0,NULL,'https://www.youtube.com/watch?v=n6rXERGJG50',29),(431,'Start me up','04',2,0,NULL,'https://www.youtube.com/watch?v=SGyOaCXr8Lw',29),(432,'Spellbound','11',2,0,NULL,'https://www.youtube.com/watch?v=TjvvK-Rj0WI',29),(433,'I can\'t talk to you','07',4,0,NULL,'https://www.youtube.com/watch?v=mCQn9aa2pT4',29),(434,'Silly girl','08',3,0,NULL,'https://www.youtube.com/watch?v=JJKtggTB4Ms',29),(435,'Taking too long','10',0,0,NULL,'https://www.youtube.com/watch?v=Akuqgv3zfBQ',29),(436,'Holiday in Cambodia','14',3,0,NULL,'https://www.youtube.com/watch?v=Qr6NOsluHYg',30),(437,'Gates of steel','02',2,0,NULL,'https://www.youtube.com/watch?v=5xfBlP2zl2I',30),(438,'Fa cé-la','07',3,0,NULL,'https://www.youtube.com/watch?v=ljDYth94rUk',30),(439,'Going underground','11',6,0,NULL,'https://www.youtube.com/watch?v=AE1ct5yEuVY',30),(440,'Love will tear us apart','04',11,0,NULL,'https://www.youtube.com/watch?v=zuuObGsB0No',30),(441,'Academy fight song','06',2,0,NULL,'https://www.youtube.com/watch?v=wDyZm-aBKYU',30),(442,'Ace of spades','15',10,0,NULL,'https://www.youtube.com/watch?v=3mbvWn1EY6g',30),(443,'Kid','08',4,0,NULL,'https://www.youtube.com/watch?v=ZbC8JltxSq8',30),(444,'Do you remember rock \'n\' roll radio?','12',3,0,NULL,'https://www.youtube.com/watch?v=Gi9a7IdRiBI',30),(445,'I wanna destroy you','10',3,0,NULL,'https://www.youtube.com/watch?v=I_GD88OCcNw',30),(446,'Missiles','05',3,0,NULL,'https://www.youtube.com/watch?v=KJB8nyrw_7A',30),(447,'Pulling mussels (from the shell)','09',3,0,NULL,'https://www.youtube.com/watch?v=aeGtQ7Hw4uc',30),(448,'Tin soldiers','13',1,0,NULL,'https://www.youtube.com/watch?v=PqA8WItc9Bg',30),(449,'Once in a lifetime','03',4,0,NULL,'https://www.youtube.com/watch?v=5IsSpAOD6K8',30),(450,'Sleepwalk','01',5,0,NULL,'https://www.youtube.com/watch?v=1G0LH3mR1o0',30);
/*!40000 ALTER TABLE `canciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `ciudad_numero_autores`
--

DROP TABLE IF EXISTS `ciudad_numero_autores`;
/*!50001 DROP VIEW IF EXISTS `ciudad_numero_autores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ciudad_numero_autores` AS SELECT 
 1 AS `nombre_ciudad`,
 1 AS `numero_autores`,
 1 AS `nombre_pais`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `ciudades`
--

DROP TABLE IF EXISTS `ciudades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudades` (
  `id_ciudad` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_ciudad` text CHARACTER SET utf8,
  `artista` tinyint(1) DEFAULT '1',
  `usuario` tinyint(1) DEFAULT '0',
  `id_pais` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_ciudad`),
  KEY `fk_ciudades_1` (`id_pais`),
  CONSTRAINT `fk_ciudades_1` FOREIGN KEY (`id_pais`) REFERENCES `paises` (`id_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudades`
--

LOCK TABLES `ciudades` WRITE;
/*!40000 ALTER TABLE `ciudades` DISABLE KEYS */;
INSERT INTO `ciudades` VALUES (1,'Austin',1,0,1),(2,'Nueva York',1,0,1),(3,'Cambridge',1,0,1),(4,'Seal Beach',1,0,1),(5,'Villefranche-sur-Saône',1,0,2),(6,'Camberwell',1,0,3),(7,'Southend-on-Sea',1,0,3),(8,'Jyväskylä',1,0,4),(9,'Toronto',1,0,5),(10,'Victoria',1,0,5),(11,'Hellerup',1,0,6),(12,'Tokio',1,0,7),(13,'Gainesville',1,0,1),(14,'Atlanta',1,0,1),(15,'Kirkland',1,0,1),(16,'Middletown',1,0,1),(17,'Chicago',1,0,1),(18,'Glen Rock',1,0,1),(19,'Bath',1,0,3),(20,'Sheffield',1,0,3),(21,'Leicester',1,0,3),(22,'Wymeswold',1,0,3),(23,'Selkirk',1,0,8),(24,'Gotemburgo',1,0,9),(25,'Reikiavik',1,0,10),(26,'Savannah',1,0,1),(27,'Eau Claire',1,0,1),(28,'Boston',1,0,1),(29,'Morris Plains',1,0,1),(30,'Purchase',1,0,1),(31,'Cincinnati',1,0,1),(32,'Athens',1,0,1),(33,'Bagnols-sur-Cèze',1,0,2),(34,'Bristol',1,0,3),(35,'Oxford',1,0,3),(36,'Montreal',1,0,5),(37,'Calgary',1,0,5),(38,'Berlín',1,0,11),(39,'Cardiff',1,0,12),(40,'Vancouver',1,0,5),(41,'Glen of the Downs',1,0,13),(42,'Napier',1,0,14),(43,'Memphis',1,0,1),(44,'Estocolmo',1,0,9),(45,'Denton',1,0,1),(46,'Glasgow',1,0,8),(47,'Los Ángeles',1,0,1),(48,'Burdeos',1,0,2),(49,'New London',1,0,1),(50,'Portland',1,0,1),(51,'Seattle',1,0,1),(52,'Leeds',1,0,3),(53,'Duluth',1,0,1),(54,'Antibes',1,0,2),(55,'Londres',1,0,3),(56,'Olympia',1,0,1),(57,'Umeå',1,0,9),(58,'Enniskillen',1,0,18),(59,'Omaha',1,0,1),(60,'Toulouse',1,0,2),(61,'Las Vegas',1,0,1),(62,'Bergen',1,0,15),(63,'Issaquah',1,0,1),(64,'Mánchester',1,0,3),(66,'Forlì',1,0,17),(67,'Bedford',1,0,1),(68,'Fort Worth',1,0,1),(69,'Bloomington',1,0,1),(70,'Mississauga',1,0,5),(71,'Newbury Park',1,0,1),(72,'Copenague',1,0,6),(73,'Nottingham',1,0,3),(74,'Secaucus',1,0,1),(75,'Santa Cruz',1,0,1),(76,'Belfast',1,0,18),(77,'Borlänge',1,0,9),(78,'Palm Desert',1,0,1),(79,'El Paso',1,0,1),(80,'Downpatrick',1,0,18),(81,'Búfalo',1,0,1),(82,'Richmond',1,0,1),(83,'Dunstable',1,0,3),(84,'Kent',1,0,3),(85,'Yeovil',1,0,3),(86,'París',1,0,2),(87,'Detroit',1,0,1),(88,'Colchester',1,0,3),(89,'Amberes',1,0,19),(90,'Oklahoma City',1,0,1),(91,'Potsdam',1,0,1),(92,'Dayton',1,0,1),(93,'Cleveland',1,0,1),(94,'Davyhulme',1,0,3),(95,'Blackwood',1,0,12),(96,'Ruston',1,0,1),(97,'Croydon',1,0,3),(98,'Knoxville',1,0,1),(99,'Oslo',1,0,15),(100,'Boise',1,0,1),(101,'Basildon',1,0,3),(102,'Stockton',1,0,1),(103,'Rugby',1,0,3),(104,'Wigan',1,0,3),(105,'Edimburgo',1,0,8),(106,'Jönköping',1,0,9),(107,'Trondheim',1,0,15),(108,'Wallasey',1,0,3),(109,'Madison',1,0,1),(110,'Champaign',1,0,1),(111,'San Francisco',1,0,1),(112,'Bellshill',1,0,8),(113,'Anaheim',1,0,1),(114,'Amherst',1,0,1),(115,'Tucson',1,0,1),(116,'Great Yarmouth',1,0,3),(117,'Bellingham',1,0,1),(118,'Hawthorne',1,0,1),(119,'Reading',1,0,3),(120,'Ellensburg',1,0,1),(121,'Oakland',1,0,1),(123,'Dublín',1,0,13),(124,'Aberdeen',1,0,1),(125,'Louisville',1,0,1),(126,'Northwich',1,0,3),(127,'Washington',1,0,1),(128,'Oldham',1,0,3),(129,'Liverpool',1,0,3),(130,'Islington',1,0,3),(131,'Gijón',0,1,20),(132,'Malone',1,0,1),(133,'Melbourne',1,0,21),(134,'Crawley',1,0,3),(135,'Sídney',1,0,21),(136,'East Kilbride',1,0,8),(137,'Swindon',1,0,3),(138,'Brisbane',1,0,21),(139,'Witton Gilbert',1,0,3),(140,'Coventry',1,0,3),(141,'Carteret',1,0,1),(142,'Salford',1,0,3),(143,'Paisley',1,0,8),(144,'Beckenham',1,0,3),(145,'Hull',1,0,3),(146,'Saint Paul',1,0,1),(147,'Mineápolis',1,0,1),(148,'Middleton',1,0,3),(149,'Barking',1,0,3),(150,'Puławy',1,0,22),(151,'Wayne',1,0,1),(152,'Cork',1,0,13),(153,'Joensuu',1,0,4),(154,'Pomona',1,0,1),(155,'Grangemouth',1,0,8),(156,'Water Orton',1,0,3),(157,'Phoenix',1,0,1),(158,'San Pedro',1,0,1),(159,'Bradford',1,0,3),(160,'Northampton',1,0,3),(161,'Watford',1,0,3),(162,'Venice',1,0,1),(163,'Milwaukee',1,0,1),(164,'Woking',1,0,3),(165,'Lodi',1,0,1),(166,'Hermosa Beach',1,0,1),(167,'Riposto',1,0,17),(168,'Kent',1,0,1),(169,'Haledon',1,0,1),(170,'Cambridge',1,0,3);
/*!40000 ALTER TABLE `ciudades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comentarios` (
  `id_comentario` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `texto` varchar(250) DEFAULT NULL,
  `fecha_comentario` datetime DEFAULT NULL,
  `ano` year(4) DEFAULT NULL,
  `decada` tinyint(1) DEFAULT '0',
  `eliminado` tinyint(1) DEFAULT '0',
  `id_usuario` smallint(5) unsigned NOT NULL,
  `id_comentario_padre` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_comentario`),
  KEY `fk_comentarios_1` (`id_usuario`),
  KEY `fk_comentarios_2` (`id_comentario_padre`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentarios`
--

LOCK TABLES `comentarios` WRITE;
/*!40000 ALTER TABLE `comentarios` DISABLE KEYS */;
INSERT INTO `comentarios` VALUES (9,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-15 21:25:51',1981,0,0,1,NULL),(8,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam m','2021-01-15 21:25:11',1981,0,1,2,NULL),(10,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-15 21:38:47',NULL,NULL,0,2,9),(11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-16 18:01:31',1981,0,1,3,NULL),(12,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-16 18:01:41',NULL,NULL,0,3,9),(13,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-16 18:04:40',2000,1,0,3,NULL),(14,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-16 18:22:26',1981,0,0,3,NULL),(15,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-16 18:22:35',NULL,NULL,0,3,9),(16,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.','2021-01-16 18:25:53',NULL,NULL,0,3,13);
/*!40000 ALTER TABLE `comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discos`
--

DROP TABLE IF EXISTS `discos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discos` (
  `id_disco` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `titulo_disco` text CHARACTER SET utf8,
  `tipo` enum('LP','EP','Sencillo','Recopilatorio') DEFAULT NULL,
  `id_cancion` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_disco`),
  KEY `fk_discos_1` (`id_cancion`),
  CONSTRAINT `fk_discos_1` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id_cancion`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discos`
--

LOCK TABLES `discos` WRITE;
/*!40000 ALTER TABLE `discos` DISABLE KEYS */;
INSERT INTO `discos` VALUES (1,'The century of self','LP',6),(2,'Hospice','LP',11),(3,'Veckatimest','LP',8),(4,'The pains of being pure at heart','LP',12),(5,'It\'s blitz!','LP',2),(6,'Sea of tears','LP',7),(7,'Mandala','LP',14),(8,'La superbe','LP',5),(9,'Lungs','LP',4),(10,'Primary colours','LP',13),(11,'Isolation songs','LP',15),(12,'Fantasies','LP',3),(13,'Dragonslayer','LP',9),(14,'No more stories/Are told today/I\'m sorry/They washed away//No more stories/The world is grey/I\'m tired/Let\'s wash away','LP',10),(15,'Hymn to the immortal wind','LP',1),(16,'Festival thyme','EP',27),(17,'Throwing sparks','LP',25),(18,'Microcastle/Weird era continued','LP',18),(19,'Fleet foxes','LP',23),(20,'The midnight organ fight','LP',28),(21,'Seventh tree','LP',24),(22,'The age of the understatement','LP',22),(23,'A hundred things keep me up at night','LP',19),(24,'Not for want of trying','LP',16),(25,'Oracular spectacular','LP',30),(26,'Station','LP',17),(27,'Með suð í eyrum við spilum endalaust','LP',26),(28,'The airing of grievances','LP',20),(29,'Vampire weekend','LP',29),(30,'Instant coffee baby','LP',21),(31,'Souvenirs d\'un autre monde','LP',31),(32,'Neon bible','LP',32),(33,'Red album','LP',33),(34,'For Emma, forever ago','LP',34),(35,'Act II: The meaning of, and all things regarding Ms. Leading','LP',35),(36,'Ire works','LP',36),(37,'The western lands','LP',37),(38,'All of a sudden I miss everyone','LP',38),(39,'Pneuma','LP',39),(40,'Boxer','LP',40),(41,'Precambrian','LP',41),(42,'Icons, abstract thee','EP',42),(43,'In rainbows','LP',43),(44,'Hey Venus!','LP',44),(45,'The con','LP',45),(46,'So divided','LP',46),(47,'Destroyer\'s rubies','LP',47),(48,'Insomniac doze','LP',48),(49,'A moment of stillness','EP',49),(50,'In the absence of truth','LP',50),(51,'Solace','LP',51),(52,'Blood visions','LP',52),(53,'The great cold distance','LP',53),(54,'The trials of Van Occupanther','LP',54),(55,'Mr. Beast','LP',55),(56,'Close to paradise','LP',56),(57,'Enter','LP',57),(58,'Palo santo','LP',58),(59,'Carnavas','LP',59),(60,'Nord','LP',60),(61,'Worlds apart','LP',61),(62,'One time for all time','LP',62),(63,'Broken social scene','LP',63),(64,'Clap your hands say yeah','LP',64),(65,'Down in Albion','LP',65),(66,'In your honor','LP',66),(67,'Fires in distant buildings','LP',67),(68,'Outside closer','LP',68),(69,'The great destroyer','LP',69),(70,'Before the dawn heals us','LP',70),(71,'Twin cinema','LP',71),(72,'Black sheep boy','LP',72),(73,'Disaffected','LP',73),(74,'Takk','LP',74),(75,'The woods','LP',75),(76,'The fall of math','LP',76),(77,'The lake','EP',77),(78,'Funeral','LP',78),(79,'Salvation','LP',79),(80,'Absent friends','LP',80),(81,'From a basement on the hill','LP',81),(82,'Hémisphère gauche','LP',82),(83,'Antics','LP',83),(84,'Hot fuss','LP',84),(85,'Riot on an empty street','LP',85),(86,'Good news for people who love bad news','LP',86),(87,'You are the quarry','LP',87),(88,'Abattoir blues/The lyre of Orpheus','LP',88),(89,'La fine non è la fine','LP',89),(90,'A ghost is born','LP',90),(91,'The secret of Elena\'s tomb','EP',91),(92,'Friends of mine','LP',92),(93,'Promise of love','LP',93),(94,'Jefferson at rest','LP',94),(95,'Shootenanny!','LP',95),(96,'The Earth is not a cold dead place','LP',96),(97,'The smell of our own','LP',97),(98,'Transfiguration of Vincent','LP',98),(99,'De-loused in the comatorium','LP',99),(100,'Hail to the thief','LP',100),(101,'Chain gang of love','LP',101),(102,'Lowedges','LP',102),(103,'Phantom power','LP',103),(104,'Waiting for the Moon','LP',104),(105,'The meadowlands','LP',105),(106,'Source tags & codes','LP',106),(107,'Sea change','LP',107),(108,'Forever','LP',108),(109,'Hate','LP',109),(110,'Read music/Speak Spanish','LP',110),(111,'Let\'s get worse','LP',111),(112,'The last broadcast','LP',112),(113,'Bring \'em in','LP',113),(114,'One step more and you die','LP',114),(115,'Finally we are no one','LP',115),(116,'Let go','LP',116),(117,'Control','LP',117),(118,'Songs for the deaf','LP',118),(119,'( )','LP',119),(120,'Wiretap scars','LP',120),(121,'Free all angels','LP',121),(122,'D.F.F.D.','LP',122),(123,'Aujourd\'hui, maintenant','LP',123),(124,'Those who tell the truth shall die, those who tell the truth shall live forever','LP',124),(125,'Things we lost in fire','LP',125),(126,'All is dream','LP',126),(127,'Rock action','LP',127),(128,'Get ready','LP',128),(129,'Amnesiac','LP',129),(130,'It\'s a wonderful life','LP',130),(131,'Is this it','LP',131),(132,'Rings around the World','LP',132),(133,'Rodeo tandem beat specter','LP',133),(134,'Lateralus','LP',134),(135,'Weezer','LP',135),(136,'Glam cripple','EP',136),(137,'Relationship of command','LP',137),(138,'The hour of bewilderbeast','LP',138),(139,'Legal man','Sencillo',139),(140,'The great Eastern','LP',140),(141,'Lost souls','LP',141),(142,'Figure 8','LP',142),(143,'We love the city','LP',143),(144,'Mass romantic','LP',144),(145,'Stories from the city, stories from the sea','LP',145),(146,'United','LP',146),(147,'Black market music','LP',147),(148,'Kid A','LP',148),(149,'Machina/The machines of God','LP',149),(150,'De stijl','LP',150),(151,'Madonna','LP',151),(152,'Midnite vultures','LP',152),(153,'13','LP',153),(154,'Surrender','LP',154),(155,'The ideal crash','LP',155),(156,'The soft bulletin','LP',156),(157,'Everyone can fly','EP',157),(158,'Do the collapse','LP',158),(159,'If I could see Dallas','LP',159),(160,'Le tigre','LP',160),(161,'The fragile','LP',161),(162,'Californication','LP',162),(163,'New parade','LP',163),(164,'Ágætis byrjun','LP',164),(165,'The man who','LP',165),(166,'Nu-clear sounds','LP',166),(167,'The boy with the arab strap','LP',167),(168,'XO','LP',168),(169,'This is my truth tell me yours','LP',169),(170,'Mezzanine','LP',170),(171,'In the aeroplane over the sea','LP',171),(172,'Without you I\'m nothing','LP',172),(173,'This is hardcore','LP',173),(174,'Up','LP',174),(175,'Good humor','LP',175),(176,'Adore','LP',176),(177,'Good morning spider','LP',177),(178,'Head trip in every key','LP',178),(179,'Gear blues','LP',179),(180,'Apocalypse dudes','LP',180),(181,'Blur','LP',181),(182,'Perfect from now on','LP',182),(183,'Dig your own hole','LP',183),(184,'...The Dandy Warhols come down','LP',184),(185,'Ultra','LP',185),(186,'Either/Or','LP',186),(187,'Young team','LP',187),(188,'Be here now','LP',188),(189,'Brighten the corners','LP',189),(190,'OK computer','LP',190),(191,'Dig me out','LP',191),(192,'Ladies and gentlemen we are floating in space','LP',192),(193,'Curtains','LP',193),(194,'Urban hymns','LP',194),(195,'Champions versions','EP',195),(196,'1977','LP',196),(197,'If you\'re feeling sinister','LP',197),(198,'First band on the moon','LP',198),(199,'Fountains of Wayne','LP',199),(200,'Everything must go','LP',200),(201,'Blissard','LP',201),(202,'High/Low','LP',202),(203,'Placebo','LP',203),(204,'The it girl','LP',204),(205,'Welcome to the infant freebase','LP',205),(206,'Emperor Tomato Ketchup','LP',206),(207,'Coming up','LP',207),(208,'Ænima','LP',208),(209,'Ass cobra','LP',209),(210,'Pinkerton','LP',210),(211,'The great scape','LP',211),(212,'On','LP',212),(213,'Life','LP',213),(214,'Elastica','LP',214),(215,'Elliott Smith','LP',215),(216,'Garbage','LP',216),(217,'Alice in chains','LP',217),(218,'You\'d prefer an astronaut','LP',218),(219,'(What\'s the story) Morning glory?','LP',219),(220,'Different class','LP',220),(221,'The bends','LP',221),(222,'Ocean beach','LP',222),(223,'Mellon Collie and the infinite sadness','LP',223),(224,'I should coco','LP',224),(225,'Grand prix','LP',225),(226,'Parklife','LP',226),(227,'Emmerdale','LP',227),(228,'Everyone\'s got one','LP',228),(229,'Bee thousand','LP',229),(230,'Grace','LP',230),(231,'Split','LP',231),(232,'Vauxhall and I','LP',232),(233,'Whatever','Sencillo',233),(234,'Crooked rain, crooked rain','LP',234),(235,'His \'n\' hers','LP',235),(236,'Bakesale','LP',236),(237,'Superunknown','LP',237),(238,'Stay together','Sencillo',238),(239,'La mano cornuda','LP',239),(240,'Weezer','LP',240),(241,'Mercury','LP',241),(242,'Modern life is rubbish','LP',242),(243,'Giant steps','LP',243),(244,'Chrome','LP',244),(245,'Songs of faith and devotion','LP',245),(246,'Laid','LP',246),(247,'Vs.','LP',247),(248,'Frosting on the beater','LP',248),(249,'Pablo Honey','LP',249),(250,'Red house painters','LP',250),(251,'Phaseshifter','LP',251),(252,'Souvlaki','LP',252),(253,'Siamese dream','LP',253),(254,'Suede','LP',254),(255,'Thirteen','LP',255),(256,'Congregation','LP',256),(257,'Ferment','LP',257),(258,'Sweet Oblivion','LP',258),(259,'Liar','LP',259),(260,'It\'s a shame about Ray','LP',260),(261,'Generation terrorists','LP',261),(262,'Good','LP',262),(263,'Your arsenal','LP',263),(264,'Souls at zero','LP',264),(265,'Henry\'s dream','LP',265),(266,'Slanted and enchanted','LP',266),(267,'Automatic for the people','LP',267),(268,'Going blank again','LP',268),(269,'Dirty','LP',269),(270,'Copper blue','LP',270),(271,'Whirlpool','LP',271),(272,'Strange free world','LP',272),(273,'Blue lines','LP',273),(274,'Cool breeze','EP',274),(275,'Loveless','LP',275),(276,'Nevermind','LP',276),(277,'0 + 2 = 1','LP',277),(278,'Ten','LP',278),(279,'Trompe le monde','LP',279),(280,'Screamadelica','LP',280),(281,'III','LP',281),(282,'Spiderland','LP',282),(283,'Raise','LP',283),(284,'Bandwagonesque','LP',284),(285,'Achtung baby','LP',285),(286,'Some friendly','LP',286),(287,'Stay sick!','LP',287),(288,'Violator','LP',288),(289,'Repeater','LP',289),(290,'Cleopatra grip','LP',290),(291,'Life','LP',291),(292,'The la\'s','LP',292),(293,'Cloudcuckooland','LP',293),(294,'The comforts of madness','LP',294),(295,'Bossanova','LP',295),(296,'Dear 23','LP',296),(297,'The house of love','LP',297),(298,'Nowhere','LP',298),(299,'Goo','LP',299),(300,'Reading, writing and arithmetic','LP',300),(301,'Workbook','LP',301),(302,'Go the hack','LP',302),(303,'Disintegration','LP',303),(304,'The real thing','LP',304),(305,'On fire','LP',305),(306,'Love buzz','LP',306),(307,'Automatic','LP',307),(308,'The last of the famous international playboys/Lucky lisp','Sencillo',308),(309,'Bleach','LP',309),(310,'Wrong','LP',310),(311,'Doolittle','LP',311),(312,'Brain drain','LP',312),(313,'The stone roses','LP',313),(314,'Mind bomb','LP',314),(315,'Oranges & lemons','LP',315),(316,'All about Eve','LP',316),(317,'Starfish','LP',317),(318,'Bug','LP',318),(319,'16 Lovers Lane','LP',319),(320,'The house of love','LP',320),(321,'Viva hate','LP',321),(322,'Isn\'t anything','LP',322),(323,'Fugazi','EP',323),(324,'Surfer rosa','LP',324),(325,'From Langley Park to Memphis','LP',325),(326,'Lovely','LP',326),(327,'Green','LP',327),(328,'Green thoughts','LP',328),(329,'Lincoln','LP',329),(330,'Let it bee','LP',330),(331,'Squirrel and G-Man','LP',331),(332,'Foxheads stalk this land','LP',332),(333,'Kiss me, kiss me, kiss me','LP',333),(334,'Secrets of the beehive','LP',334),(335,'Music for the masses','LP',335),(336,'You\'re living all over me','LP',336),(337,'The people who grinned themselves to death','LP',337),(338,'Warehouse: Songs and stories','LP',338),(339,'Darklands','LP',339),(340,'True faith/1963','Sencillo',340),(341,'Come on, pilgrim','EP',341),(342,'Document','LP',342),(343,'Pleased to meet me','LP',343),(344,'Shoplifters of the world unite/Half a person','Sencillo',344),(345,'The Joshua tree','LP',345),(346,'Licensed to ill','LP',346),(347,'Strange times','LP',347),(348,'Black Celebration','LP',348),(349,'I could be in heaven/Tell me why/So in love with you','Sencillo',349),(350,'London 0 Hull 4','LP',350),(351,'Candy apple grey','LP',351),(352,'Some candy talking','EP',352),(353,'Red sleeping beauty/From the damned','Sencillo',353),(354,'Brotherhood','LP',354),(355,'Please','LP',355),(356,'Really stupid','Sencillo',356),(357,'Life\'s rich pageant','LP',357),(358,'Jest bezpiecznie/Misiowie puszyści','Sencillo',358),(359,'Panic/Vicar in a tutu','Sencillo',359),(360,'They might be giants','LP',360),(361,'Hunting high and low','LP',361),(362,'The head on the door','LP',362),(363,'Shake the disease/Flexible','Sencillo',363),(364,'Cinéma vérité','LP',364),(365,'Robespierre\'s velvet basement','LP',365),(366,'Psychocandy','LP',366),(367,'Night time','LP',367),(368,'The clock comes down the stairs','LP',368),(369,'Salad days/Stumped/Sometimes good guys don\'t wear white','Sencillo',369),(370,'Low-life','LP',370),(371,'Around the world in a day','LP',371),(372,'L\'amourha','LP',372),(373,'How soon is now?/Well I wonder','Sencillo',373),(374,'Little creatures','LP',374),(375,'Rain dogs','LP',375),(376,'Treasure','LP',376),(377,'Some great reward','LP',377),(378,'Ocean Rain','LP',378),(379,'The strange idols pattern and other short stories','LP',379),(380,'Spring Hill Fair','LP',380),(381,'It\'s my life','LP',381),(382,'Stoneage romeos','LP',382),(383,'Zen arcade','LP',383),(384,'The icicle works','LP',384),(385,'II','LP',385),(386,'Double nickels on the dime','LP',386),(387,'Vengeance','LP',387),(388,'Let it be','LP',388),(389,'Sparkle in the rain','LP',389),(390,'William, it was really nothing/Please, please, please, let me get what I want','Sencillo',390),(391,'High land, hard rain','LP',391),(392,'Burning from the inside','LP',392),(393,'Head over heels','LP',393),(394,'Porcupine','LP',394),(395,'What makes a man start fires?','LP',395),(396,'Blue Monday/The beach','Sencillo',396),(397,'Murmur','LP',397),(398,'Feeding the flame','LP',398),(399,'Suicidal tendencies','LP',399),(400,'Speaking in tongues','LP',400),(401,'Sixteen tambourines','LP',401),(402,'War','LP',402),(403,'Violent femmes','LP',403),(404,'The waterboys','LP',404),(405,'Over the edge','LP',405),(406,'Drop out with The Barracudas','LP',406),(407,'Combat rock','LP',407),(408,'Pornography','LP',408),(409,'Repercussion','LP',409),(410,'Plastic surgery disasters','LP',410),(411,'A flock of seagulls','LP',411),(412,'The gift','LP',412),(413,'Walk among us','LP',413),(414,'Vs.','LP',414),(415,'Temptation/Hurt','Sencillo',415),(416,'The kids are the same','LP',416),(417,'Forever now','LP',417),(418,'Chronic town','EP',418),(419,'Avalon','LP',419),(420,'A kiss in the dreamhouse','LP',420),(421,'Damaged','LP',421),(422,'LC','LP',422),(423,'La voce del padrone','LP',423),(424,'Beauty and the beat','LP',424),(425,'Fire of love','LP',425),(426,'Signals, calls, and marches','EP',426),(427,'The Plimsouls','LP',427),(428,'Talk talk talk','LP',428),(429,'Pleasant dreams','LP',429),(430,'Black snake diamond role','LP',430),(431,'Tatoo you','LP',431),(432,'Juju','LP',432),(433,'Sunnyboys','LP',433),(434,'...And don\'t the kids just love it','LP',434),(435,'Youth of America','LP',435),(436,'Fresh fruit for rotting vegetables','LP',436),(437,'Freedom of choice','LP',437),(438,'Crazy rhythms','LP',438),(439,'Going underground/The dreams of children','Sencillo',439),(440,'Love will tear us apart/These days','Sencillo',440),(441,'Academy fight song/Max Ernst','Sencillo',441),(442,'Ace of spades','LP',442),(443,'Pretenders','LP',443),(444,'End of the century','LP',444),(445,'Underwater moonlight','LP',445),(446,'Jeopardy','LP',446),(447,'Argybargy','LP',447),(448,'Nobody\'s heroes','LP',448),(449,'Remain in light','LP',449),(450,'Vienna','LP',450);
/*!40000 ALTER TABLE `discos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estilos`
--

DROP TABLE IF EXISTS `estilos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estilos` (
  `id_estilo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_estilo` varchar(25) NOT NULL,
  PRIMARY KEY (`id_estilo`),
  UNIQUE KEY `nombre_estilo` (`nombre_estilo`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estilos`
--

LOCK TABLES `estilos` WRITE;
/*!40000 ALTER TABLE `estilos` DISABLE KEYS */;
INSERT INTO `estilos` VALUES (10,'Blues'),(1,'Classical Music'),(2,'Country'),(3,'Electronic'),(4,'Folk'),(13,'Hip Hop'),(12,'Jazz'),(5,'Metal'),(6,'Pop'),(7,'Punk'),(11,'R&B'),(8,'Regional Music'),(9,'Rock'),(14,'Spoken Word');
/*!40000 ALTER TABLE `estilos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `estilos_numero_autores`
--

DROP TABLE IF EXISTS `estilos_numero_autores`;
/*!50001 DROP VIEW IF EXISTS `estilos_numero_autores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `estilos_numero_autores` AS SELECT 
 1 AS `nombre_estilo`,
 1 AS `numero_autores`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `listas`
--

DROP TABLE IF EXISTS `listas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `listas` (
  `id_lista` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ano` year(4) DEFAULT NULL,
  `enlace_spotify` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_lista`),
  UNIQUE KEY `ano_lista` (`ano`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listas`
--

LOCK TABLES `listas` WRITE;
/*!40000 ALTER TABLE `listas` DISABLE KEYS */;
INSERT INTO `listas` VALUES (1,2009,'https://open.spotify.com/embed/playlist/0XO8d7HqtMdYyB59IxoZl8'),(2,2008,'https://open.spotify.com/embed/playlist/5LTLX7zCrGqOIorf9qpbd5'),(3,2007,'https://open.spotify.com/embed/playlist/7fZJ3FxoVmzrQ4oBcwzWqh'),(4,2006,'https://open.spotify.com/embed/playlist/4bAtKO4whoOmlvPJ7QQMUR'),(5,2005,'https://open.spotify.com/embed/playlist/4WCBk7WJiShaVHeiAc421e'),(6,2004,'https://open.spotify.com/embed/playlist/392pT6xe28YP8Z5fgX1XXK'),(7,2003,'https://open.spotify.com/embed/playlist/4B0ladDhTDvsiTX1iFITDx'),(8,2002,'https://open.spotify.com/embed/playlist/1rChL3oI9F8iqMUlyg0cM7'),(9,2001,'https://open.spotify.com/embed/playlist/3CBFDzirPRCrwvIVLwRIxM'),(10,2000,'https://open.spotify.com/embed/playlist/7emjAKUrrydxt0NJLGPVrI'),(11,1999,'https://open.spotify.com/embed/playlist/4R5Zxt5yDH65Iyp0ZshIPw'),(12,1998,'https://open.spotify.com/embed/playlist/4nycUlxvh7zCk7ggrZCx0U'),(13,1997,'https://open.spotify.com/embed/playlist/5VnU43VY3oskD8LdZ5TbYV'),(14,1996,'https://open.spotify.com/embed/playlist/7dcEAJxw94nZ3rs9Ri1rIL'),(15,1995,'https://open.spotify.com/embed/playlist/6L9HLcaaEImfyvjlFO7XW0'),(16,1994,'https://open.spotify.com/embed/playlist/7G7yBPv4awaZINF2wHNf5C'),(17,1993,'https://open.spotify.com/embed/playlist/4N9oLVc4LnEQmycopkng3L'),(18,1992,'https://open.spotify.com/embed/playlist/2zVDeJaLku25ULqK0cefTe'),(19,1991,'https://open.spotify.com/embed/playlist/1zSc378jQG9aFNVmYvFGXc'),(20,1990,'https://open.spotify.com/embed/playlist/1JRr5jjo7NDk7o6aWqxTo0'),(21,1989,'https://open.spotify.com/embed/playlist/139zk4puec5sHcdDWE4STE'),(22,1988,'https://open.spotify.com/embed/playlist/7B5TRGtur9BQnNicgYnGAU'),(23,1987,'https://open.spotify.com/embed/playlist/3BQlgrFtwjyWlrOHJX67ap'),(24,1986,'https://open.spotify.com/embed/playlist/1PronIyltfMwY8hFfAaUY5'),(25,1985,'https://open.spotify.com/embed/playlist/2aUDwDjbRYBjtm5RWakOqV'),(26,1984,'https://open.spotify.com/embed/playlist/3NxJMZbt7rhMXBuGX1K6EU'),(27,1983,'https://open.spotify.com/embed/playlist/1TlxjBtrRiTybWwBWGOS77'),(28,1982,'https://open.spotify.com/embed/playlist/5C8ImQU3vp4Xfq2zArseuY'),(29,1981,'https://open.spotify.com/embed/playlist/1lQM52IYviQnTMH0UKL5Kb'),(30,1980,'https://open.spotify.com/embed/playlist/6r47UeIfRmpn04KaFb0gwa');
/*!40000 ALTER TABLE `listas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensajes`
--

DROP TABLE IF EXISTS `mensajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensajes` (
  `id_mensaje` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `id_emisor` smallint(5) unsigned NOT NULL,
  `id_receptor` smallint(5) unsigned NOT NULL,
  `texto` varchar(250) DEFAULT NULL,
  `eliminado` tinyint(1) DEFAULT '0',
  `leido` tinyint(1) DEFAULT '0',
  `fecha_mensaje` datetime DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `fk_mensajes_1` (`id_emisor`),
  KEY `fk_mensajes_2` (`id_receptor`)
) ENGINE=MyISAM AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensajes`
--

LOCK TABLES `mensajes` WRITE;
/*!40000 ALTER TABLE `mensajes` DISABLE KEYS */;
INSERT INTO `mensajes` VALUES (224,3,2,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',1,0,'2021-01-16 18:01:56'),(225,3,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',1,0,'2021-01-16 18:22:57'),(223,2,1,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut eu lorem nec orci malesuada iaculis et in quam. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',1,0,'2021-01-15 21:39:08');
/*!40000 ALTER TABLE `mensajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pais_numero_autores`
--

DROP TABLE IF EXISTS `pais_numero_autores`;
/*!50001 DROP VIEW IF EXISTS `pais_numero_autores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `pais_numero_autores` AS SELECT 
 1 AS `nombre_pais`,
 1 AS `numero_autores`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `paises`
--

DROP TABLE IF EXISTS `paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paises` (
  `id_pais` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(25) NOT NULL,
  `reino_unido` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_pais`),
  UNIQUE KEY `nombre_pais` (`nombre_pais`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paises`
--

LOCK TABLES `paises` WRITE;
/*!40000 ALTER TABLE `paises` DISABLE KEYS */;
INSERT INTO `paises` VALUES (1,'EEUU',0),(2,'Francia',0),(3,'Inglaterra',1),(4,'Finlandia',0),(5,'Canadá',0),(6,'Dinamarca',0),(7,'Japón',0),(8,'Escocia',1),(9,'Suecia',0),(10,'Islandia',0),(11,'Alemania',0),(12,'Gales',1),(13,'Irlanda',0),(14,'Nueva Zelanda',0),(15,'Noruega',0),(17,'Italia',0),(18,'Irlanda del Norte',1),(19,'Bélgica',0),(20,'España',0),(21,'Australia',0),(22,'Polonia',0);
/*!40000 ALTER TABLE `paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publican`
--

DROP TABLE IF EXISTS `publican`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publican` (
  `id_autor` smallint(5) unsigned NOT NULL,
  `id_disco` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_autor`,`id_disco`),
  KEY `fk_publican_2` (`id_disco`),
  CONSTRAINT `fk_publican_1` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`),
  CONSTRAINT `fk_publican_2` FOREIGN KEY (`id_disco`) REFERENCES `discos` (`id_disco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publican`
--

LOCK TABLES `publican` WRITE;
/*!40000 ALTER TABLE `publican` DISABLE KEYS */;
INSERT INTO `publican` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10),(11,11),(12,12),(13,13),(14,14),(15,15),(1,16),(16,17),(17,18),(18,19),(19,20),(20,21),(21,22),(22,23),(23,24),(24,25),(25,26),(26,27),(27,28),(28,29),(29,30),(30,31),(31,32),(32,33),(33,34),(34,35),(35,36),(36,37),(37,38),(38,39),(39,40),(40,41),(41,42),(42,43),(43,44),(44,45),(1,46),(45,47),(46,48),(47,49),(48,50),(49,51),(50,52),(51,53),(52,54),(53,55),(54,56),(25,57),(55,58),(56,59),(57,60),(1,61),(58,62),(59,63),(60,64),(61,65),(62,66),(36,67),(63,68),(64,69),(65,70),(66,71),(67,72),(68,73),(26,74),(69,75),(58,76),(70,77),(31,78),(71,79),(72,80),(73,81),(74,82),(75,83),(76,84),(77,85),(78,86),(79,87),(80,88),(81,89),(82,90),(1,91),(83,92),(84,93),(85,94),(86,95),(37,96),(87,97),(88,98),(89,99),(42,100),(90,101),(91,102),(43,103),(92,104),(93,105),(1,106),(94,107),(95,108),(96,109),(97,110),(98,111),(99,112),(100,113),(15,114),(101,115),(102,116),(103,117),(104,118),(26,119),(105,120),(106,121),(107,122),(74,123),(37,124),(64,125),(108,126),(53,127),(109,128),(42,129),(110,130),(111,131),(43,132),(112,133),(113,134),(114,135),(115,136),(116,137),(117,138),(118,139),(96,140),(99,141),(73,142),(119,143),(66,144),(120,145),(121,146),(122,147),(42,148),(123,149),(124,150),(1,151),(94,152),(125,153),(126,154),(127,155),(128,156),(129,157),(130,158),(131,159),(132,160),(133,161),(134,162),(135,163),(26,164),(136,165),(106,166),(118,167),(73,168),(137,169),(138,170),(139,171),(122,172),(140,173),(141,174),(142,175),(123,176),(110,177),(143,178),(112,179),(144,180),(125,181),(145,182),(126,183),(146,184),(147,185),(73,186),(53,187),(148,188),(149,189),(42,190),(69,191),(150,192),(92,193),(151,194),(152,195),(106,196),(118,197),(154,198),(155,199),(137,200),(156,201),(102,202),(122,203),(157,204),(158,205),(159,206),(160,207),(113,208),(144,209),(114,210),(125,211),(168,212),(154,213),(162,214),(73,215),(163,216),(211,217),(164,218),(148,219),(140,220),(42,221),(165,222),(123,223),(166,224),(167,225),(125,226),(154,227),(168,228),(130,229),(169,230),(170,231),(79,232),(148,233),(149,234),(140,235),(171,236),(172,237),(160,238),(173,239),(114,240),(174,241),(125,242),(161,243),(175,244),(147,245),(176,246),(177,247),(178,248),(42,249),(165,250),(179,251),(180,252),(123,253),(160,254),(167,255),(181,256),(175,257),(182,258),(183,259),(184,260),(137,261),(185,262),(79,263),(186,264),(80,265),(149,266),(141,267),(187,268),(188,269),(189,270),(190,271),(191,272),(138,273),(192,274),(193,275),(194,276),(195,277),(177,278),(196,279),(197,280),(171,281),(198,282),(199,283),(167,284),(200,285),(201,286),(202,287),(147,288),(203,289),(204,290),(205,291),(206,292),(207,293),(208,294),(196,295),(178,296),(209,297),(187,298),(188,299),(210,300),(212,301),(213,302),(214,303),(215,304),(216,305),(217,306),(218,307),(79,308),(194,309),(195,310),(196,311),(219,312),(220,313),(221,314),(222,315),(223,316),(224,317),(225,318),(226,319),(209,320),(79,321),(193,322),(203,323),(196,324),(227,325),(228,326),(141,327),(229,328),(230,329),(231,330),(232,331),(233,332),(214,333),(234,334),(147,335),(225,336),(235,337),(236,338),(218,339),(109,340),(196,341),(141,342),(237,343),(238,344),(200,345),(239,346),(240,347),(147,348),(241,349),(235,350),(236,351),(218,352),(242,353),(109,354),(243,355),(228,356),(141,357),(244,358),(238,359),(230,360),(245,361),(214,362),(147,363),(246,364),(247,365),(218,366),(248,367),(249,368),(250,369),(109,370),(251,371),(252,372),(238,373),(253,374),(254,375),(255,376),(147,377),(256,378),(257,379),(226,380),(258,381),(259,382),(236,383),(260,384),(261,385),(262,386),(263,387),(237,388),(264,389),(238,390),(265,391),(266,392),(255,393),(256,394),(262,395),(109,396),(141,397),(267,398),(268,399),(253,400),(269,401),(200,402),(270,403),(271,404),(272,405),(273,406),(274,407),(214,408),(275,409),(276,410),(277,411),(278,412),(279,413),(280,414),(109,415),(281,416),(282,417),(141,418),(283,419),(284,420),(285,421),(286,422),(287,423),(288,424),(289,425),(280,426),(290,427),(282,428),(219,429),(291,430),(292,431),(284,432),(293,433),(294,434),(272,435),(276,436),(295,437),(296,438),(278,439),(297,440),(280,441),(298,442),(299,443),(219,444),(300,445),(301,446),(302,447),(303,448),(253,449),(304,450);
/*!40000 ALTER TABLE `publican` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `reino_unido`
--

DROP TABLE IF EXISTS `reino_unido`;
/*!50001 DROP VIEW IF EXISTS `reino_unido`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `reino_unido` AS SELECT 
 1 AS `nombre_autor`,
 1 AS `nombre_ciudad`,
 1 AS `nombre_pais`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `relacionados`
--

DROP TABLE IF EXISTS `relacionados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relacionados` (
  `id_disco` smallint(5) unsigned NOT NULL,
  `id_subestilo` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_disco`,`id_subestilo`),
  KEY `fk_relacionados_2` (`id_subestilo`),
  CONSTRAINT `fk_relacionados_1` FOREIGN KEY (`id_disco`) REFERENCES `discos` (`id_disco`),
  CONSTRAINT `fk_relacionados_2` FOREIGN KEY (`id_subestilo`) REFERENCES `subestilos` (`id_subestilo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacionados`
--

LOCK TABLES `relacionados` WRITE;
/*!40000 ALTER TABLE `relacionados` DISABLE KEYS */;
INSERT INTO `relacionados` VALUES (6,1),(90,1),(108,1),(177,1),(178,1),(241,1),(5,2),(128,2),(146,2),(152,2),(216,2),(280,2),(285,2),(307,2),(340,2),(354,2),(370,2),(396,2),(415,2),(1,3),(7,3),(9,3),(43,3),(53,3),(59,3),(66,3),(84,3),(87,3),(88,3),(90,3),(95,3),(100,3),(108,3),(116,3),(118,3),(120,3),(121,3),(123,3),(128,3),(135,3),(136,3),(145,3),(147,3),(149,3),(150,3),(152,3),(153,3),(155,3),(161,3),(162,3),(163,3),(166,3),(169,3),(172,3),(174,3),(176,3),(178,3),(181,3),(184,3),(185,3),(190,3),(196,3),(199,3),(200,3),(202,3),(203,3),(210,3),(216,3),(218,3),(219,3),(221,3),(223,3),(228,3),(230,3),(237,3),(240,3),(244,3),(245,3),(246,3),(247,3),(248,3),(249,3),(251,3),(253,3),(256,3),(257,3),(258,3),(260,3),(261,3),(262,3),(263,3),(267,3),(268,3),(269,3),(270,3),(276,3),(278,3),(279,3),(283,3),(285,3),(295,3),(299,3),(301,3),(307,3),(311,3),(314,3),(318,3),(324,3),(327,3),(329,3),(333,3),(336,3),(338,3),(339,3),(341,3),(342,3),(343,3),(345,3),(351,3),(357,3),(360,3),(362,3),(364,3),(383,3),(385,3),(388,3),(397,3),(402,3),(403,3),(404,3),(9,4),(14,4),(21,4),(27,4),(78,4),(80,4),(107,4),(156,4),(174,4),(206,4),(314,4),(329,4),(334,4),(360,4),(374,4),(381,4),(400,4),(419,4),(420,4),(423,4),(430,4),(450,4),(2,5),(13,5),(16,5),(32,5),(43,5),(46,5),(58,5),(61,5),(73,5),(88,5),(91,5),(99,5),(100,5),(106,5),(111,5),(129,5),(132,5),(148,5),(151,5),(153,5),(155,5),(161,5),(173,5),(190,5),(192,5),(220,5),(223,5),(389,5),(400,5),(422,5),(432,5),(11,6),(26,6),(33,6),(41,6),(50,6),(57,6),(60,6),(79,6),(264,6),(3,7),(8,7),(9,7),(22,7),(29,7),(32,7),(40,7),(47,7),(56,7),(63,7),(73,7),(77,7),(78,7),(80,7),(92,7),(97,7),(102,7),(104,7),(107,7),(109,7),(138,7),(139,7),(140,7),(142,7),(156,7),(167,7),(168,7),(173,7),(193,7),(194,7),(197,7),(232,7),(233,7),(238,7),(319,7),(334,7),(5,8),(160,8),(331,8),(402,8),(14,9),(18,9),(21,9),(27,9),(43,9),(68,9),(70,9),(73,9),(74,9),(112,9),(115,9),(126,9),(141,9),(164,9),(176,9),(192,9),(223,9),(231,9),(243,9),(244,9),(246,9),(250,9),(252,9),(257,9),(268,9),(271,9),(272,9),(274,9),(275,9),(290,9),(294,9),(298,9),(300,9),(303,9),(305,9),(316,9),(317,9),(320,9),(347,9),(376,9),(393,9),(398,9),(422,9),(5,10),(25,10),(10,11),(149,11),(176,11),(265,11),(303,11),(316,11),(333,11),(362,11),(367,11),(387,11),(392,11),(393,11),(394,11),(398,11),(408,11),(420,11),(432,11),(3,12),(19,12),(34,12),(47,12),(54,12),(58,12),(72,12),(81,12),(85,12),(98,12),(138,12),(142,12),(168,12),(171,12),(186,12),(215,12),(281,12),(4,13),(9,13),(12,13),(14,13),(20,13),(23,13),(25,13),(29,13),(42,13),(45,13),(56,13),(63,13),(64,13),(71,13),(85,13),(86,13),(92,13),(93,13),(97,13),(109,13),(130,13),(138,13),(139,13),(140,13),(142,13),(143,13),(144,13),(146,13),(167,13),(168,13),(175,13),(186,13),(197,13),(198,13),(204,13),(213,13),(227,13),(229,13),(231,13),(232,13),(246,13),(286,13),(290,13),(292,13),(293,13),(297,13),(300,13),(306,13),(308,13),(319,13),(320,13),(326,13),(329,13),(337,13),(339,13),(344,13),(349,13),(356,13),(359,13),(360,13),(368,13),(379,13),(380,13),(390,13),(434,13),(1,14),(2,14),(3,14),(5,14),(12,14),(13,14),(14,14),(16,14),(18,14),(20,14),(22,14),(28,14),(29,14),(30,14),(32,14),(35,14),(37,14),(40,14),(45,14),(46,14),(47,14),(54,14),(58,14),(59,14),(61,14),(63,14),(64,14),(65,14),(67,14),(68,14),(69,14),(71,14),(72,14),(73,14),(75,14),(78,14),(81,14),(82,14),(83,14),(86,14),(91,14),(93,14),(94,14),(95,14),(103,14),(105,14),(106,14),(109,14),(110,14),(112,14),(113,14),(117,14),(123,14),(130,14),(131,14),(140,14),(142,14),(143,14),(145,14),(151,14),(155,14),(158,14),(163,14),(166,14),(171,14),(177,14),(181,14),(182,14),(184,14),(189,14),(191,14),(195,14),(201,14),(202,14),(204,14),(205,14),(214,14),(229,14),(234,14),(236,14),(243,14),(266,14),(279,14),(281,14),(295,14),(311,14),(318,14),(321,14),(324,14),(336,14),(341,14),(373,14),(4,15),(225,15),(227,15),(232,15),(243,15),(255,15),(260,15),(263,15),(267,15),(272,15),(274,15),(284,15),(292,15),(293,15),(296,15),(297,15),(300,15),(301,15),(305,15),(306,15),(308,15),(313,15),(315,15),(316,15),(317,15),(319,15),(320,15),(321,15),(326,15),(327,15),(328,15),(329,15),(330,15),(332,15),(337,15),(339,15),(342,15),(344,15),(349,15),(350,15),(353,15),(357,15),(359,15),(365,15),(368,15),(373,15),(378,15),(379,15),(380,15),(382,15),(384,15),(390,15),(391,15),(397,15),(401,15),(406,15),(409,15),(418,15),(424,15),(433,15),(438,15),(445,15),(11,16),(15,17),(22,17),(3,18),(10,18),(18,18),(21,18),(25,18),(44,18),(103,18),(112,18),(126,18),(132,18),(139,18),(141,18),(153,18),(154,18),(156,18),(184,18),(188,18),(192,18),(194,18),(195,18),(206,18),(243,18),(258,18),(268,18),(271,18),(274,18),(280,18),(286,18),(291,18),(297,18),(298,18),(305,18),(313,18),(315,18),(317,18),(371,18),(378,18),(384,18),(394,18),(409,18),(420,18),(428,18),(430,18),(445,18),(4,19),(10,19),(17,19),(59,19),(101,19),(188,19),(192,19),(196,19),(203,19),(210,19),(216,19),(234,19),(236,19),(257,19),(266,19),(270,19),(275,19),(279,19),(294,19),(307,19),(311,19),(318,19),(320,19),(322,19),(326,19),(332,19),(336,19),(341,19),(349,19),(352,19),(356,19),(366,19),(8,20),(1,21),(16,21),(35,21),(36,21),(48,21),(61,21),(91,21),(99,21),(106,21),(110,21),(120,21),(137,21),(151,21),(163,21),(218,21),(259,21),(264,21),(277,21),(282,21),(289,21),(310,21),(323,21),(324,21),(336,21),(338,21),(351,21),(369,21),(383,21),(386,21),(395,21),(441,21),(10,22),(20,22),(23,22),(30,22),(73,22),(88,22),(214,22),(265,22),(272,22),(303,22),(317,22),(322,22),(331,22),(332,22),(333,22),(339,22),(347,22),(352,22),(353,22),(354,22),(358,22),(360,22),(362,22),(365,22),(366,22),(367,22),(370,22),(372,22),(373,22),(378,22),(379,22),(380,22),(384,22),(386,22),(387,22),(392,22),(393,22),(394,22),(395,22),(397,22),(398,22),(402,22),(404,22),(405,22),(407,22),(408,22),(411,22),(414,22),(415,22),(417,22),(418,22),(420,22),(424,22),(426,22),(428,22),(430,22),(432,22),(434,22),(435,22),(437,22),(438,22),(440,22),(441,22),(445,22),(446,22),(449,22),(2,23),(15,23),(24,23),(26,23),(27,23),(31,23),(38,23),(39,23),(48,23),(49,23),(50,23),(51,23),(55,23),(57,23),(58,23),(60,23),(62,23),(63,23),(67,23),(68,23),(74,23),(76,23),(79,23),(96,23),(114,23),(119,23),(124,23),(127,23),(136,23),(159,23),(164,23),(182,23),(187,23),(206,23),(282,23),(422,23),(11,24),(33,24),(41,24),(134,24),(208,24),(13,25),(14,25),(44,25),(103,25),(132,25),(156,25),(238,25),(315,25),(1,26),(7,26),(35,26),(99,26),(134,26),(208,26),(3,27),(171,27),(3,28),(25,28),(42,28),(44,28),(132,28),(156,28),(315,28),(371,28),(401,28),(430,28),(6,29),(287,29),(4,30),(10,30),(17,30),(18,30),(31,30),(37,30),(59,30),(67,30),(70,30),(149,30),(192,30),(218,30),(231,30),(243,30),(244,30),(252,30),(253,30),(257,30),(268,30),(271,30),(272,30),(274,30),(275,30),(283,30),(290,30),(294,30),(298,30),(322,30),(352,30),(366,30),(8,31),(9,31),(34,31),(47,31),(56,31),(77,31),(81,31),(92,31),(98,31),(102,31),(107,31),(138,31),(142,31),(145,31),(168,31),(171,31),(186,31),(215,31),(230,31),(241,31),(265,31),(301,31),(334,31),(375,31),(423,31),(7,32),(2,33),(37,33),(67,33),(68,33),(69,33),(93,33),(94,33),(104,33),(117,33),(125,33),(127,33),(130,33),(222,33),(241,33),(250,33),(282,33),(305,33),(5,34),(12,34),(25,34),(84,34),(128,34),(146,34),(185,34),(235,34),(245,34),(288,34),(293,34),(325,34),(335,34),(340,34),(348,34),(354,34),(355,34),(361,34),(363,34),(370,34),(377,34),(381,34),(396,34),(411,34),(415,34),(423,34),(437,34),(440,34),(450,34),(4,35),(30,35),(139,35),(143,35),(167,35),(197,35),(198,35),(213,35),(227,35),(326,35),(349,35),(434,35),(16,36),(75,36),(82,36),(91,36),(106,36),(123,36),(151,36),(153,36),(179,36),(187,36),(201,36),(259,36),(266,36),(269,36),(277,36),(283,36),(299,36),(302,36),(309,36),(318,36),(324,36),(336,36),(383,36),(414,36),(435,36),(19,37),(20,37),(21,37),(85,37),(21,38),(115,38),(19,39),(21,39),(22,39),(77,39),(80,39),(102,39),(378,39),(24,40),(62,40),(76,40),(277,40),(282,40),(310,40),(25,41),(68,41),(70,41),(115,41),(129,41),(148,41),(160,41),(195,41),(206,41),(26,42),(31,42),(41,42),(50,42),(57,42),(79,42),(134,42),(28,43),(30,43),(34,43),(81,43),(130,43),(171,43),(177,43),(181,43),(186,43),(215,43),(229,43),(236,43),(266,43),(281,43),(336,43),(28,44),(403,44),(28,45),(52,45),(133,45),(179,45),(209,45),(239,45),(287,45),(19,46),(54,46),(85,46),(92,46),(138,46),(197,46),(31,47),(32,48),(40,48),(64,48),(65,48),(83,48),(84,48),(131,48),(191,48),(33,49),(41,49),(217,49),(264,49),(309,49),(33,50),(34,51),(98,51),(107,51),(215,51),(36,52),(36,53),(53,53),(134,53),(149,53),(208,53),(217,53),(237,53),(304,53),(39,54),(105,54),(117,54),(182,54),(44,55),(52,55),(71,55),(103,55),(105,55),(116,55),(121,55),(135,55),(143,55),(144,55),(157,55),(158,55),(166,55),(178,55),(196,55),(199,55),(202,55),(204,55),(210,55),(212,55),(224,55),(225,55),(228,55),(229,55),(240,55),(242,55),(248,55),(251,55),(255,55),(260,55),(270,55),(284,55),(292,55),(296,55),(306,55),(326,55),(327,55),(328,55),(329,55),(330,55),(338,55),(343,55),(351,55),(364,55),(382,55),(388,55),(401,55),(406,55),(409,55),(412,55),(416,55),(424,55),(427,55),(429,55),(433,55),(439,55),(444,55),(445,55),(447,55),(47,56),(54,56),(58,56),(72,56),(90,56),(94,56),(107,56),(205,56),(222,56),(250,56),(265,56),(301,56),(316,56),(357,56),(365,56),(403,56),(404,56),(48,57),(89,57),(49,58),(51,58),(119,58),(148,58),(164,58),(53,59),(54,60),(98,60),(56,61),(60,62),(62,63),(76,63),(63,64),(82,64),(90,64),(99,64),(129,64),(148,64),(190,64),(206,64),(282,64),(375,64),(449,64),(66,65),(66,66),(230,66),(267,66),(319,66),(403,66),(66,67),(122,67),(180,67),(223,67),(237,67),(247,67),(261,67),(278,67),(302,67),(304,67),(372,67),(431,67),(442,67),(68,68),(115,68),(70,69),(115,69),(174,69),(334,69),(422,69),(75,70),(133,70),(150,70),(229,70),(258,70),(302,70),(382,70),(388,70),(406,70),(425,70),(433,70),(84,71),(87,71),(162,71),(165,71),(169,71),(174,71),(198,71),(232,71),(263,71),(267,71),(285,71),(314,71),(315,71),(316,71),(325,71),(330,71),(333,71),(342,71),(345,71),(371,71),(374,71),(389,71),(407,71),(417,71),(419,71),(443,71),(84,72),(160,72),(235,72),(314,72),(325,72),(333,72),(340,72),(354,72),(361,72),(362,72),(363,72),(367,72),(368,72),(370,72),(374,72),(381,72),(389,72),(391,72),(400,72),(407,72),(409,72),(411,72),(412,72),(415,72),(417,72),(423,72),(424,72),(428,72),(433,72),(437,72),(439,72),(443,72),(447,72),(449,72),(450,72),(85,73),(88,74),(88,75),(150,75),(179,75),(265,75),(287,75),(425,75),(89,76),(92,77),(65,78),(101,78),(113,78),(131,78),(150,78),(179,78),(102,79),(102,80),(239,80),(431,80),(442,80),(444,80),(102,81),(103,82),(112,82),(132,82),(141,82),(165,82),(166,82),(169,82),(173,82),(181,82),(188,82),(194,82),(200,82),(204,82),(207,82),(211,82),(212,82),(214,82),(219,82),(220,82),(221,82),(224,82),(226,82),(228,82),(232,82),(233,82),(235,82),(238,82),(242,82),(243,82),(249,82),(254,82),(292,82),(293,82),(110,83),(120,83),(137,83),(210,83),(111,84),(201,84),(205,84),(385,84),(118,85),(237,85),(121,86),(135,86),(196,86),(240,86),(312,86),(429,86),(122,87),(180,87),(191,87),(214,87),(239,87),(251,87),(279,87),(302,87),(312,87),(343,87),(385,87),(386,87),(388,87),(405,87),(407,87),(410,87),(413,87),(429,87),(435,87),(436,87),(439,87),(441,87),(443,87),(444,87),(446,87),(448,87),(129,88),(262,88),(149,89),(161,89),(245,89),(358,89),(150,90),(262,90),(375,90),(431,90),(152,91),(162,91),(386,91),(395,91),(152,92),(400,92),(407,92),(449,92),(152,93),(154,94),(183,94),(154,95),(280,95),(159,96),(160,97),(191,97),(160,98),(161,99),(170,100),(195,100),(273,100),(170,101),(170,102),(273,102),(280,102),(407,102),(170,103),(171,104),(175,105),(213,105),(175,106),(175,107),(325,107),(334,107),(368,107),(391,107),(419,107),(180,108),(261,108),(183,109),(183,110),(192,111),(218,111),(192,112),(206,113),(206,114),(207,115),(220,115),(235,115),(238,115),(254,115),(261,115),(263,115),(344,115),(359,115),(209,116),(310,116),(369,116),(383,116),(395,116),(399,116),(410,116),(413,116),(421,116),(436,116),(213,117),(217,118),(223,118),(236,118),(237,118),(247,118),(253,118),(256,118),(258,118),(269,118),(276,118),(278,118),(309,118),(318,118),(239,119),(385,119),(265,120),(271,121),(280,121),(286,121),(291,121),(313,121),(331,121),(273,122),(350,122),(273,123),(277,124),(310,124),(386,124),(387,124),(405,124),(414,124),(426,124),(435,124),(282,125),(287,126),(382,126),(425,126),(287,127),(295,127),(311,127),(406,127),(424,127),(302,128),(442,128),(304,129),(304,130),(318,131),(434,131),(325,132),(332,133),(349,133),(353,133),(335,134),(348,134),(345,135),(346,136),(346,137),(350,138),(412,138),(355,139),(355,140),(358,141),(398,141),(408,141),(417,141),(360,142),(437,142),(361,143),(377,143),(381,143),(389,143),(419,143),(450,143),(371,144),(371,145),(400,145),(375,146),(375,147),(376,148),(393,148),(377,149),(396,150),(399,151),(401,152),(406,153),(436,153),(406,154),(407,155),(448,155),(410,156),(436,156),(412,157),(434,157),(439,157),(413,158),(442,159),(449,160);
/*!40000 ALTER TABLE `relacionados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subestilos`
--

DROP TABLE IF EXISTS `subestilos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subestilos` (
  `id_subestilo` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_subestilo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_subestilo`),
  UNIQUE KEY `nombre_subestilo` (`nombre_subestilo`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subestilos`
--

LOCK TABLES `subestilos` WRITE;
/*!40000 ALTER TABLE `subestilos` DISABLE KEYS */;
INSERT INTO `subestilos` VALUES (66,'Acoustic Rock'),(160,'Afrobeat'),(1,'Alt-Country'),(2,'Alternative Dance'),(53,'Alternative Metal'),(3,'Alternative Rock'),(58,'Ambient'),(69,'Ambient Pop'),(60,'Americana'),(156,'Anarcho-Punk'),(77,'Anti Folk'),(4,'Art Pop'),(124,'Art Punk'),(5,'Art Rock'),(6,'Atmospheric Sludge Metal'),(121,'Baggy/Madchester'),(39,'Baroque Pop'),(146,'Beat Poetry'),(94,'Big Beat'),(47,'Blackgaze'),(138,'Blue-Eyed Soul'),(90,'Blues Rock'),(73,'Bossa nova'),(104,'Brass Band'),(109,'Breakbeat'),(82,'Britpop'),(133,'C86'),(46,'Chamber Folk'),(96,'Chamber Music'),(7,'Chamber Pop'),(141,'Coldwave'),(51,'Contemporary Folk'),(81,'Country Soul'),(119,'Cowpunk'),(139,'Dance-Pop'),(8,'Dance-Punk'),(147,'Dark Cabaret'),(134,'Darkwave'),(93,'Disco'),(59,'Doom Metal'),(101,'Downtempo'),(9,'Dream Pop'),(62,'Drone Metal'),(102,'Dub'),(136,'East Coast Hip Hop'),(98,'Electroclash'),(10,'Electropop'),(83,'Emo'),(76,'Emoviolence'),(148,'Ethereal Wave'),(64,'Experimental Rock'),(37,'Folk Pop'),(44,'Folk Punk'),(56,'Folk Rock'),(38,'Folktronica'),(140,'Freestyle'),(114,'French Pop'),(92,'Funk'),(129,'Funk Metal'),(91,'Funk Rock'),(45,'Garage Punk'),(70,'Garage Rock'),(78,'Garage Rock Revival'),(108,'Glam Punk'),(115,'Glam Rock'),(63,'Glitch'),(68,'Glitch Pop'),(74,'Gospel'),(120,'Gothic Country'),(11,'Gothic Rock'),(118,'Grunge'),(67,'Hard Rock'),(116,'Hardcore Punk'),(135,'Heartland Rock'),(128,'Heavy Metal'),(150,'Hi-NRG'),(158,'Horror Punk'),(95,'House'),(12,'Indie Folk'),(13,'Indie Pop'),(14,'Indie Rock'),(41,'Indietronica'),(149,'Industrial'),(99,'Industrial Metal'),(89,'Industrial Rock'),(15,'Jangle Pop'),(132,'Jazz Pop'),(88,'Jazz-Rock'),(113,'Krautrock'),(43,'Lo-Fi Indie'),(131,'Lo-Fi/Slacker Rock'),(105,'Lounge'),(40,'Math Rock'),(52,'Mathcore'),(16,'Melodic Death Metal'),(54,'Midwest Emo'),(157,'Mod Revival'),(17,'Modern Classical'),(18,'Neo-Psychedelia'),(143,'New Romantic'),(72,'New Wave'),(19,'Noise Pop'),(36,'Noise Rock'),(20,'Nouvelle Chanson Française'),(152,'Paisley Underground'),(61,'Piano Rock'),(86,'Pop Punk'),(71,'Pop Rock'),(106,'Pop Soul'),(65,'Post-Grunge'),(21,'Post-Hardcore'),(103,'Post-Industrial'),(42,'Post-Metal'),(22,'Post-Punk'),(48,'Post-Punk Revival'),(23,'Post-Rock'),(55,'Power Pop'),(24,'Progressive Metal'),(25,'Progressive Pop'),(26,'Progressive Rock'),(27,'Psychedelic Folk'),(28,'Psychedelic Pop'),(84,'Psychedelic Rock'),(144,'Psychedelic Soul'),(126,'Psychobilly'),(75,'Punk Blues'),(87,'Punk Rock'),(130,'Rap Metal'),(137,'Rap Rock'),(155,'Reggae'),(97,'Riot Grrrl'),(80,'Rock & Roll'),(29,'Rockabilly'),(57,'Screamo'),(30,'Shoegaze'),(31,'Singer/Songwriter'),(32,'Ska Punk'),(151,'Skate Punk'),(33,'Slowcore'),(49,'Sludge Metal'),(107,'Sophisti-Pop'),(122,'Soul'),(111,'Space Rock'),(159,'Speed Metal'),(125,'Spoken Word'),(50,'Stoner Metal'),(85,'Stoner Rock'),(117,'Sunshine Pop'),(153,'Surf Punk'),(127,'Surf Rock'),(112,'Symphonic Rock'),(145,'Synth Funk'),(34,'Synthpop'),(110,'Tech House'),(79,'Traditional Pop'),(100,'Trip Hop'),(35,'Twee Pop'),(123,'UK Hip Hop'),(154,'Vocal Surf'),(142,'Zolo');
/*!40000 ALTER TABLE `subestilos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `subestilos_numero_autores`
--

DROP TABLE IF EXISTS `subestilos_numero_autores`;
/*!50001 DROP VIEW IF EXISTS `subestilos_numero_autores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `subestilos_numero_autores` AS SELECT 
 1 AS `nombre_subestilo`,
 1 AS `numero_autores`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `top_10`
--

DROP TABLE IF EXISTS `top_10`;
/*!50001 DROP VIEW IF EXISTS `top_10`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `top_10` AS SELECT 
 1 AS `nombre_autor`,
 1 AS `titulo_cancion`,
 1 AS `votos_facebook`,
 1 AS `ano`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `top_10_00`
--

DROP TABLE IF EXISTS `top_10_00`;
/*!50001 DROP VIEW IF EXISTS `top_10_00`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `top_10_00` AS SELECT 
 1 AS `nombre_autor`,
 1 AS `titulo_cancion`,
 1 AS `votos_facebook`,
 1 AS `ano`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `top_10_80`
--

DROP TABLE IF EXISTS `top_10_80`;
/*!50001 DROP VIEW IF EXISTS `top_10_80`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `top_10_80` AS SELECT 
 1 AS `nombre_autor`,
 1 AS `titulo_cancion`,
 1 AS `votos_facebook`,
 1 AS `ano`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `top_10_90`
--

DROP TABLE IF EXISTS `top_10_90`;
/*!50001 DROP VIEW IF EXISTS `top_10_90`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `top_10_90` AS SELECT 
 1 AS `nombre_autor`,
 1 AS `titulo_cancion`,
 1 AS `votos_facebook`,
 1 AS `ano`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id_usuario` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(25) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `contrasena` varchar(300) DEFAULT NULL,
  `formato` enum('Casete','CD','MP3','Vinilo') DEFAULT NULL,
  `id_autor` smallint(5) unsigned DEFAULT NULL,
  `id_subestilo` tinyint(3) unsigned DEFAULT NULL,
  `id_ciudad` smallint(5) unsigned DEFAULT NULL,
  `id_ciudad_actual` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `correo` (`correo`),
  UNIQUE KEY `nombre_usuario_2` (`nombre_usuario`,`correo`),
  UNIQUE KEY `nombre_usuario_3` (`nombre_usuario`,`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Administrador','50erapop@gmail.com','$2y$10$0ccx1hUVnYtcoD7uV2gz0eJAw5vXmrOMwLexKg5DWqfLY52RaCjBW','MP3',42,57,48,131),(2,'Optigan','optigan@msn.com','$2y$10$l8qHy7FHdkSxWii6g9Vt3OeP1urwsRirPFg2SFFQhHuQK6dgM.lci','Casete',189,70,14,131),(3,'Javi','javierblancoperez@gmail.com','$2y$10$H82SnKzB44SW6qRbQIXxzutLAgfqxAzYL1Wodq.LG4H/EHTDxpltG','MP3',42,30,48,NULL),(6,'un_nombre_largo_de_25_car','optiganga@msn.com','$2y$10$x9qPaujq1AUSlQ2liJvAe.YSJ7u9xoS4WwiePTlauGDU2yKtBJyby','Casete',1,20,5,33),(7,'WWWWWWWWWWWWWWWWWWWWWWWWW','antonio@gmail.com','$2y$10$fg3jZQ42IlR0PrvfMdf9nuiDLOw6XpDNscF1lzZZptFiMg9RMTjFm','Casete',1,6,5,33),(8,'Optiganga','javierblanco@gmail.com','$2y$10$IRoWBCCnirYuJNTmaJ.jPuiJzcOBWIOmsPDqfMsS9XUxuaR0z/gy.',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votan`
--

DROP TABLE IF EXISTS `votan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votan` (
  `id_usuario` smallint(5) unsigned NOT NULL,
  `id_cancion` smallint(5) unsigned NOT NULL,
  `nota` tinyint(3) unsigned DEFAULT NULL,
  `fecha_voto` datetime DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_cancion`),
  KEY `fk_votan_2` (`id_cancion`),
  CONSTRAINT `fk_votan_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `fk_votan_2` FOREIGN KEY (`id_cancion`) REFERENCES `canciones` (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votan`
--

LOCK TABLES `votan` WRITE;
/*!40000 ALTER TABLE `votan` DISABLE KEYS */;
INSERT INTO `votan` VALUES (3,54,3,'2021-01-16 17:56:02'),(3,75,5,'2021-01-16 18:17:18'),(3,93,4,'2021-01-16 17:55:39'),(3,158,4,'2021-01-16 17:57:23'),(3,159,3,'2021-01-16 17:57:20'),(3,182,4,'2021-01-16 17:55:01'),(3,241,4,'2021-01-16 17:55:18'),(3,243,4,'2021-01-16 17:55:21'),(3,275,5,'2021-01-16 17:53:14'),(3,287,4,'2021-01-16 18:02:25'),(3,290,3,'2021-01-16 18:02:33'),(3,319,3,'2021-01-16 17:56:34'),(3,333,4,'2021-01-16 17:54:35'),(3,334,4,'2021-01-16 17:54:41'),(3,351,5,'2021-01-16 17:53:59'),(3,360,4,'2021-01-16 17:54:17'),(3,409,4,'2021-01-16 18:23:41'),(3,414,3,'2021-01-16 17:56:54'),(3,415,3,'2021-01-16 18:24:00'),(3,426,4,'2021-01-16 18:22:14');
/*!40000 ALTER TABLE `votan` ENABLE KEYS */;
UNLOCK TABLES;
ALTER DATABASE `recopilatorios` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER insercion_voto

	AFTER INSERT ON votan FOR EACH ROW
	
    BEGIN

        SET @votos = (SELECT count(nota) FROM votan WHERE id_cancion = NEW.id_cancion);
        SET @nota_total = (SELECT sum(nota) FROM votan WHERE id_cancion = NEW.id_cancion);
        
        SET @nota_media = @nota_total / @votos;
        
        UPDATE canciones SET votos_web = @votos WHERE id_cancion = NEW.id_cancion;
        UPDATE canciones SET nota_media = @nota_media WHERE id_cancion = NEW.id_cancion;
        
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `recopilatorios` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
ALTER DATABASE `recopilatorios` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizacion_voto
    
    AFTER UPDATE ON votan FOR EACH ROW
	
    BEGIN

        SET @votos = (SELECT count(nota) FROM votan WHERE id_cancion = OLD.id_cancion);
        SET @nota_total = (SELECT sum(nota) FROM votan WHERE id_cancion = OLD.id_cancion);
        
        SET @nota_media = @nota_total / @votos;
        
        UPDATE canciones SET votos_web = @votos WHERE id_cancion = OLD.id_cancion;
        UPDATE canciones SET nota_media = @nota_media WHERE id_cancion = OLD.id_cancion;
        
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `recopilatorios` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
ALTER DATABASE `recopilatorios` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER borrado_voto

	AFTER DELETE ON votan FOR EACH ROW
	
    BEGIN

        SET @votos = (SELECT count(nota) FROM votan WHERE id_cancion = OLD.id_cancion);
        SET @nota_total = (SELECT sum(nota) FROM votan WHERE id_cancion = OLD.id_cancion);
        
        SET @nota_media = @nota_total / @votos;
        
        UPDATE canciones SET votos_web = @votos WHERE id_cancion = OLD.id_cancion;
        UPDATE canciones SET nota_media = @nota_media WHERE id_cancion = OLD.id_cancion;
        
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `recopilatorios` CHARACTER SET utf8 COLLATE utf8_unicode_ci ;

--
-- Temporary table structure for view `votos_ano`
--

DROP TABLE IF EXISTS `votos_ano`;
/*!50001 DROP VIEW IF EXISTS `votos_ano`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `votos_ano` AS SELECT 
 1 AS `ano`,
 1 AS `suma_votos`,
 1 AS `media`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'recopilatorios'
--

--
-- Dumping routines for database 'recopilatorios'
--

--
-- Final view structure for view `autor_numero_discos`
--

/*!50001 DROP VIEW IF EXISTS `autor_numero_discos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `autor_numero_discos` AS select `autores`.`nombre_autor` AS `nombre_autor`,count(`publican`.`id_disco`) AS `numero_discos` from ((`autores` join `publican` on((`autores`.`id_autor` = `publican`.`id_autor`))) join `discos` on((`publican`.`id_disco` = `discos`.`id_disco`))) group by `autores`.`nombre_autor` having (count(`publican`.`id_disco`) > 1) order by `numero_discos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `autores_retirados`
--

/*!50001 DROP VIEW IF EXISTS `autores_retirados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `autores_retirados` AS select `autores`.`nombre_autor` AS `nombre_autor`,(`autores`.`ano_retirada` - `autores`.`ano_debut`) AS `anos_activo` from `autores` where (`autores`.`ano_retirada` is not null) order by (`autores`.`ano_retirada` - `autores`.`ano_debut`) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ciudad_numero_autores`
--

/*!50001 DROP VIEW IF EXISTS `ciudad_numero_autores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ciudad_numero_autores` AS select `ciudades`.`nombre_ciudad` AS `nombre_ciudad`,count(`autores`.`id_autor`) AS `numero_autores`,`paises`.`nombre_pais` AS `nombre_pais` from ((`autores` join `ciudades` on((`autores`.`id_ciudad` = `ciudades`.`id_ciudad`))) join `paises` on((`ciudades`.`id_pais` = `paises`.`id_pais`))) group by `autores`.`id_ciudad` having (`numero_autores` <> 1) order by `numero_autores` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `estilos_numero_autores`
--

/*!50001 DROP VIEW IF EXISTS `estilos_numero_autores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `estilos_numero_autores` AS select `estilos`.`nombre_estilo` AS `nombre_estilo`,count(distinct `autores`.`id_autor`) AS `numero_autores` from ((((((`autores` join `publican` on((`autores`.`id_autor` = `publican`.`id_autor`))) join `discos` on((`publican`.`id_disco` = `discos`.`id_disco`))) join `relacionados` on((`publican`.`id_disco` = `relacionados`.`id_disco`))) join `subestilos` on((`relacionados`.`id_subestilo` = `subestilos`.`id_subestilo`))) join `agrupados` on((`relacionados`.`id_subestilo` = `agrupados`.`id_subestilo`))) join `estilos` on((`agrupados`.`id_estilo` = `estilos`.`id_estilo`))) group by `estilos`.`nombre_estilo` order by `numero_autores` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pais_numero_autores`
--

/*!50001 DROP VIEW IF EXISTS `pais_numero_autores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pais_numero_autores` AS select `paises`.`nombre_pais` AS `nombre_pais`,count(`autores`.`id_autor`) AS `numero_autores` from ((`paises` join `ciudades` on((`paises`.`id_pais` = `ciudades`.`id_pais`))) join `autores` on((`ciudades`.`id_ciudad` = `autores`.`id_ciudad`))) group by `paises`.`nombre_pais` order by `numero_autores` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `reino_unido`
--

/*!50001 DROP VIEW IF EXISTS `reino_unido`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `reino_unido` AS select `autores`.`nombre_autor` AS `nombre_autor`,`ciudades`.`nombre_ciudad` AS `nombre_ciudad`,`paises`.`nombre_pais` AS `nombre_pais` from ((`autores` join `ciudades` on((`autores`.`id_ciudad` = `ciudades`.`id_ciudad`))) join `paises` on((`ciudades`.`id_pais` = `paises`.`id_pais`))) where (`paises`.`reino_unido` = 1) order by `paises`.`nombre_pais` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `subestilos_numero_autores`
--

/*!50001 DROP VIEW IF EXISTS `subestilos_numero_autores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `subestilos_numero_autores` AS select `subestilos`.`nombre_subestilo` AS `nombre_subestilo`,count(distinct `autores`.`id_autor`) AS `numero_autores` from ((((`autores` join `publican` on((`autores`.`id_autor` = `publican`.`id_autor`))) join `discos` on((`publican`.`id_disco` = `discos`.`id_disco`))) join `relacionados` on((`publican`.`id_disco` = `relacionados`.`id_disco`))) join `subestilos` on((`relacionados`.`id_subestilo` = `subestilos`.`id_subestilo`))) group by `subestilos`.`nombre_subestilo` order by `numero_autores` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10`
--

/*!50001 DROP VIEW IF EXISTS `top_10`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10` AS select `autores`.`nombre_autor` AS `nombre_autor`,`canciones`.`titulo_cancion` AS `titulo_cancion`,`canciones`.`votos_facebook` AS `votos_facebook`,`listas`.`ano` AS `ano` from ((((`listas` join `canciones` on((`listas`.`id_lista` = `canciones`.`id_lista`))) join `discos` on((`canciones`.`id_cancion` = `discos`.`id_cancion`))) join `publican` on((`discos`.`id_disco` = `publican`.`id_disco`))) join `autores` on((`publican`.`id_autor` = `autores`.`id_autor`))) order by `canciones`.`votos_facebook` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10_00`
--

/*!50001 DROP VIEW IF EXISTS `top_10_00`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10_00` AS select `autores`.`nombre_autor` AS `nombre_autor`,`canciones`.`titulo_cancion` AS `titulo_cancion`,`canciones`.`votos_facebook` AS `votos_facebook`,`listas`.`ano` AS `ano` from ((((`listas` join `canciones` on((`listas`.`id_lista` = `canciones`.`id_lista`))) join `discos` on((`canciones`.`id_cancion` = `discos`.`id_cancion`))) join `publican` on((`discos`.`id_disco` = `publican`.`id_disco`))) join `autores` on((`publican`.`id_autor` = `autores`.`id_autor`))) where (`listas`.`ano` between 2000 and 2009) order by `canciones`.`votos_facebook` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10_80`
--

/*!50001 DROP VIEW IF EXISTS `top_10_80`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10_80` AS select `autores`.`nombre_autor` AS `nombre_autor`,`canciones`.`titulo_cancion` AS `titulo_cancion`,`canciones`.`votos_facebook` AS `votos_facebook`,`listas`.`ano` AS `ano` from ((((`listas` join `canciones` on((`listas`.`id_lista` = `canciones`.`id_lista`))) join `discos` on((`canciones`.`id_cancion` = `discos`.`id_cancion`))) join `publican` on((`discos`.`id_disco` = `publican`.`id_disco`))) join `autores` on((`publican`.`id_autor` = `autores`.`id_autor`))) where (`listas`.`ano` between 1980 and 1989) order by `canciones`.`votos_facebook` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `top_10_90`
--

/*!50001 DROP VIEW IF EXISTS `top_10_90`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `top_10_90` AS select `autores`.`nombre_autor` AS `nombre_autor`,`canciones`.`titulo_cancion` AS `titulo_cancion`,`canciones`.`votos_facebook` AS `votos_facebook`,`listas`.`ano` AS `ano` from ((((`listas` join `canciones` on((`listas`.`id_lista` = `canciones`.`id_lista`))) join `discos` on((`canciones`.`id_cancion` = `discos`.`id_cancion`))) join `publican` on((`discos`.`id_disco` = `publican`.`id_disco`))) join `autores` on((`publican`.`id_autor` = `autores`.`id_autor`))) where (`listas`.`ano` between 1990 and 1999) order by `canciones`.`votos_facebook` desc limit 10 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `votos_ano`
--

/*!50001 DROP VIEW IF EXISTS `votos_ano`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `votos_ano` AS select `listas`.`ano` AS `ano`,sum(`canciones`.`votos_facebook`) AS `suma_votos`,round((sum(`canciones`.`votos_facebook`) / count(`canciones`.`id_cancion`)),2) AS `media` from ((`listas` join `canciones` on((`listas`.`id_lista` = `canciones`.`id_lista`))) join `discos` on((`canciones`.`id_cancion` = `discos`.`id_cancion`))) group by `listas`.`ano` order by `suma_votos` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-01-22 21:38:02
