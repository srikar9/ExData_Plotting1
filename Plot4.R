
## Getting the dataset

data <- read.csv("E:/SRIKAR/Coursera/coursera/household_power_consumption.txt", header=TRUE,
                 sep=';',na.strings="?",nrows=2075259,check.names=FALSE,
                 stringsAsFactors=FALSE,comment.char="",quote='\"')
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

## Subsetting the data

data1 <- subset(data,subset=(Date >="2007-02-01" & Date <="2007-02-02"))
rm(data)

## Converting the Date & Time Variables

datetime <- paste(as.Date(data1$Date),data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1),oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power", xlab="")
  plot(Voltage~Datetime, type="l",
       ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')
  legend("topright", col=c("black","red","blue"), lty=1,lwd=2, bty="n",
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l",
       ylab="Global_reactive_power", xlab="datetime")
})

## Saving to file

dev.copy(png,file="plot4.png", height=480, width=480)
dev.off()












