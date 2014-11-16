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
  KEY `FK_ehnb17q0nmdckq2vom2wf7rlp` (`id_usuario_remetente`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacao`
--

LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,'Muito rápido e comunicativo',4.5,2,NULL,4),(2,'Boas respostas e conhencimento pleno do que podia ser feito',4.8,NULL,2,3);
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
  KEY `FK_mhj4c9brjspoevl2ffw8gb78a` (`id_desenvolvedor`),
  KEY `FK_9velo98cc1pnoc1mtprs74blt` (`id_empresario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_bancaria`
--

LOCK TABLES `conta_bancaria` WRITE;
/*!40000 ALTER TABLE `conta_bancaria` DISABLE KEYS */;
INSERT INTO `conta_bancaria` VALUES (1,1231,1312,1214412,1,NULL),(2,5642,2123,573242,2,NULL),(3,1562,6583,2634532,3,NULL),(4,4351,2143,12533122,NULL,1),(5,8953,8423,1283321,NULL,2),(6,9999,9129,8761821,NULL,3);
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
  `id_contaBancaria` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_desenvolvedor`),
  KEY `FK_rtmt229j23m4a2513q5prodk2` (`id_contaBancaria`),
  KEY `FK_mksk8tgejemhnqeh0ux4yemap` (`id_usuario`),
  CONSTRAINT `FK_mksk8tgejemhnqeh0ux4yemap` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `desenvolvedor`
--

