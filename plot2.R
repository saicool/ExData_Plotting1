source("fetch_data.R")

plot2 <- function(data=NULL) {
  if(is.null(data))
    data <- fetch_data()
  
  png("plot2.png", width=480, height=480, units='px', bg='white')
  
  plot(data$Time, data$Global_active_power,
       type="l",
       xlab="",
       ylab="Global Active Power (kilowatts)")
  
  dev.off()
}