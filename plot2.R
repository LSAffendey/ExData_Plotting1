## read electric power consumption full dataset
consumption.data <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
consumption.data$Date <- as.Date(consumption.data$Date, format = "%d/%m/%Y")

## Subsetting the data
selected.data <- consumption.data[which(consumption.data$Date >= "2007-02-01" & consumption.data$Date <= "2007-02-02"), ]

## Converting dates
datetime <- paste(selected.data$Date, selected.data$Time, sep=" ")
datetime <- as.POSIXlt(datetime, "UTC") 

## Plot the global active power against date time
plot(datetime, selected.data$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
