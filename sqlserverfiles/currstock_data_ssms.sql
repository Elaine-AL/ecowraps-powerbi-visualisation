-- Import the current stock stock data

SELECT *
INTO dbo.CurrentStockLevel
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0;HDR=YES;IMEX=1;Database=C:\Users\Public\Documents\EcoWraps.xlsx',
    'SELECT * FROM [Stock$A2:G]'
);

select * from dbo.CurrentStockLevel;

-- Remove the first two unwanted rows
WITH CTE AS (
    SELECT TOP 2 *
    FROM dbo.CurrentStockLevel
    ORDER BY [Item No#]  -- replace with a column that defines row order
)
DELETE FROM CTE;
