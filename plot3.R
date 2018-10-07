data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
p_data <- subset(p_data, p_data$Date == "1/2/2007" | p_data$Date == "2/2/2007")
# build  vector
datetimes <- strptime(paste(p_data$Date, p_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot data
png(filename='plot3.png',width=480, height=480)
plot(datetimes, p_data$Sub_metering_1, type="l", ylab="Energy sub metering")
points(datetimes, p_data$Sub_metering_2, type="l", col="red")
points(datetimes, p_data$Sub_metering_3, type="l", col="blue")

# set legend
legend("topright", lwd=c(1, 1, 1), col=c("black","red","blue"), border=c(1,4,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# copy to file in png format
dev.off()