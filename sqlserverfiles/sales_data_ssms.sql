-- Import the sales data

/*sp_configure 'show advanced options', 1;
RECONFIGURE;
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;*/

USE ecowraps;
GO

DROP TABLE IF EXISTS dbo.DailySales;

SELECT *
INTO dbo.DailySales
FROM OPENROWSET(
    'Microsoft.ACE.OLEDB.12.0',
    'Excel 12.0;HDR=YES;IMEX=1;Database=C:\Users\Public\Documents\EcoWraps.xlsx',
    'SELECT * FROM [Daily sales$A:M]'
);

-- View the table and do clean ups
-- select * from dbo.DailySales;
-- EXEC sp_help 'dbo.DailySales';

-- Rename columns
EXEC sp_rename 'dbo.DailySales.[Item No#]', 'Item_no', 'COLUMN';
EXEC sp_rename 'dbo.DailySales.[Item name]', 'Item_name', 'COLUMN';
EXEC sp_rename 'dbo.DailySales.[Buying price per piece]', 'Buying_price_pc', 'COLUMN';
EXEC sp_rename 'dbo.DailySales.[No# of pieces bought]', 'No_of_items', 'COLUMN';
EXEC sp_rename 'dbo.DailySales.[Total buying price]', 'Tot_buying_price', 'COLUMN';
EXEC sp_rename 'dbo.DailySales.[Total Selling Price]', 'Tot_selling_price', 'COLUMN';
EXEC sp_rename 'dbo.DailySales.[Payment method]', 'Payment_method', 'COLUMN';
EXEC sp_rename 'dbo.DailySales.[Name of customer]', 'Customer_name', 'COLUMN';

-- Change the item no to integer
ALTER TABLE dbo.DailySales
ALTER COLUMN Item_no BIGINT;

-- Change the month column to month format
ALTER TABLE dbo.DailySales
ADD [MonthYear] VARCHAR(8);
UPDATE dbo.DailySales
SET [MonthYear] = UPPER(FORMAT([Month], 'MMM-yyyy'));

-- add new column orderid for every sale
ALTER TABLE dbo.DailySales
ADD OrderID INT IDENTITY(1,1) PRIMARY KEY;

-- summaries
--select sum(Tot_selling_price) as Total_revenue from DailySales
--select sum(Tot_selling_price)/COUNT(distinct OrderID) as Daily_average_revenue from DailySales
--select COUNT(OrderID) as Total_orders from DailySales
--select COUNT(OrderID)/COUNT(distinct Date) as Daily_average_orders from DailySales

