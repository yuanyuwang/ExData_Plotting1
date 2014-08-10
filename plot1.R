# Read in data
filename<-"household_power_consumption.txt"
data<-read.table(inFile, header=TRUE, sep=";",stringsAsFactors=FALSE)
rows<-grepl("^[12]/2/2007",data$Date)
data<-data[rows,]

#convert column to right format
data<-transform(data, Date = as.Date(as.character(Date)))
data<-transform(data, Time = strptime(Time, format="%H:%M:%S"))
data<-transform(data, Global_active_power = as.numeric(Global_active_power))

#drawgraph
dev.set(dev.prev())
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
dev.off()