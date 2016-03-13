setwd("./UCI HAR Dataset")

##read activity and features data 
temp = read.table("activity_labels.txt", sep = "")
activityLabels = as.character(temp$V2)
temp = read.table("features.txt", sep = "")
attributeNames = temp$V2

## read x train data
Xtrain = read.table("train/X_train.txt", sep = "")
### add labels to train file
names(Xtrain) = attributeNames
## read y train labels data
Ytrain = read.table("train/y_train.txt", sep = "")
## add labels to Y train
names(Ytrain) = "Activity"
Ytrain$Activity = as.factor(Ytrain$Activity)
## add activity levels to Y train
levels(Ytrain$Activity) = activityLabels

## read the train subject file 
trainSubjects = read.table("train/subject_train.txt", sep = "")
names(trainSubjects) = "subject"
trainSubjects$subject = as.factor(trainSubjects$subject)

### add the subject ID and activity information to the xTrain data
train = cbind(Xtrain, trainSubjects, Ytrain)

## read the test data
Xtest = read.table("test/X_test.txt", sep = "")
## add labels to the test info
names(Xtest) = attributeNames
## read test labels 
Ytest = read.table("test/y_test.txt", sep = "")
names(Ytest) = "Activity"
Ytest$Activity = as.factor(Ytest$Activity)
levels(Ytest$Activity) = activityLabels

testSubjects = read.table("test/subject_test.txt", sep = "")
names(testSubjects) = "subject"
testSubjects$subject = as.factor(testSubjects$subject)
### column bind the test, subject and activity information
test = cbind(Xtest, testSubjects, Ytest)

#merge 

all<- rbind(train, test)

# extract std and mean measurements 
meanstd<- sort(c(grep("mean",names(all)), grep("std", names(all))))
meanstd<- c(meanstd, as.integer(562), as.integer(563))
suball<- all[,meanstd]

#making new data table with means for each subject
library(data.table)
suball<- as.data.table(suball)
setkey(suball, subject)
suball2<- suball[, lapply(.SD,mean), by=subject]

# output the second tidy data set 
write.csv(suball2, "tidydata.csv", row.names = FALSE)
