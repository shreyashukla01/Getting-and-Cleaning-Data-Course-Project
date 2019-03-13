## download the zip file from the given link
## location of the zip file is ./data as dataset.zip file
## after downloading extract it manually
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url,destfile = "./data/dataset.zip")

## create a single dataset named "mergedDataSet"
## using different files from test and train data set
## below is the code to create directories and merge the train and test data sets
## and creating new files with merged data set

dir.create("./data/dataset/mergedDataSet")
dir.create("./data/dataset/mergedDataSet/trainandtest")
dir.create("./data/dataset/mergedDataSet/trainandtest/Intertial Signals")

## merging X_train and X_test
Xtable1<-read.table("./data/dataset/UCI HAR Dataset/train/X_train.txt")
Xtable2<-read.table("./data/dataset/UCI HAR Dataset/test/X_test.txt")
Xtable<-rbind(Xtable1,Xtable2)

## merging y_train and y_test
Ytable1<-read.table("./data/dataset/UCI HAR Dataset/train/y_train.txt")
Ytable2<-read.table("./data/dataset/UCI HAR Dataset/test/y_test.txt")
Ytable<-rbind(Ytable1,Ytable2)

## merging subject_train and subject_test
SubjectTable1<-read.table("./data/dataset/UCI HAR Dataset/train/subject_train.txt")
SubjectTable2<-read.table("./data/dataset/UCI HAR Dataset/test/subject_test.txt")
SubjectTable<-rbind(SubjectTable1,SubjectTable2)

## writing merged data sets to files
write.table(Xtable,"./data/dataset/mergeddataset/trainandtest/timeAndFrequencyVar.txt")
write.table(Ytable,"./data/dataset/mergeddataset/trainandtest/activitylabel.txt")
write.table(SubjectTable,"./data/dataset/mergeddataset/trainandtest/subjects.txt")

## merging 3 axial body_gyro, body_acc and total_acc data of train and test set

gyrox1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_x_train.txt")
gyrox2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_x_test.txt")
gyrox<-rbind(gyrox1,gyrox2)

gyroy1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_y_train.txt")
gyroy2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_y_test.txt")
gyroy<-rbind(gyroy1,gyroy2)

gyroz1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/body_gyro_z_train.txt")
gyroz2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/body_gyro_z_test.txt")
gyroz<-rbind(gyroz1,gyroz2)

totalacc1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_x_train.txt")
totalacc2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_x_test.txt")
totalacc<-rbind(totalacc1,totalacc2)

totalaccy1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_y_train.txt")
totalaccy2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_y_test.txt")
totalaccy<-rbind(totalaccy1,totalaccy2)

totalaccz1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/total_acc_z_train.txt")
totalaccz2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/total_acc_z_test.txt")
totalaccz<-rbind(totalaccz1,totalaccz2)

bodyaccx1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_x_train.txt")
bodyaccx2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_x_test.txt")
bodyaccx<-rbind(bodyaccx1,bodyaccx2)

bodyaccy1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_y_train.txt")
bodyaccy2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_y_test.txt")
bodyaccy<-rbind(bodyaccy1,bodyaccy2)

bodyaccz1<-read.table("./data/dataset/UCI HAR Dataset/train/Inertial Signals/body_acc_z_train.txt")
bodyaccz2<-read.table("./data/dataset/UCI HAR Dataset/test/Inertial Signals/body_acc_z_test.txt")
bodyaccz<-rbind(bodyaccz1,bodyaccz2)

## writing merged data to "trainandtest" directory under "Intertial Signals" directory

write.table(gyrox,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/body_gyro_x.txt")
write.table(gyroy,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/body_gyro_y.txt")
write.table(gyroz,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/body_gyro_z.txt")

write.table(totalacc,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/total_acc_x.txt")
write.table(totalaccy,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/total_acc_y.txt")
write.table(totalaccz,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/total_acc_z.txt")

write.table(bodyaccx,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/body_acc_x.txt")
write.table(bodyaccy,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/body_acc_y.txt")
write.table(bodyaccz,file = "./data/dataset/mergedDataSet/trainandtest/Inertial Signals/body_acc_z.txt")

##2.Extracting only the measurements on the mean and standard deviation for each measurement.

tab<-read.table("./data/dataset/mergedDataSet/features.txt")
names<-as.character(tab$V2)
colnames(Xtable)<-names
result<-Xtable[,grep(".*mean()|.*std()", colnames(Xtable))]

## 3. Using descriptive activity names to name the activities in the data set
##Editing the activity label file with descriptive information

Ytable$V1<-sapply(Ytable$V1,function(x) x<-switch(x,"WALKING","WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))


## 4. Appropriately labeling the data set with descriptive variable names.
## Since the columns of Xtable data frame were taken from the features file earlier. Saving it now in the data set.

write.table(Xtable,"./data/dataset/mergeddataset/trainandtest/timeAndFrequencyVar.txt")



##5. From the data set in step 4, created a second, independent tidy data set with the average of each variable for each activity and each subject.

second<-cbind(Xtable,Ytable,SubjectTable)
colnames(second)[562]<-"activity"
colnames(second)[563]<-"subject"
avgData<-aggregate(second[colnames(Xtable)], by=list(subject=second$subject, activity = second$activity), FUN=mean)
##easy to read csv file
write.csv(avgData,file = "./data/dataset/mergedDataSet/trainandtest/avgData.csv")
##similar txt file
write.table(avgData,file = "./data/dataset/mergedDataSet/trainandtest/avgData.txt", row.names = FALSE)


