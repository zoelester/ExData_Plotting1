
#read in the data. Make sure numeric fields are numeric and handle the na's (?)
hpc<- read.table("../household_power_consumption.txt",sep=";",stringsAsFactors=FALSE,header=TRUE,na.strings = "?",colClasses=c("character","character",rep("numeric",7)))

#Add a datetime column & interpret
hpc$Datetime<- strptime(paste(hpc$Date, hpc$Time),"%d/%m/%Y %H:%M:%S")
#Change the dates to date format
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")

#Pick only the two days we're interested in
hpc_days <- hpc[hpc$Date=="2007-02-01" | hpc$Date == "2007-02-02",]

#Open a png device, make the second plot and save it. 
png("plot2.png")
plot(hpc_days$Datetime,hpc_days$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")
dev.off()
