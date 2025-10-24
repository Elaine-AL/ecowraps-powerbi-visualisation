#select top 5 * from dbo.['Daily sales$'];

-- 1. Allow advanced configuration options


EXEC master.dbo.sp_enum_oledb_providers;

EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1;
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1;

EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.16.0', N'AllowInProcess', 1;
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.16.0', N'DynamicParameters', 1;

EXEC sp_configure 'show advanced options', 1;
RECONFIGURE;

-- 2. Enable Ad Hoc Distributed Queries
EXEC sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;

SELECT *
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.16.0',
    'Excel 12.0;HDR=YES;IMEX=1;Database=C:\Users\Public\Documents\EcoWraps.xlsx',
    'SELECT * FROM [Daily sales$A5:Z100]'
);

DROP TABLE dbo.['Daily expenses$'];
DROP TABLE dbo.['Daily sales$'];
DROP TABLE dbo.['Initial stock$'];
DROP TABLE dbo.Expenses$;