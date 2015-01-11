d = read.table("household_power_consumption.txt", header=TRUE, sep=";")
d$DateTime <- as.POSIXct(paste(d$Date, d$Time), format="%d/%m/%Y %H:%M:%S")
d$Date <- as.Date(d$Date, "%d/%m/%Y")
d2 <- subset(d, Date == "2007-2-1" | Date == "2007-2-2")

#Plot2
d2$Global_active_power<-as.character(d2$Global_active_power)
d2$Global_active_power<-as.numeric(d2$Global_active_power)
jpeg("Plot2.png",width=480,height=480)
plot(d2$DateTime,d2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
