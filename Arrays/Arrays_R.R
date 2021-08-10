#---------------------------------------------------------------------------
# Arrays are R objects that are able to store data in mult dimensions.
# example: ex_array <- array(data=c(1,2,3), dim=c(1,2,2))
# Characteristics:
# 1. take vectors as inputs
# 2. Dim argument controls the dimension
# 3. With c(1,2,2) we create 2 matrices with 1 row by 2 columns
# 4. every position in the dim corresponds to its dimension.
# 5. you can use dim names to name elements in the array.
# 6. they hold elements of the same type. !important!
#---------------------------------------------------------------------------

#---------------------------------------------------------------------------
# Matrices
# 2d arrays, indexed the same way
# example_matrix <- matrix(data=c(1,2,3,4), nrow=2, ncol=2)
# the above creates a 2 row, 2 col matrix
# They take vectors as inputs
# nrow and ncol control the number of elements in the 1st and 2nd dimension(rows/cols)
# you can use dim names
# hold elements of the same type
#----------------------------------------------------------------------------

# creating arrays
# Transform vector into array
my_vect <- 1:4

# create 2 by 2 object from vector
my_array <- array(data=my_vect, dim=c(2,2))
#      [,1] [,2]
#[1,]    1    3
#[2,]    2    4

# to index on array, 1st row = 1st element of dimension
my_array[1,] # [1] 1 3

# 1st row, 2nd column value
my_array[1,2] # 3

# 2nd row
my_array[2,] # [1] 2 4

# 2d matrix is the same as an array, if you add a dimension, it is only array
class(my_array) # "matrix" "array" 

# check the dimensions
dim(my_array) # 2 2


# ---------------------------------------------------------------------------
# indexing and modifying arrays
# ---------------------------------------------------------------------------
my_array <- array(1:8, dim = c(4,4))

my_array
#[,1] [,2] [,3] [,4]
#[1,]    1    5    1    5
#[2,]    2    6    2    6
#[3,]    3    7    3    7
#[4,]    4    8    4    8

# extract 4th column, this produces all elements from the 4 dims
my_array[,4]  #[1] 5 6 7 8

# get 2nd and 3rd element from 3rd col
my_array[2:3, 3] # [1] 2 3

# just one row, 1st row
my_array[1,] #[1] 1 5 1 5

# 3rd row
my_array[3,] #[1] 3 7 3 7

# -------- Modify Elements ----------
# change col value by assigning a vector of new elements
my_array[,1] <- c(100, 100, 100, 100)

my_array

# change the row values
# (1,)

# modify the 1st 2 rows
my_array[1:2,] <- array(c(1000, 1000, 1000, 1000, 1000, 1000, 1000, 1000), dim = c(2,4))

my_array
#[,1] [,2] [,3] [,4]
#[1,] 1000 1000 1000 1000
#[2,] 1000 1000 1000 1000
#[3,]  100    7    3    7
#[4,]  100    8    4    8

# -------- Array Operations ---------
my_array <- array(data = c(100, 100, 100), dim = c(3,3,2))

my_array
#[,1] [,2] [,3]
#[1,]  100  100  100
#[2,]  100  100  100
#[3,]  100  100  100

# changes 1st array to a sq rt of 100, see the diff in 1 & 2
my_array[,,1]<- sqrt(my_array[,,1])

my_array[,,1]
#[,1] [,2] [,3]
#[1,]   10   10   10
#[2,]   10   10   10
#[3,]   10   10   10


# 2nd dim, 2nd col
my_array[,2,]
#[,1] [,2]
#[1,]   10  100
#[2,]   10  100
#[3,]   10  100


# apply a power to the 2nd element of both objects
my_array[,2,]<-my_array[,2,]**2

my_array[,2,]
#[1,]  100 10000
#[2,]  100 10000
#[3,]  100 10000

# multiply 1st array * 2nd array by element
# easy just multiply and call out the dims
my_array[,,1]*my_array[,,2]

