d = read.table("household_power_consumption.txt", header=TRUE, sep=";")
d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d2 <- subset(d, Date == "2007-2-1" | Date == "2007-2-2")

#plot4    
jpeg("Plot4.png",width=480,height=480)
par(mfrow=c(2,2))
d2$Global_active_power<-as.character(d2$Global_active_power)
d2$Global_active_power<-as.numeric(d2$Global_active_power)
plot(d2$DateTime,d2$Global_active_power,type="l",xlab="",ylab="Global Active Power")
d2$Voltage<-as.character(d2$Voltage)
d2$Voltage<-as.numeric(d2$Voltage)
plot(d2$DateTime,d2$Voltage,type="l",xlab= "datetime", ylab="Voltage")
plot(d2$DateTime,d2$Sub_metering_1,type="l",col="Black",xlab="",ylab="Energy sub metering")
lines(d2$DateTime,d2$Sub_metering_2,type="l",col="Red")
lines(d2$DateTime,d2$Sub_metering_3,type="l",col="Blue")
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("Black","Blue","Red"), lty = c(1, 1, 1), lwd=c(1,1,1),cex=0.5)
d2$Global_reactive_power<-as.character(d2$Global_reactive_power)
d2$Global_reactive_power<-as.numeric(d2$Global_reactive_power)
plot(d2$DateTime,d2$Global_reactive_power,type="l",xlab= "datetime", ylab="Global_Reactive_Power")
dev.off()


