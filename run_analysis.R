# retrieveing the Training and Test sets
TESTSET <- read.table("~/UCI HAR Dataset/test/X_test.txt")
TRAINSET <- read.table("~/UCI HAR Dataset/train/X_train.txt")
# Merging measurements in both sets
mSET <- merge(TESTSET,TRAINSET,all=TRUE)
FeaturesNames <- read.tale("~/UCI HAR Dataset/features.txt")
# resetting columns names in merged set to the features/measurements names in "features.txt" file
colnames(mSET) <- FeaturesNames[,2]
# Using column names matching in order to extract columns corresponding to mean() and std()
# # measurements from merged dataset
mSET1 <- mSET[,which(grepl("mean()",colnames(mSET))==TRUE | grepl("std()",colnames(MSET))==TRUE)]
mSET2 <- mSET1[,which(grepl("Freq",colnames(mSET1))==FALSE)]
Labels <- read.table("~/UCI HAR Dataset/activity_labels.txt")
Activitiestest <- read.table("~/UCI HAR Dataset/test/y_test.txt")
Activitiestrain <- read.table("~/UCI HAR Dataset/train/y_train.txt")
# Merging the training and test activity labels
mActivities <- rbind(Activitiestest,Activitiestrain)
# mapping Activity labels to descriptive string values listed in "activity_labels.txt"  
mActivities$v2 <- Labels[mActivities$V1,2]
# adding Activity labels to the total measurements set
mSET3 <- cbind(mSET2,mActivities$v2)
names(mSET3)[names(mSET3)=="mActivities$v2"] <- "Activity"
SubjectTest <- read.table("~/UCI HAR Dataset/test/subject_test.txt")
SubjectTrain <- read.table("~/UCI HAR Dataset/train/subject_train.txt")
# merging subjects-related data for the training and test sets
Subject <- rbind(SubjectTest,SubjectTrain)
# adding subject data to the total measurements and activity set
mSET4 <- cbind(mSET3,Subject)
names(mSET4)[names(mSET4)=="V1"] <- "Subject"
# Grouping total set by Activity and subject
GroupedData <- group_by(mSET4,Activity,Subject)
# summarizing grouped data by applying the mean function to each of the non-grouped variables
TidyData <- summarise_each(GroupedData,funs(mean))
# Write end tidy dataset to text file
write.table(TidyData,"tidydata.txt",row.name=FALSE)
