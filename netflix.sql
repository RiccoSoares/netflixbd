DROP TABLE IF EXISTS REGIAO CASCADE;
DROP TABLE IF EXISTS CONTA CASCADE;
DROP TABLE IF EXISTS PERFIL CASCADE;
DROP TABLE IF EXISTS GENERO CASCADE;
DROP TABLE IF EXISTS PERFIL_PREFERE CASCADE;
DROP TABLE IF EXISTS DIRETOR CASCADE;
DROP TABLE IF EXISTS ATOR CASCADE;
DROP TABLE IF EXISTS CONTEUDO CASCADE;
DROP TABLE IF EXISTS AUDIO CASCADE;
DROP TABLE IF EXISTS LEGENDA CASCADE;
DROP TABLE IF EXISTS AUDIO_LEGENDA CASCADE;
DROP TABLE IF EXISTS TEMPORADAS CASCADE;
DROP TABLE IF EXISTS EPISODIOS CASCADE;
DROP TABLE IF EXISTS LEGENDA_AUDIO_EPISODIOS CASCADE;
DROP TABLE IF EXISTS LEGENDA_AUDIO_FILMES CASCADE;
DROP TABLE IF EXISTS LISTA_PERFIL CASCADE;
DROP TABLE IF EXISTS MOTIVO_RECOMENDACAO CASCADE;
DROP TABLE IF EXISTS RECOMENDACOES_PERFIL CASCADE;
DROP TABLE IF EXISTS DISPONIVEL_PARA CASCADE;
DROP TABLE IF EXISTS ESTRELANDO CASCADE;
DROP TABLE IF EXISTS DO_GENERO CASCADE;
DROP TABLE IF EXISTS DIRIGIDO_POR CASCADE;
DROP TABLE IF EXISTS ASSISTIR CASCADE;

CREATE TABLE REGIAO
	(nome VARCHAR(200) NOT NULL,
PRIMARY KEY(nome));
 
CREATE TABLE  CONTA
	(email VARCHAR(254) NOT NULL,
	plano NUMERIC(3) NOT NULL,
	telasonline NUMERIC(1) NOT NULL,
	cpf NUMERIC(11) NOT NULL UNIQUE,
	cartao_titular VARCHAR(26) NOT NULL,
	cartao_numero NUMERIC(19) NOT NULL,
	cartao_cvv NUMERIC(4) NOT NULL,
	cartao_val DATE NOT NULL,
	senha VARCHAR(64) NOT NULL,
PRIMARY KEY (email));

CREATE TABLE PERFIL
	(email_conta VARCHAR(254) NOT NULL,
	nome VARCHAR(50) NOT NULL,
	imagem VARCHAR(255) NOT NULL, --endereco do arquivo de imagem
	regiao VARCHAR(20),
PRIMARY KEY(email_conta, nome),
FOREIGN KEY(email_conta) REFERENCES CONTA(email) ON DELETE CASCADE,
FOREIGN KEY(regiao) REFERENCES REGIAO(nome) ON DELETE SET NULL);

CREATE TABLE GENERO
	(nome VARCHAR(30) NOT NULL,
PRIMARY KEY(nome));

CREATE TABLE PERFIL_PREFERE --preferencia do usuario por generos
	(email_perfil VARCHAR(254) NOT NULL,
	nome_perfil VARCHAR(50) NOT NULL,
	nome_genero VARCHAR(30) NOT NULL,
	ordem NUMERIC(3) NOT NULL,
PRIMARY KEY(email_perfil, nome_perfil, nome_genero),
FOREIGN KEY(email_perfil, nome_perfil) REFERENCES PERFIL(email_conta, nome) ON DELETE CASCADE,
FOREIGN KEY(nome_genero) REFERENCES GENERO(nome) ON DELETE CASCADE);
 
CREATE TABLE DIRETOR
	(nome VARCHAR(150) NOT NULL,
PRIMARY KEY (nome));

