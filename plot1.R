# Loads the data from a file to a data frame
#   - Also creates a new column DateTime which combines Date and Time columns
loadData <- function(filename) {
    data <- read.csv(filename, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = c("?"))
    data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
    data[66637:69516,]
}

# Creates the plot in a png file
plot1 <- function(data) {
    xlabel <- "Global Active Power (kilowatts)"
    ylabel <- "Frequency"
    title <- "Global Active Power"

    png("plot1.png", width = 480, height = 480)
    hist(data$Global_active_power, xlab = xlabel, ylab = ylabel, main = title, col = "Red")
    dev.off()
}

# Assumes the file is in the working directory
plot1(loadData("household_power_consumption.txt"))