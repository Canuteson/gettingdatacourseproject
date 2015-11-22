library(plyr)
library(dplyr)
library(reshape2)

features <- read.table('features.txt')[,2]
featuresIndex <- grep(".+mean.+", features)
interesting <- features[c(featuresIndex)]
activity_labels <- read.table("activity_labels.txt")

testData <- read.table("test/X_test.txt")
names(testData) <- features
testData <- testData[,c(interesting)]
testData$subject <- as.integer(readLines("test/subject_test.txt"))
testData$activity <- as.integer(readLines("test/y_test.txt"))

trainData <- read.table("train/X_train.txt")
names(trainData) <- features
trainData <- trainData[,c(interesting)]
trainData$subject <- as.integer(readLines("train/subject_train.txt"))
trainData$activity <- as.integer(readLines("train/y_train.txt"))

allData <- join(testData, trainData, type = "full")

allData <- mutate(allData, activityLabel = factor(allData$activity, levels = activity_labels[,1], 
                                                  labels = activity_labels[,2]))

melted <- melt(allData, id.vars = c("subject", "activityLabel"))
tidyData <- dcast(melted, subject + activityLabel ~ variable, mean)
write.table(tidyData, file = "tidydata.txt", row.name=FALSE)