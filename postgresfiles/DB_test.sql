SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'public';

SELECT * FROM daily_sales
order by "Date" DESC
limit 5;