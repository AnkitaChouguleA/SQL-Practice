CREATE Database Eight_weeks_challenge;

use Eight_weeks_challenge;

CREATE TABLE sales (
  "customer_id" VARCHAR(1),
  "order_date" DATE,
  "product_id" INTEGER
);

INSERT INTO sales
  ("customer_id", "order_date", "product_id")
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 

CREATE TABLE menu (
  "product_id" INTEGER,
  "product_name" VARCHAR(5),
  "price" INTEGER
);

INSERT INTO menu
  ("product_id", "product_name", "price")
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  "customer_id" VARCHAR(1),
  "join_date" DATE
);

INSERT INTO members
  ("customer_id", "join_date")
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');

select * from INFORMATION_SCHEMA.TABLES

select * from sales
select * from menu
select * from members

/* --------------------
   Case Study Questions
   --------------------*/

-- 1. What is the total amount each customer spent at the restaurant?
select s.customer_id, SUM(m.price) [total amount each customer]
from sales s join menu m
on s.product_id = m.product_id
group by s.customer_id

-- 2. How many days has each customer visited the restaurant?
select customer_id, count( distinct order_date) from sales group by customer_id

-- 3. What was the first item from the menu purchased by each customer?
select s.customer_id, s.product_name from
(
	select customer_id, order_date, m.product_name ,
	row_number() over(partition by customer_id order by order_date) as rn 
	from sales s join menu m on s.product_id = m.product_id
) s where rn = 1

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
select top 1 s.product_id,m.product_name, COUNT(s.product_id) cnt_prod 
from sales s join menu m
on s.product_id = m.product_id
group by s.product_id, m.product_name
order by cnt_prod desc


-- 5. Which item was the most popular for each customer?
with popular_item_cte as
(
select customer_id, m.product_name, COUNT(s.product_id) as cnt, 
ROW_NUMBER() over(partition by s.customer_id order by COUNT(*) desc) as rn
from sales s left join menu m
on s.product_id = m.product_id
group by customer_id, m.product_name 
)
select customer_id, product_name
from popular_item_cte
where rn = 1

-- 6. Which item was purchased first by the customer after they became a member?
with cte_first_item_after_member
as
(
select s.customer_id, m.product_name , s.order_date, mem.join_date,
DENSE_RANK() over(partition by s.customer_id order by s.order_date) dr
from sales s join menu m
on s.product_id = m.product_id
join members mem on s.customer_id = mem.customer_id
where s.order_date >= mem.join_date
)
select customer_id, product_name as first_product
from cte_first_item_after_member
where dr = 1

-- 7. Which item was purchased just before the customer became a member?
with cte_item_before_member
as
(
select s.customer_id, m.product_name , s.order_date, mem.join_date,
DENSE_RANK() over(partition by s.customer_id order by s.order_date) dr
from sales s join menu m
on s.product_id = m.product_id
join members mem on s.customer_id = mem.customer_id
where s.order_date <= mem.join_date
)
select *
from cte_item_before_member
where dr = 1

-- 8. What is the total items and amount spent for each member before they became a member?
select s.customer_id, COUNT(s.product_id) as total_items,
'$'+cast(SUM(m.price) as varchar) as amount_spent
from sales s left join menu m
on s.product_id = m.product_id
left join members mem on s.customer_id = mem.customer_id
where s.order_date <= mem.join_date
group by s.customer_id

-- 9.  If each $1 spent equates to 10 points and sushi has a 2x points multiplier 
-- how many points would each customer have?
with cte_total_points as
(
	select s.customer_id, m.product_name ,
	case 
		when product_name = 'sushi' then 20 * m.price 
		else m.price*10
		end as points
	from sales s 
	left join menu m
	on s.product_id = m.product_id
)
select customer_id, sum(points) as total_points
from cte_total_points
group by customer_id

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items, 
--		not just sushi - how many points do customer A and B have at the end of January?
with cte as
(
	select s.customer_id, m.product_name, mem.join_date, s.order_date ,
	DATEDIFF(day, mem.join_date, s.order_date) as date_diff , m.price, 
	case 
		when DATEDIFF(day, mem.join_date, s.order_date) BETWEEN 0 AND 6 
		then 20 * m.price 
		else m.price*10
		end as points
	from sales s 
	left join menu m
	on s.product_id = m.product_id
	left join members mem
	on s.customer_id = mem.customer_id
	where month(s.order_date) = 1 and s.customer_id in ('A','B')
)
select customer_id, sum(points) 
from cte
group by customer_id

--OR

select s.customer_id,  
	sum(case 
		when DATEDIFF(day, mem.join_date, s.order_date) BETWEEN 0 AND 6 
		then 20 * m.price 
		else m.price*10
		end) as points
	from sales s 
	left join menu m
	on s.product_id = m.product_id
	left join members mem
	on s.customer_id = mem.customer_id
	where month(s.order_date) = 1 and s.customer_id in ('A','B')
	group by s.customer_id

--Bonus questions
-- Join All The Things
select s.customer_id, s.order_date, m.product_name, m.price,
case 
when s.order_date < mem.join_date AND S.customer_id = MEM.customer_id then 'N'
when mem.join_date IS NULL then 'N'
	else 'Y'
	end as [member]
	from sales s 
	left join menu m
	on s.product_id = m.product_id
	left join members mem
	on s.customer_id = mem.customer_id

-- Rank All The Things
WITH CTE AS
(
	select s.customer_id, s.order_date, m.product_name, m.price,
	case 
	when s.order_date < mem.join_date AND S.customer_id = MEM.customer_id then 'N'
	when mem.join_date IS NULL then 'N'
		else 'Y'
		end as [member]
		from sales s 
		left join menu m
		on s.product_id = m.product_id
		left join members mem
		on s.customer_id = mem.customer_id
)
SELECT *,
	CASE WHEN [member] = 'N' THEN NULL
	ELSE RANK() OVER (PARTITION BY CUSTOMER_ID, [MEMBER] ORDER BY ORDER_DATE) 
	END AS RANKING
FROM CTE