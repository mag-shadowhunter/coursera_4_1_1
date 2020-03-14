
#Reads data from file in g_data 

g_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

#takes the values of required time period

f_data <- subset(g_data, Date %in% c("1/2/2007","2/2/2007"))
f_data$Date <- as.Date(f_data$Date, format="%d/%m/%Y")

## Plot 1

hist(f_data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#copies plot to the file of 480x480 dimensions

dev.copy(png, file="plot1.png", height=480, width=480)


dev.off()