#[,1]  [,2] [,3]
#[1,] 1000 1e+06 1000
#[2,] 1000 1e+06 1000
#[3,] 1000 1e+06 1000

# change one specific element by dividing by 5
# 1st dim, 3rd col, 2nd array
my_array[1,3,2]
#[1] 100

my_array[1,3,2]<-my_array[1,3,2]/5

my_array
#[,1]  [,2] [,3]
#[1,]  100 10000   20
#[2,]  100 10000  100
#[3,]  100 10000  100


# ---------- Dim names Property --------------------
# add names as index to grab data
countries_data<-array(c(200,200,300,340,230,120,540,400), dim=c(2,2,2), dimnames = list(c('Portugal', 'UK'), 
                                                                        c('Population', 'GDP'),
                                                                        c('2018', '2019')))

countries_data
#, , 2018
#Population GDP
#Portugal        200 300
#UK              200 340

#, , 2019
#Population GDP
#Portugal        230 540
#UK              120 400


# we can use the names as indexes
countries_data['Portugal', 'Population', '2019']
#[1] 230

# get both years by adding a vector
countries_data['Portugal', 'Population', c('2018', '2019')]
#2018 2019 
#200  230 


# if you ask for dims that dont exist, you get subscript error

# extract names
dimnames(countries_data)

# change a dimname
dimnames(countries_data)[[1]]<-c('Portugal', 'Spain')

countries_data
#Population GDP
#Portugal        200 300
#Spain           200 340

#, , 2019
#Population GDP
#Portugal        230 540
#Spain           120 400


# get the number of rows using nrows
nrow(countries_data)
#[1] 2

# get no of cols
ncol(countries_data)
#2


# to delete data from array
countries_data[,,-c(2)]


# --------------- Combining Arrqys ----------------------
# rows or cols
my_array_1<-array(c(1:4), dim<-c(2,2))

my_array_1
#[1,]    1    3
#[2,]    2    4

# create another array
my_array_2<-array(c(10:14), dim<-c(2,2))

my_array_2
#[1,]   10   12
#[2,]   11   13

# to append, on eon top of another-mut have the same shape!!!
rbind(my_array_1, my_array_2)
#[1,]    1    3
#[2,]    2    4
#[3,]   10   12
#[4,]   11   13

#to combine side by side
cbind(my_array_1, my_array_2)
#[1,]    1    3   10   12
#[2,]    2    4   11   13







# ---------------------------------------------------------------------------
# challenges
# ---------------------------------------------------------------------------
# 1. Create an array called fourdim and feed it with the data 1:10. Your array must have 2 elements on each dimension.



# 2. Set the [2,2,2,2] element on the fourdim array to NA



# 3. Extract the mean of the fourdim array - pay attention to the NA's.



# 4. Create an array called threed with three dimensions with 3 elements in the first, 2 in the second and 2 in the third. Name your first dimension as "Stock Price", "Revenue", "Employees", the second as "2018","2019" and the third as "Apple","Microsoft". Feed the array with the following data: 

# (155, 261, 132000,423.4, 321, 137000,105, 240, 118000,157.64, 260, 139000)


# 5. Using array indexes, compute the difference between Apple's stock price in 2019 and 2018. Store it in an object called diff_price.



# 6. Based on the diff_price object, compute percentage difference (in decimal format, where for instance: 0.5 equals to 50%) between Apple's stock price in 2019 and 2018. Use array indexes again to find the 2018 Apple stock price in the threed array.



# 7. Extract all the information that you have for Apple on threed array. Remember, 'Apple' is on the third dimension. Store it in an object called apple



# 8. Extract every "Stock Price" that we have on our array. Remember, "Stock Price" is on the first dimension. Store it in an object called stock_price



# 9. Check the dimensions of the stock_price object. Use an R instructor to do it.



# 10. Check if the class of the stock_price object is equal to the class of the three d object.



# 11. Convert the stock_price of Microsoft to a vector (you can use the stock_price object) and store it in an object called price_vector.


