set session var.nome = 'XXXXX';
set session var.idade = '999';

SELECT
    current_setting('var.nome') AS NOME ,
    current_setting('var.idade') AS IDADE;