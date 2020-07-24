##This is the code for the first image
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(epc_data$Global_active_power), col= "red", main = "Global Active Power", 
     xlab= "Global Active Power (kilowatts)")
dev.off()