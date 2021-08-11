# -----------------------------------------------------------------
# creating lists

# lists allow for multiple data types and create an object

# -----------------------------------------------------------------

# recall vectors- two numbers and one string
v <-c(1,2,'3')

typeof(v)
# [1] "character"
# all is converted to character bc you cant have diff data types!

# lists solve this issue- how to create?
# you don't need to wrap in a vector object, list convert implicitly convert
my_list<-list(1,2,'3')

typeof(my_list)
# [1] "list"

# you can have other objects in lists as well
multi_object<-list(
  c(1,2,3),
  array(1:4, dim = c(2,2)),
  TRUE)

multi_object
#[,1] [,2]
#[1,]    1    3
#[2,]    2    4

#[[3]]
#[1] TRUE

typeof(multi_object)
# [1] "list"

# give names to the list
names(multi_object)<-c('Vector', 'Array', 'Logical')

multi_object # display all
# $Vector
# [1] 1 2 3

# $Array
#[,1] [,2]
#[1,]    1    3
#[2,]    2    4

# $Logical
#[1] TRUE

# what is the length of the list-returns number of objects
length(multi_object)
#3

# the structure
str(multi_object)
#List of 3
#$ Vector : num [1:3] 1 2 3
#$ Array  : int [1:2, 1:2] 1 2 3 4
#$ Logical: logi TRUE


# create the names when creating the list-clean env 1st!
# assign the name to the object before the argument.
multi_object<-list(
  'Vector' = c(1,2,3),
  'Array' = array(1:4, dim = c(2,2)),
  'Logical' = TRUE)

names(multi_object)
# [1] "Vector"  "Array"   "Logical"


# ----------------------- Indexing Lists --------------------------------
# retrieve 1st obj from list above
multi_object[1]
#$Vector
#[1] 1 2 3

# 2nd object
multi_object[2]
#$Array
#     [,1] [,2]
#[1,]    1    3
#[2,]    2    4


# access the elements of the vector- 1st one in the first obj
multi_object[[1]][1]
# [1] 1

# access the 1st obj, 3rd element in vector
multi_object[[1]][3]
# [1] 3

# access the array elements-2nd row, 2nd element
multi_object[[2]][2,2]
# [1] 4

# access by name
multi_object[['Vector']]
# [1] 1 2 3

# another syntax for accessing cols and df
multi_object$Vector
# [1] 1 2 3

# 1st element
multi_object$Vector[1]
# 1


# ----------------- Changing and adding elements to the List -----------------
# create a new list -  2 elements with vector and array
example_list<-list(c('a','b','c'), array(1:10, dim = c(2,5)))

# add new element-assign to object with [[]]
example_list[[3]]<-c(1,2,3)
# [[3]]
#[1] 1 2 3

# rewrite list elements
example_list[[2]]<-TRUE

# we have 3 objects but assigned to positions 1,2,3. What id we assigned one to the 10th?
# the list now becomes a list of 10.
# but what values are between 3 and 10? all nulls!
example_list[[10]]<-c(8:10)

#[[1]]
#[1] "a" "b" "c"

#[[2]]
#       [,1] [,2] [,3] [,4] [,5]
#[1,]    1    3    5    7    9
#[2,]    2    4    6    8   10

#[[3]]
#[1] 1 2 3

#[[4]]
#NULL
# .....
# .....
#[[9]]
#NULL

#[[10]] # the obj we assigned to position 10
#[1]  8  9 10


# ------------------ Delete List Elements -----------------------------------
# note: $ cant be used with numerical indexes
example_list<-list(c('a','b','c'), array(1:10, dim = c(2,5)))
example_list[[3]]<-c(1,2,3)


# to remove, call index and use NULL
example_list[[3]]<-NULL
# now list of 9 rather than 10

# ----------------- Combining Lists ----------------------------------------
# create 2 lists
my_list1<-list(c(1,2), 'A')

my_list2<-list(c(10,11), matrix(1:10, nrow=5, ncol=2))

concat_list <- c(my_list1, my_list2)
# list of 4



# ---------------------- Challenges -------------------------------------

# 1.Create a list named math_list with the following elements: 
  
#  1a. an array with 3 dimensions with 2 elements in each one, fed with the data 1:2

#  1b. a vector with the elements (3,9,81)

#  1c. a matrix with 2 rows and 2 columns with the elements (9,0,9,0)
math <- list(array(1:2, dim=c(3,2)), c(1,9,81), matrix(9,0,9,0, nrow=2, ncol=2))


# Name the elements on your math_list "ThreeDArray","Vector" and "Matrix"
names(math)


# Add a fourth element to your list - a character element with the text: "I DID IT!"



# Change the name of that fourth element to "String". Keep other names unchanged.



# Check the number of elements in your math_list. Use an R function to do it.



# Delete the 'String' element from your list.



# Extract the vector from your list and assign it to the math_vector object.



# Convert your math_vector to an array. Keep the name unchanged.



# Extract the second element from the third dimension of the ThreeDArray - assign it to the new_matrix object.



# Multiply every element of the new_matrix by the second element of the math_vectorobject.





