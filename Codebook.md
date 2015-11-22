Codebook
========

This assignment was intended to create a script able to read data from some specific source
and then provide a compile file from some specific measurements (variables) from input

The run_analysis.R script takes inputs provided on the original data which was saved locally under "data" directory

It will use read_table and read_lines functions to get information provided to be merged.

From one side, there is a whole Data Set called DF_TEST, which is the merge for all result of Test experiment

On the other hand, there is a second Data Set called DF_TRAIN which contains the whole information for Training experiment


In order to get the tidy data the following steps were performed
    - First merge DF_TRAIN and DF_TEST to get a complete compilation of both experiments
    - Merging of above data set result in DF_BOTH dataframe
    - Cleaning on names was done by removing invalid characters like "()" in the variable names.
    - Variable called FeatureNames stores valid names
    - tolower() function was used to force all variable names lowercase
    - Besides, duplicated variables were removed in order to get a valid columns when renaming.
    - Some other variables were fixed a double word

        [1] "fbodybodyaccjerkmag-mean"      "fbodybodyaccjerkmag-meanfreq"  "fbodybodygyromag-mean"         "fbodybodygyromag-meanfreq"
        [5] "fbodybodygyrojerkmag-mean"     "fbodybodygyrojerkmag-meanfreq" "fbodybodyaccjerkmag-std"       "fbodybodygyromag-std"
        [9] "fbodybodygyrojerkmag-std"

    - Above steps were finishing with creation of a polished DF_BOTH data frame
    - Activity code was also renamed with actual test labels, forming the DF_FINAL data frame

                # 1 WALKING
                # 2 WALKING_UPSTAIRS
                # 3 WALKING_DOWNSTAIRS
                # 4 SITTING
                # 5 STANDING
                # 6 LAYING


    - From the resulting data set, only variables with mean and std were selected to create the final data set. Results are saved
      into the home directory as TidiedDF.csv file. This part was achieved by using function melt of reshape2 package

    - TidiedDF.csv shows the average of all variables selected (mean|std) in relation with each subject and each activity

The resulting data set is composed of 88 variables (Subject, Activity, and 86 measures covering avg and std from experiment)


VARIABLES IN DETAIL
=====================

Variables are intended to measure acceleration and Jerk

Accelerations are vector quantities (they have magnitude and direction - XYZ)

"Jerk" is the time rate of change of acceleration. It is the acceleration of the acceleration.

A set of variables denote linear acceleration and angular velocity.

Acceleration signal was separated into body and gravity acceleration signals

Values are gathered through the sensor signals (accelerometer and gyroscope)

Time Domain Variables: Start with "t"

Frequency Domain Variables: Start with "f"



VARIABLES DESCRIPTION
=====================
"subject"       ID for the person subject to test. Range 1-30 individuals

"activity"      ID for the type of activity
				        1 WALKING
                		2 WALKING_UPSTAIRS
                		3 WALKING_DOWNSTAIRS
                		4 SITTING
                		5 STANDING
                		6 LAYING

"tbodyacc-mean-x"       (m/s2); "metre per second per second"
            Avg body acceleration in X direction


"tbodyacc-mean-y"	    (m/s2); "metre per second per second"
            Avg body acceleration in Y direction


"tbodyacc-mean-z"	      (m/s2); "metre per second per second"
            Avg body acceleration in Z direction


"tgravityacc-mean-x"    (m/s2); "metre per second per second"
            Avg gravity acceleration in X direction


"tgravityacc-mean-y"    (m/s2); "metre per second per second"
            Avg gravity acceleration in Y direction


"tgravityacc-mean-z"    (m/s2); "metre per second per second"
            Avg gravity acceleration in Z direction


"tbodyaccjerk-mean-x"   (m/s2); "metre per second per second"
            Avg Jerk Signal for body acceleration in X direction


"tbodyaccjerk-mean-y"
            Avg Jerk Signal for body acceleration in Y direction


"tbodyaccjerk-mean-z"   (m/s2); "metre per second per second"
            Avg Jerk Signal for body acceleration in Z direction


