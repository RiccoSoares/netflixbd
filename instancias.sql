INSERT INTO REGIAO VALUES ('Brazil');
INSERT INTO REGIAO VALUES ('India');
INSERT INTO REGIAO VALUES ('Japan');
INSERT INTO REGIAO VALUES ('UK');


INSERT INTO CONTA VALUES('1','rogerinho@videogames.com', 'familiar', 0, 12345678910, 'ROGERIO V JOGOS', 1231487649182746, 1337, '5/12/2013', 'averdadeequeeunemjogo');
INSERT INTO CONTA VALUES('2','pessoa@provedor.com', 'individual', 1, 31234284901, 'PESSOA D SILVA', 123123123, 232, '3/2/1999', 'senha');
INSERT INTO CONTA VALUES('3','babyjones@bol.com.br', 'familiar', 2, 11111111111, 'BEBE JONAS', 123124523, 123, '2/4/2050', 'lavanderia123');
INSERT INTO CONTA VALUES('4','denishotmail@hotmail.com', 'familiar', 1, 22222222222, 'DENIS H EMAIL', 190580981, 998, '8/12/2024', 'SENHAsenhaSENHA');


INSERT INTO GENERO VALUES ('1','Terror');
INSERT INTO GENERO VALUES ('2','Comedia');
INSERT INTO GENERO VALUES ('3','Drama');
INSERT INTO GENERO VALUES ('4','Comedia Romantica');
INSERT INTO GENERO VALUES ('5','Suspense');
INSERT INTO GENERO VALUES ('6','Horror Existencial');


INSERT INTO PERFIL VALUES('0','1', 'Roger', '001.jpg', 'UK');
INSERT INTO PERFIL VALUES('1','1', 'Roger Infantil uwu', '002.jpg', 'UK');
INSERT INTO PERFIL VALUES('2','1', 'ROGER TRISTE', '003.jpg', 'UK');
INSERT INTO PERFIL VALUES('0','3', 'Jonas', '004.jpg', 'Brazil');
INSERT INTO PERFIL VALUES('1','3', 'Bebe do Jonas', '005.jpg', 'Brazil');
INSERT INTO PERFIL VALUES('0','2', 'Pessoa Generica', '006.jpg', 'India');
INSERT INTO PERFIL VALUES('0','4', 'DENIS', '007.jpg', 'Japan');


INSERT INTO PERFIL_PREFERE VALUES('1', 1, '6', 1);
INSERT INTO PERFIL_PREFERE VALUES('1', 2, '2', 1);
INSERT INTO PERFIL_PREFERE VALUES('1', 2, '1', 2);
INSERT INTO PERFIL_PREFERE VALUES('1', 2, '5', 3);
INSERT INTO PERFIL_PREFERE VALUES('3', 1, '4', 2);
INSERT INTO PERFIL_PREFERE VALUES('3', 0, '5', 1);
INSERT INTO PERFIL_PREFERE VALUES('3', 0, '2', 2);
INSERT INTO PERFIL_PREFERE VALUES('2', 0, '4', 1);
INSERT INTO PERFIL_PREFERE VALUES('2', 0, '2', 2);
INSERT INTO PERFIL_PREFERE VALUES('4', 0, '1', 1);
INSERT INTO PERFIL_PREFERE VALUES('4', 0, '6', 2);
INSERT INTO PERFIL_PREFERE VALUES('4', 0, '5', 3);


INSERT INTO CINEASTA VALUES('1','Mel Gibson');
INSERT INTO CINEASTA VALUES('2','Nicolas Cage');
INSERT INTO CINEASTA VALUES('3','Anya Taylor-Joy');
INSERT INTO CINEASTA VALUES('4','Timothee Chamalet');
INSERT INTO CINEASTA VALUES('5','Meryl Streep');
INSERT INTO CINEASTA VALUES('6','Sarah Paulson');
INSERT INTO CINEASTA VALUES('7','Ari Aster');
INSERT INTO CINEASTA VALUES('8','Quentin Tarantino');
INSERT INTO CINEASTA VALUES('9','Yorgos Lanthimos');
INSERT INTO CINEASTA VALUES('10','Gustavo Rocque');


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


