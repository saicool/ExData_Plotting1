source("fetch_data.R")

plot1 <- function(data=NULL) {
  if(is.null(data))
    data <- fetch_data()
  
  png("plot1.png", width=480, height=480, units='px', bg='white')
  
  hist(data$Global_active_power,
       main="Global Active Power",
       xlab="Global Active Power (kilowatts)",
       ylab="Frequency",
       col="red")
  
  dev.off()
}
