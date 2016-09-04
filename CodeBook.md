This explains the steps and documents the variables 
Prepare for the code run to save time
Download sourse data from link below and unzip it to working directory of R Studio.
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Run the R script run_analysis.R

## The R Script performs the 5 steps required by the project
Step 1: Merges the training and the test sets to create one data set.
        Read files
        Read Trainings
        Read Tests
        Read features
        Read Activities
        Assigning column names
        Merge all data into one set

Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.
        Reading column namess
        Create mean and Standard deviation
        Subset for mean and standard deviation
        
Step 3.	Uses descriptive activity names to name the activities in the data set

Step 4.	Appropriately labels the data set with descriptive variable names.
        Done in previous steps 1 and 2
        
Step 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for # each activity and each subject.

Variable name           | Description
------------------------|------------
x_train                 |Contains data from training data file
y_train                 |Contains data from training data file
x_test                  |Contains data from testing data file
y_test                  |Contains data from testing data file
subject_train           |Contains subjectid from training data file
subject_test            |Contains subjectid from testing data file
m_train                 |Column binded data from train data sets
m_test                  |Column binded data from test data sets
allData                 |all data combining m_train and m_test by row bind

 
