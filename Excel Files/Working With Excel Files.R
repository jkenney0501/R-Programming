# using FBI crime data excel file because it is messy
# the objective is to clean it up make it analyzable

library(readxl)

crime_data <- read_xls('./desktop/r-programming/excel files/FBI Crime Data.xls')

# setting column names
colnames(crime_data) = crime_data[3,]


# 1st 3 rows don't matter, row 23 + isn't relevant to the data frame
# view 1st col to see not all are numeric
crime_data[,1]

# apply numeric function to each element of column
# this should return NA where there are no numeric values
sapply(crime_data[,1], as.numeric)

crime_data$converted_index <- sapply(crime_data[,1], as.numeric)

# filter NA rows from data frame, this builds a pipeline so additional files can 
# can be added that may have similar errors yet wont affect the outcome bc of this code.
crime_data_filter <- crime_data[!is.na(crime_data$converted_index),]


# the years have errors or typos, isolate the years to correct the error
# view the Year variable
# two years are typos with 5 digits rather than 4 - 20015, 20156
# according to the order of Year, the typos would be classified as 2001 & 2015
# based on their position
crime_data_filter$Year

# since values aren't yet converted to numeric, sub string can be used here
# store in a variable called years to use as rows names later
Years <- substr(crime_data_filter$Year, 1,4)


# remove/drop some useless columns and add some needed like Years
remove_columns <- c('Year', 'converted_index')

# create new variable for df with removed columns
crime_data_filter_remove <- crime_data_filter[,!colnames(crime_data_filter) %in% remove_columns]


# convert data to numeric - use summary to see
# cant apply is.numeric to the data frame, use s apply
numeric_crime_data <- sapply(crime_data_filter, as.numeric)

# assign row names to numeric crime data - Years
rownames(numeric_crime_data) = Years

summary(numeric_crime_data)








