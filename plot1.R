## Reading Data
data <- read.table("./household_power_consumption.txt", sep=";",header=TRUE, na.string="?")
names(data)

## Subset the data to data from the dates 2007-02-01 and 2007-02-02 only
TwoDays <- subset(data,Date=="1/2/2007"|Date=="2/2/2007" )


## Data Conversion
GAP <- as.numeric(levels(TwoDays$Global_active_power))[TwoDays$Global_active_power]

## Making Plot
png(filename = "plot1.png", width = 480, height = 480)
hist(GAP,main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()
