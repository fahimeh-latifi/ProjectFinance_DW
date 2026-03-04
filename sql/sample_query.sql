/************************************************************
  File: sample_queries.sql
  Project: ProjectFinance_DW
  Author: Fahimeh Latifi
  Description: Sample OLAP queries for Project-Based
               Financial Data Warehouse (OLAP)
               Demonstrates reporting & analytics

************************************************************/

-- =========================================================
-- Query 1: Total Expense, Revenue, and Profit per Project
-- =========================================================
SELECT p.Project_Name,
       SUM(f.Expense_Amount) AS Total_Expense,
       SUM(f.Revenue_Amount) AS Total_Revenue,
       SUM(f.Profit) AS Total_Profit
FROM Fact_ProjectFinance f
JOIN Dim_Project p ON f.Project_ID = p.Project_ID
GROUP BY p.Project_Name
ORDER BY Total_Profit DESC;

-- =========================================================
-- Query 2: Monthly Revenue and Profit for Each Project
-- =========================================================
SELECT p.Project_Name,
       t.Year,
       t.Month,
       SUM(f.Revenue_Amount) AS Revenue,
       SUM(f.Profit) AS Profit
FROM Fact_ProjectFinance f
JOIN Dim_Project p ON f.Project_ID = p.Project_ID
JOIN Dim_Time t ON f.Time_ID = t.Time_ID
GROUP BY p.Project_Name, t.Year, t.Month
ORDER BY t.Year, t.Month, p.Project_Name;

-- =========================================================
-- Query 3: Profit and Average Progress by Cost Center
-- =========================================================
SELECT c.Cost_Center_Name,
       SUM(f.Profit) AS Total_Profit,
       AVG(f.Progress_Percent) AS Avg_Progress
FROM Fact_ProjectFinance f
JOIN Dim_CostCenter c ON f.Cost_Center_ID = c.Cost_Center_ID
GROUP BY c.Cost_Center_Name
ORDER BY Total_Profit DESC;

-- =========================================================
-- Query 4: Employee Contribution to Profit
-- =========================================================
SELECT e.First_Name || ' ' || e.Last_Name AS Employee_Name,
       SUM(f.Profit) AS Total_Profit,
       SUM(f.Hours_Worked) AS Total_Hours
FROM Fact_ProjectFinance f
JOIN Dim_Employee e ON f.Employee_ID = e.Employee_ID
GROUP BY e.First_Name, e.Last_Name
ORDER BY Total_Profit DESC;

-- =========================================================
-- Query 5: Top 5 Tasks by Profit
-- =========================================================
SELECT t.Task_Name,
       SUM(f.Profit) AS Total_Profit,
       COUNT(*) AS Task_Count
FROM Fact_ProjectFinance f
JOIN Dim_Task t ON f.Task_ID = t.Task_ID
GROUP BY t.Task_Name
ORDER BY Total_Profit DESC
FETCH FIRST 5 ROWS ONLY;

