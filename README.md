# Project-Assigment-Gettting-Cleaning-Data-Coursera

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

Appropriately labelling of the data set with descriptive variable names was done. The Merged data set testtrainfull now has descriptive varible names.

Only the measurements on the mean and standard deviation for each measurement were, then extracted. 

From the data set previously prepared, a second, independent tidy data set was created with the average of each variable for each activity and each subject, the SubjectActivity data set.

Tthe created tidy data set was saved to "SubjectActivity.txt".
