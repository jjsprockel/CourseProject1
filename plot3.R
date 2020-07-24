##This is the code for the third image
png(filename = "plot3.png", width = 480, height = 480)
plot(epc_data$completa , as.numeric(epc_data$Sub_metering_1), type= "l",xlab = "", ylab= "Energy sub metering")
lines(epc_data$completa , as.numeric(epc_data$Sub_metering_2), type= "l", col = "red")
lines(epc_data$completa , as.numeric(epc_data$Sub_metering_3), type= "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1)
dev.off()