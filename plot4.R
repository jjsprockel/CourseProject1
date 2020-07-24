##This is the code for the fourth image
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow= c(2,2))

#figura 1
plot(epc_data$completa , as.numeric(epc_data$Global_active_power), type= "l",xlab = "", ylab= "Global Active Power")

#figura 2
plot(epc_data$completa , as.numeric(epc_data$Voltage), type= "l",xlab = "datatime", ylab= "Voltage")

#figura 3
plot(epc_data$completa , as.numeric(epc_data$Sub_metering_1), type= "l",xlab = "", ylab= "Energy sub metering")
lines(epc_data$completa , as.numeric(epc_data$Sub_metering_2), type= "l", col = "red")
lines(epc_data$completa , as.numeric(epc_data$Sub_metering_3), type= "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1)

#figura 4
plot(epc_data$completa , as.numeric(epc_data$Global_reactive_power), type= "l",xlab = "datatime", ylab="Global_reactive_power")

dev.off()