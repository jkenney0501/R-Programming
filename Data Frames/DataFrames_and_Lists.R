# -----------------------------------------------------
#Data Frames and Lists
# Allow for multi-types across elements

# characteristics:
# has rows and cols
# has nrow, ncol, and dim properties
# every col must be the same data type (within that col)
# you can index similar to matrix

# to create a df:
#countries_data <- data.frame(country=c('Portugal', 'France', 'UK'), 
#                             population = c(10280000, 66990000, 66650000),
#                             EU = c('Y', 'Y', 'N'))

# To add row names: use row.names = ('col1', 'col2')
# head(df_name, n) - returns top n rows
# col.names() - returns col names
# tail(df_name, n) - returns bottom n rows
# str() - returns structure of df
# summary() - returns 5 num summary of set, (mean, max, min, median) per numeric col.

# Lists - known for flexibility, hold diff data types.
# characteristics:
# has elements
# accessed by index
# holds diff types
# no implicit conversion implied
# has names property

# -----------------------------------------------------

# Creating a data frame
# preferred to use col names then arguments as below
countries_data <- data.frame(
  country=c('Portugal', 'France', 'UK'), 
  population = c(10280000, 66990000, 66650000),
  EU = c(TRUE, TRUE, FALSE),
  stringsAsFactors = FALSE)


# see the structure
str(countries_data)
# 'data.frame':	3 obs. of  3 variables:
# $ country   : chr  "Portugal" "France" "UK"
# $ population: num  10280000 66990000 66650000
# $ EU        : logi  TRUE TRUE FALSE


# see the class
class(countries_data)
#[1] "data.frame", typeof is list due to multiple types of elements


# name the rows of the df with countries names
# df changes to 3 obs with 2 vars.
countries_data <- data.frame(
  population = c(10280000, 66990000, 66650000),
  EU = c(TRUE, TRUE, FALSE),
  row.names = c('Portugal', 'France', 'UK'))


# -------------- Indexing and Modifying Data Frames ------------------------
# same as indexing matrices
# 1st col, 1st row
countries_data[1,1]
#[1] 10280000

# 1st row-all
countries_data[1,]
#         population   EU
#Portugal   10280000 TRUE

# can also use row name to index
countries_data['France',]
#       population   EU
#France   66990000 TRUE

# get 1st col, gives all rows and the whole column
countries_data['population']

# change the population of Portugal to 1, assign to var if required.
countries_data['Portugal', 'population']<-1


# ------------- Expanding Data Frames --------------------------------------
# re-run countries data with no row names
# add another country to countries DF - Spain
spain_data <- data.frame(
  country = c('Spain'),
  population = c(46754778),
  EU = c(TRUE),
  stringsAsFactors = FALSE
)

# to append the Spain data to countries data, use rbind()
rbind(countries_data, spain_data)
# country population    EU
#1 Portugal   10280000  TRUE
#2   France   66990000  TRUE
#3       UK   66650000 FALSE
#4    Spain   46754778  TRUE


# rewrite in the countries data var with spain
countries_data<-rbind(countries_data, spain_data)
# now has 4 obs, 3 vars!


# add a new column with capitals of each country
# create capitals variable as a vector
capitals<-c('Lisbon', 'Paris', 'London', 'Madrid')

# use cbind to add as a column
cbind(countries_data, capitals)
# country population    EU capitals
#1 Portugal   10280000  TRUE   Lisbon
#2   France   66990000  TRUE    Paris
#3       UK   66650000 FALSE   London
#4    Spain   46754778  TRUE   Madrid

# add to the data frame permanently
countries_data<-cbind(countries_data, capitals, stringsAsFactors = FALSE)
# 4obs, 4 vars


# --------------- Removing Elements from Data Frames ---------------------
# to remove rows, put - before the index
# remove Spain, to remove perm, re-write the object
countries_data[-4,]

# remove EU column from DF
# assign to a NULL
# NO NEED TO RE-WRITE THE OBJ
countries_data[,'EU']<-NULL
# 4 obs, 3 vars now







# ------------- Challenges ------------------------------------------------
