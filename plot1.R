# Plot 1 code.

png(file = "plot1.png")

# load the data, but only get enough to cover our dates.  Figured the 80000 value out from
# using grep on the command line
file_data <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?"
                        , nrows=80000);

# subset the data to get only the dates of interest
pwr_data <- subset(file_data
          , subset = as.Date(file_data$Date, "%d/%m/%Y") == as.Date("02/02/2007", "%d/%m/%Y") 
          | as.Date(file_data$Date, "%d/%m/%Y") == as.Date("01/02/2007", "%d/%m/%Y") );

# create the plot
hist(pwr_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)"
     , main="Global Active Power");

dev.off();



