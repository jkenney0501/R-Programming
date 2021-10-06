# Working with data
# using Walmart data

library(ggplot2)

path <- 'Desktop/R-Programming/Data Analysis/walmart_data.csv'

walmart_data <- read.csv(path)


# creating a plot function for Walmart data
plot_store_dept <- function(store_nb, dept_nb){
  
  #filter stores from table
  walmart_filter <- walmart_data[
    walmart_data$Store == store_nb
    & walmart_data$Dept == dept_nb,
  ]
    return(walmart_filter)
}

# get store 1 and dept 1
# get store 2 and dept 2
plot_store_dept(1,2)






# ------ plot the data above, copy and paste the same function ---------
# -----------------------------------------------------------------
plot_store_dept <- function(store_nb, dept_nb, colorarg){
  
  #filter stores from table
  walmart_filter <- walmart_data[
    walmart_data$Store == store_nb
    & walmart_data$Dept == dept_nb,
  ]
  #create time series plot
  ggplot(
    data = walmart_filter,
    aes(x=as.Date(Date), y=Weekly_Sales, group=1)
  ) + geom_line(color=colorarg) + geom_point(color=colorarg)
}

plot_store_dept(store_nb=1,dept_nb=2, "darkorange")



# ----------- Grouped Time Series -------------------------
# now we add more stores to the plot
# ---------------------------------------------------------
plot_grouped_dept <- function(store_nb, dept_nb, colorarg){
  
  #filter stores from table
  walmart_filter <- walmart_data[
    (walmart_data$Store == store_nb)
    # group with the %in% clause
    & (walmart_data$Dept %in% dept_nb),
  ]
  #create time series plot
  ggplot(
    data = walmart_filter,
    aes(x=as.Date(Date), y=Weekly_Sales, group=Dept, color=Dept)
  ) + geom_line() + geom_point()
}

plot_grouped_dept(store_nb=10,dept_nb=c(1,2,3,4))


