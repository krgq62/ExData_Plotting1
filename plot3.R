
## Exploratory Data Analysis Project 1
## Plot 3


library(data.table)
library(ggplot2)


dt_power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";"
, na.strings = "?", colClasses = c('character', 'character', 'numeric', 'numeric'
, 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))

dt_power$Date <- as.Date(dt_power$Date, "%d/%m/%Y")

dt_power <- subset(dt_power,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

dt_power <- dt_power[complete.cases(dt_power), ]

DateTime <- paste(dt_power$Date, dt_power$Time)

DateTime <- setNames(DateTime, "DateTime")

names(dt_power)

dt_power <- dt_power[ ,!(names(dt_power) %in% c("Date", "Time"))]

dt_power <- cbind(DateTime, dt_power)

dt_power$DateTime <- as.POSIXct(DateTime)

col_lines <- c("black", "red", "blue")

labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

plot(dt_power$DateTime, dt_power$Sub_metering_1, type = "l", col = col_lines[1]
, xlab = "", ylab = "Energy sub metering")

lines(dt_power$DateTime, dt_power$Sub_metering_2, col = col_lines[2])

lines(dt_power$DateTime, dt_power$Sub_metering_3, col = col_lines[3])

legend("topright", col = col_lines, c(labels), xjust = 0, cex = 0.6, lwd = c(1, 1, 1), lty = "solid"
       , bty = "n", inset = .05)

dev.copy(png, "plot3.png", width = 480, height = 480)

dev.off()




