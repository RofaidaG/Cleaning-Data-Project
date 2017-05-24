## Cleaning-Data-Project
This is the course project for the Getting and Cleaning Data Coursera course. The R script, run_analysis.R, does the following:
1. Download all files exist in the specified URL :https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip , unzip the file and read all .txt files in data sets
2. merge 6 files into 3 data sets (x, y, subject)
3. merge the 3 data sets in one big data set.
4. select columns that include std() or mean() in the coulmn name.
5. write a new txt file for the tidy data set.
6. summarize the data set with respect to subject and activity, and include the columns means.



