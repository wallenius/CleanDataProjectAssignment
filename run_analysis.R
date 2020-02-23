library(dplyr)

filename <- "CleanDataProjectAssignmentData.zip"

# Check if archieve already exists.
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(fileURL, filename, method="curl")
}  

# Check if folder exists
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

# Load activites
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
# Load featuers
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("class", "feature"))

# Load training data set and set appropriate column names
data_x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature)
data_y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = c("activity"))
data_subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
# Load test data set and set appropriate column names
data_x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature)
data_y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = c("activity"))
data_subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))

#Merge train and test
data_x <- rbind(data_x_train, data_x_test)
data_y <- rbind(data_y_train, data_y_test)
data_subject <- rbind(data_subject_train, data_subject_test)

# Combine into 1 data frame.
data <- cbind(data_subject, data_y, data_x)

#Extract only the measurements on mean and std
data_tidy <- select(data, subject, activity, contains("mean"), contains("std"))

# Use desciptive names for acvities
data_tidy$activity <- activities[data_tidy$activity, 2]

# Use descriptive names for variable names
names(data_tidy) <- gsub("Acc", "Acceleration", names(data_tidy))
names(data_tidy) <- gsub("angle", "Angle", names(data_tidy))
names(data_tidy) <- gsub("Freq", "Frequency", names(data_tidy))
names(data_tidy) <- gsub("^f", "Frequency", names(data_tidy))
names(data_tidy) <- gsub("gravity", "Gravity", names(data_tidy))
names(data_tidy) <- gsub("Gyro", "Gyroscope", names(data_tidy))
names(data_tidy) <- gsub("Mag", "Magnitude", names(data_tidy))
names(data_tidy) <- gsub("mean", "Mean", names(data_tidy))
names(data_tidy) <- gsub("std", "StandardDeviation", names(data_tidy))
names(data_tidy) <- gsub("^t", "Time", names(data_tidy))
names(data_tidy) <- gsub("\\.t", "Time", names(data_tidy))

# Create independent tidy data set with the average of each variable for each activity and each subject
data_mean <- data_tidy %>% group_by(subject, activity) %>% summarise_all(mean)

# Write independent tidy data set to textfile
write.table(data_mean, "./data/tidy_data.txt", row.names = FALSE, quote = FALSE)
