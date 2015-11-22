run_analysis <- function() {
        
        #Loading necessary packages
        library(dplyr)
        library(readr)
        library(car)
        library(reshape2)
        
        #Setting the work directory for each case
                if (!file.exists("./data")) {dir.create("./data")}
                workdir <- getwd()
                WD1 <- paste(workdir, "/data/UCI_HAR_Dataset/test/", sep="")
                WD2 <- paste(workdir, "/data/UCI_HAR_Dataset/train/", sep="")
        
                message("Reading input files for Test and Train Data Sets.. pls wait!!")
        
        ##### Getting Test Data Set ######
                
                Subject <- read_lines(paste(WD1, "subject_test.txt", sep = ""))              #Subjects unders test
                Test_Labels <- read_lines(paste(WD1, "y_test.txt", sep = ""))                # Test labels
                DF1 <- read.table(paste(WD1, "X_test.txt", sep = ""), header = FALSE, stringsAsFactors = FALSE) 
        
                DF_TEST <- cbind(Subject, Test_Labels, DF1)                                     
        
   
        ##### Getting Training Data Set ######
        
                Subject <- read_lines(paste(WD2, "subject_train.txt", sep = ""))
                Test_Labels <- read_lines(paste(WD2, "y_train.txt", sep = ""))
                DF2<- read.csv(paste(WD2, "X_train.csv", sep = ""), header = FALSE, stringsAsFactors = FALSE)
                
       
                DF_TRAIN <- cbind(Subject, Test_Labels, DF2)
                

        ##### Putting all together // clearing and giving names to columns  ######
                
                message("Merging DFs .....")
                DF_BOTH <- rbind(DF_TRAIN, DF_TEST, deparse.level = 0)
        
  
                Tablein <-read.table("./data/UCI_HAR_Dataset/features.txt")
                FeatureNames <- Tablein$V2
                FeatureNames <- gsub("\\()", "", FeatureNames)
                FeatureNames <- tolower(FeatureNames)
                
                colnames(DF_BOTH) <- c("subject","activity", FeatureNames)            # Column-named DF
                DF_BOTH <-  DF_BOTH[ ,grep("TRUE", !duplicated(FeatureNames))]        # Stripping Duplicates
      
        ##### Getting the required tidy Data Set ######
               #Selecting variables which contain mean|std
                DF_FINAL <- select(DF_BOTH, 1:2, contains("mean"), contains("std"))
                
                #rename variables with double "body" word
                doublebodyword <- grep("bodybody", names(DF_FINAL))
                fixednames <- c("fbodyaccjerkmag-mean","fbodyaccjerkmag-meanfreq","fbodygyromag-mean","fbodygyromag-meanfreq","fbodygyrojerkmag-mean","fbodygyrojerkmag-meanfreq","fbodyaccjerkmag-std","fbodygyromag-std","fbodygyrojerkmag-std")
                            
                colnames(DF_FINAL)[doublebodyword] <- fixednames
                
        ##### Naming the Activity variable for each observation ######

                # 1 WALKING
                # 2 WALKING_UPSTAIRS
                # 3 WALKING_DOWNSTAIRS
                # 4 SITTING
                # 5 STANDING
                # 6 LAYING   
        
                #using recode function from car package helps assing colmun names
                DF_FINAL$activity <- recode(DF_FINAL$activity, '1="WALKING"; 2="WALKING_UPSTAIRS"; 3="WALKING_DOWNSTAIRS"; 4="SITTING"; 5="STANDING"; 6="LAYING"')
        
        #### Providing Tidy Data #######
                message("Providing Tidy Data...")
                #all tidy DF
                #write.table(DF_FINAL, file = "MergeDF.csv", row.names = FALSE, sep = ",", col.names = TRUE)

                #from reshape2 package: melting based on ID Variables = Subject, Activity
                DFmelt <- melt(DF_FINAL, id=c("subject","activity"))
                
                MeanDF <- dcast(DFmelt, subject + activity ~ variable,mean)
                MeanDF <- arrange(MeanDF, subject,  desc(activity))
                #write.table(MeanDF, file = "TidiedDF.csv",row.names = FALSE, col.names = TRUE, sep = ",")
                write.table(MeanDF, file = "TidiedDF.txt", row.name = FALSE, col.names = TRUE, sep = " ")

}