# plot3.R
# generate plot3.png for Project 1

# load the utility functions
source("./readData.R")

# download the data if needed
downloadData()

message("Reading power consumption data.")
consumptionData <- readData()

# generate plot 3 image file
generatePlot3PNG <- function(data) {
    png("plot3.png", width=480, height=480)
    with(data, plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
    with(data, lines(DateTime, Sub_metering_2, col="red"))
    with(data, lines(DateTime, Sub_metering_3, col="blue"))
    legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black","red","blue"))
    dev.off()
}

# generate the plot
message("Generating plot3.png")
generatePlot3PNG(consumptionData)
message("plot3.png created.")