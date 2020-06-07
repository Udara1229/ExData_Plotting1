setwd("G:/Coursera/EDA/Workings")
library(readr)
household_power_consumption <- read_delim("household_power_consumption.txt", 
                                          ";", escape_double = FALSE, trim_ws = TRUE)

household_power_consumption$Date=as.Date(household_power_consumption$Date, "%d/%m/%Y" )

subdata<-subset(household_power_consumption, Date=="2007-02-01"|Date=="2007-02-02")

subdata$datetime <- as.POSIXct(paste(subdata$Date,subdata$Time),tz="UTC")

plot(subdata$datetime,subdata$Global_active_power,type="l",xlab = "",ylab="Global Active Power(kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
