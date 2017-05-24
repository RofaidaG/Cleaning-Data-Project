run_analysis <- function (){
        # temp <- tempfile()
       # download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",temp)
        #data <- read.table(unz("project.zip", "a1.dat"))
        #unlink(temp)
        
#create list of data frames from reading the txt files
temp <- list.files(path="C:/Users/rofaida.goda/Documents/Cleaning Data Course/UCI HAR Dataset", pattern=".txt")
filelist = list2env(lapply(setNames(temp, 
                         tolower(gsub("*.txt$", "", temp)), 
                     read.table), envir = .GlobalEnv))
#merging all X data (train and test)
xdata = rbind(X_train,X_test)

#merging the y data which is the activity number
ydata = rbind(y_train,y_test)
# replace the activity number with activity name 
ydata[,1] = activity_labels[ydata[,1],2]

#merging the observcations names
subject = rbind(subject_train, subject_test)

colnames(xdata) = as.character(featuers[,2])

## return a vector of the indeces where "mean()" or "std()" pharses exist
## in the header of the data set
exist = which(sapply(colnames(xdata), function (x) grepl(".*(mean|std)\\(\\).*",x)))

#filter the data set with the above vector
data = xdata [,exist]

#rebind the whole 
data = cbind(subject,xdata[,exist],ydata)
#create header of the new data set
names(data)[length(names(data))] = "Activity";names(data)[1] = "subject"

#writing the data into file
write.table(data,"./tidydata.txt")

library("dplyr")
#summarizing the data
averages_data <- ddply(data, .(subject, Activity), function(x) colMeans(x[, 2:67]))
#writing the summarized data into txt file
write.table(data,"./tidysummarizeddata.txt")

}
