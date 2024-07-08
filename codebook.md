# Codebook

This is a code book that modifies and updates the available codebooks
with the data to indicate all the variables and summaries calculated,
along with units, and any other relevant information.

## Original dataset:

For each record it is provided:

-   Triaxial acceleration from the accelerometer (total acceleration)
    and the estimated body acceleration.

-   Triaxial Angular velocity from the gyroscope.

-   A 561-feature vector with time and frequency domain variables.

-   Its activity label.

-   An identifier of the subject who carried out the experiment.

This information is contained in the following files:

-   'features_info.txt': Shows information about the variables used on
    the feature vector.

-   'features.txt': List of all features.

-   'activity_labels.txt': Links the class labels with their activity
    name.

-   'train/subject_train.txt': Each row identifies the subject who
    performed the activity for each window sample. Its range is from 1
    to 30.

-   'train/Inertial Signals/total_acc_x_train.txt': The acceleration
    signal from the smartphone accelerometer X axis in standard gravity
    units 'g'. Every row shows a 128 element vector. The same
    description applies for the 'total_acc_x_train.txt' and
    'total_acc_z_train.txt' files for the Y and Z axis.

-   'train/Inertial Signals/body_acc_x_train.txt': The body acceleration
    signal obtained by subtracting the gravity from the total
    acceleration.

-   'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity
    vector measured by the gyroscope for each window sample. The units
    are radians/second.

-   Notes:

    -   Features are normalized and bounded within [-1,1].

    -   Each feature vector is a row on the text file.

Features are named using the following guidance: Variables estimated for
each feature vector for each pattern: '-XYZ' is used to denote 3-axial
signals in the X, Y and Z directions.

-   tBodyAcc-XYZ
-   tGravityAcc-XYZ
-   tBodyAccJerk-XYZ
-   tBodyGyro-XYZ
-   tBodyGyroJerk-XYZ
-   tBodyAccMag
-   tGravityAccMag
-   tBodyAccJerkMag
-   tBodyGyroMag
-   tBodyGyroJerkMag
-   fBodyAcc-XYZ
-   fBodyAccJerk-XYZ
-   fBodyGyro-XYZ
-   fBodyAccMag
-   fBodyAccJerkMag
-   fBodyGyroMag
-   fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

-   mean(): Mean value
-   std(): Standard deviation
-   mad(): Median absolute deviation
-   max(): Largest value in array
-   min(): Smallest value in array
-   sma(): Signal magnitude area
-   energy(): Energy measure. Sum of the squares divided by the number
    of values.
-   iqr(): Interquartile range
-   entropy(): Signal entropy
-   arCoeff(): Autorregresion coefficients with Burg order equal to 4
-   correlation(): correlation coefficient between two signals
-   maxInds(): index of the frequency component with largest magnitude
-   meanFreq(): Weighted average of the frequency components to obtain a
    mean frequency
-   skewness(): skewness of the frequency domain signal
-   kurtosis(): kurtosis of the frequency domain signal
-   bandsEnergy(): Energy of a frequency interval within the 64 bins of
    the FFT of each window.
-   angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window
sample. These are used on the angle() variable: - gravityMean -
tBodyAccMean - tBodyAccJerkMean - tBodyGyroMean - tBodyGyroJerkMean

## Working data

-   'features': this table reads the "features.txt" file, with 561
    observarions of 2 variables ("n" and "variables")
-   'activity': this table reads the "activity_labels.txt" file, with 6
    observations of 2 variables ("code" and "activity")
-   'sub_train': this table reads the "subject_train.txt" file, with
    7352 observations of 1 variable ("subject")
-   x_train: this table reads the "X_train.txt" file, with 7352
    observations of 561 variables (the names taken from the 'variables'
    column in 'features')
-   y_train this table reads the "y_train.txt" file, with 7352
    observations of 1 variable ("labels") col.names = "labels")
-   sub_test: this table reads the "subject_test.txt" file, with 2947
    observations of 1 variable ("subject")
-   x_test: this table reads the "X_test.txt" file, with 2947
    observations of 561 variables (the names taken from the 'variables'
    column in 'features')
