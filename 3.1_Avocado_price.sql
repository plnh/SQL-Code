-- AVOCADO FILE
SELECT *
FROM Avocado;

-- Test if total_bags is the sumary of all bags. If YES return none
SELECT *
FROM Avocado
WHERE ROUND(Total_Bags - (Small_Bags + Large_Bags + XLarge_Bags),-1) != 0;


-- What is the proportion of Small bags sold? 
SELECT Date, region,Total_Bags, Small_Bags,
	(Small_Bags/ Total_Bags)*100 AS Small_Bags_Percent
FROM Avocado
WHERE Total_Bags > 0; -- filter out row with 0 total_bags


SELECT YEAR(Date) AS Year,  
	region, AVG(AveragePrice) As AVG_Price, SUM(Small_Bags) AS Small_Bags_Sum, SUM(Large_Bags) AS Large_Bags_Sum , SUM(XLarge_bags) AS XLarge_bags_Sum, SUM(Total_Bags) AS Total_Bags_Sum
FROM Avocado
GROUP BY YEAR(Date), region
ORDER BY region, Year(Date) DESC;
