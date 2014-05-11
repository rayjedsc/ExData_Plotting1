# Loads the data from a file to a data frame
#   - Also creates a new column DateTime which combines Date and Time columns
loadData <- function(filename) {
    data <- read.csv(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = c("?"))
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data[66637:69516,]
}

# Creates the plot in a png file
plot3 <- function(data) {
    ylabel <- "Energy sub metering"
    colnames <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    colors <- c("black", "red", "blue")
    
    png("plot3.png", width = 480, height = 480)
    
    with(data, {
        plot(DateTime, Sub_metering_1, col = "black", type = "l", xlab = "", ylab = ylabel)
        lines(DateTime, Sub_metering_2, col = "red")
        lines(DateTime, Sub_metering_3, col = "blue")
    })

    legend("topright", colnames, col = colors, lty="solid")
    dev.off()
}

# Assumes the file is in the working directory
plot3(loadData("household_power_consumption.txt"))