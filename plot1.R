data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
p_data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
png(filename='plot1.png',width=480, height=480)
#creating the plot
globalActivePower <- as.numeric(p_data$Global_active_power)
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)", ylab = "Frequency")

# copy to file in png format
dev.off()