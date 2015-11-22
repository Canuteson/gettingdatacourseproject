## Activity Data from Wearables

Data was assembled by joining two dataframes constructed from test data and training data

Test data test/subject_test.txt, X_test.txt, and y_test.txt.

Training data was assembled from train/subject_train.txt, X_train.txt, and y_train.txt.

Observation name labels were added to each data set from features.txt

Each dataset was filtered to include only measurements with the "interesting" columns, which cinclude "mean" and "std" in teh column names.

The Two data frames were joined using a the Join function from the plyr package with a join type of "full" to include all of the data.

Friendly activity labels were added to the dataset by mutating the data frame along the activity factor and adding appropriate values from activity_labels.txt.

Finally, the full data set was melted to group data by subject and activity type, and then cast back to a wide format table using the mean aggregation function.
