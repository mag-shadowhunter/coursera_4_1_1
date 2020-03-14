#Reads data from file in g_data 
g_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#Takes the values of required time period
req_data <- subset(g_data, Date %in% c("1/2/2007","2/2/2007"))

req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(req_data$Date), req_data$Time)

#Making a POSIXct date that can be filtered and graphed 
req_data$Datetime <- as.POSIXct(datetime)

#Creating 4 subplots in one plot
par(mfrow=c(2,2))

with(req_data, {

  plot(Global_active_power~Datetime, type="l", 
        xlab="",ylab="Global Active Power (kilowatts)")

  plot(Voltage~Datetime, type="l", 
       xlab="",ylab="Voltage (volt)")

  plot(Sub_metering_1~Datetime, type="l", 
       xlab="",ylab="Global Active Power (kilowatts)")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

  plot(Global_reactive_power~Datetime, type="l", 
       xlab="",ylab="Global Rective Power (kilowatts)")
})

#Saves the plot to a file of 480x480 dimensions
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()

