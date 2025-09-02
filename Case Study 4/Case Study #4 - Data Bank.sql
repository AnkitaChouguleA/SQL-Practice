use Eight_weeks_challenge
select * from INFORMATION_SCHEMA.TABLES where TABLE_SCHEMA = 'data_bank'

SELECT COUNT(*) from data_bank.regions
SELECT COUNT(*) from data_bank.customer_nodes
SELECT COUNT(*) from data_bank.customer_transactions

SELECT * from data_bank.regions
SELECT * from data_bank.customer_nodes
SELECT * from data_bank.customer_transactions

-- Case Study Questions
-- The following case study questions include some general data exploration analysis for the nodes and transactions before diving right into the core business questions and finishes with a challenging final request!

-- A. Customer Nodes Exploration
-- 1. How many unique nodes are there on the Data Bank system?
SELECT count(DISTINCT node_id) as cnt_unique_nodes from data_bank.customer_nodes

-- 2. What is the number of nodes per region?
select region_id , COUNT(node_id) as [nodes per region] from data_bank.customer_nodes GROUP by region_id\

-- 3. How many customers are allocated to each region?
SELECT region_id,count(customer_id) [customers allocated to each region] from data_bank.customer_nodes GROUP BY region_id ORDER by 1

-- 4. How many days on average are customers reallocated to a different node?
SELECT avg(DATEDIFF(day, start_date, end_date)) as avg_reallocation_days 
from data_bank.customer_nodes 
WHERE end_date != '9999-12-31';

SELECT * FROM data_bank.customer_nodes WHERE end_date = '9999-12-31';

-- 5. What is the median, 80th and 95th percentile for this same reallocation days metric for each region?
SELECT 
    r.region_name,
    DATEDIFF(day, start_date, end_date) date_diff,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER by DATEDIFF(day, start_date, end_date)) OVER(partition BY r.region_name) as median_reallocation_days,
    PERCENTILE_CONT(0.8) WITHIN GROUP (ORDER by DATEDIFF(day, start_date, end_date)) OVER(partition BY r.region_name) as p80_reallocation_days,
    PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER by DATEDIFF(day, start_date, end_date)) OVER(partition BY r.region_name) as p95_reallocation_days
FROM    data_bank.customer_nodes AS cn
JOIN    data_bank.regions AS r ON cn.region_id = r.region_id
WHERE    cn.end_date != '9999-12-31'
ORDER BY customer_id;


select * , DATEDIFF(day, start_date, end_date)
FROM    data_bank.customer_nodes AS cn
JOIN    data_bank.regions AS r ON cn.region_id = r.region_id
ORDER by customer_id
