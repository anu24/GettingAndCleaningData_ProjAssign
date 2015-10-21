# get the data
url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("./data")){
        dir.create("./data")
}

# download the data file and unzip it
download.file(url, destfile = "./data/getdata_project.zip")
unzip("./Data/getdata_project.zip")

#read the feature data from training set & test set files into R
Data.x.train <- read.table('./UCI HAR Dataset/train/X_train.txt')
Data.x.test <- read.table('./UCI HAR Dataset/test/X_test.txt')

#read the activity lable data from training lable & test lables files into R
Data.y.train <- read.table('./UCI HAR Dataset/train/y_train.txt')
Data.y.test <- read.table('./UCI HAR Dataset/test/y_test.txt')

# read the subject file data which contains, who performed the activity 
#for each window sample in training & test data into R
Data.subj.train <- read.table('./UCI HAR Dataset/train/subject_train.txt')
Data.subj.test <- read.table('./UCI HAR Dataset/test/subject_test.txt')

#merge the training and test data set into One
dataFeatures<- rbind(Data.x.train, Data.x.test)
dataActivity<- rbind(Data.y.train, Data.y.test)
dataSubject <- rbind(Data.subj.train, Data.subj.test)

# name the dataset variable
names(dataActivity) <-"activity"
names(dataSubject) <- "subject"

dataFeaturesVariableNames <- read.table("./UCI HAR Dataset/features.txt")
names(dataFeatures) <- dataFeaturesVariableNames$V2

# merge all 3 dataset to get the final data frame "data"
datacombine <- cbind(dataFeatures,dataActivity)
data <- cbind(datacombine, dataSubject)

# Extracts only the measurements on the mean and standard deviation for each measurement
subDataFeaturesVariableNames<-dataFeaturesVariableNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesVariableNames$V2)]

# subset the data frame "data" by above selected feature names
subNames<-c(as.character(subDataFeaturesVariableNames),"activity", "subject" )
data<-subset(data,select=subNames)

# Uses descriptive activity names to name the activities in the data set
activityName <- read.table("./UCI HAR Dataset/activity_labels.txt")

data$activity <- as.factor(data$activity)
levels(data$activity) <- activityName$V2

#Appropriately labels the data set with descriptive variable names. 
names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.

library(plyr)
data2<-aggregate(. ~subject + activity, data, mean)
data2<-data2[order(data2$subject,data2$activity),]
write.table(data2, file = "tidydata.txt",row.name=FALSE)