CREATE TABLE ATOR
	(nome VARCHAR(150) NOT NULL,
PRIMARY KEY (nome));

CREATE TABLE CONTEUDO
	(id VARCHAR(30) NOT NULL,
	nome VARCHAR(150) NOT NULL,
	ano NUMERIC(4) NOT NULL,
	sinopse VARCHAR(400) NOT NULL,
	poster VARCHAR(255) NOT NULL UNIQUE,
	ci NUMERIC(2) NOT NULL,
	visu INT NOT NULL,
	original BOOLEAN NOT NULL,
	tipo VARCHAR(5) NOT NULL,--tipicamente 'serie' ou 'filme'
PRIMARY KEY (id));

CREATE TABLE AUDIO_LEGENDA --tabela contendo arquivos de audio ou de legenda no banco de dados
	(arquivo VARCHAR(255) NOT NULL UNIQUE, --caminho do arquivo
	idioma VARCHAR(30) NOT NULL,
	descricao VARCHAR(10) NOT NULL, --tipicacamente 'audio' ou 'legenda'
PRIMARY KEY(arquivo, descricao));

CREATE TABLE LEGENDA_AUDIO_FILMES --tabela que contem as opcoes de audio e legenda para os filmes
	(id_conteudo VARCHAR(30) NOT NULL,
	nome_arquivo VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY(id_conteudo, nome_arquivo),
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) ON DELETE CASCADE,
FOREIGN KEY(nome_arquivo) REFERENCES AUDIO_LEGENDA(arquivo) ON DELETE SET NULL); 

CREATE TABLE TEMPORADAS
	(id_serie VARCHAR(30) NOT NULL,
	numero NUMERIC(2) NOT NULL,
PRIMARY KEY(id_serie, numero),
FOREIGN KEY(id_serie) REFERENCES CONTEUDO(id) ON DELETE CASCADE);

CREATE TABLE EPISODIOS
	(id_temporada VARCHAR(30) NOT NULL,
	numero_temporada NUMERIC(2) NOT NULL,
	numero NUMERIC(2) NOT NULL,
	sinopse VARCHAR(400) NOT NULL,
	thumbnail VARCHAR(255) NOT NULL,
	nome VARCHAR(100),
	arquivo VARCHAR(255) NOT NULL,	
PRIMARY KEY(id_temporada, numero_temporada, numero),
FOREIGN KEY(id_temporada, numero_temporada) REFERENCES TEMPORADAS(id_serie, numero) ON DELETE CASCADE);

CREATE TABLE LEGENDA_AUDIO_EPISODIOS --tabela que contem as opceos de audio e legenda para os episodios de series
	(id_temporada VARCHAR(30) NOT NULL,
	numero_temporada NUMERIC(2) NOT NULL,
	numero_episodio NUMERIC(2) NOT NULL,
	nome_arquivo VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY(id_temporada, numero_temporada, numero_episodio, nome_arquivo),
FOREIGN KEY(id_temporada, numero_temporada, numero_episodio) REFERENCES EPISODIOS(id_temporada, numero_temporada, numero) ON DELETE CASCADE,
FOREIGN KEY(nome_arquivo) REFERENCES AUDIO_LEGENDA(arquivo) ON DELETE CASCADE);

CREATE TABLE LISTA_PERFIL --lista de conteudos ("para ver depois") de um perfil
	(email_perfil VARCHAR(254) NOT NULL,
	nome_perfil VARCHAR(50) NOT NULL,
	id_conteudo VARCHAR(30) NOT NULL,
PRIMARY KEY(email_perfil, nome_perfil, id_conteudo),
FOREIGN KEY(email_perfil, nome_perfil) REFERENCES PERFIL(email_conta, nome) ON DELETE CASCADE,
FOREIGN KEY(id_conteudo) REFERENCES CONTEUDO(id) ON DELETE CASCADE);

