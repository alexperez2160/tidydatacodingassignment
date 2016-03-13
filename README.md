# tidydatacodingassignment
coursera data assignment
For this assignment, I first read each data set separately: the test, its activity labels, and the subject ID. I did the same for the train information, reading train, its labels and the subject ID> Then, I used cbind to create a complete file of test and train. 
I labeled the variables and attached the subject and activity information to the test and train data sets. F 

I merged the test and train files using rbind, since the test and train data sets had different subjects. 

I used the grepl function to identity the mean and standard deviation variable names and then subsetted it into a new data.table. 

After this, I converted the merged data set to a data table and finally found the mean for each variable by subjet ID.

