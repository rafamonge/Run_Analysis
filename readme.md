## Readme



##### Steps to run

Download and unzip data from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
It should end up on a folder called: "UCI HAR Dataset", so that the path to some of the files used looks like the following:

- //UCI HAR Dataset//train//subject_train.txt
- //UCI HAR Dataset//test//subject_test.txt
- //UCI HAR Dataset//train//X_train.txt

Place the "run_analysis.R" at the same folder where you unzipped the "UCI HAR Dataset"

Open "run_analysis.R" with RStudio and set the Working Directory to the folder where "run_analysis.R" is located at. (hint: use setWd("some folder here"))

Use RStudio to run the code on run_analysis.R.

Two files will created as output: step5.txt and step4.txt

You should create one R script called run_analysis.R that does the following.

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive variable names.
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.