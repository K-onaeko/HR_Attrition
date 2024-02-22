SELECT*
FROM HR_Attrition

-- Gender percentage
SELECT Gender,COUNT(*) AS Total,
COUNT(*) * 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageofTotal
FROM HR_Attrition
GROUP BY Gender

-- Employees over 18 
SELECT DISTINCT Over18, COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageOver18
FROM HR_Attrition
GROUP BY Over18

-- Min, avg, and max age of employees 
SELECT Min(age) AS MinAge, Avg(age) AS AvgAge,
MAX(age) AS MaxAge
FROM HR_Attrition

-- Marital status percentage
SELECT MaritalStatus,COUNT(*) * 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageofTotal
FROM HR_Attrition
GROUP BY MaritalStatus
ORDER BY PercentageofTotal DESC

-- Degree percentage
SELECT Education, COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageofTotal
FROM HR_Attrition
GROUP BY Education

-- Department percentage
SELECT Department, COUNT(*) AS EmployeeTotal, COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageofTotal
FROM HR_Attrition
GROUP BY Department
ORDER BY PercentageofTotal DESC

-- Degree types by department 
SELECT Department, Education, COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageOfEducationinDepartment
FROM HR_Attrition
GROUP BY Department, Education
HAVING COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition) > 0
ORDER BY 1

-- Average salary by department 
SELECT Department, AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HR_Attrition
GROUP BY Department
ORDER BY AverageMonthlyIncome DESC

-- Average salary by gender
SELECT Gender, AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HR_Attrition
GROUP BY Gender
ORDER BY AverageMonthlyIncome DESC

-- Average salary by education level 
SELECT Education, AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HR_Attrition
GROUP BY Education
ORDER BY AverageMonthlyIncome DESC

-- Distint job roles
SELECT DISTINCT JobRole
FROM HR_Attrition

-- Average salary of managers in each department
SELECT Department, JobRole, AVG(MonthlyIncome) AS AverageMonthlyIncome
FROM HR_Attrition
WHERE JobRole = 'Manager' 
GROUP BY Department, JobRole
ORDER BY AverageMonthlyIncome DESC

-- Attrition rates by marital status
SELECT MaritalStatus,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS AttritionPercentage
FROM HR_Attrition
GROUP BY MaritalStatus
ORDER BY AttritionPercentage DESC

-- Attrition rates by education
SELECT Education,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS AttritionPercentage
FROM HR_Attrition
GROUP BY Education
ORDER BY AttritionPercentage DESC

-- Attrition rates by department  
SELECT Department,
--COUNT(*) AS total_employees, 
COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageofTotal,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS AttritionPercentage
FROM HR_Attrition
GROUP BY Department
ORDER BY AttritionPercentage DESC

-- Attrition rates by job roles in department  
SELECT Department, JobRole,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS AttritionPercentage
FROM HR_Attrition
GROUP BY Department, JobRole
ORDER BY AttritionPercentage DESC

-- Attrition rate by job levels
SELECT JobLevel,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS AttritionPercentage
FROM HR_Attrition
GROUP BY JobLevel
ORDER BY AttritionPercentage DESC

-- Job roles in each job level
SELECT JobLevel, Jobrole
FROM HR_Attrition
GROUP BY JobLevel,Jobrole
ORDER BY JobLevel 

--Attrition rate by age group
SELECT
CASE
WHEN Age BETWEEN 18 AND 30 THEN 'Young 18-30' 
WHEN Age BETWEEN 31 AND 44 THEN 'Middle Age 31-44'
ELSE 'Old 45+'
END AS AgeGroup,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS attrition_percentage
FROM HR_Attrition
GROUP BY
CASE
WHEN Age BETWEEN 18 AND 30 THEN 'Young 18-30' 
WHEN Age BETWEEN 31 AND 44 THEN 'Middle Age 31-44'
ELSE 'Old 45+'
END 
ORDER BY attrition_percentage DESC

-- Attrition rates and salary by Gender  
SELECT Gender,  AVG(MonthlyIncome) AS AverageMonthlyIncome,
COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition) AS GenderPercentage,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS AttritionPercentage
FROM HR_Attrition
GROUP BY Gender
ORDER BY AttritionPercentage DESC

-- Education level, average income, and attrition 
SELECT Education, COUNT(*)* 100 / (SELECT COUNT(*) FROM HR_Attrition)AS PercentageofTotal, AVG(MonthlyIncome) AS AverageMonthlyIncome,
SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) /CAST(COUNT(*) AS DECIMAL(10,2))* 100  AS AttritionPercentage
FROM HR_Attrition
GROUP BY Education
ORDER BY AttritionPercentage DESC