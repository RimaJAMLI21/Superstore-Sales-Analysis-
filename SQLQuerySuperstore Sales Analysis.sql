SELECT top 5 * FROM Store;

/*Totalsales and total profits of each year*/

SELECT DATEADD(YEAR, DATEDIFF(YEAR, 0, orderdate), 0) AS year, 
SUM(Sales) AS Total_Sales,
SUM(Profit) AS Total_Profit
FROM Store
GROUP BY DATEADD(YEAR, DATEDIFF(YEAR, 0, orderdate), 0)
ORDER BY year ASC;


/* The total Profits and total sales per quarter*/
SELECT 
  datepart(year, OrderDate) AS year, 
  CASE 
    WHEN datepart(month, OrderDate) IN (1,2,3) THEN 'Q1'
    WHEN datepart(month, OrderDate) IN (4,5,6) THEN 'Q2'
    WHEN datepart(month, OrderDate) IN (7,8,9) THEN 'Q3'
    ELSE 'Q4'
  END AS quarter,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM Store
GROUP BY datepart(year, OrderDate), 
         CASE 
            WHEN datepart(month, OrderDate) IN (1,2,3) THEN 'Q1'
            WHEN datepart(month, OrderDate) IN (4,5,6) THEN 'Q2'
            WHEN datepart(month, OrderDate) IN (7,8,9) THEN 'Q3'
            ELSE 'Q4'
         END
ORDER BY year, quarter;

/*Yearly sales and profit per quarter*/
SELECT 
  CASE 
    WHEN datepart(month, OrderDate) IN (1,2,3) THEN 'Q1'
    WHEN datepart(month, OrderDate) IN (4,5,6) THEN 'Q2'
    WHEN datepart(month, OrderDate) IN (7,8,9) THEN 'Q3'
    ELSE 'Q4'
  END AS quarter,
  SUM(Sales) AS total_sales,
  SUM(Profit) AS total_profit
FROM Store
GROUP BY  
         CASE 
            WHEN datepart(month, OrderDate) IN (1,2,3) THEN 'Q1'
            WHEN datepart(month, OrderDate) IN (4,5,6) THEN 'Q2'
            WHEN datepart(month, OrderDate) IN (7,8,9) THEN 'Q3'
            ELSE 'Q4'
         END
ORDER BY quarter;

/*The highest sales and profits per region*/
 select Region,
        SUM(Sales) as Total_Sales,
		SUM(Profit) as Total_Profit
 from store
 group by Region
 order by Total_Profit desc;
 -----------------------------------

 --Profit Margin by region, States, Cities--

 select Region,
        ROUND(SUM(Profit)/SUM(Sales)*100, 2) as Profit_margin
 from store
 group by Region
 order by Profit_margin desc;

-----------------------------------------
select top 10 State,
        SUM(Sales) as Total_Sales,
		SUM(Profit) as Total_Profit
 from store
 group by State
 order by Total_Profit asc;
--------------------------------------------
--with hight profit--
select top 10 State,
        SUM(Sales) as Total_Sales,
		SUM(Profit) as Total_Profit
 from store
 group by State
 order by Total_Profit desc;
---------------------------------------------
select top 10 City,
        SUM(Sales) as Total_Sales,
		SUM(Profit) as Total_Profit
 from store
 group by City
 order by Total_Profit desc;

------------Bottom------------------------
select top 10 City,
        SUM(Sales) as Total_Sales,
		SUM(Profit) as Total_Profit
 from store
 group by City
 order by Total_Profit asc;
 -------------------------------------
 /*the relationship between discount and sales and the total discount per category*/
 --Discount vs avg sales
 select Discount,
        AVG(Sales) as AVG_Sales

from store
group by Discount
order by Discount;

--Discount vs Category
select Category, 
       SUM(discount) as Total_Discount
from store
group by Category
order by Total_Discount asc;

---sub_category

select Category, 
       Sub_Category,
       SUM(discount) as Total_Discount
from store
group by Category,Sub_Category
order by Total_Discount desc;

/*Ctegory that generates the highest sales and profits in each region and state*/

select Category,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit,
	  Round( sum(Profit)/sum(Sales)*100, 2) as Profit_Margin
from store
group by Category
order by Total_Profit Desc;
----------------
select Region,
       Category,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit,
	  Round( sum(Profit)/sum(Sales)*100, 2) as Profit_Margin
from store
group by Region,Category
order by Total_Profit Desc;
------------------
select State,
       Category,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit,
	  Round( sum(Profit)/sum(Sales)*100, 2) as Profit_Margin
from store
group by State,Category
order by Total_Profit ASC;
--------------------

select 
       Sub_Category,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit,
	  Round( sum(Profit)/sum(Sales)*100, 2) as Profit_Margin
from store
group by Sub_Category
order by Total_Profit DESC;
---------------------

select Region,
       Sub_Category,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit,
	  Round( sum(Profit)/sum(Sales)*100, 2) as Profit_Margin
from store
group by Region,Sub_Category
order by Total_Profit DESC;
--------------------

select Region,
       Sub_Category,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit,
	  Round( sum(Profit)/sum(Sales)*100, 2) as Profit_Margin
from store
group by Region,Sub_Category
order by Total_Profit DESC;
----------------------
select Region,
       Sub_Category,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit,
	  Round( sum(Profit)/sum(Sales)*100, 2) as Profit_Margin
from store
group by Region,Sub_Category
order by Total_Profit asc;

/*The highest total sales and total profits per subcategory in each state*/

SELECT State,
       Sub_Category, 
	   SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM Store
GROUP BY State, Sub_Category
ORDER BY Total_Profit DESC;

/*The lowest total sales and total profits per subcategory in each state*/


SELECT State,
       Sub_Category, 
	   SUM(Sales) AS Total_Sales,
       SUM(Profit) AS Total_Profit
FROM Store
GROUP BY State, Sub_Category
ORDER BY Total_Profit ASC;

/*Names of the products that are the most and least profitable to us*/

select ProductName, 
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit
from store
group by ProductName
order by Total_Profit DESC;

------------------
select ProductName, 
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit
from store
group by ProductName
order by Total_Profit ASC;

/*What segment makes the most of our profits and sales?*/

select Segment,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit
from store
group by Segment
order by Total_Profit DESC;

/* How many customers do we have in total and how much per region & states*/

select count(distinct CustomerID) as Total_Customers
from Store

----------
select Region,
       count(distinct CustomerID) as Total_Customers
from Store
group by Region
order by Total_Customers;
-----------

select State,
       count(distinct CustomerID) as Total_Customers
from Store
group by State
order by Total_Customers desc;

/*Customer rewards program : loyal customers*/

select top 15 CustomerID,
       sum(Sales) as Total_Sales,
	   sum(Profit) as Total_Profit
from Store
group by CustomerID
order by Total_Sales desc;

/* Average shipping time per class in total */
SELECT AVG(DateDIFF(day, OrderDate, ShipDate))AS avg_shipping_time
FROM store;

--------------------
select ShipMode, AVG(DateDIFF(day, OrderDate, ShipDate))AS avg_shipping_time
from store
GROUP BY Shipmode
ORDER BY avg_shipping_time

















