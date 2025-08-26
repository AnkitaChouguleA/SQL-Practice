use Eight_weeks_challenge

-- Create the database schema for Pizza Runner
CREATE SCHEMA pizza_runner;
GO

-- Drop tables if they exist to ensure a clean slate
DROP TABLE IF EXISTS pizza_runner.runners;
DROP TABLE IF EXISTS pizza_runner.customer_orders;
DROP TABLE IF EXISTS pizza_runner.runner_orders;
DROP TABLE IF EXISTS pizza_runner.pizza_names;
DROP TABLE IF EXISTS pizza_runner.pizza_recipes;
DROP TABLE IF EXISTS pizza_runner.pizza_toppings;
GO

-- Create the runners table
CREATE TABLE pizza_runner.runners (
  runner_id INT, -- INTEGER is an alias for INT in SQL Server
  registration_date DATE
);
GO

-- Insert data into the runners table
INSERT INTO pizza_runner.runners
  (runner_id, registration_date)
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');
GO

-- Create the customer_orders table
-- Note: TIMESTAMP is converted to VARCHAR(20) as SQL Server's TIMESTAMP is a rowversion type.
CREATE TABLE pizza_runner.customer_orders (
  order_id INT,
  customer_id INT,
  pizza_id INT,
  exclusions VARCHAR(4),
  extras VARCHAR(4),
  order_time DATETIME  
);
GO

