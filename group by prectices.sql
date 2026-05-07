create database groupby;
use groupby;
CREATE TABLE Orders (
OrderID INT PRIMARY KEY,
CustomerID VARCHAR(10),
Category VARCHAR(50),
OrderDate DATE,
OrderValue DECIMAL(10,2)
);



INSERT INTO Orders (OrderID, CustomerID, Category, OrderDate, OrderValue) VALUES
(1001, 'C201', 'Electronics', '2024-01-05', 12500),
(1002, 'C203', 'Apparel', '2024-01-07', 3200),
(1003, 'C205', 'Home', '2024-01-10', 5800),
(1004, 'C201', 'Electronics', '2024-01-15', 8900),
(1005, 'C207', 'Apparel', '2024-01-18', 2100),
(1006, 'C210', 'Home', '2024-01-22', 4700),
(1007, 'C203', 'Electronics', '2024-02-01', 15300),
(1008, 'C212', 'Apparel', '2024-02-05', 1800),
(1009, 'C205', 'Home', '2024-02-08', 6200),
(1010, 'C214', 'Electronics', '2024-02-12', 9400),
(1011, 'C207', 'Apparel', '2024-02-17', 2900),
(1012, 'C210', 'Electronics', '2024-02-20', 11000),
(1013, 'C212', 'Home', '2024-03-01', 3500),
(1014, 'C201', 'Apparel', '2024-03-05', 4100),
(1015, 'C214', 'Home', '2024-03-10', 7800);

select * from Orders;


-- Q1. Calculate the total revenue (sum of OrderValue) for each product Category.

select category,sum(ordervalue) as total_revenue from orders group by category;


-- Q2. Count the total number of orders placed in each Category.


select category, count(orderid) from orders group by category;


-- Q3. Find the highest (maximum) single OrderValue within each Category.

select category, max(ordervalue) from orders group by category;

-- Q1. List all unique product Categories that appear in the Sales_Data table.

select distinct category from orders;


-- Q2. List all unique CustomerIDs who have placed at least one order.

select distinct customerid from orders;


-- Q3. Find all unique combinations of CustomerID and Category (i.e., which customers bought from which categories).
SELECT DISTINCT CustomerID, Category
FROM orders order by CustomerID;

-- customerid +category toal_revenue

select customerid ,category, sum(ordervalue) from orders group by customerid ,category order by customerid;

-- orders count base on  customerid ,category 
select customerid ,category, count(orderid) as total_oders from orders group by customerid ,category order by customerid;


-- revenue by category and month
select category, count(orderdate) ,sum(ordervalue) from orders group by category,orderdate;

-- category with revenue>$20000


select category, sum(ordervalue) from orders group by category having sum(ordervalue) >20000;

-- at list 1 ordre by customer 
select customerid, count(orderid) from orders group by customerid having count(orderid)>1;


-- customerid+category combine spending>10000


select customerid,category, sum(ordervalue) from orders group by customerid,category having sum(ordervalue)>10000 order by customerid;


-- avg ordervalue >5000
select category, count(ordervalue), sum(ordervalue),avg(ordervalue) from orders group by category having avg(ordervalue)>5000;


-- high repeted orders(avg>6000)

select customerid,count(orderid) as order_count ,avg(ordervalue) as avg_ordervalue from orders group by customerid having order_count>1 and avg(ordervalue)>=6000 order by avg_ordervalue desc;

SELECT
Category,
MONTH(OrderDate) AS Order_Month,
SUM(OrderValue) AS Total_Revenue
FROM orders
GROUP BY Category, MONTH(OrderDate)
ORDER BY Order_Month, Category;


select * from orders ;