-   y_test: this table reads the "y_test.txt" file, with 2947
    observations of 1 variable ("labels")

## Merged datasets

-   'x', 'y', and 'sub': compile the observations of the train and test
    datasets using rbind()
-   'data': binds the former three in a single data frame of 10299
    observations of 563 variables ("subject", "labels", and the vector
    'variables' from 'features')

## Subset of the main data frame collecting only mean and standard deviation, then modify the activity names and use descriptive variable names

-   'data_ms': subset of the 'data' data frame including the identifying
    variables and those containing "mean" and "std", with 10299
    observations of 88 variables

-   'data_ms_a': this is a copy of 'data_ms' replading the code of each
    activity by its real name as provided in the 'activity' data frame

-   'variable_changes': this is a table with 7 observations of 2
    variables ("original" and "new"), each observation identifies the
    origial element in the list of 'variables' from the 'features' table
    and provides the text chunk to describe that feature as follows:

    ```         
    | Original      | New           |
    |---------------|---------------|
    | labels        | activity      |
    | Acc           | Accelerometer |
    | Gyro          | Gyroscope     |
    | Mag           | Magnitude     |
    | BodyBody      | Body          |
    | starts with t | Time          |
    | starts with f | Frequency     |

    : Changes in variable names
    ```

-   'edit_names': function with arguments 'df' = a given data frame, and
    'changes' = the list of changes required with the format of the
    'variable_changes' table. This takes our 'data_ms_a' as input and
    produces the new data set with descriptive names.

