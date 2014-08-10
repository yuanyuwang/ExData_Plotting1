# Read in data
filename<-"household_power_consumption.txt"
data<-read.table(filename, header=TRUE, sep=";",stringsAsFactors=FALSE)
rows<-grepl("^[12]/2/2007",data$Date)
data<-data[rows,]

#convert column to right format
data<-transform(data, Global_active_power = as.numeric(Global_active_power))
data$Date2 <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data<-transform(data, Voltage = as.numeric(Voltage))
data<-transform(data, Sub_metering_1 = as.numeric(Sub_metering_1))
data<-transform(data, Sub_metering_2 = as.numeric(Sub_metering_2))
data<-transform(data, Sub_metering_3 = as.numeric(Sub_metering_3))
data<-transform(data, Sub_metering_3 = as.numeric(Sub_metering_3))
data<-transform(data, Global_reactive_power = as.numeric(Global_reactive_power))


#drawgraph
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,0,0))
#first plot
plot(data$Date2, data$Global_active_power, xlab="", ylab="Global Active Power", type="l")
#second plot
plot(data$Date2, data$Voltage, xlab="datetime", ylab="Voltage", type="l")
#third plot
plot(data$Date2, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(data$Date2, data$Sub_metering_2, type="l", col="red")
lines(data$Date2, data$Sub_metering_3, type="l", col="blue")
legend("topright", box.lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#fourth plot
plot(data$Date2, data$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")
dev.off()