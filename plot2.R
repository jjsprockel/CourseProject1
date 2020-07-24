##This is the code for the second image
png(filename = "plot2.png", width = 480, height = 480)
plot(epc_data$completa , as.numeric(epc_data$Global_active_power), type= "l",xlab = "", ylab= "Global Active Power (kilowatts)")
dev.off()