CREATE TABLE MOTIVO_RECOMENDACAO --tabela de motivos pre-especificados pelos quais um conteudo pode ser recomendado a um usuario
	(motivo VARCHAR(50) NOT NULL,
PRIMARY KEY(motivo));

CREATE TABLE RECOMENDACOES_PERFIL --tabela de conteudos recomendados especificamente para um perifl
	(email_perfil VARCHAR(254) NOT NULL,
	nome_perfil VARCHAR(50) NOT NULL,
	id_conteudo VARCHAR(30) NOT NULL,
	motivo VARCHAR(30) NOT NULL,
PRIMARY KEY(email_perfil, nome_perfil, id_conteudo),
FOREIGN KEY(email_perfil, nome_perfil) REFERENCES PERFIL(email_conta, nome) ON DELETE CASCADE,
FOREIGN KEY(motivo) REFERENCES MOTIVO_RECOMENDACAO(motivo) ON DELETE CASCADE);
	
CREATE TABLE DISPONIVEL_PARA --disponibilidade de obra em regioes
	(conteudo_id VARCHAR(30) NOT NULL,
	regiao_nome VARCHAR(200) NOT NULL,
PRIMARY KEY(conteudo_id, regiao_nome),
FOREIGN KEY(conteudo_id) REFERENCES CONTEUDO(id) ON DELETE CASCADE,
FOREIGN KEY(regiao_nome) REFERENCES REGIAO(nome) ON DELETE CASCADE);

CREATE TABLE ESTRELANDO --atores presentes em obra
	(conteudo_id VARCHAR(30) NOT NULL,
	ator_nome VARCHAR(150) NOT NULL,
PRIMARY KEY(conteudo_id, ator_nome),
FOREIGN KEY(conteudo_id) REFERENCES CONTEUDO(id) ON DELETE CASCADE,
FOREIGN KEY(ator_nome) REFERENCES ATOR(nome) ON DELETE CASCADE);

CREATE TABLE DO_GENERO --generos da obra
	(conteudo_id VARCHAR(30) NOT NULL,
	genero_nome VARCHAR(30) NOT NULL,
PRIMARY KEY(conteudo_id, genero_nome),
FOREIGN KEY(conteudo_id) REFERENCES CONTEUDO(id) ON DELETE CASCADE,
FOREIGN KEY (genero_nome) REFERENCES GENERO(nome) ON DELETE CASCADE);

CREATE TABLE DIRIGIDO_POR --diretores da obra
	(conteudo_id VARCHAR(30) NOT NULL,
	nome_diretor VARCHAR(150) NOT NULL,
PRIMARY KEY(conteudo_id, nome_diretor),
FOREIGN KEY(conteudo_id) REFERENCES CONTEUDO(id) ON DELETE CASCADE,
FOREIGN KEY(nome_diretor) REFERENCES DIRETOR(nome) ON DELETE CASCADE);
	
CREATE TABLE ASSISTIR 
	(email_conta VARCHAR(254) NOT NULL,
	perfil	VARCHAR(50) NOT NULL,
	conteudo_id VARCHAR(30) NOT NULL,
	assitido_comp BOOLEAN NOT NULL,
	feedback CHAR(8),
	ultimo_ep_visto CHAR(6),
	no_tempo NUMERIC(4),
	relevancia NUMERIC(100),
PRIMARY KEY(email_conta, perfil, conteudo_id),
FOREIGN KEY(email_conta, perfil) REFERENCES PERFIL(email_conta, nome) ON DELETE CASCADE,
FOREIGN KEY(conteudo_id) REFERENCES CONTEUDO(id) ON DELETE CASCADE);
	
	
INSERT INTO REGIAO VALUES ('Brazil');
INSERT INTO REGIAO VALUES ('India');
INSERT INTO REGIAO VALUES ('Japan');
INSERT INTO REGIAO VALUES ('UK');