"tbodygyro-mean-x" 	    (m/s2); "metre per second per second"
            Avg body gyroscope acceleration in X direction


"tbodygyro-mean-y"      (m/s2); "metre per second per second"
            Avg body gyroscope acceleration in Y direction


"tbodygyro-mean-z"      (m/s2); "metre per second per second"
            Avg body gyroscope acceleration in Z direction


"tbodygyrojerk-mean-x"  (m/s2); "metre per second per second"
            Avg Jerk Signal for body gyroscope acceleration in X direction


"tbodygyrojerk-mean-y"  (m/s2); "metre per second per second"
            Avg Jerk Signal for body gyroscope acceleration in X direction


"tbodygyrojerk-mean-z"  (m/s2); "metre per second per second"
            Avg Jerk Signal for body gyroscope acceleration in X direction


"tbodyaccmag-mean"      (m/s2); "metre per second per second"
            Avg Magnitude for body acceleration


"tgravityaccmag-mean"   (m/s2); "metre per second per second"
            Avg Magnitude for gravity acceleration


"tbodyaccjerkmag-mean"  (m/s2); "metre per second per second"
            Avg Magnitude for Jerk Signal on body acceleration


"tbodygyromag-mean"     (m/s2); "metre per second per second"
            Avg Magnitude for body gyroscope acceleration


"tbodygyrojerkmag-mean" (m/s2); "metre per second per second"
            Avg Magnitude for Jerk Signal on body gyroscope acceleration


"fbodyacc-mean-x"       (Hz)
            Fast Fourier Transform  applied to  tbodyacc-mean-x


"fbodyacc-mean-y"       (Hz)
            Fast Fourier Transform  applied to  tbodyacc-mean-y


"fbodyacc-mean-z"       (Hz)
            Fast Fourier Transform  applied to  tbodyacc-mean-z


"fbodyacc-meanfreq-x"   (Hz)
            Avg Frequency over signal-x for body acceleration


"fbodyacc-meanfreq-y"   (Hz)
            Avg Frequency over signal-y for body acceleration


"fbodyacc-meanfreq-z"   (Hz)
            Avg Frequency over signal-z for body acceleration


"fbodyaccjerk-mean-x"   (Hz)
            Fast Fourier Transform  applied to tbodyaccjerk-mean-x


"fbodyaccjerk-mean-y"   (Hz)
            Fast Fourier Transform  applied to tbodyaccjerk-mean-y


"fbodyaccjerk-mean-z"   (Hz)
            Fast Fourier Transform  applied to tbodyaccjerk-mean-z


"fbodyaccjerk-meanfreq-x"   (Hz)
            Avg Frequency for signal Jerk on axis x


"fbodyaccjerk-meanfreq-y"   (Hz)
            Avg Frequency for signal Jerk on axis y


"fbodyaccjerk-meanfreq-z"   (Hz)

            Avg Frequency for signal Jerk on axis z

"fbodygyro-mean-x"
            Fast Fourier Transform  applied to tbodygyro-mean-x

"fbodygyro-mean-y"
            Fast Fourier Transform  applied to tbodygyro-mean-y

"fbodygyro-mean-z"
            Fast Fourier Transform  applied to tbodygyro-mean-z


"fbodygyro-meanfreq-x"  (Hz)
            Avg Frequency over signal-x for body gyroscope acceleration


"fbodygyro-meanfreq-y"  (Hz)
            Avg Frequency over signal-y for body gyroscope acceleration


"fbodygyro-meanfreq-z"  (Hz)
            Avg Frequency over signal-z for body gyroscope acceleration


"fbodyaccmag-mean"
            Avg Magnitude for body acceleration in frequency domain


"fbodyaccmag-meanfreq"      (Hz)
            Avg frequency for Magnitude of body acceleration


"fbodyaccjerkmag-mean"
            Avg Magnitude for body acceleration on signal Jerk


"fbodyaccjerkmag-meanfreq"  (Hz)
            Avg frequency for Magnitude of body acceleration in signal Jerk

