## read electric power consumption full dataset
consumption.data <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
consumption.data$Date <- as.Date(consumption.data$Date, format = "%d/%m/%Y")

## Subsetting the data
selected.data <- consumption.data[which(consumption.data$Date >= "2007-02-01" & consumption.data$Date <= "2007-02-02"), ]

## Plot histogram for global active power
hist(selected.data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
