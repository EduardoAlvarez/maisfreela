-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: maisfreela
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

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
-- Table structure for table `Avaliacao`
--

DROP TABLE IF EXISTS `Avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Avaliacao` (
  `id_avaliacao` bigint(20) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `grau` double NOT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_avaliacao`),
  KEY `FK_k0c0v53yh5c61l1nqrm58epri` (`id_usuario`),
  CONSTRAINT `FK_k0c0v53yh5c61l1nqrm58epri` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Avaliacao`
--

LOCK TABLES `Avaliacao` WRITE;
/*!40000 ALTER TABLE `Avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Email`
--

DROP TABLE IF EXISTS `Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Email` (
  `id_email` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Email`
--

LOCK TABLES `Email` WRITE;
/*!40000 ALTER TABLE `Email` DISABLE KEYS */;
/*!40000 ALTER TABLE `Email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lance`
--

DROP TABLE IF EXISTS `Lance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lance` (
  `id_lance` int(11) NOT NULL AUTO_INCREMENT,
  `comentario` varchar(255) DEFAULT NULL,
  `valor` double NOT NULL,
  `id_projeto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lance`),
  KEY `FK_mq1v3oxnw0ktulslisgx0fda9` (`id_projeto`),
  CONSTRAINT `FK_mq1v3oxnw0ktulslisgx0fda9` FOREIGN KEY (`id_projeto`) REFERENCES `Projeto` (`id_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lance`
--

LOCK TABLES `Lance` WRITE;
/*!40000 ALTER TABLE `Lance` DISABLE KEYS */;
/*!40000 ALTER TABLE `Lance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Notificacao`
--

DROP TABLE IF EXISTS `Notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Notificacao` (
  `id_notificacao` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_notificacao`),
  KEY `FK_9huk5xbhbi3p8c5cvrb6c1pd8` (`id_usuario`),
  CONSTRAINT `FK_9huk5xbhbi3p8c5cvrb6c1pd8` FOREIGN KEY (`id_usuario`) REFERENCES `Usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Notificacao`
--

LOCK TABLES `Notificacao` WRITE;
/*!40000 ALTER TABLE `Notificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Projeto`
--

DROP TABLE IF EXISTS `Projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Projeto` (
  `id_projeto` int(11) NOT NULL AUTO_INCREMENT,
  `dataInicio` datetime DEFAULT NULL,
  `dataTermino` datetime DEFAULT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `pagamento1` tinyint(1) NOT NULL,
  `pagamento2` tinyint(1) NOT NULL,
  `prazo` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `valor` double NOT NULL,
  PRIMARY KEY (`id_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Projeto`
--

LOCK TABLES `Projeto` WRITE;
/*!40000 ALTER TABLE `Projeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tag`
--

DROP TABLE IF EXISTS `Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tag`
--

LOCK TABLES `Tag` WRITE;
/*!40000 ALTER TABLE `Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telefone`
--

DROP TABLE IF EXISTS `Telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telefone` (
  `id_telefone` bigint(20) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id_telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telefone`
--

LOCK TABLES `Telefone` WRITE;
/*!40000 ALTER TABLE `Telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario`
--

DROP TABLE IF EXISTS `Usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario` (
  `id_usuario` bigint(20) NOT NULL AUTO_INCREMENT,
  `avaliacao` double NOT NULL,
  `cpf` int(11) NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `login` varchar(255) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `perfil` int(11) NOT NULL,
  `senha` varchar(255) DEFAULT NULL,
  `sobre` varchar(255) DEFAULT NULL,
  `ic_usuario` int(11) NOT NULL,
  `tipo_usuario` char(1) NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario`
--

LOCK TABLES `Usuario` WRITE;
/*!40000 ALTER TABLE `Usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Avaliacao`
--

DROP TABLE IF EXISTS `Usuario_Avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_Avaliacao` (
  `Usuario_id_usuario` bigint(20) NOT NULL,
  `avaliacoes_id_avaliacao` bigint(20) NOT NULL,
  UNIQUE KEY `UK_sxedd8o41wmoqi1w1g2gc28ws` (`avaliacoes_id_avaliacao`),
  KEY `FK_sxedd8o41wmoqi1w1g2gc28ws` (`avaliacoes_id_avaliacao`),
  KEY `FK_ni5iymkiho1takdg0c3sg2f7p` (`Usuario_id_usuario`),
  CONSTRAINT `FK_ni5iymkiho1takdg0c3sg2f7p` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FK_sxedd8o41wmoqi1w1g2gc28ws` FOREIGN KEY (`avaliacoes_id_avaliacao`) REFERENCES `Avaliacao` (`id_avaliacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Avaliacao`
--

LOCK TABLES `Usuario_Avaliacao` WRITE;
/*!40000 ALTER TABLE `Usuario_Avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Email`
--

DROP TABLE IF EXISTS `Usuario_Email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_Email` (
  `Usuario_id_usuario` bigint(20) NOT NULL,
  `emails_id_email` bigint(20) NOT NULL,
  UNIQUE KEY `UK_j1fdm8s5fdd6wxkevxew2yuhv` (`emails_id_email`),
  KEY `FK_j1fdm8s5fdd6wxkevxew2yuhv` (`emails_id_email`),
  KEY `FK_47hr0o9ab6j1xq8ds39ogdr8v` (`Usuario_id_usuario`),
  CONSTRAINT `FK_47hr0o9ab6j1xq8ds39ogdr8v` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FK_j1fdm8s5fdd6wxkevxew2yuhv` FOREIGN KEY (`emails_id_email`) REFERENCES `Email` (`id_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Email`
--

LOCK TABLES `Usuario_Email` WRITE;
/*!40000 ALTER TABLE `Usuario_Email` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Notificacao`
--

DROP TABLE IF EXISTS `Usuario_Notificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_Notificacao` (
  `Usuario_id_usuario` bigint(20) NOT NULL,
  `notificacoes_id_notificacao` int(11) NOT NULL,
  UNIQUE KEY `UK_no0bl7hn2ahurnryxbj2rous1` (`notificacoes_id_notificacao`),
  KEY `FK_no0bl7hn2ahurnryxbj2rous1` (`notificacoes_id_notificacao`),
  KEY `FK_139fdkrrynl8m2hlew68ajdlj` (`Usuario_id_usuario`),
  CONSTRAINT `FK_139fdkrrynl8m2hlew68ajdlj` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FK_no0bl7hn2ahurnryxbj2rous1` FOREIGN KEY (`notificacoes_id_notificacao`) REFERENCES `Notificacao` (`id_notificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Notificacao`
--

LOCK TABLES `Usuario_Notificacao` WRITE;
/*!40000 ALTER TABLE `Usuario_Notificacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Notificacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Projeto`
--

DROP TABLE IF EXISTS `Usuario_Projeto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_Projeto` (
  `Usuario_id_usuario` bigint(20) NOT NULL,
  `projetosPublicados_id_projeto` int(11) NOT NULL,
  `projetosAtuados_id_projeto` int(11) NOT NULL,
  UNIQUE KEY `UK_srww57po6ptsqux0aad8spbbi` (`projetosPublicados_id_projeto`),
  UNIQUE KEY `UK_i2vg3cf2b3i16smrf80w3wdd` (`projetosAtuados_id_projeto`),
  KEY `FK_srww57po6ptsqux0aad8spbbi` (`projetosPublicados_id_projeto`),
  KEY `FK_gp3wgoh3y1jqth77m9l3rqw0f` (`Usuario_id_usuario`),
  KEY `FK_i2vg3cf2b3i16smrf80w3wdd` (`projetosAtuados_id_projeto`),
  CONSTRAINT `FK_gp3wgoh3y1jqth77m9l3rqw0f` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FK_i2vg3cf2b3i16smrf80w3wdd` FOREIGN KEY (`projetosAtuados_id_projeto`) REFERENCES `Projeto` (`id_projeto`),
  CONSTRAINT `FK_srww57po6ptsqux0aad8spbbi` FOREIGN KEY (`projetosPublicados_id_projeto`) REFERENCES `Projeto` (`id_projeto`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Projeto`
--

LOCK TABLES `Usuario_Projeto` WRITE;
/*!40000 ALTER TABLE `Usuario_Projeto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Tag`
--

DROP TABLE IF EXISTS `Usuario_Tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_Tag` (
  `Usuario_id_usuario` bigint(20) NOT NULL,
  `tags_id_tag` int(11) NOT NULL,
  UNIQUE KEY `UK_oe6xxqc0ovscbkmjibfdt4aw1` (`tags_id_tag`),
  KEY `FK_oe6xxqc0ovscbkmjibfdt4aw1` (`tags_id_tag`),
  KEY `FK_g17rccb2lwm03e8k5ei3153dy` (`Usuario_id_usuario`),
  CONSTRAINT `FK_g17rccb2lwm03e8k5ei3153dy` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FK_oe6xxqc0ovscbkmjibfdt4aw1` FOREIGN KEY (`tags_id_tag`) REFERENCES `Tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Tag`
--

LOCK TABLES `Usuario_Tag` WRITE;
/*!40000 ALTER TABLE `Usuario_Tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Usuario_Telefone`
--

DROP TABLE IF EXISTS `Usuario_Telefone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Usuario_Telefone` (
  `Usuario_id_usuario` bigint(20) NOT NULL,
  `telefones_id_telefone` bigint(20) NOT NULL,
  UNIQUE KEY `UK_pv3w5gh2i6iveslhvujgcr0kp` (`telefones_id_telefone`),
  KEY `FK_pv3w5gh2i6iveslhvujgcr0kp` (`telefones_id_telefone`),
  KEY `FK_c99scay2lcgfncjhlt8freym5` (`Usuario_id_usuario`),
  CONSTRAINT `FK_c99scay2lcgfncjhlt8freym5` FOREIGN KEY (`Usuario_id_usuario`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FK_pv3w5gh2i6iveslhvujgcr0kp` FOREIGN KEY (`telefones_id_telefone`) REFERENCES `Telefone` (`id_telefone`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Usuario_Telefone`
--

LOCK TABLES `Usuario_Telefone` WRITE;
/*!40000 ALTER TABLE `Usuario_Telefone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Usuario_Telefone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projeto_has_tags`
--

DROP TABLE IF EXISTS `projeto_has_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projeto_has_tags` (
  `id_projeto` int(11) NOT NULL,
  `id_tags` int(11) NOT NULL,
  KEY `FK_6f1u9sdmx93nfbi6athg9dh18` (`id_tags`),
  KEY `FK_r5puoaodqu5st3meepndpn4ej` (`id_projeto`),
  CONSTRAINT `FK_6f1u9sdmx93nfbi6athg9dh18` FOREIGN KEY (`id_tags`) REFERENCES `Projeto` (`id_projeto`),
  CONSTRAINT `FK_r5puoaodqu5st3meepndpn4ej` FOREIGN KEY (`id_projeto`) REFERENCES `Tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto_has_tags`
--

LOCK TABLES `projeto_has_tags` WRITE;
/*!40000 ALTER TABLE `projeto_has_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `projeto_has_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_has_tags`
--

DROP TABLE IF EXISTS `usuario_has_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_has_tags` (
  `id_usuario` int(11) NOT NULL,
  `id_tags` bigint(20) NOT NULL,
  KEY `FK_6krbjgr39bcxql54loax2lob6` (`id_tags`),
  KEY `FK_svquuehfii2lktpfadwnoy9yf` (`id_usuario`),
  CONSTRAINT `FK_6krbjgr39bcxql54loax2lob6` FOREIGN KEY (`id_tags`) REFERENCES `Usuario` (`id_usuario`),
  CONSTRAINT `FK_svquuehfii2lktpfadwnoy9yf` FOREIGN KEY (`id_usuario`) REFERENCES `Tag` (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_has_tags`
--

LOCK TABLES `usuario_has_tags` WRITE;
/*!40000 ALTER TABLE `usuario_has_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_has_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-17  0:57:52
