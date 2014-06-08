# plot1.R
# generate first plot for Project 1

# load the utility functions
source("./readData.R")

# download the data if needed
downloadData()

message("Reading power consumption data.")
consumptionData <- readData()

# generate plot 1 image file
generatePlot1PNG <- function(data) {
    png("plot1.png", width=480, height=480)
    hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
    dev.off();
}

# generate the plot
message("Generating plot1.png")
generatePlot1PNG(consumptionData)
message("plot1.png created.")