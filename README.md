# Company Layoffs – SQL Data Cleaning & Exploratory Data Analysis

## Project Overview

This project focuses on cleaning and performing Exploratory Data Analysis (EDA) on a company layoffs dataset using MySQL.

The project was completed in two major stages:

1. Data Cleaning – Improving data quality by removing duplicates, standardizing inconsistent values, and handling missing data.
2. Exploratory Data Analysis – Analyzing the cleaned dataset to identify trends, patterns, and insights related to company layoffs.

The project is part of my Data Analyst learning journey through Alex The Analyst's Data Analyst Bootcamp.

## Tools & Technologies

- MySQL
- MySQL Workbench
- SQL

## Dataset Information

The dataset contains information about company layoffs, including:

- Company
- Location
- Industry
- Total employees laid off
- Percentage of employees laid off
- Date
- Company stage
- Country
- Funds raised in millions

## Project Structure

```text
Company-Layoffs-SQL-Project/
│
├── Data/
│   └── layoffs.csv
│
├── SQL/
│   ├── 01_data_cleaning.sql
│   └── 02_exploratory_data_analysis.sql
│
├── Images/
│   ├── data_cleaning.png
│   └── exploratory_data_analysis.png
│
└── README.md
```

## Phase 1: Data Cleaning

The objective was to prepare the raw dataset for reliable analysis.

### Tasks Performed

1. Removed duplicate records using ROW_NUMBER(), PARTITION BY, and staging tables.
2. Standardized company names using TRIM().
3. Standardized industry categories.
4. Cleaned inconsistent country values.
5. Converted date values from text into the DATE data type.
6. Identified and handled NULL and blank values.
7. Used self-joins to populate missing industry information where matching records were available.
8. Removed records where both total_laid_off and percentage_laid_off were NULL.
9. Removed temporary columns used during the cleaning process.

## Phase 2: Exploratory Data Analysis (EDA)

After cleaning the dataset, I performed exploratory analysis to identify layoff patterns and trends.

### Key Analysis Performed

1. Identified the maximum number and percentage of layoffs.
2. Identified companies that laid off 100% of their workforce.
3. Analyzed total layoffs by company.
4. Identified the date range covered by the dataset.
5. Analyzed layoffs by industry.
6. Analyzed layoffs by country.
7. Explored layoffs by date and year.
8. Analyzed layoffs by company stage.
9. Identified monthly layoff trends.
10. Calculated cumulative monthly layoffs using rolling totals.
11. Compared company layoffs across different years.
12. Ranked the top five companies with the highest layoffs for each year using DENSE_RANK().

## SQL Concepts Demonstrated

- SELECT, WHERE, ORDER BY
- GROUP BY and aggregate functions
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- DENSE_RANK()
- PARTITION BY
- SUM() OVER()
- INNER JOIN and Self-Joins
- Date Functions
- String Functions
- UPDATE and DELETE statements
- Data Type Conversion

## Project Learning Outcomes

Through this project, I gained practical experience in:

- Preparing raw datasets for analysis.
- Identifying and resolving data quality issues.
- Applying SQL window functions to real-world data.
- Using aggregations to explore business trends.
- Calculating rolling totals and ranking companies.
- Understanding the importance of data quality before analysis.

## Future Improvements

- Build an interactive Power BI dashboard.
- Develop visualizations to communicate key findings.
- Explore additional trends and patterns in the layoffs dataset.

## Acknowledgment

This project was completed as part of my learning journey through Alex The Analyst's Data Analyst Bootcamp.

## Author

Aspiring Data Analyst | SQL | MySQL | Data Cleaning | Exploratory Data Analysis
