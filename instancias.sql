INSERT INTO REGIAO VALUES ('Brazil');
INSERT INTO REGIAO VALUES ('India');
INSERT INTO REGIAO VALUES ('Japan');
INSERT INTO REGIAO VALUES ('UK');

INSERT INTO CONTA VALUES('r0g3r10','rogerinho@videogames.com', 'familiar', 0, 12345678910, 'ROGERIO V JOGOS', 1231487649182746, 1337, '5/13/2013', 'averdadeequeeunemjogo');
INSERT INTO CONTA VALUES('p3ss04','pessoa@provedor.com', 'individual', 1, 31234284901, 'PESSOA D SILVA', 123123123, 232, '3/2/1999', 'senha');
INSERT INTO CONTA VALUES('b4b1j0n3s','babyjones@bol.com.br', 'familiar', 2, 11111111111, 'BEBE JONAS', 123124523, 123, '2/4/2050', 'lavanderia123');
INSERT INTO CONTA VALUES('d3n1s','denishotmail@hotmail.com', 'familiar', 1, 22222222222, 'DENIS H EMAIL', 190580981, 998, '8/12/2024', 'SENHAsenhaSENHA');

INSERT INTO GENERO VALUES ('Terror');
INSERT INTO GENERO VALUES ('Comedia');
INSERT INTO GENERO VALUES ('Drama');
INSERT INTO GENERO VALUES ('Comedia Romantica');
INSERT INTO GENERO VALUES ('Suspense');
INSERT INTO GENERO VALUES ('Horror Existencial');

INSERT INTO PERFIL VALUES(0,'r0g3r10', 'Roger', '001.jpg', 'UK');
INSERT INTO PERFIL VALUES(1,'r0g3r10', 'Roger Infantil uwu', '002.jpg', 'UK');
INSERT INTO PERFIL VALUES(2,'r0g3r10', 'ROGER TRISTE', '003.jpg', 'UK');
INSERT INTO PERFIL VALUES(0,'b4b1j0n3s', 'Jonas', '004.jpg', 'Brazil');
INSERT INTO PERFIL VALUES(1,'b4b1j0n3s', 'Bebe do Jonas', '005.jpg', 'Brazil');
INSERT INTO PERFIL VALUES(0,'p3ss04', 'Pessoa Generica', '006.jpg', 'India');
INSERT INTO PERFIL VALUES(0,'d3n1s', 'DENIS', '007.jpg', 'Japan');

INSERT INTO PERFIL_PREFERE VALUES('r0g3r10', 1, 'Horror Existencial', 1);
INSERT INTO PERFIL_PREFERE VALUES('r0g3r10', 2, 'Comedia', 1);
INSERT INTO PERFIL_PREFERE VALUES('r0g3r10', 2, 'Terror', 2);
INSERT INTO PERFIL_PREFERE VALUES('r0g3r10', 2, 'Suspense', 3);
INSERT INTO PERFIL_PREFERE VALUES('b4b1j0n3s', 0, 'Comedia', 1);
INSERT INTO PERFIL_PREFERE VALUES('b4b1j0n3s', 1, 'Comedia Romantica', 2);
INSERT INTO PERFIL_PREFERE VALUES('b4b1j0n3s', 0, 'Suspense', 1);
INSERT INTO PERFIL_PREFERE VALUES('b4b1j0n3s', 0, 'Comedia', 2);
INSERT INTO PERFIL_PREFERE VALUES('p3ss04', 0, 'Comedia Romantica', 1);
INSERT INTO PERFIL_PREFERE VALUES('p3ss04', 0, 'Comedia', 2);
INSERT INTO PERFIL_PREFERE VALUES('d3n1s', 0, 'Terror', 1);
INSERT INTO PERFIL_PREFERE VALUES('d3n1s', 0, 'Horror Existencial', 2);
INSERT INTO PERFIL_PREFERE VALUES('d3n1s', 0, 'Suspense', 3);

INSERT INTO CINEASTA VALUES('kkkkkkkkkk','Mel Gibson');
INSERT INTO CINEASTA VALUES('beeeeeeees','Nicolas Cage');
INSERT INTO CINEASTA VALUES('(OvO)','Anya Taylor-Joy');
INSERT INTO CINEASTA VALUES('chalalale11','Timothee Chamalet');
INSERT INTO CINEASTA VALUES('1000000oscars','Meryl Streep');
INSERT INTO CINEASTA VALUES('abc123123','Sarah Paulson');
INSERT INTO CINEASTA VALUES('aaaaaaaaaaaa','Ari Aster');
INSERT INTO CINEASTA VALUES('bludbludblud','Quentin Tarantino');
INSERT INTO CINEASTA VALUES('z321321','Yorgos Lanthimos');
INSERT INTO CINEASTA VALUES('btr4eva','Gustavo Rocque');