INSERT INTO ASSISTIVEL VALUES('001','file001.mkv',14344132);
INSERT INTO ASSISTIVEL VALUES('002','file002.mkv',414414314);
INSERT INTO ASSISTIVEL VALUES('006','file006.mkv',413111);
INSERT INTO ASSISTIVEL VALUES('007','file007.mkv',9938498);
INSERT INTO ASSISTIVEL VALUES('008','file008.mkv',7834718);
INSERT INTO ASSISTIVEL VALUES('009','file009.mkv',134113);
INSERT INTO ASSISTIVEL VALUES('010','file010.mkv',11233);
INSERT INTO ASSISTIVEL VALUES('011','file011.mkv',434266);
INSERT INTO ASSISTIVEL VALUES('012','file012.mkv',53526);
INSERT INTO ASSISTIVEL VALUES('013','file013.mkv',8435827);
INSERT INTO ASSISTIVEL VALUES('014','file014.mkv',857757);
INSERT INTO ASSISTIVEL VALUES('015','file015.mkv',4872587);
INSERT INTO ASSISTIVEL VALUES('016','file016.mkv',5748375);
INSERT INTO ASSISTIVEL VALUES('017','file017.mkv',34141);
INSERT INTO ASSISTIVEL VALUES('018','file018.mkv',11444);
INSERT INTO ASSISTIVEL VALUES('019','file019.mkv',31133);
INSERT INTO ASSISTIVEL VALUES('020','file020.mkv',34222);
INSERT INTO ASSISTIVEL VALUES('021','file021.mkv',112998);
INSERT INTO ASSISTIVEL VALUES('022','file022.mkv',222456);


INSERT INTO TEMPORADAS VALUES('003', 1);
INSERT INTO TEMPORADAS VALUES('003', 2);
INSERT INTO TEMPORADAS VALUES('004', 1);
INSERT INTO TEMPORADAS VALUES('004', 2);
INSERT INTO TEMPORADAS VALUES('003', 3);
INSERT INTO TEMPORADAS VALUES('005', 1);
INSERT INTO TEMPORADAS VALUES('003', 4);
INSERT INTO TEMPORADAS VALUES('004', 3);
INSERT INTO TEMPORADAS VALUES('003', 5);


INSERT INTO EPISODIO VALUES('009',001,'003',001);
INSERT INTO EPISODIO VALUES('010',001,'003',002);
INSERT INTO EPISODIO VALUES('011',001,'003',003);
INSERT INTO EPISODIO VALUES('012',001,'003',004);
INSERT INTO EPISODIO VALUES('013',001,'003',005);
INSERT INTO EPISODIO VALUES('014',002,'003',001);
INSERT INTO EPISODIO VALUES('015',002,'003',002);
INSERT INTO EPISODIO VALUES('016',002,'003',003);
INSERT INTO EPISODIO VALUES('017',002,'003',004);
INSERT INTO EPISODIO VALUES('018',002,'003',005);
INSERT INTO EPISODIO VALUES('019',001,'004',001);
INSERT INTO EPISODIO VALUES('020',001,'004',002);
INSERT INTO EPISODIO VALUES('021',001,'004',003);
INSERT INTO EPISODIO VALUES('022',001,'005',001);


INSERT INTO LISTA VALUES('4', 0, '007');
INSERT INTO LISTA VALUES('3', 0, '001');
INSERT INTO LISTA VALUES('3', 0, '002');


INSERT INTO DO_GENERO VALUES('001', '1');
INSERT INTO DO_GENERO VALUES('002', '4');
INSERT INTO DO_GENERO VALUES('002', '3');
INSERT INTO DO_GENERO VALUES('002', '5');
INSERT INTO DO_GENERO VALUES('003', '4');
INSERT INTO DO_GENERO VALUES('003', '3');
INSERT INTO DO_GENERO VALUES('003', '5');
INSERT INTO DO_GENERO VALUES('004', '3');
INSERT INTO DO_GENERO VALUES('005', '5');
INSERT INTO DO_GENERO VALUES('006', '6');
INSERT INTO DO_GENERO VALUES('006', '1');
INSERT INTO DO_GENERO VALUES('007', '2');
INSERT INTO DO_GENERO VALUES('007', '6');


INSERT INTO PARTICIPACAO VALUES('001', '1', 'ator');
INSERT INTO PARTICIPACAO VALUES('002', '2', 'diretor');
INSERT INTO PARTICIPACAO VALUES('003', '2', 'ator');
INSERT INTO PARTICIPACAO VALUES('004', '3', 'diretor');
INSERT INTO PARTICIPACAO VALUES('005', '9', 'diretor');
INSERT INTO PARTICIPACAO VALUES('006', '7', 'diretor');
INSERT INTO PARTICIPACAO VALUES('007', '7', 'diretor');
INSERT INTO PARTICIPACAO VALUES('001', '8', 'diretor');
INSERT INTO PARTICIPACAO VALUES('002', '9', 'ator');
INSERT INTO PARTICIPACAO VALUES('002', '3', 'ator');
INSERT INTO PARTICIPACAO VALUES('003', '3', 'ator');
INSERT INTO PARTICIPACAO VALUES('003', '10', 'ator');
INSERT INTO PARTICIPACAO VALUES('004', '9', 'diretor');
INSERT INTO PARTICIPACAO VALUES('005', '4', 'ator');
INSERT INTO PARTICIPACAO VALUES('005', '5', 'ator');


