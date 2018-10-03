# Plot 2

# Load packages 
library(tidyverse)
library(lubridate)

# Read data
con_data <- read_delim("household_power_consumption.txt", delim = ";")

# Format data
con_data$Date <- dmy(con_data$Date)
con_data1 <-  con_data %>%  filter (Date == "2007-02-01" | Date == "2007-02-02")
con_data1 <- con_data1 %>% mutate(Date = as.POSIXct(paste0(Date,Time))) %>% select(-Time)

# Plot
png(filename = "plot2.png", width = 480, height = 480)
plot(con_data1$Date, con_data1$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
