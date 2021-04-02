# plot1.R
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

