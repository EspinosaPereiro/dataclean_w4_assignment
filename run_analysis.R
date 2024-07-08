#Download the file from internet
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
              destfile = "galaxy.zip")
date() #"Wed Jun 19 18:24:53 2024"
#Unzip the folder and check the files in it
unzip("galaxy.zip")
list.files("UCI HAR Dataset")
list.files("UCI HAR Dataset/test")
list.files("UCI HAR Dataset/train")

#Read and set variable names for all tables needed.
#The datasets with the results are X_test and X_train. 
#We need all the tables to obtain the labels and the activiyies to provide tidy resutls.
features <- read.table("./UCI HAR Dataset/features.txt", col.names = c("n", "variables"))
activity <- read.table("./UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
sub_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names = c("subject"))
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = features$variables)
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = "labels")
sub_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names = c("subject"))
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = features$variables)
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = "labels")

##Start preparing the tidy dataset
#Prepare needed packages
if (!require(dplyr)){install.packages("dplyr")}
library(dplyr)

#1. Merge training and test sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
sub <- rbind(sub_train, sub_test)
data <- cbind(sub, y, x)
head(data[, c(1, 3, 200, 563)])

#2. Extract mean and standard deviation from each mesurement
data_ms <- data |> select(subject, labels, contains(c("mean", "std")))
head(data_ms[, c(1, 2:5, 86:88)])

#3. Use descriptive activity names
#Replace the label of the activity with its actual name
activity[, 2] <- tolower(gsub("_", "", activity[, 2]))
data_ms_a <- data_ms
data_ms_a$labels <- activity[data_ms_a$labels, 2]
head(data_ms_a[, 2])

#4. Label the variables with descriptive names
names(data_ms_a)
#From the names of the variables we can identify several changes that are needed.
#To make sure the next function works, col names shoud be "original" and "new"
variable_changes <- tibble(original = c("labels", "Acc", "Gyro", "Mag", "BodyBody", "^t", "^f"),
                           new = c("activity", "Accelerometer", "Gyroscope", "Magnitude", "Body", "Time", "Frequency"))
#We can create a function that takes our data_ms_a as input, and the table listing the changes needed, variable_changes
#Then produce the new dataset.
edit_names <- function(df, changes) {
    #Check that 'chages' are shaped properly
    if(!all(c("original", "new") %in% colnames(changes))) {
        stop("The 'changes' input must have two columns: 'original' and 'new'.")
    }
    #Creates a vector with the names to edit
    new_names <- colnames(df)
    #Loops through all the required changes. gsub() will read also regular expressions
    for (i in 1:nrow(changes)) {
        new_names <- gsub(changes$original[i], changes$new[i], new_names)
        }
    colnames(df) <- new_names
    return(df)
}

data_ms_a_des <- edit_names(data_ms_a, variable_changes)   
head(data_ms_a_des[, 1:5])
write.csv(data_ms_a_des, file = "data_tidy.csv")

#5. Create a second dataset with the average for each variable per activity and subject.
data_summary <- data_ms_a_des |> 
    group_by(subject, activity) |>
    summarise_all(list(mean))
head(data_summary)
write.csv(data_summary, file = "data_summary.csv")