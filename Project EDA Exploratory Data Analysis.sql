-- EDA Exploratory Data Analysis

Select * 
From layoffs_staging2;

Select Max(total_laid_off), Max(percentage_laid_off)
From layoffs_staging2;

Select * 
From layoffs_staging2
Where  percentage_laid_off = 1
Order By total_laid_off Desc;

Select * 
From layoffs_staging2
Where  percentage_laid_off = 1
Order By funds_raised_millions Desc;

Select company, Sum(total_laid_off) 
From layoffs_staging2
Group By company
Order By 2 Desc; 	

Select Min(`date`), Max(`date`)
From layoffs_staging2;

Select industry, Sum(total_laid_off) 
From layoffs_staging2
Group By industry
Order By 2 Desc; 	

Select country, Sum(total_laid_off) 
From layoffs_staging2
Group By country
Order By 2 Desc; 	

Select `date`, Sum(total_laid_off) 
From layoffs_staging2
Group By  `date`
Order By 1 Desc; 	

Select Year(`date`), Sum(total_laid_off) 
From layoffs_staging2
Group By  Year(`date`)
Order By 1 Desc; 	

Select stage, Sum(total_laid_off) 
From layoffs_staging2
Where stage Is Not Null
Group By  stage
Order By 1 ASC; 	

Select company, Sum(percentage_laid_off) 
From layoffs_staging2
Group By company
Order By 2 Desc; 	

Select * 
From layoffs_staging2;

Select substring(`date`, 1,7) AS `Month`, Sum(total_laid_off)
From layoffs_staging2
Where substring(`date`, 1,7) Is NOt Null
Group By `Month`
Order By 1;

With Rolling_Total AS
(
Select substring(`date`, 1,7) AS `Month`, Sum(total_laid_off) As total_off
From layoffs_staging2
Where substring(`date`, 1,7) Is NOt Null
Group By `Month`
Order By 1
)
Select `Month`,total_off,
Sum(total_off) Over(Order By `Month`) as rolling_total
From Rolling_Total;

Select company, Sum(total_laid_off) 
From layoffs_staging2
Group By company
Order By 2 Desc; 	

Select company, Year(`date`), Sum(total_laid_off) 
From layoffs_staging2
Group By company, Year(`date`)
Order By 3 DESC;



WITH Comapny_Year (company, years, total_laid_off) AS
(
Select company, Year(`date`), Sum(total_laid_off) 
From layoffs_staging2
Group By company, Year(`date`)
), Company_Year_Rank AS
(Select *, 
dense_rank() Over(partition by years Order By total_laid_off DESC) AS Ranking 
From Comapny_Year
Where years Is Not Null
)
Select * 
From Company_Year_Rank
Where Ranking <= 5;



















