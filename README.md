#Course project
Course project for "Getting and Cleaning Data" course.

##Project structure
Project consists of 3 main files:

- **run_analysis.R** - main script to analyze the data
- **README.md** - this ReadMe file
- **CodeBook.md** - Codebook, describing variables and types used in project data

##Getting a project

Just clone this repo into any directory on your device:

```bash
git clone https://github.com/bepcyc/wearable_data_cleaning.git
cd wearable_data_cleaning
```

##Running the analysis

###Prerequisites

- As it's been [said](https://class.coursera.org/getdata-015/human_grading/view/courses/973502/assessments/3/submissions) that:
'''
The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory
'''
The code supposes that data files are already in your working directory, e.i. if your working directory is \<mywd\>, then there should be files __\<mywd\>/features.txt__, __\<mywd\>/test/X_test.txt__ etc.
If you think this directory layout is strange you can comment the lines number 92 and 93:
```r
dataDir <-
  fetch_data(ds.dir = getwd(), removeDownloaded = FALSE, ds.additionalName = "")
```
and uncomment the line 95:
```r
dataDir <- fetch_data(existingDataset = FALSE)
```
