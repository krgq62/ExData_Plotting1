
## Exploratory Data Analysis Project 1
## Plot 2


library(data.table)
library(ggplot2)


dt_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";"
, na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric'
, 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

names(dt_power)

dt_power$Date <- as.Date(dt_power$Date, "%d/%m/%Y")

dt_power <- subset(dt_power,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

dt_power <- dt_power[complete.cases(dt_power), ]

DateTime <- paste(dt_power$Date, dt_power$Time)

DateTime <- setNames(DateTime, "DateTime")

dt_power <- dt_power[ ,!(names(dt_power) %in% c("Date", "Time"))]

dt_power <- cbind(DateTime, dt_power)

dt_power$DateTime <- as.POSIXct(DateTime)

plot(dt_power$Global_active_power~dt_power$DateTime, type = "l"
, xlab = "", ylab = "Global ACtive Power (kW)")

dev.copy(png, "plot2.png", width = 480, height = 480)

dev.off()




