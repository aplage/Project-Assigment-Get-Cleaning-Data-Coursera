# Code Book for Assignment of Getting and Cleaning Data on Coursera

A full description of the project could be found at the following link:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The URL for the data set came from the course page
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

After saving and reading the data to the computer, please, read the Readme.txt file.

The name of the variables in activity_labels.txt were changed to CodeActivity = V1, Activity = V2, when read.

the name of the variables in features.txt were changed to features = V2.

The names of the variables in y_train.txt" were changed to CodeActivity = V1.

The vectors y_train and activity_labels, were joined by the variable "CodeActivity") to y_train.
     
The namee of vaiables in subject_train.txt were changed to Subject = V1.

The name of variables in y_test.txt were changed to CodeActivity = V1.

The name of the variables in subject_test.txt were changed to Subject = V1.

The datasets were merged into test and train dataframes, and then the training and the test sets were merged to create one data set, the testtrainfull data set.

An index was created for selecting variables with mean or standard deviation. The 3 variables (Subject, CodeActivity and Activity) from the other datsets were also included in the vector featureindex.

Then, descriptive activity names were creted to name the activities in the data set. Their meanings are shown in the Varibles and Description section.

Appropriately labelling of the data set with descriptive variable names

variableNames <- c(names(testtrainfull)[1:3],features$features)
names(testtrainfull) <- variableNames


# 1b The Merged data set testtrainfull now has descriptive varible names.


# 2 Extracting only the measurements on the mean and standard deviation for each measurement. 

testtrain <- testtrainfull[featureindex]

# From the data set in step 4, a second, independent tidy data set was created
# with the average of each variable for each activity and each subject.

testtrain %>% 
     mutate(SubjectActivity = interaction(Subject, Activity, drop = TRUE)) %>%
     select(-Subject, -CodeActivity, -Activity) %>% 
     group_by(SubjectActivity) %>% 
     summarize_each(funs(mean)) -> SubjectActivity

# Saving the tidy data set created.

write.table(SubjectActivity, file = "SubjectActivity.txt", row.name=FALSE)

#end of the script

## Variables and Description

