data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?",stringsAsFactors=FALSE)



data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
subset_data$datetime <- paste(subset_data$Date, subset_data$Time)
subset_data$datetime <- strptime(subset_data$datetime, "%Y-%m-%d %H:%M:%S")



par(mfcol = c(2, 2))

plot(subset_data$datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")


plot(subset_data$datetime, subset_data$Sub_metering_1, xlab="", ylab="Energy sub metering", type="l")
lines(subset_data$datetime, subset_data$Sub_metering_2,col = "red")
lines(subset_data$datetime, subset_data$Sub_metering_3,col = "blue")


legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue") , bty = "n")


plot(subset_data$datetime, subset_data$Voltage, type="l", ylab="Voltage", xlab="datetime")


plot(subset_data$datetime, subset_data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


dev.copy(png, width = 480, height = 480, file = "plot4.png")
dev.off()
