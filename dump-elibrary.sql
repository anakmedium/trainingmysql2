-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: elibrary
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `anggota`
--

DROP TABLE IF EXISTS `anggota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anggota` (
  `id_anggota` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `no_hp` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_anggota`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anggota`
--

LOCK TABLES `anggota` WRITE;
/*!40000 ALTER TABLE `anggota` DISABLE KEYS */;
INSERT INTO `anggota` VALUES (1,'Eri Juandi','1990-07-12','Bandung','joean.ardian@gmail.com','08132022221'),(2,'Joni Aridan',NULL,'Cimahi','joni@gmail.com','08900001');
/*!40000 ALTER TABLE `anggota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buku`
--

DROP TABLE IF EXISTS `buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buku` (
  `id_buku` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(100) DEFAULT NULL,
  `pengarang` varchar(100) DEFAULT NULL,
  `stok` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buku`
--

LOCK TABLES `buku` WRITE;
/*!40000 ALTER TABLE `buku` DISABLE KEYS */;
INSERT INTO `buku` VALUES (1,'Bandung lautan api','joeanardian','10'),(2,'Bangun pemuda pemudi','ery','10'),(3,'Bergerak bersama si kribo','tuti','10'),(4,'Bohong tidak boleh','tati','10'),(5,'Sssst Jangan berisik','wahyu','9');
/*!40000 ALTER TABLE `buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_buku`
--

DROP TABLE IF EXISTS `log_buku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_buku` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `id_buku` int DEFAULT NULL,
  `tgl_log` timestamp NULL DEFAULT NULL,
  `perubahan_stok` int DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_buku_FK` (`id_buku`),
  CONSTRAINT `log_buku_FK` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_buku`
--

LOCK TABLES `log_buku` WRITE;
/*!40000 ALTER TABLE `log_buku` DISABLE KEYS */;
INSERT INTO `log_buku` VALUES (1,3,'2023-11-02 17:00:00',9,'stok berkurang'),(2,5,'2023-11-02 17:00:00',9,'stok berkurang'),(3,5,'2023-11-02 17:00:00',9,'stok berkurang'),(4,5,'2023-11-02 17:00:00',8,'stok berkurang'),(5,5,'2023-11-02 17:00:00',9,'stok berkurang');
/*!40000 ALTER TABLE `log_buku` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peminjaman`
--

DROP TABLE IF EXISTS `peminjaman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peminjaman` (
  `id_pinjaman` int NOT NULL AUTO_INCREMENT,
  `id_anggota` int DEFAULT NULL,
  `id_buku` int DEFAULT NULL,
  `tgl_pinjam` date DEFAULT NULL,
  `tgl_jatuh_tempo` date DEFAULT NULL,
  `tgl_kembali` date DEFAULT NULL,
  `keterangan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pinjaman`),
  KEY `peminjaman_FK` (`id_anggota`),
  KEY `peminjaman_FK_1` (`id_buku`),
  CONSTRAINT `peminjaman_FK` FOREIGN KEY (`id_anggota`) REFERENCES `anggota` (`id_anggota`),
  CONSTRAINT `peminjaman_FK_1` FOREIGN KEY (`id_buku`) REFERENCES `buku` (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peminjaman`
--

LOCK TABLES `peminjaman` WRITE;
/*!40000 ALTER TABLE `peminjaman` DISABLE KEYS */;
INSERT INTO `peminjaman` VALUES (1,1,3,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(2,2,2,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(3,2,1,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(4,1,1,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(5,1,5,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(6,1,2,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(7,1,4,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(8,2,1,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(9,2,4,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(10,2,5,'2023-11-03','2023-11-06','2023-11-09','pinjam jangan dikembalikan'),(12,1,3,'2023-11-03','2023-11-06',NULL,'pinjam jangan dikembalikan'),(13,1,5,'2023-11-03','2023-11-06',NULL,'pinjam jangan dikembalikan'),(14,1,5,'2023-11-03','2023-11-06',NULL,'pinjam jangan dikembalikan'),(15,1,5,'2023-11-03','2023-11-06','2023-11-03','pinjam jangan dikembalikan');
/*!40000 ALTER TABLE `peminjaman` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `on_insert` AFTER INSERT ON `peminjaman` FOR EACH ROW begin 
	declare book_id INT;
	declare borrowed_qty INT;
	declare current_stock INT;

	set book_id = new.id_buku;
	
	select stok into current_stock from buku where id_buku = book_id;
	
	set current_stock = current_stock - 1;

	insert into log_buku (id_buku, tgl_log,perubahan_stok, keterangan) values 
	(book_id, CURRENT_DATE(),current_stock, "stok berkurang");

	update buku set stok = current_stock where id_buku = book_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `on_update` AFTER UPDATE ON `peminjaman` FOR EACH ROW begin 
	declare book_id INT;
	declare borrowed_qty INT;
	declare current_stock INT;

	set book_id = new.id_buku;
	
	select stok into current_stock from buku where id_buku = book_id;
	
	set current_stock = current_stock + 1;

	insert into log_buku (id_buku, tgl_log,perubahan_stok, keterangan) values 
	(book_id, CURRENT_DATE(),current_stock, "stok bertambah");

	update buku set stok = current_stock where id_buku = book_id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping routines for database 'elibrary'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-03 10:20:48
