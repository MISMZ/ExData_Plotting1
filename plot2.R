# Plot 2
# Read data
con_data <- read_delim("household_power_consumption.txt", delim = ";")

# Format data
con_data$Date <- dmy(con_data$Date)
con_data1 <-  con_data %>%  filter (Date == "2007-02-01" | Date == "2007-02-02")
con_data1 <- con_data1 %>% mutate(Date = as.POSIXct(paste0(Date,Time))) %>% select(-Time)

# Plot
plot(con_data1$Date, con_data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# Save to PNG file
dev.copy(png, file = "plot2.png")
dev.off()
