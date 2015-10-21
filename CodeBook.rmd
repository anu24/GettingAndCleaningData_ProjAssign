---
title: "CodeBook For Getting and Cleaning data Project"
output: html_document
---


###Initial Data###
The "Human Activity Recognition Using Smartphones"" Data Set is taken from the [ Data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

A full description is available at the site where the data was obtained: [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

###Data Processing###

The "data" data frame is produced by performing the following transformations:

1. Combine data from the original training and test datasets into one dataset.
2. Names the 'Activity' and 'Subject' variable.
3. Merged the Feature, Activity & Subject data as one dataframe i.e 'data'
4. Extract only those features from the original dataset that are a mean or standard deviation measure (mean or std in feature name).
5. Add activities, by name, to the single data frame'data'.
6. Names of Feteatures will labelled using descriptive variable names.
- prefix t is replaced by time
- Acc is replaced by Accelerometer
- Gyro is replaced by Gyroscope
- prefix f is replaced by frequency
- Mag is replaced by Magnitude
- BodyBody is replaced by Body

7. As a last step, generatedindependent tidy data set with the average of each variable for each activity and each subject.
8. Exported the tiday data set to "tidydata.txt" file.
