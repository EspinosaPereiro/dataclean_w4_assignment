# Peer-graded Assignment: Getting and Cleaning Data Course Project

The objective of this assignment is to collect, tidy, and summarise data
in a reproducible way. In this repository you will find 1- The tidy
datasets in csv format 2- The scripts needed to check all the steps
performed to get the data tidy 3- A codebook with the variables, the
data, and their transformations

The original data belong to the work performed by Reyes-Ortiz et al,
from the University of Genova. Please see:

Reyes-Ortiz,Jorge, Anguita,Davide, Ghio,Alessandro, Oneto,Luca, and
Parra,Xavier. (2012). Human Activity Recognition Using Smartphones. UCI
Machine Learning Repository. <https://doi.org/10.24432/C54S4K>.

This dataset is distributed AS-IS and no responsibility implied or
explicit can be addressed to the authors or their institutions for its
use or misuse. Any commercial use is prohibited.

The authors performed a series of experiments carried out with 30
volunteers carrying a smarphone on their waist. The data from
accelerometers and gyroscopes was collected during six activities:
walking, walking upstairs, walking downstairs, sitting, standing,
laying). The investigators divided the records in train (70%) and test
(30%) sets.

For the purpose of this excercise, an R script called 'run_analysis' was
created that: 1. Merges the training and the test sets to create one
data set. 2. Extracts only the measurements on the mean and standard
deviation for each measurement. 3. Uses descriptive activity names to
name the activities in the data set 4. Appropriately labels the data set
with descriptive variable names. 5. From the data set in step 4, creates
a second, independent tidy data set with the average of each variable
for each activity and each subject. The results are stored in the
'data_tidy.csv' and the 'data_summary.csv' files.
