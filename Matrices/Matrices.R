# construct matrices - aka 2d arrays

# for help - ?matrix()

example_matrix1 <- matrix(data=1:4, nrow=10, ncol=4)

example_matrix1
#[1,]    1    3    1    3
#[2,]    2    4    2    4
#[3,]    3    1    3    1
#[4,]    4    2    4    2
#[5,]    1    3    1    3
#[6,]    2    4    2    4
#[7,]    3    1    3    1
#[8,]    4    2    4    2
#[9,]    1    3    1    3
#[10,]    2    4    2    4

# The data is input vertically by column, 
# to alter this so its input row by row use byrow = TRUE in the ()
example_matrix <- matrix(data=1:4, nrow=10, ncol=4, byrow = TRUE)
example_matrix

# example of 1st 4 rows
#[,1] [,2] [,3] [,4]
#[1,]    1    2    3    4
#[2,]    1    2    3    4
#[3,]    1    2    3    4


# create the 1st matrix using an array
example_matrix2 <- array(data = 1:4, dim = c(10,4))

# compare to 1st matrix to see if they are the same
example_matrix2 == example_matrix1
# all are true, this is only the 1st 3 rows for demonstration
#[,1] [,2] [,3] [,4]
#[1,] TRUE TRUE TRUE TRUE
#[2,] TRUE TRUE TRUE TRUE
#[3,] TRUE TRUE TRUE TRUE

dim(example_matrix2)
#10,4

class(example_matrix2)
# "matrix" "array" 

nrow(example_matrix2)
#10

ncol(example_matrix2)
#4


# ------------------ Matrix Operations ---------------------------
# create two matrices with different data
example_matrix1 <- matrix(data = 1:4, nrow = 2, ncol = 2)
#[1,]    1    3
#[2,]    2    4
example_matrix2 <- matrix(data = 200:203, nrow = 2, ncol = 2)
#[1,]  200  202
#[2,]  201  203
  
# * multiply by one another
# you can also use +, -, /, **
example_matrix1 * example_matrix2

#     [,1] [,2]
#[1,]  200  606
#[2,]  402  812

# DOT Product of a matrix (simple algebra)
matrix1 <-matrix(1:6, nrow = 2, ncol=3, byrow = TRUE)
#[1,]    1    2    3
#[2,]    4    5    6

matrix2 <-matrix(7:12, nrow = 3, ncol=2, byrow = TRUE)
#[1,]    7    8
#[2,]    9   10
#[3,]   11   12

# HOW CAN WE MULTIPLY MATRIX1 BY MATRIX2 TO GET THE DOT PRODUCT?
# USE %*%, inner dims must match!
matrix1 %*% matrix2
# to get:
#[1,]   58   64
#[2,]  139  154




# ---------------- Challenges --------------------------------

#Create a matrix using the matrix() function with 3 rows and 2 columns - name it matrix_example. Feed it with the following data: c(100,23,42,23,342,203)
matrix_example <- matrix(data = c(100,23,42,23,342,203), nrow = 3, ncol = 2)
#[1,]  100   23
#[2,]   23  342
#[3,]   42  203

#Divide the whole matrix by itself and store it in an object called one_matrix.
one_matrix <- matrix_example/matrix_example
#[1,]    1    1
#[2,]    1    1
#[3,]    1    1

#Apply a logarithm to the first column of the matrix. Rewrite that column in the one_matrix.



#Multiply the second row of the matrix by 0.33 - rewrite the row on the one_matrix.



# Transpose the one_matrix and save it in an object called one_matrix_t.



# Use matrix multiplication properties to compute the multiplication of matrix_example and one_matrix_tand save it in an object called matrix_mul. Hint: Remember the %*% operator.

