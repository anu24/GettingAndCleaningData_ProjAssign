#Getting and Cleaning Data Course Project#
###Purpose###

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit:

1.a tidy data set as described below;
2.a link to a Github repository with your script for performing the analysis; and
3.a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.
You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

###Objectives###
*run_analysis.R* performs the following

1. Combine data from the original training and test datasets into one dataset.
2. Names the 'Activity' and 'Subject' variable.
3. Merged the Feature, Activity & Subject data as one dataframe i.e 'data'
4. Extract only those features from the original dataset that are a mean or standard deviation measure (mean or std in feature name).
5. Add activities, by name, to the single data frame'data'.
6. Names of Feteatures will labelled using descriptive variable names.
 1. prefix t is replaced by time
 2. Acc is replaced by Accelerometer
 3. Gyro is replaced by Gyroscope
 4. prefix f is replaced by frequency
 5. Mag is replaced by Magnitude
 6. BodyBody is replaced by Body

7. As a last step, generatedindependent tidy data set with the average of each variable for each activity and each subject.
8. Exported the tiday data set to "tidydata.txt" file.
