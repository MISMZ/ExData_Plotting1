# Plot 4

# Load packages 
library(tidyverse)
library(lubridate)

# Read data
con_data <- read_delim("household_power_consumption.txt", delim = ";")

# Format data
con_data$Date <- dmy(con_data$Date)
con_data1 <-  con_data %>%  filter (Date == "2007-02-01" | Date == "2007-02-02")
con_data1 <- con_data1 %>% mutate(Date = as.POSIXct(paste0(Date,Time))) %>% select(-Time)

# set row n column
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))

# Plot 1
plot(con_data1$Date, con_data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

# Plot2
plot(con_data1$Date, con_data1$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# Plot 3
plot(con_data1$Date, con_data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(con_data1$Date, con_data1$Sub_metering_2, col = "red", type = "l")
points(con_data1$Date, con_data1$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd =1,bty = "n", col = c("black", "red", "blue"))

# Plot 4
plot(con_data1$Date, con_data1$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
