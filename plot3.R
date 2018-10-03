# Plot 3

# Read data
con_data <- read_delim("household_power_consumption.txt", delim = ";")

# Format data
con_data$Date <- dmy(con_data$Date)
con_data1 <-  con_data %>%  filter (Date == "2007-02-01" | Date == "2007-02-02")
con_data1 <- con_data1 %>% mutate(Date = as.POSIXct(paste0(Date,Time))) %>% select(-Time)

# Plot
plot(con_data1$Date, con_data1$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(con_data1$Date, con_data1$Sub_metering_2, col = "red", type = "l")
points(con_data1$Date, con_data1$Sub_metering_3, col = "blue", type = "l")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd =1, col = c("black", "red", "blue")) )

# Save to PNG file
dev.copy(png, file = "plot3.png") 
dev.off() 
