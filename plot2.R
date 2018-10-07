data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
p_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

# build datatimes vector
dateNtimes <- strptime(paste(p_data$Date, p_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# plot data
png(filename='plot2.png',width=480, height=480)
plot(dateNtimes, p_data$Global_active_power, type="l", xlab = "Timeline", ylab="Global Active Power (kilowatts)")

# copy to file in png format
dev.off()