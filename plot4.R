##Assuming we have data file in current dir ? is NA, ; is sep
data<-read.csv("household_power_consumption.txt",na.string="?",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
##Filtering Data to 
data<-data[as.Date(data$Date,"%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(data$Date,"%d/%m/%Y")<=as.Date("2007-02-02"),]
##Builiding DateTime Column
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
##Creating 
png(filename = "plot3.png",width = 480, height = 480, units = "px")
##Creating Line Plot with Sub Metering 1 on it,
par(mfrow=c(2,2))
##Creating Line Plot for Active Power
plot(data$DateTime,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
##Creating Line Plot For Voltager
plot(data$DateTime,data$Voltage,type="l", ylab="Voltage", xlab="")
##Creating Line Plot with Sub Metering 1 on it,
plot(data$DateTime,data$Sub_metering_1,type="l", ylab="Energy Sub Metering", xlab="")
##Adding submetering 2 and 3 to plot
lines(data$DateTime, data$Sub_metering_2, type="l", lwd=1.5, col="red")
##and 3 to plot
lines(data$DateTime, data$Sub_metering_3, type="l", lwd=1.5, col="blue")
#adding legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,col=c("black","red","blue"))
##Creating Line Plot For GLobal Reactive Power
plot(data$DateTime,data$Global_reactive_power,type="l", xlab="")
##releasing device
dev.off()
