Comandos:
    !table                        : Lista tabelas
    !describe    <nome_da_tabela> : Ver DDL da tabela
    !primarykeys <nome_da_tabela> : Ver PK's da tabela
    !outputformat vertical        : Tipo de saída
    !outputformat xmlattr         : Tipo de saída
    !outputformat tsv             : Tipo de saída
    !outputformat xmlelements     : Tipo de saída
    !outputformat csv             : Tipo de saída
    !outputformat table           : Tipo de saída

Para exportar:
    !outputformat csv
    !record /caminho/data.csv
    select * from system.catalog limit 10;
    !record