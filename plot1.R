# Plot 1
# Read data
con_data <- read_delim("household_power_consumption.txt", delim = ";")

# Format data
con_data$Date <- dmy(con_data$Date)
con_data1 <-  con_data %>%  filter (Date == "2007-02-01" | Date == "2007-02-02")
con_data1 <- con_data1 %>% mutate(Date = as.POSIXct(paste0(Date,Time))) %>% select(-Time)

# Plot
hist(con_data1$Global_active_power, breaks = 20, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", ylim = c(0,1200), col = "red")

# Save to PNG file
dev.copy(png, file = "plot1.png")
dev.off()