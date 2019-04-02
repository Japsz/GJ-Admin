/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `idadmin` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idadmin`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: convenio
# ------------------------------------------------------------

DROP TABLE IF EXISTS `convenio`;
CREATE TABLE `convenio` (
  `idconvenio` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `html` mediumtext NOT NULL,
  PRIMARY KEY (`idconvenio`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: convinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `convinfo`;
CREATE TABLE `convinfo` (
  `idinfo` int(11) NOT NULL AUTO_INCREMENT,
  `idconv` int(11) NOT NULL,
  `rut` varchar(12) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `ape` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `addr` varchar(50) DEFAULT NULL,
  `comuna` varchar(50) DEFAULT NULL,
  `zona` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idinfo`),
  KEY `convinfo_ibfk_1` (`idconv`),
  CONSTRAINT `convinfo_ibfk_1` FOREIGN KEY (`idconv`) REFERENCES `convenio` (`idconvenio`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: evento
# ------------------------------------------------------------

DROP TABLE IF EXISTS `evento`;
CREATE TABLE `evento` (
  `idevento` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estado` varchar(6) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `obs` mediumtext,
  `asistentes` int(11) DEFAULT NULL,
  PRIMARY KEY (`idevento`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: jumper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jumper`;
CREATE TABLE `jumper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `fnac` date NOT NULL,
  `correo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 33 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: pjumper
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pjumper`;
CREATE TABLE `pjumper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `fnac` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `iduser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE = InnoDB AUTO_INCREMENT = 3 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: vip
# ------------------------------------------------------------

DROP TABLE IF EXISTS `vip`;
CREATE TABLE `vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `fnac` date DEFAULT NULL,
  `date_f` datetime NOT NULL,
  `ended` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 562 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: visita
# ------------------------------------------------------------

DROP TABLE IF EXISTS `visita`;
CREATE TABLE `visita` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idjumper` int(11) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `date_g` date NOT NULL,
  `status` varchar(30) DEFAULT NULL,
  `idinfo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idjumper` (`idjumper`),
  KEY `idinfo_idx` (`idinfo`),
  CONSTRAINT `idinfo` FOREIGN KEY (`idinfo`) REFERENCES `convinfo` (`idinfo`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `visita_ibfk_1` FOREIGN KEY (`idjumper`) REFERENCES `jumper` (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 562 DEFAULT CHARSET = utf8;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: admin
# ------------------------------------------------------------

INSERT INTO
  `admin` (`idadmin`, `username`, `password`)
VALUES
  (1, 'jeje', 'jojo');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: convenio
# ------------------------------------------------------------

INSERT INTO
  `convenio` (`idconvenio`, `name`, `html`)
VALUES
  (1, 'Gasvalpo', '');
INSERT INTO
  `convenio` (`idconvenio`, `name`, `html`)
VALUES
  (2, 'Yapo', '');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: convinfo
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: evento
# ------------------------------------------------------------

INSERT INTO
  `evento` (
    `idevento`,
    `nom`,
    `tipo`,
    `fecha`,
    `estado`,
    `duration`,
    `obs`,
    `asistentes`
  )
VALUES
  (
    7,
    'jejejej1',
    'jojojojo',
    '2018-01-03 17:50:00',
    'fin',
    78,
    'me gusta el pan con queso@@@ajpa',
    1
  );
INSERT INTO
  `evento` (
    `idevento`,
    `nom`,
    `tipo`,
    `fecha`,
    `estado`,
    `duration`,
    `obs`,
    `asistentes`
  )
VALUES
  (
    11,
    'hoy',
    'gh',
    '2018-03-13 12:00:00',
    'fin',
    60,
    'watwea@@@jajjaaa',
    1
  );
INSERT INTO
  `evento` (
    `idevento`,
    `nom`,
    `tipo`,
    `fecha`,
    `estado`,
    `duration`,
    `obs`,
    `asistentes`
  )
VALUES
  (
    12,
    'jejejejejejejjejeje',
    '1',
    '2019-12-01 20:15:00',
    'new',
    60,
    '',
    NULL
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: jumper
# ------------------------------------------------------------

INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (1, 'juana', 'pereira', '1995-12-01', 'fel@ipit.op');
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (2, 'asdd', 'ddd', '2011-12-27', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (
    3,
    'juanoso',
    'perezoso',
    '2002-07-31',
    'cachipun@vm.cl'
  );
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (4, 'rata', 'inmunda', '1997-08-14', 'fila@nike.com');
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (5, 'as', 'ketchup', '1998-09-12', 'fe@enti.com');
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (6, 'jean', 'valjan', '1437-03-11', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (7, 'Juan', 'Perez', '1992-08-02', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (8, 'Juan', 'repez', '1995-02-11', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (9, 'hola', 'jeje', '1995-12-11', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (10, '222', '222', '1990-11-11', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (11, 'qqqq', 'qqq', '2020-11-11', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (12, 'asdd', 'deded', '2330-12-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (13, 'a', 'a', '1111-01-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (14, 'N1', 'N1', '1111-11-11', 'CORREOCOLEGIO@SI.CL');
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (
    15,
    'COLE',
    'COLE',
    '1112-11-11',
    'CORREOCOLEGIO@SI.CL'
  );
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (16, 'asd', 'sdd', '2017-10-21', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (17, 'asss', '12222', '2018-05-12', 'hola@gmail.com');
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (18, 'benllamin', 'meneses', '2019-03-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (19, 'benjamin', 'meneses', '1995-12-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (20, 'luis', 'bb', '1993-06-10', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (21, 'benjamin', 'meneses', '1995-12-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (22, 'benllamin', 'meneses', '2019-03-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (23, 'luis', 'bb', '1993-06-10', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (24, 'benjamin', 'meneses', '1995-12-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (25, 'benllamin', 'meneses', '2019-03-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (26, 'luis', 'bb', '1993-06-10', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (27, 'luis', 'bb', '1993-06-10', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (28, 'benjamin', 'meneses', '1995-12-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (29, 'benllamin', 'meneses', '2019-03-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (30, 'benllamin', 'meneses', '2019-03-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (31, 'benllamin', 'meneses', '2019-03-01', NULL);
INSERT INTO
  `jumper` (`id`, `name`, `last_name`, `fnac`, `correo`)
VALUES
  (32, 'benjamin', 'meneses', '1995-12-01', NULL);

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: pjumper
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: user
# ------------------------------------------------------------

INSERT INTO
  `user` (`iduser`, `username`, `password`)
VALUES
  (1, 'jeje', 'jojo');
INSERT INTO
  `user` (`iduser`, `username`, `password`)
VALUES
  (2, 'monitor', 'jojo');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: vip
# ------------------------------------------------------------


# ------------------------------------------------------------
# DATA DUMP FOR TABLE: visita
# ------------------------------------------------------------

INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (1, 1, 125, '2017-04-20', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (2, 3, 125, '2017-05-18', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (3, 4, 35, '2017-05-18', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (4, 1, 35, '2017-05-18', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (5, 1, 35, '2017-05-18', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (6, 1, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (7, 4, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (8, 5, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (9, 1, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (10, 5, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (11, 2, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (12, 5, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (13, 6, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (14, 1, 185, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (15, 3, 185, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (16, 6, 185, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (17, 1, 125, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (18, 5, 125, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (19, 4, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (20, 5, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (21, 1, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (22, 6, 35, '2017-06-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (23, 5, 35, '2017-07-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (24, 6, 35, '2017-07-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (28, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (29, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (30, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (31, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (32, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (33, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (34, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (35, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (36, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (37, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (38, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (39, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (40, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (41, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (42, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (43, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (44, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (45, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (46, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (47, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (48, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (49, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (50, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (51, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (52, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (53, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (54, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (55, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (56, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (57, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (58, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (59, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (60, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (61, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (62, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (63, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (64, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (65, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (66, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (67, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (68, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (69, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (70, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (71, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (72, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (73, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (74, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (75, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (76, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (77, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (78, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (79, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (80, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (81, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (82, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (83, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (84, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (85, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (86, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (87, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (88, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (89, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (90, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (91, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (92, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (93, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (94, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (95, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (96, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (97, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (98, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (99, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (100, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (101, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (102, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (103, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (104, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (105, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (106, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (107, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (108, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (109, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (110, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (111, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (112, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (113, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (114, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (115, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (116, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (117, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (118, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (119, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (120, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (121, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (122, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (123, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (124, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (125, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (126, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (127, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (128, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (129, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (130, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (131, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (132, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (133, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (134, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (135, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (136, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (137, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (138, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (139, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (140, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (141, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (142, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (143, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (144, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (145, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (146, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (147, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (148, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (149, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (150, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (151, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (152, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (153, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (154, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (155, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (156, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (157, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (158, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (159, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (160, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (161, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (162, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (163, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (164, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (165, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (166, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (167, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (168, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (169, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (170, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (171, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (172, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (173, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (174, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (175, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (176, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (177, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (178, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (179, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (180, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (181, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (182, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (183, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (184, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (185, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (186, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (187, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (188, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (189, 9, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (190, 10, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (191, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (192, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (193, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (194, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (195, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (196, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (197, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (198, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (199, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (200, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (201, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (202, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (203, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (204, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (205, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (206, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (207, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (208, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (209, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (210, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (211, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (212, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (213, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (214, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (215, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (216, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (217, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (218, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (219, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (220, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (221, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (222, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (223, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (224, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (225, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (226, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (227, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (228, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (229, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (230, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (231, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (232, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (233, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (234, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (235, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (236, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (237, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (238, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (239, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (240, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (241, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (242, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (243, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (244, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (245, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (246, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (247, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (248, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (249, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (250, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (251, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (252, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (253, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (254, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (255, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (256, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (257, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (258, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (259, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (260, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (261, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (262, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (263, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (264, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (265, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (266, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (267, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (268, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (269, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (270, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (271, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (272, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (273, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (274, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (275, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (276, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (277, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (278, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (279, 8, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (280, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (281, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (282, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (283, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (284, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (285, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (286, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (287, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (288, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (289, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (290, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (291, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (292, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (293, 7, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (294, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (295, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (296, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (297, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (298, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (299, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (300, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (301, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (302, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (303, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (304, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (305, 3, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (306, 6, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (307, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (308, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (309, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (310, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (311, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (312, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (313, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (314, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (315, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (316, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (317, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (318, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (319, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (320, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (321, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (322, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (323, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (324, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (325, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (326, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (327, 11, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (328, 12, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (329, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (330, 2, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (331, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (332, 13, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (333, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (334, 1, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (335, 4, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (336, 5, 35, '2017-09-01', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (337, 12, 35, '2017-09-01', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (338, 13, 35, '2017-09-01', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (339, 2, 35, '2017-09-01', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (340, 5, 35, '2017-09-01', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (341, 4, 35, '2017-09-01', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (342, 1, 35, '2017-09-01', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (343, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (344, 3, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (345, 6, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (346, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (347, 8, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (348, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (349, 6, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (350, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (351, 8, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (352, 2, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (353, 5, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (354, 12, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (355, 13, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (356, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (357, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (358, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (359, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (360, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (361, 2, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (362, 5, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (363, 12, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (364, 13, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (365, 4, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (366, 9, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (367, 11, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (368, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (369, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (370, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (371, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (372, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (373, 2, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (374, 5, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (375, 12, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (376, 13, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (377, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (378, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (379, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (380, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (381, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (382, 2, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (383, 5, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (384, 12, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (385, 13, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (386, 4, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (387, 9, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (388, 11, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (389, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (390, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (391, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (392, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (393, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (394, 2, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (395, 5, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (396, 12, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (397, 13, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (398, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (399, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (400, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (401, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (402, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (403, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (404, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (405, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (406, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (407, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (408, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (409, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (410, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (411, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (412, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (413, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (414, 3, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (415, 6, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (416, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (417, 8, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (418, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (419, 3, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (420, 6, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (421, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (422, 8, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (423, 2, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (424, 5, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (425, 12, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (426, 13, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (427, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (428, 4, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (429, 5, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (430, 9, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (431, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (432, 3, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (433, 6, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (434, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (435, 8, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (436, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (437, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (438, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (439, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (440, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (441, 2, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (442, 5, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (443, 12, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (444, 13, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (445, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (446, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (447, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (448, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (449, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (450, 2, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (451, 5, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (452, 12, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (453, 13, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (454, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (455, 4, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (456, 5, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (457, 1, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (458, 3, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (459, 6, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (460, 7, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (461, 8, 35, '2017-09-05', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (462, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (463, 8, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (464, 2, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (465, 5, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (466, 12, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (467, 13, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (468, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (469, 3, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (470, 6, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (471, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (472, 8, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (473, 2, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (474, 5, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (475, 12, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (476, 13, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (477, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (478, 4, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (479, 5, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (480, 1, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (481, 3, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (482, 6, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (483, 7, 35, '2017-09-05', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (484, 4, 35, '2017-09-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (485, 4, 185, '2017-09-06', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (486, 15, 35, '2017-09-27', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (487, 1, 35, '2017-10-03', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (488, 5, 35, '2017-10-03', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (489, 1, 35, '2017-10-03', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (490, 5, 35, '2017-10-03', 'inprog', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (491, 1, 35, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (492, 5, 35, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (493, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (494, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (495, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (496, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (497, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (498, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (499, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (500, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (501, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (502, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (503, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (504, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (505, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (506, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (507, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (508, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (509, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (510, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (511, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (512, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (513, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (514, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (515, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (516, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (517, 1, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (518, 4, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (519, 5, 95, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (520, 5, 35, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (521, 5, 35, '2017-10-03', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (522, 5, 35, '2017-11-09', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (523, 13, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (524, 16, 185, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (525, 4, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (526, 2, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (527, 5, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (528, 16, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (529, 5, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (530, 13, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (531, 16, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (532, 4, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (533, 4, 95, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (534, 4, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (535, 4, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (536, 4, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (537, 4, 65, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (538, 2, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (539, 5, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (540, 12, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (541, 13, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (542, 16, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (543, 12, 365, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (544, 12, 365, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (545, 12, 245, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (546, 5, 35, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (547, 16, 185, '2017-11-22', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (548, 1, 35, '2017-12-13', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (549, 4, 35, '2017-12-13', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (550, 17, 65, '2018-05-23', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (551, 17, 35, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (552, 17, 35, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (553, 17, 35, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (554, 17, 65, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (555, 17, 65, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (556, 17, 35, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (557, 17, 65, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (558, 17, 35, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (559, 17, 35, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (560, 17, 35, '2018-07-19', 'ended', NULL);
INSERT INTO
  `visita` (
    `id`,
    `idjumper`,
    `duration`,
    `date_g`,
    `status`,
    `idinfo`
  )
VALUES
  (561, 28, 35, '2019-03-20', 'ended', NULL);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
