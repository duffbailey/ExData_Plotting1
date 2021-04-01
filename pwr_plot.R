# pwr_plot.R
library(dplyr)
library(tidyr)

pwr_class <- c(rep("character", 2),rep("numeric",7))
pwr_all <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?",  colClasses = pwr_class)
pwr <- pwr_all[pwr_all$Date == "1/2/2007" | pwr_all$Date == "2/2/2007", ]
pwr <- mutate(pwr, date_time = strptime(paste(pwr$Date, pwr$Time, sep = " "), "%d/%m/%Y %H:%M:%S"))

par(mfrow=c(1,1))


#Plot 1
hist(pwr$Global_active_power,main = "Global Active Power", col="red" , xlab="Global Active Power (kilowatts)")
dev.copy(png, file = "plot1.png")
dev.off()

#Plot 2
plot(pwr$date_time, pwr$Global_active_power, type= "l",ylab="Global Active Power (kilowatts)" ,xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()


#plot 3
plot(pwr$date_time, pwr$Sub_metering_1, type= "l",ylab="Energy sub metering" ,xlab = "")
lines(pwr$date_time, pwr$Sub_metering_2, col="red")
lines(pwr$date_time, pwr$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col= c("black", "red", "blue"))
dev.copy(png, file = "plot3.png")
dev.off()

par(mfrow=c(2,2))

plot(pwr$date_time, pwr$Global_active_power, type= "l",ylab="Global Active Power (kilowatts)" ,xlab = "")

plot(pwr$date_time, pwr$Voltage , type= "l",ylab="Voltage",xlab = "datetime" )

plot(pwr$date_time, pwr$Sub_metering_1, type= "l",ylab="Energy sub metering" ,xlab = "")
lines(pwr$date_time, pwr$Sub_metering_2, col="red")
lines(pwr$date_time, pwr$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = 1, col= c("black", "red", "blue"))

plot(pwr$date_time, pwr$Global_reactive_power, type= "l",ylab="Global reactive Power" ,xlab = "datetime")

dev.copy(png, file = "plot4.png")
dev.off()
