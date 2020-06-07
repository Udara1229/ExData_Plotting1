setwd("G:/Coursera/EDA/Workings")
library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)

household_power_consumption$Date=as.Date(household_power_consumption$Date, "%d/%m/%Y" )

subdata<-subset(household_power_consumption, Date=="2007-02-01"|Date=="2007-02-02")

subdata$datetime <- as.POSIXct(paste(subdata$Date,subdata$Time),tz="UTC")

plot(subdata$datetime, subdata$Sub_metering_1,type = "l", xlab = "", ylab = "Energy sub metering")
  with(subdata,lines(datetime, Sub_metering_1,col="black"))
  with(subdata,lines(datetime, Sub_metering_2, col = "red"))
  with(subdata,lines(datetime, Sub_metering_3, col = "blue"))
  legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"), lty = 1)

dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
  

