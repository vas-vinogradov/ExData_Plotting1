##Assuming we have data file in current dir ? is NA, ; is sep
data<-read.csv("household_power_consumption.txt",na.string="?",sep=";",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
##Filtering Data to 
data<-data[as.Date(data$Date,"%d/%m/%Y")>=as.Date("2007-02-01") & as.Date(data$Date,"%d/%m/%Y")<=as.Date("2007-02-02"),]
##Builiding DateTime Column
data$DateTime<-strptime(paste(data$Date,data$Time),"%d/%m/%Y %H:%M:%S")
##Creating 
png(filename = "plot2.png",width = 480, height = 480, units = "px")
##Creating Line Plot Histogram go Active Power
plot(data$DateTime,data$Global_active_power,type="l", ylab="Global Active Power (kilowatts)", xlab="")
##releasing device
dev.off()
