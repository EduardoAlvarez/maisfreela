-- MySQL dump 10.13  Distrib 5.6.16, for Win32 (x86)
--
-- Host: localhost    Database: maisfreela
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `avaliacao`
--

DROP TABLE IF EXISTS `avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avaliacao` (
  `id_avaliacao` bigint(20) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `grau` double NOT NULL,
  `id_desenvolvedor` bigint(20) DEFAULT NULL,
  `id_empresario` bigint(20) DEFAULT NULL,
  `id_usuario_remetente` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `FK_p8ywa74oqs93l2t8nchmyxr0s` (`id_desenvolvedor`),
  KEY `FK_i3j4ljsjomfyqvu558ochd7c5` (`id_empresario`),
  KEY `FK_ehnb17q0nmdckq2vom2wf7rlp` (`id_usuario_remetente`),
  CONSTRAINT `FK_ehnb17q0nmdckq2vom2wf7rlp` FOREIGN KEY (`id_usuario_remetente`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_i3j4ljsjomfyqvu558ochd7c5` FOREIGN KEY (`id_empresario`) REFERENCES `empresario` (`id_empresario`),
  CONSTRAINT `FK_p8ywa74oqs93l2t8nchmyxr0s` FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,'empresaio avaliando dev',5,1,NULL,2),(2,'dev avaliando empresario',3,NULL,1,1);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_bancaria`
--

DROP TABLE IF EXISTS `conta_bancaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conta_bancaria` (
  `id_conta` bigint(20) NOT NULL AUTO_INCREMENT,
  `agencia` int(11) NOT NULL,
  `banco` int(11) NOT NULL,
  `contaCorrente` int(11) NOT NULL,
  `id_desenvolvedor` bigint(20) DEFAULT NULL,
  `id_empresario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_conta`),
  KEY `FK_js3qley8epmati47870qnl6m9` (`id_desenvolvedor`),
  KEY `FK_qvyx5sfxphnovqddlq24y8ebe` (`id_empresario`),
  CONSTRAINT `FK_qvyx5sfxphnovqddlq24y8ebe` FOREIGN KEY (`id_empresario`) REFERENCES `empresario` (`id_empresario`),
  CONSTRAINT `FK_js3qley8epmati47870qnl6m9` FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_bancaria`
--

LOCK TABLES `conta_bancaria` WRITE;
/*!40000 ALTER TABLE `conta_bancaria` DISABLE KEYS */;
INSERT INTO `conta_bancaria` VALUES (1,34,41,812713,1,NULL),(2,9813,5121,6212551,NULL,1);
/*!40000 ALTER TABLE `conta_bancaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desenvolvedor`
--

DROP TABLE IF EXISTS `desenvolvedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desenvolvedor` (
  `id_desenvolvedor` bigint(20) NOT NULL AUTO_INCREMENT,
  `avaliacao` float NOT NULL,
  `id_conta_bancaria` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_desenvolvedor`),
  KEY `FK_rtmt229j23m4a2513q5prodk2` (`id_conta_bancaria`),
  KEY `FK_mksk8tgejemhnqeh0ux4yemap` (`id_usuario`),
  CONSTRAINT `FK_mksk8tgejemhnqeh0ux4yemap` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_rtmt229j23m4a2513q5prodk2` FOREIGN KEY (`id_conta_bancaria`) REFERENCES `conta_bancaria` (`id_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desenvolvedor`
--

LOCK TABLES `desenvolvedor` WRITE;
/*!40000 ALTER TABLE `desenvolvedor` DISABLE KEYS */;
INSERT INTO `desenvolvedor` VALUES (1,4.2,1,1);
/*!40000 ALTER TABLE `desenvolvedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `desenvolvedor_has_tags`
--

DROP TABLE IF EXISTS `desenvolvedor_has_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `desenvolvedor_has_tags` (
  `id_tag` int(11) NOT NULL,
  `id_desenvolvedor` bigint(20) NOT NULL,
  KEY `FK_tlouhui8d3b3nf5lpt6323ir6` (`id_desenvolvedor`),
  KEY `FK_h8mk0vfeqtp9c2dld747jjvkr` (`id_tag`),
  CONSTRAINT `FK_h8mk0vfeqtp9c2dld747jjvkr` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`),
  CONSTRAINT `FK_tlouhui8d3b3nf5lpt6323ir6` FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desenvolvedor_has_tags`
--

LOCK TABLES `desenvolvedor_has_tags` WRITE;
/*!40000 ALTER TABLE `desenvolvedor_has_tags` DISABLE KEYS */;
INSERT INTO `desenvolvedor_has_tags` VALUES (1,1),(2,1),(3,1);
/*!40000 ALTER TABLE `desenvolvedor_has_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresario`
--

DROP TABLE IF EXISTS `empresario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresario` (
  `id_empresario` bigint(20) NOT NULL AUTO_INCREMENT,
  `avaliacao` float NOT NULL,
  `id_conta_bancaria` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_empresario`),
  KEY `FK_n8ctwh7pheqpfnboayf4o963b` (`id_conta_bancaria`),
  KEY `FK_5vc6sr93uib2k73cpj2klkl91` (`id_usuario`),
  CONSTRAINT `FK_5vc6sr93uib2k73cpj2klkl91` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_n8ctwh7pheqpfnboayf4o963b` FOREIGN KEY (`id_conta_bancaria`) REFERENCES `conta_bancaria` (`id_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresario`
--

LOCK TABLES `empresario` WRITE;
/*!40000 ALTER TABLE `empresario` DISABLE KEYS */;
INSERT INTO `empresario` VALUES (1,3.2,2,2);
/*!40000 ALTER TABLE `empresario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lance`
--

DROP TABLE IF EXISTS `lance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lance` (
  `id_lance` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `valor` float NOT NULL,
  `id_desenvolvedor` bigint(20) DEFAULT NULL,
  `id_projeto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lance`),
  KEY `FK_jljsfe8q4nufma0gopjwntaiq` (`id_desenvolvedor`),
  KEY `FK_fsg6aoleeqc13eis9i17qef7i` (`id_projeto`),
  CONSTRAINT `FK_fsg6aoleeqc13eis9i17qef7i` FOREIGN KEY (`id_projeto`) REFERENCES `projeto` (`id_projeto`),
  CONSTRAINT `FK_jljsfe8q4nufma0gopjwntaiq` FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lance`
