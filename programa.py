import psycopg2
from tabulate import tabulate

def menu():
    print("(1)Exibir filmes dirigidos por Ari Aster")
    print("(2)Exibir número de gêneros preferidos por perfis")
    print("(0)Sair")
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
        print()
        cur.execute("""
            select conteudo.nome,assistivel.visualizacoes
            from conteudo join assistivel on conteudo.id = assistivel.id_conteudo 
            and conteudo.tipo = 'filme'
            join participacao on conteudo.id = participacao.id_conteudo
            join cineasta on cineasta.id = participacao.id_cineasta
            and cineasta.nome = 'Ari Aster'
            order by assistivel.visualizacoes""")
        print(tabulate(cur.fetchall(),headers=['Filme','Visualizacoes']))
        print()

cur.close()
conn.close()
