data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings ="?",stringsAsFactors=FALSE)


data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, data$Date=="2007-02-01" | data$Date=="2007-02-02")
subset_data$datetime <- paste(subset_data$Date, subset_data$Time)
subset_data$datetime <- strptime(subset_data$datetime, "%Y-%m-%d %H:%M:%S")


subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)


plot(subset_data$datetime, subset_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, width = 480, height = 480, file = "plot2.png")
dev.off()
