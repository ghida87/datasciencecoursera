This document aims at providing a detailed explanation of different instructions and variables in the "analysis_run.R" R code.


Variables and Instructions overview

1. TESTSET is a data frame that contains all the measurements in the test dataset. TESTSET includes 2947 observations and 561 variables 
corresponding to different measured features. It is obtained through reading the "x-test.txt" document in the test subfolder of "UCI HAR Dataset".
2. TRAINSET is a data frame that contains all the measurements in the training dataset. TRAINSET includes 7352 observations and 561 variables 
corresponding to different measured features. It is obtained through reading the "x-train.txt" document in the train subfolder of "UCI HAR Dataset".
3. mSET is a data frame that is obtained through merging the training and test datasets. It includes 10299 observations and 561 variables corresponding
to different measured features.
4. FeaturesNames is a data frame that includes the names of different tracked features.
5. In line 8 of "run_analysis.R", the variables names in the merged dataset mSET are given the names of the features that they represent.
6. mSET1 is a subset of mSET containing mSET columns which names include "mean()" or "std()" therefore corresponding to a mean or a standard deviation
measurement.
7. mSET2 aims at removing from mSET1 all columns that correspond to a meanFreq() function and that were selected as part of a "mean()" function
based selection. mSET2 includes 10299 observations and 66 variables corresponding to mean and standard deviation related features.
8. Labels is data frame that includes 6 string labels corresponding to the 6 activities that the subjects were exercizing during the experiments. 
9. Activitiestest is a one column data frame of integers between 1 and 6. Each element of Activitiestest refers to an activity and is associated
to an observation in the test dataset.
10. Activitiestrain is a one column data frame of integers between 1 and 6. Each element of Activitiestrain refers to an activity and is associated
to an observation in the training dataset.
11. mActivities is one column data frame obtained through the merging of Activitiestrain and Activitiestest. It includes 10299 integer values 
referring to subject activities for both test and training observations.
12. a new variable in mActivities is created through mapping integer values in the first column  to string activity labels retrieved from the
Labels data frame.
13. mSET3 corresponds to a column binding of mSET2 and the newly created string column of mActivities. mSET3 includes 10299 observations and 67 variables.
14. In line 22 of "run_analysis.R", the last column of mSET3 is renamed to "Activity"
15. SubjectTest is a one column data frame of integers between 1 and 30. Each element of SubjectTest refers to a person that was subject to the
experiment and is associated to an observation in the test dataset.
16. SubjectTrain is a one column data frame of integers between 1 and 30. Each element of SubjectTest refers to a person that was subject to the
experiment and is associated to an observation in the training dataset.
17. Subject is a one column data frame obtained through merging of SubjectTrain and SubjectTest datasets. It includes 10299 integer values 
referring to subjects from whom test and training observations were obtained.
18. mSET4 corresponds to a column binding of mSET3 and the Subject data frame. mSET4 includes 10299 observations and 68 variables.
19. In line 29 of "run_analysis.R", the last column of mSET4 is renamed to "Subject"
20. GroupedData is a dataframe that have the same dimension as mSET4. It is obtained through grouping the measurements in mSET4 per Activity and per Subject.
21.  TidyData is a dataframe that displays the mean of different measured features per subject and per Activity. It is obtained through applying
the mean() summarizing function on each of the non-grouped variables of GroupedData. TidyData includes 68 variables columns each corresponding to a different
measured feature and 180 rows each corresponding to the means of different features for a well-defined (subject,activity) pair.
 