
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

## Plot 1

hist(data1$Global_active_power,main = "Global Active Power",
     ylab="Frequency",xlab="Global Active Power(kilowatts)", col ='Red')

## Saving to file

dev.copy(png,file="plot1.png", height=480, width=480)
dev.off()












