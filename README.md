## Script run_analysis.R

Script works with Human Activity Recognition (HAR) Dataset.
Scripts groups data in HAR dataset (by activity and subject) and aggregate it (by mean).

Dataset directory (UCI HAR Dataset) should be placed into working directory.
Script (run_analysis.R) should be placed into the same directory.

Script performs following actions with files in HAR dataset directory: 

1. Load test and train data sets and label them with descriptive variable names (features).
- 'features.txt': List of all features.
- 'train/X_train.txt': Train set.
- 'test/X_test.txt': Test set.


2. Load activity code for each observation and merge codes with descriptive activity names
'activity_labels.txt': Links the class labels with their activity name.
- 'test/y_test.txt': Test labels. (activties)
- 'train/y_train.txt': Train labels. (activties)

3. Load subject code for each observation
- 'train/subject_train.txt'
- 'test/subject_test.txt'
 Each row identifies the subject who performed the activity for each window sample.
 Its range is from 1 to 30. 

4. Compose total dataset (from datasets prepared at steps 1-3)

5. Extract measurements on the mean and standard deviation for each measurement. 

6. Create data set with the average of each variable for each activity and each subject

7. Write prepared data into file "activity_subject_aggregate.txt" with rownames

