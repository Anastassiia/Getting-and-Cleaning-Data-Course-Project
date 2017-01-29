# Getting-and-Cleaning-Data-Course-Project
Course Project

# Synopsis

This is a final project of Coursera course "Getting and cleaning data" of R programming specialisation.

# Files

It contains the main script run_analysis.R, which downloads the data set and create the new one, and tidyDataSet.csv, where final data set is saved. 

# Main script

The script downloading a data collected from the accelerometers from the Samsung Galaxy S smartphone, merges features of train and test sets to  one data set, and then create a new data set which contains information about average characteristics for each activity for each subject. Detailed information is contained in Codebook.md file.

# Paths

The function uses url "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" as a data source, downloads zip archive to destination "C:\\Users\\XXX\\Desktop\\R\\DataProject.zip" and then works with temprorary directory to unzip file. If you want to use script, you have to define your own path to save downloaded data set. 

# Outcome
Final result is saved to "C:\\Users\\XXX\\Desktop\\R\\tidyDataSet.csv". If you want to use script, you have to redefine the path and you can choose your preferred format of data.
