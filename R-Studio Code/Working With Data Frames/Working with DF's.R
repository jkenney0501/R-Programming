# Exploring df's with R data that is available to us
# to get R data - use data() - this shows a list of data sets to choose
data()

# to see the set, enter the name in the data function like below
data(mtcars)

# lets look at the head and tail of the set
head(mtcars, n=5)

# last 5 rows
tail(mtcars, n=5)

# to view types of data in the table use str()
str(mtcars)

# get names of cols/rows
rownames(mtcars)

colnames(mtcars)

# get a summary-dist of vars-6 num summary
summary(mtcars)



# ------------------- Filtering Data Frames -------------------------------
data(mtcars)

# filter rows
# return data set where 'cyl' == 4
mtcars_4 <- mtcars[mtcars$cyl == 4,]
# returns rows with only 4 cylinder cars-11 obs

# return data with multiple conditions OR - only 1 must be true
# where cylinder is 4 or 6
mtcars[(mtcars$cyl == 4) | (mtcars$cyl == 6),] 

# using the AND & -  Both must be true
nrow(mtcars[(mtcars$cyl == 4) & (mtcars$gear == 3),])

mtcars[(mtcars$cyl == 4) & (mtcars$gear == 3),]
#1 row - Toyota Corona

# extract all cars that are not 4 cylinder
nrow(mtcars[mtcars$cyl != 4,])
#21 rows


# If there are multiple selections, use a vector rather than a bunch of |'s
# using %IN% clause
# less code is cleaner code!
cyl_list <- c(4,6)

mtcars[mtcars$cyl %in% cyl_list,] 


# extract cars with 100-105 hp
mtcars[(mtcars$hp > 100) & (mtcars$hp < 110),]
# 2 rows


# ------------------- Creating new columns ----------------------------------
# get the ratio of horse power divided by weight from mtcars
# this is a derived column and needs to be created.

# outputs numeric vector
mtcars$hp

mtcars$wt

# divide the vars to get the ratio
mtcars$hp/mtcars$wt

# now add the var to the DF - now 12 vars
mtcars$hp_wt <- mtcars$hp/mtcars$wt

# new expression - reload mtcars
data("mtcars")

# you can also do named notation to create the same thing
mtcars[,'hp_wt'] <- mtcars[,'hp']/mtcars[,'wt']
# now 12 vars, same outcome

# create a column based on row names
mtcars$model <- rownames(mtcars)


# ---------------- Apply Family --------------------------------------------
# using example from above column names - with diff data set
data(iris)

# understanding impact of having a char column with apply function
# apply lets you apply different functions across different elements.
?apply() # see details

# extract max value for each column, char is alphabetical
apply(iris, MARGIN = 2, FUN = max)

?lapply()
# extract mean value of all using "lapply"
# using only apply will cause an error sue to the char column but lapply will not throw errors
# Note: MARGING = 2 is not needed for lapply
lapply(X = iris, FUN = mean)

#$Sepal.Length
#[1] 5.843333

#$Sepal.Width
#[1] 3.057333

#$Petal.Length
#[1] 3.758

#$Petal.Width
#[1] 1.199333

#$Species
#[1] NA

mean(iris[,1])
#[1] 5.843333


# --------------- sapply ----------------------------
# laaply returns list, sapply returns simplified version of object
# converts char to factors like lapply so you cant use char columns

sapply(X = iris[1:4], FUN = mean)
# sapply returns vectors
#Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#5.843333     3.057333     3.758000     1.199333 

# get max
sapply(X = iris[1:4], FUN = max)
#Sepal.Length  Sepal.Width Petal.Length  Petal.Width 
#7.9          4.4          6.9          2.5 


# ---------- New column with sapply ----------------
data("mtcars")

mtcars$model <- rownames(mtcars)

# extract the brand from the model column using strsplit
?strsplit()

strsplit(x = mtcars$model, split = ' ')

# put in a var
models = strsplit(x = mtcars$model, split = ' ')

# index the character vector, we need the 1st element
models[[1]][1]
#[1] "Mazda"

# need to iterate through the list for index 1 of each element
sapply(X=models, FUN = '[', n=1)

# assign to the df 
mtcars$brand <- sapply(X=models, FUN = '[', n=1)

# using lapply to store as a list
mtcars$brand <- lapply(X=models, FUN = '[', n=1)



