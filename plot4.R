# read data
data <- read.table("./household_power_consumption.txt",header = TRUE, sep = ";",quote = "",na.strings = "?")
# format dates
date <- as.Date(data$Date, format = "%d/%m/%Y")
# join date & time as list of strings
dateTime <- paste(as.character(date), data$Time)
# convert to date & time
dateTime <- strptime(dateTime, format = "%Y-%m-%d %H:%M:%S")
# find subsetting index
idx <- date >= as.Date("2007-02-01") & date <= as.Date("2007-02-02")
dateTime <- dateTime[idx]
data <- data[idx,]

# create multiple plot of time series of a given format
png(file = "plot4.png", height = 480, width = 480)
# 1st plot
par(mfcol = c(2,2))
plot(dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# 2nd plot
plot(dateTime,data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(dateTime,data$Sub_metering_2, type = "l", col = "red")
lines(dateTime,data$Sub_metering_3, type = "l", col = "blue")
# add legend
legend("topright",xy.coords(3),lty = 1, col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), cex = 0.8)
# 3rd plot
plot(dateTime,data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# 4th plot
plot(dateTime,data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

# copy it to a png file of a given size
#dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()