/************************************************************
  File: etl_extract.sql
  Project: ProjectFinance_DW
  Author: Fahimeh Latifi
  Description: ETL Extract script for Project-Based
               Financial Data Warehouse (OLAP)
               Loads raw data into staging tables

************************************************************/

-- =========================================================
-- Extract Projects from source system to Stage_Project
-- =========================================================
INSERT INTO Stage_Project (Project_ID, Project_Name, Client, Start_Date, End_Date, Status)
SELECT Project_ID, Project_Name, Client, Start_Date, End_Date, Status
FROM Projects_OLTP;

-- =========================================================
-- Extract Employees from source system to Stage_Employee
-- =========================================================
INSERT INTO Stage_Employee (Employee_ID, First_Name, Last_Name, Role, Department)
SELECT Employee_ID, First_Name, Last_Name, Role, Department
FROM Employees_OLTP;

-- =========================================================
-- Extract Tasks from source system to Stage_Task
-- =========================================================
INSERT INTO Stage_Task (Task_ID, Task_Name, Task_Type)
SELECT Task_ID, Task_Name, Task_Type
FROM Tasks_OLTP;

-- =========================================================
-- Extract Time data from source system to Stage_Time
-- =========================================================
INSERT INTO Stage_Time (Time_ID, Date, Day, Month, Quarter, Year, Weekday)
SELECT Time_ID, Date, Day, Month, Quarter, Year, Weekday
FROM Time_OLTP;

-- =========================================================
-- Extract Cost Centers from source system to Stage_CostCenter
-- =========================================================
INSERT INTO Stage_CostCenter (Cost_Center_ID, Cost_Center_Name, Manager)
SELECT Cost_Center_ID, Cost_Center_Name, Manager
FROM CostCenters_OLTP;

-- =========================================================
-- Extract Project financial transactions to Stage_Fact_ProjectFinance
-- =========================================================
INSERT INTO Stage_Fact_ProjectFinance
(Project_ID, Employee_ID, Task_ID, Time_ID, Cost_Center_ID,
 Hours_Worked, Labor_Cost, Expense_Amount, Revenue_Amount, Profit, Progress_Percent)
SELECT Project_ID, Employee_ID, Task_ID, Time_ID, Cost_Center_ID,
       Hours_Worked, Labor_Cost, Expense_Amount, Revenue_Amount, 0 AS Profit, Progress_Percent
FROM ProjectTransactions_OLTP;

