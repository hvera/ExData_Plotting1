# readPowerConsumptionData.R
#
# dataScienceCoursera / ExData_Plotting1 project
#
# downloadData - function that downloads Electric Power Consuption Data from the UC Irvine 
#   Machine Learning Repository
#
# readData - function that reads the file and data structure with the required subset of data
#

# dataURL from the assignment instructions
dataURL = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFileName = "./data/household_power_consumption.zip"
fileName = "./data/household_power_consumption.txt"
dataDir = "./data/"

downloadData <- function( url = dataURL) {
    if(!file.exists(fileName)) {
        dir.create(dataDir)
        download.file(url, zipFileName, method="curl")
        unzip(zipFileName, exdir=dataDir)
    } else {
        message("Data is already downloaded.")
    }
}

# readData - function that reads the data
# load the data. returns the data for the first two days of 2007
readData <- function() {
    # first try and determine the class of the columns by reading a few rows
    data <- read.table(fileName, header=TRUE, sep=";", colClasses="character", na.strings=c("?"))

    # combine the date and time fields to a  single DateTime field
    data <- within(data, DateTime <- paste(Date, Time, sep=" "))
    
    # we don't need these any more, save memory by nulling them out
    data$Date = NULL
    data$Time = NULL
    
    # now convert DateTime to a real date
    data$DateTime <- as.POSIXct(strptime(data$DateTime, format="%d/%m/%Y %H:%M:%S"))
    
    # we only want data for two days in 2007
    plotData <- subset(data, data$DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))
    
    # set up the other fields as numeric
    plotData$Global_active_power <- as.numeric(plotData$Global_active_power)
    plotData$Global_reactive_power <- as.numeric(plotData$Global_reactive_power)
    plotData$Voltage <- as.numeric(plotData$Voltage)
    plotData$Global_intensity <- as.numeric(plotData$Global_intensity)
    plotData$Sub_metering_1 <- as.numeric(plotData$Sub_metering_1)
    plotData$Sub_metering_2 <- as.numeric(plotData$Sub_metering_2)
    plotData$Sub_metering_3 <- as.numeric(plotData$Sub_metering_3)
    plotData
}
