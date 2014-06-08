# plot4.R
# generate plot4.png for Project 1

# load the utility functions
source("./readData.R")

# download the data if needed
downloadData()

message("Reading power consumption data.")
consumptionData <- readData()

# generate plot 4 image file
generatePlot4PNG <- function(data) {
    png("plot4.png", width=480, height=480)
    
    # two plots in two rows
    par(mfrow = c(2, 2))
    
    with(data, {
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
        lines(DateTime, Sub_metering_2, col="red")
        lines(DateTime, Sub_metering_3, col="blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
        plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
    })
    
    dev.off()
}

# generate the plot
message("Generating plot4.png")
generatePlot4PNG(consumptionData)
message("plot4.png created.")