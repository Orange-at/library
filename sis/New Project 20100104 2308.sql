-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.27-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sis
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ sis;
USE sis;

--
-- Table structure for table `sis`.`students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `Id` int(10) unsigned NOT NULL auto_increment,
  `EnName` varchar(145) NOT NULL,
  `ChName` varchar(145) NOT NULL,
  `NiName` varchar(145) NOT NULL,
  `Num` varchar(45) NOT NULL,
  `Sex` varchar(45) NOT NULL,
  `Age` int(10) unsigned NOT NULL,
  `School` text NOT NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sis`.`students`
--

/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` (`Id`,`EnName`,`ChName`,`NiName`,`Num`,`Sex`,`Age`,`School`) VALUES 
 (1,'Leo','李宏','大鸿','00001','男',23,'武汉大学'),
 (2,'Mary','张雅','阿雅','00002','女',22,'北京大学'),
 (3,'Hellen','沈海燕','燕子','00003','女',23,'华中科技大学'),
 (4,'Jack','邓检','jay05','00004','男',21,'武汉大学'),
 (5,'Coco','李可','可可','00005','女',22,'华中科技大学'),
 (6,'Shery','王晓','Shery','00006','女',22,'武汉大学'),
 (7,'John','约翰','John','00007','男',24,'纽约大学'),
 (8,'Amenda','张萌萌','萌萌','00008','女',20,'武汉大学'),
 (9,'David','孙晓鹏','Davy','00009','男',22,'华中科技大学'),
 (10,'Lily','李丽','小丽','00010','女',22,'华中科技大学'),
 (11,'Amy ','艾米','ami','00011','女',22,'华中科技大学'),
 (12,'zj','张杰','杰仔','00012','男',30,'家里蹲大学');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