# ------------------ Aggregating and Sorting --------------------------------
# using mtcars with brand var applied
# aggregate data by brand - like a group by in SQL
# inspect:
?aggregate()

class(mtcars$brand)

# error is created if sapply was used bc lapply creates a list whereas sapply creates a char class
# to solve the error, use "list()" and wrap the mtcars$brand
hp_brands <- aggregate(
  x=mtcars$hp,
  by=list(mtcars$brand),
  FUN=mean
)

# output class is a data frame, store in a new var hp_brands
# change the column names to brand, mean_hp
colnames(hp_brands)<-c('brand', 'mean_hp')


# sort the table by mean - ascending which is the default
hp_brands[order(hp_brands$mean_hp),]

# to sort descending order by hp mean use minus before hp_brands -
hp_brands[order(- hp_brands$mean_hp),]





# ------------------ Merging Data Frames -----------------------------------
# reload mtcars df with brand column
data("mtcars")

# we are adding the country of origin to the match the brand of the car
# 1st create data frame with country of origin
brand_origin <- data.frame(
  brand = c('Mazda', 'Toyota', 'Fiat', 'Volvo', 'Skoda'),
  country = c('Japan', 'Japan', 'Italy', 'Sweden', 'Czech Repuublic')
)


# to join use merge
# inner join
mtcars_origin <- merge(x=mtcars, y=brand_origin, by='brand')

# left join -  use all.x, x is the left table
mtcars_origin <- merge(x=mtcars, y=brand_origin, by='brand', all.x = TRUE)

# right join - change all.x to all.y, y is the right table
mtcars_origin_right <- merge(x=mtcars, y=brand_origin, by='brand', all.y = TRUE)

# full join - everything from both tables -  change all = TRUE
mtcars_origin_full <- merge(x=mtcars, y=brand_origin, by='brand', all = TRUE)



# ---------------- Using SQL like Library ---------------------------------
# install the package
install.packages("sqldf")

library(sqldf)

sql_df < - sqldf('SELECT a.*, b.country
                 FROM mtcars AS a
                 LEFT JOIN brand_origin AS b 
                 using(brand)'
                 )



# ------------------ Plotting overview -------------------------------------
# Overview using R Base functions
# use mtcars
data("mtcars")

# construct a scatter plot using plot function
plot(x=mtcars$hp,y=mtcars$wt, main = 'Scatter Plot of HP vs. WT')


# bar plot # using table function to aggregate
count_cyl <- table(mtcars$cyl)

barplot(count_cyl, 
        main = 'Count of Cars by Cylinder', 
        xlab = 'Number of Cylinders', 
        ylab = 'Count of Cars',
        col = c('darkred', 'green', 'orange'))

# box plots 
boxplot(hp~gear, data = mtcars, main = 'Boxplot of Hp vs. Gear')


# Histograms-breaks widens or narrows your bars
hist(x=mtcars$hp, col = c('green'), breaks = 20, main = 'Histogram of HP')


# ------------------- Plots with ggplot -----------------------------------
install.packages("ggplot2")
library(ggplot2)

# build a histogram w/ggplot
ggplot(
  data = mtcars,
  aes(x=hp)
) + geom_histogram(fill='salmon', color='black', binwidth = 20)

# to change to a scatter plot, change the geom_hist to geom_point ad add y =
ggplot(
  data = mtcars,
  aes(x=hp, y=wt)
) + geom_point(color='salmon') + geom_smooth(method='lm', se=FALSE)




# ------------------- Challenges ------------------------------------------
# Load the longley data frame from R into your environment.



# Check the first 5 rows of the data frame using an R command.



# Check the structure of the longley data frame using an R command



# Use the summary command to check the mean of the Unemployed variable.



# Store the mean variable that was computed in the summary command and store it in a mean_unemployment object.



# Using strsplit and list indexing extract the number that you see in the character variable mean_unemployment- rewrite the mean_unemployment object with it.



# Convert the mean_unemployment into a numeric value.



# Compute the mean of the unemployed variable in the longley data frame. Store it in an object called mean_unemployment_df



# Check if the values in mean_unemployment  and mean_unemployment_df are the same.



# Check the same as above but this time convert both objects to integer in the comparison.



# Obtain the column names from the longley data frame. Store them in an object called columns



# Compute a new column in the longley data frame called gnp_per_capita that consists of the ratio between GNP and Population.



# Extract the median of GNP from longley data frame using apply and store it in a variable called gnp_median.


