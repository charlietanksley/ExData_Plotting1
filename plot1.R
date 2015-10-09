## This repo does not contain the original data you need to create
## this plot.  To get the data, head over to
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
## Put that file at the location below for this script to work (or
## change the location below).
dataFile <- "data/household_power_consumption.txt"

## Reads the data for February 1 - February 2, 2007 into a data frame.
exploratoryPlot.assignmentData <- function(datafile) {
    data <- read.table(datafile, header=TRUE, sep=";", na.strings="?")
    data$Date <- as.Date(data$Date,format="%d/%m/%Y")

    subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
}

## Read the data
data <- exploratoryPlot.assignmentData(dataFile)

## Open a png file
png(filename = "plot1.png", width = 480, height = 480)

## Create the plot in the png
hist(x = data$Global_active_power,
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red")

## Close the file
dev.off()
