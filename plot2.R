source("prep.R")

doPlot2 <- function() {
    table <- prepareData()
    png(filename = "plot2.png", width = 480, height = 480, units = "px")
    plot(table$DateTime, table$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
    dev.off()
}

dplotnew()

