library(lubridate)
library(ggplot2)
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "consumption.zip", method = "curl")
data <- read.delim(unzip("consumption.zip", "household_power_consumption.txt"), sep=";", na.strings="?")
data <- subset(data, dmy(Date)>=ymd("2007-02-01") & dmy(Date)<=ymd("2007-02-02"))
png(filename = "plot2.png", width = 480, height = 480)
with(data, plot(dmy_hms(paste(Date,Time)),Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()