INSERT INTO CONTA VALUES('rogerinho@videogames.com', 00, 0, 12345678910, 'ROGERIO V JOGOS', 1337, 1337, '5/13/2013', 'averdadeequeeunemjogo');
INSERT INTO CONTA VALUES('pessoa@provedor.com', 01, 1, 31234284901, 'PESSOA D SILVA', 123123123, 232, '3/2/1999', 'senha');
INSERT INTO CONTA VALUES('babyjones@bol.com.br', 01, 2, 11111111111, 'BEBE JONAS', 123124523, 123, '2/4/2050', 'lavanderia123');
INSERT INTO CONTA VALUES('denishotmail@hotmail.com', 00, 1, 22222222222, 'DENIS H EMAIL', 190580981, 998, '8/12/2024', 'SENHAsenhaSENHA');

INSERT INTO GENERO VALUES ('Terror');
INSERT INTO GENERO VALUES ('Comedia');
INSERT INTO GENERO VALUES ('Drama');
INSERT INTO GENERO VALUES ('Comedia Romantica');
INSERT INTO GENERO VALUES ('Suspense');
INSERT INTO GENERO VALUES ('Horror Existencial');

INSERT INTO PERFIL VALUES('rogerinho@videogames.com', 'Roger', '001.jpg', 'UK');
INSERT INTO PERFIL VALUES('rogerinho@videogames.com', 'Roger Infantil', '002.jpg', 'UK');
INSERT INTO PERFIL VALUES('rogerinho@videogames.com', 'ROGER TRISTE', '003.jpg', 'UK');
INSERT INTO PERFIL VALUES('babyjones@bol.com.br', 'Jonas', '004.jpg', 'Brazil');
INSERT INTO PERFIL VALUES('babyjones@bol.com.br', 'Bebe do Jonas', '005.jpg', 'Brazil');
INSERT INTO PERFIL VALUES('pessoa@provedor.com', 'Pessoa Generica', '006.jpg', 'India');
INSERT INTO PERFIL VALUES('denishotmail@hotmail.com', 'DENIS', '007.jpg', 'Japan');

INSERT INTO PERFIL_PREFERE VALUES('rogerinho@videogames.com', 'Roger Infantil', 'Comedia', 1);
INSERT INTO PERFIL_PREFERE VALUES('rogerinho@videogames.com', 'ROGER TRISTE', 'Horror Existencial', 1);
INSERT INTO PERFIL_PREFERE VALUES('rogerinho@videogames.com', 'ROGER TRISTE', 'Terror', 2);
INSERT INTO PERFIL_PREFERE VALUES('rogerinho@videogames.com', 'ROGER TRISTE', 'Suspense', 3);
INSERT INTO PERFIL_PREFERE VALUES('babyjones@bol.com.br', 'Bebe do Jonas', 'Comedia', 1);
INSERT INTO PERFIL_PREFERE VALUES('babyjones@bol.com.br', 'Bebe do Jonas', 'Comedia Romantica', 2);
INSERT INTO PERFIL_PREFERE VALUES('babyjones@bol.com.br', 'Jonas', 'Suspense', 1);
INSERT INTO PERFIL_PREFERE VALUES('babyjones@bol.com.br', 'Jonas', 'Comedia', 2);
INSERT INTO PERFIL_PREFERE VALUES('pessoa@provedor.com', 'Pessoa Generica', 'Comedia Romantica', 1);
INSERT INTO PERFIL_PREFERE VALUES('pessoa@provedor.com', 'Pessoa Generica', 'Comedia', 2);
INSERT INTO PERFIL_PREFERE VALUES('denishotmail@hotmail.com', 'DENIS', 'Terror', 1);
INSERT INTO PERFIL_PREFERE VALUES('denishotmail@hotmail.com', 'DENIS', 'Horror Existencial', 2);
INSERT INTO PERFIL_PREFERE VALUES('denishotmail@hotmail.com', 'DENIS', 'Suspense', 3);

