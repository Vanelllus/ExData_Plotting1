#Exploratory Data Analysis, Week 1, Course Project 1
#Łukasz Binkowski

#Fig1
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

png(filename = "fig1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red",
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()