INSERT INTO LEGENDA_AUDIO VALUES('001','001.srt', 'portugues', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('001','002.srt', 'ingles', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('001','003.srt', 'japones', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('001','004.srt', 'espanhol', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('002','005.srt', 'ingles', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('002','006.srt', 'ingles', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('006','007.srt', 'ingles', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('006','008.srt', 'espanhol', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('007','009.srt', 'portugues', 'legenda');
INSERT INTO LEGENDA_AUDIO VALUES('007','001.mp3', 'ingles', 'audio');
INSERT INTO LEGENDA_AUDIO VALUES('003','002.mp3', 'ingles', 'audio');
INSERT INTO LEGENDA_AUDIO VALUES('003','003.mp3', 'espanhol', 'audio');
INSERT INTO LEGENDA_AUDIO VALUES('003','004.mp3', 'japones', 'audio');
INSERT INTO LEGENDA_AUDIO VALUES('003','005.mp3', 'ingles', 'audio');
INSERT INTO LEGENDA_AUDIO VALUES('004','006.mp3', 'portugues', 'audio');
INSERT INTO LEGENDA_AUDIO VALUES('004','007.mp3', 'ingles', 'audio');
INSERT INTO LEGENDA_AUDIO VALUES('004','008.mp3', 'ingles', 'audio');


INSERT INTO REGIOES_DISPONIVEIS VALUES('001', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('002', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('003', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('004', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('004', 'India');
INSERT INTO REGIOES_DISPONIVEIS VALUES('005', 'India');
INSERT INTO REGIOES_DISPONIVEIS VALUES('006', 'India');
INSERT INTO REGIOES_DISPONIVEIS VALUES('007', 'India');
INSERT INTO REGIOES_DISPONIVEIS VALUES('001', 'Japan');
INSERT INTO REGIOES_DISPONIVEIS VALUES('002', 'Japan');
INSERT INTO REGIOES_DISPONIVEIS VALUES('003', 'Japan');
INSERT INTO REGIOES_DISPONIVEIS VALUES('004', 'Japan');
INSERT INTO REGIOES_DISPONIVEIS VALUES('005', 'Japan');
INSERT INTO REGIOES_DISPONIVEIS VALUES('006', 'Japan');
INSERT INTO REGIOES_DISPONIVEIS VALUES('007', 'Japan');
INSERT INTO REGIOES_DISPONIVEIS VALUES('001', 'UK');
INSERT INTO REGIOES_DISPONIVEIS VALUES('005', 'UK');
INSERT INTO REGIOES_DISPONIVEIS VALUES('006', 'UK');
INSERT INTO REGIOES_DISPONIVEIS VALUES('007', 'UK');
INSERT INTO REGIOES_DISPONIVEIS VALUES('008', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('009', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('010', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('011', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('012', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('013', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('014', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('015', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('016', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('017', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('018', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('019', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('020', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('021', 'Brazil');
INSERT INTO REGIOES_DISPONIVEIS VALUES('022', 'Brazil');


INSERT INTO MOTIVO_RECOMENDACAO VALUES('Diretor');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Ator');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Genero');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Numero de Visualizacoes');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Relevancia');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Em Alta na Regiao');
INSERT INTO MOTIVO_RECOMENDACAO VALUES('Ator em Alta');


INSERT INTO ASSISTIR VALUES('4', '0', '001', true, 'positivo', NULL, NULL); 
INSERT INTO ASSISTIR VALUES('4', '0', '007', false, 'negativo', NULL, NULL); 
INSERT INTO ASSISTIR VALUES('1', '1', '006', true, 'positivo', NULL, NULL); 
INSERT INTO ASSISTIR VALUES('2', '0', '004', false, NULL, '100', 13);
INSERT INTO ASSISTIR VALUES('3', '0', '003', true, NULL, NULL, NULL); 

INSERT INTO RECOMENDACOES VALUES('4', '0', '006', 'Genero');
INSERT INTO RECOMENDACOES VALUES('4', '0', '002', 'Em Alta na Regiao');
INSERT INTO RECOMENDACOES VALUES('1', '1', '001', 'Genero');
INSERT INTO RECOMENDACOES VALUES('3', '0', '002', 'Ator'); 

SELECT * FROM REGIAO;
SELECT * FROM CONTA;
SELECT * FROM PERFIL;
SELECT * FROM GENERO;
SELECT * FROM PERFIL_PREFERE;
SELECT * FROM CINEASTA;
SELECT * FROM CONTEUDO;
SELECT * FROM LISTA;
SELECT * FROM DO_GENERO;
SELECT * FROM PARTICIPACAO;
SELECT * FROM TEMPORADAS;
SELECT * FROM LEGENDA_AUDIO;
SELECT * FROM EPISODIO;
SELECT * FROM MOTIVO_RECOMENDACAO;
SELECT * FROM RECOMENDACOES;
SELECT * FROM REGIOES_DISPONIVEIS;
SELECT * FROM ASSISTIR;
SELECT * FROM ASSISTIVEL;


