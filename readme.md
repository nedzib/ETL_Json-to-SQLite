# ETL

According to Wikipedia (2021)...
>In computing, extract, transform, load (ETL) is the general procedure of copying data from one or more sources into a destination system which represents the data differently from the source(s) or in a different context than the source(s). The ETL process became a popular concept in the 1970s and is often used in data warehousing.

# Features!

  - Miminalist app
  - You can change the name of the tasks
  - You can select between 3 different time periods for the working time and the break time 

### Tech

This ETL implementation uses:

* [SQLite](https://www.sqlite.org/index.html) - SQL database engine
* Basic batch scripting
* Basic HTML and JS
* Using the information of [{JSON} Placeholder](https://jsonplaceholder.typicode.com/)

## Usage and How works

This ETL implementation requires [SQLite](https://www.sqlite.org/index.html) to run in the root directory.

works in 3 steps

1. Open index.html in your browser and automatically with your permission download 8 files, 6 in SQL and 2 in CSV
2. Copy and paste the files into 
./SQL directory
3. Then you Execute the main.bat file

This last step will fill a temporary database with the information in the files you can see it in 

    ./DATA/tempDB.db

after that, in the filters.sql file we have some valitations in order to determinate if the data extracted have the format or datatype determined and rewrite in a secondary tables inside tempDB.db.

With the relationalDB.sql file we create a relational database in ./DATA/Migrated_Data.db, then, migration.sql file insert the data to the final database.

the last action is apply a Query to review the persistence of data

**Made with <3 to be free**