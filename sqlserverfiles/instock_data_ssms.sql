-- Import the initial stock data
DROP TABLE IF EXISTS dbo.InitialStock;

SELECT *
INTO dbo.InitialStock
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0;HDR=YES;IMEX=1;Database=C:\Users\Public\Documents\EcoWraps.xlsx',
    'SELECT * FROM [Initial stock$A:P]'
);

-- View the table and do clean ups
--select * from dbo.InitialStock;
--EXEC sp_help 'dbo.InitialStock';