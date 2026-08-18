-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: techinfo
-- ------------------------------------------------------
-- Server version	8.0.46

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
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(100) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Java Programming','Stable Language'),(2,'Python','Best For ML ,AL'),(3,'DOCKER','Used For Sharing the COde Across Different PlatForm'),(4,'js',NULL),(5,'dsa',NULL),(6,'ci / cd','continuous integration and deployment '),(7,'kafka','streaming tool');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liked`
--

DROP TABLE IF EXISTS `liked`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liked` (
  `lid` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL,
  `uid` int NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liked`
--

LOCK TABLES `liked` WRITE;
/*!40000 ALTER TABLE `liked` DISABLE KEYS */;
INSERT INTO `liked` VALUES (27,6,9),(36,1,9),(38,3,9),(40,4,9),(69,2,10),(70,1,10),(71,4,10),(72,3,10),(73,5,10),(74,6,10),(77,3,4);
/*!40000 ALTER TABLE `liked` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `pTitle` varchar(100) NOT NULL,
  `pContent` longtext,
  `pCode` longtext,
  `pPic` varchar(50) DEFAULT NULL,
  `pDate` datetime DEFAULT CURRENT_TIMESTAMP,
  `catId` int DEFAULT NULL,
  `userId` int NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `cid_idx` (`catId`),
  KEY `fk_user_id_idx` (`userId`),
  CONSTRAINT `fk_posts_category` FOREIGN KEY (`catId`) REFERENCES `categories` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Java Programming: Understanding Object-Oriented Programming','Java is a powerful, object-oriented programming language widely used for web applications, desktop applications, Android development, and enterprise software. Its main features include platform independence, strong type checking, exception handling, inheritance, polymorphism, and encapsulation. Java programs are compiled into bytecode that runs on the Java Virtual Machine (JVM), making Java applications portable across different operating systems.','class Student {\r\n    String name;\r\n\r\n    Student(String name) {\r\n        this.name = name;\r\n    }\r\n\r\n    void display() {\r\n        System.out.println(\"Student: \" + name);\r\n    }\r\n}','java.png','2026-08-12 16:47:04',1,9),(2,'Python Programming: Why It Is Popular Among Developers','Python is a high-level, interpreted programming language known for its simple and readable syntax. It is widely used in web development, data science, artificial intelligence, machine learning, automation, and scripting. Python provides a large collection of built-in libraries and third-party packages, which makes it easier for developers to build applications quickly with less code.','def calculate_sum(numbers):\r\n    total = 0\r\n\r\n    for num in numbers:\r\n        total += num\r\n\r\n    return total\r\n\r\nprint(calculate_sum([10, 20, 30]))','python.jpg','2026-08-12 16:47:46',2,9),(3,'Docker: Simplifying Application Deployment with Containers','Docker is a containerization platform that allows developers to package an application along with its dependencies into a single container. Containers provide a consistent environment for running applications across development, testing, and production systems. Docker helps avoid the common problem of \"it works on my machine\" by ensuring that the application runs with the same environment everywhere.','FROM node:20\r\n\r\nWORKDIR /app\r\n\r\nCOPY package*.json ./\r\nRUN npm install\r\n\r\nCOPY . .\r\n\r\nEXPOSE 3000\r\nCMD [\"npm\", \"start\"]','docker.png','2026-08-12 16:48:23',3,9),(4,'JavaScript: Making Web Pages Interactive','JavaScript is one of the most important programming languages for web development. It allows developers to create interactive and dynamic web pages. JavaScript can be used to handle user events, validate forms, modify HTML and CSS, communicate with servers using APIs, and build complete web applications using frameworks such as React, Angular, and Vue.','const button = document.getElementById(\"btn\");\r\n\r\nbutton.addEventListener(\"click\", () => {\r\n    const message = document.getElementById(\"message\");\r\n    message.textContent = \"Hello JavaScript!\";\r\n});','js.png','2026-08-12 16:49:02',4,9),(5,'Data Structures and Algorithms: The Foundation of Programming','Data Structures and Algorithms, commonly called DSA, are fundamental concepts in computer science. Data structures help organize and store data efficiently, while algorithms define the steps required to solve a particular problem. Arrays, linked lists, stacks, queues, trees, graphs, and hash tables are common data structures. Learning DSA helps developers write efficient and optimized programs.','int[] arr = {10, 20, 30, 40, 50};\r\nint target = 30;\r\n\r\nfor (int i = 0; i < arr.length; i++) {\r\n    if (arr[i] == target) {\r\n        System.out.println(\"Found at index: \" + i);\r\n        break;\r\n    }\r\n}','dsa.png','2026-08-12 16:49:50',5,9),(6,'CI/CD: Automating Software Development and Deployment','CI/CD stands for Continuous Integration and Continuous Delivery or Continuous Deployment. Continuous Integration automatically builds and tests code whenever developers make changes to a project. Continuous Delivery or Deployment helps automate the process of releasing tested code to a production environment. CI/CD improves development speed, reduces manual errors, and allows teams to deliver software more frequently.','name: Java CI\r\n\r\non:\r\n  push:\r\n    branches: [ \"main\" ]\r\n\r\njobs:\r\n  build:\r\n    runs-on: ubuntu-latest\r\n    steps:\r\n      - uses: actions/checkout@v4\r\n      - run: mvn test','CiCd.png','2026-08-12 16:50:26',6,9);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  `gender` varchar(45) NOT NULL,
  `rdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `profile` varchar(500) DEFAULT 'default.png',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'FALGUN_RATHOD','falgunrathod0708@gmail.com','1234rt','Male','2026-08-03 15:22:45','default.png'),(4,'himawari_kaguya','xeon@gmail.com','123','Female','2026-08-03 15:26:01','sandwich4.jpg'),(8,'zanki chain','zanki123@gmail.com','zanki123','Male','2026-08-06 10:05:53',NULL),(9,'admin','admin@gmail.com','123','Male','2026-08-06 10:17:55','profiles/default.png'),(10,'asmin','asmin@gmail.com','123','Female','2026-08-06 10:18:57','girl.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-17 20:48:07