-   'data_ms_a_des': output from the 'edit_names' function, a table with
    10299 observations of 88 variables. The final variable list is as
    follows:

    | variable                                          | type|
    |---------------------------------------------------|-----|
    | subject                                           | int |
    | activity                                          | chr |
    | TimeBodyAccelerometer.mean...X                    | num |
    | TimeBodyAccelerometer.mean...Y                    | num |
    | TimeBodyAccelerometer.mean...Z                    | num |
    | TimeGravityAccelerometer.mean...X                 | num |
    | TimeGravityAccelerometer.mean...Y                 | num |
    | TimeGravityAccelerometer.mean...Z                 | num |
    | TimeBodyAccelerometerJerk.mean...X                | num |
    | TimeBodyAccelerometerJerk.mean...Y                | num |
    | TimeBodyAccelerometerJerk.mean...Z                | num |
    | TimeBodyGyroscope.mean...X                        | num |
    | TimeBodyGyroscope.mean...Y                        | num |
    | TimeBodyGyroscope.mean...Z                        | num |
    | TimeBodyGyroscopeJerk.mean...X                    | num |
    | TimeBodyGyroscopeJerk.mean...Y                    | num |
    | TimeBodyGyroscopeJerk.mean...Z                    | num |
    | TimeBodyAccelerometerMagnitude.mean..             | num |
    | TimeGravityAccelerometerMagnitude.mean..          | num |
    | TimeBodyAccelerometerJerkMagnitude.mean..         | num |
    | TimeBodyGyroscopeMagnitude.mean..                 | num |
    | TimeBodyGyroscopeJerkMagnitude.mean..             | num |
    | FrequencyBodyAccelerometer.mean...X               | num |
    | FrequencyBodyAccelerometer.mean...Y               | num |
    | FrequencyBodyAccelerometer.mean...Z               | num |
    | FrequencyBodyAccelerometer.meanFreq...X           | num |
    | FrequencyBodyAccelerometer.meanFreq...Y           | num |
    | FrequencyBodyAccelerometer.meanFreq...Z           | num |
    | FrequencyBodyAccelerometerJerk.mean...X           | num |
    | FrequencyBodyAccelerometerJerk.mean...Y           | num |
    | FrequencyBodyAccelerometerJerk.mean...Z           | num |
    | FrequencyBodyAccelerometerJerk.meanFreq...X       | num |
    | FrequencyBodyAccelerometerJerk.meanFreq...Y       | num |
    | FrequencyBodyAccelerometerJerk.meanFreq...Z       | num |
    | FrequencyBodyGyroscope.mean...X                   | num |
    | FrequencyBodyGyroscope.mean...Y                   | num |
    | FrequencyBodyGyroscope.mean...Z                   | num |
    | FrequencyBodyGyroscope.meanFreq...X               | num |
    | FrequencyBodyGyroscope.meanFreq...Y               | num |
    | FrequencyBodyGyroscope.meanFreq...Z               | num |
    | FrequencyBodyAccelerometerMagnitude.mean..        | num |
    | FrequencyBodyAccelerometerMagnitude.meanFreq..    | num |
    | FrequencyBodyAccelerometerJerkMagnitude.mean..    | num |
    | FrequencyBodyAccelerometerJerkMagnitude.meanFreq. | num |
    | FrequencyBodyGyroscopeMagnitude.mean..            | num |
    | FrequencyBodyGyroscopeMagnitude.meanFreq..        | num |
    | FrequencyBodyGyroscopeJerkMagnitude.mean..        | num |
    | FrequencyBodyGyroscopeJerkMagnitude.meanFreq..    | num |
    | angle.tBodyAccelerometerMean.gravity.             | num |
    | angle.tBodyAccelerometerJerkMean..gravityMean.    | num |
    | angle.tBodyGyroscopeMean.gravityMean.             | num |
    | angle.tBodyGyroscopeJerkMean.gravityMean.         | num |
    | angle.X.gravityMean.                              | num |
    | angle.Y.gravityMean.                              | num |
    | angle.Z.gravityMean.                              | num |
    | TimeBodyAccelerometer.std...X                     | num |
    | TimeBodyAccelerometer.std...Y                     | num |
    | TimeBodyAccelerometer.std...Z                     | num |
    | TimeGravityAccelerometer.std...X                  | num |
    | TimeGravityAccelerometer.std...Y                  | num |
    | TimeGravityAccelerometer.std...Z                  | num |
    | TimeBodyAccelerometerJerk.std...X                 | num |
    | TimeBodyAccelerometerJerk.std...Y                 | num |
    | TimeBodyAccelerometerJerk.std...Z                 | num |
    | TimeBodyGyroscope.std...X                         | num |
    | TimeBodyGyroscope.std...Y                         | num |
    | TimeBodyGyroscope.std...Z                         | num |
    | TimeBodyGyroscopeJerk.std...X                     | num |
    | TimeBodyGyroscopeJerk.std...Y                     | num |
    | TimeBodyGyroscopeJerk.std...Z                     | num |
    | TimeBodyAccelerometerMagnitude.std..              | num |
    | TimeGravityAccelerometerMagnitude.std..           | num |
    | TimeBodyAccelerometerJerkMagnitude.std..          | num |
    | TimeBodyGyroscopeMagnitude.std..                  | num |
    | TimeBodyGyroscopeJerkMagnitude.std..              | num |
    | FrequencyBodyAccelerometer.std...X                | num |
    | FrequencyBodyAccelerometer.std...Y                | num |
    | FrequencyBodyAccelerometer.std...Z                | num |
    | FrequencyBodyAccelerometerJerk.std...X            | num |
    | FrequencyBodyAccelerometerJerk.std...Y            | num |
    | FrequencyBodyAccelerometerJerk.std...Z            | num |
    | FrequencyBodyGyroscope.std...X                    | num |
    | FrequencyBodyGyroscope.std...Y                    | num |
    | FrequencyBodyGyroscope.std...Z                    | num |
    | FrequencyBodyAccelerometerMagnitude.std..         | num |
    | FrequencyBodyAccelerometerJerkMagnitude.std..     | num |
    | FrequencyBodyGyroscopeMagnitude.std..             | num |
    | FrequencyBodyGyroscopeJerkMagnitude.std..         | num |

-   'data_tidy.csv': dataset storing the results of the combined train
    and test data with only mean and standard deviation results, and
    with complete activity names and descriptive variable names.
    
## Summarize the tidy dataset with the average of all the means and standard deviations

-   'data_sumary': a fata frame with 180 observations if 88 variables summarizinf the average of each vector grouped by participant and activity.This is stored in the "data_summary.csv" file.