LOCK TABLES `desenvolvedor` WRITE;
/*!40000 ALTER TABLE `desenvolvedor` DISABLE KEYS */;
INSERT INTO `desenvolvedor` VALUES (1,4.7,1,2),(2,3.2,2,3),(3,1.7,3,4);
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
INSERT INTO `desenvolvedor_has_tags` VALUES (1,1),(10,1),(12,1),(11,1),(13,1),(14,1),(15,1),(4,1),(5,1),(6,1),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(3,3),(10,3),(11,3),(12,3),(5,3),(3,3),(7,3);
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
  `id_contaBancaria` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id_empresario`),
  KEY `FK_n8ctwh7pheqpfnboayf4o963b` (`id_contaBancaria`),
  KEY `FK_5vc6sr93uib2k73cpj2klkl91` (`id_usuario`),
  CONSTRAINT `FK_5vc6sr93uib2k73cpj2klkl91` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_n8ctwh7pheqpfnboayf4o963b` FOREIGN KEY (`id_contaBancaria`) REFERENCES `conta_bancaria` (`id_conta`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresario`
--

LOCK TABLES `empresario` WRITE;
/*!40000 ALTER TABLE `empresario` DISABLE KEYS */;
INSERT INTO `empresario` VALUES (1,4.3,4,1),(2,3.8,5,4),(3,2.3,6,3);
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
  `escolhido` tinyint(1) NOT NULL,
  `valor` float NOT NULL,
  `id_desenvolvedor` bigint(20) DEFAULT NULL,
  `id_projeto` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_lance`),
  KEY `FK_jljsfe8q4nufma0gopjwntaiq` (`id_desenvolvedor`),
  KEY `FK_fsg6aoleeqc13eis9i17qef7i` (`id_projeto`),
  CONSTRAINT `FK_fsg6aoleeqc13eis9i17qef7i` FOREIGN KEY (`id_projeto`) REFERENCES `projeto` (`id_projeto`),
  CONSTRAINT `FK_jljsfe8q4nufma0gopjwntaiq` FOREIGN KEY (`id_desenvolvedor`) REFERENCES `desenvolvedor` (`id_desenvolvedor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lance`
--

LOCK TABLES `lance` WRITE;
/*!40000 ALTER TABLE `lance` DISABLE KEYS */;
INSERT INTO `lance` VALUES (1,'Crio as páginas com efeitos visuais mais robustos que atualmente',0,320,2,3),(2,'Faço o sistema em um formato mais dinâmico',1,240,1,3),(3,'Tenho um web service quase pronto',0,380,1,4),(4,'Faço tudo conforme pedido',1,560,2,4),(5,'Faço em PHP',0,200,3,5),(6,'Faço tudo em HTML5',0,310,1,5),(7,'Manjo tudo de Oracle',0,900,2,6),(8,'Consigo fazer o serviço se remodelar o banco por completo',0,1030,3,6),(9,'JSON é comigo mesmo',0,465,1,7),(10,'Posso fazer com um valor maior este projeto?',0,390,2,7),(11,'Tenho tudo no esquema já, bora fazer pra ontem? Até abaixo o preço...',0,190,3,7),(12,'Faço toda a migração com os testes',1,2000,3,8),(14,'Crio em PHP',1,1000,1,9),(15,'Faço o sistema em JAVA',0,1500,3,9),(16,'Faço por 780 reais',0,780,2,10),(17,'Faço por 650 reais',0,650,1,10),(18,'Faço por 600 mangos pra fechar',1,600,2,10),(19,'Faço por 700 pra ficar mais de boas pra mim',0,700,3,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificacao`
--

LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (1,'2014-08-12 00:00:00','Seja Bem-Vindo ao MaisFreela,aqui voçe pode encontrar e colocar projetos sobre TI.','Seja Bem-Vindo ao MaisFreela',1),(2,'2014-08-12 00:00:00','Seja Bem-Vindo ao MaisFreela,aqui voçe pode encontrar e colocar projetos sobre TI.','Seja Bem-Vindo ao MaisFreela',2),(3,'2014-08-12 00:00:00','Seja Bem-Vindo ao MaisFreela,aqui voçe pode encontrar e colocar projetos sobre TI.','Seja Bem-Vindo ao MaisFreela',3),(4,'2014-08-12 00:00:00','Seja Bem-Vindo ao MaisFreela,aqui voçe pode encontrar e colocar projetos sobre TI.','Seja Bem-Vindo ao MaisFreela',4);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projeto`
--

LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,NULL,'Página de site de buscas relacionada a dados de webservice do governo',NULL,NULL,15,'novo','Página de buscas',456,NULL,1),(2,NULL,'Sistema de logística para entrega de bolos',NULL,NULL,30,'novo','Sistema de logística',1300,NULL,2),(3,'2014-11-15 00:00:00','Blog em wordpress precisa de novos ajustes no menu principal e em algumas áreas de conteúdo',1,NULL,12,'iniciado','Alterações em blog',240,1,1),(4,NULL,'Webservice do sistema dos correios precisa de adpatação ',1,NULL,10,'aguardando inicio','Web Service',560,2,2),(5,NULL,'Página web de sistema de vendas precisa de nova interface',NULL,NULL,6,'pendente','Interface de loja virtual',180,NULL,3),(6,NULL,'Migração de banco de dados de Oracle para SQL SERVER',NULL,NULL,15,'pendente','Alteração de  banco de dados',890,NULL,1),(7,NULL,'Inclusão de JSON nas páginas do sistema de catálogo',NULL,NULL,8,'bloqueado','Inclusão de JSON',374,NULL,1),(8,'2014-11-03 00:00:00','Migração de linguagem web para .NET, sistema esta pronto mas foi desenvolvido em PHP',1,NULL,40,'cancelado','Migração de linguagem',1800,3,3),(9,'2014-11-09 00:00:00','Criação de loja virtual para emrpesa do ramo alimentício',1,1,18,'aguardando encerramento','Loja Virtual',1000,1,2),(10,'2014-10-01 00:00:00','Preciso de um blog para divulgar meu trabalho de artista plástico, precisa ser rápido , moderno e ter muitas conteúdos configuráveis',1,1,13,'finalizado','Blog de Artista',600,2,2);
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
INSERT INTO `projeto_has_tags` VALUES (1,1),(4,1),(2,2),(4,2),(10,2),(1,3),(4,3),(7,4),(15,4),(15,5),(2,6),(6,6),(5,6),(13,7),(9,7),(1,8),(16,8),(14,8),(7,9),(10,9),(11,9),(12,9),(1,10),(4,10),(11,10),(12,10),(16,5);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'PHP'),(2,'JAVA'),(3,'C#'),(4,'MYSQL'),(5,'SQL SERVER'),(6,'ORACLE'),(7,'PYTHON'),(8,'DELPHI'),(9,'PEARL'),(10,'JAVASCRIPT'),(11,'HTML5'),(12,'CSS'),(13,'JSON'),(14,'JQUERY'),(15,'AJAX'),(16,'.NET');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'123455121','henriquebarjas@gmail.com','SENAC','henrique','henrique','1234','comerciario',123456789,NULL,1),(2,'9876543221','eduardoalvarez1993@gmail.com','Campo Grande','eduardo','eduardo','1234','desenvolvedor PHP',818772831,1,NULL),(3,'81626731181','andersoncardoso@gmail.com','Interlagos','anderson','anderson','1234','Desenvolvedor java',2147483647,2,3),(4,'1122884172','andrematos@gmail.com','Embu','andre','andre','1234','desenvolvedor python',344321213,3,2);
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

-- Dump completed on 2014-11-16 19:05:16
