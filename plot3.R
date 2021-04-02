# plot3.R
library(dplyr)
library(tidyr)

pwr_class <- c(rep("character", 2),rep("numeric",7))
pwr_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",  colClasses = pwr_class)
pwr <- pwr_all[pwr_all$Date == "1/2/2007" | pwr_all$Date == "2/2/2007", ]
pwr <- mutate(pwr, date_time = strptime(paste(pwr$Date, pwr$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

par(mfrow=c(1,1))

#plot 3
plot(pwr$date_time, pwr$Sub_metering_1, type= "l",ylab="Energy sub metering" ,xlab = "")
lines(pwr$date_time, pwr$Sub_metering_2, col="red")
lines(pwr$date_time, pwr$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col= c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()

