/************************************************************
  File: etl_transform.sql
  Project: ProjectFinance_DW
  Author: Fahimeh Latifi
  Description: ETL Transform script for Project-Based
               Financial Data Warehouse (OLAP)
               Cleans, validates, and calculates metrics

************************************************************/

-- =========================================================
-- Step 1: Remove duplicate rows from Stage_Project
-- =========================================================
DELETE FROM Stage_Project
WHERE Project_ID IN (
    SELECT Project_ID
    FROM Stage_Project
    GROUP BY Project_ID
    HAVING COUNT(*) > 1
);

-- =========================================================
-- Step 2: Remove duplicate rows from Stage_Employee
-- =========================================================
DELETE FROM Stage_Employee
WHERE Employee_ID IN (
    SELECT Employee_ID
    FROM Stage_Employee
    GROUP BY Employee_ID
    HAVING COUNT(*) > 1
);

-- =========================================================
-- Step 3: Remove duplicate rows from Stage_Task
-- =========================================================
DELETE FROM Stage_Task
WHERE Task_ID IN (
    SELECT Task_ID
    FROM Stage_Task
    GROUP BY Task_ID
    HAVING COUNT(*) > 1
);

-- =========================================================
-- Step 4: Remove duplicate rows from Stage_CostCenter
-- =========================================================
DELETE FROM Stage_CostCenter
WHERE Cost_Center_ID IN (
    SELECT Cost_Center_ID
    FROM Stage_CostCenter
    GROUP BY Cost_Center_ID
    HAVING COUNT(*) > 1
);

-- =========================================================
-- Step 5: Remove duplicate rows from Stage_Time
-- =========================================================
DELETE FROM Stage_Time
WHERE Time_ID IN (
    SELECT Time_ID
    FROM Stage_Time
    GROUP BY Time_ID
    HAVING COUNT(*) > 1
);

-- =========================================================
-- Step 6: Transform Stage_Fact_ProjectFinance
--  - Calculate Profit
--  - Ensure Progress_Percent is between 0 and 100
-- =========================================================
UPDATE Stage_Fact_ProjectFinance
SET Profit = Revenue_Amount - (Expense_Amount + Labor_Cost)
WHERE Profit = 0;

UPDATE Stage_Fact_ProjectFinance
SET Progress_Percent = CASE
    WHEN Progress_Percent < 0 THEN 0
    WHEN Progress_Percent > 100 THEN 100
    ELSE Progress_Percent
END;

-- =========================================================
-- Step 7: Remove duplicate Fact rows if any
-- =========================================================
DELETE FROM Stage_Fact_ProjectFinance
WHERE (Project_ID, Employee_ID, Task_ID, Time_ID, Cost_Center_ID) IN (
    SELECT Project_ID, Employee_ID, Task_ID, Time_ID, Cost_Center_ID
    FROM Stage_Fact_ProjectFinance
    GROUP BY Project_ID, Employee_ID, Task_ID, Time_ID, Cost_Center_ID
    HAVING COUNT(*) > 1
);

-- =========================================================
-- Step 8: Additional transformations (optional)
--   - You can normalize text (upper/lowercase)
--   - Handle NULLs if needed
-- =========================================================

-- Example: Set NULL values in Labor_Cost or Expense_Amount to 0
UPDATE Stage_Fact_ProjectFinance
SET Labor_Cost = 0 WHERE Labor_Cost IS NULL;

UPDATE Stage_Fact_ProjectFinance
SET Expense_Amount = 0 WHERE Expense_Amount IS NULL;

-- =========================================================
-- End of etl_transform.sql
-- Ready for ETL Load step to Fact and Dimension tables
-- =========================================================