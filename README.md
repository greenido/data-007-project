# Getting-and-Cleaning-Data Course Project 

## Project requirements

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

------

## How/Why - Per step

0. Step 0 - Clean up
  * We need to clean up the column names. We will substitute potentially problematic characters in the column names to ease future programmatic utility as well as enhance human readability. A "t" character at the beginning of a variable name represents "time", according to the features_info.txt file, so we will replace that with "time_". An "f" character at the beginning of a var name indicates "frequency", so we will replace the beginning "f" with "frequency_"
  * The features.txt file contains the column headers/names for the X_[test|train].txt file, but the column names are listed down the rows. 
  * Once we load this file in, we can pass the second column of this data frame to the col.names parameter of read.table when we read in the X_[test|train].txt sets. 


1. Step 1 - load and combine only what we need
  * We will load the main data and Indicate as Test or Train:
  * We need to load the X_test.txt and X_train.txt data sets in separately, and then add a column to each identifying it as test or train, so that when they are later combined into a single data set, we can subset them apart. 
  * This column will contain factor values "TEST" or "TRAIN", and will be called "SET_INDICATOR".
  * Add Subject and Activity IDs:
     * Add additional columns to identify each row with it's activity and subject. 
     * The subject information is in the subject[test|train].txt file, and the activity information is in the y_[test|train].txt. 
     * The activity labels are in the activity_lables.txt file, which identifies the IDs as:
       * WALKING
       * WALKING_UPSTAIRS
       * WALKING_DOWNSTAIRS
       * SITTING
       * STANDING
       * LAYING

For subject, we can just add the column to the X_[test|train] set using variable creation, but for the activity, it would be more useful to have the name of the activity, rather than the meaningless integer, so after adding the integer column representing the activity, we merge (join) the  y_[test|train] sets with the activity_labels, so we will have the more useful information along with the id. We have to add the ID onto the X sets first, because if we do the merge first, it destroys the order of the ids, which is the only information we have to map them to the correct X set observation/row. 

2. Step 2 - Get the mean and standard deviation for each columns and export the tidy data
  * Next, subset the columns whose names contain the text "mean" or "std" along with the SUBJECT_ID, ACTIVITY_LABEL and the SET_INDICATOR.
    * We will save the tidy data set as a csv file *"project3_tidy_data.csv"*

3. Step 3 - Avg dataset
  * We take the average of every variable for each activity and subject. 
  * Using: melt - reshape2 package, 
  * Using: ddply - plyr package.

4. Step 4 - Check the output
In the console of R Studio you can type: head() on each new dataset and see what we got.


