# Code Book

##Main information

###Format
File has a csv/tsv format with header and a **space** character used as a delimiter. Data is not quoted.
First column uses integers as values.
Second column uses letters in uppercase and underscores for values.
All other columns use `floating point` values.

###Header
To prevent automated reading problems all of the columns have the same simple naming format: **word1_word2_word3_..wordN**

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

##Mean values for measurements
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
	* tBodyAccMag_mean
	* tGravityAccMag_mean
	* tBodyAccJerkMag_mean
	* tBodyGyroMag_mean
	* tBodyGyroJerkMag_mean
	* fBodyAcc_mean_X
	* fBodyAcc_mean_Y
	* fBodyAcc_mean_Z
	* fBodyAccJerk_mean_X
	* fBodyAccJerk_mean_Y
	* fBodyAccJerk_mean_Z
	* fBodyGyro_mean_X
	* fBodyGyro_mean_Y
	* fBodyGyro_mean_Z
	* fBodyAccMag_mean
	* fBodyBodyAccJerkMag_mean
	* fBodyBodyGyroMag_mean
	* fBodyBodyGyroJerkMag_mean
- values: `floating point` aggregate mean value for a given **subject** and **activity** for all the mean device parameter values measured.

##Standard deviation values for measurements
- column names:
	* tBodyAcc_std_X
	* tBodyAcc_std_Y
	* tBodyAcc_std_Z
	* tGravityAcc_std_X
	* tGravityAcc_std_Y
	* tGravityAcc_std_Z
	* tBodyAccJerk_std_X
	* tBodyAccJerk_std_Y
	* tBodyAccJerk_std_Z
	* tBodyGyro_std_X
	* tBodyGyro_std_Y
	* tBodyGyro_std_Z
	* tBodyGyroJerk_std_X
	* tBodyGyroJerk_std_Y
	* tBodyGyroJerk_std_Z
	* tBodyAccMag_std
	* tGravityAccMag_std
	* tBodyAccJerkMag_std
	* tBodyGyroMag_std
	* tBodyGyroJerkMag_std
	* fBodyAcc_std_X
	* fBodyAcc_std_Y
	* fBodyAcc_std_Z
	* fBodyAccJerk_std_X
	* fBodyAccJerk_std_Y
	* fBodyAccJerk_std_Z
	* fBodyGyro_std_X
	* fBodyGyro_std_Y
	* fBodyGyro_std_Z
	* fBodyAccMag_std
	* fBodyBodyAccJerkMag_std
	* fBodyBodyGyroMag_std
	* fBodyBodyGyroJerkMag_std
- values: `floating point` aggregate mean value of standard deviation for a given **subject** and **activity** for the device parameter measured.
