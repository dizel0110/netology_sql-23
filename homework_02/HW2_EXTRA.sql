SELECT 
	K_C_US.TABLE_NAME
	--,K_C_US.CONSTRAINT_NAME
	,K_C_US.COLUMN_NAME
	,cols.data_type
FROM 
	INFORMATION_SCHEMA.KEY_COLUMN_USAGE K_C_US
INNER JOIN
	INFORMATION_SCHEMA.TABLE_CONSTRAINTS T_CONST
	ON K_C_US.CONSTRAINT_NAME = T_CONST.CONSTRAINT_NAME
	AND K_C_US.TABLE_NAME = T_CONST.TABLE_NAME
INNER JOIN
	INFORMATION_SCHEMA.columns cols
	ON cols.table_name = K_C_US.TABLE_NAME
	AND cols.column_name = K_C_US.COLUMN_NAME
WHERE 
	T_CONST.CONSTRAINT_TYPE = 'PRIMARY KEY';
	
--SELECT COLUMN_NAME, DATA_TYPE --, IS_NULLABLE, COLUMN_DEFAULT
--  FROM INFORMATION_SCHEMA.columns;