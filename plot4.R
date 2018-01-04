data=read.csv2("household_power_consumption.txt", header=TRUE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
dif <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
dif$Global_active_power <- as.numeric(as.character(dif$Global_active_power))
dif$Global_reactive_power <- as.numeric(as.character(dif$Global_reactive_power))
dif$Voltage <- as.numeric(as.character(dif$Voltage))
dif <- transform(dif, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
dif$Sub_metering_1 <- as.numeric(as.character(dif$Sub_metering_1))
dif$Sub_metering_2 <- as.numeric(as.character(dif$Sub_metering_2))
dif$Sub_metering_3 <- as.numeric(as.character(dif$Sub_metering_3))

par(mfrow=c(2,2))

plot(dif$timestamp,dif$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(dif$timestamp,dif$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dif$timestamp,dif$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(dif$timestamp,dif$Sub_metering_2,col="red")
lines(dif$timestamp,dif$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1 ","Sub_metering_2 ", "Sub_metering_3 "),lty=c(1,1), lwd=c(1,1))
plot(dif$timestamp,dif$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
cat("plot4.png has been saved in", getwd())