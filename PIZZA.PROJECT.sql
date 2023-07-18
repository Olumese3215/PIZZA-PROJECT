/*The owner of a pizza shop wants answer about his products Performance in the market.Having
  a deep understanding of his products overall performance will help him plan ahead 
  and allow him better informed business decisions,hence we looked at the following 
  KPI*/

--Total Revenue.
SELECT ROUND (SUM(total_price),2) AS Total_Revenue
FROM pizza_sales

--Average Order Value
SELECT ROUND (SUM(total_price)/COUNT(DISTINCT(order_id)),2) AS Average_Order_value
FROM pizza_sales
 
 --Total Pizzas sold
 SELECT SUM(quantity) as Total Pizza Sold
 FROM pizza_sales

 --Total Order 
 SELECT COUNT(DISTINCT(order_id)) AS Total_Order
 FROM pizza_sales

 --Average Pizza Per Order
 SELECT SUM(quantity)/ COUNT(DISTINCT(order_id)) AS Average_Pizza_Per_order
 FROM pizza_sales

 -- CHARTS REQUIREMENTS( We will use PowerBi to visualise)

--Daily Trend for Total Orders.
SELECT DATENAME(DW,order_date) AS Order_day,COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)
ORDER BY Total_Orders DESC

--Monthly Trend for Total_Orders
SELECT DATENAME(Month,order_date) AS Order_Month,COUNT(DISTINCT(order_id)) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(Month,order_date)
ORDER BY Total_Orders DESC

--Percentage of sales by Pizza category(PSPC)
SELECT pizza_category,SUM(Total_price)*100/(SELECT SUM (Total_price) FROM pizza_sales)
AS PSPC
FROM pizza_sales
GROUP BY pizza_category
ORDER BY PSPC DESC

-- Percentage of Sales by Pizza Size{PSPS}
SELECT pizza_size,SUM(Total_price)*100/(SELECT SUM (Total_price) FROM pizza_sales)
AS PSPS
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PSPS DESC

--Top 5 best selling Pizza Based on REVENUE
SELECT TOP 5 pizza_name,SUM(total_price) as TOTAL_REVENUE
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE DESC
 
 --Bottom 5 Selling Pizza Based On REVENUE
 SELECT TOP 5 pizza_name,SUM(total_price) as TOTAL_REVENUE
FROM pizza_sales
GROUP BY pizza_name
ORDER BY TOTAL_REVENUE ASC

--TOP 5 selling pizza based on QUANTITY
 SELECT TOP 5 pizza_name,SUM(quantity) as Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
 
 --Bottom 5 selling Pizza based on QUANTITY
 SELECT TOP 5 pizza_name,SUM(quantity) as Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity ASC

--TOP 5 selling Pizza based on Order
 SELECT TOP 5 pizza_name,COUNT(DISTINCT(Order_id)) as Total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_order DESC

--BOTTOM 5 selling pizza based on order
SELECT TOP 5 pizza_name,COUNT(DISTINCT(Order_id)) as Total_order
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_order ASC

 