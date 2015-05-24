library(dplyr)

## Load test and train data sets and appropriately labels them with descriptive variable names (features.

#- 'features.txt': List of all features.
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE,
                       col.names = c("featureCode", "featureName"))

#- 'train/X_train.txt': Train set.
x_train_set <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE,
                          dec = ".", col.names = features$featureName, colClasses = "numeric")
#- 'test/X_test.txt': Test set.
x_test_set <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE,
                          dec = ".", col.names = features$featureName, colClasses = "numeric")


## Load activities data set and merge codes with descriptive activity names

#'activity_labels.txt': Links the class labels with their activity name.
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE,
                              col.names = c("activityCode", "activityName"))

#- 'test/y_test.txt': Test labels. (activties)
y_test <- read.delim("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "\n",
                     col.names = c("activityCode"))
#- 'train/y_train.txt': Train labels. (activties)
y_train <- read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "\n",
                     col.names = c("activityCode"))
y_test <- merge(y_test, activity_labels, by = "activityCode")
y_train <- merge(y_train, activity_labels, by = "activityCode") 
  

## Load subject code for each observation

#- 'test/subject_test.txt': Each row identifies the subject who performed the activity
# for each window sample. Its range is from 1 to 30. 
subject_test <- read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "\n",
                            col.names = c("subjectCode"))

#- 'train/subject_train.txt': Each row identifies the subject who performed the activity
#  for each window sample. Its range is from 1 to 30. 
subject_train <- read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "\n",
                      col.names = c("subjectCode"))

## Load inertial signals set for each observation

#- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from
#the smartphone accelerometer X axis in standard gravity units 'g'. 
#Every row shows a 128 element vector. 
#The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
#- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal
#obtained by subtracting the gravity from the total acceleration. 
#- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

body_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt", header = FALSE, col.names = paste("body_acc_x", c(1:128), sep = ""), colClasses = "numeric")
body_acc_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt", header = FALSE, col.names = paste("body_acc_y", c(1:128), sep = ""), colClasses = "numeric")
body_acc_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt", header = FALSE, col.names = paste("body_acc_z", c(1:128), sep = ""), colClasses = "numeric")
body_gyro_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt", header = FALSE, col.names = paste("body_gyro_x", c(1:128), sep = ""), colClasses = "numeric")
body_gyro_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt", header = FALSE, col.names = paste("body_gyro_y", c(1:128), sep = ""), colClasses = "numeric")
body_gyro_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt", header = FALSE, col.names = paste("body_gyro_z", c(1:128), sep = ""), colClasses = "numeric")
total_acc_x_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt", header = FALSE, col.names = paste("total_acc_x", c(1:128), sep = ""), colClasses = "numeric")
total_acc_y_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt", header = FALSE, col.names = paste("total_acc_y", c(1:128), sep = ""), colClasses = "numeric")
total_acc_z_train <- read.table("UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt", header = FALSE, col.names = paste("total_acc_z", c(1:128), sep = ""), colClasses = "numeric")

body_acc_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt", header = FALSE, col.names = paste("body_acc_x", c(1:128), sep = ""), colClasses = "numeric")
body_acc_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt", header = FALSE, col.names = paste("body_acc_y", c(1:128), sep = ""), colClasses = "numeric")
body_acc_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt", header = FALSE, col.names = paste("body_acc_z", c(1:128), sep = ""), colClasses = "numeric")
body_gyro_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt", header = FALSE, col.names = paste("body_gyro_x", c(1:128), sep = ""), colClasses = "numeric")
body_gyro_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt", header = FALSE, col.names = paste("body_gyro_y", c(1:128), sep = ""), colClasses = "numeric")
body_gyro_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt", header = FALSE, col.names = paste("body_gyro_z", c(1:128), sep = ""), colClasses = "numeric")
total_acc_x_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt", header = FALSE, col.names = paste("total_acc_x", c(1:128), sep = ""), colClasses = "numeric")
total_acc_y_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt", header = FALSE, col.names = paste("total_acc_y", c(1:128), sep = ""), colClasses = "numeric")
total_acc_z_test <- read.table("UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt", header = FALSE, col.names = paste("total_acc_z", c(1:128), sep = ""), colClasses = "numeric")

## Compose total dataset

train_set <- cbind( subject_train, activityName = y_train[, "activityName"], x_train_set,
                   body_acc_x_train, 
                   body_acc_y_train, 
                   body_acc_z_train, 
                   body_gyro_x_train, 
                   body_gyro_y_train, 
                   body_gyro_z_train, 
                   total_acc_x_train, 
                   total_acc_y_train, 
                   total_acc_z_train
)

test_set <- cbind( subject_test, activityName = y_test[, "activityName"], x_test_set,
                  body_acc_x_test, 
                  body_acc_y_test, 
                  body_acc_z_test, 
                  body_gyro_x_test, 
                  body_gyro_y_test, 
                  body_gyro_z_test, 
                  total_acc_x_test, 
                  total_acc_y_test, 
                  total_acc_z_test
)

total_set <- rbind(test_set, train_set, make.row.names = FALSE)


## Extracts only the measurements on the mean and standard deviation for each measurement. 

#total_set_colnames <- colnames(total_set)
#mean_and_std_set <- total_set[, c( 1, 2, grep("mean()", total_set_colnames), grep("std()", total_set_colnames))]
mean_and_std_set <- total_set[, c( 1, 2, grep("mean()", features$featureName) + 2, grep("std()", features$featureName) + 2)]


## Create an independent tidy data set with the average of each variable for each activity and each subject

#activity_subject_aggregate <- aggregate(. ~  activityName + subjectCode, data = mean_and_std_set, FUN = mean, na.rm = TRUE)
#write.table(activity_subject_aggregate, "activity_subject_aggregate.txt", row.name=TRUE)
aggregate(. ~  activityName + subjectCode, data = mean_and_std_set,
          FUN = mean, na.rm = TRUE) %>>%
write.table( "activity_subject_aggregate.txt", row.name=TRUE)