--

LOCK TABLES `lance` WRITE;
/*!40000 ALTER TABLE `lance` DISABLE KEYS */;
/*!40000 ALTER TABLE `lance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificacao`
--

DROP TABLE IF EXISTS `notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notificacao` (
  `id_notificacao` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_notificacao`),
  KEY `FK_hs2py1y6lgm5iht49b6ig3gnh` (`id_usuario`),
  CONSTRAINT `FK_hs2py1y6lgm5iht49b6ig3gnh` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto`
--

DROP TABLE IF EXISTS `projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto` (
  `id_projeto` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicio` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `pagamento1` tinyint(1) DEFAULT NULL,
  `pagamento2` tinyint(1) DEFAULT NULL,
  `prazo` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `valor` float NOT NULL,
  `id_desenvolvedor` bigint(20) DEFAULT NULL,
  `id_empresario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_projeto`),
  KEY `FK_44fp25e2o4l6bd8y1oijl1xw4` (`id_desenvolvedor`),
  KEY `FK_3v7apjwevl506trtq7ohxbcp1` (`id_empresario`),
  CONSTRAINT `FK_3v7apjwevl506trtq7ohxbcp1` FOREIGN KEY (`id_empresario`) REFERENCES `empresario` (`id_empresario`),
  CONSTRAINT `FK_44fp25e2o4l6bd8y1oijl1xw4` FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,NULL,'PÃ¡gina Web em PHP',0,0,10,'em aguardo','PÃ¡gina web',300,NULL,1),(2,'2014-11-16 00:00:00','Interface de blog',1,0,7,'em andamento','Interface',150,1,1),(3,'2014-11-01 00:00:00','App de celular  ',1,1,3,'finalizado','Aplicativo',350,1,1);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_has_tags`
--

DROP TABLE IF EXISTS `projeto_has_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_has_tags` (
  `id_tag` int(11) NOT NULL,
  `id_projeto` int(11) NOT NULL,
  KEY `FK_r5puoaodqu5st3meepndpn4ej` (`id_projeto`),
  KEY `FK_4y47j0v1gpo43n14isxtw6d2m` (`id_tag`),
  CONSTRAINT `FK_4y47j0v1gpo43n14isxtw6d2m` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`),
  CONSTRAINT `FK_r5puoaodqu5st3meepndpn4ej` FOREIGN KEY (`id_projeto`) REFERENCES `projeto` (`id_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_has_tags`
--

LOCK TABLES `projeto_has_tags` WRITE;
/*!40000 ALTER TABLE `projeto_has_tags` DISABLE KEYS */;
INSERT INTO `projeto_has_tags` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `projeto_has_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'PHP'),(2,'JAVA'),(3,'JSON'),(4,'MYSQL'),(5,'C#');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `sobre` varchar(255) DEFAULT NULL,
  `telefone` int(11) DEFAULT NULL,
  `id_desenvolvedor` bigint(20) DEFAULT NULL,
  `id_empresario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `FK_jic921hbphdg9xmffownj256g` (`id_desenvolvedor`),
  KEY `FK_byc20ht54g1aglhbb9a7mlrot` (`id_empresario`),
  CONSTRAINT `FK_byc20ht54g1aglhbb9a7mlrot` FOREIGN KEY (`id_empresario`) REFERENCES `empresario` (`id_empresario`),
  CONSTRAINT `FK_jic921hbphdg9xmffownj256g` FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,NULL,'eduardo.alvarez@maisfreela.com.br','av teste de teste','eduardo','Eduardo Alvarez','12345','Desenvolvedor PHP',777666545,1,NULL),(2,NULL,'henriquevarjas@gmail.com','rua teste teste dsf','henrique','Henrique Barjsa','54321','Gerente de T.I,',2147483647,NULL,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-15 18:20:55