"fbodygyromag-mean"
            Avg Magnitude for body gyroscope acceleration in frequency domain


"fbodygyromag-meanfreq"     (Hz)
            Avg Frequency for Magnitude of body gyroscope acceleration


"fbodygyrojerkmag-mean"     (Hz)
            Avg Magnitude for body gyroscope acceleration on signal Jerk


"fbodygyrojerkmag-meanfreq" (Hz)
            Avg Frequency for body gyroscope acceleration in frequency domain signal Jerk


"angle(tbodyaccmean,gravity)"           Grade (º)
            Angle between avg body acceleration and gravity


"angle(tbodyaccjerkmean),gravitymean)"  Grade (º)
            Angle between avg body signal Jerk and avg gravity


"angle(tbodygyromean,gravitymean)"      Grade (º)
            Angle between avg body gyroscope acceleration and avg gravity


"angle(tbodygyrojerkmean,gravitymean)"  Grade (º)
            Angle between avg body acceleration signal Jerk and avg gravity


"angle(x,gravitymean)"      Grade (º)
            Angle between X axis and avg gravity


"tbodyacc-std-x"        (m/s2); "metre per second per second"
            Standard deviation for body acceleration X direction


"tbodyacc-std-y"        (m/s2); "metre per second per second"
            Standard deviation for body acceleration in Y direction


"tbodyacc-std-z"        (m/s2); "metre per second per second"
            Standard deviation for body acceleration in Z direction


"tgravityacc-std-x"     (m/s2); "metre per second per second"
            Standard deviation for gravity acceleration in X direction


"tgravityacc-std-y"     (m/s2); "metre per second per second"
            Standard deviation for gravity acceleration in Y direction


"tgravityacc-std-z"     (m/s2); "metre per second per second"
            Standard deviation for gravity acceleration in Z direction


"tbodyaccjerk-std-x"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration signal Jerk in X-direction


"tbodyaccjerk-std-y"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration signal Jerk in Y-direction


"tbodyaccjerk-std-z"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration signal Jerk in Z-direction


"tbodygyro-std-x"   (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration in X-direction


"tbodygyro-std-y"   (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration in Y-direction


"tbodygyro-std-z"   (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration in Z-direction


"tbodygyrojerk-std-x"   (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration signal Jerk in X-direction


"tbodygyrojerk-std-y" (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration signal Jerk in Y-direction


"tbodygyrojerk-std-z" (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration signal Jerk in Z-direction


"tbodyaccmag-std"
            Standard deviation for magnitude of body acceleration


"tgravityaccmag-std"
            Standard deviation for magnitude of gravity acceleration


"tbodyaccjerkmag-std"
            Standard deviation for magnitude of body acceleration signal Jerk


"tbodygyromag-std"
            Standard deviation for magnitude of body acceleration


"tbodygyrojerkmag-std"
            Standard deviation for magnitude of body gyroscope acceleration signal Jerk


"fbodyacc-std-x"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration in X-direction


"fbodyacc-std-y"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration in Y-direction


"fbodyacc-std-z"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration in Y-direction


"fbodyaccjerk-std-x"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration signal Jerk in X-direction


"fbodyaccjerk-std-y"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration signal Jerk in Y-direction


"fbodyaccjerk-std-z"    (m/s2); "metre per second per second"
            Standard deviation for body acceleration signal Jerk in Z-direction


"fbodygyro-std-x"   (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration in X-direction


"fbodygyro-std-y"   (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration in X-direction


"fbodygyro-std-z"   (m/s2); "metre per second per second"
            Standard deviation for body gyroscope acceleration in X-direction


"fbodyaccmag-std"
            Standard deviation for Magnitude of body acceleration vector


"fbodyaccjerkmag-std"
            Standard deviation for Magnitude of body acceleration signal Jerk


"fbodygyromag-std"
            Standard deviation for Magnitude of gyroscope vector


"fbodygyrojerkmag-std"
            Standard deviation for magnitude of gyroscope vector signal Jerk
