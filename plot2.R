## Reading Data
data <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.string="?")
names(data)

## Subset the data to data from the dates 2007-02-01 and 2007-02-02 only
TwoDays <- subset(data,Date=="1/2/2007"|Date=="2/2/2007" )


## Data Conversion
GAP <- as.numeric(levels(TwoDays$Global_active_power))[TwoDays$Global_active_power]
TwoDays$dateTime <- strptime( paste(TwoDays$Date,TwoDays$Time), format="%d/%m/%Y %H:%M:%S")

## Making Plot
png(filename = "plot2.png", width = 480, height = 480)
plot(TwoDays$dateTime,GAP, type="l",xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()