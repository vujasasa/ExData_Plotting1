#Load and unzip the file
file_URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_URL,destfile = 'power_consumption.zip')
unzip('power_consumption.zip')

#import data into data frame
household_power_consumption <- read_delim("household_power_consumption.txt", ";", 
                                          escape_double = FALSE, 
                                          col_types = cols(Date = col_date(format = "%d/%m/%Y"), 
                                          Time = col_time(format = "%H:%M:%S")), 
                                          na = "?", trim_ws = TRUE)

#filter data from the dates 2007-02-01 and 2007-02-02
install.packages("tidyverse")
library(tidyverse)
household_power_consumption_Feb <- household_power_consumption %>% 
        filter(Date > '2007-01-31' & Date <'2007-02-03')
