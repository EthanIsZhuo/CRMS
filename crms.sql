/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 5.7.25-log : Database - crms
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`crms` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `crms`;

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `cid` int(10) NOT NULL AUTO_INCREMENT,
  `cSnum` varchar(20) DEFAULT NULL,
  `cName` varchar(20) DEFAULT NULL,
  `cType` int(1) DEFAULT NULL COMMENT '0.包约，1.包年',
  `cPhone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `cDob` varchar(15) DEFAULT NULL COMMENT '宿舍楼',
  `cDno` varchar(10) DEFAULT NULL COMMENT '宿舍号',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;

/*Data for the table `client` */

insert  into `client`(`cid`,`cSnum`,`cName`,`cType`,`cPhone`,`cDob`,`cDno`) values 
(83,'201915431523','杨过',1,'1634523545','北三','501'),
(87,'201801656512','张无忌',0,'1345652123','南三','405'),
(88,'202115465234','小龙女',1,'213542215','南六','418'),
(89,'2018213546','郭靖',0,'1345642345','南七','516'),
(90,'2018213424','黄蓉',1,'13413565745','南六','516'),
(91,'201655487123','段誉',1,'215421354','南二','801'),
(92,'20211216551','乔峰',0,'15846442131','北一','518'),
(93,'2021115551','虚竹',1,'14545153131','北一','518'),
(94,'20184578213','金毛狮王',0,'13874561235','西二','412');

/*Table structure for table `manager` */

DROP TABLE IF EXISTS `manager`;

CREATE TABLE `manager` (
  `mId` int(10) NOT NULL AUTO_INCREMENT,
  `mName` varchar(20) DEFAULT NULL,
  `mPwd` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `manager` */

insert  into `manager`(`mId`,`mName`,`mPwd`) values 
(1,'admin','admin');

/*Table structure for table `myorder` */

DROP TABLE IF EXISTS `myorder`;

CREATE TABLE `myorder` (
  `orderId` varchar(25) NOT NULL,
  `cId` int(10) DEFAULT NULL,
  `payDate` datetime(6) DEFAULT NULL,
  `dueDate` datetime(6) DEFAULT NULL,
  `fee` int(10) DEFAULT NULL,
  `payType` int(1) DEFAULT NULL,
  `operator` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `myorder` */

insert  into `myorder`(`orderId`,`cId`,`payDate`,`dueDate`,`fee`,`payType`,`operator`) values 
('2021040720215465234',88,'2021-04-07 00:00:00.000000','2023-04-07 00:00:00.000000',1790,1,'mike'),
('20210513201915431523',83,'2021-05-13 00:00:00.000000','2022-05-13 00:00:00.000000',895,1,'mike'),
('20210607201655487123',91,'2021-06-07 00:00:00.000000','2022-06-07 00:00:00.000000',895,1,'mike'),
('202106112018213424',90,'2021-06-11 00:00:00.000000','2022-06-11 00:00:00.000000',895,1,'mike'),
('20220611201801656512',87,'2022-06-11 00:00:00.000000','2022-07-11 00:00:00.000000',98,0,'mike'),
('202206112018213546',89,'2022-06-11 00:00:00.000000','2022-07-11 00:00:00.000000',98,0,'mike'),
('202206122021115551',93,'2022-06-12 00:00:00.000000','2023-06-12 00:00:00.000000',895,1,'mike'),
('2022061220211216551',92,'2022-06-12 00:00:00.000000','2022-07-12 00:00:00.000000',98,0,'mike');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `userPwd` varchar(20) DEFAULT NULL,
  `userState` int(1) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userId`,`userName`,`userPwd`,`userState`) values 
(1,'111','111',1),
(2,'9527','9527',0),
(3,'123','123',1),
(4,'156','156',1),
(5,'123456','123456',1),
(6,'888','8888',0),
(7,'996','996',1),
(8,'1','1',1),
(9,'acb','',0),
(10,'222','222',1),
(11,'333','333',1),
(12,'...','...',1),
(13,'zzz','zz',1),
(14,'131','131',1),
(15,'1234','1234',1),
(16,'999','999',1),
(17,'000','000',0),
(18,'132','546',1),
(19,'9999','1231',0),
(23,'12','12',0),
(26,'6980','61321',0),
(28,'88','88',1),
(30,'880','8800',0),
(31,'555','123',1),
(36,'abc','123',1),
(37,'ethan','123',1),
(38,'mike','123',1),
(39,'tonny','123',1),
(44,'Jason','123456',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