INSERT INTO DIRETOR VALUES('Bong Joon-ho');
INSERT INTO DIRETOR VALUES('Diretor 1');
INSERT INTO DIRETOR VALUES('Diretor 2');
INSERT INTO DIRETOR VALUES('Diretor 3');
INSERT INTO DIRETOR VALUES('Diretor 4');

INSERT INTO ATOR VALUES('Ator 1');
INSERT INTO ATOR VALUES('Ator 2');
INSERT INTO ATOR VALUES('Ator 3');
INSERT INTO ATOR VALUES('Ator 4');
INSERT INTO ATOR VALUES('Ator Querido da Netflix');

INSERT INTO CONTEUDO VALUES('001', 'O Grito', 2004, 'Casa amaldicoada e etc', 'poster01.jpg', 16, 3400, false, 'filme');
INSERT INTO CONTEUDO VALUES('002', 'Filme Generico Netflix', 2021, 'Mesmos atores de sempre, mesmo drama de sempre', 'poster02.jpg', 14, 1000000000, true, 'filme');
INSERT INTO CONTEUDO VALUES('003', 'Serie Generica Netflix', 2021, 'Mesmos atores de sempre, mesmo drama de sempre, so que serie', 'poster03.jpg', 16, 900000, true, 'serie');
INSERT INTO CONTEUDO VALUES('004', 'Serie de Temporadas Curtas', 2015, 'Situacoes dramaticas que se resolvem rapidamente, ate que uma nova temporada seja lancada','poster04.jpg', 16, 500000, false, 'serie');
INSERT INTO CONTEUDO VALUES('005', 'Serie de Hospital', 2016, 'Nao sei sobre o que fala, mas muita gente ve', 'poster05.jpg', 12, 1000000, false, 'serie');
INSERT INTO CONTEUDO VALUES('006', 'Coragem, o Cao Covarde', 1996, 'Tira o sono de criancas', 'poster06.jpg', 90, 4000, false, 'filme');
INSERT INTO CONTEUDO VALUES('007', 'Peixonauta o filme', 2020, '???', 'poster07.jpg', 0, 5999, false, 'filme');

INSERT INTO DO_GENERO VALUES('001', 'Terror');
INSERT INTO DO_GENERO VALUES('002', 'Comedia Romantica');
INSERT INTO DO_GENERO VALUES('002', 'Drama');
INSERT INTO DO_GENERO VALUES('002', 'Suspense');
INSERT INTO DO_GENERO VALUES('003', 'Comedia Romantica');
INSERT INTO DO_GENERO VALUES('003', 'Drama');
INSERT INTO DO_GENERO VALUES('003', 'Suspense');
INSERT INTO DO_GENERO VALUES('004', 'Drama');
INSERT INTO DO_GENERO VALUES('005', 'Suspense');
INSERT INTO DO_GENERO VALUES('006', 'Horror Existencial');
INSERT INTO DO_GENERO VALUES('006', 'Terror');
INSERT INTO DO_GENERO VALUES('007', 'Comedia');

INSERT INTO DIRIGIDO_POR VALUES('001', 'Diretor 1');
INSERT INTO DIRIGIDO_POR VALUES('002', 'Bong Joon-ho');
INSERT INTO DIRIGIDO_POR VALUES('003', 'Bong Joon-ho');
INSERT INTO DIRIGIDO_POR VALUES('004', 'Diretor 2');
INSERT INTO DIRIGIDO_POR VALUES('005', 'Diretor 3');
INSERT INTO DIRIGIDO_POR VALUES('006', 'Diretor 4');
INSERT INTO DIRIGIDO_POR VALUES('007', 'Bong Joon-ho');

