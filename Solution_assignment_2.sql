CREATE DATABASE Superstore ;
USE Superstore ;
/*------------------------------------------------ Task 1 - Understanding The Data ---------------------------------------------------------------------------------------*/
/* ------------------------- We Have 05 Different Tables. Let's Understand The Data. ---------------------------------------------

Table 01 : Cust_dimen: table provides the overall information about the customers.

Table 02 : Prod_dimen: table provides the information about the categories and sub-categories of products.

Table 03 : Shipping_dimen: table provides the shipping information about the orders.

Table 04 : Orders_dimen: table provides the dates of orders received with their priorities.

Table 05 : Market_fact: sows the detail of sales along with profit, shipping cost, discount and product base margin.

------------------------------------------ Primery Keys & Foreign Keys ------------------------------------------------------------------------------------------------------

Table 01 : Cust_dimen	:PRIMARY KEY:Cust_id	
						FOREIGN KEY:NA  

Table 02 : Prod_dimen:PRIMARY KEY: Prod_id	
						FOREIGN KEY:NA

Table 03 : Shipping_dimen: PRIMARY KEY:Ship_id	
						FOREIGN KEY:order_id

Table 04 : Orders_dimen: PRIMARY KEY: Ord_id	
						FOREIGN KEY:NA

Table 05 : Market_fact	:PRIMARY KEY: NA	
						FOREIGN KEY:Cust_id, Ord_id, Prod_id, Ship_id
*/                      

/*------------------------------------------------ Task 2 - Basic And Advanced Analysis ---------------------------------------------------------------------------------------*/

/*------------------- Question 01 ---------------------*/
SELECT customer_name 'Customer Nmae', customer_segment 'Customer Segment'
FROM cust_dimen ;

/*------------------- Question 02 ---------------------*/
SELECT * FROM cust_dimen
ORDER BY cust_id DESC ;

/*------------------- Question 03 ---------------------*/
SELECT order_id, order_date 
FROM orders_dimen
WHERE order_priority = 'high' ;

/*------------------- Question 04 ---------------------*/
SELECT SUM(sales) 'Total Sales', AVG(sales) 'Average Sales'
FROM market_fact ;

/*------------------- Question 05 ---------------------*/
SELECT MAX(sales) 'Maximum Sales', MIN(Sales) 'Minimum Sales'
FROM market_fact ;

/*------------------- Question 06 ---------------------*/
SELECT Region, COUNT(*) 'No_Of_Customers'
FROM cust_dimen
GROUP BY region
ORDER BY No_Of_Customers DESC ;

/*------------------- Question 07 ---------------------*/
SELECT Region, COUNT(*) 'No_Of_Customers'
FROM cust_dimen
GROUP BY region
HAVING No_Of_Customers  >= ALL (SELECT COUNT(*) 'No_Of_Customers' FROM cust_dimen GROUP BY region ) ;

/*------------------- Question 08 ---------------------*/
select c.Region as "Region", c.Customer_Name as "Customer Name", 
p.Product_Sub_Category as "Product Sub Category", 
        sum(m.Order_Quantity) as "Order Quantity"
from market_fact m 
join cust_dimen c on m.Cust_id = c.Cust_id
join prod_dimen p on m.Prod_id = p.Prod_id
where c.Region = "ATLANTIC" and p.Product_Sub_Category = "TABLES"
group by c.Customer_Name
Order by sum(m.Order_Quantity) DESC;

/*------------------- Question 09 ---------------------*/
SELECT customer_name, COUNT(*) 'no_of_small business owners', customer_segment
FROM cust_dimen
WHERE Province = 'ontario'
GROUP BY customer_segment 
HAVING customer_segment = 'small business' ;

/*------------------- Question 10 ---------------------*/
SELECT prod_id, COUNT(*) 'No_Of_Products_sold'
FROM market_fact
GROUP BY Prod_id
ORDER BY No_Of_Products_sold DESC ;

/*------------------- Question 11 ---------------------*/
SELECT Prod_id, Product_sub_category
FROM prod_dimen
WHERE product_category ='furniture' OR product_category='technology';

/*------------------- Question 12 ---------------------*/
SELECT product_category, profit 
FROM prod_dimen AS a
INNER JOIN 
market_fact AS b
ON a.Prod_id=b.Prod_id
GROUP BY Product_Category
ORDER BY Profit DESC;

/*------------------- Question 13 ---------------------*/
SELECT a.Product_category, a.Product_sub_category, SUM(b.profit) AS 'Total Profit'
FROM prod_dimen AS a
INNER JOIN market_fact AS b
ON a.Prod_id = b.Prod_id
GROUP BY a.Product_Sub_Category 
ORDER BY a.Product_Category ;

/*------------------- Question 14 ---------------------*/
SELECT a.order_date, b.order_quantity, b.profit
FROM orders_dimen AS a
LEFT JOIN market_fact AS b
ON a.ord_id = b.ord_id ;

/*------------------- Question 15 ---------------------*/
SELECT Customer_name 
FROM cust_dimen
WHERE Customer_Name LIKE '_R_D%';

/*------------------- Question 16 ---------------------*/
SELECT a.customer_name, a.region, a.cust_id, b.sales
FROM cust_dimen AS a
LEFT JOIN market_fact AS b
ON a.Cust_id = b.Cust_id
WHERE b.sales BETWEEN 1000 AND 5000 ;

/*------------------- Question 17 ---------------------*/
SELECT cust_id, sales
FROM market_fact
ORDER BY sales DESC
LIMIT 3 ;

/*------------------- Question 18 ---------------------*/
SELECT r.Region AS "Region",count(m.Ship_id) AS "Number of Shipments", 
ROUND(SUM(m.Profit),2) AS "Profit in each region"
FROM market_fact m 
JOIN cust_dimen r ON m.Cust_id = r.Cust_id
JOIN prod_dimen p ON m.Prod_id = p.Prod_id
WHERE Product_Sub_Category = (
SELECT p.Product_Sub_Category FROM market_fact m 
JOIN prod_dimen p ON m.Prod_id = p.Prod_id
GROUP BY Product_Sub_Category
ORDER BY SUM(m.Profit)
LIMIT 1) 
GROUP BY r.Region
ORDER BY SUM(m.Profit);

