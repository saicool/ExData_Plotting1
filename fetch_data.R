#Fetching dataset into R

fetch_data <- function() {
    
    dataFile <- "household_power_consumption.csv"
    if(file.exists(dataFile)) {
      # if already downloaded, read the data directly
      dat <- read.csv(dataFile)
      dat$DateTime <- strptime(dat$DateTime, "%Y-%m-%d %H:%M:%S")
      dat
    }else {
      # downloading the data archive from the given link
      if(!file.exists("household_power_consumption.zip"))
        dataArchive <- download.file("http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile= "household_power_consumption.zip", method="curl")
      # extracting the data from the archive
      conn <- unz(dataArchive, "household_power_consumption.txt")
      # reading dataset into R
      data <- read.table(conn,
                         header=TRUE,
                         sep=";",
                         colClasses=c("character", "character", rep("numeric",7)),
                         na="?")
      
      data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
      # converting date and time to date/time class
      data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
      # writing downloaded data to a csv file
      write.csv(data, dataFile)
      data
    }

    
}

