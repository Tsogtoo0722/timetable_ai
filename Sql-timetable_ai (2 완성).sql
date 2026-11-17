-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: timetable_ai
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `classrooms`
--

DROP TABLE IF EXISTS `classrooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classrooms` (
  `classroom_id` bigint NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `room_name` varchar(50) NOT NULL,
  `capacity` int DEFAULT NULL,
  PRIMARY KEY (`classroom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,'Main','101',40),(2,'Main','102',40),(3,'Main','201',40),(4,'Engineering','301',60),(5,'Engineering','302',60),(6,'IT','401',30),(7,'IT','402',30),(8,'IT Lab','A',25);
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `course_information`
--

DROP TABLE IF EXISTS `course_information`;
/*!50001 DROP VIEW IF EXISTS `course_information`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `course_information` AS SELECT 
 1 AS `course_id`,
 1 AS `course_code`,
 1 AS `course_name`,
 1 AS `credits`,
 1 AS `professor_name`,
 1 AS `department_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course_schedules`
--

DROP TABLE IF EXISTS `course_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_schedules` (
  `schedule_id` bigint NOT NULL AUTO_INCREMENT,
  `course_id` bigint NOT NULL,
  `day_of_week` varchar(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`schedule_id`),
  KEY `fk_schedule_course` (`course_id`),
  CONSTRAINT `fk_schedule_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_schedules`
--

LOCK TABLES `course_schedules` WRITE;
/*!40000 ALTER TABLE `course_schedules` DISABLE KEYS */;
INSERT INTO `course_schedules` VALUES (1,1,'MONDAY','09:00:00','10:30:00'),(2,2,'TUESDAY','11:00:00','12:30:00'),(3,3,'WEDNESDAY','13:00:00','14:30:00'),(4,4,'THURSDAY','15:00:00','16:30:00'),(5,5,'MONDAY','11:00:00','12:30:00'),(6,6,'WEDNESDAY','09:00:00','10:30:00'),(7,7,'TUESDAY','13:00:00','14:30:00'),(8,8,'FRIDAY','09:00:00','10:30:00'),(9,9,'MONDAY','13:00:00','14:30:00'),(10,10,'TUESDAY','09:00:00','10:30:00'),(11,11,'THURSDAY','11:00:00','12:30:00'),(12,12,'FRIDAY','13:00:00','14:30:00'),(13,13,'MONDAY','15:00:00','16:30:00'),(14,14,'WEDNESDAY','15:00:00','16:30:00'),(15,15,'TUESDAY','15:00:00','16:30:00'),(16,16,'THURSDAY','09:00:00','10:30:00'),(17,17,'FRIDAY','11:00:00','12:30:00'),(18,18,'THURSDAY','13:00:00','14:30:00'),(19,19,'WEDNESDAY','11:00:00','12:30:00'),(20,20,'FRIDAY','15:00:00','16:30:00');
/*!40000 ALTER TABLE `course_schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `courses` (
  `course_id` bigint NOT NULL AUTO_INCREMENT,
  `course_code` varchar(30) NOT NULL,
  `course_name` varchar(150) NOT NULL,
  `credits` int NOT NULL,
  `department_id` bigint DEFAULT NULL,
  `professor_id` bigint DEFAULT NULL,
  `classroom_id` bigint DEFAULT NULL,
  `course_type` varchar(30) DEFAULT NULL,
  `grading_type` varchar(10) DEFAULT NULL,
  `target_students` varchar(100) DEFAULT NULL,
  `remaining_seats` int DEFAULT NULL,
  `is_remote` tinyint(1) DEFAULT NULL,
  `campus` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE KEY `course_code` (`course_code`),
  KEY `fk_courses_department` (`department_id`),
  KEY `fk_courses_professor` (`professor_id`),
  KEY `fk_courses_classroom` (`classroom_id`),
  CONSTRAINT `fk_courses_classroom` FOREIGN KEY (`classroom_id`) REFERENCES `classrooms` (`classroom_id`),
  CONSTRAINT `fk_courses_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  CONSTRAINT `fk_courses_professor` FOREIGN KEY (`professor_id`) REFERENCES `professors` (`professor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1,'CE401','Data Structures',3,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(2,'CE402','Database',3,1,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(3,'SE401','Software Engineering',3,2,3,3,NULL,NULL,NULL,NULL,NULL,NULL),(4,'CE403','Artificial Intelligence',3,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(5,'CE404','Operating Systems',3,1,4,4,NULL,NULL,NULL,NULL,NULL,NULL),(6,'CE405','Computer Networks',3,1,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(7,'CE406','Computer Architecture',3,1,4,4,NULL,NULL,NULL,NULL,NULL,NULL),(8,'CE407','Algorithms',3,1,1,1,NULL,NULL,NULL,NULL,NULL,NULL),(9,'SE402','Web Programming',3,2,5,5,NULL,NULL,NULL,NULL,NULL,NULL),(10,'SE403','Software Testing',3,2,8,6,NULL,NULL,NULL,NULL,NULL,NULL),(11,'SE404','Mobile App Development',3,2,5,5,NULL,NULL,NULL,NULL,NULL,NULL),(12,'SE405','Project Management',2,2,3,3,NULL,NULL,NULL,NULL,NULL,NULL),(13,'AI401','Machine Learning',3,3,6,7,NULL,NULL,NULL,NULL,NULL,NULL),(14,'AI402','Deep Learning',3,3,7,7,NULL,NULL,NULL,NULL,NULL,NULL),(15,'AI403','Natural Language Processing',3,3,6,8,NULL,NULL,NULL,NULL,NULL,NULL),(16,'AI404','Computer Vision',3,3,7,8,NULL,NULL,NULL,NULL,NULL,NULL),(17,'CE408','Information Security',3,1,2,2,NULL,NULL,NULL,NULL,NULL,NULL),(18,'CE409','Capstone Design',3,1,4,4,NULL,NULL,NULL,NULL,NULL,NULL),(19,'GE101','English Communication',2,NULL,8,6,NULL,NULL,NULL,NULL,NULL,NULL),(20,'GE102','Korean Language',2,NULL,5,1,NULL,NULL,NULL,NULL,NULL,NULL),(21,'45781-01','일상속마케팅이해하기',3,NULL,9,NULL,'균형교양','등급','수강희망자',1,1,'성서'),(22,'45782-01','현대라틴아메리카의사회문제와해결방안',3,NULL,10,NULL,'균형교양','등급','수강희망자',0,1,'성서'),(23,'46593-01','공무원의세계이해하기',3,NULL,11,NULL,'균형교양','등급','수강희망자',2,1,'성서'),(24,'21951-01','직업선택과취업준비',3,NULL,12,NULL,'균형교양','P/F','1,2학년 수강희망자',11,1,'성서'),(25,'21951-02','직업선택과취업준비',3,NULL,12,NULL,'균형교양','P/F','1,2학년 수강희망자',11,1,'성서'),(26,'25420-01','중국문화산책',3,NULL,13,NULL,'균형교양','등급','수강희망자',4,1,'성서'),(27,'25486-01','취업전략과사회진출',3,NULL,12,NULL,'균형교양','P/F','3,4학년 수강희망자',5,1,'성서'),(28,'25486-02','취업전략과사회진출',3,NULL,12,NULL,'균형교양','P/F','3,4학년 수강희망자',9,1,'성서'),(29,'25646-01','혁신과경영',3,NULL,14,NULL,'균형교양','등급','수강희망자',2,1,'성서'),(30,'26456-01','미디어정치의이해',3,NULL,15,NULL,'균형교양','등급','수강희망자',4,1,'성서'),(31,'27710-01','음향예술',3,NULL,16,NULL,'균형교양','등급','수강희망자',1,1,'성서'),(32,'27793-01','현대건축명작의이해',3,NULL,17,NULL,'균형교양','등급','수강희망자',2,1,'성서'),(33,'32905-01','재미있는진로선택-내인생의네비게이션',3,NULL,18,NULL,'균형교양','등급','수강희망자',2,1,'성서'),(34,'32905-99','재미있는진로선택-내인생의네비게이션',3,NULL,18,NULL,'균형교양','등급','군 복무 중 학점취득',0,1,'성서'),(35,'37693-01','계명기업가정신',3,NULL,19,NULL,'균형교양','등급','수강희망자',3,1,'성서'),(36,'40065-01','21세기중국의이해',3,NULL,20,NULL,'균형교양','등급','수강희망자',0,1,'성서'),(37,'41323-01','영화속숨겨진의미읽기',3,NULL,21,NULL,'균형교양','등급','수강희망자',1,1,'성서'),(38,'41323-99','영화속숨겨진의미읽기',3,NULL,21,NULL,'균형교양','등급','군 복무 중 학점취득',0,1,'성서'),(39,'41541-01','진로선택과자기계발',3,NULL,12,NULL,'균형교양','P/F','수강희망자',8,1,'성서'),(40,'41541-02','진로선택과자기계발',3,NULL,12,NULL,'균형교양','P/F','수강희망자',5,1,'성서'),(41,'42215-01','세계화와국제지역의이해',3,NULL,22,NULL,'균형교양','등급','수강희망자',2,1,'성서'),(42,'42216-01','국제지역의이슈와쟁점',3,NULL,23,NULL,'균형교양','등급','수강희망자',1,1,'성서'),(43,'42460-01','미래자동차혁명(공유)',3,NULL,24,NULL,'균형교양','등급','교양학부',0,NULL,'성서'),(44,'42813-01','이미지텍스트의이해와읽기',3,NULL,25,NULL,'균형교양','등급','수강희망자',1,1,'성서'),(45,'43479-01','생각하는기계인공지능',3,NULL,26,NULL,'균형교양','등급','수강희망자',5,1,'성서'),(46,'44138-01','누구나할수있는SW기초개발자코스',3,NULL,27,NULL,'일반교양','등급','수강희망자',5,1,'성서'),(47,'44670-01','사례로이해하는ESG경영',3,NULL,28,NULL,'일반교양','등급','수강희망자',1,1,'성서'),(48,'21234-01','사회봉사(1)',1,NULL,29,NULL,'일반교양','P/F','수강희망자',12,NULL,'성서'),(49,'21234-02','사회봉사(1)',1,NULL,30,NULL,'일반교양','P/F','수강희망자',11,NULL,'성서'),(50,'21234-03','사회봉사(1)',1,NULL,31,NULL,'일반교양','P/F','수강희망자',17,NULL,'성서'),(51,'21234-04','사회봉사(1)',1,NULL,30,NULL,'일반교양','P/F','수강희망자',11,NULL,'성서'),(52,'21234-05','사회봉사(1)',1,NULL,32,NULL,'일반교양','P/F','수강희망자',18,NULL,'성서'),(53,'21235-01','사회봉사(2)',1,NULL,33,NULL,'일반교양','P/F','수강희망자',11,NULL,'성서'),(54,'21235-02','사회봉사(2)',1,NULL,34,NULL,'일반교양','P/F','수강희망자',10,NULL,'성서'),(55,'21235-03','사회봉사(2)',1,NULL,35,NULL,'일반교양','P/F','수강희망자',11,NULL,'성서'),(56,'21235-04','사회봉사(2)',1,NULL,36,NULL,'일반교양','P/F','수강희망자',8,NULL,'성서'),(57,'42302-01','수학으로인문학읽기',3,NULL,37,NULL,'일반교양','등급','수강희망자',1,1,'성서'),(58,'42815-01','인간감성으로풀어보는행동경제이야기',3,NULL,38,NULL,'일반교양','등급','수강희망자',0,1,'성서'),(59,'43481-01','실크로드신과영웅이야기',3,NULL,39,NULL,'일반교양','등급','수강희망자',2,1,'성서'),(60,'43499-01','스마트비즈니스와창업기초',2,NULL,40,NULL,'공통교양','P/F','수강희망자',2,1,'성서'),(61,'43499-02','스마트비즈니스와창업기초',2,NULL,40,NULL,'공통교양','P/F','수강희망자',2,1,'성서'),(62,'43499-03','스마트비즈니스와창업기초',2,NULL,40,NULL,'공통교양','P/F','수강희망자',0,1,'성서'),(63,'43499-04','스마트비즈니스와창업기초',2,NULL,41,NULL,'공통교양','P/F','수강희망자',1,1,'성서'),(64,'43499-05','스마트비즈니스와창업기초',2,NULL,41,NULL,'공통교양','P/F','수강희망자',1,1,'성서'),(65,'42856-01','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',2,1,'성서'),(66,'42856-02','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',0,1,'성서'),(67,'42856-03','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',1,1,'성서'),(68,'42856-04','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',4,1,'성서'),(69,'42856-05','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',1,1,'성서'),(70,'42856-06','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',0,1,'성서'),(71,'42856-07','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',6,1,'성서'),(72,'42856-08','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',1,1,'성서'),(73,'42856-09','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',7,1,'성서'),(74,'42856-10','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',2,1,'성서'),(75,'42856-11','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',2,1,'성서'),(76,'42856-12','AI와컴퓨팅사고',1,NULL,42,NULL,'공통교양','P/F','수강희망자, 2026학년도 입학생',6,1,'성서'),(77,'22819-01','졸업논문(토목공학)',0,4,43,NULL,'전공필수','P/F','토목공학과 4년',12,NULL,'성서'),(78,'36125-01','토목공학학기현장실습',15,4,43,NULL,'전공선택','P/F','토목공학과 0년',0,NULL,'성서'),(79,'22644-01','졸업논문(건축학)',0,5,44,NULL,'전공필수','P/F','건축학과 5년',0,NULL,'성서'),(80,'19721-01','졸업논문(건축공학)',0,6,31,NULL,'전공필수','P/F','건축공학과 4년',15,NULL,'성서'),(81,'45790-01','전기공학학기현장실습',15,7,45,NULL,'전공선택','P/F','전기공학과 0년',0,NULL,'성서'),(82,'34798-01','졸업논문(게임모바일공학)',0,8,46,NULL,'전공필수','P/F','게임소프트웨어학과 4년',9,NULL,'성서'),(83,'45692-01','게임소프트웨어프로젝트',2,8,46,NULL,'전공선택','P/F','게임소프트웨어학과 0년',46,NULL,'성서'),(84,'45714-01','게임소프트웨어학기현장실습',15,8,46,NULL,'전공선택','P/F','게임소프트웨어학과 0년',49,NULL,'성서'),(85,'19750-01','졸업논문(교통공학)',0,9,47,NULL,'전공필수','P/F','교통공학과 4년',44,NULL,'성서'),(86,'27870-01','졸업논문(도시계획학)',0,10,48,NULL,'전공필수','P/F','도시계획학과 4년',46,NULL,'성서'),(87,'36133-01','도시계획학학기현장실습',15,10,48,NULL,'전공선택','P/F','도시계획학과 0년',0,NULL,'성서'),(88,'27871-01','졸업논문(생태환경디자인학)',0,11,49,NULL,'전공필수','P/F','생태조경학과 4년',47,NULL,'성서'),(89,'36135-01','화학공학학기현장실습',15,12,50,NULL,'전공선택','P/F','화학공학과 0년',0,NULL,'성서'),(90,'40736-01','메카트로닉스학기현장실습',15,13,51,NULL,'전공선택','P/F','로봇공학과 0년',0,NULL,'성서'),(91,'44566-01','졸업논문(환경공학)',0,14,52,NULL,'전공필수','P/F','환경공학과 4년',50,NULL,'성서');
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `department_id` bigint NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) NOT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Computer Engineering'),(2,'Software Engineering'),(3,'Artificial Intelligence'),(4,'토목공학과'),(5,'건축학과'),(6,'건축공학과'),(7,'전기공학과'),(8,'게임소프트웨어학과'),(9,'교통공학과'),(10,'도시계획학과'),(11,'생태조경학과'),(12,'화학공학과'),(13,'로봇공학과'),(14,'환경공학과');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `message` text,
  `notification_type` varchar(50) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `fk_notifications_user` (`user_id`),
  CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,'Course Registration','Course registration period is approaching.','REGISTRATION',0,'2026-09-15 08:20:39'),(2,2,'Timetable Recommendation','A new timetable recommendation is available.','RECOMMENDATION',0,'2026-09-15 08:20:39');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `professors`
--

DROP TABLE IF EXISTS `professors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professors` (
  `professor_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  PRIMARY KEY (`professor_id`),
  KEY `fk_professors_department` (`department_id`),
  CONSTRAINT `fk_professors_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professors`
--

LOCK TABLES `professors` WRITE;
/*!40000 ALTER TABLE `professors` DISABLE KEYS */;
INSERT INTO `professors` VALUES (1,'Kim Minsoo','minsoo@university.ac.kr',1),(2,'Lee Jisoo','jisoo@university.ac.kr',1),(3,'Park Junho','junho@university.ac.kr',2),(4,'Choi Hyunwoo','hyunwoo@university.ac.kr',1),(5,'Jung Eunji','eunji@university.ac.kr',2),(6,'Kang Daniel','daniel@university.ac.kr',3),(7,'Yoon Seoyeon','seoyeon@university.ac.kr',3),(8,'Han Jimin','jimin@university.ac.kr',2),(9,'김경호',NULL,NULL),(10,'박윤주',NULL,NULL),(11,'사용진',NULL,NULL),(12,'진로취업지원팀',NULL,NULL),(13,'윤창준',NULL,NULL),(14,'박주홍',NULL,NULL),(15,'구교태',NULL,NULL),(16,'이에스더',NULL,NULL),(17,'권지훈',NULL,NULL),(18,'조명실',NULL,NULL),(19,'김효정',NULL,NULL),(20,'유정원',NULL,NULL),(21,'최현주',NULL,NULL),(22,'정상희',NULL,NULL),(23,'김명수',NULL,NULL),(24,'앵커행정팀',NULL,NULL),(25,'김종성',NULL,NULL),(26,'이종하',NULL,NULL),(27,'박세진',NULL,NULL),(28,'오현석',NULL,NULL),(29,'최해운',NULL,NULL),(30,'최원석',NULL,NULL),(31,'안성진',NULL,6),(32,'김택수',NULL,NULL),(33,'이호형',NULL,NULL),(34,'전상은',NULL,NULL),(35,'김배환',NULL,NULL),(36,'김윤희',NULL,NULL),(37,'정대원',NULL,NULL),(38,'최성희',NULL,NULL),(39,'홍순희',NULL,NULL),(40,'김병국',NULL,NULL),(41,'김대건',NULL,NULL),(42,'이은미',NULL,NULL),(43,'Chey, Min Ho',NULL,4),(44,'문근종',NULL,5),(45,'박영수',NULL,7),(46,'조현철',NULL,8),(47,'권오훈',NULL,9),(48,'김은정',NULL,10),(49,'박진욱',NULL,11),(50,'이민우',NULL,12),(51,'홍성훈',NULL,13),(52,'배헌균',NULL,14);
/*!40000 ALTER TABLE `professors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation_conditions`
--

DROP TABLE IF EXISTS `recommendation_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_conditions` (
  `condition_id` bigint NOT NULL AUTO_INCREMENT,
  `student_id` bigint NOT NULL,
  `target_credits` int DEFAULT NULL,
  `preferences` json DEFAULT NULL,
  `required_courses` json DEFAULT NULL,
  `graduation_input` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`condition_id`),
  KEY `fk_conditions_student` (`student_id`),
  CONSTRAINT `fk_conditions_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation_conditions`
--

LOCK TABLES `recommendation_conditions` WRITE;
/*!40000 ALTER TABLE `recommendation_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendations`
--

DROP TABLE IF EXISTS `recommendations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendations` (
  `recommendation_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `timetable_id` bigint DEFAULT NULL,
  `score` decimal(5,2) DEFAULT NULL,
  `reason` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`recommendation_id`),
  KEY `fk_recommendations_user` (`user_id`),
  KEY `fk_recommendations_timetable` (`timetable_id`),
  CONSTRAINT `fk_recommendations_timetable` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`timetable_id`),
  CONSTRAINT `fk_recommendations_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendations`
--

LOCK TABLES `recommendations` WRITE;
/*!40000 ALTER TABLE `recommendations` DISABLE KEYS */;
INSERT INTO `recommendations` VALUES (1,1,1,92.50,'Preferred days and desired credits matched well.','2026-09-15 08:20:28'),(2,2,2,88.00,'No major time conflicts and suitable course combination.','2026-09-15 08:20:28');
/*!40000 ALTER TABLE `recommendations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `user_id` bigint NOT NULL,
  `student_no` varchar(30) DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `grade` int DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `student_no` (`student_no`),
  KEY `fk_students_department` (`department_id`),
  CONSTRAINT `fk_students_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL,
  CONSTRAINT `fk_students_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'20231234',1,4,NULL),(2,'20235678',1,3,NULL);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_courses`
--

DROP TABLE IF EXISTS `timetable_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable_courses` (
  `timetable_id` bigint NOT NULL,
  `course_id` bigint NOT NULL,
  PRIMARY KEY (`timetable_id`,`course_id`),
  KEY `fk_timetable_courses_course` (`course_id`),
  CONSTRAINT `fk_timetable_courses_course` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`),
  CONSTRAINT `fk_timetable_courses_timetable` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`timetable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_courses`
--

LOCK TABLES `timetable_courses` WRITE;
/*!40000 ALTER TABLE `timetable_courses` DISABLE KEYS */;
INSERT INTO `timetable_courses` VALUES (1,1),(1,2),(2,2),(1,3),(2,4);
/*!40000 ALTER TABLE `timetable_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetables`
--

DROP TABLE IF EXISTS `timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetables` (
  `timetable_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `timetable_name` varchar(100) DEFAULT NULL,
  `total_credits` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`timetable_id`),
  KEY `fk_timetables_user` (`user_id`),
  CONSTRAINT `fk_timetables_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetables`
--

LOCK TABLES `timetables` WRITE;
/*!40000 ALTER TABLE `timetables` DISABLE KEYS */;
INSERT INTO `timetables` VALUES (1,1,'My Fall Timetable',9,'2026-09-15 08:20:07'),(2,2,'Recommended Timetable',6,'2026-09-15 08:20:07');
/*!40000 ALTER TABLE `timetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_preferences` (
  `preference_id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `desired_credits` int DEFAULT NULL,
  `preferred_day` varchar(100) DEFAULT NULL,
  `avoided_time_start` time DEFAULT NULL,
  `avoided_time_end` time DEFAULT NULL,
  `prefer_free_day` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`preference_id`),
  KEY `fk_preferences_user` (`user_id`),
  CONSTRAINT `fk_preferences_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
INSERT INTO `user_preferences` VALUES (1,1,15,'MONDAY,TUESDAY','18:00:00','22:00:00',1,'2026-09-15 08:20:00'),(2,2,18,'WEDNESDAY,THURSDAY','08:00:00','09:00:00',0,'2026-09-15 08:20:00');
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `student_number` varchar(30) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `grade` int DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `role` varchar(30) DEFAULT 'STUDENT',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `student_number` (`student_number`),
  KEY `fk_users_department` (`department_id`),
  CONSTRAINT `fk_users_department` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'20231234','Bat-Erdene','bat@example.com','1234',4,1,'STUDENT','2026-09-15 08:19:28'),(2,'20235678','Bold','bold@example.com','1234',3,1,'STUDENT','2026-09-15 08:19:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `course_information`
--

/*!50001 DROP VIEW IF EXISTS `course_information`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `course_information` AS select `c`.`course_id` AS `course_id`,`c`.`course_code` AS `course_code`,`c`.`course_name` AS `course_name`,`c`.`credits` AS `credits`,`p`.`name` AS `professor_name`,`d`.`department_name` AS `department_name` from ((`courses` `c` left join `professors` `p` on((`c`.`professor_id` = `p`.`professor_id`))) left join `departments` `d` on((`c`.`department_id` = `d`.`department_id`))) */;
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

-- Dump completed on 2026-11-17 15:46:35
