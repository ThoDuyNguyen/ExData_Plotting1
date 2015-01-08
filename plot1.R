library(dplyr)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings = "?", stringsAsFactors=FALSE)
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), 
                            format="%d/%m/%Y %H:%M:%S")
subsetted <- filter(data, DateTime >= as.POSIXct("2007-02-01 00:00:00"),
                    DateTime < as.POSIXct("2007-02-03 00:00:00"))

png(filename = "plot1.png", width = 480, height = 480)
hist(subsetted$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()