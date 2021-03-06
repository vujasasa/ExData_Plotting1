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

#YOU NEED TO REMOVE THE COMMENT on the next line in case tidyverse package is not installed on your sytem!!! 
#install.packages("tidyverse")
library(tidyverse)
household_power_consumption_Feb <- household_power_consumption %>% 
        filter(Date > '2007-01-31' & Date <'2007-02-03')

#cleanup the environemnt
rm(household_power_consumption)

#Time = Date and Time
household_power_consumption_Feb$Time<-strptime(paste(household_power_consumption_Feb$Date, household_power_consumption_Feb$Time),"%F %T")

#Plot 1 (generate the preview on the screen)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(household_power_consumption_Feb$Global_active_power, 
     col = 'red', 
     main = 'Global Active Power', 
     xlab = "Global Active Power (kilowatts)")

# Plot 1 (generate png)
png("plot1.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(5,4.5,4,2))
hist(household_power_consumption_Feb$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
dev.off()

