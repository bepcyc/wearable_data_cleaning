#!/usr/bin/env Rscript
# fetch dataset from the internet and unzip it
fetch_data <-
  function (ds.dir = tempdir(), existingDataset = TRUE, removeDownloaded = TRUE, ds.additionalName = "UCI HAR Dataset") {
    ds.zipfile <- file.path(ds.dir, "dataset.zip")
    if (!dir.exists(ds.dir)) {
      dir.create(ds.dir, showWarnings = TRUE)
    } else {
      cat("Skipping creation of ", ds.dir, "\n")
    }
    if (!existingDataset) {
      if (!file.exists(ds.zipfile)) {
        # URL of the dataset
        ds.url <-
          "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        ds.con <- url(ds.url, method = "libcurl")
        download.result <-
          download.file(url = ds.url, destfile = ds.zipfile, method = "curl")
        close(ds.con)
        stopifnot(download.result == 0)
      } else {
        cat("File ", ds.zipfile, " already exists. Skipping download phase.\n")
      }
      unzipped <- unzip(zipfile = ds.zipfile, exdir = ds.dir)
    }
    if (removeDownloaded)
      file.remove(ds.zipfile)
    file.path(ds.dir, ds.additionalName)
  }

# read test or training data
read_data <- function(baseDir, datasetName) {
  read_columns <- function(filePath) {
    read.csv2(filePath,
              header = FALSE,
              sep = " ",
              skip = 0)
  }
  dir <- file.path(baseDir, datasetName)
  # get all feature names from file
  # NOTE: we read these files every time, which is not effective.
  # On the other hand, they're so small, that it will not affect performance significantly.
  allFeatures <-
    # get second column with names and transpone this column
    t(read_columns(file.path(baseDir, "features.txt"))[2])
  featureIndices <-
    # we can skip sort, but just to keep things in their original order we use it
    sort(c(
      # filter mean columns
      grep("-mean()-", allFeatures, fixed = TRUE),
      # filter standart deviation columns
      grep("-std()-", allFeatures, fixed = TRUE)
    ))
  
  library(LaF)
  numColumns <- length(allFeatures)
  testData <-
    laf_open_fwf(
      file.path(dir, paste0("X_", datasetName, ".txt")),
      column_widths = replicate(numColumns, 16),
      column_types = replicate(numColumns, "double"),
      column_names = allFeatures
    )
  selectedData <- testData[, featureIndices]
  activityLabels <-
    read_columns(file.path(baseDir, "activity_labels.txt"))
  names(activityLabels) <- c("activity_id", "activity_label")
  subjects <-
    read_columns(file.path(dir, paste0("subject_", datasetName, ".txt")))
  names(subjects) <- c("subject_id")
  activities <-
    read_columns(file.path(dir, paste0("y_", datasetName, ".txt")))
  names(activities) <- c("activity_id")
  library(dplyr)
  # 3. Uses descriptive activity names to name the activities in the data set
  activities <-
    inner_join(activities, activityLabels, by = "activity_id")
  # concatenate horizontally columns and table into one big table
  finalData <-
    cbind.data.frame(subjects, activities["activity_label"], selectedData)
  # put _ instead of . and ... to make it look nice
  # 4. Appropriately labels the data set with descriptive variable names.
  names(finalData) <-
    gsub("\\.", "_", gsub("\\.\\.\\.", "_", names(finalData)))
  finalData
}

cat("Starting script ...\n")

# download dataset files and unarchive them
# optionally you may call it with ds.basedir = <your dir with dataset archive and/or unarchived dataset>
dataDir <-
  fetch_data(ds.dir = getwd(), removeDownloaded = FALSE, ds.additionalName = "")
# uncomment to prepare the dataset automatically
# dataDir <- fetch_data(existingDataset = FALSE)
cat("Working with dataset files in ", dataDir, "\n")
# read test data
cat("Reading test data.\n")
testData <- read_data(baseDir = dataDir, datasetName = "test")
# read train data
cat("Reading training data.\n")
trainData <- read_data(baseDir = dataDir, datasetName = "train")

cat("Combining test and train data.\n")
combined <- rbind.data.frame(testData, trainData)

library(dplyr)
# 5. tidy data set with the average of each variable for each activity and each subject
cat("Preparing tidy data.\n")
tidyData <-
  combined %>% group_by(subject_id, activity_label) %>% summarise_each(funs(mean))

outputFile <- file.path(dataDir, "tidy_data.txt")
cat("Writing tidy data into ", outputFile, "\n")
write.table(tidyData, file = outputFile, quote = FALSE, row.names = FALSE)

## uncomment for testing and reviewing ;)
# tidy_data = read.table(file.path(dataDir, "tidy_data.txt"), header=TRUE)
# dim(tidy_data)
# head(tidy_data)

cat("Finishing script.\n")

