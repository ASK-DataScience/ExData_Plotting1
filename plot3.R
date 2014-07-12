## Reading Data
data <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.string="?")
names(data)

## Subset the data to data from the dates 2007-02-01 and 2007-02-02 only
TwoDays <- subset(data,Date=="1/2/2007"|Date=="2/2/2007" )


## Data Conversion
TwoDays$dateTime <- strptime( paste(TwoDays$Date,TwoDays$Time), format="%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(levels(TwoDays$Sub_metering_1))[TwoDays$Sub_metering_1]
SM2 <- as.numeric(levels(TwoDays$Sub_metering_2))[TwoDays$Sub_metering_2]
SM3 <- TwoDays$Sub_metering_3

## Making Plot
png(filename = "plot3.png", width = 480, height = 480)
plot(TwoDays$dateTime, SM1, type="l", xlab = "", ylab = "Energy sub metering")
points(TwoDays$dateTime, SM2, type="l", col="red")
points(TwoDays$dateTime, SM3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
dev.off()