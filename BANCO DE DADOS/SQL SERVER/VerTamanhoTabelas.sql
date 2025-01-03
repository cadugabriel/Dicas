SELECT
    t.NAME AS Entidade,
    t.create_date                                   AS DataCriacao,
    p.rows                                          AS Registros,
    SUM(a.total_pages) * 8                          AS EspacoTotalKB,
    SUM(a.used_pages) * 8                           AS EspacoUsadoKB,
    (SUM(a.total_pages) - SUM(a.used_pages)) * 8    AS EspacoNaoUsadoKB
FROM
    sys.tables t
INNER JOIN
    sys.indexes i ON t.OBJECT_ID = i.object_id
INNER JOIN
    sys.partitions p ON i.object_id = p.OBJECT_ID AND i.index_id = p.index_id
INNER JOIN
    sys.allocation_units a ON p.partition_id = a.container_id
LEFT OUTER JOIN
    sys.schemas s ON t.schema_id = s.schema_id
GROUP BY
    t.Name, t.create_date, s.Name, p.Rows
ORDER BY
    Registros DESC