# setwd("C:/0 Project/A Project/Misc/PMP/Data Science/Coursera/Assignments/Mod4")

library(data.table)
library(dplyr)
library(datasets)

filename="household_power_consumption.txt" 
#system.time(dfconsumption <- read.table(filename, sep = ";",))
dfconsumption <- read.table(filename, header=TRUE, sep = ";",na.strings = "?", stringsAsFactors=FALSE)
dfconsumption$DateTime <- paste(dfconsumption$Date, dfconsumption$Time) 
dfconsumption$DateTime <- as.Date(dfconsumption$DateTime, format = "%d/%m/%Y %H:%M:%S")
#head(dfconsumption)
#str(dfconsumption)

dfsubsetted <- filter(dfconsumption, DateTime >= as.Date("2007-02-01 00:00:00"), DateTime < as.Date("2007-02-03 00:00:00"))
#length(dfsubsetted)
#dfsubsetted

#historgram
hist(dfsubsetted$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red") 

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off() #off device