show databases;
use university1;
show tables;
select * from `annual salary project excel`;

# question 1
select avg(`Annual Salary Fixed2`) as avg_salary, Industry, Gender
from `annual salary project excel`
group by Industry, Gender; 

# question 2
SELECT 
    SUM(`Annual Salary Fixed2`)AS Total_salary,
    SUM(`Additional Monetary Compensation`) AS Total_bonus,
    SUM(`Annual Salary Fixed2` + `Additional Monetary Compensation`) AS Total_compensation,
    `Job Title`
FROM `annual salary project excel`
GROUP BY `Job Title`;

# question 3
select sum(`Annual Salary Fixed2`), min(`Annual Salary`), max(`Annual Salary`), `Highest Level of Education Completed`
from `annual salary project excel`
group by `Highest Level of Education Completed`;

# question 4
select count(*) as `Total_employee_count`, `Industry`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`
from `annual salary project excel`
group by `Industry`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`;

# question 6
select max(`Annual Salary`) as max_salary, `Job Title`, `Country`
from `annual salary project excel`
group by `Job Title`, `Country`;

# question 7
SELECT `Country`, `Job Title`, high_avg_salary
FROM (
    SELECT `Country`, `Job Title`,
           AVG(`Annual Salary`) AS high_avg_salary,
           RANK() OVER (PARTITION BY `Country` ORDER BY AVG(`Annual Salary`) DESC) rnk
    FROM `annual salary project excel`
    GROUP BY `Country`, `Job Title`
) t
WHERE rnk = 1;

# question 8
select avg(`Annual Salary`) as avg_salary, `City`, `Industry`
from `annual salary project excel`
group by `City`, `Industry`;

# question 9
SELECT 
    `Gender`,ROUND(100.0 * SUM(CASE WHEN `Additional Monetary Compensation` > 0 THEN 1 ELSE 0 END) / COUNT(*),2) AS percentage_of_add_comp
FROM  `annual salary project excel`
GROUP BY `Gender`;

# question 10
SELECT 
    SUM(`Annual Salary`) AS Total_salary,
    SUM(`Additional Monetary Compensation`) AS Total_bonus,
    SUM(`Annual Salary` + `Additional Monetary Compensation`) AS Total_compensation,
    `Job Title`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`

FROM  `annual salary project excel`
GROUP BY `Job Title`, `Years of Professional Experience Overall`, `Years of Professional Experience in Field`;

# question 11
select avg(`Annual Salary`) as avg_salary, `Industry`, `Gender`, `Highest Level of Education Completed`
FROM  `annual salary project excel`
group by `Industry`, `Gender`, `Highest Level of Education Completed`;

