downloadfile <- function(url, fname) {
    if(!file.exists(fname)) {
        download.file(url, destfile=fname, method="curl")
    }
    fname
}

prepare <- function() {
    cacheFile <- "plot_data.csv"
    if(file.exists(cacheFile)) {
        tablee <- read.csv(cacheFile)
        tablee$DateTime <- strptime(tablee$DateTime, "%Y-%m-%d %H:%M:%S")
    }
    else {
        fname <- downloadfile("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_connectionsumption.zip", "household_power_connectionsumption.zip")
        connection <- unz(fname, "household_power_connectionsumption.txt")
        tablee <- read.table(connection, header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
        #close(connection)
        tablee <- tablee[(tablee$Date == "1/2/2007") | (tablee$Date == "2/2/2007"),]
        tablee$DateTime <- strptime(paste(tablee$Date, tablee$Time), "%d/%m/%Y %H:%M:%S")
        write.csv(tablee, cacheFile)
    }
    tablee
}
