-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.18-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              9.4.0.5169
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Copiando estrutura do banco de dados para bcofio
CREATE DATABASE IF NOT EXISTS `bcofio` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bcofio`;

-- Copiando estrutura para tabela bcofio.bonus
CREATE TABLE IF NOT EXISTS `bonus` (
  `Num_Lanc` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Func` int(11) NOT NULL,
  `Data_Bonus` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Val_Bonus` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Num_Lanc`),
  KEY `FK_Bonus` (`Cod_Func`),
  CONSTRAINT `FK_Bonus` FOREIGN KEY (`Cod_Func`) REFERENCES `funcionario` (`Cod_Func`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.bonus: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `bonus` DISABLE KEYS */;
/*!40000 ALTER TABLE `bonus` ENABLE KEYS */;

-- Copiando estrutura para função bcofio.calcularSoma
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `calcularSoma`(n1 INT, n2 INT) RETURNS int(11)
    DETERMINISTIC
BEGIN 
	  
	  
	     
     RETURN (n1 + n2);
     
    END// 
DELIMITER ;

-- Copiando estrutura para tabela bcofio.cidade
CREATE TABLE IF NOT EXISTS `cidade` (
  `Cod_Cid` int(11) NOT NULL AUTO_INCREMENT,
  `Sigla_Est` char(2) NOT NULL,
  `Nome_Cid` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Cid`),
  UNIQUE KEY `UQ_Cid` (`Sigla_Est`,`Nome_Cid`),
  CONSTRAINT `FK_Cid` FOREIGN KEY (`Sigla_Est`) REFERENCES `estado` (`Sigla_Est`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.cidade: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `cidade` DISABLE KEYS */;
INSERT INTO `cidade` (`Cod_Cid`, `Sigla_Est`, `Nome_Cid`) VALUES
	(11, 'PR', 'CAMBÉ'),
	(9, 'PR', 'IBAITI'),
	(10, 'PR', 'LONDRINA'),
	(3, 'SP', 'Americana'),
	(4, 'SP', 'Araçatuddba'),
	(1, 'SP', 'Araraquara'),
	(5, 'SP', 'Fernandópolis'),
	(12, 'SP', 'ITARARÉ'),
	(6, 'SP', 'Jundiaí'),
	(2, 'SP', 'Ourinhos'),
	(8, 'SP', 'São José do Rio Preto'),
	(7, 'SP', 'Sorocaba');
/*!40000 ALTER TABLE `cidade` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `Cod_Cli` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_TipoCli` int(11) NOT NULL,
  `Nome_Cli` varchar(100) NOT NULL,
  `Data_CadCli` varchar(8) NOT NULL,
  `Renda_Cli` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Sexo_Cli` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Cod_Cli`),
  KEY `FK_Cli` (`Cod_TipoCli`),
  CONSTRAINT `FK_Cli` FOREIGN KEY (`Cod_TipoCli`) REFERENCES `tipocli` (`Cod_TipoCli`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.cliente: ~63 rows (aproximadamente)
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` (`Cod_Cli`, `Cod_TipoCli`, `Nome_Cli`, `Data_CadCli`, `Renda_Cli`, `Sexo_Cli`) VALUES
	(1, 1, 'João Carlos', '01011999', 10000.00, 'M'),
	(2, 1, 'Sergio Delfino', '02021999', 10000.00, 'M'),
	(3, 1, 'Helena Oliveira', '03031999', 9000.00, 'F'),
	(4, 1, 'Roberta Oliveira', '04041999', 8000.00, 'F'),
	(5, 2, 'Renata Leão', '05051999', 5000.00, 'F'),
	(6, 2, 'Jairo Gato', '06061999', 4000.00, 'M'),
	(7, 3, 'Fernando Gato', '07071999', 3000.00, 'M'),
	(8, 3, 'Giovanna Silva Leão', '08081999', 3000.00, 'F'),
	(9, 4, 'Lucas Ribeiro', '09091999', 2000.00, 'M'),
	(10, 3, 'Helder Leão', '10101999', 2000.00, 'M'),
	(11, 2, 'Olga Cristina Bonfiglioli', '11111999', 8000.00, 'F'),
	(12, 1, 'Maria Cristina Bonfiglioli Martins de Souza Santos', '12121999', 5000.00, 'F'),
	(13, 1, 'Salvador Eneas Feredico', '01131999', 9000.00, 'M'),
	(14, 1, 'Dolores Gerreiro Martins', '02142000', 8000.00, 'F'),
	(15, 1, 'Fabiana Bataglin', '03152000', 5000.00, 'F'),
	(16, 2, 'Aparecida Ribeiro', '04162000', 3000.00, 'F'),
	(17, 3, 'Reginaldo Ribeiro', '05172000', 4000.00, 'M'),
	(18, 4, 'Suellen M Nunes', '06182000', 3000.00, 'F'),
	(19, 1, 'Carlos Alberto', '07192000', 2000.00, 'M'),
	(20, 2, 'Roberto Arruda', '08202000', 1000.00, 'M'),
	(21, 3, 'Sandra Medeiros', '09212000', 1500.00, 'F'),
	(22, 4, 'Alice Santos', '10222001', 2500.00, 'F'),
	(23, 5, 'Valter Sanches', '11232001', 3500.00, 'M'),
	(24, 6, 'Pascoal Babiera', '12242001', 1525.00, 'M'),
	(25, 1, 'Lucia Bacalla', '01252001', 6321.00, 'F'),
	(26, 3, 'Maria Belido', '02262001', 5412.00, 'F'),
	(27, 4, 'Hamilton Belico', '03262001', 2563.00, 'M'),
	(28, 5, 'Alberto Belli', '04272001', 2412.00, 'M'),
	(29, 6, 'Marcia Bueno', '05282001', 1235.00, 'F'),
	(30, 1, 'Maria Catta', '06292001', 1236.00, 'F'),
	(31, 2, 'Carlos Cattaneo', '07302001', 1253.00, 'M'),
	(32, 3, 'Andre Caula', '08312001', 1524.00, 'M'),
	(33, 4, 'Fabia Dávello', '09012001', 1236.00, 'F'),
	(34, 5, 'Afonso Ferraro', '10022001', 1256.00, 'M'),
	(35, 6, 'Akemi Fukamizu', '11032001', 1452.00, 'F'),
	(36, 1, 'Bernadino Gomes', '12042001', 11785.00, 'M'),
	(37, 2, 'Regiani Hoki', '01052001', 1524.00, 'F'),
	(38, 3, 'Valter Koszura', '02062001', 1256.00, 'M'),
	(39, 4, 'Alexandre Kozeki', '03072001', 1225.00, 'M'),
	(40, 5, 'Vittorio Lannocca', '04082001', 1253.00, 'M'),
	(41, 6, 'Domingos Lanini', '05092002', 1253.00, 'M'),
	(42, 1, 'Paulo Mello', '06102001', 10000.00, 'M'),
	(43, 2, 'Zilda Mellone', '07112001', 8000.00, 'F'),
	(44, 3, 'Marlene Moura', '08122001', 3000.00, 'F'),
	(45, 4, 'Francisca Oliveira', '09132001', 2300.00, 'F'),
	(46, 5, 'Marlene Pereira', '10142001', 2562.00, 'F'),
	(47, 6, 'Milton Pereira', '11152001', 2563.00, 'M'),
	(48, 1, 'Ligia Ramos', '12162001', 9200.00, 'F'),
	(49, 2, 'Mariangela Ramos', '01172001', 7000.00, 'F'),
	(50, 3, 'Dora Romariz', '02182001', 5263.00, 'F'),
	(51, 4, 'Paulino Romelli', '03192001', 5428.00, 'M'),
	(52, 5, 'Fernando Sampaio', '04202001', 2023.00, 'M'),
	(53, 6, 'José Sampaio', '05212001', 2235.00, 'M'),
	(54, 1, 'Vicenzo Senatori', '06222001', 7000.00, 'M'),
	(55, 2, 'Geraldo Senedeze', '07232001', 2531.00, 'M'),
	(56, 3, 'Mauro Soares', '08242001', 2532.00, 'M'),
	(57, 4, 'Paulo Souza', '09252001', 2542.00, 'M'),
	(58, 5, 'Emidio Trifoni', '10262001', 2563.00, 'M'),
	(59, 6, 'Heitor Vernile', '11272001', 2542.00, 'M'),
	(60, 1, 'Carlos Saura', '12282001', 6000.00, 'M'),
	(61, 2, 'Angelino Saullo', '01292001', 5000.00, 'M'),
	(62, 3, 'Aldo Savazzoni', '02282001', 4000.00, 'M'),
	(63, 3, 'Zzzz zzzz ', '02282001', 4000.00, 'M'),
	(65, 2, 'Gui Pilates', '21052020', 80000.00, 'M'),
	(71, 2, 'Gui Pilates AVANÇADAUM', '21052020', 80000.00, 'M');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;

-- Copiando estrutura para view bcofio.clientepontuacao
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `clientepontuacao` (
	`Cod_Func` INT(11) NOT NULL,
	`Nome_Func` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`Data_Pto` TIMESTAMP NULL,
	`Pto_Func` DECIMAL(4,2) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para tabela bcofio.conjuge
CREATE TABLE IF NOT EXISTS `conjuge` (
  `Cod_Cli` int(11) NOT NULL,
  `Nome_Conj` char(30) NOT NULL,
  `Renda_Conj` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Sexo_Conj` char(1) NOT NULL DEFAULT 'M',
  PRIMARY KEY (`Cod_Cli`),
  CONSTRAINT `FK_Conj` FOREIGN KEY (`Cod_Cli`) REFERENCES `cliente` (`Cod_Cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.conjuge: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `conjuge` DISABLE KEYS */;
INSERT INTO `conjuge` (`Cod_Cli`, `Nome_Conj`, `Renda_Conj`, `Sexo_Conj`) VALUES
	(1, 'Renata', 3000.00, 'F'),
	(2, 'Helena', 5000.00, 'F'),
	(3, 'Daniel', 6000.00, 'M'),
	(4, 'Tarcisio', 1000.00, 'M'),
	(5, 'João Carlos', 7000.00, 'M'),
	(6, 'Carla', 9000.00, 'M'),
	(7, 'Ana Lucia', 3000.00, 'F'),
	(25, 'Vagner', 55.00, 'M');
/*!40000 ALTER TABLE `conjuge` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.cor
CREATE TABLE IF NOT EXISTS `cor` (
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.cor: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `cor` DISABLE KEYS */;
INSERT INTO `cor` (`descricao`) VALUES
	('CREATE USER  \'2021_1s_aluno1 \'@\'%\' IDENTIFIED BY  \'123456 \''),
	('CREATE USER  \'2021_1s_aluno2 \'@\'%\' IDENTIFIED BY  \'123456 \'');
/*!40000 ALTER TABLE `cor` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.credito
CREATE TABLE IF NOT EXISTS `credito` (
  `Num_Lanc` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Cli` int(11) NOT NULL,
  `Cred_Cli` decimal(10,2) NOT NULL,
  `Data_CredCli` date NOT NULL,
  PRIMARY KEY (`Num_Lanc`),
  KEY `FK_Cred` (`Cod_Cli`),
  CONSTRAINT `FK_Cred` FOREIGN KEY (`Cod_Cli`) REFERENCES `cliente` (`Cod_Cli`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.credito: ~64 rows (aproximadamente)
/*!40000 ALTER TABLE `credito` DISABLE KEYS */;
INSERT INTO `credito` (`Num_Lanc`, `Cod_Cli`, `Cred_Cli`, `Data_CredCli`) VALUES
	(1, 1, 1000.00, '2018-03-12'),
	(2, 1, 1000.00, '2018-03-12'),
	(3, 1, 2000.00, '2019-03-10'),
	(4, 1, 3000.00, '2019-03-10'),
	(5, 2, 1000.00, '2019-03-10'),
	(6, 3, 45000.00, '2019-03-10'),
	(7, 4, 1000.00, '2019-03-10'),
	(8, 5, 1000.00, '2019-03-10'),
	(9, 6, 1000.00, '2019-03-10'),
	(10, 7, 1000.00, '2018-03-10'),
	(11, 8, 1000.00, '2019-03-10'),
	(12, 9, 1000.00, '2019-03-10'),
	(13, 10, 1000.00, '2019-03-10'),
	(14, 11, 1000.00, '2018-03-04'),
	(15, 12, 1000.00, '2021-02-05'),
	(16, 13, 1000.00, '2021-02-05'),
	(17, 14, 1000.00, '2021-02-05'),
	(18, 15, 1000.00, '2021-02-05'),
	(19, 16, 1000.00, '2021-02-05'),
	(20, 17, 1000.00, '2021-02-05'),
	(21, 18, 1000.00, '2021-02-05'),
	(22, 19, 1000.00, '2021-02-05'),
	(23, 20, 1000.00, '2021-02-05'),
	(24, 21, 1000.00, '2021-02-05'),
	(25, 22, 1000.00, '2021-02-05'),
	(26, 23, 1000.00, '2021-02-05'),
	(27, 24, 1000.00, '2021-02-05'),
	(28, 25, 1000.00, '2021-02-05'),
	(29, 26, 1000.00, '2021-02-05'),
	(30, 27, 1000.00, '2018-03-10'),
	(31, 28, 1000.00, '2018-03-11'),
	(32, 29, 1000.00, '2020-03-12'),
	(33, 30, 1000.00, '2020-03-12'),
	(34, 31, 2500.00, '2020-03-12'),
	(35, 32, 1000.00, '2020-03-12'),
	(36, 33, 1000.00, '2020-03-12'),
	(37, 34, 1000.00, '2020-03-12'),
	(38, 35, 5000.00, '2020-03-12'),
	(39, 36, 1000.00, '2020-03-12'),
	(40, 37, 1000.00, '2020-03-12'),
	(41, 38, 1000.00, '2020-03-12'),
	(42, 39, 7000.00, '2018-03-12'),
	(43, 40, 1000.00, '2018-03-03'),
	(44, 41, 1000.00, '2018-03-04'),
	(45, 42, 1000.00, '2018-03-05'),
	(46, 43, 1000.00, '2018-03-06'),
	(47, 44, 1000.00, '2018-03-07'),
	(48, 45, 1000.00, '2018-03-08'),
	(49, 46, 1000.00, '2018-03-09'),
	(50, 47, 1000.00, '2018-03-10'),
	(51, 48, 1000.00, '2018-03-11'),
	(52, 49, 1000.00, '2018-03-12'),
	(53, 50, 1000.00, '2018-03-03'),
	(54, 51, 4500.00, '2018-03-04'),
	(55, 52, 1000.00, '2018-03-05'),
	(56, 53, 1000.00, '2018-03-06'),
	(57, 54, 1000.00, '2018-03-07'),
	(58, 55, 1000.00, '2018-03-08'),
	(59, 56, 1000.00, '2018-03-09'),
	(60, 57, 1000.00, '2018-03-10'),
	(61, 58, 1900.00, '2018-03-11'),
	(62, 59, 1000.00, '2018-03-11'),
	(63, 60, 1000.00, '2018-03-10'),
	(64, 61, 2200.00, '2018-03-09'),
	(65, 40, 8000.00, '2018-03-10'),
	(66, 48, 1000.00, '2018-03-11');
/*!40000 ALTER TABLE `credito` ENABLE KEYS */;

-- Copiando estrutura para procedure bcofio.criarUsuarios
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `criarUsuarios`()
BEGIN
	DECLARE x INT default 1;	
	DECLARE nome char(60);
	DECLARE senha char(30);
	WHILE x <= 1 do
		set nome = CONCAT('2021_1s_aluno', x);
		set senha = '123456';
		SET @query1 = CONCAT('CREATE USER '," '", nome," '", '@',"'",'%',"'",' IDENTIFIED BY ', " '",  senha, " '");
		#INSERT INTO cor (descricao) values(nome);
		#CREATE USER 'janaina'@'%' IDENTIFIED BY '123456';
		PREPARE stmt FROM @query1; 
		EXECUTE stmt;
		DEALLOCATE PREPARE stmt;
#GRANT select, create, delete, insert, update on 3termo.* to nome@'%' IDENTIFIED By '123456';
#FLUSH PRIVILEGES;
		SET x = x +  1;
	END WHILE;
END//
DELIMITER ;

-- Copiando estrutura para tabela bcofio.dependente
CREATE TABLE IF NOT EXISTS `dependente` (
  `Cod_Dep` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Func` int(11) NOT NULL,
  `Nome_Dep` varchar(100) NOT NULL,
  `Data_NascDep1` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Sexo_Dep` char(1) NOT NULL DEFAULT 'F',
  PRIMARY KEY (`Cod_Dep`),
  KEY `FK_Dep` (`Cod_Func`),
  CONSTRAINT `FK_Dep` FOREIGN KEY (`Cod_Func`) REFERENCES `funcionario` (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.dependente: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` (`Cod_Dep`, `Cod_Func`, `Nome_Dep`, `Data_NascDep1`, `Sexo_Dep`) VALUES
	(1, 3, 'Sebastiana Maria', '2009-12-31 23:00:00', 'F'),
	(2, 3, 'Sebastião Mario', '2009-12-31 23:00:00', 'M'),
	(3, 4, 'Aurea Virtude', '2009-12-31 23:00:00', 'F'),
	(4, 4, 'Aureo Visture', '2009-12-31 23:00:00', 'M'),
	(5, 7, 'Pedro da Silva', '2009-12-31 23:00:00', 'F'),
	(6, 7, 'Alvares da Silva', '2009-12-31 23:00:00', 'M'),
	(7, 7, 'Cabral da Silva', '2009-12-31 23:00:00', 'M');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.email
CREATE TABLE IF NOT EXISTS `email` (
  `Num_Lanc` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Cli` int(11) NOT NULL,
  `EMail_Cli` varchar(255) NOT NULL,
  PRIMARY KEY (`Num_Lanc`),
  KEY `FK_Email` (`Cod_Cli`),
  CONSTRAINT `FK_Email` FOREIGN KEY (`Cod_Cli`) REFERENCES `cliente` (`Cod_Cli`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.email: ~30 rows (aproximadamente)
/*!40000 ALTER TABLE `email` DISABLE KEYS */;
INSERT INTO `email` (`Num_Lanc`, `Cod_Cli`, `EMail_Cli`) VALUES
	(1, 1, 'Joaobrasao@Hotmail.com'),
	(2, 1, 'Joaobrasao@bbb.com.br'),
	(3, 1, 'Joaobrasao@xxx.com.br'),
	(4, 1, 'JoaoCarloss@Globo.com.br'),
	(5, 2, 'DanielLeao@uol.com.br'),
	(6, 3, 'HOL@Hotmail.com'),
	(7, 4, 'ROL@Hotmail.com'),
	(8, 5, 'RenataLeao01@Hotmail.com'),
	(9, 5, 'Renata.Leao@Globo.com'),
	(10, 6, 'JairoGato@Bol.com.br'),
	(11, 7, 'FernandoLeao@Hotmil.com'),
	(12, 8, 'GiGi_Leao@Hotmial.com'),
	(13, 9, 'Lucas_Leao@Hotmail.com'),
	(14, 10, 'HelderLeão@Hotmail.com'),
	(15, 11, 'OlgaCBonfiglioli@Hotmail.com'),
	(16, 12, 'MCBMSS@Hotmail.com'),
	(17, 13, 'SEFeredico@Hotmail.com'),
	(18, 14, 'DoloresGMartins@Hotmail.com'),
	(19, 15, 'Fabiana_Bataglin@Hotmail.com'),
	(20, 28, 'Alberto_Belli@Hotmail.com'),
	(21, 29, 'Marcia_Bueno@Hotmail.com'),
	(22, 30, 'MariaCatta@Hotmail.com'),
	(23, 38, 'ValterKoszura@Hotmail.com'),
	(24, 51, 'PaulinoRomelli@Hotmail.com'),
	(25, 52, 'Fernando Sampaio'),
	(26, 53, 'JoséSampaio@uol.com.br'),
	(27, 54, 'VicenzoSenatori@uol.com.br'),
	(28, 55, 'GeraldoSenedeze@uol.com.br'),
	(29, 61, 'AngelinoSaullo@uol.com.br'),
	(30, 62, 'AldoSavazzoni@uol.com.br');
/*!40000 ALTER TABLE `email` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.endereco
CREATE TABLE IF NOT EXISTS `endereco` (
  `Cod_End` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_TipoEnd` int(11) NOT NULL,
  `Cod_Cid` int(11) NOT NULL,
  `Cod_Cli` int(11) NOT NULL,
  `Nome_Rua` varchar(100) NOT NULL,
  `Nome_Bairro` varchar(100) NOT NULL,
  `Compl_End` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Cod_End`),
  KEY `FK_End1` (`Cod_TipoEnd`),
  KEY `FK_End2` (`Cod_Cid`),
  KEY `FK_End3` (`Cod_Cli`),
  CONSTRAINT `FK_End1` FOREIGN KEY (`Cod_TipoEnd`) REFERENCES `tipoend` (`Cod_TipoEnd`),
  CONSTRAINT `FK_End2` FOREIGN KEY (`Cod_Cid`) REFERENCES `cidade` (`Cod_Cid`),
  CONSTRAINT `FK_End3` FOREIGN KEY (`Cod_Cli`) REFERENCES `cliente` (`Cod_Cli`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.endereco: ~50 rows (aproximadamente)
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
INSERT INTO `endereco` (`Cod_End`, `Cod_TipoEnd`, `Cod_Cid`, `Cod_Cli`, `Nome_Rua`, `Nome_Bairro`, `Compl_End`) VALUES
	(1, 1, 1, 1, 'Rua Soraia - 29', 'Vila Santana', NULL),
	(2, 2, 1, 1, 'Rua Macunaima - 192', 'Jd.Europa', NULL),
	(3, 1, 1, 2, 'Rua Mariá - 342', 'Jd. Araguaia', 'Apto. 23'),
	(4, 2, 2, 2, 'Rua Juca - 542', 'Vila Catarina ', 'Apto. 2'),
	(5, 2, 2, 3, 'Pça Marcondes - 542', 'Vila Tereza ', NULL),
	(6, 3, 1, 4, 'Rua Santa Catarina - 1342', 'Vila Osvaldo Cruz', NULL),
	(7, 1, 1, 1, 'Av. Imirim, 325', 'Vila Vilma', NULL),
	(8, 1, 1, 2, 'Rua Clélia, 456', 'Vila Zoraide', NULL),
	(9, 1, 1, 3, 'Rua Pio XI, 938', 'Jd. América', NULL),
	(10, 2, 1, 4, 'Travessa 15, 1200', 'Vila Sonia', NULL),
	(11, 2, 2, 5, 'Av. Sodré, 392', 'Jd. Carnaúba', NULL),
	(12, 2, 3, 6, 'Av Mutinga, 200', 'Parque das Flores', NULL),
	(13, 3, 2, 7, 'Rua Cons. Ribas 594', 'Parque Municipal', NULL),
	(14, 3, 2, 8, 'Rua Maria Belido', 'Parque Industrial', NULL),
	(15, 3, 2, 9, 'Rua Avai 164', 'Vila Maria', NULL),
	(16, 4, 2, 10, 'Rua Bororós, 67', 'Vila Santa Terezinha', NULL),
	(17, 4, 2, 11, 'Rua Jose Pereira, 340', 'Zona da Mata', NULL),
	(18, 4, 3, 12, 'Av. Casa Verde, 450', 'Jd. Botucatu', NULL),
	(19, 4, 4, 13, 'Av Dr Gouveia, 392', 'Jd. Moricatupotá', NULL),
	(20, 5, 3, 14, 'Rua Lucena 184', 'Jd. Canhem BaBa', NULL),
	(21, 5, 3, 15, 'Av. Indianópolis 593', 'Vila Angela', NULL),
	(22, 5, 3, 16, 'Rua Alexandre Duma 486', 'Parque Piributa', NULL),
	(23, 6, 3, 17, 'Rua Maria Júlia 1207', 'Jd. Americanópolis', NULL),
	(24, 6, 3, 18, 'Rua Afonso Meira, 948', 'Parque Cruzeiro do Sul', NULL),
	(25, 6, 3, 19, 'Rua Bela Cintra 392', 'Vila Saturno', NULL),
	(26, 6, 4, 20, 'Rua Basilio 199', 'Jardim Jupter', NULL),
	(27, 1, 4, 21, 'Rua Doce 32', 'Praça Marte', NULL),
	(28, 1, 4, 22, 'Rua Grumix 114', 'Largo de Netuno', NULL),
	(29, 1, 4, 23, 'Rua Emilia 32', 'Area de Plutão', NULL),
	(30, 1, 4, 24, 'Al Jurupis 900', 'Vila Lua Branca', NULL),
	(31, 1, 4, 25, 'Av. Guedes 653', 'Parque Urano', NULL),
	(32, 2, 5, 26, 'Rua Neves 430', 'Jd. Paraiso', NULL),
	(33, 2, 5, 27, 'Av. Mario Zonta, 180', 'Terra Prometida', NULL),
	(34, 2, 5, 28, 'Rua Florida, 430', 'Jd. das Flores', NULL),
	(35, 3, 5, 29, 'Av. Jose Barroso, 305', 'Praça das Margaridas', NULL),
	(36, 3, 5, 30, 'Rua Mirina, 38', 'Zona Franca', NULL),
	(37, 4, 5, 31, 'Rua Iagaraí, 46', 'Jd. Brasileiro', NULL),
	(38, 4, 5, 32, 'Rua Paulista, 251', 'Jd. MMDC', NULL),
	(39, 4, 2, 33, 'Rua Salete, 320', 'Jd. Sales Garcia', NULL),
	(40, 5, 1, 34, 'Rua Souza, 115', 'Vila Sonia', NULL),
	(41, 5, 1, 35, 'Rua Alcion, 604', 'Parque Piraque', NULL),
	(42, 5, 1, 36, 'Av. Sabará, 987', 'Parque Piqueri', NULL),
	(43, 6, 2, 37, 'Rua Oscar Freire, 453', 'Parque Infantil', NULL),
	(44, 6, 2, 38, 'Av. Amaral Gama, 58', 'Jardim Judas', NULL),
	(45, 6, 2, 39, 'Rua Iru, 23', 'Jd. São Salvador', NULL),
	(46, 1, 2, 40, 'Rua Silvia, 560', 'Vila Pau Brasil', NULL),
	(47, 1, 2, 41, 'Rua Moura, 147', 'Vila Viela', NULL),
	(48, 1, 3, 42, 'Rua Aroeir, 954', 'Vila Amarela', NULL),
	(49, 1, 3, 43, 'Rua Pereira, 394', 'Vila Verde', NULL),
	(50, 2, 3, 44, 'Rua Galeão, 54', 'Vila Branca', NULL);
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.estado
CREATE TABLE IF NOT EXISTS `estado` (
  `Sigla_Est` char(2) NOT NULL,
  `Nome_Est` varchar(100) NOT NULL,
  PRIMARY KEY (`Sigla_Est`),
  UNIQUE KEY `UQ_Est` (`Nome_Est`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.estado: ~28 rows (aproximadamente)
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT INTO `estado` (`Sigla_Est`, `Nome_Est`) VALUES
	('AC', 'Acre'),
	('AL', 'Alagoas'),
	('AP', 'Amapa'),
	('AM', 'Amazonas'),
	('BA', 'Bahia'),
	('CE', 'Ceará'),
	('DF', 'Destrito Federal'),
	('ES', 'Espirito Santo'),
	('GO', 'Goias'),
	('MA', 'Maranhão'),
	('MT', 'Mato Grosso do Norte'),
	('MS', 'Mato Grosso do Sul'),
	('MG', 'Minas Gerais'),
	('PB', 'Paraíba'),
	('PR', 'Paraná'),
	('PE', 'Pernambuco'),
	('PI', 'Piauí'),
	('RJ', 'Rio de Janeiro'),
	('RN', 'Rio Grande do Norte'),
	('RS', 'Rio Grande do Sul'),
	('RO', 'Rondônia'),
	('RR', 'Roraima'),
	('SC', 'Santa Catarina'),
	('SP', 'São Paulo'),
	('SE', 'Sergipe'),
	('TO', 'Tocantins');
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.fone
CREATE TABLE IF NOT EXISTS `fone` (
  `Num_Lanc` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Cli` int(11) NOT NULL,
  `Num_Fone` char(10) NOT NULL,
  `Num_DDD` char(5) NOT NULL DEFAULT '011',
  PRIMARY KEY (`Num_Lanc`),
  KEY `FK_Fone` (`Cod_Cli`),
  CONSTRAINT `FK_Fone` FOREIGN KEY (`Cod_Cli`) REFERENCES `cliente` (`Cod_Cli`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.fone: ~78 rows (aproximadamente)
/*!40000 ALTER TABLE `fone` DISABLE KEYS */;
INSERT INTO `fone` (`Num_Lanc`, `Cod_Cli`, `Num_Fone`, `Num_DDD`) VALUES
	(1, 1, '434-2356', '011'),
	(2, 1, '256-4578', '011'),
	(3, 1, '256-5623', '011'),
	(4, 2, '242-9865', '011'),
	(5, 2, '323-8945', '011'),
	(6, 2, '232-7845', '011'),
	(7, 3, '565-2365', '011'),
	(8, 3, '454-1254', '011'),
	(9, 3, '898-2345', '011'),
	(10, 4, '454-1223', '011'),
	(11, 4, '787-4512', '011'),
	(12, 5, '525-4578', '011'),
	(13, 5, '252-9887', '011'),
	(14, 6, '578-6521', '011'),
	(15, 6, '568-5421', '011'),
	(16, 7, '536-3254', '011'),
	(17, 8, '568-2154', '011'),
	(18, 9, '587-3221', '011'),
	(19, 10, '863-6598', '011'),
	(20, 11, '138-8754', '011'),
	(21, 12, '123-6598', '011'),
	(22, 13, '321-6357', '011'),
	(23, 14, '301-1232', '011'),
	(24, 15, '321-4512', '011'),
	(25, 16, '333-3221', '011'),
	(26, 17, '555-4578', '011'),
	(27, 18, '666-1245', '011'),
	(28, 19, '777-3265', '011'),
	(29, 20, '888-2154', '011'),
	(30, 21, '999-1111', '015'),
	(31, 21, '202-1222', '015'),
	(32, 22, '254-3333', '015'),
	(33, 23, '458-4444', '015'),
	(34, 23, '874-5555', '015'),
	(35, 24, '313-6666', '015'),
	(36, 24, '587-7777', '015'),
	(37, 25, '589-8888', '015'),
	(38, 26, '999-9999', '015'),
	(39, 27, '999-1010', '015'),
	(40, 27, '111-1111', '015'),
	(41, 28, '222-1212', '015'),
	(42, 28, '333-1313', '015'),
	(43, 28, '444-1414', '015'),
	(44, 29, '555-1515', '015'),
	(45, 29, '666-1616', '015'),
	(46, 30, '777-1717', '015'),
	(47, 31, '888-1818', '015'),
	(48, 32, '999-1919', '015'),
	(49, 33, '101-2020', '015'),
	(50, 34, '555-2121', '021'),
	(51, 35, '333-2222', '021'),
	(52, 36, '717-2323', '021'),
	(53, 37, '656-2424', '021'),
	(54, 38, '374-2525', '021'),
	(55, 39, '859-2626', '021'),
	(56, 40, '222-2727', '021'),
	(57, 41, '256-2828', '021'),
	(58, 42, '542-2929', '021'),
	(59, 43, '578-3030', '021'),
	(60, 44, '896-4041', '021'),
	(61, 45, '369-5050', '021'),
	(62, 46, '132-5151', '021'),
	(63, 47, '321-6161', '021'),
	(64, 48, '542-7171', '011'),
	(65, 49, '201-8181', '011'),
	(66, 50, '301-9191', '011'),
	(67, 50, '401-1919', '011'),
	(68, 50, '501-1818', '011'),
	(69, 51, '601-1212', '011'),
	(70, 52, '701-1313', '011'),
	(71, 53, '801-1414', '011'),
	(72, 54, '901-1515', '011'),
	(73, 56, '222-1616', '011'),
	(74, 56, '333-1714', '011'),
	(75, 57, '111-1818', '011'),
	(76, 58, '444-1919', '011'),
	(77, 59, '222-2020', '011'),
	(78, 62, '333-2121', '011');
/*!40000 ALTER TABLE `fone` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `Cod_Func` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_Func` varchar(100) NOT NULL,
  `Data_CadFunc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Sexo_Func` char(1) NOT NULL DEFAULT 'F',
  `Sal_Func` decimal(10,2) NOT NULL DEFAULT '200.00',
  `End_Func` varchar(100) NOT NULL,
  `PercComissao` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.funcionario: ~21 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` (`Cod_Func`, `Nome_Func`, `Data_CadFunc`, `Sexo_Func`, `Sal_Func`, `End_Func`, `PercComissao`) VALUES
	(1, 'Amaro Merico Vespucio', '2002-01-31 23:00:00', 'M', 1002.00, 'Rua B', 0),
	(2, 'Abílio Abel Garcia', '2003-01-31 23:00:00', 'M', 3001.00, 'Rua C', 0),
	(3, 'Bia Bianca Bones', '2004-03-01 00:00:00', 'F', 7001.25, 'Rua D', 0),
	(4, 'Beatriz Bertioga', '2005-05-01 00:00:00', 'F', 2301.00, 'Rua E', 0),
	(5, 'Caio Cesar Cearez', '2006-05-01 00:00:00', 'M', 2251.00, ',Rua F', 0),
	(6, 'Celso Cesare', '2007-06-01 00:00:00', 'M', 3543.36, 'Rua J', 0),
	(7, 'Danilo Douglas', '2008-06-01 00:00:00', 'M', 1524.56, 'Rua K', 0),
	(8, 'Denis Denilo', '2009-07-01 00:00:00', 'M', 7236.56, 'Rua L', 0),
	(9, 'Everton Evaristo', '2010-07-01 00:00:00', 'M', 4543.25, 'Rua M', 0),
	(10, 'Evanir Eva', '2011-08-01 00:00:00', 'M', 6524.54, 'Rua N', 0),
	(11, 'Fabio Fabricio', '2012-08-01 00:00:00', 'M', 3525.25, 'Rua O', 0),
	(12, 'Fabiola Fabiolo', '2002-01-01 23:00:00', 'F', 4555.25, 'Rua P', 0),
	(13, 'Geraldo Gomes', '2003-10-02 00:00:00', 'M', 3543.25, 'Rua Q', 0),
	(14, 'Helio Heliópolis', '2004-01-01 23:00:00', 'M', 3543.23, 'Rua R', 0),
	(15, 'Irineu Irene', '2005-02-01 23:00:00', 'M', 4524.00, 'Rua S', 0),
	(16, 'Jonas jackes', '2005-02-01 23:00:00', 'M', 4501.00, 'Rua T', 0),
	(17, 'Leandro Lago', '2006-02-01 23:00:00', 'M', 3501.00, 'Rua U', 0),
	(18, 'Lucio Lacio', '2007-03-02 00:00:00', 'M', 4501.00, 'Rua V', 0),
	(19, 'Lecio Licio', '2008-04-02 00:00:00', 'M', 3421.00, 'Rua X', 0),
	(20, 'Mario Mendes', '2006-02-01 23:00:00', 'M', 3263.00, 'Rua W', 0),
	(21, 'Olavo Odavlas', '2007-07-02 00:00:00', 'M', 3541.00, 'Rua Y', 100),
	(22, 'Rodrigo ????', '2020-05-21 21:02:51', 'M', 100000.00, 'RUA ', 3),
	(23, 'Sergio', '2020-05-21 21:40:19', 'M', 45000.00, 'RRR', 5);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.funcionario_comissao
CREATE TABLE IF NOT EXISTS `funcionario_comissao` (
  `FCO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FCO_FUN_ID` int(11) NOT NULL DEFAULT '0',
  `FCO_PED_ID` int(11) NOT NULL DEFAULT '0',
  `FCO_VL_COMISSAO` double NOT NULL DEFAULT '0',
  `FCO_COMISSAO_PAGA` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`FCO_ID`),
  KEY `FK_FCO_FUN` (`FCO_FUN_ID`),
  KEY `FK_FCO_PED` (`FCO_PED_ID`),
  CONSTRAINT `FK_FCO_FUN` FOREIGN KEY (`FCO_FUN_ID`) REFERENCES `funcionario` (`Cod_Func`),
  CONSTRAINT `FK_FCO_PED` FOREIGN KEY (`FCO_PED_ID`) REFERENCES `pedido` (`Num_Ped`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.funcionario_comissao: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `funcionario_comissao` DISABLE KEYS */;
INSERT INTO `funcionario_comissao` (`FCO_ID`, `FCO_FUN_ID`, `FCO_PED_ID`, `FCO_VL_COMISSAO`, `FCO_COMISSAO_PAGA`) VALUES
	(1, 22, 6, 3, 0),
	(2, 23, 7, 50, 0),
	(3, 2, 6, 100, 0),
	(4, 2, 9, 0, 0),
	(5, 21, 10, 100, 0),
	(6, 22, 11, 3, 0),
	(7, 23, 12, 50, 0);
/*!40000 ALTER TABLE `funcionario_comissao` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.historico
CREATE TABLE IF NOT EXISTS `historico` (
  `Num_Lanc` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Func` int(11) NOT NULL,
  `Data_Hist` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Sal_Ant` decimal(10,2) NOT NULL,
  `Sal_Atual` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Num_Lanc`),
  KEY `FK_Hist` (`Cod_Func`),
  CONSTRAINT `FK_Hist` FOREIGN KEY (`Cod_Func`) REFERENCES `funcionario` (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.historico: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` (`Num_Lanc`, `Cod_Func`, `Data_Hist`, `Sal_Ant`, `Sal_Atual`) VALUES
	(2, 4, '2022-03-03 20:28:36', 0.00, 12000.00);
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.itens
CREATE TABLE IF NOT EXISTS `itens` (
  `Num_Ped` int(11) NOT NULL,
  `Cod_Prod` int(11) NOT NULL,
  `Qtd_Vend` int(11) NOT NULL,
  `Val_Vend` decimal(10,2) NOT NULL,
  `comissao` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`Num_Ped`,`Cod_Prod`),
  KEY `FK_Itens2` (`Cod_Prod`),
  CONSTRAINT `FK_Itens1` FOREIGN KEY (`Num_Ped`) REFERENCES `pedido` (`Num_Ped`),
  CONSTRAINT `FK_Itens2` FOREIGN KEY (`Cod_Prod`) REFERENCES `produto` (`Cod_Prod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.itens: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `itens` DISABLE KEYS */;
INSERT INTO `itens` (`Num_Ped`, `Cod_Prod`, `Qtd_Vend`, `Val_Vend`, `comissao`) VALUES
	(6, 1, 10, 500.00, 3),
	(7, 11, 10, 222.00, 3),
	(8, 3, 10, 33.00, 3),
	(12, 3, 100, 5.00, 3),
	(12, 10, 4, 870.00, 3),
	(12, 11, 7, 111.00, 3);
/*!40000 ALTER TABLE `itens` ENABLE KEYS */;

-- Copiando estrutura para view bcofio.lista_pedidos
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `lista_pedidos` (
	`Cod_Cli` INT(11) NOT NULL,
	`Nome_Cli` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`Num_Ped` INT(11) NOT NULL
) ENGINE=MyISAM;

-- Copiando estrutura para função bcofio.maiorNumero


-- Copiando estrutura para função bcofio.MEDIAPONDERADA
DELIMITER //
CREATE DEFINER=`root`@`localhost` FUNCTION `MEDIAPONDERADA`(n1 INT, n2 INT, n3 INT, n4 INT) RETURNS float
    DETERMINISTIC
BEGIN     
     	SET @med = n1*0.1 + n2*0.3 + n3*0.4 + n4*0.2;
     	RETURN @med;
    END//
DELIMITER ;

-- Copiando estrutura para tabela bcofio.parcela
CREATE TABLE IF NOT EXISTS `parcela` (
  `Num_Par` smallint(6) NOT NULL,
  `Num_Ped` int(11) NOT NULL,
  `Data_Venc` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Val_Venc` decimal(10,2) NOT NULL,
  `Data_Pgto` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`Num_Par`,`Num_Ped`),
  KEY `FK_Parcela` (`Num_Ped`),
  CONSTRAINT `FK_Parcela` FOREIGN KEY (`Num_Ped`) REFERENCES `pedido` (`Num_Ped`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.parcela: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `parcela` DISABLE KEYS */;
INSERT INTO `parcela` (`Num_Par`, `Num_Ped`, `Data_Venc`, `Val_Venc`, `Data_Pgto`) VALUES
	(1, 6, '2024-08-27 20:23:20', 100.00, '2024-08-27 20:23:26'),
	(2, 6, '2024-08-27 20:23:20', 100.00, '2024-08-27 20:23:26'),
	(3, 6, '2024-08-27 20:23:20', 100.00, NULL),
	(4, 6, '2024-08-27 20:23:20', 100.00, NULL),
	(5, 6, '2024-08-27 20:23:20', 100.00, NULL),
	(6, 8, '2024-08-27 20:23:20', 1500.00, NULL),
	(7, 10, '2024-08-27 20:23:20', 350.00, NULL);
/*!40000 ALTER TABLE `parcela` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `Num_Ped` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Cli` int(11) NOT NULL,
  `Cod_Func` int(11) NOT NULL,
  `Cod_Sta` smallint(6) NOT NULL,
  `Data_Ped` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Val_Ped` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Num_Ped`),
  KEY `FK_PED_FUN` (`Cod_Func`),
  KEY `FK_PED_CLI` (`Cod_Cli`),
  CONSTRAINT `FK_PED_CLI` FOREIGN KEY (`Cod_Cli`) REFERENCES `cliente` (`Cod_Cli`) ON DELETE CASCADE,
  CONSTRAINT `FK_PED_FUN` FOREIGN KEY (`Cod_Func`) REFERENCES `funcionario` (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.pedido: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` (`Num_Ped`, `Cod_Cli`, `Cod_Func`, `Cod_Sta`, `Data_Ped`, `Val_Ped`) VALUES
	(6, 34, 22, 1, '2020-09-21 21:28:29', 250.00),
	(7, 18, 23, 1, '2020-09-21 21:41:25', 1000.00),
	(8, 18, 2, 1, '2020-07-22 11:25:22', 501.00),
	(9, 34, 2, 1, '2020-01-22 11:33:55', 100.00),
	(10, 39, 21, 1, '2020-05-22 11:37:06', 100.00),
	(11, 22, 22, 1, '2020-05-22 11:37:22', 4500.00),
	(12, 39, 23, 1, '2020-05-22 11:37:34', 1000.00);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.pontos
CREATE TABLE IF NOT EXISTS `pontos` (
  `PON_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PON_CLI_ID` int(11) NOT NULL,
  `PON_PONTUACAO` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PON_ID`),
  KEY `FK_PON_CLI` (`PON_CLI_ID`),
  CONSTRAINT `FK_PON_CLI` FOREIGN KEY (`PON_CLI_ID`) REFERENCES `cliente` (`Cod_Cli`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.pontos: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `pontos` DISABLE KEYS */;
INSERT INTO `pontos` (`PON_ID`, `PON_CLI_ID`, `PON_PONTUACAO`) VALUES
	(1, 34, 1000),
	(47, 71, 1000);
/*!40000 ALTER TABLE `pontos` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.pontuacao
CREATE TABLE IF NOT EXISTS `pontuacao` (
  `Num_Lanc` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_Func` int(11) NOT NULL,
  `Data_Pto` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Pto_Func` decimal(4,2) NOT NULL,
  PRIMARY KEY (`Num_Lanc`),
  KEY `FK_Pto` (`Cod_Func`),
  CONSTRAINT `FK_Pto` FOREIGN KEY (`Cod_Func`) REFERENCES `funcionario` (`Cod_Func`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.pontuacao: ~11 rows (aproximadamente)
/*!40000 ALTER TABLE `pontuacao` DISABLE KEYS */;
INSERT INTO `pontuacao` (`Num_Lanc`, `Cod_Func`, `Data_Pto`, `Pto_Func`) VALUES
	(1, 2, '2020-03-30 19:51:57', 50.00),
	(2, 3, '2020-05-02 19:51:57', 80.00),
	(3, 3, '2020-04-02 19:51:57', 30.00),
	(4, 3, '2020-04-02 19:51:57', 31.00),
	(5, 3, '2020-04-05 19:51:57', 57.00),
	(6, 2, '2020-04-02 19:51:57', 9.00),
	(7, 3, '2020-04-02 19:51:57', 10.00),
	(8, 3, '2019-09-02 19:51:57', 20.00),
	(9, 3, '2020-04-02 19:51:57', 10.00),
	(10, 3, '2019-03-02 19:51:57', 10.00),
	(11, 3, '2020-07-02 19:51:57', 15.00);
/*!40000 ALTER TABLE `pontuacao` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `Cod_Prod` int(11) NOT NULL AUTO_INCREMENT,
  `Cod_TipoProd` int(11) NOT NULL,
  `Nome_Prod` varchar(100) NOT NULL,
  `Qtd_EstqProd` int(11) NOT NULL DEFAULT '0',
  `Val_UnitProd` decimal(10,2) NOT NULL,
  `comissao_simples` decimal(10,2) NOT NULL,
  `comissao_especial` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Cod_Prod`),
  UNIQUE KEY `UQ_Prod` (`Nome_Prod`),
  KEY `FK_Prod` (`Cod_TipoProd`),
  CONSTRAINT `FK_Prod` FOREIGN KEY (`Cod_TipoProd`) REFERENCES `tipoprod` (`Cod_TipoProd`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.produto: ~12 rows (aproximadamente)
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` (`Cod_Prod`, `Cod_TipoProd`, `Nome_Prod`, `Qtd_EstqProd`, `Val_UnitProd`, `comissao_simples`, `comissao_especial`) VALUES
	(1, 1, 'Armário Inox', 1000, 1200.00, 3.00, 1.00),
	(2, 1, 'Armário Madeira', 1000, 2200.00, 3.00, 1.00),
	(3, 2, 'Armário Metal', 1000, 200.00, 3.00, 1.00),
	(4, 1, 'Mesa Vidro', 100, 1500.00, 3.00, 1.00),
	(5, 3, 'Mesa Fórmica', 1000, 200.00, 3.00, 1.00),
	(6, 2, 'Mesa Madeira', 1000, 800.00, 3.00, 1.00),
	(7, 1, 'Sofa Couro', 500, 2200.00, 3.00, 1.00),
	(8, 2, 'Sofa Napa', 500, 200.00, 3.00, 1.00),
	(9, 1, 'Estante Madeira', 500, 12200.00, 3.00, 1.00),
	(10, 1, 'Cama', 500, 1200.00, 3.00, 1.00),
	(11, 1, 'Geladeira', 500, 3200.00, 3.00, 1.00),
	(12, 1, 'Fogão', 500, 700.00, 3.00, 1.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;

-- Copiando estrutura para procedure bcofio.P_AumentaSal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_AumentaSal`(Valor double)
begin
	DECLARE codigoFuncionario INT;
	DECLARE done INT DEFAULT 0;
	
	DECLARE cur1 CURSOR FOR SELECT Funcionario.Cod_Func FROM Funcionario LEFT JOIN Dependente ON Funcionario.Cod_Func = Dependente.Cod_Func
		GROUP BY Funcionario.Cod_Func HAVING Count(Dependente.Cod_Func) <= 2;
	DECLARE CONTINUE HANDLER FOR SQLSTATE '02000' SET done = 1;

	OPEN cur1;

	REPEAT
		FETCH cur1 INTO codigoFuncionario;
		IF NOT done THEN
			UPDATE Funcionario f SET f.Sal_Func = f.Sal_Func + Valor WHERE f.Cod_Func = codigoFuncionario; 
		END IF;
		
	UNTIL done END REPEAT;
	
	CLOSE cur1;

	
END//
DELIMITER ;

-- Copiando estrutura para procedure bcofio.p_aumento
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_aumento`(pcodFuncionario int, pValor double)
BEGIN
		DECLARE novoSalario  DOUBLE default 0;
		
		if(pValor > 0) then
			SELECT sal_Func into novoSalario FROM Funcionario where cod_func = pcodFuncionario;
	
			set novoSalario = novoSalario + pValor;
			update funcionario set sal_func = novoSalario 
				where cod_func = pcodFuncionario ;
		end if;
END//
DELIMITER ;

-- Copiando estrutura para procedure bcofio.P_CalcTotal
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_CalcTotal`(pedidoparam int)
BEGIN
	DECLARE Val_Total double default 0;
	SELECT ifnull(SUM(Itens.Qtd_Vend * Itens.Val_Vend),0) into Val_Total FROM Itens WHERE Num_Ped = pedidoparam;
	UPDATE Pedido SET Val_Ped = Val_Total	WHERE Num_Ped = pedidoparam;
END//
DELIMITER ;

-- Copiando estrutura para procedure bcofio.p_desconto
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_desconto`(codCliente int, percentual double)
BEGIN
	DECLARE maiorPedido INT default 0;
	SELECT MAX(Num_Ped) into maiorPedido FROM Pedido p WHERE p.Cod_Cli = codCliente;
	UPDATE Pedido INNER JOIN Cliente ON Pedido.Cod_Cli = Cliente.Cod_Cli
			SET Pedido.Val_Ped = Pedido.Val_Ped  * (percentual /100)
				WHERE Pedido.Cod_Cli = codCliente
					AND Pedido.Num_Ped = maiorPedido;
END//
DELIMITER ;

-- Copiando estrutura para procedure bcofio.P_GeraParcela
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `P_GeraParcela`(numeroPedido int, Num_Par int)
begin
	DECLARE Val_Tot, Val_Par double;
	DECLARE Cont int DEFAULT 0;
	DECLARE specialty CONDITION FOR SQLSTATE '45000';
	
	IF EXISTS(SELECT * FROM Parcela WHERE Num_Ped = numeroPedido) then
   	SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Parcelas já calculadas anteriormente', MYSQL_ERRNO = 1000;
	end if;

	IF NOT EXISTS(SELECT * FROM Pedido WHERE Num_Ped = numeroPedido) then
   	SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Número de pedido Inexistente', MYSQL_ERRNO = 1000;
	end if;

	SELECT Val_Ped into Val_Tot FROM Pedido WHERE Num_Ped = numeroPedido;

	IF Num_Par = 1 then
   	SIGNAL SQLSTATE '01000' SET MESSAGE_TEXT = 'Pedido a ser pago a vista', MYSQL_ERRNO = 1000;
	end if;


	IF Num_Par > 10 then
   	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Quantidade inválida de parcelas', MYSQL_ERRNO = 1001;
	end if;


	IF Num_Par > 3 AND Num_Par <= 10 then
   	SET Val_Tot = Val_Tot * 1.1;
   	SET Val_Par = Val_Tot / Num_Par;
	end if;
	
	SET Cont = 1;

	WHILE Cont <= Num_Par do
   	INSERT into Parcela(Num_Par, Num_Ped, Data_Venc, Val_Venc, Data_Pgto)  VALUES(Cont,numeroPedido,  current_date, Val_Par, null);
    	SET cont = cont + 1;
   end while;

END//
DELIMITER ;

-- Copiando estrutura para procedure bcofio.p_pontuacao
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `p_pontuacao`(pcli int, ploop int)
BEGIN
	declare vpcli int default 0;
	declare contador int default 0;
	declare aleatorio int default 0;
	select Cod_Cli into vpcli from cliente where cod_cli = pcli;
	if (vpcli = pcli) then
		WHILE contador < ploop do	
			set aleatorio = FLOOR(1 + (RAND() * 100));
			INSERT INTO pontos SET PON_CLI_ID = pcli, PON_PONTUACAO = aleatorio;
			set contador= contador + 1;
		end while;
	end if;
END//
DELIMITER ;

-- Copiando estrutura para função bcofio.renda

-- Copiando estrutura para tabela bcofio.statuspedido
CREATE TABLE IF NOT EXISTS `statuspedido` (
  `Cod_Sta` smallint(6) NOT NULL AUTO_INCREMENT,
  `Sta_Ped` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_Sta`),
  UNIQUE KEY `UQ_StatusPed` (`Sta_Ped`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.statuspedido: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `statuspedido` DISABLE KEYS */;
INSERT INTO `statuspedido` (`Cod_Sta`, `Sta_Ped`) VALUES
	(1, 'Aberto'),
	(4, 'Cancelado'),
	(3, 'Fechado'),
	(2, 'Pendente');
/*!40000 ALTER TABLE `statuspedido` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.teste
CREATE TABLE IF NOT EXISTS `teste` (
  `Cod_Cli` int(11) NOT NULL DEFAULT '0',
  `Cod_TipoCli` int(11) NOT NULL,
  `Nome_Cli` varchar(100) NOT NULL,
  `Data_CadCli` varchar(8) NOT NULL,
  `Renda_Cli` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Sexo_Cli` char(1) NOT NULL DEFAULT 'F'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.teste: ~60 rows (aproximadamente)
/*!40000 ALTER TABLE `teste` DISABLE KEYS */;
INSERT INTO `teste` (`Cod_Cli`, `Cod_TipoCli`, `Nome_Cli`, `Data_CadCli`, `Renda_Cli`, `Sexo_Cli`) VALUES
	(3, 1, 'Helena Oliveira', '03031999', 9000.00, 'F'),
	(4, 1, 'Roberta Oliveira', '04041999', 8000.00, 'F'),
	(5, 2, 'Renata Leão', '05051999', 5000.00, 'F'),
	(6, 2, 'Jairo Gato', '06061999', 4000.00, 'M'),
	(7, 3, 'Fernando Gato', '07071999', 3000.00, 'M'),
	(8, 3, 'Giovanna Silva Leão', '08081999', 3000.00, 'F'),
	(9, 4, 'Lucas Ribeiro', '09091999', 2000.00, 'M'),
	(10, 3, 'Helder Leão', '10101999', 2000.00, 'M'),
	(11, 2, 'Olga Cristina Bonfiglioli', '11111999', 8000.00, 'F'),
	(12, 1, 'Maria Cristina Bonfiglioli Martins de Souza Santos', '12121999', 5000.00, 'F'),
	(13, 1, 'Salvador Eneas Feredico', '01131999', 9000.00, 'M'),
	(14, 1, 'Dolores Gerreiro Martins', '02142000', 8000.00, 'F'),
	(15, 1, 'Fabiana Bataglin', '03152000', 5000.00, 'F'),
	(17, 3, 'Reginaldo Ribeiro', '05172000', 4000.00, 'M'),
	(18, 4, 'Suellen M Nunes', '06182000', 3000.00, 'F'),
	(19, 1, 'Carlos Alberto', '07192000', 2000.00, 'M'),
	(20, 2, 'Roberto Arruda', '08202000', 1000.00, 'M'),
	(21, 3, 'Sandra Medeiros', '09212000', 1500.00, 'F'),
	(22, 4, 'Alice Santos', '10222001', 2500.00, 'F'),
	(23, 5, 'Valter Sanches', '11232001', 3500.00, 'M'),
	(24, 6, 'Pascoal Babiera', '12242001', 1525.00, 'M'),
	(25, 1, 'Lucia Bacalla', '01252001', 6321.00, 'F'),
	(26, 3, 'Maria Belido', '02262001', 5412.00, 'F'),
	(27, 4, 'Hamilton Belico', '03262001', 2563.00, 'M'),
	(28, 5, 'Alberto Belli', '04272001', 2412.00, 'M'),
	(29, 6, 'Marcia Bueno', '05282001', 1235.00, 'F'),
	(30, 1, 'Maria Catta', '06292001', 1236.00, 'F'),
	(31, 2, 'Carlos Cattaneo', '07302001', 1253.00, 'M'),
	(32, 3, 'Andre Caula', '08312001', 1524.00, 'M'),
	(33, 4, 'Fabia Dávello', '09012001', 1236.00, 'F'),
	(34, 5, 'Afonso Ferraro', '10022001', 1256.00, 'M'),
	(35, 6, 'Akemi Fukamizu', '11032001', 1452.00, 'F'),
	(36, 1, 'Bernadino Gomes', '12042001', 11785.00, 'M'),
	(37, 2, 'Regiani Hoki', '01052001', 1524.00, 'F'),
	(38, 3, 'Valter Koszura', '02062001', 1256.00, 'M'),
	(39, 4, 'Alexandre Kozeki', '03072001', 1225.00, 'M'),
	(40, 5, 'Vittorio Lannocca', '04082001', 1253.00, 'M'),
	(41, 6, 'Domingos Lanini', '05092002', 1253.00, 'M'),
	(42, 1, 'Paulo Mello', '06102001', 10000.00, 'M'),
	(43, 2, 'Zilda Mellone', '07112001', 8000.00, 'F'),
	(44, 3, 'Marlene Moura', '08122001', 3000.00, 'F'),
	(45, 4, 'Francisca Oliveira', '09132001', 2300.00, 'F'),
	(46, 5, 'Marlene Pereira', '10142001', 2562.00, 'F'),
	(47, 6, 'Milton Pereira', '11152001', 2563.00, 'M'),
	(48, 1, 'Ligia Ramos', '12162001', 9200.00, 'F'),
	(49, 2, 'Mariangela Ramos', '01172001', 7000.00, 'F'),
	(50, 3, 'Dora Romariz', '02182001', 5263.00, 'F'),
	(51, 4, 'Paulino Romelli', '03192001', 5428.00, 'M'),
	(52, 5, 'Fernando Sampaio', '04202001', 2023.00, 'M'),
	(53, 6, 'José Sampaio', '05212001', 2235.00, 'M'),
	(54, 1, 'Vicenzo Senatori', '06222001', 7000.00, 'M'),
	(55, 2, 'Geraldo Senedeze', '07232001', 2531.00, 'M'),
	(56, 3, 'Mauro Soares', '08242001', 2532.00, 'M'),
	(57, 4, 'Paulo Souza', '09252001', 2542.00, 'M'),
	(58, 5, 'Emidio Trifoni', '10262001', 2563.00, 'M'),
	(59, 6, 'Heitor Vernile', '11272001', 2542.00, 'M'),
	(60, 1, 'Carlos Saura', '12282001', 6000.00, 'M'),
	(61, 2, 'Angelino Saullo', '01292001', 5000.00, 'M'),
	(62, 3, 'Aldo Savazzoni', '02282001', 4000.00, 'M'),
	(63, 3, 'Zzzz zzzz ', '02282001', 4000.00, 'M');
/*!40000 ALTER TABLE `teste` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.tipocli
CREATE TABLE IF NOT EXISTS `tipocli` (
  `Cod_TipoCli` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_TipoCli` varchar(100) NOT NULL,
  `Intervalo` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_TipoCli`),
  UNIQUE KEY `UQ_TipoCli` (`Nome_TipoCli`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.tipocli: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `tipocli` DISABLE KEYS */;
INSERT INTO `tipocli` (`Cod_TipoCli`, `Nome_TipoCli`, `Intervalo`) VALUES
	(1, 'Diamante', 'a partir de 500 reais.'),
	(2, 'Ouro', 'a partir de 1.500 reais.'),
	(3, 'Prata', 'a partir de 2.000 reais.'),
	(4, 'Bronze', 'a partir de 500 reais.'),
	(5, 'Cobre', 'a partir de 500 reais.'),
	(6, 'Zinco', 'a partir de 500 reais.'),
	(7, 'Alface', 'a partir de 500 reais.');
/*!40000 ALTER TABLE `tipocli` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.tipoend
CREATE TABLE IF NOT EXISTS `tipoend` (
  `Cod_TipoEnd` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_TipoEnd` varchar(30) NOT NULL,
  PRIMARY KEY (`Cod_TipoEnd`),
  UNIQUE KEY `UQ_TipoEnd` (`Nome_TipoEnd`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.tipoend: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoend` DISABLE KEYS */;
INSERT INTO `tipoend` (`Cod_TipoEnd`, `Nome_TipoEnd`) VALUES
	(4, 'Cobrança'),
	(6, 'Comercial'),
	(3, 'Correspondência'),
	(1, 'Entrega'),
	(2, 'Faturamento'),
	(5, 'Residential');
/*!40000 ALTER TABLE `tipoend` ENABLE KEYS */;

-- Copiando estrutura para tabela bcofio.tipoprod
CREATE TABLE IF NOT EXISTS `tipoprod` (
  `Cod_TipoProd` int(11) NOT NULL AUTO_INCREMENT,
  `Nome_TipoProd` varchar(100) NOT NULL,
  PRIMARY KEY (`Cod_TipoProd`),
  UNIQUE KEY `UQ_TipoProd` (`Nome_TipoProd`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Copiando dados para a tabela bcofio.tipoprod: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoprod` DISABLE KEYS */;
INSERT INTO `tipoprod` (`Cod_TipoProd`, `Nome_TipoProd`) VALUES
	(8, '4'),
	(1, 'Primeira Linha'),
	(4, 'Quarta Linha'),
	(5, 'Quinta Linha'),
	(2, 'Segunda Linha'),
	(3, 'Terceira Linha');
/*!40000 ALTER TABLE `tipoprod` ENABLE KEYS */;

-- Copiando estrutura para view bcofio.v_creditocliente
-- Criando tabela temporária para evitar erros de dependência de VIEW
CREATE TABLE `v_creditocliente` (
	`cod_cli` INT(11) NOT NULL,
	`nome_cli` VARCHAR(100) NOT NULL COLLATE 'utf8_general_ci',
	`total_credito` DECIMAL(32,2) NULL
) ENGINE=MyISAM;

-- Copiando estrutura para trigger bcofio.add_linha_pontos


-- Copiando estrutura para trigger bcofio.del_linha_pontos

DELIMITER //
CREATE TRIGGER `del_linha_pontos` BEFORE DELETE ON `cliente` FOR EACH ROW BEGIN
      delete from pontos where PON_CLI_ID = old.Cod_Cli;
END//
DELIMITER ;

-- Copiando estrutura para trigger bcofio.t_calcularComissao

DELIMITER //
CREATE TRIGGER `t_calcularComissao` AFTER INSERT ON `pedido` FOR EACH ROW BEGIN
	DECLARE txComissao double default 0;
	DECLARE vlComissao double default 0;
	
	select funcionario.PercComissao into txComissao from funcionario where Cod_Func = NEW.Cod_Func;
	
	set vlComissao = new.Val_Ped * txComissao / 100;	
	
	INSERT INTO funcionario_comissao SET FCO_FUN_ID = NEW.Cod_Func, FCO_PED_ID = NEW.Num_Ped, 
		FCO_VL_COMISSAO = vlComissao, FCO_COMISSAO_PAGA= 0;
END//
DELIMITER ;

-- Copiando estrutura para view bcofio.clientepontuacao
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `clientepontuacao`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clientepontuacao` AS select `funcionario`.`Cod_Func` AS `Cod_Func`,`funcionario`.`Nome_Func` AS `Nome_Func`,`pontuacao`.`Data_Pto` AS `Data_Pto`,`pontuacao`.`Pto_Func` AS `Pto_Func` from (`funcionario` left join `pontuacao` on((`funcionario`.`Cod_Func` = `pontuacao`.`Cod_Func`))) order by `funcionario`.`Nome_Func`;

-- Copiando estrutura para view bcofio.lista_pedidos
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `lista_pedidos`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `lista_pedidos` AS select `cliente`.`Cod_Cli` AS `Cod_Cli`,`cliente`.`Nome_Cli` AS `Nome_Cli`,`pedido`.`Num_Ped` AS `Num_Ped` from (`cliente` join `pedido` on((`pedido`.`Cod_Cli` = `cliente`.`Cod_Cli`)));

-- Copiando estrutura para view bcofio.v_creditocliente
-- Removendo tabela temporária e criando a estrutura VIEW final
DROP TABLE IF EXISTS `v_creditocliente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_creditocliente` AS select `cr`.`Cod_Cli` AS `cod_cli`,`c`.`Nome_Cli` AS `nome_cli`,sum(`cr`.`Cred_Cli`) AS `total_credito` from (`credito` `cr` join `cliente` `c` on((`c`.`Cod_Cli` = `cr`.`Cod_Cli`))) group by `cr`.`Cod_Cli`;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
