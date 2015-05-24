library(dplyr)

## 1. Load test and train data sets and label them with descriptive variable names (features).
#- 'features.txt': List of all features.
#- 'train/X_train.txt': Train set.
#- 'test/X_test.txt': Test set.

features <- read.table("UCI HAR Dataset/features.txt", header = FALSE,
                       col.names = c("featureCode", "featureName"))
x_train_set <- read.table("UCI HAR Dataset/train/X_train.txt", header = FALSE,
                          dec = ".", col.names = features$featureName, colClasses = "numeric")
x_test_set <- read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE,
                          dec = ".", col.names = features$featureName, colClasses = "numeric")

## 2. Load activity code for each observation and merge codes with descriptive activity names
#'activity_labels.txt': Links the class labels with their activity name.
#- 'test/y_test.txt': Test labels. (activties)
#- 'train/y_train.txt': Train labels. (activties)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE,
                              col.names = c("activityCode", "activityName"))

y_test <- read.delim("UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "\n",
                     col.names = c("activityCode"))
y_train <- read.delim("UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "\n",
                     col.names = c("activityCode"))

y_test <- merge(y_test, activity_labels, by = "activityCode")
y_train <- merge(y_train, activity_labels, by = "activityCode") 
  

## 3. Load subject code for each observation
#- 'train/subject_train.txt'
#- 'test/subject_test.txt'
# Each row identifies the subject who performed the activity for each window sample.
# Its range is from 1 to 30. 

subject_test <- read.delim("UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "\n",
                            col.names = c("subjectCode"))
subject_train <- read.delim("UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "\n",
                      col.names = c("subjectCode"))


## 4. Compose total dataset

train_set <- cbind( subject_train, activityName = y_train[, "activityName"], x_train_set)
test_set <- cbind( subject_test, activityName = y_test[, "activityName"], x_test_set)
total_set <- rbind(test_set, train_set, make.row.names = FALSE)


## 5. Extract measurements on the mean and standard deviation for each measurement. 

mean_and_std_set <- total_set[, c( 1, 2, grep("mean\\(\\)", features$featureName) + 2, grep("std\\(\\)", features$featureName) + 2)]


## 6. Create data set with the average of each variable for each activity and each subject

aggregate(. ~  activityName + subjectCode, data = mean_and_std_set,
          FUN = mean, na.rm = TRUE) %>%
write.table( "activity_subject_aggregate.txt", row.name=TRUE)
