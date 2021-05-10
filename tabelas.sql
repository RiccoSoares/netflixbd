DROP TABLE IF EXISTS REGIAO CASCADE;
DROP TABLE IF EXISTS CONTA CASCADE;
DROP TABLE IF EXISTS PERFIL CASCADE;
DROP TABLE IF EXISTS GENERO CASCADE;
DROP TABLE IF EXISTS PERFIL_PREFERE CASCADE;
DROP TABLE IF EXISTS CINEASTA CASCADE;
DROP TABLE IF EXISTS CONTEUDO CASCADE;
DROP TABLE IF EXISTS TEMPORADAS CASCADE;
DROP TABLE IF EXISTS EPISODIO CASCADE;
DROP TABLE IF EXISTS LEGENDA_AUDIO CASCADE;
DROP TABLE IF EXISTS LISTA CASCADE;
DROP TABLE IF EXISTS MOTIVO_RECOMENDACAO CASCADE;
DROP TABLE IF EXISTS RECOMENDACOES CASCADE;
DROP TABLE IF EXISTS REGIOES_DISPONIVEIS CASCADE;
DROP TABLE IF EXISTS PARTICIPACAO CASCADE;
DROP TABLE IF EXISTS DO_GENERO CASCADE;
DROP TABLE IF EXISTS ASSISTIR CASCADE;
DROP TABLE IF EXISTS ASSISTIVEL CASCADE;

CREATE TABLE REGIAO
	(nome VARCHAR(200) NOT NULL,
PRIMARY KEY(nome));
 
CREATE TABLE  CONTA
	(id VARCHAR(30) NOT NULL UNIQUE,
	email VARCHAR(254) NOT NULL UNIQUE,
	plano VARCHAR(10) NOT NULL,
	telasonline NUMERIC(1) NOT NULL,
	cpf NUMERIC(11) NOT NULL UNIQUE,
	cartao_titular VARCHAR(26) NOT NULL,
	cartao_numero NUMERIC(19) NOT NULL,
	cartao_cvv NUMERIC(4) NOT NULL,
	cartao_val DATE NOT NULL,
	senha VARCHAR(64) NOT NULL,
PRIMARY KEY (id));

CREATE TABLE PERFIL
	(id VARCHAR NOT NULL,
	id_conta VARCHAR(30) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	imagem VARCHAR(255) NOT NULL, --endereco do arquivo de imagem
	regiao VARCHAR(20),
PRIMARY KEY(id_conta, id),
FOREIGN KEY(id_conta) REFERENCES CONTA(id) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(regiao) REFERENCES REGIAO(nome) 
ON DELETE SET NULL);

CREATE TABLE GENERO
	(id  VARCHAR(7),
	nome VARCHAR(30) UNIQUE,
PRIMARY KEY(id));

CREATE TABLE PERFIL_PREFERE --preferencia do usuario por generos
	(id_conta VARCHAR(30) NOT NULL,	
	id_perfil VARCHAR NOT NULL,
	id_genero VARCHAR(7) NOT NULL,
	ordem NUMERIC(3) NOT NULL,
PRIMARY KEY(id_conta, id_perfil, id_genero),
FOREIGN KEY(id_conta, id_perfil) REFERENCES PERFIL(id_conta, id) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(id_genero) REFERENCES GENERO(id) 
ON DELETE CASCADE
ON UPDATE CASCADE);
 
CREATE TABLE CINEASTA
	(id VARCHAR(30),
	nome VARCHAR(150) NOT NULL,
PRIMARY KEY (id));

CREATE TABLE CONTEUDO
	(id VARCHAR(30) NOT NULL,
	nome VARCHAR(150) NOT NULL,
	ano NUMERIC(4) NOT NULL,
	sinopse VARCHAR(400) NOT NULL,
	poster VARCHAR(255) NOT NULL UNIQUE,
	ci NUMERIC(2) NOT NULL,
	original BOOLEAN NOT NULL,
	tipo VARCHAR(8) NOT NULL,--tipicamente 'serie', 'filme' ou 'episodio'
CHECK(tipo IN('serie', 'filme', 'episodio')),
PRIMARY KEY (id));

CREATE TABLE ASSISTIVEL
	(id_conteudo VARCHAR(30) NOT NULL,
	arquivo	VARCHAR(255) NOT NULL UNIQUE,
	visualizacoes INT,
PRIMARY KEY(id_conteudo),
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id)
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE TEMPORADAS
	(id_serie VARCHAR(30) NOT NULL,
	numero NUMERIC(3) NOT NULL,
PRIMARY KEY(id_serie, numero),
FOREIGN KEY(id_serie) REFERENCES CONTEUDO(id) 
ON DELETE CASCADE);

