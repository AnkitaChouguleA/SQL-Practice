# Project Title – Pizza Runner Case Study

## 📌 Overview
This project analyzes data for a pizza delivery service to optimize operations. The analysis focuses on understanding customer orders, runner performance, and delivery logistics using SQL.

---

## 🔍 Problem Statement
The "Pizza Runner" delivery service needs to improve its operations and delivery efficiency. The objective is to analyze customer orders, delivery times, and runner ratings to identify areas for improvement and provide data-backed recommendations.

---

## 📊 Tools & Technologies Used
- **SQL** (to clean, transform, and analyze the data)
- **Git & GitHub** (for project version control)

---

## 📁 Dataset
This project uses several tables provided by the **8-Week SQL Challenge**:
- `runners`: Information on the delivery runners.
- `customer_orders`: Raw data of customer pizza orders.
- `runner_orders`: Details of each order, including pickup and delivery times.
- `pizza_names` & `pizza_recipes`: Information on the pizza types and their ingredients.

---

## 🧠 Approach
1. **Data Cleaning & Transformation:** Handled missing values, nulls, and data type issues within the `runner_orders` table to make it usable for analysis.
2. **SQL Querying:** Developed SQL queries to answer business questions about customer orders, runner performance, and delivery metrics.
3. **Performance Analysis:** Calculated key metrics like successful delivery rates, average delivery times, and distance traveled.
4. **Recommendation:** Provided recommendations based on the data to improve the delivery service.

---

## 📈 Key Features
- Data cleaning and transformation using SQL.
- Analysis of customer behavior and order trends.
- Calculation of key performance indicators (KPIs) for delivery runners.
- Insights into delivery speed and efficiency.

---

## ✅ Results
- Cleaned the `customer_orders` and `runner_orders` tables by handling null values and correctly parsing strings.
- Calculated the total number of successful deliveries and the average distance traveled by each runner.
- Identified the busiest days of the week for pizza orders.
- Analyzed the relationship between order preparation time and delivery success.

---

## 📚 Learnings
- **Advanced Data Cleaning in SQL:** Gained significant experience cleaning "messy" data directly within SQL using functions like `CASE`, `CAST`, `REPLACE`, and `TRIM`.
- **Handling Complex Joins:** Practiced joining multiple tables to connect customer orders with runner details.
- **SQL Problem-Solving:** Strengthened the ability to translate ambiguous business questions into precise, executable SQL queries.

---

## 🤝 Acknowledgements
- **Data Source:** [8-Week SQL Challenge](https://8weeksqlchallenge.com/case-study-2/) by Danny Ma.