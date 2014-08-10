# Read in data
filename<-"household_power_consumption.txt"
data<-read.table(filename, header=TRUE, sep=";",stringsAsFactors=FALSE)
rows<-grepl("^[12]/2/2007",data$Date)
data<-data[rows,]

#convert column to right format
data$Date2 <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
data<-transform(data, Global_active_power = as.numeric(Global_active_power))

#drawgraph
#dev.set(dev.prev())
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$Date2, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()