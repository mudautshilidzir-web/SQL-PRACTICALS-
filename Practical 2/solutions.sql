COFFE.SH0P_SALESCOFFE.SH0P_SALESCOFFECOFFE.SH0P_SALES.BRIGHT_COFFE_SHOPCOFFE.SH0P_SALES.BRIGHT_COFFE_SHOPselect * from PRACTICAL2.SHOP_SALES.CUSTOMERS limit 10;

select * from PRACTICAL2.SHOP_SALES.ORDERS limit 10;

select * from PRACTICAL2.SHOP_SALES.PRODUCTS limit 10;
 
----------------------------------------------------------------------------
--1. INNER JOIN: Orders with Customer and Product Names
--Question:
--List all orders along with the customer name and product name.
--Expected Output Columns:
--• OrderID, OrderDate, CustomerName, ProductName, Quantity

select A.Orderid,
A.orderdate,
B.Customername,
C.productname,
A.quantity 
from PRACTICAL2.SHOP_SALES.ORDERS AS A
INNER JOIN PRACTICAL2.SHOP_SALES.CUSTOMERS AS B
ON A.customerid = B.customerid
INNER JOIN PRACTICAL2.SHOP_SALES.PRODUCTS AS C
ON A.productid = C.productid;


----------------------------------------------------------------------------
--2. INNER JOIN: Customers Who Placed Orders
--Question:
--Which customers have placed at least one order?
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate

select A.customerid ,
A.Customername,
A.country, 
B.Orderid,
B.orderdate
from PRACTICAL2.SHOP_SALES.CUSTOMERS AS A 
INNER JOIN PRACTICAL2.SHOP_SALES.ORDERS AS B 
ON A.customerid =B.customerid ; 

----------------------------------------------------------------
--3. LEFT JOIN: All Customers and Their Orders
--Question:
--List all customers and any orders they might have placed. Include customers who have not placed any orders.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select A.customerid,
A.Customername,
A.country,
B.Orderid,
B.orderdate,
C.productname 
from PRACTICAL2.SHOP_SALES.CUSTOMERS AS A 
INNER JOIN PRACTICAL2.SHOP_SALES.ORDERS AS B
ON A.customerid = B.customerid
INNER JOIN PRACTICAL2.SHOP_SALES.PRODUCTS AS C
ON B.productid = C.productid ;
----------------------------------------------------------------------------

--4. LEFT JOIN: Product Order Count
--Question:
--List all products and how many times each was ordered (if any).
--Expected Output Columns:
--• ProductID, ProductName, TotalOrders
--(TotalOrders is the count of how many times the product appears in orders

select A.productid,
B.PRODUCTNAME,
COUNT(A.Orderid) AS totalorders
from PRACTICAL2.SHOP_SALES.ORDERS AS A
LEFT JOIN PRACTICAL2.SHOP_SALES.PRODUCTS AS B
ON A.productid = B.productid
GROUP BY A.productid ,
B.productname ;

--------------------------------------------------------------------------

--5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered)
--Question:
--Find all orders along with product details, including any products that might not have
--been ordered.
--Expected Output Columns:
--• OrderID, OrderDate, ProductID, ProductName, Price, Quantity

select A.orderid,
A.orderdate,
A.productid,
B.productname,
B.price,
A.quantity 
from PRACTICAL2.SHOP_SALES.ORDERS AS A
RIGHT JOIN PRACTICAL2.SHOP_SALES.PRODUCTS AS B
ON A.productid = B.productid ; 


----------------------------------------------------------------------

--6. RIGHT JOIN: Customer Info with Orders (Include All Customers)
--Question:
--Which customers have made orders, and include customers even if they have never placed an order.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select B.customerid,
B.Customername,
B.country,
A.Orderid,
A.orderdate,
A.productid,
A.quantity 
from PRACTICAL2.SHOP_SALES.ORDERS AS A 
RIGHT JOIN PRACTICAL2.SHOP_SALES.CUSTOMERS AS B 
ON A.customerid = B.customerid ;


-------------------------------------------------------------------------------
--Question:
--List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info.
--Expected Output Columns:
--• CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

select A.customerid,
A.Customername,
A.country,
B.Orderid,
B.orderdate,
B.productid,
B.quantity
from PRACTICAL2.SHOP_SALES.CUSTOMERS AS A 
FULL OUTER JOIN PRACTICAL2.SHOP_SALES.ORDERS AS B
ON A.customerid =B.customerid  ;
------------------------------------------------------------------------------

--8. FULL OUTER JOIN: All Products and Orders
--Question:
--List all products and orders, showing NULLs where products were never ordered or
--orders are missing product info.
--Expected Output Columns:
--• ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

select A.productid,
B.productname,
B.price,
A.Orderid,
A.orderdate,
A.customerid,
A.quantity
from PRACTICAL2.SHOP_SALES.ORDERS AS A
FULL OUTER JOIN PRACTICAL2.SHOP_SALES.PRODUCTS AS B
ON A.productid = B.productid ;
FULL OUTER JOIN PRACTICAL2.SHOP_SALES.CUSTOMERS AS C
ON A.customerid = B.customerid ;
