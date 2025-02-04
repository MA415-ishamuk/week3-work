# notes from class
# r defaults to characters - you can recast as numbers

# use unique() to find how many unique values occur in a given column of a table
  # ex: unique(buoy_data_1985$DPD) --> gives 99 (only value in the column is 99)

# use <- NA to convert all values of a column in a table to NA 

# use na.rm = T to do functions to data and omit the NA values (such as taking mean
# of data without including NA bc if you dont it will give you NA in the end)

###
# initial buoy project
###

# read in table
# between the file_root and tail is the year of the data that is wanted
# (this way you can easily loop through and read in each year's data)
file_root <- "https://www.ndbc.noaa.gov/view_text_file.php?filename=44013h" 
tail <- ".txt.gz&dir=data/historical/stdmet/"

# function to easily generate url to access buoy data per year 
# (connects file_root and tail via a particular year)
load_buoy_data <- function(year)
  path <- paste0(file_root, year, tail)

path_1985 <- load_buoy_data("1985") # create the data path to access data from 1985

#read in information as a table into R
buoy_data_1985 <- read.table(path_1985, fill = T, header = T, sep = "") 


# data preprocessing
# initialize columns with incorrect values to NA
buoy_data_1985$WVHT <- NA

# check to make sure all of the data in this column is incorrect before replacing
unique(buoy_data_1985$DPD)
buoy_data_1985$DPD <- NA
