# Exploring working directories
getwd()
# this path is the working directory where R looks for folders

# can we change the WD? Yes. You can use the GUI as well.
setwd('../')

# to use an absolute path
directory = ' path '

setwd(directory)



# ---------- Loading CSV files -------------------
# use a simple function to load
# default separator is a comma
getwd()

path <- './desktop/NYC temperature data.csv'

# store as data frame in variable
nyc_temp <- read.csv(file=path)

class(nyc_temp)
# data frame


# ------------ Loading Excel Files ---------------
# xls/xlsx
# load FBI crime data set
# 

file_path <- './desktop/FBI Crime Data.xls'

# install read excel package
install.packages("readxl")

library(readxl)

fbi_crime_data <- read_excel(path=file_path)

# issue: header notes and footnotes are read in as columns
# how to fix? See working with excel section.




# another library to use, very similar -  read excel is better!!!!
install.packages("xlsx")

library(xlsx)

fbi_crime_data2 <- read.xlsx(file = file_path, sheetIndex = 1)
# you must provide a sheet name to use this 







