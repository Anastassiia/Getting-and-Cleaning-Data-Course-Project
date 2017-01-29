library(dplyr);

run_analysis<-function(url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip")
{
  #Downloading zip file and unzip to temporary directory
  download.file(url,"C:\\Users\\Nastya\\Desktop\\R\\DataProject.zip");
  temp<-tempdir();
  temp<-unzip("C:\\Users\\Nastya\\Desktop\\R\\DataProject.zip");
  
  #Create activity labels and features vectors
  activityLabels<-read.table(temp[grep("*activity",temp)]);
  activityLabels<-activityLabels[,2];
  features<-read.table(temp[grep("*features[.]",temp)]);
  features<-features[,2];
  
  #Select features of std and mean
  MeanStdFeatures<-grep("mean|std",features);
  
  #Download data of training and test samples (w/o inertial signals)
  dataTrain<-read.table(temp[grep("X_+train",temp)]);
  subjectTrain<-read.table(temp[grep("subject_+train",temp)]);
  activityTrain<-read.table(temp[grep("/y_train",temp)]);
  dataTest<-read.table(temp[grep("X_+test",temp)]);
  subjectTest<-read.table(temp[grep("subject_+test",temp)]);
  activityTest<-read.table(temp[grep("/y_test",temp)]);
  
  unlink(temp);
  
  #Merge data of interest to one final database
  DataFinal<-rbind(subjectTest,subjectTrain);
  DataFinal<-cbind(DataFinal,rbind(activityTest,activityTrain));
  DataFinal<-cbind(DataFinal,rbind(dataTest[MeanStdFeatures],dataTrain[MeanStdFeatures]));
  
  #Add names to DataFinal
  names(DataFinal)<-c("Subject","Activity",as.character(features[MeanStdFeatures]))
  
  #Replace activity numeric id by label
  DataFinal$Activity<-activityLabels[DataFinal$Activity];
  
  # Create factos for subjects
  tempvec<-distinct(DataFinal,Subject);
  DataFinal$Subject<-factor(as.character(DataFinal$Subject),levels=as.character(tempvec[,]))
  
  #Use data final to create tidy data set with the average of each variable for each activity and each subject
  m<-dim(DataFinal)[2]; 
  
  #Create a grid of different activities and subjects
  x<-levels(DataFinal$Subject);
  y<-levels(DataFinal$Activity);
  NewData<-expand.grid(x,y);
  names(NewData)<-c("Subject","Activity");
  
  #Create a function which computes the average of each characteristic for given subject and activity
  findMean<-function(i){
    ind<-which((DataFinal$Subject==NewData$Subject[i])&(DataFinal$Activity==NewData$Activity[i]));
    DataTemp<-DataFinal[ind,];
    sapply(DataTemp[,3:m],mean);
  }
  
  #Apply findMean to each combination of subject and activity
  NewData<-cbind(NewData,t(sapply(1:dim(NewData)[1],findMean)));
  
  #Save final data set
  write.csv(NewData, file = "C:\\Users\\Nastya\\Desktop\\R\\tidyDataSet.csv")
  
  
  }
