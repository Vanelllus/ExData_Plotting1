#Exploratory Data Analysis, Week 1, Course Project 1
#Łukasz Binkowski

#Fig4
data_full <- read.csv2("/Users/ljbinkowski/Downloads/household_power_consumption.txt")
data <- subset(data_full, as.Date(data_full$Date, "%d/%m/%Y") > "2007-01-31" 
               & as.Date(data_full$Date, "%d/%m/%Y") < "2007-02-03")
data$datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Voltage <- as.numeric(as.character(data$Voltage))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))

png(filename = "fig4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(data$datetime, data$Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
plot(data$datetime, data$Voltage, type = "l", xlab="datetime", ylab = "Voltage")

plot(data$datetime, data$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
points(data$datetime,data$Sub_metering_2, type = "l", col = "red")       
points(data$datetime,data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1,1))

plot(data$datetime, data$Global_reactive_power, type = "s", xlab="datetime")
dev.off()
