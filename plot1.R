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


# create a histogram of a given format
hist(data$Global_active_power, xlab = "Global Active Power(kilowatts)", main = "Global Active Power", col = "red")
# copy it to a png file of a given size
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()