INSERT INTO ESTRELANDO VALUES('001', 'Ator 1');
INSERT INTO ESTRELANDO VALUES('002', 'Ator 1');
INSERT INTO ESTRELANDO VALUES('002', 'Ator Querido da Netflix');
INSERT INTO ESTRELANDO VALUES('003', 'Ator Querido da Netflix');
INSERT INTO ESTRELANDO VALUES('003', 'Ator 2');
INSERT INTO ESTRELANDO VALUES('004', 'Ator 3');
INSERT INTO ESTRELANDO VALUES('005', 'Ator Querido da Netflix');
INSERT INTO ESTRELANDO VALUES('005', 'Ator 4');

INSERT INTO TEMPORADAS VALUES('003', 1);
INSERT INTO TEMPORADAS VALUES('003', 2);
INSERT INTO TEMPORADAS VALUES('004', 1);
INSERT INTO TEMPORADAS VALUES('004', 2);
INSERT INTO TEMPORADAS VALUES('003', 3);
INSERT INTO TEMPORADAS VALUES('005', 1);
INSERT INTO TEMPORADAS VALUES('003', 4);
INSERT INTO TEMPORADAS VALUES('004', 3);
INSERT INTO TEMPORADAS VALUES('003', 5);

INSERT INTO EPISODIOS VALUES('003', 1, 1, 'A trama comeca', 'thumb1.jpg', 'O Inicio', '0031ep1.mp4');
INSERT INTO EPISODIOS VALUES('003', 1, 2, 'A trama continua', 'thumb2.jpg', 'A parte 2', '0031ep2.mp4');
INSERT INTO EPISODIOS VALUES('003', 1, 3, 'Jane toma uma decisao questionavel', 'thumb3.jpg', 'A Decisao', '0031ep3.mp4');
INSERT INTO EPISODIOS VALUES('003', 2, 1, 'A trama insiste em continuar', 'thumb4.jpg', 'A Nova Parte 2', '0032ep1.mp4');
INSERT INTO EPISODIOS VALUES('003', 2, 2, 'Apos o fim do orcamento, a protagonista precisa resolver tudo logo', 'thumb5.jpg', 'O fim', '0032ep2.mp4');

INSERT INTO AUDIO_LEGENDA VALUES('001.srt', 'portugues', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('002.srt', 'ingles', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('003.srt', 'japones', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('004.srt', 'espanhol', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('005.srt', 'ingles', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('006.srt', 'ingles', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('007.srt', 'ingles', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('008.srt', 'espanhol', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('009.srt', 'portugues', 'legenda');
INSERT INTO AUDIO_LEGENDA VALUES('001.mp3', 'ingles', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('002.mp3', 'ingles', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('003.mp3', 'espanhol', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('004.mp3', 'japones', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('005.mp3', 'ingles', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('006.mp3', 'portugues', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('007.mp3', 'ingles', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('008.mp3', 'ingles', 'audio');
INSERT INTO AUDIO_LEGENDA VALUES('009.mp3', 'japones', 'audio');

INSERT INTO MOTIVO_RECOMENDACAO VALUES('Diretor');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Ator');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Genero');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Numero de Visualizacoes');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Relevancia');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Em alta na regiao');


SELECT * FROM REGIAO;
SELECT * FROM CONTA;
SELECT * FROM PERFIL;
SELECT * FROM GENERO;
SELECT * FROM PERFIL_PREFERE;
SELECT * FROM DIRETOR;
SELECT * FROM ATOR;
SELECT * FROM CONTEUDO;
SELECT * FROM AUDIO_LEGENDA;
SELECT * FROM TEMPORADAS;
SELECT * FROM EPISODIOS;
SELECT * FROM LEGENDA_AUDIO_EPISODIOS;
SELECT * FROM LEGENDA_AUDIO_FILMES;
SELECT * FROM LISTA_PERFIL;
SELECT * FROM MOTIVO_RECOMENDACAO;
SELECT * FROM RECOMENDACOES_PERFIL;
SELECT * FROM DISPONIVEL_PARA;
SELECT * FROM ESTRELANDO;
SELECT * FROM DO_GENERO;
SELECT * FROM DIRIGIDO_POR;
SELECT * FROM ASSISTIR;


