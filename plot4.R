#read in the data. Make sure numeric fields are numeric and handle the na's (?)
hpc<- read.table("../household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.strings = "?",colClasses=c("character","character",rep("numeric",7)))

#Add a datetime column & interpret
hpc$Datetime<- strptime(paste(hpc$Date, hpc$Time),"%d/%m/%Y %H:%M:%S")
#Change the dates to date format
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")

#Pick only the two days we're interested in
hpc_days <- hpc[hpc$Date=="2007-02-01" | hpc$Date == "2007-02-02",]

#Open a png device
png("plot4.png")

#set up the 2x2 frame
par(mfrow=c(2,2))

#Make the top left plot
plot(hpc_days$Datetime,hpc_days$Global_active_power,xlab="",ylab="Global Active Power",type="l")

#make the top right plot
plot(hpc_days$Datetime,hpc_days$Voltage,xlab="datetime",ylab="Voltage",type="l")

#make the bottom left plot
plot(hpc_days$Datetime,hpc_days$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(hpc_days$Datetime,hpc_days$Sub_metering_2,col="red")
lines(hpc_days$Datetime,hpc_days$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,box.lty=0,inset=.02,cex = 0.95)

#make tghe bottom right plot
plot(hpc_days$Datetime,hpc_days$Global_reactive_power, xlab="datetime",ylab="Global_reactive_power",type="l")

#close the device
dev.off()
