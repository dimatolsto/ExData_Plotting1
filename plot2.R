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

# create a time series of a given format
png(file = "plot2.png", height = 480, width = 480)
plot(dateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
# copy it to a png file of a given size
#dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()