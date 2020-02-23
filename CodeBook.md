Peer-graded Assignment: Getting and Cleaning Data Course Project
================

Manipulations on data
---------------------

The following manipulations will be performed by running script `run_analysis.R`

* Download data from `https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip` unless zip file already exists.
* Unzip downloaded data and place in `./data/.` if not already existing
* Load all feature, subject, training and test data as separate data sets
* While loading training and test data, set descriptive names from the feature data set.
* Merge all X data (train and test) into `data_x`
* Merge all y data (train and test) into `data_y`
* Merge all subject data (train and test) into `data_subject`
* Merge X, y and subject data into `data`
* Make data set tidy by selecting subject, activity and all mean and standard deviation columns, stored in `data_tidy`.
* Set descriptive names to name the activities in the data set
* Set appropriate labels to the data set by extending column names, e.g. Acc is mapped to Acceleration.
* Create data set with the average of each variable for each activity and each subject and save it to textfile `./data/tidy_data.txt`. The data set is stored in `data_mean`
