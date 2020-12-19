## Plot 1
data<-read.table("./R/Data/household_power_consumption.txt", 
                 header=TRUE, 
                 sep=";", 
                 na.strings="?", 
                 colClasses=c("character", "character", "numeric",
                              "numeric", "numeric", "numeric", "numeric",
                              "numeric", "numeric"))
library(dplyr)
library(lubridate)
str(data)
data2<-filter(data, Date=="1/2/2007" | Date=="2/2/2007")
data2<-mutate(data2,Date=paste(Date, ":", Time))
data2<-mutate(data2,Date=strptime(data2$Date, format="%d/%m/%Y : %H:%M:%S"))
data_clean<-select(data2, -c(Time))   
names(data_clean)[1]<-"Time"
png("./R/R_scripts/Exploratory Data Analysis/ExData_plotting1/plot1.png")
dev.cur()
hist(data_clean$Global_active_power, col="red", breaks=12, 
     xlab="Global Active Power (kW)", main="Global Active Power")
dev.off()