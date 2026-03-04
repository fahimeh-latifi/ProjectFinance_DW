/************************************************************
  File: etl_load.sql
  Project: ProjectFinance_DW
  Author: Fahimeh Latifi
  Description: ETL Load script for Project-Based
               Financial Data Warehouse (OLAP)
               Loads data from Staging tables into
               Dimension and Fact tables

************************************************************/

-- =========================================================
-- Step 1: Load data into Dim_Project
-- =========================================================
INSERT INTO Dim_Project (Project_ID, Project_Name, Client, Start_Date, End_Date, Status)
SELECT DISTINCT Project_ID, Project_Name, Client, Start_Date, End_Date, Status
FROM Stage_Project;

-- =========================================================
-- Step 2: Load data into Dim_Employee
-- =========================================================
INSERT INTO Dim_Employee (Employee_ID, First_Name, Last_Name, Role, Department)
SELECT DISTINCT Employee_ID, First_Name, Last_Name, Role, Department
FROM Stage_Employee;

-- =========================================================
-- Step 3: Load data into Dim_Task
-- =========================================================
INSERT INTO Dim_Task (Task_ID, Task_Name, Task_Type)
SELECT DISTINCT Task_ID, Task_Name, Task_Type
FROM Stage_Task;

-- =========================================================
-- Step 4: Load data into Dim_Time
-- =========================================================
INSERT INTO Dim_Time (Time_ID, Date, Day, Month, Quarter, Year, Weekday)
SELECT DISTINCT Time_ID, Date, Day, Month, Quarter, Year, Weekday
FROM Stage_Time;

-- =========================================================
-- Step 5: Load data into Dim_CostCenter
-- =========================================================
INSERT INTO Dim_CostCenter (Cost_Center_ID, Cost_Center_Name, Manager)
SELECT DISTINCT Cost_Center_ID, Cost_Center_Name, Manager
FROM Stage_CostCenter;

-- =========================================================
-- Step 6: Load data into Fact_ProjectFinance
-- =========================================================
INSERT INTO Fact_ProjectFinance
(Project_ID, Employee_ID, Task_ID, Time_ID, Cost_Center_ID,
 Hours_Worked, Labor_Cost, Expense_Amount, Revenue_Amount, Profit, Progress_Percent)
SELECT Project_ID, Employee_ID, Task_ID, Time_ID, Cost_Center_ID,
       Hours_Worked, Labor_Cost, Expense_Amount, Revenue_Amount, Profit, Progress_Percent
FROM Stage_Fact_ProjectFinance;

-- =========================================================
-- Step 7: Optional: Verify counts
-- =========================================================
-- SELECT COUNT(*) FROM Dim_Project;
-- SELECT COUNT(*) FROM Fact_ProjectFinance;

-- =========================================================
-- End of etl_load.sql
-- All data is now loaded into the Data Warehouse
-- Ready for OLAP reporting and analysis
-- =========================================================