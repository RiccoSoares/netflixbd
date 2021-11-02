# netflixbd
Banco de dados inspirado na plataforma Netflix.

## Diagrama ER
![image](https://user-images.githubusercontent.com/52585330/139956670-895383f7-2a2b-4881-b3b8-88277904e58e.png)


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

## Informações Adicionais

Dicionário de dados disponível em: dicionário de dados.pdf

Descricao do Universo de Discurso disponível em: descrição do UDD.pdf

Mapeamento do diagrama ER para esquema relacional disponível em: mapeamento.pdf
