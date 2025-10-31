
--------------------------------------------------------
--Questions
--Q1. Display all columns for all transactions.
--Expected output: All columns

SELECT *
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;
---------------------------------------------------------
--Q2. Display only the Transaction ID, Date, and Customer ID for all records.
--Expected output: Transaction ID, Date, Customer ID 

SELECT transaction_id,
date,
customer_id
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;

------------------------------------------------
--2. SELECT DISTINCT Statement
--Q3. Display all the distinct product categories in the dataset.
--Expected output: Product Category

SELECT DISTINCT product_category
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;
-----------------------------------------------
--Q4. Display all the distinct gender values in the dataset.
--Expected output: Gender

SELECT DISTINCT Gender
FROM  RETAIL.RETAIL_SALES.RETAIL_SALES;


----------------------------------------------------------
--3. WHERE Clause
--Q5. Display all transactions where the Age is greater than 40.
--Expected output: All columns

SELECT *
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
WHERE Age > 40;


-----------------------------------------------------
--Q6. Display all transactions where the Price per Unit is between 100 and 500.
--Expected output: All columns

SELECT *
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
WHERE price_per_unit BETWEEN 100 AND 500;

--------------------------------------------------------------------

--Q7. Display all transactions where the Product Category is either 'Beauty' or'Electronics'.
--Expected output: All columns

SELECT *
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
WHERE product_category IN ('Beauty', 'Electronics');
----------------------------------------------------------------------

--Q8. Display all transactions where the Product Category is not 'Clothing'.
--Expected output: All columns

SELECT *
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
WHERE Product_Category <> 'Clothing';
-----------------------------------------------------------------------------------

--Q9. Display all transactions where the Quantity is greater than or equal to 3.
--Expected output: All columns

SELECT *
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
WHERE Quantity >= 3;
-----------------------------------------------------------------------------
--4. Aggregate Functions
--Q10. Count the total number of transactions.
--Expected output: Total_Transactions

SELECT COUNT(*) AS Total_Transactions
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;


---------------------------------------------------------------------------

--Q11. Find the average Age of customers.
--Expected output: Average_Age

SELECT AVG(Age) AS Average_Age
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;
------------------------------------------------------------------------------

--Q12. Find the total quantity of products sold.
--Expected output: Total_Quantity

SELECT SUM(Quantity) AS Total_Quantity
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;
---------------------------------------------------
--Q13. Find the maximum Total Amount spent in a single transaction.
--Expected output: Max_Total_Amount

SELECT MAX(Total_Amount) AS Max_Total_Amount
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;

------------------------------------------------------------
--Q14. Find the minimum Price per Unit in the dataset.
--Expected output: Min_Price_per_Unit

SELECT MIN(Price_per_Unit) AS Min_Price_per_Unit
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;

----------------------------------------------
--5. GROUP BY Statement
--Q15. Find the number of transactions per Product Category.
--Expected output: Product Category, Transaction_Count

SELECT Product_Category,
COUNT(*) AS Transaction_Count
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
GROUP BY product_category;

-------------------------------------------------------

--Q16. Find the total revenue (Total Amount) per gender.
--Expected output: Gender, Total_Revenue

SELECT Gender, 
SUM(Total_Amount) AS Total_Revenue
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
GROUP BY Gender;

------------------------------------------------

--Q17. Find the average Price per Unit per product category.
--Expected output: Product Category, Average_Price

SELECT Product_Category, AVG(PRICE_PER_UNIT) AS Average_Price
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
GROUP BY Product_Category;

------------------------------------------------
--6. HAVING Clause
--Q18. Find the total revenue per product category where total revenue is greater than 10,000.
--Expected output: Product Category, Total_Revenue

SELECT Product_Category, SUM(Total_Amount) AS Total_Revenue
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
GROUP BY Product_Category
HAVING SUM(Total_Amount) > 10000;

------------------------------------------------------------------------------
--Q19. Find the average quantity per product category where the average is more than 2.
--Expected output: Product Category, Average_Quantity

SELECT Product_Category, AVG(Quantity) AS Average_Quantity
FROM RETAIL.RETAIL_SALES.RETAIL_SALES
GROUP BY Product_Category
HAVING AVG(Quantity) > 2;

------------------------------------------------------------------
--7. CASE Statement
--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000,
--otherwise 'Low'.
--Expected output: Transaction ID, Total Amount, Spending_Level.

SELECT 
    Transaction_ID, 
    Total_Amount,
    CASE 
        WHEN TOTAL_AMOUNT > 1000 THEN 'High'
        ELSE 'Low'
    END AS Spending_Level
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;


----------------------------------------------------------------------
--Q21. Display a new column called Age_Group that labels customers as:
--• 'Youth' if Age < 30
--• 'Adult' if Age is between 30 and 59
--• 'Senior' if Age >= 60
--Expected output: Customer ID, Age, Age_Group

SELECT 
    Customer_ID,
    Age,
    CASE 
        WHEN AGE < 30 THEN 'Youth'
        WHEN AGE BETWEEN 30 AND 59 THEN 'Adult'
        ELSE 'Senior'
    END AS Age_Group
FROM RETAIL.RETAIL_SALES.RETAIL_SALES;

-------------------------------------------------------------------
