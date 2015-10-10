## This repo does not contain the original data you need to create
## this plot.  To get the data, head over to
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip.
## Put that file at the location below for this script to work (or
## change the location below).
dataFile <- "data/household_power_consumption.txt"

## Reads the data for February 1 - February 2, 2007 into a data frame,
## adding a DateTime column.
exploratoryPlot.assignmentData <- function(datafile) {
    data <- read.table(datafile, header=TRUE, sep=";", na.strings="?")

    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    subset(data, data$DateTime >= "2007-02-01 00:00:00" & data$DateTime <= "2007-02-03 00:00:00")
}

## Read the data
data <- exploratoryPlot.assignmentData(dataFile)

## Open a png file
png(filename = "plot4.png", width = 480, height = 480)

## Create the plots

## Set the plot layout to a 2, 2 grid
par(mfrow = c(2, 2))

## Plot 1
plot(y = data$Global_active_power,
     x = data$DateTime,
     type = "l",
     ylab = "Global Active Power",
     xlab = ""
     )

## Plot 2

plot(y = data$Voltage,
     x = data$DateTime,
     type = "l",
     ylab = "Voltage",
     xlab = "datetime")

## Plot 3
## Create the plot in the png
plot(y = data$Sub_metering_1,
     x = data$DateTime,
     type = "l",
     ylab = "Energy sub metering",
     xlab = ""
     )

lines(x = data$DateTime, y = data$Sub_metering_2, type = "l", col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3, type = "l", col = "blue")

legend('topright',
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1, 1, 1),
       col=c("black", "red", "blue"),
       bty="n")

## Plot 4
plot(y = data$Global_reactive_power,
     x = data$DateTime,
     ylab = "Global_reactive_power",
     xlab = "datetime",
     type = "l")

## Close the file
dev.off()
