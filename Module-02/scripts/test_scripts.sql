select 
	city,
	Count (distinct order_id) as counter,
	Sum (sales) as Revenue
from 
	public.orders o 
where category in ('Furniture', 'Technology' ) and extract('year' from order_date) = 2018
group by 1
having Sum (sales) >= 10000
order by Revenue desc;

select 
	count(*) as NumRows,
	count(distinct o.order_id) as NumOrders
from orders o 
inner join "returns" r on o.order_id = r.order_id;

-- general KPI's
select 
	sum(sales) as total_sales,
	sum(profit) as total_profit,
	(sum(sales) - sum(profit))/sum(sales) as gross_profit_margin
from
	orders o;

-- sales per customer
select 
	customer_name as customer,
	sum(sales) as sales,
	sum(profit) as profit
from
	orders o
group by 1
order by sum(sales) desc;

-- profit per order
select 
	order_id,
	sum(profit) as profit
from
	orders o
group by 1
order by sum(profit) desc;

-- average discount per city and county
select 
	country,
	city,
	avg(discount) as average_discount
from
	orders o
group by 1, 2
order by avg(discount) desc;

-- Monthly Sales by Segment
SELECT  
	segment,    
	extract('month' from order_date) as month,
    Sum(sales) as sales
FROM
	orders
GROUP BY 1, 2
ORDER BY 1, 3 desc;

