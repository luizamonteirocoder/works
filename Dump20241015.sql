-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projetos_empresa
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Dumping data for table `cadastro_projetos`
--

LOCK TABLES `cadastro_projetos` WRITE;
/*!40000 ALTER TABLE `cadastro_projetos` DISABLE KEYS */;
INSERT INTO `cadastro_projetos` VALUES (1,'Projeto de análise preditiva com IA'),(2,'Implementação de plataforma de BI'),(3,'Desenvolvimento de portal de compras corporativo'),(4,'Implementação de CRM');
/*!40000 ALTER TABLE `cadastro_projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gerentes`
--

LOCK TABLES `gerentes` WRITE;
/*!40000 ALTER TABLE `gerentes` DISABLE KEYS */;
INSERT INTO `gerentes` VALUES (1,'Cara Jensen','carajensen4724@outlook.com','(51) 91826-5743','Porto Alegre','RS'),(2,'Imani Waters','imaniwaters@hotmail.com','(51) 98636-1671','Porto Alegre','RS'),(3,'Macon Grant','macongrant6948@gmail.com','(11) 95766-7952','Sao Paulo','SP'),(4,'Ciaran Gutierrez','ciarangutierrez@gmail.com','(21) 91727-9185','Rio de Janeiro','RJ'),(5,'Jasper Greene','jaspergreene6163@outlook.com','(11) 98841-8454','Sao Paulo','SP'),(6,'Alfonso Murphy','alfonsomurphy@gmail.com','(31) 94759-6125','Belo Horizonte','MG'),(7,'Urielle Fuller','uriellefuller1217@outlook.com','(27) 97806-0250','Vitoria','ES'),(8,'Veronica Sanchez','veronicasanchez@hotmail.com','(81) 99546-5229','Recife','PE'),(9,'Macon Ryan','maconryan2157@outlook.com','(67) 96452-9542','Campo Grande','MS'),(10,'Stone Lott','stonelott4829@hotmail.com','(92) 98749-2483','Manaus','AM');
/*!40000 ALTER TABLE `gerentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_atualizacoes_status_projetos`
--

LOCK TABLES `log_atualizacoes_status_projetos` WRITE;
/*!40000 ALTER TABLE `log_atualizacoes_status_projetos` DISABLE KEYS */;
INSERT INTO `log_atualizacoes_status_projetos` VALUES (1,3,'Projeto ID: 3 teve sua data de conclusão atualizada.','root@localhost','2024-09-19','19:06:13');
/*!40000 ALTER TABLE `log_atualizacoes_status_projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `membros_projeto`
--

LOCK TABLES `membros_projeto` WRITE;
/*!40000 ALTER TABLE `membros_projeto` DISABLE KEYS */;
INSERT INTO `membros_projeto` VALUES (1,1,'Griffith Sellers','Cientista de Dados','Porto Alegre','RS','griffith.sellers@montecorp.com.br'),(2,2,'Mara Johnson','Engenheiro de Machine Learning','Porto Alegre','RS','mara.johnson@montecorp.com.br'),(3,3,'Kenyon Greene','Analista de BI (Business Intelligence)','Sao Paulo','SP','kenyon.greene@montecorp.com.br'),(4,4,'Ruby Welch','Gerente de Compras','Rio de Janeiro','RJ','ruby.welch@montecorp.com.br'),(5,5,'Theodore Hayden','Analista de Sistemas','Sao Paulo','SP','theodore.hayden@montecorp.com.br'),(6,6,'Jaime Hill','Analista de BI (Business Intelligence)','Belo Horizonte','MG','jaime.hill@montecorp.com.br'),(7,7,'Kenyon Foster','Gerente de Compras','Vitoria','ES','kenyon.foster@montecorp.com.br'),(8,8,'Ezekiel Pratt','Analista de Sistemas','Recife','PE','ezekiel.pratt@montecorp.com.br'),(9,9,'Beverly Henry','Analista de BI (Business Intelligence)','Campo Grande','MS','beverly.henry@montecorp.com.br'),(10,10,'Zenia Pugh','Analista de BI (Business Intelligence)','Manaus','AM','zenia.pugh@montecorp.com.br');
/*!40000 ALTER TABLE `membros_projeto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orcamentos`
--

LOCK TABLES `orcamentos` WRITE;
/*!40000 ALTER TABLE `orcamentos` DISABLE KEYS */;
INSERT INTO `orcamentos` VALUES (1,1,7033.86),(2,2,7743.63),(3,3,6797.48),(4,4,9995.72),(5,5,6194.70),(6,6,8759.84),(7,7,8261.23),(8,8,7052.48),(9,9,8594.51),(10,10,8135.70);
/*!40000 ALTER TABLE `orcamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `projetos`
--

LOCK TABLES `projetos` WRITE;
/*!40000 ALTER TABLE `projetos` DISABLE KEYS */;
INSERT INTO `projetos` VALUES (1,1,1,'2024-08-10 00:00:00','2024-10-30 00:00:00'),(2,2,1,'2024-08-15 00:00:00','2024-10-31 00:00:00'),(3,3,2,'2024-08-07 00:00:00','2024-09-19 19:06:13'),(4,4,3,'2024-08-09 00:00:00','2024-10-30 00:00:00'),(5,5,2,'2024-08-02 00:00:00','2024-10-29 00:00:00'),(6,6,2,'2024-08-02 00:00:00','2024-08-02 00:00:00'),(7,7,3,'2024-08-04 00:00:00','2024-10-29 00:00:00'),(8,8,3,'2024-08-13 00:00:00','2024-08-13 00:00:00'),(9,9,2,'2024-08-02 00:00:00','2024-08-02 00:00:00'),(10,10,2,'2024-08-04 00:00:00','2024-08-04 00:00:00');
/*!40000 ALTER TABLE `projetos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tarefas`
--

LOCK TABLES `tarefas` WRITE;
/*!40000 ALTER TABLE `tarefas` DISABLE KEYS */;
INSERT INTO `tarefas` VALUES (1,1,1,'Desenvolver e implementar algoritmos de inteligencia artificial para otimizacao de processos e automacao.','Finalizado'),(2,2,2,'Desenvolver e implementar algoritmos de inteligencia artificial para otimizacao de processos e automacao.','Finalizado'),(3,3,3,'Coleta, organiza e analisa dados de diversas fontes para gerar insights estratégicos que ajudem na tomada de decisão. Cria relatórios e dashboards para monitoramento de KPIs.','Finalizado'),(4,4,4,'Supervisiona o processo de compras de bens e serviços, negocia com fornecedores, controla o orçamento e garante que as aquisições sejam feitas dentro dos padrões de qualidade e prazo.','Em Andamento'),(5,5,5,'Coleta, organiza e analisa dados de diversas fontes para gerar insights estratégicos que ajudem na tomada de decisão. Cria relatórios e dashboards para monitoramento de KPIs.','Finalizado'),(6,6,6,'Desenvolve, testa e mantem software. Trabalha com diferentes linguagens de programacao e frameworks, focando na criacao de solucoes robustas e escalaveis.','Nao iniciado'),(7,7,7,'Supervisiona o processo de compras de bens e servicos, negocia com fornecedores, controla o orcamento e garante que as aquisicoes sejam feitas dentro dos padroes de qualidade e prazo.','Finalizado'),(8,8,8,'Supervisiona o processo de compras de bens e servicos, negocia com fornecedores, controla o orcamento e garante que as aquisicoes sejam feitas dentro dos padroes de qualidade e prazo.','Cancelado'),(9,9,9,'Coleta, organiza e analisa dados de diversas fontes para gerar insights estrategicos que ajudem na tomada de decisao. Cria relatorios e dashboards para monitoramento de KPIs.','Nao iniciado'),(10,10,10,'Desenvolve, testa e mantém software. Trabalha com diferentes linguagens de programação e frameworks, focando na criação de soluções robustas e escaláveis.','Cancelado');
/*!40000 ALTER TABLE `tarefas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-15 16:59:02
