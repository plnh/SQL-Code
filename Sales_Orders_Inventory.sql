-- Inventory, Products, Sales files
SELECT *
FROM sales;
SELECT *
FROM orders;
SELECT *
FROM inventory;

-- How many years of sale data included
SELECT MIN(YEAR(Date)) AS min_year, MAX(YEAR(Date)) As min_year
FROM sales;

-- What is the total quantity sold for each ProductId per month?
SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, ProductId, ROUND(MAX(UnitPrice),2) AS UnitPrice, SUM(Quantity) AS UnitsSold
FROM
  sales
GROUP BY YEAR(Date), MONTH(Date), ProductId
ORDER BY YEAR(Date), MONTH(Date), ProductId;
