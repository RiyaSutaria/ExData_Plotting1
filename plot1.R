#Load the sqlpdf package as it will be useful for extractiong required data without loading the whole file.
library(sqldf)

#Load the data dated 1/2/2007 and 2/2/2007.
data<- read.csv2.sql(file = "household_power_consumption.txt", sql = "SELECT * FROM file WHERE Date='1/2/2007' OR Date='2/2/2007'")

#Create a png file.
png("plot1.png", 480, 480)

#Plot the required plots in it.
hist(data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power(kilowatts)", col = "red")

#Close the graphic device.
dev.off()