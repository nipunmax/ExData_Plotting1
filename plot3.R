source("prep.R")

dplotnew2 <- function() {
    table <- prepareData()
    png(filename = "plot3.png", width = 480, height = 480, units = "px")
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(table$DateTime, table$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(table$DateTime, table$Sub_metering_2, type="l", col="red")
    lines(table$DateTime, table$Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
    dev.off()
}

dplotnew2()