INSERT INTO CONTEUDO VALUES('001', 'O Grito', 2004, 'Casa amaldicoada e etc', 'poster01.jpg', 16, false, 'filme');
INSERT INTO CONTEUDO VALUES('002', 'Filme Generico Netflix', 2021, 'Mesmos atores de sempre, mesmo drama de sempre', 'poster02.jpg', 14, true, 'filme');
INSERT INTO CONTEUDO VALUES('003', 'Serie Generica Netflix', 2021, 'Mesmos atores de sempre, mesmo drama de sempre, so que serie', 'poster03.jpg', 16, true, 'serie');
INSERT INTO CONTEUDO VALUES('004', 'Serie de Temporadas Curtas', 2015, 'Situacoes dramaticas que se resolvem rapidamente, ate que uma nova temporada seja lancada','poster04.jpg', 16, false, 'serie');
INSERT INTO CONTEUDO VALUES('005', 'Serie de Hospital', 2016, 'Nao sei sobre o que fala, mas muita gente ve', 'poster05.jpg', 12, false, 'serie');
INSERT INTO CONTEUDO VALUES('006', 'Coragem, o Cao Covarde', 1996, 'Tira o sono de criancas', 'poster06.jpg', 90, false, 'filme');
INSERT INTO CONTEUDO VALUES('007', 'Peixonauta o filme', 2020, '???', 'poster07.jpg', 0, false, 'filme');
INSERT INTO CONTEUDO VALUES('008', 'Velozes e Furiosos Tokyo Drift', 2008, 'Incrível como os outros mas não conta com The Rock', 'poster08.jpg', 14, false, 'filme');
INSERT INTO CONTEUDO VALUES('009', 'Começos', 2021, 'A trama comeca', 'thumb1.jpg',16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('010', 'A Invasão', 2021, 'A trama continua', 'thumb2.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('011', 'Serio, Jane?', 2021, 'Jane toma uma decisao questionavel', 'thumb3.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('012', 'Enchendo Linguiça', 2021, 'A trama insiste em continuar', 'thumb4.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('013', 'Netflix, isso vai dar certo', 2021, 'Apos o fim do orcamento, a protagonista precisa resolver tudo logo', 'thumb5.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('014', 'Valeu, Netflix!', 2021, 'Conseguiram novos investidores, serie continua', 'thumb5123.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('015', '???', 2021, 'Jane esta confusa, assim como o telespectador', 'thumb124.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('016', 'Luto', 2021, 'Jane morre e vc recebeu spoiler', 'thumb12451.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('017', 'Necromancia', 2021, 'Jane ressucita em uma ultima tentativa de continuar com o que deveria ter acabado', 'thumb18237.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('018', 'Acaba logo', 2021, 'Ninguem aguenta mais', 'thumb9912.jpg', 16, true, 'episodio');
INSERT INTO CONTEUDO VALUES('019', 'Kevin', 2015, 'Kevin mostra ser um garoto estranho', 'thumb6.jpg', 16, false, 'episodio');
INSERT INTO CONTEUDO VALUES('020', 'Kevin', 2015, 'Kevin mostra segue sendo estranho', 'thumb7.jpg', 16, false, 'episodio');
INSERT INTO CONTEUDO VALUES('021', 'Kevin', 2015, 'Kevin deixa de ser estranho', 'thumb8.jpg', 16, false, 'episodio');
INSERT INTO CONTEUDO VALUES('022', 'Nao Deu', 2016, 'Finjamos que essa faliu', 'thumb91240.jpg', 12, false, 'episodio');

-- feito ate aqui

INSERT INTO LISTA_PERFIL VALUES('denishotmail@hotmail.com', 'DENIS', '007');
INSERT INTO LISTA_PERFIL VALUES('babyjones@bol.com.br', 'Jonas', '001');
INSERT INTO LISTA_PERFIL VALUES('babyjones@bol.com.br', 'Jonas', '002');

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
INSERT INTO DO_GENERO VALUES('007', 'Horror Existencial');

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

INSERT INTO LEGENDA_AUDIO_FILMES VALUES('001', '008.mp3');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('001', '009.mp3');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('001', '005.srt');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('001', '007.srt');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('002', '002.mp3');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('002', '006.srt');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('006', '003.mp3');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('006', '008.srt');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('007', '004.mp3');
INSERT INTO LEGENDA_AUDIO_FILMES VALUES('007', '009.srt');

INSERT INTO LEGENDA_AUDIO_EPISODIOS VALUES('003', 1, 1, '001.srt');
INSERT INTO LEGENDA_AUDIO_EPISODIOS VALUES('003', 1, 1, '002.srt');
INSERT INTO LEGENDA_AUDIO_EPISODIOS VALUES('003', 1, 1, '001.mp3');
INSERT INTO LEGENDA_AUDIO_EPISODIOS VALUES('003', 1, 2, '006.mp3');
INSERT INTO LEGENDA_AUDIO_EPISODIOS VALUES('004', 1, 1, '007.mp3');
INSERT INTO LEGENDA_AUDIO_EPISODIOS VALUES('004', 1, 1, '003.srt');
INSERT INTO LEGENDA_AUDIO_EPISODIOS VALUES('004', 2, 1, '005.mp3');

INSERT INTO DISPONIVEL_PARA VALUES('001', 'Brazil');
INSERT INTO DISPONIVEL_PARA VALUES('002', 'Brazil');
INSERT INTO DISPONIVEL_PARA VALUES('003', 'Brazil');
INSERT INTO DISPONIVEL_PARA VALUES('004', 'Brazil');
INSERT INTO DISPONIVEL_PARA VALUES('004', 'India');
INSERT INTO DISPONIVEL_PARA VALUES('005', 'India');
INSERT INTO DISPONIVEL_PARA VALUES('006', 'India');
INSERT INTO DISPONIVEL_PARA VALUES('007', 'India');
INSERT INTO DISPONIVEL_PARA VALUES('001', 'Japan');
INSERT INTO DISPONIVEL_PARA VALUES('002', 'Japan');
INSERT INTO DISPONIVEL_PARA VALUES('003', 'Japan');
INSERT INTO DISPONIVEL_PARA VALUES('004', 'Japan');
INSERT INTO DISPONIVEL_PARA VALUES('005', 'Japan');
INSERT INTO DISPONIVEL_PARA VALUES('006', 'Japan');
INSERT INTO DISPONIVEL_PARA VALUES('007', 'Japan');
INSERT INTO DISPONIVEL_PARA VALUES('001', 'UK');
INSERT INTO DISPONIVEL_PARA VALUES('005', 'UK');
INSERT INTO DISPONIVEL_PARA VALUES('006', 'UK');
INSERT INTO DISPONIVEL_PARA VALUES('007', 'UK');

INSERT INTO MOTIVO_RECOMENDACAO VALUES('Diretor');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Ator');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Genero');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Numero de Visualizacoes');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Relevancia');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Em Alta na Regiao');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Ator em Alta');

INSERT INTO ASSISTIR VALUES('denishotmail@hotmail.com', 'DENIS', '001', true, 'positivo', NULL, NULL, 95); 
INSERT INTO ASSISTIR VALUES('denishotmail@hotmail.com', 'DENIS', '007', false, 'negativo', NULL, NULL, 69); 
INSERT INTO ASSISTIR VALUES('rogerinho@videogames.com', 'ROGER TRISTE', '006', true, 'positivo', NULL, NULL, 80); 
INSERT INTO ASSISTIR VALUES('pessoa@provedor.com', 'Pessoa Generica', '004', false, NULL, 's03e01', 13, 75);
INSERT INTO ASSISTIR VALUES('babyjones@bol.com.br', 'Jonas', '003', true, NULL, NULL, NULL, 80); 

INSERT INTO RECOMENDACOES_PERFIL VALUES('denishotmail@hotmail.com', 'DENIS', '006', 'Genero');
INSERT INTO RECOMENDACOES_PERFIL VALUES('denishotmail@hotmail.com', 'DENIS', '002', 'Em Alta na Regiao');
INSERT INTO RECOMENDACOES_PERFIL VALUES('rogerinho@videogames.com', 'ROGER TRISTE', '001', 'Genero');
INSERT INTO RECOMENDACOES_PERFIL VALUES('babyjones@bol.com.br', 'Jonas', '002', 'Ator'); 

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


