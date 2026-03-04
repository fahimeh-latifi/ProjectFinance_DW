/************************************************************
  File: create_stage.sql
  Project: ProjectFinance_DW
  Author: Fahimeh Latifi
  Description: Create Staging tables for Project-Based
               Financial Data Warehouse (OLAP)
               Temporary tables used for ETL process

************************************************************/

-- =========================================================
-- Stage Table: Stage_Project
-- Description: Temporary table to load raw project data
-- before cleaning and loading into Dim_Project
-- =========================================================
CREATE TABLE Stage_Project AS
SELECT * FROM Dim_Project WHERE 1=0;

-- =========================================================
-- Stage Table: Stage_Employee
-- Description: Temporary table to load raw employee data
-- before cleaning and loading into Dim_Employee
-- =========================================================
CREATE TABLE Stage_Employee AS
SELECT * FROM Dim_Employee WHERE 1=0;

-- =========================================================
-- Stage Table: Stage_Task
-- Description: Temporary table to load raw task data
-- before cleaning and loading into Dim_Task
-- =========================================================
CREATE TABLE Stage_Task AS
SELECT * FROM Dim_Task WHERE 1=0;

-- =========================================================
-- Stage Table: Stage_Time
-- Description: Temporary table to load raw time/date data
-- before cleaning and loading into Dim_Time
-- =========================================================
CREATE TABLE Stage_Time AS
SELECT * FROM Dim_Time WHERE 1=0;

-- =========================================================
-- Stage Table: Stage_CostCenter
-- Description: Temporary table to load raw cost center data
-- before cleaning and loading into Dim_CostCenter
-- =========================================================
CREATE TABLE Stage_CostCenter AS
SELECT * FROM Dim_CostCenter WHERE 1=0;

-- =========================================================
-- Stage Table: Stage_Fact_ProjectFinance
-- Description: Temporary table to load raw fact/project finance
-- data before cleaning, calculating Profit, and loading into Fact_ProjectFinance
-- =========================================================
CREATE TABLE Stage_Fact_ProjectFinance AS
SELECT * FROM Fact_ProjectFinance WHERE 1=0;

-- =========================================================