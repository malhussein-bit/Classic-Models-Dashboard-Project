#  Classic Models Power BI Dashboard

##  Project Summary

This project aim to analyzes sales transactions from the "Classic Models" database, showing sales trends and net profit for a variety of product lines such as Classic Cars, Motorcycles, Planes, Ships, Trains, Trucks, Buses, and Vintage Cars. The objective is to extract business insights by analyzing KPIs like total sales, net profit, sales by office country, and customer location.
The company would then be able to plan marketiing campains according the the final findings of the report.

This dashboard simulates how raw SQL-based data can be transformed into actionable insights using Excel and Power BI.

---

##  Tools & Technologies

- **MySQL Workbench** – for data extraction and schema setup.
- **Microsoft Excel** – for pivot tables,formatting and final calculations
- **Power BI Desktop** – for building the interactive dashboards

---

##  Workflow Overview

1. **Database Setup & Querying**  
   - A schema of 8 different tabels was created using a SQL script in MySQL Workbench.
      - **Table names**: Product, Orders, Orderdetails, Customers, Employees, Ofices, Productlines, Payments.
      - See 📄 [SQL Script to Create Classic Models Database](https://github.com/malhussein-bit/Classic-Models-Dashboard-Project/blob/main/MySQL_Query/project_query.sql/Script%2Bfor%2BClassic%2BModels%20Create%20Database.txt)

   - SQL queries were used to answer the follwong key business questions:
     
     - Product sales overview for 2004 by product name
     - Product pairings purchased together
     - Sales values and net profit by customer country
     - Credit limits grouped with order and customer numbers
     - Customer sales trends and running totals
     - Over-credit customers after factoring in payments
    
    CTE's , subqueries and windows were used to asnswer above questions 

   → See all queries used to asnswer above questions [`MySQL_Query/project_query.sql`](./MySQL_Query/project_query.sql)

2. **Data Preparation in Excel**  
   - SQL query results were copied into Excel
   - Pivot tables and charts were built for exploration and pre-cleaning  
   → See https://github.com/malhussein-bit/Classic-Models-Dashboard-Project/blob/main/Excel%20_Data/Classic%20Models%20Analysis.xlsx


3. **Power BI Dashboard**  
   - Excel file used as data source in Power BI
   - View created in MySQL to simplify and join necessary tables
   - Interactive visuals were built to highlight performance metrics  
   → See [`PowerBI_Dashboard/dashboard.pbix`](./PowerBI_Dashboard/dashboard.pbix)

---

##  Dashboard Preview






![Sales](https://github.com/user-attachments/assets/f5c062fa-ff5a-41f2-9f83-3a74606978d0)



![Classsic Models Page 2 SS](https://github.com/user-attachments/assets/ccb74a42-ab12-496f-b4c4-e4b102953f1d)

---



##  How to Run This Project

1. Download and install **[Power BI Desktop](https://powerbi.microsoft.com/en-us/desktop/)**
2. Clone or download this repository
3. Open the `.pbix` file in Power BI to explore the interactive dashboard

---

##  Key Insights

- Total Company Sales  **$ 9.6 M**
- Total Uniuque Orders  **326**
- The average Order Amount **$29.5 k**
- The biggest seller of all Product lines **Classic Cars- $ 3.9 M**
- The USA Sales Office has the highest overall sales value **$ 3.5 M**
  
---

##  About Me

I’m an aspiring **Data Analyst** passionate about transforming data into insights through clean storytelling and visuals.

-  [GitHub](https://github.com/malhussein-bit)

---

