show databases;
use classicmodels;
show tables;
select * from customers;
select* from customers limit 5; 
select distinct city from customers order by city desc ;
select*from offices; 
select count(distinct city) as DISTINCT_city from offices; 
select max(age) as max_age, min(age) as min_age, avg(age) as avg_age from customers;
select distinct a.city from customers a where not exists (select 1 from offices b where a.city = b.city) ; 
select distinct o.city from offices o left join customers c on o.city = c.city where c.city IS NULL; 
select distinct o.city from offices o left join customers c on o.city = c.city ;
select* from customers where ( city is null or state is null) and creditlimit between 80000 and 130000 ;
select orderDate, count(orderNumber) as max_orders from orders group by orderDate order by max_orders desc limit 1;
select a.customerName, a.phone from customers a 
join orders b on a.customerNumber = b.customerNumber
where b.orderdate = (select orderDate from orders group by orderDate order by count(orderNumber) desc limit 1); 
select a.customerName, a.phone from customers a join orders b on a.customerNumber = b.customerNumber
where b.status in ('cancelled' or 'disputed'); 

select city from customers group by city having count(customerNumber) > 4;