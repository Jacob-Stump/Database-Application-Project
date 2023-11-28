-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `Category_ID` int NOT NULL AUTO_INCREMENT,
  `Cat_Name` char(45) NOT NULL,
  `Vendor_ID` int NOT NULL,
  PRIMARY KEY (`Category_ID`),
  KEY `Vendor_idx` (`Vendor_ID`),
  CONSTRAINT `Vendor` FOREIGN KEY (`Vendor_ID`) REFERENCES `vendors` (`Vendor_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Racquets',5),(2,'Shoes',3),(3,'Servers',4),(4,'Wine',1),(5,'Balls',5),(6,'Monitor',2),(7,'Liquor',1),(8,'Clothes',3),(9,'Beer',1),(10,'Workstations',2),(11,'Software',4),(12,'Toys',6),(13,'Furniture',6);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `First_Name` char(20) NOT NULL,
  `Last_Name` char(20) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`Customer_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Eric','Kirchner','me@you.com',123456),(2,'Jacob','Stump','jstu@email.com',112233),(3,'Aaron','Castillo','acas@email.com',445566),(4,'Marcus','Aurelius','ceasar@rome.com',134679),(18,'Jason','Bourne','hitman@ky.com',798789),(22,'John','Wick','doglover@beast.com',777444);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `Employee_ID` int NOT NULL,
  `FirstName` char(20) NOT NULL,
  `LastName` char(20) NOT NULL,
  PRIMARY KEY (`Employee_ID`),
  UNIQUE KEY `Employee_ID_UNIQUE` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Eric','Kirchner'),(2,'Aaron','Castillo'),(3,'Jacob','Stump'),(4,'Ada','Lovelace');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logincreds`
--

DROP TABLE IF EXISTS `logincreds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logincreds` (
  `Username` varchar(20) NOT NULL,
  `HashPass` varchar(224) NOT NULL,
  `Salt` varchar(64) NOT NULL,
  `Employee_ID` int NOT NULL,
  PRIMARY KEY (`Username`),
  KEY `Employee_idx` (`Employee_ID`),
  CONSTRAINT `Employee` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logincreds`
--

LOCK TABLES `logincreds` WRITE;
/*!40000 ALTER TABLE `logincreds` DISABLE KEYS */;
/*!40000 ALTER TABLE `logincreds` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdetails`
--

DROP TABLE IF EXISTS `orderdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdetails` (
  `Order_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  PRIMARY KEY (`Order_ID`,`Product_ID`),
  KEY `Order_idx` (`Order_ID`),
  KEY `Product_idx` (`Product_ID`),
  CONSTRAINT `Order` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Product` FOREIGN KEY (`Product_ID`) REFERENCES `products` (`Product_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdetails`
--

LOCK TABLES `orderdetails` WRITE;
/*!40000 ALTER TABLE `orderdetails` DISABLE KEYS */;
INSERT INTO `orderdetails` VALUES (1,26,1),(2,5,1),(7,5,1),(7,11,1),(12,14,1),(12,24,1),(13,2,2),(13,7,2),(13,23,2),(14,16,1),(15,8,2),(15,11,1),(16,4,1),(16,8,1),(16,27,1),(17,20,1),(17,21,1);
/*!40000 ALTER TABLE `orderdetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `Order_ID` int NOT NULL AUTO_INCREMENT,
  `Date` varchar(20) NOT NULL,
  `TotalAmount` float NOT NULL,
  `Customer_ID` int NOT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `Customer_idx` (`Customer_ID`),
  CONSTRAINT `Customer` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'10/2',101,1),(2,'10/3',10,2),(7,'4/20',69,1),(12,'6/12',88,18),(13,'12/12',555,2),(14,'10/17',35,2),(15,'11/5',45,3),(16,'2/4',37,1),(17,'9/20',357,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `Product_Id` int NOT NULL AUTO_INCREMENT,
  `Category_ID` int NOT NULL,
  `Prod_Name` varchar(45) NOT NULL,
  `Prod_Price` float NOT NULL,
  `Prod_Qty` int NOT NULL,
  `Prod_Desc` varchar(255) NOT NULL,
  PRIMARY KEY (`Product_Id`),
  KEY `Category_idx` (`Category_ID`),
  CONSTRAINT `Category` FOREIGN KEY (`Category_ID`) REFERENCES `categories` (`Category_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,6,'Curved Gaming Monitor',800,15,'34 inch QD-OLED Gaming Monitor'),(2,8,'DRI-FIT Icon ',35,11,'The Nike Dri-FIT Icon Shorts are a basketball essential.'),(3,3,'X86 Server',4300,5,'Designed and manufactured to run enterprise applications and virtual environments with maximum availability.'),(4,5,'Green X3',12,8,'The ideal ball for a beginner who is experiencing a full-size court.'),(5,12,'LEGO Avengers',35,6,'LEGO Avengers Mini set. Collect them all for full roster.'),(6,12,'Disney Princesses',45,10,'Relive the magic with Disney\'s Princesses Collection.'),(7,1,'Boost Rafa',120,18,'Whether you’re a beginner, picking up tennis again or looking for a frame that’s easy to play with, the Boost is made for you!'),(8,9,'Micro-Brewery Lager',13,55,'Support local brewers with this lager.'),(9,2,'Air Max 1',150,7,'Walking on clouds above the noise, the Air Max 1 blends timeless design with cushioned comfort.'),(10,10,'OptiPlex Micro',750,30,'OptiPlex desktops with 13th Gen Intel® core processors feature one BIOS for All-in-Ones and one BIOS across Towers, Small Form Factors and Micro Form Factors.'),(11,4,'Dry Red Wine',25,14,'Mild dry wine imported from Spain.'),(12,3,'SPARC M8-8',4250,11,'Oracle SPARC M8-8 servers deliver exceptional performance, consolidation efficiency, and uptime.'),(13,8,'Club Fleece',70,9,'Club Fleece sweatshirts, universally loved for their coziness and consistency.'),(14,7,'Ketel One',40,6,'Ketel One is produced by the Nolet Distillery in Schiedam, Netherlands.'),(15,10,'Precision 5680',2900,8,'The Precision 5680 is the world’s smallest footprint 16-inch workstation.'),(16,4,'Sweet White',37,20,'Local winery\'s finest sweet white.'),(17,2,'Air Max Plus',200,19,'Legendary Air Max cushioning offers premium stability and cushioning straight out of the box.'),(18,13,'Accent Chair',330,10,'Vernon Upholstered Barrel Accent Chair - Threshold designed with Studio McGee'),(19,1,'Pure Aero Team',239,10,'The 8th generation BABOLAT Pure Aero tennis racquet.'),(20,8,'Nike Universa',120,16,'Women\'s Medium-Support High-Waisted 7/8 Leggings with Pockets'),(21,6,'Dell 27 Monitor',180,22,'27\" lifestyle-inspired QHD monitor with outstanding visuals for an amazing entertainment experience.'),(22,11,'Oracle Database',350,9,'Oracle Database offers market-leading performance'),(23,8,'Nike Primary',65,14,'Men\'s Dri-FIT Long-Sleeve Versatile Top'),(24,7,'Wild Turkey 101',50,30,'101-proof Kentucky Straight Bourbon'),(25,9,'IPA',12,65,'Indian Pale Ale brewed locally'),(26,2,'Dunk Low',100,60,'Created for the hardwood but taken to the streets, the basketball icon returns.'),(27,5,'Red Foam X3',7,25,'A mini-tennis ball that is bigger and more flexible than a standard tennis ball.'),(28,8,'Nike Therma-FIT',70,11,'Men\'s Pullover Fitness Hoodie'),(29,13,'Modern Nightstand',60,3,'Elevate your sleep space with the simple and chic Modern Nightstand.'),(30,12,'Harry Potter Wand',15,30,'Write spells and other notes with this Harry Potter pen and bookmark set.'),(31,1,'Evo Drive Lite',179,18,'The Evo Drive Lite bring easy power and comfort to your game.'),(32,6,'Dell UltraSharp 27',500,7,'Elevate your productivity on this innovative 27-inch QHD monitor that delivers true-to-life color and seamless connectivity.'),(33,11,'Oracle Java SE',1200,3,'Oracle Java is the #1 programming language and development platform.');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendors` (
  `Vendor_ID` int NOT NULL AUTO_INCREMENT,
  `Vendor_Name` varchar(20) NOT NULL,
  PRIMARY KEY (`Vendor_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendors`
--

LOCK TABLES `vendors` WRITE;
/*!40000 ALTER TABLE `vendors` DISABLE KEYS */;
INSERT INTO `vendors` VALUES (1,'Standard Sales'),(2,'Dell'),(3,'Nike'),(4,'Oracle'),(5,'Babolat'),(6,'Target');
/*!40000 ALTER TABLE `vendors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project'
--
/*!50003 DROP FUNCTION IF EXISTS `generate_random_hash` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `generate_random_hash`() RETURNS varchar(64) CHARSET utf8mb4
    NO SQL
    DETERMINISTIC
BEGIN
    DECLARE random_value VARCHAR(255);
    DECLARE hashed_value VARCHAR(64);

    -- Generate a random value (you may need to adjust the source of randomness)
    SET random_value = CONCAT(RAND(), UUID());

    -- Calculate the SHA-256 hash of the random value
    SET hashed_value = SHA2(random_value, 256);

    RETURN hashed_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DeleteProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteProduct`(IN i INT)
BEGIN
SET @pid := i;
DELETE FROM products
WHERE Product_ID = @pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCategoryID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCategoryID`(IN CatName VARCHAR(20), OUT CatID INT)
BEGIN
    SELECT Category_ID
    INTO CatID
    FROM categories
    WHERE Vendor_ID = CatName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCatID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCatID`(IN CatName CHAR(45), OUT CatID INT)
BEGIN
    SELECT Category_ID
    INTO CatID
    FROM categories
    WHERE Cat_Name = CatName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetHashyPassy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetHashyPassy`(IN pt_user VARCHAR(20), pt_pass VARCHAR(64))
BEGIN
SET @input_password := pt_pass; 
SET @salt := (SELECT Salt FROM logincreds WHERE Username = pt_user); 
SET @hashed_input_password := SHA2(CONCAT(@input_password, @salt), 224); 
SELECT Username FROM logincreds WHERE Username = pt_user AND HashPass = @hashed_input_password; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetVendorID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetVendorID`(IN SelectedName VARCHAR(20), OUT ID INT)
BEGIN
    SELECT Vendor_ID
    INTO ID
    FROM vendors
    WHERE Vendor_Name = SelectedName;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertNewProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertNewProduct`(IN i VARCHAR(45), n VARCHAR(45), p FLOAT, q INT, d VARCHAR(255))
BEGIN
SET @Category := i;
SET @pname := n;
SET @pprice := p;
SET @pqty := q;
SET @pdesc := d;
CALL GetCatID(@Category, @CatID);
INSERT INTO products
Values (0, @CatID, @pname, @pprice, @pqty, @pdesc);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterUser`(IN pt_user VARCHAR(20), pt_pass VARCHAR(64), ID INT)
BEGIN
SET @provideduser := pt_user; 
SET @userpassword := pt_pass;
SET @userid := ID; 
SET @salt := generate_random_hash();
SET @hashed_password := SHA2(CONCAT(@userpassword, @salt), 224);
INSERT INTO logincreds (Username, HashPass, Salt, Employee_ID) VALUES (@provideduser, @hashed_password, @salt, @userid);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateProduct` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateProduct`(IN i INT, n VARCHAR(45), p FLOAT, q INT, d VARCHAR(255))
BEGIN
SET @pid := i;
SET @pname := n;
SET @pprice := p;
SET @pqty := q;
SET @pdesc := d;
UPDATE products
SET Prod_Name = @pname, Prod_Price = @pprice, Prod_qty = @pqty, Prod_Desc = @pdesc
WHERE Product_ID = @pid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-27 23:19:34
