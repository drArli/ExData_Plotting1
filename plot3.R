data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?",stringsAsFactors=FALSE)



data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
subset_data$datetime <- paste(subset_data$Date, subset_data$Time)
subset_data$datetime <- strptime(subset_data$datetime, "%Y-%m-%d %H:%M:%S")



subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)




plot(subset_data$datetime, subset_data$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(subset_data$datetime, subset_data$Sub_metering_2,col="red")
lines(subset_data$datetime, subset_data$Sub_metering_3,col="blue")


legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"), cex=.8)



dev.copy(png, width = 480, height = 480, file = "plot3.png")
dev.off()
