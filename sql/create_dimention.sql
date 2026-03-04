/************************************************************
  File: create_dimensions.sql
  Project: ProjectFinance_DW
  Author: Fahimeh Latifi
  Description: Create Dimension tables for Project-Based
               Financial Data Warehouse (OLAP)

************************************************************/

-- =========================================================
-- Dimension Table: Dim_Project
-- Description: Stores project information including
-- project name, client, start and end dates, status
-- =========================================================
CREATE TABLE Dim_Project (
    Project_ID INT PRIMARY KEY,            -- Unique project identifier
    Project_Name VARCHAR(100) NOT NULL,    -- Project name
    Client VARCHAR(100),                   -- Client name
    Start_Date DATE,                       -- Project start date
    End_Date DATE,                         -- Project end date
    Status VARCHAR(20)                     -- Project status (Active, Completed, On-Hold)
);

-- =========================================================
-- Dimension Table: Dim_Employee
-- Description: Stores employee information and roles
-- =========================================================
CREATE TABLE Dim_Employee (
    Employee_ID INT PRIMARY KEY,           -- Unique employee identifier
    First_Name VARCHAR(50) NOT NULL,       -- First name
    Last_Name VARCHAR(50) NOT NULL,        -- Last name
    Role VARCHAR(50),                      -- Role (Project Manager, Developer, etc.)
    Department VARCHAR(50)                 -- Department
);

-- =========================================================
-- Dimension Table: Dim_Task
-- Description: Stores task information and type
-- =========================================================
CREATE TABLE Dim_Task (
    Task_ID INT PRIMARY KEY,               -- Unique task identifier
    Task_Name VARCHAR(100) NOT NULL,       -- Task name
    Task_Type VARCHAR(50)                  -- Task type (Analysis, Development, Testing)
);

-- =========================================================
-- Dimension Table: Dim_Time
-- Description: Stores time information for time-based
-- analysis (day, month, quarter, year)
-- =========================================================
CREATE TABLE Dim_Time (
    Time_ID INT PRIMARY KEY,               -- Unique time identifier (YYYYMMDD)
    Date DATE NOT NULL,                     -- Full date
    Day INT,                                -- Day of the month
    Month INT,                              -- Month
    Quarter INT,                            -- Quarter
    Year INT,                               -- Year
    Weekday VARCHAR(10)                     -- Day of the week
);

-- =========================================================
-- Dimension Table: Dim_CostCenter
-- Description: Stores cost center information for
-- financial analysis
-- =========================================================
CREATE TABLE Dim_CostCenter (
    Cost_Center_ID INT PRIMARY KEY,        -- Unique cost center identifier
    Cost_Center_Name VARCHAR(100) NOT NULL,-- Name of the cost center
    Manager VARCHAR(100)                    -- Manager of the cost center
);

