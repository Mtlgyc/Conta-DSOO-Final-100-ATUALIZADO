CREATE DATABASE `bancoch` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

CREATE TABLE `conta` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `data_abertura` date DEFAULT NULL,
  `data_fechamento` date DEFAULT NULL,
  `senha` varchar(20) DEFAULT NULL,
  `saldo` decimal(10,2) DEFAULT NULL,
  `codigo_pessoa` int DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `codigo_pessoa` (`codigo_pessoa`),
  CONSTRAINT `conta_ibfk_1` FOREIGN KEY (`codigo_pessoa`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `contaespecial` (
  `numero` int NOT NULL,
  `limite` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  CONSTRAINT `contaespecial_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `conta` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `movimento` (
  `numero` int NOT NULL AUTO_INCREMENT,
  `hora` time DEFAULT NULL,
  `data` date DEFAULT NULL,
  `valor` decimal(10,2) DEFAULT NULL,
  `numero_conta` int DEFAULT NULL,
  `codigo_tipo` int DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `numero_conta` (`numero_conta`),
  KEY `codigo_tipo` (`codigo_tipo`),
  CONSTRAINT `movimento_ibfk_1` FOREIGN KEY (`numero_conta`) REFERENCES `conta` (`numero`),
  CONSTRAINT `movimento_ibfk_2` FOREIGN KEY (`codigo_tipo`) REFERENCES `tipomovimento` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pessoa` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pessoafisica` (
  `codigo` int NOT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `pessoafisica_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pessoajuridica` (
  `codigo` int NOT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  CONSTRAINT `pessoajuridica_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `pessoa` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `poupanca` (
  `numero` int NOT NULL,
  `data_aniversario` date DEFAULT NULL,
  PRIMARY KEY (`numero`),
  CONSTRAINT `poupanca_ibfk_1` FOREIGN KEY (`numero`) REFERENCES `conta` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `tipomovimento` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
