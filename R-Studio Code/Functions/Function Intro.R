# Intro - create a function

# Simple example of taking a variable and multiplying it by 3
triple <- function(x){
  x <- 3*x
  return(x)
}

triple(5)



# example of standard mean in R base
# total is 100 in he vector, mean function sums and divides by N elements
mean(c(10,20,30,40))

# same as:
(10+20+30+40)/4

# create a custom mean function
custom_mean <- function(){
  sum_vector <- sum(c(10,20,30,40))
  mean_vector <- sum_vector/length(c(10,20,30,40))
  return(mean_vector)
}

custom_mean()




# ---------- Arguments --------------
# adding arguments to the function
# -----------------------------------
custom_mean_args <- function(my_vector){
  sum_vector <- sum(my_vector)
  mean_vector <- sum_vector/length(my_vector)
  return(mean_vector)
}

# the my vector argument is now calculated
# inserting a vector of c(10,20) yields a result of 15 for the mean
custom_mean_args(c(10,20))



# ----------- Control Flow ---------------
# for loops - iterate through the object
# through iteration, the sum vector adds each element
# then the mean vector divides the total number of elements
# ----------------------------------------
x <- c(10,20,30,40,50,60)

custom_mean_for <- function(my_vector){
  sum_vector <- 0
  for(i in my_vector){
    sum_vector <- sum_vector + i
  }
  mean_vector <- sum_vector/length(my_vector)
  return(mean_vector)
}

custom_mean_for(x)



# ----------- Conditionals-If Else --------------
# for iterates over an object
# making a condition in the loop to print error message
# -----------------------------------------------
x <- c(10,20,30,40,50,60)

x2 <- factor(c(10,20,30,40,50))

custom_mean_if <- function(my_vector){
  
  if(class(my_vector) != 'numeric'){
    print('Please pass a numeric vector.')
  } else{
  
  sum_vector <- 0
  for(i in my_vector){
    sum_vector <- sum_vector + i
  }
  mean_vector <- sum_vector/length(my_vector)
  return(mean_vector)
  }
}

custom_mean_if(x2)



# ---------- While loop ---------------------
# while loops iterate until a condition is met
# -------------------------------------------
x <- c(1,2,3,4)

while_func <- function(x){
  
  i <- 0
  
  while(i <= length(x)) {
    
    print(x[i])
    #print('While line ends at 5, its actually 6')
    i <- i+1
  }
  
  print('The End')
}

while_func(x)




