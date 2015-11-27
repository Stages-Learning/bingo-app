# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: localhost (MySQL 5.5.42)
# Database: futurequest
# Generation Time: 2015-07-28 12:15:37 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned DEFAULT NULL,
  `type` enum('MYHUT','SURVEY','WORDCLOUD','DREAMBIG') DEFAULT NULL,
  `page` varchar(255) DEFAULT NULL,
  `data` text,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `activities_user` (`user`),
  CONSTRAINT `activities_user` FOREIGN KEY (`user`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table avatars
# ------------------------------------------------------------

DROP TABLE IF EXISTS `avatars`;

CREATE TABLE `avatars` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('avatar','mate') NOT NULL DEFAULT 'avatar',
  `name` varchar(50) NOT NULL DEFAULT '',
  `htmlid` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `avatars` WRITE;
/*!40000 ALTER TABLE `avatars` DISABLE KEYS */;

INSERT INTO `avatars` (`id`, `type`, `name`, `htmlid`)
VALUES
	(1,'avatar','Kid 1','avatar-1'),
	(2,'avatar','Kid 2','avatar-2'),
	(3,'avatar','Kid 3','avatar-3'),
	(4,'avatar','Kid 4','avatar-4'),
	(5,'avatar','Kid 5','avatar-5'),
	(6,'avatar','Kid 6','avatar-6'),
	(7,'mate','Mate 1','mate-1'),
	(8,'mate','Mate 2','mate-2'),
	(9,'mate','Mate 3','mate-3'),
	(10,'mate','Mate 4','mate-4'),
	(11,'mate','Mate 5','mate-5'),
	(12,'mate','Mate 6','mate-6'),
	(13,'avatar','Kid 7','avatar-7'),
	(14,'avatar','Kid 9','avatar-9'),
	(15,'avatar','Kid 10','avatar-10'),
	(16,'avatar','Kid 11','avatar-11'),
	(17,'avatar','Kid 12','avatar-12'),
	(18,'avatar','Kid 13','avatar-13'),
	(19,'avatar','Kid 14','avatar-14'),
	(20,'avatar','Kid 15','avatar-15'),
	(21,'avatar','Kid 16','avatar-16'),
	(22,'avatar','Kid 17','avatar-17'),
	(23,'avatar','Kid 18','avatar-18'),
	(24,'avatar','Kid 19','avatar-19'),
	(25,'avatar','Kid 20','avatar-20'),
	(26,'avatar','Kid 21','avatar-21');

/*!40000 ALTER TABLE `avatars` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `codes`;

CREATE TABLE `codes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `teacherid` int(11) DEFAULT NULL,
  `class_info` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `codes` WRITE;
/*!40000 ALTER TABLE `codes` DISABLE KEYS */;

INSERT INTO `codes` (`id`, `code`, `teacherid`, `class_info`)
VALUES
	(1,'123',1,'Period A');

/*!40000 ALTER TABLE `codes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table collages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `collages`;

CREATE TABLE `collages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `data` text,
  `feature` enum('false','true') NOT NULL DEFAULT 'false',
  `generic` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DATABASECHANGELOG
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DATABASECHANGELOG`;

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table DATABASECHANGELOGLOCK
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;

INSERT INTO `DATABASECHANGELOGLOCK` (`ID`, `LOCKED`, `LOCKGRANTED`, `LOCKEDBY`)
VALUES
	(1,00000000,NULL,NULL);

/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table forecasts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `forecasts`;

CREATE TABLE `forecasts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `data` text,
  `feature` enum('false','true') NOT NULL DEFAULT 'false',
  `generic` enum('false','true') NOT NULL DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table organizers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `organizers`;

CREATE TABLE `organizers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `data` text,
  `feature` enum('false','true') DEFAULT 'false',
  `generic` enum('false','true') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table progress
# ------------------------------------------------------------

DROP TABLE IF EXISTS `progress`;

CREATE TABLE `progress` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `data` text,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table prompts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `prompts`;

CREATE TABLE `prompts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userID` int(11) unsigned DEFAULT NULL,
  `screen` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `data` text,
  `feature` enum('false','true') DEFAULT 'false',
  `generic` enum('false','true') DEFAULT 'false',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table survey_answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_answers`;

CREATE TABLE `survey_answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `text` text,
  `index` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `survey_answers` WRITE;
/*!40000 ALTER TABLE `survey_answers` DISABLE KEYS */;

INSERT INTO `survey_answers` (`id`, `text`, `index`)
VALUES
	(1,'Never ',1),
	(2,'Almost Never ',2),
	(3,'Sometimes ',3),
	(4,'Almost Always ',4),
	(5,'Always ',5),
	(6,'Yes',1),
	(7,'No',2),
	(8,'I don\'t know',3),
	(9,'Yes, I have one strong career goal',1),
	(10,'Yes, I can name 2 or 3 possible career areas that might interest me',2),
	(11,'NOT YET, but I am starting to think about careers',3),
	(12,'NO, I do not know yet what type of career I want',4),
	(13,'Not sure',3),
	(14,'I can\'t remember',3),
	(15,'Very strong',1),
	(16,'in-between',2),
	(17,'not yet strong',3),
	(18,'Exactly like me',1),
	(19,'Very much like me',2),
	(20,'Only slightly like me',3),
	(21,'Not at all like me',4),
	(22,'Strongly Agree',1),
	(23,'Agree',2),
	(24,'Disagree',3),
	(25,'Strongly Disagree',4),
	(26,'Don\'t Know',5),
	(27,'Yes',1),
	(28,'No ',2),
	(29,'I can\'t remember ',3),
	(30,'Green = Go',1),
	(31,'Yellow = Proceed with Caution',2),
	(32,'Red = Stop',3),
	(33,'Exactly like me',1),
	(34,'Very much like me',2),
	(35,'Only slightly like me',3),
	(36,'Not at all like me ',4),
	(37,'Yes',1),
	(38,'No',2),
	(39,'Meet them, as long as you bring a friend.',1),
	(40,'Meet in a public place.',2),
	(41,'Tell someone where you will be before you go.',3),
	(42,'Ask your parent or guardian first and have them go with you.   ',4),
	(43,'They send you theirs first',1),
	(44,'You send them an old picture',2),
	(45,'As long as you don\'t send them your address too',3),
	(46,'Only if a parent or guardian is with you and says it is okay',4),
	(47,'My last name',1),
	(48,'My school name',2),
	(49,'My teacher\'s name',3),
	(50,'My favorite TV show',4),
	(51,'My address',5),
	(52,'12',1),
	(53,'13',2),
	(54,'35',3),
	(55,'There\'s no way to tell!',4);

/*!40000 ALTER TABLE `survey_answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table survey_categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_categories`;

CREATE TABLE `survey_categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `survey_categories` WRITE;
/*!40000 ALTER TABLE `survey_categories` DISABLE KEYS */;

INSERT INTO `survey_categories` (`id`, `name`)
VALUES
	(1,'THINGS I DO'),
	(2,'HOW I FEEL'),
	(3,'WHAT HAPPENS AT SCHOOL'),
	(4,'WHAT HAPPENS AT HOME'),
	(5,'CAREER EXPLORATION SURVEY'),
	(6,'HOW DO YOU FEEL when people ask you about your career plans? Let us know if you do or you don\'t feel certain way: '),
	(7,'HOW DO YOU FEEL when people ask you about what you want to do in the future? Let us know if you do or you don\'t feel a certain way: '),
	(8,'What do you plan to do after high school? (check all that apply)'),
	(9,'Which of the following have you done?'),
	(10,'How would you rate your strength in the following skills?'),
	(11,'FROM A CAREER DECISION SCALE'),
	(12,'COLLEGE READINESS SURVEY'),
	(13,'ONLINE SAFETY SURVEY'),
	(14,'How would you rate the safety of the following online activities?'),
	(15,'Please rate how much each of the following statements sounds like you. '),
	(16,'Choose YOUR best answer for these questions:');

/*!40000 ALTER TABLE `survey_categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table survey_question_answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_question_answers`;

CREATE TABLE `survey_question_answers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` int(11) unsigned DEFAULT NULL,
  `answer` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `survey_question_answers` WRITE;
/*!40000 ALTER TABLE `survey_question_answers` DISABLE KEYS */;

INSERT INTO `survey_question_answers` (`id`, `question`, `answer`)
VALUES
	(1,1,1),
	(2,1,2),
	(3,1,3),
	(4,1,4),
	(5,1,5),
	(6,2,1),
	(7,2,2),
	(8,2,3),
	(9,2,4),
	(10,2,5),
	(11,3,1),
	(12,3,2),
	(13,3,3),
	(14,3,4),
	(15,3,5),
	(16,4,1),
	(17,4,2),
	(18,4,3),
	(19,4,4),
	(20,4,5),
	(21,5,1),
	(22,5,2),
	(23,5,3),
	(24,5,4),
	(25,5,5),
	(26,6,1),
	(27,6,2),
	(28,6,3),
	(29,6,4),
	(30,6,5),
	(31,7,1),
	(32,7,2),
	(33,7,3),
	(34,7,4),
	(35,7,5),
	(36,8,1),
	(37,8,2),
	(38,8,3),
	(39,8,4),
	(40,8,5),
	(41,9,1),
	(42,9,2),
	(43,9,3),
	(44,9,4),
	(45,9,5),
	(46,10,1),
	(47,10,2),
	(48,10,3),
	(49,10,4),
	(50,10,5),
	(51,11,1),
	(52,11,2),
	(53,11,3),
	(54,11,4),
	(55,11,5),
	(56,12,1),
	(57,12,2),
	(58,12,3),
	(59,12,4),
	(60,12,5),
	(61,13,1),
	(62,13,2),
	(63,13,3),
	(64,13,4),
	(65,13,5),
	(66,14,1),
	(67,14,2),
	(68,14,3),
	(69,14,4),
	(70,14,5),
	(71,15,1),
	(72,15,2),
	(73,15,3),
	(74,15,4),
	(75,15,5),
	(76,16,1),
	(77,16,2),
	(78,16,3),
	(79,16,4),
	(80,16,5),
	(81,17,1),
	(82,17,2),
	(83,17,3),
	(84,17,4),
	(85,17,5),
	(86,18,1),
	(87,18,2),
	(88,18,3),
	(89,18,4),
	(90,18,5),
	(91,19,1),
	(92,19,2),
	(93,19,3),
	(94,19,4),
	(95,19,5),
	(96,20,1),
	(97,20,2),
	(98,20,3),
	(99,20,4),
	(100,20,5),
	(101,21,1),
	(102,21,2),
	(103,21,3),
	(104,21,4),
	(105,21,5),
	(106,22,1),
	(107,22,2),
	(108,22,3),
	(109,22,4),
	(110,22,5),
	(111,23,1),
	(112,23,2),
	(113,23,3),
	(114,23,4),
	(115,23,5),
	(116,24,1),
	(117,24,2),
	(118,24,3),
	(119,24,4),
	(120,24,5),
	(121,25,6),
	(122,25,7),
	(123,25,8),
	(124,26,6),
	(125,26,7),
	(126,26,8),
	(127,27,6),
	(128,27,7),
	(129,27,8),
	(130,28,6),
	(131,28,7),
	(132,28,8),
	(133,29,6),
	(134,29,7),
	(135,29,8),
	(136,30,6),
	(137,30,7),
	(138,30,8),
	(139,31,6),
	(140,31,7),
	(141,31,8),
	(142,32,6),
	(143,32,7),
	(144,32,8),
	(145,33,6),
	(146,33,7),
	(147,33,8),
	(148,34,9),
	(149,34,10),
	(150,34,11),
	(151,34,12),
	(152,35,6),
	(153,35,7),
	(154,35,13),
	(155,36,6),
	(156,36,7),
	(157,36,13),
	(158,37,6),
	(159,37,7),
	(160,37,13),
	(161,38,6),
	(162,38,7),
	(163,38,13),
	(164,39,6),
	(165,39,7),
	(166,39,13),
	(167,40,6),
	(168,40,7),
	(169,40,13),
	(170,42,6),
	(171,42,7),
	(172,42,14),
	(173,43,6),
	(174,43,7),
	(175,43,14),
	(176,44,6),
	(177,44,7),
	(178,44,14),
	(179,45,6),
	(180,45,7),
	(181,45,14),
	(182,46,6),
	(183,46,7),
	(184,46,14),
	(185,47,6),
	(186,47,7),
	(187,47,14),
	(188,48,6),
	(189,48,7),
	(190,48,14),
	(191,49,6),
	(192,49,7),
	(193,49,14),
	(194,50,6),
	(195,50,7),
	(196,50,14),
	(197,51,15),
	(198,51,16),
	(199,51,17),
	(200,52,15),
	(201,52,16),
	(202,52,17),
	(203,53,15),
	(204,53,16),
	(205,53,17),
	(206,54,15),
	(207,54,16),
	(208,54,17),
	(209,55,15),
	(210,55,16),
	(211,55,17),
	(212,56,15),
	(213,56,16),
	(214,56,17),
	(215,57,15),
	(216,57,16),
	(217,57,17),
	(218,58,15),
	(219,58,16),
	(220,58,17),
	(221,59,15),
	(222,59,16),
	(223,59,17),
	(224,60,18),
	(225,60,19),
	(226,60,20),
	(227,60,21),
	(228,61,18),
	(229,61,19),
	(230,61,20),
	(231,61,21),
	(232,62,18),
	(233,62,19),
	(234,62,20),
	(235,62,21),
	(236,63,18),
	(237,63,19),
	(238,63,20),
	(239,63,21),
	(240,64,18),
	(241,64,19),
	(242,64,20),
	(243,64,21),
	(244,65,18),
	(245,65,19),
	(246,65,20),
	(247,65,21),
	(248,66,22),
	(249,66,23),
	(250,66,24),
	(251,66,25),
	(252,66,26),
	(253,67,22),
	(254,67,23),
	(255,67,24),
	(256,67,25),
	(257,67,26),
	(258,68,22),
	(259,68,23),
	(260,68,24),
	(261,68,25),
	(262,68,26),
	(263,69,22),
	(264,69,23),
	(265,69,24),
	(266,69,25),
	(267,69,26),
	(268,70,22),
	(269,70,23),
	(270,70,24),
	(271,70,25),
	(272,70,26),
	(273,71,22),
	(274,71,23),
	(275,71,24),
	(276,71,25),
	(277,71,26),
	(278,72,22),
	(279,72,23),
	(280,72,24),
	(281,72,25),
	(282,72,26),
	(283,73,22),
	(284,73,23),
	(285,73,24),
	(286,73,25),
	(287,73,26),
	(288,74,22),
	(289,74,23),
	(290,74,24),
	(291,74,25),
	(292,74,26),
	(293,75,22),
	(294,75,23),
	(295,75,24),
	(296,75,25),
	(297,75,26),
	(298,76,22),
	(299,76,23),
	(300,76,24),
	(301,76,25),
	(302,76,26),
	(303,77,27),
	(304,77,28),
	(305,77,29),
	(306,78,27),
	(307,78,28),
	(308,78,29),
	(309,79,30),
	(310,79,31),
	(311,79,32),
	(312,80,30),
	(313,80,31),
	(314,80,32),
	(315,81,30),
	(316,81,31),
	(317,81,32),
	(318,82,30),
	(319,82,31),
	(320,82,32),
	(321,83,30),
	(322,83,31),
	(323,83,32),
	(324,84,30),
	(325,84,31),
	(326,84,32),
	(327,85,33),
	(328,85,34),
	(329,85,35),
	(330,85,36),
	(331,86,33),
	(332,86,34),
	(333,86,35),
	(334,86,36),
	(335,87,33),
	(336,87,34),
	(337,87,35),
	(338,87,36),
	(339,88,33),
	(340,88,34),
	(341,88,35),
	(342,88,36),
	(343,89,37),
	(344,89,38),
	(345,90,39),
	(346,90,40),
	(347,90,41),
	(348,90,42),
	(349,91,43),
	(350,91,44),
	(351,91,45),
	(352,91,46),
	(353,92,47),
	(354,92,48),
	(355,92,49),
	(356,92,50),
	(357,92,51),
	(358,93,52),
	(359,93,53),
	(360,93,54),
	(361,93,55);

/*!40000 ALTER TABLE `survey_question_answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table survey_questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_questions`;

CREATE TABLE `survey_questions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `survey` int(11) unsigned DEFAULT NULL,
  `category` int(11) unsigned DEFAULT NULL,
  `text` text,
  `customClass` enum('default','faces') NOT NULL DEFAULT 'default',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `survey_questions` WRITE;
/*!40000 ALTER TABLE `survey_questions` DISABLE KEYS */;

INSERT INTO `survey_questions` (`id`, `survey`, `category`, `text`, `customClass`)
VALUES
	(1,1,1,'I know what I need, what I like, and what I\'m good at. ','default'),
	(2,1,1,'I set goals to get what I want or need. I think about what I am good at when I do this.','default'),
	(3,1,1,'I figure out how to meet my goals. I make plans and decide what I should do. ','default'),
	(4,1,1,'I begin working on my plans to meet my goals as soon as possible.','default'),
	(5,1,1,'I check how I\'m doing when I\'m working on my plan. If I need to, I ask others what they think of how I\'m doing. ','default'),
	(6,1,1,'If my plan doesn\'t work, I try another one to meet my goals. ','default'),
	(7,1,2,'I feel good about what I like, what I want, and what I need to do. ','default'),
	(8,1,2,'I believe that I can set goals to get what I want. ','default'),
	(9,1,2,'I like to make plans to meet my goals.','default'),
	(10,1,2,'I like to begin working on my plans right away.','default'),
	(11,1,2,'I like to check on how well I\'m doing in meeting my goals.','default'),
	(12,1,2,'I am willing to try another way if it helps me to meet my goals. ','default'),
	(13,1,3,'People at school listen to me when I talk about what I want, what I need, or what I\'m good at.','default'),
	(14,1,3,'People at school let me know that I can set my own goals to get what I want or need. ','default'),
	(15,1,3,'At school, I have learned how to make plans to meet my goals and to feel good about them. ','default'),
	(16,1,3,'People at school encourage me to start working on my plans right away. ','default'),
	(17,1,3,'I have someone at school who can tell me if I am meeting my goals. ','default'),
	(18,1,3,'People at school understand when I have to change my plans to meet my goals. They offer advice and encourage me when I\'m doing this.','default'),
	(19,1,4,'People at home listen to me when I talk about what I want, what I need, or what I\'m good at.','default'),
	(20,1,4,'People at home let me know that I can set my own goals to get what I want or need. ','default'),
	(21,1,4,'At home, I have learned how to make plans to meet my goals and to feel good about them. ','default'),
	(22,1,4,'People at home encourage me to start working on my plans right away. ','default'),
	(23,1,4,'I have someone at home who can tell me if I am meeting my goals. ','default'),
	(24,1,4,'People at home understand when I have to change my plan to meet my goals. They offer advice and encourage me when I\'m doing this. ','default'),
	(25,2,6,'Worried','default'),
	(26,2,6,'Excited','default'),
	(27,2,6,'Bored','default'),
	(28,2,6,'Ready','default'),
	(29,2,7,'I have lots of options','default'),
	(30,2,7,'I don\'t have enough information','default'),
	(31,2,7,'I have too much information','default'),
	(32,2,7,'I have about the right amount of information','default'),
	(33,2,7,'I haven\'t really started planning yet','default'),
	(34,2,7,'Do you know yet what career areas you are interested in?','default'),
	(35,2,8,'Attend a four-year college','default'),
	(36,2,8,'Attend a career training program','default'),
	(37,2,8,'Enter an apprenticeship program','default'),
	(38,2,8,'Enter the military','default'),
	(39,2,8,'Work part-time','default'),
	(40,2,8,'Work full-time','default'),
	(42,2,9,'Talked with teachers and counselors about careers ','default'),
	(43,2,9,'Talked with parents about careers ','default'),
	(44,2,9,'Heard guest speakers about careers at my school ','default'),
	(45,2,9,'Field trips to companies and workplaces ','default'),
	(46,2,9,'Looked at websites, videos or books about careers ','default'),
	(47,2,9,'Volunteer work ','default'),
	(48,2,9,'Clubs or activities related to career interests ','default'),
	(49,2,9,'Classroom projects related to career interests ','default'),
	(50,2,9,'Matched my skills and interests to career options ','default'),
	(51,2,10,'Communicating in writing ','default'),
	(52,2,10,'Working with others ','default'),
	(53,2,10,'Leadership ','default'),
	(54,2,10,'Doing my work on time ','default'),
	(55,2,10,'Working with numbers ','default'),
	(56,2,10,'Using computers and the Internet ','default'),
	(57,2,10,'Being on time for school ','default'),
	(58,2,10,'Having good attendance ','default'),
	(59,2,10,'Keeping my school papers and materials organized ','default'),
	(60,2,11,'I know what to do next about my career choice ','default'),
	(61,2,11,'I\'m having trouble deciding between several possible jobs ','default'),
	(62,2,11,'I know I will have to work eventually but none of the careers I know about appeal to me. ','default'),
	(63,2,11,'Until now, I haven\'t given much thought to choosing a career. ','default'),
	(64,2,11,'I don\'t know what my interests are.','default'),
	(65,2,11,'I need more information about different kinds of jobs before I can decide on a career. ','default'),
	(66,3,12,'I plan to graduate from high school.','faces'),
	(67,3,12,'I would like to go to college after high school.','faces'),
	(68,3,12,'I believe I can succeed in school.','faces'),
	(69,3,12,'My teachers believe I can succeed in school.','faces'),
	(70,3,12,'I take responsibility for my school work.','faces'),
	(71,3,12,'My counselor has talked to me about my future goals and dreams.','faces'),
	(72,3,12,'My family expects me to finish high school.','faces'),
	(73,3,12,'My family expects me to go to college.','faces'),
	(74,3,12,'I know how much it costs to go to college.','faces'),
	(75,3,12,'I know at least five people who have graduated from college (besides teachers).','faces'),
	(76,3,12,'I believe I can make more money if I have a college degree.','faces'),
	(77,3,12,'Have you talked to your family members about graduating high school?','default'),
	(78,3,12,'Have you talked to your family members about going to college?','default'),
	(79,4,14,'Playing games online on gaming websites','default'),
	(80,4,14,'Posting photos to a social media site or online photo sharing site','default'),
	(81,4,14,'Connecting with people you know \"offline\" on social media websites','default'),
	(82,4,14,'Buying music, books or other items from an online store (with a gift card; or with help from an adult who will use a credit card) ','default'),
	(83,4,14,'Giving your name, address, phone, email or other personal information to someone you met online','default'),
	(84,4,14,'Making plans to meet in person with someone you met online','default'),
	(85,4,15,'I do not believe that the internet is dangerous. ','default'),
	(86,4,15,'I feel that I can behave safely online.','default'),
	(87,4,15,'I am aware of the dangers and risks online. ','default'),
	(88,4,15,'I am still a little bit confused about what is safe and what is unsafe. ','default'),
	(89,4,16,'While surfing the Internet, you get an error message from your Internet provider, and it says it will delete your account unless you type in your password again, should you send the information?','default'),
	(90,4,16,'If you have been talking on the Internet to a person for a long time, and they want to meet, which is okay to do?','default'),
	(91,4,16,'It is okay to send someone online your picture when:  ','default'),
	(92,4,16,'Which is okay to give out over the Internet?','default'),
	(93,4,16,'If  someone online tells you they are in 6th grade and their name is Katie, they are probably how old?  ','default');

/*!40000 ALTER TABLE `survey_questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table survey_responses
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_responses`;

CREATE TABLE `survey_responses` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned DEFAULT NULL,
  `question` int(11) unsigned DEFAULT NULL,
  `answer` int(11) unsigned DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table survey_responses_post
# ------------------------------------------------------------

DROP TABLE IF EXISTS `survey_responses_post`;

CREATE TABLE `survey_responses_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(11) unsigned DEFAULT NULL,
  `question` int(11) unsigned DEFAULT NULL,
  `answer` int(11) unsigned DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table surveys
# ------------------------------------------------------------

DROP TABLE IF EXISTS `surveys`;

CREATE TABLE `surveys` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `customClass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `surveys` WRITE;
/*!40000 ALTER TABLE `surveys` DISABLE KEYS */;

INSERT INTO `surveys` (`id`, `name`, `description`, `customClass`)
VALUES
	(1,'Self Determination','Vestibulum id ligula porta felis euismod semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL),
	(2,'Career Exploration','Vestibulum id ligula porta felis euismod semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL),
	(3,'College Readiness','Vestibulum id ligula porta felis euismod semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit.','faces'),
	(4,'Online Safety','Vestibulum id ligula porta felis euismod semper. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',NULL);

/*!40000 ALTER TABLE `surveys` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table teachers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(40) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;

INSERT INTO `teachers` (`id`, `fname`, `lname`, `school`)
VALUES
	(1,'Chris','Spence','Franklin High School');

/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uploads`;

CREATE TABLE `uploads` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `mate` varchar(50) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `password`, `fname`, `lname`, `avatar`, `mate`, `code`)
VALUES
	(37,'spencech','4c8adf170fe27ce3ee8f6e9be283784b','Christopher','Spence','avatar-1','mate-5',1);

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
