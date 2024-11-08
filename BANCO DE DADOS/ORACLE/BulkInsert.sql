1-) Criar para exemplo a seguinte tabela:
CREATE TABLE ImportFile (
   nome  varchar2(100)
  ,idade number(2)
 );


2-) Cria um arquivo csv com o nome de exemplo.csv tendo o seguinte conteúdo:
nome;idade
Ana;10
Jose;20
Maria;30
Pedro;40


3-) Criar um arquivo chamado 'import_exemplo.ctl'.
    Ele é um arquivo de controle utilizado no servidor. Esse arquivo seria a configuração de como será feita a importação, é 
    o detalhe do "LOAD" do Oracle.
    O conteúdo desse arquivo seria como exemplo abaixo:
LOAD DATA
  OPTIONS (SKIP=1)  ##(opcional) ignorar primeira linha
  INFILE      ‘/tmp/exemplo.csv’ ## caminho de onde está o arquivo
  BADFILE     ‘/log/exemplo.bad’ ## (opcional) arquivo de log com registros com problema
  DISCARDFILE ‘/log/exemplo.dsc’ ## (opcional) registros que eventualmente foram descartados
  INSERT ## Aqui é o comando insert, append, replace ou truncate 
  INTO TABLE ImportFile ## Nome da tabela
  FIELDS TERMINATED BY “,” 
  OPTIONALLY ENCLOSED BY ‘”’ 
  TRAILING NULLCOLS
  ( nome, idade ) 


4-) Nesse arquivo de controle de importação, os comandos que podem ser utilizados são:
INSERT      --> Insere registros se a tabela "estiver vazia"
APPEND      --> Insere registros com a tabela vazia ou não
REPLACE     --> Apaga a tabela e depois insere
TRUNCATE    --> Trunca a tabela e depois insere


5-) Para rodar, na linha de comando digitar (do sqlplus):
# sqlldr usuario/senha controle=import_exemplo.ctl log=LogImport.log
