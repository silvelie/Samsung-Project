

1. Data is stored in two directories: /test and /train.

2. Variables (rbind() method to combine them): 
     + subject_combined: combines subject_test and subject_train
     + x_combined: combines x_test and x_train
     + y_combined: combines y_test and y_train

3. Each variable was named with the names() method. 

4. Key variables
   + gross_data - data frame that includes subject, activity label, activity name and all features measured ( cbind() method
    was used to unite the data frames). To add the activity labes and names I used left_join() method using the the ActivityLabel            variable as the joining variable.
   + slim_data - from the gross_data data frame I extracted columns using the select() and the matches() methods
    and a regular expresion.
   + tidy_data - a summary of the data set grouped by subject and activity with corresponding means for each variable.
