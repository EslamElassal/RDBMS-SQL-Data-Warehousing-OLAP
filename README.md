# RDBMS & SQL - Data Warehousing & OLAP

This assigmnent is Home-Work of Fundamentals-Applied Data Sci to analysis a database of VRG (smart art gallery) and Home Kitchen Designs.

## Databases
1. In Part A: RDBMS & SQL:
	VRG is a smart art gallery that acquires and sells contemporary fine art, including original paintings, prints and other artwork. VRG also provides art framing services and sells books on art and artists. VRG has been in business for over 30 years and has one full-time owner, 3 sales reps and 2 workers that make frames, hang art in the gallery and prepare artwork for shipment.
2. Part B: Data Warehousing & OLAP:
	Home Kitchen Designs offers a series of seminars for free at home shows, kitchen and appliance stores, and public locations as a way to build its customer base. The company earns revenues by selling books and videos that instruct people on kitchen designs. They also offer custom-design consulting services. The company has a database that keeps track of its customers, the seminars they attended, the contact details, and the purchases made.

##  Questions that help in exploration these databases:
### In Part A: RDBMS & SQL:
 1.	Identify transactions with null values on the DateSoldID and remove them from the table.
 2. List the WorkId, Title, Medium, ArtistID, and the concatenated artist name renamed as FullName for all artwork that the title contains the word �Yellow, �Blue� or �White�, e.g., the title �On White II� would meet the criteria.
 3.	For each Artist, show the Year, ArtistID, sum of SalesPrice as SumOfSubTotal, and average of SalesPrice as AverageOfSubtotal for each year.
 4. Show the ArtistID , FirstName, Lastname, WorkID, and Title of Artists that have an artwork sold with a SalesPrice above the average SalesPrice.
 5. Modify the email of the customer Johnson Lynda and her encrypted password from NULL to Johnson.lynda@somewhere.com and “aax1xbB” respectively.
 6. For each customer, find the time (in days) between a purchase and the next for the DateSoldID. Display all the attributes of the customer and days between purchase as Days_Difference. Consider using the Lead or Lag function.
7. Create a view called CustomerTransactionSummaryView to display the concatenated customer name renamed as FullName using the LastName and FirstName, Title, DateAcquired, DateSold, and difference in the AcquisitionPrice and SalesPrice as Profit for art works with an AskingPrice greater than $20,000. Use the JOIN ON syntax and order by the AskingPrice in descending order (Ensure to add space between the full name if required).
8. Build a single temporary table called Purchase that captures customers’ purchases from 2015 to 2017. The table should contain the TransactionID, DateAcquired, CustomerID, LastName, FirstName, first AcquisitionDate as MinAcquisitionDate, last AcquisitionDate as MaxAcquisitionDate, and Medium used for the artwork. Also, the Medium values should be represented as numeric values using High Quality Limited Print – 1, Color Aquatint – 2, Water Color and Ink – 3, Oil and Collage – 4, Others - 5. Note: consider using CTEs and CASE statement in your query if required.
 ### Part B: Data Warehousing & OLAP
1. Sketch a representative snowflake schema for the data warehouse (specifying the relations, the attributes, the primary keys, and the foreign keys).
2. SQL queries
 	A) Write an SQL query to answer the following question: ”Which customer(s) made an order containing at least five products with different product numbers?” Provide the CustomerName and CustomerID.
	B) Write an SQL query for the following report: ”Which customer(s) made the largest order, i.e., those that would result in the largest bill?”
	C) Write SQL queries for the ”Roll-Up” operation to summarise the total sales per Year.
3. Suppose an analyst finds that monthly total have decreased from April 2018 to June 2018, instead of growing. The analyst wishes to check if there are specific product type or customer city that are responsible for the decrease.
4. Using R read the dimensions files and the Product_Sales fact table. Build an OLAP cube for the Sum of Total
Quantity.
## Solutions:
### In Part A: RDBMS & SQL:
1.\
![alt text](Images_Solutiuon(FADS)\QP1_1.jpg)\
2.\
![alt text](Images_Solutiuon(FADS)\QP1_2.jpg)\
3.\
![alt text](Images_Solutiuon(FADS)\QP1_3.jpg)\
4.\
![alt text](Images_Solutiuon(FADS)\QP1_4.jpg)\
5.\
![alt text](Images_Solutiuon(FADS)\QP1_5.jpg)\
6.\
![alt text](Images_Solutiuon(FADS)\QP1_6.jpg)\
7.\
![alt text](Images_Solutiuon(FADS)\QP1_7.jpg)\
8.\
![alt text](Images_Solutiuon(FADS)\QP1_8.jpg)
### In Part B: Data Warehousing & OLAP

1.\
![alt text](Images_Solutiuon(FADS)\QP2_1.jpg)\
2.\
A)\
![alt text](Images_Solutiuon(FADS)\QP2_2.jpg)\
B)\
![alt text](Images_Solutiuon(FADS)\QP2_3.jpg)\
C)\
![alt text](Images_Solutiuon(FADS)\QP2_4.jpg)\
3.\
A)\
![alt text](Images_Solutiuon(FADS)\QP2_5.jpg)\
B)\
![alt text](Images_Solutiuon(FADS)\QP2_6.jpg)\
4.\
![alt text](Images_Solutiuon(FADS)\QP2_7.jpg)\
![alt text](Images_Solutiuon(FADS)\QP2_8_1.jpg)\
![alt text](Images_Solutiuon(FADS)\QP2_8_2.jpg)
