# Code Book 
## Output files: project3_tidy_avg.csv , project3_tidy_data.csv


### Experimental Study Design
This is from the requirements of the project:
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

Original Data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


### Summary 
*project3_tidy_data.csv* - This dataset isn't  summarized, only merged and combined with other data to produce a clean and tidy dataset.
<br>
*project3_tidy_avg.csv* - This dataset is summarized to the grain of subject, activity, variable with the mean taken for every observation from project3_tidy_data.csv

From the raw data's file features.info:

####Feature Selection
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
[...]


## Code Book for project3_tidy_data.csv
* __time___ indicates time domain variables
* __frequency___ indicates frequency domain variables

* __mean__ indicates Mean value
* __std__ indicates Standard deviation
* __meanFreq__ indicates Weighted average of the frequency components to obtain a mean frequency

* __Jerk__ Indicates the body linear acceleration and angular velocity were derived in time to obtain Jerk signals

1. SUBJECT_ID - integer - identifies the subject who performed the activity for each sample. Range: 1 to 30
2. ACTIVITY_LABEL - character/factor - Describes what the activity was. Values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING)
3. SET_INDICATOR - character/factor - Dscribes whether the data originally came from the Test or Train set. Values (TEST or TRAIN)
4. time_BodyAcc_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
5. time_BodyAcc_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
6. time_BodyAcc_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
7. time_GravityAcc_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
8. time_GravityAcc_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
9. time_GravityAcc_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
10. time_BodyAccJerk_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
11. time_BodyAccJerk_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
12. time_BodyAccJerk_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
13. time_BodyGyro_std_X - numeric - units are radians/second -- ex: -0.45345956
14. time_BodyGyro_std_Y - numeric - units are radians/second -- ex: -0.45345956
15. time_BodyGyro_std_Z - numeric - units are radians/second -- ex: -0.45345956
16. time_BodyGyroJerk_std_X - numeric - units are radians/second -- ex: -0.45345956
17. time_BodyGyroJerk_std_Y - numeric - units are radians/second -- ex: -0.45345956
18. time_BodyGyroJerk_std_Z - numeric - units are radians/second -- ex: -0.45345956
19. time_BodyAccMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
20. time_GravityAccMag_std -- ex: -0.45345956
21. time_BodyAccJerkMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
22. time_BodyGyroMag_std - numeric - units are radians/second -- ex: -0.45345956
23. time_BodyGyroJerkMag_std - numeric - units are radians/second -- ex: -0.45345956
24. frequency_BodyAcc_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
25. frequency_BodyAcc_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
26. frequency_BodyAcc_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
27. frequency_BodyAccJerk_std_X - numeric - standard gravity units 'g' -- ex: -0.45345956
28. frequency_BodyAccJerk_std_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
29. frequency_BodyAccJerk_std_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
30. frequency_BodyGyro_std_X - numeric - units are radians/second -- ex: -0.45345956
31. frequency_BodyGyro_std_Y - numeric - units are radians/second -- ex: -0.45345956
32. frequency_BodyGyro_std_Z - numeric - units are radians/second -- ex: -0.45345956
33. frequency_BodyAccMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
34. frequency_BodyBodyAccJerkMag_std - numeric - standard gravity units 'g' -- ex: -0.45345956
35. frequency_BodyBodyGyroMag_std - numeric - units are radians/second -- ex: -0.45345956
36. frequency_BodyBodyGyroJerkMag_std - numeric - units are radians/second -- ex: -0.45345956
37. time_BodyAcc_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
38. time_BodyAcc_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
39. time_BodyAcc_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
40. time_GravityAcc_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
41. time_GravityAcc_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
42. time_GravityAcc_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
43. time_BodyAccJerk_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
44. time_BodyAccJerk_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
45. time_BodyAccJerk_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
46. time_BodyGyro_mean_X - numeric - units are radians/second -- ex: -0.45345956
47. time_BodyGyro_mean_Y - numeric - units are radians/second -- ex: -0.45345956
48. time_BodyGyro_mean_Z - numeric - units are radians/second -- ex: -0.45345956
49. time_BodyGyroJerk_mean_X - numeric - units are radians/second -- ex: -0.45345956
50. time_BodyGyroJerk_mean_Y - numeric - units are radians/second -- ex: -0.45345956
51. time_BodyGyroJerk_mean_Z - numeric - units are radians/second -- ex: -0.45345956
52. time_BodyAccMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
53. time_GravityAccMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
54. time_BodyAccJerkMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
55. time_BodyGyroMag_mean - numeric - units are radians/second -- ex: -0.45345956
56. time_BodyGyroJerkMag_mean - numeric - units are radians/second -- ex: -0.45345956
57. frequency_BodyAcc_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
58. frequency_BodyAcc_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
59. frequency_BodyAcc_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
60. frequency_BodyAcc_meanFreq_X - numeric - standard gravity units 'g' -- ex: -0.45345956
61. frequency_BodyAcc_meanFreq_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
62. frequency_BodyAcc_meanFreq_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
63. frequency_BodyAccJerk_mean_X - numeric - standard gravity units 'g' -- ex: -0.45345956
64. frequency_BodyAccJerk_mean_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
65. frequency_BodyAccJerk_mean_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
66. frequency_BodyAccJerk_meanFreq_X - numeric - standard gravity units 'g' -- ex: -0.45345956
67. frequency_BodyAccJerk_meanFreq_Y - numeric - standard gravity units 'g' -- ex: -0.45345956
68. frequency_BodyAccJerk_meanFreq_Z - numeric - standard gravity units 'g' -- ex: -0.45345956
69. frequency_BodyGyro_mean_X - numeric - units are radians/second -- ex: -0.45345956
70. frequency_BodyGyro_mean_Y - numeric - units are radians/second -- ex: -0.45345956
71. frequency_BodyGyro_mean_Z - numeric - units are radians/second -- ex: -0.45345956
72. frequency_BodyGyro_meanFreq_X - numeric - units are radians/second -- ex: -0.45345956
73. frequency_BodyGyro_meanFreq_Y - numeric - units are radians/second -- ex: -0.45345956
74. frequency_BodyGyro_meanFreq_Z - numeric - units are radians/second -- ex: -0.45345956
75. frequency_BodyAccMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
76. frequency_BodyAccMag_meanFreq - numeric - standard gravity units 'g' -- ex: -0.45345956
77. frequency_BodyBodyAccJerkMag_mean - numeric - standard gravity units 'g' -- ex: -0.45345956
78. frequency_BodyBodyAccJerkMag_meanFreq - numeric - standard gravity units 'g' -- ex: -0.45345956
79. frequency_BodyBodyGyroMag_mean - numeric - units are radians/second -- ex: -0.45345956
80. frequency_BodyBodyGyroMag_meanFreq - numeric - units are radians/second -- ex: -0.45345956
81. frequency_BodyBodyGyroJerkMag_mean - numeric - units are radians/second -- ex: -0.45345956
82. frequency_BodyBodyGyroJerkMag_meanFreq - numeric - units are radians/second -- ex: -0.45345956


## Code Book for project3_tidy_avg.csv

| Name          | Type          | Explanation                                       |
| ------------- |:-------------:| -------------------------------------------------:|
| SUBJECT_ID    | integer       | identifies the subject who performed the activity for each sample. Range: 1 to 30 |
| ACTIVITY_LABEL| char/factor   | Describes what the activity was. Values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING) |
| variable| char/factor| the column from the original tidy.csv data set for which the mean has been taken across all observations. -- ex: ("time_BodyGyro_std_X", "frequency_BodyAccJerk_std_X", "time_GravityAcc_mean_Y", ...) |
| mean    | numeric | the average of all the non-id columns for each subject and activity from tidy.csv. ex: -0.98234533|



