# netflixbd
Banco de dados inspirado na plataforma Netflix.


link do arquivo do drive pro dicionário de dados: https://docs.google.com/document/d/1cuHeuuIBba-cCXUPkDS1CO6ALoYwvFp515ENGTuSAAg/edit?usp=sharing

link do arquivo de descricao do UDD: https://docs.google.com/document/d/1o0H_ax0n37PNIbt2h7tFCNJJLoA9bdqPzhI90dgpVWw/edit?usp=sharing

link do arquivo de mapeamento do ER para esquema relacional: https://docs.google.com/document/d/1rOPIBeUVcgHCVApGSOLFYWbj70fV2d6h8P92bxcfB-A/edit?usp=sharing

link do ER (acesso restrito): http://brmodelo.herokuapp.com/#!/conceptual/60577dbb17fea40033094732


---------pra rodar (assumindo que voce ja criou uma database de nome netflix no seu postgres):

psql -d netflix -a -f tabelas.sql

psql -d netflix -a -f instancias.sql

psql -d netflix -a -f consultas.sql

---------para acessar a database no postgres

sudo -i -u postgres

psql netflix 

\dt (checar as tabelas existentes)

## INFOS DO PROGRAMA.PY

rodar com usuario postgres

depende dos módulos psycopg2 e tabulate (disp. em pip)

--------para usar o programa python que realiza acesso às consultas

sudo -su postgres

python programa.py
