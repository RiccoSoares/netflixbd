# netflixbd
Banco de dados inspirado na plataforma Netflix.


Dicionário de dados disponível em: dicionário de dados.pdf

Descricao do Universo de Discurso disponível em: descrição do UDD.pdf

Mapeamento do diagrama ER para esquema relacional disponível em: mapeamento.pdf

link do ER (acesso restrito): http://brmodelo.herokuapp.com/#!/conceptual/60577dbb17fea40033094732


## Criação da Base de Dados e Realização de Consultas via Python3

rodar com usuario postgres

depende dos módulos psycopg2 e tabulate (disp. em pip)

--------para usar o programa python que realiza acesso às consultas

sudo -su postgres

python programa.py

## Criação da Base de Dados e Realização de Consultas via Postgresql

(assumindo que tens uma database de nome netflix no postgres):

psql -d netflix -a -f tabelas.sql

psql -d netflix -a -f instancias.sql

psql -d netflix -a -f consultas.sql

---------para acessar a database no postgres

sudo -i -u postgres

psql netflix 

\dt (checa as tabelas existentes)
