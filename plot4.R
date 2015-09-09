data <- read.csv("d:/coursera/Exploratory Data Analysis/data/household_power_consumption.txt", sep = ";", na.strings="?")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data <- subset(data, Date >= as.Date("2007/02/01") & Date <= as.Date("2007/02/02"))
png(file = "plot4.png")
par(mfrow = c(2, 2))
with(data, 
     {
       #1
       plot(data$Global_active_power, type="l", ylab="Global Active Power", xlab = "", xaxt = "n")
       axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
       #2
       plot(data$Voltage, type="l", ylab="Voltage", xlab = "datetime", xaxt = "n")
       axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))       
       #3
       plot(Sub_metering_1, type="l", ylab="Energy sub metering", xlab = "", xaxt = "n")
       points(Sub_metering_2, col = "red", type="l")
       points(Sub_metering_3, col = "blue", type="l")
       axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
       legend("topright", col = c("black", "red", "blue"),  lty = 1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))            
       #4
       plot(data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime", xaxt = "n")
       axis(1, at = c(0, 1440, 2880), labels = c("Thu", "Fri", "Sat"))       
     })
dev.off()
