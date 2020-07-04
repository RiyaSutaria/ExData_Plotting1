#Load the sqlpdf package as it will be useful for extractiong required data without loading the whole file.
library(sqldf)

#Load the data dated 1/2/2007 and 2/2/2007.
data<- read.csv2.sql(file = "household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'")

#Combine & convert to required format.
data$dt<-paste(data$Date, data$Time)
data$dt<-strptime(data$dt, "%d/%m/%Y %H:%M:%S")

#Create a png file.
png("plot4.png", 480, 480)
#Plot the required plots in it.
par(mfrow=c(2,2))
#plot1
plot(data$dt, data$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
#plot2
plot(data$dt, data$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
#plot3
with(data, {plot(dt, Sub_metering_1, type="l", col="black", ylab="Energy sub metering")
  lines(dt,Sub_metering_2, col="red")
  lines(dt,Sub_metering_3, col="blue")
  legend("topright", lwd="1", col = c("Black", "Red", "Blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))})
#plot4
plot(data$dt, data$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
#Close the graphic device.
dev.off()