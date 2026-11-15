-- DATA Cleaning

Select * 
From layoffs;

-- 1. Remove Duplicates
-- 2. Standardize the Data , Means fix some spelling or anything like that
-- 3. Null Values or Blank Values
-- 4. Remove Any Columns

-- Create a new table using this query for our real data cleaning 
-- It is because you should not work with the RAW data and you should create a new table to work with.
Create Table layoffs_staging
Like layoffs;

Select * 
From layoffs_staging;

-- Insert the data from the loyoffs table using this query
INSERT layoffs_staging
Select *
From layoffs;

-- 1. Remove Duplicates

Select *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, `date`) AS row_num
From layoffs_staging;

WITH duplicate_cte AS 
(
Select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
From layoffs_staging
)
Select *
From duplicate_cte
Where row_num > 1;

Select *
From layoffs_staging
where company = 'Casper';

WITH duplicate_cte AS 
(
Select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
From layoffs_staging
)
Delete
From duplicate_cte
Where row_num > 1;

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


Select *
From layoffs_staging2;

INSERT INTO layoffs_staging2
Select *,
ROW_NUMBER() OVER(
PARTITION BY company, location, 
industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num
From layoffs_staging;

Delete
From layoffs_staging2
WHERE row_num > 1;

Select *
From layoffs_staging2;

-- 2. Standardize the Data , Finding issues in your data and then fixing it.alter

Select * 
From layoffs_staging2;

Select Distinct Trim(company), company
From layoffs_staging2;

Update layoffs_staging2 
Set company = Trim(company);


Select * 
From layoffs_staging2;

Select *
From layoffs_staging2
Where industry Like 'Crypto%';

Update layoffs_staging2
Set industry = 'Crypto'
Where industry Like 'Crypto%';

Select Distinct industry
From layoffs_staging2
Order By 1;

Select * 
From layoffs_staging2;

Select Distinct location
From layoffs_staging2
Order By 1;

Select Distinct country, Trim(Trailing '.' From country)
From layoffs_staging2
Order By 1;

Update layoffs_staging2
Set country = Trim(Trailing '.' From country)
Where country Like 'United States%';

Select * 
From layoffs_staging2;

Select `date`,
STR_TO_DATE(`date`, '%m/%d/%Y')
From layoffs_staging2;

Update layoffs_staging2
Set `date` = STR_TO_DATE(`date`, '%m/%d/%Y');

Select `date`
From layoffs_staging2;

Alter Table layoffs_staging2
Modify Column `date` Date;


-- 3. Null Values or Blank Values
Select * 
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is NUll;

Update layoffs_staging2
Set industry = NUll
Where industry = '';


Select * 
From layoffs_staging2
Where industry Is NUll
OR industry = '';

Select * 
From layoffs_staging2
Where company = 'Airbnb';

Select * 
From layoffs_staging2
Where company Like 'Bally%';

Select t1.industry, t2.industry
From layoffs_staging2 As t1
Join layoffs_staging2 As t2
	On t1.company = t2.company
Where (t1.industry Is Null OR t1.industry = '')
And t2.industry Is Not Null;

Update layoffs_staging2 t1
Join layoffs_staging2 t2
	ON t1.company = t2.company
Set t1.industry = t2.industry
Where t1.industry Is Null
And t2.industry Is Not Null; 

Select * 
From layoffs_staging2;


-- 4. Remove Any Columns
Select * 
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is NUll;

Delete 
From layoffs_staging2
Where total_laid_off Is Null
And percentage_laid_off Is NUll;


Select *
From layoffs_staging2;


Alter Table layoffs_staging2
Drop Column row_num;