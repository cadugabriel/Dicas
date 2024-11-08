select
	 tb1.name as tabela
	,tb2.name as coluna
	,tb3.name as tipo
	,tb3.max_length
	,tb3.precision
	,tb2.is_nullable
	,tb2.is_identity
from 
	sys.tables tb1
inner join 
	sys.all_columns tb2		on tb2.object_id = tb1.object_id
inner join
	sys.types tb3			on tb3.system_type_id = tb2.system_type_id
where
	tb1.name = '???'
order by
	tb2.column_id
