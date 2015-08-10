library(lubridate)
library(ggplot2)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "consumption.zip", method = "curl")
data <- read.delim(unzip("consumption.zip", "household_power_consumption.txt"), sep=";", na.strings="?")
data <- subset(data, dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))

png(filename = "plot3.png", width = 480, height = 480)
with(data, plot(dmy_hms(paste(Date,Time)),Sub_metering_1, type = "l", ylab="Energy sub metering", xlab = ""))
with(data, lines(dmy_hms(paste(Date,Time)),Sub_metering_2, type = "l", col="red"))
with(data, lines(dmy_hms(paste(Date,Time)),Sub_metering_3, type = "l", col="blue"))
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1))
dev.off()