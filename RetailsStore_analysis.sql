create database Sql_project_1;

use Sql_project_1;

select * from data ;

describe data;

/* changing the datetype from text to date*/
alter table data
modify column sale_date date;

/* changing the datetype from text to time*/
alter table data
modify column sale_time time;

/* changing the name of the column */
alter table data
change column ï»¿transactions_id transactions_id int;

/* checking the null values in each columns*/
select * from data
where 
	transactions_id is null
	or
	sale_date is null
    or
    sale_time is null
    or
    customer_id is null
    or
    gender is null
    or 
    age is null
    or
    category is null
    or
    quantiy is null
    or
    price_per_unit is null
    or
    cogs is null
    or
    total_sale is null;
    
	
/*Write a sql query to retrieve all columns for sales made on 2022-11-05*/

select * from data
where sale_date = '2022-11-05' ;

/* total customers*/
select count(customer_id) as total_customer
from data;

/* Maximum total sales*/
select max(total_sale)
from data;

/* Minimum total sales*/
select min(total_sale)
from data;

/* Total sales made */
select sum(total_sale)
from data;

/*Gender Distribution */
select count(gender) as Gender_distribution, gender as Gender
from data
group by  gender;

/*Number of Category Present*/

/* Sales by Category */
SELECT category, SUM(total_sale) AS total_sales
FROM data
GROUP BY category
ORDER BY total_sales DESC;

/*Average age of customers who bought Beauty Product */ 
select round(AVG(age),2) as Avg_age
from data 
where category = 'Beauty' ; 

/* total number of transaction made by each gender and in each category */ 
select count(transactions_id) as count_of_order , gender, category
from data
group by gender, category
order by  category  ;

/* avg sale of each month  */
select 
	extract(MONTH FROM sale_date) as month,
    round(avg(total_sale),2) as avg_sale
from data
group by extract(MONTH FROM sale_date)
order by extract(MONTH FROM sale_date) asc ;

/* top 5 customer with highest total sales*/
SELECT customer_id, total_sale
FROM data
ORDER BY total_sale DESC
limit 5;

