-- HABILITAR CDC NO BANCO DE DADOS
EXEC sys.sp_cdc_enable_db 
   
-- VERIFICAR SE ESTÁ HABILITADO
select name, is_cdc_enabled from sys.databases; 

-- HABILITAR TABELA
EXECUTE sys.sp_cdc_enable_table  
    @source_schema  = N'dbo'  
  , @source_name    = N'tbl_teste'
  , @role_name      = null

*@captured_column_list* para habilitar apenas para algumas colunas

-- DESABILITAR
EXECUTE sys.sp_cdc_disable_table  
    @source_schema    = N'dbo'  
  , @source_name      = N'tbl_teste'
  , @capture_instance = N'dbo_tbl_teste'


-- VER TABELAS QUE ESTÃO HABILITADAS
select name, is_tracked_by_cdc from sys.tables;

-- VER COLUNAS QUE SERÃO CAPTURADAS
select * from cdc.captured_columns;

-- VER TABELAS COM CDC
select * from  cdc.change_tables;

-- ALTERAÇÕES EM TABELAS COM CDC ATIVO
select * from cdc.ddl_history;

-- INDÍCES EM TABELAS COM CDC
select * from cdc.index_columns;

-- LISTA TRANSAÇÕES CDC
select * from cdc.lsn_time_mapping;

-- COMANDOS DO OPERATIONS
1: DELETE
2: INSERT
3: Valor ANTES do UPDATE
4: Valor APÓS o UPDATE

--- PEGAR ALTERAÇÕES
declare
		@from_lsn binary(10), 
		@to_lsn binary(10);  


SELECT capture_instance FROM cdc.change_tables -- USAR NO PARÂMETRO DO fn_cdc_get_min_lsn

SET @from_lsn = sys.fn_cdc_get_min_lsn(N'dbo_tbl_teste');
SET @to_lsn = sys.fn_cdc_get_max_lsn();

select * from cdc.fn_cdc_get_all_changes_dbo_tbl_teste(@from_lsn,@to_lsn,N'all');
select * from cdc.fn_cdc_get_all_changes_dbo_tbl_teste(@from_lsn,@to_lsn,'all update old');

select sys.fn_cdc_map_lsn_to_time(__$start_lsn),* from cdc.dbo_tbl_teste_CT


* se sql agente parar nada funciona