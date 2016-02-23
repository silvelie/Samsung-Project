library(dplyr)
library(tidyr)

#Merge the training and the test sets to create one data set and create variables called ActivityLabel and ActivityName that label all observations with the corresponding activity labels and names respectively
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
features <- read.table("UCI HAR Dataset/features.txt")
subject_combined <- rbind(subject_test, subject_train)
names(subject_combined) <- c("subject")
names(activity_labels) <- c("ActivityLabel", "ActivityName")
x_combined <- rbind(x_test, x_train)
y_combined <- rbind(y_test, y_train)
names(x_combined) <- make.names(features$V2, unique = TRUE)
names(y_combined) <- c("ActivityLabel")
gross_data <- cbind(subject_combined, y_combined) %>%
  + left_join(activity_labels) %>%
  + cbind(x_combined)

#Extract columns containing mean and standard deviation for each measurement
slim_data <- gross_data %>% select( -matches("(mean|std)"))

#create tidy data set with the average of each variable for each activity and each subject.
tidy_data <- slim_data %>%
  + group_by(subject, ActivityName) %>%
  + summarise_each(funs(mean), -one_of(c("subject", "ActivityLabel", "ActivityName")))

