# plot2.R
# generate plot2.png for Project 1

# load the utility functions
source("./readData.R")

# download the data if needed
downloadData()

message("Reading power consumption data.")
consumptionData <- readData()

# generate plot 2 image file
generatePlot2PNG <- function(data) {
    png("plot2.png", width=480, height=480)
    with(data, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
    dev.off()
}

# generate the plot
message("Generating plot2.png")
generatePlot2PNG(consumptionData)
message("plot2.png created.")