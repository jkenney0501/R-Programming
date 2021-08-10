# ------ String/char/text
# everything with "" or '' will be defined as a string, even '123'

# ----- Numerical 
# int, float for storing as integer use L ex: num = 1L will store as INT
# OR  as.integer(1)

# ------Logical
# boolean values stored as TRUE or FALSE
# they are comparison operators, can be transformed to numeric 1 or 0

# ------Conversion functions
# as.numeric()
# as.integer()
# as.character()
# as.logical()
# to test: is.x()
# class() - returns type of


number <-1

# check class data type
class(number) # numeric

# underlying data type
typeof(number)  # double



# ----date
my_date <- as.Date('2021-01-01')

class(my_date) # Date

# dates are stored as numbers, days since 1970
# example:
as.numeric(my_date) # returns 18,628



# ----Char
word <- "newspaper"

class('newspaper') # character

# ---Logical 
class(TRUE) #"logical"

# -- Testing
# is.character
# is.logical
is.numeric("newspaper")  #FALSE


# ----------------------------------
# Conversions
#-----------------------------------
number <- 23 

# convert number to string
as.character(number) # "23"

# R can convert string numbers like "23" to numeric
# if letters or characters are present, cannot convert to a number
word <- "23"
as.numeric(word) # 23

# you can apply conversions to vectors-change numeric to character but it doesnt stay char
numerical_vector <- c(1,2,3,4)

as.character(numerical_vector) # "1" "2" "3" "4"

# assign to a new object for persistence
char_vector <- as.character(numerical_vector)




# when numbers in a vector contain a string, all will be a string by default
# example:
years_vector <- c(2001, 2004, 2008, 'not a year') # "2001", "2004", "2008", "not a year"

# this will convert to numeric but the last value (a string) is NA
as.numeric(years_vector) # returns: 2001 2004 2008   NA


# convert logical to numeric (as binary)
logical_vector <- c(TRUE, TRUE, FALSE, TRUE, FALSE)

as.numeric(logical_vector) # 1 1 0 1 0
# save as a var
binary_vector <- as.numeric(logical_vector)
binary_vector  # 1 1 0 1 0


# --------------------------------------------------------
# Factors
# like a variable that enables you to have distinct values
# --------------------------------------------------------
labels <- c('Asia', 'Oceana', 'Antartica', 'Europe', 'Africa', 'North America', 'South America', 'Europe', 'Africa')

# turn vector to a factor to see distinct values
factor_labels <- factor(labels)  # w/7 levels - 7 distinct values

factor_labels # 7

# as.integer(factor_labels) will show the integer value in alp order

# count of distinct factors in vector
nlevels(factor_labels) #7

# ---- create ordinal columns with factor
altitude_level <- c('High', 'Low', 'Medium', 'Low', 'High', 'Low')

# order matters - use ORDER=TRUE, levels= 
# output: Low < Medium < High
# if not ordered, the levels wont make sense here bc default is alphabetical
altitude_factor <- factor(altitude_level, order = TRUE, levels=c('Low', 'Medium', 'High'))

# verify by using as.integer
# output is based on the levels stated above in the variable
# 3 1 2 1 3 1
as.integer(altitude_factor)


# -------------------------------------------------------------------
# dates
# use as.Date()
# --------------------------------------------------------------------
dates <- as.Date(c('2019-01-01', '2019-01-02'))

class(dates) #"Date"

typeof(dates) #"double"

#17897 17898 - 2nd value is higher bc the 2nd date is AFTER the 1st.
# dates are counted by numbers since January 1970
as.numeric(dates)

# format date where its weird!
# lowercase y in format only picks up 2 chars of the year, use Y
as.Date(c('01/01/2019'), format = '%d/%m/%Y') #"2019-01-01"

# Another case of formatting a weird ass date
as.Date(c('01JAN2019'), format = '%d%b%Y') #"2019-01-01"

# Extract values by month, year or whole date
example_date <- as.Date(c('01JAN2019'), format = '%d%b%Y')

# extract month
format(example_date, '%m') # "01"

# extract day 
format(example_date, '%d') # "01"

# extract month shorthand name
format(example_date, '%b') # "Jan"

# extract year
# extract day 
format(example_date, '%Y') # "2019"

# apply this to a vector
format(dates, '%Y') # "2019" "2019"


# store days in a new vector
days_vector <- format(dates, '%d')

days_vector  # "01" "02"


# ----------------------------
# Challenges
#-----------------------------

# Create a vector called boolean_vec, length=8, with TRUE on the first 5 positions and FALSE on the last 3.
boolean_vec <- c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE, FALSE, FALSE)


# Convert your boolean_vec to 1's and 0's and store it in an object called numeric_vec.
numeric_vec <- as.integer(boolean_vec) # 1 1 1 1 1 0 0 0


# Test if your numeric_vec is a numeric using the R testing function.
class(numeric_vec) #"integer"

typeof(numeric_vec) #"integer"

# Convert your numeric_vec to character and store it in an object called char_vec.
char_vec <- as.character(numeric_vec)

class(char_vec) #"character"

# Assign the fifth element on numeric_vec to the character "5".
char_vec[5] = '5'

char_vec # 1" "1" "1" "1" "5" "0" "0" "0"

# Call class on the numeric_vec .
class(numeric_vec) # "integer"


# Check if the class of numeric_vec is equal to the class of char_vec.
numeric_vec == char_vec #TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE










