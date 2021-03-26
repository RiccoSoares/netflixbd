DROP TABLE IF EXISTS GENERO;
DROP TABLE IF EXISTS DIRETOR;
DROP TABLE IF EXISTS ATOR;
DROP TABLE IF EXISTS CONTA;


CREATE TABLE GENERO
	(nome VARCHAR(30) NOT NULL,
PRIMARY KEY (nome));
 
CREATE TABLE DIRETOR
	(nome VARCHAR(150) NOT NULL,
PRIMARY KEY (nome));

CREATE TABLE ATOR
	(nome VARCHAR(150) NOT NULL,
PRIMARY KEY (nome));
 
CREATE TABLE  CONTA
	(email VARCHAR(254) NOT NULL,
	plano NUMERIC(3) NOT NULL,
	telasonline NUMERIC(1) NOT NULL,
	cpf NUMERIC(11) NOT NULL UNIQUE,
	cartao_titular VARCHAR(26) NOT NULL,
	cartao_numero NUMERIC(19) NOT NULL,
	cartao_cvv NUMERIC(3) NOT NULL,
	cartao_val DATE(4) NOT NULL,
	senha VARCHAR(64) NOT NULL,
PRIMARY KEY (email));

--CREATE TABLE CONTEUDO
--	(id VARCHAR NOT NULL,
--	nome VARCHAR(150) NOT NULL,
--	ano NUMERIC(4) NOT NULL,
--	sinopse VARCHAR(400) NOT NULL,
--	poster NUMERIC(5) NOT NULL UNIQUE,
--	ci NUMERIC(2) NOT NULL,
--	visu INT NOT NULL,
--	original BOOLEAN NOT NULL,
	

SELECT * FROM GENERO;
SELECT * FROM DIRETOR;
SELECT * FROM ATOR;
SELECT * FROM CONTA;
