data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
p_data <- subset(p_data, p_data$Date == "1/2/2007" | p_data$Date == "2/2/2007")

datetimes <- strptime(paste(p_data$Date, p_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot data in a 2x2 grid
png(filename='plot4.png',width=480, height=480)
par(mfrow = c(2,2))
plot(datetimes, p_data$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(datetimes, p_data$Voltage, type="l", col="black", ylab="Voltage", xlab="datetime")
plot(datetimes, p_data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
points(datetimes, p_data$Sub_metering_2, type="l", col="red")
points(datetimes, p_data$Sub_metering_3, type="l", col="blue")
legend("topright", lwd=c(1, 1, 1), col=c("black","red","blue"), border=c(1,1,1,1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n")
plot(datetimes, p_data$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")

# copy to file in png format
dev.off()