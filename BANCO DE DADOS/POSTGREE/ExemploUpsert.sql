INSERT INTO schema.tabela(fields) VALUES(values)
ON CONFLICT(primary key) 
DO UPDATE SET
  field = new value;