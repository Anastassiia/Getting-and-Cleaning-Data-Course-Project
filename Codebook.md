# Codebook for run_analysis.R

#Downloading data

The script downloads  a data set from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip".
It merges data from the following files:

subject_train.txt, subject_test.txt - with info about subjects

y_train.txt,y_test.txt - with info about activities

X_train.txt,X_train.txt - with data of features values for each observation

Descrition of features is contained in features.txt and feature_info.txt in original data source. For our analysis only features, which contain inforamtion about mean values and standart deviations, are selected (79 features). 

Every index of activity is replaced by its description from activity_labels.txt.

New data set "DataFinal" contains a table of 10299 observations and subject index "Subject", type of activities "Activity" and 79 related features.

This data set is used to create "NewData" data set with tidy data containing the following information:

Subject - column of subjects;

Activity - column of activities; 

tBodyAcc-mean()-X

tBodyAcc-mean()-Y

...........

fBodyBodyGyroJerkMag-meanFreq() - columns which contains information about mean value of the parameter in all observations for corresponding (Subject,Activity) pair.

Each row is a unique combination of subject and activity for all possible combinations.

tidyDataSet.csv contains NewData data set. Overall it has 180 rows (30subj. * 6 activities) and 81 columns (Subject, Activity, 79 parameters).
