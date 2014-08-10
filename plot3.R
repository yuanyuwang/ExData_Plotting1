# Read in data
filename<-"household_power_consumption.txt"
data<-read.table(filename, header=TRUE, sep=";",stringsAsFactors=FALSE)
rows<-grepl("^[12]/2/2007",data$Date)
data<-data[rows,]

#convert column to right format
data$Date2 <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data<-transform(data, Sub_metering_1 = as.numeric(Sub_metering_1))
data<-transform(data, Sub_metering_2 = as.numeric(Sub_metering_2))
data<-transform(data, Sub_metering_3 = as.numeric(Sub_metering_3))

#drawgraph
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$Date2, data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col="black")
lines(data$Date2, data$Sub_metering_2, type="l", col="red")
lines(data$Date2, data$Sub_metering_3, type="l", col="blue")
legend("topright", box.lty=1, lwd=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()