## Reading Data
data <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.string="?")
names(data)

## Subset the data to data from the dates 2007-02-01 and 2007-02-02 only
TwoDays <- subset(data,Date=="1/2/2007"|Date=="2/2/2007" )


## Data Conversion
GAP <- as.numeric(levels(TwoDays$Global_active_power))[TwoDays$Global_active_power]
TwoDays$dateTime <- strptime( paste(TwoDays$Date,TwoDays$Time), format="%d/%m/%Y %H:%M:%S")
SM1 <- as.numeric(levels(TwoDays$Sub_metering_1))[TwoDays$Sub_metering_1]
SM2 <- as.numeric(levels(TwoDays$Sub_metering_2))[TwoDays$Sub_metering_2]
SM3 <- TwoDays$Sub_metering_3
volt <- as.numeric(levels(TwoDays$Voltage))[TwoDays$Voltage]
GRP <- as.numeric(levels(TwoDays$Global_reactive_power))[TwoDays$Global_reactive_power]

## Making Plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
## First Plot
plot(TwoDays$dateTime,GAP, type="l",xlab = "", ylab = "Global Active Power")
## Second Plot
plot(TwoDays$dateTime,volt, type="l",xlab = "datetime", ylab = "Voltage")
## Third Plot
plot(TwoDays$dateTime, SM1, type="l", xlab = "", ylab = "Energy sub metering")
points(TwoDays$dateTime, SM2, type="l", col="red")
points(TwoDays$dateTime, SM3, type="l", col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )
## Fourth Plot
plot(TwoDays$dateTime,GRP, type="l",xlab = "datetime", ylab = "Global_reactive_power")
dev.off()