-- Insert data into the customer_orders table
-- Note: 'null' strings are converted to actual NULL values
INSERT INTO pizza_runner.customer_orders
  (order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
  (1, 101, 1, '', '', '2020-01-01 18:05:02'),
  (2, 101, 1, '', '', '2020-01-01 19:00:52'),
  (3, 102, 1, '', NULL, '2020-01-02 23:51:23'),
  (3, 102, 2, '', NULL, '2020-01-02 23:51:23'),
  (4, 103, 1, '4', '', '2020-01-04 13:23:46'),
  (4, 103, 1, '4', '', '2020-01-04 13:23:46'),
  (4, 103, 2, '4', '', '2020-01-04 13:23:46'),
  (5, 104, 1, NULL, '1', '2020-01-08 21:00:29'),
  (6, 101, 2, NULL, NULL, '2020-01-08 21:03:13'),
  (7, 105, 2, NULL, '1', '2020-01-08 21:20:29'),
  (8, 102, 1, NULL, NULL, '2020-01-09 23:54:33'),
  (9, 103, 1, '4', '1, 5', '2020-01-10 11:22:59'),
  (10, 104, 1, NULL, NULL, '2020-01-11 18:34:49'),
  (10, 104, 1, '2, 6', '1, 4', '2020-01-11 18:34:49');
GO

-- Create the runner_orders table
-- Note: VARCHAR(19) for pickup_time, VARCHAR(7) for distance, VARCHAR(10) for duration
CREATE TABLE pizza_runner.runner_orders (
  order_id INT,
  runner_id INT,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);
GO

-- Insert data into the runner_orders table
-- Note: 'null' strings are converted to actual NULL values
INSERT INTO pizza_runner.runner_orders
  (order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES
  (1, 1, '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  (2, 1, '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  (3, 1, '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  (4, 2, '2020-01-04 13:53:03', '23.4', '40', NULL),
  (5, 3, '2020-01-08 21:10:57', '10', '15', NULL),
  (6, 3, NULL, NULL, NULL, 'Restaurant Cancellation'),
  (7, 2, '2020-01-08 21:30:45', '25km', '25mins', NULL),
  (8, 2, '2020-01-10 00:15:02', '23.4 km', '15 minute', NULL),
  (9, 2, NULL, NULL, NULL, 'Customer Cancellation'),
  (10, 1, '2020-01-11 18:50:20', '10km', '10minutes', NULL);
GO

-- Create the pizza_names table
-- Note: TEXT is converted to VARCHAR(MAX) as TEXT is deprecated in SQL Server
CREATE TABLE pizza_runner.pizza_names (
  pizza_id INT,
  pizza_name VARCHAR(MAX) -- Converted from TEXT to VARCHAR(MAX)
);
GO

-- Insert data into the pizza_names table
INSERT INTO pizza_runner.pizza_names
  (pizza_id, pizza_name)
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');
GO

-- Create the pizza_recipes table
-- Note: TEXT is converted to VARCHAR(N)
CREATE TABLE pizza_runner.pizza_recipes (
  pizza_id INT,
  toppings VARCHAR(50) -- Converted from TEXT to VARCHAR(N)
);
GO

-- Insert data into the pizza_recipes table
INSERT INTO pizza_runner.pizza_recipes
  (pizza_id, toppings)
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');
GO

-- Create the pizza_toppings table
-- Note: TEXT is converted to VARCHAR(50)
CREATE TABLE pizza_runner.pizza_toppings (
  topping_id INT,
  topping_name VARCHAR(50) -- Converted from TEXT to VARCHAR(50)
);
GO

-- Insert data into the pizza_toppings table
INSERT INTO pizza_runner.pizza_toppings
  (topping_id, topping_name)
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');
GO



--Case Study Questions
--This case study has LOTS of questions - they are broken up by area of focus including:

--Pizza Metrics
--Runner and Customer Experience
--Ingredient Optimisation
--Pricing and Ratings
--Bonus DML Challenges (DML = Data Manipulation Language)
--Each of the following case study questions can be answered using a single SQL statement.
--Again, there are many questions in this case study - please feel free to pick and choose which ones you’d like to try!
--Before you start writing your SQL queries however - you might want to investigate the data, you may want to do something with some of 
--those null values and data types in the customer_orders and runner_orders tables!

select 'select * from ' + TABLE_SCHEMA +'.' + table_name from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'pizza_runner'

select * from pizza_runner.runners
select * from pizza_runner.customer_orders -- this needs to be cleaned
select * from pizza_runner.runner_orders -- this needs to be cleaned
select * from pizza_runner.pizza_names
select * from pizza_runner.pizza_recipes
select * from pizza_runner.pizza_toppings

--data cleaning

-- This view replaces 'null' and empty strings with actual NULLs for exclusions and extras
create OR ALTER view  pizza_runner.vw_cleaned_customer_orders as
select 
order_id, customer_id, pizza_id,
case
	when exclusions is null or exclusions = 'null' or exclusions = '' then NULL
	ELSE exclusions
END AS exclusions,
case
	when extras is null or extras = 'null' or extras = '' then NULL
	ELSE extras
END AS extras,
order_time
from pizza_runner.customer_orders

SELECT * FROM pizza_runner.vw_cleaned_customer_orders

-- This view converts 'null' strings to NULLs, cleans and converts distance to FLOAT,
-- and cleans and converts duration to INT.
create or alter view pizza_runner.vw_cleaned_runner_orders as
select 
order_id, runner_id,
CASE 
	WHEN pickup_time IS NULL OR pickup_time = 'NULL' THEN NULL
	ELSE pickup_time
END AS pickup_time,
CASE 
	WHEN distance IS NULL OR distance = 'NULL' THEN NULL
	when distance like '%KM' then cast(trim('KM' FROM DISTANCE) AS float)
	ELSE CAST(DISTANCE AS float)
END AS distance,
CASE 
	WHEN duration LIKE '%MINS' THEN CAST(TRIM('MINS' FROM DURATION) AS int)
	WHEN duration LIKE '%MINUTES' THEN CAST(TRIM('MINUTES' FROM DURATION) AS int)
	WHEN duration LIKE '%MINUTE' THEN CAST(TRIM('MINUTE' FROM DURATION) AS int)
	WHEN duration IS NULL OR duration = '' THEN NULL
	ELSE CAST(DURATION AS int)
END AS duration,
CASE
	WHEN cancellation IS NULL OR cancellation = '' THEN null
	ELSE cancellation
END AS cancellation
from pizza_runner.runner_orders

select * from pizza_runner.vw_cleaned_runner_orders
select * from pizza_runner.vw_cleaned_customer_orders
--A. Pizza Metrics
--How many pizzas were ordered?
select 'no of pizza ordered is ' + cast(count(*) as varchar)
from pizza_runner.vw_cleaned_customer_orders

--How many unique customer orders were made?
select count(distinct order_id) as unique_cusomer_orders from pizza_runner.vw_cleaned_customer_orders

--How many successful orders were delivered by each runner?
select runner_id, COUNT(distinct order_id) [successful orders delivered by each runner]
from pizza_runner.vw_cleaned_runner_orders
where cancellation is null
group by runner_id
order by 1

--How many of each type of pizza was delivered?
select pizza_id ,count(pizza_id) as delivered_pizza_count
from pizza_runner.vw_cleaned_customer_orders co
join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
where cancellation is null
group by pizza_id

--or

SELECT
    pn.pizza_name,
    COUNT(co.pizza_id) AS delivered_pizza_count
FROM pizza_runner.vw_cleaned_customer_orders co
JOIN pizza_runner.vw_cleaned_runner_orders ro
    ON co.order_id = ro.order_id
JOIN pizza_runner.pizza_names AS pn
    ON co.pizza_id = pn.pizza_id
WHERE ro.cancellation IS NULL
GROUP BY
    pn.pizza_name
ORDER BY
    delivered_pizza_count DESC;

--How many Vegetarian and Meatlovers were ordered by each customer?
select co.customer_id, pn.pizza_name, COUNT(pn.pizza_name) pizza_count
from pizza_runner.pizza_names pn
join pizza_runner.vw_cleaned_customer_orders co
on pn.pizza_id = co.pizza_id
group by co.customer_id, pn.pizza_name
order by co.customer_id, 3

--What was the maximum number of pizzas delivered in a single order?
select top 1 co.order_id, count(pizza_id) as pizza_cnt
from pizza_runner.vw_cleaned_customer_orders co
join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
where ro.cancellation is null
group by co.order_id
order by 2 desc

--For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'pizza_runner'

select co.customer_id, 
sum(case when co.exclusions is not null or extras is not null then 1 else 0 end) as  pizza_with_changes,
sum(case when co.exclusions is null or extras is null then 1 else 0 end) as  pizza_without_changes
from pizza_runner.vw_cleaned_customer_orders co
join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
where cancellation is null
group by co.customer_id

--select co.customer_id, 
--case when co.exclusions is not null or extras is not null then 1 else 0 end as  pizza_with_changes,
--case when co.exclusions is null or extras is null then 1 else 0 end as  pizza_without_changes
--from pizza_runner.vw_cleaned_customer_orders co
--join pizza_runner.vw_cleaned_runner_orders ro
--on co.order_id = ro.order_id
--where cancellation is null


-- 9.How many pizzas were delivered that had both exclusions and extras?
select count(co.pizza_id) as pizza_with_both_exclusions_and_extras
from pizza_runner.vw_cleaned_customer_orders co
join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
where cancellation is null and (co.exclusions is not null and extras is not null)
group by co.customer_id

-- 10. What was the total volume of pizzas ordered for each hour of the day?
select cast(co.order_time as date) as date, DATEPART(hour,co.order_time) as hr, count(co.order_id) as ord_cnt
from pizza_runner.vw_cleaned_customer_orders co
left join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
group by cast(co.order_time as date), DATEPART(DAY,co.order_time) ,DATEPART(hour,co.order_time)
order by DATEPART(hour,co.order_time)
--or
select DATEPART(hour,co.order_time) as hr, count(co.order_id) as ord_cnt
from pizza_runner.vw_cleaned_customer_orders co
left join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
group by DATEPART(DAY,co.order_time) ,DATEPART(hour,co.order_time)
order by DATEPART(hour,co.order_time)

--What was the volume of orders for each day of the week?
select cast(co.order_time as date) as [date], DATENAME(dw, co.order_time) as week_day, count(co.order_id) as ord_cnt
from pizza_runner.vw_cleaned_customer_orders co
left join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
group by cast(co.order_time as date), DATENAME(dw, co.order_time)
order by 1,2

--B. Runner and Customer Experience
--How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
select 'week ' + cast(DATEPART(week, registration_date) as varchar) [week no], COUNT(runner_id) cnt_runner
from pizza_runner.runners 
group by  DATEPART(week, registration_date)

--What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
select 
cro.runner_id, avg(diff.diff_min) as avg_time_min
from pizza_runner.vw_cleaned_runner_orders cro
join (
select ro.runner_id, order_time, pickup_time, DATEDIFF(MINUTE, order_time, pickup_time) as diff_min
from pizza_runner.vw_cleaned_customer_orders co
left join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
where ro.cancellation is null
) as diff
on cro.runner_id = diff.runner_id
group by cro.runner_id
order by cro.runner_id


--Is there any relationship between the number of pizzas and how long the order takes to prepare?
select co.order_id, count(co.pizza_id) number_of_pizzas,
DATEDIFF(MINUTE ,min(order_time), max(pickup_time)) preparation_time_minutes
from pizza_runner.vw_cleaned_customer_orders co
left join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
where ro.cancellation is null
group by co.order_id
order by 2 desc, 3 desc

--What was the average distance travelled for each customer?
select customer_id, cast(cast(avg(distance)as decimal(10,2)) as varchar) +' km' AS average_distance_km
from pizza_runner.vw_cleaned_customer_orders co
left join pizza_runner.vw_cleaned_runner_orders ro
on co.order_id = ro.order_id
group by customer_id

--What was the difference between the longest and shortest delivery times for all orders?
select cast((max(duration) - min(duration)) as varchar) + ' minutes' as delivery_time_difference_minutes
from pizza_runner.vw_cleaned_runner_orders 
where cancellation is null or duration is not null

--What was the average speed for each runner for each delivery and do you notice any trend for these values?
select order_id, runner_id, distance, duration ,
cast(cast(distance/(duration/60.0) as decimal (10,2)) as varchar) +' km/hr' as speed
from pizza_runner.vw_cleaned_runner_orders
where cancellation is null

--What is the successful delivery percentage for each runner?
SELECT runner_id ,
CAST(
	(
		(
		SUM(
			CASE WHEN cancellation is not null THEN 1 ELSE 0 END
			)
	) * 100 / COUNT(*)
) AS DECIMAL(10,2)
) AS successful_delivery_percentage
FROM pizza_runner.vw_cleaned_runner_orders
group by runner_id

--C. Ingredient Optimisation
--What are the standard ingredients for each pizza?

SELECT STRING_AGG(topping_name, ', ') 
       WITHIN GROUP (ORDER BY topping_name) AS ingredients
FROM pizza_runner.pizza_toppings;

-- method 1
SELECT pr.pizza_id, pn.pizza_name, TRIM(s.value) AS topping_id, pt.topping_name
FROM pizza_runner.pizza_recipes pr
CROSS APPLY STRING_SPLIT(pr.toppings, ',') AS s
join pizza_runner.pizza_toppings pt
on s.value = pt.topping_id
join pizza_runner.pizza_names pn
on pn.pizza_id = pr.pizza_id

--method 2. aggregating toppings-name on 1 row
SELECT pr.pizza_id, pn.pizza_name, STRING_AGG(pt.topping_name, ', ') within group (order by pt.topping_name) as standard_ingrediants
FROM pizza_runner.pizza_recipes pr
CROSS APPLY STRING_SPLIT(pr.toppings, ',') AS s
join pizza_runner.pizza_toppings pt
on s.value = pt.topping_id
join pizza_runner.pizza_names pn
on pn.pizza_id = pr.pizza_id
group by pr.pizza_id, pn.pizza_name
order by pr.pizza_id


--What was the most commonly added extra?
select pt.topping_name , count(*) as [extra_count]
from pizza_runner.vw_cleaned_customer_orders co
cross apply STRING_SPLIT(extras, ',') AS s
join pizza_runner.pizza_toppings pt
on s.value = pt.topping_id
where extras is not null
group by pt.topping_name
order by [extra_count] desc

select 'Most common added extra is ' + '"' + d.topping_name +'"'
from pizza_runner.pizza_toppings pt
join
(
select top 1 pt.topping_name , count(*) as [extra_count]
from pizza_runner.vw_cleaned_customer_orders co
cross apply STRING_SPLIT(extras, ',') AS s
join pizza_runner.pizza_toppings pt
on s.value = pt.topping_id
where extras is not null
group by pt.topping_name
order by [extra_count] desc
) d
on pt.topping_name = d.topping_name

--What was the most common exclusion?
select 'Most common exclusion is ' + '"' + d.topping_name +'"'
from pizza_runner.pizza_toppings pt
join
(
select top 1 pt.topping_name , count(*) as [exclusion_count]
from pizza_runner.vw_cleaned_customer_orders co
cross apply STRING_SPLIT(exclusions, ',') AS s
join pizza_runner.pizza_toppings pt
on s.value = pt.topping_id
where exclusions is not null
group by pt.topping_name
order by exclusion_count desc
) d
on pt.topping_name = d.topping_name

--Generate an order item for each record in the customers_orders table in the format of one of the following:
--Meat Lovers
--Meat Lovers - Exclude Beef
--Meat Lovers - Extra Bacon
--Meat Lovers - Exclude Cheese, Bacon - Extra Mushroom, Peppers

select * from pizza_runner.vw_cleaned_customer_orders co

select co.order_id, co.customer_id, co.pizza_id, t.pizza_name, co.exclusions, co.extras, t.*
from pizza_runner.vw_cleaned_customer_orders co
cross apply STRING_SPLIT(exclusions, ',') AS s

create or alter view pizza_runner.vw_pizza_toppings as
(
	SELECT pr.pizza_id, pn.pizza_name, TRIM(s.value) AS topping_id, pt.topping_name
	FROM pizza_runner.pizza_recipes pr
	CROSS APPLY STRING_SPLIT(pr.toppings, ',') AS s
	join pizza_runner.pizza_toppings pt
	on s.value = pt.topping_id
	join pizza_runner.pizza_names pn
	on pn.pizza_id = pr.pizza_id
) 

select * from pizza_runner.vw_pizza_toppings

CREATE OR ALTER VIEW pizza_runner.vw_customer_orders_with_names AS
SELECT 
    cco.order_id,
    cco.customer_id,
    cco.pizza_id,

    -- Replacing exclusions
    (
        SELECT STRING_AGG(pt.topping_name, ', ') 
        FROM STRING_SPLIT(cco.exclusions, ',') AS s
        JOIN pizza_runner.pizza_toppings pt 
            ON TRY_CAST(TRIM(s.value) AS INT) = pt.topping_id
    ) AS exclusions_names,

    -- Replacing extras
    (
        SELECT STRING_AGG(pt.topping_name, ', ') 
        FROM STRING_SPLIT(cco.extras, ',') AS s
        JOIN pizza_runner.pizza_toppings pt 
            ON TRY_CAST(TRIM(s.value) AS INT) = pt.topping_id
    ) AS extras_names
FROM pizza_runner.vw_cleaned_customer_orders AS cco

select * FROM pizza_runner.vw_customer_orders_with_names

SELECT cco.order_id, cco.customer_id, pn.pizza_name +
    CASE 
        WHEN exclusions_names IS NOT NULL THEN ' - Exclude ' + exclusions_names 
        ELSE ''
    END +
    CASE 
        WHEN extras_names IS NOT NULL THEN ' - Extra ' + extras_names 
        ELSE ''
    END AS order_item_description
FROM pizza_runner.vw_customer_orders_with_names AS cco
JOIN pizza_runner.pizza_names AS pn
    ON cco.pizza_id = pn.pizza_id

--online answer
SELECT cco.order_id, cco.customer_id, pn.pizza_name +
    CASE 
        WHEN exclusions_list IS NOT NULL THEN ' - Exclude ' + exclusions_list 
        ELSE ''
    END +
    CASE 
        WHEN extras_list IS NOT NULL THEN ' - Extra ' + extras_list 
        ELSE ''
    END AS order_item_description
FROM pizza_runner.vw_cleaned_customer_orders AS cco
JOIN pizza_runner.pizza_names AS pn
    ON cco.pizza_id = pn.pizza_id
-- Format exclusions
OUTER APPLY (
    SELECT STUFF((
        SELECT ', ' + pt_exc.topping_name
        FROM STRING_SPLIT(cco.exclusions, ',') AS s_exc
        JOIN pizza_runner.pizza_toppings AS pt_exc 
            ON CAST(s_exc.value AS INT) = pt_exc.topping_id
        ORDER BY pt_exc.topping_name
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS exclusions_list
) AS excl
-- Format extras
OUTER APPLY (
    SELECT STUFF((
        SELECT ', ' + pt_ext.topping_name
        FROM STRING_SPLIT(cco.extras, ',') AS s_ext
        JOIN pizza_runner.pizza_toppings AS pt_ext 
            ON CAST(s_ext.value AS INT) = pt_ext.topping_id
        ORDER BY pt_ext.topping_name
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS extras_list
) AS extr
ORDER BY cco.order_id, cco.customer_id;


--Generate an alphabetically ordered comma separated ingredient list for each pizza order from the customer_orders table and add a 2x in front of any relevant ingredients
--For example: "Meat Lovers: 2xBacon, Beef, ... , Salami"
select * from pizza_runner.pizza_toppings
select * from pizza_runner.pizza_recipes
select * from pizza_runner.pizza_names
select * from pizza_runner.vw_cleaned_customer_orders
select * from pizza_runner.vw_pizza_toppings

WITH toppings AS (
    SELECT pr.pizza_id, CAST(s.value AS INT) AS topping_id
    FROM pizza_runner.pizza_recipes pr
    CROSS APPLY STRING_SPLIT(pr.toppings, ',') s
),
extras AS (
    SELECT order_id, pizza_id, CAST(s.value AS INT) AS topping_id
    FROM pizza_runner.vw_cleaned_customer_orders
    CROSS APPLY STRING_SPLIT(extras, ',') s
    WHERE extras IS NOT NULL
),
exclusions AS (
    SELECT order_id, pizza_id, CAST(s.value AS INT) AS topping_id
    FROM pizza_runner.vw_cleaned_customer_orders
    CROSS APPLY STRING_SPLIT(exclusions, ',') s
    WHERE exclusions IS NOT NULL
),
all_toppings AS (
    SELECT c.order_id, c.customer_id, c.pizza_id, t.topping_id, 'standard' AS src
    FROM pizza_runner.vw_cleaned_customer_orders c
    JOIN toppings t ON c.pizza_id = t.pizza_id
    UNION ALL
    SELECT e.order_id, c.customer_id, e.pizza_id, e.topping_id, 'extra'
    FROM extras e
    JOIN pizza_runner.vw_cleaned_customer_orders c ON c.order_id = e.order_id AND c.pizza_id = e.pizza_id
),
final AS (
    SELECT a.order_id, a.customer_id, a.pizza_id, pt.topping_name,
           COUNT(*) AS topping_count
    FROM all_toppings a
    JOIN pizza_runner.pizza_toppings pt ON pt.topping_id = a.topping_id
    LEFT JOIN exclusions ex ON ex.order_id = a.order_id AND ex.pizza_id = a.pizza_id AND ex.topping_id = a.topping_id
    WHERE ex.topping_id IS NULL
    GROUP BY a.order_id, a.customer_id, a.pizza_id, pt.topping_name
)
SELECT 
    f.order_id,    f.customer_id,    pn.pizza_name + '  :   ' +
    STUFF((
        SELECT ', ' + 
               CASE WHEN topping_count > 1 THEN '2x' ELSE '' END + topping_name
        FROM final f2
        WHERE f2.order_id = f.order_id AND f2.pizza_id = f.pizza_id
        ORDER BY topping_name
        FOR XML PATH(''), TYPE
    ).value('.', 'NVARCHAR(MAX)'), 1, 2, '') AS ingredient_list
FROM final f
JOIN pizza_runner.pizza_names pn ON f.pizza_id = pn.pizza_id
GROUP BY f.order_id, f.customer_id, f.pizza_id, pn.pizza_name
ORDER BY f.order_id, f.pizza_id;


--What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?
SELECT
    pt.topping_name,
    COUNT(*) AS Total_ingredients
FROM pizza_runner.vw_cleaned_customer_orders AS c 
JOIN pizza_runner.vw_cleaned_runner_orders AS r            
    ON r.order_id = c.order_id
JOIN pizza_runner.pizza_names AS p1
    ON c.pizza_id = p1.pizza_id
JOIN pizza_runner.pizza_recipes AS p2
    ON p1.pizza_id = p2.pizza_id
CROSS APPLY STRING_SPLIT(p2.toppings, ',') AS s -- Unnest the comma-separated toppings
JOIN pizza_runner.pizza_toppings AS pt
    ON CAST(s.value AS INT) = pt.topping_id -- Join on the unnested topping ID
WHERE r.cancellation IS NULL -- Filter for successful deliveries
GROUP BY
    pt.topping_name
ORDER BY
    Total_ingredients DESC;

--using view i created previously
SELECT
    pt.topping_name,
    COUNT(*) AS Total_ingredients
FROM pizza_runner.vw_cleaned_customer_orders AS c
JOIN pizza_runner.vw_cleaned_runner_orders AS r
    ON c.order_id = r.order_id
JOIN pizza_runner.vw_pizza_toppings AS pt
    ON c.pizza_id = pt.pizza_id
WHERE r.cancellation IS NULL  -- Only delivered orders
GROUP BY pt.topping_name
ORDER BY Total_ingredients DESC;

--D. Pricing and Ratings

--If a Meat Lovers pizza costs $12 and Vegetarian costs $10 and there were no charges for changes 
-- how much money has Pizza Runner made so far if there are no delivery fees?

with cte as
(
SELECT r.runner_id, pn.pizza_name,
sum(case when pn.pizza_name = 'Meatlovers' then 12 else 10 end) as cost
FROM pizza_runner.vw_cleaned_customer_orders AS c
JOIN pizza_runner.vw_cleaned_runner_orders AS r
    ON c.order_id = r.order_id
join pizza_runner.pizza_names pn
on pn.pizza_id = c.pizza_id
where r.cancellation is null
group by r.runner_id, pn.pizza_name
)
select runner_id, cast(SUM(cost) as varchar) + ' $' as each_runner_earn
from cte
group by runner_id
order by runner_id


--What if there was an additional $1 charge for any pizza extras?
--Add cheese is $1 extra
select * from pizza_runner.vw_customer_orders_with_names

WITH PizzaCostsPerOrder AS (
    SELECT cco.order_id, cco.pizza_id,
        -- Calculate base pizza price
        CASE
            WHEN pn.pizza_name = 'Meatlovers' THEN 12
            WHEN pn.pizza_name = 'Vegetarian' THEN 10
            ELSE 0
        END AS base_pizza_price,
        -- Calculate additional $1 charge for each extra topping
        CASE
            WHEN cco.extras IS NOT NULL THEN (SELECT COUNT(*) FROM STRING_SPLIT(cco.extras, ','))
            ELSE 0
        END AS extra_topping_charge
    FROM pizza_runner.vw_cleaned_customer_orders AS cco
    JOIN pizza_runner.pizza_names AS pn
        ON cco.pizza_id = pn.pizza_id
    JOIN pizza_runner.vw_cleaned_runner_orders AS cro
        ON cco.order_id = cro.order_id
    WHERE cro.cancellation IS NULL -- Only consider successful deliveries
)
SELECT order_id , pizza_id,
   cast(SUM(base_pizza_price + extra_topping_charge) as varchar)  total_revenue_with_extras_charge
FROM PizzaCostsPerOrder
group by order_id , pizza_id

--The Pizza Runner team now wants to add an additional ratings system that allows customers to rate their runner, 
-- how would you design an additional table for this new dataset - 
-- generate a schema for this new table and insert your own data for ratings for each successful customer order between 1 to 5.
select * from pizza_runner.runner_orders

ALTER TABLE pizza_runner.runner_orders
ADD CONSTRAINT PK_runner_orders_order_id PRIMARY KEY (order_id);

ALTER TABLE pizza_runner.runner_orders
ALTER COLUMN order_id INT NOT NULL;

CREATE TABLE pizza_runner.runner_ratings (
    order_id INT PRIMARY KEY REFERENCES pizza_runner.runner_orders(order_id), -- Corrected foreign key reference to the base table
    rating INT,
    rating_time DATETIME,
    comments NVARCHAR(255)
);

INSERT INTO pizza_runner.runner_ratings (order_id, rating, rating_time, comments)
VALUES
    (1, 4, '2020-01-01 19:00:00', 'Great service, fast delivery!'),
    (2, 5, '2020-01-01 20:00:00', 'Excellent!'),
    (3, 3, '2020-01-03 01:00:00', 'Good, but a bit late.'),
    (4, 5, '2020-01-04 14:30:00', 'Super quick!'),
    (5, 4, '2020-01-08 22:00:00', 'Friendly runner.'),
    (7, 4, '2020-01-08 22:30:00', 'Pizza still hot.'),
    (8, 3, '2020-01-10 01:00:00', 'Average delivery.'),
    (10, 5, '2020-01-11 19:30:00', 'Perfect!');

select * from pizza_runner.runner_ratings

--Using your newly generated table - can you join all of the information together to form a table 
-- which has the following information for successful deliveries?
--customer_id
--order_id
--runner_id
--rating
--order_time
--pickup_time
--Time between order and pickup
--Delivery duration
--Average speed
--Total number of pizzas

select cco.customer_id, cco.order_id, cro.runner_id, rr.rating, cco.order_time, cro.pickup_time,
DATEDIFF(MINUTE , cco.order_time,cro.pickup_time) as [Time between order and pickup],
cro.duration, cast(cast(distance/(duration/60.0) as decimal (10,2)) as varchar) +' km/hr' as avg_speed,
count(cco.pizza_id) as [Total number of pizzas]
from pizza_runner.vw_cleaned_customer_orders cco
join pizza_runner.vw_cleaned_runner_orders cro
on cco.order_id = cro.order_id
join pizza_runner.runner_ratings rr
on rr.order_id=cco.order_id
where cro.cancellation is null
AND cro.pickup_time IS NOT NULL                   -- Ensure pickup time is recorded
  AND cro.duration IS NOT NULL              -- Ensure duration is recorded
  AND cro.duration > 0                      -- Avoid division by zero for speed calculation
GROUP BY cco.customer_id,cco.order_id,cro.runner_id,rr.rating,cco.order_time,cro.pickup_time,cro.duration,cro.distance
ORDER BY     cco.order_id;

--If a Meat Lovers pizza was $12 and Vegetarian $10 fixed prices with no cost for extras and each runner is paid $0.30 per kilometre traveled 
-- how much money does Pizza Runner have left over after these deliveries?
with pizza_revenue as
(
	SELECT r.runner_id, pn.pizza_name,
	sum(case when pn.pizza_name = 'Meatlovers' then 12 
			 when pn.pizza_name = 'Vegetarian' then 10
			else 0 end) as cost
	FROM pizza_runner.vw_cleaned_customer_orders AS c
	JOIN pizza_runner.vw_cleaned_runner_orders AS r
		ON c.order_id = r.order_id
	join pizza_runner.pizza_names pn
	on pn.pizza_id = c.pizza_id
	where r.cancellation is null
	group by r.runner_id, pn.pizza_name
)
, RunnerPayments as
(
	select order_id, runner_id ,
	cast((distance * 0.30) as decimal (10,2)) as runner_payment
	from pizza_runner.vw_cleaned_runner_orders
	where cancellation is null and distance is not null
)
select  pr.runner_id, 
sum(pr.cost + rp.runner_payment) as total_money_left
from pizza_revenue pr  
join RunnerPayments rp
on pr.runner_id = rp.runner_id
group by pr.runner_id

--E. Bonus Questions
--If Danny wants to expand his range of pizzas - how would this impact the existing data design? 
-- Write an INSERT statement to demonstrate what would happen if a new Supreme pizza with all the toppings was added to the Pizza Runner menu?
/*
The existing data design is quite flexible and well-suited for expansion. Adding new pizza types would primarily involve:

No Schema Changes Needed: The current table schemas (pizza_names, pizza_recipes, pizza_toppings) are designed to handle new pizza types and 
their associated toppings without requiring any structural modifications.

we would only need to insert new records into the pizza_names table for the new pizza's name and a unique ID, 
and then into the pizza_recipes table to define its standard toppings by referencing topping_ids from the pizza_toppings table. 
The customer_orders table would then simply reference this new pizza_id when customers order it.
*/

-- INSERT statement for a new 'Supreme' pizza
INSERT INTO pizza_runner.pizza_names (pizza_id, pizza_name)
VALUES (3, 'Supreme');

-- INSERT statement for the recipe of the new 'Supreme' pizza (all toppings)
INSERT INTO pizza_runner.pizza_recipes (pizza_id, toppings)
VALUES (3, '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12');

select * from pizza_runner.pizza_names
select * from pizza_runner.pizza_recipes
