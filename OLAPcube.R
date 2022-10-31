rm(list = ls(all.names = TRUE)); gc();
# Setup the dimension tables


Timeline_table <-
data.frame(
     TimeID = c(43023, 43033, 43089, 43184, 43186, 43190, 43193, 43198, 43213, 43227, 43241, 43256),
     TDate = c('15-OCT-2017', '25-OCT-2017', '20-DEC-2017', '25-MAR-2018', '27-MAR-2018', '31-MAR-2018', '03-APR-2018', '08-APR-2018', '23-APR-2018', '07-MAY-2018', '21-MAY-2018', '05-JUN-2018'),
     N_Month = c (10, 10, 12, 3, 3, 3, 4, 4, 4, 5, 5, 6),
     Month_text = c('October', 'October', 'December', 'March', 'March', 'March', 'April', 'April', 'April', 'May', 'May', 'June'),
     N_Qtr = c(3, 3, 3, 1, 1, 1, 2, 2, 2, 2, 2, 2),
     Qtr = c('Qtr3', 'Qtr3', 'Qtr3', 'Qtr1', 'Qtr1', 'Qtr1', 'Qtr2', 'Qtr2', 'Qtr2', 'Qtr2', 'Qtr2', 'Qtr2'),
     TYear = c(2017,2017, 2017, 2018, 2018, 2018, 2018, 2018, 2018, 2018, 2018, 2018)
   )

#View(Timeline_table)

CUSTOMER_table <-
  data.frame(
    CustomerID = c(1:12),
    CustomerName = c('Jacobs, Nancy', 'Jacobs, Chantel', 'Able, Ralph', 'Baker, Susan', 'Eagleton, Sam', 'Foxtrot, Kathy', 'George, Sally', 'Hullett, Shawn', 'Pearson, Bobbi', 'Ranger, Terry', 'Tyler, Jenny', 'Wayne, Joan'),
    Email = c('somewhere.com', 'somewhere.com', 'somewhere.com', 'elsewhere.com', 'elsewhere.com', 'somewhere.com', 'somewhere.com', 'elsewhere.com', 'elsewhere.com', 'somewhere.com', 'somewhere.com', 'elsewhere.com'),
    PhoneAreaCode = c('817', '817', '210', '210', '210', '972', '972', '972', '512', '512', '972', '817'),
    City = c('Fort Worth', 'Fort Worth', 'San Antonio', 'San Antonio', 'San Antonio', 'Dallas', 'Dallas', 'Dallas', 'Austin', 'Austin', 'Dallas', 'Fort Worth'),
    State = c('TX', 'TX', 'TX', 'TX', 'TX', 'TX', 'TX', 'TX', 'TX', 'TX', 'TX', 'TX'),
    ZIP = c('76110', '76112', '78214', '78216', '78218', '75220', '75223', '75224', '78710', '78712', '75225', '76115')
  )
#View(CUSTOMER_table)

PRODUCT_table <-
  data.frame(
    ProductNumber = c('BK001', 'BK002', 'BK003', 'VB001', 'VB002', 'VB003', 'VK001', 'VK002', 'VK003', 'VK004'),
    ProductType = c('Book', 'Book', 'Book', 'Video Companion', 'Video Companion', 'Video Companion', 'Video', 'Video', 'Video', 'Video'),
    ProductName = c('Kitchen Remodeling Basics For Everyone', 'Advanced Kitchen Remodeling For Everyone', 'Kitchen Remodeling Dallas Style For Everyone', 'Kitchen Remodeling Basics', 'Advanced Kitchen Remodeling I', 'Kitchen Remodeling Dallas Style', 'Kitchen Remodeling Basics', 'Advanced Kitchen Remodeling', 'Kitchen Remodeling Dallas Style', 'Heather Sweeney Seminar Live in Dallas on 25-OCT-16')
  )

#View(PRODUCT_table)

# Loading
install.packages("readxl")
library(readxl)
# xls files
#PRODUCT_SALES.xlsx

exceldata_PRODUCT_SALES = read_excel("C:/Users/AhmedPro/Desktop/the_dimension_tables/PRODUCT_SALES.xlsx")
PRODUCT_SALES_table = data.frame(exceldata_PRODUCT_SALES)
#View(PRODUCT_SALES_table)

#Build an OLAP cube for the Sum of Total Quantity.

revenue_cube <-
  tapply(PRODUCT_SALES_table$Quantity,
    PRODUCT_SALES_table[,c("TimeID", "CustomerID","ProductNumber")],
    FUN = function(x){return(sum(x, na.rm = TRUE))})
# Replace values of null by 0
revenue_cube[is.na(revenue_cube)] <- 0

print(revenue_cube)



