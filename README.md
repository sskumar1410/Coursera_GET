Coursera_GET
============

Folder for the project for the Course GETTING AND CLEANING DATA 


In this exercise we are merging the given data sets 
Test and Training Data


 Test Datasets :  ( Dimensions)
 1) X_test.txt   ( 2947 * 561)
 2) y_test.txt   (2947 * 1)
 3) subject_test  ( 2947 * 1) 
 
 Training Datasets :
 
 1) X_training.txt ( 7352*561)
 2) y_training.txt (7352,1)
 3) subject_training.txt (7352,1)
 
 Activity Dataset
 
 1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING
 
 Steps Invloved:
  
  1) Rowbinding  X_test,Y_training datasets.     (10299*561)
  2) Extracting only mean and standard deviation ( excluding the ones with angles and frequency) ( 10299* 66)
  3) Rowbinding subject_training,subject_test datasets (10299*1)
  4) Rowbinding y_test,y_training datasets (10299*1)
  5) Merging(Column Binding) all the above datasets(10299 * 68)
  6) Naming the activities by using activity dataset ( 10299*68)
  7) Providing descriptive names to all the variables with the help of command gsub
  8) Finding the aggregate mean for all the variables ( group by activity and Subject)
  So the dimension of the final dataset will be 180( 6 Activities * 30 Subjects)  * 68 (Tidydata.txt)
  
  
 
