# SQL Data Cleaning Project – Company Layoffs

## Project Overview
This project focuses on cleaning and preparing a company layoffs dataset using MySQL.

The objective was to improve data quality by identifying duplicate records, standardizing inconsistent values, handling missing information, and removing records that did not contain useful layoff information.

## Tools Used
- MySQL
- MySQL Workbench
- SQL

## Dataset
The dataset contains information about company layoffs, including:
- Company
- Location
- Industry
- Total employees laid off
- Percentage laid off
- Date
- Company stage
- Country
- Funds raised

## Data Cleaning Process

### 1. Removing Duplicates
- Used ROW_NUMBER() and PARTITION BY.
- Identified duplicate records.
- Created a staging table to preserve the original dataset.
- Removed duplicate records from the cleaned staging table.

### 2. Standardizing Data
- Removed unnecessary spaces using TRIM().
- Standardized industry names.
- Cleaned country formatting.
- Converted date values from text to DATE format.

### 3. Handling NULL Values
- Identified missing values.
- Converted blank industry values into NULL.
- Used self-joins to populate missing industry information where matching company records had available values.

### 4. Removing Unnecessary Records and Columns
- Removed records where both total_laid_off and percentage_laid_off were NULL.
- Removed the temporary row_num column after duplicate removal.

## SQL Skills Demonstrated
- SELECT statements
- Common Table Expressions (CTEs)
- Window Functions
- ROW_NUMBER()
- PARTITION BY
- Self-Joins
- UPDATE and DELETE
- TRIM()
- STR_TO_DATE()
- ALTER TABLE

## Project Outcome
The project produced a cleaned staging dataset with improved consistency and fewer duplicate and incomplete records, making it more suitable for further analysis.

## Future Improvements
- Perform exploratory data analysis (EDA).
- Identify layoff trends across companies and industries.
- Analyze layoffs by country and date.
- Build a dashboard to communicate insights.

## Author
Aspiring Data Analyst | Learning SQL, Data Cleaning, and Data Analytics.
