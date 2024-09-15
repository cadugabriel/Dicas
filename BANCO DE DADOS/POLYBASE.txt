Passo a passo para iniciar PolyBase dentro do SQL Server:

1-) Criar master key
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '???'; 


2-) Cria credencial
CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
WITH IDENTITY = 'user', Secret = '?????';


3-) Cria external data source
CREATE EXTERNAL DATA SOURCE AzureStorage with (  
      TYPE = HADOOP,
      LOCATION ='wasbs://???@???.blob.core.windows.net',  
      CREDENTIAL = AzureStorageCredential  
);  


4-) Cria formato de arquivos
CREATE EXTERNAL FILE FORMAT TextFileFormat WITH (  
      FORMAT_TYPE = DELIMITEDTEXT,
      FORMAT_OPTIONS (FIELD_TERMINATOR ='|',
            USE_TYPE_DEFAULT = TRUE))  


5-) Exemplo de criação de uma tabela externa utilizando as configurações acima
CREATE EXTERNAL TABLE [dbo].[xpto] (  
      id          int               NOT NULL,
      nome        varchar(100)      NOT NULL,
      descricao   varchar(500)          NULL
)  
WITH (LOCATION='/????/',
      DATA_SOURCE = AzureStorage,  
      FILE_FORMAT = TextFileFormat  
);  