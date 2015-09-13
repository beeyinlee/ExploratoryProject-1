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
par(mfrow=c(2,2))
#1,1
plot(dfsubsetted$DateTime,dfsubsetted$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#1,2
plot(dfsubsetted$DateTime,dfsubsetted$Voltage, type="l", xlab="datetime", ylab="Voltage")
#2,1
#legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) #bty removes the box, cex shrinks the text, spacing added after labels so it renders correctly
plot(dfsubsetted$DateTime,dfsubsetted$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dfsubsetted$DateTime,dfsubsetted$Sub_metering_2,col="red")
lines(dfsubsetted$DateTime,dfsubsetted$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1), bty="n", lwd=c(1,1), cex=.2)
#2,2
plot(dfsubsetted$DateTime,dfsubsetted$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactivate_power")

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off() #off device