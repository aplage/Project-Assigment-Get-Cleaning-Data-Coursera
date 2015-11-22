url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"


setwd("F:/vindo Apple/GCD/project")

# Loading needed packages

library(dplyr)

# Getting file

if(!file.exists("UCI HAR Dataset")) {
     temp <- tempfile()
     download.file(url,temp)
     unzip(temp)
     unlink(temp)
}


#  Getting Data

activity_labels <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/activity_labels.txt", 
                      header = FALSE)
     rename(activity_labels, CodeActivity = V1, Activity = V2) -> activity_labels

     
features <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/features.txt", 
                              header = FALSE)
     rename(features, features = V2) -> features

     
x_train <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/train/X_train.txt", 
                      header = FALSE)
#     names(x_train) <- features$features

     
y_train <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/train/y_train.txt", 
                      header = FALSE)
     rename(y_train, CodeActivity = V1) -> y_train
     left_join(y_train, activity_labels, by = "CodeActivity") -> y_train
     
subject_train <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/train/subject_train.txt", 
                      header = FALSE)
     rename(subject_train, Subject = V1) -> subject_train

     
x_test <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/test/X_test.txt", 
                      header = FALSE)
#     names(x_test) <- features$features
     
y_test <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/test/y_test.txt", 
                      header = FALSE)
     rename(y_test, CodeActivity = V1) -> y_test
     left_join(y_test, activity_labels, by = "CodeActivity") -> y_test

subject_test <- read.table("F:/vindo Apple/GCD/project/UCI HAR Dataset/test/subject_test.txt", 
                            header = FALSE)
     rename(subject_test, Subject = V1) -> subject_test

# Merging dataframes into test and train dataframes
     
test <- bind_cols(subject_test,y_test,x_test)
train <- bind_cols(subject_train,y_train,x_train)

# 1 Merging  the training and the test sets to create one data set.

testtrainfull <- union(test, train)

# Creating an index for selecting variables with mean or standard deviation. The 3 variables
# (subject, nlabel and label) from the other datsets were also included.

featureindex <-c(TRUE, TRUE, TRUE, grepl("[mM]ean|[sS][tT][dD]", features$features))


# 3 Creating descriptive activity names to name the activities in the data set

features[,2] <- gsub("\\()", "",features[,2])
features[,2] <- gsub("^t", "Time",features[,2])
features[,2] <- gsub("^f", "Freq",features[,2])
features[,2] <- gsub("^Jerk", "JerkSig",features[,2])
features[,2] <- gsub("mean", "Mean",features[,2])
features[,2] <- gsub("meanFreq", "WgthMeanFreq",features[,2])
features[,2] <- gsub("iqr", "IQRate",features[,2])
features[,2] <- gsub("max", "Max",features[,2])
features[,2] <- gsub("min", "Min",features[,2])
features[,2] <- gsub("std", "StD",features[,2])
features[,2] <- gsub("kurtosis", "Kurtosis",features[,2])
features[,2] <- gsub("skewness", "Skewness",features[,2])
features[,2] <- gsub("mad", "MedianAbsDev",features[,2])
features[,2] <- gsub("entropy", "Entropy",features[,2])
features[,2] <- gsub("energy", "Energy",features[,2])
features[,2] <- gsub("sma", "SigMagArea",features[,2])
features[,2] <- gsub("bands", "Bands",features[,2])
features[,2] <- gsub("-[xX]", "_X",features[,2])
features[,2] <- gsub("-[yY]", "_Y",features[,2])
features[,2] <- gsub("-[zZ]", "_Z",features[,2])
features[,2] <- gsub(",", "_",features[,2])
features[,2] <- gsub("angle", "AngleVectors",features[,2])
features[,2] <- gsub("gravity", "Gravity",features[,2])
features[,2] <- gsub("\\(t", "_Time",features[,2])
features[,2] <- gsub("arCoeff", "AutoRegCoeff",features[,2])
features[,2] <- gsub("y-", "y",features[,2])
features[,2] <- gsub("\\(", "_",features[,2])
features[,2] <- gsub(")", "",features[,2])
features[,2] <- gsub("-", "_",features[,2])


# 4 Appropriately labelling of the data set with descriptive variable names

variableNames <- c(names(testtrainfull)[1:3],features$features)
names(testtrainfull) <- variableNames


# 2 Extracting only the measurements on the mean and standard deviation for each measurement. 

testtrain <- testtrainfull[featureindex]

# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

testtrain %>% 
     mutate(SubjectActivity = interaction(Subject, Activity, drop = TRUE)) %>%
     select(-Subject, -CodeActivity, -Activity) %>% 
     group_by(SubjectActivity) %>% 
     summarize_each(funs(mean)) -> SubjectActivity
