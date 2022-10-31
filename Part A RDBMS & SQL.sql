USE VRG
GO

/*select * from CUSTOMER
select * from ARTIST
select * from CUSTOMER_ARTIST_INT
select * from TRANS
select * from WORK

Delete from TRANS where DateSold is NULL*/

/**************-a-*****************/

select * from TRANS where DateSold is NULL /*This is for checking*/

/**************-b-*****************/

select WorkID, Title, Medium, ARTIST.ArtistID, CONCAT(FirstName, ' ',LastName) as FullName from WORK
join ARTIST on WORK.ArtistID = ARTIST.ArtistID
where Title like '%Yellow%' or Title like '%Blue%' or Title like '%White%'

/**************-c-*****************/

SELECT YEAR(DateSold) as Year, ArtistID, sum(SalesPrice) as SumOfSubTotal, avg(SalesPrice) as AverageOfSubtotal from TRANS
join CUSTOMER_ARTIST_INT on TRANS.CustomerID = CUSTOMER_ARTIST_INT.CustomerID
group by ArtistID, YEAR(DateSold)
order by ArtistID /*this is not in the task*/

/**************-d-*****************/
/*D)	Show the ArtistID , FirstName, Lastname, WorkID, and Title of Artists that have an artwork sold with a SalesPrice above the average SalesPrice.*/
select ARTIST.ArtistID, FirstName, LastName, WORK.WorkID, Title from ARTIST 
inner join WORK on Artist.ArtistID = WORK.ArtistID
inner join TRANS on TRANS.WorkID = WORK.WorkID
where SalesPrice > (select avg(SalesPrice) from TRANS)


/**************-e-*****************/
update CUSTOMER set EmailAddress = 'Johnson.lynda@somewhere.com', EncryptedPassword = 'aax1xbB' where FirstName = 'Lynda' and LastName = 'Johnson'

/**************-f-*****************/
select 
Customer.CustomerID, LastName, FirstName, EmailAddress, EncryptedPassword, Street,
City, State, ZIPorPostalCode, Country, AreaCode, PhoneNumber, 
DATEDIFF(DAY, DateSold, LEAD(DateSold) OVER(ORDER BY DateSold)) as Days_Difference 
from TRANS
join CUSTOMER on TRANS.CustomerID = CUSTOMER.CustomerID

select DATEDIFF(DAY, DateSold, LEAD(DateSold) OVER(ORDER BY DateSold)) as Days_Difference from TRANS   /*this should be removed*/

/**************-g-*****************/
---drop view CustomerTransactionSummaryView
CREATE VIEW CustomerTransactionSummaryView 
as select CONCAT(LastName, ' ', FirstName) as Full_Name, Title, DateAcquired, DateSold, SalesPrice - AcquisitionPrice as Profit,AskingPrice
from CUSTOMER
join TRANS on CUSTOMER.CustomerID = TRANS.CustomerID	
join WORK on TRANS.WorkID = WORK.WorkID
where AskingPrice > 20000



select * from CustomerTransactionSummaryView
order by CustomerTransactionSummaryView.AskingPrice desc

/**************-h-*****************/
select TransactionID, CUSTOMER.CustomerID, DateAcquired, LastName, FirstName, Medium
into Purchase
from CUSTOMER 
join TRANS on CUSTOMER.CustomerID = TRANS.CustomerID
join WORK on TRANS.WorkID = WORK.WorkID
where YEAR(DateSold) BETWEEN 2015 AND 2017


update Purchase set Medium = CASE 
When Medium = 'High Quality Limited Print' then 1
When Medium = 'Color Aquatint' then 2
When Medium = 'Water Color and Ink' then 1
When Medium = 'Oil and Collage' then 1
else 5
end

select * from Purchase




