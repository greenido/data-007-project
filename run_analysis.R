########################################################################################################################
# Requirements:
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for 
#    each activity and each subject.
#
# Author: Ido Green
# Date: Sep 2014
# Packages: gdata, plyr, reshape2
########################################################################################################################

# Feel free to change this path base on your environment
path = "/Users/ido/EDU/data-007/UCI HAR Dataset/"
features <- read.table(paste(path, "features.txt",sep=""), sep="")

# If you wish to see what you got in features
# head(features, n=2)

features$V2 = gsub("^t", "time_", features$V2)
features$V2 = gsub("^f", "frequency_", features$V2)

# Remove all: (), as we do not need them
features$V2 = gsub("[()]", "", features$V2)

# Replace all special characters with _ (This is thanks to R requirments)
features$V2 = gsub("[-+,]", "_", features$V2)

# Step 1 - "Merges the training and the test sets to create one data set."
# a) We will load the data for Test (X_test.txt) and Train (X_train.txt).
# b) Add a column to each identifying it as test or train, so that when they are later combined into a single data set.
# c) Subset them apart to "TEST" or "TRAIN" as "SET_INDICATOR".
train_X = read.table(paste(path, "train/X_train.txt",sep=""), col.names=features$V2)
test_X = read.table( paste(path, "test/X_test.txt",sep=""), col.names=features$V2)

train_X$SET_INDICATOR = "TRAIN"
test_X$SET_INDICATOR = "TEST"

# Combining the sets, we will add additional columns to identify each row with it's activity and subject. 
# The subject information is in the subject[test|train].txt file, and the activity information is in the
# y_[test|train].txt. However, the activity labels are in the activity_lables.txt file, which identifies 
# the IDs as WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

# For subject, we can just add the column to the X_[test|train] set using variable creation, but for the activity,
# it would be more useful to have the name of the activity, rather than the meaningless integer, so after adding
# the integer column representing the activity, we merge (join) the  y_[test|train] sets with the activity_labels, 
# so we will have the more useful information along with the id. We have to add the ID onto the X sets first, because
# if we do the merge first, it destroys the order of the ids, which is the only information we have to map them to the
# correct X set observation/row. 

# Read in subject files
train_Subject = read.table(paste(path, "train/subject_train.txt",sep=""))
test_Subject = read.table( paste(path, "test/subject_test.txt",sep=""))

# Add subject column to core data set
train_X$SUBJECT_ID = train_Subject$V1
test_X$SUBJECT_ID = test_Subject$V1

# Read in activity labels file, giving column names
activity_labels = read.table(paste(path, "activity_labels.txt",sep=""), col.names=c("ACTIVITY_ID", "ACTIVITY_LABEL"))

# Read in activities for each observation
train_activity_ids = read.table(paste(path, "train/y_train.txt",sep=""))
test_activity_ids = read.table( paste(path, "test/y_test.txt",sep=""))

# Add ACTIVITY_ID column to the train and test sets
train_X$ACTIVITY_ID = train_activity_ids$V1
test_X$ACTIVITY_ID = test_activity_ids$V1

# Merge [train|test]_X with with activity labels
train_X = merge(train_X, activity_labels, by.x="ACTIVITY_ID", by.y="ACTIVITY_ID", all.x=TRUE)
test_X = merge(test_X, activity_labels,   by.x="ACTIVITY_ID", by.y="ACTIVITY_ID", all.x=TRUE)

# Next we need to combine the train and test data
combined = rbind(train_X, test_X)

# Step 2: "Extracts only the measurements on the *mean* and *standard deviation* for each measurement."
stdAndMeanCols = matchcols(combined, with=c("std", "mean"), method="or")
tidy = combined[ , c("SUBJECT_ID", "ACTIVITY_LABEL", "SET_INDICATOR", stdAndMeanCols$std, stdAndMeanCols$mean)]

write.csv(tidy, paste(path, "project3_tidy_data.csv",sep=""))

# Step 3: "Uses descriptive activity names to name the activities in the data set"
# Step 4: "Appropriately labels the data set with descriptive variable names."
# We need to take the average of every variable for each activity and subject. 
# Usage:
# 1. pkg. reshape2 - we use 'melt' function 
# 2. pkg. plyr     - we use ddply function 
# Get the ID column names and the fact column names in separate char vectors
idCols = matchcols(tidy, with=c("SUBJECT_ID", "ACTIVITY_LABEL"), method="or")
factCols = matchcols(tidy, without=c("SUBJECT_ID", "ACTIVITY_LABEL", "SET_INDICATOR"), method="or")

# Reshape the data, unpivoting fact columns to rows
tidyMelt = melt(tidy, id=idCols, measure.vars=factCols)

# Step 5: "From the data set in step 4, creates a second, independent tidy data set with the *average* of each
# variable for each activity and each subject."
# use ddply from the plyr package to summarize the data by activity label and subject id.
tidyAvg = ddply(tidyMelt, .(SUBJECT_ID, ACTIVITY_LABEL, variable), summarize, mean=mean(value))
write.csv(tidyAvg, paste(path, "project3_tidy_avg.csv",sep=""))
# Done! Go have a beer.
