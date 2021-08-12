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



# ------------------ Aggregating and Sorting --------------------------------


# ------------------ Merging Data Frames -----------------------------------

# ------------------ Plotting overview -------------------------------------



