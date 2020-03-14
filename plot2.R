#Reads data from file in g_data 
g_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#takes the values of required time period
req_data<- subset(g_data, Date %in% c("1/2/2007","2/2/2007"))

req_data$Date <- as.Date(req_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(req_data$Date), req_data$Time)

# Making a POSIXct date that can be filtered and graphed 

req_data$Datetime <- as.POSIXct(datetime)

#Plot 2
with(req_data, {
  plot(Global_active_power~Datetime,
     , type="l", xlab="", ylab="Global Active Power (kilowatts)")
  })

#saves the plot to a file of 480x480 dimensions

dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()

