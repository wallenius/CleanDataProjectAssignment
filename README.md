Peer-graded Assignment: Getting and Cleaning Data Course Project
================

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

How does the script work?
------------------------

The script `run_analysis.R` will do the following

* Download and unzip data in `./data/.` if not already existing
* Load all feature, subject, training and test data
* Merge subject, training and test data in a common table
* Extract subject, activity columns together with mean and standard deviation columns from table
* Set descriptive names to name the activities in the data set
* Set appropriate labels to the data set with descriptive variable names. Data set can be found in variable `data_tidy`
* Create data set with the average of each variable for each activity and each subject and save it to textfile `./data/tidy_data.txt`. Data set can be found in variable `data_mean`