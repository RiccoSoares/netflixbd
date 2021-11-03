# netflixbd
Banco de dados inspirado na plataforma Netflix. É possível construir a base de dados (com nossos exemplos fictícios) e elaborar consultas relevantes usando Python3 ou PostgreSQL.

![image](https://user-images.githubusercontent.com/52585330/140199265-ba1f33fa-6fe4-424e-9e99-2641d709a801.png)


## Diagrama ER
![image](https://user-images.githubusercontent.com/52585330/139956670-895383f7-2a2b-4881-b3b8-88277904e58e.png)

## Informações Adicionais

Dicionário de dados disponível em: dicionário de dados.pdf

Descricao do Universo de Discurso disponível em: descrição do UDD.pdf

Mapeamento do diagrama ER para esquema relacional disponível em: mapeamento.pdf

## Utilização

### Criação da Base de Dados e Realização de Consultas via Python3

rodar com usuario postgres

depende dos módulos psycopg2 e tabulate (disp. em pip)

--------para usar o programa python que realiza acesso às consultas

sudo -su postgres

python programa.py

### Criação da Base de Dados e Realização de Consultas via Postgresql

(assumindo que tens uma database de nome netflix no postgres):

psql -d netflix -a -f tabelas.sql

psql -d netflix -a -f instancias.sql

psql -d netflix -a -f consultas.sql

---------para acessar a database no postgres

sudo -i -u postgres

psql netflix 

\dt (checa as tabelas existentes)