CREATE TABLE EPISODIO
	(id_assistivel VARCHAR(30) NOT NULL,
	temporada NUMERIC(3) NOT NULL,
	id_serie VARCHAR(30) NOT NULL,
	numero NUMERIC(3) NOT NULL,
PRIMARY KEY(id_serie,temporada,numero),
FOREIGN KEY(id_assistivel) REFERENCES ASSISTIVEL(id_conteudo) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(temporada,id_serie) REFERENCES TEMPORADAS(numero,id_serie) 
ON DELETE CASCADE);

CREATE TABLE LEGENDA_AUDIO --tabela que contem todos os arquivos de legenda ou audio
	(id_conteudo VARCHAR(30) NOT NULL,
	nome_arquivo VARCHAR(255) NOT NULL UNIQUE,
	idioma VARCHAR(30) NOT NULL,
	espec VARCHAR(7) NOT NULL, --tipicamente 'audio' ou 'legenda'
CHECK(espec IN('audio', 'legenda')),
PRIMARY KEY(nome_arquivo),
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) 
ON DELETE CASCADE);


CREATE TABLE LISTA --lista de conteudos ("para ver depois") de um perfil
	(id_conta VARCHAR(30) NOT NULL,
	id_perfil VARCHAR NOT NULL,
	id_conteudo VARCHAR(30) NOT NULL,
PRIMARY KEY(id_conta, id_perfil, id_conteudo),
FOREIGN KEY(id_conta, id_perfil) REFERENCES PERFIL(id_conta, id) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) 
ON DELETE CASCADE);

CREATE TABLE MOTIVO_RECOMENDACAO --tabela de motivos pre-especificados pelos quais um conteudo pode ser recomendado a um usuario
	(motivo VARCHAR(50) NOT NULL,
PRIMARY KEY(motivo));

CREATE TABLE RECOMENDACOES --tabela de conteudos recomendados especificamente para um perfil
	(id_conta VARCHAR(30) NOT NULL,
	id_perfil VARCHAR NOT NULL,
	id_conteudo VARCHAR(30) NOT NULL,
	motivo VARCHAR(30) NOT NULL,
PRIMARY KEY(id_conta, id_perfil, id_conteudo, motivo),
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id)
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(id_conta, id_perfil) REFERENCES PERFIL(id_conta, id) 
ON DELETE CASCADE,
FOREIGN KEY(motivo) REFERENCES MOTIVO_RECOMENDACAO(motivo) 
ON DELETE CASCADE
ON UPDATE CASCADE);
	
CREATE TABLE REGIOES_DISPONIVEIS --disponibilidade de obra em regioes
	(id_conteudo VARCHAR(30) NOT NULL,
	regiao VARCHAR(200) NOT NULL,
PRIMARY KEY(id_conteudo, regiao),
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) 
ON DELETE CASCADE,
FOREIGN KEY(regiao) REFERENCES REGIAO(nome) 
ON DELETE CASCADE);

CREATE TABLE PARTICIPACAO --trabalhadores da dramaturgia presentes em obra
	(id_conteudo VARCHAR(30) NOT NULL,
	id_cineasta VARCHAR(150) NOT NULL,
	funcao VARCHAR(7) NOT NULL,
CHECK(funcao IN('ator', 'diretor')),
PRIMARY KEY(id_conteudo, id_cineasta, funcao),
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) 
ON DELETE CASCADE,
FOREIGN KEY(id_cineasta) REFERENCES CINEASTA(id) 
ON DELETE CASCADE
ON UPDATE CASCADE);

CREATE TABLE DO_GENERO --generos da obra
	(id_conteudo VARCHAR(30) NOT NULL,
	id_genero VARCHAR(7) NOT NULL,
PRIMARY KEY(id_conteudo, id_genero),
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) 
ON DELETE CASCADE,
FOREIGN KEY (id_genero) REFERENCES GENERO(id) 
ON DELETE CASCADE
ON UPDATE CASCADE);
	
CREATE TABLE ASSISTIR 
	(id_conta VARCHAR(30) NOT NULL,
	id_perfil VARCHAR NOT NULL,
	id_conteudo VARCHAR(30) NOT NULL,
	assitido BOOLEAN NOT NULL,
	avaliacao CHAR(8), --assume os valores "positivo" ou "negativo"
	tempo_assistido NUMERIC(4),
	relevancia NUMERIC(100),
CHECK(avaliacao IN ('positivo', 'negativo')),
PRIMARY KEY(id_conta, id_perfil, id_conteudo),
FOREIGN KEY(id_conta, id_perfil) REFERENCES PERFIL(id_conta, id) 
ON DELETE CASCADE
ON UPDATE CASCADE,
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) 
ON DELETE CASCADE);
