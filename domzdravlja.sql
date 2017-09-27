/*
SQLyog Community v12.4.1 (64 bit)
MySQL - 5.7.14 : Database - domzdravlja
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`domzdravlja` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `domzdravlja`;

/*Table structure for table `korisnik` */

CREATE TABLE `korisnik` (
  `userId` int(8) NOT NULL,
  `korisnickoIme` varchar(20) NOT NULL,
  `korisnickaSifra` varchar(20) NOT NULL,
  `ime` varchar(20) NOT NULL,
  `prezime` varchar(20) NOT NULL,
  `mail` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `korisnik` */

insert  into `korisnik`(`userId`,`korisnickoIme`,`korisnickaSifra`,`ime`,`prezime`,`mail`) values (1,'ivan','1234','ivan','bogdanovic',NULL);
insert  into `korisnik`(`userId`,`korisnickoIme`,`korisnickaSifra`,`ime`,`prezime`,`mail`) values (2,'nikola','1234','nikola','filipovic','nikola@gmail.com');
insert  into `korisnik`(`userId`,`korisnickoIme`,`korisnickaSifra`,`ime`,`prezime`,`mail`) values (3,'marko','1234','marko','markovic','marko@gmail.com');
insert  into `korisnik`(`userId`,`korisnickoIme`,`korisnickaSifra`,`ime`,`prezime`,`mail`) values (4,'ana','1234','ana','anic','ana@gmail.com');

/*Table structure for table `lekar` */

CREATE TABLE `lekar` (
  `userId` int(8) NOT NULL,
  `vrstaLekara` varchar(20) NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `lekar_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lekar` */

insert  into `lekar`(`userId`,`vrstaLekara`) values (1,'opste prakse');
insert  into `lekar`(`userId`,`vrstaLekara`) values (3,'hirurg');

/*Table structure for table `osiguranolice` */

CREATE TABLE `osiguranolice` (
  `userId` int(8) NOT NULL,
  `jmbg` varchar(20) NOT NULL,
  `nadlezniLekar` int(8) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `osiguranolice_ibfk_2` (`nadlezniLekar`),
  CONSTRAINT `osiguranolice_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `osiguranolice_ibfk_2` FOREIGN KEY (`nadlezniLekar`) REFERENCES `korisnik` (`userId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `osiguranolice` */

insert  into `osiguranolice`(`userId`,`jmbg`,`nadlezniLekar`) values (2,'11111',1);

/*Table structure for table `pregled` */

CREATE TABLE `pregled` (
  `pregledId` int(8) NOT NULL AUTO_INCREMENT,
  `osiguranoLice` int(8) NOT NULL,
  `medicinskaSestra` int(8) NOT NULL,
  `termin` datetime NOT NULL,
  `stanje` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pregledId`),
  KEY `osiguranoLice` (`osiguranoLice`),
  KEY `medicinskaSestra` (`medicinskaSestra`),
  CONSTRAINT `pregled_ibfk_1` FOREIGN KEY (`osiguranoLice`) REFERENCES `korisnik` (`userId`) ON UPDATE CASCADE,
  CONSTRAINT `pregled_ibfk_2` FOREIGN KEY (`medicinskaSestra`) REFERENCES `korisnik` (`userId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pregled` */

/*Table structure for table `raspored` */

CREATE TABLE `raspored` (
  `rasporedId` int(16) NOT NULL AUTO_INCREMENT,
  `lekarId` int(8) NOT NULL,
  `datum` datetime NOT NULL,
  `stanje` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rasporedId`),
  KEY `lekarId` (`lekarId`),
  CONSTRAINT `raspored_ibfk_1` FOREIGN KEY (`lekarId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `raspored` */

insert  into `raspored`(`rasporedId`,`lekarId`,`datum`,`stanje`) values (1,1,'2017-09-19 08:30:00','SLOBODAN');
insert  into `raspored`(`rasporedId`,`lekarId`,`datum`,`stanje`) values (2,1,'2017-09-20 08:30:00','SLOBODAN');
insert  into `raspored`(`rasporedId`,`lekarId`,`datum`,`stanje`) values (3,1,'2017-09-20 13:00:00','SLOBODAN');
insert  into `raspored`(`rasporedId`,`lekarId`,`datum`,`stanje`) values (4,1,'2017-09-20 11:30:00','SLOBODAN');

/*Table structure for table `sestra` */

CREATE TABLE `sestra` (
  `userId` int(8) NOT NULL,
  `tipSestre` varchar(20) NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `sestra_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sestra` */

insert  into `sestra`(`userId`,`tipSestre`) values (4,'glavna');

/*Table structure for table `uloge` */

CREATE TABLE `uloge` (
  `idUloge` int(8) NOT NULL,
  `nazivUloge` varchar(20) NOT NULL,
  PRIMARY KEY (`idUloge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `uloge` */

insert  into `uloge`(`idUloge`,`nazivUloge`) values (1,'OSIGURANO_LICE');
insert  into `uloge`(`idUloge`,`nazivUloge`) values (2,'SESTRA');
insert  into `uloge`(`idUloge`,`nazivUloge`) values (3,'DOKTOR');

/*Table structure for table `useruloga` */

CREATE TABLE `useruloga` (
  `userId` int(8) NOT NULL,
  `ulogaId` int(8) NOT NULL,
  PRIMARY KEY (`userId`,`ulogaId`),
  KEY `ulogaId` (`ulogaId`),
  CONSTRAINT `useruloga_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `useruloga_ibfk_2` FOREIGN KEY (`ulogaId`) REFERENCES `uloge` (`idUloge`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `useruloga` */

insert  into `useruloga`(`userId`,`ulogaId`) values (2,1);
insert  into `useruloga`(`userId`,`ulogaId`) values (4,2);
insert  into `useruloga`(`userId`,`ulogaId`) values (1,3);
insert  into `useruloga`(`userId`,`ulogaId`) values (3,3);

/*Table structure for table `zahtev` */

CREATE TABLE `zahtev` (
  `zahtevId` int(8) NOT NULL AUTO_INCREMENT,
  `osiguranoLiceId` int(8) NOT NULL,
  `stanje` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`zahtevId`),
  KEY `osiguranoLiceId` (`osiguranoLiceId`),
  CONSTRAINT `zahtev_ibfk_1` FOREIGN KEY (`osiguranoLiceId`) REFERENCES `korisnik` (`userId`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `zahtev` */

insert  into `zahtev`(`zahtevId`,`osiguranoLiceId`,`stanje`) values (2,2,'NOVI_ZAHTEV_ZA_PREGLEDOM');
insert  into `zahtev`(`zahtevId`,`osiguranoLiceId`,`stanje`) values (3,2,'NOVI_ZAHTEV_ZA_PREGLEDOM');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
