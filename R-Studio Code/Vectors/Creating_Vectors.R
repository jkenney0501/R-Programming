# ----------------------------------------------------------------
# J.Kenney - R Programming
# creating a vector-object type is important, can only be one type
# FOR HELP USE ? Or help()
# ----------------------------------------------------------------

c(10000, 20000, 4000, 3000)

# assign to a variable to use anywhere in your code
cities_population <- c(10000, 20000, 4000, 3000)

# test vector
cities_population

# ------------------------------------------------------------------
# to remove the object from your environment - rm(cities_population) 
# ------------------------------------------------------------------
 rm(cities_population)

# -----------------------------------------------------------------
# indexing and slicing
# -----------------------------------------------------------------
# create new numerical vector
melons <- c(1.2, 1.4, 2.4, 3.4)

# what is the weight of the 1st melon?
# indexing starts at 1 in R, call the 1st index
melons[1]

# the 3rd?
melons[3]

# slice the vector (retrieve multiple objects) from 2-4
melons[2:4]

# from 2-3
melons[2:3]

# use a vector to serve as an index
# allows you to call only specific elements of the vector
# get the 1st and last from the vector
melons[c(1,4)]


# -----------------------------------------------------------------
# calculations with vectors
# -----------------------------------------------------------------
# sum function allows you to sum the entire vector
sum(melons)

# multiplication of vectors
melons * 2
# or 
melons + melons # same as mult times 2

# mult specified elements of the vector
melons[c(1,4)] * 2

# division
melons / 2

#sqrt
sqrt(melons)

# exponential
exp(melons)

# multiply the weight of melons by 20% for the 1st 2 and 40% fro the last 2
adjusted_weight <- c(1.2, 1.2, 1.4, 1.4)

melons * adjusted_weight # note vectors must be the same, length or weird stuff happens


# -----------------------------------------------------------------
# more functions and handling unexpected values
# -----------------------------------------------------------------
# mean value of vector 2.1
mean(melons)

# median - 1.9 
median(melons)

# standard deviation - 1.013246
sd(melons)

# length - 4 
length(melons)

# sorting - asc is default, use decreasing=TRUE for descending order
sort(melons, decreasing = TRUE)

# dealing with NA
new_melons <- c(1.2, 1.4, 2.4, 3.4, NA)

# the NA will inhibit your calculation and make it unavailable
# how do we clean it? na.rm=TRUE, means: to remove NA
# -- 8.4 is the output
sum(new_melons, na.rm=TRUE)

# lets see about NaN
new_melons <- c(1.2, 1.4, 2.4, 3.4, NaN)

sum(new_melons) # returns NaN rather than the sum

# how to overcome this? na.rm=TRUE
sum(new_melons, na.rm=TRUE)  #returns sum of 8.4

# inf is a special case where na.rm doesn't work - 1/0, be mindful!


# -----------------------------------------------------------------
# comparison operators
# -----------------------------------------------------------------
# what elements are over 2 kg?
# using melons vector
melons > 2  # returns logical vector-FALSE FALSE  TRUE  TRUE

# extract the actual values
melons[melons > 2] # returns - 2.4 3.4


# equality
melons == 1.4 # returns logical vector

# not equal
melons != 1.4 # returns logical vector

# get actual elements
melons[melons == 1.4] # returns only 1 in position 2

melons[melons != 1.4] # returns 1.2 2.4 3.4

# to get the position?
which(melons > 2) # returns 3 4 which is the position


# -----------------------------------------------------------------
# vector names property
# assign names to properties of vectors
# -----------------------------------------------------------------
countries <- c(10276617, 675455757, 67020000)

# assign countries names to go with populations
names(countries) <- c('Portugal', 'United Kingdom', 'France')

# we get a named numeric property which allows us to index by name
countries['France'] # returns the population in position 3

# select multiple countries, must use a new vector bc it 1d
countries[c('Portugal', 'France')]
# returns:
#Portugal   France 
#10276617 67020000

# apply the which() command
which(countries > 20000000)
# returns:
# United Kingdom         France 
#             2              3 

# to only return the names
names(which(countries > 20000000))


# -----------------------------------------------------------------
#  modifying vector elements
# -----------------------------------------------------------------
melons <- c(1.2, 1.4, 2.4, 3.4)

# change the 1st position to 2
melons[1] <- 2

# change multiple positions
melons[2:4] <- c(3,4,5)

# add elements to the vector- just assign a value
# the 5th position doesn't exist so we add it in an assignment
# the vector has 4 elements but we are making it 5
melons[5] <- 10

# change multiple elements based on a condition 
melons <- c(1.2, 1.4, 2.4, 3.4, 1.2)

# change those < 2 to 2
melons[melons < 2] <- 2 # returns 2.0 2.0 2.4 3.4 2.0

# delete elements, use the negate - before the c
# this selects everything BUT 2 and 4
new_melons <- melons[-c(2,4)]



# ----------------------------------------------------------------------
# Challenges
# ----------------------------------------------------------------------
# 1. Create a vector called kids_ages with the following elements:  
  
#  12, 11, 12, 13, 14, 13, 12, 10, 12, 12, 14, 13
kids_ages <- c(12, 11, 12, 13, 14, 13, 12, 10, 12, 12, 14, 13)


# 2. Calculate the mean of the kids_ages vector.
mean(kids_ages) #12.33333


# 3. Calculate the median of the kids_ages vector.
median(kids_ages) #12


# 4. Create a new logical (TRUE/FALSE) vector called subset_ages that stores with TRUE the kids that have less than 11 years old and more than 13 years old.



# 5. Give the following names to the kids_ages vector: 
  
#  "John", "Rachel", "Joe", "Anne", "Theresa", "Samuel", "Marcus", "Andrew", "Kate", "Jane", "Martha", "David"



# 6. Subset the ages of "Rachel" and "Anne"



# 7. Change the age of the fifth student to 13



# 8. Return a vector named under_12 with the names of the students under 12 years old.



# 9. Create a new vector called product_pricing with the following elements: 
  
  # 5.6, 11.2, 4.5, 0.25, 1, 23

