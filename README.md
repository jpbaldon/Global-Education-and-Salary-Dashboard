# Global-Education-and-Salary-Dashboard
An analysis of correlation between education and salary across the globe

# Visualization
The original Tableau visualization I created for this project can be found [here](https://public.tableau.com/app/profile/jonathan.baldon/viz/GlobalVisualizationofSalaryandFormalEducation/Dashboard1).

![Global_Ed_and_Sal_Viz](https://github.com/user-attachments/assets/6b501be2-7cd6-46f0-82c5-4c7e2df2f57e)

# About 
The visualization is based on global salary data from [here](https://www.kaggle.com/datasets/zedataweaver/global-salary-data) and global education data from [here](https://www.kaggle.com/datasets/imtkaggleteam/global-education/data?select=4-+gender-gap-education-levels.csv). I then cleaned and joined these two datasets using mySQL (the queries I created and used can be found in the sql file in the project folder). I then created visualizations of the correlated data in Excel and in Tableau.

# Insights
According to the initial datasets, the overwhleming majority of countries boast more than 90% of their population with some level of formal education. However, when comparing a map of countries by the percentage of pop with some formal education to a map of countries by their median salary divided by the same percentage, the maps differ quite substantially, indicating that citizens of some countries have gotten a lot more (financially speaking) out of their forrmal education than citizens of other countries, whether that's because (a) the quality of the formal education can differ greatly OR (b) the average quantity enveloped by the phrase "*some* formal education" can vary greatly. Interestingly, Switzerland, which has the highest possible percentage (100%) of its population with some formal education, it still has the highest (by far) ratio of median salary to percent of pop with some formal education, indicating that Switzerland is likely particularly good at providing formal education to its inhabitants. The bar graph further shows that the North America and Europe dominate the globe when it comes to having a high ratio of median salary to formal education.

# Limitations
Some countries, such as Libya and North Korea, were not included in at least one of the datasets.
As described above, the term "*some* formal education" is a bit nebulous.
Some of the salary data seems a bit high or low; I question the accuracy of all of the data.
