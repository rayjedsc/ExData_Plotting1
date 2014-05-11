# Loads the data from a file to a data frame
#   - Also creates a new column DateTime which combines Date and Time columns
loadData <- function(filename) {
    data <- read.csv(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = c("?"))
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data[66637:69516,]
}

# Creates the plot in a png file
plot4 <- function(data) {
    png("plot4.png", width = 480, height = 480)
    par(mfrow=c(2, 2))

    with(data, {
        # plot 1
        plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power")
        
        # plot 2
        plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage")
        
        # plot 3
        colnames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        colors <- c("black", "red", "blue")
        
        plot(DateTime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = "Energy sub metering")
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
        legend("topright", colnames, col = colors, lty="solid", bty = "n")
        
        ### plot 4
        plot(DateTime, Global_reactive_power, type="l", xlab = "datetime")
    })

    dev.off()
}

# Assumes the file is in the working directory
plot4(loadData("household_power_consumption.txt"))