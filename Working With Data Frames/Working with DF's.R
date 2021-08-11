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
