Comandos:
  show databases;                 : Lista schemas
  use "nome_schema";              : Vai para o schema
  show tables;                    : Lista tabelas
  set hive.cli.print.header=true; : Exibe nome da coluna


Para exportar:
  beeline -u "jdbc:hive2://conexao" \
  --showHeader=false \
  --verbose=false \
  --outputformat=csv2  -e "select * from system.catalog limit 10"  > /tmp/data.txt


Exemplo criação de tabela:
  DROP TABLE IF EXISTS DB_DOLPHIN_TARGET.NOME_TABELA ;
  CREATE EXTERNAL TABLE DB_DOLPHIN_TARGET.NOME_TABELA (
    CAMPO01   STRING,
    CAMPO02   STRING,
    CAMPO03   STRING
  ) STORED AS PARQUET
  LOCATION 'CAMINHO DO HDFS';
