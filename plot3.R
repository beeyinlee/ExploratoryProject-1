# setwd("C:/0 Project/A Project/Misc/PMP/Data Science/Coursera/Assignments/Mod4")

library(data.table)
library(dplyr)
library(datasets)

filename="household_power_consumption.txt" 
#system.time(dfconsumption <- read.table(filename, sep = ";",))
dfconsumption <- read.table(filename, header=TRUE, sep = ";",na.strings = "?", stringsAsFactors=FALSE)
dfconsumption$Date <- as.Date(dfconsumption$Date, format="%d/%m/%Y")
#head(dfconsumption)
#str(dfconsumption)

dfsubsetted<-dfconsumption[(dfconsumption$Date=="2007-02-01")|(dfconsumption$Date=="2007-02-02"),]
#str(dfsubsetted)
#head(dfsubsetted)
dfsubsetted <- transform(dfsubsetted, DateTime=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

#plot
plot(dfsubsetted$DateTime,dfsubsetted$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfsubsetted$DateTime,dfsubsetted$Sub_metering_2,col="red")
lines(dfsubsetted$DateTime,dfsubsetted$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"),lty=c(1,1), lwd=c(1,1))

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off() #off device