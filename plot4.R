## Plot 4
data<-read.table("./R/Data/household_power_consumption.txt", 
                 header=TRUE, 
                 sep=";", 
                 na.strings="?", 
                 colClasses=c("character", "character", "numeric",
                              "numeric", "numeric", "numeric", "numeric",
                              "numeric", "numeric"))
library(dplyr)
library(lubridate)
data2<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
data2<-mutate(data2,Date=paste(Date, ":", Time))
data2<-mutate(data2,Date=strptime(data2$Date, format="%d/%m/%Y : %H:%M:%S"))
data_clean<-select(data2, -c(Time))   
names(data_clean)[1]<-"Time"
png("./R/R_scripts/Exploratory Data Analysis/ExData_plotting1/plot4.png")
dev.cur()
par(mfrow=c(2,2))
#Panel top left
plot(data_clean$Time, data_clean$Global_active_power, type='l',
     xlab="Time", ylab="Global Active Power (kW)")
#Panel top right
plot(data_clean$Time, data_clean$Voltage, type='l',
     xlab="Time", ylab="Voltage")

#Panel bottom left
plot(data_clean$Time, data_clean$Sub_metering_1, type="l",
     col="black", xlab="Time", ylab="Energy sub metering")
lines(data_clean$Time, data_clean$Sub_metering_2, type="l",
      col="red", xlab="Time", ylab="Energy sub metering")
lines(data_clean$Time, data_clean$Sub_metering_3, type="l",
      col="blue", xlab="Time", ylab="Energy sub metering")
legend("topright", fill=c("black","red", "blue"),
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))

#Panel bottom right
plot(data_clean$Time, data_clean$Global_reactive_power, type='l',
     xlab="Time", ylab="Global Reactive Power")
dev.off()
