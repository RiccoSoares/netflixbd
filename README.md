# netflixbd
netflix banco de dados


link do arquivo do drive pro dicionário de dados: https://docs.google.com/document/d/1cuHeuuIBba-cCXUPkDS1CO6ALoYwvFp515ENGTuSAAg/edit

link do arquivo de mapeamento do ER para esquema relacional: https://docs.google.com/document/d/1rOPIBeUVcgHCVApGSOLFYWbj70fV2d6h8P92bxcfB-A/edit

link do ER: http://brmodelo.herokuapp.com/#!/conceptual/60577dbb17fea40033094732



---------pra rodar (assumindo que voce ja criou uma database de nome netflix no seu postgres):

psql -d netflix -a -f netflix.sql


---------pra acessar a database no postgres

sudo -i -u postgres

psql netflix 

\dt (checar as tabelas existentes)
