-- Import the expenses data

SELECT *
INTO dbo.DailyExpenses
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0;HDR=YES;IMEX=1;Database=C:\Users\Public\Documents\EcoWraps.xlsx',
    'SELECT * FROM [Daily expenses$A:F]'
);

select * from dbo.DailyExpenses;
EXEC sp_help 'dbo.DailyExpenses';

-- Change the month column to month format
ALTER TABLE dbo.DailyExpenses
ADD [MonthYear] VARCHAR(8);

UPDATE dbo.DailyExpenses
SET [MonthYear] = UPPER(FORMAT([Month], 'MMM-yyyy'));