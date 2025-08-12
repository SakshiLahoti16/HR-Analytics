create database Human_Resource_Analysis_Project;

use Human_Resource_Analysis_Project;

-- Check all data from HR table

SELECT 
    *
FROM
    merged_hr_data_csv_;


-- QUESTIONS

-- 1. Total Employees in The Company
SELECT DISTINCT
    COUNT(EmployeeCount) AS Total_Employees
FROM
    merged_hr_data_csv_;


-- 2. Average Age of Employee
SELECT 
    ROUND(AVG(Age), 0) AS Avg_Emp_Age
FROM
    merged_hr_data_csv_;


-- 3. Average Monthly Income
SELECT 
    ROUND(AVG(MonthlyIncome), 2) AS AvgMonthlyIncome
FROM
    merged_hr_data_csv_;


-- 4. Total Attrition Rate (Overall)
SELECT 
    ROUND(AVG(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100,
            2) AS TotalAttritionRate
FROM
    merged_hr_data_csv_;


-- 5. Average Attrition Rate for All Departments
SELECT 
    Department,
    ROUND(AVG(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END) * 100,
            2) AS AttritionRate
FROM
    merged_hr_data_csv_
GROUP BY Department;


-- 6. Average Hourly Rate of Male Research Scientist
SELECT 
    ROUND(AVG(HourlyRate), 2) AS AvgHourlyRate
FROM
    merged_hr_data_csv_
WHERE
    Gender = 'Male'
        AND JobRole = 'Research Scientist';


-- 7. Attrition Rate vs Monthly Income Status (Low, Medium, High)
SELECT 
    CASE
        WHEN MonthlyIncome < 5000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 5000 AND 15000 THEN 'Medium'
        ELSE 'High'
    END AS IncomeGroup,
    ROUND(AVG(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END),
            3) AS AttritionRate
FROM
    merged_hr_data_csv_
GROUP BY CASE
    WHEN MonthlyIncome < 5000 THEN 'Low'
    WHEN MonthlyIncome BETWEEN 5000 AND 15000 THEN 'Medium'
    ELSE 'High'
END;


-- 8. Average Working Years for Each Department 
SELECT 
    Department, ROUND(AVG(YearsAtCompany), 2) AS AvgWorkingYears
FROM
    merged_hr_data_csv_
GROUP BY Department;


-- 9. Job Role vs Work-Life Balance 
SELECT 
    JobRole,
    ROUND(AVG(WorkLifeBalance), 2) AS AvgWorkLifeBalance
FROM
    merged_hr_data_csv_
GROUP BY JobRole;


-- 10. Attrition Rate vs Years Since Last Promotion
SELECT 
    YearsSinceLastPromotion,
    ROUND(AVG(CASE
                WHEN Attrition = 'Yes' THEN 1
                ELSE 0
            END),
            2) AS AttritionRate
FROM
    merged_hr_data_csv_
GROUP BY YearsSinceLastPromotion
ORDER BY YearsSinceLastPromotion;