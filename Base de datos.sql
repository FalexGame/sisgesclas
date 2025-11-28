-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_asistencia_clases
-- ------------------------------------------------------
-- Server version	9.4.0

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
-- Table structure for table `curso_estudiante`
--

DROP TABLE IF EXISTS `curso_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curso_estudiante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `codigo_estudiante` varchar(20) NOT NULL,
  `id_curso` int NOT NULL,
  `fecha_matricula` date DEFAULT (curdate()),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_curso_estudiante` (`codigo_estudiante`,`id_curso`),
  KEY `fk_curso_estudiante` (`id_curso`),
  CONSTRAINT `fk_curso_estudiante` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE,
  CONSTRAINT `fk_estudiante_curso` FOREIGN KEY (`codigo_estudiante`) REFERENCES `tb_estudiante` (`codigo`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_estudiante`
--

LOCK TABLES `curso_estudiante` WRITE;
/*!40000 ALTER TABLE `curso_estudiante` DISABLE KEYS */;
INSERT INTO `curso_estudiante` VALUES (1,'E001',1,'2025-11-27'),(2,'E002',1,'2025-11-27'),(3,'E003',2,'2025-11-27');
/*!40000 ALTER TABLE `curso_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cursos`
--

DROP TABLE IF EXISTS `cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cursos` (
  `id_curso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `grado` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `id_docente` int NOT NULL,
  PRIMARY KEY (`id_curso`),
  KEY `fk_cursos_docente` (`id_docente`),
  CONSTRAINT `fk_cursos_docente` FOREIGN KEY (`id_docente`) REFERENCES `tb_docente` (`id_docente`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cursos`
--

LOCK TABLES `cursos` WRITE;
/*!40000 ALTER TABLE `cursos` DISABLE KEYS */;
INSERT INTO `cursos` VALUES (1,'Matemáticas 6° A','6A',NULL,1),(2,'Ciencias 7° B','7B',NULL,2);
/*!40000 ALTER TABLE `cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_curso`
--

DROP TABLE IF EXISTS `docente_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente_curso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_docente` int NOT NULL,
  `id_curso` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_docente` (`id_docente`,`id_curso`),
  KEY `id_curso` (`id_curso`),
  CONSTRAINT `docente_curso_ibfk_1` FOREIGN KEY (`id_docente`) REFERENCES `tb_docente` (`id_docente`) ON DELETE CASCADE,
  CONSTRAINT `docente_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_curso`
--

LOCK TABLES `docente_curso` WRITE;
/*!40000 ALTER TABLE `docente_curso` DISABLE KEYS */;
INSERT INTO `docente_curso` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `docente_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'docente'),(3,'estudiante'),(1,'superadmin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_docente`
--

DROP TABLE IF EXISTS `tb_docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_docente` (
  `id_docente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `documento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_docente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_docente`
--

LOCK TABLES `tb_docente` WRITE;
/*!40000 ALTER TABLE `tb_docente` DISABLE KEYS */;
INSERT INTO `tb_docente` VALUES (1,'Carlos','Garcígfh','123456'),(2,'María','Rui','789012');
/*!40000 ALTER TABLE `tb_docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estudiante`
--

DROP TABLE IF EXISTS `tb_estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estudiante` (
  `codigo` varchar(20) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `documento` varchar(100) NOT NULL,
  `grado` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estudiante`
--

LOCK TABLES `tb_estudiante` WRITE;
/*!40000 ALTER TABLE `tb_estudiante` DISABLE KEYS */;
INSERT INTO `tb_estudiante` VALUES ('23','sdf','wer','23523','9°'),('6','maria','almeida moreno','453','8°'),('E001','Juan','Lópe','222234','9°'),('E002','Ana','Martínez','333333','5'),('E003','Luis','Ramírez','444444','6');
/*!40000 ALTER TABLE `tb_estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_registro_asistencia`
--

DROP TABLE IF EXISTS `tb_registro_asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_registro_asistencia` (
  `id_registro` bigint NOT NULL AUTO_INCREMENT,
  `codigo_estudiante` varchar(20) NOT NULL,
  `id_docente` int NOT NULL,
  `id_curso` int DEFAULT NULL,
  `fecha_clase` date NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `materia_tema` varchar(100) DEFAULT NULL,
  `foto_excusa` varchar(255) DEFAULT NULL,
  `codigo_docente` varchar(20) DEFAULT NULL,
  `grado` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  UNIQUE KEY `uk_asistencia` (`codigo_estudiante`,`id_docente`,`fecha_clase`),
  KEY `id_docente` (`id_docente`),
  KEY `fk_asistencia_curso` (`id_curso`),
  CONSTRAINT `fk_asistencia_curso` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id_curso`) ON DELETE SET NULL,
  CONSTRAINT `tb_registro_asistencia_ibfk_1` FOREIGN KEY (`codigo_estudiante`) REFERENCES `tb_estudiante` (`codigo`) ON DELETE RESTRICT,
  CONSTRAINT `tb_registro_asistencia_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `tb_docente` (`id_docente`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_registro_asistencia`
--

LOCK TABLES `tb_registro_asistencia` WRITE;
/*!40000 ALTER TABLE `tb_registro_asistencia` DISABLE KEYS */;
INSERT INTO `tb_registro_asistencia` VALUES (13,'6',1,NULL,'2025-11-27','Ausente','Matematicas',NULL,NULL,NULL),(15,'E001',1,NULL,'2025-11-27','Presente','Matematicas',NULL,NULL,'9°'),(16,'E001',1,NULL,'2025-11-28','Presente','Suma y resta',NULL,NULL,'9°');
/*!40000 ALTER TABLE `tb_registro_asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `id_rol` int NOT NULL,
  `referencia_docente` int DEFAULT NULL,
  `referencia_estudiante` varchar(20) DEFAULT NULL,
  `nombre_display` varchar(150) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `username` (`username`),
  KEY `id_rol` (`id_rol`),
  KEY `referencia_docente` (`referencia_docente`),
  KEY `referencia_estudiante` (`referencia_estudiante`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`referencia_docente`) REFERENCES `tb_docente` (`id_docente`) ON DELETE SET NULL,
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`referencia_estudiante`) REFERENCES `tb_estudiante` (`codigo`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'superadmin','$2y$10$YuCPLTz2snQfYHTpNA0zkeOKE2ugJB0x82k.lScvRfqaVTqekZGhO',1,NULL,NULL,'Rector General',1),(2,'docente1','$2y$10$YuCPLTz2snQfYHTpNA0zkeOKE2ugJB0x82k.lScvRfqaVTqekZGhO',2,1,NULL,'Carlos García',1),(3,'docente2','$2y$10$YuCPLTz2snQfYHTpNA0zkeOKE2ugJB0x82k.lScvRfqaVTqekZGhO',2,2,NULL,'María Ruiz',1),(10,'juan','$2y$10$YuCPLTz2snQfYHTpNA0zkeOKE2ugJB0x82k.lScvRfqaVTqekZGhO',3,NULL,'E001','Juan López',1),(11,'ana','$2y$10$YuCPLTz2snQfYHTpNA0zkeOKE2ugJB0x82k.lScvRfqaVTqekZGhO',3,NULL,'E002','Ana Martínez',1),(12,'luis','$2y$10$YuCPLTz2snQfYHTpNA0zkeOKE2ugJB0x82k.lScvRfqaVTqekZGhO',3,NULL,'E003','Luis Ramírez',1),(13,'admin','$2a$10$urFxOwjDhf1St8uxw4u.qOpswkiasiL1j5om0B.bnbVP/secxeCb6',1,NULL,NULL,'Super Admin',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_asistencia_clases'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-27 23:37:26
