import psycopg2
from tabulate import tabulate

def menu():
    print("[1 ]Exibir filmes dirigidos por cineasta...")
    print("[2 ]Exibir número de gêneros preferidos por perfis")
    print("[3 ]Exibir Último episódio de cada temporada de cada série")
    print("[4 ]Exibir usuários que preferem Comédia, mas não Comédia Romântica")
    print("[5 ]Exibir elenco de filme...")
    print("[6 ]Diretores que dirigiram mais de um filme de horror existencial")
    print("[7 ]Cineastas que participaram de mesmos conteúdos que...")
    print("[8 ]Número de usuários e conteúdos por região")
    print("[9 ]Número de visualizações e conteúdos por ator")
    print("[10]Disponibilidade de regiões, áudio e legendas por conteúdo")
    print("[0 ]Sair")
    return input("\n>")


conn = psycopg2.connect(dbname="netflix",user="postgres")
print("""
#    # ###### ##### ###### #      # #    # 
##   # #        #   #      #      #  #  #  
# #  # #####    #   #####  #      #   ##   
#  # # #        #   #      #      #   ##   
#   ## #        #   #      #      #  #  #  
#    # ######   #   #      ###### # #    # 
""")
cur = conn.cursor()
choice = None
while(choice != 0):
    choice = int(menu())
    if choice == 1:
        filmmaker = input("Digite nome de cineasta: ")
        cur.execute("""
            select conteudo.nome,assistivel.visualizacoes
            from conteudo join assistivel on conteudo.id = assistivel.id_conteudo 
            and conteudo.tipo = 'filme'
            join participacao on conteudo.id = participacao.id_conteudo
            join cineasta on cineasta.id = participacao.id_cineasta
            and cineasta.nome = '"""+filmmaker+"""'
            order by assistivel.visualizacoes""")
        query = cur.fetchall()
        if not query:
            print()
            print("Cineasta não é diretor")
            print()
        else:
            print()
            print(tabulate(query,headers=['Filme','Visualizações']))
            print()
    elif choice == 2:
        print()
        cur.execute("""
            select perfil.nome, count(genero.nome) 
            from perfil join perfil_prefere 
            on perfil.id = perfil_prefere.id_perfil 
            join genero on id_genero = genero.id 
            group by perfil.nome;
        """)
        print(tabulate(cur.fetchall(),headers=['Perfil','Gêneros']))
        print()
    elif choice == 3:
        print()
        cur.execute("""
            select EP.nome as ultimoEp, temporada, SER.nome as serie
            from CONTEUDO EP join ASSISTIVEL on EP.id = ASSISTIVEL.id_conteudo
            join EPISODIO on ASSISTIVEL.id_conteudo = EPISODIO.id_assistivel 
            join CONTEUDO SER on EPISODIO.id_serie = SER.id
            where EPISODIO.numero in(
                    select MAX(numero)
                    from EPISODIO
                    where id_serie = SER.id
            );
        """)
        print(tabulate(cur.fetchall(),headers=['Nome do Episódio','Temporada','Nome da série']))
        print()
    elif choice == 4:
        print()
        cur.execute("""
            select nome from perfil p1 
            where 'Comedia' in 
                    (select genero.nome from perfil 
                    join perfil_prefere on p1.id = perfil_prefere.id_perfil 
                    join genero on id_genero = genero.id)
                    and 'Comedia Romantica' not in
                        (select genero.nome from perfil 
                        join perfil_prefere on p1.id = perfil_prefere.id_perfil 
                        join genero on id_genero = genero.id);
        """)
        print(tabulate(cur.fetchall(),headers=['Perfil']))
        print()
    elif choice == 5:
        movie = input("Digite nome do filme: ")
        cur.execute("""
            select cineasta.nome from cineasta 
            join participacao on cineasta.id = participacao.id_cineasta 
            join conteudo on id_conteudo = conteudo.id 
            where conteudo.nome = '"""+movie+"""';
        """)
        query = cur.fetchall()
        if not query:
            print()
            print("Elenco não encontrado")
            print()
        else:
            print()
            print(tabulate(query,headers=['Cineasta']))
            print()
    elif choice == 6:
        print()
        cur.execute("""
            select CINEASTA.nome
            from CINEASTA 
            join PARTICIPACAO on PARTICIPACAO.id_cineasta = CINEASTA.id
            join CONTEUDO on PARTICIPACAO.id_conteudo = CONTEUDO.id
            join DO_GENERO on CONTEUDO.id = DO_GENERO.id_conteudo
            join GENERO on GENERO.id = DO_GENERO.id_genero
            group by CINEASTA.nome,funcao,GENERO.nome
            having funcao = 'diretor' and GENERO.nome = 'Horror Existencial'
            and count(CONTEUDO.id) > 1;
        """)
        print(tabulate(cur.fetchall(),headers=['Diretor']))
        print()
    elif choice == 7:
        filmmaker = input("Digite nome do cineasta: ")
        cur.execute("""
            select nome from cineasta c1 
            where c1.nome <> '"""+filmmaker+"""' and not exists
                    (select * from participacao 
                    join cineasta on participacao.id_cineasta = cineasta.id 
                    where cineasta.nome = '"""+filmmaker+"""' 
                    and id_conteudo not in
                            (select id_conteudo from participacao 
                            join cineasta 
                            on participacao.id_cineasta = cineasta.id 
                            where cineasta.id = c1.id));
        """)
        query = cur.fetchall()
        if not query:
            print()
            print("Cineastas não encontrados")
            print()
        else:
            print()
            print(tabulate(query,headers=['Cineasta']))
            print()
    elif choice == 8:
        print()
        cur.execute("""
            select REGIAO.nome, 
            count(distinct (PERFIL.id,PERFIL.id_conta)) as usuários, 
            count(distinct REGIOES_DISPONIVEIS.id_conteudo) as nro_conteudos
            from REGIAO join PERFIL on PERFIL.regiao = REGIAO.nome
            join REGIOES_DISPONIVEIS on REGIOES_DISPONIVEIS.regiao = REGIAO.nome
            group by REGIAO.NOME
            order by count(distinct PERFIL.id) DESC;
        """)
        print(tabulate(cur.fetchall(),headers=['Região','Usuários','Conteúdos']))
        print()
    elif choice == 9:
        print()
        cur.execute("""
            select CINEASTA.NOME,
            sum(visualizacoes) as visualizacoes,
            count(distinct CONTEUDO.id) as nro_conteudos
            from CINEASTA 
            join PARTICIPACAO on CINEASTA.id = PARTICIPACAO.id_cineasta
            join CONTEUDO on CONTEUDO.id = PARTICIPACAO.id_conteudo
            join ASSISTIVEL on CONTEUDO.id = ASSISTIVEL.id_conteudo
            group by CINEASTA.NOME,PARTICIPACAO.funcao,CONTEUDO.tipo
            having PARTICIPACAO.funcao = 'ator' 
            and CONTEUDO.tipo IN('filme','serie');
        """)
        print(tabulate(cur.fetchall(),headers=['Ator','Visualizações','Conteúdos']))
        print()
    elif choice == 10:
        print()
        cur.execute("""
            select CONTEUDO.nome, count(REGIOES_DISPONIVEIS.regiao) as regioes, 
            count(distinct LEGENDA.idioma) as legendas, 
            count(distinct AUDIO.idioma) as audios
            from CONTEUDO left outer join REGIOES_DISPONIVEIS 
            on CONTEUDO.id = REGIOES_DISPONIVEIS.id_conteudo
            left outer join LEGENDA_AUDIO as LEGENDA 
            on CONTEUDO.id = LEGENDA.id_conteudo 
            and LEGENDA.espec = 'legenda'
            left outer join LEGENDA_AUDIO as AUDIO 
            on CONTEUDO.id = AUDIO.id_conteudo
            and AUDIO.espec = 'audio'
            group by CONTEUDO.nome,LEGENDA.espec,AUDIO.espec;
        """)
        print(tabulate(cur.fetchall(),headers=['Conteúdo','Regiões','Áudios','Legendas']))
        print()
        
cur.close()
conn.close()
