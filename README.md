## Data Interview Project

### Overview

As a prospective candidate for a data role at Peerfit we'd like to see how you would go about solving data problems that are similar to the things you would solve day-to-day as a member of the Peerfit development team.
Before developing your solution, please consider the following:
- You should budget between 3-5 hours of time for your solution
- Your solution should include:
  - All SQL queries added to the `project/solution` directory
  - Completed questionnaire in the root of the project directory
- Your solution should include use of git and exhibit your style and process for version control

### Description
#### Reservation Data Analysis

Given several different datasets for member reservation data, we want to extract an accurate picture of reservations as a whole at Peerfit. The `project/data` directory provides the MySQL data dump necessary to complete questionnaire.

>Download and install MySQL on your computer: https://dev.mysql.com/downloads/mysql/. (Optional: If on a Mac, you can install MySQL via brew by running `brew install mysql` in your terminal.)

>Launch mysql in your shell (Windows) or terminal (Mac) using the command below. (Optional: Depending on the configuration you used during your MySQL installation, you can use a different user than `root` and can use the `-p` command to require a password.)

>```
mysql -u root -h localhost
```

>Create an empty database.

>```
CREATE DATABASE your-database-name;
```

>Exit the mysql client.

>```
exit;
```

>In your shell / terminal run the command below to import the peerfit_interview data into your database.

>>*Windows:*
```
mysql -u root your-database-name < "PATH_TO_FILE\peerfit_interview.sql"
```

>>*Mac:*
```
mysql -u root -h localhost your-database-name < /PATH_TO_FILE/peerfit_interview.sql
```

From here, you can query the data using the mysql CLI tool or through your favorite MySQL desktop client.
