## read electric power consumption full dataset
consumption.data <- read.table("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", stringsAsFactors=F)
consumption.data$Date <- as.Date(consumption.data$Date, format = "%d/%m/%Y")

## Subsetting the data
selected.data <- consumption.data[which(consumption.data$Date >= "2007-02-01" & consumption.data$Date <= "2007-02-02"), ]

## Converting dates
datetime <- paste(selected.data$Date, selected.data$Time, sep=" ")
datetime <- as.POSIXlt(datetime, "UTC") 

## Plot the energy sub metering
par(mfrow = c(1,1))

with(selected.data, {
 plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
 lines(datetime, Sub_metering_2, col='Red')
 lines(datetime, Sub_metering_3, col='Blue')
 legend("topright", lty=1, lwd = 2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 0.8, y.intersp = 0.3)
})
## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()



