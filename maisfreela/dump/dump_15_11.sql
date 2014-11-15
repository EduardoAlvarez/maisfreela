
LOCK TABLES `avaliacao` WRITE;
/*!40000 ALTER TABLE `avaliacao` DISABLE KEYS */;
INSERT INTO `avaliacao` VALUES (1,'Muito legal',4.2,1,1),(2,'Super bacana',1.8,2,2),(3,'Muito ruim',0.7,3,3);
/*!40000 ALTER TABLE `avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `desenvolvedor` WRITE;
/*!40000 ALTER TABLE `desenvolvedor` DISABLE KEYS */;
INSERT INTO `desenvolvedor` VALUES (1,4.3,2),(2,3.7,3),(3,3,4);
/*!40000 ALTER TABLE `desenvolvedor` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `desenvolvedor_has_tags` WRITE;
/*!40000 ALTER TABLE `desenvolvedor_has_tags` DISABLE KEYS */;
INSERT INTO `desenvolvedor_has_tags` VALUES (1,1),(2,1),(3,2),(4,2),(5,3),(1,3);
/*!40000 ALTER TABLE `desenvolvedor_has_tags` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `empresario` WRITE;
/*!40000 ALTER TABLE `empresario` DISABLE KEYS */;
INSERT INTO `empresario` VALUES (1,3.2,1),(2,4,2),(3,0,4);
/*!40000 ALTER TABLE `empresario` ENABLE KEYS */;
UNLOCK TABLES;

LOCK TABLES `lance` WRITE;
/*!40000 ALTER TABLE `lance` DISABLE KEYS */;
INSERT INTO `lance` VALUES (1,'faÃ§o mais caro e melhor',400,2,1),(2,'coloco imagens mais legais',380,3,2),(3,'manjo td de rede social',700,1,3);
/*!40000 ALTER TABLE `lance` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `notificacao` WRITE;
/*!40000 ALTER TABLE `notificacao` DISABLE KEYS */;
INSERT INTO `notificacao` VALUES (1,'2014-11-08 00:00:00','Seu projeto recebeu um lance','novo lance',1),(2,'2014-11-09 00:00:00','Novo projeto  cadastrado','novo projeto',2);
/*!40000 ALTER TABLE `notificacao` ENABLE KEYS */;
UNLOCK TABLES;




LOCK TABLES `projeto` WRITE;
/*!40000 ALTER TABLE `projeto` DISABLE KEYS */;
INSERT INTO `projeto` VALUES (1,'2014-11-08 00:00:00','Pagina web em php',1,0,10,'andamento','pagina web',350,2,1),(2,NULL,'Sistema de estoque em JAVA',0,0,18,NULL,'Sistema estoque',50,NULL,3),(3,NULL,'Rede Social igual Facebook sÃ³ que melhor',0,0,27,NULL,'Rede Social',600,NULL,2);
/*!40000 ALTER TABLE `projeto` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `projeto_has_tags` WRITE;
/*!40000 ALTER TABLE `projeto_has_tags` DISABLE KEYS */;
INSERT INTO `projeto_has_tags` VALUES (1,1),(3,1),(4,1),(2,2),(4,2),(1,3),(2,3),(3,3),(4,3),(5,3);
/*!40000 ALTER TABLE `projeto_has_tags` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'PHP'),(2,'JAVA'),(3,'JSON'),(4,'MYSQL'),(5,'C#');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;


LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'123456789','henriquebarjas@gmail.com','senac','henrique','henrique barjas','12345','Estudante',123456789,NULL,1),(2,'987654321','eduardo.alvarez1@hotmail.com','Campo Grande','eduardo','eduardo alvarez','54321','Programador',987654321,1,2),(3,'91827471284','andersoncardoso@hotmail.com','Interlagos','anderson','Anderson cardoso','242424','Homem da vida',2147483647,2,NULL),(4,'192874871293','andreferreira@hotmail.com','Embu','andre','andre ferreira','696969','Outro homem da vida',2147483647,3,3);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
