/*
Instructions¶
In this lab we will find the customers who were active in consecutive months of May and June. Follow the steps to complete the analysis.
1)Create a table rentals_may to store the data from rental table with information for the month of May.
2)Insert values in the table rentals_may using the table rental, filtering values only for the month of May.
3)Create a table rentals_june to store the data from rental table with information for the month of June.
4)Insert values in the table rentals_june using the table rental, filtering values only for the month of June.
5)Check the number of rentals for each customer for May.
6)Check the number of rentals for each customer for June.
*/
Use sakila;
CREATE TABLE rental_may (
    rental_id int,
    rental_date datetime,
    inventory_id int,
    customer_id int,
    return_date datetime,
    staff_id int,
    last_update datetime
);

select*from sakila.rental
where rental_date like '%-05%';
INSERT INTO rental_may (rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
SELECT rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update
FROM rental 
where rental_date like '%-05%';

select*from sakila.rental_may;
##########################
CREATE TABLE rental_june (
    rental_id int,
    rental_date datetime,
    inventory_id int,
    customer_id int,
    return_date datetime,
    staff_id int,
    last_update datetime
);

select*from sakila.rental
where rental_date like '%-06%';
INSERT INTO rental_june (rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update)
SELECT rental_id,rental_date,inventory_id,customer_id,return_date,staff_id,last_update
FROM rental 
where rental_date like '%-06%';

select*from sakila.rental_may order by customer_id desc;

#5)Check the number of rentals for each customer for May.
select customer_id, count(rental_id) from sakila.rental_may group by customer_id order by count(rental_id) desc;
select customer_id, count(rental_id) from sakila.rental_june group by customer_id order by count(rental_id) desc;

#10)Write a function that checks if customer borrowed more or less film in the month of June as compared to May.
select l.customer_id, 
	l.customer_id, count(l.rental_id),
    r.customer_id, count(r.rental_id)
from sakila.rental_may as l
join sakila.rental_june as r
on l.customer_id=r.customer_id
order by count(l.rental_id) asc;

SELECT sakila.rental_may, count(l.rental_id), count(r.rental_id) 
From sakila.rental_may 
INNER JOIN  On (Country.code = geo_lake.code)
INNER JOIn Geo_mountain On (Country.code = geo_mountain.code) 
Group by Country.name;

table l
SELECT Country.name, count(Geo_lake.code), count(Geo_mountain.code) 
From Country 
INNER JOIN Geo_lake On (Country.code = geo_lake.code)
INNER JOIn Geo_mountain On (Country.code = geo_mountain.code) 
Group by Country.name;