==================================================================
Human Activity Recognition Using Smartphones Dataset

==================================================================

Set of files provided to offer a concise way of certain variables resulting of  measurement
from tests made by DITEN - Universit‡ degli Studi di Genova over a group of individuals to
evaluate experiments on Human Activity Recognition

As per the source of the information:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing
a smartphone (Samsung Galaxy S II) on the waist."

The rawdata of each test case of the experiment was provided by the embedded accelerometer and gyroscope of the smartphone by
capturing 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

Original results were compiled into two data sets, where 70% of the volunteers was selected for generating the training data and
30% the test data.

It is also provided here a general script, made in R language, in order to present a final wide-format data set of main variables
that results from extracting only  measurements on the mean and standard deviation for each original measurement (test and training data set)



In order to run the script you should

1. install R
2. Install packages: dplyr, readr, car,reshape2
3. Take the file run_analysis.R to your home directory
4. Under your home directory create "data" directory
3. Unzip UCI_HAR_Dataset.zip under data directory 
4. Script will provide a file TidiedDF.txt, to offer a wide-format of variables related with average(mean) and standard deviation(std)
   of variables belonging to test and training data set. Information on this file refers to avg values for each subject and each activiy


 run the script by typing

 run_analsys.R




Files provided provided:
======================================
- UCI_HAR_Dataset.zip
- run_analysis.R
- TidiedDF.txt
- readme.md
- codebook.md



Process for the Analysis
======================================

1. Take the original data set for test and training and form a compiled data set with all variables. Giving a 561-Columng long
Data frame

2. Variables were taken from files y_train and y_test

2. Observations in the resulting data frame were taken from files x_train.txt and x_test.txt

2. Merge resulting data frame from step 1 and adding variables of Subject and Activities to be applied to each observation

4. The new 563-columng-long data frame was correctly formatted with adequate names of variables

5. Final result of the script is a new data frame in wide-format with the average of all variables for mean and std for each subject and
each Activity of the experiment

6. The resulted data frame is locally saved in the working directory as TidiedDF.txt file. Read the file with read.table() function wiht the following arguments

    MyFile <- read.table("TidiedDF.txt", header = TRUE, sep = " ")

7. You can also use arrange() function from dplyr to get sorted by Subject
    Library(dplyr)
    MyFile <- arrange(MyFile, subject)
