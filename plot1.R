# Reading CSV and Subsetting
power_cons <- read.csv("household_power_consumption.txt",sep= ";",na.strings = "?")
a <- power_cons
power_cons <- a
power_cons$Date <- as.Date(power_cons$Date, format = "%d/%m/%Y")
power_cons$Time <- strptime(paste(power_cons$Date, power_cons$Time), "%Y-%m-%d %H:%M:%S") 
subset.power <- power_cons[power_cons$Date >= "2007-02-01" & power_cons$Date <= "2007-02-02",]
subset.power[,3:9] <- sapply(subset.power[,3:9], FUN = function(x) as.numeric(x))

# Creating Plot1
png(file= "./plot1.png")
hist(subset.power$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)"
                                     , main = "Global Active Power")
dev.off()

