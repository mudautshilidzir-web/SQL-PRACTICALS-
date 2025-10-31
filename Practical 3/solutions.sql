PRACTICAL_3.TRENDSselect item_purchased
from PRACTICAL_3.TRENDS.SHOPING_TRENDS;
-------------------------------------------
--1. Find all records where Size is missing and the purchase_amount is greater than 50.
--Expected Columns: Customer ID, Size, purchase_amount, Item Purchased
select customer_id,
size,
purchase_amount,
item_purchased
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where size IS NULL;

----------------------------------------------------
--2. List the total number of purchases grouped by Season, treating NULL values as 'Unknown Season'.
--Expected Columns: Season, Total Purchases

select coalesce(season,'unknown') AS season,
count(*) AS total_number_purchase

from PRACTICAL_3.TRENDS.SHOPING_TRENDS
group by season, 'unknown';
------------------------------------------------------------
--3. Count how many customers used each Payment Method, treating NULLs as 'Not Provided'.
--Expected Columns: Payment Method, Customer Count
select coalesce(payment_method, 'not provided') AS payment_method,
count(*) AS customer_count
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
group by payment_method,'not provided';

-------------------------------------------------------
--4. Show customers where Promo Code Used is NULL and Review Rating is below 3.0.
--Expected Columns: Customer ID, Promo Code Used, Review Rating, Item Purchased 

select customer_id,
promo_code_used,
review_rating,
item_purchased
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where promo_code_used IS NULL
having review_rating <3;
---------------------------------------------------------------------

--5. Group customers by Shipping
--Type, and return the average purchase_amount, treating missing values as 0.
--Expected Columns: Shipping Type, Average purchase_amount

----------------------------------------------------------------

--6. Display the number of SELECT 
select coalesce(Shipping_Type, 'Unknown') AS Shipping_Type,
    avg(coalesce(purchase_amount, 0)) AS Average_purchase_amount
from  PRACTICAL_3.TRENDS.SHOPING_TRENDS
group by Shipping_Type, 'unknown';
-------------------------------------------------------------------------

--Expected Columns: Location, Total Purchases
--7. Create a column Spender Category that classifies customers using CASE:
--'High' if amount > 80, 'Medium' if BETWEEN 50 AND 80,
--'Low' otherwise. Replace NULLs in purchase_amount with 0.
--Expected Columns: Customer ID, purchase_amount, Spender Category
select Customer_ID,
    COALESCE(purchase_amount, 0) AS purchase_amount,
    case 
        when COALESCE(purchase_amount, 0) > 80 then 'High'
        when COALESCE(purchase_amount, 0) BETWEEN 50 AND 80 then 'Medium'
        else 'Low'
    end AS Spender_Category
from PRACTICAL_3.TRENDS.SHOPING_TRENDS;
    


---------------------------------------------------------------
--8. Find customers who have no Previous Purchases value but whose Color is not NULL.
--Expected Columns: Customer ID, Color, Previous Purchases
select customer_id,
color,
previous_purchases
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where color IS NOT NULL;

----------------------------------------------------------------

--9. Group records by Frequency of
--Purchases and show the total amount spent per group, treating NULL frequencies as 'Unknown'.
--Expected Columns: Frequency of Purchases, Total purchase_amount
select frequency_of_purchases,
count(*) AS total_purchase_amount
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
group by frequency_of_purchases;

-----------------------------------------------------

--10.Display a list of all Category values with the number of times each was purchased, excluding rows where Categoryis NULL.
--Expected Columns: Category, Total Purchases
select category,
count(*) total_purchases
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where category IS NOT NULL
group by category;
-------------------------------------------------------

--11.Return the top 5 Locations with the highest total purchase_amount, replacing NULLs in amount with 0.
--Expected Columns: Location, Total purchase_amount
select location,
sum(coalesce(purchase_amount,0))AS total_purchase_amount
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
group by purchase_amount, location
order by total_purchase_amount desc
limit 5;
-----------------------------------------------------


--12.Group customers by Gender and Size, and count how many entries have a NULL Color.
--Expected Columns: Gender, Size, Null Color Count
select gender,
size,
count(*) AS null_color_count
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where color IS NULL
group by gender, size;

-------------------------------------------------------

--13.Identify all Item Purchased where more than 3 purchases had NULL Shipping Type.
--Expected Columns: Item Purchased, NULL Shipping Type Count
select item_purchased,
count(*) AS null_shipping_type_count
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where item_purchased IS NULL
group by item_purchased
having count(*) >3;
---------------------------------------------------------------




--14.Show a count of how many customers per Payment Method have NULL Review Rating.
--Expected Columns: Payment Method, Missing Review Rating Count
select 
    coalesce(Payment_Method, 'Not Provided') AS Payment_Method,
    count(*) AS Missing_Review_Rating_Count
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where Review_Rating IS NULL
group by coalesce(Payment_Method, 'Not Provided');

----------------------------------------------------------


--15.Group by Category and return the average Review Rating, replacing NULLs with 0, and filter only where average is greater than 3.5.
--Expected Columns: Category, Average Review Rating
select color,
count(age) as avarage_age
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where color IS NULL
group by color
having count(*) >=2 ;

-------------------------------------------------------------


--16. List all Colors that are missing (NULL) in at least 2 rows and the average Age of customers for those rows.
--Expected Columns: Color, Average Age
select color,
from PRACTICAL_3.TRENDS.SHOPING_TRENDS;
------------------------------------------------------------
--17.Use CASE to create a column Delivery Speed: 'Fast' if Shipping Type is 'Express' or'Next Day Air', 'Slow' if 'Standard','Other' for all else including NULL. Then count how many customers fall into each category.
--Expected Columns: Delivery Speed, Customer Count

select
    case 
        when Shipping_Type IN ('Express', 'Next Day Air') THEN 'Fast'
        when Shipping_Type = 'Standard' THEN 'Slow'
        else 'Other'
    end as  Delivery_Speed,
    COUNT(DISTINCT Customer_ID) AS Customer_Count
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
    
group by 
    case
        when Shipping_Type IN ('Express', 'Next Day Air') THEN 'Fast'
        when Shipping_Type = 'Standard' THEN 'Slow'
        else 'Other'
    end;
------------------------------------------------------------

--18.Find customers whose purchase_amount is NULL and whose Promo Code Used is 'Yes'.
--Expected Columns: Customer ID, purchase_amount, Promo Code Used
select customer_id,
purchase_amount,
promo_code_used
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where purchase_amount IS NULL
AND promo_code_used ='yes';

------------------------------------------------------

--19.Group by Location and show the maximum Previous Purchases, replacing NULLs with 0, only where the average rating is above 4.0.
--Expected Columns: Location, Max Previous Purchases, Average Review Rating

select
    Location,
    MAX(COALESCE(Previous_Purchases, 0)) AS Max_Previous_Purchases,
    AVG(Review_Rating) AS Average_Review_Rating
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
group by Location
having avg(review_rating) >4;


------------------------------------------------------------


--20.Show customers who have a NULL Shipping Type but made a purchase in the range of 30 to 70 USD.
--Expected Columns: Customer ID, Shipping
--Type, purchase_amount, Item Purchased
select Customer_ID,
    Shipping_Type,
    purchase_amount,
    Item_Purchased
from PRACTICAL_3.TRENDS.SHOPING_TRENDS
where Shipping_Type IS NULL
and purchase_amount BETWEEN 30 AND 70;



-------------------------------------------------------
