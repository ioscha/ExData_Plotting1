# Reading CSV and Subsetting
power_cons <- read.csv("household_power_consumption.txt",sep= ";",na.strings = "?")
power_cons$Date <- as.Date(power_cons$Date, format = "%d/%m/%Y")
power_cons$Time <- strptime(paste(power_cons$Date, power_cons$Time), "%Y-%m-%d %H:%M:%S") 
subset.power <- power_cons[power_cons$Date >= "2007-02-01" & power_cons$Date <= "2007-02-02",]
subset.power[,3:9] <- sapply(subset.power[,3:9], FUN = function(x) as.numeric(x))


# Creating Plot2
png(file= "./plot2.png")
with(subset.power, plot(Time, Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)"))
dev.off()

