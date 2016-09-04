#Load the required libraries
library(plyr)

# Data Preparation
# Set datafolder, file name and URL
if(!file.exists("./data")){dir.create("./data")}
f <- "Dataset.zip"
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile="./data/Dataset.zip")

# Unzip data file

unzip(zipfile="./data/Dataset.zip",exdir="./data")

# Step 1: Merges the training and the test sets to create one data set.
# 	Read files
#		Read Trainings
		x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
		y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
		subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#		Read Tests
		x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
		y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
		subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#		Read features
		features <- read.table('./data/UCI HAR Dataset/features.txt')

#		Read Activities
		activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

# 	Assigning column names
      colnames(x_train) <- features[,2] 
      colnames(y_train) <-"activityId"
      colnames(subject_train) <- "subjectId"
      
      colnames(x_test) <- features[,2] 
      colnames(y_test) <- "activityId"
      colnames(subject_test) <- "subjectId"
      
      colnames(activityLabels) <- c('activityId','activityType')
# 	Merge all data into one set
	merged_training <- cbind(y_train, subject_train, x_train)
    merged_testing <- cbind(y_test, subject_test, x_test)
    allData <- rbind(merged_training, merged_testing)
	
# Step 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# 	Reading column names:
      colNames <- colnames(allData)
# Create mean and Standard deviation filter
mean_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) |grepl("mean.." , colNames) | 
                       grepl("std.." , colNames))

# Subset for mean and standard deviation
subsetMeanStd <- allData[ , mean_std == TRUE]

#Step 3.	Uses descriptive activity names to name the activities in the data set
setWithActivityNames <- merge(subsetMeanStd, activityLabels,
                                   by='activityId',
                                   all.x=TRUE)
								   
# Step 4.	Appropriately labels the data set with descriptive variable names.
# Done in previous steps 1 and 2

# Step 5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for # each activity and each subject.

	tidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
    tidySet <- tidySet[order(tidySet$subjectId, tidySet$activityId),]
	
	write.table(tidySet, "TidyDataSet.txt", row.name=FALSE)	
	
	  

	  
	  
	  
	  
	  
