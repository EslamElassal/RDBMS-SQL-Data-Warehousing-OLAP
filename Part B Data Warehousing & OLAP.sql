/*2- Suppose that we want to examine the data of HSD_DW :*/
/*---(a) Write an SQL query to answer the following question: 
         ”Which customer(s) 
		     made an order containing at least five products with different product numbers?” 
          Provide the CustomerName and CustomerID*/


  select CustomerName, CustomerID
  from CUSTOMER
  where CustomerID in(select CustomerID from PRODUCT_SALES
                      group by TimeID, CustomerID
                      having count(DISTINCT ProductNumber) >= 5)

/* b. Write an SQL query for the following report: 
  ”Which customer(s) made the largest order, i.e., those that would result in the largest bill?”*/

select *
from CUSTOMER
where CustomerID in(select top(1) CustomerID
					from PRODUCT_SALES
					group by CustomerID
					order by Sum(Total) desc)

/*Write SQL queries for the ”Roll-Up” operation to summarise the total sales per Year.*/
select  T.TYear, T.N_Month, sum(total) 'the total sales per Year'
from PRODUCT_SALES PS join TIMELINE T
on T.TimeID = PS.TimeID
group by rollup(T.TYear, T.N_Month)

select  T.TYear, sum(total) 'the total sales per Year'
from PRODUCT_SALES PS join TIMELINE T
on T.TimeID = PS.TimeID
group by rollup(T.TYear)

-----------------------------------------------
/*3. Suppose an analyst finds that monthly total have decreased 
     from April 2018 to June 2018, instead of growing. 
	 The analyst wishes to check if there are specific product type or customer city that are responsible for the decrease*/
	 /*
	    a. What are the aggregates that the analyst would start with?
		If the analyst wants to know a specific product type that is responsible for the decrease, 
		he should use Group by on the PRODUCT_SALES table to get the total quantity and cost by using Sum (Quantity) and Sum (Total) 
		for each product so he can know each month in the year the number of products by using group by rollup. And also, 
		he should take this action with the cities' customers too.
	 */
	 /*
	   b. What are the relevant “drill-down” operations that the analyst would need to execute?
	 */

select TYear ,N_Month, P.ProductType,sum(Quantity) 'Quantity', sum(Total) 'the cost'
from PRODUCT_SALES sales join PRODUCT P
on sales.ProductNumber = P.ProductNumber
join TIMELINE T
on sales.TimeID = T.TimeID 
group by rollup(TYear, N_Month, P.ProductType)
having T.TYear = 2018 and T.N_Month in (3,4,5,6)
-------------------------------------------------

select TYear ,N_Month, c.City, sum(Quantity) 'Quantity', sum(Total) 'the cost'
from PRODUCT_SALES sales join CUSTOMER c
on sales.CustomerID = c.CustomerID
join TIMELINE T
on sales.TimeID = T.TimeID
group by rollup (TYear, N_Month, c.City)
having T.TYear = 2018 and T.N_Month in (3,4,5,6)
/*The tables show how many different product kinds were sold in each month (3, 4, 5, and 6). 
Five books, eight Videos, and two video companions were sold for $303 on Mars. 
Three books, six Videos, and four video companions were sold for $230.51 in April. 
Three Videos and two video companions were sold for $77.83 in May. 234.44 sold two books, eight Videos, and six video companions in June.
So, for Mars, April, May, and June, the total cost of decline is 302.33, 230.51, 77.83, and 234.44, respectively.
---------------------------------------------------------
/*4. Using R, read the dimensions files and the Product_Sales fact table. 
      Build an OLAP cube for the Sum of Total Quantity
*/