Variable"	"Description"
"Subject"	Subject who performed the activity for each window sample
"CodeActivity"	Code for the activities
"Activity"	Activities performed by the subjects
"TimeBodyAcc_Mean_X"	Time domain signals of Body linear acceleration  - Mean value  - X
"TimeBodyAcc_Mean_Y"	Time domain signals of Body linear acceleration  - Mean value  - Y
"TimeBodyAcc_Mean_Z"	Time domain signals of Body linear acceleration  - Mean value  - Z
"TimeBodyAcc_StD_X"	Time domain signals of Body linear acceleration  - Standard deviation  - X
"TimeBodyAcc_StD_Y"	Time domain signals of Body linear acceleration  - Standard deviation  - Y
"TimeBodyAcc_StD_Z"	Time domain signals of Body linear acceleration  - Standard deviation  - Z
"TimeBodyAcc_MedianAbsDev_X"	Time domain signals of Body linear acceleration  - Median absolute deviation - X
"TimeBodyAcc_MedianAbsDev_Y"	Time domain signals of Body linear acceleration  - Median absolute deviation - Y
"TimeBodyAcc_MedianAbsDev_Z"	Time domain signals of Body linear acceleration  - Median absolute deviation - Z
"TimeBodyAcc_Max_X"	Time domain signals of Body linear acceleration  - Largest value in array - X
"TimeBodyAcc_Max_Y"	Time domain signals of Body linear acceleration  - Largest value in array - Y
"TimeBodyAcc_Max_Z"	Time domain signals of Body linear acceleration  - Largest value in array - Z
"TimeBodyAcc_Min_X"	Time domain signals of Body linear acceleration  - Smallest value in array - X
"TimeBodyAcc_Min_Y"	Time domain signals of Body linear acceleration  - Smallest value in array - Y
"TimeBodyAcc_Min_Z"	Time domain signals of Body linear acceleration  - Smallest value in array - Z
"TimeBodyAcc_SigMagArea"	Time domain signals of Body linear acceleration  - Signal magnitude area
"TimeBodyAcc_Energy_X"	Time domain signals of Body linear acceleration  - Energy measure. Sum of the squares divided by the number of values.   - X
"TimeBodyAcc_Energy_Y"	Time domain signals of Body linear acceleration  - Energy measure. Sum of the squares divided by the number of values.   - Y
"TimeBodyAcc_Energy_Z"	Time domain signals of Body linear acceleration  - Energy measure. Sum of the squares divided by the number of values.   - Z
"TimeBodyAcc_IQRate_X"	Time domain signals of Body linear acceleration  - Interquartile range - X
"TimeBodyAcc_IQRate_Y"	Time domain signals of Body linear acceleration  - Interquartile range - Y
"TimeBodyAcc_IQRate_Z"	Time domain signals of Body linear acceleration  - Interquartile range - Z
"TimeBodyAcc_Entropy_X"	Time domain signals of Body linear acceleration  -  Signal entropy   - X
"TimeBodyAcc_Entropy_Y"	Time domain signals of Body linear acceleration  -  Signal entropy   - Y
"TimeBodyAcc_Entropy_Z"	Time domain signals of Body linear acceleration  -  Signal entropy   - Z
"TimeBodyAcc_AutoRegCoeff_X_1"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - X - 1
"TimeBodyAcc_AutoRegCoeff_X_2"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - X - 2
"TimeBodyAcc_AutoRegCoeff_X_3"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - X - 3
"TimeBodyAcc_AutoRegCoeff_X_4"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - X - 4
"TimeBodyAcc_AutoRegCoeff_Y_1"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Y - 1
"TimeBodyAcc_AutoRegCoeff_Y_2"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Y - 2
"TimeBodyAcc_AutoRegCoeff_Y_3"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Y - 3
"TimeBodyAcc_AutoRegCoeff_Y_4"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Y - 4
"TimeBodyAcc_AutoRegCoeff_Z_1"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Z - 1
"TimeBodyAcc_AutoRegCoeff_Z_2"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Z - 2
"TimeBodyAcc_AutoRegCoeff_Z_3"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Z - 3
"TimeBodyAcc_AutoRegCoeff_Z_4"	Time domain signals of Body linear acceleration  - Autorregresion coefficients with Burg order equal to 4   - Z - 4
"TimeBodyAcc_correlation_X_Y"	Time domain signals of Body linear acceleration  - correlation coefficient between two signals   - X - Y
"TimeBodyAcc_correlation_X_Z"	Time domain signals of Body linear acceleration  - correlation coefficient between two signals   - X - Z
"TimeBodyAcc_correlation_Y_Z"	Time domain signals of Body linear acceleration  - correlation coefficient between two signals   - Y - Z
"TimeGravityAcc_Mean_X"	Time domain signals of Gravity acceleration signal   - Mean value  - X
"TimeGravityAcc_Mean_Y"	Time domain signals of Gravity acceleration signal   - Mean value  - Y
"TimeGravityAcc_Mean_Z"	Time domain signals of Gravity acceleration signal   - Mean value  - Z
"TimeGravityAcc_StD_X"	Time domain signals of Gravity acceleration signal   - Standard deviation  - X
"TimeGravityAcc_StD_Y"	Time domain signals of Gravity acceleration signal   - Standard deviation  - Y
"TimeGravityAcc_StD_Z"	Time domain signals of Gravity acceleration signal   - Standard deviation  - Z
"TimeGravityAcc_MedianAbsDev_X"	Time domain signals of Gravity acceleration signal   - Median absolute deviation - X
"TimeGravityAcc_MedianAbsDev_Y"	Time domain signals of Gravity acceleration signal   - Median absolute deviation - Y
"TimeGravityAcc_MedianAbsDev_Z"	Time domain signals of Gravity acceleration signal   - Median absolute deviation - Z
"TimeGravityAcc_Max_X"	Time domain signals of Gravity acceleration signal   - Largest value in array - X
"TimeGravityAcc_Max_Y"	Time domain signals of Gravity acceleration signal   - Largest value in array - Y
"TimeGravityAcc_Max_Z"	Time domain signals of Gravity acceleration signal   - Largest value in array - Z
"TimeGravityAcc_Min_X"	Time domain signals of Gravity acceleration signal   - Smallest value in array - X
"TimeGravityAcc_Min_Y"	Time domain signals of Gravity acceleration signal   - Smallest value in array - Y
"TimeGravityAcc_Min_Z"	Time domain signals of Gravity acceleration signal   - Smallest value in array - Z
"TimeGravityAcc_SigMagArea"	Time domain signals of Gravity acceleration signal   - Signal magnitude area
"TimeGravityAcc_Energy_X"	Time domain signals of Gravity acceleration signal   - Energy measure. Sum of the squares divided by the number of values.   - X
"TimeGravityAcc_Energy_Y"	Time domain signals of Gravity acceleration signal   - Energy measure. Sum of the squares divided by the number of values.   - Y
"TimeGravityAcc_Energy_Z"	Time domain signals of Gravity acceleration signal   - Energy measure. Sum of the squares divided by the number of values.   - Z
"TimeGravityAcc_IQRate_X"	Time domain signals of Gravity acceleration signal   - Interquartile range - X
"TimeGravityAcc_IQRate_Y"	Time domain signals of Gravity acceleration signal   - Interquartile range - Y
"TimeGravityAcc_IQRate_Z"	Time domain signals of Gravity acceleration signal   - Interquartile range - Z
"TimeGravityAcc_Entropy_X"	Time domain signals of Gravity acceleration signal   -  Signal entropy   - X
"TimeGravityAcc_Entropy_Y"	Time domain signals of Gravity acceleration signal   -  Signal entropy   - Y
"TimeGravityAcc_Entropy_Z"	Time domain signals of Gravity acceleration signal   -  Signal entropy   - Z
"TimeGravityAcc_AutoRegCoeff_X_1"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - X - 1
"TimeGravityAcc_AutoRegCoeff_X_2"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - X - 2
"TimeGravityAcc_AutoRegCoeff_X_3"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - X - 3
"TimeGravityAcc_AutoRegCoeff_X_4"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - X - 4
"TimeGravityAcc_AutoRegCoeff_Y_1"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Y - 1
"TimeGravityAcc_AutoRegCoeff_Y_2"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Y - 2
"TimeGravityAcc_AutoRegCoeff_Y_3"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Y - 3
"TimeGravityAcc_AutoRegCoeff_Y_4"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Y - 4
"TimeGravityAcc_AutoRegCoeff_Z_1"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Z - 1
"TimeGravityAcc_AutoRegCoeff_Z_2"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Z - 2
"TimeGravityAcc_AutoRegCoeff_Z_3"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Z - 3
"TimeGravityAcc_AutoRegCoeff_Z_4"	Time domain signals of Gravity acceleration signal   - Autorregresion coefficients with Burg order equal to 4   - Z - 4
"TimeGravityAcc_correlation_X_Y"	Time domain signals of Gravity acceleration signal   - correlation coefficient between two signals   - X - Y
"TimeGravityAcc_correlation_X_Z"	Time domain signals of Gravity acceleration signal   - correlation coefficient between two signals   - X - Z
"TimeGravityAcc_correlation_Y_Z"	Time domain signals of Gravity acceleration signal   - correlation coefficient between two signals   - Y - Z
"TimeBodyAccJerk_Mean_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Mean value  - X
"TimeBodyAccJerk_Mean_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Mean value  - Y
"TimeBodyAccJerk_Mean_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Mean value  - Z
"TimeBodyAccJerk_StD_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Standard deviation  - X
"TimeBodyAccJerk_StD_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Standard deviation  - Y
"TimeBodyAccJerk_StD_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Standard deviation  - Z
"TimeBodyAccJerk_MedianAbsDev_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Median absolute deviation - X
"TimeBodyAccJerk_MedianAbsDev_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Median absolute deviation - Y
"TimeBodyAccJerk_MedianAbsDev_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Median absolute deviation - Z
"TimeBodyAccJerk_Max_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Largest value in array - X
"TimeBodyAccJerk_Max_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Largest value in array - Y
"TimeBodyAccJerk_Max_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Largest value in array - Z
"TimeBodyAccJerk_Min_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Smallest value in array - X
"TimeBodyAccJerk_Min_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Smallest value in array - Y
"TimeBodyAccJerk_Min_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Smallest value in array - Z
"TimeBodyAccJerk_SigMagArea"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Signal magnitude area
"TimeBodyAccJerk_Energy_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - X
"TimeBodyAccJerk_Energy_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - Y
"TimeBodyAccJerk_Energy_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - Z
"TimeBodyAccJerk_IQRate_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Interquartile range - X
"TimeBodyAccJerk_IQRate_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Interquartile range - Y
"TimeBodyAccJerk_IQRate_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Interquartile range - Z
"TimeBodyAccJerk_Entropy_X"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   -  Signal entropy   - X
"TimeBodyAccJerk_Entropy_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   -  Signal entropy   - Y
"TimeBodyAccJerk_Entropy_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   -  Signal entropy   - Z
"TimeBodyAccJerk_AutoRegCoeff_X_1"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 1
"TimeBodyAccJerk_AutoRegCoeff_X_2"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 2
"TimeBodyAccJerk_AutoRegCoeff_X_3"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 3
"TimeBodyAccJerk_AutoRegCoeff_X_4"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 4
"TimeBodyAccJerk_AutoRegCoeff_Y_1"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 1
"TimeBodyAccJerk_AutoRegCoeff_Y_2"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 2
"TimeBodyAccJerk_AutoRegCoeff_Y_3"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 3
"TimeBodyAccJerk_AutoRegCoeff_Y_4"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 4
"TimeBodyAccJerk_AutoRegCoeff_Z_1"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 1
"TimeBodyAccJerk_AutoRegCoeff_Z_2"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 2
"TimeBodyAccJerk_AutoRegCoeff_Z_3"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 3
"TimeBodyAccJerk_AutoRegCoeff_Z_4"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 4
"TimeBodyAccJerk_correlation_X_Y"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - correlation coefficient between two signals   - X - Y
"TimeBodyAccJerk_correlation_X_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - correlation coefficient between two signals   - X - Z
"TimeBodyAccJerk_correlation_Y_Z"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   - correlation coefficient between two signals   - Y - Z
"TimeBodyGyro_Mean_X"	Time domain signals of  Body linear acceleration and angular velocity   - Mean value  - X
"TimeBodyGyro_Mean_Y"	Time domain signals of  Body linear acceleration and angular velocity   - Mean value  - Y
"TimeBodyGyro_Mean_Z"	Time domain signals of  Body linear acceleration and angular velocity   - Mean value  - Z
"TimeBodyGyro_StD_X"	Time domain signals of  Body linear acceleration and angular velocity   - Standard deviation  - X
"TimeBodyGyro_StD_Y"	Time domain signals of  Body linear acceleration and angular velocity   - Standard deviation  - Y
"TimeBodyGyro_StD_Z"	Time domain signals of  Body linear acceleration and angular velocity   - Standard deviation  - Z
"TimeBodyGyro_MedianAbsDev_X"	Time domain signals of  Body linear acceleration and angular velocity   - Median absolute deviation - X
"TimeBodyGyro_MedianAbsDev_Y"	Time domain signals of  Body linear acceleration and angular velocity   - Median absolute deviation - Y
"TimeBodyGyro_MedianAbsDev_Z"	Time domain signals of  Body linear acceleration and angular velocity   - Median absolute deviation - Z
"TimeBodyGyro_Max_X"	Time domain signals of  Body linear acceleration and angular velocity   - Largest value in array - X
"TimeBodyGyro_Max_Y"	Time domain signals of  Body linear acceleration and angular velocity   - Largest value in array - Y
"TimeBodyGyro_Max_Z"	Time domain signals of  Body linear acceleration and angular velocity   - Largest value in array - Z
"TimeBodyGyro_Min_X"	Time domain signals of  Body linear acceleration and angular velocity   - Smallest value in array - X
"TimeBodyGyro_Min_Y"	Time domain signals of  Body linear acceleration and angular velocity   - Smallest value in array - Y
"TimeBodyGyro_Min_Z"	Time domain signals of  Body linear acceleration and angular velocity   - Smallest value in array - Z
"TimeBodyGyro_SigMagArea"	Time domain signals of  Body linear acceleration and angular velocity   - Signal magnitude area
"TimeBodyGyro_Energy_X"	Time domain signals of  Body linear acceleration and angular velocity   - Energy measure. Sum of the squares divided by the number of values.   - X
"TimeBodyGyro_Energy_Y"	Time domain signals of  Body linear acceleration and angular velocity   - Energy measure. Sum of the squares divided by the number of values.   - Y
"TimeBodyGyro_Energy_Z"	Time domain signals of  Body linear acceleration and angular velocity   - Energy measure. Sum of the squares divided by the number of values.   - Z
"TimeBodyGyro_IQRate_X"	Time domain signals of  Body linear acceleration and angular velocity   - Interquartile range - X
"TimeBodyGyro_IQRate_Y"	Time domain signals of  Body linear acceleration and angular velocity   - Interquartile range - Y
"TimeBodyGyro_IQRate_Z"	Time domain signals of  Body linear acceleration and angular velocity   - Interquartile range - Z
"TimeBodyGyro_Entropy_X"	Time domain signals of  Body linear acceleration and angular velocity   -  Signal entropy   - X
"TimeBodyGyro_Entropy_Y"	Time domain signals of  Body linear acceleration and angular velocity   -  Signal entropy   - Y
"TimeBodyGyro_Entropy_Z"	Time domain signals of  Body linear acceleration and angular velocity   -  Signal entropy   - Z
"TimeBodyGyro_AutoRegCoeff_X_1"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - X - 1
"TimeBodyGyro_AutoRegCoeff_X_2"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - X - 2
"TimeBodyGyro_AutoRegCoeff_X_3"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - X - 3
"TimeBodyGyro_AutoRegCoeff_X_4"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - X - 4
"TimeBodyGyro_AutoRegCoeff_Y_1"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Y - 1
"TimeBodyGyro_AutoRegCoeff_Y_2"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Y - 2
"TimeBodyGyro_AutoRegCoeff_Y_3"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Y - 3
"TimeBodyGyro_AutoRegCoeff_Y_4"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Y - 4
"TimeBodyGyro_AutoRegCoeff_Z_1"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Z - 1
"TimeBodyGyro_AutoRegCoeff_Z_2"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Z - 2
"TimeBodyGyro_AutoRegCoeff_Z_3"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Z - 3
"TimeBodyGyro_AutoRegCoeff_Z_4"	Time domain signals of  Body linear acceleration and angular velocity   - Autorregresion coefficients with Burg order equal to 4   - Z - 4
"TimeBodyGyro_correlation_X_Y"	Time domain signals of  Body linear acceleration and angular velocity   - correlation coefficient between two signals   - X - Y
"TimeBodyGyro_correlation_X_Z"	Time domain signals of  Body linear acceleration and angular velocity   - correlation coefficient between two signals   - X - Z
"TimeBodyGyro_correlation_Y_Z"	Time domain signals of  Body linear acceleration and angular velocity   - correlation coefficient between two signals   - Y - Z
"TimeBodyGyroJerk_Mean_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Mean value  - X
"TimeBodyGyroJerk_Mean_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Mean value  - Y
"TimeBodyGyroJerk_Mean_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Mean value  - Z
"TimeBodyGyroJerk_StD_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Standard deviation  - X
"TimeBodyGyroJerk_StD_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Standard deviation  - Y
"TimeBodyGyroJerk_StD_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Standard deviation  - Z
"TimeBodyGyroJerk_MedianAbsDev_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Median absolute deviation - X
"TimeBodyGyroJerk_MedianAbsDev_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Median absolute deviation - Y
"TimeBodyGyroJerk_MedianAbsDev_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Median absolute deviation - Z
"TimeBodyGyroJerk_Max_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Largest value in array - X
"TimeBodyGyroJerk_Max_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Largest value in array - Y
"TimeBodyGyroJerk_Max_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Largest value in array - Z
"TimeBodyGyroJerk_Min_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Smallest value in array - X
"TimeBodyGyroJerk_Min_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Smallest value in array - Y
"TimeBodyGyroJerk_Min_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Smallest value in array - Z
"TimeBodyGyroJerk_SigMagArea"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Signal magnitude area
"TimeBodyGyroJerk_Energy_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - X
"TimeBodyGyroJerk_Energy_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - Y
"TimeBodyGyroJerk_Energy_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - Z
"TimeBodyGyroJerk_IQRate_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Interquartile range - X
"TimeBodyGyroJerk_IQRate_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Interquartile range - Y
"TimeBodyGyroJerk_IQRate_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Interquartile range - Z
"TimeBodyGyroJerk_Entropy_X"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   -  Signal entropy   - X
"TimeBodyGyroJerk_Entropy_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   -  Signal entropy   - Y
"TimeBodyGyroJerk_Entropy_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   -  Signal entropy   - Z
"TimeBodyGyroJerk_AutoRegCoeff_X_1"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 1
"TimeBodyGyroJerk_AutoRegCoeff_X_2"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 2
"TimeBodyGyroJerk_AutoRegCoeff_X_3"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 3
"TimeBodyGyroJerk_AutoRegCoeff_X_4"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - X - 4
"TimeBodyGyroJerk_AutoRegCoeff_Y_1"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 1
"TimeBodyGyroJerk_AutoRegCoeff_Y_2"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 2
"TimeBodyGyroJerk_AutoRegCoeff_Y_3"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 3
"TimeBodyGyroJerk_AutoRegCoeff_Y_4"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Y - 4
"TimeBodyGyroJerk_AutoRegCoeff_Z_1"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 1
"TimeBodyGyroJerk_AutoRegCoeff_Z_2"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 2
"TimeBodyGyroJerk_AutoRegCoeff_Z_3"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 3
"TimeBodyGyroJerk_AutoRegCoeff_Z_4"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - Autorregresion coefficients with Burg order equal to 4   - Z - 4
"TimeBodyGyroJerk_correlation_X_Y"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - correlation coefficient between two signals   - X - Y
"TimeBodyGyroJerk_correlation_X_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - correlation coefficient between two signals   - X - Z
"TimeBodyGyroJerk_correlation_Y_Z"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   - correlation coefficient between two signals   - Y - Z
"TimeBodyAccMag_Mean"	Time domain signals of Body linear acceleration  magnitude - Mean value 
"TimeBodyAccMag_StD"	Time domain signals of Body linear acceleration  magnitude - Standard deviation 
"TimeBodyAccMag_MedianAbsDev"	Time domain signals of Body linear acceleration  magnitude - Median absolute deviation
"TimeBodyAccMag_Max"	Time domain signals of Body linear acceleration  magnitude - Largest value in array
"TimeBodyAccMag_Min"	Time domain signals of Body linear acceleration  magnitude - Smallest value in array
"TimeBodyAccMag_SigMagArea"	Time domain signals of Body linear acceleration  magnitude - Signal magnitude area
"TimeBodyAccMag_Energy"	Time domain signals of Body linear acceleration  magnitude - Energy measure. Sum of the squares divided by the number of values.  
"TimeBodyAccMag_IQRate"	Time domain signals of Body linear acceleration  magnitude - Interquartile range
"TimeBodyAccMag_Entropy"	Time domain signals of Body linear acceleration  magnitude -  Signal entropy  
"TimeBodyAccMag_AutoRegCoeff1"	Time domain signals of Body linear acceleration  magnitude - Autorregresion coefficients with Burg order equal to 4  1
"TimeBodyAccMag_AutoRegCoeff2"	Time domain signals of Body linear acceleration  magnitude - Autorregresion coefficients with Burg order equal to 4  2
"TimeBodyAccMag_AutoRegCoeff3"	Time domain signals of Body linear acceleration  magnitude - Autorregresion coefficients with Burg order equal to 4  3
"TimeBodyAccMag_AutoRegCoeff4"	Time domain signals of Body linear acceleration  magnitude - Autorregresion coefficients with Burg order equal to 4  4
"TimeGravityAccMag_Mean"	Time domain signals of Gravity acceleration signal   magnitude - Mean value 
"TimeGravityAccMag_StD"	Time domain signals of Gravity acceleration signal   magnitude - Standard deviation 
"TimeGravityAccMag_MedianAbsDev"	Time domain signals of Gravity acceleration signal   magnitude - Median absolute deviation
"TimeGravityAccMag_Max"	Time domain signals of Gravity acceleration signal   magnitude - Largest value in array
"TimeGravityAccMag_Min"	Time domain signals of Gravity acceleration signal   magnitude - Smallest value in array
"TimeGravityAccMag_SigMagArea"	Time domain signals of Gravity acceleration signal   magnitude - Signal magnitude area
"TimeGravityAccMag_Energy"	Time domain signals of Gravity acceleration signal   magnitude - Energy measure. Sum of the squares divided by the number of values.  
"TimeGravityAccMag_IQRate"	Time domain signals of Gravity acceleration signal   magnitude - Interquartile range
"TimeGravityAccMag_Entropy"	Time domain signals of Gravity acceleration signal   magnitude -  Signal entropy  
"TimeGravityAccMag_AutoRegCoeff1"	Time domain signals of Gravity acceleration signal   magnitude - Autorregresion coefficients with Burg order equal to 4  1
"TimeGravityAccMag_AutoRegCoeff2"	Time domain signals of Gravity acceleration signal   magnitude - Autorregresion coefficients with Burg order equal to 4  2
"TimeGravityAccMag_AutoRegCoeff3"	Time domain signals of Gravity acceleration signal   magnitude - Autorregresion coefficients with Burg order equal to 4  3
"TimeGravityAccMag_AutoRegCoeff4"	Time domain signals of Gravity acceleration signal   magnitude - Autorregresion coefficients with Burg order equal to 4  4
"TimeBodyAccJerkMag_Mean"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Mean value 
"TimeBodyAccJerkMag_StD"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Standard deviation 
"TimeBodyAccJerkMag_MedianAbsDev"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Median absolute deviation
"TimeBodyAccJerkMag_Max"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Largest value in array
"TimeBodyAccJerkMag_Min"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Smallest value in array
"TimeBodyAccJerkMag_SigMagArea"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Signal magnitude area
"TimeBodyAccJerkMag_Energy"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Energy measure. Sum of the squares divided by the number of values.  
"TimeBodyAccJerkMag_IQRate"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Interquartile range
"TimeBodyAccJerkMag_Entropy"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude -  Signal entropy  
"TimeBodyAccJerkMag_AutoRegCoeff1"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  1
"TimeBodyAccJerkMag_AutoRegCoeff2"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  2
"TimeBodyAccJerkMag_AutoRegCoeff3"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  3
"TimeBodyAccJerkMag_AutoRegCoeff4"	Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  4
"TimeBodyGyroMag_Mean"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Mean value 
"TimeBodyGyroMag_StD"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Standard deviation 
"TimeBodyGyroMag_MedianAbsDev"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Median absolute deviation
"TimeBodyGyroMag_Max"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Largest value in array
"TimeBodyGyroMag_Min"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Smallest value in array
"TimeBodyGyroMag_SigMagArea"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Signal magnitude area
"TimeBodyGyroMag_Energy"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Energy measure. Sum of the squares divided by the number of values.  
"TimeBodyGyroMag_IQRate"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Interquartile range
"TimeBodyGyroMag_Entropy"	Time domain signals of  Body linear acceleration and angular velocity   magnitude -  Signal entropy  
"TimeBodyGyroMag_AutoRegCoeff1"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Autorregresion coefficients with Burg order equal to 4  1
"TimeBodyGyroMag_AutoRegCoeff2"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Autorregresion coefficients with Burg order equal to 4  2
"TimeBodyGyroMag_AutoRegCoeff3"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Autorregresion coefficients with Burg order equal to 4  3
"TimeBodyGyroMag_AutoRegCoeff4"	Time domain signals of  Body linear acceleration and angular velocity   magnitude - Autorregresion coefficients with Burg order equal to 4  4
"TimeBodyGyroJerkMag_Mean"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Mean value 
"TimeBodyGyroJerkMag_StD"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Standard deviation 
"TimeBodyGyroJerkMag_MedianAbsDev"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Median absolute deviation
"TimeBodyGyroJerkMag_Max"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Largest value in array
"TimeBodyGyroJerkMag_Min"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Smallest value in array
"TimeBodyGyroJerkMag_SigMagArea"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Signal magnitude area
"TimeBodyGyroJerkMag_Energy"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Energy measure. Sum of the squares divided by the number of values.  
"TimeBodyGyroJerkMag_IQRate"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Interquartile range
"TimeBodyGyroJerkMag_Entropy"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude -  Signal entropy  
"TimeBodyGyroJerkMag_AutoRegCoeff1"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  1
"TimeBodyGyroJerkMag_AutoRegCoeff2"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  2
"TimeBodyGyroJerkMag_AutoRegCoeff3"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  3
"TimeBodyGyroJerkMag_AutoRegCoeff4"	Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Autorregresion coefficients with Burg order equal to 4  4
"FreqBodyAcc_Mean_X"	 Frequency of Body  linear acceleration  - Mean value  - X
"FreqBodyAcc_Mean_Y"	 Frequency of Body  linear acceleration  - Mean value  - Y
"FreqBodyAcc_Mean_Z"	 Frequency of Body  linear acceleration  - Mean value  - Z
"FreqBodyAcc_StD_X"	 Frequency of Body  linear acceleration  - Standard deviation  - X
"FreqBodyAcc_StD_Y"	 Frequency of Body  linear acceleration  - Standard deviation  - Y
"FreqBodyAcc_StD_Z"	 Frequency of Body  linear acceleration  - Standard deviation  - Z
"FreqBodyAcc_MedianAbsDev_X"	 Frequency of Body  linear acceleration  - Median absolute deviation - X
"FreqBodyAcc_MedianAbsDev_Y"	 Frequency of Body  linear acceleration  - Median absolute deviation - Y
"FreqBodyAcc_MedianAbsDev_Z"	 Frequency of Body  linear acceleration  - Median absolute deviation - Z
"FreqBodyAcc_Max_X"	 Frequency of Body  linear acceleration  - Largest value in array - X
"FreqBodyAcc_Max_Y"	 Frequency of Body  linear acceleration  - Largest value in array - Y
"FreqBodyAcc_Max_Z"	 Frequency of Body  linear acceleration  - Largest value in array - Z
"FreqBodyAcc_Min_X"	 Frequency of Body  linear acceleration  - Smallest value in array - X
"FreqBodyAcc_Min_Y"	 Frequency of Body  linear acceleration  - Smallest value in array - Y
"FreqBodyAcc_Min_Z"	 Frequency of Body  linear acceleration  - Smallest value in array - Z
"FreqBodyAcc_SigMagArea"	 Frequency of Body  linear acceleration  - Signal magnitude area
"FreqBodyAcc_Energy_X"	 Frequency of Body  linear acceleration  - Energy measure. Sum of the squares divided by the number of values.   - X
"FreqBodyAcc_Energy_Y"	 Frequency of Body  linear acceleration  - Energy measure. Sum of the squares divided by the number of values.   - Y
"FreqBodyAcc_Energy_Z"	 Frequency of Body  linear acceleration  - Energy measure. Sum of the squares divided by the number of values.   - Z
"FreqBodyAcc_IQRate_X"	 Frequency of Body  linear acceleration  - Interquartile range - X
"FreqBodyAcc_IQRate_Y"	 Frequency of Body  linear acceleration  - Interquartile range - Y
"FreqBodyAcc_IQRate_Z"	 Frequency of Body  linear acceleration  - Interquartile range - Z
"FreqBodyAcc_Entropy_X"	 Frequency of Body  linear acceleration  -  Signal entropy   - X
"FreqBodyAcc_Entropy_Y"	 Frequency of Body  linear acceleration  -  Signal entropy   - Y
"FreqBodyAcc_Entropy_Z"	 Frequency of Body  linear acceleration  -  Signal entropy   - Z
"FreqBodyAcc_MaxInds_X"	 Frequency of Body  linear acceleration  - Largest value in  array indexs - X
"FreqBodyAcc_MaxInds_Y"	 Frequency of Body  linear acceleration  - Largest value in  array indexs - Y
"FreqBodyAcc_MaxInds_Z"	 Frequency of Body  linear acceleration  - Largest value in  array indexs - Z
"FreqBodyAcc_MeanFreq_X"	 Frequency of Body  linear acceleration  - Mean value Frequency  - X
"FreqBodyAcc_MeanFreq_Y"	 Frequency of Body  linear acceleration  - Mean value Frequency  - Y
"FreqBodyAcc_MeanFreq_Z"	 Frequency of Body  linear acceleration  - Mean value Frequency  - Z
"FreqBodyAcc_Skewness_X"	 Frequency of Body  linear acceleration  -  skewness of the frequency domain signal   - X
"FreqBodyAcc_Kurtosis_X"	 Frequency of Body  linear acceleration  -   kurtosis of the frequency domain signal   - X
"FreqBodyAcc_Skewness_Y"	 Frequency of Body  linear acceleration  -  skewness of the frequency domain signal   - Y
"FreqBodyAcc_Kurtosis_Y"	 Frequency of Body  linear acceleration  -   kurtosis of the frequency domain signal   - Y
"FreqBodyAcc_Skewness_Z"	 Frequency of Body  linear acceleration  -  skewness of the frequency domain signal   - Z
"FreqBodyAcc_Kurtosis_Z"	 Frequency of Body  linear acceleration  -   kurtosis of the frequency domain signal   - Z
"FreqBodyAcc_BandsEnergy1_8"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyAcc_BandsEnergy9_16"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyAcc_BandsEnergy17_24"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyAcc_BandsEnergy25_32"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyAcc_BandsEnergy33_40"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyAcc_BandsEnergy41_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyAcc_BandsEnergy49_56"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyAcc_BandsEnergy57_64"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyAcc_BandsEnergy1_16"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyAcc_BandsEnergy17_32"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyAcc_BandsEnergy33_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyAcc_BandsEnergy49_64"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyAcc_BandsEnergy1_24"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyAcc_BandsEnergy25_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyAcc_BandsEnergy1_8"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyAcc_BandsEnergy9_16"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyAcc_BandsEnergy17_24"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyAcc_BandsEnergy25_32"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyAcc_BandsEnergy33_40"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyAcc_BandsEnergy41_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyAcc_BandsEnergy49_56"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyAcc_BandsEnergy57_64"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyAcc_BandsEnergy1_16"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyAcc_BandsEnergy17_32"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyAcc_BandsEnergy33_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyAcc_BandsEnergy49_64"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyAcc_BandsEnergy1_24"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyAcc_BandsEnergy25_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyAcc_BandsEnergy1_8"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyAcc_BandsEnergy9_16"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyAcc_BandsEnergy17_24"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyAcc_BandsEnergy25_32"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyAcc_BandsEnergy33_40"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyAcc_BandsEnergy41_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyAcc_BandsEnergy49_56"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyAcc_BandsEnergy57_64"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyAcc_BandsEnergy1_16"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyAcc_BandsEnergy17_32"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyAcc_BandsEnergy33_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyAcc_BandsEnergy49_64"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyAcc_BandsEnergy1_24"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyAcc_BandsEnergy25_48"	 Frequency of Body  linear acceleration  -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyAccJerk_Mean_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Mean value  - X
"FreqBodyAccJerk_Mean_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Mean value  - Y
"FreqBodyAccJerk_Mean_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Mean value  - Z
"FreqBodyAccJerk_StD_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Standard deviation  - X
"FreqBodyAccJerk_StD_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Standard deviation  - Y
"FreqBodyAccJerk_StD_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Standard deviation  - Z
"FreqBodyAccJerk_MedianAbsDev_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Median absolute deviation - X
"FreqBodyAccJerk_MedianAbsDev_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Median absolute deviation - Y
"FreqBodyAccJerk_MedianAbsDev_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Median absolute deviation - Z
"FreqBodyAccJerk_Max_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Largest value in array - X
"FreqBodyAccJerk_Max_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Largest value in array - Y
"FreqBodyAccJerk_Max_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Largest value in array - Z
"FreqBodyAccJerk_Min_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Smallest value in array - X
"FreqBodyAccJerk_Min_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Smallest value in array - Y
"FreqBodyAccJerk_Min_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Smallest value in array - Z
"FreqBodyAccJerk_SigMagArea"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Signal magnitude area
"FreqBodyAccJerk_Energy_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - X
"FreqBodyAccJerk_Energy_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - Y
"FreqBodyAccJerk_Energy_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Energy measure. Sum of the squares divided by the number of values.   - Z
"FreqBodyAccJerk_IQRate_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Interquartile range - X
"FreqBodyAccJerk_IQRate_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Interquartile range - Y
"FreqBodyAccJerk_IQRate_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Interquartile range - Z
"FreqBodyAccJerk_Entropy_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -  Signal entropy   - X
"FreqBodyAccJerk_Entropy_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -  Signal entropy   - Y
"FreqBodyAccJerk_Entropy_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -  Signal entropy   - Z
"FreqBodyAccJerk_MaxInds_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Largest value in  array indexs - X
"FreqBodyAccJerk_MaxInds_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Largest value in  array indexs - Y
"FreqBodyAccJerk_MaxInds_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Largest value in  array indexs - Z
"FreqBodyAccJerk_MeanFreq_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Mean value Frequency  - X
"FreqBodyAccJerk_MeanFreq_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Mean value Frequency  - Y
"FreqBodyAccJerk_MeanFreq_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   - Mean value Frequency  - Z
"FreqBodyAccJerk_Skewness_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -  skewness of the frequency domain signal   - X
"FreqBodyAccJerk_Kurtosis_X"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   kurtosis of the frequency domain signal   - X
"FreqBodyAccJerk_Skewness_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -  skewness of the frequency domain signal   - Y
"FreqBodyAccJerk_Kurtosis_Y"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   kurtosis of the frequency domain signal   - Y
"FreqBodyAccJerk_Skewness_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -  skewness of the frequency domain signal   - Z
"FreqBodyAccJerk_Kurtosis_Z"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   kurtosis of the frequency domain signal   - Z
"FreqBodyAccJerk_BandsEnergy1_8"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyAccJerk_BandsEnergy9_16"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyAccJerk_BandsEnergy17_24"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyAccJerk_BandsEnergy25_32"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyAccJerk_BandsEnergy33_40"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyAccJerk_BandsEnergy41_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyAccJerk_BandsEnergy49_56"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyAccJerk_BandsEnergy57_64"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyAccJerk_BandsEnergy1_16"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyAccJerk_BandsEnergy17_32"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyAccJerk_BandsEnergy33_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyAccJerk_BandsEnergy49_64"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyAccJerk_BandsEnergy1_24"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyAccJerk_BandsEnergy25_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyAccJerk_BandsEnergy1_8"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyAccJerk_BandsEnergy9_16"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyAccJerk_BandsEnergy17_24"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyAccJerk_BandsEnergy25_32"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyAccJerk_BandsEnergy33_40"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyAccJerk_BandsEnergy41_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyAccJerk_BandsEnergy49_56"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyAccJerk_BandsEnergy57_64"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyAccJerk_BandsEnergy1_16"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyAccJerk_BandsEnergy17_32"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyAccJerk_BandsEnergy33_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyAccJerk_BandsEnergy49_64"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyAccJerk_BandsEnergy1_24"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyAccJerk_BandsEnergy25_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyAccJerk_BandsEnergy1_8"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyAccJerk_BandsEnergy9_16"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyAccJerk_BandsEnergy17_24"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyAccJerk_BandsEnergy25_32"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyAccJerk_BandsEnergy33_40"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyAccJerk_BandsEnergy41_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyAccJerk_BandsEnergy49_56"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyAccJerk_BandsEnergy57_64"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyAccJerk_BandsEnergy1_16"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyAccJerk_BandsEnergy17_32"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyAccJerk_BandsEnergy33_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyAccJerk_BandsEnergy49_64"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyAccJerk_BandsEnergy1_24"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyAccJerk_BandsEnergy25_48"	 Frequency of Body  linear acceleration  derived in time to obtain Jerk signals   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyGyro_Mean_X"	Frequency  Body linear acceleration and angular velocity   - Mean value  - X
"FreqBodyGyro_Mean_Y"	Frequency  Body linear acceleration and angular velocity   - Mean value  - Y
"FreqBodyGyro_Mean_Z"	Frequency  Body linear acceleration and angular velocity   - Mean value  - Z
"FreqBodyGyro_StD_X"	Frequency  Body linear acceleration and angular velocity   - Standard deviation  - X
"FreqBodyGyro_StD_Y"	Frequency  Body linear acceleration and angular velocity   - Standard deviation  - Y
"FreqBodyGyro_StD_Z"	Frequency  Body linear acceleration and angular velocity   - Standard deviation  - Z
"FreqBodyGyro_MedianAbsDev_X"	Frequency  Body linear acceleration and angular velocity   - Median absolute deviation - X
"FreqBodyGyro_MedianAbsDev_Y"	Frequency  Body linear acceleration and angular velocity   - Median absolute deviation - Y
"FreqBodyGyro_MedianAbsDev_Z"	Frequency  Body linear acceleration and angular velocity   - Median absolute deviation - Z
"FreqBodyGyro_Max_X"	Frequency  Body linear acceleration and angular velocity   - Largest value in array - X
"FreqBodyGyro_Max_Y"	Frequency  Body linear acceleration and angular velocity   - Largest value in array - Y
"FreqBodyGyro_Max_Z"	Frequency  Body linear acceleration and angular velocity   - Largest value in array - Z
"FreqBodyGyro_Min_X"	Frequency  Body linear acceleration and angular velocity   - Smallest value in array - X
"FreqBodyGyro_Min_Y"	Frequency  Body linear acceleration and angular velocity   - Smallest value in array - Y
"FreqBodyGyro_Min_Z"	Frequency  Body linear acceleration and angular velocity   - Smallest value in array - Z
"FreqBodyGyro_SigMagArea"	Frequency  Body linear acceleration and angular velocity   - Signal magnitude area
"FreqBodyGyro_Energy_X"	Frequency  Body linear acceleration and angular velocity   - Energy measure. Sum of the squares divided by the number of values.   - X
"FreqBodyGyro_Energy_Y"	Frequency  Body linear acceleration and angular velocity   - Energy measure. Sum of the squares divided by the number of values.   - Y
"FreqBodyGyro_Energy_Z"	Frequency  Body linear acceleration and angular velocity   - Energy measure. Sum of the squares divided by the number of values.   - Z
"FreqBodyGyro_IQRate_X"	Frequency  Body linear acceleration and angular velocity   - Interquartile range - X
"FreqBodyGyro_IQRate_Y"	Frequency  Body linear acceleration and angular velocity   - Interquartile range - Y
"FreqBodyGyro_IQRate_Z"	Frequency  Body linear acceleration and angular velocity   - Interquartile range - Z
"FreqBodyGyro_Entropy_X"	Frequency  Body linear acceleration and angular velocity   -  Signal entropy   - X
"FreqBodyGyro_Entropy_Y"	Frequency  Body linear acceleration and angular velocity   -  Signal entropy   - Y
"FreqBodyGyro_Entropy_Z"	Frequency  Body linear acceleration and angular velocity   -  Signal entropy   - Z
"FreqBodyGyro_MaxInds_X"	Frequency  Body linear acceleration and angular velocity   - Largest value in  array indexs - X
"FreqBodyGyro_MaxInds_Y"	Frequency  Body linear acceleration and angular velocity   - Largest value in  array indexs - Y
"FreqBodyGyro_MaxInds_Z"	Frequency  Body linear acceleration and angular velocity   - Largest value in  array indexs - Z
"FreqBodyGyro_MeanFreq_X"	Frequency  Body linear acceleration and angular velocity   - Mean value Frequency  - X
"FreqBodyGyro_MeanFreq_Y"	Frequency  Body linear acceleration and angular velocity   - Mean value Frequency  - Y
"FreqBodyGyro_MeanFreq_Z"	Frequency  Body linear acceleration and angular velocity   - Mean value Frequency  - Z
"FreqBodyGyro_Skewness_X"	Frequency  Body linear acceleration and angular velocity   -  skewness of the frequency domain signal   - X
"FreqBodyGyro_Kurtosis_X"	Frequency  Body linear acceleration and angular velocity   -   kurtosis of the frequency domain signal   - X
"FreqBodyGyro_Skewness_Y"	Frequency  Body linear acceleration and angular velocity   -  skewness of the frequency domain signal   - Y
"FreqBodyGyro_Kurtosis_Y"	Frequency  Body linear acceleration and angular velocity   -   kurtosis of the frequency domain signal   - Y
"FreqBodyGyro_Skewness_Z"	Frequency  Body linear acceleration and angular velocity   -  skewness of the frequency domain signal   - Z
"FreqBodyGyro_Kurtosis_Z"	Frequency  Body linear acceleration and angular velocity   -   kurtosis of the frequency domain signal   - Z
"FreqBodyGyro_BandsEnergy1_8"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyGyro_BandsEnergy9_16"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyGyro_BandsEnergy17_24"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyGyro_BandsEnergy25_32"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyGyro_BandsEnergy33_40"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyGyro_BandsEnergy41_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyGyro_BandsEnergy49_56"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyGyro_BandsEnergy57_64"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyGyro_BandsEnergy1_16"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyGyro_BandsEnergy17_32"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyGyro_BandsEnergy33_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyGyro_BandsEnergy49_64"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyGyro_BandsEnergy1_24"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyGyro_BandsEnergy25_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyGyro_BandsEnergy1_8"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyGyro_BandsEnergy9_16"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyGyro_BandsEnergy17_24"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyGyro_BandsEnergy25_32"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyGyro_BandsEnergy33_40"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyGyro_BandsEnergy41_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyGyro_BandsEnergy49_56"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyGyro_BandsEnergy57_64"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyGyro_BandsEnergy1_16"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyGyro_BandsEnergy17_32"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyGyro_BandsEnergy33_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyGyro_BandsEnergy49_64"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyGyro_BandsEnergy1_24"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyGyro_BandsEnergy25_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyGyro_BandsEnergy1_8"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 8
"FreqBodyGyro_BandsEnergy9_16"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  9 - 16
"FreqBodyGyro_BandsEnergy17_24"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 24
"FreqBodyGyro_BandsEnergy25_32"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 32
"FreqBodyGyro_BandsEnergy33_40"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 40
"FreqBodyGyro_BandsEnergy41_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  41 - 48
"FreqBodyGyro_BandsEnergy49_56"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 56
"FreqBodyGyro_BandsEnergy57_64"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  57 - 64
"FreqBodyGyro_BandsEnergy1_16"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 16
"FreqBodyGyro_BandsEnergy17_32"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  17 - 32
"FreqBodyGyro_BandsEnergy33_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  33 - 48
"FreqBodyGyro_BandsEnergy49_64"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  49 - 64
"FreqBodyGyro_BandsEnergy1_24"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  1 - 24
"FreqBodyGyro_BandsEnergy25_48"	Frequency  Body linear acceleration and angular velocity   -   Energy of a frequency interval within the 64 bins of the FFT of each window.  25 - 48
"FreqBodyAccMag_Mean"	 Frequency of Body  linear acceleration  magnitude - Mean value 
"FreqBodyAccMag_StD"	 Frequency of Body  linear acceleration  magnitude - Standard deviation 
"FreqBodyAccMag_MedianAbsDev"	 Frequency of Body  linear acceleration  magnitude - Median absolute deviation
"FreqBodyAccMag_Max"	 Frequency of Body  linear acceleration  magnitude - Largest value in array
"FreqBodyAccMag_Min"	 Frequency of Body  linear acceleration  magnitude - Smallest value in array
"FreqBodyAccMag_SigMagArea"	 Frequency of Body  linear acceleration  magnitude - Signal magnitude area
"FreqBodyAccMag_Energy"	 Frequency of Body  linear acceleration  magnitude - Energy measure. Sum of the squares divided by the number of values.  
"FreqBodyAccMag_IQRate"	 Frequency of Body  linear acceleration  magnitude - Interquartile range
"FreqBodyAccMag_Entropy"	 Frequency of Body  linear acceleration  magnitude -  Signal entropy  
"FreqBodyAccMag_MaxInds"	 Frequency of Body  linear acceleration  magnitude - Largest value in  array indexs
"FreqBodyAccMag_MeanFreq"	 Frequency of Body  linear acceleration  magnitude - Mean value Freq
"FreqBodyAccMag_Skewness"	 Frequency of Body  linear acceleration  magnitude -  skewness of the frequency domain signal  
"FreqBodyAccMag_Kurtosis"	 Frequency of Body  linear acceleration  magnitude -   kurtosis of the frequency domain signal  
"FreqBodyBodyAccJerkMag_Mean"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Mean value 
"FreqBodyBodyAccJerkMag_StD"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Standard deviation 
"FreqBodyBodyAccJerkMag_MedianAbsDev"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Median absolute deviation
"FreqBodyBodyAccJerkMag_Max"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Largest value in array
"FreqBodyBodyAccJerkMag_Min"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Smallest value in array
"FreqBodyBodyAccJerkMag_SigMagArea"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Signal magnitude area
"FreqBodyBodyAccJerkMag_Energy"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Energy measure. Sum of the squares divided by the number of values.  
"FreqBodyBodyAccJerkMag_IQRate"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Interquartile range
"FreqBodyBodyAccJerkMag_Entropy"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude -  Signal entropy  
"FreqBodyBodyAccJerkMag_MaxInds"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Largest value in  array indexs
"FreqBodyBodyAccJerkMag_MeanFreq"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude - Mean value Freq
"FreqBodyBodyAccJerkMag_Skewness"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude -  skewness of the frequency domain signal  
"FreqBodyBodyAccJerkMag_Kurtosis"	 Frequency of Body Body linear acceleration  derived in time to obtain Jerk signals   magnitude -   kurtosis of the frequency domain signal  
"FreqBodyBodyGyroMag_Mean"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Mean value 
"FreqBodyBodyGyroMag_StD"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Standard deviation 
"FreqBodyBodyGyroMag_MedianAbsDev"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Median absolute deviation
"FreqBodyBodyGyroMag_Max"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Largest value in array
"FreqBodyBodyGyroMag_Min"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Smallest value in array
"FreqBodyBodyGyroMag_SigMagArea"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Signal magnitude area
"FreqBodyBodyGyroMag_Energy"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Energy measure. Sum of the squares divided by the number of values.  
"FreqBodyBodyGyroMag_IQRate"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Interquartile range
"FreqBodyBodyGyroMag_Entropy"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude -  Signal entropy  
"FreqBodyBodyGyroMag_MaxInds"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Largest value in  array indexs
"FreqBodyBodyGyroMag_MeanFreq"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude - Mean value Freq
"FreqBodyBodyGyroMag_Skewness"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude -  skewness of the frequency domain signal  
"FreqBodyBodyGyroMag_Kurtosis"	 Frequency of Body  Body linear acceleration and angular velocity   magnitude -   kurtosis of the frequency domain signal  
"FreqBodyBodyGyroJerkMag_Mean"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Mean value 
"FreqBodyBodyGyroJerkMag_StD"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Standard deviation 
"FreqBodyBodyGyroJerkMag_MedianAbsDev"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Median absolute deviation
"FreqBodyBodyGyroJerkMag_Max"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Largest value in array
"FreqBodyBodyGyroJerkMag_Min"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Smallest value in array
"FreqBodyBodyGyroJerkMag_SigMagArea"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Signal magnitude area
"FreqBodyBodyGyroJerkMag_Energy"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Energy measure. Sum of the squares divided by the number of values.  
"FreqBodyBodyGyroJerkMag_IQRate"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Interquartile range
"FreqBodyBodyGyroJerkMag_Entropy"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude -  Signal entropy  
"FreqBodyBodyGyroJerkMag_MaxInds"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Largest value in  array indexs
"FreqBodyBodyGyroJerkMag_MeanFreq"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude - Mean value Freq
"FreqBodyBodyGyroJerkMag_Skewness"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude -  skewness of the frequency domain signal  
"FreqBodyBodyGyroJerkMag_Kurtosis"	 Frequency of Body  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals   magnitude -   kurtosis of the frequency domain signal  
"AngleVectors_TimeBodyAccMean_Gravity"	  Angle between to vectors   - Time domain signals of Body linear acceleration Mean value  - Gravity
"AngleVectors_TimeBodyAccJerkMean_GravityMean"	  Angle between to vectors   - Time domain signals of Body linear acceleration  derived in time to obtain Jerk signals  Mean value  -  Gravity Mean value 
"AngleVectors_TimeBodyGyroMean_GravityMean"	  Angle between to vectors   - Time domain signals of  Body linear acceleration and angular velocity  Mean value  -  Gravity Mean value 
"AngleVectors_TimeBodyGyroJerkMean_GravityMean"	  Angle between to vectors   - Time domain signals of  Body linear acceleration and angular velocity   derived in time to obtain Jerk signals  Mean value  -  Gravity Mean value 
"AngleVectors_X_GravityMean"	  Angle between to vectors   - X -  Gravity Mean value 
"AngleVectors_Y_GravityMean"	  Angle between to vectors   - Y -  Gravity Mean value 
"AngleVectors_Z_GravityMean"	  Angle between to vectors   - Z -  Gravity Mean value 


For almost any data set, the measurements you calculate will need to be described in more detail than you will sneak into the spreadsheet. The code book contains this information. At minimum it should contain:

    Information about the variables (including units!) in the data set not contained in the tidy data
    Information about the summary choices you made
    Information about the experimental study design you used

In our genomics example, the analyst would want to know what the unit of measurement for each clinical/demographic variable is (age in years, treatment by name/dose, level of diagnosis and how heterogeneous). They would also want to know how you picked the exons you used for summarizing the genomic data (UCSC/Ensembl, etc.). They would also want to know any other information about how you did the data collection/study design. For example, are these the first 20 patients that walked into the clinic? Are they 20 highly selected patients by some characteristic like age? Are they randomized to treatments?

A common format for this document is a Word file. There should be a section called "Study design" that has a thorough description of how you collected the data. There is a section called "Code book" that describes each variable and its units. 
