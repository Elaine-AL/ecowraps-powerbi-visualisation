# Data visualisation and analysis 
## Ecowraps packaging business performance analysis and visualisation

This is _**PowerBi, SQL server, PostgreS and R**_ analysis and presentation of the **Ecowraps packaging** business performence in a dashboard. The raw data is input in excel file, linked into SQL server for storage, then visualised in PowerBi. 
## 🧰 Tools & Technologies Used

| Category | Tools |
|-----------|-------|
| **Languages** | R, SQL, DAX |
| **Database** | PostgreSQL, SQL Server |
| **Visualization** | Power BI |
| **Version Control** | Git, GitHub |

## 🛠️ Built With
![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-4479A1?style=for-the-badge&logo=postgresql&logoColor=white)
![Power BI](https://img.shields.io/badge/Power%20BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github)

> Below are the steps i took to accomplish the project:
  1. Data connection -- Create databases in PostgreSQL and SQL server
     a) Under sql server
- Import the data from the main excel file using the OPENROWSET() function
- Data cleaning -- Do the clean ups 
- Since the import is static, we need to create an automation that reads the excel file every morning to show any changes done. We do this using the Windows Task Scheluder;
	-> Create a basic task and create a name in Task scheduler
	-> Select the frequency, in this case "Daily" and set the exact time
	-> Under action, choose "Start program"
	-> Under Program/script, write "sqlcmd"
	-> Under Add arguments, paste this: sqlcmd -S .\SQLEXPRESS -d ecowraps -E -i "path to sql file.sql"
  	b) Under Postgres
- Since Postgres can't read excel sheets, we are going to load the data sheets in R, create a connection with our Postgres DB then load to our DB from R environment using dbConnect() and dbWriteTable() R functions
- Once the data is loaded in db confirm their existence
- Then do the cleanup - data cleaning
- Since postgres will only show what data is available in R object, we need to automate the R script to run every day when the excel refresh. We will do this using Windows Task Scheduler.;
	->Open Task Scheduler 
	-> Create Basic Task
	-> Create a name for the task, click next
	-> Select frequency, in our case "Daily"/"When computer starts"
	-> Under “Action”, select Start a program
	-> In “Program/script” field: go to the Rscript.exe path
	-> in "add arguments" field: browse to your Rscript that renders the markdown file
	-> in "start in" field: you paste path to the folder where you want your results

2. Git initialize the whole project to GitHub
	- git config --global
	- git init
	- git add .
	- git commit -m "First commit: added all my scripts and data"
	- git remote add origin
	- git branch -M main
	- git pull origin main --allow-unrelated-histories
	- git push -u origin main
3. When you do any changes in your project push them to GitHub using these steps
	- git status
	- git add .
	- git commit -m "Added the excel file to Postgres db using R script"
	- git pull origin main
	- git push origin main

3. Lets start the visualization in PowerBi -- we will use the sql server db data
	- open powerbi and connect to your sql server
	- do any cleaning and data transformations in the power query editor then close and apply changes
	- go to the model view tab to manage the relationships between your tables
	- create the measure columns: total sales revenue, total profit, total expenses, total orders, average order revenue, total units sold, average daily orders, %profit
	- create the charts now 

This is the final look of the dashboard

![Image](https://github.com/Elaine-AL/ecowraps-powerbi-visualisation/blob/main/first_draft_snapshot.png)
