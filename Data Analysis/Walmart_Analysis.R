# load the Walmart data and feature files
getwd()

walmart_data <- read.csv('./Desktop/R-Programming/Data Analysis/walmart_data.csv')

walmart_features <- read.csv('./Desktop/R-Programming/Data Analysis/walmart_features.csv')


# store the number of rows in a var called n_rows
n_rows <- nrow(walmart_data)

# structure summary for vars
str(walmart_data)

# summary for quant vars - 6 #
summary(walmart_data)

# new var with row count
n_rows
# 421570


# print the 1st 5 rows of the data from Walmart data
head(walmart_data, 5)



# count the number of rows per store using table
# and store the resulting object in R with the name:
# rows_per_store

# rows per store var - RETURNS VECOTR WITH STORES CODED
rows_per_store <- table(walmart_data$Store)

# convert rows per store into a data frame
rows_per_store <- as.data.frame(rows_per_store)


# which store has the most rows?

# order
rows_per_store[order(rows_per_store$Freq, decreasing = TRUE),]

max(rows_per_store$Freq)

# sum the sales per store and store data in sum_by _store 
sum_by_store <- aggregate(
  x = walmart_data$Weekly_Sales,
  by = list(walmart_data$Store),
  FUN = sum
)


# ------ Modifying Column Names -------
# rename the columns as store_number and total_sales
colnames(sum_by_store) = c('store_number', 'total_sales')

head(sum_by_store, 2)
#   store_number total_sales
#1            1   222402809
#2            2   275382441


# ----- Plot bar plot using base R by sorting total sales
# from sales w/most sales to least sales
# give title to the plot "Sales by Store"
# color the bars green
# ignore x labels for now

barplot(sum_by_store[order(- sum_by_store$total_sales),'total_sales'],
        main = "Sales by Store",
        col = 'green',
        xlab = 'store',
        ylab = 'sales'
        )

# extract the mean of every column from Walmart features csv
sapply(X=walmart_features, FUN = mean, na.rm = TRUE)


# create a new column in wm features called: standardized_cpi
# subtracting the mean and dividing by standard deviation

# 1st get mean of CPI, it has na so remove them
mean(walmart_features$CPI, na.rm=TRUE)
# [1] 172.4608

# standardize - Negative values are on left of distribution, positive on right
# create new col
walmart_features['standardized_cpi'] = 
(
  (walmart_features$CPI - mean(walmart_features$CPI, na.rm=TRUE))
  /
  sd(walmart_features$CPI, na.rm=TRUE)
)


# Plotting the sales by date for specific store - number 1
# add labels to x and y

# filter store 1
store_1 <- walmart_data[walmart_data$Store==1,]

nrow(store_1)
# [1] 10244

# aggregate sales by date
store_1_total <- aggregate(
  x = store_1$Weekly_Sales,
  by = list(store_1$Date),
  FUN = sum
)

# create a scatter
plot(
  x=store_1_total$Group.1,
  y=store_1_total$x,
  xlab='Date',
  ylab='Sales'
)

# add lines
lines(
  x=store_1_total$Group.1,
  y=store_1_total$x
)













