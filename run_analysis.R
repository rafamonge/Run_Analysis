library(reshape)
library(plyr)

activityLevelsPath <- ".//UCI HAR Dataset//activity_labels.txt"
featuresPath <- ".//UCI HAR Dataset//features.txt"

subjectTrainPath <- ".//UCI HAR Dataset//train//subject_train.txt"
subjectTestPath <- ".//UCI HAR Dataset//test//subject_test.txt"
xFileTrainPath <- ".//UCI HAR Dataset//train//X_train.txt"
yFileTrainPath <- ".//UCI HAR Dataset//train//Y_train.txt"
xFileTestPath <- ".//UCI HAR Dataset//test//X_test.txt"
yFileTestPath <- ".//UCI HAR Dataset//test//Y_test.txt"


xTrain <-read.table(xFileTrainPath, header = F)
xTest <-read.table(xFileTestPath, header = F)

#Read features and set the name of the columns in XTrain & XTest
features <-read.table(featuresPath, header = F,col.names = c("FeatureId", "FeatureName"))
names(xTrain) <- features$FeatureName
names(xTest) <- features$FeatureName

#Read YTrain and YTest
yTrain <-read.table(yFileTrainPath, header = F)
yTest <-read.table(yFileTestPath, header = F)

#Read ActivityLabels file
activityLavels <-read.table(activityLevelsPath, header = F,col.names = c("ActivityId", "ActivityName"))
#add Activity column to XTrain and Xtest using a factor created by using activityLabels
xTrain$Activity <-  factor(yTrain$V1, activityLavels$ActivityId, ordered=T, labels=activityLavels$ActivityName)
xTest$Activity <-  factor(yTest$V1, activityLavels$ActivityId, ordered=T, labels=activityLavels$ActivityName)

#Add Subject columns to XTrain  XTest by reading the subject files
xTrain$Subject <- read.table(subjectTrainPath, header = F, col.names = c("Subject" ))$Subject
xTest$Subject <- read.table(subjectTestPath, header = F, col.names = c("Subject" ))$Subject

step4Results <- rbind(xTrain, xTest)   
step4Results<-step4Results[grep("Activity|Subject|mean|std", names(step4Results))]

##convert to narrow tidy data
melted <- melt(step4Results, id=c("Subject", "Activity"))
##group by "Activity", "Subject", "variable" and then take the mean
step5Results<-ddply(melted, c("Activity", "Subject", "variable"), function(df){mean(df$value)})

## Writes both datasets
write.table( step4Results,"step4.txt",row.name=FALSE) 
write.table( step5Results,"step5.txt",row.name=FALSE) 
