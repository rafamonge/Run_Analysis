## CodeBook

Data Downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

For information regarding the dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
##### Project Description

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##### Files Required

Necessary data frame variables loaded at the start of our processing:

- activitylabels from "./UCI HAR Dataset/activity_labels.txt" 
- features from "./UCI HAR Dataset/features.txt"
- subjecttrain from "./UCI HAR Dataset/train/subject_train.txt"
- subjecttest from "./UCI HAR Dataset/test/subject_test.txt"
- xtrain from "./UCI HAR Dataset/train/X_train.txt"
- xtest from "./UCI HAR Dataset/test/X_test.txt"
- ytrain from "./UCI HAR Dataset/train/y_train.txt"
- ytest from "./UCI HAR Dataset/test/y_test.txt"

##### Transformations

Step 4 output:

- X_Train and X_Test  files are loaded
- Features files is loaded
- X_Train and X_Test data.frames have their column names set using the data from the Features File
- Y_Train and Y_Test files are loaded
- Activity_labels file is loaded
- A new column, Activity is added to X_Traind and X_Test. It contains the data from Y_Train and Y_Test, but in transformed to be a factor. Data from Activity_labels is used to transform to get the appropiate names for the activities.
- Subject Data is added to X_Train and X_Test by reading the subject_Text and subject_Train files. It's added into a new column, called Subjects.
- xTrain and xTest are then concatenated
- Columns that are not called Activity, Subject or that do not have the words mean nor std in their name are dropped out
- Output is written to step4.txt

Step5 output
- Starts from step4
- Data is melted into a data frame that has 4 columns: Subject, Activity, Variable and the value for that combination.
- Data is grouped by Activity, Variable and Subject using ddply and the mean is taken for the values in the group
- Data is written to step5.txt 


