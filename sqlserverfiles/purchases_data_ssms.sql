-- Import the purchases data

drop table if exists dbo.Purchases;

SELECT *
INTO dbo.Purchases
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0;HDR=YES;IMEX=1;Database=C:\Users\Public\Documents\EcoWraps.xlsx',
    'SELECT * FROM [Purchases$A:N]'
);

-- View the table and do clean ups
select * from dbo.Purchases;
EXEC sp_help 'dbo.Purchases';

-- Change the month column to month format
ALTER TABLE dbo.Purchases
ADD [MonthYear] VARCHAR(8);

UPDATE dbo.Purchases
SET [MonthYear] = UPPER(FORMAT([Month], 'MMM-yyyy'));