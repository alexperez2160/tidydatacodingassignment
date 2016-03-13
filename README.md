# tidydatacodingassignment
coursera data assignment
For this assignment, I labeled the variables and attached the subject and activity information to the test and train data sets. For each variable name, I had to read the .txt file and the convert it to a vector before finally attaching the labels to the data sets. 

I merged the file using rbind, since the test and train data sets had different subjects. 

I used the grepl function to identity the mean and standard deviation variable names and then subsetted it into a new data.table. 

After this, I converted the merged data set to a data table and finally found the mean for each variable by subjet ID.

