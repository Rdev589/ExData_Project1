# Plot 4 code.  Plots 4 graphs in the png image.

png(file = "plot4.png")

# load the data, but only get enough to cover our dates.  Figured the 80000 value out from
# using grep on the command line
file_data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?"
                        , nrows=80000);

# subset the data to get only the dates of interest
pwr_data <- subset(file_data, 
          subset = as.Date(file_data$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y") 
          | as.Date(file_data$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") );

par(mfrow=c(2,2));

# Plot 1
plot(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
     , pwr_data$Global_active_power, type="n", xlab="", ylab="Global Active Power")

lines(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
      , pwr_data$Global_active_power)

# Plot 2
plot(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
     , pwr_data$Voltage, type="n", xlab="datetime", ylab="Voltage")

lines(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
      , pwr_data$Voltage)

# Plot 3
# make the legend font a little smaller with cex=0.9
plot(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
     , pwr_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")

lines(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
      , pwr_data$Sub_metering_1, col="black")

lines(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
      , pwr_data$Sub_metering_2, col="red")

lines(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
      , pwr_data$Sub_metering_3, col="blue")

legend("topright", bty="n", cex=0.9, lty=c(1,1,1)
       , legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , col=c("black", "red", "blue"));

# Plot 4
plot(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
     , pwr_data$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")

lines(strptime( paste(pwr_data[,1], pwr_data[,2], sep=" "), "%d/%m/%Y %H:%M:%S")
      , pwr_data$Global_reactive_power)

dev.off();

