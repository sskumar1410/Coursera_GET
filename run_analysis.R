#Task1 Merges the training and the test sets
#a) Merging the X datasets
   x_test<-read.table("course3/X_test.txt") 
    x_train<-read.table("course3/X_train.txt")
    x_whole<-rbind(x_test,x_train)
  #  dim(x_whole)
   
   #Task 2 Extracting the mean and standard deviation
   
   #Reading features names
   features<-read.table('course3/features.txt')
   features<-features[,2]
   
   #  setting the names
   x_whole<-setNames(x_whole,features)
   x_whole<-x_whole[,grep('[Mm]ean|std',names(x_whole))]
   x_whole<-x_whole[,!grepl('[Ff]req|angle',names(x_whole))]   

   
#b)Merging Y  datasets
   
   y_test<-read.table('course3/y_test.txt')
   y_train<-read.table('course3/y_train.txt')
   Activity<-rbind(y_test,y_train)
   Activity<-setNames(Activity,'id')
   
   
#c) Merging subject datasets
   
  subject_test<-read.table('course3/subject_test.txt')
  subject_train<-read.table('course3/subject_train.txt')
  Subject<-rbind(subject_test,subject_train) 
  Subject<-setNames(Subject,'Subject')
   
   
# Combining all the datasets
  Alldata<-cbind(Subject,Activity,x_whole)
   
   
   
  
# Task3 Naming the actvities
   
   Activity_label<-read.table('course3/activity_labels.txt')
   Activity_label<-setNames(Activity_label,c('id','Activity'))
   
Alldata<-merge(Alldata,Activity_label,by='id',all=TRUE)
 
Alldata<-Alldata[,c(2,69,3:68)]

   
   
# Task 4 Giving Descriptive Names   
   
 Names<-names(Alldata)
     Names<-gsub('^f','FrequencySignal',Names)
   Names<-gsub('^t','TimeSignal',Names)
   Names<-gsub('Acc','Accleration',Names)
   Names<-gsub('Mag','Magnitude',Names)
   Names<-gsub('Gyro','Gyroscope',Names)
   Names<-gsub('mean','MeanValue',Names)
   Names<-gsub('std','StandardDeviation',Names)
   Names<-gsub('X','Xaxis',Names)
   Names<-gsub('Y','Yaxis',Names)
   Names<-gsub('Z','Zaxis',Names)
   Names<-gsub('-',"",Names)
   Names<-gsub('\\(',"",Names)
   Names<-gsub('\\)',"",Names)
 #  Names<-tolower(Names)
   
  Alldata<-setNames(Alldata,Names)
   
   
#Task 5 mean Function
   
   Aggr<-aggregate(Alldata[3:68],by=list(Alldata$Subject,Alldata$Activity),FUN=mean,na.rm=TRUE)
   Aggr<-setNames(Aggr,Names)
 
   write.table(Aggr,file="TidyData.txt",row.names=FALSE,col.names=TRUE,sep=',')
   
    
   
   
   
   
   
   
   
   
   