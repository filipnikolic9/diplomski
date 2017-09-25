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

/*Table structure for table `lekar` */

CREATE TABLE `lekar` (
  `userId` int(8) NOT NULL,
  `vrstaLekara` varchar(20) NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `lekar_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

/*Table structure for table `pregled` */

CREATE TABLE `pregled` (
  `pregledId` int(8) NOT NULL,
  `osiguranoLice` int(8) NOT NULL,
  `medicinskaSestra` int(8) NOT NULL,
  `termin` datetime NOT NULL,
  `lokacija` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`pregledId`),
  KEY `osiguranoLice` (`osiguranoLice`),
  KEY `medicinskaSestra` (`medicinskaSestra`),
  CONSTRAINT `pregled_ibfk_1` FOREIGN KEY (`osiguranoLice`) REFERENCES `korisnik` (`userId`) ON UPDATE CASCADE,
  CONSTRAINT `pregled_ibfk_2` FOREIGN KEY (`medicinskaSestra`) REFERENCES `korisnik` (`userId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `raspored` */

CREATE TABLE `raspored` (
  `rasporedId` int(16) NOT NULL,
  `lekarId` int(8) NOT NULL,
  `datum` datetime NOT NULL,
  `stanje` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rasporedId`),
  KEY `lekarId` (`lekarId`),
  CONSTRAINT `raspored_ibfk_1` FOREIGN KEY (`lekarId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `sestra` */

CREATE TABLE `sestra` (
  `userId` int(8) NOT NULL,
  `tipSestre` varchar(20) NOT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `sestra_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `uloge` */

CREATE TABLE `uloge` (
  `idUloge` int(8) NOT NULL,
  `nazivUloge` varchar(20) NOT NULL,
  PRIMARY KEY (`idUloge`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `useruloga` */

CREATE TABLE `useruloga` (
  `userId` int(8) NOT NULL,
  `ulogaId` int(8) NOT NULL,
  PRIMARY KEY (`userId`,`ulogaId`),
  KEY `ulogaId` (`ulogaId`),
  CONSTRAINT `useruloga_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `korisnik` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `useruloga_ibfk_2` FOREIGN KEY (`ulogaId`) REFERENCES `uloge` (`idUloge`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Table structure for table `zahtev` */

CREATE TABLE `zahtev` (
  `zahtevId` int(8) NOT NULL,
  `osiguranoLiceId` int(8) NOT NULL,
  `stanje` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`zahtevId`),
  KEY `osiguranoLiceId` (`osiguranoLiceId`),
  CONSTRAINT `zahtev_ibfk_1` FOREIGN KEY (`osiguranoLiceId`) REFERENCES `korisnik` (`userId`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
