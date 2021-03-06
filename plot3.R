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

#Time = Date and Time
household_power_consumption_Feb$Time<-strptime(paste(household_power_consumption_Feb$Date, household_power_consumption_Feb$Time),"%F %T")

#Plot 3 (generate the preview on the screen)
par(mfrow=c(1,1),mar=c(4,4,4,2))
plot(household_power_consumption_Feb$Time, household_power_consumption_Feb$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(household_power_consumption_Feb$Time,household_power_consumption_Feb$Sub_metering_2, col="red", type="l")
points(household_power_consumption_Feb$Time,household_power_consumption_Feb$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(household_power_consumption_Feb[,7:9]))

#Plot 3 (generate png)
png("plot3.png", width=480, height=480)
par(mfrow=c(1,1),mar=c(4,4,4,2))
plot(household_power_consumption_Feb$Time, household_power_consumption_Feb$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(household_power_consumption_Feb$Time,household_power_consumption_Feb$Sub_metering_2, col="red", type="l")
points(household_power_consumption_Feb$Time,household_power_consumption_Feb$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(household_power_consumption_Feb[,7:9]))
dev.off()

