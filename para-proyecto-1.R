library(dplyr)
library(lubridate)

##this code download and split the data

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