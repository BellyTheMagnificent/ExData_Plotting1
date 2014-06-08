
## Read data into R
data = read.csv("./household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)
str(data)

## Convert data to date
data$Date = as.Date(data$Date, "%d/%m/%Y")

## Filter the data to 2 day only
subData = subset(data, Date <= as.Date("02/02/2007","%d/%m/%Y") & Date >= as.Date("01/02/2007","%d/%m/%Y"))

## Create weekday column
subData$WeekDay = as.character(subData$Date, "%a")
subData$Date = as.character(subData$Date)

## Create Datetime column
subData$DateTime = paste(subData$Date, subData$Time, sep=" ")  
subData$Date = as.Date(subData$Date, "%Y-%m-%d")
subData$DateTime = strptime(subData$DateTime, "%Y-%m-%d %H:%M:%S")
str(subData)
subData$Global_active_power = as.numeric(subData$Global_active_power)
subData$Global_reactive_power = as.numeric(subData$Global_reactive_power)
subData$Voltage = as.numeric(subData$Voltage)
subData$Global_intensity = as.numeric(subData$Global_intensity)
subData$Sub_metering_1 = as.numeric(subData$Sub_metering_1)
subData$Sub_metering_2 = as.numeric(subData$Sub_metering_2)
subData$Sub_metering_3 = as.numeric(subData$Sub_metering_3)

## Draw the plot
png("./plot2.png", width = 480, height = 480)
plot(subData$DateTime,subData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
