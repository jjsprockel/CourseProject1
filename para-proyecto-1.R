library(dplyr)
library(lubridate)

file ="household_power_consumption.txt"
data<- read.csv2(file)

data$Date<- as.Date(data$Date, format = "%d/%m/%Y")
completa=paste(data$Date, data$Time)
data$completa<- as.POSIXct(completa)

epc_data<- tbl_df(data)
rm("data")
rm("completa")

#se cambia el formato 
epc_data$Time<- hms(epc_data$Time)
epc_data$completa<- ymd_hms(epc_data$completa)

epc_data<- filter(epc_data, Date>="2007-02-01" & Date<= "2007-02-02")

png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(epc_data$Global_active_power), col= "red", main = "Global Active Power", 
     xlab= "Global Active Power (kilowatts)")
dev.off()


png(filename = "plot2.png", width = 480, height = 480)
plot(epc_data$completa , as.numeric(epc_data$Global_active_power), type= "l",xlab = "", ylab= "Global Active Power (kilowatts)")
dev.off()


png(filename = "plot3.png", width = 480, height = 480)
plot(epc_data$completa , as.numeric(epc_data$Sub_metering_1), type= "l",xlab = "", ylab= "Energy sub metering")
lines(epc_data$completa , as.numeric(epc_data$Sub_metering_2), type= "l", col = "red")
lines(epc_data$completa , as.numeric(epc_data$Sub_metering_3), type= "l", col = "blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c("black", "red", "blue"), lty=1)
dev.off()


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