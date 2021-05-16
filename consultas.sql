-- view que retorna o id, nome e soma total de visualizacoes de uma serie.
drop view if exists SERIES_VISU cascade;

create view SERIES_VISU as 
select id,nome,sum(visualizacoes) as visualizacoes
from CONTEUDO join EPISODIO on CONTEUDO.id = EPISODIO.id_serie
join ASSISTIVEL on EPISODIO.id_assistivel = ASSISTIVEL.id_conteudo
group by CONTEUDO.id
having CONTEUDO.tipo = 'serie'
order by sum(visualizacoes);

-- acessa a visao retornando o id, nome e numero de visualizacoes (todos os campos) dela
select id, nome, visualizacoes from series_visu;

-- (1) filmes dirigidos por Ari Aster por número de visualizações
select CONTEUDO.nome, ASSISTIVEL.visualizacoes
from CONTEUDO join ASSISTIVEL on CONTEUDO.id = ASSISTIVEL.id_conteudo
and CONTEUDO.tipo = 'filme'
join PARTICIPACAO on CONTEUDO.id = PARTICIPACAO.id_conteudo 
join CINEASTA on CINEASTA.id = PARTICIPACAO.id_cineasta 
and CINEASTA.nome = 'Ari Aster'
order by ASSISTIVEL.visualizacoes;

-- (2) o numero de cada perfil seguido do numero de generos que ele possui em sua lista de generos preferidos
select perfil.nome, count(genero.nome) from perfil join perfil_prefere on perfil.id = perfil_prefere.id_perfil join genero on id_genero = genero.id group by perfil.nome;


-- (3) Ultimo episodio de cada temporada de cada serie 
select EP.nome as ultimoEp, temporada, SER.nome as serie
from CONTEUDO EP join ASSISTIVEL on EP.id = ASSISTIVEL.id_conteudo
join EPISODIO on ASSISTIVEL.id_conteudo = EPISODIO.id_assistivel 
join CONTEUDO SER on EPISODIO.id_serie = SER.id
where EPISODIO.numero in(
	select MAX(numero)
	from EPISODIO
	where id_serie = SER.id
);

-- (4) todos os usuarios que possuem na sua lista de generos prediletos o genero "Comedia" e nao possuem o genero "Comedia Romantica" entre os mesmos.
select nome from perfil p1 where 'Comedia' in 
	(select genero.nome from perfil join perfil_prefere on p1.id = perfil_prefere.id_perfil join genero on id_genero = genero.id)
	and
	'Comedia Romantica' not in
	(select genero.nome from perfil join perfil_prefere on p1.id = perfil_prefere.id_perfil join genero on id_genero = genero.id);
	

-- (5) Todos os cineastas que participaram de O Grito
select cineasta.nome from cineasta join participacao on cineasta.id = participacao.id_cineasta join conteudo on id_conteudo = conteudo.id where conteudo.nome = 'O Grito';

-- (6) Cineastas que dirigiram mais de um conteúdo de horror existencial
select CINEASTA.nome
from CINEASTA join PARTICIPACAO on PARTICIPACAO.id_cineasta = CINEASTA.id
join CONTEUDO on PARTICIPACAO.id_conteudo = CONTEUDO.id
join DO_GENERO on CONTEUDO.id = DO_GENERO.id_conteudo
join GENERO on GENERO.id = DO_GENERO.id_genero
group by CINEASTA.nome,funcao,GENERO.nome
having funcao = 'diretor' and GENERO.nome = 'Horror Existencial'
and count(CONTEUDO.id) > 1;


-- (7) TODOS os cienastas que participaram dos mesmos conteudos que (ex_cineasta) e possivelmente outros
select nome from cineasta c1 where c1.nome <> 'Nicolas Cage' and not exists
	(select * from participacao join cineasta on participacao.id_cineasta = cineasta.id where cineasta.nome = 'Nicolas Cage' and id_conteudo not in
		(select id_conteudo from participacao join cineasta on participacao.id_cineasta = cineasta.id where cineasta.id = c1.id));

-- (8) Número de usuários por região, mostrando numero de conteudos disponiveis
select REGIAO.nome, count(distinct (PERFIL.id,PERFIL.id_conta)) as usuários, 
count(distinct REGIOES_DISPONIVEIS.id_conteudo) as nro_conteudos
from REGIAO join PERFIL on PERFIL.regiao = REGIAO.nome
join REGIOES_DISPONIVEIS on REGIOES_DISPONIVEIS.regiao = REGIAO.nome
group by REGIAO.NOME
order by count(distinct PERFIL.id) DESC;


-- (9) Número de visualizações por ator, com número de conteúdos que participou
select CINEASTA.NOME,sum(visualizacoes) as visualizacoes,
count(distinct CONTEUDO.id) as nro_conteudos
from CINEASTA join PARTICIPACAO on CINEASTA.id = PARTICIPACAO.id_cineasta
join CONTEUDO on CONTEUDO.id = PARTICIPACAO.id_conteudo
join ASSISTIVEL on CONTEUDO.id = ASSISTIVEL.id_conteudo
group by CINEASTA.NOME,PARTICIPACAO.funcao,CONTEUDO.tipo
having PARTICIPACAO.funcao = 'ator' and CONTEUDO.tipo IN('filme','serie');


-- (10) Numero de regioes disponiveis, ops de audio para cada conteudo e de legenda para cada conteudo..
select CONTEUDO.nome, count(REGIOES_DISPONIVEIS.regiao) as regioes, 
count(distinct LEGENDA.idioma) as legendas, count(distinct AUDIO.idioma) as audios
from CONTEUDO left outer join REGIOES_DISPONIVEIS 
on CONTEUDO.id = REGIOES_DISPONIVEIS.id_conteudo
left outer join LEGENDA_AUDIO as LEGENDA on CONTEUDO.id = LEGENDA.id_conteudo 
and LEGENDA.espec = 'legenda'
left outer join LEGENDA_AUDIO as AUDIO on CONTEUDO.id = AUDIO.id_conteudo
and AUDIO.espec = 'audio'
group by CONTEUDO.nome,LEGENDA.espec,AUDIO.espec;
