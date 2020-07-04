#Load the sqlpdf package as it will be useful for extractiong required data without loading the whole file.
library(sqldf)

#Load the data dated 1/2/2007 and 2/2/2007.
data<- read.csv2.sql(file = "household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'")

#Combine & convert to required format.
data$dt<-paste(data$Date, data$Time)
data$dt<-strptime(data$dt, "%d/%m/%Y %H:%M:%S")

#Create a png file.
png("plot2.png", 480, 480)

#Plot the required plots in it.
plot(data$dt, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

#Close the graphic device.
dev.off()

