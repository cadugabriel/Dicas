SELECT	
	name,
	type,
	CASE type
		WHEN    'P'     THEN 'Stored Procedures'
		WHEN	'FN'    THEN 'Scalar Functions' 
		WHEN 	'IF'    THEN 'Inline Table-Valued Functions'
		WHEN 	'TF'    THEN 'Table-Valued Functions'
		ELSE 'N/I'
	END AS ds_type
FROM dbo.sysobjects
