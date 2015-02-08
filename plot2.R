download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")
b <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", as.is = TRUE, na.strings = "?")
c <- b[as.Date(b$Date, format = "%d/%m/%Y")==as.Date("01/02/2007", format = "%d/%m/%Y")|as.Date(b$Date, format = "%d/%m/%Y")==as.Date("02/02/2007", format = "%d/%m/%Y"),]
png(filename = "plot2.png", width = 480, height = 480)
plot(as.POSIXct(paste(c$Date, c$Time), format = "%d/%m/%Y %H:%M:%S"), c$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()