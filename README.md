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

- For development I used the latest version of 'RStudio' available now - **0.99.447**. If something does not work for you, please upgrade.
- You'll have to install next libraries: **dplyr** and **LaF**<br>
  Please use this command in `R` to install the dependencies:
```r
install.packages("dplyr")
install.packages("LaF")
```
  <br>**NOTE:** LaF is used instead of more typical **fread** and **read.fwf** as fread has currently a [bug](https://github.com/Rdatatable/data.table/issues/956) and read.fwf is extremely slow.
- As it says [here](https://class.coursera.org/getdata-015/human_grading/view/courses/973502/assessments/3/submissions):<br>
```The code should have a file run_analysis.R in the main directory that can be run as long as the Samsung data is in your working directory```<br>
  the code supposes that data files are already in your working directory, e.g. if your working directory is \<mywd\>, then there should be files __\<mywd\>/features.txt__, __\<mywd\>/test/X_test.txt__ etc.
  If you think this directory layout is strange you can comment the lines number 92 and 93:
```r
dataDir <-
  fetch_data(ds.dir = getwd(), removeDownloaded = FALSE, ds.additionalName = "")
```
  and uncomment the line 95:
  ```r
  dataDir <- fetch_data(existingDataset = FALSE)
  ```
  In this case the dataset will be downloaded and unpacked automatically into temporary directory.

###Running the script

Run the script either from command line:
```bash
Rscript run_analysis.R
```

Or open it in `RStudio` and run with **Ctrl+Shift+S** or **Source** button.
Optionally you can set a working directory (i.e. data directory) with **Ctrl+Shift+H**.

###Obtaining the results
During the execution you'll see a message:

```
Writing tidy data into  /some/dir/tidy_data.txt
```

Please find the resulting file in the specified directory.
