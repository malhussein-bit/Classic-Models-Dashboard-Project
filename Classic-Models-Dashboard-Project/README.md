# 📊 Classic Models Power BI Dashboard

## 📝 Project Summary

This project analyzes sales transactions from the "Classic Models" database, which includes a variety of product lines such as Motorcycles, Planes, Ships, Trains, Trucks, Buses, and Vintage Cars. The objective is to extract business insights by analyzing KPIs like total sales, net profit, sales by office country, and customer location.

This dashboard simulates how raw SQL-based data can be transformed into actionable insights using Excel and Power BI.

---

## 🧰 Tools & Technologies

- **MySQL Workbench** – for data extraction and schema setup
- **Microsoft Excel** – for pivot tables and formatting
- **Power BI Desktop** – for building interactive dashboards

---

## 🔁 Workflow Overview

1. **Database Setup & Querying**  
   - A schema was created using a SQL script in MySQL Workbench.
   - SQL queries answered several key business questions:
     - Product sales overview for 2004 by product name
     - Product pairings purchased together
     - Sales values and net profit by customer country
     - Credit limits grouped with order and customer numbers
     - Customer sales trends and running totals
     - Over-credit customers after factoring in payments

   → See [`MySQL_Query/project_query.sql`](./MySQL_Query/project_query.sql)

2. **Data Preparation in Excel**  
   - SQL query results were copied into Excel
   - Pivot tables and charts were built for exploration and pre-cleaning  
   → See [`Excel_Data/cleaned_data.xlsx`](./Excel_Data/cleaned_data.xlsx)

3. **Power BI Dashboard**  
   - Excel file used as data source in Power BI
   - View created in MySQL to simplify and join necessary tables
   - Interactive visuals were built to highlight performance metrics  
   → See [`PowerBI_Dashboard/dashboard.pbix`](./PowerBI_Dashboard/dashboard.pbix)

---

## 📷 Dashboard Preview

> _(Upload and update this section with your screenshot once ready)_

![Dashboard Screenshot](./Screenshots/dashboard_screenshot.png)

---

## 📁 Project Structure


## 🚀 How to Run This Project

1. Download and install **[Power BI Desktop](https://powerbi.microsoft.com/en-us/desktop/)**
2. Clone or download this repository
3. Open the `.pbix` file in Power BI to explore the interactive dashboard

---

## 📌 Key Insights

- The USA has the highest overall sales value
- 🚗 Classic Cars dominate in total sales, generating over **$3.5 million**
- 🏢 The USA office outperformed all others in sales figures

---

## 💼 About Me

I’m an aspiring **Data Analyst** passionate about transforming data into insights through clean storytelling and visuals.

- 💻 [GitHub](https://github.com/malhussein-bit)

---

