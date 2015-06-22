# Code Book

##Main information

To prevent reading problems all of the columns have the same simple naming format: **word1_word2_word3**

##Subject
- column name: **subject_id**
- values: numeric IDs of participants: 1, 2, ...

##Activity
- column name: **activity_label**
- values: short name for an activity in uppercase:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

##Mean values for measurements:
- column names:
    * tBodyAcc_mean_X
    * tBodyAcc_mean_Y
    * tBodyAcc_mean_Z
    * tGravityAcc_mean_X
    * tGravityAcc_mean_Y
    * tGravityAcc_mean_Z
    * tBodyAccJerk_mean_X
    * tBodyAccJerk_mean_Y
    * tBodyAccJerk_mean_Z
    * tBodyGyro_mean_X
    * tBodyGyro_mean_Y
    * tBodyGyro_mean_Z
    * tBodyGyroJerk_mean_X
    * tBodyGyroJerk_mean_Y
    * tBodyGyroJerk_mean_Z
    * fBodyAcc_mean_X
    * fBodyAcc_mean_Y
    * fBodyAcc_mean_Z
    * fBodyAccJerk_mean_X
    * fBodyAccJerk_mean_Y
    * fBodyAccJerk_mean_Z
    * fBodyGyro_mean_X
    * fBodyGyro_mean_Y
    * fBodyGyro_mean_Z
- column values: `double` mean values for given **subject** and **activity** for the device parameter measured.
