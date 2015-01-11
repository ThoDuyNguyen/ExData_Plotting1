library(dplyr)

#Read and filter the data
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";",
                   na.strings = "?", stringsAsFactors=FALSE)
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
subsetted <- filter(data, DateTime >= as.POSIXct("2007-02-01 00:00:00"),
                    DateTime < as.POSIXct("2007-02-03 00:00:00"))

#Generate the chart
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(Global_active_power~DateTime, data = subsetted, type="l", xlab="",
     ylab="Global Active Power")
plot(Voltage~DateTime, data = subsetted, type="l", xlab="datetime",
     ylab="Voltage")
plot(Sub_metering_1~DateTime, data = subsetted, type="l", xlab="", col="black",
     ylab="Energy sub metering")
lines(Sub_metering_2~DateTime, data = subsetted, type="l", col="red")
lines(Sub_metering_3~DateTime, data = subsetted, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1), col=c("black","red","blue"),cex=0.8, pt.cex=0.5)
plot(Global_reactive_power~DateTime, data = subsetted, type="l", xlab="datetime")
dev.off()